@interface SWScriptsSetupTask
- (NSString)identifier;
- (SWScriptsManager)scriptsManager;
- (SWScriptsSetupTask)initWithScriptsManager:(id)a3;
- (void)performSetup;
@end

@implementation SWScriptsSetupTask

- (SWScriptsSetupTask)initWithScriptsManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWScriptsSetupTask;
  v6 = [(SWScriptsSetupTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scriptsManager, a3);
  }

  return v7;
}

- (NSString)identifier
{
  return (NSString *)@"scripts";
}

- (void)performSetup
{
  v4 = objc_alloc_init(SWSetupScript);
  v3 = [(SWScriptsSetupTask *)self scriptsManager];
  [v3 addScript:v4];
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (void).cxx_destruct
{
}

@end