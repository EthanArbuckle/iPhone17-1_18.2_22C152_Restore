@interface NADWorkspaceConnection
- (NADApplicationStore)applicationStore;
- (NADWorkspaceConnection)initWithApplicationStore:(id)a3;
- (void)getWorkspaceInfoIncludingHiddenApps:(BOOL)a3 completion:(id)a4;
- (void)getWorkspaceInfoWithCompletion:(id)a3;
@end

@implementation NADWorkspaceConnection

- (NADWorkspaceConnection)initWithApplicationStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NADWorkspaceConnection;
  v6 = [(NADWorkspaceConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationStore, a3);
  }

  return v7;
}

- (void)getWorkspaceInfoWithCompletion:(id)a3
{
}

- (void)getWorkspaceInfoIncludingHiddenApps:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = [(NADWorkspaceConnection *)self applicationStore];
  v15 = 0;
  v16 = 0;
  id v14 = 0;
  [v7 getAllApplications:&v16 UUID:&v15 sequenceNumber:&v14 includeHidden:v4];
  v8 = v15;
  objc_super v9 = v16;
  id v10 = v14;
  id v11 = v8;
  id v12 = v9;

  id v13 = [objc_alloc((Class)NARWorkspaceInfo) initWithApplications:v12 UUID:v11 sequenceNumber:v10];
  v6[2](v6, v13);
}

- (NADApplicationStore)applicationStore
{
  return self->_applicationStore;
}

- (void).cxx_destruct
{
}

@end