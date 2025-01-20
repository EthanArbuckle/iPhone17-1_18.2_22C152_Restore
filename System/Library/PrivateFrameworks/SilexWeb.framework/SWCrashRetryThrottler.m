@interface SWCrashRetryThrottler
- (BOOL)crashed;
- (BOOL)shouldReloadAfterWebProcessCrash;
- (unint64_t)retryPolicy;
- (void)setCrashed:(BOOL)a3;
@end

@implementation SWCrashRetryThrottler

- (BOOL)shouldReloadAfterWebProcessCrash
{
  BOOL v3 = [(SWCrashRetryThrottler *)self crashed];
  if (!v3) {
    [(SWCrashRetryThrottler *)self setCrashed:1];
  }
  return !v3;
}

- (unint64_t)retryPolicy
{
  return [(SWCrashRetryThrottler *)self shouldReloadAfterWebProcessCrash] ^ 1;
}

- (BOOL)crashed
{
  return self->_crashed;
}

- (void)setCrashed:(BOOL)a3
{
  self->_crashed = a3;
}

@end