@interface PSYSyncSessionObserverExportedObject
- (PSYSyncSessionObserverInterface)delegate;
- (void)invalidateSyncSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)syncSessionWillStart:(id)a3;
- (void)updateSyncSession:(id)a3;
@end

@implementation PSYSyncSessionObserverExportedObject

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (void)syncSessionWillStart:(id)a3
{
  id v4 = a3;
  id v5 = [(PSYSyncSessionObserverExportedObject *)self delegate];
  [v5 syncSessionWillStart:v4];
}

- (void)updateSyncSession:(id)a3
{
  id v4 = a3;
  id v5 = [(PSYSyncSessionObserverExportedObject *)self delegate];
  [v5 updateSyncSession:v4];
}

- (void)invalidateSyncSession:(id)a3
{
  id v4 = a3;
  id v5 = [(PSYSyncSessionObserverExportedObject *)self delegate];
  [v5 invalidateSyncSession:v4];
}

- (PSYSyncSessionObserverInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSYSyncSessionObserverInterface *)WeakRetained;
}

@end