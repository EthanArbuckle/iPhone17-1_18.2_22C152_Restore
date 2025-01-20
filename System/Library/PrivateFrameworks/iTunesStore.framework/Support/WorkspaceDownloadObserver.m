@interface WorkspaceDownloadObserver
- (LSApplicationWorkspaceObserverProtocol)delegate;
- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation WorkspaceDownloadObserver

- (void)startObserving
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];

  [v3 addObserver:self];
}

- (void)stopObserving
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];

  [v3 removeObserver:self];
}

- (LSApplicationWorkspaceObserverProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (LSApplicationWorkspaceObserverProtocol *)a3;
}

- (void)applicationInstallsDidStart:(id)a3
{
}

- (void)applicationInstallsDidChange:(id)a3
{
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
}

- (void)applicationInstallsDidPause:(id)a3
{
}

- (void)applicationInstallsDidResume:(id)a3
{
}

- (void)applicationInstallsDidCancel:(id)a3
{
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
}

@end