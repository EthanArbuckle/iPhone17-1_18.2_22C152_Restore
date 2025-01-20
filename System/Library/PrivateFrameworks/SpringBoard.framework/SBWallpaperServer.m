@interface SBWallpaperServer
+ (id)sharedInstance;
- (BOOL)_clientPermittedToModifyWallpaper:(id)a3;
- (BOOL)_xpcObjectIsDictionary:(id)a3;
- (FBServiceClientAuthenticator)accessAuthenticator;
- (SBWallpaperServerDelegate)delegate;
- (id)_init;
- (int64_t)_deviceOrientationFromXPCDictionary:(id)a3;
- (int64_t)_wallpaperModeFromXPCDictionary:(id)a3;
- (int64_t)_wallpaperVariantFromXPCDictionary:(id)a3;
- (void)_handleFetchContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchLimitedOcclusionBoundsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchLockScreenContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchLockScreenForegroundBoundsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchLockScreenMaximalContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchLockScreenTimeBoundsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchOriginalImageMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchOriginalVideoURLMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchPosterSignificantEventsCounterMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchThumbnailMessage:(id)a3 fromClient:(id)a4;
- (void)_handleQuickActionConfigurationRequest:(id)a3 fromClient:(id)a4;
- (void)_handleRestoreDefaultWallpaperMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetColorMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetColorNameMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetGradientMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetVideoMessageWithWallpaperMode:(id)a3 fromClient:(id)a4;
- (void)_handleTriggerPosterSignificantEventMessage:(id)a3 fromClient:(id)a4;
- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5;
- (void)setAccessAuthenticator:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBWallpaperServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_38 != -1) {
    dispatch_once(&sharedInstance_onceToken_38, &__block_literal_global_269);
  }
  v2 = (void *)sharedInstance___sharedInstance_20;
  return v2;
}

uint64_t __35__SBWallpaperServer_sharedInstance__block_invoke()
{
  kdebug_trace();
  id v0 = [[SBWallpaperServer alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_20;
  sharedInstance___sharedInstance_20 = (uint64_t)v0;

  return kdebug_trace();
}

- (id)_init
{
  v3 = (void *)MEMORY[0x1E4F62AC8];
  Serial = (void *)BSDispatchQueueCreateSerial();
  v5 = [v3 queueWithDispatchQueue:Serial];

  uint64_t v6 = *MEMORY[0x1E4FA7240];
  v9.receiver = self;
  v9.super_class = (Class)SBWallpaperServer;
  v7 = [(FBSServiceFacility *)&v9 initWithIdentifier:v6 queue:v5];

  return v7;
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 0:
      [(SBWallpaperServer *)self _handleFetchThumbnailMessage:v8 fromClient:v9];
      break;
    case 1:
      [(SBWallpaperServer *)self _handleFetchOriginalImageMessage:v8 fromClient:v9];
      break;
    case 2:
      [(SBWallpaperServer *)self _handleFetchOriginalVideoURLMessage:v8 fromClient:v9];
      break;
    case 3:
      [(SBWallpaperServer *)self _handleFetchContentCutoutBoundsMessage:v8 fromClient:v9];
      break;
    case 4:
      [(SBWallpaperServer *)self _handleFetchLockScreenContentCutoutBoundsMessage:v8 fromClient:v9];
      break;
    case 5:
      [(SBWallpaperServer *)self _handleFetchLockScreenMaximalContentCutoutBoundsMessage:v8 fromClient:v9];
      break;
    case 6:
      [(SBWallpaperServer *)self _handleFetchLockScreenForegroundBoundsMessage:v8 fromClient:v9];
      break;
    case 7:
      [(SBWallpaperServer *)self _handleFetchLimitedOcclusionBoundsMessage:v8 fromClient:v9];
      break;
    case 8:
      [(SBWallpaperServer *)self _handleFetchLockScreenTimeBoundsMessage:v8 fromClient:v9];
      break;
    case 9:
      [(SBWallpaperServer *)self _handleSetVideoMessageWithWallpaperMode:v8 fromClient:v9];
      break;
    case 10:
      [(SBWallpaperServer *)self _handleSetColorNameMessage:v8 fromClient:v9];
      break;
    case 11:
      [(SBWallpaperServer *)self _handleSetColorMessage:v8 fromClient:v9];
      break;
    case 12:
      [(SBWallpaperServer *)self _handleSetGradientMessage:v8 fromClient:v9];
      break;
    case 13:
      [(SBWallpaperServer *)self _handleRestoreDefaultWallpaperMessage:v8 fromClient:v9];
      break;
    case 14:
      [(SBWallpaperServer *)self _handleTriggerPosterSignificantEventMessage:v8 fromClient:v9];
      break;
    case 15:
      [(SBWallpaperServer *)self _handleFetchPosterSignificantEventsCounterMessage:v8 fromClient:v9];
      break;
    case 16:
      [(SBWallpaperServer *)self _handleQuickActionConfigurationRequest:v8 fromClient:v9];
      break;
    default:
      v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SBApplicationServer noteDidReceiveMessage:withType:fromClient:]((uint64_t)self, v9, v10);
      }

      break;
  }
}

- (int64_t)_wallpaperVariantFromXPCDictionary:(id)a3
{
  LODWORD(result) = xpc_dictionary_get_uint64(a3, (const char *)*MEMORY[0x1E4FA7910]);
  if ((result & 0xFFFFFFFE) != 0) {
    return -1;
  }
  else {
    return result;
  }
}

- (int64_t)_deviceOrientationFromXPCDictionary:(id)a3
{
  LODWORD(result) = xpc_dictionary_get_uint64(a3, (const char *)*MEMORY[0x1E4FA78E8]);
  if ((unint64_t)result - 1 >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

- (void)_handleFetchThumbnailMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__SBWallpaperServer__handleFetchThumbnailMessage_fromClient___block_invoke;
  v17[3] = &unk_1E6B078A0;
  id v8 = v6;
  id v18 = v8;
  id v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](v17);
  v10 = [v8 payload];
  v11 = v10;
  if (!v10) {
    goto LABEL_8;
  }
  if (object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_8;
  }
  v12 = [v7 processHandle];
  int v13 = [v12 hasEntitlement:*MEMORY[0x1E4FA7238]];

  if (!v13) {
    goto LABEL_8;
  }
  int64_t v14 = [(SBWallpaperServer *)self _wallpaperVariantFromXPCDictionary:v11];
  v15 = [(SBWallpaperServer *)self delegate];
  v16 = v15;
  if (!v15 || v14 == -1)
  {

LABEL_8:
    v9[2](v9, 0);
    goto LABEL_9;
  }
  [v15 wallpaperServer:self fetchThumbnailDataForVariant:v14 completionHandler:v9];

LABEL_9:
}

void __61__SBWallpaperServer__handleFetchThumbnailMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBWallpaperServer__handleFetchThumbnailMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E6AFC038;
  id v7 = v3;
  id v5 = v3;
  [v4 sendReplyMessageWithPacker:v6];
}

void __61__SBWallpaperServer__handleFetchThumbnailMessage_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    xpc_object_t xdict = v3;
    xpc_object_t v5 = xpc_data_create_with_dispatch_data(v4);
    id v6 = v5;
    if (!v5 || (size_t length = xpc_data_get_length(v5), length != [*(id *)(a1 + 32) length]))
    {
      xpc_object_t v8 = xpc_data_create((const void *)[*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"));

      id v6 = v8;
    }
    xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E4FA78E0], v6);

    id v3 = xdict;
  }
}

- (void)_handleFetchOriginalImageMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__SBWallpaperServer__handleFetchOriginalImageMessage_fromClient___block_invoke;
  v17[3] = &unk_1E6B078A0;
  id v8 = v6;
  id v18 = v8;
  id v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](v17);
  v10 = [v8 payload];
  v11 = v10;
  if (!v10) {
    goto LABEL_8;
  }
  if (object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_8;
  }
  v12 = [v7 processHandle];
  int v13 = [v12 hasEntitlement:*MEMORY[0x1E4FA7238]];

  if (!v13) {
    goto LABEL_8;
  }
  int64_t v14 = [(SBWallpaperServer *)self _wallpaperVariantFromXPCDictionary:v11];
  v15 = [(SBWallpaperServer *)self delegate];
  v16 = v15;
  if (!v15 || v14 == -1)
  {

LABEL_8:
    v9[2](v9, 0);
    goto LABEL_9;
  }
  [v15 wallpaperServer:self fetchOriginalImageDataForVariant:v14 completionHandler:v9];

LABEL_9:
}

void __65__SBWallpaperServer__handleFetchOriginalImageMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBWallpaperServer__handleFetchOriginalImageMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E6AFC038;
  id v7 = v3;
  id v5 = v3;
  [v4 sendReplyMessageWithPacker:v6];
}

void __65__SBWallpaperServer__handleFetchOriginalImageMessage_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    xpc_object_t xdict = v3;
    xpc_object_t v5 = xpc_data_create_with_dispatch_data(v4);
    id v6 = v5;
    if (!v5 || (size_t length = xpc_data_get_length(v5), length != [*(id *)(a1 + 32) length]))
    {
      xpc_object_t v8 = xpc_data_create((const void *)[*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"));

      id v6 = v8;
    }
    xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E4FA78E0], v6);

    id v3 = xdict;
  }
}

- (void)_handleFetchOriginalVideoURLMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__SBWallpaperServer__handleFetchOriginalVideoURLMessage_fromClient___block_invoke;
  v17[3] = &unk_1E6B078A0;
  id v8 = v6;
  id v18 = v8;
  id v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](v17);
  v10 = [v8 payload];
  v11 = v10;
  if (!v10) {
    goto LABEL_8;
  }
  if (object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_8;
  }
  v12 = [v7 processHandle];
  int v13 = [v12 hasEntitlement:*MEMORY[0x1E4FA7238]];

  if (!v13) {
    goto LABEL_8;
  }
  int64_t v14 = [(SBWallpaperServer *)self _wallpaperVariantFromXPCDictionary:v11];
  v15 = [(SBWallpaperServer *)self delegate];
  v16 = v15;
  if (!v15 || v14)
  {

LABEL_8:
    v9[2](v9, 0);
    goto LABEL_9;
  }
  [v15 wallpaperServer:self fetchOriginalVideoURLDataForVariant:0 completionHandler:v9];

LABEL_9:
}

void __68__SBWallpaperServer__handleFetchOriginalVideoURLMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__SBWallpaperServer__handleFetchOriginalVideoURLMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E6AFC038;
  id v7 = v3;
  id v5 = v3;
  [v4 sendReplyMessageWithPacker:v6];
}

void __68__SBWallpaperServer__handleFetchOriginalVideoURLMessage_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    xpc_object_t xdict = v3;
    xpc_object_t v5 = xpc_data_create_with_dispatch_data(v4);
    id v6 = v5;
    if (!v5 || (size_t length = xpc_data_get_length(v5), length != [*(id *)(a1 + 32) length]))
    {
      xpc_object_t v8 = xpc_data_create((const void *)[*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"));

      id v6 = v8;
    }
    xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E4FA7918], v6);

    id v3 = xdict;
  }
}

- (void)_handleFetchContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke;
  v21[3] = &unk_1E6B08300;
  id v6 = v5;
  id v22 = v6;
  id v7 = (void *)MEMORY[0x1D948C7A0](v21);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke_3;
  v19 = &unk_1E6AF4AC0;
  id v8 = v6;
  id v20 = v8;
  id v9 = (void (**)(void))MEMORY[0x1D948C7A0](&v16);
  v10 = objc_msgSend(v8, "payload", v16, v17, v18, v19);
  v11 = v10;
  if (!v10 || object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_8;
  }
  int64_t v12 = [(SBWallpaperServer *)self _wallpaperVariantFromXPCDictionary:v11];
  int64_t v13 = [(SBWallpaperServer *)self _deviceOrientationFromXPCDictionary:v11];
  int64_t v14 = [(SBWallpaperServer *)self delegate];
  v15 = v14;
  if (!v14 || v12 || (unint64_t)(v13 - 1) > 3)
  {

LABEL_8:
    v9[2](v9);
    goto LABEL_9;
  }
  [v14 wallpaperServer:self fetchContentCutoutBoundsForVariant:0 orientation:v13 completionHandler:v7];

LABEL_9:
}

uint64_t __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return [v5 sendReplyMessageWithPacker:v7];
}

uint64_t __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke_2(double *a1, uint64_t a2)
{
  return MEMORY[0x1F410C598](a2, *MEMORY[0x1E4FA7908], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __71__SBWallpaperServer__handleFetchContentCutoutBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyMessageWithPacker:&__block_literal_global_7_4];
}

- (void)_handleFetchLockScreenContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke;
  v20[3] = &unk_1E6B08300;
  id v6 = v5;
  id v21 = v6;
  id v7 = (void *)MEMORY[0x1D948C7A0](v20);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke_3;
  id v18 = &unk_1E6AF4AC0;
  id v8 = v6;
  id v19 = v8;
  id v9 = (void (**)(void))MEMORY[0x1D948C7A0](&v15);
  v10 = objc_msgSend(v8, "payload", v15, v16, v17, v18);
  v11 = v10;
  if (!v10 || object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_7;
  }
  int64_t v12 = [(SBWallpaperServer *)self _deviceOrientationFromXPCDictionary:v11];
  int64_t v13 = [(SBWallpaperServer *)self delegate];
  int64_t v14 = v13;
  if (!v13 || (unint64_t)(v12 - 1) > 3)
  {

LABEL_7:
    v9[2](v9);
    goto LABEL_8;
  }
  [v13 wallpaperServer:self fetchLockScreenContentCutoutBoundsForOrientation:v12 completionHandler:v7];

LABEL_8:
}

uint64_t __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return [v5 sendReplyMessageWithPacker:v7];
}

uint64_t __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke_2(double *a1, uint64_t a2)
{
  return MEMORY[0x1F410C598](a2, *MEMORY[0x1E4FA7908], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __81__SBWallpaperServer__handleFetchLockScreenContentCutoutBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyMessageWithPacker:&__block_literal_global_9_2];
}

- (void)_handleFetchLockScreenMaximalContentCutoutBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke;
  v20[3] = &unk_1E6B08300;
  id v6 = v5;
  id v21 = v6;
  id v7 = (void *)MEMORY[0x1D948C7A0](v20);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke_3;
  id v18 = &unk_1E6AF4AC0;
  id v8 = v6;
  id v19 = v8;
  id v9 = (void (**)(void))MEMORY[0x1D948C7A0](&v15);
  v10 = objc_msgSend(v8, "payload", v15, v16, v17, v18);
  v11 = v10;
  if (!v10 || object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_7;
  }
  int64_t v12 = [(SBWallpaperServer *)self _deviceOrientationFromXPCDictionary:v11];
  int64_t v13 = [(SBWallpaperServer *)self delegate];
  int64_t v14 = v13;
  if (!v13 || (unint64_t)(v12 - 1) > 3)
  {

LABEL_7:
    v9[2](v9);
    goto LABEL_8;
  }
  [v13 wallpaperServer:self fetchLockScreenMaximalContentCutoutBoundsForOrientation:v12 completionHandler:v7];

LABEL_8:
}

uint64_t __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return [v5 sendReplyMessageWithPacker:v7];
}

uint64_t __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke_2(double *a1, uint64_t a2)
{
  return MEMORY[0x1F410C598](a2, *MEMORY[0x1E4FA7908], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __88__SBWallpaperServer__handleFetchLockScreenMaximalContentCutoutBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyMessageWithPacker:&__block_literal_global_11_4];
}

- (void)_handleFetchLockScreenForegroundBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke;
  v20[3] = &unk_1E6B08300;
  id v6 = v5;
  id v21 = v6;
  id v7 = (void *)MEMORY[0x1D948C7A0](v20);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke_3;
  id v18 = &unk_1E6AF4AC0;
  id v8 = v6;
  id v19 = v8;
  id v9 = (void (**)(void))MEMORY[0x1D948C7A0](&v15);
  v10 = objc_msgSend(v8, "payload", v15, v16, v17, v18);
  v11 = v10;
  if (!v10 || object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_7;
  }
  int64_t v12 = [(SBWallpaperServer *)self _deviceOrientationFromXPCDictionary:v11];
  int64_t v13 = [(SBWallpaperServer *)self delegate];
  int64_t v14 = v13;
  if (!v13 || (unint64_t)(v12 - 1) > 3)
  {

LABEL_7:
    v9[2](v9);
    goto LABEL_8;
  }
  [v13 wallpaperServer:self fetchObscurableBoundsForOrientation:v12 completionHandler:v7];

LABEL_8:
}

uint64_t __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return [v5 sendReplyMessageWithPacker:v7];
}

uint64_t __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke_2(double *a1, uint64_t a2)
{
  return MEMORY[0x1F410C598](a2, *MEMORY[0x1E4FA7908], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __78__SBWallpaperServer__handleFetchLockScreenForegroundBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyMessageWithPacker:&__block_literal_global_13_2];
}

- (void)_handleFetchLimitedOcclusionBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke;
  v20[3] = &unk_1E6B08300;
  id v6 = v5;
  id v21 = v6;
  id v7 = (void *)MEMORY[0x1D948C7A0](v20);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke_3;
  id v18 = &unk_1E6AF4AC0;
  id v8 = v6;
  id v19 = v8;
  id v9 = (void (**)(void))MEMORY[0x1D948C7A0](&v15);
  v10 = objc_msgSend(v8, "payload", v15, v16, v17, v18);
  v11 = v10;
  if (!v10 || object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_7;
  }
  int64_t v12 = [(SBWallpaperServer *)self _deviceOrientationFromXPCDictionary:v11];
  int64_t v13 = [(SBWallpaperServer *)self delegate];
  int64_t v14 = v13;
  if (!v13 || (unint64_t)(v12 - 1) > 3)
  {

LABEL_7:
    v9[2](v9);
    goto LABEL_8;
  }
  [v13 wallpaperServer:self fetchLimitedOcclusionBoundsForOrientation:v12 completionHandler:v7];

LABEL_8:
}

uint64_t __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return [v5 sendReplyMessageWithPacker:v7];
}

uint64_t __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke_2(double *a1, uint64_t a2)
{
  return MEMORY[0x1F410C598](a2, *MEMORY[0x1E4FA7908], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __74__SBWallpaperServer__handleFetchLimitedOcclusionBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyMessageWithPacker:&__block_literal_global_15_0];
}

- (void)_handleFetchLockScreenTimeBoundsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke;
  v20[3] = &unk_1E6B08300;
  id v6 = v5;
  id v21 = v6;
  id v7 = (void *)MEMORY[0x1D948C7A0](v20);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke_3;
  id v18 = &unk_1E6AF4AC0;
  id v8 = v6;
  id v19 = v8;
  id v9 = (void (**)(void))MEMORY[0x1D948C7A0](&v15);
  v10 = objc_msgSend(v8, "payload", v15, v16, v17, v18);
  v11 = v10;
  if (!v10 || object_getClass(v10) != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_7;
  }
  int64_t v12 = [(SBWallpaperServer *)self _deviceOrientationFromXPCDictionary:v11];
  int64_t v13 = [(SBWallpaperServer *)self delegate];
  int64_t v14 = v13;
  if (!v13 || (unint64_t)(v12 - 1) > 3)
  {

LABEL_7:
    v9[2](v9);
    goto LABEL_8;
  }
  [v13 wallpaperServer:self fetchLockScreenTimeBoundsForOrientation:v12 completionHandler:v7];

LABEL_8:
}

uint64_t __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke_2;
  v7[3] = &__block_descriptor_64_e33_v16__0__NSObject_OS_xpc_object__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  *(double *)&v7[6] = a4;
  *(double *)&v7[7] = a5;
  return [v5 sendReplyMessageWithPacker:v7];
}

uint64_t __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke_2(double *a1, uint64_t a2)
{
  return MEMORY[0x1F410C598](a2, *MEMORY[0x1E4FA7908], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __72__SBWallpaperServer__handleFetchLockScreenTimeBoundsMessage_fromClient___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyMessageWithPacker:&__block_literal_global_17_3];
}

- (int64_t)_wallpaperModeFromXPCDictionary:(id)a3
{
  LOBYTE(result) = xpc_dictionary_get_uint64(a3, (const char *)*MEMORY[0x1E4FA7920]);
  if ((unint64_t)result - 1 >= 2) {
    return 0;
  }
  else {
    return result;
  }
}

- (void)_handleSetVideoMessageWithWallpaperMode:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBWallpaperServer *)self delegate];
  id v9 = [v6 payload];
  BOOL v10 = [(SBWallpaperServer *)self _clientPermittedToModifyWallpaper:v7];

  if (v10 && [(SBWallpaperServer *)self _xpcObjectIsDictionary:v9])
  {
    v11 = BSDeserializeStringFromXPCDictionaryWithKey();
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    int64_t v20 = [(SBWallpaperServer *)self _wallpaperModeFromXPCDictionary:v9];
    if (v11)
    {
      int64_t v21 = v20;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke;
      v22[3] = &unk_1E6AF5350;
      id v23 = v6;
      objc_msgSend(v8, "wallpaperServer:setWallpaperVideoWithWallpaperMode:cropRect:wallpaperMode:completionHandler:", self, v11, v21, v22, v13, v15, v17, v19);
    }
    else
    {
      [v6 sendReplyMessageWithPacker:&__block_literal_global_24_2];
    }
  }
  else
  {
    [v6 sendReplyMessageWithPacker:&__block_literal_global_26_1];
  }
}

uint64_t __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

void __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
}

void __72__SBWallpaperServer__handleSetVideoMessageWithWallpaperMode_fromClient___block_invoke_4(int a1, xpc_object_t xdict)
{
}

- (void)_handleSetColorNameMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBWallpaperServer *)self delegate];
  id v9 = [v6 payload];
  BOOL v10 = [(SBWallpaperServer *)self _clientPermittedToModifyWallpaper:v7];

  if (v10 && [(SBWallpaperServer *)self _xpcObjectIsDictionary:v9])
  {
    v11 = BSDeserializeStringFromXPCDictionaryWithKey();
    double v12 = self;
    double v13 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    uint64_t v14 = [v13 unsignedIntegerValue];

    if (v11)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke;
      v15[3] = &unk_1E6AF5350;
      id v16 = v6;
      [v8 wallpaperServer:self setWallpaperColorName:v11 forVariants:v14 completionHandler:v15];
    }
    else
    {
      [v6 sendReplyMessageWithPacker:&__block_literal_global_31_3];
    }
  }
  else
  {
    [v6 sendReplyMessageWithPacker:&__block_literal_global_33_2];
  }
}

uint64_t __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

void __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
}

void __59__SBWallpaperServer__handleSetColorNameMessage_fromClient___block_invoke_4(int a1, xpc_object_t xdict)
{
}

- (void)_handleSetColorMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBWallpaperServer *)self delegate];
  id v9 = [v6 payload];
  BOOL v10 = [(SBWallpaperServer *)self _clientPermittedToModifyWallpaper:v7];

  if (v10 && [(SBWallpaperServer *)self _xpcObjectIsDictionary:v9])
  {
    objc_opt_class();
    v11 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    objc_opt_class();
    double v12 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    double v13 = self;
    uint64_t v14 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    uint64_t v15 = [v14 unsignedIntegerValue];

    if (v11)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke;
      v16[3] = &unk_1E6AF5350;
      id v17 = v6;
      [v8 wallpaperServer:self setWallpaperColor:v11 darkColor:v12 forVariants:v15 completionHandler:v16];
    }
    else
    {
      [v6 sendReplyMessageWithPacker:&__block_literal_global_38_0];
    }
  }
  else
  {
    [v6 sendReplyMessageWithPacker:&__block_literal_global_40_2];
  }
}

uint64_t __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

void __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
}

void __55__SBWallpaperServer__handleSetColorMessage_fromClient___block_invoke_4(int a1, xpc_object_t xdict)
{
}

- (void)_handleSetGradientMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBWallpaperServer *)self delegate];
  id v9 = [v6 payload];
  BOOL v10 = [(SBWallpaperServer *)self _clientPermittedToModifyWallpaper:v7];

  if (v10 && [(SBWallpaperServer *)self _xpcObjectIsDictionary:v9])
  {
    v11 = self;
    double v12 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();

    double v13 = self;
    uint64_t v14 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    uint64_t v15 = [v14 unsignedIntegerValue];

    if (v12)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke;
      v16[3] = &unk_1E6AF5350;
      id v17 = v6;
      [v8 wallpaperServer:self setWallpaperGradient:v12 forVariants:v15 completionHandler:v16];
    }
    else
    {
      [v6 sendReplyMessageWithPacker:&__block_literal_global_44_1];
    }
  }
  else
  {
    [v6 sendReplyMessageWithPacker:&__block_literal_global_46_1];
  }
}

uint64_t __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

void __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
}

void __58__SBWallpaperServer__handleSetGradientMessage_fromClient___block_invoke_4(int a1, xpc_object_t xdict)
{
}

- (void)_handleRestoreDefaultWallpaperMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBWallpaperServer *)self delegate];
  BOOL v9 = [(SBWallpaperServer *)self _clientPermittedToModifyWallpaper:v7];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke;
    v10[3] = &unk_1E6AF5350;
    id v11 = v6;
    [v8 wallpaperServer:self restoreDefaultWallpaperWithCompletionHandler:v10];
  }
  else
  {
    [v6 sendReplyMessageWithPacker:&__block_literal_global_48_3];
  }
}

uint64_t __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

void __70__SBWallpaperServer__handleRestoreDefaultWallpaperMessage_fromClient___block_invoke_3(int a1, xpc_object_t xdict)
{
}

- (void)_handleTriggerPosterSignificantEventMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = [(SBWallpaperServer *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SBWallpaperServer__handleTriggerPosterSignificantEventMessage_fromClient___block_invoke;
  v8[3] = &unk_1E6AF5350;
  id v9 = v5;
  id v7 = v5;
  [v6 wallpaperServer:self triggerPosterSignificantEventCompletionHandler:v8];
}

uint64_t __76__SBWallpaperServer__handleTriggerPosterSignificantEventMessage_fromClient___block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__SBWallpaperServer__handleTriggerPosterSignificantEventMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __76__SBWallpaperServer__handleTriggerPosterSignificantEventMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleFetchPosterSignificantEventsCounterMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBWallpaperServer *)self delegate];
  id v9 = [v6 payload];
  BOOL v10 = v9;
  if (v9 && object_getClass(v9) == (Class)MEMORY[0x1E4F14590])
  {
    id v11 = [v7 processHandle];
    int v12 = [v11 hasEntitlement:*MEMORY[0x1E4FA7238]];

    if (v12)
    {
      double v13 = self;
      uint64_t v14 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __82__SBWallpaperServer__handleFetchPosterSignificantEventsCounterMessage_fromClient___block_invoke;
      v15[3] = &unk_1E6AF9638;
      id v16 = v6;
      [v8 wallpaperServer:self fetchSignificantEventsCounterForPosterWithIdentifier:v14 completionHandler:v15];
    }
  }
  else
  {
    [v6 sendReplyMessageWithPacker:&__block_literal_global_53_0];
  }
}

uint64_t __82__SBWallpaperServer__handleFetchPosterSignificantEventsCounterMessage_fromClient___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__SBWallpaperServer__handleFetchPosterSignificantEventsCounterMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v4[4] = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __82__SBWallpaperServer__handleFetchPosterSignificantEventsCounterMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleQuickActionConfigurationRequest:(id)a3 fromClient:(id)a4
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 processHandle];
  char v9 = [v8 hasEntitlement:*MEMORY[0x1E4FA7238]];

  if (v9)
  {
    BOOL v10 = [v6 payload];
    id v11 = v10;
    if (v10 && object_getClass(v10) == (Class)MEMORY[0x1E4F14590])
    {
      int v12 = [(SBWallpaperServer *)self delegate];
      double v13 = BSDeserializeDataFromXPCDictionaryWithKey();
      uint64_t v14 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
      v23[0] = objc_opt_class();
      v23[1] = objc_opt_class();
      v23[2] = objc_opt_class();
      v23[3] = objc_opt_class();
      v23[4] = objc_opt_class();
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
      id v17 = [v15 setWithArray:v16];
      double v18 = [v14 unarchivedObjectOfClasses:v17 fromData:v13 error:0];

      if (v18)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_2;
        v19[3] = &unk_1E6AFC6D0;
        id v20 = v6;
        [v12 wallpaperServer:self handleQuickActionConfigurationRequest:v18 completionHandler:v19];
      }
    }
    else
    {
      [v6 sendReplyMessageWithPacker:&__block_literal_global_66_0];
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke;
    v21[3] = &unk_1E6AFC038;
    id v22 = v7;
    [v6 sendReplyMessageWithPacker:v21];
    id v11 = v22;
  }
}

void __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke(uint64_t a1, void *a2)
{
  v2 = (const char *)*MEMORY[0x1E4FA78F8];
  id v3 = NSString;
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 processHandle];
  id v6 = [v3 stringWithFormat:@"client %@ does not have the right entitlement", v7];
  xpc_dictionary_set_string(v5, v2, (const char *)[v6 UTF8String]);
}

void __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_3;
  v6[3] = &unk_1E6AFC038;
  id v7 = v3;
  id v5 = v3;
  [v4 sendReplyMessageWithPacker:v6];
}

void __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = (const char *)*MEMORY[0x1E4FA78F8];
    id v4 = a2;
    id v5 = [v2 localizedDescription];
    xpc_dictionary_set_string(v4, v3, (const char *)[v5 UTF8String]);
  }
}

void __71__SBWallpaperServer__handleQuickActionConfigurationRequest_fromClient___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (const char *)*MEMORY[0x1E4FA78F8];
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, v2, (const char *)[@"payload is nil or payload != XPC_TYPE_DICTIONARY" UTF8String]);
}

- (BOOL)_clientPermittedToModifyWallpaper:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWallpaperServer *)self accessAuthenticator];
  char v6 = [v5 authenticateClient:v4];

  id v7 = [MEMORY[0x1E4F74230] sharedConnection];
  LOBYTE(v4) = [v7 isWallpaperModificationAllowed];

  return v6 & v4;
}

- (BOOL)_xpcObjectIsDictionary:(id)a3
{
  return a3 && object_getClass(a3) == (Class)MEMORY[0x1E4F14590];
}

- (SBWallpaperServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBWallpaperServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBServiceClientAuthenticator)accessAuthenticator
{
  return self->_accessAuthenticator;
}

- (void)setAccessAuthenticator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAuthenticator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end