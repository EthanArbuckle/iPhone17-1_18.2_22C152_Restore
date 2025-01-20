@interface TIMecabraIMLogger
+ (BOOL)isLoggingEnabled;
- (NSMutableString)loggedMessage;
- (id)logFilePath;
- (void)beginLogging;
- (void)endLoggingForInput:(id)a3 atFinalTimeMark:(unint64_t)a4;
- (void)markTime:(unint64_t)a3;
- (void)setLoggedMessage:(id)a3;
- (void)writeLogToFile;
@end

@implementation TIMecabraIMLogger

+ (BOOL)isLoggingEnabled
{
  if (isLoggingEnabled_onceToken != -1) {
    dispatch_once(&isLoggingEnabled_onceToken, &__block_literal_global_23674);
  }
  return isLoggingEnabled_logLevel != 0;
}

CFIndex __37__TIMecabraIMLogger_isLoggingEnabled__block_invoke()
{
  CFIndex result = CFPreferencesGetAppIntegerValue(@"MecabraIMLogLevel", @"com.apple.keyboard", 0);
  isLoggingEnabled_logLevel = result;
  return result;
}

- (void).cxx_destruct
{
}

- (void)setLoggedMessage:(id)a3
{
}

- (void)writeLogToFile
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(TIMecabraIMLogger *)self loggedMessage];
  v4 = [(TIMecabraIMLogger *)self logFilePath];
  [v3 writeToFile:v4 atomically:1 encoding:4 error:0];

  [(TIMecabraIMLogger *)self setLoggedMessage:0];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = NSString;
      v7 = [(TIMecabraIMLogger *)self logFilePath];
      v8 = [v6 stringWithFormat:@"%s TIMecabraIM: Log is written to file %@!", "-[TIMecabraIMLogger writeLogToFile]", v7];
      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)endLoggingForInput:(id)a3 atFinalTimeMark:(unint64_t)a4
{
  id v6 = a3;
  if (a4 <= 0xA)
  {
    id v22 = v6;
    [(TIMecabraIMLogger *)self markTime:a4];
    double v7 = *(double *)gTimeStamps;
    float v8 = 0.0;
    if (*(double *)gTimeStamps != 0.0)
    {
      double v9 = *(double *)&gTimeStamps[a4];
      if (v9 != 0.0)
      {
        double v7 = v9 - *(double *)gTimeStamps;
        *(float *)&double v7 = v9 - *(double *)gTimeStamps;
        float v8 = *(float *)&v7 * 1000.0;
      }
    }
    v10 = objc_msgSend(MEMORY[0x1E4F28E78], "string", v7);
    uint64_t v11 = [NSString stringWithFormat:@"%@; ", v22];
    [v10 appendString:v11];

    if (a4)
    {
      v12 = (double *)&xmmword_1EAE40CB8;
      do
      {
        double v13 = *(v12 - 1);
        float v14 = 0.0;
        if (v13 != 0.0 && *v12 != 0.0) {
          float v14 = *v12 - v13;
        }
        v15 = NSString;
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f(%.1f%%)", (float)(v14 * 1000.0), (float)((float)((float)(v14 * 1000.0) / v8) * 100.0));
        v17 = [v15 stringWithFormat:@"%@; ", v16];
        [v10 appendString:v17];

        ++v12;
        --a4;
      }
      while (a4);
    }
    v18 = NSString;
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f(%.1f%%)", v8, (float)((float)(v8 / v8) * 100.0));
    v20 = [v18 stringWithFormat:@"%@\n", v19];
    [v10 appendString:v20];

    v21 = [(TIMecabraIMLogger *)self loggedMessage];
    [v21 appendString:v10];

    id v6 = v22;
  }
}

- (id)logFilePath
{
  v2 = NSTemporaryDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"mecabraIMLog.txt"];

  return v3;
}

- (void)markTime:(unint64_t)a3
{
  if (a3 >= 0xA) {
    unint64_t v3 = 10;
  }
  else {
    unint64_t v3 = a3;
  }
  *(CFAbsoluteTime *)&gTimeStamps[v3] = CFAbsoluteTimeGetCurrent();
}

- (void)beginLogging
{
  qword_1EAE40CF8 = 0;
  xmmword_1EAE40CD8 = 0u;
  unk_1EAE40CE8 = 0u;
  xmmword_1EAE40CB8 = 0u;
  unk_1EAE40CC8 = 0u;
  [(TIMecabraIMLogger *)self markTime:0];
}

- (NSMutableString)loggedMessage
{
  loggedMessage = self->_loggedMessage;
  if (!loggedMessage)
  {
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v5 = self->_loggedMessage;
    self->_loggedMessage = v4;

    loggedMessage = self->_loggedMessage;
  }

  return loggedMessage;
}

@end