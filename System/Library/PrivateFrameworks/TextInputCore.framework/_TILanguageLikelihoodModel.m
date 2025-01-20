@interface _TILanguageLikelihoodModel
+ (id)sharedLanguageLikelihoodModel;
+ (id)singletonInstance;
+ (void)setSharedLanguageLikelihoodModel:(id)a3;
- (_TILanguageLikelihoodModel)init;
- (double)lastOfflineAdaptationTimeForApp:(id)a3;
- (id)rankedLanguagesForRecipient:(id)a3;
- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4;
- (void)addEvidence:(id)a3 timestamp:(double)a4 adaptationType:(int)a5 forRecipient:(id)a6 app:(id)a7 language:(id)a8;
- (void)languageLikelihoodModelRef;
- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5;
@end

@implementation _TILanguageLikelihoodModel

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  id v5 = a3;
  uint64_t EmojiUsageCountForApp = [(_TILanguageLikelihoodModel *)self languageLikelihoodModelRef];
  if (EmojiUsageCountForApp) {
    uint64_t EmojiUsageCountForApp = LMLanguageLikelihoodModelGetEmojiUsageCountForApp();
  }
  unint64_t v7 = EmojiUsageCountForApp & ~(EmojiUsageCountForApp >> 63);

  return v7;
}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  if ([(_TILanguageLikelihoodModel *)self languageLikelihoodModelRef])
  {
    LMLanguageLikelihoodModelGetLastOfflineAdaptationTime();
    double Current = v6;
  }

  return Current;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, char *, float))a5;
  if ([(_TILanguageLikelihoodModel *)self languageLikelihoodModelRef])
  {
    char v38 = 0;
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v28 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          [v11 setObject:&unk_1F3FA7C58 forKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v14);
    }

    id v29 = v9;
    LMLanguageLikelihoodModelGetLanguagePriorProbabilities();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v12;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
LABEL_11:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * v21);
        v23 = [v11 objectForKey:v22];
        [v23 floatValue];
        float v25 = v24;

        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          v26 = TIOSLogFacility();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v27 = [NSString stringWithFormat:@"%s Pr(language=%@|recipient=%@) = %.3g", "-[_TILanguageLikelihoodModel priorProbabilityForLanguages:recipient:handler:]", v22, v29, v25];
            *(_DWORD *)buf = 138412290;
            v40 = v27;
            _os_log_debug_impl(&dword_1E3F0E000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        v10[2](v10, v22, &v38, v25);
        if (v38) {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v41 count:16];
          if (v19) {
            goto LABEL_11;
          }
          break;
        }
      }
    }

    id v8 = v28;
    id v9 = v29;
  }
}

- (id)rankedLanguagesForRecipient:(id)a3
{
  id v4 = a3;
  if ([(_TILanguageLikelihoodModel *)self languageLikelihoodModelRef])
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    LMLanguageLikelihoodModelGetLanguagePriorProbabilities();
    double v6 = [v5 allKeys];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58___TILanguageLikelihoodModel_rankedLanguagesForRecipient___block_invoke;
    v10[3] = &unk_1E6E2CD78;
    id v11 = v5;
    id v7 = v5;
    id v8 = [v6 sortedArrayUsingComparator:v10];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)addEvidence:(id)a3 timestamp:(double)a4 adaptationType:(int)a5 forRecipient:(id)a6 app:(id)a7 language:(id)a8
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel)
  {
    uint64_t v14 = TIOSLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = [NSString stringWithFormat:@"%s [recipient=%@, app=%@] evidence = \"%@\", "-[_TILanguageLikelihoodModel addEvidence:timestamp:adaptationType:forRecipient:app:language:]"", v12, v13, v11];
      *(_DWORD *)buf = 138412290;
      id v17 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  if ([(_TILanguageLikelihoodModel *)self languageLikelihoodModelRef]) {
    LMLanguageLikelihoodModelAddEvidenceForLanguage();
  }
}

- (void)languageLikelihoodModelRef
{
  if (!TI_DEVICE_UNLOCKED_SINCE_BOOT()) {
    return 0;
  }
  result = self->_languageLikelihoodModelRef;
  if (!result)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    id v5 = (const void *)TI_KB_USER_DIRECTORY();
    if (v5) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F72378], v5);
    }
    result = (void *)LMLanguageLikelihoodModelGetUserModel();
    self->_languageLikelihoodModelRef = result;
    if (Mutable)
    {
      CFRelease(Mutable);
      return self->_languageLikelihoodModelRef;
    }
  }
  return result;
}

- (_TILanguageLikelihoodModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TILanguageLikelihoodModel;
  return [(_TILanguageLikelihoodModel *)&v3 init];
}

+ (id)singletonInstance
{
  if (+[_TILanguageLikelihoodModel singletonInstance]::onceToken != -1) {
    dispatch_once(&+[_TILanguageLikelihoodModel singletonInstance]::onceToken, &__block_literal_global_15799);
  }
  v2 = (void *)+[_TILanguageLikelihoodModel singletonInstance]::singletonInstance;

  return v2;
}

+ (id)sharedLanguageLikelihoodModel
{
  if (__testingInstance)
  {
    id v2 = (id)__testingInstance;
  }
  else
  {
    id v2 = +[_TILanguageLikelihoodModel singletonInstance];
  }

  return v2;
}

+ (void)setSharedLanguageLikelihoodModel:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance, a3);
    id v4 = v5;
  }
}

@end