@interface PassKit_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation PassKit_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23982D9C4;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A05640 != -1) {
    dispatch_once(&qword_268A05640, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  v47[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_defineConstants_(a1, v5, v6, v4);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v7, v8, &unk_26ECEB938, @"PKPaymentSummaryItem");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v9, v10, &unk_26ECEB958, @"PKPass");
  v11 = (void *)MEMORY[0x263F10390];
  v14 = objc_msgSend_context(v4, v12, v13);
  v17 = objc_msgSend_valueWithNewObjectInContext_(v11, v15, v16, v14);

  uint64_t v19 = *MEMORY[0x263F10370];
  v46[0] = *MEMORY[0x263F10368];
  uint64_t v18 = v46[0];
  v46[1] = v19;
  v47[0] = v17;
  v47[1] = &unk_26ED18F98;
  v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, v21, v47, v46, 2);
  objc_msgSend_defineProperty_descriptor_(v4, v23, v24, @"PKPaymentAuthorizationViewController", v22);

  v44[0] = v18;
  v44[1] = v19;
  v45[0] = &unk_26ECEB978;
  v45[1] = &unk_26ED18F98;
  v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, v26, v45, v44, 2);
  objc_msgSend_defineProperty_descriptor_(v17, v28, v29, @"canMakePayments", v27);

  v42[0] = v18;
  v42[1] = v19;
  v43[0] = &unk_26ECEB998;
  v43[1] = &unk_26ED18F98;
  v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, v31, v43, v42, 2);
  objc_msgSend_defineProperty_descriptor_(v17, v33, v34, @"canMakePaymentsUsingNetworks", v32);

  v40[0] = v18;
  v40[1] = v19;
  v41[0] = &unk_26ECEB9B8;
  v41[1] = &unk_26ED18F98;
  v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, v36, v41, v40, 2);
  objc_msgSend_defineProperty_descriptor_(v17, v38, v39, @"canMakePaymentsUsingNetworksAndCapabilities", v37);
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v292 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v292, v8, v9, &unk_26ED18FB0, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"PKPaymentButtonStyleWhite", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v12, v13, &unk_26ED18FC8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"PKPaymentButtonStyleWhiteOutline", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v16, v17, &unk_26ED18FE0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"PKPaymentButtonStyleBlack", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v20, v21, &unk_26ED18FF8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"PKPaymentButtonStyleAutomatic", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v24, v25, &unk_26ED18FB0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"PKPaymentButtonTypePlain", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v28, v29, &unk_26ED18FC8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"PKPaymentButtonTypeBuy", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v32, v33, &unk_26ED18FE0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"PKPaymentButtonTypeSetUp", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v36, v37, &unk_26ED19010, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, @"PKPaymentButtonTypeCheckout", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v40, v41, &unk_26ED19028, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"PKPaymentButtonTypeBook", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v44, v45, &unk_26ED19040, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"PKPaymentButtonTypeDonate", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v48, v49, &unk_26ED18FF8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"PKPaymentButtonTypeInStore", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v52, v53, &unk_26ED19058, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"PKPaymentButtonTypeSubscribe", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v56, v57, &unk_26ED19070, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"PKPaymentButtonTypeAddMoney", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v60, v61, &unk_26ED19088, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v62, v63, @"PKPaymentButtonTypeOrder", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v64, v65, &unk_26ED190A0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v66, v67, @"PKPaymentButtonTypeSupport", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v68, v69, &unk_26ED190B8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v70, v71, @"PKPaymentButtonTypeTip", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v72, v73, &unk_26ED190D0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v74, v75, @"PKPaymentButtonTypeTopUp", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v76, v77, &unk_26ED190E8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v78, v79, @"PKPaymentButtonTypeReload", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v80, v81, &unk_26ED19100, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v82, v83, @"PKPaymentButtonTypeContribute", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v84, v85, &unk_26ED19118, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v86, v87, @"PKPaymentButtonTypeRent", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v88, v89, &unk_26ED18FB0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v90, v91, @"PKPaymentAuthorizationStatusSuccess", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v92, v93, &unk_26ED18FC8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v94, v95, @"PKPaymentAuthorizationStatusFailure", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v96, v97, &unk_26ED19010, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v98, v99, @"PKPaymentAuthorizationStatusPINRequired", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v100, v101, &unk_26ED19058, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v102, v103, @"PKPaymentAuthorizationStatusPINLockout", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v104, v105, &unk_26ED19028, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v106, v107, @"PKPaymentAuthorizationStatusPINIncorrect", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v108, v109, &unk_26ED18FE0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v110, v111, @"PKPaymentAuthorizationStatusInvalidBillingPostalAddress", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v112, v113, &unk_26ED18FF8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v114, v115, @"PKPaymentAuthorizationStatusInvalidShippingPostalAddress", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v116, v117, &unk_26ED19040, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v118, v119, @"PKPaymentAuthorizationStatusInvalidShippingContact", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v120, v121, &unk_26ED19130, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v122, v123, @"PKMerchantCapability3DS", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v124, v125, &unk_26ED19148, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v126, v127, @"PKMerchantCapabilityEMV", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v128, v129, &unk_26ED19160, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v130, v131, @"PKMerchantCapabilityCredit", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v132, v133, &unk_26ED19178, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v134, v135, @"PKMerchantCapabilityDebit", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v136, v137, &unk_26ED19190, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v138, v139, @"PKAddressFieldNone", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v140, v141, &unk_26ED19130, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v142, v143, @"PKAddressFieldPostalAddress", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v144, v145, &unk_26ED19148, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v146, v147, @"PKAddressFieldPhone", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v148, v149, &unk_26ED19160, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v150, v151, @"PKAddressFieldEmail", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v152, v153, &unk_26ED19178, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v154, v155, @"PKAddressFieldName", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v156, v157, &unk_26ED191A8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v158, v159, @"PKAddressFieldAll", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v160, v161, &unk_26ED19190, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v162, v163, @"PKShippingTypeShipping", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v164, v165, &unk_26ED19130, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v166, v167, @"PKShippingTypeDelivery", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v168, v169, &unk_26ED19148, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v170, v171, @"PKShippingTypeStorePickup", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v172, v173, &unk_26ED191C0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v174, v175, @"PKShippingTypeServicePickup", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v176, v177, &unk_26ED19190, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v178, v179, @"PKPaymentSummaryItemTypeFinal", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v180, v181, &unk_26ED19130, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v182, v183, @"PKPaymentSummaryItemTypePending", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v184, v185, *MEMORY[0x263F5C580], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v186, v187, @"PKEncryptionSchemeECC_V2", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v188, v189, *MEMORY[0x263F5C6E0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v190, v191, @"PKPaymentNetworkAmex", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v192, v193, *MEMORY[0x263F5C6F0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v194, v195, @"PKPaymentNetworkDiscover", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v196, v197, *MEMORY[0x263F5C700], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v198, v199, @"PKPaymentNetworkMasterCard", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v200, v201, *MEMORY[0x263F5C708], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v202, v203, @"PKPaymentNetworkPrivateLabel", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v204, v205, *MEMORY[0x263F5C718], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v206, v207, @"PKPaymentNetworkVisa", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v208, v209, &unk_26ED18FB0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v210, v211, @"PKAddPassButtonStyleBlack", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v212, v213, &unk_26ED18FC8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v214, v215, @"PKAddPassButtonStyleBlackOutline", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v216, v217, &unk_26ED19190, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v218, v219, @"PKPassTypeBarcode", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v220, v221, &unk_26ED19130, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v222, v223, @"PKPassTypePayment", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v224, v225, &unk_26ED191D8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v226, v227, @"PKPassTypeAny", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v228, v229, &unk_26ED19190, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v230, v231, @"PKPaymentPassActivationStateActivated", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v232, v233, &unk_26ED19130, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v234, v235, @"PKPaymentPassActivationStateRequiresActivation", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v236, v237, &unk_26ED19148, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v238, v239, @"PKPaymentPassActivationStateActivating", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v240, v241, &unk_26ED191C0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v242, v243, @"PKPaymentPassActivationStateSuspended", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v244, v245, &unk_26ED19160, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v246, v247, @"PKPaymentPassActivationStateDeactivated", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v248, v249, *MEMORY[0x263F5C518], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v250, v251, @"PKContactFieldPostalAddress", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v252, v253, *MEMORY[0x263F5C4F8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v254, v255, @"PKContactFieldEmailAddress", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v256, v257, *MEMORY[0x263F5C508], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v258, v259, @"PKContactFieldPhoneNumber", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v260, v261, *MEMORY[0x263F5C500], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v262, v263, @"PKContactFieldName", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v264, v265, *MEMORY[0x263F5C510], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v266, v267, @"PKContactFieldPhoneticName", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v268, v269, *MEMORY[0x263F5C6C8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v270, v271, @"PKPaymentErrorDomain", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v272, v273, *MEMORY[0x263F5C6C0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v274, v275, @"PKPaymentErrorContactFieldUserInfoKey", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v276, v277, &unk_26ED191F0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v278, v279, @"PKPaymentUnknownError", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v280, v281, &unk_26ED18FC8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v282, v283, @"PKPaymentShippingContactInvalidError", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v284, v285, &unk_26ED18FE0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v286, v287, @"PKPaymentBillingContactInvalidError", v292);
  objc_msgSend_setObject_forKeyedSubscript_(v292, v288, v289, &unk_26ED18FF8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v290, v291, @"PKPaymentShippingAddressUnserviceableError", v292);
}

@end