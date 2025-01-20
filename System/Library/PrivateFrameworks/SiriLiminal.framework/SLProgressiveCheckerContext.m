@interface SLProgressiveCheckerContext
- (NSDictionary)vtei;
- (NSString)locale;
- (SLProgressiveCheckerContext)initWithContext:(id)a3 error:(id *)a4;
- (unint64_t)audioOption;
- (unint64_t)invocationType;
@end

@implementation SLProgressiveCheckerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_vtei, 0);
}

- (NSString)locale
{
  return self->_locale;
}

- (unint64_t)invocationType
{
  return self->_invocationType;
}

- (NSDictionary)vtei
{
  return self->_vtei;
}

- (unint64_t)audioOption
{
  return self->_audioOption;
}

- (SLProgressiveCheckerContext)initWithContext:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SLProgressiveCheckerContext;
  v7 = [(SLProgressiveCheckerContext *)&v28 init];
  if (!v7)
  {
LABEL_19:
    v18 = v7;
    goto LABEL_20;
  }
  if (SLLogInitIfNeeded_once != -1) {
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"SLInvocationType"];
  if (v8)
  {
    v9 = (void *)v8;
    uint64_t v10 = [v6 objectForKeyedSubscript:@"SLAudioSourceOption"];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [v6 objectForKeyedSubscript:@"SLLanguageCode"];

      if (v12) {
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  v13 = [NSString stringWithFormat:@"Missing keys in context"];
  v14 = v13;
  if (!a4)
  {

LABEL_14:
    v19 = [v6 objectForKeyedSubscript:@"SLAudioSourceOption"];
    v7->_audioOption = [v19 unsignedIntegerValue];

    v20 = [v6 objectForKeyedSubscript:@"SLInvocationType"];
    v7->_invocationType = [v20 unsignedIntegerValue];

    uint64_t v21 = [v6 objectForKeyedSubscript:@"SLLanguageCode"];
    locale = v7->_locale;
    v7->_locale = (NSString *)v21;

    v23 = [v6 objectForKeyedSubscript:@"SLVoiceTriggerEventInfo"];
    if (v23)
    {
      uint64_t v24 = [v6 objectForKeyedSubscript:@"SLVoiceTriggerEventInfo"];
      vtei = v7->_vtei;
      v7->_vtei = (NSDictionary *)v24;
    }
    else
    {
      vtei = v7->_vtei;
      v7->_vtei = 0;
    }

    v26 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SLProgressiveCheckerContext initWithContext:error:]";
      __int16 v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_21EFF4000, v26, OS_LOG_TYPE_INFO, "%s Created SLAcousticContext: %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  v15 = (void *)MEMORY[0x263F087E8];
  v33 = @"reason";
  v34[0] = v13;
  v16 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
  *a4 = [v15 errorWithDomain:@"com.apple.sl" code:102 userInfo:v16];

  v17 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[SLProgressiveCheckerContext initWithContext:error:]";
    __int16 v31 = 2114;
    v32 = v14;
    _os_log_error_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }

  v18 = 0;
LABEL_20:

  return v18;
}

@end