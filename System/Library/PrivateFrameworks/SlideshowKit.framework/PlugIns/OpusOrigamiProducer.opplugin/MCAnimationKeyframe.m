@interface MCAnimationKeyframe
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)isSnapshot;
- (MCAnimationKeyframe)initWithImprint:(id)a3;
- (MCAnimationPathKeyframed)animationPath;
- (double)timeOffset;
- (float)postControl;
- (float)preControl;
- (id)description;
- (id)imprint;
- (int)timeOffsetKind;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAnimationPath:(id)a3;
- (void)setPostControl:(float)a3;
- (void)setPreControl:(float)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimeOffsetKind:(int)a3;
@end

@implementation MCAnimationKeyframe

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"timing"]) {
    return +[NSSet setWithObjects:@"timeOffset", @"timeOffsetKind", @"timeOffsetArgument", @"preControl", @"postControl", 0];
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCAnimationKeyframe;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCAnimationKeyframe)initWithImprint:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MCAnimationKeyframe;
  v4 = -[MCObjectLight initWithImprint:](&v13, "initWithImprint:");
  if (v4)
  {
    id v5 = [a3 objectForKey:@"timeOffset"];
    if (v5) {
      [v5 doubleValue];
    }
    else {
      double v6 = 0.0;
    }
    v4->mTimeOffset = v6;
    v4->mTimeOffsetKind = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"timeOffsetKind"), "intValue");
    id v7 = [a3 objectForKey:@"preControl"];
    float v8 = 0.0;
    float v9 = 0.0;
    if (v7) {
      objc_msgSend(v7, "floatValue", 0.0);
    }
    v4->mPreControl = v9;
    id v10 = [a3 objectForKey:@"postControl"];
    if (v10)
    {
      [v10 floatValue];
      float v8 = v11;
    }
    v4->mPostControl = v8;
  }
  return v4;
}

- (void)demolish
{
  self->mAnimationPath = 0;
}

- (id)imprint
{
  v5.receiver = self;
  v5.super_class = (Class)MCAnimationKeyframe;
  id v3 = [(MCObjectLight *)&v5 imprint];
  if (self->mTimeOffset != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"timeOffset");
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->mTimeOffsetKind), @"timeOffsetKind");
  if (self->mPreControl != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"preControl");
  }
  if (self->mPostControl != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"postControl");
  }
  return v3;
}

- (void)setTimeOffset:(double)a3
{
  if (self->mTimeOffset != a3)
  {
    [(MCAnimationPathKeyframed *)self->mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mTimeOffset = a3;
    mAnimationPath = self->mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setTimeOffsetKind:(int)a3
{
  if (self->mTimeOffsetKind != a3)
  {
    [(MCAnimationPathKeyframed *)self->mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mTimeOffsetKind = a3;
    mAnimationPath = self->mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setPreControl:(float)a3
{
  if (self->mPreControl != a3)
  {
    [(MCAnimationPathKeyframed *)self->mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mPreControl = a3;
    mAnimationPath = self->mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setPostControl:(float)a3
{
  if (self->mPostControl != a3)
  {
    [(MCAnimationPathKeyframed *)self->mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mPostControl = a3;
    mAnimationPath = self->mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (id)description
{
  uint64_t v3 = [(MCAnimationKeyframe *)self timeOffsetKind];
  [(MCAnimationKeyframe *)self timeOffset];
  uint64_t v5 = v4;
  [(MCAnimationKeyframe *)self preControl];
  double v7 = v6;
  [(MCAnimationKeyframe *)self postControl];
  return +[NSString stringWithFormat:@"MCAnimationKeyframe: self=%p, timeOffsetKind=%d, timeOffset=%.3f, pretangent=%.3f, posttangent=%.3f", self, v3, v5, *(void *)&v7, v8];
}

- (void)_copySelfToSnapshot:(id)a3
{
  objc_sync_enter(self);
  *((void *)a3 + 4) = *(void *)&self->mTimeOffset;
  *((_DWORD *)a3 + 5) = self->mTimeOffsetKind;
  *((_DWORD *)a3 + 6) = LODWORD(self->mPreControl);
  *((_DWORD *)a3 + 7) = LODWORD(self->mPostControl);
  *((unsigned char *)a3 + 16) = 1;
  objc_sync_exit(self);
}

- (double)timeOffset
{
  return self->mTimeOffset;
}

- (int)timeOffsetKind
{
  return self->mTimeOffsetKind;
}

- (float)preControl
{
  return self->mPreControl;
}

- (float)postControl
{
  return self->mPostControl;
}

- (MCAnimationPathKeyframed)animationPath
{
  return self->mAnimationPath;
}

- (void)setAnimationPath:(id)a3
{
  self->mAnimationPath = (MCAnimationPathKeyframed *)a3;
}

- (BOOL)isSnapshot
{
  return self->mIsSnapshot;
}

@end