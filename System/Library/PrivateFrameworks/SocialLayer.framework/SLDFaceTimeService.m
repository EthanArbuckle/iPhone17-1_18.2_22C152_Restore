@interface SLDFaceTimeService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
- (SLDFaceTimeService)init;
- (id)_applicationIdentifierForConnection:(id)a3;
- (id)_bundleIdentifierForConnection:(id)a3;
- (void)initiateTUConversationForAttributionIdentifier:(id)a3 videoEnabled:(BOOL)a4 completion:(id)a5;
- (void)refreshShareableContentMetadataInJoinedConversation;
@end

@implementation SLDFaceTimeService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC471F0;
}

+ (id)sharedService
{
  if (sharedService_onceToken_4 != -1) {
    dispatch_once(&sharedService_onceToken_4, &__block_literal_global_11);
  }
  v2 = (void *)sharedService_sService_4;
  return v2;
}

uint64_t __35__SLDFaceTimeService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDFaceTimeService);
  uint64_t v1 = sharedService_sService_4;
  sharedService_sService_4 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SLDFaceTimeService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SLDFaceTimeService;
  v2 = [(SLDFaceTimeService *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)initiateTUConversationForAttributionIdentifier:(id)a3 videoEnabled:(BOOL)a4 completion:(id)a5
{
  BOOL v54 = a4;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v57 = a5;
  v55 = [MEMORY[0x1E4F29268] currentConnection];
  if (IMCoreLibraryCore()
    && getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc()
    && IMCoreLibraryCore()
    && getIMSPIResetChatRegistrySymbolLoc())
  {
    v52 = [(SLDFaceTimeService *)self _applicationIdentifierForConnection:v55];
    v51 = [[SLInteractionHandler alloc] initWithAppIdentifier:v52];
    v7 = [(SLInteractionHandler *)v51 fetchAttributionForAttributionIdentifier:v56];
    v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = @"NO";
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v56;
      if (v54) {
        v9 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      v78 = (uint64_t (*)(uint64_t, uint64_t))v9;
      _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "%s: Initiating FaceTime conversation for attribution identifier %@ {videoEnabled: %@}", buf, 0x20u);
    }

    v10 = [v7 relatedPersons];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v78 = __Block_byref_object_copy__10;
    v79 = __Block_byref_object_dispose__10;
    id v80 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke;
    block[3] = &unk_1E58A86A8;
    v69 = buf;
    id v53 = v7;
    id v68 = v53;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    IMSPIResetChatRegistrySymbolLoc = (void (*)(void))getIMSPIResetChatRegistrySymbolLoc();
    if (!IMSPIResetChatRegistrySymbolLoc)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    IMSPIResetChatRegistrySymbolLoc();
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v12 = SLDaemonLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(*(void *)&buf[8] + 40);
        v14 = [v53 conversationIdentifier];
        *(_DWORD *)v71 = 136315650;
        v72 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
        __int16 v73 = 2112;
        id v74 = v13;
        __int16 v75 = 2112;
        v76 = v14;
        _os_log_impl(&dword_19BE17000, v12, OS_LOG_TYPE_DEFAULT, "%s: Using last addressed handle: %@ for chat GUID: %@", v71, 0x20u);
      }
      v15 = [MEMORY[0x1E4FADBD8] normalizedHandleWithDestinationID:*(void *)(*(void *)&buf[8] + 40)];
    }
    else
    {
      v23 = SLDaemonLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v71 = 136315394;
        v72 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
        __int16 v73 = 2112;
        id v74 = v56;
        _os_log_impl(&dword_19BE17000, v23, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a last addressed handle string from imagent. This may result in a FaceTime call including the local user. Attribution identifier: %@", v71, 0x16u);
      }

      v15 = 0;
    }
    v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v10;
    uint64_t v24 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v64 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = (void *)MEMORY[0x1E4FADBD8];
          v28 = [*(id *)(*((void *)&v63 + 1) + 8 * i) handle];
          v29 = [v27 normalizedHandleWithDestinationID:v28];

          if (v15 && [v29 isEquivalentToHandle:v15])
          {
            v30 = SLDaemonLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v71 = 136315394;
              v72 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
              __int16 v73 = 2112;
              id v74 = v29;
              _os_log_impl(&dword_19BE17000, v30, OS_LOG_TYPE_DEFAULT, "%s: Skipping handle %@ when initiating FaceTime conversation because it matches my last addressed handle.", v71, 0x16u);
            }
          }
          else
          {
            id v31 = objc_alloc(MEMORY[0x1E4FADB80]);
            v32 = [MEMORY[0x1E4F1CAD0] setWithObject:v29];
            v30 = [v31 initWithHandles:v32];

            [v59 addObject:v30];
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v24);
    }

    v33 = (void *)[objc_alloc(MEMORY[0x1E4FADBE8]) initWithRemoteMembers:v59];
    v34 = v33;
    if (v54) {
      uint64_t v35 = 2;
    }
    else {
      uint64_t v35 = 1;
    }
    [v33 setAvMode:v35];
    [v34 setVideoEnabled:v54];
    [v34 setShouldSuppressInCallUI:1];
    v36 = [MEMORY[0x1E4FADBA0] expanseProvider];
    [v34 setProvider:v36];

    if (v54) {
      [v34 setShouldLaunchBackgroundInCallUI:1];
    }
    if (v15) {
      [v34 setCallerID:v15];
    }
    if ((unint64_t)[v59 count] < 2
      || ([v53 groupID],
          v37 = objc_claimAutoreleasedReturnValue(),
          BOOL v38 = v37 == 0,
          v37,
          v38))
    {
      v44 = SLDaemonLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v71 = 136315138;
        v72 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
        _os_log_impl(&dword_19BE17000, v44, OS_LOG_TYPE_DEFAULT, "%s: FaceTime conversation being initiated is a 1:1.", v71, 0xCu);
      }

      v43 = [MEMORY[0x1E4FADB68] invitationPreferencesForAllHandlesWithStyles:4];
    }
    else
    {
      v39 = [v53 groupDisplayName];
      v40 = SLDaemonLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = [v53 groupID];
        *(_DWORD *)v71 = 136315650;
        v72 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
        __int16 v73 = 2112;
        id v74 = v41;
        __int16 v75 = 2112;
        v76 = v39;
        _os_log_impl(&dword_19BE17000, v40, OS_LOG_TYPE_DEFAULT, "%s: FaceTime conversation being initiated is a group, setting group ID to %@ and messages group name to %@.", v71, 0x20u);
      }
      v42 = [v53 groupID];
      [v34 setMessagesGroupUUID:v42];

      [v34 setMessagesGroupName:v39];
      v43 = [MEMORY[0x1E4FADB68] invitationPreferencesForAllHandlesWithStyles:2];
    }
    [v34 setInvitationPreferences:v43];
    if (objc_opt_respondsToSelector())
    {
      v45 = [v53 collaborationMetadata];
      v46 = [v45 collaborationIdentifier];
      [v34 setCollaborationIdentifier:v46];
    }
    v47 = SLDaemonLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v71 = 136315394;
      v72 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
      __int16 v73 = 2112;
      id v74 = v34;
      _os_log_impl(&dword_19BE17000, v47, OS_LOG_TYPE_DEFAULT, "%s: FaceTime conversation being initiated using join request %@", v71, 0x16u);
    }

    v48 = [MEMORY[0x1E4FADA90] sharedInstance];
    v49 = [v48 queue];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_144;
    v60[3] = &unk_1E58A9088;
    id v61 = v34;
    id v62 = v57;
    id v50 = v34;
    dispatch_async(v49, v60);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v16 = SLDaemonLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]((uint64_t)v56, v16, v17, v18, v19, v20, v21, v22);
    }

    (*((void (**)(id, void))v57 + 2))(v57, 0);
  }
}

void __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) conversationIdentifier];
  IMSPILastAddressedHandleForChatWithGUIDSymbolLoc = (void (*)(id))getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc();
  if (IMSPILastAddressedHandleForChatWithGUIDSymbolLoc)
  {
    uint64_t v3 = IMSPILastAddressedHandleForChatWithGUIDSymbolLoc(v7);

    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = SLDCreateGroupPhotoImageWithGroupID_cold_1();
    __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_144(v6);
  }
}

uint64_t __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_144(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  int v3 = [v2 launchAppForJoinRequest:*(void *)(a1 + 32)];

  uint64_t v4 = SLDaemonLogHandle();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]_block_invoke";
      _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "%s: FaceTime conversation successfully initiated", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_144_cold_1();
    }

    uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v6();
}

- (void)refreshShareableContentMetadataInJoinedConversation
{
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  int v3 = [v2 queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2;
  v5[3] = &unk_1E58A8680;
  id v6 = v2;
  id v7 = *(id *)(a1 + 32);
  id v4 = v2;
  dispatch_async(v3, v5);
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) conversationManager];
  int v3 = [v2 activeConversations];

  id v4 = [v3 objectsPassingTest:&__block_literal_global_147];
  v5 = [v4 anyObject];
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [MEMORY[0x1E4F1CB10] faceTimeRefreshShareableContentURLForBundleIdentifier:*(void *)(a1 + 40)];
      id v7 = SLDaemonLogHandle();
      int v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[SLDFaceTimeService refreshShareableContentMetadataInJoinedConversation]_block_invoke";
          __int16 v29 = 2112;
          v30 = v6;
          _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "%s: Opening URL %@.", buf, 0x16u);
        }

        int v8 = objc_alloc_init(MEMORY[0x1E4F224A0]);
        uint64_t v25 = *MEMORY[0x1E4F625F8];
        uint64_t v26 = MEMORY[0x1E4F1CC38];
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        [v8 setFrontBoardOptions:v9];

        uint64_t v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        [v10 openURL:v6 configuration:v8 completionHandler:0];
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_2();
      }
    }
    else
    {
      id v6 = SLDaemonLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_3(v6, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
  else
  {
    id v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_1(v6, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

BOOL __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL result = [a2 state] == 3;
  *a3 = result;
  return result;
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v4 = a3;
  v5 = v4;
  id v6 = (void *)MEMORY[0x1E4F223F8];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  id v13 = 0;
  id v7 = [v6 bundleRecordForAuditToken:v14 error:&v13];
  id v8 = v13;
  v9 = [v7 applicationIdentifier];

  if (!v9)
  {
    uint64_t v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(SLDFaceTimeService *)(uint64_t)self _applicationIdentifierForConnection:v10];
    }
  }
  uint64_t v11 = [v7 applicationIdentifier];

  return v11;
}

- (id)_bundleIdentifierForConnection:(id)a3
{
  id v4 = a3;
  v5 = v4;
  id v6 = (void *)MEMORY[0x1E4F223F8];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  id v13 = 0;
  id v7 = [v6 bundleRecordForAuditToken:v14 error:&v13];
  id v8 = v13;
  v9 = [v7 bundleIdentifier];

  if (!v9)
  {
    uint64_t v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(SLDFaceTimeService *)(uint64_t)self _bundleIdentifierForConnection:v10];
    }
  }
  uint64_t v11 = [v7 bundleIdentifier];

  return v11;
}

- (void)initiateTUConversationForAttributionIdentifier:(uint64_t)a3 videoEnabled:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_144_cold_1()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_7(&dword_19BE17000, v0, v1, "%s: Failed to initiate FaceTime conversation using join request %@", v2, v3, v4, v5, 2u);
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_7(&dword_19BE17000, v0, v1, "%s: Failed to create URL with bundle identifier %@.", v2, v3, v4, v5, 2u);
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_applicationIdentifierForConnection:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "[SLDCollaborationAttributionViewService: %p] Failed to generate a bundle record, or the record's app ID is nil. This is required to look up attribution data. Error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_bundleIdentifierForConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138412802;
  v9 = v7;
  __int16 v10 = 2048;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "[%@: %p] Failed to generate a bundle record, or the record's bundle ID is nil. This is required to look up attribution data. Error: %@", (uint8_t *)&v8, 0x20u);
}

@end