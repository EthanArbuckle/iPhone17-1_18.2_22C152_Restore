@interface SVXTaskTracker
- (AFAnalyticsTurnBasedInstrumentationContext)instrumentationContext;
- (BOOL)isUUFR;
- (BOOL)listensAfterSpeaking;
- (NSError)error;
- (NSString)aceId;
- (NSString)description;
- (NSString)dialogIdentifier;
- (NSString)dialogPhase;
- (NSString)refId;
- (NSUUID)requestUUID;
- (NSUUID)sessionUUID;
- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior;
- (SVXActivationContext)activationContext;
- (SVXDeactivationContext)deactivationContext;
- (SVXTaskContext)context;
- (SVXTaskTracker)initWithContext:(id)a3 instrumentationContext:(id)a4 delegate:(id)a5;
- (SVXTaskTracking)parent;
- (id)beginChildWithContext:(id)a3;
- (int64_t)origin;
- (unint64_t)timestamp;
- (void)dealloc;
@end

@implementation SVXTaskTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationContext, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (AFAnalyticsTurnBasedInstrumentationContext)instrumentationContext
{
  return self->_instrumentationContext;
}

- (SVXTaskTracking)parent
{
  return self->_parent;
}

- (SVXTaskContext)context
{
  return self->_context;
}

- (NSError)error
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    v5 = [v4 error];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (NSError *)v5;
}

- (SVXDeactivationContext)deactivationContext
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    v5 = [v4 deactivationContext];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (SVXDeactivationContext *)v5;
}

- (SVXActivationContext)activationContext
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    v5 = [v4 activationContext];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (SVXActivationContext *)v5;
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    v5 = [v4 listenAfterSpeakingBehavior];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (SAUIListenAfterSpeakingBehavior *)v5;
}

- (BOOL)listensAfterSpeaking
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int v5 = [v4 listensAfterSpeaking];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return v5;
}

- (BOOL)isUUFR
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int v5 = [v4 isUUFR];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return v5;
}

- (NSString)dialogPhase
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int v5 = [v4 dialogPhase];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (NSString *)v5;
}

- (NSString)dialogIdentifier
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int v5 = [v4 dialogIdentifier];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (NSString *)v5;
}

- (NSString)refId
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int v5 = [v4 refId];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (NSString *)v5;
}

- (NSString)aceId
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int v5 = [v4 aceId];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (NSString *)v5;
}

- (NSUUID)requestUUID
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int v5 = [v4 requestUUID];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (NSUUID *)v5;
}

- (NSUUID)sessionUUID
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int v5 = [v4 sessionUUID];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return (NSUUID *)v5;
}

- (unint64_t)timestamp
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    unint64_t v5 = [v4 timestamp];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return v5;
}

- (int64_t)origin
{
  v2 = self;
  do
  {
    v3 = v2;
    v4 = [(SVXTaskTracker *)v2 context];
    int64_t v5 = [v4 origin];

    v2 = [(SVXTaskTracker *)v3 parent];
  }
  while (v2 && !v5);

  return v5;
}

- (id)beginChildWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  instrumentationContext = self->_instrumentationContext;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = (id *)[v5 initWithContext:v4 instrumentationContext:instrumentationContext delegate:WeakRetained];

  objc_storeStrong(v8 + 3, self);
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  [v9 taskTracker:self childWillBegin:v8];

  return v8;
}

- (SVXTaskTracker)initWithContext:(id)a3 instrumentationContext:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SVXTaskTracker;
  v11 = [(SVXTaskTracker *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    context = v11->_context;
    v11->_context = (SVXTaskContext *)v12;

    objc_storeStrong((id *)&v11->_instrumentationContext, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SVXTaskTracker;
  id v4 = [(SVXTaskTracker *)&v7 description];
  id v5 = (void *)[v3 initWithFormat:@"%@ {context = %@, instrumentationContext = %@}", v4, self->_context, self->_instrumentationContext];

  return (NSString *)v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained taskTrackerDidEnd:self];

  v4.receiver = self;
  v4.super_class = (Class)SVXTaskTracker;
  [(SVXTaskTracker *)&v4 dealloc];
}

@end