@interface HDSPSimulatorReadyProvider
- (BOOL)isInDemoMode;
- (BOOL)isSystemReady;
- (HDSPEnvironment)environment;
- (HDSPSimulatorReadyProvider)initWithEnvironment:(id)a3;
- (HDSPSystemReadyDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation HDSPSimulatorReadyProvider

- (HDSPSimulatorReadyProvider)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSimulatorReadyProvider;
  v5 = [(HDSPSimulatorReadyProvider *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isInDemoMode
{
  return 0;
}

- (BOOL)isSystemReady
{
  return 1;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSystemReadyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPSystemReadyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end