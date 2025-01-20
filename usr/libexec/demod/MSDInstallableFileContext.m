@interface MSDInstallableFileContext
- (BOOL)alreadyInstalled;
- (BOOL)deleteInstallableFileAfterInstall;
- (BOOL)pricingAppUpdateDeferred;
- (BOOL)useDiffPatch;
- (BOOL)verifyFileHash;
- (MSDInstallableFileContext)init;
- (NSString)currentUniqueIdentifier;
- (NSString)fileHash;
- (NSString)originServer;
- (NSString)profileIdentifier;
- (NSString)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)uniqueName;
- (int64_t)fileType;
- (void)setAlreadyInstalled:(BOOL)a3;
- (void)setCurrentUniqueIdentifier:(id)a3;
- (void)setDeleteInstallableFileAfterInstall:(BOOL)a3;
- (void)setFileHash:(id)a3;
- (void)setFileType:(int64_t)a3;
- (void)setOriginServer:(id)a3;
- (void)setPricingAppUpdateDeferred:(BOOL)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUseDiffPatch:(BOOL)a3;
- (void)setVerifyFileHash:(BOOL)a3;
@end

@implementation MSDInstallableFileContext

- (MSDInstallableFileContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDInstallableFileContext;
  v2 = [(MSDInstallableFileContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MSDInstallableFileContext *)v2 setDeleteInstallableFileAfterInstall:1];
    [(MSDInstallableFileContext *)v3 setVerifyFileHash:0];
  }
  return v3;
}

- (id)uniqueName
{
  if (self->_uniqueName) {
    goto LABEL_2;
  }
  objc_super v5 = [(MSDOperationContext *)self identifier];

  if (v5)
  {
    if (!self->_uniqueName)
    {
      if (![(MSDInstallableFileContext *)self fileType])
      {
        v6 = [(MSDOperationContext *)self identifier];
        +[NSString stringWithFormat:@"Application.%@", v6];
        goto LABEL_17;
      }
      if ((id)[(MSDInstallableFileContext *)self fileType] == (id)1)
      {
        v6 = [(MSDOperationContext *)self identifier];
        +[NSString stringWithFormat:@"StandalonePackage.%@", v6];
LABEL_17:
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        uniqueName = self->_uniqueName;
        self->_uniqueName = v7;

        goto LABEL_2;
      }
      if ((id)[(MSDInstallableFileContext *)self fileType] == (id)2)
      {
        v6 = [(MSDOperationContext *)self identifier];
        +[NSString stringWithFormat:@"ProvisioningProfile.%@", v6];
        goto LABEL_17;
      }
      if ((id)[(MSDInstallableFileContext *)self fileType] == (id)3)
      {
        v6 = [(MSDOperationContext *)self identifier];
        +[NSString stringWithFormat:@"ConfigurationProfile.%@", v6];
        goto LABEL_17;
      }
    }
LABEL_2:
    v3 = self->_uniqueName;
    goto LABEL_3;
  }
  v3 = 0;
LABEL_3:

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSDInstallableFileContext;
  id v4 = [(MSDOperationContext *)&v6 copyWithZone:a3];
  [v4 setFileType:self->_fileType];
  [v4 setFileHash:self->_fileHash];
  [v4 setOriginServer:self->_originServer];
  [v4 setUniqueIdentifier:self->_uniqueIdentifier];
  [v4 setCurrentUniqueIdentifier:self->_currentUniqueIdentifier];
  [v4 setUseDiffPatch:self->_useDiffPatch];
  [v4 setAlreadyInstalled:self->_alreadyInstalled];
  [v4 setPricingAppUpdateDeferred:self->_pricingAppUpdateDeferred];
  return v4;
}

- (int64_t)fileType
{
  return self->_fileType;
}

- (void)setFileType:(int64_t)a3
{
  self->_fileType = a3;
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
}

- (NSString)originServer
{
  return self->_originServer;
}

- (void)setOriginServer:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)currentUniqueIdentifier
{
  return self->_currentUniqueIdentifier;
}

- (void)setCurrentUniqueIdentifier:(id)a3
{
}

- (BOOL)useDiffPatch
{
  return self->_useDiffPatch;
}

- (void)setUseDiffPatch:(BOOL)a3
{
  self->_useDiffPatch = a3;
}

- (BOOL)alreadyInstalled
{
  return self->_alreadyInstalled;
}

- (void)setAlreadyInstalled:(BOOL)a3
{
  self->_alreadyInstalled = a3;
}

- (BOOL)pricingAppUpdateDeferred
{
  return self->_pricingAppUpdateDeferred;
}

- (void)setPricingAppUpdateDeferred:(BOOL)a3
{
  self->_pricingAppUpdateDeferred = a3;
}

- (BOOL)deleteInstallableFileAfterInstall
{
  return self->_deleteInstallableFileAfterInstall;
}

- (void)setDeleteInstallableFileAfterInstall:(BOOL)a3
{
  self->_deleteInstallableFileAfterInstall = a3;
}

- (BOOL)verifyFileHash
{
  return self->_verifyFileHash;
}

- (void)setVerifyFileHash:(BOOL)a3
{
  self->_verifyFileHash = a3;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_currentUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);

  objc_storeStrong((id *)&self->_uniqueName, 0);
}

@end