@interface PLTimedPerfCheck
+ (id)start;
- (PLTimedPerfCheck)init;
- (PLUnitMultiplier)perfUnitsFromPerfCheckInfo:(SEL)a3;
- (id)endSessionAndReturnPerfCheckExtraInformation;
- (id)perfCheckLogStringWithPerfCheckInfo:(id)a3;
- (void)dealloc;
- (void)setup;
@end

@implementation PLTimedPerfCheck

- (PLUnitMultiplier)perfUnitsFromPerfCheckInfo:(SEL)a3
{
  *retstr = *(PLUnitMultiplier *)byte_1E58A1430;
  v5 = &retstr->var0[4];
  v6 = &retstr->var1[4];
  v7 = &retstr->var0[2];
  v8 = &retstr->var1[2];
  var1 = retstr->var1;
  id v10 = a4;
  v11 = [v10 objectForKeyedSubscript:@"processMemoryPeakKiloBytesInitial"];
  [v11 doubleValue];
  PLUpdateSizeUnit(retstr->var0, var1, v12);

  v13 = [v10 objectForKeyedSubscript:@"processMemoryPeakKiloBytesAfterRequest"];
  [v13 doubleValue];
  PLUpdateSizeUnit(&retstr->var0[1], &retstr->var1[1], v14);

  v15 = [v10 objectForKeyedSubscript:@"processMemoryCurrentKiloBytesInitial"];
  [v15 doubleValue];
  PLUpdateSizeUnit(v7, v8, v16);

  v17 = [v10 objectForKeyedSubscript:@"processMemoryCurrentKiloBytesAfterRequest"];
  [v17 doubleValue];
  PLUpdateSizeUnit(&retstr->var0[3], &retstr->var1[3], v18);

  v19 = [v10 objectForKeyedSubscript:@"storageDirtied"];
  [v19 doubleValue];
  PLUpdateSizeUnit(v5, v6, v20);

  v21 = [v10 objectForKeyedSubscript:@"cpuTimeMilliSeconds"];

  [v21 doubleValue];
  double v23 = v22;

  if (v23 > 1000.0)
  {
    retstr->var0[5] = 0.001;
    retstr->var1[5] = "s";
  }
  return result;
}

- (id)perfCheckLogStringWithPerfCheckInfo:(id)a3
{
  id v4 = a3;
  if (v4 || ([(PLTimedPerfCheck *)self stop], (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(PLTimedPerfCheck *)self perfUnitsFromPerfCheckInfo:v4];
    v26 = NSString;
    v27 = [v4 objectForKeyedSubscript:@"processMemoryPeakKiloBytesInitial"];
    [v27 doubleValue];
    double v6 = v5 * 0.0;
    v7 = [v4 objectForKeyedSubscript:@"processMemoryPeakKiloBytesAfterRequest"];
    [v7 doubleValue];
    double v9 = v8 * 0.0;
    id v10 = [v4 objectForKeyedSubscript:@"processMemoryCurrentKiloBytesInitial"];
    [v10 doubleValue];
    double v12 = v11 * 0.0;
    v13 = [v4 objectForKeyedSubscript:@"processMemoryCurrentKiloBytesAfterRequest"];
    [v13 doubleValue];
    double v15 = v14 * 0.0;
    double v16 = [v4 objectForKeyedSubscript:@"cpuTimeMilliSeconds"];
    [v16 doubleValue];
    double v18 = v17 * 0.0;
    v19 = [v4 objectForKeyedSubscript:@"cpuMillionInstructions"];
    [v19 doubleValue];
    uint64_t v21 = v20;
    double v22 = [v4 objectForKeyedSubscript:@"storageDirtied"];
    [v22 doubleValue];
    v24 = [v26 stringWithFormat:@", dirty memory before/after peak:[%.1f %s/%.1f %s], current:[%.1f %s/%.1f %s], CPU time %.2f%s, instructions %.3fM, dirty storage %.1f %s", *(void *)&v6, 0, *(void *)&v9, 0, *(void *)&v12, 0, *(void *)&v15, 0, *(void *)&v18, 0, v21, v23 * 0.0, 0];
  }
  else
  {
    v24 = @" (error getting perf check info)";
  }
  return v24;
}

- (id)endSessionAndReturnPerfCheckExtraInformation
{
  v19[7] = *MEMORY[0x1E4F143B8];
  p_sessionCompletedLock = &self->_sessionCompletedLock;
  os_unfair_lock_lock(&self->_sessionCompletedLock);
  if (self->_isSessionCompleted)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      id v4 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x1E4F14500];
    double v8 = "End performance check session called multiple times";
LABEL_17:
    _os_log_error_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
    goto LABEL_3;
  }
  if (!self->_pc_session)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x1E4F14500];
    double v8 = "End performance check session called with invalid session token";
    goto LABEL_17;
  }
  int v5 = pc_session_end();
  if (v5)
  {
    int v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = strerror(v6);
      _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to end performance check session: %s", buf, 0xCu);
    }
    id v4 = 0;
  }
  else
  {
    *(void *)buf = 0;
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    v18[0] = @"processMemoryPeakKiloBytesInitial";
    double v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_initialProcessMemoryPeak];
    v19[0] = v9;
    v18[1] = @"processMemoryPeakKiloBytesAfterRequest";
    id v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.0];
    v19[1] = v10;
    v18[2] = @"processMemoryCurrentKiloBytesInitial";
    double v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_initialProcessMemoryCurrent];
    v19[2] = v11;
    v18[3] = @"processMemoryCurrentKiloBytesAfterRequest";
    double v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.0];
    v19[3] = v12;
    v18[4] = @"cpuTimeMilliSeconds";
    v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.0 / 1000000.0];
    v19[4] = v13;
    v18[5] = @"cpuMillionInstructions";
    double v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.0 / 1000000.0];
    v19[5] = v14;
    v18[6] = @"storageDirtied";
    double v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.0];
    v19[6] = v15;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];
  }
  self->_isSessionCompleted = 1;
LABEL_13:
  os_unfair_lock_unlock(p_sessionCompletedLock);
  return v4;
}

- (void)setup
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (pc_session *)pc_session_create();
  self->_pc_session = v3;
  if (v3)
  {
    getpid();
    pc_session_set_procpid();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    int v4 = pc_session_begin();
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = strerror(v5);
        _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to begin performance check session: %s", buf, 0xCu);
      }
      pc_session_destroy();
      self->_pc_session = 0;
    }
    else
    {
      pc_session_get_value();
      pc_session_get_value();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = strerror(0);
    _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create performance check session: %s", buf, 0xCu);
  }
}

- (void)dealloc
{
  pc_session_destroy();
  self->_pc_session = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLTimedPerfCheck;
  [(PLTimedPerfCheck *)&v3 dealloc];
}

- (PLTimedPerfCheck)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLTimedPerfCheck;
  v2 = [(PLTimedPerfCheck *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_isSessionCompleted = 0;
    v2->_sessionCompletedLock._os_unfair_lock_opaque = 0;
    [(PLTimedPerfCheck *)v2 setup];
  }
  return v3;
}

+ (id)start
{
  v2 = objc_alloc_init(PLTimedPerfCheck);
  return v2;
}

@end