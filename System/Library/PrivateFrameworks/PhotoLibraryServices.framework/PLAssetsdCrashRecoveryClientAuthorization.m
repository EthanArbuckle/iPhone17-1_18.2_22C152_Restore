@interface PLAssetsdCrashRecoveryClientAuthorization
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)analyticsCacheReadEntitled;
- (BOOL)analyticsCacheWriteEntitled;
- (BOOL)clientIsSandboxed;
- (BOOL)cloudInternalEntitled;
- (BOOL)coreSceneUnderstandingTaxonomyReadAuthorized;
- (BOOL)coreSceneUnderstandingTaxonomyWriteAuthorized;
- (BOOL)directDatabaseAccessAuthorized;
- (BOOL)directDatabaseWriteAuthorized;
- (BOOL)internalDataReadWriteAuthorized;
- (BOOL)isCameraClient;
- (BOOL)isClientAuthorizedForTCCServicePhotos;
- (BOOL)isClientAuthorizedForTCCServicePhotosAdd;
- (BOOL)isClientLimitedLibraryCapable;
- (BOOL)limitedLibraryMode;
- (BOOL)managedSpotlightIndexReadWriteEntitled;
- (BOOL)photoKitEntitled;
- (BOOL)photoKitEntitledFor:(id)a3;
- (BOOL)photosDataVaultEntitled;
- (BOOL)smartSharingCacheReadEntitled;
- (BOOL)smartSharingCacheWriteEntitled;
- (LSBundleRecord)trustedCallerContainingBundleRecord;
- (NSString)fetchFilterIdentifier;
- (NSString)trustedCallerBundleID;
- (NSString)trustedCallerDisplayName;
- (NSString)trustedCallerPhotoLibraryUsageDescription;
- (PLAssetsdCrashRecoveryClientAuthorization)init;
- (PLCaptureSessionState)captureSessionState;
- (int)clientProcessIdentifier;
@end

@implementation PLAssetsdCrashRecoveryClientAuthorization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureSessionState, 0);
  objc_storeStrong((id *)&self->_trustedCallerPhotoLibraryUsageDescription, 0);
  objc_storeStrong((id *)&self->_trustedCallerDisplayName, 0);
  objc_storeStrong((id *)&self->_fetchFilterIdentifier, 0);
  objc_storeStrong((id *)&self->_trustedCallerContainingBundleRecord, 0);
  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
}

- (BOOL)managedSpotlightIndexReadWriteEntitled
{
  return self->_managedSpotlightIndexReadWriteEntitled;
}

- (PLCaptureSessionState)captureSessionState
{
  return (PLCaptureSessionState *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)coreSceneUnderstandingTaxonomyWriteAuthorized
{
  return self->_coreSceneUnderstandingTaxonomyWriteAuthorized;
}

- (BOOL)coreSceneUnderstandingTaxonomyReadAuthorized
{
  return self->_coreSceneUnderstandingTaxonomyReadAuthorized;
}

- (BOOL)isClientAuthorizedForTCCServicePhotosAdd
{
  return self->_clientAuthorizedForTCCServicePhotosAdd;
}

- (BOOL)isClientAuthorizedForTCCServicePhotos
{
  return self->_clientAuthorizedForTCCServicePhotos;
}

- (BOOL)internalDataReadWriteAuthorized
{
  return self->_internalDataReadWriteAuthorized;
}

- (BOOL)photosDataVaultEntitled
{
  return self->_photosDataVaultEntitled;
}

- (BOOL)clientIsSandboxed
{
  return self->_clientIsSandboxed;
}

- (BOOL)isClientLimitedLibraryCapable
{
  return self->_clientLimitedLibraryCapable;
}

- (BOOL)limitedLibraryMode
{
  return self->_limitedLibraryMode;
}

- (BOOL)smartSharingCacheWriteEntitled
{
  return self->_smartSharingCacheWriteEntitled;
}

- (BOOL)smartSharingCacheReadEntitled
{
  return self->_smartSharingCacheReadEntitled;
}

- (BOOL)analyticsCacheWriteEntitled
{
  return self->_analyticsCacheWriteEntitled;
}

- (BOOL)analyticsCacheReadEntitled
{
  return self->_analyticsCacheReadEntitled;
}

- (BOOL)cloudInternalEntitled
{
  return self->_cloudInternalEntitled;
}

- (BOOL)directDatabaseWriteAuthorized
{
  return self->_directDatabaseWriteAuthorized;
}

- (BOOL)directDatabaseAccessAuthorized
{
  return self->_directDatabaseAccessAuthorized;
}

- (BOOL)photoKitEntitled
{
  return self->_photoKitEntitled;
}

- (NSString)trustedCallerPhotoLibraryUsageDescription
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)trustedCallerDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)fetchFilterIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (LSBundleRecord)trustedCallerContainingBundleRecord
{
  return (LSBundleRecord *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)trustedCallerBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  objc_copyStruct(retstr, &self->_clientAuditToken, 32, 1, 0);
  return result;
}

- (PLAssetsdCrashRecoveryClientAuthorization)init
{
  v14.receiver = self;
  v14.super_class = (Class)PLAssetsdCrashRecoveryClientAuthorization;
  v2 = [(PLAssetsdCrashRecoveryClientAuthorization *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_clientIsSandboxed = 1;
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];
    trustedCallerBundleID = v3->_trustedCallerBundleID;
    v3->_trustedCallerBundleID = (NSString *)v5;

    trustedCallerContainingBundleRecord = v3->_trustedCallerContainingBundleRecord;
    v3->_trustedCallerContainingBundleRecord = 0;

    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v9 = [v8 bundleIdentifier];
    trustedCallerDisplayName = v3->_trustedCallerDisplayName;
    v3->_trustedCallerDisplayName = (NSString *)v9;

    v3->_clientProcessIdentifier = getpid();
    *(_WORD *)&v3->_directDatabaseAccessAuthorized = 257;
    v3->_limitedLibraryMode = 0;
    v3->_clientIsSandboxed = 1;
    v3->_managedSpotlightIndexReadWriteEntitled = 0;
    uint64_t v11 = [MEMORY[0x1E4F8B898] none];
    captureSessionState = v3->_captureSessionState;
    v3->_captureSessionState = (PLCaptureSessionState *)v11;
  }
  return v3;
}

- (BOOL)isCameraClient
{
  return 0;
}

- (BOOL)photoKitEntitledFor:(id)a3
{
  return 1;
}

@end