@interface MCSlide
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)durationIsDefined;
- (BOOL)startTimeIsDefined;
- (CGPoint)center;
- (MCAssetVideo)asset;
- (MCContainerEffect)container;
- (MCPlugSlide)plug;
- (MCSlide)init;
- (MCSlide)initWithImprint:(id)a3 andMontage:(id)a4;
- (MCSong)song;
- (NSArray)orderedFilters;
- (NSDictionary)frameAttributes;
- (NSSet)animationPaths;
- (NSSet)filters;
- (NSString)frameID;
- (NSString)kenBurnsType;
- (double)audioDuckInDuration;
- (double)audioDuckOutDuration;
- (double)audioFadeInDuration;
- (double)audioFadeOutDuration;
- (double)duration;
- (double)rotation;
- (double)scale;
- (double)startTime;
- (float)audioDuckLevel;
- (float)audioVolume;
- (id)addFilterWithFilterID:(id)a3;
- (id)animationPathForKey:(id)a3;
- (id)filterAtIndex:(unint64_t)a3;
- (id)frameAttributeForKey:(id)a3;
- (id)imprint;
- (id)imprintsForAnimationPaths;
- (id)imprintsForFilters;
- (id)insertFilterWithFilterID:(id)a3 atIndex:(unint64_t)a4;
- (unint64_t)countOfAnimationPaths;
- (unint64_t)countOfFilters;
- (unint64_t)index;
- (unsigned)countOfLayouts;
- (unsigned)currentLayoutIndex;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addAnimationPath:(id)a3;
- (void)demolish;
- (void)demolishAnimationPaths;
- (void)demolishFilters;
- (void)initAnimationPathsWithImprints:(id)a3;
- (void)initFiltersWithImprints:(id)a3;
- (void)moveFiltersAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)observeFilter:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllAnimationPaths;
- (void)removeAllFilters;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAudioDuckInDuration:(double)a3;
- (void)setAudioDuckLevel:(float)a3;
- (void)setAudioDuckOutDuration:(double)a3;
- (void)setAudioFadeInDuration:(double)a3;
- (void)setAudioFadeOutDuration:(double)a3;
- (void)setAudioVolume:(float)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setDuration:(double)a3;
- (void)setFrameAttribute:(id)a3 forKey:(id)a4;
- (void)setFrameAttributes:(id)a3;
- (void)setFrameID:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setKenBurnsType:(id)a3;
- (void)setPlug:(id)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
- (void)setSongForAsset:(id)a3;
- (void)setStartTime:(double)a3;
- (void)undefineDuration;
- (void)undefineStartTime;
- (void)unobserveFilter:(id)a3;
@end

@implementation MCSlide

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"builtVolume"]) {
    return +[NSSet setWithObjects:@"audioVolume", @"fadeInDuration", @"fadeOutDuration", @"audioDuckLevel", @"duckInDuration", @"duckOutDuration", 0];
  }
  if ([a3 isEqualToString:@"builtAudio"])
  {
    CFStringRef v8 = @"builtVolume";
    uint64_t v9 = 0;
    return +[NSSet setWithObjects:@"song", @"startTime", @"duration", v8, v9, v10, v11];
  }
  if ([a3 isEqualToString:@"audioNoVolume"])
  {
    CFStringRef v8 = 0;
    return +[NSSet setWithObjects:@"song", @"startTime", @"duration", v8, v9, v10, v11];
  }
  if ([a3 isEqualToString:@"orderedFilters"]) {
    return +[NSSet setWithObjects:@"filters", 0, v6, v7, v9, v10, v11];
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___MCSlide;
  return objc_msgSendSuper2(&v12, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCSlide)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCSlide;
  result = [(MCSlide *)&v3 init];
  if (result)
  {
    result->mAudioVolume = 1.0;
    result->mAudioDuckLevel = 1.0;
  }
  return result;
}

- (MCSlide)initWithImprint:(id)a3 andMontage:(id)a4
{
  v35.receiver = self;
  v35.super_class = (Class)MCSlide;
  uint64_t v6 = -[MCObject initWithImprint:andMontage:](&v35, "initWithImprint:andMontage:");
  if (v6)
  {
    id v7 = [a3 objectForKey:@"flags"];
    if (v7) {
      id v7 = [v7 unsignedIntegerValue];
    }
    v6->mFlags = (unint64_t)v7;
    id v8 = [a3 objectForKey:@"slideAssets"];
    if (v8)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_129C24;
      v34[3] = &unk_1AB960;
      v34[4] = v6;
      v34[5] = a4;
      [v8 enumerateObjectsUsingBlock:v34];
    }
    id v9 = [a3 objectForKey:@"plug"];
    if (v9) {
      v6->mPlug = (MCPlugSlide *)+[MCObject objectWithImprint:v9 andMontage:a4];
    }
    id v10 = [a3 objectForKey:@"song"];
    if (v10)
    {
      uint64_t v11 = +[MCObject objectWithImprint:v10 andMontage:a4];
      v6->mSong = (MCSong *)v11;
      [(MCObject *)v11 setSlideIfSlideSong:v6];
      if (![(MCObject *)v6 isSnapshot])
      {
        [(MCSong *)v6->mSong addObserver:v6 forKeyPath:@"builtVolume" options:0 context:0];
        [(MCSong *)v6->mSong addObserver:v6 forKeyPath:@"builtAudio" options:0 context:0];
      }
    }
    id v12 = [a3 objectForKey:@"index"];
    if (v12) {
      id v12 = [v12 unsignedIntegerValue];
    }
    v6->mIndex = (unint64_t)v12;
    id v13 = [a3 objectForKey:@"audioVolume"];
    if (v13) {
      [v13 floatValue];
    }
    else {
      float v14 = 1.0;
    }
    v6->mAudioVolume = v14;
    id v15 = [a3 objectForKey:@"audioFadeInDuration"];
    double v16 = 0.0;
    double v17 = 0.0;
    if (v15) {
      objc_msgSend(v15, "doubleValue", 0.0);
    }
    v6->mAudioFadeInDuration = v17;
    id v18 = [a3 objectForKey:@"audioFadeOutDuration"];
    if (v18)
    {
      [v18 doubleValue];
      double v16 = v19;
    }
    v6->mAudioFadeOutDuration = v16;
    id v20 = [a3 objectForKey:@"audioDuckLevel"];
    if (v20) {
      [v20 floatValue];
    }
    else {
      float v21 = 1.0;
    }
    v6->mAudioDuckLevel = v21;
    id v22 = [a3 objectForKey:@"audioDuckInDuration"];
    double v23 = 0.0;
    double v24 = 0.0;
    if (v22) {
      objc_msgSend(v22, "doubleValue", 0.0);
    }
    v6->mAudioDuckInDuration = v24;
    id v25 = [a3 objectForKey:@"audioDuckOutDuration"];
    if (v25)
    {
      [v25 doubleValue];
      double v23 = v26;
    }
    v6->mAudioDuckOutDuration = v23;
    id v27 = [a3 objectForKey:@"startTime"];
    if (v27)
    {
      v6->mFlags |= 1uLL;
      [v27 doubleValue];
      v6->mStartTime = v28;
    }
    id v29 = [a3 objectForKey:@"duration"];
    if (v29)
    {
      v6->mFlags |= 2uLL;
      [v29 doubleValue];
      v6->mDuration = v30;
    }
    v6->mFrameID = (NSString *)[a3 objectForKey:@"frameID"];
    v6->mFrameAttributes = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(a3, "objectForKey:", @"frameAttributes"));
    id v31 = [a3 objectForKey:@"filters"];
    if (v31) {
      [(MCSlide *)v6 initFiltersWithImprints:v31];
    }
    id v32 = [a3 objectForKey:@"animationPaths"];
    if (v32) {
      [(MCSlide *)v6 initAnimationPathsWithImprints:v32];
    }
  }
  return v6;
}

- (void)demolish
{
  objc_sync_enter(self);
  if (self->mSlideAsset)
  {
    [(MCSlide *)self willChangeValueForKey:@"asset"];
    for (unint64_t i = 0; ; ++i)
    {
      mSlideAsset = self->mSlideAsset;
      unint64_t v5 = mSlideAsset ? ((self->mFlags >> 24) & 0xF) + 1 : 0;
      if (i >= v5) {
        break;
      }
      if (![(MCObject *)self isSnapshot]) {
        objc_msgSend(objc_msgSend(self->mSlideAsset[i], "asset"), "removeSlide:", self);
      }

      self->mSlideAsset[i] = 0;
    }
    free(mSlideAsset);
    self->mSlideAsset = 0;
    [(MCSlide *)self didChangeValueForKey:@"asset"];
  }
  [(MCSlide *)self setPlug:0];
  mSong = self->mSong;
  if (mSong)
  {
    [(MCSlide *)self willChangeValueForKey:@"song"];
    [(MCSong *)self->mSong removeObserver:self forKeyPath:@"builtVolume"];
    [(MCSong *)self->mSong removeObserver:self forKeyPath:@"builtAudio"];
    self->mSong = 0;
    [(MCSlide *)self didChangeValueForKey:@"song"];
    [(MCSong *)mSong demolish];
  }
  self->mFrameID = 0;

  self->mFrameAttributes = 0;
  self->mContainer = 0;
  [(MCSlide *)self demolishAnimationPaths];
  [(MCSlide *)self demolishFilters];
  objc_sync_exit(self);
  v7.receiver = self;
  v7.super_class = (Class)MCSlide;
  [(MCObject *)&v7 demolish];
}

- (id)imprint
{
  v29.receiver = self;
  v29.super_class = (Class)MCSlide;
  id v3 = [(MCObject *)&v29 imprint];
  if (self->mFlags) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->mFlags), @"flags");
  }
  if (self->mSlideAsset)
  {
    id v4 = objc_alloc((Class)NSMutableArray);
    double v28 = v3;
    if (self->mSlideAsset) {
      unint64_t v5 = ((self->mFlags >> 24) & 0xF) + 1;
    }
    else {
      unint64_t v5 = 0;
    }
    id v6 = [v4 initWithCapacity:v5];
    char v7 = 0;
    for (unint64_t i = 0; ; ++i)
    {
      mSlideAsset = self->mSlideAsset;
      if (mSlideAsset) {
        mSlideAsset = (id *)(((self->mFlags >> 24) & 0xF) + 1);
      }
      if (i >= (unint64_t)mSlideAsset) {
        break;
      }
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v11 = (double *)self->mSlideAsset[i];
      id v12 = [v11 asset];
      if (v12)
      {
        id v13 = v12;
        if ([v12 isSnapshot])
        {
          id v14 = [v13 imprint];
          id v15 = v10;
          CFStringRef v16 = @"asset";
        }
        else
        {
          id v14 = [v13 objectID];
          id v15 = v10;
          CFStringRef v16 = @"assetID";
        }
        [v15 setObject:v14 forKey:v16];
      }
      id v17 = [v11 kenBurnsType];
      if (v17) {
        [v10 setObject:v17 forKey:@"kenBurnsType"];
      }
      double v18 = v11[3];
      if (v18 != 0.5)
      {
        *(float *)&double v18 = v18;
        objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18), @"centerX");
      }
      double v19 = v11[4];
      if (v19 != 0.5)
      {
        *(float *)&double v19 = v19;
        objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19), @"centerY");
      }
      double v20 = v11[5];
      if (v20 != 1.0)
      {
        *(float *)&double v20 = v20;
        objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20), @"scale");
      }
      double v21 = v11[6];
      if (v21 != 0.0)
      {
        *(float *)&double v21 = v21;
        objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21), @"rotation");
      }
      [v6 addObject:v10];
      v7 |= [v10 count] != 0;
    }
    id v3 = v28;
    if (v7) {
      [v28 setObject:v6 forKey:@"slideAssets"];
    }
  }
  mPlug = self->mPlug;
  if (mPlug) {
    objc_msgSend(v3, "setObject:forKey:", -[MCPlug imprint](mPlug, "imprint"), @"plug");
  }
  mSong = self->mSong;
  if (mSong) {
    objc_msgSend(v3, "setObject:forKey:", -[MCSong imprint](mSong, "imprint"), @"song");
  }
  if (self->mIndex) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"), @"index");
  }
  if (self->mAudioVolume != 1.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"audioVolume");
  }
  if (self->mAudioFadeInDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"audioFadeInDuration");
  }
  if (self->mAudioFadeOutDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"audioFadeOutDuration");
  }
  if (self->mAudioDuckLevel != 1.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"audioDuckLevel");
  }
  if (self->mAudioDuckInDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"audioDuckInDuration");
  }
  if (self->mAudioDuckOutDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"audioDuckOutDuration");
  }
  unint64_t mFlags = self->mFlags;
  if (mFlags)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->mStartTime), @"startTime");
    unint64_t mFlags = self->mFlags;
  }
  if ((mFlags & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->mDuration), @"duration");
  }
  mFrameID = self->mFrameID;
  if (mFrameID) {
    [v3 setObject:mFrameID forKey:@"frameID"];
  }
  mFrameAttributes = self->mFrameAttributes;
  if (mFrameAttributes) {
    [v3 setObject:mFrameAttributes forKey:@"frameAttributes"];
  }
  if ([(NSMutableSet *)self->mAnimationPaths count]) {
    objc_msgSend(v3, "setObject:forKey:", -[MCSlide imprintsForAnimationPaths](self, "imprintsForAnimationPaths"), @"animationPaths");
  }
  if ([(NSMutableSet *)self->mFilters count]) {
    objc_msgSend(v3, "setObject:forKey:", -[MCSlide imprintsForFilters](self, "imprintsForFilters"), @"filters");
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->mSong == a4)
  {
    [(MCSlide *)self willChangeValueForKey:a3];
    [(MCSlide *)self didChangeValueForKey:a3];
  }
  if ([a3 isEqualToString:@"keyframes"]) {
    CFStringRef v8 = @"animationPaths";
  }
  else {
    CFStringRef v8 = @"filters";
  }
  [(MCSlide *)self willChangeValueForKey:v8];
  [(MCSlide *)self didChangeValueForKey:v8];
}

- (MCAssetVideo)asset
{
  if (![(MCObject *)self isSnapshot])
  {
    objc_sync_enter(self);
    mSlideAsset = self->mSlideAsset;
    if (mSlideAsset)
    {
      unint64_t mFlags = self->mFlags;
      if (mFlags >> 28 <= ((mFlags >> 24) & 0xF)) {
        uint64_t v9 = mFlags >> 28;
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = [mSlideAsset[v9] asset];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = (MCAssetVideo *)v10;
    objc_sync_exit(self);
    return v11;
  }
  id v3 = self->mSlideAsset;
  if (!v3) {
    return 0;
  }
  unint64_t v4 = self->mFlags;
  unint64_t v5 = v4 >> 28;
  if (v5 <= ((v4 >> 24) & 0xF)) {
    id v6 = v3[v5];
  }
  else {
    id v6 = *v3;
  }
  return (MCAssetVideo *)[v6 asset];
}

- (void)setAsset:(id)a3
{
  if (!((unint64_t)a3 | (unint64_t)self->mSlideAsset)) {
    return;
  }
  objc_sync_enter(self);
  mSlideAsset = self->mSlideAsset;
  unint64_t mFlags = self->mFlags;
  unint64_t v7 = mFlags >> 28;
  if (mSlideAsset)
  {
    unint64_t v8 = (mFlags >> 24) & 0xF;
    if (v7 <= v8)
    {
      id v10 = self->mSlideAsset;
LABEL_17:
      if (mFlags >> 28 <= ((mFlags >> 24) & 0xF)) {
        uint64_t v24 = mFlags >> 28;
      }
      else {
        uint64_t v24 = 0;
      }
      id v10 = (id *)objc_msgSend(v10[v24], "asset", v29);
      goto LABEL_21;
    }
    unint64_t v9 = v8 + 1;
  }
  else
  {
    unint64_t v9 = 0;
  }
  id v10 = (id *)malloc_type_calloc(v7 + 1, 8uLL, 0x80040B8603338uLL);
  self->mSlideAsset = v10;
  self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
  if (mSlideAsset)
  {
    memcpy(v10, mSlideAsset, 8 * v9);
    free(mSlideAsset);
    id v10 = self->mSlideAsset;
  }
  if (v9)
  {
    uint64_t v11 = (v9 - 1);
    id v12 = (char *)v10[v11];
    long long v29 = *(_OWORD *)(v12 + 24);
    double v13 = *((double *)v12 + 5);
    uint64_t v14 = *((void *)v12 + 6);
    id v15 = [v12 asset];
    id v16 = [self->mSlideAsset[v11] kenBurnsType];
    id v10 = self->mSlideAsset;
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_13;
  }
  id v15 = 0;
  id v16 = 0;
  __asm { FMOV            V0.2D, #0.5 }
  long long v29 = _Q0;
  uint64_t v14 = 0;
  double v13 = 1.0;
  if (v10)
  {
LABEL_13:
    unint64_t mFlags = self->mFlags;
    if (((mFlags >> 24) & 0xF) >= v9)
    {
      unint64_t v22 = v9;
      while (1)
      {
        self->mSlideAsset[v22] = objc_alloc_init(MCSlideAsset);
        double v23 = self->mSlideAsset;
        *(_OWORD *)((char *)v23[v22] + 24) = v29;
        *((double *)v23[v22] + 5) = v13;
        *((void *)v23[v22] + 6) = v14;
        [v23[v22] setAsset:v15];
        [v15 addSlide:self];
        [self->mSlideAsset[v22] setKenBurnsType:v16];
        id v10 = self->mSlideAsset;
        if (!v10) {
          goto LABEL_21;
        }
        LODWORD(v9) = v9 + 1;
        unint64_t mFlags = self->mFlags;
        ++v22;
        if (((mFlags >> 24) & 0xF) < v9) {
          goto LABEL_17;
        }
      }
    }
    goto LABEL_17;
  }
LABEL_21:
  if (v10 != a3)
  {
    [v10 removeSlide:self];
    id v25 = self->mSlideAsset;
    if (v25)
    {
      unint64_t v26 = self->mFlags;
      if (v26 >> 28 <= ((v26 >> 24) & 0xF)) {
        uint64_t v27 = v26 >> 28;
      }
      else {
        uint64_t v27 = 0;
      }
      id v28 = v25[v27];
    }
    else
    {
      id v28 = 0;
    }
    objc_msgSend(v28, "setAsset:", a3, v29);
    [a3 addSlide:self];
  }
  objc_sync_exit(self);
}

- (NSString)kenBurnsType
{
  if (![(MCObject *)self isSnapshot])
  {
    objc_sync_enter(self);
    mSlideAsset = self->mSlideAsset;
    if (mSlideAsset)
    {
      unint64_t mFlags = self->mFlags;
      if (mFlags >> 28 <= ((mFlags >> 24) & 0xF)) {
        uint64_t v9 = mFlags >> 28;
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = [mSlideAsset[v9] kenBurnsType];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = (NSString *)v10;
    objc_sync_exit(self);
    return v11;
  }
  id v3 = self->mSlideAsset;
  if (!v3) {
    return 0;
  }
  unint64_t v4 = self->mFlags;
  unint64_t v5 = v4 >> 28;
  if (v5 <= ((v4 >> 24) & 0xF)) {
    id v6 = v3[v5];
  }
  else {
    id v6 = *v3;
  }
  return (NSString *)[v6 kenBurnsType];
}

- (void)setKenBurnsType:(id)a3
{
  if (!((unint64_t)a3 | (unint64_t)self->mSlideAsset)) {
    return;
  }
  objc_sync_enter(self);
  mSlideAsset = self->mSlideAsset;
  unint64_t mFlags = self->mFlags;
  unint64_t v7 = mFlags >> 28;
  if (mSlideAsset)
  {
    unint64_t v8 = (mFlags >> 24) & 0xF;
    if (v7 <= v8)
    {
      id v10 = self->mSlideAsset;
LABEL_17:
      if (mFlags >> 28 <= ((mFlags >> 24) & 0xF)) {
        uint64_t v24 = mFlags >> 28;
      }
      else {
        uint64_t v24 = 0;
      }
      id v10 = (id *)objc_msgSend(v10[v24], "kenBurnsType", v29);
      goto LABEL_21;
    }
    unint64_t v9 = v8 + 1;
  }
  else
  {
    unint64_t v9 = 0;
  }
  id v10 = (id *)malloc_type_calloc(v7 + 1, 8uLL, 0x80040B8603338uLL);
  self->mSlideAsset = v10;
  self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
  if (mSlideAsset)
  {
    memcpy(v10, mSlideAsset, 8 * v9);
    free(mSlideAsset);
    id v10 = self->mSlideAsset;
  }
  if (v9)
  {
    uint64_t v11 = (v9 - 1);
    id v12 = (char *)v10[v11];
    long long v29 = *(_OWORD *)(v12 + 24);
    double v13 = *((double *)v12 + 5);
    uint64_t v14 = *((void *)v12 + 6);
    id v15 = [v12 asset];
    id v16 = [self->mSlideAsset[v11] kenBurnsType];
    id v10 = self->mSlideAsset;
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_13;
  }
  id v15 = 0;
  id v16 = 0;
  __asm { FMOV            V0.2D, #0.5 }
  long long v29 = _Q0;
  uint64_t v14 = 0;
  double v13 = 1.0;
  if (v10)
  {
LABEL_13:
    unint64_t mFlags = self->mFlags;
    if (((mFlags >> 24) & 0xF) >= v9)
    {
      unint64_t v22 = v9;
      while (1)
      {
        self->mSlideAsset[v22] = objc_alloc_init(MCSlideAsset);
        double v23 = self->mSlideAsset;
        *(_OWORD *)((char *)v23[v22] + 24) = v29;
        *((double *)v23[v22] + 5) = v13;
        *((void *)v23[v22] + 6) = v14;
        [v23[v22] setAsset:v15];
        [v15 addSlide:self];
        [self->mSlideAsset[v22] setKenBurnsType:v16];
        id v10 = self->mSlideAsset;
        if (!v10) {
          goto LABEL_21;
        }
        LODWORD(v9) = v9 + 1;
        unint64_t mFlags = self->mFlags;
        ++v22;
        if (((mFlags >> 24) & 0xF) < v9) {
          goto LABEL_17;
        }
      }
    }
    goto LABEL_17;
  }
LABEL_21:
  if (v10 != a3)
  {
    id v25 = self->mSlideAsset;
    if (v25)
    {
      unint64_t v26 = self->mFlags;
      if (v26 >> 28 <= ((v26 >> 24) & 0xF)) {
        uint64_t v27 = v26 >> 28;
      }
      else {
        uint64_t v27 = 0;
      }
      id v28 = v25[v27];
    }
    else
    {
      id v28 = 0;
    }
    objc_msgSend(v28, "setKenBurnsType:", a3, v29);
  }
  objc_sync_exit(self);
}

- (CGPoint)center
{
  mSlideAsset = self->mSlideAsset;
  if (mSlideAsset)
  {
    unint64_t mFlags = self->mFlags;
    unint64_t v4 = mFlags >> 28;
    if (v4 <= ((mFlags >> 24) & 0xF)) {
      unint64_t v5 = (char *)mSlideAsset[v4];
    }
    else {
      unint64_t v5 = (char *)*mSlideAsset;
    }
    id v6 = (const CGPoint *)(v5 + 24);
    p_y = (CGFloat *)(v5 + 32);
  }
  else
  {
    id v6 = &CGPointZero;
    p_y = &CGPointZero.y;
  }
  double v8 = *p_y;
  double x = v6->x;
  result.y = v8;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat x = a3.x;
  mSlideAsset = self->mSlideAsset;
  if (mSlideAsset) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = a3.x == 0.5;
  }
  if (!v5 || a3.y != 0.5)
  {
    CGFloat y = a3.y;
    unint64_t mFlags = self->mFlags;
    unint64_t v10 = mFlags >> 28;
    if (mSlideAsset)
    {
      if (v10 <= ((mFlags >> 24) & 0xF))
      {
LABEL_21:
        double v23 = (CGFloat *)mSlideAsset[self->mFlags >> 28];
        v23[3] = x;
        v23[4] = y;
        return;
      }
      LODWORD(v11) = (BYTE3(mFlags) & 0xF) + 1;
    }
    else
    {
      LODWORD(v11) = 0;
    }
    id v12 = (id *)malloc_type_calloc(v10 + 1, 8uLL, 0x80040B8603338uLL);
    self->mSlideAsset = v12;
    self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
    if (mSlideAsset)
    {
      memcpy(v12, mSlideAsset, 8 * v11);
      free(mSlideAsset);
      id v12 = self->mSlideAsset;
    }
    if (v11)
    {
      double v13 = (double *)v12[(v11 - 1)];
      double v14 = v13[3];
      double v15 = v13[4];
      double v17 = v13[5];
      uint64_t v16 = *((void *)v13 + 6);
      id v18 = [v13 asset];
      id v19 = [self->mSlideAsset[(v11 - 1)] kenBurnsType];
      id v12 = self->mSlideAsset;
    }
    else
    {
      id v18 = 0;
      id v19 = 0;
      uint64_t v16 = 0;
      double v14 = 0.5;
      double v17 = 1.0;
      double v15 = 0.5;
    }
    mSlideAsset = v12;
    if (((self->mFlags >> 24) & 0xF) >= v11)
    {
      unint64_t v20 = v11;
      do
      {
        self->mSlideAsset[v20] = objc_alloc_init(MCSlideAsset);
        double v21 = self->mSlideAsset;
        unint64_t v22 = (double *)v21[v20];
        v22[3] = v14;
        v22[4] = v15;
        *((double *)v21[v20] + 5) = v17;
        *((void *)v21[v20] + 6) = v16;
        [v21[v20] setAsset:v18];
        [v18 addSlide:self];
        [self->mSlideAsset[v20] setKenBurnsType:v19];
        unint64_t v11 = (v11 + 1);
        ++v20;
      }
      while (((self->mFlags >> 24) & 0xF) >= v11);
      mSlideAsset = self->mSlideAsset;
    }
    goto LABEL_21;
  }
}

- (double)scale
{
  mSlideAsset = self->mSlideAsset;
  if (!mSlideAsset) {
    return 0.0;
  }
  unint64_t mFlags = self->mFlags;
  if (mFlags >> 28 <= ((mFlags >> 24) & 0xF)) {
    uint64_t v4 = mFlags >> 28;
  }
  else {
    uint64_t v4 = 0;
  }
  return *((double *)mSlideAsset[v4] + 5);
}

- (void)setScale:(double)a3
{
  mSlideAsset = self->mSlideAsset;
  if (a3 != 1.0 || mSlideAsset != 0)
  {
    unint64_t mFlags = self->mFlags;
    unint64_t v8 = mFlags >> 28;
    if (mSlideAsset)
    {
      if (v8 <= ((mFlags >> 24) & 0xF))
      {
LABEL_18:
        *((double *)mSlideAsset[self->mFlags >> 28] + 5) = a3;
        return;
      }
      LODWORD(v9) = (BYTE3(mFlags) & 0xF) + 1;
    }
    else
    {
      LODWORD(v9) = 0;
    }
    unint64_t v10 = (id *)malloc_type_calloc(v8 + 1, 8uLL, 0x80040B8603338uLL);
    self->mSlideAsset = v10;
    self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
    if (mSlideAsset)
    {
      memcpy(v10, mSlideAsset, 8 * v9);
      free(mSlideAsset);
      unint64_t v10 = self->mSlideAsset;
    }
    if (v9)
    {
      unint64_t v11 = (double *)v10[(v9 - 1)];
      double v12 = v11[3];
      double v13 = v11[4];
      double v15 = v11[5];
      uint64_t v14 = *((void *)v11 + 6);
      id v16 = [v11 asset];
      id v17 = [self->mSlideAsset[(v9 - 1)] kenBurnsType];
      unint64_t v10 = self->mSlideAsset;
    }
    else
    {
      id v16 = 0;
      id v17 = 0;
      uint64_t v14 = 0;
      double v12 = 0.5;
      double v15 = 1.0;
      double v13 = 0.5;
    }
    mSlideAsset = v10;
    if (((self->mFlags >> 24) & 0xF) >= v9)
    {
      unint64_t v18 = v9;
      do
      {
        self->mSlideAsset[v18] = objc_alloc_init(MCSlideAsset);
        id v19 = self->mSlideAsset;
        unint64_t v20 = (double *)v19[v18];
        v20[3] = v12;
        v20[4] = v13;
        *((double *)v19[v18] + 5) = v15;
        *((void *)v19[v18] + 6) = v14;
        [v19[v18] setAsset:v16];
        [v16 addSlide:self];
        [self->mSlideAsset[v18] setKenBurnsType:v17];
        unint64_t v9 = (v9 + 1);
        ++v18;
      }
      while (((self->mFlags >> 24) & 0xF) >= v9);
      mSlideAsset = self->mSlideAsset;
    }
    goto LABEL_18;
  }
}

- (double)rotation
{
  mSlideAsset = self->mSlideAsset;
  if (!mSlideAsset) {
    return 0.0;
  }
  unint64_t mFlags = self->mFlags;
  if (mFlags >> 28 <= ((mFlags >> 24) & 0xF)) {
    uint64_t v4 = mFlags >> 28;
  }
  else {
    uint64_t v4 = 0;
  }
  return *((double *)mSlideAsset[v4] + 6);
}

- (void)setRotation:(double)a3
{
  mSlideAsset = self->mSlideAsset;
  if (a3 != 1.0 || mSlideAsset != 0)
  {
    unint64_t mFlags = self->mFlags;
    unint64_t v8 = mFlags >> 28;
    if (mSlideAsset)
    {
      if (v8 <= ((mFlags >> 24) & 0xF))
      {
LABEL_18:
        *((double *)mSlideAsset[self->mFlags >> 28] + 6) = a3;
        return;
      }
      LODWORD(v9) = (BYTE3(mFlags) & 0xF) + 1;
    }
    else
    {
      LODWORD(v9) = 0;
    }
    unint64_t v10 = (id *)malloc_type_calloc(v8 + 1, 8uLL, 0x80040B8603338uLL);
    self->mSlideAsset = v10;
    self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
    if (mSlideAsset)
    {
      memcpy(v10, mSlideAsset, 8 * v9);
      free(mSlideAsset);
      unint64_t v10 = self->mSlideAsset;
    }
    if (v9)
    {
      unint64_t v11 = (double *)v10[(v9 - 1)];
      double v12 = v11[3];
      double v13 = v11[4];
      double v15 = v11[5];
      uint64_t v14 = *((void *)v11 + 6);
      id v16 = [v11 asset];
      id v17 = [self->mSlideAsset[(v9 - 1)] kenBurnsType];
      unint64_t v10 = self->mSlideAsset;
    }
    else
    {
      id v16 = 0;
      id v17 = 0;
      uint64_t v14 = 0;
      double v12 = 0.5;
      double v15 = 1.0;
      double v13 = 0.5;
    }
    mSlideAsset = v10;
    if (((self->mFlags >> 24) & 0xF) >= v9)
    {
      unint64_t v18 = v9;
      do
      {
        self->mSlideAsset[v18] = objc_alloc_init(MCSlideAsset);
        id v19 = self->mSlideAsset;
        unint64_t v20 = (double *)v19[v18];
        v20[3] = v12;
        v20[4] = v13;
        *((double *)v19[v18] + 5) = v15;
        *((void *)v19[v18] + 6) = v14;
        [v19[v18] setAsset:v16];
        [v16 addSlide:self];
        [self->mSlideAsset[v18] setKenBurnsType:v17];
        unint64_t v9 = (v9 + 1);
        ++v18;
      }
      while (((self->mFlags >> 24) & 0xF) >= v9);
      mSlideAsset = self->mSlideAsset;
    }
    goto LABEL_18;
  }
}

- (MCSong)song
{
  if ([(MCObject *)self isSnapshot]) {
    return self->mSong;
  }
  objc_sync_enter(self);
  id v3 = self->mSong;
  objc_sync_exit(self);
  return v3;
}

- (void)setSongForAsset:(id)a3
{
  if ([(MCSong *)self->mSong asset] != a3)
  {
    objc_sync_enter(self);
    [(MCSlide *)self willChangeValueForKey:@"song"];
    mSong = self->mSong;
    if (mSong)
    {
      [(MCSong *)mSong removeObserver:self forKeyPath:@"builtVolume"];
      [(MCSong *)self->mSong removeObserver:self forKeyPath:@"builtAudio"];
      [(MCSong *)self->mSong setSlideIfSlideSong:0];

      self->mSong = 0;
    }
    if (a3)
    {
      id v6 = [(MCObject *)[MCSong alloc] initFromScratchWithMontage:self->super.mMontage];
      [(MCSong *)v6 setAsset:a3];
      [(MCSong *)v6 setSlideIfSlideSong:self];
      [(MCSong *)v6 addObserver:self forKeyPath:@"builtVolume" options:0 context:0];
      [(MCSong *)v6 addObserver:self forKeyPath:@"builtAudio" options:0 context:0];
      self->mSong = v6;
    }
    [(MCSlide *)self didChangeValueForKey:@"song"];
    objc_sync_exit(self);
  }
}

- (MCPlugSlide)plug
{
  if ([(MCObject *)self isSnapshot]) {
    return self->mPlug;
  }
  objc_sync_enter(self);
  id v3 = self->mPlug;
  objc_sync_exit(self);
  return v3;
}

- (void)setPlug:(id)a3
{
  if (self->mPlug != a3)
  {
    objc_sync_enter(self);
    [(MCPlugSlide *)self->mPlug setParentSlide:0];

    BOOL v5 = (MCPlugSlide *)a3;
    self->mPlug = v5;
    [(MCPlugSlide *)v5 setParentSlide:self];
    objc_sync_exit(self);
  }
}

- (void)undefineStartTime
{
  self->mFlags &= ~1uLL;
}

- (BOOL)startTimeIsDefined
{
  return self->mFlags & 1;
}

- (void)setStartTime:(double)a3
{
  self->mStartTime = a3;
  self->mFlags |= 1uLL;
}

- (void)undefineDuration
{
  self->mFlags &= ~2uLL;
}

- (BOOL)durationIsDefined
{
  return (LOBYTE(self->mFlags) >> 1) & 1;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
  self->mFlags |= 2uLL;
}

- (id)frameAttributeForKey:(id)a3
{
  if ([(MCObject *)self isSnapshot])
  {
    mFrameAttributes = self->mFrameAttributes;
    return [(NSMutableDictionary *)mFrameAttributes objectForKey:a3];
  }
  else
  {
    objc_sync_enter(self);
    id v7 = [(NSMutableDictionary *)self->mFrameAttributes objectForKey:a3];
    objc_sync_exit(self);
    return v7;
  }
}

- (void)setFrameAttribute:(id)a3 forKey:(id)a4
{
  [(MCSlide *)self willChangeValueForKey:@"frameAttributes"];
  objc_sync_enter(self);
  mFrameAttributes = self->mFrameAttributes;
  if (a3)
  {
    if (mFrameAttributes) {
      [(NSMutableDictionary *)mFrameAttributes setObject:a3 forKey:a4];
    }
    else {
      self->mFrameAttributes = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", a3, a4, 0);
    }
  }
  else if (mFrameAttributes)
  {
    [(NSMutableDictionary *)mFrameAttributes removeObjectForKey:a4];
  }
  objc_sync_exit(self);
  [(MCSlide *)self didChangeValueForKey:@"frameAttributes"];
}

- (NSDictionary)frameAttributes
{
  if ([(MCObject *)self isSnapshot]) {
    return &self->mFrameAttributes->super;
  }
  objc_sync_enter(self);
  id v3 = +[NSDictionary dictionaryWithDictionary:self->mFrameAttributes];
  objc_sync_exit(self);
  return v3;
}

- (void)setFrameAttributes:(id)a3
{
  if (self->mFrameAttributes != a3)
  {
    objc_sync_enter(self);

    self->mFrameAttributes = 0;
    if (a3) {
      self->mFrameAttributes = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3];
    }
    objc_sync_exit(self);
  }
}

- (unsigned)countOfLayouts
{
  if (self->mSlideAsset) {
    return (BYTE3(self->mFlags) & 0xF) + 1;
  }
  else {
    return 0;
  }
}

- (unsigned)currentLayoutIndex
{
  return LODWORD(self->mFlags) >> 28;
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  int v3 = a3;
  if (self->mSlideAsset) {
    BOOL v5 = (self->mFlags & 0xF000000) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    self->unint64_t mFlags = (a3 << 28) & 0xFFFFFFFFF0000000 | self->mFlags & 0xFFFFFFF;
  }
  else
  {
    [(MCSlide *)self willChangeValueForKey:@"asset"];
    self->unint64_t mFlags = (v3 << 28) & 0xFFFFFFFFF0000000 | self->mFlags & 0xFFFFFFF;
    [(MCSlide *)self didChangeValueForKey:@"asset"];
  }
}

- (void)_copySelfToSnapshot:(id)a3
{
  objc_sync_enter(self);
  *((void *)a3 + 8) = self->mFlags;
  if (self->mSlideAsset)
  {
    unint64_t v5 = 0;
    *((void *)a3 + 3) = malloc_type_malloc(((self->mFlags >> 21) & 0x78) + 8, 0x7E1C5109uLL);
    mSlideAsset = self->mSlideAsset;
    if (!mSlideAsset) {
      goto LABEL_4;
    }
LABEL_3:
    mSlideAsset = (id *)(((self->mFlags >> 24) & 0xF) + 1);
LABEL_4:
    while (v5 < (unint64_t)mSlideAsset)
    {
      *(void *)(*((void *)a3 + 3) + 8 * v5) = objc_alloc_init(MCSlideAsset);
      objc_msgSend(*(id *)(*((void *)a3 + 3) + 8 * v5), "setAsset:", objc_msgSend(objc_msgSend(self->mSlideAsset[v5], "asset"), "snapshot"));
      objc_msgSend(*(id *)(*((void *)a3 + 3) + 8 * v5), "setKenBurnsType:", objc_msgSend(self->mSlideAsset[v5], "kenBurnsType"));
      *(_OWORD *)(*(void *)(*((void *)a3 + 3) + 8 * v5) + 24) = *(_OWORD *)((char *)self->mSlideAsset[v5] + 24);
      mSlideAsset = self->mSlideAsset;
      uint64_t v7 = *((void *)a3 + 3);
      *(void *)(*(void *)(v7 + 8 * v5) + 40) = *((void *)mSlideAsset[v5] + 5);
      *(void *)(*(void *)(v7 + 8 * v5) + 48) = *((void *)mSlideAsset[v5] + 6);
      ++v5;
      if (mSlideAsset) {
        goto LABEL_3;
      }
    }
  }
  *((void *)a3 + 11) = [(MCObject *)self->mSong snapshot];
  *((void *)a3 + 12) = self->mIndex;
  *((_DWORD *)a3 + 18) = LODWORD(self->mAudioVolume);
  *((void *)a3 + 13) = *(void *)&self->mAudioFadeInDuration;
  *((void *)a3 + 14) = *(void *)&self->mAudioFadeOutDuration;
  *((_DWORD *)a3 + 19) = LODWORD(self->mAudioDuckLevel);
  *((void *)a3 + 15) = *(void *)&self->mAudioDuckInDuration;
  *((void *)a3 + 16) = *(void *)&self->mAudioDuckOutDuration;
  *((void *)a3 + 17) = *(void *)&self->mStartTime;
  *((void *)a3 + 18) = *(void *)&self->mDuration;
  mFrameID = self->mFrameID;
  if (mFrameID) {
    *((void *)a3 + 19) = [(NSString *)mFrameID copy];
  }
  mFrameAttributes = self->mFrameAttributes;
  if (mFrameAttributes) {
    *((void *)a3 + 4) = [(NSMutableDictionary *)mFrameAttributes copy];
  }
  if (self->mAnimationPaths)
  {
    unint64_t v10 = [(MCSlide *)self animationPaths];
    if ([(NSSet *)v10 count])
    {
      *((void *)a3 + 5) = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSSet count](v10, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = [(NSSet *)v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v23;
        do
        {
          double v13 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*((id *)a3 + 5), "addObject:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v13), "snapshot"));
            double v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [(NSSet *)v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v11);
      }
    }
  }
  if (self->mFilters)
  {
    uint64_t v14 = [(MCSlide *)self filters];
    if ([(NSSet *)v14 count])
    {
      *((void *)a3 + 6) = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSSet count](v14, "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v15 = [(NSSet *)v14 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v19;
        do
        {
          id v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(*((id *)a3 + 6), "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v17), "snapshot"));
            id v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [(NSSet *)v14 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v15);
      }
    }
  }
  objc_sync_exit(self);
}

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndeCGFloat x = a3;
}

- (float)audioVolume
{
  return self->mAudioVolume;
}

- (void)setAudioVolume:(float)a3
{
  self->mAudioVolume = a3;
}

- (double)audioFadeInDuration
{
  return self->mAudioFadeInDuration;
}

- (void)setAudioFadeInDuration:(double)a3
{
  self->mAudioFadeInDuration = a3;
}

- (double)audioFadeOutDuration
{
  return self->mAudioFadeOutDuration;
}

- (void)setAudioFadeOutDuration:(double)a3
{
  self->mAudioFadeOutDuration = a3;
}

- (float)audioDuckLevel
{
  return self->mAudioDuckLevel;
}

- (void)setAudioDuckLevel:(float)a3
{
  self->mAudioDuckLevel = a3;
}

- (double)audioDuckInDuration
{
  return self->mAudioDuckInDuration;
}

- (void)setAudioDuckInDuration:(double)a3
{
  self->mAudioDuckInDuration = a3;
}

- (double)audioDuckOutDuration
{
  return self->mAudioDuckOutDuration;
}

- (void)setAudioDuckOutDuration:(double)a3
{
  self->mAudioDuckOutDuration = a3;
}

- (double)startTime
{
  return self->mStartTime;
}

- (double)duration
{
  return self->mDuration;
}

- (NSString)frameID
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFrameID:(id)a3
{
}

- (MCContainerEffect)container
{
  return self->mContainer;
}

- (void)setContainer:(id)a3
{
  self->mContainer = (MCContainerEffect *)a3;
}

- (void)initAnimationPathsWithImprints:(id)a3
{
  if (a3)
  {
    if ([a3 count])
    {
      self->mAnimationPaths = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          unint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(a3);
            }
            id v9 = +[MCObjectLight objectWithImprint:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)];
            [(NSMutableSet *)self->mAnimationPaths addObject:v9];
            if (![(MCObject *)self isSnapshot])
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              CFStringRef v11 = @"keyframes";
              if ((isKindOfClass & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_13;
                }
                [v9 addObserver:self forKeyPath:@"combineOperation" options:0 context:0];
                CFStringRef v11 = @"animationPaths";
              }
              [v9 addObserver:self forKeyPath:v11 options:0 context:0];
            }
LABEL_13:
            unint64_t v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)demolishAnimationPaths
{
  mAnimationPaths = self->mAnimationPaths;
  if (mAnimationPaths)
  {
    obj = mAnimationPaths;
    objc_sync_enter(mAnimationPaths);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = self->mAnimationPaths;
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v5) {
      goto LABEL_14;
    }
    uint64_t v6 = *(void *)v14;
    while (1)
    {
      for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        unint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![(MCObject *)self isSnapshot])
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          CFStringRef v10 = @"keyframes";
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_12;
            }
            [v8 removeObserver:self forKeyPath:@"combineOperation"];
            CFStringRef v10 = @"animationPaths";
          }
          [v8 removeObserver:self forKeyPath:v10];
        }
LABEL_12:
        [v8 demolish];
      }
      id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (!v5)
      {
LABEL_14:
        objc_sync_enter(self);
        CFStringRef v11 = self->mAnimationPaths;
        self->mAnimationPaths = 0;
        objc_sync_exit(self);
        objc_sync_exit(obj);
        return;
      }
    }
  }
}

- (id)imprintsForAnimationPaths
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(MCSlide *)self animationPaths];
  id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      unint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "imprint"));
        unint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSSet)animationPaths
{
  id v3 = (NSSet *)sEmptySet;
  unsigned __int8 v4 = [(MCObject *)self isSnapshot];
  mAnimationPaths = self->mAnimationPaths;
  if ((v4 & 1) == 0)
  {
    if (mAnimationPaths)
    {
      objc_sync_enter(self->mAnimationPaths);
      if ([(NSMutableSet *)self->mAnimationPaths count]) {
        id v3 = (NSSet *)[objc_alloc((Class)NSSet) initWithSet:self->mAnimationPaths];
      }
      objc_sync_exit(mAnimationPaths);
    }
    return v3;
  }
  return &mAnimationPaths->super;
}

- (unint64_t)countOfAnimationPaths
{
  unsigned int v3 = [(MCObject *)self isSnapshot];
  mAnimationPaths = self->mAnimationPaths;
  if (v3)
  {
    id v5 = self->mAnimationPaths;
    return (unint64_t)[(NSMutableSet *)v5 count];
  }
  else
  {
    if (!mAnimationPaths) {
      return 0;
    }
    objc_sync_enter(self->mAnimationPaths);
    id v7 = [(NSMutableSet *)self->mAnimationPaths count];
    objc_sync_exit(mAnimationPaths);
    return (unint64_t)v7;
  }
}

- (id)animationPathForKey:(id)a3
{
  if ([(MCObject *)self isSnapshot])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    mAnimationPaths = self->mAnimationPaths;
    id v6 = [(NSMutableSet *)mAnimationPaths countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(mAnimationPaths);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        if (objc_msgSend(objc_msgSend(v9, "key"), "isEqualToString:", a3)) {
          return v9;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [(NSMutableSet *)mAnimationPaths countByEnumeratingWithState:&v21 objects:v26 count:16];
          id v9 = 0;
          if (v6) {
            goto LABEL_4;
          }
          return v9;
        }
      }
    }
    return 0;
  }
  long long v10 = self->mAnimationPaths;
  if (!v10) {
    return 0;
  }
  objc_sync_enter(self->mAnimationPaths);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = self->mAnimationPaths;
  id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (unint64_t i = 0; i != v12; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v9, "key"), "isEqualToString:", a3))
        {
          if (v9) {
            id v15 = v9;
          }
          goto LABEL_24;
        }
      }
      id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_24:
  objc_sync_exit(v10);
  return v9;
}

- (void)addAnimationPath:(id)a3
{
  -[MCSlide removeAnimationPathForKey:](self, "removeAnimationPathForKey:", [a3 key]);
  if (!self->mAnimationPaths)
  {
    objc_sync_enter(self);
    self->mAnimationPaths = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objc_sync_exit(self);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", a3, 0);
  -[MCSlide willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", @"animationPaths", 1);
  mAnimationPaths = self->mAnimationPaths;
  objc_sync_enter(mAnimationPaths);
  [(NSMutableSet *)self->mAnimationPaths addObject:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v6 = @"keyframes";
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    [a3 addObserver:self forKeyPath:@"combineOperation" options:0 context:0];
    CFStringRef v6 = @"animationPaths";
  }
  [a3 addObserver:self forKeyPath:v6 options:0 context:0];
LABEL_8:
  objc_sync_exit(mAnimationPaths);
  [(MCSlide *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v7];
}

- (void)removeAnimationPathForKey:(id)a3
{
  mAnimationPaths = self->mAnimationPaths;
  if (!mAnimationPaths) {
    return;
  }
  objc_sync_enter(self->mAnimationPaths);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CFStringRef v6 = self->mAnimationPaths;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = *(void *)v15;
  while (2)
  {
    for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v6);
      }
      long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if (objc_msgSend(objc_msgSend(v10, "key"), "isEqualToString:", a3))
      {
        if (!v10) {
          goto LABEL_14;
        }
        id v11 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFStringRef v12 = @"keyframes";
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_18:
            id v13 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v10, 0);
            [(MCSlide *)self willChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v13];
            [(NSMutableSet *)self->mAnimationPaths removeObject:v10];
            objc_sync_exit(mAnimationPaths);
            [(MCSlide *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v13];

            return;
          }
          [v10 removeObserver:self forKeyPath:@"combineOperation"];
          CFStringRef v12 = @"animationPaths";
        }
        [v10 removeObserver:self forKeyPath:v12];
        goto LABEL_18;
      }
    }
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_14:
  objc_sync_exit(mAnimationPaths);
}

- (void)removeAllAnimationPaths
{
  if ([(NSMutableSet *)self->mAnimationPaths count])
  {
    obj = self->mAnimationPaths;
    objc_sync_enter(obj);
    id v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", -[NSMutableSet allObjects](self->mAnimationPaths, "allObjects"));
    [(MCSlide *)self willChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    mAnimationPaths = self->mAnimationPaths;
    id v5 = [(NSMutableSet *)mAnimationPaths countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v5) {
      goto LABEL_13;
    }
    uint64_t v6 = *(void *)v13;
    while (1)
    {
      for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(mAnimationPaths);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        CFStringRef v10 = @"keyframes";
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v8 removeObserver:self forKeyPath:@"combineOperation"];
          CFStringRef v10 = @"animationPaths";
        }
        [v8 removeObserver:self forKeyPath:v10];
      }
      id v5 = [(NSMutableSet *)mAnimationPaths countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v5)
      {
LABEL_13:
        [(NSMutableSet *)self->mAnimationPaths removeAllObjects];
        objc_sync_exit(obj);
        [(MCSlide *)self didChangeValueForKey:@"animationPaths" withSetMutation:1 usingObjects:v3];

        return;
      }
    }
  }
}

- (void)initFiltersWithImprints:(id)a3
{
  if (a3)
  {
    if ([a3 count])
    {
      self->mFilters = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(a3);
            }
            id v9 = +[MCObject objectWithImprint:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) andMontage:self->super.mMontage];
            [(NSMutableSet *)self->mFilters addObject:v9];
            if (![(MCObject *)self isSnapshot]) {
              [(MCSlide *)self observeFilter:v9];
            }
            uint64_t v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)demolishFilters
{
  mFilters = self->mFilters;
  if (mFilters)
  {
    objc_sync_enter(self->mFilters);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unsigned __int8 v4 = self->mFilters;
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (![(MCObject *)self isSnapshot]) {
            [(MCSlide *)self unobserveFilter:v8];
          }
          [v8 demolish];
        }
        id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    if (self->mFilters)
    {
      objc_sync_enter(self);
      id v9 = self->mFilters;
      self->mFilters = 0;
      objc_sync_exit(self);
    }
    objc_sync_exit(mFilters);
  }
}

- (id)imprintsForFilters
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned __int8 v4 = [(MCSlide *)self filters];
  id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "imprint"));
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSArray)orderedFilters
{
  if ([(MCObject *)self isSnapshot])
  {
    mCachedOrderedFilters = self->mCachedOrderedFilters;
    if (!mCachedOrderedFilters)
    {
      id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"index" ascending:1];
      self->mCachedOrderedFilters = (NSArray *)objc_msgSend(-[NSMutableSet allObjects](self->mFilters, "allObjects"), "sortedArrayUsingDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));

      return self->mCachedOrderedFilters;
    }
  }
  else
  {
    mFilters = self->mFilters;
    if (mFilters)
    {
      objc_sync_enter(self->mFilters);
      id v6 = self->mCachedOrderedFilters;
      if (!v6)
      {
        id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"index" ascending:1];
        self->mCachedOrderedFilters = (NSArray *)objc_msgSend(-[NSMutableSet allObjects](self->mFilters, "allObjects"), "sortedArrayUsingDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v7));

        id v6 = self->mCachedOrderedFilters;
      }
      mCachedOrderedFilters = v6;
      objc_sync_exit(mFilters);
    }
    else
    {
      return 0;
    }
  }
  return mCachedOrderedFilters;
}

- (NSSet)filters
{
  id v3 = (NSSet *)sEmptySet;
  unsigned __int8 v4 = [(MCObject *)self isSnapshot];
  mFilters = self->mFilters;
  if ((v4 & 1) == 0)
  {
    if (mFilters)
    {
      objc_sync_enter(self->mFilters);
      if ([(NSMutableSet *)self->mFilters count]) {
        id v3 = (NSSet *)[objc_alloc((Class)NSSet) initWithSet:self->mFilters];
      }
      objc_sync_exit(mFilters);
    }
    return v3;
  }
  return &mFilters->super;
}

- (unint64_t)countOfFilters
{
  unsigned int v3 = [(MCObject *)self isSnapshot];
  mFilters = self->mFilters;
  if (v3)
  {
    id v5 = self->mFilters;
    return (unint64_t)[(NSMutableSet *)v5 count];
  }
  else
  {
    if (!mFilters) {
      return 0;
    }
    objc_sync_enter(self->mFilters);
    id v7 = [(NSMutableSet *)self->mFilters count];
    objc_sync_exit(mFilters);
    return (unint64_t)v7;
  }
}

- (id)filterAtIndex:(unint64_t)a3
{
  if (![(MCObject *)self isSnapshot])
  {
    mFilters = self->mFilters;
    if (mFilters)
    {
      objc_sync_enter(self->mFilters);
      mCachedOrderedFilters = self->mCachedOrderedFilters;
      if (mCachedOrderedFilters)
      {
        id v9 = [(NSArray *)mCachedOrderedFilters objectAtIndex:a3];
LABEL_29:
        long long v14 = v9;
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v15 = self->mFilters;
        id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v21;
          while (2)
          {
            for (unint64_t i = 0; i != v16; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v21 != v17) {
                objc_enumerationMutation(v15);
              }
              long long v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              if ([v19 index] == (id)a3)
              {
                id v9 = v19;
                goto LABEL_29;
              }
            }
            id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
            long long v14 = 0;
            if (v16) {
              continue;
            }
            break;
          }
        }
        else
        {
          long long v14 = 0;
        }
      }
      objc_sync_exit(mFilters);
      return v14;
    }
    return 0;
  }
  id v5 = self->mCachedOrderedFilters;
  if (!v5)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v10 = self->mFilters;
    id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
LABEL_11:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        if ([v14 index] == (id)a3) {
          return v14;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
          long long v14 = 0;
          if (v11) {
            goto LABEL_11;
          }
          return v14;
        }
      }
    }
    return 0;
  }
  return [(NSArray *)v5 objectAtIndex:a3];
}

- (id)addFilterWithFilterID:(id)a3
{
  unint64_t v5 = [(MCSlide *)self countOfFilters];
  return [(MCSlide *)self insertFilterWithFilterID:a3 atIndex:v5];
}

- (id)insertFilterWithFilterID:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = [(MCObject *)[MCFilter alloc] initFromScratchWithMontage:self->super.mMontage];
  [v7 setFilterID:a3];
  [v7 setIndex:a4];
  if (!self->mFilters)
  {
    objc_sync_enter(self);
    self->mFilters = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objc_sync_exit(self);
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v7, 0);
  [(MCSlide *)self willChangeValueForKey:@"filters" withSetMutation:1 usingObjects:v8];
  obj = self->mFilters;
  objc_sync_enter(obj);

  self->mCachedOrderedFilters = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  mFilters = self->mFilters;
  id v10 = [(NSMutableSet *)mFilters countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(mFilters);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((unint64_t)[v13 index] >= a4) {
          objc_msgSend(v13, "setIndex:", (char *)objc_msgSend(v13, "index") + 1);
        }
      }
      id v10 = [(NSMutableSet *)mFilters countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  [(NSMutableSet *)self->mFilters addObject:v7];
  [(MCSlide *)self observeFilter:v7];
  objc_sync_exit(obj);
  [(MCSlide *)self didChangeValueForKey:@"filters" withSetMutation:1 usingObjects:v8];

  return v7;
}

- (void)removeFiltersAtIndices:(id)a3
{
  mFilters = self->mFilters;
  if (mFilters)
  {
    obj = mFilters;
    objc_sync_enter(mFilters);
    id v6 = objc_alloc_init((Class)NSMutableSet);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->mFilters;
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v11, "index")))
          {
            [(MCSlide *)self unobserveFilter:v11];
            [v6 addObject:v11];
          }
          else
          {
            objc_msgSend(v11, "setIndex:", (unsigned char *)objc_msgSend(v11, "index")- (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v11, "index")));
          }
        }
        id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [(MCSlide *)self willChangeValueForKey:@"filters" withSetMutation:2 usingObjects:v6];

    self->mCachedOrderedFilters = 0;
    [(NSMutableSet *)self->mFilters minusSet:v6];
    objc_sync_exit(obj);
    [(MCSlide *)self didChangeValueForKey:@"filters" withSetMutation:2 usingObjects:v6];
  }
}

- (void)removeAllFilters
{
  unsigned int v3 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(MCSlide *)self countOfFilters]);
  [(MCSlide *)self removeFiltersAtIndices:v3];
}

- (void)moveFiltersAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  if (self->mFilters)
  {
    [(MCSlide *)self willChangeValueForKey:@"orderedFilters"];
    mFilters = self->mFilters;
    objc_sync_enter(mFilters);

    self->mCachedOrderedFilters = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = self->mFilters;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
          {
            objc_msgSend(v12, "setIndex:", (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
          }
          else
          {
            long long v13 = [v12 index];
            unint64_t v14 = v13 - (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
            if (v14 >= a4) {
              v14 += (unint64_t)[a3 count];
            }
            [v12 setIndex:v14];
          }
        }
        id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    objc_sync_exit(mFilters);
    [(MCSlide *)self didChangeValueForKey:@"orderedFilters"];
  }
}

- (void)observeFilter:(id)a3
{
  [a3 addObserver:self forKeyPath:@"index" options:0 context:0];
  [a3 addObserver:self forKeyPath:@"filterID" options:0 context:0];
  [a3 addObserver:self forKeyPath:@"attributes" options:0 context:0];
  [a3 addObserver:self forKeyPath:@"animationPaths" options:0 context:0];
}

- (void)unobserveFilter:(id)a3
{
  [a3 removeObserver:self forKeyPath:@"index"];
  [a3 removeObserver:self forKeyPath:@"filterID"];
  [a3 removeObserver:self forKeyPath:@"attributes"];
  [a3 removeObserver:self forKeyPath:@"animationPaths"];
}

@end