@interface CRLanguageUtils
+ (_LXLexicon)createDynamicLexicon:(id)a3 forLocale:(id)a4 error:(id *)a5;
+ (_LXLexicon)createDynamicLexiconForLocale:(id)a3 error:(id *)a4;
@end

@implementation CRLanguageUtils

+ (_LXLexicon)createDynamicLexicon:(id)a3 forLocale:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v20 = 0;
  v8 = +[CRLanguageUtils createDynamicLexiconForLocale:a4 error:&v20];
  id v9 = v20;
  if (v9)
  {
    v10 = CROSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_ERROR, "Unable to create custom lexicon: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v9;
    }
  }
  else if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          if (LXLexiconAdd()) {
            LXLexiconIncrementUsageCount();
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
  }
  return v8;
}

+ (_LXLexicon)createDynamicLexiconForLocale:(id)a3 error:(id *)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F72458];
  v10[0] = *MEMORY[0x1E4F72460];
  v10[1] = v6;
  v11[0] = @"CR-Custom-Lexicon";
  v11[1] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  Mutable = (_LXLexicon *)LXLexiconCreateMutable();
  if (a4) {
    *a4 = 0;
  }

  return Mutable;
}

@end