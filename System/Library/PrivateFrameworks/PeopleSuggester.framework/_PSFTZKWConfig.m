@interface _PSFTZKWConfig
+ (BOOL)onNonUIBuild;
+ (BOOL)useBlendingLayer;
- (BOOL)useBlendingLayer;
- (_PSFTZKWConfig)init;
- (_PSFTZKWConfig)initWithTrialData:(id)a3;
- (_PSZKWFTCalendarEventConfig)calendarEventConfig;
- (_PSZKWFTFallbackInteractionsConfig)fallbackInteractionsConfig;
- (_PSZKWFTPrimaryInteractionsConfig)faceTimeInteractionsConfig;
- (_PSZKWFTUnstructuredCalendarConfig)unstructuredCalendarConfig;
- (_PSZKWFTUnstructuredRemindersConfig)unstructuredRemindersConfig;
- (void)setUseBlendingLayer:(BOOL)a3;
@end

@implementation _PSFTZKWConfig

+ (BOOL)onNonUIBuild
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  v2 = (uint64_t (*)(__CFString *, void))getMGCopyAnswerSymbolLoc_ptr;
  v12 = getMGCopyAnswerSymbolLoc_ptr;
  if (!getMGCopyAnswerSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getMGCopyAnswerSymbolLoc_block_invoke;
    v8[3] = &unk_1E5ADE858;
    v8[4] = &v9;
    __getMGCopyAnswerSymbolLoc_block_invoke((uint64_t)v8);
    v2 = (uint64_t (*)(__CFString *, void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    v7 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU]();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  v3 = (const void *)v2(@"ReleaseType", 0);
  if (!v3) {
    return 0;
  }
  v4 = v3;
  BOOL v5 = CFEqual(v3, @"NonUI") != 0;
  CFRelease(v4);
  return v5;
}

- (_PSFTZKWConfig)init
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22___PSFTZKWConfig_init__block_invoke;
  v5[3] = &unk_1E5AE0D38;
  v5[4] = &v6;
  +[_PSFTZKWTrialWrapper runWithData:v5];
  v3 = [(_PSFTZKWConfig *)self initWithTrialData:v7[5]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (_PSFTZKWConfig)initWithTrialData:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PSFTZKWConfig;
  BOOL v5 = [(_PSFTZKWConfig *)&v17 init];
  if (v5)
  {
    v5->_useBlendingLayer = +[_PSFTZKWConfig useBlendingLayer];
    uint64_t v6 = -[_PSZKWFTCalendarEventConfig initWithIsEnabled:defaultConfidenceCategory:]([_PSZKWFTCalendarEventConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:", [v4 structuredCalendarIsEnabled], objc_msgSend(v4, "structuredCalendarDefaultConfidenceCategory"));
    calendarEventConfig = v5->_calendarEventConfig;
    v5->_calendarEventConfig = v6;

    uint64_t v8 = -[_PSZKWFTUnstructuredCalendarConfig initWithIsEnabled:defaultConfidenceCategory:]([_PSZKWFTUnstructuredCalendarConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:", [v4 unstructuredCalendarIsEnabled], objc_msgSend(v4, "unstructuredRemindersIsEnabled"));
    unstructuredCalendarConfig = v5->_unstructuredCalendarConfig;
    v5->_unstructuredCalendarConfig = v8;

    v10 = -[_PSZKWFTUnstructuredRemindersConfig initWithIsEnabled:defaultConfidenceCategory:]([_PSZKWFTUnstructuredRemindersConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:", [v4 unstructuredRemindersIsEnabled], objc_msgSend(v4, "unstructuredRemindersDefaultConfidenceCategory"));
    unstructuredRemindersConfig = v5->_unstructuredRemindersConfig;
    v5->_unstructuredRemindersConfig = v10;

    v12 = -[_PSZKWFTPrimaryInteractionsConfig initWithIsEnabled:defaultConfidenceCategory:modelType:]([_PSZKWFTPrimaryInteractionsConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:modelType:", [v4 primaryInteractionsIsEnabled], objc_msgSend(v4, "primaryInteractionsDefaultConfidenceCategory"), objc_msgSend(v4, "primaryInteractionsModelType"));
    faceTimeInteractionsConfig = v5->_faceTimeInteractionsConfig;
    v5->_faceTimeInteractionsConfig = v12;

    v14 = -[_PSZKWFTFallbackInteractionsConfig initWithIsEnabled:defaultConfidenceCategory:modelType:]([_PSZKWFTFallbackInteractionsConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:modelType:", [v4 fallbackInteractionsIsEnabled], objc_msgSend(v4, "fallbackInteractionsDefaultConfidenceCategory"), objc_msgSend(v4, "fallbackInteractionsModelType"));
    fallbackInteractionsConfig = v5->_fallbackInteractionsConfig;
    v5->_fallbackInteractionsConfig = v14;
  }
  return v5;
}

+ (BOOL)useBlendingLayer
{
  if ([(id)objc_opt_class() onNonUIBuild]) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (BOOL)useBlendingLayer
{
  return self->_useBlendingLayer;
}

- (void)setUseBlendingLayer:(BOOL)a3
{
  self->_useBlendingLayer = a3;
}

- (_PSZKWFTCalendarEventConfig)calendarEventConfig
{
  return self->_calendarEventConfig;
}

- (_PSZKWFTUnstructuredCalendarConfig)unstructuredCalendarConfig
{
  return self->_unstructuredCalendarConfig;
}

- (_PSZKWFTUnstructuredRemindersConfig)unstructuredRemindersConfig
{
  return self->_unstructuredRemindersConfig;
}

- (_PSZKWFTPrimaryInteractionsConfig)faceTimeInteractionsConfig
{
  return self->_faceTimeInteractionsConfig;
}

- (_PSZKWFTFallbackInteractionsConfig)fallbackInteractionsConfig
{
  return self->_fallbackInteractionsConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackInteractionsConfig, 0);
  objc_storeStrong((id *)&self->_faceTimeInteractionsConfig, 0);
  objc_storeStrong((id *)&self->_unstructuredRemindersConfig, 0);
  objc_storeStrong((id *)&self->_unstructuredCalendarConfig, 0);

  objc_storeStrong((id *)&self->_calendarEventConfig, 0);
}

@end