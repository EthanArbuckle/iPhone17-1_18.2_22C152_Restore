@interface PLAssetsdInterface
+ (NSXPCInterface)assetsdInterface;
+ (void)_addCloudInterfaces:(id)a3;
+ (void)_addDebugInterfaces:(id)a3;
+ (void)_addDemoInterface:(id)a3;
+ (void)_addDiagnosticsInterface:(id)a3;
+ (void)_addLibraryInterfaces:(id)a3;
+ (void)_addMigrationInterface:(id)a3;
+ (void)_addNotificationInterface:(id)a3;
+ (void)_addPhotoKitAddInterface:(id)a3;
+ (void)_addPhotoKitInterface:(id)a3;
+ (void)_addResourceAvailabilityInterface:(id)a3;
+ (void)_addResourceInterfaces:(id)a3;
+ (void)_addSyncInterface:(id)a3;
@end

@implementation PLAssetsdInterface

+ (NSXPCInterface)assetsdInterface
{
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC30FE8];
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v15, "setWithObjects:", v14, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v3 setClasses:v12 forSelector:sel_bindToPhotoLibraryURL_sandboxExtension_clientOptions_withReply_ argumentIndex:2 ofReply:0];
  [a1 _addLibraryInterfaces:v3];
  [a1 _addPhotoKitInterface:v3];
  [a1 _addPhotoKitAddInterface:v3];
  [a1 _addResourceAvailabilityInterface:v3];
  [a1 _addResourceInterfaces:v3];
  [a1 _addCloudInterfaces:v3];
  [a1 _addMigrationInterface:v3];
  [a1 _addSyncInterface:v3];
  [a1 _addNotificationInterface:v3];
  [a1 _addDemoInterface:v3];
  [a1 _addDiagnosticsInterface:v3];
  [a1 _addDebugInterfaces:v3];

  return (NSXPCInterface *)v3;
}

+ (void)_addResourceAvailabilityInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_1EEC31DC8];
  [v4 setInterface:v5 forSelector:sel_getResourceAvailabilityServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addPhotoKitAddInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_1EEC31D68];
  [v4 setInterface:v5 forSelector:sel_getPhotoKitAddServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addSyncInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_1EEC329D0];
  [v4 setInterface:v5 forSelector:sel_getSyncServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addNotificationInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_1EEC32BA8];
  [v4 setInterface:v5 forSelector:sel_getNotificationServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addMigrationInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_1EEC328F0];
  [v4 setInterface:v5 forSelector:sel_getMigrationServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addLibraryInterfaces:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v17 = [v3 interfaceWithProtocol:&unk_1EEC31310];
  [v4 setInterface:v17 forSelector:sel_getLibraryServiceWithReply_ argumentIndex:0 ofReply:1];
  id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC317A0];
  [v4 setInterface:v5 forSelector:sel_getLibraryInternalServiceWithReply_ argumentIndex:0 ofReply:1];
  uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC31938];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = [v12 setWithObjects:v13, NSClassFromString((NSString *)@"PLPhotoLibraryIdentifier"), 0];
  [v6 setClasses:v11 forSelector:sel_createManagedPhotoLibraryWithOptions_sandboxExtension_reply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v14 forSelector:sel_findPhotoLibraryIdentifiersMatchingSearchCriteria_reply_ argumentIndex:0 ofReply:1];
  [v4 setInterface:v6 forSelector:sel_getLibraryManagementServiceWithReply_ argumentIndex:0 ofReply:1];
  v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC31A00];
  [v4 setInterface:v15 forSelector:sel_getSystemLibraryURLReadOnlyServiceWithReply_ argumentIndex:0 ofReply:1];
  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC31AD0];
  [v4 setInterface:v16 forSelector:sel_getPrivacySupportServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addPhotoKitInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v16 = [v3 interfaceWithProtocol:&unk_1EEC31CD0];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
  [v16 setClasses:v8 forSelector:sel_getUUIDsForAssetObjectURIs_filterPredicate_reply_ argumentIndex:0 ofReply:0];
  [v16 setClasses:v8 forSelector:sel_getUUIDsForAssetObjectURIs_filterPredicate_reply_ argumentIndex:1 ofReply:0];
  [v16 setClasses:v15 forSelector:sel_getUUIDsForAssetObjectURIs_filterPredicate_reply_ argumentIndex:0 ofReply:1];
  [v16 setClasses:v15 forSelector:sel_reserveCloudIdentifiersWithEntityName_count_reply_ argumentIndex:0 ofReply:1];
  [v16 setClasses:v15 forSelector:sel_reservedCloudIdentifiersWithEntityName_reply_ argumentIndex:0 ofReply:1];
  [v4 setInterface:v16 forSelector:sel_getPhotoKitServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addResourceInterfaces:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v28 = a3;
  v29 = [v3 interfaceWithProtocol:&unk_1EEC32008];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v27 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v13, "setWithObjects:", v26, v14, v15, v16, v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
  [v29 setClasses:v27 forSelector:sel_saveAssetWithDataAndPorts_imageSurface_previewImageSurface_reply_ argumentIndex:0 ofReply:0];
  [v29 setClasses:v23 forSelector:sel_saveAssetWithDataAndPorts_imageSurface_previewImageSurface_reply_ argumentIndex:1 ofReply:1];
  [v29 setClasses:v23 forSelector:sel_consolidateAssets_reply_ argumentIndex:0 ofReply:1];
  [v28 setInterface:v29 forSelector:sel_getResourceServiceWithReply_ argumentIndex:0 ofReply:1];
  v24 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC2C5B8];
  [v24 setClasses:v27 forSelector:sel_saveAssetWithDataAndPorts_imageSurface_previewImageSurface_reply_ argumentIndex:0 ofReply:0];
  [v24 setClasses:v23 forSelector:sel_saveAssetWithDataAndPorts_imageSurface_previewImageSurface_reply_ argumentIndex:1 ofReply:1];
  [v28 setInterface:v24 forSelector:sel_getResourceWriteOnlyServiceWithReply_ argumentIndex:0 ofReply:1];
  v25 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC32110];
  [v25 setClasses:v23 forSelector:sel_batchSaveAssetJobs_reply_ argumentIndex:0 ofReply:1];
  [v28 setInterface:v25 forSelector:sel_getResourceInternalServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addDiagnosticsInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_1EEC32D58];
  [v4 setInterface:v5 forSelector:sel_getDiagnosticsServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addDemoInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v5 = [v3 interfaceWithProtocol:&unk_1EEC32C88];
  [v4 setInterface:v5 forSelector:sel_getDemoServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addDebugInterfaces:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v17 = objc_msgSend(v3, "setWithObjects:", v16, v15, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  uint64_t v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC333E8];
  [v4 setInterface:v13 forSelector:sel_getDebugServiceWithReply_ argumentIndex:0 ofReply:1];
  [v13 setClasses:v17 forSelector:sel_debugSidecarURLsWithObjectURI_reply_ argumentIndex:1 ofReply:1];
  uint64_t v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC334E8];
  [v4 setInterface:v14 forSelector:sel_getNonBindingDebugServiceWithReply_ argumentIndex:0 ofReply:1];
}

+ (void)_addCloudInterfaces:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  id v6 = [v3 interfaceWithProtocol:&unk_1EEC32258];
  [v4 setInterface:v6 forSelector:sel_getCloudServiceWithReply_ argumentIndex:0 ofReply:1];
  uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC32820];
  [v4 setInterface:v5 forSelector:sel_getCloudInternalServiceWithReply_ argumentIndex:0 ofReply:1];
}

@end