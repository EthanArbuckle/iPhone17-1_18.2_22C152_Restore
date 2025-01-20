@interface CloudKit_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation CloudKit_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23983F5C0;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A05728 != -1) {
    dispatch_once(&qword_268A05728, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  id v16 = a3;
  objc_msgSend_defineConstants_(a1, v4, v5, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v6, v7, &unk_26ECEBD38, @"CKRecordIDWithName");
  objc_msgSend_setObject_forKeyedSubscript_(v16, v8, v9, &unk_26ECEBD58, @"CKRecordWithType");
  objc_msgSend_setObject_forKeyedSubscript_(v16, v10, v11, &unk_26ECEBD78, @"CKRecordWithTypeID");
  objc_msgSend_setObject_forKeyedSubscript_(v16, v12, v13, &unk_26ECEBD98, @"CKReferenceWithRecord");
  objc_msgSend_setObject_forKeyedSubscript_(v16, v14, v15, &unk_26ECEBDB8, @"CKReferenceWithRecordID");
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v196 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v196, v8, v9, *MEMORY[0x263EFD498], *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"CKErrorDomain", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v12, v13, *MEMORY[0x263EFD4C8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"CKPartialErrorsByItemIDKey", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v16, v17, *MEMORY[0x263EFD4E8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"CKRecordChangedErrorAncestorRecordKey", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v20, v21, *MEMORY[0x263EFD4F8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"CKRecordChangedErrorServerRecordKey", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v24, v25, *MEMORY[0x263EFD4F0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"CKRecordChangedErrorClientRecordKey", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v28, v29, *MEMORY[0x263EFD4A0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"CKErrorRetryAfterKey", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v32, v33, &unk_26ED196B8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"CKErrorInternalError", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v36, v37, &unk_26ED196D0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, @"CKErrorPartialFailure", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v40, v41, &unk_26ED196E8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"CKErrorNetworkFailure", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v44, v45, &unk_26ED19700, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"CKErrorNetworkUnavailable", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v48, v49, &unk_26ED19718, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"CKErrorBadContainer", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v52, v53, &unk_26ED19730, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"CKErrorServiceUnavailable", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v56, v57, &unk_26ED19748, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"CKErrorRequestRateLimited", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v60, v61, &unk_26ED19760, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v62, v63, @"CKErrorMissingEntitlement", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v64, v65, &unk_26ED19778, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v66, v67, @"CKErrorNotAuthenticated", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v68, v69, &unk_26ED19790, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v70, v71, @"CKErrorPermissionFailure", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v72, v73, &unk_26ED197A8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v74, v75, @"CKErrorUnknownItem", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v76, v77, &unk_26ED197C0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v78, v79, @"CKErrorInvalidArguments", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v80, v81, &unk_26ED197D8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v82, v83, @"CKErrorServerRecordChanged", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v84, v85, &unk_26ED197F0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v86, v87, @"CKErrorServerRejectedRequest", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v88, v89, &unk_26ED19808, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v90, v91, @"CKErrorAssetFileNotFound", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v92, v93, &unk_26ED19820, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v94, v95, @"CKErrorAssetFileModified", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v96, v97, &unk_26ED19838, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v98, v99, @"CKErrorIncompatibleVersion", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v100, v101, &unk_26ED19850, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v102, v103, @"CKErrorConstraintViolation", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v104, v105, &unk_26ED19868, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v106, v107, @"CKErrorOperationCancelled", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v108, v109, &unk_26ED19880, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v110, v111, @"CKErrorChangeTokenExpired", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v112, v113, &unk_26ED19898, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v114, v115, @"CKErrorBatchRequestFailed", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v116, v117, &unk_26ED198B0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v118, v119, @"CKErrorZoneBusy", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v120, v121, &unk_26ED198C8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v122, v123, @"CKErrorBadDatabase", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v124, v125, &unk_26ED198E0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v126, v127, @"CKErrorQuotaExceeded", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v128, v129, &unk_26ED198F8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v130, v131, @"CKErrorZoneNotFound", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v132, v133, &unk_26ED19910, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v134, v135, @"CKErrorLimitExceeded", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v136, v137, &unk_26ED19928, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v138, v139, @"CKErrorUserDeletedZone", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v140, v141, &unk_26ED19940, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v142, v143, @"CKErrorTooManyParticipants", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v144, v145, &unk_26ED19958, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v146, v147, @"CKErrorAlreadyShared", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v148, v149, &unk_26ED19970, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v150, v151, @"CKErrorReferenceViolation", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v152, v153, &unk_26ED19988, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v154, v155, @"CKErrorManagedAccountRestricted", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v156, v157, &unk_26ED199A0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v158, v159, @"CKErrorParticipantMayNeedVerification", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v160, v161, &unk_26ED199B8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v162, v163, @"CKErrorServerResponseLost", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v164, v165, &unk_26ED199D0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v166, v167, @"CKErrorAssetNotAvailable", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v168, v169, &unk_26ED199E8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v170, v171, @"CKAccountStatusCouldNotDetermine", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v172, v173, &unk_26ED196B8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v174, v175, @"CKAccountStatusAvailable", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v176, v177, &unk_26ED196D0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v178, v179, @"CKAccountStatusRestricted", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v180, v181, &unk_26ED19700, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v182, v183, @"CKAccountStatusNoAccount", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v184, v185, &unk_26ED19A00, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v186, v187, @"CKReferenceActionNone", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v188, v189, &unk_26ED19A18, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v190, v191, @"CKReferenceActionDeleteSelf", v196);
  objc_msgSend_setObject_forKeyedSubscript_(v196, v192, v193, *MEMORY[0x263EFD518], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v194, v195, @"CKRecordTypeUserRecord", v196);
}

@end