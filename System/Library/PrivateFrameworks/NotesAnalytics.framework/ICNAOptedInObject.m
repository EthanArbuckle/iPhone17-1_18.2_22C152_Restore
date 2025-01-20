@interface ICNAOptedInObject
+ (BOOL)isOptedInForAnalytics;
+ (uint64_t)isOptedInForAnalytics;
+ (void)disableAnalytics;
+ (void)isOptedInForAnalytics;
- (ICNAOptedInObject)init;
@end

@implementation ICNAOptedInObject

+ (void)disableAnalytics
{
  _analtyicsDisabled = 1;
}

- (ICNAOptedInObject)init
{
  if (+[ICNAOptedInObject isOptedInForAnalytics])
  {
    v6.receiver = self;
    v6.super_class = (Class)ICNAOptedInObject;
    self = [(ICNAOptedInObject *)&v6 init];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

+ (BOOL)isOptedInForAnalytics
{
  if (_analtyicsDisabled) {
    return 0;
  }
  v3 = (void *)_isOptedInNumber;
  if (!_isOptedInNumber)
  {
    v4 = NSNumber;
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    v5 = (uint64_t (*)(void))getDiagnosticLogSubmissionEnabledSymbolLoc_ptr;
    v14 = getDiagnosticLogSubmissionEnabledSymbolLoc_ptr;
    if (!getDiagnosticLogSubmissionEnabledSymbolLoc_ptr)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getDiagnosticLogSubmissionEnabledSymbolLoc_block_invoke;
      v10[3] = &unk_1E64B8CF8;
      v10[4] = &v11;
      __getDiagnosticLogSubmissionEnabledSymbolLoc_block_invoke((uint64_t)v10);
      v5 = (uint64_t (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      v9 = (_Unwind_Exception *)+[ICNAOptedInObject isOptedInForAnalytics]();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    uint64_t v6 = [v4 numberWithBool:v5()];
    v7 = (void *)_isOptedInNumber;
    _isOptedInNumber = v6;

    v8 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[ICNAOptedInObject isOptedInForAnalytics](v8);
    }

    v3 = (void *)_isOptedInNumber;
  }
  return [v3 BOOLValue];
}

+ (uint64_t)isOptedInForAnalytics
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[ICNAOptedInObject isOptedInForAnalytics](v0);
}

+ (void)isOptedInForAnalytics
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = [(id)_isOptedInNumber BOOLValue];
  v3 = @"NO";
  if (v2) {
    v3 = @"YES";
  }
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1C3EAD000, a1, OS_LOG_TYPE_DEBUG, "D&U check result: %@", (uint8_t *)&v4, 0xCu);
}

@end