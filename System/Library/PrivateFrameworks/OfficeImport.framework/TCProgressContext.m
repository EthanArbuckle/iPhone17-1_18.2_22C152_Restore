@interface TCProgressContext
+ (double)currentPosition;
+ (id)contextForCurrentThread;
+ (id)createBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5;
+ (id)stageForCurrentThread;
+ (void)addProgressObserver:(id)a3 selector:(SEL)a4;
+ (void)advanceProgress:(double)a3;
+ (void)advanceProgressInContext:(id)a3 progress:(double)a4;
+ (void)createContextForCurrentThreadWithParentContext:(id)a3;
+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4;
+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5;
+ (void)endBranch:(id)a3;
+ (void)endStage;
+ (void)popBranch;
+ (void)pushBranch:(id)a3;
+ (void)removeContextForCurrentThread;
+ (void)removeProgressObserver:(id)a3;
+ (void)setMessage:(id)a3;
+ (void)setProgress:(double)a3;
- (TCProgressContext)initWithParentContext:(id)a3;
- (id)currentStage;
- (id)rootStage;
- (void)dealloc;
- (void)reportProgress:(double)a3;
@end

@implementation TCProgressContext

+ (void)createContextForCurrentThreadWithParentContext:(id)a3
{
  id v6 = a3;
  v3 = [[TCProgressContext alloc] initWithParentContext:v6];
  v4 = [MEMORY[0x263F08B88] currentThread];
  v5 = [v4 threadDictionary];
  [v5 setObject:v3 forKey:@"TCProgressContext Instance"];
}

+ (void)removeContextForCurrentThread
{
  id v3 = [MEMORY[0x263F08B88] currentThread];
  v2 = [v3 threadDictionary];
  [v2 removeObjectForKey:@"TCProgressContext Instance"];
}

+ (void)addProgressObserver:(id)a3 selector:(SEL)a4
{
  id v8 = a3;
  id v6 = [a1 contextForCurrentThread];
  if (v6)
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v8 selector:a4 name:@"TCProgressNotification" object:v6];
  }
}

+ (void)removeProgressObserver:(id)a3
{
  id v6 = a3;
  v4 = [a1 contextForCurrentThread];
  if (v4)
  {
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:v6 name:@"TCProgressNotification" object:v4];
  }
}

+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4
{
}

+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5
{
  id v11 = a5;
  id v8 = [a1 contextForCurrentThread];
  if (v8)
  {
    v9 = [[TCProgressStage alloc] initWithSteps:v11 takingSteps:v8 name:a3 inContext:a4];
    v10 = (void *)v8[2];
    v8[2] = v9;
  }
}

+ (void)endStage
{
  v2 = [a1 contextForCurrentThread];
  if (v2)
  {
    id v6 = v2;
    id v3 = v2[2];
    [v3 end];
    uint64_t v4 = [v3 parentStage];
    id v5 = v6[2];
    v6[2] = (id)v4;

    v2 = v6;
  }
}

+ (id)createBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5
{
  id v8 = a5;
  v9 = [a1 contextForCurrentThread];
  if (v9) {
    id v10 = [[TCProgressStage alloc] initBranchWithSteps:v8 takingSteps:v9 name:a3 inContext:a4];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (void)endBranch:(id)a3
{
}

+ (void)pushBranch:(id)a3
{
  id v7 = a3;
  uint64_t v5 = [a1 contextForCurrentThread];
  id v6 = (id *)v5;
  if (v5)
  {
    [*(id *)(v5 + 32) addObject:*(void *)(v5 + 16)];
    objc_storeStrong(v6 + 2, a3);
  }
}

+ (void)popBranch
{
  uint64_t v4 = [a1 contextForCurrentThread];
  if (v4)
  {
    uint64_t v2 = [v4[4] lastObject];
    id v3 = v4[2];
    v4[2] = (id)v2;

    [v4[4] removeLastObject];
  }
}

+ (void)advanceProgress:(double)a3
{
  id v4 = [a1 stageForCurrentThread];
  [v4 advanceProgress:a3];
}

+ (void)advanceProgressInContext:(id)a3 progress:(double)a4
{
  id v5 = [a3 currentStage];
  [v5 advanceProgress:a4];
}

+ (void)setProgress:(double)a3
{
  id v4 = [a1 stageForCurrentThread];
  [v4 setProgress:a3];
}

+ (void)setMessage:(id)a3
{
  id v6 = [NSDictionary dictionaryWithObject:a3 forKey:@"TCProgressMessage"];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  id v5 = [a1 contextForCurrentThread];
  [v4 postNotificationName:@"TCProgressNotification" object:v5 userInfo:v6];
}

+ (double)currentPosition
{
  uint64_t v2 = [a1 stageForCurrentThread];
  [v2 currentPosition];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_stackOfBranches, 0);
  objc_storeStrong((id *)&self->m_lastReportTime, 0);
  objc_storeStrong((id *)&self->m_currentStage, 0);
  objc_storeStrong((id *)&self->m_parentProgressContext, 0);
}

- (TCProgressContext)initWithParentContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TCProgressContext;
  id v6 = [(TCProgressContext *)&v12 init];
  if (v6)
  {
    id v7 = [[TCProgressStage alloc] initRootStageInContext:v6];
    m_currentStage = v6->m_currentStage;
    v6->m_currentStage = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    m_stackOfBranches = v6->m_stackOfBranches;
    v6->m_stackOfBranches = v9;

    objc_storeStrong((id *)&v6->m_parentProgressContext, a3);
  }

  return v6;
}

- (void)dealloc
{
  m_currentStage = self->m_currentStage;
  self->m_currentStage = 0;

  m_lastReportTime = self->m_lastReportTime;
  self->m_lastReportTime = 0;

  m_stackOfBranches = self->m_stackOfBranches;
  self->m_stackOfBranches = 0;

  m_parentProgressContext = self->m_parentProgressContext;
  self->m_parentProgressContext = 0;

  v7.receiver = self;
  v7.super_class = (Class)TCProgressContext;
  [(TCProgressContext *)&v7 dealloc];
}

+ (id)contextForCurrentThread
{
  uint64_t v2 = [MEMORY[0x263F08B88] currentThread];
  double v3 = [v2 threadDictionary];
  double v4 = [v3 objectForKey:@"TCProgressContext Instance"];

  return v4;
}

+ (id)stageForCurrentThread
{
  uint64_t v2 = [a1 contextForCurrentThread];
  double v3 = [v2 currentStage];

  return v3;
}

- (id)currentStage
{
  return self->m_currentStage;
}

- (id)rootStage
{
  for (i = self->m_currentStage; ; i = (TCProgressStage *)v4)
  {
    double v3 = [(TCProgressStage *)i parentStage];

    if (!v3) {
      break;
    }
    uint64_t v4 = [(TCProgressStage *)i parentStage];
  }
  return i;
}

- (void)reportProgress:(double)a3
{
  m_parentProgressContext = self->m_parentProgressContext;
  if (m_parentProgressContext) {
    [(OITSUProgressContext *)m_parentProgressContext setPercentageProgressFromTCProgressContext:a3];
  }
}

@end