@interface MCAnimationKeyframe1D
+ (id)keyframeWithScalar:(float)a3 atTime:(double)a4;
+ (id)keyframeWithScalar:(float)a3 atTime:(double)a4 offsetKind:(int)a5;
- (MCAnimationKeyframe1D)initWithImprint:(id)a3;
- (float)value;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)setValue:(float)a3;
@end

@implementation MCAnimationKeyframe1D

+ (id)keyframeWithScalar:(float)a3 atTime:(double)a4
{
  return objc_msgSend(a1, "keyframeWithScalar:atTime:offsetKind:", 0);
}

+ (id)keyframeWithScalar:(float)a3 atTime:(double)a4 offsetKind:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = objc_alloc_init(MCAnimationKeyframe1D);
  [(MCAnimationKeyframe *)v8 setTimeOffset:a4];
  [(MCAnimationKeyframe *)v8 setTimeOffsetKind:v5];
  *(float *)&double v9 = a3;
  [(MCAnimationKeyframe1D *)v8 setValue:v9];
  return v8;
}

- (MCAnimationKeyframe1D)initWithImprint:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCAnimationKeyframe1D;
  v4 = -[MCAnimationKeyframe initWithImprint:](&v7, "initWithImprint:");
  if (v4)
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"value"), "floatValue");
    v4->mValue = v5;
  }
  return v4;
}

- (id)imprint
{
  v6.receiver = self;
  v6.super_class = (Class)MCAnimationKeyframe1D;
  id v3 = [(MCAnimationKeyframe *)&v6 imprint];
  *(float *)&double v4 = self->mValue;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), @"value");
  return v3;
}

- (void)setValue:(float)a3
{
  if (self->mValue != a3)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    self->mValue = a3;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (id)description
{
  double mValue = self->mValue;
  [(MCAnimationKeyframe *)self timeOffset];
  return +[NSString stringWithFormat:@"%f at %f", *(void *)&mValue, v3];
}

- (void)_copySelfToSnapshot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCAnimationKeyframe1D;
  -[MCAnimationKeyframe _copySelfToSnapshot:](&v5, "_copySelfToSnapshot:");
  *((_DWORD *)a3 + 10) = LODWORD(self->mValue);
}

- (float)value
{
  return self->mValue;
}

@end