@interface RCSSavedRecordingServiceConnection
+ (id)clientInterface;
+ (id)newConnection;
+ (id)serviceInterface;
@end

@implementation RCSSavedRecordingServiceConnection

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_140);
  }
  v2 = (void *)clientInterface_interface;
  return v2;
}

+ (id)newConnection
{
  v3 = [[RCSSavedRecordingServiceConnection alloc] initWithMachServiceName:@"com.apple.voicememod.xpc" options:0];
  v4 = [a1 serviceInterface];
  [(RCSSavedRecordingServiceConnection *)v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)serviceInterface
{
  if (serviceInterface_onceToken != -1) {
    dispatch_once(&serviceInterface_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)serviceInterface_interface;
  return v2;
}

uint64_t __53__RCSSavedRecordingServiceConnection_clientInterface__block_invoke()
{
  clientInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1F159A0];
  return MEMORY[0x1F41817F8]();
}

void __54__RCSSavedRecordingServiceConnection_serviceInterface__block_invoke()
{
  v47[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1F15EB8];
  v1 = (void *)serviceInterface_interface;
  serviceInterface_interface = v0;

  v2 = sel_prepareToCaptureToCompositionAVURL_accessRequestHandler_;
  v47[0] = sel_prepareToPreviewCompositionAVURL_accessRequestHandler_;
  v47[1] = sel_prepareToExportCompositionAVURL_accessRequestHandler_;
  v47[2] = sel_prepareToTrimCompositionAVURL_accessRequestHandler_;
  v47[3] = 0;
  id v45 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v46 = (id)objc_msgSend(v45, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v15 = [v14 setByAddingObjectsFromSet:v46];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v19 = [v18 setByAddingObjectsFromSet:v46];

  v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v23 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
  if (sel_prepareToCaptureToCompositionAVURL_accessRequestHandler_)
  {
    v28 = (char **)v47;
    do
    {
      [(id)serviceInterface_interface setClasses:v23 forSelector:v2 argumentIndex:0 ofReply:0];
      [(id)serviceInterface_interface setClasses:v15 forSelector:v2 argumentIndex:0 ofReply:1];
      [(id)serviceInterface_interface setClasses:v27 forSelector:v2 argumentIndex:1 ofReply:1];
      v29 = *v28++;
      v2 = v29;
    }
    while (v29);
  }
  [(id)serviceInterface_interface setClasses:v15 forSelector:sel_endAccessSessionWithToken_completionBlock_ argumentIndex:0 ofReply:0];
  v30 = (void *)serviceInterface_interface;
  v31 = [v27 setByAddingObjectsFromSet:v15];
  [v30 setClasses:v31 forSelector:sel_endAccessSessionWithToken_completionBlock_ argumentIndex:0 ofReply:1];

  [(id)serviceInterface_interface setClasses:v23 forSelector:sel_openAudioFile_settings_metadata_accessRequestHandler_ argumentIndex:0 ofReply:0];
  [(id)serviceInterface_interface setClasses:v46 forSelector:sel_openAudioFile_settings_metadata_accessRequestHandler_ argumentIndex:1 ofReply:0];
  [(id)serviceInterface_interface setClasses:v46 forSelector:sel_openAudioFile_settings_metadata_accessRequestHandler_ argumentIndex:2 ofReply:0];
  [(id)serviceInterface_interface setClasses:v15 forSelector:sel_openAudioFile_settings_metadata_accessRequestHandler_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_openAudioFile_settings_metadata_accessRequestHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v15 forSelector:sel_closeAudioFile_completionBlock_ argumentIndex:0 ofReply:0];
  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_closeAudioFile_completionBlock_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v23 forSelector:sel_writeAudioFile_buffer_completionBlock_ argumentIndex:0 ofReply:0];
  [(id)serviceInterface_interface setClasses:v19 forSelector:sel_writeAudioFile_buffer_completionBlock_ argumentIndex:1 ofReply:0];
  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_writeAudioFile_buffer_completionBlock_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v46 forSelector:sel_disableOrphanedFragmentCleanupForCompositionAVURL_completionBlock_ argumentIndex:0 ofReply:0];
  [(id)serviceInterface_interface setClasses:v46 forSelector:sel_enableOrphanedFragmentCleanupForCompositionAVURL_ argumentIndex:0 ofReply:0];
  [(id)serviceInterface_interface setClasses:v46 forSelector:sel_fetchCompositionAVURLsBeingExported_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v46 forSelector:sel_fetchCompositionAVURLsBeingModified_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v15 forSelector:sel__fetchAllAccessTokens_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v22 forSelector:sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_ argumentIndex:0 ofReply:0];
  v32 = (void *)serviceInterface_interface;
  v33 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v32 setClasses:v33 forSelector:sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_ argumentIndex:1 ofReply:0];

  v34 = (void *)serviceInterface_interface;
  v35 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v34 setClasses:v35 forSelector:sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_ argumentIndex:2 ofReply:0];

  [(id)serviceInterface_interface setClasses:v46 forSelector:sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_ argumentIndex:3 ofReply:0];
  [(id)serviceInterface_interface setClasses:v23 forSelector:sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_enableCloudRecordingsWithCompletionBlock_ argumentIndex:0 ofReply:1];
  v36 = (void *)serviceInterface_interface;
  v37 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v36 setClasses:v37 forSelector:sel_importRecordingsFromCloud_ argumentIndex:0 ofReply:1];

  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_importRecordingsFromCloud_ argumentIndex:1 ofReply:1];
  v38 = (void *)serviceInterface_interface;
  v39 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v38 setClasses:v39 forSelector:sel_exportRecordingsToCloud_ argumentIndex:0 ofReply:1];

  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_exportRecordingsToCloud_ argumentIndex:1 ofReply:1];
  v40 = (void *)serviceInterface_interface;
  v41 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v40 setClasses:v41 forSelector:sel_expungeRecordingsFromCloud_ argumentIndex:0 ofReply:1];

  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_expungeRecordingsFromCloud_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_reloadExistingSearchMetadataWithCompletionBlock_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_clearAndReloadSearchMetadataWithCompletionBlock_ argumentIndex:0 ofReply:1];
  v42 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v43 = objc_opt_class();
  v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  [(id)serviceInterface_interface setClasses:v44 forSelector:sel_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_ argumentIndex:0 ofReply:0];
  [(id)serviceInterface_interface setClasses:v44 forSelector:sel_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_ argumentIndex:1 ofReply:0];
  [(id)serviceInterface_interface setClasses:v44 forSelector:sel_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_ argumentIndex:2 ofReply:0];
  [(id)serviceInterface_interface setClasses:v27 forSelector:sel_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_ argumentIndex:0 ofReply:1];
}

@end