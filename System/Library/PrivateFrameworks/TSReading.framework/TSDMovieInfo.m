@interface TSDMovieInfo
+ (double)defaultPosterTimeForDuration:(double)a3;
+ (id)presetKinds;
- (BOOL)allowsAirPlayVideo;
- (BOOL)canChangeWrapType;
- (BOOL)containsProperty:(int)a3;
- (BOOL)isAudioOnly;
- (BOOL)isStreaming;
- (BOOL)supportsAttachedComments;
- (BOOL)supportsHyperlinks;
- (BOOL)usesAirPlayVideoWhileAirPlayScreenIsActive;
- (CGSize)rawDataSize;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (Class)styleClass;
- (NSURL)movieRemoteURL;
- (NSURL)urlForMPMPC;
- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5;
- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieData:(id)a6 loadedAsset:(id)a7;
- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieRemoteURL:(id)a6 loadedAsset:(id)a7;
- (TSPData)audioOnlyImageData;
- (TSPData)importedAuxiliaryMovieData;
- (TSPData)movieData;
- (TSPData)posterImageData;
- (double)doubleValueForProperty:(int)a3;
- (double)endTime;
- (double)posterTime;
- (double)startTime;
- (float)floatValueForProperty:(int)a3;
- (float)volume;
- (id)animationFilters;
- (id)copyWithContext:(id)a3;
- (id)copyWithContext:(id)a3 stylesheet:(id)a4;
- (id)generateEmptyPosterImageForContext:(id)a3;
- (id)makeAVAsset;
- (id)makeAVAssetWithOptions:(id)a3;
- (id)makePosterImageGeneratorWithAVAsset:(id)a3;
- (id)mediaDisplayName;
- (id)mediaFileType;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)objectForProperty:(int)a3;
- (id)presetKind;
- (id)style;
- (id)synchronouslyGenerateDefaultPosterImageForContext:(id)a3;
- (int)controlStyle;
- (int)intValueForProperty:(int)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)loopOption;
- (void)acceptVisitor:(id)a3;
- (void)dealloc;
- (void)p_setPropertiesFromLoadedAsset:(id)a3;
- (void)setAllowsAirPlayVideo:(BOOL)a3;
- (void)setAudioOnly:(BOOL)a3;
- (void)setAudioOnlyImageData:(id)a3;
- (void)setControlStyle:(int)a3;
- (void)setEndTime:(double)a3;
- (void)setImportedAuxiliaryMovieData:(id)a3;
- (void)setLoopOption:(unint64_t)a3;
- (void)setMovieData:(id)a3;
- (void)setMovieRemoteURL:(id)a3;
- (void)setPosterImageData:(id)a3;
- (void)setPosterTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setStreaming:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setUrlForMPMPC:(id)a3;
- (void)setUsesAirPlayVideoWhileAirPlayScreenIsActive:(BOOL)a3;
- (void)setVolume:(float)a3;
@end

@implementation TSDMovieInfo

- (TSPData)movieData
{
  return self->mMovieData;
}

- (void)setMovieData:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mMovieData = (TSPData *)a3;
}

- (NSURL)movieRemoteURL
{
  return self->mMovieRemoteURL;
}

- (void)setMovieRemoteURL:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = (NSURL *)[a3 copy];

  self->mMovieRemoteURL = v5;
}

- (TSPData)importedAuxiliaryMovieData
{
  return self->mImportedAuxiliaryMovieData;
}

- (void)setImportedAuxiliaryMovieData:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mImportedAuxiliaryMovieData = (TSPData *)a3;
}

- (TSPData)audioOnlyImageData
{
  return self->mAudioOnlyImageData;
}

- (void)setAudioOnlyImageData:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mAudioOnlyImageData = (TSPData *)a3;
}

- (double)startTime
{
  return self->mStartTime;
}

- (void)setStartTime:(double)a3
{
  self->mStartTime = a3;
}

- (double)endTime
{
  return self->mEndTime;
}

- (void)setEndTime:(double)a3
{
  self->mEndTime = a3;
}

- (double)posterTime
{
  return self->mPosterTime;
}

- (void)setPosterTime:(double)a3
{
  self->mPosterTime = a3;
}

- (unint64_t)loopOption
{
  return self->mLoopOption;
}

- (void)setLoopOption:(unint64_t)a3
{
  self->mLoopOption = a3;
}

- (float)volume
{
  return self->mVolume;
}

- (void)setVolume:(float)a3
{
  self->mVolume = a3;
}

- (BOOL)isAudioOnly
{
  return self->mAudioOnly;
}

- (void)setAudioOnly:(BOOL)a3
{
  self->mAudioOnly = a3;
}

- (BOOL)allowsAirPlayVideo
{
  return self->mAllowsAirPlayVideo;
}

- (void)setAllowsAirPlayVideo:(BOOL)a3
{
  self->mAllowsAirPlayVideo = a3;
}

- (BOOL)usesAirPlayVideoWhileAirPlayScreenIsActive
{
  return self->mUsesAirPlayVideoWhileAirPlayScreenIsActive;
}

- (void)setUsesAirPlayVideoWhileAirPlayScreenIsActive:(BOOL)a3
{
  self->mUsesAirPlayVideoWhileAirPlayScreenIsActive = a3;
}

- (int)controlStyle
{
  return self->mControlStyle;
}

- (void)setControlStyle:(int)a3
{
  self->mControlStyle = a3;
}

- (NSURL)urlForMPMPC
{
  return self->mURLForMPMPC;
}

- (void)setUrlForMPMPC:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mURLForMPMPC = (NSURL *)a3;
}

+ (double)defaultPosterTimeForDuration:(double)a3
{
  return a3 * 0.0;
}

- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMovieInfo initWithContext:geometry:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 81, @"please call the other init methods");
  return 0;
}

- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TSDMovieInfo;
  v6 = [(TSDMediaInfo *)&v9 initWithContext:a3 geometry:a4];
  v7 = v6;
  if (v6)
  {
    [(TSDMovieInfo *)v6 setStyle:a5];
    v7->mVolume = 1.0;
  }
  return v7;
}

- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieData:(id)a6 loadedAsset:(id)a7
{
  objc_super v9 = [(TSDMovieInfo *)self initWithContext:a3 geometry:a4 style:a5];
  if (v9)
  {
    v9->mMovieData = (TSPData *)a6;
    [(TSDMovieInfo *)v9 p_setPropertiesFromLoadedAsset:a7];
  }
  return v9;
}

- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieRemoteURL:(id)a6 loadedAsset:(id)a7
{
  objc_super v9 = [(TSDMovieInfo *)self initWithContext:a3 geometry:a4 style:a5];
  if (v9)
  {
    v9->mMovieRemoteURL = (NSURL *)[a6 copy];
    [(TSDMovieInfo *)v9 p_setPropertiesFromLoadedAsset:a7];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieInfo;
  [(TSDDrawableInfo *)&v3 dealloc];
}

- (id)copyWithContext:(id)a3
{
  return [(TSDMovieInfo *)self copyWithContext:a3 stylesheet:0];
}

- (id)copyWithContext:(id)a3 stylesheet:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)TSDMovieInfo;
  v7 = -[TSDMediaInfo copyWithContext:](&v14, sel_copyWithContext_);
  if (v7)
  {
    *((void *)v7 + 21) = [(TSPData *)self->mMovieData copyWithContext:a3];
    *((void *)v7 + 22) = [(NSURL *)self->mMovieRemoteURL copy];
    *((void *)v7 + 25) = *(void *)&self->mStartTime;
    *((void *)v7 + 26) = *(void *)&self->mEndTime;
    *((void *)v7 + 27) = *(void *)&self->mPosterTime;
    *((void *)v7 + 31) = self->mLoopOption;
    *((_DWORD *)v7 + 64) = LODWORD(self->mVolume);
    v7[288] = self->mAudioOnly;
    v7[260] = self->mStreaming;
    *((void *)v7 + 24) = [(TSPData *)self->mAudioOnlyImageData copyWithContext:a3];
    *((void *)v7 + 28) = [(TSPData *)self->mPosterImageData copyWithContext:a3];
    *(CGSize *)(v7 + 232) = self->mNaturalSize;
    v7[268] = self->mAllowsAirPlayVideo;
    v7[269] = self->mUsesAirPlayVideoWhileAirPlayScreenIsActive;
    *((_DWORD *)v7 + 66) = self->mControlStyle;
    *((void *)v7 + 34) = [(NSURL *)self->mURLForMPMPC copy];
    if (a4)
    {
LABEL_11:
      v12 = [[TSSStyleMapper alloc] initWithTargetStylesheet:a4 newStyleDOLCContext:0];
      objc_opt_class();
      [(TSSStyleMapper *)v12 mappedStyleForStyle:self->mStyle];
      *((void *)v7 + 35) = (id)TSUDynamicCast();

      return v7;
    }
    [a3 documentObject];
    if (objc_opt_respondsToSelector())
    {
      v8 = (TSPObjectContext *)a3;
    }
    else
    {
      [(TSPObjectContext *)[(TSPObject *)self context] documentObject];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_super v9 = [(TSSStyle *)self->mStyle stylesheet];
LABEL_9:
        a4 = v9;
        if (!v9)
        {
          v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v11 = [NSString stringWithUTF8String:"-[TSDMovieInfo copyWithContext:stylesheet:]"];
          objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 188, @"invalid nil value for '%s'", "stylesheet");
          a4 = 0;
        }
        goto LABEL_11;
      }
      v8 = [(TSPObject *)self context];
    }
    objc_super v9 = (TSSStylesheet *)[[(TSPObjectContext *)v8 documentObject] performSelector:sel_stylesheet];
    goto LABEL_9;
  }
  return v7;
}

- (id)mediaDisplayName
{
  if ([(TSDMovieInfo *)self movieData])
  {
    objc_super v3 = [(TSDMovieInfo *)self movieData];
    return [(TSPData *)v3 filename];
  }
  else
  {
    uint64_t v5 = [(TSDMovieInfo *)self movieRemoteURL];
    return [(NSURL *)v5 lastPathComponent];
  }
}

- (id)mediaFileType
{
  if ([(TSDMovieInfo *)self movieData])
  {
    objc_super v3 = [(TSDMovieInfo *)self movieData];
    return [(TSPData *)v3 type];
  }
  else
  {
    v6 = 0;
    uint64_t v5 = [(TSDMovieInfo *)self movieRemoteURL];
    [(NSURL *)v5 getResourceValue:&v6 forKey:*MEMORY[0x263EFF780] error:0];
    return v6;
  }
}

+ (id)presetKinds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:String];
}

- (void)setStyle:(id)a3
{
  if (self->mStyle != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperties:+[TSDMediaStyle properties]];
    [(TSPObject *)self willModify];
    id v5 = a3;

    self->mStyle = (TSDMediaStyle *)a3;
  }
}

- (id)presetKind
{
  objc_super v3 = (void *)String;
  objc_opt_class();
  [(TSDMovieInfo *)self style];
  v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return v3;
  }

  return (id)[v4 presetKind];
}

- (void)setPosterImageData:(id)a3
{
  if (self->mPosterImageData != a3)
  {
    [(TSPObject *)self willModify];
    id v5 = a3;

    self->mPosterImageData = (TSPData *)a3;
  }
}

- (CGSize)rawDataSize
{
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)p_setPropertiesFromLoadedAsset:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMovieInfo p_setPropertiesFromLoadedAsset:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 276, @"invalid nil value for '%s'", "asset");
  }
  if ([a3 statusOfValueForKey:@"duration" error:0] != 2)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDMovieInfo p_setPropertiesFromLoadedAsset:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 277, @"Invalid parameter not satisfying: %s", "[asset statusOfValueForKey:@\"duration\" error:NULL] == AVKeyValueStatusLoaded");
  }
  if ([a3 statusOfValueForKey:@"tracks" error:0] != 2)
  {
    objc_super v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDMovieInfo p_setPropertiesFromLoadedAsset:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 278, @"Invalid parameter not satisfying: %s", "[asset statusOfValueForKey:@\"tracks\" error:NULL] == AVKeyValueStatusLoaded");
  }
  memset(&v25, 0, sizeof(v25));
  if (a3) {
    [a3 duration];
  }
  else {
    CMTime v25 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  }
  CMTime time = v25;
  double Seconds = CMTimeGetSeconds(&time);
  [(TSDMovieInfo *)self setStartTime:0.0];
  [(TSDMovieInfo *)self setEndTime:Seconds];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v12 = (void *)[a3 tracks];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    uint64_t v16 = *MEMORY[0x263EF9CE0];
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v18 isEnabled]
          && ([v18 hasMediaCharacteristic:v16] & 1) != 0)
        {
          uint64_t v19 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = 1;
LABEL_21:
  [(TSDMovieInfo *)self setAudioOnly:v19];
}

- (Class)styleClass
{
  return (Class)objc_opt_class();
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (Class)editorClass
{
  return 0;
}

- (BOOL)canChangeWrapType
{
  return !self->mAudioOnly;
}

- (void)setStreaming:(BOOL)a3
{
  if (self->mStreaming != a3)
  {
    BOOL v3 = a3;
    [(TSPObject *)self willModify];
    self->mStreaming = v3;
    if (v3)
    {
      [(TSDDrawableInfo *)self setAspectRatioLocked:0];
    }
  }
}

- (id)animationFilters
{
  if ([(TSDMovieInfo *)self isAudioOnly])
  {
    BOOL v3 = (void *)MEMORY[0x263EFFA08];
    v4 = &kTSDAnimationFilterAudio;
  }
  else
  {
    BOOL v5 = [(TSDMovieInfo *)self isStreaming];
    BOOL v3 = (void *)MEMORY[0x263EFFA08];
    if (!v5) {
      return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", kTSDAnimationFilterStandard, kTSDAnimationFilterMovie, 0);
    }
    v4 = &kTSDAnimationFilterMovie;
  }
  uint64_t v6 = *v4;

  return (id)[v3 setWithObject:v6];
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__TSDMovieInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDMovieInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMovieInfo mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 370, @"nil object after cast");
  }
  if ([*(id *)(a1 + 40) movieData])
  {
    uint64_t v5 = [v2 movieData];
    if (v5 == [*(id *)(a1 + 40) movieData]) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  else if ([*(id *)(a1 + 40) movieRemoteURL])
  {
    if (objc_msgSend((id)objc_msgSend(v2, "movieRemoteURL"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "movieRemoteURL")))uint64_t v6 = 5; {
    else
    }
      uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 1;
  }
  [*(id *)(a1 + 40) posterTime];
  double v8 = v7;
  [v2 posterTime];
  if (v8 != v9) {
    uint64_t v6 = TSDMixingTypeBestFromMixingTypes(v6, 2);
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixingTypeWithObject:", objc_msgSend(v2, "geometry"));

  return TSDMixingTypeBestFromMixingTypes(v6, v10);
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__TSDMovieInfo_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  *(double *)&v5[6] = a3;
  v5[4] = self;
  v5[5] = a4;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

id __49__TSDMovieInfo_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  uint64_t v1 = 40;
  if (*(double *)(a1 + 48) < 1.0) {
    uint64_t v1 = 32;
  }
  id v2 = *(id *)(a1 + v1);

  return v2;
}

- (void)acceptVisitor:(id)a3
{
}

- (id)makeAVAsset
{
  return [(TSDMovieInfo *)self makeAVAssetWithOptions:0];
}

- (id)makeAVAssetWithOptions:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TSDMovieInfo *)self movieData];
  if (v5)
  {
    return [(TSPData *)v5 AVAssetWithOptions:a3];
  }
  else
  {
    id result = [(TSDMovieInfo *)self movieRemoteURL];
    if (result)
    {
      id v7 = result;
      uint64_t v10 = *MEMORY[0x263EFA2A8];
      v11[0] = &unk_26D739D68;
      id v8 = (id)objc_msgSend((id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1), "mutableCopy");
      id v9 = v8;
      if (a3) {
        [v8 addEntriesFromDictionary:a3];
      }
      return (id)[MEMORY[0x263EFA8D0] URLAssetWithURL:v7 options:v9];
    }
  }
  return result;
}

- (id)makePosterImageGeneratorWithAVAsset:(id)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x263EFA4B0]) initWithAsset:a3];
  long long v9 = *MEMORY[0x263F010E0];
  long long v6 = v9;
  uint64_t v10 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v4 = v10;
  [v3 setRequestedTimeToleranceAfter:&v9];
  long long v7 = v6;
  uint64_t v8 = v4;
  [v3 setRequestedTimeToleranceBefore:&v7];
  [v3 setAppliesPreferredTrackTransform:1];
  return v3;
}

- (id)generateEmptyPosterImageForContext:(id)a3
{
  [(TSDMediaInfo *)self originalSize];
  if (v4 <= 0.0 || v5 <= 0.0)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDMovieInfo generateEmptyPosterImageForContext:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 474, @"Movie's oriignal size should be nonzero.");
    return 0;
  }
  else
  {
    long long v6 = TSDBitmapContextCreate(3, v4);
    CGContextSetFillColorWithColor(v6, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "CGColor"));
    v12.origin.x = TSDRectWithSize();
    CGContextFillRect(v6, v12);
    Image = CGBitmapContextCreateImage(v6);
    id v8 = +[TSPData dataFromNSData:MEMORY[0x223CB86D0]() filename:@"posterImage.png" context:a3];
    CGImageRelease(Image);
    CGContextRelease(v6);
    return v8;
  }
}

- (id)synchronouslyGenerateDefaultPosterImageForContext:(id)a3
{
  id v5 = [(TSDMovieInfo *)self makeAVAsset];
  id v6 = [(TSDMovieInfo *)self makePosterImageGeneratorWithAVAsset:v5];
  id v17 = 0;
  CMTimeMakeWithSeconds(&time, self->mPosterTime, 90000);
  if (v5) {
    [v5 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CMTimeRangeMake(&range, &v12, &duration);
  CMTimeClampToRange(&v16, &time, &range);
  uint64_t v7 = [v6 copyCGImageAtTime:&v16 actualTime:0 error:&v17];
  if (v7)
  {
    id v8 = (CGImage *)v7;
    id v9 = +[TSPData dataFromNSData:MEMORY[0x223CB86D0]() filename:@"posterImage.png" context:a3];
    CGImageRelease(v8);
  }
  else if (v17 {
         && [v17 code] == -11832
  }
         && (uint64_t v10 = (void *)[v17 domain],
             [v10 isEqualToString:*MEMORY[0x263EF98B0]]))
  {
    return [(TSDMovieInfo *)self generateEmptyPosterImageForContext:a3];
  }
  else
  {
    return 0;
  }
  return v9;
}

- (BOOL)supportsAttachedComments
{
  return ![(TSDMovieInfo *)self isAudioOnly];
}

- (BOOL)containsProperty:(int)a3
{
  if ((a3 - 532) < 7) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TSDMovieInfo;
  return -[TSDDrawableInfo containsProperty:](&v6, sel_containsProperty_);
}

- (id)objectForProperty:(int)a3
{
  if (a3 == 533)
  {
    return [(TSDMovieInfo *)self posterImageData];
  }
  else if (a3 == 532)
  {
    return [(TSDMovieInfo *)self movieData];
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)TSDMovieInfo;
    return -[TSDStyledInfo objectForProperty:](&v6, sel_objectForProperty_);
  }
}

- (double)doubleValueForProperty:(int)a3
{
  switch(a3)
  {
    case 536:
      [(TSDMovieInfo *)self posterTime];
      break;
    case 535:
      [(TSDMovieInfo *)self endTime];
      break;
    case 534:
      [(TSDMovieInfo *)self startTime];
      break;
    default:
      uint64_t v7 = v3;
      uint64_t v8 = v4;
      v6.receiver = self;
      v6.super_class = (Class)TSDMovieInfo;
      -[TSDDrawableInfo doubleValueForProperty:](&v6, sel_doubleValueForProperty_);
      break;
  }
  return result;
}

- (float)floatValueForProperty:(int)a3
{
  if (a3 == 538)
  {
    [(TSDMovieInfo *)self volume];
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)TSDMovieInfo;
    -[TSDDrawableInfo floatValueForProperty:](&v6, sel_floatValueForProperty_);
  }
  return result;
}

- (int)intValueForProperty:(int)a3
{
  if (a3 == 537) {
    return [(TSDMovieInfo *)self loopOption];
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDMovieInfo;
  return -[TSDDrawableInfo intValueForProperty:](&v4, sel_intValueForProperty_);
}

- (BOOL)supportsHyperlinks
{
  return !self->mAudioOnly;
}

- (id)style
{
  return self->mStyle;
}

- (TSPData)posterImageData
{
  return self->mPosterImageData;
}

- (BOOL)isStreaming
{
  return self->mStreaming;
}

@end