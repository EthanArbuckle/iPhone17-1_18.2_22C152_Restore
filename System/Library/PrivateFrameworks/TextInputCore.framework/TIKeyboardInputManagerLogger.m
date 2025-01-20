@interface TIKeyboardInputManagerLogger
+ (BOOL)createTypologyDirectoryAtURL:(id)a3;
+ (id)_writeToFileWithTypologyLog:(id)a3 directoryURL:(id)a4 requireDeviceUnlocked:(BOOL)a5;
+ (id)accessibilityConfigInfo;
+ (void)_backgroundPruneLogsWithPreferences:(id)a3;
+ (void)_backgroundWriteLog:(id)a3 preferences:(id)a4 completion:(id)a5;
+ (void)_writeHumanReadableTraceForTypologyLog:(id)a3 directoryURL:(id)a4;
+ (void)pruneTypologyLogsAtDirectoryURL:(id)a3 toMaxNumBytes:(int64_t)a4 expirationInterval:(double)a5 satisfyingPredicate:(id)a6;
+ (void)submitAggregrateDictionaryReport:(id)a3 inputModeIdentifier:(id)a4;
- (BOOL)allowTypologyLogForKeyboardState:(id)a3;
- (BOOL)hadSecureText;
- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting;
- (BOOL)shouldWriteToSyslogForKeyboardState:(id)a3;
- (BOOL)shouldWriteToTypologyLogForKeyboardState:(id)a3;
- (NSString)inputModeIdentifier;
- (TIKeyboardInputManagerLogger)initWithTypologyPreferences:(id)a3;
- (TIStatusBarStyleOverrideLoggingCapture)sbsOverrideLoggingCapture;
- (TITypologyLog)typologyLog;
- (TITypologyPreferences)typologyPreferences;
- (TITypologyStatistic)typologyStatistic;
- (id)writeToFile;
- (void)_tryWriteToSyslogWithTrace:(id)a3;
- (void)backgroundWriteLogs;
- (void)dealloc;
- (void)didReachMaximumEntries:(id)a3;
- (void)disableTypologyLogIfNecessaryForKeyboardState:(id)a3;
- (void)logAutocorrections:(id)a3 trace:(id)a4 forKeyboardState:(id)a5 requestToken:(id)a6;
- (void)logCandidateResultSet:(id)a3 trace:(id)a4 forKeyboardState:(id)a5 requestToken:(id)a6;
- (void)logHitKeyCode:(int64_t)a3 forTouchEvent:(id)a4 keyboardState:(id)a5;
- (void)logKeyboardConfig:(id)a3 forAdjustedPhraseBoundaryInForwardDirection:(BOOL)a4 granularity:(int)a5 keyboardState:(id)a6;
- (void)logKeyboardConfig:(id)a3 forSyncToKeyboardState:(id)a4;
- (void)logKeyboardConfig:(id)a3 textToCommit:(id)a4 forAcceptedCandidate:(id)a5 keyboardState:(id)a6;
- (void)logKeyboardLayout:(id)a3 name:(id)a4;
- (void)logKeyboardOutput:(id)a3 keyboardConfiguration:(id)a4 trace:(id)a5 forKeyboardInput:(id)a6 keyboardState:(id)a7;
- (void)logReceivedCandidateRejected:(id)a3;
- (void)logReceivedLastAcceptedCandidateCorrected;
- (void)logReceivedSetOriginalInput:(id)a3;
- (void)logReceivedSkipHitTestForTouchEvent:(id)a3 forKeyboardState:(id)a4;
- (void)logReceivedTextAccepted:(id)a3;
- (void)logRefinements:(id)a3 forCandidate:(id)a4 keyboardState:(id)a5;
- (void)logReplacements:(id)a3 forString:(id)a4 keyLayout:(id)a5;
- (void)setConfig:(id)a3;
- (void)setHadSecureText:(BOOL)a3;
- (void)setInputModeIdentifier:(id)a3;
- (void)setSbsOverrideLoggingCapture:(id)a3;
- (void)setTypologyLog:(id)a3;
- (void)setTypologyStatistic:(id)a3;
- (void)tryStartingTypologyLogForSyncToKeyboardState:(id)a3;
@end

@implementation TIKeyboardInputManagerLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbsOverrideLoggingCapture, 0);
  objc_storeStrong((id *)&self->_typologyStatistic, 0);
  objc_storeStrong((id *)&self->_typologyLog, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);

  objc_storeStrong((id *)&self->_typologyPreferences, 0);
}

- (void)setSbsOverrideLoggingCapture:(id)a3
{
}

- (TIStatusBarStyleOverrideLoggingCapture)sbsOverrideLoggingCapture
{
  return self->_sbsOverrideLoggingCapture;
}

- (void)setHadSecureText:(BOOL)a3
{
  self->_hadSecureText = a3;
}

- (BOOL)hadSecureText
{
  return self->_hadSecureText;
}

- (void)setTypologyStatistic:(id)a3
{
}

- (TITypologyStatistic)typologyStatistic
{
  return self->_typologyStatistic;
}

- (void)setTypologyLog:(id)a3
{
}

- (TITypologyLog)typologyLog
{
  return self->_typologyLog;
}

- (void)setInputModeIdentifier:(id)a3
{
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (TITypologyPreferences)typologyPreferences
{
  return self->_typologyPreferences;
}

- (void)logKeyboardLayout:(id)a3 name:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4FAE498];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setName:v7];

  [v9 setKeyboardLayout:v8];
  v10 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v10 logRecord:v9];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:0])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v11 = TIOSLogFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = NSString;
        v13 = [v9 shortDescription];
        v14 = [v12 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logKeyboardLayout:name:]", v13];
        *(_DWORD *)buf = 138412290;
        v16 = v14;
        _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logReceivedLastAcceptedCandidateCorrected
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FAE4A0]);
  v4 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v4 logRecord:v3];

  v5 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v5 visitRecordLastAcceptedCandidateCorrected:v3];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:0])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v6 = TIOSLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = NSString;
        id v8 = [v3 shortDescription];
        id v9 = [v7 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logReceivedLastAcceptedCandidateCorrected]", v8];
        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logReceivedCandidateRejected:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4FAE470];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setCandidate:v5];

  id v7 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v7 logRecord:v6];

  id v8 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v8 visitRecordCandidateRejected:v6];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:0])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      id v9 = TIOSLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = NSString;
        v11 = [v6 shortDescription];
        uint64_t v12 = [v10 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logReceivedCandidateRejected:]", v11];
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logReceivedTextAccepted:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4FAE4D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setCandidate:v5];

  id v7 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v7 logRecord:v6];

  id v8 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v8 visitRecordTextAccepted:v6];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:0])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      id v9 = TIOSLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = NSString;
        v11 = [v6 shortDescription];
        uint64_t v12 = [v10 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logReceivedTextAccepted:]", v11];
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logReceivedSetOriginalInput:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4FAE4C0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setOriginalInput:v5];

  id v7 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v7 logRecord:v6];

  id v8 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v8 visitRecordSetOriginalInput:v6];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:0])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      id v9 = TIOSLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = NSString;
        v11 = [v6 shortDescription];
        uint64_t v12 = [v10 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logReceivedSetOriginalInput:]", v11];
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logKeyboardConfig:(id)a3 forAdjustedPhraseBoundaryInForwardDirection:(BOOL)a4 granularity:(int)a5 keyboardState:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v7 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a3;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4FAE4A8]);
  [v12 setKeyboardConfig:v11];

  [v12 setForwardAdjustment:v7];
  [v12 setGranularity:v6];
  [v12 setKeyboardState:v10];
  v13 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v13 logRecord:v12];

  v14 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v14 visitRecordPhraseBoundaryAdjustment:v12];

  LODWORD(self) = [(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v10];
  if (self)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v15 = TIOSLogFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = NSString;
        uint64_t v17 = [v12 shortDescription];
        v18 = [v16 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logKeyboardConfig:forAdjustedPhraseBoundaryInForwardDirection:granularity:keyboardState:]", v17];
        *(_DWORD *)buf = 138412290;
        v20 = v18;
        _os_log_debug_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logReceivedSkipHitTestForTouchEvent:(id)a3 forKeyboardState:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v7];
  id v8 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  char v9 = [v8 loggedRecordOfClass:objc_opt_class()];

  if ((v9 & 1) == 0)
  {
    id v10 = [v7 keyLayout];
    [(TIKeyboardInputManagerLogger *)self logKeyboardLayout:v10 name:&stru_1F3F7A998];
  }
  if (![v6 stage])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FAE480]);
    [v11 setKeyboardState:v7];
    id v12 = [(TIKeyboardInputManagerLogger *)self typologyLog];
    [v12 logRecord:v11];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4FAE4C8]);
  [v13 setTouchEvent:v6];
  [v13 setKeyboardState:v7];
  v14 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v14 logRecord:v13];

  uint64_t v15 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v15 visitRecordSkipHitTest:v13];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v7])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v16 = TIOSLogFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = NSString;
        v18 = [v13 shortDescription];
        v19 = [v17 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logReceivedSkipHitTestForTouchEvent:forKeyboardState:]", v18];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v19;
        _os_log_debug_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logHitKeyCode:(int64_t)a3 forTouchEvent:(id)a4 keyboardState:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v9];
  id v10 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  char v11 = [v10 loggedRecordOfClass:objc_opt_class()];

  if ((v11 & 1) == 0)
  {
    id v12 = [v9 keyLayout];
    [(TIKeyboardInputManagerLogger *)self logKeyboardLayout:v12 name:&stru_1F3F7A998];
  }
  if (![v8 stage])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FAE480]);
    [v13 setKeyboardState:v9];
    v14 = [(TIKeyboardInputManagerLogger *)self typologyLog];
    [v14 logRecord:v13];
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4FAE488]);
  [v15 setKeyCode:a3];
  [v15 setTouchEvent:v8];
  [v15 setKeyboardState:v9];
  v16 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v16 logRecord:v15];

  uint64_t v17 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v17 visitRecordHitTest:v15];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v9])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v18 = TIOSLogFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = NSString;
        v20 = [v15 shortDescription];
        uint64_t v21 = [v19 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logHitKeyCode:forTouchEvent:keyboardState:]", v20];
        *(_DWORD *)buf = 138412290;
        v23 = v21;
        _os_log_debug_impl(&dword_1E3F0E000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logRefinements:(id)a3 forCandidate:(id)a4 keyboardState:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v8];
  id v11 = objc_alloc_init(MEMORY[0x1E4FAE4B0]);
  [v11 setCandidate:v9];

  [v11 setRefinements:v10];
  [v11 setKeyboardState:v8];
  id v12 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v12 logRecord:v11];

  id v13 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v13 visitRecordRefinements:v11];

  LODWORD(self) = [(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v8];
  if (self)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v14 = TIOSLogFacility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = NSString;
        v16 = [v11 shortDescription];
        uint64_t v17 = [v15 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logRefinements:forCandidate:keyboardState:]", v16];
        *(_DWORD *)buf = 138412290;
        v19 = v17;
        _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logReplacements:(id)a3 forString:(id)a4 keyLayout:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (objc_class *)MEMORY[0x1E4FAE4B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  [v12 setCandidates:v11];

  [v12 setString:v10];
  [v12 setKeyLayout:v9];

  id v13 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v13 logRecord:v12];

  v14 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v14 visitRecordReplacements:v12];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:0])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      id v15 = TIOSLogFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = NSString;
        uint64_t v17 = [v12 shortDescription];
        v18 = [v16 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logReplacements:forString:keyLayout:]", v17];
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v18;
        _os_log_debug_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logKeyboardConfig:(id)a3 textToCommit:(id)a4 forAcceptedCandidate:(id)a5 keyboardState:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v10];
  if (v11)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4FAE480]);
    [v14 setKeyboardState:v10];
    id v15 = [(TIKeyboardInputManagerLogger *)self typologyLog];
    [v15 logRecord:v14];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4FAE460]);
  [v16 setKeyboardConfig:v13];

  [v16 setTextToCommit:v12];
  [v16 setCandidate:v11];

  [v16 setKeyboardState:v10];
  uint64_t v17 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v17 logRecord:v16];

  v18 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v18 visitRecordAcceptedCandidate:v16];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v10])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v19 = TIOSLogFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = NSString;
        uint64_t v21 = [v16 shortDescription];
        uint64_t v22 = [v20 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logKeyboardConfig:textToCommit:forAcceptedCandidate:keyboardState:]", v21];
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v22;
        _os_log_debug_impl(&dword_1E3F0E000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)logCandidateResultSet:(id)a3 trace:(id)a4 forKeyboardState:(id)a5 requestToken:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v12];
  id v14 = objc_alloc_init(MEMORY[0x1E4FAE478]);
  [v14 setResultSet:v13];

  [v14 setKeyboardState:v12];
  [v14 setRequestToken:v11];

  id v15 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v15 logRecord:v14 trace:v10];

  id v16 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v16 visitRecordCandidateResultSet:v14];

  LODWORD(v16) = [(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v12];
  if (v16)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v17 = TIOSLogFacility();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = NSString;
        v19 = [v14 shortDescription];
        uint64_t v20 = [v18 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logCandidateResultSet:trace:forKeyboardState:requestToken:]", v19];
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v20;
        _os_log_debug_impl(&dword_1E3F0E000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    if ([v10 length]) {
      [(TIKeyboardInputManagerLogger *)self _tryWriteToSyslogWithTrace:v10];
    }
  }
}

- (void)logAutocorrections:(id)a3 trace:(id)a4 forKeyboardState:(id)a5 requestToken:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v12];
  id v14 = objc_alloc_init(MEMORY[0x1E4FAE468]);
  [v14 setAutocorrections:v13];

  objc_msgSend(v14, "setListUIDisplayed:", objc_msgSend(v12, "autocorrectionListUIDisplayed"));
  [v14 setKeyboardState:v12];
  [v14 setRequestToken:v11];

  id v15 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v15 logRecord:v14 trace:v10];

  id v16 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v16 visitRecordAutocorrections:v14];

  LODWORD(v16) = [(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v12];
  if (v16)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v17 = TIOSLogFacility();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = NSString;
        v19 = [v14 shortDescription];
        uint64_t v20 = [v18 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logAutocorrections:trace:forKeyboardState:requestToken:]", v19];
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v20;
        _os_log_debug_impl(&dword_1E3F0E000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    if ([v10 length]) {
      [(TIKeyboardInputManagerLogger *)self _tryWriteToSyslogWithTrace:v10];
    }
  }
}

- (void)logKeyboardOutput:(id)a3 keyboardConfiguration:(id)a4 trace:(id)a5 forKeyboardInput:(id)a6 keyboardState:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v14];
  uint64_t v17 = [v13 touchEvent];

  if (!v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4FAE480]);
    [v18 setKeyboardState:v14];
    v19 = [(TIKeyboardInputManagerLogger *)self typologyLog];
    [v19 logRecord:v18];
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4FAE490]);
  [v20 setOutput:v16];

  [v20 setKeyboardConfig:v15];
  [v20 setKeyboardState:v14];
  [v20 setInput:v13];
  uint64_t v21 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v21 logRecord:v20 trace:v12];

  uint64_t v22 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v22 visitRecordKeyboardInput:v20];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v14])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v23 = TIOSLogFacility();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = NSString;
        uint64_t v25 = [v20 shortDescription];
        v26 = [v24 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logKeyboardOutput:keyboardConfiguration:trace:forKeyboardInput:keyboardState:]", v25];
        *(_DWORD *)buf = 138412290;
        v28 = v26;
        _os_log_debug_impl(&dword_1E3F0E000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    if ([v12 length]) {
      [(TIKeyboardInputManagerLogger *)self _tryWriteToSyslogWithTrace:v12];
    }
  }
}

- (void)logKeyboardConfig:(id)a3 forSyncToKeyboardState:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(TIKeyboardInputManagerLogger *)self disableTypologyLogIfNecessaryForKeyboardState:v6];
  [(TIKeyboardInputManagerLogger *)self tryStartingTypologyLogForSyncToKeyboardState:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4FAE480]);
  [v8 setKeyboardState:v6];
  id v9 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v9 logRecord:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4FAE4D0]);
  [v10 setKeyboardConfig:v7];

  [v10 setKeyboardState:v6];
  id v11 = [(TIKeyboardInputManagerLogger *)self inputModeIdentifier];

  if (!v11)
  {
    id v12 = [v6 inputMode];
    [(TIKeyboardInputManagerLogger *)self setInputModeIdentifier:v12];
  }
  id v13 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v13 logRecord:v10];

  id v14 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v14 visitRecordSync:v10];

  if ([(TIKeyboardInputManagerLogger *)self shouldWriteToSyslogForKeyboardState:v6])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      id v15 = TIOSLogFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = NSString;
        uint64_t v17 = [v10 shortDescription];
        id v18 = [v16 stringWithFormat:@"%s %@", "-[TIKeyboardInputManagerLogger logKeyboardConfig:forSyncToKeyboardState:]", v17];
        *(_DWORD *)buf = 138412290;
        id v20 = v18;
        _os_log_debug_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)_tryWriteToSyslogWithTrace:(id)a3
{
  id v3 = a3;
  if (TICanLogMessageAtLevel_onceToken != -1)
  {
    id v5 = v3;
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    id v3 = v5;
  }
  if (TICanLogMessageAtLevel_logLevel >= 3)
  {
    id v4 = v3;
    [v3 enumerateLinesUsingBlock:&__block_literal_global_101];
    id v3 = v4;
  }
}

void __59__TIKeyboardInputManagerLogger__tryWriteToSyslogWithTrace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 3)
  {
    id v3 = TIOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = NSString;
      uint64_t v5 = [(__CFString *)v2 length];
      id v6 = @" ";
      if (v5) {
        id v6 = v2;
      }
      id v7 = [v4 stringWithFormat:@"%s %@\n", "-[TIKeyboardInputManagerLogger _tryWriteToSyslogWithTrace:]_block_invoke", v6];
      *(_DWORD *)buf = 138412290;
      id v9 = v7;
      _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)setConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  [v5 setConfig:v4];
}

- (void)backgroundWriteLogs
{
  id v4 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  id v3 = [(TIKeyboardInputManagerLogger *)self typologyPreferences];
  if (v4 && TI_DEVICE_UNLOCKED() && [v3 typologyLoggingEnabled]) {
    [(id)objc_opt_class() _backgroundWriteLog:v4 preferences:v3 completion:&__block_literal_global_83];
  }
}

uint64_t __51__TIKeyboardInputManagerLogger_backgroundWriteLogs__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TIKeyboardInputManagerLogger _backgroundPruneLogsWithPreferences:a2];
}

- (id)writeToFile
{
  id v3 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  id v4 = [(TIKeyboardInputManagerLogger *)self typologyPreferences];
  id v5 = v4;
  if (v3
    && [v4 typologyLoggingEnabled]
    && ((TI_DEVICE_UNLOCKED() & 1) != 0
     || [(TIKeyboardInputManagerLogger *)self isInternalDeviceWithForcedTypologyLoggingForTesting]))
  {
    id v6 = [v5 typologyDirectoryURL];
    id v7 = +[TIKeyboardInputManagerLogger _writeToFileWithTypologyLog:v3 directoryURL:v6 requireDeviceUnlocked:[(TIKeyboardInputManagerLogger *)self isInternalDeviceWithForcedTypologyLoggingForTesting] ^ 1];
    id v8 = [(TIKeyboardInputManagerLogger *)self typologyLog];
    [v8 setDelegate:0];

    [(TIKeyboardInputManagerLogger *)self setTypologyLog:0];
    [(TIKeyboardInputManagerLogger *)self setSbsOverrideLoggingCapture:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting
{
  v2 = [(TIKeyboardInputManagerLogger *)self typologyPreferences];
  char v3 = [v2 isInternalDeviceWithForcedTypologyLoggingForTesting];

  return v3;
}

- (void)didReachMaximumEntries:(id)a3
{
  id v18 = a3;
  id v4 = [(TIKeyboardInputManagerLogger *)self typologyPreferences];
  uint64_t v5 = [(TIKeyboardInputManagerLogger *)self typologyLog];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(TIKeyboardInputManagerLogger *)self typologyLog];
    if (v7 == v18)
    {
      uint64_t v8 = [v4 persistenceStrategy];

      if (v8 != 1) {
        goto LABEL_6;
      }
      id v6 = [(TIKeyboardInputManagerLogger *)self typologyLog];
      [v6 setDelegate:0];
      id v17 = objc_alloc(MEMORY[0x1E4FAE458]);
      id v16 = [v6 uuid];
      uint64_t v9 = [v6 partIndex] + 1;
      uint64_t v10 = [v6 date];
      id v11 = [v6 systemVersion];
      id v12 = [v6 buildVersion];
      id v13 = [v6 clientIdentifier];
      id v14 = [v6 config];
      id v7 = (id)[v17 initWithUUID:v16 partIndex:v9 date:v10 systemVersion:v11 buildVersion:v12 clientIdentifier:v13 config:v14];

      [(TIKeyboardInputManagerLogger *)self setTypologyLog:v7];
      id v15 = [(TIKeyboardInputManagerLogger *)self typologyLog];
      [v15 setDelegate:self];

      [(id)objc_opt_class() _backgroundWriteLog:v6 preferences:v4 completion:&__block_literal_global_16538];
    }
  }
LABEL_6:
}

- (void)disableTypologyLogIfNecessaryForKeyboardState:(id)a3
{
  id v6 = a3;
  id v4 = [(TIKeyboardInputManagerLogger *)self typologyLog];

  if (v4
    && ![(TIKeyboardInputManagerLogger *)self allowTypologyLogForKeyboardState:v6])
  {
    uint64_t v5 = [(TIKeyboardInputManagerLogger *)self typologyLog];
    [v5 setDelegate:0];

    [(TIKeyboardInputManagerLogger *)self setTypologyLog:0];
    [(TIKeyboardInputManagerLogger *)self setSbsOverrideLoggingCapture:0];
  }
}

- (void)tryStartingTypologyLogForSyncToKeyboardState:(id)a3
{
  id v10 = a3;
  id v4 = [(TIKeyboardInputManagerLogger *)self typologyLog];

  if (!v4
    && [(TIKeyboardInputManagerLogger *)self allowTypologyLogForKeyboardState:v10])
  {
    uint64_t v5 = [(TIKeyboardInputManagerLogger *)self typologyPreferences];
    int v6 = [v5 typologyLoggingEnabledByProfile];

    if (v6)
    {
      id v7 = objc_alloc_init(TIStatusBarStyleOverrideLoggingCapture);
      [(TIKeyboardInputManagerLogger *)self setSbsOverrideLoggingCapture:v7];
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4FAE458]);
    [(TIKeyboardInputManagerLogger *)self setTypologyLog:v8];

    uint64_t v9 = [(TIKeyboardInputManagerLogger *)self typologyLog];
    [v9 setDelegate:self];
  }
}

- (BOOL)allowTypologyLogForKeyboardState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if ([v4 secureTextEntry]) {
    goto LABEL_3;
  }
  int v6 = [v5 clientIdentifier];
  if ([v6 isEqualToString:@"com.apple.mobilesafari"])
  {
    char v7 = [v5 wordLearningEnabled];

    if ((v7 & 1) == 0)
    {
LABEL_3:
      [(TIKeyboardInputManagerLogger *)self setHadSecureText:1];
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (![(TIKeyboardInputManagerLogger *)self hadSecureText])
  {
    id v10 = [(TIKeyboardInputManagerLogger *)self typologyPreferences];
    char v8 = [v10 typologyLoggingEnabled];

    goto LABEL_10;
  }
LABEL_9:
  char v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)shouldWriteToTypologyLogForKeyboardState:(id)a3
{
  return [a3 secureTextEntry] ^ 1;
}

- (BOOL)shouldWriteToSyslogForKeyboardState:(id)a3
{
  id v3 = a3;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel < 2) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 secureTextEntry] ^ 1;
  }

  return v4;
}

- (TIKeyboardInputManagerLogger)initWithTypologyPreferences:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManagerLogger;
  int v6 = [(TIKeyboardInputManagerLogger *)&v14 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_typologyPreferences, a3);
    char v8 = [MEMORY[0x1E4FAE4E8] statistic];
    v15[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    uint64_t v10 = [MEMORY[0x1E4FAE4E0] statisticCompositeWithStatistics:v9];
    typologyStatistic = v7->_typologyStatistic;
    v7->_typologyStatistic = (TITypologyStatistic *)v10;
  }
  id v12 = [(TIKeyboardInputManagerLogger *)v7 typologyStatistic];
  [v12 prepareForComputation];

  return v7;
}

- (void)dealloc
{
  id v3 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  [v3 finalizeComputation];

  int v4 = [(TIKeyboardInputManagerLogger *)self typologyStatistic];
  id v5 = [v4 aggregateReport];

  int v6 = [(TIKeyboardInputManagerLogger *)self inputModeIdentifier];
  +[TIKeyboardInputManagerLogger submitAggregrateDictionaryReport:v5 inputModeIdentifier:v6];

  [(TIKeyboardInputManagerLogger *)self backgroundWriteLogs];
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerLogger;
  [(TIKeyboardInputManagerLogger *)&v7 dealloc];
}

+ (void)pruneTypologyLogsAtDirectoryURL:(id)a3 toMaxNumBytes:(int64_t)a4 expirationInterval:(double)a5 satisfyingPredicate:(id)a6
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = *MEMORY[0x1E4F1C530];
  uint64_t v12 = *MEMORY[0x1E4F1C5F8];
  v44[0] = *MEMORY[0x1E4F1C530];
  v44[1] = v12;
  uint64_t v33 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  objc_super v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  v31 = (void *)v13;
  v32 = v9;
  id v15 = [v14 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:v13 options:4 error:0];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __117__TIKeyboardInputManagerLogger_pruneTypologyLogsAtDirectoryURL_toMaxNumBytes_expirationInterval_satisfyingPredicate___block_invoke;
  v41[3] = &unk_1E6E2D048;
  id v30 = v10;
  id v42 = v30;
  uint64_t v29 = [v15 indexesOfObjectsPassingTest:v41];
  id v16 = objc_msgSend(v15, "objectsAtIndexes:");

  id v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_97_16564];

  v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a5];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    int64_t v21 = 0;
    uint64_t v22 = *(void *)v38;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
        id v36 = 0;
        [v24 getResourceValue:&v36 forKey:v11 error:0];
        id v25 = v36;
        v26 = v25;
        if (v21 > a4
          || ([v25 earlierDate:v34],
              v27 = objc_claimAutoreleasedReturnValue(),
              v27,
              v27 == v26))
        {
          v28 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v28 removeItemAtURL:v24 error:0];
        }
        else
        {
          id v35 = 0;
          [v24 getResourceValue:&v35 forKey:v33 error:0];
          v21 += [v35 integerValue];
        }

        ++v23;
      }
      while (v20 != v23);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v20);
  }
}

uint64_t __117__TIKeyboardInputManagerLogger_pruneTypologyLogsAtDirectoryURL_toMaxNumBytes_expirationInterval_satisfyingPredicate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__TIKeyboardInputManagerLogger_pruneTypologyLogsAtDirectoryURL_toMaxNumBytes_expirationInterval_satisfyingPredicate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C530];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  id v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v9 compare:v6];
  return v7;
}

+ (void)submitAggregrateDictionaryReport:(id)a3 inputModeIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TI_DEVICE_UNLOCKED_SINCE_BOOT() && [v6 length])
  {
    id v7 = v5;
    id v8 = v6;
    TIDispatchAsync();
  }
}

void __85__TIKeyboardInputManagerLogger_submitAggregrateDictionaryReport_inputModeIdentifier___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __85__TIKeyboardInputManagerLogger_submitAggregrateDictionaryReport_inputModeIdentifier___block_invoke_2;
  v2[3] = &unk_1E6E2D020;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __85__TIKeyboardInputManagerLogger_submitAggregrateDictionaryReport_inputModeIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  if ([v6 length])
  {
    id v5 = TIStatisticGetKeyForInputMode();
    if (v5)
    {
      if ([v6 containsString:@".distr"])
      {
        [v4 doubleValue];
        TIStatisticDistributionPushValue();
      }
      else
      {
        [v4 longLongValue];
        TIStatisticScalarAddValue();
      }
    }
  }
}

+ (void)_backgroundPruneLogsWithPreferences:(id)a3
{
  id v3 = a3;
  id v4 = [v3 typologyDirectoryURL];
  [v3 maxBytesPersistedTypologyRecords];
  [v3 maxBytesPersistedTypologyTraceLogs];
  [v3 maxLifetimeInterval];

  id v5 = _TIQueueLow();
  id v7 = v4;
  id v6 = v4;
  TIDispatchAsync();
}

uint64_t __68__TIKeyboardInputManagerLogger__backgroundPruneLogsWithPreferences___block_invoke(uint64_t result)
{
  v1 = (double *)result;
  uint64_t v2 = *(void *)(result + 40);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL) {
    result = +[TIKeyboardInputManagerLogger pruneTypologyLogsAtDirectoryURL:*(void *)(result + 32) toMaxNumBytes:v2 expirationInterval:&__block_literal_global_87_16573 satisfyingPredicate:*(double *)(result + 48)];
  }
  if (*((void *)v1 + 7) != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = *((void *)v1 + 4);
    double v4 = v1[6];
    return +[TIKeyboardInputManagerLogger pruneTypologyLogsAtDirectoryURL:toMaxNumBytes:expirationInterval:satisfyingPredicate:](TIKeyboardInputManagerLogger, "pruneTypologyLogsAtDirectoryURL:toMaxNumBytes:expirationInterval:satisfyingPredicate:", v3, v4);
  }
  return result;
}

uint64_t __68__TIKeyboardInputManagerLogger__backgroundPruneLogsWithPreferences___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FAE458];
  uint64_t v3 = [a2 lastPathComponent];
  uint64_t v4 = [v2 isTraceLogFilename:v3];

  return v4;
}

uint64_t __68__TIKeyboardInputManagerLogger__backgroundPruneLogsWithPreferences___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FAE458];
  uint64_t v3 = [a2 lastPathComponent];
  uint64_t v4 = [v2 isTypologyLogFilename:v3];

  return v4;
}

+ (void)_backgroundWriteLog:(id)a3 preferences:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _TIQueueLow();
  objc_super v14 = v8;
  id v15 = v7;
  id v16 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  TIDispatchAsync();
}

void __75__TIKeyboardInputManagerLogger__backgroundWriteLog_preferences_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) typologyDirectoryURL];
  id v2 = +[TIKeyboardInputManagerLogger _writeToFileWithTypologyLog:*(void *)(a1 + 40) directoryURL:v3 requireDeviceUnlocked:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)_writeHumanReadableTraceForTypologyLog:(id)a3 directoryURL:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (TI_DEVICE_UNLOCKED()
    && [(id)objc_opt_class() createTypologyDirectoryAtURL:v6])
  {
    id v7 = (void *)MEMORY[0x1E4F28E78];
    id v8 = [v5 date];
    id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v10 = [v8 descriptionWithLocale:v9];
    id v11 = [v7 stringWithFormat:@"Date: %@\n", v10];

    id v12 = [v5 systemVersion];
    id v13 = [v5 buildVersion];
    [v11 appendFormat:@"iOS version: %@ (%@)\n", v12, v13];

    objc_super v14 = [v5 filename];
    id v15 = objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:options:range:", @"typology", @"typologyTrace", 8, 0, objc_msgSend(v14, "length"));

    id v16 = objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:options:range:", @".plist", @".log", 12, 0, objc_msgSend(v15, "length"));

    id v17 = [v6 URLByAppendingPathComponent:v16];
    uint64_t v36 = *MEMORY[0x1E4F28370];
    v37[0] = *MEMORY[0x1E4F28340];
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v20 = [v17 path];
    int64_t v21 = [v11 dataUsingEncoding:4];
    int v22 = [v19 createFileAtPath:v20 contents:v21 attributes:v18];

    if (v22)
    {
      id v33 = 0;
      uint64_t v23 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v17 error:&v33];
      id v24 = v33;
      id v25 = v24;
      if (v23 && !v24)
      {
        [v23 seekToEndOfFile];
        [v11 setString:&stru_1F3F7A998];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __84__TIKeyboardInputManagerLogger__writeHumanReadableTraceForTypologyLog_directoryURL___block_invoke;
        v30[3] = &unk_1E6E2CFB0;
        id v26 = v11;
        id v31 = v26;
        id v32 = v23;
        v27 = v23;
        [v5 enumerateTraceRecordsWithBlock:v30];
        v28 = [v26 dataUsingEncoding:4];
        [v27 writeData:v28];

        [v26 setString:&stru_1F3F7A998];
        [v27 closeFile];

LABEL_12:
        goto LABEL_13;
      }
    }
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v27 = TIOSLogFacility();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s failed to write trace", "+[TIKeyboardInputManagerLogger _writeHumanReadableTraceForTypologyLog:directoryURL:]");
      *(_DWORD *)buf = 138412290;
      id v35 = v29;
      _os_log_debug_impl(&dword_1E3F0E000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __84__TIKeyboardInputManagerLogger__writeHumanReadableTraceForTypologyLog_directoryURL___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)MEMORY[0x1E4E7C3D0]();
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v8 logText];
  [v4 appendString:v5];

  [*(id *)(a1 + 32) appendString:@"\n"];
  if ((unint64_t)[*(id *)(a1 + 32) length] >= 0x7D1)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) dataUsingEncoding:4];
    [v6 writeData:v7];

    [*(id *)(a1 + 32) setString:&stru_1F3F7A998];
  }
}

+ (id)accessibilityConfigInfo
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Accessibility"];
  id v3 = [v2 objectForKey:@"AccessibilityEnabled"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = [v2 BOOLForKey:@"FullKeyboardAccessEnabled"];
    id v7 = [NSNumber numberWithBool:v6];
    [v5 setObject:v7 forKey:@"FullKeyboardAccessEnabled"];

    uint64_t v8 = [v2 BOOLForKey:@"VoiceOverTouchUIEnabled"];
    id v9 = [NSNumber numberWithBool:v8];
    [v5 setObject:v9 forKey:@"VoiceOverTouchUIEnabled"];

    uint64_t v10 = [v2 BOOLForKey:@"VoiceOverTouchEnabled"];
    id v11 = [NSNumber numberWithBool:v10];
    [v5 setObject:v11 forKey:@"VoiceOverTouchEnabled"];

    uint64_t v12 = [v2 BOOLForKey:@"VOTIsRunningKey"];
    id v13 = [NSNumber numberWithBool:v12];
    [v5 setObject:v13 forKey:@"VOTIsRunningKey"];

    uint64_t v14 = [v2 integerForKey:@"VoiceOverTouchTypingMode"];
    id v15 = @"Standard Typing";
    if (v14 == 2) {
      id v15 = @"Direct Touch Typing";
    }
    if (v14 == 1) {
      id v16 = @"Touch Typing";
    }
    else {
      id v16 = v15;
    }
    [v5 setObject:v16 forKey:@"VoiceOverTouchTypingMode"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_writeToFileWithTypologyLog:(id)a3 directoryURL:(id)a4 requireDeviceUnlocked:(BOOL)a5
{
  BOOL v5 = a5;
  v26[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8
    && (!v5 || TI_DEVICE_UNLOCKED())
    && [(id)objc_opt_class() createTypologyDirectoryAtURL:v9])
  {
    uint64_t v10 = [v8 recommendedTypologyLogFilename];
    id v11 = [v9 URLByAppendingPathComponent:v10];

    uint64_t v12 = [v8 recommendedTraceLogFilename];
    id v13 = [v9 URLByAppendingPathComponent:v12];

    uint64_t v14 = [a1 accessibilityConfigInfo];
    id v23 = 0;
    char v15 = [v8 writeToTypologyLogFile:v11 andTraceLogFile:v13 withAccessibilityInfo:v14 error:&v23];
    id v16 = v23;

    if (v15)
    {
      v26[0] = v11;
      v26[1] = v13;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    }
    else
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      id v18 = TIOSLogFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = NSString;
        int64_t v21 = [v8 filename];
        int v22 = [v20 stringWithFormat:@"%s Error serializing and writing property list %@: %@", "+[TIKeyboardInputManagerLogger _writeToFileWithTypologyLog:directoryURL:requireDeviceUnlocked:]", v21, v16];
        *(_DWORD *)buf = 138412290;
        id v25 = v22;
        _os_log_debug_impl(&dword_1E3F0E000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (BOOL)createTypologyDirectoryAtURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  BOOL v5 = [v3 defaultManager];
  id v11 = 0;
  char v6 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v11];

  id v7 = v11;
  if ((v6 & 1) == 0)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    id v8 = TIOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [NSString stringWithFormat:@"%s failed to create typology directory: %@", "+[TIKeyboardInputManagerLogger createTypologyDirectoryAtURL:]", v7];
      *(_DWORD *)buf = 138412290;
      id v13 = v10;
      _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }

  return v6;
}

@end