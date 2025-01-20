@interface OITSUFakeProgress
- (OITSUFakeProgress)initWithMaxValue:(double)a3 numberOfStages:(unint64_t)a4;
- (void)advanceToStage:(unint64_t)a3;
- (void)dealloc;
- (void)p_slowlyAdvanceToNextStage;
- (void)start;
- (void)stop;
@end

@implementation OITSUFakeProgress

- (OITSUFakeProgress)initWithMaxValue:(double)a3 numberOfStages:(unint64_t)a4
{
  if (!a4)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"-[OITSUFakeProgress initWithMaxValue:numberOfStages:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUProgress.m"], 651, 0, "Invalid parameter not satisfying: %{public}s", "numberOfStages > 0");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v10.receiver = self;
  v10.super_class = (Class)OITSUFakeProgress;
  v8 = [(OITSUBasicProgress *)&v10 initWithMaxValue:a3];
  if (v8)
  {
    v8->_accessQueue = (OS_dispatch_queue *)dispatch_queue_create("TSUFakeProgress", 0);
    v8->_numberOfStages = a4;
    v8->_stopped = 1;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUFakeProgress;
  [(OITSUBasicProgress *)&v3 dealloc];
}

- (void)start
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__OITSUFakeProgress_start__block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __26__OITSUFakeProgress_start__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 64))
  {
    *(unsigned char *)(v1 + 64) = 0;
    return objc_msgSend(*(id *)(result + 32), "p_slowlyAdvanceToNextStage");
  }
  return result;
}

- (void)stop
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__OITSUFakeProgress_stop__block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __25__OITSUFakeProgress_stop__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = 1;
  return result;
}

- (void)advanceToStage:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__OITSUFakeProgress_advanceToStage___block_invoke;
  v4[3] = &unk_264D61118;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

uint64_t __36__OITSUFakeProgress_advanceToStage___block_invoke(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  unint64_t v1 = *(void *)(result + 40);
  if (v1 > *(void *)(v2 + 48) && v1 <= *(void *)(v2 + 56))
  {
    uint64_t v3 = result;
    *(void *)(v2 + 48) = v1;
    v4 = *(unint64_t **)(result + 32);
    double v5 = (double)v4[6] / (double)v4[7];
    [v4 maxValue];
    double v7 = v6 * v5;
    v8 = *(void **)(v3 + 32);
    return [v8 setValue:v7];
  }
  return result;
}

- (void)p_slowlyAdvanceToNextStage
{
  if (!self->_stopped && self->_currentStage < self->_numberOfStages)
  {
    dispatch_time_t v3 = dispatch_time(0, 250000000);
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__OITSUFakeProgress_p_slowlyAdvanceToNextStage__block_invoke;
    block[3] = &unk_264D60B18;
    block[4] = self;
    dispatch_after(v3, accessQueue, block);
  }
}

uint64_t __47__OITSUFakeProgress_p_slowlyAdvanceToNextStage__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unint64_t **)(a1 + 32);
  double v3 = 1.0;
  double v4 = 1.0 / (double)v2[7];
  [v2 value];
  double v5 = *(unint64_t **)(a1 + 32);
  double v6 = (double)v5[6];
  double v8 = 1.0 - (1.0 - (v7 - v6 * v4) / v4) * 0.95;
  if (v8 > 0.95) {
    double v8 = 0.95;
  }
  double v9 = v4 * (v8 + v6);
  if (v9 <= 1.0) {
    double v3 = v9;
  }
  [v5 maxValue];
  [*(id *)(a1 + 32) setValue:v10 * v3];
  v11 = *(void **)(a1 + 32);
  return objc_msgSend(v11, "p_slowlyAdvanceToNextStage");
}

@end