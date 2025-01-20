@interface OITSUProgressContext
- (OITSUProgressContext)init;
- (double)currentPosition;
- (double)overallProgress;
- (id)addProgressObserverBlock:(id)a3;
- (id)currentStage;
- (id)description;
- (void)addProgressObserver:(id)a3 selector:(SEL)a4;
- (void)advanceProgress:(double)a3;
- (void)createStageWithSteps:(double)a3;
- (void)createStageWithSteps:(double)a3 takingSteps:(double)a4;
- (void)dealloc;
- (void)endStage;
- (void)nextSubStageWillTakeThisManyOfMySteps:(double)a3;
- (void)removeProgressObserver:(id)a3;
- (void)reportProgress:(double)a3 overallProgress:(double)a4;
- (void)reset;
- (void)setMessage:(id)a3;
- (void)setPercentageProgressFromTCProgressContext:(double)a3;
- (void)setProgress:(double)a3;
@end

@implementation OITSUProgressContext

- (void)reset
{
  objc_sync_enter(self);

  self->m_currentStage = (OITSUProgressStage *)[[OITSUProgressStage alloc] initRootStageInContext:self];
  self->m_lastProgressReport = 0.0;
  self->m_lastOverallProgress = 0.0;
  objc_sync_exit(self);
}

- (void)addProgressObserver:(id)a3 selector:(SEL)a4
{
  v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:a3 selector:a4 name:@"TSUProgressNotification" object:self];
}

- (id)addProgressObserverBlock:(id)a3
{
  v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__OITSUProgressContext_addProgressObserverBlock___block_invoke;
  v7[3] = &unk_264D60D58;
  v7[4] = a3;
  return (id)[v5 addObserverForName:@"TSUProgressNotification" object:self queue:0 usingBlock:v7];
}

void *__49__OITSUProgressContext_addProgressObserverBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_opt_class();
  result = (void *)TSUDynamicCast(v4, objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"TSUProgressOverallProgress"));
  if (result)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    [result doubleValue];
    v7 = *(uint64_t (**)(uint64_t))(v6 + 16);
    return (void *)v7(v6);
  }
  return result;
}

- (void)removeProgressObserver:(id)a3
{
  v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:a3 name:@"TSUProgressNotification" object:self];
}

- (void)createStageWithSteps:(double)a3 takingSteps:(double)a4
{
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  else {
    double v6 = 1.0;
  }
  if (a4 <= 0.0 && TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_10);
  }
  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  self->m_currentStage = [[OITSUProgressStage alloc] initWithSteps:self takingSteps:v6 inContext:a4];

  objc_sync_exit(self);
}

os_log_t __57__OITSUProgressContext_createStageWithSteps_takingSteps___block_invoke()
{
  os_log_t result = TSULogCreateCategory("TSUDefaultCat");
  TSUDefaultCat_log_t = (uint64_t)result;
  return result;
}

- (void)createStageWithSteps:(double)a3
{
  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  if (m_currentStage)
  {
    [(OITSUProgressStage *)self->m_currentStage nextSubStageParentSize];
    double v7 = v6;
    [(OITSUProgressStage *)m_currentStage setNextSubStageParentSize:1.0];
  }
  else
  {
    double v7 = 1.0;
  }
  objc_sync_exit(self);
  [(OITSUProgressContext *)self createStageWithSteps:a3 takingSteps:v7];
}

- (void)nextSubStageWillTakeThisManyOfMySteps:(double)a3
{
  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  if (m_currentStage) {
    [(OITSUProgressStage *)m_currentStage setNextSubStageParentSize:a3];
  }
  objc_sync_exit(self);
}

- (void)endStage
{
  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  [(OITSUProgressStage *)m_currentStage end];
  self->m_currentStage = (OITSUProgressStage *)[(OITSUProgressStage *)m_currentStage parentStage];

  objc_sync_exit(self);
}

- (void)advanceProgress:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[OITSUProgressContext currentStage](self, "currentStage"), "advanceProgress:", a3);
  objc_sync_exit(self);
}

- (void)setProgress:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[OITSUProgressContext currentStage](self, "currentStage"), "setProgress:", a3);
  objc_sync_exit(self);
}

- (void)setPercentageProgressFromTCProgressContext:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[OITSUProgressContext currentStage](self, "currentStage"), "setProgressPercentage:", a3);
  objc_sync_exit(self);
}

- (void)setMessage:(id)a3
{
  if (!a3) {
    a3 = &stru_26EBF24D8;
  }
  uint64_t v4 = [NSDictionary dictionaryWithObject:a3 forKey:@"TSUProgressMessage"];
  v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"TSUProgressNotification" object:self userInfo:v4];
}

- (double)currentPosition
{
  objc_sync_enter(self);
  id v3 = [(OITSUProgressContext *)self currentStage];
  if (v3)
  {
    [v3 currentPosition];
    double m_lastProgressReport = v4;
  }
  else
  {
    double m_lastProgressReport = self->m_lastProgressReport;
  }
  objc_sync_exit(self);
  return m_lastProgressReport;
}

- (double)overallProgress
{
  objc_sync_enter(self);
  id v3 = [(OITSUProgressContext *)self currentStage];
  if (v3)
  {
    [v3 overallProgress];
    double m_lastOverallProgress = v4;
  }
  else
  {
    double m_lastOverallProgress = self->m_lastOverallProgress;
  }
  objc_sync_exit(self);
  return m_lastOverallProgress;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x263F089D8];
  [(OITSUProgressContext *)self currentPosition];
  uint64_t v5 = v4;
  [(OITSUProgressContext *)self overallProgress];
  double v7 = (void *)[v3 stringWithFormat:@"TSUProgressContext %p: currentPosition = %g, overallProgress = %g", self, v5, v6];
  id v8 = [(OITSUProgressContext *)self currentStage];
  [v7 appendString:objc_msgSend(NSString, "stringWithFormat:", @"\ncurrentStage: %@", v8)];
  v9 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v10 = [v8 parentStage];
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      [v9 appendString:@"    "];
      [v7 appendString:objc_msgSend(NSString, "stringWithFormat:", @"\n%@parent: %@", v9, v11)];
      v11 = (void *)[v11 parentStage];
    }
    while (v11);
  }
  return v7;
}

- (OITSUProgressContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)OITSUProgressContext;
  v2 = [(OITSUProgressContext *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(OITSUProgressContext *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  self->m_currentStage = 0;
  self->m_lastReportTime = 0;
  v3.receiver = self;
  v3.super_class = (Class)OITSUProgressContext;
  [(OITSUProgressContext *)&v3 dealloc];
}

- (id)currentStage
{
  return self->m_currentStage;
}

- (void)reportProgress:(double)a3 overallProgress:(double)a4
{
  objc_sync_enter(self);
  self->double m_lastOverallProgress = a4;
  m_lastReportTime = self->m_lastReportTime;
  if (!m_lastReportTime
    || ([(NSDate *)m_lastReportTime timeIntervalSinceNow], a3 >= 100.0)
    || v8 < -0.1
    || a3 - self->m_lastProgressReport >= 5.0)
  {
    uint64_t v9 = [NSNumber numberWithDouble:a3];
    uint64_t v10 = [NSNumber numberWithDouble:a4];
    uint64_t v11 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v9, @"TSUProgressCurrentPosition", v10, @"TSUProgressOverallProgress", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSUProgressNotification", self, v11);

    self->m_lastReportTime = (NSDate *)(id)[MEMORY[0x263EFF910] date];
    self->double m_lastProgressReport = a3;
  }
  objc_sync_exit(self);
}

@end