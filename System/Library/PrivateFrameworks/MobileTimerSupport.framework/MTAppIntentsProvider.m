@interface MTAppIntentsProvider
+ (id)sharedInstance;
- (MTAppIntentsProvider)init;
- (MTAppIntentsProviderDelegate)delegate;
- (_TtC18MobileTimerSupport19MTAppIntentsManager)manager;
- (void)didAddNewWorldClockWithNameWithManager:(id)a3 name:(id)a4;
- (void)didRemoveWorldClockWithNameWithManager:(id)a3 name:(id)a4;
- (void)didSelectTabWithManager:(id)a3 tab:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation MTAppIntentsProvider

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MTAppIntentsProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __38__MTAppIntentsProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (MTAppIntentsProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTAppIntentsProvider;
  v2 = [(MTAppIntentsProvider *)&v6 init];
  if (v2)
  {
    v3 = +[MTAppIntentsManager sharedManager];
    [(MTAppIntentsProvider *)v2 setManager:v3];

    v4 = [(MTAppIntentsProvider *)v2 manager];
    [v4 setDelegate:v2];
  }
  return v2;
}

- (void)setManager:(id)a3
{
}

- (_TtC18MobileTimerSupport19MTAppIntentsManager)manager
{
  return self->_manager;
}

- (void)setDelegate:(id)a3
{
}

- (void)didSelectTabWithManager:(id)a3 tab:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 3) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a4;
  }
  id v6 = [(MTAppIntentsProvider *)self delegate];
  [v6 appIntentsProvider:self didSelectTab:v5];
}

- (void)didAddNewWorldClockWithNameWithManager:(id)a3 name:(id)a4
{
  id v5 = a4;
  id v6 = [(MTAppIntentsProvider *)self delegate];
  [v6 didAddNewWorldClockWithName:v5 provider:self];
}

- (void)didRemoveWorldClockWithNameWithManager:(id)a3 name:(id)a4
{
  id v5 = a4;
  id v6 = [(MTAppIntentsProvider *)self delegate];
  [v6 didRemoveWorldClockWithName:v5 provider:self];
}

- (MTAppIntentsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTAppIntentsProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end