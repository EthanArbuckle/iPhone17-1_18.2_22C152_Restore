@interface _SBIdleTimerGlobalSettingMonitor
- (BOOL)_updateCache;
- (NSString)label;
- (_SBIdleTimerGlobalSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4;
- (_SBIdleTimerGlobalSettingMonitorDelegate)delegate;
- (id)formattedValue;
- (void)setDelegate:(id)a3;
@end

@implementation _SBIdleTimerGlobalSettingMonitor

- (_SBIdleTimerGlobalSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBIdleTimerGlobalStateMonitor.m", 413, @"Invalid parameter not satisfying: %@", @"label" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SBIdleTimerGlobalStateMonitor.m", 414, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_SBIdleTimerGlobalSettingMonitor;
  v10 = [(_SBIdleTimerGlobalSettingMonitor *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    label = v10->_label;
    v10->_label = (NSString *)v11;

    objc_storeWeak((id *)&v10->_delegate, v9);
  }

  return v10;
}

- (id)formattedValue
{
  return &stru_1F3084718;
}

- (NSString)label
{
  return self->_label;
}

- (_SBIdleTimerGlobalSettingMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBIdleTimerGlobalSettingMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_label, 0);
}

- (BOOL)_updateCache
{
  return 0;
}

@end