@interface UAFAssetStatus
+ (BOOL)dictationAvailableForLanguage:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)mockAssetStatus;
+ (id)stringFromUAFAssetState:(unint64_t)a3;
- (NSNumber)value;
- (NSString)siriLanguage;
- (UAFAssetStatus)initWithCoder:(id)a3;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setSiriLanguage:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation UAFAssetStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)mockAssetStatus
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!+[UAFCommonUtilities isInternalInstall])
  {
    v9 = 0;
    goto LABEL_24;
  }
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.siri.asset"];

  v4 = [v3 objectForKey:@"Mock Download State"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [v4 description];
        int v12 = 136315394;
        v13 = "+[UAFAssetStatus mockAssetStatus]";
        __int16 v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings Using mock download state: %@", (uint8_t *)&v12, 0x16u);
      }
      if ([v4 isEqualToString:@"NotStarted"])
      {
        v7 = 0;
        uint64_t v8 = 2;
LABEL_22:
        v9 = objc_alloc_init(UAFAssetStatus);
        [(UAFAssetStatus *)v9 setState:v8];
        [(UAFAssetStatus *)v9 setValue:v7];

        goto LABEL_23;
      }
      if ([v4 isEqualToString:@"Downloading"])
      {
        id v10 = [v3 objectForKey:@"Mock Progress"];
        if (!v10)
        {
          v7 = 0;
          uint64_t v8 = 3;
          goto LABEL_21;
        }
        objc_opt_class();
        uint64_t v8 = 3;
        if (objc_opt_isKindOfClass()) {
          goto LABEL_13;
        }
      }
      else
      {
        if ([v4 isEqualToString:@"Finished"])
        {
          v7 = 0;
          uint64_t v8 = 5;
          goto LABEL_22;
        }
        if (![v4 isEqualToString:@"OutOfSpace"])
        {
          v7 = 0;
          uint64_t v8 = 0;
          goto LABEL_22;
        }
        id v10 = [v3 objectForKey:@"Mock Space Required"];
        if (!v10)
        {
          v7 = 0;
          uint64_t v8 = 6;
          goto LABEL_21;
        }
        objc_opt_class();
        uint64_t v8 = 6;
        if (objc_opt_isKindOfClass())
        {
LABEL_13:
          id v10 = v10;
          v7 = v10;
LABEL_21:

          goto LABEL_22;
        }
      }
      v7 = 0;
      goto LABEL_21;
    }
  }
  v9 = 0;
LABEL_23:

LABEL_24:

  return v9;
}

+ (id)stringFromUAFAssetState:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"UAFAssetStateUnknown";
  }
  else {
    return off_264CEB880[a3 - 1];
  }
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"state"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (UAFAssetStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UAFAssetStatus;
  id v5 = [(UAFAssetStatus *)&v9 init];
  if (v5)
  {
    v5->_unint64_t state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v6 = [v4 decodeObjectForKey:@"value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v6;
  }
  return v5;
}

+ (BOOL)dictationAvailableForLanguage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Checking to see if on-device dictation assets are available for %{public}@", buf, 0x16u);
    }

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v7 = (void *)_MergedGlobals_6;
    uint64_t v29 = _MergedGlobals_6;
    if (!_MergedGlobals_6)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAFPreferencesClass_block_invoke_0;
      v31 = &unk_264CEAD58;
      v32 = &v26;
      __getAFPreferencesClass_block_invoke_0((uint64_t)buf);
      v7 = (void *)v27[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v26, 8);
    objc_super v9 = [v8 sharedPreferences];
    id v10 = [v9 offlineDictationStatus];
    v11 = v10;
    if (!v10)
    {
      int v12 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
        _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s #settings offlineDictationStatus is nil!", buf, 0xCu);
      }
      char v18 = 0;
      goto LABEL_40;
    }
    int v12 = [v10 objectForKeyedSubscript:v5];
    if (!v12)
    {
      uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v5;
        _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s #settings offlineDictationStatusForLanguage is nil for %{public}@!", buf, 0x16u);
      }
      char v18 = 0;
      goto LABEL_39;
    }
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    v13 = (void *)qword_26AF0BA00;
    uint64_t v29 = qword_26AF0BA00;
    if (!qword_26AF0BA00)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAFOfflineDictationStatusHighQualityKeySymbolLoc_block_invoke;
      v31 = &unk_264CEAD58;
      v32 = &v26;
      __int16 v14 = (void *)AssistantServicesLibrary_3();
      v15 = dlsym(v14, "AFOfflineDictationStatusHighQualityKey");
      *(void *)(v32[1] + 24) = v15;
      qword_26AF0BA00 = *(void *)(v32[1] + 24);
      v13 = (void *)v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (v13)
    {
      uint64_t v16 = [v12 objectForKeyedSubscript:*v13];
      if (!v16)
      {
        v19 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v5;
          _os_log_error_impl(&dword_23797A000, v19, OS_LOG_TYPE_ERROR, "%s #settings isHighQualityValue is nil for %{public}@!", buf, 0x16u);
        }
        goto LABEL_35;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v17 = [v16 BOOLValue];
      }
      else {
        char v17 = 0;
      }
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      v20 = (void *)qword_26AF0BA08;
      uint64_t v29 = qword_26AF0BA08;
      if (!qword_26AF0BA08)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAFOfflineDictationStatusInstalledKeySymbolLoc_block_invoke;
        v31 = &unk_264CEAD58;
        v32 = &v26;
        v21 = (void *)AssistantServicesLibrary_3();
        v22 = dlsym(v21, "AFOfflineDictationStatusInstalledKey");
        *(void *)(v32[1] + 24) = v22;
        qword_26AF0BA08 = *(void *)(v32[1] + 24);
        v20 = (void *)v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (v20)
      {
        v19 = [v12 objectForKeyedSubscript:*v20];
        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v23 = [v19 BOOLValue];
          }
          else {
            char v23 = 0;
          }
          char v18 = v17 & v23;
          goto LABEL_38;
        }
        v24 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v5;
          _os_log_error_impl(&dword_23797A000, v24, OS_LOG_TYPE_ERROR, "%s #settings isInstalledValue is nil for %{public}@!", buf, 0x16u);
        }

        v19 = 0;
LABEL_35:
        char v18 = 0;
LABEL_38:

LABEL_39:
LABEL_40:

        goto LABEL_41;
      }
    }
    dlerror();
    abort_report_np();
    __break(1u);
  }
  id v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "+[UAFAssetStatus dictationAvailableForLanguage:]";
    _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s #settings dictation language is nil!", buf, 0xCu);
  }
  char v18 = 0;
LABEL_41:

  return v18;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)siriLanguage
{
  return self->_siriLanguage;
}

- (void)setSiriLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriLanguage, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end