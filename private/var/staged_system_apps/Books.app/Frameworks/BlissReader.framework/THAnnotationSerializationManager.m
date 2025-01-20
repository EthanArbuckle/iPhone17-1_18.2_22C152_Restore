@interface THAnnotationSerializationManager
- (BOOL)wentOfflineAfterHandleAnnotationProvider:(id)a3 willEncounterAnnotationAssetVersion:(id)a4 assetAssetVersion:(id)a5 assetID:(id)a6 assetURL:(id)a7 copyIfGoingOffline:(BOOL)a8;
- (void)handleAnnotationProvider:(id)a3 willMergeVersionMismatchedAnnotationsWithIncomingAnnotationAssetVersion:(id)a4 assetAssetVersion:(id)a5 assetID:(id)a6 assetURL:(id)a7;
@end

@implementation THAnnotationSerializationManager

- (void)handleAnnotationProvider:(id)a3 willMergeVersionMismatchedAnnotationsWithIncomingAnnotationAssetVersion:(id)a4 assetAssetVersion:(id)a5 assetID:(id)a6 assetURL:(id)a7
{
}

- (BOOL)wentOfflineAfterHandleAnnotationProvider:(id)a3 willEncounterAnnotationAssetVersion:(id)a4 assetAssetVersion:(id)a5 assetID:(id)a6 assetURL:(id)a7 copyIfGoingOffline:(BOOL)a8
{
  BOOL v8 = a8;
  unsigned int v12 = [a4 isStrictlyNewerThanBookVersion:a5];
  if (v12)
  {
    unsigned __int8 v13 = [(THAnnotationSerializationManager *)self isAssetOfflineWithAssetID:a6];
    if ((v13 & 1) == 0) {
      [(THAnnotationSerializationManager *)self protected_takeAssetOfflineWithProvider:a3 assetID:a6 copyData:v8];
    }
    LOBYTE(v12) = v13 ^ 1;
  }
  return v12;
}

@end