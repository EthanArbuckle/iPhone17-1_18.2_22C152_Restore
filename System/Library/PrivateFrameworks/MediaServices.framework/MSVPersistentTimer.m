@interface MSVPersistentTimer
- (BOOL)isValid;
- (MSVPersistentTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6;
- (void)_handleTimerElapsed:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithReason:(id)a3;
@end

@implementation MSVPersistentTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (BOOL)isValid
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_timer != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)invalidateWithReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_timer)
  {
    v6 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        name = v5->_name;
        int v14 = 138412546;
        v15 = name;
        __int16 v16 = 2112;
        id v17 = v4;
        v9 = "[MSVPersistentTimer] Timer <%@> invalidated because <%@>";
        v10 = v6;
        uint32_t v11 = 22;
LABEL_7:
        _os_log_impl(&dword_1A30CD000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
    else if (v7)
    {
      v12 = v5->_name;
      int v14 = 138412290;
      v15 = v12;
      v9 = "[MSVPersistentTimer] Timer <%@> invalidated";
      v10 = v6;
      uint32_t v11 = 12;
      goto LABEL_7;
    }

    [(PCPersistentTimer *)v5->_timer invalidate];
    timer = v5->_timer;
    v5->_timer = 0;
  }
  objc_sync_exit(v5);
}

- (void)invalidate
{
}

- (void)_handleTimerElapsed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_timer)
  {
    v6 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      name = v5->_name;
      v8 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSinceDate:v5->_startDate];
      double interval = v5->_interval;
      int v13 = 138412802;
      int v14 = name;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      double v18 = interval;
      _os_log_impl(&dword_1A30CD000, v6, OS_LOG_TYPE_DEFAULT, "[MSVPersistentTimer] Timer <%@> elapased after <%lf> seconds (<%lf> expected)", (uint8_t *)&v13, 0x20u);
    }
    [(MSVPersistentTimer *)v5 invalidateWithReason:@"TimerElapsed"];
    timer = v5->_timer;
    v5->_timer = 0;

    v12 = (void (**)(void))[v5->_block copy];
  }
  else
  {
    v12 = 0;
  }
  objc_sync_exit(v5);

  if (v12) {
    v12[2](v12);
  }
}

- (void)dealloc
{
  [(MSVPersistentTimer *)self invalidateWithReason:@"Dealloc"];
  v3.receiver = self;
  v3.super_class = (Class)MSVPersistentTimer;
  [(MSVPersistentTimer *)&v3 dealloc];
}

- (MSVPersistentTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)MSVPersistentTimer;
  int v13 = [(MSVPersistentTimer *)&v33 init];
  int v14 = v13;
  if (v13)
  {
    v13->_double interval = a3;
    uint64_t v15 = [v12 copy];
    id block = v14->_block;
    v14->_id block = (id)v15;

    uint64_t v17 = [[NSString alloc] initWithFormat:@"%@-%p", v10, v14];
    name = v14->_name;
    v14->_name = (NSString *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v19;

    v21 = [MEMORY[0x1E4F28B50] mainBundle];
    v22 = [v21 bundleIdentifier];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      v25 = [MEMORY[0x1E4F28F80] processInfo];
      id v24 = [v25 processName];
    }
    v26 = [NSString stringWithFormat:@"%@.MSVTimer", v24];
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F89D38]) initWithTimeInterval:v26 serviceIdentifier:v14 target:sel__handleTimerElapsed_ selector:0 userInfo:a3];
    timer = v14->_timer;
    v14->_timer = (PCPersistentTimer *)v27;

    if (v11) {
      id v29 = v11;
    }
    else {
      id v29 = (id)MEMORY[0x1E4F14428];
    }
    [(PCPersistentTimer *)v14->_timer scheduleInQueue:v29];
    v30 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v14->_name;
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      __int16 v36 = 2048;
      double v37 = a3;
      _os_log_impl(&dword_1A30CD000, v30, OS_LOG_TYPE_DEFAULT, "[MSVPersistentTimer] Setting timer <%@> for <%lf> seconds", buf, 0x16u);
    }
  }
  return v14;
}

@end