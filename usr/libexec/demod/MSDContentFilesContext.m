@interface MSDContentFilesContext
+ (NSMutableSet)processedContainers;
+ (id)defaultContextForBackupItem:(id)a3;
+ (id)defaultContextForContainerizedAppDataItem:(id)a3;
+ (id)defaultContextForNonContainerizedAppDataItem:(id)a3;
+ (void)initialize;
- (BOOL)containerized;
- (BOOL)verifyFileHash;
- (MSDManifest)deviceManifest;
- (MSDManifest)masterManifest;
- (NSMutableArray)alreadyHaveList;
- (NSMutableArray)cloneFailedList;
- (NSMutableArray)creationList;
- (NSString)appIdentifier;
- (NSString)containerType;
- (NSString)contentRootPath;
- (NSString)originServer;
- (NSString)pseudoContentRootPath;
- (NSString)rootFileSystemPath;
- (_NSRange)contentBeingInstalled;
- (id)secondaryStagingRootPath;
- (id)stashedStagingRootPath;
- (id)uniqueName;
- (void)setAlreadyHaveList:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setCloneFailedList:(id)a3;
- (void)setContainerType:(id)a3;
- (void)setContainerized:(BOOL)a3;
- (void)setContentBeingInstalled:(_NSRange)a3;
- (void)setContentRootPath:(id)a3;
- (void)setCreationList:(id)a3;
- (void)setDeviceManifest:(id)a3;
- (void)setMasterManifest:(id)a3;
- (void)setOriginServer:(id)a3;
- (void)setPseudoContentRootPath:(id)a3;
- (void)setRootFileSystemPath:(id)a3;
- (void)setVerifyFileHash:(BOOL)a3;
@end

@implementation MSDContentFilesContext

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    uint64_t v4 = +[NSMutableSet set];
    uint64_t v5 = qword_100189AF8;
    qword_100189AF8 = v4;
    _objc_release_x1(v4, v5);
  }
}

+ (NSMutableSet)processedContainers
{
  return (NSMutableSet *)(id)qword_100189AF8;
}

+ (id)defaultContextForBackupItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(MSDContentFilesContext);
  [(MSDOperationContext *)v4 setIdentifier:v3];

  [(MSDContentFilesContext *)v4 setContentRootPath:@"/"];
  [(MSDContentFilesContext *)v4 setContainerType:@"BackupData"];
  [(MSDContentFilesContext *)v4 setContainerized:0];

  return v4;
}

+ (id)defaultContextForContainerizedAppDataItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(MSDContentFilesContext);
  [(MSDOperationContext *)v4 setIdentifier:v3];

  [(MSDContentFilesContext *)v4 setContentRootPath:0];
  [(MSDContentFilesContext *)v4 setContainerized:1];
  -[MSDContentFilesContext setContentBeingInstalled:](v4, "setContentBeingInstalled:", 0x7FFFFFFFFFFFFFFFLL, 0);

  return v4;
}

+ (id)defaultContextForNonContainerizedAppDataItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(MSDContentFilesContext);
  [(MSDOperationContext *)v4 setIdentifier:v3];

  [(MSDContentFilesContext *)v4 setContentRootPath:@"/"];
  [(MSDContentFilesContext *)v4 setContainerized:0];
  -[MSDContentFilesContext setContentBeingInstalled:](v4, "setContentBeingInstalled:", 0x7FFFFFFFFFFFFFFFLL, 0);

  return v4;
}

- (id)uniqueName
{
  uniqueName = self->_uniqueName;
  if (!uniqueName)
  {
    uint64_t v4 = [(MSDContentFilesContext *)self containerType];
    uint64_t v5 = [(MSDOperationContext *)self identifier];
    v6 = +[NSString stringWithFormat:@"%@.%@", v4, v5];
    v7 = self->_uniqueName;
    self->_uniqueName = v6;

    uniqueName = self->_uniqueName;
  }

  return uniqueName;
}

- (id)secondaryStagingRootPath
{
  if (!self->_secondaryStagingRootPath)
  {
    if (+[MSDOperationContext downloadOnly])
    {
      id v3 = [(MSDContentFilesContext *)self uniqueName];
      uint64_t v4 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_secondary_staging";
    }
    else
    {
      id v3 = [(MSDContentFilesContext *)self appIdentifier];
      uint64_t v4 = @"/var/MSDWorkContainer/MSD_secondary_staging";
    }
    uint64_t v5 = [(__CFString *)v4 stringByAppendingPathComponent:v3];
    secondaryStagingRootPath = self->_secondaryStagingRootPath;
    self->_secondaryStagingRootPath = v5;
  }
  v7 = self->_secondaryStagingRootPath;

  return v7;
}

- (id)stashedStagingRootPath
{
  stashedStagingRootPath = self->_stashedStagingRootPath;
  if (!stashedStagingRootPath)
  {
    uint64_t v4 = [(MSDContentFilesContext *)self uniqueName];
    uint64_t v5 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_stashed_staging" stringByAppendingPathComponent:v4];
    v6 = self->_stashedStagingRootPath;
    self->_stashedStagingRootPath = v5;

    stashedStagingRootPath = self->_stashedStagingRootPath;
  }

  return stashedStagingRootPath;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (MSDManifest)masterManifest
{
  return self->_masterManifest;
}

- (void)setMasterManifest:(id)a3
{
}

- (MSDManifest)deviceManifest
{
  return self->_deviceManifest;
}

- (void)setDeviceManifest:(id)a3
{
}

- (NSString)originServer
{
  return self->_originServer;
}

- (void)setOriginServer:(id)a3
{
}

- (NSString)rootFileSystemPath
{
  return self->_rootFileSystemPath;
}

- (void)setRootFileSystemPath:(id)a3
{
}

- (NSString)contentRootPath
{
  return self->_contentRootPath;
}

- (void)setContentRootPath:(id)a3
{
}

- (NSString)pseudoContentRootPath
{
  return self->_pseudoContentRootPath;
}

- (void)setPseudoContentRootPath:(id)a3
{
}

- (NSString)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(id)a3
{
}

- (BOOL)containerized
{
  return self->_containerized;
}

- (void)setContainerized:(BOOL)a3
{
  self->_containerized = a3;
}

- (NSMutableArray)alreadyHaveList
{
  return self->_alreadyHaveList;
}

- (void)setAlreadyHaveList:(id)a3
{
}

- (NSMutableArray)cloneFailedList
{
  return self->_cloneFailedList;
}

- (void)setCloneFailedList:(id)a3
{
}

- (NSMutableArray)creationList
{
  return self->_creationList;
}

- (void)setCreationList:(id)a3
{
}

- (BOOL)verifyFileHash
{
  return self->_verifyFileHash;
}

- (void)setVerifyFileHash:(BOOL)a3
{
  self->_verifyFileHash = a3;
}

- (_NSRange)contentBeingInstalled
{
  p_contentBeingInstalled = &self->_contentBeingInstalled;
  NSUInteger location = self->_contentBeingInstalled.location;
  NSUInteger length = p_contentBeingInstalled->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setContentBeingInstalled:(_NSRange)a3
{
  self->_contentBeingInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationList, 0);
  objc_storeStrong((id *)&self->_cloneFailedList, 0);
  objc_storeStrong((id *)&self->_alreadyHaveList, 0);
  objc_storeStrong((id *)&self->_containerType, 0);
  objc_storeStrong((id *)&self->_pseudoContentRootPath, 0);
  objc_storeStrong((id *)&self->_contentRootPath, 0);
  objc_storeStrong((id *)&self->_rootFileSystemPath, 0);
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_deviceManifest, 0);
  objc_storeStrong((id *)&self->_masterManifest, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_stashedStagingRootPath, 0);
  objc_storeStrong((id *)&self->_secondaryStagingRootPath, 0);

  objc_storeStrong((id *)&self->_uniqueName, 0);
}

@end