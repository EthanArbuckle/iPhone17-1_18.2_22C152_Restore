@interface TPSPeopleSuggestionValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSPeopleSuggestionValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F89C88];
  v5 = (void (**)(id, BOOL, void))a3;
  id v6 = objc_alloc_init(v4);
  v7 = [v6 chatGuidsForMessagesPinningWithMaxSuggestions:3];
  uint64_t v8 = [v7 count];
  v9 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v9];
  }

  v5[2](v5, v8 == 3, 0);
}

@end