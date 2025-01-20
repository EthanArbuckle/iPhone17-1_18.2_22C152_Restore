@interface TSDFrameSpec
+ (TSDFrameSpec)frameSpecWithName:(id)a3;
+ (id)frameSpecs;
+ (id)p_imageKeys;
- (BOOL)displayInPicker;
- (BOOL)i_hasAdornment;
- (BOOL)i_hasImages;
- (BOOL)i_hasMask;
- (CGPoint)i_adornmentPosition;
- (CGSize)i_adornmentSize;
- (NSString)frameName;
- (TSDFrameSpec)initWithBundle:(id)a3 isVolatile:(BOOL)a4;
- (double)i_bottomHeight;
- (double)i_bottomInset;
- (double)i_leftInset;
- (double)i_leftWidth;
- (double)i_minimumAssetScale;
- (double)i_rightInset;
- (double)i_rightWidth;
- (double)i_topHeight;
- (double)i_topInset;
- (id)i_providerForIndex:(int)a3 mask:(BOOL)a4;
- (id)p_imageDataForKey:(id)a3;
- (id)p_infoDictionary;
- (int)i_tilingMode;
- (void)dealloc;
- (void)i_addInterestInProviders;
- (void)i_removeInterestInProviders;
- (void)p_loadImageMetrics;
@end

@implementation TSDFrameSpec

+ (id)frameSpecs
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id result = (id)frameSpecs_sFrameSpecs;
  if (!frameSpecs_sFrameSpecs)
  {
    objc_sync_enter(a1);
    if (!frameSpecs_sFrameSpecs)
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
      v5 = (void *)[(id)TSDBundle() pathsForResourcesOfType:@"sfrframe" inDirectory:@"Frames"];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v14;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v5);
            }
            v9 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:*(void *)(*((void *)&v13 + 1) + 8 * v8)];
            v10 = [[TSDFrameSpec alloc] initWithBundle:v9 isVolatile:0];
            if (v10) {
              [v4 addObject:v10];
            }

            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }
      __dmb(0xBu);
      frameSpecs_sFrameSpecs = (uint64_t)v4;
      if (!v4)
      {
        v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v12 = [NSString stringWithUTF8String:"+[TSDFrameSpec frameSpecs]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 66, @"Couldn't initialize lazy variable %s", "sFrameSpecs");
      }
    }
    objc_sync_exit(a1);
    return (id)frameSpecs_sFrameSpecs;
  }
  return result;
}

+ (TSDFrameSpec)frameSpecWithName:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v5 = (void *)frameSpecWithName__sReadableNameToSpecMap;
  if (!frameSpecWithName__sReadableNameToSpecMap)
  {
    id obj = a1;
    objc_sync_enter(a1);
    if (!frameSpecWithName__sReadableNameToSpecMap)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v17 = a3;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v7 = (void *)[obj frameSpecs];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            uint64_t v12 = [v11 frameName];
            if ([v6 objectForKey:v12])
            {
              uint64_t v16 = v12;
              TSULogErrorInFunction();
            }
            objc_msgSend(v6, "setObject:forKey:", v11, v12, v16);
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v8);
      }
      __dmb(0xBu);
      frameSpecWithName__sReadableNameToSpecMap = (uint64_t)v6;
      a3 = v17;
      if (!v6)
      {
        long long v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v14 = [NSString stringWithUTF8String:"+[TSDFrameSpec frameSpecWithName:]"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 90, @"Couldn't initialize lazy variable %s", "sReadableNameToSpecMap");
      }
    }
    objc_sync_exit(obj);
    v5 = (void *)frameSpecWithName__sReadableNameToSpecMap;
  }
  id result = (TSDFrameSpec *)[v5 objectForKey:a3];
  if (!result) {
    return (TSDFrameSpec *)[(id)frameSpecWithName__sReadableNameToSpecMap objectForKey:@"None"];
  }
  return result;
}

- (TSDFrameSpec)initWithBundle:(id)a3 isVolatile:(BOOL)a4
{
  if (!a3)
  {
    id v6 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", 0, a4);
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDFrameSpec initWithBundle:isVolatile:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 103, @"invalid nil value for '%s'", "bundle");
  }
  v15.receiver = self;
  v15.super_class = (Class)TSDFrameSpec;
  uint64_t v8 = [(TSDFrameSpec *)&v15 init];
  if (v8)
  {
    v8->mBundle = (NSBundle *)a3;
    id v9 = [(TSDFrameSpec *)v8 p_infoDictionary];
    objc_opt_class();
    [v9 objectForKey:@"name"];
    v10 = (void *)TSUDynamicCast();
    if (!v10) {
      v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "lastPathComponent"), "stringByDeletingPathExtension");
    }
    v8->mFrameName = (NSString *)[v10 copy];
    v8->mDisplayInPicker = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Display"), "BOOLValue");
    v8->mLeftInset = (double)(int)objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Left Frame Inset"), "intValue");
    v8->mRightInset = (double)(int)objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Right Frame Inset"), "intValue");
    v8->mTopInset = (double)(int)objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Top Frame Inset"), "intValue");
    v8->mBottomInset = (double)(int)objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Bottom Frame Inset"), "intValue");
    v8->mTilingMode = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Stretch Tiles"), "intValue");
    if ([v9 objectForKey:@"Minimum Asset Scale"])
    {
      objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Minimum Asset Scale"), "floatValue");
      TSUClamp();
    }
    else
    {
      double v11 = 1.0;
    }
    v8->mMinimumAssetScale = v11;
    if ([v9 objectForKey:@"Adornment Location Relative"])
    {
      objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Adornment Location Relative"), "floatValue");
      v8->mAdornmentPosition.x = v12;
      objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"Adornment Location Absolute"), "floatValue");
      v8->mAdornmentPosition.y = v13;
    }
    v8->mHasImages = [v9 objectForKey:@"Top Left"] != 0;
    v8->mHasMask = [v9 objectForKey:@"Top Left Mask"] != 0;
    v8->mHasAdornment = [v9 objectForKey:@"Adornment"] != 0;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDFrameSpec;
  [(TSDFrameSpec *)&v3 dealloc];
}

- (id)p_infoDictionary
{
  v2 = NSDictionary;
  objc_super v3 = [(NSBundle *)self->mBundle pathForResource:@"index" ofType:@"plist"];

  return (id)[v2 dictionaryWithContentsOfFile:v3];
}

+ (id)p_imageKeys
{
  id result = (id)p_imageKeys_sImageKeys;
  if (!p_imageKeys_sImageKeys)
  {
    objc_sync_enter(a1);
    if (!p_imageKeys_sImageKeys)
    {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"Top Left", @"Top", @"Top Right", @"Right", @"Bottom Right", @"Bottom", @"Bottom Left", @"Left", @"Adornment", 0);
      __dmb(0xBu);
      p_imageKeys_sImageKeys = v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDFrameSpec p_imageKeys]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 173, @"Couldn't initialize lazy variable %s", "sImageKeys");
      }
    }
    objc_sync_exit(a1);
    return (id)p_imageKeys_sImageKeys;
  }
  return result;
}

- (id)p_imageDataForKey:(id)a3
{
  id result = (id)objc_msgSend(-[TSDFrameSpec p_infoDictionary](self, "p_infoDictionary"), "objectForKey:", a3);
  if (result)
  {
    v5 = [(NSURL *)[(NSBundle *)self->mBundle resourceURL] URLByAppendingPathComponent:result];
    return +[TSPData readOnlyDataFromURL:v5 context:0];
  }
  return result;
}

- (void)p_loadImageMetrics
{
  if (!self->mLoadedImageMetrics)
  {
    objc_sync_enter(self);
    if (!self->mLoadedImageMetrics)
    {
      if ([(TSDFrameSpec *)self i_hasImages])
      {
        id v3 = [(TSDFrameSpec *)self i_providerForIndex:6 mask:0];
        id v4 = [(TSDFrameSpec *)self i_providerForIndex:2 mask:0];
        [v3 naturalSize];
        double v6 = v5;
        double v8 = v7;
        [v4 naturalSize];
        double v10 = v9;
        double v12 = v11;
        objc_opt_class();
        float v13 = (void *)TSUDynamicCast();
        if (v13)
        {
          unint64_t v14 = [v13 imageDPI];
          if (v14 >= 0x49)
          {
            double v15 = 72.0 / (double)v14;
            double v6 = TSDMultiplySizeScalar(v6, v8, v15);
            double v8 = v16;
            double v10 = TSDMultiplySizeScalar(v10, v12, v15);
            double v12 = v17;
          }
        }
        self->mLeftWidth = v6;
        self->mRightWidth = v10;
        self->mTopHeight = v12;
        self->mBottomHeight = v8;
      }
      if ([(TSDFrameSpec *)self i_hasAdornment])
      {
        objc_msgSend(-[TSDFrameSpec i_providerForIndex:mask:](self, "i_providerForIndex:mask:", 8, 0), "naturalSize");
        double v19 = v18;
        double v21 = v20;
        objc_opt_class();
        long long v22 = (void *)TSUDynamicCast();
        if (v22)
        {
          unint64_t v23 = [v22 imageDPI];
          if (v23 >= 0x49)
          {
            double v19 = TSDMultiplySizeScalar(v19, v21, 72.0 / (double)v23);
            double v21 = v24;
          }
        }
        self->mAdornmentSize.width = v19;
        self->mAdornmentSize.height = v21;
      }
      __dmb(0xBu);
      self->mLoadedImageMetrics = 1;
    }
    objc_sync_exit(self);
  }
}

- (NSString)frameName
{
  return self->mFrameName;
}

- (BOOL)displayInPicker
{
  return self->mDisplayInPicker;
}

- (BOOL)i_hasImages
{
  return self->mHasImages;
}

- (BOOL)i_hasMask
{
  return self->mHasMask;
}

- (BOOL)i_hasAdornment
{
  return self->mHasAdornment;
}

- (void)i_addInterestInProviders
{
}

- (void)i_removeInterestInProviders
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  atomic_fetch_add(&self->mInterest, 0xFFFFFFFF);
  if (!self->mInterest)
  {
    objc_sync_enter(self);
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = (void *)[(NSMutableDictionary *)self->mProvidersByKey allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) flush];
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
    [(NSMutableDictionary *)self->mProvidersByKey removeAllObjects];
    objc_sync_exit(self);
  }
}

- (id)i_providerForIndex:(int)a3 mask:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 8 && a4)
  {
    long long v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDFrameSpec(Internal) i_providerForIndex:mask:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameSpec.m"), 296, @"Masks for adornments are unsupported.");
  }
  long long v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "p_imageKeys"), "objectAtIndex:", a3);
  uint64_t v10 = (uint64_t)v9;
  if (v4) {
    uint64_t v10 = [v9 stringByAppendingString:@" Mask"];
  }
  objc_sync_enter(self);
  id v11 = (id)[(NSMutableDictionary *)self->mProvidersByKey objectForKey:v10];
  if (!v11)
  {
    id v11 = [(TSDFrameSpec *)self p_imageDataForKey:v10];
    if (v11)
    {
      objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v11, 0);
      objc_opt_class();
      id v11 = (id)TSUDynamicCast();
      mProvidersByKey = self->mProvidersByKey;
      if (!mProvidersByKey)
      {
        mProvidersByKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        self->mProvidersByKey = mProvidersByKey;
      }
      [(NSMutableDictionary *)mProvidersByKey setObject:v11 forKey:v10];
    }
  }
  objc_sync_exit(self);
  return v11;
}

- (double)i_leftInset
{
  return self->mLeftInset;
}

- (double)i_rightInset
{
  return self->mRightInset;
}

- (double)i_topInset
{
  return self->mTopInset;
}

- (double)i_bottomInset
{
  return self->mBottomInset;
}

- (double)i_leftWidth
{
  return self->mLeftWidth;
}

- (double)i_rightWidth
{
  return self->mRightWidth;
}

- (double)i_topHeight
{
  return self->mTopHeight;
}

- (double)i_bottomHeight
{
  return self->mBottomHeight;
}

- (CGSize)i_adornmentSize
{
  [(TSDFrameSpec *)self p_loadImageMetrics];
  double width = self->mAdornmentSize.width;
  double height = self->mAdornmentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)i_minimumAssetScale
{
  return self->mMinimumAssetScale;
}

- (CGPoint)i_adornmentPosition
{
  double x = self->mAdornmentPosition.x;
  double y = self->mAdornmentPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)i_tilingMode
{
  return self->mTilingMode;
}

@end