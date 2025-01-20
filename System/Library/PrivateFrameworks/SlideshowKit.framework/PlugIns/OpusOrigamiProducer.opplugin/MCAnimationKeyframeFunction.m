@interface MCAnimationKeyframeFunction
+ (id)keyframeWithFunction:(id)a3 atTime:(double)a4 offsetKind:(int)a5 forDuration:(double)a6;
- (MCAnimationKeyframeFunction)init;
- (MCAnimationKeyframeFunction)initWithImprint:(id)a3;
- (NSDictionary)functionParameters;
- (NSString)function;
- (double)duration;
- (double)functionTimeFactor;
- (double)functionTimeOffset;
- (float)innerEaseInControl;
- (float)innerEaseOutControl;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setDuration:(double)a3;
- (void)setFunction:(id)a3;
- (void)setFunctionParameters:(id)a3;
- (void)setFunctionTimeFactor:(double)a3;
- (void)setFunctionTimeOffset:(double)a3;
- (void)setInnerEaseInControl:(float)a3;
- (void)setInnerEaseOutControl:(float)a3;
@end

@implementation MCAnimationKeyframeFunction

+ (id)keyframeWithFunction:(id)a3 atTime:(double)a4 offsetKind:(int)a5 forDuration:(double)a6
{
  uint64_t v7 = *(void *)&a5;
  v10 = objc_alloc_init(MCAnimationKeyframeFunction);
  [(MCAnimationKeyframe *)v10 setTimeOffset:a4];
  [(MCAnimationKeyframe *)v10 setTimeOffsetKind:v7];
  [(MCAnimationKeyframeFunction *)v10 setDuration:a6];
  [(MCAnimationKeyframeFunction *)v10 setFunction:a3];
  return v10;
}

- (MCAnimationKeyframeFunction)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCAnimationKeyframeFunction;
  result = [(MCAnimationKeyframeFunction *)&v3 init];
  if (result)
  {
    result->mFunctionTimeFactor = 1.0;
    result->mInnerEaseOutControl = 1.0;
  }
  return result;
}

- (MCAnimationKeyframeFunction)initWithImprint:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MCAnimationKeyframeFunction;
  v4 = -[MCAnimationKeyframe initWithImprint:](&v15, "initWithImprint:");
  if (v4)
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duration"), "doubleValue");
    v4->mDuration = v5;
    v4->mFunction = (NSString *)[a3 objectForKey:@"functionString"];
    v4->mFunctionParameters = (NSDictionary *)[a3 objectForKey:@"parameters"];
    id v6 = [a3 objectForKey:@"offset"];
    if (v6) {
      [v6 doubleValue];
    }
    else {
      double v7 = 0.0;
    }
    v4->mFunctionTimeOffset = v7;
    id v8 = [a3 objectForKey:@"factor"];
    if (v8) {
      [v8 doubleValue];
    }
    else {
      double v9 = 1.0;
    }
    v4->mFunctionTimeFactor = v9;
    id v10 = [a3 objectForKey:@"innerEaseInControl"];
    if (v10) {
      [v10 floatValue];
    }
    else {
      float v11 = 0.0;
    }
    v4->mInnerEaseInControl = v11;
    id v12 = [a3 objectForKey:@"innerEaseOutControl"];
    if (v12) {
      [v12 floatValue];
    }
    else {
      float v13 = 1.0;
    }
    v4->mInnerEaseOutControl = v13;
  }
  return v4;
}

- (void)demolish
{
  self->mFunction = 0;
  self->mFunctionParameters = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCAnimationKeyframeFunction;
  [(MCAnimationKeyframe *)&v3 demolish];
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)MCAnimationKeyframeFunction;
  id v3 = [(MCAnimationKeyframe *)&v7 imprint];
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->mDuration), @"duration");
  mFunction = self->mFunction;
  if (mFunction) {
    [v3 setObject:mFunction forKey:@"functionString"];
  }
  mFunctionParameters = self->mFunctionParameters;
  if (mFunctionParameters) {
    [v3 setObject:mFunctionParameters forKey:@"parameters"];
  }
  if (self->mFunctionTimeOffset != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"offset");
  }
  if (self->mFunctionTimeFactor != 1.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"factor");
  }
  if (self->mInnerEaseInControl != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"innerEaseInControl");
  }
  if (self->mInnerEaseOutControl != 1.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"innerEaseOutControl");
  }
  return v3;
}

- (void)setDuration:(double)a3
{
  if (self->mDuration != a3)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mDuration = a3;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (NSString)function
{
  if ([(MCAnimationKeyframe *)self isSnapshot]) {
    return self->mFunction;
  }
  objc_sync_enter(self);
  id v3 = self->mFunction;
  objc_sync_exit(self);
  return v3;
}

- (void)setFunction:(id)a3
{
  if (([a3 isEqualToString:self->mFunction] & 1) == 0)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    objc_sync_enter(self);

    self->mFunction = (NSString *)[a3 copy];
    objc_sync_exit(self);
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (NSDictionary)functionParameters
{
  if ([(MCAnimationKeyframe *)self isSnapshot]) {
    return self->mFunctionParameters;
  }
  objc_sync_enter(self);
  id v3 = self->mFunctionParameters;
  objc_sync_exit(self);
  return v3;
}

- (void)setFunctionParameters:(id)a3
{
  if (([a3 isEqualToDictionary:self->mFunctionParameters] & 1) == 0)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    objc_sync_enter(self);

    self->mFunctionParameters = (NSDictionary *)a3;
    objc_sync_exit(self);
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setFunctionTimeOffset:(double)a3
{
  if (self->mFunctionTimeOffset != a3)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mFunctionTimeOffset = a3;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setFunctionTimeFactor:(double)a3
{
  if (self->mFunctionTimeFactor != a3)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mFunctionTimeFactor = a3;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setInnerEaseInControl:(float)a3
{
  if (self->mInnerEaseInControl != a3)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mInnerEaseInControl = a3;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setInnerEaseOutControl:(float)a3
{
  if (self->mInnerEaseOutControl != a3)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mInnerEaseOutControl = a3;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (id)description
{
  mFunction = self->mFunction;
  [(MCAnimationKeyframe *)self timeOffset];
  uint64_t v5 = v4;
  [(MCAnimationKeyframe *)self timeOffset];
  return +[NSString stringWithFormat:@"function '%@' from %f to %f with time mapping (%f,%f), easeIn %f and easeOut %f", mFunction, v5, v6 + self->mDuration, *(void *)&self->mFunctionTimeOffset, *(void *)&self->mFunctionTimeFactor, self->mInnerEaseInControl, self->mInnerEaseOutControl];
}

- (void)_copySelfToSnapshot:(id)a3
{
  objc_sync_enter(self);
  v7.receiver = self;
  v7.super_class = (Class)MCAnimationKeyframeFunction;
  [(MCAnimationKeyframe *)&v7 _copySelfToSnapshot:a3];
  *((void *)a3 + 6) = *(void *)&self->mDuration;
  mFunction = self->mFunction;
  if (mFunction) {
    *((void *)a3 + 7) = [(NSString *)mFunction copy];
  }
  mFunctionParameters = self->mFunctionParameters;
  if (mFunctionParameters) {
    *((void *)a3 + 8) = [(NSDictionary *)mFunctionParameters copy];
  }
  *((void *)a3 + 9) = *(void *)&self->mFunctionTimeOffset;
  *((void *)a3 + 10) = *(void *)&self->mFunctionTimeFactor;
  *((_DWORD *)a3 + 10) = LODWORD(self->mInnerEaseInControl);
  *((_DWORD *)a3 + 11) = LODWORD(self->mInnerEaseOutControl);
  objc_sync_exit(self);
}

- (double)duration
{
  return self->mDuration;
}

- (double)functionTimeOffset
{
  return self->mFunctionTimeOffset;
}

- (double)functionTimeFactor
{
  return self->mFunctionTimeFactor;
}

- (float)innerEaseInControl
{
  return self->mInnerEaseInControl;
}

- (float)innerEaseOutControl
{
  return self->mInnerEaseOutControl;
}

@end