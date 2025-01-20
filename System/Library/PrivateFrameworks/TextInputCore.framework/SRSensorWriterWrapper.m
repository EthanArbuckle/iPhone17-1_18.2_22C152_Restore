@interface SRSensorWriterWrapper
+ (id)writerInstance;
- (BOOL)isReady;
- (void)publishSessionStats:(id)a3 withSessionStartTime:(BOOL)a4;
- (void)write:(id)a3;
- (void)write:(id)a3 withTimeStamp:(id)a4;
@end

@implementation SRSensorWriterWrapper

- (void)publishSessionStats:(id)a3 withSessionStartTime:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = [v6 generateDataForSR];
  if (v4)
  {
    v7 = [v9 binarySampleRepresentation];
    v8 = [v6 startTime];

    [(SRSensorWriterWrapper *)self write:v7 withTimeStamp:v8];
  }
  else
  {

    v7 = [v9 binarySampleRepresentation];
    [(SRSensorWriterWrapper *)self write:v7];
  }
}

- (void)write:(id)a3 withTimeStamp:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = IXADefaultLogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] sending sessionStats data to SensorKit", "-[SRSensorWriterWrapper write:withTimeStamp:]");
    *(_DWORD *)buf = 138412290;
    v20 = v17;
    _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  id v9 = self;
  objc_sync_enter(v9);
  v10 = +[SRSensorWriterWrapper writerInstance];
  [v6 srAbsoluteTime];
  double v12 = v11;

  id v18 = 0;
  [v10 provideSampleData:v7 timestamp:&v18 error:v12];

  id v13 = v18;
  objc_sync_exit(v9);

  v14 = IXADefaultLogFacility();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = [NSString stringWithFormat:@"%s [SensorKit] Data send to SensorKit failed with error: %@", "-[SRSensorWriterWrapper write:withTimeStamp:]", v13];
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_error_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_9:
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] Data is sent to SensorKit", "-[SRSensorWriterWrapper write:withTimeStamp:]");
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_debug_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_9;
  }
}

- (void)write:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = IXADefaultLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    double v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] sending sessionStats data to SensorKit", "-[SRSensorWriterWrapper write:]");
    *(_DWORD *)buf = 138412290;
    v15 = v12;
    _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = +[SRSensorWriterWrapper writerInstance];
  id v13 = 0;
  [v7 provideSampleData:v4 error:&v13];

  id v8 = v13;
  objc_sync_exit(v6);

  id v9 = IXADefaultLogFacility();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v11 = [NSString stringWithFormat:@"%s [SensorKit] Data send to SensorKit failed with error: %@", "-[SRSensorWriterWrapper write:]", v8];
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_9:
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] Data is sent to SensorKit", "-[SRSensorWriterWrapper write:]");
    *(_DWORD *)buf = 138412290;
    v15 = v11;
    _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_9;
  }
}

- (BOOL)isReady
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[SRSensorWriterWrapper writerInstance];
  int v3 = [v2 isMonitoring];

  id v4 = IXADefaultLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v6 = @"not ready";
    if (v3) {
      id v6 = @"ready";
    }
    id v7 = [NSString stringWithFormat:@"%s [SensorKit] writer is %@", "-[SRSensorWriterWrapper isReady]", v6];
    *(_DWORD *)buf = 138412290;
    id v9 = v7;
    _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  return v3;
}

+ (id)writerInstance
{
  if (+[SRSensorWriterWrapper writerInstance]::onceToken != -1) {
    dispatch_once(&+[SRSensorWriterWrapper writerInstance]::onceToken, &__block_literal_global);
  }
  v2 = (void *)+[SRSensorWriterWrapper writerInstance]::_instance;

  return v2;
}

uint64_t __39__SRSensorWriterWrapper_writerInstance__block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = IXADefaultLogFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [NSString stringWithFormat:@"%s [SensorKit] creating SRSensorWriter for %@", "+[SRSensorWriterWrapper writerInstance]_block_invoke", @"com.apple.SensorKit.keyboardMetrics"];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_debug_impl(&dword_1E3F0E000, v0, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v1 = (void *)getSRSensorWriterClass(void)::softClass;
  uint64_t v12 = getSRSensorWriterClass(void)::softClass;
  if (!getSRSensorWriterClass(void)::softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v14 = ___ZL22getSRSensorWriterClassv_block_invoke;
    v15 = &unk_1E6E2E248;
    uint64_t v16 = &v9;
    ___ZL22getSRSensorWriterClassv_block_invoke((uint64_t)&buf);
    v1 = (void *)v10[3];
  }
  v2 = v1;
  _Block_object_dispose(&v9, 8);
  uint64_t v3 = [[v2 alloc] initWithIdentifier:@"com.apple.SensorKit.keyboardMetrics"];
  id v4 = (void *)+[SRSensorWriterWrapper writerInstance]::_instance;
  +[SRSensorWriterWrapper writerInstance]::_instance = v3;

  v5 = objc_alloc_init(SRSensorWriterKeyboardDelegate);
  id v6 = (void *)+[SRSensorWriterWrapper writerInstance]::_delegate;
  +[SRSensorWriterWrapper writerInstance]::_delegate = (uint64_t)v5;

  return [(id)+[SRSensorWriterWrapper writerInstance]::_instance setDelegate:+[SRSensorWriterWrapper writerInstance]::_delegate];
}

@end