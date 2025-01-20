@interface UAPingController
- (BOOL)active;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (UAPingClient)client;
- (UAPingController)initWithManager:(id)a3 name:(id)a4;
- (UAPingNotifier)notifier;
@end

@implementation UAPingController

- (UAPingController)initWithManager:(id)a3 name:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UAPingController;
  v7 = [(UACornerActionManagerHandler *)&v17 initWithManager:v6 name:a4];
  if (v7)
  {
    v8 = [[UAPingNotifier alloc] initWithManager:v6];
    notifier = v7->_notifier;
    v7->_notifier = v8;

    v10 = [[UAPingClient alloc] initWithController:v7];
    client = v7->_client;
    v7->_client = v10;

    v12 = [(UACornerActionManagerHandler *)v7 manager];
    v13 = [(UAPingController *)v7 notifier];
    [v12 addActivityNotifier:v13];

    v14 = [(UACornerActionManagerHandler *)v7 manager];
    v15 = [(UAPingController *)v7 client];
    [v14 addClient:v15];
  }
  return v7;
}

- (BOOL)active
{
  v2 = [(UAPingController *)self client];
  v3 = [v2 items];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)resume
{
  v3 = [(UAPingController *)self notifier];
  [v3 resume];

  BOOL v4 = [(UAPingController *)self client];
  [v4 resume];

  return 1;
}

- (BOOL)suspend
{
  v3 = [(UAPingController *)self notifier];
  [v3 suspend];

  BOOL v4 = [(UAPingController *)self client];
  [v4 suspend];

  return 1;
}

- (BOOL)terminate
{
  v3 = [(UAPingController *)self notifier];
  [v3 terminate];

  BOOL v4 = [(UAPingController *)self client];
  [v4 terminate];

  return 1;
}

- (UAPingClient)client
{
  return (UAPingClient *)objc_getProperty(self, a2, 48, 1);
}

- (UAPingNotifier)notifier
{
  return (UAPingNotifier *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifier, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end