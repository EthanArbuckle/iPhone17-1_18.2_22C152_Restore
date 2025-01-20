@interface SRUIFAddViewsDurationProvider
+ (double)fetchMinimumDurationFromDefaults;
+ (double)internalDurationOverride;
+ (double)minimumDisplayDurationForAddViews:(id)a3;
+ (id)userDefaults;
+ (int64_t)_numberOfWordsInString:(id)a3;
@end

@implementation SRUIFAddViewsDurationProvider

+ (double)minimumDisplayDurationForAddViews:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F284E0];
  v6 = [v4 dialogPhase];
  v7 = [v5 dialogPhaseForAceDialogPhase:v6];

  double v8 = 0.0;
  if ([v7 isExpository]) {
    goto LABEL_30;
  }
  v9 = [v4 views];
  uint64_t v10 = [v9 count];

  if (!v10) {
    goto LABEL_30;
  }
  [a1 internalDurationOverride];
  double v8 = v11;
  if (v11 != 9.22337204e18) {
    goto LABEL_30;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [v4 views];
  uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (!v12)
  {
    uint64_t v14 = 0;
    goto LABEL_23;
  }
  uint64_t v13 = v12;
  uint64_t v14 = 0;
  uint64_t v32 = *(void *)v34;
  double v8 = 0.0;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v34 != v32) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      v17 = [v16 listenAfterSpeaking];
      char v18 = [v17 BOOLValue];

      if (v18 & 1) != 0 || (objc_msgSend(v16, "sruif_hasButton")) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [v16 postDialogDelayInMilliseconds];

        if (v19)
        {
          v28 = [v16 postDialogDelayInMilliseconds];
          [v28 doubleValue];
          double v8 = v29 / 1000.0;

LABEL_29:
          goto LABEL_30;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v16 text], v20 = objc_claimAutoreleasedReturnValue(), v20, v20))
      {
        uint64_t v21 = [v16 text];
      }
      else
      {
        v22 = [v16 speakableText];

        if (!v22) {
          continue;
        }
        uint64_t v21 = [v16 speakableText];
      }
      v23 = (void *)v21;
      v14 += [a1 _numberOfWordsInString:v21];
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_23:

  double v24 = fmin((double)v14 / 2.83333333, 4.0);
  if (v24 >= 1.0) {
    double v8 = v24;
  }
  else {
    double v8 = 1.0;
  }
  v25 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    v27 = [v4 aceId];
    *(_DWORD *)buf = 136315906;
    v38 = "+[SRUIFAddViewsDurationProvider minimumDisplayDurationForAddViews:]";
    __int16 v39 = 2048;
    uint64_t v40 = v14;
    __int16 v41 = 2112;
    v42 = v27;
    __int16 v43 = 2048;
    double v44 = v8;
    _os_log_impl(&dword_225FBA000, v26, OS_LOG_TYPE_DEFAULT, "%s %li words in AddViews command:%@. Returning a minimum display duration of %f", buf, 0x2Au);
  }
LABEL_30:

  return v8;
}

+ (double)internalDurationOverride
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SRUIFAddViewsDurationProvider_internalDurationOverride__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (internalDurationOverride_onceToken != -1) {
    dispatch_once(&internalDurationOverride_onceToken, block);
  }
  return *(double *)&internalDurationOverride_duration;
}

uint64_t __57__SRUIFAddViewsDurationProvider_internalDurationOverride__block_invoke(uint64_t a1)
{
  uint64_t result = AFIsInternalInstall();
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) fetchMinimumDurationFromDefaults];
  }
  else {
    uint64_t v3 = 0x43E0000000000000;
  }
  internalDurationOverride_duration = v3;
  return result;
}

+ (double)fetchMinimumDurationFromDefaults
{
  v2 = [a1 userDefaults];
  uint64_t v3 = [v2 objectForKey:@"MinimumDurationForAddViews"];

  if (v3)
  {
    [v2 doubleForKey:@"MinimumDurationForAddViews"];
    double v5 = v4;
  }
  else
  {
    double v5 = 9.22337204e18;
  }

  return v5;
}

+ (id)userDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.internal"];
  return v2;
}

+ (int64_t)_numberOfWordsInString:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  uint64_t v4 = [v3 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SRUIFAddViewsDurationProvider__numberOfWordsInString___block_invoke;
  v7[3] = &unk_264785AC8;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 3, v7);
  int64_t v5 = *((int *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __56__SRUIFAddViewsDurationProvider__numberOfWordsInString___block_invoke(uint64_t result)
{
  return result;
}

@end