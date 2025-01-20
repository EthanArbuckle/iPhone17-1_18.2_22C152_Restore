@interface CRLanguageResources
+ (BOOL)isCharLMForLanguageAvailableInTextRecognition:(id)a3;
+ (BOOL)isCustomWordsSupportedForLanguageIdentifier:(id)a3;
+ (BOOL)isLanguageSupported:(id)a3;
+ (CVNLPLanguageModel)createCVNLPCharacterLanguageModel:(id)a3;
+ (_LXLexicon)createStaticLexicon:(id)a3;
+ (void)createCharacterModel:(id)a3;
+ (void)createWordLanguageModel:(id)a3 type:(int64_t)a4;
- (BOOL)isCustomWordsSupported;
- (CRLanguageResources)initWithLanguageIdentifier:(id)a3 type:(int64_t)a4;
- (CVNLPLanguageModel)cvnlpCharacterLanguageModel;
- (CVNLPLanguageResourceBundle)_cvnlpLanguageResourceBundle;
- (NSLocale)locale;
- (_LXLexicon)staticLexicon;
- (id)cvnlpLanguageResourceBundle:(id)a3 lmConfig:(id)a4;
- (void)dealloc;
- (void)lmCharacterLanguageModel;
- (void)set_cvnlpLanguageResourceBundle:(id)a3;
- (void)wordLanguageModel;
- (void)wordTokenizer;
@end

@implementation CRLanguageResources

- (CRLanguageResources)initWithLanguageIdentifier:(id)a3 type:(int64_t)a4
{
  v6 = (__CFString *)a3;
  v25.receiver = self;
  v25.super_class = (Class)CRLanguageResources;
  v7 = [(CRLanguageResources *)&v25 init];
  if (!v7) {
    goto LABEL_30;
  }
  if ([(id)objc_opt_class() isLanguageSupported:v6])
  {
    if ([(__CFString *)v6 isEqualToString:@"yue-Hans"])
    {
      v8 = CRImageReaderLanguageZh_Hans;
    }
    else
    {
      if (![(__CFString *)v6 isEqualToString:@"yue-Hant"]) {
        goto LABEL_9;
      }
      v8 = CRImageReaderLanguageZh_Hant;
    }
    v10 = *v8;

    v6 = v10;
LABEL_9:
    uint64_t v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v6];
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v11;

    cvnlpLanguageResourceBundle = v7->__cvnlpLanguageResourceBundle;
    v7->__cvnlpLanguageResourceBundle = 0;

    if (+[CRImageReader languageIsChinese:v6])
    {
      v14 = objc_opt_class();
      v15 = [(NSLocale *)v7->_locale localeIdentifier];
      v7->_cvnlpCharacterLanguageModel = (CVNLPLanguageModel *)[v14 createCVNLPCharacterLanguageModel:v15];

      v7->_lmCharacterLanguageModel = 0;
      v7->_wordTokenizer = 0;
      v7->_staticLexicon = 0;
LABEL_11:
      v7->_wordLanguageModel = 0;
LABEL_30:
      v9 = v7;
      goto LABEL_31;
    }
    if (a4 == 2)
    {
      v7->_cvnlpCharacterLanguageModel = 0;
      v7->_staticLexicon = 0;
      if (!+[CRImageReader languageIsKorean:v6]
        && !+[CRImageReader languageIsJapanese:v6]
        && !+[CRImageReader languageIsThai:v6])
      {
        v7->_wordLanguageModel = (void *)[(id)objc_opt_class() createWordLanguageModel:v7->_locale type:2];
        v7->_wordTokenizer = (void *)LMStreamTokenizerCreate();
        v7->_lmCharacterLanguageModel = 0;
        goto LABEL_30;
      }
      v16 = objc_opt_class();
      v17 = [(NSLocale *)v7->_locale localeIdentifier];
      v7->_lmCharacterLanguageModel = (void *)[v16 createCharacterModel:v17];

      v7->_wordTokenizer = 0;
      goto LABEL_11;
    }
    if (a4 == 1)
    {
      v7->_lmCharacterLanguageModel = 0;
      v7->_staticLexicon = 0;
      v7->_wordLanguageModel = 0;
      if (!+[CRImageReader languageIsVietnamese:v6])
      {
        v18 = objc_opt_class();
        v19 = [(NSLocale *)v7->_locale localeIdentifier];
        v7->_cvnlpCharacterLanguageModel = (CVNLPLanguageModel *)[v18 createCVNLPCharacterLanguageModel:v19];

LABEL_29:
        v7->_wordTokenizer = 0;
        goto LABEL_30;
      }
    }
    else
    {
      if (a4) {
        goto LABEL_30;
      }
      if (+[CRImageReader languageIsVietnamese:v6])
      {
        v7->_lmCharacterLanguageModel = 0;
      }
      else
      {
        v20 = objc_opt_class();
        v21 = [(NSLocale *)v7->_locale localeIdentifier];
        v7->_lmCharacterLanguageModel = (void *)[v20 createCharacterModel:v21];
      }
      if (+[CRImageReader languageIsKorean:v6]
        || +[CRImageReader languageIsJapanese:v6])
      {
        v7->_staticLexicon = 0;
        v7->_wordLanguageModel = 0;
      }
      else
      {
        v22 = objc_opt_class();
        v23 = [(NSLocale *)v7->_locale languageCode];
        v7->_staticLexicon = (_LXLexicon *)[v22 createStaticLexicon:v23];

        v7->_wordLanguageModel = (void *)[(id)objc_opt_class() createWordLanguageModel:v7->_locale type:0];
      }
    }
    v7->_cvnlpCharacterLanguageModel = 0;
    goto LABEL_29;
  }
  v9 = 0;
LABEL_31:

  return v9;
}

+ (BOOL)isCustomWordsSupportedForLanguageIdentifier:(id)a3
{
  id v3 = a3;
  if (+[CRImageReader languageIsChinese:v3]
    || +[CRImageReader languageIsKorean:v3])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v4 = !+[CRImageReader languageIsJapanese:v3];
  }

  return v4;
}

- (BOOL)isCustomWordsSupported
{
  id v3 = objc_opt_class();
  BOOL v4 = [(CRLanguageResources *)self locale];
  v5 = [v4 localeIdentifier];
  LOBYTE(v3) = [v3 isCustomWordsSupportedForLanguageIdentifier:v5];

  return (char)v3;
}

- (id)cvnlpLanguageResourceBundle:(id)a3 lmConfig:(id)a4
{
  id v41 = a3;
  id v6 = a4;
  v7 = [(CRLanguageResources *)self _cvnlpLanguageResourceBundle];

  if (!v7)
  {
    if ([(CRLanguageResources *)self staticLexicon])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F56760]), "initWithLexicon:", -[CRLanguageResources staticLexicon](self, "staticLexicon"));
      [v8 addObject:v9];

      id v10 = v8;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = objc_opt_class();
    v12 = [(CRLanguageResources *)self locale];
    v13 = [v12 localeIdentifier];
    LODWORD(v11) = [v11 isCustomWordsSupportedForLanguageIdentifier:v13];

    if (v11)
    {
      v14 = [v41 customWords];

      if (v14)
      {
        v15 = [v41 customWords];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
          v17 = [v15 filteredArrayUsingPredicate:v16];
          if ([v17 count])
          {
            v18 = [(CRLanguageResources *)self locale];
            CFTypeRef cf = +[CRLanguageUtils createDynamicLexicon:v17 forLocale:v18 error:0];

            v19 = (void *)[objc_alloc(MEMORY[0x1E4F56760]) initWithLexicon:cf];
            if (!v10) {
              id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [v10 addObject:v19];

            if (cf) {
              CFRelease(cf);
            }
          }
          else
          {
            v20 = CROSLogForCategory(0);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_ERROR, "Custom words array can only contain strings. Ignoring custom words array.", buf, 2u);
            }
          }
        }
      }
    }
    v21 = v10;
    if (v10)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F56768]);
      v23 = [v6 lexiconWeight];
      v24 = (void *)[v22 initWithLexicons:v10 decodingWeight:v23];
    }
    else
    {
      v24 = 0;
    }
    if ([(CRLanguageResources *)self lmCharacterLanguageModel])
    {
      id v25 = objc_alloc(MEMORY[0x1E4F56758]);
      v26 = [(CRLanguageResources *)self lmCharacterLanguageModel];
      v27 = [(CRLanguageResources *)self locale];
      v28 = [v6 characterLMWeight];
      uint64_t v29 = [v25 initWithLMLanguageModel:v26 locale:v27 decodingWeight:v28];
    }
    else
    {
      if (![(CRLanguageResources *)self cvnlpCharacterLanguageModel])
      {
        v32 = 0;
        goto LABEL_26;
      }
      id v30 = objc_alloc(MEMORY[0x1E4F56758]);
      v31 = [(CRLanguageResources *)self cvnlpCharacterLanguageModel];
      v27 = [(CRLanguageResources *)self locale];
      v28 = [v6 characterLMWeight];
      uint64_t v29 = [v30 initWithCVNLPLanguageModel:v31 locale:v27 decodingWeight:v28];
    }
    v32 = (void *)v29;

LABEL_26:
    if ([(CRLanguageResources *)self wordLanguageModel])
    {
      id v33 = objc_alloc(MEMORY[0x1E4F56758]);
      v34 = [(CRLanguageResources *)self wordLanguageModel];
      v35 = [(CRLanguageResources *)self locale];
      v36 = [v6 wordLMWeight];
      v37 = (void *)[v33 initWithLMLanguageModel:v34 locale:v35 decodingWeight:v36];
    }
    else
    {
      v37 = 0;
    }
    v38 = (void *)[objc_alloc(MEMORY[0x1E4F56770]) initWithLexicons:v24 characterLanguageModel:v32 wordLanguageModel:v37];
    [(CRLanguageResources *)self set_cvnlpLanguageResourceBundle:v38];
  }
  v39 = [(CRLanguageResources *)self _cvnlpLanguageResourceBundle];

  return v39;
}

+ (void)createCharacterModel:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:");
  id v3 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  v32 = [(NSLocale *)v3 languageCode];
  BOOL v4 = [(NSLocale *)v3 countryCode];
  v31 = [v4 uppercaseString];

  if (![(id)objc_opt_class() isCharLMForLanguageAvailableInTextRecognition:v32])
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = v3;
    id v33 = v12;
    LDEnumerateAssetDataItems();
    v13 = [(NSLocale *)v12 localeIdentifier];
    v14 = [v5 objectForKey:v13];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      v17 = [(NSLocale *)v12 languageCode];
      v18 = [v5 objectForKey:v17];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        id v8 = 0;
        uint64_t v11 = 0;
        goto LABEL_14;
      }
      id v8 = [(NSLocale *)v12 languageCode];
      uint64_t v16 = [v5 objectForKey:v8];
    }
    else
    {
      id v8 = [(NSLocale *)v12 localeIdentifier];
      uint64_t v16 = [v5 objectForKey:v8];
    }
    uint64_t v11 = (void *)v16;
LABEL_14:

    id v7 = v5;
    goto LABEL_15;
  }
  id v5 = [NSString stringWithFormat:@"%@_%@", v32, v31];
  id v6 = [v5 stringByAppendingPathExtension:@"lm"];
  bzero(v38, 0x400uLL);
  id v7 = v6;
  if (!pathForResource((const char *)[v7 cStringUsingEncoding:4], 0, v38))
  {
    id v10 = CROSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v7;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEFAULT, "Resource path not found for '%@'. Character LM will be disabled.", buf, 0xCu);
    }
    id v8 = 0;
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  id v8 = firstMatchingResourceForLocale(v3, &stru_1F38EED68.isa, &cfstr_Lm.isa, v38);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F1CB10];
    id v10 = [NSString stringWithUTF8String:v38];
    uint64_t v11 = [v9 fileURLWithPath:v10];
LABEL_10:

    goto LABEL_15;
  }
  uint64_t v11 = 0;
LABEL_15:

  if (v11)
  {
    v20 = [v11 path];
    v21 = [v20 lastPathComponent];
    id v22 = [v21 stringByDeletingPathExtension];

    v23 = [v20 stringByDeletingLastPathComponent];
    uint64_t v24 = *MEMORY[0x1E4F72358];
    v34[0] = *MEMORY[0x1E4F723C8];
    v34[1] = v24;
    v35[0] = v8;
    v35[1] = MEMORY[0x1E4F1CC28];
    uint64_t v25 = *MEMORY[0x1E4F72370];
    v34[2] = *MEMORY[0x1E4F72380];
    v34[3] = v25;
    v35[2] = v23;
    v35[3] = v22;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v27 = (void *)LMLanguageModelCreate();
    if (!v27)
    {
      v28 = CROSLogForCategory(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v38 = 138412290;
        v39 = v8;
        _os_log_impl(&dword_1DD733000, v28, OS_LOG_TYPE_DEFAULT, "Unable to load character LM for language '%@'", v38, 0xCu);
      }
    }
  }
  else
  {
    v20 = CROSLogForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v38 = 138412546;
      v39 = v8;
      __int16 v40 = 2112;
      id v41 = v30;
      _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_DEFAULT, "Resource not found for '%@'. Character LM will be disabled for locale '%@'", v38, 0x16u);
    }
    v27 = 0;
  }

  return v27;
}

void __44__CRLanguageResources_createCharacterModel___block_invoke(uint64_t a1, void *a2, int a3, void *a4, CFStringRef theString1, unsigned char *a6)
{
  if (CFEqual(theString1, (CFStringRef)*MEMORY[0x1E4F724A8]))
  {
    id v17 = a2;
    id v10 = [v17 lastPathComponent];
    int v11 = [v10 isEqualToString:@"char.lm"];

    if (v11)
    {
      id v12 = a4;
      v13 = *(void **)(a1 + 32);
      v14 = [v12 localeIdentifier];
      [v13 setObject:v17 forKey:v14];

      BOOL v15 = [v12 localeIdentifier];
      uint64_t v16 = [*(id *)(a1 + 40) localeIdentifier];
      LODWORD(v13) = [v15 isEqualToString:v16];

      if (v13) {
        *a6 = 1;
      }
    }
  }
}

+ (_LXLexicon)createStaticLexicon:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F72358];
  v11[0] = *MEMORY[0x1E4F723C8];
  v11[1] = v4;
  v12[0] = v3;
  v12[1] = MEMORY[0x1E4F1CC28];
  v11[2] = *MEMORY[0x1E4F723F0];
  v12[2] = MEMORY[0x1E4F1CC28];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  id v6 = (_LXLexicon *)LXLexiconCreate();
  if (!v6)
  {
    id v7 = CROSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEFAULT, "Unable to load lexicon for language '%@'", buf, 0xCu);
    }
  }
  return v6;
}

+ (void)createWordLanguageModel:(id)a3 type:(int64_t)a4
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 localeIdentifier];
  int v7 = [v6 isEqualToString:@"en-US"];

  if (a4 == 2)
  {
    id v8 = [v5 localeIdentifier];
    int v7 = +[CRImageReader languageIsChinese:v8];
  }
  v26[0] = *MEMORY[0x1E4F723C8];
  v9 = [v5 localeIdentifier];
  uint64_t v10 = *MEMORY[0x1E4F72358];
  v27[0] = v9;
  v27[1] = MEMORY[0x1E4F1CC28];
  uint64_t v11 = *MEMORY[0x1E4F723F0];
  v26[1] = v10;
  v26[2] = v11;
  id v12 = [NSNumber numberWithBool:v7 ^ 1u];
  v26[3] = *MEMORY[0x1E4F723D0];
  v27[2] = v12;
  v27[3] = &unk_1F3933118;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  v14 = [MEMORY[0x1E4F56758] pathForLanguageModelForLocale:v5 modelType:2 resourceType:1];
  if (v14)
  {
    BOOL v15 = (void *)[v13 mutableCopy];
    uint64_t v16 = [v14 lastPathComponent];
    id v17 = [v16 stringByDeletingPathExtension];

    v18 = [v14 stringByDeletingLastPathComponent];
    [v15 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F72380]];
    [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F72370]];
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F72360]];
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F723B8]];
    uint64_t v19 = [v15 copy];

    v13 = (void *)v19;
  }
  v20 = (void *)LMLanguageModelCreate();
  if (!v20)
  {
    v21 = CROSLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v5 localeIdentifier];
      int v24 = 138412290;
      uint64_t v25 = v22;
      _os_log_impl(&dword_1DD733000, v21, OS_LOG_TYPE_DEFAULT, "Unable to load language model for '%@'.", (uint8_t *)&v24, 0xCu);
    }
  }

  return v20;
}

+ (CVNLPLanguageModel)createCVNLPCharacterLanguageModel:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F567B8];
  v12[0] = *MEMORY[0x1E4F567B0];
  v12[1] = v4;
  v13[0] = v3;
  id v5 = [NSNumber numberWithInt:1];
  v13[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  int v7 = (CVNLPLanguageModel *)CVNLPLanguageModelCreate();
  if (!v7)
  {
    id v8 = CROSLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_DEFAULT, "Unable to load language model for '%@'.", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

+ (BOOL)isLanguageSupported:(id)a3
{
  id v3 = a3;
  if (qword_1EB58CC28 != -1) {
    dispatch_once(&qword_1EB58CC28, &__block_literal_global_23);
  }
  char v4 = [(id)_MergedGlobals_24 containsObject:v3];

  return v4;
}

void __43__CRLanguageResources_isLanguageSupported___block_invoke()
{
  v2[30] = *MEMORY[0x1E4F143B8];
  v2[0] = @"en-US";
  v2[1] = @"pt-BR";
  v2[2] = @"fr-FR";
  v2[3] = @"it-IT";
  v2[4] = @"de-DE";
  v2[5] = @"es-ES";
  v2[6] = @"ru-RU";
  v2[7] = @"uk-UA";
  v2[8] = @"zh-Hans";
  v2[9] = @"zh-Hant";
  v2[10] = @"yue-Hans";
  v2[11] = @"yue-Hant";
  v2[12] = @"ko-KR";
  v2[13] = @"ja-JP";
  v2[14] = @"th-TH";
  v2[15] = @"vi-VT";
  v2[16] = @"tr-TR";
  v2[17] = @"id-ID";
  v2[18] = @"cs-CZ";
  v2[19] = @"da-DK";
  v2[20] = @"nl-NL";
  v2[21] = @"no-NO";
  v2[22] = @"nn-NO";
  v2[23] = @"nb-NO";
  v2[24] = @"ms-MY";
  v2[25] = @"pl-PL";
  v2[26] = @"ro-RO";
  v2[27] = @"sv-SE";
  v2[28] = @"ar-SA";
  v2[29] = @"ars-SA";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:30];
  v1 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = v0;
}

+ (BOOL)isCharLMForLanguageAvailableInTextRecognition:(id)a3
{
  id v3 = a3;
  if (qword_1EB58CC38 != -1) {
    dispatch_once(&qword_1EB58CC38, &__block_literal_global_31_0);
  }
  char v4 = [(id)qword_1EB58CC30 containsObject:v3];

  return v4;
}

void __69__CRLanguageResources_isCharLMForLanguageAvailableInTextRecognition___block_invoke()
{
  uint64_t v0 = (void *)qword_1EB58CC30;
  qword_1EB58CC30 = (uint64_t)&unk_1F3935BF0;
}

- (void)dealloc
{
  if (self->_lmCharacterLanguageModel)
  {
    LMLanguageModelRelease();
    self->_lmCharacterLanguageModel = 0;
  }
  staticLexicon = self->_staticLexicon;
  if (staticLexicon)
  {
    CFRelease(staticLexicon);
    self->_staticLexicon = 0;
  }
  if (self->_wordLanguageModel)
  {
    LMLanguageModelRelease();
    self->_wordLanguageModel = 0;
  }
  cvnlpCharacterLanguageModel = self->_cvnlpCharacterLanguageModel;
  if (cvnlpCharacterLanguageModel)
  {
    CFRelease(cvnlpCharacterLanguageModel);
    self->_cvnlpCharacterLanguageModel = 0;
  }
  if (self->_wordTokenizer)
  {
    LMStreamTokenizerRelease();
    self->_wordTokenizer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLanguageResources;
  [(CRLanguageResources *)&v5 dealloc];
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)lmCharacterLanguageModel
{
  return self->_lmCharacterLanguageModel;
}

- (CVNLPLanguageModel)cvnlpCharacterLanguageModel
{
  return self->_cvnlpCharacterLanguageModel;
}

- (_LXLexicon)staticLexicon
{
  return self->_staticLexicon;
}

- (void)wordLanguageModel
{
  return self->_wordLanguageModel;
}

- (void)wordTokenizer
{
  return self->_wordTokenizer;
}

- (CVNLPLanguageResourceBundle)_cvnlpLanguageResourceBundle
{
  return (CVNLPLanguageResourceBundle *)objc_getProperty(self, a2, 56, 1);
}

- (void)set_cvnlpLanguageResourceBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cvnlpLanguageResourceBundle, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end