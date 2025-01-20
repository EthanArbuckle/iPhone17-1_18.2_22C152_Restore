@interface SBINAppIntentsCoordinator
+ (SBINAppIntentsCoordinator)sharedSystemCoordinator;
- (SBINAppIntentsCoordinator)init;
- (SBINAppIntentsCoordinatorDelegate)delegate;
- (void)performAppIntent:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBINAppIntentsCoordinator

+ (SBINAppIntentsCoordinator)sharedSystemCoordinator
{
  if (sharedSystemCoordinator_onceToken[0] != -1) {
    dispatch_once(sharedSystemCoordinator_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedSystemCoordinator_instance;
  return (SBINAppIntentsCoordinator *)v2;
}

uint64_t __52__SBINAppIntentsCoordinator_sharedSystemCoordinator__block_invoke()
{
  sharedSystemCoordinator_instance = objc_alloc_init(SBINAppIntentsCoordinator);
  return MEMORY[0x270F9A758]();
}

- (SBINAppIntentsCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBINAppIntentsCoordinator;
  return [(SBINAppIntentsCoordinator *)&v3 init];
}

- (void)performAppIntent:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, void))a4;
  BSDispatchQueueAssertMain();
  v7 = [(SBINAppIntentsCoordinator *)self delegate];
  v8 = v7;
  if (v7)
  {
    [v7 appIntentsCoordinator:self performAppIntent:v9 withCompletion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (SBINAppIntentsCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBINAppIntentsCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end