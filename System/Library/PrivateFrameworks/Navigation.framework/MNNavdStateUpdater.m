@interface MNNavdStateUpdater
+ (id)sharedUpdater;
- (BOOL)isNavigatingOrPredictingDestination;
- (BOOL)isNavigatingWithETA;
- (id)initPrivate;
- (void)registerObserver:(id)a3;
- (void)stateManager:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation MNNavdStateUpdater

- (BOOL)isNavigatingWithETA
{
  v2 = +[MNNavigationStateManager sharedManager];
  uint64_t v3 = [v2 currentStateType];

  return ((unint64_t)(v3 + 1) > 7) | (0x70u >> (v3 + 1)) & 1;
}

+ (id)sharedUpdater
{
  if (qword_1EB59C2A0 != -1) {
    dispatch_once(&qword_1EB59C2A0, &__block_literal_global_42);
  }
  v2 = (void *)_MergedGlobals_44;
  return v2;
}

uint64_t __35__MNNavdStateUpdater_sharedUpdater__block_invoke()
{
  id v0 = [[MNNavdStateUpdater alloc] initPrivate];
  uint64_t v1 = _MergedGlobals_44;
  _MergedGlobals_44 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)initPrivate
{
  uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
  int v4 = objc_msgSend(v3, "_navigation_isNavd");

  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)MNNavdStateUpdater;
    v5 = [(MNNavdStateUpdater *)&v14 init];
    v6 = v5;
    if (v5)
    {
      v5->_hasObservers = 0;
      v7 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E73D68];
      innerObservers = v6->_innerObservers;
      v6->_innerObservers = v7;

      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create("MNNavdUpdaterQueue", v9);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v10;
    }
    self = v6;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)registerObserver:(id)a3
{
  id v6 = a3;
  int v4 = self->_innerObservers;
  objc_sync_enter(v4);
  if (v6)
  {
    -[MNObserverHashTable registerObserver:](self->_innerObservers, "registerObserver:");
    if (!self->_hasObservers)
    {
      self->_hasObservers = 1;
      v5 = +[MNNavigationStateManager sharedManager];
      [v5 registerObserver:self];
    }
  }
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    v5 = self->_innerObservers;
    objc_sync_enter(v5);
    [(MNObserverHashTable *)self->_innerObservers unregisterObserver:v7];
    if (![(MNObserverHashTable *)self->_innerObservers count])
    {
      self->_hasObservers = 0;
      id v6 = +[MNNavigationStateManager sharedManager];
      [v6 unregisterObserver:self];
    }
    objc_sync_exit(v5);

    id v4 = v7;
  }
}

- (BOOL)isNavigatingOrPredictingDestination
{
  v2 = +[MNNavigationStateManager sharedManager];
  if ([v2 currentStateType])
  {
    uint64_t v3 = +[MNNavigationStateManager sharedManager];
    if ([v3 currentStateType] == 2)
    {
      BOOL v4 = 1;
    }
    else
    {
      v5 = +[MNNavigationStateManager sharedManager];
      BOOL v4 = [v5 currentStateType] == 1;
    }
  }
  else
  {
    BOOL v4 = 1;
  }

  return !v4;
}

- (void)stateManager:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_innerObservers, 0);
}

@end