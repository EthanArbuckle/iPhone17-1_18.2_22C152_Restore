@interface SXHostExtension
- (BOOL)active;
- (BOOL)canOpenURL:(id)a3;
- (BOOL)isActive;
- (NSExtensionContext)extensionContext;
- (SXHostExtension)initWithExtensionContext:(id)a3;
- (void)extensionHostDidBecomeActive:(id)a3;
- (void)extensionHostDidEnterBackground:(id)a3;
- (void)extensionHostWillEnterForeground:(id)a3;
- (void)openURL:(id)a3 completion:(id)a4;
- (void)setExtensionContext:(id)a3;
- (void)setIsActive:(BOOL)a3;
@end

@implementation SXHostExtension

- (SXHostExtension)initWithExtensionContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXHostExtension;
  v5 = [(SXHostExtension *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_extensionContext, v4);
    v6->_isActive = 1;
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel_extensionHostDidBecomeActive_ name:*MEMORY[0x263F07FC0] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v6 selector:sel_extensionHostDidEnterBackground_ name:*MEMORY[0x263F07FC8] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel_extensionHostWillEnterForeground_ name:*MEMORY[0x263F07FD0] object:0];
  }
  return v6;
}

- (BOOL)active
{
  v3 = [(SXHostExtension *)self extensionContext];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(SXHostExtension *)self extensionContext];
    char v6 = [v5 widgetIsForeground];

    return v6;
  }
  else
  {
    return [(SXHostExtension *)self isActive];
  }
}

- (void)openURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SXHostExtension *)self extensionContext];
  [v8 openURL:v7 completionHandler:v6];
}

- (BOOL)canOpenURL:(id)a3
{
  return 1;
}

- (void)extensionHostDidBecomeActive:(id)a3
{
}

- (void)extensionHostDidEnterBackground:(id)a3
{
}

- (void)extensionHostWillEnterForeground:(id)a3
{
}

- (NSExtensionContext)extensionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);
  return (NSExtensionContext *)WeakRetained;
}

- (void)setExtensionContext:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
}

@end