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
  v3 = [[TCProgressContext alloc] initWithParentContext:a3];
  [(NSMutableDictionary *)[+[NSThread currentThread] threadDictionary] setObject:v3 forKey:@"TCProgressContext Instance"];
}

+ (void)removeContextForCurrentThread
{
  v2 = [+[NSThread currentThread] threadDictionary];

  [(NSMutableDictionary *)v2 removeObjectForKey:@"TCProgressContext Instance"];
}

+ (void)addProgressObserver:(id)a3 selector:(SEL)a4
{
  id v6 = [a1 contextForCurrentThread];
  if (v6)
  {
    id v7 = v6;
    v8 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v8 addObserver:a3 selector:a4 name:@"TCProgressNotification" object:v7];
  }
}

+ (void)removeProgressObserver:(id)a3
{
  id v4 = [a1 contextForCurrentThread];
  if (v4)
  {
    id v5 = v4;
    id v6 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v6 removeObserver:a3 name:@"TCProgressNotification" object:v5];
  }
}

+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4
{
}

+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5
{
  v8 = [a1 contextForCurrentThread];
  if (v8)
  {
    id v9 = (id)v8[2];
    v8[2] = [[TCProgressStage alloc] initWithSteps:a5 takingSteps:v8 name:a3 inContext:a4];
  }
}

+ (void)endStage
{
  v2 = [a1 contextForCurrentThread];
  if (v2)
  {
    v3 = v2;
    id v4 = (id)v2[2];
    [v4 end];
    v3[2] = [v4 parentStage];
  }
}

+ (id)createBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5
{
  id result = [a1 contextForCurrentThread];
  if (result)
  {
    id v9 = result;
    v10 = [TCProgressStage alloc];
    return [(TCProgressStage *)v10 initBranchWithSteps:a5 takingSteps:v9 name:a3 inContext:a4];
  }
  return result;
}

+ (void)endBranch:(id)a3
{
  [a3 end];
}

+ (void)pushBranch:(id)a3
{
  id v4 = (id *)[a1 contextForCurrentThread];
  if (v4)
  {
    id v5 = v4;
    [v4[4] addObject:v4[2]];
    v5[2] = a3;
  }
}

+ (void)popBranch
{
  v2 = (id *)[a1 contextForCurrentThread];
  if (v2)
  {
    v3 = v2;
    v2[2] = [v2[4] lastObject];
    id v4 = v3[4];
    [v4 removeLastObject];
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
  id v4 = +[NSDictionary dictionaryWithObject:a3 forKey:@"TCProgressMessage"];
  id v5 = +[NSNotificationCenter defaultCenter];
  id v6 = [a1 contextForCurrentThread];

  [(NSNotificationCenter *)v5 postNotificationName:@"TCProgressNotification" object:v6 userInfo:v4];
}

+ (double)currentPosition
{
  id v2 = [a1 stageForCurrentThread];

  [v2 currentPosition];
  return result;
}

- (TCProgressContext)initWithParentContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TCProgressContext;
  id v4 = [(TCProgressContext *)&v7 init];
  if (v4)
  {
    v4->m_currentStage = (TCProgressStage *)[[TCProgressStage alloc] initRootStageInContext:v4];
    v4->m_stackOfBranches = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v5 = a3;

    v4->m_parentProgressContext = (TSUProgressContext *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->m_currentStage = 0;
  self->m_lastReportTime = 0;

  self->m_stackOfBranches = 0;
  self->m_parentProgressContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)TCProgressContext;
  [(TCProgressContext *)&v3 dealloc];
}

+ (id)contextForCurrentThread
{
  id v2 = [+[NSThread currentThread] threadDictionary];

  return [(NSMutableDictionary *)v2 objectForKey:@"TCProgressContext Instance"];
}

+ (id)stageForCurrentThread
{
  id v2 = [a1 contextForCurrentThread];

  return [v2 currentStage];
}

- (id)currentStage
{
  return self->m_currentStage;
}

- (id)rootStage
{
  m_currentStage = self->m_currentStage;
  for (i = m_currentStage; [(TCProgressStage *)i parentStage]; m_currentStage = i)
    i = [(TCProgressStage *)m_currentStage parentStage];
  return m_currentStage;
}

- (void)reportProgress:(double)a3
{
  m_parentProgressContext = self->m_parentProgressContext;
  if (m_parentProgressContext) {
    [(TSUProgressContext *)m_parentProgressContext setPercentageProgressFromTCProgressContext:a3];
  }
}

@end