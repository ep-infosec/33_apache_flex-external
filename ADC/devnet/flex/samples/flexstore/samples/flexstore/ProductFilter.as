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
package samples.flexstore
{

[Bindable]
public class ProductFilter
{
    public var count:int;
    public var series:String;
    public var minPrice:Number;
    public var maxPrice:Number;
    public var triband:Boolean;
    public var camera:Boolean;
    public var video:Boolean;
    
    public function ProductFilter()
    {
        super();
    }
    
    public function accept(product:Product):Boolean
    {
        //price is often the first test so let's fail fast if possible
        if (minPrice > product.price || maxPrice < product.price)
            return false;
        if (series != "All Series" && series != product.series)
            return false;
        if (triband && !product.triband)
            return false;
        if (camera && !product.camera)
            return false;
        if (video && !product.video)
            return false;
        
        return true;
    }
}

}