@interface WFLoggerBase
- (NSNumber)getLogLifespanInDays;
- (unint64_t)getLogLevelEnable;
- (unint64_t)getLogLevelPersist;
- (unint64_t)getLogPrivacy;
- (unint64_t)getMaxFileSizeInMB;
- (unsigned)WFIsInternalInstall;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6;
- (void)dump;
- (void)setLogLevelEnable:(unint64_t)a3;
- (void)setLogLevelPersist:(unint64_t)a3;
- (void)setLogLifespanInDays:(id)a3;
- (void)setLogPrivacy:(unint64_t)a3;
- (void)setMaxSizeInKb:(unint64_t)a3;
- (void)stopWatchingLogFile;
@end

@implementation WFLoggerBase

- (unsigned)WFIsInternalInstall
{
  self->_internalInstall = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WFLoggerBase_WFIsInternalInstall__block_invoke;
  block[3] = &unk_1E69BCAB0;
  block[4] = self;
  if (WFIsInternalInstall___internalInstallOnceToken != -1) {
    dispatch_once(&WFIsInternalInstall___internalInstallOnceToken, block);
  }
  return self->_internalInstall;
}

uint64_t __35__WFLoggerBase_WFIsInternalInstall__block_invoke(uint64_t a1)
{
  uint64_t result = MGGetBoolAnswer();
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
}

- (void)setLogLifespanInDays:(id)a3
{
}

- (NSNumber)getLogLifespanInDays
{
  return 0;
}

- (void)setLogPrivacy:(unint64_t)a3
{
}

- (unint64_t)getLogPrivacy
{
  return 1;
}

- (void)setLogLevelEnable:(unint64_t)a3
{
}

- (unint64_t)getLogLevelEnable
{
  return 3;
}

- (void)setLogLevelPersist:(unint64_t)a3
{
}

- (unint64_t)getLogLevelPersist
{
  return 3;
}

- (unint64_t)getMaxFileSizeInMB
{
  return 0;
}

- (void)setMaxSizeInKb:(unint64_t)a3
{
}

- (void)stopWatchingLogFile
{
}

- (void)dump
{
}

@end