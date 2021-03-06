// @@@LICENSE
//
//      Copyright (c) 2010-2013 LG Electronics, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// LICENSE@@@

/*jslint white: true, onevar: true, undef: true, eqeqeq: true, plusplus: true, bitwise: true, 
regexp: true, newcap: true, immed: true, nomen: false, maxerr: 500 */
/*global MojoLoader, palmGetResource, include */

var exports = {},
	loadall;

if (!loadall) {
	loadall = true;
	var IMPORTS = {},
		manifest = JSON.parse(palmGetResource("sources.json")),
		i,
		entry,
		lib;
	
	// import libraries first
	for (i = 0; i < manifest.length; i += 1) {
		entry = manifest[i];
		if (entry.library) {
			lib = MojoLoader.require(entry.library);
			IMPORTS[entry.library.name] = lib[entry.library.name];
		}
	}
	
	// import source files
	for (i = 0; i < manifest.length; i += 1) {
		entry = manifest[i];
		if (entry.source) {
			include(entry.source);
		}
	}
}
