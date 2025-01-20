@interface TTSVoiceResourceManager
+ (id)effectiveResourceForLanguageCode:(id)a3 andVoiceType:(int64_t)a4;
+ (void)enumerateLoadableResourcesInAsset:(id)a3 usingBlock:(id)a4;
@end

@implementation TTSVoiceResourceManager

+ (id)effectiveResourceForLanguageCode:(id)a3 andVoiceType:(int64_t)a4
{
  id v5 = a3;
  if ((_AXSSpeechSynthesisOptions() & 8) != 0)
  {
    v9 = AXTTSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A66D3000, v9, OS_LOG_TYPE_DEFAULT, "Pref AXSpeechSynthesisOptionMauiEngineSkipSiriProvidedRules=YES. will not load Siri-provided rules", v11, 2u);
    }

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_voiceResourceForLanguage_voiceType_(TTSSiriAssetManager, v6, (uint64_t)v5, a4, v7);
  }

  return v8;
}

+ (void)enumerateLoadableResourcesInAsset:(id)a3 usingBlock:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, void *, void *, id))a4;
  v48 = v5;
  if (v5)
  {
    AXTTSLogRange();
    uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
      sub_1A688DF88(v5, v7, v8, v9, v10);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    objc_msgSend_resourceList(v5, v11, v12, v13, v14);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v53 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v24 = objc_msgSend_objectForKeyedSubscript_(v23, v17, @"mime-type", v18, v19);
          v28 = objc_msgSend_objectForKeyedSubscript_(v23, v25, @"filename", v26, v27);
          v32 = objc_msgSend_stringWithUTF8String_(NSString, v29, (uint64_t)"application/edct-bin-dictionary", v30, v31);
          int isEqualToString = objc_msgSend_isEqualToString_(v24, v33, (uint64_t)v32, v34, v35);

          if (isEqualToString)
          {
            v41 = objc_msgSend_searchPathURL(v48, v37, v38, v39, v40);
            v45 = objc_msgSend_URLByAppendingPathComponent_(v41, v42, (uint64_t)v28, v43, v44);

            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_1A670574C;
            aBlock[3] = &unk_1E5C69C28;
            id v51 = v45;
            id v46 = v45;
            v47 = _Block_copy(aBlock);
            v6[2](v6, v28, v24, v47, v46);
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v52, (uint64_t)v56, 16);
      }
      while (v20);
    }
  }
}

@end