@interface MRServiceHandleClientMessage
@end

@implementation MRServiceHandleClientMessage

void ___MRServiceHandleClientMessage_block_invoke()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(v0 + 32), "MRXPC_MESSAGE_ID_KEY");
  switch(uint64)
  {
    case 0x700000000000001uLL:
      uint64_t v2 = *(void *)(v0 + 40);
      id v3 = *(id *)(v0 + 32);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___MRServiceHandlePostNotification_block_invoke;
      *(void *)&buf[24] = &unk_1E57D0518;
      v4 = v3;
      *(void *)&buf[32] = v4;
      v5 = (void (**)(void, void, void))MEMORY[0x1997190F0](buf);
      if (!v2 || !*(void *)(v2 + 8)) {
        goto LABEL_41;
      }
      v6 = MRCreateStringFromXPCMessage(v4, "MRXPC_NOTIFICATION_NAME_KEY");
      v7 = (void *)MRCreatePropertyListFromXPCMessage(v4, "MRXPC_NOTIFICATION_USERINFO_DATA_KEY");
      if (v6)
      {
        (*(void (**)(void *, void *, void, void (**)(void, void, void)))(v2 + 8))(v6, v7, *(void *)(v2 + 64), v5);
      }
      else
      {
        v53 = _MRLogForCategory(0);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          ___MRServiceHandleClientMessage_block_invoke_cold_1();
        }
      }
      goto LABEL_39;
    case 0x700000000000002uLL:
      id v8 = *(id *)(v0 + 32);
      v4 = MRCreatePlaybackQueueRequestFromXPCMessage(v8);
      v9 = MRCreatePlayerPathFromXPCMessage(v8);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___MRServiceHandleNowPlayingPlaybackQueueRequest_block_invoke;
      *(void *)&buf[24] = &unk_1E57D2430;
      *(void *)&buf[32] = v8;
      id v10 = v8;
      v11 = (void *)MEMORY[0x1997190F0](buf);
      MRServiceClientPlaybackQueueRequestCallback(v9, v4, v11);

      break;
    case 0x700000000000004uLL:
      uint64_t v12 = *(void *)(v0 + 40);
      id v13 = *(id *)(v0 + 32);
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = ___MRServiceHandleVideoThumbnailsRequest_block_invoke;
      v57[3] = &unk_1E57D2710;
      v4 = v13;
      v58 = v4;
      v14 = (void (**)(void, void, void))MEMORY[0x1997190F0](v57);
      if (v12 && *(void *)(v12 + 24))
      {
        Error = MRCreatePlayerPathFromXPCMessage(v4);
        memset(buf, 0, 512);
        MRVideoThumbnailRequestFromXPCMessage(v4, (uint64_t)buf);
        v16 = *(void (**)(void *, unsigned char *, uint64_t, void (**)(void, void, void)))(v12 + 24);
        uint64_t v17 = *(void *)(v12 + 64);
        memcpy(__dst, buf, sizeof(__dst));
        v16(Error, __dst, v17, v14);
      }
      else
      {
        Error = (void *)MRMediaRemoteCreateError(14);
        ((void (**)(void, void, void *))v14)[2](v14, 0, Error);
      }

      v47 = v58;
      goto LABEL_42;
    case 0x700000000000005uLL:
      uint64_t v18 = *(void *)(v0 + 40);
      id v19 = *(id *)(v0 + 32);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___MRServiceHandleAudioAmplitudeSamplesRequest_block_invoke;
      *(void *)&buf[24] = &unk_1E57D2710;
      v4 = v19;
      *(void *)&buf[32] = v4;
      v5 = (void (**)(void, void, void))MEMORY[0x1997190F0](buf);
      if (!v18 || !*(void *)(v18 + 32)) {
        goto LABEL_22;
      }
      v6 = MRCreatePlayerPathFromXPCMessage(v4);
      uint64_t v20 = xpc_dictionary_get_uint64(v4, "MRXPC_AUDIO_AMPLITUDE_SAMPLES_COUNT_KEY");
      (*(void (**)(void *, uint64_t, void, void (**)(void, void, void)))(v18 + 32))(v6, v20, *(void *)(v18 + 64), v5);
      goto LABEL_40;
    case 0x700000000000006uLL:
      uint64_t v21 = *(void *)(v0 + 40);
      id v22 = *(id *)(v0 + 32);
      if (v21 && *(void *)(v21 + 40))
      {
        id v54 = v22;
        v23 = MRCreatePlayerPathFromXPCMessage(v22);
        v24 = (UInt8 *)MRCreateDataFromXPCMessage(v54, "MRXPC_LYRICS_EVENT_DATA");
        v25 = (void *)MRLyricsEventCreateFromExternalRepresentation((uint64_t)v24);
        (*(void (**)(void *, void *))(v21 + 40))(v23, v25);

        id v22 = v54;
      }
      goto LABEL_27;
    case 0x700000000000008uLL:
      uint64_t v26 = *(void *)(v0 + 40);
      id v27 = *(id *)(v0 + 32);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___MRServiceHandleClientDiagnosticsRequest_block_invoke;
      *(void *)&buf[24] = &unk_1E57D2738;
      v4 = v27;
      *(void *)&buf[32] = v4;
      v5 = (void (**)(void, void, void))MEMORY[0x1997190F0](buf);
      if (v26 && (v28 = *(void (**)(void, void))(v26 + 48)) != 0)
      {
        v28(*(void *)(v26 + 64), v5);
      }
      else
      {
LABEL_22:
        v6 = (void *)MRMediaRemoteCreateError(14);
        ((void (**)(void, void, void *))v5)[2](v5, 0, v6);
LABEL_40:
      }
LABEL_41:

      v47 = *(NSObject **)&buf[32];
LABEL_42:

      break;
    case 0x70000000000000AuLL:
      uint64_t v29 = *(void *)(v0 + 40);
      id v30 = *(id *)(v0 + 32);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___MRServiceHandleGeneralClientMessage_block_invoke;
      *(void *)&buf[24] = &unk_1E57D2760;
      v4 = v30;
      *(void *)&buf[32] = v4;
      v5 = (void (**)(void, void, void))MEMORY[0x1997190F0](buf);
      v6 = MRCreateProtobufFromXPCMessage(v4);
      uint64_t v31 = MRCreatePlayerPathFromXPCMessage(v4);
      v7 = (void *)v31;
      if (v29 && (v32 = *(void (**)(uint64_t, void *, void))(v29 + 56)) != 0)
      {
        v32(v31, v6, v5);
      }
      else
      {
        v48 = [MRProtocolMessage alloc];
        v49 = (void *)MRMediaRemoteCreateError(14);
        v50 = [(MRProtocolMessage *)v48 initWithUnderlyingCodableMessage:0 error:v49];
        ((void (*)(void (**)(void, void, void), MRProtocolMessage *))v5[2])(v5, v50);
      }
LABEL_39:

      goto LABEL_40;
    case 0x70000000000000BuLL:
      MRCreateProtobufFromXPCMessage(*(void **)(v0 + 32));
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      v33 = [MRApplicationConnection alloc];
      v34 = [v55 context];
      v35 = [v55 requestInfo];
      v36 = [(MRApplicationConnection *)v33 initWithContext:v34 requestInfo:v35];

      v37 = +[MRClientApplicationConnectionManager sharedManager];
      [v37 registerConnection:v36];

      id v22 = v55;
LABEL_27:

      return;
    case 0x70000000000000CuLL:
      v4 = MRCreateProtobufFromXPCMessage(*(void **)(v0 + 32));
      v38 = [v4 context];
      v39 = +[MRClientApplicationConnectionManager sharedManager];
      v40 = [v38 identifier];
      v41 = [v39 connectionForIdentifier:v40];

      if (v41)
      {
        uint64_t v42 = [v4 message];
        [(MRMusicHandoffSession *)v41 handleMessage:v42];
      }
      else
      {
        uint64_t v42 = _MRLogForCategory(0);
        if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR)) {
          ___MRServiceHandleClientMessage_block_invoke_cold_2((uint64_t)v38, v4, v42);
        }
      }
      goto LABEL_50;
    case 0x70000000000000DuLL:
      v4 = MRCreateProtobufFromXPCMessage(*(void **)(v0 + 32));
      v38 = [v4 context];
      v43 = +[MRClientApplicationConnectionManager sharedManager];
      v44 = [v38 identifier];
      v41 = [v43 connectionForIdentifier:v44];

      if (v41)
      {
        uint64_t v42 = [v4 error];
        [(MRMusicHandoffSession *)v41 invalidate:v42];
      }
      else
      {
        uint64_t v42 = _MRLogForCategory(0);
        if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR)) {
          ___MRServiceHandleClientMessage_block_invoke_cold_3((uint64_t)v38, v42);
        }
      }
      goto LABEL_50;
    case 0x70000000000000EuLL:
      id v45 = *(id *)(v0 + 32);
      v4 = MRCreateDataFromXPCMessage(v45, "MRXPC_MUSIC_HANDOFF_SESSION_KEY");
      v38 = MRCreatePlayerPathFromXPCMessage(v45);

      v41 = [[MRMusicHandoffSession alloc] initWithProtobufData:v4];
      v46 = +[MRClientApplicationConnectionManager sharedManager];
      uint64_t v42 = [v46 handoffSessionHandlerForPlayerPath:v38];

      if (v42)
      {
        (*(void (**)(uint64_t, MRMusicHandoffSession *))(v42 + 16))(v42, v41);
      }
      else
      {
        v51 = _MRLogForCategory(0);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
          ___MRServiceHandleClientMessage_block_invoke_cold_4((uint64_t)v38, v51);
        }

        v52 = [[MRMusicHandoffEvent alloc] initWithType:2];
        [(MRMusicHandoffSession *)v41 updateWithEvent:v52];
      }
LABEL_50:

      break;
    default:
      v4 = _MRLogForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = uint64;
        _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Client XPC message with ID %lu not handled.", buf, 0xCu);
      }
      break;
  }
}

void ___MRServiceHandleClientMessage_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1(&dword_194F3C000, v0, v1, "Could not parse notification from xpc message", v2, v3, v4, v5, v6);
}

void ___MRServiceHandleClientMessage_block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 message];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Could not find connection: %@ to handle message: %@", (uint8_t *)&v6, 0x16u);
}

void ___MRServiceHandleClientMessage_block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "Could not find connection: %@ to handle invalidation", (uint8_t *)&v2, 0xCu);
}

void ___MRServiceHandleClientMessage_block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_194F3C000, a2, OS_LOG_TYPE_FAULT, "No handoff session handler found for player path: %@", (uint8_t *)&v2, 0xCu);
}

@end