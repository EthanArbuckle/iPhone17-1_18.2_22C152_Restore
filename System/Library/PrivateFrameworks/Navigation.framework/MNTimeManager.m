@interface MNTimeManager
+ (NSDate)currentDate;
+ (double)currentTime;
+ (id)sharedManager;
- (MNTimeManager)init;
- (MNTimeProvider)provider;
- (void)_resetToDefaultProvider;
- (void)registerObserver:(id)a3;
- (void)setProvider:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MNTimeManager

+ (id)sharedManager
{
  if (qword_1EB59C2D0 != -1) {
    dispatch_once(&qword_1EB59C2D0, &__block_literal_global_47);
  }
  v2 = (void *)_MergedGlobals_47;
  return v2;
}

uint64_t __30__MNTimeManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(MNTimeManager);
  uint64_t v1 = _MergedGlobals_47;
  _MergedGlobals_47 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (double)currentTime
{
  v2 = +[MNTimeManager sharedManager];
  v3 = [v2 provider];
  [v3 currentTime];
  double v5 = v4;

  return v5;
}

+ (NSDate)currentDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 currentTime];
  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (MNTimeManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MNTimeManager;
  v2 = [(MNTimeManager *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(MNDeviceTimeProvider);
    [(MNTimeManager *)v2 setProvider:v3];
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  timeManagerObservers = self->_timeManagerObservers;
  id v8 = v4;
  if (!timeManagerObservers)
  {
    v6 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E45E68];
    v7 = self->_timeManagerObservers;
    self->_timeManagerObservers = v6;

    id v4 = v8;
    timeManagerObservers = self->_timeManagerObservers;
  }
  [(MNObserverHashTable *)timeManagerObservers registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
}

- (void)setProvider:(id)a3
{
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)&self->_provider, a3);
  }
  else {
    [(MNTimeManager *)self _resetToDefaultProvider];
  }
  [(MNObserverHashTable *)self->_timeManagerObservers timeManagerDidChangeProvider:self];
}

- (void)_resetToDefaultProvider
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = objc_alloc_init(MNDeviceTimeProvider);
    provider = self->_provider;
    self->_provider = (MNTimeProvider *)v3;
    MEMORY[0x1F41817F8](v3, provider);
  }
}

- (MNTimeProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_timeManagerObservers, 0);
}

@end