@interface PRELocaleDetection
+ (BOOL)isLanguageMismatchedForIdentifier:(id)a3 withIdentifier:(id)a4;
+ (id)languageTagForLocaleIdentifier:(id)a3;
+ (id)sharedInstance;
- (BOOL)isLanguageMismatchedForMessage:(id)a3 withLocaleIdentifier:(id)a4;
- (PRELocaleDetection)init;
- (PRELocaleDetection)initWithLanguageLimit:(unint64_t)a3 withPreferredLocales:(id)a4;
- (id)_bestLocaleForLanguageTag:(id)a3;
- (id)_getPreferredLocales;
- (id)_userLanguageDetectedFromString:(id)a3 preferredLocales:(id)a4;
- (id)_userLocaleDetectedFromString:(id)a3;
- (id)localeForIncomingMessages:(id)a3 outgoingMessages:(id)a4 defaultLocale:(id)a5 defaultLocaleLastChangedDate:(id)a6 sender:(id)a7;
- (id)localeForMessage:(id)a3 outgoingMessageHistory:(id)a4 defaultLocale:(id)a5 defaultLocaleLastChangedDate:(id)a6 sender:(id)a7;
@end

@implementation PRELocaleDetection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConfidentLocaleForSender, 0);

  objc_storeStrong((id *)&self->_preferredLocales, 0);
}

- (id)_bestLocaleForLanguageTag:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSDictionary *)self->_preferredLocales allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)localeForMessage:(id)a3 outgoingMessageHistory:(id)a4 defaultLocale:(id)a5 defaultLocaleLastChangedDate:(id)a6 sender:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (void *)MEMORY[0x1CB799590]();
  if (!v14 || !v15)
  {
    if (!v14 && [(NSDictionary *)self->_preferredLocales count])
    {
      v28 = [(NSDictionary *)self->_preferredLocales allValues];
      id v23 = [v28 firstObject];

LABEL_9:
      if ([(NSDictionary *)self->_preferredLocales count] <= 1)
      {
        v24 = pre_locale_handle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = (uint64_t)v14;
          __int16 v43 = 2112;
          uint64_t v44 = (uint64_t)v23;
          _os_log_impl(&dword_1CA622000, v24, OS_LOG_TYPE_DEFAULT, "Monolingual, default locale %@, detection result %@.", buf, 0x16u);
        }

        id v22 = v23;
        goto LABEL_38;
      }
      if ([v12 length])
      {
        v25 = [(PRELocaleDetection *)self _userLocaleDetectedFromString:v12];
        if ([v25 length])
        {
          v26 = pre_locale_handle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218498;
            uint64_t v42 = [v12 length];
            __int16 v43 = 2112;
            uint64_t v44 = (uint64_t)v14;
            __int16 v45 = 2112;
            id v46 = v25;
            _os_log_impl(&dword_1CA622000, v26, OS_LOG_TYPE_DEFAULT, "Message length: %lu, default locale: %@, detected locale: %@.", buf, 0x20u);
          }

          if (v16) {
            [(_PASLRUCache *)self->_lastConfidentLocaleForSender setObject:v25 forKey:v16];
          }
          id v27 = v25;
          id v22 = v27;
          goto LABEL_37;
        }
      }
      else
      {
        v25 = 0;
      }
      v29 = objc_opt_new();
      if ([v13 count]) {
        [v29 addObjectsFromArray:v13];
      }
      v40 = v29;
      v39 = objc_msgSend(v29, "_pas_componentsJoinedByString:", @"\n");
      -[PRELocaleDetection _userLocaleDetectedFromString:](self, "_userLocaleDetectedFromString:");
      id v27 = (id)objc_claimAutoreleasedReturnValue();

      if ([v27 length])
      {
        v30 = pre_locale_handle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v42 = [v40 count];
          __int16 v43 = 2112;
          uint64_t v44 = (uint64_t)v14;
          __int16 v45 = 2112;
          id v46 = v27;
          _os_log_impl(&dword_1CA622000, v30, OS_LOG_TYPE_DEFAULT, "Number of messages used for detection: %lu, default locale: %@, detected locale: %@.", buf, 0x20u);
        }

        if (v16) {
          [(_PASLRUCache *)self->_lastConfidentLocaleForSender setObject:v27 forKey:v16];
        }
        id v31 = v27;
      }
      else
      {
        if (![v14 length])
        {
          v34 = [(_PASLRUCache *)self->_lastConfidentLocaleForSender objectForKey:v16];
          v35 = v34;
          v36 = v23;
          if (v16)
          {
            uint64_t v37 = [v34 length];
            v36 = v23;
            if (v37)
            {
              v38 = pre_locale_handle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v42 = (uint64_t)v35;
                _os_log_impl(&dword_1CA622000, v38, OS_LOG_TYPE_DEFAULT, "There was no default locale specified. Falling back to last confident locale for sender: %@", buf, 0xCu);
              }

              v36 = v35;
            }
          }
          id v22 = v36;

          goto LABEL_36;
        }
        v32 = pre_locale_handle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = (uint64_t)v14;
          _os_log_impl(&dword_1CA622000, v32, OS_LOG_TYPE_DEFAULT, "Failed to detect a locale so falling back to the default locale: %@", buf, 0xCu);
        }

        id v31 = v14;
      }
      id v22 = v31;
LABEL_36:

LABEL_37:
LABEL_38:

      goto LABEL_39;
    }
LABEL_8:
    id v23 = v14;
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F1C9C8] date];
  [v18 timeIntervalSinceDate:v15];
  double v20 = v19;

  if (v20 > 3600.0) {
    goto LABEL_8;
  }
  v21 = pre_locale_handle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v42 = (uint64_t)v14;
    __int16 v43 = 2048;
    uint64_t v44 = 3600;
    __int16 v45 = 2112;
    id v46 = v14;
    _os_log_impl(&dword_1CA622000, v21, OS_LOG_TYPE_DEFAULT, "Default locale %@ was changed less than %lu seconds ago, detection result %@.", buf, 0x20u);
  }

  id v22 = v14;
LABEL_39:

  return v22;
}

- (id)localeForIncomingMessages:(id)a3 outgoingMessages:(id)a4 defaultLocale:(id)a5 defaultLocaleLastChangedDate:(id)a6 sender:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_msgSend(a3, "_pas_componentsJoinedByString:", @"\n");
  v17 = [(PRELocaleDetection *)self localeForMessage:v16 outgoingMessageHistory:v15 defaultLocale:v14 defaultLocaleLastChangedDate:v13 sender:v12];

  return v17;
}

- (BOOL)isLanguageMismatchedForMessage:(id)a3 withLocaleIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  LOBYTE(v8) = 0;
  if (a3 && v6)
  {
    v9 = [(PRELocaleDetection *)self _userLanguageDetectedFromString:a3 preferredLocales:0];
    if (v9)
    {
      v10 = [(id)objc_opt_class() languageTagForLocaleIdentifier:v7];
      long long v11 = pre_locale_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        id v14 = v9;
        __int16 v15 = 2112;
        id v16 = v10;
        _os_log_impl(&dword_1CA622000, v11, OS_LOG_TYPE_DEFAULT, "Detected language for isLanguageMismatchedForMessage:withLocaleIdentifier: is %@, and language tag for comparison is %@.", (uint8_t *)&v13, 0x16u);
      }

      int v8 = [v9 isEqualToString:v10] ^ 1;
    }
    else
    {
      v10 = pre_locale_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1CA622000, v10, OS_LOG_TYPE_DEFAULT, "Could not detect language for isLanguageMismatchedForMessage:withLocaleIdentifier: with sufficiently high confidence.", (uint8_t *)&v13, 2u);
      }
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (id)_userLocaleDetectedFromString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  preferredLocales = self->_preferredLocales;
  id v5 = a3;
  id v6 = [(NSDictionary *)preferredLocales allKeys];
  uint64_t v7 = [(PRELocaleDetection *)self _userLanguageDetectedFromString:v5 preferredLocales:v6];

  if (!v7)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  int v8 = [(NSDictionary *)self->_preferredLocales objectForKeyedSubscript:v7];
  if ([v8 length])
  {
    v9 = pre_locale_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1CA622000, v9, OS_LOG_TYPE_DEFAULT, "Found a directly matching locale based on locale identifier: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    long long v11 = [(PRELocaleDetection *)self _bestLocaleForLanguageTag:v7];

    if (![v11 length])
    {
      id v10 = 0;
      goto LABEL_11;
    }
    v9 = pre_locale_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl(&dword_1CA622000, v9, OS_LOG_TYPE_DEFAULT, "Found a matching locale: %@", (uint8_t *)&v13, 0xCu);
    }
    int v8 = v11;
  }

  id v10 = v8;
  long long v11 = v10;
LABEL_11:

LABEL_12:

  return v10;
}

- (id)_userLanguageDetectedFromString:(id)a3 preferredLocales:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend((id)objc_opt_class(), "languageTagForLocaleIdentifier:", *(void *)(*((void *)&v27 + 1) + 8 * i), (void)v27);
        if ([v14 length]) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v11);
  }

  uint64_t v15 = pre_locale_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412290;
    v32 = v16;
    _os_log_impl(&dword_1CA622000, v15, OS_LOG_TYPE_DEFAULT, "Setting language tags as constraints: %@", buf, 0xCu);
  }
  uint64_t v17 = objc_opt_new();
  v18 = v17;
  if (v8) {
    [v17 setLanguageConstraints:v8];
  }
  objc_msgSend(v18, "processString:", v6, (void)v27);
  double v19 = [v18 languageHypothesesWithMaximum:self->_languageLimit];
  double v20 = [v18 dominantLanguage];
  if (v20 == (void *)*MEMORY[0x1E4F387A8])
  {
    id v25 = 0;
  }
  else
  {
    v21 = [v19 objectForKeyedSubscript:v20];
    id v22 = pre_locale_handle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = &unk_1F24E86E0;
      if (v21) {
        id v23 = v21;
      }
      *(_DWORD *)buf = 138412546;
      v32 = v20;
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_1CA622000, v22, OS_LOG_TYPE_DEFAULT, "The probability for this message being for language %@ is %@", buf, 0x16u);
    }

    [v21 floatValue];
    if (v24 <= 0.95) {
      id v25 = 0;
    }
    else {
      id v25 = v20;
    }
  }

  return v25;
}

- (id)_getPreferredLocales
{
  return self->_preferredLocales;
}

- (PRELocaleDetection)initWithLanguageLimit:(unint64_t)a3 withPreferredLocales:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PRELocaleDetection;
  id v6 = [(PRELocaleDetection *)&v34 init];
  id v7 = v6;
  if (v6)
  {
    id v25 = v6;
    context = (void *)MEMORY[0x1CB799590]();
    int v8 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v31;
      do
      {
        uint64_t v13 = 0;
        uint64_t v28 = v10;
        do
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          if (a3 - 1 >= v11)
          {
            uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * v13);
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4F89D60], "languageForLocaleIdentifier:", v14, context);
            id v16 = [v15 componentsSeparatedByString:@"@"];
            uint64_t v17 = [v16 firstObject];
            v18 = [v8 objectForKeyedSubscript:v17];

            if (!v18)
            {
              [v8 setObject:v14 forKeyedSubscript:v17];
              ++v11;
            }
            uint64_t v10 = v28;
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v10);
    }

    id v7 = v25;
    v25->_languageLimit = a3;
    uint64_t v19 = [v8 copy];
    preferredLocales = v25->_preferredLocales;
    v25->_preferredLocales = (NSDictionary *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:50];
    lastConfidentLocaleForSender = v25->_lastConfidentLocaleForSender;
    v25->_lastConfidentLocaleForSender = (_PASLRUCache *)v21;

    id v5 = v26;
  }

  return v7;
}

- (PRELocaleDetection)init
{
  v3 = [MEMORY[0x1E4F89D60] userLanguages];
  id v4 = [v3 allObjects];
  id v5 = [(PRELocaleDetection *)self initWithLanguageLimit:0 withPreferredLocales:v4];

  return v5;
}

+ (BOOL)isLanguageMismatchedForIdentifier:(id)a3 withIdentifier:(id)a4
{
  LOBYTE(v4) = 0;
  if (a3 && a4)
  {
    id v6 = (void *)MEMORY[0x1E4F89D60];
    id v7 = a4;
    int v8 = [v6 languageForLocaleIdentifier:a3];
    uint64_t v9 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v7];

    int v4 = [v8 isEqualToString:v9] ^ 1;
  }
  return v4;
}

+ (id)languageTagForLocaleIdentifier:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if ([v3 containsString:@"@"])
  {
    id v5 = [v3 componentsSeparatedByString:@"@"];
    int v4 = [v5 firstObject];
  }
  id v6 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v4];

  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;

  return v2;
}

void __36__PRELocaleDetection_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end