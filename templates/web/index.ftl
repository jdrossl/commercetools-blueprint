<#--
  ~ MIT License
  ~
  ~ Copyright (c) 2018-2019 Crafter Software Corporation. All Rights Reserved.
  ~
  ~ Permission is hereby granted, free of charge, to any person obtaining a copy
  ~ of this software and associated documentation files (the "Software"), to deal
  ~ in the Software without restriction, including without limitation the rights
  ~ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  ~ copies of the Software, and to permit persons to whom the Software is
  ~ furnished to do so, subject to the following conditions:
  ~
  ~ The above copyright notice and this permission notice shall be included in all
  ~ copies or substantial portions of the Software.
  ~
  ~ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  ~ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  ~ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  ~ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  ~ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  ~ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  ~ SOFTWARE.
  -->

<#assign currenciesString = '"' + applicationContext.storeService.getCurrencies()?join('", "') + '"'>
<#assign localesString = '"' + applicationContext.storeService.getLocales()?join('", "') + '"'>
<#assign storeSettingsJSON = '
{
  name: "${applicationContext.storeService.getName()}",
  currencies: [${currenciesString}],
  locales: [${localesString}]
}
'>

<#assign crafterSiteName = siteContext.siteName!"">

<#assign staticAssetsPath = siteContext.staticAssetsPath!"">

<#assign userJSON = "null"/>
<#if profile?? && profile.email??>
  <#assign userJSON = applicationContext.customerService.getCurrent()/>
</#if>

<#assign personaAge = "null"/>
<#if profile?? && profile.attributes?? && profile.attributes.age??>
  <#assign personaAge = "\"${profile.attributes.age}\"" />
</#if>

<#assign personaGender = "null"/>
<#if profile?? && profile.attributes?? && profile.attributes.gender??>
  <#assign personaGender = "\"${profile.attributes.gender}\"" />
</#if>

<#include "/static-assets/app/index.html" />

