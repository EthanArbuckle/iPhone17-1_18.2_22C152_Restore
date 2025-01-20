@interface PKSubcredentialProvisioningSharingSessionOperation
- (PKSubcredentialProvisioningSharingSessionOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (id)sharingSession;
@end

@implementation PKSubcredentialProvisioningSharingSessionOperation

- (PKSubcredentialProvisioningSharingSessionOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PKSubcredentialProvisioningSharingSessionOperation;
  v5 = [(PKSubcredentialProvisioningOperation *)&v9 initWithConfiguration:a3 context:a4 delegate:a5];
  v6 = v5;
  if (!v5
    || ([(PKSubcredentialProvisioningSharingSessionOperation *)v5 sharingSession],
        v7 = (PKSubcredentialProvisioningSharingSessionOperation *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v7 = v6;
  }

  return v7;
}

- (id)sharingSession
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(PKSubcredentialProvisioningOperation *)self configuration];
  uint64_t v3 = [v2 configurationType];
  if (v3 == 2)
  {
    v4 = [v2 remoteDeviceConfiguration];
    uint64_t v5 = [v4 sharingSession];
LABEL_5:
    v6 = (void *)v5;

    if (v6) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    v4 = [v2 acceptInvitationConfiguration];
    uint64_t v5 = [v4 session];
    goto LABEL_5;
  }
LABEL_6:
  v7 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Sharing operation is missing its session: %@", (uint8_t *)&v11, 0xCu);
  }
  v6 = 0;
LABEL_9:

  return v6;
}

@end