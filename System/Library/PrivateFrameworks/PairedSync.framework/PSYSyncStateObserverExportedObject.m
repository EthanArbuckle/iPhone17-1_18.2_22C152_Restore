@interface PSYSyncStateObserverExportedObject
- (PSYSyncStateObserverInterface)delegate;
- (void)didUpdateSyncForPairingID:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PSYSyncStateObserverExportedObject

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (void)didUpdateSyncForPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(PSYSyncStateObserverExportedObject *)self delegate];
  [v5 didUpdateSyncForPairingID:v4];
}

- (PSYSyncStateObserverInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSYSyncStateObserverInterface *)WeakRetained;
}

@end