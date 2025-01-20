@interface MCSong
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)durationIsDefined;
- (BOOL)startTimeIsDefined;
- (MCAssetAudio)asset;
- (MCAudioPlaylist)audioPlaylistIfAudioPlaylistSong;
- (MCSlide)slideIfSlideSong;
- (MCSong)init;
- (MCSong)initWithImprint:(id)a3 andMontage:(id)a4;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)startTime;
- (float)volume;
- (id)imprint;
- (unint64_t)index;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAsset:(id)a3;
- (void)setAudioPlaylistIfAudioPlaylistSong:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setSlideIfSlideSong:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setVolume:(float)a3;
- (void)undefineDuration;
- (void)undefineStartTime;
@end

@implementation MCSong

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"builtVolume"]) {
    return +[NSSet setWithObjects:@"volume", @"fadeInDuration", @"fadeOutDuration", 0, v7];
  }
  if ([a3 isEqualToString:@"builtAudio"])
  {
    CFStringRef v6 = @"builtVolume";
    uint64_t v7 = 0;
  }
  else
  {
    if (![a3 isEqualToString:@"audioNoVolume"])
    {
      v8.receiver = a1;
      v8.super_class = (Class)&OBJC_METACLASS___MCSong;
      return objc_msgSendSuper2(&v8, "keyPathsForValuesAffectingValueForKey:", a3);
    }
    CFStringRef v6 = 0;
  }
  return +[NSSet setWithObjects:@"asset", @"startTime", @"duration", v6, v7];
}

- (MCSong)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCSong;
  result = [(MCSong *)&v3 init];
  if (result) {
    result->mVolume = 1.0;
  }
  return result;
}

- (MCSong)initWithImprint:(id)a3 andMontage:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)MCSong;
  CFStringRef v6 = -[MCObject initWithImprint:andMontage:](&v23, "initWithImprint:andMontage:");
  uint64_t v7 = v6;
  if (v6)
  {
    if ([(MCObject *)v6 isSnapshot]) {
      objc_super v8 = +[MCObject objectWithImprint:andMontage:](MCObject, "objectWithImprint:andMontage:", [a3 objectForKey:@"asset"], a4);
    }
    else {
      objc_super v8 = -[MCMontage audioAssetForObjectID:](v7->super.mMontage, "audioAssetForObjectID:", [a3 objectForKey:@"assetID"]);
    }
    v9 = v8;
    v7->mAsset = (MCAssetAudio *)v9;
    [(MCObject *)v9 addSong:v7];
    id v10 = [a3 objectForKey:@"volume"];
    if (v10) {
      [v10 floatValue];
    }
    else {
      float v11 = 1.0;
    }
    v7->mVolume = v11;
    id v12 = [a3 objectForKey:@"fadeInDuration"];
    double v13 = 0.0;
    double v14 = 0.0;
    if (v12) {
      objc_msgSend(v12, "doubleValue", 0.0);
    }
    v7->mFadeInDuration = v14;
    id v15 = [a3 objectForKey:@"fadeOutDuration"];
    if (v15)
    {
      [v15 doubleValue];
      double v13 = v16;
    }
    v7->mFadeOutDuration = v13;
    id v17 = [a3 objectForKey:@"index"];
    if (v17) {
      id v17 = [v17 unsignedIntegerValue];
    }
    v7->mIndex = (unint64_t)v17;
    id v18 = [a3 objectForKey:@"startTime"];
    v7->mStartTimeIsDefined = v18 != 0;
    if (v18)
    {
      [v18 doubleValue];
      v7->mStartTime = v19;
    }
    id v20 = [a3 objectForKey:@"duration"];
    v7->mDurationIsDefined = v20 != 0;
    if (v20)
    {
      [v20 doubleValue];
      v7->mDuration = v21;
    }
  }
  return v7;
}

- (void)demolish
{
  if (self->mAsset)
  {
    objc_sync_enter(self);
    if (![(MCObject *)self isSnapshot]) {
      [(MCAssetAudio *)self->mAsset removeSong:self];
    }

    self->mAsset = 0;
    objc_sync_exit(self);
  }
  self->mAudioPlaylistIfAudioPlaylistSong = 0;
  self->mSlideIfSlideSong = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCSong;
  [(MCObject *)&v3 demolish];
}

- (id)imprint
{
  v11.receiver = self;
  v11.super_class = (Class)MCSong;
  id v3 = [(MCObject *)&v11 imprint];
  mAsset = self->mAsset;
  if (mAsset)
  {
    v5 = [(MCObject *)mAsset objectID];
    CFStringRef v6 = self->mAsset;
    if (v5)
    {
      uint64_t v7 = [(MCAsset *)v6 imprint];
      CFStringRef v8 = @"asset";
    }
    else
    {
      uint64_t v7 = [(MCObject *)v6 objectID];
      CFStringRef v8 = @"assetID";
    }
    [v3 setObject:v7 forKey:v8];
  }
  float mVolume = self->mVolume;
  if (mVolume != 1.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", mVolume), @"volume");
  }
  if (self->mFadeInDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"fadeInDuration");
  }
  if (self->mFadeOutDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"fadeOutDuration");
  }
  if (self->mIndex) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"), @"index");
  }
  if (self->mStartTimeIsDefined) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->mStartTime), @"startTime");
  }
  if (self->mDurationIsDefined) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->mDuration), @"duration");
  }
  return v3;
}

- (MCAssetAudio)asset
{
  if ([(MCObject *)self isSnapshot]) {
    return self->mAsset;
  }
  objc_sync_enter(self);
  id v3 = self->mAsset;
  objc_sync_exit(self);
  return v3;
}

- (void)setAsset:(id)a3
{
  if (self->mAsset != a3)
  {
    objc_sync_enter(self);
    mAsset = self->mAsset;
    if (mAsset)
    {
      [(MCAssetAudio *)mAsset removeSong:self];
    }
    if (a3)
    {
      CFStringRef v6 = (MCAssetAudio *)a3;
      self->mAsset = v6;
      [(MCAssetAudio *)v6 addSong:self];
    }
    objc_sync_exit(self);
  }
}

- (void)undefineStartTime
{
  self->mStartTimeIsDefined = 0;
}

- (void)setStartTime:(double)a3
{
  self->mStartTime = a3;
  self->mStartTimeIsDefined = 1;
}

- (void)undefineDuration
{
  self->mDurationIsDefined = 0;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
  self->mDurationIsDefined = 1;
}

- (void)_copySelfToSnapshot:(id)a3
{
  objc_sync_enter(self);
  *((void *)a3 + 4) = [(MCObject *)self->mAsset snapshot];
  *((_DWORD *)a3 + 7) = LODWORD(self->mVolume);
  *((void *)a3 + 5) = *(void *)&self->mFadeInDuration;
  *((void *)a3 + 6) = *(void *)&self->mFadeOutDuration;
  *((void *)a3 + 7) = self->mIndex;
  *((void *)a3 + 8) = *(void *)&self->mStartTime;
  *((unsigned char *)a3 + 24) = self->mStartTimeIsDefined;
  *((void *)a3 + 9) = *(void *)&self->mDuration;
  *((unsigned char *)a3 + 25) = self->mDurationIsDefined;
  objc_sync_exit(self);
}

- (float)volume
{
  return self->mVolume;
}

- (void)setVolume:(float)a3
{
  self->float mVolume = a3;
}

- (double)fadeInDuration
{
  return self->mFadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->mFadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->mFadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->mFadeOutDuration = a3;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (double)startTime
{
  return self->mStartTime;
}

- (BOOL)startTimeIsDefined
{
  return self->mStartTimeIsDefined;
}

- (double)duration
{
  return self->mDuration;
}

- (BOOL)durationIsDefined
{
  return self->mDurationIsDefined;
}

- (MCAudioPlaylist)audioPlaylistIfAudioPlaylistSong
{
  return self->mAudioPlaylistIfAudioPlaylistSong;
}

- (void)setAudioPlaylistIfAudioPlaylistSong:(id)a3
{
  self->mAudioPlaylistIfAudioPlaylistSong = (MCAudioPlaylist *)a3;
}

- (MCSlide)slideIfSlideSong
{
  return self->mSlideIfSlideSong;
}

- (void)setSlideIfSlideSong:(id)a3
{
  self->mSlideIfSlideSong = (MCSlide *)a3;
}

@end