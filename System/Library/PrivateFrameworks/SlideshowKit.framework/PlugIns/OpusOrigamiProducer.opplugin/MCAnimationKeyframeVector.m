@interface MCAnimationKeyframeVector
+ (id)keyframeWithVector:(id *)a3 atTime:(double)a4;
+ (id)keyframeWithVector:(id *)a3 atTime:(double)a4 offsetKind:(int)a5;
- ($421962E1114BB55FD51FACB03C2AC210)vector;
- (MCAnimationKeyframeVector)initWithImprint:(id)a3;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)setVector:(id *)a3;
@end

@implementation MCAnimationKeyframeVector

+ (id)keyframeWithVector:(id *)a3 atTime:(double)a4
{
  $421962E1114BB55FD51FACB03C2AC210 v5 = *a3;
  return [a1 keyframeWithVector:&v5 atTime:0 offsetKind:a4];
}

+ (id)keyframeWithVector:(id *)a3 atTime:(double)a4 offsetKind:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = objc_alloc_init(MCAnimationKeyframeVector);
  [(MCAnimationKeyframe *)v8 setTimeOffset:a4];
  [(MCAnimationKeyframe *)v8 setTimeOffsetKind:v5];
  $421962E1114BB55FD51FACB03C2AC210 v10 = *a3;
  [(MCAnimationKeyframeVector *)v8 setVector:&v10];
  return v8;
}

- (MCAnimationKeyframeVector)initWithImprint:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCAnimationKeyframeVector;
  v4 = -[MCAnimationKeyframe initWithImprint:](&v9, "initWithImprint:");
  if (v4)
  {
    unsigned int v5 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"length"), "unsignedCharValue");
    v4->mVector.length = v5;
    if (v5)
    {
      unint64_t v6 = 0;
      do
      {
        [objc_msgSend(a3 objectForKey:objc_msgSend(@"v0", "stringByAppendingFormat:", @"%d", v6)), "floatValue"];
        v4->mVector.v[v6++] = v7;
      }
      while (v6 < v4->mVector.length);
    }
  }
  return v4;
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)MCAnimationKeyframeVector;
  id v3 = [(MCAnimationKeyframe *)&v7 imprint];
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->mVector.length), @"length");
  if (self->mVector.length)
  {
    unint64_t v5 = 0;
    do
    {
      *(float *)&double v4 = self->mVector.v[v5];
      [v3 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), objc_msgSend(@"v0", "stringByAppendingFormat:", @"%d", v5++) forKey];
    }
    while (v5 < self->mVector.length);
  }
  return v3;
}

- (void)setVector:(id *)a3
{
  [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
  long long v5 = *(_OWORD *)&a3->var0;
  self->mVector.v[3] = a3->var1[3];
  *(_OWORD *)&self->mVector.length = v5;
  mAnimationPath = self->super.mAnimationPath;
  [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCAnimationKeyframeVector;
  -[MCAnimationKeyframe _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  float v5 = self->mVector.v[3];
  *(_OWORD *)((char *)a3 + 40) = *(_OWORD *)&self->mVector.length;
  *((float *)a3 + 14) = v5;
}

- ($421962E1114BB55FD51FACB03C2AC210)vector
{
  *($C37773CA539E4F2ABBA39A5E222B9DBF *)retstr = ($C37773CA539E4F2ABBA39A5E222B9DBF)self[2];
  return self;
}

@end