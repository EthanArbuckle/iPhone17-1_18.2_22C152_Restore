@interface SEMG2PExecutor
- (BOOL)isJit;
- (NSString)locale;
- (SEMG2PExecutor)initWithLocale:(id)a3 isJit:(BOOL)a4;
- (_EARUserProfileBuilder)user_profile;
- (id)getAssetPath;
- (id)pronunciationsForOrthography:(id)a3;
- (void)setupUserProfile;
@end

@implementation SEMG2PExecutor

- (SEMG2PExecutor)initWithLocale:(id)a3 isJit:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SEMG2PExecutor;
  v8 = [(SEMG2PExecutor *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->_isJit = a4;
    objc_msgSend_setupUserProfile(v9, v10, v11, v12);
  }

  return v9;
}

- (id)getAssetPath
{
  id v3 = objc_alloc(MEMORY[0x263F17B60]);
  v5 = objc_msgSend_initWithLanguage_assetType_(v3, v4, (uint64_t)self->_locale, 3);
  v9 = objc_msgSend_sharedInstance(MEMORY[0x263F17B68], v6, v7, v8);
  uint64_t v12 = objc_msgSend_installedAssetWithConfig_(v9, v10, (uint64_t)v5, v11);

  return v12;
}

- (id)pronunciationsForOrthography:(id)a3
{
  v4 = objc_msgSend_pronunciationsForOrthography_(self->_user_profile, a2, (uint64_t)a3, v3);
  return v4;
}

- (void)setupUserProfile
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (!self->_user_profile)
  {
    v5 = objc_msgSend_getAssetPath(self, a2, v2, v3);
    if (objc_msgSend_length(v5, v6, v7, v8))
    {
      uint64_t v11 = objc_msgSend_stringByAppendingPathComponent_(v5, v9, @"mini.json", v10);
      objc_super v14 = objc_msgSend_stringByAppendingPathComponent_(v5, v12, @"ncs", v13);
      v17 = objc_msgSend_stringWithFormat_(NSString, v15, @"%@_napg.json", v16, self->_locale);
      v20 = objc_msgSend_stringByAppendingPathComponent_(v14, v18, (uint64_t)v17, v19);

      v23 = objc_msgSend_stringByAppendingPathComponent_(v14, v21, @"vocdelta.voc", v22);
      v26 = objc_msgSend_stringByAppendingPathComponent_(v14, v24, @"pg.voc", v25);
      v29 = objc_msgSend_stringByAppendingPathComponent_(v14, v27, @"mrec.psh", v28);
      id v30 = objc_alloc(MEMORY[0x263F3B430]);
      BOOL isJit = self->_isJit;
      v32 = (_EARUserProfileBuilder *)objc_msgSend_initWithConfiguration_language_overrides_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_isJit_(v30, v31, (uint64_t)v11, (uint64_t)self->_locale, 0, v20, v23, v26, v29, isJit);
      user_profile = self->_user_profile;
      self->_user_profile = v32;
    }
    else
    {
      v34 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[SEMG2PExecutor setupUserProfile]";
        _os_log_error_impl(&dword_25C7CA000, v34, OS_LOG_TYPE_ERROR, "%s G2P asset path is empty.", buf, 0xCu);
      }
      v35 = self->_user_profile;
      self->_user_profile = 0;
    }
  }
}

- (NSString)locale
{
  return self->_locale;
}

- (BOOL)isJit
{
  return self->_isJit;
}

- (_EARUserProfileBuilder)user_profile
{
  return self->_user_profile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user_profile, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end