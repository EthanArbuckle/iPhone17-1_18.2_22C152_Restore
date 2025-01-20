@interface SPIPowerLogger
- (SPIPowerLogger)init;
- (SPIPowerLogger)initWithCurrentProcess;
- (SPIPowerLogger)initWithProcessIdentifier:(int)a3;
- (id)captureSnapshot;
- (int)pid;
- (unsigned)process;
@end

@implementation SPIPowerLogger

- (SPIPowerLogger)init
{
  return 0;
}

- (SPIPowerLogger)initWithProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)SPIPowerLogger;
  v4 = [(SPIPowerLogger *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->pid = v3;
    v4->process = +[SPIProcessUtils getProcessForPid:v3];
  }
  return v5;
}

- (SPIPowerLogger)initWithCurrentProcess
{
  uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v4 = [v3 processIdentifier];

  return [(SPIPowerLogger *)self initWithProcessIdentifier:v4];
}

- (id)captureSnapshot
{
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  uint64_t v3 = mach_absolute_time();
  int v4 = +[SPIProcessUtils getUsageForPid:[(SPIPowerLogger *)self pid] withOutput:&v10];
  v5 = 0;
  if (!v4)
  {
    v6 = [SPIPowerLoggerSnapshot alloc];
    long long v8 = v10;
    uint64_t v9 = v11;
    v5 = [(SPIPowerLoggerSnapshot *)v6 initWithPowerLogger:self usage:&v8 captureTimestamp:v3];
  }

  return v5;
}

- (int)pid
{
  return self->pid;
}

- (unsigned)process
{
  return self->process;
}

@end