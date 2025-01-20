@interface PREPredictionExemptTermsDetector
- (BOOL)_warmTermsIfNecessary;
- (BOOL)checkForExemptContentInText:(id)a3 languageCode:(id)a4;
- (PREPredictionExemptTermsDetector)init;
@end

@implementation PREPredictionExemptTermsDetector

- (void).cxx_destruct
{
}

- (BOOL)_warmTermsIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_languageToExemptTerms)
  {
    char isKindOfClass = 1;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.ProactiveExperiments"];
    v5 = [v4 pathForResource:@"PredictionExemptTerms" ofType:@"plist"];
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    p_super = pre_responses_handle();
    BOOL v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    if (isKindOfClass)
    {
      if (v8)
      {
        int v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1CA622000, p_super, OS_LOG_TYPE_DEFAULT, "ProactiveResponsesExperiment Successfully loaded exempt terms list at path: %@", (uint8_t *)&v11, 0xCu);
      }

      v9 = (NSDictionary *)[v6 copy];
      p_super = &self->_languageToExemptTerms->super;
      self->_languageToExemptTerms = v9;
    }
    else if (v8)
    {
      int v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1CA622000, p_super, OS_LOG_TYPE_DEFAULT, "ProactiveResponsesExperiment ExemptTermsDetection found unexpected plist contents at path: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)checkForExemptContentInText:(id)a3 languageCode:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (__CFString *)a4;
  if (self->_languageToExemptTerms && [v6 length])
  {
    if (!v7) {
      v7 = @"en";
    }
    BOOL v8 = pre_responses_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      v23 = v7;
      _os_log_impl(&dword_1CA622000, v8, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment Checking for exempt content with language code: %@", (uint8_t *)&v22, 0xCu);
    }

    [(PREPredictionExemptTermsDetector *)self _warmTermsIfNecessary];
    v9 = [(NSDictionary *)self->_languageToExemptTerms objectForKeyedSubscript:v7];
    if ([v9 count])
    {
      v10 = [v6 localizedLowercaseString];
      int v11 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
      v12 = [v10 removeCharactersWithCharacterSet:v11];

      uint64_t v13 = [v12 removeApostrophes];

      v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];
      v15 = [v13 stringByFoldingWithOptions:128 locale:v14];

      v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
      v17 = (void *)MEMORY[0x1E4F1CAD0];
      v18 = [v15 tokens];
      v19 = [v17 setWithArray:v18];

      char v20 = [v19 intersectsSet:v16];
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (PREPredictionExemptTermsDetector)init
{
  v5.receiver = self;
  v5.super_class = (Class)PREPredictionExemptTermsDetector;
  v2 = [(PREPredictionExemptTermsDetector *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PREPredictionExemptTermsDetector *)v2 _warmTermsIfNecessary];
  }
  return v3;
}

@end