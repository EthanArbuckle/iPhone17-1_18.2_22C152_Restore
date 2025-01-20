@interface SEMLocalization
+ (BOOL)supportsSecureCoding;
+ (id)defaultLocalization;
+ (id)supportedLanguageCodeFromLocale:(id)a3;
+ (id)supportedNSLocaleFromLanguageCode:(id)a3;
+ (int64_t)supportedLocaleFromLanguageCode:(id)a3;
- (BOOL)_locateMorphunAssetForLocale:(id)a3 outAssetPath:(id *)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocalization:(id)a3;
- (SEMLocalization)init;
- (SEMLocalization)initWithCoder:(id)a3;
- (SEMLocalization)initWithSiriLanguageCode:(id)a3;
- (id)allLanguageCodes;
- (id)dictationLanguageCodes;
- (id)siriLanguageCode;
- (int64_t)locateMorphunAssetForSiriLanguage:(id *)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)refresh;
@end

@implementation SEMLocalization

+ (id)defaultLocalization
{
  id v2 = objc_alloc((Class)objc_opt_class());
  v6 = objc_msgSend_currentSiriLanguageCode(SEMAssistantSettingsBridge, v3, v4, v5);
  v9 = objc_msgSend_initWithSiriLanguageCode_(v2, v7, (uint64_t)v6, v8);

  return v9;
}

- (SEMLocalization)initWithSiriLanguageCode:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SEMLocalization;
  uint64_t v8 = [(SEMLocalization *)&v16 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    siriLanguageCode = v8->_siriLanguageCode;
    v8->_siriLanguageCode = (NSString *)v9;

    dictationLanguageCodes = v8->_dictationLanguageCodes;
    v8->_dictationLanguageCodes = 0;

    v8->_assetRequestCount = 0;
    v8->_assetResolved = 0;
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("SEMLocalization", v12);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;
  }
  return v8;
}

- (SEMLocalization)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SEMLocalization)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"l");
  if (v9)
  {
    self = (SEMLocalization *)(id)objc_msgSend_initWithSiriLanguageCode_(self, v7, (uint64_t)v9, v8);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SEMLocalization *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToLocalization = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToLocalization = objc_msgSend_isEqualToLocalization_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToLocalization = 0;
  }

  return isEqualToLocalization;
}

- (BOOL)isEqualToLocalization:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_siriLanguageCode(self, v5, v6, v7);
  v12 = objc_msgSend_siriLanguageCode(v4, v9, v10, v11);
  char isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  return isEqual;
}

- (id)siriLanguageCode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_25C7FF3E0;
  uint64_t v10 = sub_25C7FF3F0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_25C7FF3F8;
  v5[3] = &unk_2654DE7A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)dictationLanguageCodes
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_25C7FF3E0;
  uint64_t v10 = sub_25C7FF3F0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_25C7FF4FC;
  v5[3] = &unk_2654DE7A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)refresh
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7FF5E0;
  block[3] = &unk_2654DE7D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)allLanguageCodes
{
  uint64_t v5 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v6 = objc_msgSend_dictationLanguageCodes(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_setWithSet_(v5, v7, (uint64_t)v6, v8);

  v15 = objc_msgSend_siriLanguageCode(self, v10, v11, v12);
  if (v15) {
    objc_msgSend_addObject_(v9, v13, (uint64_t)v15, v14);
  }

  return v9;
}

+ (id)supportedNSLocaleFromLanguageCode:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_supportedLocaleFromLanguageCode_(v4, v5, (uint64_t)v3, v6);
  uint64_t v9 = sub_25C7FF900(v7, v8);

  return v9;
}

+ (int64_t)supportedLocaleFromLanguageCode:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v5 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v4, @"-", @"_");
  int64_t v6 = sub_25C800A14(v5);

  if (!v6)
  {
    uint64_t v7 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "+[SEMLocalization supportedLocaleFromLanguageCode:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_ERROR, "%s Unsupported language code (%@)", (uint8_t *)&v9, 0x16u);
    }
  }

  return v6;
}

+ (id)supportedLanguageCodeFromLocale:(id)a3
{
  id v3 = a3;
  unint64_t v7 = sub_25C7FFB90(v3, v4, v5, v6);
  if (v7)
  {
    if (v7 >= 0x2D) {
      unsigned __int8 v9 = 0;
    }
    else {
      unsigned __int8 v9 = v7;
    }
    if (v9 <= 0x2Cu) {
      objc_msgSend_stringWithCString_encoding_(NSString, v8, (uint64_t)off_2654DE840[v9], 4);
    }
    else {
    __int16 v11 = objc_msgSend_stringWithCString_encoding_(NSString, v8, (uint64_t)"", 4);
    }
    uint64_t v10 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v11, v12, @"_", @"-");
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (int64_t)locateMorphunAssetForSiriLanguage:(id *)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_25C7FF3E0;
  uint64_t v13 = sub_25C7FF3F0;
  id v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_25C7FFCFC;
  v8[3] = &unk_2654DE7F8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  v8[7] = a4;
  dispatch_sync(queue, v8);
  int64_t v6 = v16[3];
  if (a3 && v6)
  {
    *a3 = (id) v10[5];
    int64_t v6 = v16[3];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)_locateMorphunAssetForLocale:(id)a3 outAssetPath:(id *)a4 error:(id *)a5
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!objc_msgSend_isLocaleEmbedded_(MEMORY[0x263F56678], v9, (uint64_t)v8, v10))
  {
    id v82 = 0;
    uint64_t v17 = objc_msgSend_getAssetPathForLocale_withError_(MEMORY[0x263F56678], v11, (uint64_t)v8, (uint64_t)&v82);
    uint64_t v18 = v82;
    id v12 = v18;
    if (v17)
    {
      v22 = (id)qword_26B3549D8;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v70 = objc_msgSend_localeIdentifier(v8, v23, v24, v25);
        *(_DWORD *)buf = 136315650;
        v86 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        __int16 v87 = 2112;
        v88 = v70;
        __int16 v89 = 2112;
        v90 = v17;
        _os_log_debug_impl(&dword_25C7CA000, v22, OS_LOG_TYPE_DEBUG, "%s Resolved asset path for locale (%@) %@", buf, 0x20u);
      }
      if (!a4) {
        goto LABEL_15;
      }
      v26 = v17;
LABEL_10:
      uint64_t v17 = v26;
      *a4 = v26;
LABEL_15:
      BOOL v16 = 1;
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend_code(v18, v19, v20, v21) == 1)
    {
      v30 = (id)qword_26B3549D8;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v72 = objc_msgSend_localeIdentifier(v8, v31, v32, v33);
        *(_DWORD *)buf = 136315394;
        v86 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        __int16 v87 = 2112;
        v88 = v72;
        _os_log_debug_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_DEBUG, "%s Locale: %@ is unsupported by MorphunAssets - proceeding without asset path", buf, 0x16u);
      }
      uint64_t v17 = 0;
      goto LABEL_15;
    }
    int assetRequestCount = self->_assetRequestCount;
    self->_int assetRequestCount = assetRequestCount + 1;
    if (assetRequestCount)
    {
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v83 = *MEMORY[0x263F08320];
      v37 = NSString;
      v38 = objc_msgSend_localeIdentifier(v8, v27, v28, v29);
      v41 = objc_msgSend_stringWithFormat_(v37, v39, @"Previous attempt to request Morphun asset failed for locale: %@ attempts: %u", v40, v38, self->_assetRequestCount);
      v84 = v41;
      v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v42, (uint64_t)&v84, (uint64_t)&v83, 1);
      v45 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v44, @"com.apple.siri.entitymatcher.tokenization", 2, v43);
      sub_25C81F288(a5, v45);

      int v46 = self->_assetRequestCount;
      v47 = (id)qword_26B3549D8;
      BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
      if (v46 == 2)
      {
        if (v48)
        {
          v52 = objc_msgSend_localeIdentifier(v8, v49, v50, v51);
          *(_DWORD *)buf = 136315394;
          v86 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
          __int16 v87 = 2112;
          v88 = v52;
          _os_log_impl(&dword_25C7CA000, v47, OS_LOG_TYPE_INFO, "%s Issuing a non-blocking MorphunAssets download request for locale: %@", buf, 0x16u);
        }
        v53 = (void *)MEMORY[0x263F56678];
        v79[0] = MEMORY[0x263EF8330];
        v79[1] = 3221225472;
        v79[2] = sub_25C800744;
        v79[3] = &unk_2654DE820;
        id v80 = v8;
        objc_msgSend_onDemandDownloadForLocale_withProgress_withCompletion_(v53, v54, (uint64_t)v80, 0, v79);
      }
      else
      {
        if (v48)
        {
          v69 = objc_msgSend_localeIdentifier(v8, v49, v50, v51);
          *(_DWORD *)buf = 136315394;
          v86 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
          __int16 v87 = 2112;
          v88 = v69;
          _os_log_impl(&dword_25C7CA000, v47, OS_LOG_TYPE_INFO, "%s MorphunAssets download attempts exhausted for locale: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      dispatch_time_t v55 = dispatch_time(0, 60000000000);
      v56 = (id)qword_26B3549D8;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v60 = objc_msgSend_localeIdentifier(v8, v57, v58, v59);
        *(_DWORD *)buf = 136315650;
        v86 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        __int16 v87 = 2112;
        v88 = v60;
        __int16 v89 = 1024;
        LODWORD(v90) = 60;
        _os_log_impl(&dword_25C7CA000, v56, OS_LOG_TYPE_INFO, "%s Issuing a blocking MorphunAssets download request for locale: %@ with timeout of %d s", buf, 0x1Cu);
      }
      v62 = objc_msgSend_blockingOnDemandDownloadForLocale_withTimeout_withProgress_(MEMORY[0x263F56678], v61, (uint64_t)v8, v55, 0);

      if (v62)
      {
        v64 = (id)qword_26B3549D8;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v77 = objc_msgSend_localeIdentifier(v8, v65, v66, v67);
          *(_DWORD *)buf = 136315650;
          v86 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
          __int16 v87 = 2112;
          v88 = v77;
          __int16 v89 = 2112;
          v90 = v62;
          _os_log_error_impl(&dword_25C7CA000, v64, OS_LOG_TYPE_ERROR, "%s MorphunAssets download request failed for locale: %@ error: %@", buf, 0x20u);
        }
        sub_25C81F288(a5, v62);
        uint64_t v17 = 0;
        BOOL v16 = 0;
        id v12 = v62;
        goto LABEL_16;
      }
      id v81 = 0;
      v71 = objc_msgSend_getAssetPathForLocale_withError_(MEMORY[0x263F56678], v63, (uint64_t)v8, (uint64_t)&v81);
      id v12 = v81;
      if (v71)
      {
        if (!a4)
        {
          BOOL v16 = 1;
          uint64_t v17 = v71;
          goto LABEL_16;
        }
        v26 = v71;
        goto LABEL_10;
      }
      v73 = (id)qword_26B3549D8;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        v78 = objc_msgSend_localeIdentifier(v8, v74, v75, v76);
        *(_DWORD *)buf = 136315650;
        v86 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        __int16 v87 = 2112;
        v88 = v78;
        __int16 v89 = 2112;
        v90 = v12;
        _os_log_error_impl(&dword_25C7CA000, v73, OS_LOG_TYPE_ERROR, "%s Failed to get asset path for locale: %@ after download. error: %@", buf, 0x20u);
      }
      sub_25C81F288(a5, v12);
    }
    uint64_t v17 = 0;
    BOOL v16 = 0;
    goto LABEL_16;
  }
  id v12 = (id)qword_26B3549D8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v68 = objc_msgSend_localeIdentifier(v8, v13, v14, v15);
    *(_DWORD *)buf = 136315394;
    v86 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
    __int16 v87 = 2112;
    v88 = v68;
    _os_log_debug_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_DEBUG, "%s Locale %@ is embedded.", buf, 0x16u);
  }
  BOOL v16 = 1;
LABEL_17:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedAssetPath, 0);
  objc_storeStrong((id *)&self->_dictationLanguageCodes, 0);
  objc_storeStrong((id *)&self->_siriLanguageCode, 0);
}

@end