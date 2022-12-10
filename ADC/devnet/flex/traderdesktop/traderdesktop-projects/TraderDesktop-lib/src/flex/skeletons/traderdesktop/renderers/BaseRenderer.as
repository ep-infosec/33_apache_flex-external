////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
// Author: Christophe Coenraets - http://coenraets.org 
package flex.skeletons.traderdesktop.renderers
{
	import flex.skeletons.traderdesktop.model.Stock;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.UITextField;
	import mx.events.PropertyChangeEvent;
	import mx.formatters.NumberFormatter;
	
	public class BaseRenderer extends UITextField implements IListItemRenderer
	{
		protected static var nf:NumberFormatter = new NumberFormatter();
		
		protected var stock:Stock;
		
		protected var changeWatcher:ChangeWatcher;
		
		protected var propertyName:String;
		
		public function BaseRenderer()
		{
			nf.precision = 2;
		}
		
		public function set data(value:Object):void 
		{
			if (value == stock)
				return;
			
			if (changeWatcher)
			{
				changeWatcher.unwatch();
			}
			stock = value as Stock;
			displayValue();
			changeWatcher = ChangeWatcher.watch(stock, propertyName, displayValue, false, true);
		}
		
		public function get data():Object
		{
			return stock;
		}
		
		protected function displayValue(event:PropertyChangeEvent = null):void
		{
			textColor = stock.change < 0 ? 0xFF0000: 0x009900;
			text = nf.format(stock.change);
		}
		
		public function validateProperties():void
		{
		}
		
		public function validateSize(recursive:Boolean = false):void
		{
		}
		
		public function validateDisplayList():void
		{
		}
		
	}
}

