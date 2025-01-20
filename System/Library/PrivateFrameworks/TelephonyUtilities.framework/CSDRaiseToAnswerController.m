@interface CSDRaiseToAnswerController
+ (BOOL)isRaiseToEarGestureEnabled;
+ (BOOL)isRaiseToEarGestureSupported;
- (BOOL)isDetectingRaiseToAnswer;
- (CMGestureManager)raiseToEarGestureManager;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDRaiseToAnswerController)init;
- (CSDRaiseToAnswerController)initWithCallCenterObserver:(id)a3;
- (id)raiseToEarGestureHandler;
- (void)callCenterObserver:(id)a3 callChanged:(id)a4;
- (void)setDetectingRaiseToAnswer:(BOOL)a3;
- (void)setRaiseToEarGestureManager:(id)a3;
- (void)updateDetectingRaiseToAnswer;
@end

@implementation CSDRaiseToAnswerController

- (CSDRaiseToAnswerController)init
{
  v3 = objc_alloc_init(CSDCallCenterObserver);
  v4 = [(CSDRaiseToAnswerController *)self initWithCallCenterObserver:v3];

  return v4;
}

- (CSDRaiseToAnswerController)initWithCallCenterObserver:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSDRaiseToAnswerController;
  v6 = [(CSDRaiseToAnswerController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callCenterObserver, a3);
    [(CSDCallCenterObserver *)v7->_callCenterObserver setTriggers:1];
    [(CSDCallCenterObserver *)v7->_callCenterObserver setDelegate:v7];
    v8 = (CMGestureManager *)[objc_alloc((Class)CUTWeakLinkClass()) initWithPriority:2];
    raiseToEarGestureManager = v7->_raiseToEarGestureManager;
    v7->_raiseToEarGestureManager = v8;

    objc_initWeak(&location, v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10018CBD4;
    v13[3] = &unk_100505B18;
    objc_copyWeak(&v14, &location);
    v10 = objc_retainBlock(v13);
    id raiseToEarGestureHandler = v7->_raiseToEarGestureHandler;
    v7->_id raiseToEarGestureHandler = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (BOOL)isRaiseToEarGestureSupported
{
  if (qword_10058C4C0 != -1) {
    dispatch_once(&qword_10058C4C0, &stru_1005091F8);
  }
  return byte_10058C4B8;
}

+ (BOOL)isRaiseToEarGestureEnabled
{
  unsigned int v2 = [a1 isRaiseToEarGestureSupported];
  if (v2)
  {
    v3 = +[NSUserDefaults tu_defaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"incomingCallRaiseToAnswerEnabledKey"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)isDetectingRaiseToAnswer
{
  unsigned int v2 = [(CSDRaiseToAnswerController *)self raiseToEarGestureManager];
  v3 = [v2 gestureHandler];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setDetectingRaiseToAnswer:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v6 = [(CSDRaiseToAnswerController *)self raiseToEarGestureHandler];
  }
  else
  {
    id v6 = 0;
  }
  id v5 = [(CSDRaiseToAnswerController *)self raiseToEarGestureManager];
  [v5 setGestureHandler:v6];

  if (v3)
  {
  }
}

- (void)updateDetectingRaiseToAnswer
{
  if ([(id)objc_opt_class() isRaiseToEarGestureEnabled])
  {
    id v7 = [(CSDRaiseToAnswerController *)self callCenterObserver];
    BOOL v3 = [v7 callContainer];
    BOOL v4 = [v3 incomingCall];
    if (v4)
    {
      id v5 = [(CSDRaiseToAnswerController *)self callCenterObserver];
      id v6 = [v5 callContainer];
      -[CSDRaiseToAnswerController setDetectingRaiseToAnswer:](self, "setDetectingRaiseToAnswer:", [v6 currentCallCount] == (id)1);
    }
    else
    {
      [(CSDRaiseToAnswerController *)self setDetectingRaiseToAnswer:0];
    }
  }
  else
  {
    [(CSDRaiseToAnswerController *)self setDetectingRaiseToAnswer:0];
  }
}

- (void)callCenterObserver:(id)a3 callChanged:(id)a4
{
}

- (CMGestureManager)raiseToEarGestureManager
{
  return self->_raiseToEarGestureManager;
}

- (void)setRaiseToEarGestureManager:(id)a3
{
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (id)raiseToEarGestureHandler
{
  return self->_raiseToEarGestureHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_raiseToEarGestureHandler, 0);
  objc_storeStrong((id *)&self->_callCenterObserver, 0);

  objc_storeStrong((id *)&self->_raiseToEarGestureManager, 0);
}

@end