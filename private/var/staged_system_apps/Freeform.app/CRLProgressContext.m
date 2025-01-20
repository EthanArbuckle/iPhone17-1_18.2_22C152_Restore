@interface CRLProgressContext
- (CRLProgressContext)init;
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

@implementation CRLProgressContext

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [[CRLProgressStage alloc] initRootStageInContext:obj];
  m_currentStage = obj->m_currentStage;
  obj->m_currentStage = v2;

  obj->m_lastProgressReport = 0.0;
  obj->m_lastOverallProgress = 0.0;
  objc_sync_exit(obj);
}

- (void)addProgressObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:v6 selector:a4 name:@"CRLProgressNotification" object:self];
}

- (id)addProgressObserverBlock:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10018DCEC;
  v9[3] = &unk_1014DC6F0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 crl_addObserverForName:@"CRLProgressNotification" object:self queue:0 usingBlock:v9];

  return v7;
}

- (void)removeProgressObserver:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:v4 name:@"CRLProgressNotification" object:self];
}

- (void)createStageWithSteps:(double)a3 takingSteps:(double)a4
{
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  else {
    double v6 = 1.0;
  }
  if (a4 <= 0.0)
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014DC710);
    }
    id v7 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_1010817BC(v7, a4);
    }
  }
  v8 = self;
  objc_sync_enter(v8);
  v9 = [[CRLProgressStage alloc] initWithSteps:v8 takingSteps:v6 inContext:a4];
  m_currentStage = v8->m_currentStage;
  v8->m_currentStage = v9;

  objc_sync_exit(v8);
}

- (void)createStageWithSteps:(double)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = v4->m_currentStage;
  double v6 = v5;
  if (v5)
  {
    [(CRLProgressStage *)v5 nextSubStageParentSize];
    double v8 = v7;
    [(CRLProgressStage *)v6 setNextSubStageParentSize:1.0];
  }
  else
  {
    double v8 = 1.0;
  }

  objc_sync_exit(v4);

  [(CRLProgressContext *)v4 createStageWithSteps:a3 takingSteps:v8];
}

- (void)nextSubStageWillTakeThisManyOfMySteps:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj->m_currentStage;
  id v5 = v4;
  if (v4) {
    [(CRLProgressStage *)v4 setNextSubStageParentSize:a3];
  }

  objc_sync_exit(obj);
}

- (void)endStage
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj->m_currentStage;
  [(CRLProgressStage *)v2 end];
  uint64_t v3 = [(CRLProgressStage *)v2 parentStage];
  m_currentStage = obj->m_currentStage;
  obj->m_currentStage = (CRLProgressStage *)v3;

  objc_sync_exit(obj);
}

- (void)advanceProgress:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = [(CRLProgressContext *)obj currentStage];
  [v4 advanceProgress:a3];

  objc_sync_exit(obj);
}

- (void)setProgress:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = [(CRLProgressContext *)obj currentStage];
  [v4 setProgress:a3];

  objc_sync_exit(obj);
}

- (void)setPercentageProgressFromTCProgressContext:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = [(CRLProgressContext *)obj currentStage];
  [v4 setProgressPercentage:a3];

  objc_sync_exit(obj);
}

- (void)setMessage:(id)a3
{
  if (!a3) {
    a3 = &stru_101538650;
  }
  id v5 = +[NSDictionary dictionaryWithObject:a3 forKey:@"CRLProgressMessage"];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CRLProgressNotification" object:self userInfo:v5];
}

- (double)currentPosition
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(CRLProgressContext *)v2 currentStage];
  id v4 = v3;
  if (v3)
  {
    [v3 currentPosition];
    double m_lastProgressReport = v5;
  }
  else
  {
    double m_lastProgressReport = v2->m_lastProgressReport;
  }

  objc_sync_exit(v2);
  return m_lastProgressReport;
}

- (double)overallProgress
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(CRLProgressContext *)v2 currentStage];
  id v4 = v3;
  if (v3)
  {
    [v3 overallProgress];
    double m_lastOverallProgress = v5;
  }
  else
  {
    double m_lastOverallProgress = v2->m_lastOverallProgress;
  }

  objc_sync_exit(v2);
  return m_lastOverallProgress;
}

- (id)description
{
  [(CRLProgressContext *)self currentPosition];
  uint64_t v4 = v3;
  [(CRLProgressContext *)self overallProgress];
  double v6 = +[NSMutableString stringWithFormat:@"CRLProgressContext %p: currentPosition = %g, overallProgress = %g", self, v4, v5];
  double v7 = [(CRLProgressContext *)self currentStage];
  double v8 = +[NSString stringWithFormat:@"\ncurrentStage: %@", v7];
  [v6 appendString:v8];

  v9 = +[NSMutableString string];
  id v10 = [v7 parentStage];

  if (v10)
  {
    do
    {
      [v9 appendString:@"    "];
      v11 = +[NSString stringWithFormat:@"\n%@parent: %@", v9, v10];
      [v6 appendString:v11];

      uint64_t v12 = [v10 parentStage];

      id v10 = (void *)v12;
    }
    while (v12);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_lastReportTime, 0);

  objc_storeStrong((id *)&self->m_currentStage, 0);
}

- (CRLProgressContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLProgressContext;
  v2 = [(CRLProgressContext *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(CRLProgressContext *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  m_currentStage = self->m_currentStage;
  self->m_currentStage = 0;

  m_lastReportTime = self->m_lastReportTime;
  self->m_lastReportTime = 0;

  v5.receiver = self;
  v5.super_class = (Class)CRLProgressContext;
  [(CRLProgressContext *)&v5 dealloc];
}

- (id)currentStage
{
  return self->m_currentStage;
}

- (void)reportProgress:(double)a3 overallProgress:(double)a4
{
  obj = self;
  objc_sync_enter(obj);
  obj->double m_lastOverallProgress = a4;
  m_lastReportTime = obj->m_lastReportTime;
  if (!m_lastReportTime
    || ([(NSDate *)m_lastReportTime timeIntervalSinceNow], a3 >= 100.0)
    || v7 < -0.1
    || a3 - obj->m_lastProgressReport >= 5.0)
  {
    double v8 = +[NSNumber numberWithDouble:a3];
    v9 = +[NSNumber numberWithDouble:a4];
    id v10 = +[NSDictionary dictionaryWithObjectsAndKeys:v8, @"CRLProgressCurrentPosition", v9, @"CRLProgressOverallProgress", 0];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 postNotificationName:@"CRLProgressNotification" object:obj userInfo:v10];

    uint64_t v12 = +[NSDate date];
    v13 = obj->m_lastReportTime;
    obj->m_lastReportTime = (NSDate *)v12;

    obj->double m_lastProgressReport = a3;
  }
  objc_sync_exit(obj);
}

@end