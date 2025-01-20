@interface SBPressSequenceObserver
- (NSString)pressName;
- (SBPressCollector)pressCollector;
- (SBPressSequenceObserver)init;
- (SBPressSequenceObserver)initWithPressName:(id)a3;
- (void)_notePowerDownImminent;
- (void)_setPressCollector:(id)a3;
- (void)dealloc;
- (void)noteDidBeginSOSWithUUID:(id)a3;
- (void)pressCollector:(id)a3 didCollectSequence:(id)a4;
@end

@implementation SBPressSequenceObserver

- (SBPressSequenceObserver)init
{
  return [(SBPressSequenceObserver *)self initWithPressName:@"None"];
}

- (SBPressSequenceObserver)initWithPressName:(id)a3
{
  v4 = (NSString *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPressSequenceObserver;
  v5 = [(SBPressSequenceObserver *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_pressName = v4;
    v7 = objc_alloc_init(SBPressCollector);
    pressCollector = v6->_pressCollector;
    v6->_pressCollector = v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__notePowerDownImminent name:@"SBRestartManagerWillRebootNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBRestartManagerWillRebootNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBPressSequenceObserver;
  [(SBPressSequenceObserver *)&v4 dealloc];
}

- (void)noteDidBeginSOSWithUUID:(id)a3
{
}

- (void)pressCollector:(id)a3 didCollectSequence:(id)a4
{
  if (objc_msgSend(a4, "count", a3))
  {
    v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBPressSequenceObserver pressCollector:didCollectSequence:]((uint64_t)self, v5);
    }
  }
  sosTriggerUUID = self->_sosTriggerUUID;
  self->_sosTriggerUUID = 0;
}

- (void)_notePowerDownImminent
{
}

- (void)_setPressCollector:(id)a3
{
}

- (NSString)pressName
{
  return self->_pressName;
}

- (SBPressCollector)pressCollector
{
  return self->_pressCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressCollector, 0);
  objc_storeStrong((id *)&self->_sosTriggerUUID, 0);
}

- (void)pressCollector:(uint64_t)a1 didCollectSequence:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 8) UUIDString];
  int v4 = 136315394;
  v5 = "-[SBPressSequenceObserver pressCollector:didCollectSequence:]";
  __int16 v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "%s: _sosTriggerUUID: %@", (uint8_t *)&v4, 0x16u);
}

@end