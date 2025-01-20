@interface LTUIVisualTranslationService
+ (id)compactObservations:(id)a3;
+ (void)isTranslatable:(id)a3 completion:(id)a4;
- (void)translate:(id)a3 completion:(id)a4;
- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6;
- (void)translate:(id)a3 targetLocale:(id)a4 completion:(id)a5;
@end

@implementation LTUIVisualTranslationService

+ (void)isTranslatable:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() compactObservations:v6];

  +[VisualTranslationService isTranslatable:v7 completion:v5];
}

- (void)translate:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() compactObservations:v6];

  +[VisualTranslationService translate:v7 sourceLocale:0 targetLocale:0 completion:v5];
}

- (void)translate:(id)a3 targetLocale:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() compactObservations:v9];

  +[VisualTranslationService translate:v10 sourceLocale:0 targetLocale:v8 completion:v7];
}

- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() compactObservations:v12];

  +[VisualTranslationService translate:v13 sourceLocale:v11 targetLocale:v10 completion:v9];
}

+ (id)compactObservations:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = (void *)[v4 mutableCopy];
    uint64_t v6 = [v5 count];
    if (v6 - 1 >= 0)
    {
      uint64_t v8 = v6;
      *(void *)&long long v7 = 134217984;
      long long v15 = v7;
      do
      {
        id v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", --v8, v15);
        if (v9)
        {
        }
        else
        {
          id v10 = [v5 objectAtIndexedSubscript:v8];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [v5 objectAtIndexedSubscript:v8];
            id v12 = [v11 getLines];

            if (!v12)
            {
              id v13 = _LTOSLogVisualTranslation();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v15;
                uint64_t v17 = v8;
                _os_log_error_impl(&dword_1DB0DC000, v13, OS_LOG_TYPE_ERROR, "Text block at index %lu has no observations", buf, 0xCu);
              }
              [v5 removeObjectAtIndex:v8];
            }
          }
          else
          {
          }
        }
      }
      while (v8 > 0);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

@end