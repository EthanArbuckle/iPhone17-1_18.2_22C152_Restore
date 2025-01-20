@interface WebKit_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
@end

@implementation WebKit_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239865C88;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A05870 != -1) {
    dispatch_once(&qword_268A05870, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v152 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v152, v8, v9, &unk_26ED19CE8, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"WKSelectionGranularityDynamic", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v12, v13, &unk_26ED19D00, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"WKSelectionGranularityCharacter", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v16, v17, &unk_26ED19CE8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"WKNavigationActionPolicyCancel", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v20, v21, &unk_26ED19D00, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"WKNavigationActionPolicyAllow", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v24, v25, &unk_26ED19CE8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"WKNavigationResponsePolicyCancel", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v28, v29, &unk_26ED19D00, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"WKNavigationResponsePolicyAllow", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v32, v33, &unk_26ED19D00, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"WKErrorUnknown", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v36, v37, &unk_26ED19D18, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, @"WKErrorWebContentProcessTerminated", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v40, v41, &unk_26ED19D30, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"WKErrorWebViewInvalidated", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v44, v45, &unk_26ED19D48, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"WKErrorJavaScriptExceptionOccurred", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v48, v49, &unk_26ED19D60, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"WKErrorJavaScriptResultTypeIsUnsupported", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v52, v53, &unk_26ED19CE8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"WKUserScriptInjectionTimeAtDocumentStart", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v56, v57, &unk_26ED19D00, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"WKUserScriptInjectionTimeAtDocumentEnd", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v60, v61, &unk_26ED19CE8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v62, v63, @"WKNavigationTypeLinkActivated", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v64, v65, &unk_26ED19D00, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v66, v67, @"WKNavigationTypeFormSubmitted", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v68, v69, &unk_26ED19D18, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v70, v71, @"WKNavigationTypeBackForward", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v72, v73, &unk_26ED19D30, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v74, v75, @"WKNavigationTypeReload", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v76, v77, &unk_26ED19D48, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v78, v79, @"WKNavigationTypeFormResubmitted", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v80, v81, &unk_26ED19D78, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v82, v83, @"WKNavigationTypeOther", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v84, v85, *MEMORY[0x263F1FAE0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v86, v87, @"WKWebsiteDataTypeDiskCache", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v88, v89, *MEMORY[0x263F1FAF8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v90, v91, @"WKWebsiteDataTypeMemoryCache", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v92, v93, *MEMORY[0x263F1FB00], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v94, v95, @"WKWebsiteDataTypeOfflineWebApplicationCache", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v96, v97, *MEMORY[0x263F1FAD8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v98, v99, @"WKWebsiteDataTypeCookies", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v100, v101, *MEMORY[0x263F1FB08], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v102, v103, @"WKWebsiteDataTypeSessionStorage", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v104, v105, *MEMORY[0x263F1FAF0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v106, v107, @"WKWebsiteDataTypeLocalStorage", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v108, v109, *MEMORY[0x263F1FB10], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v110, v111, @"WKWebsiteDataTypeWebSQLDatabases", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v112, v113, *MEMORY[0x263F1FAE8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v114, v115, @"WKWebsiteDataTypeIndexedDBDatabases", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v116, v117, &unk_26ED19D90, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v118, v119, @"WKDataDetectorTypeNone", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v120, v121, &unk_26ED19DA8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v122, v123, @"WKDataDetectorTypePhoneNumber", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v124, v125, &unk_26ED19DC0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v126, v127, @"WKDataDetectorTypeLink", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v128, v129, &unk_26ED19DD8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v130, v131, @"WKDataDetectorTypeAddress", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v132, v133, &unk_26ED19DF0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v134, v135, @"WKDataDetectorTypeCalendarEvent", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v136, v137, &unk_26ED19E08, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v138, v139, @"WKDataDetectorTypeTrackingNumber", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v140, v141, &unk_26ED19E20, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v142, v143, @"WKDataDetectorTypeFlightNumber", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v144, v145, &unk_26ED19E38, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v146, v147, @"WKDataDetectorTypeLookupSuggestion", v152);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v148, v149, &unk_26ED19E50, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v150, v151, @"WKDataDetectorTypeAll", v152);
}

@end