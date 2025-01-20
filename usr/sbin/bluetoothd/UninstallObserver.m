@interface UninstallObserver
- (UninstallObserver)init;
- (UninstallObserverProtocol)delegate;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation UninstallObserver

- (UninstallObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)UninstallObserver;
  v2 = [(UninstallObserver *)&v5 init];
  if (v2)
  {
    v3 = +[LSApplicationWorkspace defaultWorkspace];
    [v3 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)UninstallObserver;
  [(UninstallObserver *)&v4 dealloc];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(UninstallObserver *)self delegate];
  [v4 applicationsDidUninstall:v5];
}

- (UninstallObserverProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UninstallObserverProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end