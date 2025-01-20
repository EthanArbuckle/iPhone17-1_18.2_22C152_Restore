@interface SXHostApplication
- (BOOL)active;
- (BOOL)canOpenURL:(id)a3;
- (SXHostApplication)initWithApplication:(id)a3;
- (UIApplication)application;
- (void)openURL:(id)a3 completion:(id)a4;
- (void)setApplication:(id)a3;
@end

@implementation SXHostApplication

- (SXHostApplication)initWithApplication:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXHostApplication;
  v5 = [(SXHostApplication *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_application, v4);
  }

  return v6;
}

- (BOOL)active
{
  v2 = [(SXHostApplication *)self application];
  BOOL v3 = [v2 applicationState] == 0;

  return v3;
}

- (void)openURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SXHostApplication *)self application];
  [v8 openURL:v7 options:MEMORY[0x263EFFA78] completionHandler:v6];
}

- (BOOL)canOpenURL:(id)a3
{
  id v4 = a3;
  v5 = [(SXHostApplication *)self application];
  char v6 = [v5 canOpenURL:v4];

  return v6;
}

- (UIApplication)application
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  return (UIApplication *)WeakRetained;
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end