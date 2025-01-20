@interface TSDMovieCompatibilityChecker
- (BOOL)p_assetHasSupportedFileTypeOnAllDevices;
- (BOOL)p_isAudioTrackPlayableOnAllDevices:(id)a3;
- (BOOL)p_isH263VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3;
- (BOOL)p_isH264VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3;
- (BOOL)p_isLoadedAssetPlayableOnAllDevices;
- (BOOL)p_isMPEG4VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3;
- (BOOL)p_isSorenson3VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3;
- (BOOL)p_isVideoTrackPlayableOnAllDevices:(id)a3;
- (NSError)error;
- (TSDMovieCompatibilityChecker)init;
- (TSDMovieCompatibilityChecker)initWithAsset:(id)a3;
- (id)p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:(opaqueCMFormatDescription *)a3 forAtomType:(id)a4;
- (int64_t)compatibilityLevel;
- (void)cancel;
- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4;
- (void)checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)p_didFinishCheckingCompatibilityUpToLevel:(int64_t)a3 actualLevel:(int64_t)a4 didCancel:(BOOL)a5 error:(id)a6 completionHandler:(id)a7;
@end

@implementation TSDMovieCompatibilityChecker

- (TSDMovieCompatibilityChecker)initWithAsset:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMovieCompatibilityChecker initWithAsset:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 60, @"invalid nil value for '%s'", "asset");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDMovieCompatibilityChecker;
  v7 = [(TSDMovieCompatibilityChecker *)&v9 init];
  if (v7) {
    v7->mAsset = (AVAsset *)a3;
  }
  return v7;
}

- (TSDMovieCompatibilityChecker)init
{
  return [(TSDMovieCompatibilityChecker *)self initWithAsset:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieCompatibilityChecker;
  [(TSDMovieCompatibilityChecker *)&v3 dealloc];
}

- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4
{
  if (a3 <= 1)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 87, @"Invalid parameter not satisfying: %s", "maxDesiredCompatibilityLevel > TSDMovieCompatibilityLevelNone");
  }
  mAsset = self->mAsset;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke;
  v10[3] = &unk_2646B2360;
  v10[5] = a4;
  v10[6] = a3;
  v10[4] = self;
  [(AVAsset *)mAsset loadValuesAsynchronouslyForKeys:&unk_26D7393C0 completionHandler:v10];
}

void __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x263EF8340];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v30 = 0;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) statusOfValueForKey:@"hasProtectedContent" error:&v30];
  if (v2 == 2)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 8) hasProtectedContent])
    {
      v4 = objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "applicationName");
      objc_opt_class();
      v5 = (void *)TSUDynamicCast();
      if (!v5)
      {
        uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]_block_invoke"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 112, @"invalid nil value for '%s'", "URLAsset");
      }
      uint64_t v8 = (void *)[v5 URL];
      uint64_t v29 = 0;
      [v8 getResourceValue:&v29 forKey:*MEMORY[0x263EFF738] error:0];
      if (!v29) {
        uint64_t v29 = objc_msgSend((id)objc_msgSend(v5, "URL"), "lastPathComponent");
      }
      if ([v4 isEqualToString:@"Keynote"])
      {
        objc_super v9 = NSString;
        uint64_t v10 = [(id)TSDBundle() localizedStringForKey:@"The media file \\U201C%@\\U201D is copy protected. You don\\U2019t have permission to use it in Keynote." value:&stru_26D688A48 table:@"TSDrawables"];
      }
      else if ([v4 isEqualToString:@"Numbers"])
      {
        objc_super v9 = NSString;
        uint64_t v10 = [(id)TSDBundle() localizedStringForKey:@"The media file \\U201C%@\\U201D is copy protected. You don\\U2019t have permission to use it in Numbers." value:&stru_26D688A48 table:@"TSDrawables"];
      }
      else
      {
        if (![v4 isEqualToString:@"Pages"])
        {
          v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v26 = [NSString stringWithUTF8String:"-[TSDMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]_block_invoke"];
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 130, @"Unknown application name!");
          uint64_t v20 = 0;
          goto LABEL_25;
        }
        objc_super v9 = NSString;
        uint64_t v10 = [(id)TSDBundle() localizedStringForKey:@"The media file \\U201C%@\\U201D is copy protected. You don\\U2019t have permission to use it in Pages." value:&stru_26D688A48 table:@"TSDrawables"];
      }
      uint64_t v20 = objc_msgSend(v9, "stringWithFormat:", v10, v29);
LABEL_25:
      uint64_t v35 = *MEMORY[0x263F08320];
      v36[0] = v20;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
      uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.iWork.TSDErrorDomainMovieCompatibility" code:99 userInfo:v21];
      BOOL v3 = 0;
      uint64_t v30 = v22;
      goto LABEL_3;
    }
    v32[3] = 1;
    uint64_t v29 = 0;
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) statusOfValueForKey:@"playable" error:&v29];
    if (v11 != 2)
    {
      if (v11 == 4)
      {
        uint64_t v12 = v32[3];
        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        v32[3] = 0;
      }
      goto LABEL_29;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 8) isPlayable])
    {
      v14 = v32;
      uint64_t v12 = 2;
      v32[3] = 2;
      if (*(uint64_t *)(a1 + 48) < 3 || (uint64_t v12 = 3, v14[3] = 3, v15 = *(void *)(a1 + 48), v15 < 4))
      {
        uint64_t v13 = 0;
LABEL_29:
        objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(void *)(a1 + 48), v12, v13, v29, *(void *)(a1 + 40));
        goto LABEL_4;
      }
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(v16 + 8);
      v18 = v28;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke_2;
      v28[3] = &unk_2646B2338;
      v28[4] = v16;
      v28[6] = &v31;
      v28[7] = v15;
      v19 = &unk_26D7393D8;
    }
    else
    {
      uint64_t v23 = *(void *)(a1 + 32);
      v17 = *(void **)(v23 + 8);
      v18 = v27;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke_3;
      v27[3] = &unk_2646B2338;
      v27[4] = v23;
      uint64_t v24 = *(void *)(a1 + 48);
      v27[6] = &v31;
      v27[7] = v24;
      v19 = &unk_26D7393F0;
    }
    v18[5] = *(void *)(a1 + 40);
    objc_msgSend(v17, "loadValuesAsynchronouslyForKeys:completionHandler:", v19);
    goto LABEL_4;
  }
  BOOL v3 = v2 == 4;
LABEL_3:
  objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(void *)(a1 + 48), v32[3], v3, v30, *(void *)(a1 + 40));
LABEL_4:
  _Block_object_dispose(&v31, 8);
}

uint64_t __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) statusOfValueForKey:@"tracks" error:&v6];
  if (v2 == 4)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    if (v2 == 2)
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "p_isLoadedAssetPlayableOnAllDevices"))
      {
        uint64_t v4 = 0;
        return objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(void *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v4, v6, *(void *)(a1 + 40));
      }
      uint64_t v3 = *(void *)(a1 + 56);
    }
    uint64_t v4 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  }
  return objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(void *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v4, v6, *(void *)(a1 + 40));
}

uint64_t __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) statusOfValueForKey:@"tracks" error:&v5];
  if (v2 == 2) {
    goto LABEL_5;
  }
  if (v2 != 4)
  {
    uint64_t v2 = 0;
LABEL_5:
    uint64_t v3 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
    return objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(void *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v3, v5, *(void *)(a1 + 40));
  }
  uint64_t v3 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(void *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v3, v5, *(void *)(a1 + 40));
}

- (void)checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;

  self->mCustomPlayableVideoCodecTypes = (NSSet *)[a3 copy];
  self->mCustomMaxPlayableVideoDimensions.double width = (int)width;
  self->mCustomMaxPlayableVideoDimensions.double height = (int)height;
  self->mCustomMaxPlayableVideoPixelsPerFrame = a5;

  [(TSDMovieCompatibilityChecker *)self checkCompatibilityUpToLevel:5 completionHandler:a6];
}

- (void)p_didFinishCheckingCompatibilityUpToLevel:(int64_t)a3 actualLevel:(int64_t)a4 didCancel:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  v16[1] = *MEMORY[0x263EF8340];
  if (a5) {
    goto LABEL_16;
  }
  id v8 = a6;
  if (!a4 && a6)
  {
    if ([a6 code] != -11828)
    {
LABEL_11:
      a4 = 0;
      goto LABEL_12;
    }
    uint64_t v11 = (void *)[v8 domain];
    unsigned int v12 = [v11 isEqualToString:*MEMORY[0x263EF98B0]];
    if (v12) {
      id v8 = 0;
    }
    a4 = v12;
  }
  if (!v8 && !a4)
  {
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = [(id)TSDBundle() localizedStringForKey:@"This movie can\\U2019t be added." value:&stru_26D688A48 table:@"TSDrawables"];
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v8 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.iWork.TSDErrorDomainMovieCompatibility" code:100 userInfo:v13];
    goto LABEL_11;
  }
LABEL_12:
  if (a4 >= a3) {
    int64_t v14 = a3;
  }
  else {
    int64_t v14 = a4;
  }
  self->mCompatibilityLevel = v14;
  self->mError = (NSError *)[v8 copy];
LABEL_16:
  if (a7) {
    (*((void (**)(id, SEL, int64_t, int64_t))a7 + 2))(a7, a2, a3, a4);
  }
}

- (void)cancel
{
}

- (BOOL)p_isLoadedAssetPlayableOnAllDevices
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v3 = [(TSDMovieCompatibilityChecker *)self p_assetHasSupportedFileTypeOnAllDevices];
  if (v3)
  {
    if ([(AVAsset *)self->mAsset statusOfValueForKey:@"tracks" error:0] != 2)
    {
      uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMovieCompatibilityChecker p_isLoadedAssetPlayableOnAllDevices]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 339, @"Asset tracks must be loaded");
    }
    uint64_t v6 = *MEMORY[0x263EF9D48];
    uint64_t v22 = *MEMORY[0x263EF9CE8];
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EF9D48], *MEMORY[0x263EF9CE8], *MEMORY[0x263EF9CF0], *MEMORY[0x263EF9D30], 0);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = [(AVAsset *)self->mAsset tracks];
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v23 = 0;
      int v11 = 0;
      char v21 = 0;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v8);
          }
          int64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v14 isEnabled])
          {
            uint64_t v15 = (void *)[v14 mediaType];
            if ([v7 containsObject:v15])
            {
              if (![v14 isSelfContained]
                || !objc_msgSend((id)objc_msgSend(v14, "formatDescriptions"), "count"))
              {
                char v16 = 0;
                goto LABEL_21;
              }
              if ([v15 isEqualToString:v6])
              {
                v11 |= [(TSDMovieCompatibilityChecker *)self p_isVideoTrackPlayableOnAllDevices:v14];
                BYTE4(v23) = 1;
              }
              else if ([v15 isEqualToString:v22])
              {
                LODWORD(v23) = [(TSDMovieCompatibilityChecker *)self p_isAudioTrackPlayableOnAllDevices:v14] | v23;
                char v21 = 1;
              }
            }
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      char v16 = 1;
LABEL_21:
      char v18 = v23;
      char v17 = BYTE4(v23);
      char v19 = v21;
    }
    else
    {
      char v17 = 0;
      LOBYTE(v11) = 0;
      char v19 = 0;
      char v18 = 0;
      char v16 = 1;
    }
    LOBYTE(v3) = (v11 | ~v17) & (v18 | ~v19) & v16;
  }
  return v3;
}

- (BOOL)p_assetHasSupportedFileTypeOnAllDevices
{
  objc_opt_class();
  uint64_t v2 = (void *)TSUDynamicCast();
  if (v2)
  {
    int v3 = (void *)[v2 URL];
    LODWORD(v2) = [v3 isFileURL];
    if (v2)
    {
      uint64_t v7 = 0;
      LODWORD(v2) = [v3 getResourceValue:&v7 forKey:*MEMORY[0x263EFF780] error:0];
      if (v2)
      {
        uint64_t v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EF9898], *MEMORY[0x263EF9888], *MEMORY[0x263EF9858], *MEMORY[0x263EF9850], @"public.3gpp", @"public.3gpp2", @"com.apple.itunes.audible", *MEMORY[0x263F019C8], *MEMORY[0x263EF9840], *MEMORY[0x263EF9838], *MEMORY[0x263EF9860], *MEMORY[0x263EF98A8], @"public.au-audio", *MEMORY[0x263F01AA8], *MEMORY[0x263EF9848], *MEMORY[0x263F01AB0], @"public.mpeg-2-video",
                       @"public.mp2",
                       @"public.mpeg-2-transport-stream",
                       @"public.avi",
                       0);
        if ([v4 containsObject:v7])
        {
          LOBYTE(v2) = 1;
        }
        else
        {
          uint64_t v5 = [v3 pathExtension];
          LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"mqv", @"m4r", @"m1a", @"m2a", @"mpa", @"aac", @"adts", @"mod", @"vob", @"m2ts", @"m2t", @"mts", 0), "containsObject:", v5);
        }
      }
    }
  }
  return (char)v2;
}

- (BOOL)p_isVideoTrackPlayableOnAllDevices:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  mCustomPlayableVideoCodecTypes = self->mCustomPlayableVideoCodecTypes;
  if (mCustomPlayableVideoCodecTypes)
  {
    int32_t width = self->mCustomMaxPlayableVideoDimensions.width;
    int32_t height = self->mCustomMaxPlayableVideoDimensions.height;
    int mCustomMaxPlayableVideoPixelsPerFrame = self->mCustomMaxPlayableVideoPixelsPerFrame;
  }
  else
  {
    mCustomPlayableVideoCodecTypes = (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26D739DC8, &unk_26D739DE0, &unk_26D739DF8, &unk_26D739E10, &unk_26D739E28, &unk_26D739E40, &unk_26D739E58, &unk_26D739E70, 0);
    int mCustomMaxPlayableVideoPixelsPerFrame = 921600;
    int32_t height = 1280;
    int32_t width = 1280;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)[a3 formatDescriptions];
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    id v21 = a3;
LABEL_6:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(const opaqueCMFormatDescription **)(*((void *)&v29 + 1) + 8 * v12);
      uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v13);
      if (!-[NSSet containsObject:](mCustomPlayableVideoCodecTypes, "containsObject:", [NSNumber numberWithUnsignedInt:MediaSubType]))goto LABEL_36; {
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v13);
      }
      int v17 = height < Dimensions.height || width < Dimensions.width;
      BOOL v18 = Dimensions.height * Dimensions.width > mCustomMaxPlayableVideoPixelsPerFrame;
      BOOL v19 = 1;
      if (v17 & 1) != 0 || (v18 & ~v17) {
        return !v19;
      }
      if ((int)MediaSubType > 1748121138)
      {
        if (MediaSubType == 1748121139)
        {
          if (![(TSDMovieCompatibilityChecker *)self p_isH263VideoFormatPlayableOnAllDevices:v13])goto LABEL_36; {
        }
          }
        else if (MediaSubType == 1836070006 {
               && ![(TSDMovieCompatibilityChecker *)self p_isMPEG4VideoFormatPlayableOnAllDevices:v13])
        }
        {
          goto LABEL_36;
        }
      }
      else if (MediaSubType == 1398165811)
      {
        if (![(TSDMovieCompatibilityChecker *)self p_isSorenson3VideoFormatPlayableOnAllDevices:v13])goto LABEL_36; {
      }
        }
      else if (MediaSubType == 1635148593 {
             && ![(TSDMovieCompatibilityChecker *)self p_isH264VideoFormatPlayableOnAllDevices:v13])
      }
      {
        goto LABEL_36;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        a3 = v21;
        if (v10) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  if (a3) {
    [a3 preferredTransform];
  }
  long long v23 = v26;
  long long v24 = v27;
  long long v25 = v28;
  if (!TSDIsTransformAxisAligned((double *)&v23))
  {
LABEL_36:
    BOOL v19 = 1;
    return !v19;
  }
  long long v23 = v26;
  long long v24 = v27;
  long long v25 = v28;
  BOOL v19 = TSDIsTransformFlipped((double *)&v23);
  return !v19;
}

- (BOOL)p_isSorenson3VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  return Dimensions.height * Dimensions.width < 76801;
}

- (BOOL)p_isH264VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  id Extension = [(TSDMovieCompatibilityChecker *)self p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:a3 forAtomType:@"avcC"];
  if (Extension)
  {
    uint64_t v5 = Extension;
    if ((unint64_t)[Extension length] < 4
      || (uint64_t v6 = [v5 bytes], *(unsigned __int8 *)(v6 + 3) > 0x29u)
      || ((v7 = *(unsigned __int8 *)(v6 + 1) - 66, v8 = v7 > 0x22, uint64_t v9 = (1 << v7) & 0x400000801, !v8)
        ? (BOOL v10 = v9 == 0)
        : (BOOL v10 = 1),
          v10))
    {
      LOBYTE(Extension) = 0;
    }
    else
    {
      id Extension = (id)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x263F03F30]);
      if (Extension) {
        LOBYTE(Extension) = [Extension integerValue] == 1;
      }
    }
  }
  return (char)Extension;
}

- (BOOL)p_isMPEG4VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  id v3 = [(TSDMovieCompatibilityChecker *)self p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:a3 forAtomType:@"esds"];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [v3 bytes];
    unint64_t v6 = [v4 length];
    if (v6 < 5) {
      goto LABEL_9;
    }
    uint64_t v7 = 0;
    while (*(unsigned char *)(v5 + v7)
         || *(unsigned char *)(v5 + v7 + 1)
         || *(unsigned char *)(v5 + v7 + 2) != 1
         || *(unsigned __int8 *)(v5 + v7 + 3) != 176)
    {
      if (++v7 + 4 >= v6) {
        goto LABEL_9;
      }
    }
    if (v7 + 4 >= v6)
    {
LABEL_9:
      LOBYTE(v3) = 0;
    }
    else
    {
      unint64_t v8 = 0;
      int v9 = *(unsigned __int8 *)(v5 + v7 + 4);
      BOOL v10 = &p_isMPEG4VideoFormatPlayableOnAllDevices__profileMaps;
      while (1)
      {
        int v11 = *v10;
        v10 += 3;
        if (v11 == v9) {
          break;
        }
        LOBYTE(v3) = 0;
        if (++v8 == 15) {
          return (char)v3;
        }
      }
      LOBYTE(v3) = v8 < 0xB;
    }
  }
  return (char)v3;
}

- (BOOL)p_isH263VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  id v3 = [(TSDMovieCompatibilityChecker *)self p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:a3 forAtomType:@"d263"];
  if (v3)
  {
    uint64_t v4 = v3;
    if ((unint64_t)[v3 length] < 7)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      uint64_t v5 = [v4 bytes];
      if (*(unsigned char *)(v5 + 6)) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = *(unsigned __int8 *)(v5 + 5) >= 0x2Eu;
      }
      LOBYTE(v3) = !v6;
    }
  }
  return (char)v3;
}

- (id)p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:(opaqueCMFormatDescription *)a3 forAtomType:(id)a4
{
  id result = (id)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x263F00E90]);
  if (result)
  {
    BOOL v6 = (void *)[result objectForKeyedSubscript:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id result = (id)[v6 count];
      if (result)
      {
        return (id)[v6 objectAtIndexedSubscript:0];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v6;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)p_isAudioTrackPlayableOnAllDevices:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26D739E88, &unk_26D739EA0, &unk_26D739EB8, &unk_26D739ED0, &unk_26D739EE8, &unk_26D739F00, &unk_26D739F18, &unk_26D739F30, &unk_26D739F48, &unk_26D739F60, &unk_26D739F78, &unk_26D739F90, &unk_26D739F30, &unk_26D739FA8, &unk_26D739FC0, 0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = a3;
  BOOL v6 = (void *)[a3 formatDescriptions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(const opaqueCMFormatDescription **)(*((void *)&v19 + 1) + 8 * v11);
        uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v12);
        if ((v9 & 1) == 0
          && (int v14 = MediaSubType,
              objc_msgSend(v4, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", MediaSubType)))&& (StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v12)) != 0&& StreamBasicDescription->mChannelsPerFrame <= 6&& StreamBasicDescription->mSampleRate <= 48000.0)
        {
          if (v14 == 1885430579 || v14 == 1633889587) {
            char v9 = objc_msgSend(v5, "isEnabled", StreamBasicDescription->mSampleRate);
          }
          else {
            char v9 = 0;
          }
        }
        else
        {
          char v9 = 1;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v17 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v8 = v17;
    }
    while (v17);
  }
  else
  {
    char v9 = 0;
  }
  return v9 ^ 1;
}

- (int64_t)compatibilityLevel
{
  return self->mCompatibilityLevel;
}

- (NSError)error
{
  return self->mError;
}

@end