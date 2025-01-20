@interface TSClockMetrics
- (TSClockMetrics)initWithDaemonMetrics:(id)a3;
- (TSClockMetrics)initWithInterfaceMetrics:(id *)a3;
- (id)toDaemonMetrics;
- (unint64_t)clockIdentity;
- (unint64_t)coreAudioReanchors;
- (unint64_t)gmChangesCount;
- (unint64_t)timeToChangeGm;
- (unint64_t)timeToLock;
- (void)printMetrics;
@end

@implementation TSClockMetrics

- (TSClockMetrics)initWithDaemonMetrics:(id)a3
{
  id v4 = a3;
  self->_clockIdentity = [v4 clockIdentity];
  self->_gmChangesCount = [v4 gmChangesCount];
  self->_timeToChangeGm = [v4 timeToChangeGm];
  self->_timeToLock = [v4 timeToLock];
  unint64_t v5 = [v4 coreAudioReanchors];

  self->_coreAudioReanchors = v5;
  return self;
}

- (id)toDaemonMetrics
{
  v3 = [_TSF_TSDClockMetrics alloc];
  [(_TSF_TSDClockMetrics *)v3 setClockIdentity:self->_clockIdentity];
  [(_TSF_TSDClockMetrics *)v3 setGmChangesCount:self->_gmChangesCount];
  [(_TSF_TSDClockMetrics *)v3 setTimeToChangeGm:self->_timeToChangeGm];
  [(_TSF_TSDClockMetrics *)v3 setTimeToLock:self->_timeToLock];
  [(_TSF_TSDClockMetrics *)v3 setCoreAudioReanchors:self->_coreAudioReanchors];
  return v3;
}

- (TSClockMetrics)initWithInterfaceMetrics:(id *)a3
{
  self->_clockIdentity = a3->var0;
  long long v3 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_gmChangesCount = *(_OWORD *)&a3->var1;
  *(_OWORD *)&self->_timeToLock = v3;
  return self;
}

- (void)printMetrics
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Clock Metrics:", (uint8_t *)&v8, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t clockIdentity = self->_clockIdentity;
    int v8 = 134217984;
    unint64_t v9 = clockIdentity;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Clock Identity = %llx\n", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t gmChangesCount = self->_gmChangesCount;
    int v8 = 134217984;
    unint64_t v9 = gmChangesCount;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  GM Changes = %zu\n", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t timeToChangeGm = self->_timeToChangeGm;
    int v8 = 134217984;
    unint64_t v9 = timeToChangeGm;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Time to change GM = %zu\n", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t timeToLock = self->_timeToLock;
    int v8 = 134217984;
    unint64_t v9 = timeToLock;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Time to lock = %zu\n", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t coreAudioReanchors = self->_coreAudioReanchors;
    int v8 = 134217984;
    unint64_t v9 = coreAudioReanchors;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Core audio reanchors = %zu\n", (uint8_t *)&v8, 0xCu);
  }
}

- (unint64_t)clockIdentity
{
  return self->_clockIdentity;
}

- (unint64_t)gmChangesCount
{
  return self->_gmChangesCount;
}

- (unint64_t)timeToChangeGm
{
  return self->_timeToChangeGm;
}

- (unint64_t)timeToLock
{
  return self->_timeToLock;
}

- (unint64_t)coreAudioReanchors
{
  return self->_coreAudioReanchors;
}

@end