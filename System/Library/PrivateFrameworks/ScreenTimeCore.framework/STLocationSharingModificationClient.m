@interface STLocationSharingModificationClient
- (STLocationSharingModificationClient)init;
- (STManagementState)managementState;
- (void)isLocationSharingModificationAllowedForUserID:(id)a3 completionHandler:(id)a4;
- (void)setLocationSharingModificationAllowed:(BOOL)a3 forUserID:(id)a4 completionHandler:(id)a5;
@end

@implementation STLocationSharingModificationClient

- (STLocationSharingModificationClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STLocationSharingModificationClient;
  v2 = [(STLocationSharingModificationClient *)&v6 init];
  uint64_t v3 = objc_opt_new();
  managementState = v2->_managementState;
  v2->_managementState = (STManagementState *)v3;

  return v2;
}

- (void)isLocationSharingModificationAllowedForUserID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(STLocationSharingModificationClient *)self managementState];
  v9 = [v7 dsid];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__STLocationSharingModificationClient_isLocationSharingModificationAllowedForUserID_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC81B0;
  id v12 = v6;
  id v10 = v6;
  [v8 isLocationSharingModificationAllowedForDSID:v9 completionHandler:v11];
}

void __103__STLocationSharingModificationClient_isLocationSharingModificationAllowedForUserID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, [a2 BOOLValue], a3);
  }
  else {
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, 1, a3);
  }
}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forUserID:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(STLocationSharingModificationClient *)self managementState];
  v11 = [v9 dsid];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__STLocationSharingModificationClient_setLocationSharingModificationAllowed_forUserID_completionHandler___block_invoke;
  v13[3] = &unk_1E6BC7058;
  id v14 = v8;
  id v12 = v8;
  [v10 setLocationSharingModificationAllowed:v6 forDSID:v11 completionHandler:v13];
}

uint64_t __105__STLocationSharingModificationClient_setLocationSharingModificationAllowed_forUserID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (STManagementState)managementState
{
  return (STManagementState *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end