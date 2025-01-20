@interface TTSLocaleUtilities
+ (id)sharedInstance;
- (NSDictionary)canonicalLanguageCodeVoiceNamesData;
- (NSDictionary)generalLanguageCodeData;
- (NSDictionary)voiceIdSampleStringData;
- (NSMutableDictionary)fallbackSampleStringCache;
- (TTSLocaleUtilities)init;
- (id)defaultVoiceIdentifierForGeneralLanguageCode:(id)a3;
- (id)defaultVoiceIdentifierForVoiceName:(id)a3;
- (id)sampleStringForVoiceIdentifier:(id)a3;
- (void)setCanonicalLanguageCodeVoiceNamesData:(id)a3;
- (void)setFallbackSampleStringCache:(id)a3;
- (void)setGeneralLanguageCodeData:(id)a3;
- (void)setVoiceIdSampleStringData:(id)a3;
@end

@implementation TTSLocaleUtilities

- (TTSLocaleUtilities)init
{
  v10.receiver = self;
  v10.super_class = (Class)TTSLocaleUtilities;
  v6 = [(TTSLocaleUtilities *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v2, v3, v4, v5);
    fallbackSampleStringCache = v6->_fallbackSampleStringCache;
    v6->_fallbackSampleStringCache = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (id)defaultVoiceIdentifierForGeneralLanguageCode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = AXCLanguageCanonicalFormToGeneralLanguage();
    if (objc_msgSend_isEqualToString_(v5, v6, (uint64_t)v4, v7, v8))
    {
      v13 = objc_msgSend_generalLanguageCodeData(self, v9, v10, v11, v12);
      v17 = objc_msgSend_objectForKey_(v13, v14, (uint64_t)v4, v15, v16);

      if (!v17)
      {
        v22 = objc_msgSend_sharedInstance(TTSAXResourceManager, v18, v19, v20, v21);
        v25 = objc_msgSend_resourcesWithLanguage_type_(v22, v23, (uint64_t)v4, 4, v24);
        v30 = objc_msgSend_firstObject(v25, v26, v27, v28, v29);
        v17 = objc_msgSend_voiceId(v30, v31, v32, v33, v34);
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)sharedInstance
{
  if (qword_1EB67ABA8 != -1) {
    dispatch_once(&qword_1EB67ABA8, &unk_1EFB80400);
  }
  v2 = (void *)qword_1EB67AB98;

  return v2;
}

- (NSDictionary)canonicalLanguageCodeVoiceNamesData
{
  canonicalLanguageCodeVoiceNamesData = self->_canonicalLanguageCodeVoiceNamesData;
  if (!canonicalLanguageCodeVoiceNamesData)
  {
    id v4 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v5 = objc_opt_class();
    v9 = objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
    uint64_t v12 = objc_msgSend_pathForResource_ofType_(v9, v10, @"CanonicalLanguageCodeVoiceNamesMap", @"plist", v11);

    if (v12)
    {
      objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v12, v14, v15);
      uint64_t v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = self->_canonicalLanguageCodeVoiceNamesData;
      self->_canonicalLanguageCodeVoiceNamesData = v16;
    }
    else
    {
      v18 = AXTTSLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1A688F374(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    canonicalLanguageCodeVoiceNamesData = self->_canonicalLanguageCodeVoiceNamesData;
  }

  return canonicalLanguageCodeVoiceNamesData;
}

- (NSDictionary)generalLanguageCodeData
{
  generalLanguageCodeData = self->_generalLanguageCodeData;
  if (!generalLanguageCodeData)
  {
    id v4 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v5 = objc_opt_class();
    v9 = objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
    uint64_t v12 = objc_msgSend_pathForResource_ofType_(v9, v10, @"GeneralLanguageCodeMap", @"plist", v11);

    if (v12)
    {
      objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v12, v14, v15);
      uint64_t v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = self->_generalLanguageCodeData;
      self->_generalLanguageCodeData = v16;
    }
    else
    {
      v18 = AXTTSLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1A688F374(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    generalLanguageCodeData = self->_generalLanguageCodeData;
  }

  return generalLanguageCodeData;
}

- (NSDictionary)voiceIdSampleStringData
{
  voiceIdSampleStringData = self->_voiceIdSampleStringData;
  if (!voiceIdSampleStringData)
  {
    id v4 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v5 = objc_opt_class();
    v9 = objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
    uint64_t v12 = objc_msgSend_pathForResource_ofType_(v9, v10, @"VoiceIdSampleStringMap", @"plist", v11);

    if (v12)
    {
      objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v12, v14, v15);
      uint64_t v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = self->_voiceIdSampleStringData;
      self->_voiceIdSampleStringData = v16;
    }
    else
    {
      v18 = AXTTSLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1A688F3AC(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    voiceIdSampleStringData = self->_voiceIdSampleStringData;
  }

  return voiceIdSampleStringData;
}

- (id)sampleStringForVoiceIdentifier:(id)a3
{
  uint64_t v10 = objc_msgSend_lowercaseString(a3, a2, (uint64_t)a3, v3, v4);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_voiceIdSampleStringData(self, v6, v7, v8, v9);
    uint64_t v15 = objc_msgSend_objectForKey_(v11, v12, (uint64_t)v10, v13, v14);

    if (!v15)
    {
      if (!objc_msgSend_containsString_(v10, v16, @"compact", v17, v18)) {
        goto LABEL_9;
      }
      if (objc_msgSend_containsString_(v10, v19, @".super-compact.", v21, v22)) {
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v23, @".super-compact.", @".compact.", v24);
      }
      else {
      uint64_t v25 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v23, @".compact.", @".super-compact.", v24);
      }
      v30 = objc_msgSend_voiceIdSampleStringData(self, v26, v27, v28, v29);
      uint64_t v15 = objc_msgSend_objectForKey_(v30, v31, (uint64_t)v25, v32, v33);

      if (!v15)
      {
LABEL_9:
        uint64_t v34 = objc_msgSend_sharedInstance(TTSAXResourceManager, v19, v20, v21, v22);
        v38 = objc_msgSend_resourceWithVoiceId_(v34, v35, (uint64_t)v10, v36, v37);

        if (!v38) {
          goto LABEL_27;
        }
        v39 = self;
        objc_sync_enter(v39);
        char isPersonalVoice = objc_msgSend_isPersonalVoice(v38, v40, v41, v42, v43);
        char v53 = objc_msgSend_type(v38, v45, v46, v47, v48) == 3 ? 1 : isPersonalVoice;
        if (v53)
        {
          v54 = 0;
        }
        else
        {
          v55 = objc_msgSend_fallbackSampleStringCache(v39, v49, v50, v51, v52);
          v60 = objc_msgSend_primaryLanguage(v38, v56, v57, v58, v59);
          v54 = objc_msgSend_objectForKeyedSubscript_(v55, v61, (uint64_t)v60, v62, v63);
        }
        objc_sync_exit(v39);

        if (v54) {
          goto LABEL_21;
        }
        if (objc_msgSend_type(v38, v64, v65, v66, v67) == 3 && objc_msgSend_subtype(v38, v68, v69, v70, v71) == 7) {
          objc_msgSend_footprint(v38, v72, v73, v74, v75);
        }
        v76 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v77 = objc_opt_class();
        v81 = objc_msgSend_bundleForClass_(v76, v78, v77, v79, v80);
        v86 = objc_msgSend_primaryLanguage(v38, v82, v83, v84, v85);
        v54 = AXNSLocalizedStringForLocale();

        if (v54)
        {
LABEL_21:
          v87 = v39;
          objc_sync_enter(v87);
          if (objc_msgSend_type(v38, v88, v89, v90, v91) == 3) {
            char v96 = 1;
          }
          else {
            char v96 = isPersonalVoice;
          }
          if ((v96 & 1) == 0)
          {
            v97 = objc_msgSend_fallbackSampleStringCache(v87, v92, v93, v94, v95);
            v102 = objc_msgSend_primaryLanguage(v38, v98, v99, v100, v101);
            objc_msgSend_setObject_forKeyedSubscript_(v97, v103, (uint64_t)v54, (uint64_t)v102, v104);
          }
          objc_sync_exit(v87);

          v109 = objc_msgSend_name(v38, v105, v106, v107, v108);
          v114 = objc_msgSend_primaryLanguage(v38, v110, v111, v112, v113);
          v117 = objc_msgSend_localizedName_forLanguage_(TTSSpeechVoice, v115, (uint64_t)v109, (uint64_t)v114, v116);

          uint64_t v15 = objc_msgSend_stringWithFormat_(NSString, v118, (uint64_t)v54, v119, v120, v117);
        }
        else
        {
LABEL_27:
          uint64_t v15 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)defaultVoiceIdentifierForVoiceName:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v9 = objc_msgSend_canonicalLanguageCodeVoiceNamesData(self, v4, v5, v6, v7, 0);
    uint64_t v14 = objc_msgSend_allKeys(v9, v10, v11, v12, v13);

    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v46, (uint64_t)v52, 16);
    if (v16)
    {
      uint64_t v21 = v16;
      uint64_t v22 = *(void *)v47;
LABEL_4:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v14);
        }
        uint64_t v24 = *(void **)(*((void *)&v46 + 1) + 8 * v23);
        uint64_t v25 = objc_msgSend_canonicalLanguageCodeVoiceNamesData(self, v17, v18, v19, v20);
        uint64_t v29 = objc_msgSend_objectForKey_(v25, v26, (uint64_t)v24, v27, v28);

        uint64_t v34 = objc_msgSend_lowercaseString(v8, v30, v31, v32, v33);
        char v38 = objc_msgSend_containsObject_(v29, v35, (uint64_t)v34, v36, v37);

        if (v38) {
          break;
        }

        if (v21 == ++v23)
        {
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v46, (uint64_t)v52, 16);
          if (v21) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v39 = v24;

      if (!v39) {
        goto LABEL_13;
      }
      v40 = AXCLanguageCanonicalFormToGeneralLanguage();
      v44 = objc_msgSend_defaultVoiceIdentifierForGeneralLanguageCode_(self, v41, (uint64_t)v40, v42, v43);
    }
    else
    {
LABEL_10:

LABEL_13:
      v39 = AXTTSLogResourceManager();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v8;
        _os_log_impl(&dword_1A66D3000, v39, OS_LOG_TYPE_INFO, "Unable to find language code for voice name: %@", buf, 0xCu);
      }
      v44 = 0;
    }
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (void)setGeneralLanguageCodeData:(id)a3
{
}

- (void)setVoiceIdSampleStringData:(id)a3
{
}

- (void)setCanonicalLanguageCodeVoiceNamesData:(id)a3
{
}

- (NSMutableDictionary)fallbackSampleStringCache
{
  return self->_fallbackSampleStringCache;
}

- (void)setFallbackSampleStringCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackSampleStringCache, 0);
  objc_storeStrong((id *)&self->_canonicalLanguageCodeVoiceNamesData, 0);
  objc_storeStrong((id *)&self->_voiceIdSampleStringData, 0);

  objc_storeStrong((id *)&self->_generalLanguageCodeData, 0);
}

@end