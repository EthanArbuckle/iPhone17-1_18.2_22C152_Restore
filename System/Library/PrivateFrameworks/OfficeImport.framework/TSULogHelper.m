@interface TSULogHelper
+ (id)sharedInstance;
- (BOOL)incrementThrottleCountAndCheckThottleMax:(unint64_t)a3;
- (NSDate)lastThrottleCheck;
- (unint64_t)throttleCount;
- (void)setLastThrottleCheck:(id)a3;
- (void)setThrottleCount:(unint64_t)a3;
@end

@implementation TSULogHelper

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_34);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

void __30__TSULogHelper_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TSULogHelper);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;
}

- (BOOL)incrementThrottleCountAndCheckThottleMax:(unint64_t)a3
{
  unint64_t v5 = [(TSULogHelper *)self throttleCount];
  [(TSULogHelper *)self setThrottleCount:[(TSULogHelper *)self throttleCount] + 1];
  v6 = [(TSULogHelper *)self lastThrottleCheck];
  if (v5 == a3 && TSUPerformanceCat_init_token != -1) {
    dispatch_once(&TSUPerformanceCat_init_token, &__block_literal_global_87_0);
  }
  if (v5 < a3 || !v6) {
    goto LABEL_12;
  }
  [v6 timeIntervalSinceNow];
  double v8 = v7;
  [v6 timeIntervalSinceNow];
  if (v9 < -300.0)
  {
    if (TSUPerformanceCat_init_token != -1) {
      dispatch_once(&TSUPerformanceCat_init_token, &__block_literal_global_90_0);
    }
    [(TSULogHelper *)self setThrottleCount:0];
  }
  if (v8 >= -60.0)
  {
    BOOL v10 = 1;
  }
  else
  {
LABEL_12:
    v11 = [MEMORY[0x263EFF910] date];
    [(TSULogHelper *)self setLastThrottleCheck:v11];

    BOOL v10 = 0;
  }

  return v10;
}

void __57__TSULogHelper_incrementThrottleCountAndCheckThottleMax___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUPerformanceCat");
  v1 = (void *)TSUPerformanceCat_log_t;
  TSUPerformanceCat_log_t = v0;
}

void __57__TSULogHelper_incrementThrottleCountAndCheckThottleMax___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUPerformanceCat");
  v1 = (void *)TSUPerformanceCat_log_t;
  TSUPerformanceCat_log_t = v0;
}

- (unint64_t)throttleCount
{
  return self->_throttleCount;
}

- (void)setThrottleCount:(unint64_t)a3
{
  self->_throttleCount = a3;
}

- (NSDate)lastThrottleCheck
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastThrottleCheck:(id)a3
{
}

- (void).cxx_destruct
{
}

@end