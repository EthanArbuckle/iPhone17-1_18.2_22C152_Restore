@interface SBSWallpaperClient
- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forVariants:(unint64_t)a5;
- (BOOL)setWallpaperColorName:(id)a3 forVariants:(unint64_t)a4;
- (BOOL)setWallpaperGradient:(id)a3 forVariants:(unint64_t)a4;
- (BOOL)setWallpaperWithVideoWithWallpaperMode:(id)a3 cropRect:(CGRect)a4 wallpaperMode:(unsigned __int8)a5;
- (SBSWallpaperClient)initWithCalloutQueue:(id)a3;
- (SBSWallpaperClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4;
- (unint64_t)posterSignificantEventsCounter;
- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3;
- (void)_fetchLockScreenBoundsCheckOfType:(int64_t)a3 orientation:(unsigned int)a4 completionHandler:(id)a5;
- (void)fetchContentCutoutBoundsForVariant:(unsigned int)a3 orientation:(unsigned int)a4 completionHandler:(id)a5;
- (void)fetchLimitedOcclusionBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4;
- (void)fetchLockScreenContentCutoutBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4;
- (void)fetchLockScreenTimeBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4;
- (void)fetchMaximalLockScreenContentCutoutBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4;
- (void)fetchObscurableBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4;
- (void)fetchOriginalImageForVariant:(unsigned int)a3 completionHandler:(id)a4;
- (void)fetchOriginalVideoURLForVariant:(unsigned int)a3 completionHandler:(id)a4;
- (void)fetchPosterSignificantEventsCounterWithCompletionHandler:(id)a3;
- (void)fetchThumbnailForVariant:(unsigned int)a3 completionHandler:(id)a4;
- (void)handleQuickActionConfigurationRequest:(id)a3 completionHandler:(id)a4;
- (void)restoreDefaultWallpaperWithCompletion:(id)a3;
- (void)triggerPosterSignificantEventWithCompletion:(id)a3;
@end

@implementation SBSWallpaperClient

- (SBSWallpaperClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4
{
  return [(SBSWallpaperClient *)self initWithCalloutQueue:a4];
}

- (SBSWallpaperClient)initWithCalloutQueue:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SBSWallpaperClient_initWithCalloutQueue___block_invoke;
  v9[3] = &unk_1E566C068;
  id v10 = v4;
  v8.receiver = self;
  v8.super_class = (Class)SBSWallpaperClient;
  id v5 = v4;
  v6 = [(FBSServiceFacilityClient *)&v8 initWithConfigurator:v9];

  return v6;
}

void __43__SBSWallpaperClient_initWithCalloutQueue___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [MEMORY[0x1E4F62AD0] defaultShellEndpoint];
  [v5 setEndpoint:v3];

  [v5 setIdentifier:@"com.apple.springboardservices.wallpaper"];
  id v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v5 setServiceQuality:v4];

  if (*(void *)(a1 + 32)) {
    [v5 setCalloutQueue:];
  }
}

- (void)handleQuickActionConfigurationRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_super v8 = (void *)MEMORY[0x1E4F62B40];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__SBSWallpaperClient_handleQuickActionConfigurationRequest_completionHandler___block_invoke;
    v13[3] = &unk_1E566C090;
    id v14 = v6;
    id v9 = v7;
    id v15 = v9;
    id v10 = [v8 messageWithPacker:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__SBSWallpaperClient_handleQuickActionConfigurationRequest_completionHandler___block_invoke_2;
    v11[3] = &unk_1E566C0B8;
    id v12 = v9;
    [(FBSServiceFacilityClient *)self sendMessage:v10 withType:16 replyHandler:v11 waitForReply:1 timeout:0.0];
  }
}

void __78__SBSWallpaperClient_handleQuickActionConfigurationRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v8];
  id v6 = v8;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = v5;
    xpc_dictionary_set_data(v3, "quickActionConfigurationRequest", (const void *)[v7 bytes], [v7 length]);
  }
}

void __78__SBSWallpaperClient_handleQuickActionConfigurationRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 payload];
  uint64_t v4 = (void *)v3;
  if (v3 && MEMORY[0x192FC1100](v3) == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v4, "quickActionConfigurationErrorResponse");
    if (string)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28568];
      id v7 = [NSString stringWithUTF8String:string];
      v11[0] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      id v9 = [v6 errorWithDomain:@"SBSWallpaperServiceErrorDomain" code:0 userInfo:v8];
    }
    else
    {
      id v9 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)fetchThumbnailForVariant:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__SBSWallpaperClient_fetchThumbnailForVariant_completionHandler___block_invoke;
    v10[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    unsigned int v11 = a3;
    id v7 = [MEMORY[0x1E4F62B40] messageWithPacker:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__SBSWallpaperClient_fetchThumbnailForVariant_completionHandler___block_invoke_2;
    v8[3] = &unk_1E566C0B8;
    id v9 = v6;
    [(FBSServiceFacilityClient *)self sendMessage:v7 withType:0 replyHandler:v8 waitForReply:0 timeout:0.0];
  }
}

void __65__SBSWallpaperClient_fetchThumbnailForVariant_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __65__SBSWallpaperClient_fetchThumbnailForVariant_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = xpc_dictionary_get_value(xdict, "imageData");
    id v5 = (void *)v4;
    if (v4 && MEMORY[0x192FC1100](v4) == MEMORY[0x1E4F14580])
    {
      id v6 = (void *)MEMORY[0x1E4F1C9B8];
      bytes_ptr = xpc_data_get_bytes_ptr(v5);
      uint64_t v3 = [v6 dataWithBytes:bytes_ptr length:xpc_data_get_length(v5)];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOriginalImageForVariant:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__SBSWallpaperClient_fetchOriginalImageForVariant_completionHandler___block_invoke;
    v10[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    unsigned int v11 = a3;
    id v7 = [MEMORY[0x1E4F62B40] messageWithPacker:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__SBSWallpaperClient_fetchOriginalImageForVariant_completionHandler___block_invoke_2;
    v8[3] = &unk_1E566C0B8;
    id v9 = v6;
    [(FBSServiceFacilityClient *)self sendMessage:v7 withType:1 replyHandler:v8 waitForReply:0 timeout:0.0];
  }
}

void __69__SBSWallpaperClient_fetchOriginalImageForVariant_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __69__SBSWallpaperClient_fetchOriginalImageForVariant_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = xpc_dictionary_get_value(xdict, "imageData");
    id v5 = (void *)v4;
    if (v4 && MEMORY[0x192FC1100](v4) == MEMORY[0x1E4F14580])
    {
      id v6 = (void *)MEMORY[0x1E4F1C9B8];
      bytes_ptr = xpc_data_get_bytes_ptr(v5);
      uint64_t v3 = [v6 dataWithBytes:bytes_ptr length:xpc_data_get_length(v5)];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOriginalVideoURLForVariant:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__SBSWallpaperClient_fetchOriginalVideoURLForVariant_completionHandler___block_invoke;
    v10[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    unsigned int v11 = a3;
    id v7 = [MEMORY[0x1E4F62B40] messageWithPacker:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__SBSWallpaperClient_fetchOriginalVideoURLForVariant_completionHandler___block_invoke_2;
    v8[3] = &unk_1E566C0B8;
    id v9 = v6;
    [(FBSServiceFacilityClient *)self sendMessage:v7 withType:2 replyHandler:v8 waitForReply:0 timeout:0.0];
  }
}

void __72__SBSWallpaperClient_fetchOriginalVideoURLForVariant_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __72__SBSWallpaperClient_fetchOriginalVideoURLForVariant_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = xpc_dictionary_get_value(xdict, "videoURL");
    id v5 = (void *)v4;
    if (v4 && MEMORY[0x192FC1100](v4) == MEMORY[0x1E4F14580])
    {
      id v6 = (void *)MEMORY[0x1E4F1C9B8];
      bytes_ptr = xpc_data_get_bytes_ptr(v5);
      uint64_t v3 = [v6 dataWithBytes:bytes_ptr length:xpc_data_get_length(v5)];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v8 = [MEMORY[0x1E4F1CB10] URLWithDataRepresentation:v3 relativeToURL:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchContentCutoutBoundsForVariant:(unsigned int)a3 orientation:(unsigned int)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__SBSWallpaperClient_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke;
    v12[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
    unsigned int v13 = a3;
    unsigned int v14 = a4;
    id v9 = [MEMORY[0x1E4F62B40] messageWithPacker:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__SBSWallpaperClient_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke_2;
    v10[3] = &unk_1E566C0B8;
    id v11 = v8;
    [(FBSServiceFacilityClient *)self sendMessage:v9 withType:3 replyHandler:v10 waitForReply:0 timeout:0.0];
  }
}

void __87__SBSWallpaperClient_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 32);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_uint64(xdict, "variant", v3);
  xpc_dictionary_set_uint64(xdict, "orientation", *(unsigned int *)(a1 + 36));
}

void __87__SBSWallpaperClient_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    uint64_t v3 = v5;
    if (v4)
    {
      BSDeserializeCGRectFromXPCDictionaryWithKey();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v3 = v5;
    }
  }
}

- (void)fetchLockScreenContentCutoutBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
}

- (void)fetchMaximalLockScreenContentCutoutBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
}

- (void)fetchObscurableBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
}

- (void)fetchLimitedOcclusionBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
}

- (void)fetchLockScreenTimeBoundsForOrientation:(unsigned int)a3 completionHandler:(id)a4
{
}

- (void)_fetchLockScreenBoundsCheckOfType:(int64_t)a3 orientation:(unsigned int)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__SBSWallpaperClient__fetchLockScreenBoundsCheckOfType_orientation_completionHandler___block_invoke;
    v12[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    unsigned int v13 = a4;
    id v9 = [MEMORY[0x1E4F62B40] messageWithPacker:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__SBSWallpaperClient__fetchLockScreenBoundsCheckOfType_orientation_completionHandler___block_invoke_2;
    v10[3] = &unk_1E566C0B8;
    id v11 = v8;
    [(FBSServiceFacilityClient *)self sendMessage:v9 withType:a3 replyHandler:v10 waitForReply:0 timeout:0.0];
  }
}

void __86__SBSWallpaperClient__fetchLockScreenBoundsCheckOfType_orientation_completionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __86__SBSWallpaperClient__fetchLockScreenBoundsCheckOfType_orientation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    uint64_t v3 = v5;
    if (v4)
    {
      BSDeserializeCGRectFromXPCDictionaryWithKey();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v3 = v5;
    }
  }
}

- (BOOL)setWallpaperWithVideoWithWallpaperMode:(id)a3 cropRect:(CGRect)a4 wallpaperMode:(unsigned __int8)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  id v12 = v11;
  if (v11)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    unsigned int v13 = (void *)MEMORY[0x1E4F62B40];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__SBSWallpaperClient_setWallpaperWithVideoWithWallpaperMode_cropRect_wallpaperMode___block_invoke;
    v18[3] = &unk_1E566C120;
    id v19 = v11;
    CGFloat v20 = x;
    CGFloat v21 = y;
    CGFloat v22 = width;
    CGFloat v23 = height;
    unsigned __int8 v24 = a5;
    unsigned int v14 = [v13 messageWithPacker:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__SBSWallpaperClient_setWallpaperWithVideoWithWallpaperMode_cropRect_wallpaperMode___block_invoke_2;
    v17[3] = &unk_1E566C148;
    v17[4] = &v25;
    [(FBSServiceFacilityClient *)self sendMessage:v14 withType:9 replyHandler:v17 waitForReply:1 timeout:0.0];

    BOOL v15 = *((unsigned char *)v26 + 24) != 0;
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __84__SBSWallpaperClient_setWallpaperWithVideoWithWallpaperMode_cropRect_wallpaperMode___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeCGRectToXPCDictionaryWithKey();
  xpc_dictionary_set_uint64(xdict, "wallpaperMode", *(unsigned __int8 *)(a1 + 72));
}

void __84__SBSWallpaperClient_setWallpaperWithVideoWithWallpaperMode_cropRect_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 payload];
  if (v3)
  {
    BOOL v4 = [v5 payload];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v8 = (void *)MEMORY[0x1E4F62B40];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__SBSWallpaperClient_setWallpaperColorName_forVariants___block_invoke;
    v13[3] = &unk_1E566C170;
    id v14 = v6;
    unint64_t v15 = a4;
    id v9 = [v8 messageWithPacker:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__SBSWallpaperClient_setWallpaperColorName_forVariants___block_invoke_2;
    v12[3] = &unk_1E566C148;
    void v12[4] = &v16;
    [(FBSServiceFacilityClient *)self sendMessage:v9 withType:10 replyHandler:v12 waitForReply:1 timeout:0.0];

    BOOL v10 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __56__SBSWallpaperClient_setWallpaperColorName_forVariants___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BSSerializeStringToXPCDictionaryWithKey();
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

void __56__SBSWallpaperClient_setWallpaperColorName_forVariants___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 payload];
  if (v3)
  {
    id v4 = [v5 payload];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forVariants:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v19 = 0;
    CGFloat v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    BOOL v10 = (void *)MEMORY[0x1E4F62B40];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__SBSWallpaperClient_setWallpaperColor_darkColor_forVariants___block_invoke;
    v15[3] = &unk_1E566C198;
    id v16 = v8;
    id v17 = v9;
    unint64_t v18 = a5;
    id v11 = [v10 messageWithPacker:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__SBSWallpaperClient_setWallpaperColor_darkColor_forVariants___block_invoke_2;
    v14[3] = &unk_1E566C148;
    v14[4] = &v19;
    [(FBSServiceFacilityClient *)self sendMessage:v11 withType:11 replyHandler:v14 waitForReply:1 timeout:0.0];

    BOOL v12 = *((unsigned char *)v20 + 24) != 0;
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __62__SBSWallpaperClient_setWallpaperColor_darkColor_forVariants___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  if (*(void *)(a1 + 40)) {
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  }
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

void __62__SBSWallpaperClient_setWallpaperColor_darkColor_forVariants___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 payload];
  if (v3)
  {
    id v4 = [v5 payload];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v8 = (void *)MEMORY[0x1E4F62B40];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__SBSWallpaperClient_setWallpaperGradient_forVariants___block_invoke;
    v13[3] = &unk_1E566C170;
    id v14 = v6;
    unint64_t v15 = a4;
    id v9 = [v8 messageWithPacker:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__SBSWallpaperClient_setWallpaperGradient_forVariants___block_invoke_2;
    v12[3] = &unk_1E566C148;
    void v12[4] = &v16;
    [(FBSServiceFacilityClient *)self sendMessage:v9 withType:12 replyHandler:v12 waitForReply:1 timeout:0.0];

    BOOL v10 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __55__SBSWallpaperClient_setWallpaperGradient_forVariants___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

void __55__SBSWallpaperClient_setWallpaperGradient_forVariants___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 payload];
  if (v3)
  {
    id v4 = [v5 payload];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)restoreDefaultWallpaperWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F62B40] message];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SBSWallpaperClient_restoreDefaultWallpaperWithCompletion___block_invoke;
  v7[3] = &unk_1E566C0B8;
  id v8 = v4;
  id v6 = v4;
  [(FBSServiceFacilityClient *)self sendMessage:v5 withType:13 replyHandler:v7 waitForReply:1 timeout:0.0];
}

uint64_t __60__SBSWallpaperClient_restoreDefaultWallpaperWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)triggerPosterSignificantEventWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F62B40] message];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SBSWallpaperClient_triggerPosterSignificantEventWithCompletion___block_invoke;
  v7[3] = &unk_1E566C0B8;
  id v8 = v4;
  id v6 = v4;
  [(FBSServiceFacilityClient *)self sendMessage:v5 withType:14 replyHandler:v7 waitForReply:1 timeout:0.0];
}

uint64_t __66__SBSWallpaperClient_triggerPosterSignificantEventWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v5 = (void *)MEMORY[0x1E4F62B40];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __70__SBSWallpaperClient_significantEventsCounterForPosterWithIdentifier___block_invoke;
  v11[3] = &unk_1E566C1C0;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 messageWithPacker:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SBSWallpaperClient_significantEventsCounterForPosterWithIdentifier___block_invoke_2;
  v10[3] = &unk_1E566C148;
  void v10[4] = &v13;
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:15 replyHandler:v10 waitForReply:1 timeout:0.0];

  unint64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __70__SBSWallpaperClient_significantEventsCounterForPosterWithIdentifier___block_invoke()
{
  return BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

void __70__SBSWallpaperClient_significantEventsCounterForPosterWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  if (v3)
  {
    id v4 = v3;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(v3, "result");
    id v3 = v4;
  }
}

- (unint64_t)posterSignificantEventsCounter
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [MEMORY[0x1E4F62B40] message];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SBSWallpaperClient_posterSignificantEventsCounter__block_invoke;
  v6[3] = &unk_1E566C148;
  v6[4] = &v7;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:15 replyHandler:v6 waitForReply:1 timeout:0.0];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __52__SBSWallpaperClient_posterSignificantEventsCounter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  if (v3)
  {
    id v4 = v3;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(v3, "result");
    id v3 = v4;
  }
}

- (void)fetchPosterSignificantEventsCounterWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F62B40] message];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__SBSWallpaperClient_fetchPosterSignificantEventsCounterWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E566C0B8;
  id v8 = v4;
  id v6 = v4;
  [(FBSServiceFacilityClient *)self sendMessage:v5 withType:15 replyHandler:v7 waitForReply:0 timeout:0.0];
}

void __79__SBSWallpaperClient_fetchPosterSignificantEventsCounterWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  id v4 = v3;
  if (v3) {
    xpc_dictionary_get_uint64(v3, "result");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end