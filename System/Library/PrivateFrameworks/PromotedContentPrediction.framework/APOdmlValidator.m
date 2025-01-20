@interface APOdmlValidator
+ (int64_t)permissionCheck:(id)a3 personalizedAdsEnabled:(BOOL)a4 trialKillswitch:(BOOL)a5;
@end

@implementation APOdmlValidator

+ (int64_t)permissionCheck:(id)a3 personalizedAdsEnabled:(BOOL)a4 trialKillswitch:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = OdmlLogForCategory(5uLL);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = OdmlLogForCategory(5uLL);
  v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134283521;
    uint64_t v106 = objc_msgSend_count(v7, v13, v14);
    _os_signpost_emit_with_name_impl(&dword_1BBC44000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Permission Check", "%{private}lu", buf, 0xCu);
  }

  if (!a4)
  {
    v26 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v106 = (uint64_t)v27;
      id v28 = v27;
      _os_log_impl(&dword_1BBC44000, v26, OS_LOG_TYPE_DEFAULT, "[%@] Cannot rerank if Personalized Ads is disabled.", buf, 0xCu);
    }
    v29 = OdmlLogForCategory(5uLL);
    v30 = v29;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      uint64_t v33 = objc_msgSend_count(v7, v31, v32);
      *(_DWORD *)buf = 134283521;
      uint64_t v106 = v33;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v30, OS_SIGNPOST_INTERVAL_END, v9, "Permission Check", "%{private}lu", buf, 0xCu);
    }

    v25 = &kAPOdmlPersonalizedAdsDisabled;
    goto LABEL_18;
  }
  if (v5)
  {
    v17 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v106 = (uint64_t)v18;
      id v19 = v18;
      _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_DEFAULT, "[%@] Reranking is disabled on Trial.", buf, 0xCu);
    }
    v20 = OdmlLogForCategory(5uLL);
    v21 = v20;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      uint64_t v24 = objc_msgSend_count(v7, v22, v23);
      *(_DWORD *)buf = 134283521;
      uint64_t v106 = v24;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v21, OS_SIGNPOST_INTERVAL_END, v9, "Permission Check", "%{private}lu", buf, 0xCu);
    }

    v25 = &kAPOdmlRerankingDisabledWithTrial;
    goto LABEL_18;
  }
  if (objc_msgSend_isInternalInstall(MEMORY[0x1E4F28F80], v15, v16)) {
    int v37 = objc_msgSend_BOOLForKey_(APOdmlDefaults, v36, @"ODMLAllowListDisabled");
  }
  else {
    int v37 = 0;
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v7;
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v101, v109, 16);
  if (!v39) {
    goto LABEL_37;
  }
  uint64_t v42 = v39;
  uint64_t v43 = *(void *)v102;
  os_signpost_id_t spid = v9;
  id v99 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v42; ++i)
    {
      if (*(void *)v102 != v43) {
        objc_enumerationMutation(obj);
      }
      v45 = *(void **)(*((void *)&v101 + 1) + 8 * i);
      v46 = objc_msgSend_odmlResponse(v45, v40, v41, spid);

      if (!v46)
      {
        v72 = OdmlLogForCategory(5uLL);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          v73 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v106 = (uint64_t)v73;
          id v74 = v73;
          _os_log_impl(&dword_1BBC44000, v72, OS_LOG_TYPE_DEFAULT, "[%@] ODML Response not found.", buf, 0xCu);
        }
        v75 = OdmlLogForCategory(5uLL);
        v76 = v75;
        id v7 = v99;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
        {
          uint64_t v79 = objc_msgSend_count(obj, v77, v78);
          *(_DWORD *)buf = 134283521;
          uint64_t v106 = v79;
          _os_signpost_emit_with_name_impl(&dword_1BBC44000, v76, OS_SIGNPOST_INTERVAL_END, spid, "Permission Check", "%{private}lu", buf, 0xCu);
        }
        v80 = &kAPOdmlRerankingResponseNotFound;
        goto LABEL_61;
      }
      v49 = objc_msgSend_odmlResponse(v45, v47, v48);
      char v52 = objc_msgSend_odmlEnabled(v49, v50, v51);

      if ((v52 & 1) == 0)
      {
        v81 = OdmlLogForCategory(5uLL);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v82 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v106 = (uint64_t)v82;
          id v83 = v82;
          _os_log_impl(&dword_1BBC44000, v81, OS_LOG_TYPE_DEFAULT, "[%@] Reranking is disabled on the server.", buf, 0xCu);
        }
        v84 = OdmlLogForCategory(5uLL);
        v76 = v84;
        id v7 = v99;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
        {
          uint64_t v87 = objc_msgSend_count(obj, v85, v86);
          *(_DWORD *)buf = 134283521;
          uint64_t v106 = v87;
          _os_signpost_emit_with_name_impl(&dword_1BBC44000, v76, OS_SIGNPOST_INTERVAL_END, spid, "Permission Check", "%{private}lu", buf, 0xCu);
        }
        v80 = &kAPOdmlRerankingDisabledWithServer;
        goto LABEL_61;
      }
      if (!v37)
      {
        v58 = objc_msgSend_sharedInstance(APOdmlAllowList, v53, v54);
        v61 = objc_msgSend_adamID(v45, v59, v60);
        char isAllowed = objc_msgSend_isAllowed_(v58, v62, (uint64_t)v61);

        if (isAllowed) {
          continue;
        }
        v88 = OdmlLogForCategory(5uLL);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          v89 = objc_opt_class();
          id v90 = v89;
          v93 = objc_msgSend_adamID(v45, v91, v92);
          *(_DWORD *)buf = 138412546;
          uint64_t v106 = (uint64_t)v89;
          __int16 v107 = 2112;
          v108 = v93;
          _os_log_impl(&dword_1BBC44000, v88, OS_LOG_TYPE_DEFAULT, "[%@] Allowlist doesn't include %@.", buf, 0x16u);
        }
        v94 = OdmlLogForCategory(5uLL);
        v76 = v94;
        id v7 = v99;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
        {
          uint64_t v97 = objc_msgSend_count(obj, v95, v96);
          *(_DWORD *)buf = 134283521;
          uint64_t v106 = v97;
          _os_signpost_emit_with_name_impl(&dword_1BBC44000, v76, OS_SIGNPOST_INTERVAL_END, spid, "Permission Check", "%{private}lu", buf, 0xCu);
        }
        v80 = &kAPOdmlRerankingNotPermittedErrorCode;
LABEL_61:

        int64_t v34 = *v80;
        goto LABEL_19;
      }
      v55 = OdmlLogForCategory(5uLL);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v106 = (uint64_t)v56;
        id v57 = v56;
        _os_log_impl(&dword_1BBC44000, v55, OS_LOG_TYPE_DEFAULT, "[%@] Allowlist is disabled and thus allowlist check will be bypassed.", buf, 0xCu);
      }
    }
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v101, v109, 16);
    os_signpost_id_t v9 = spid;
    id v7 = v99;
    if (v42) {
      continue;
    }
    break;
  }
LABEL_37:

  v64 = OdmlLogForCategory(5uLL);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    uint64_t v106 = (uint64_t)v65;
    id v66 = v65;
    _os_log_impl(&dword_1BBC44000, v64, OS_LOG_TYPE_DEFAULT, "[%@] Reranking permission is granted. Reranking will start soon.", buf, 0xCu);
  }
  v67 = OdmlLogForCategory(5uLL);
  v68 = v67;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    uint64_t v71 = objc_msgSend_count(obj, v69, v70);
    *(_DWORD *)buf = 134283521;
    uint64_t v106 = v71;
    _os_signpost_emit_with_name_impl(&dword_1BBC44000, v68, OS_SIGNPOST_INTERVAL_END, v9, "Permission Check", "%{private}lu", buf, 0xCu);
  }

  v25 = &kAPOdmlRerankingPermitted;
LABEL_18:
  int64_t v34 = *v25;
LABEL_19:

  return v34;
}

@end