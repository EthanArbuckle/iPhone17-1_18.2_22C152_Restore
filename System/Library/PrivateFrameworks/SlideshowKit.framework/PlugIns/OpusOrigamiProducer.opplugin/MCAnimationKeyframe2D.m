@interface MCAnimationKeyframe2D
+ (id)keyframeWithPoint:(CGPoint)a3 atTime:(double)a4;
+ (id)keyframeWithPoint:(CGPoint)a3 atTime:(double)a4 offsetKind:(int)a5;
- (CGPoint)c1;
- (CGPoint)c2;
- (CGPoint)point;
- (MCAnimationKeyframe2D)initWithImprint:(id)a3;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)setC1:(CGPoint)a3;
- (void)setC2:(CGPoint)a3;
- (void)setPoint:(CGPoint)a3;
@end

@implementation MCAnimationKeyframe2D

+ (id)keyframeWithPoint:(CGPoint)a3 atTime:(double)a4
{
  return objc_msgSend(a1, "keyframeWithPoint:atTime:offsetKind:", 0, a3.x, a3.y, a4);
}

+ (id)keyframeWithPoint:(CGPoint)a3 atTime:(double)a4 offsetKind:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double y = a3.y;
  double x = a3.x;
  v9 = objc_alloc_init(MCAnimationKeyframe2D);
  [(MCAnimationKeyframe *)v9 setTimeOffset:a4];
  [(MCAnimationKeyframe *)v9 setTimeOffsetKind:v5];
  -[MCAnimationKeyframe2D setC2:](v9, "setC2:", x, y);
  -[MCAnimationKeyframe2D setC1:](v9, "setC1:", x, y);
  -[MCAnimationKeyframe2D setPoint:](v9, "setPoint:", x, y);
  return v9;
}

- (MCAnimationKeyframe2D)initWithImprint:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)MCAnimationKeyframe2D;
  v4 = -[MCAnimationKeyframe initWithImprint:](&v24, "initWithImprint:");
  if (v4)
  {
    id v5 = [a3 objectForKey:@"pointX"];
    double v6 = 0.0;
    double v7 = 0.0;
    if (v5)
    {
      objc_msgSend(v5, "floatValue", 0.0);
      double v7 = v8;
    }
    v4->mPoint.double x = v7;
    id v9 = [a3 objectForKey:@"pointY"];
    if (v9)
    {
      [v9 floatValue];
      double v6 = v10;
    }
    v4->mPoint.double y = v6;
    id v11 = [a3 objectForKey:@"c1X"];
    double v12 = 0.0;
    double v13 = 0.0;
    if (v11)
    {
      objc_msgSend(v11, "floatValue", 0.0);
      double v13 = v14;
    }
    v4->mC1.double x = v13;
    id v15 = [a3 objectForKey:@"c1Y"];
    if (v15)
    {
      [v15 floatValue];
      double v12 = v16;
    }
    v4->mC1.double y = v12;
    id v17 = [a3 objectForKey:@"c2X"];
    double v18 = 0.0;
    double v19 = 0.0;
    if (v17)
    {
      objc_msgSend(v17, "floatValue", 0.0);
      double v19 = v20;
    }
    v4->mC2.double x = v19;
    id v21 = [a3 objectForKey:@"c2Y"];
    if (v21)
    {
      [v21 floatValue];
      double v18 = v22;
    }
    v4->mC2.double y = v18;
  }
  return v4;
}

- (id)imprint
{
  v12.receiver = self;
  v12.super_class = (Class)MCAnimationKeyframe2D;
  id v3 = [(MCAnimationKeyframe *)&v12 imprint];
  CGFloat x = self->mPoint.x;
  if (x != 0.0)
  {
    *(float *)&CGFloat x = x;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", x), @"pointX");
  }
  CGFloat y = self->mPoint.y;
  if (y != 0.0)
  {
    *(float *)&CGFloat y = y;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", y), @"pointY");
  }
  CGFloat v6 = self->mC1.x;
  if (v6 != 0.0)
  {
    *(float *)&CGFloat v6 = v6;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), @"c1X");
  }
  CGFloat v7 = self->mC1.y;
  if (v7 != 0.0)
  {
    *(float *)&CGFloat v7 = v7;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), @"c1Y");
  }
  p_mC2 = &self->mC2;
  double v9 = p_mC2->x;
  if (p_mC2->x != 0.0)
  {
    *(float *)&double v9 = v9;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9), @"c2X");
  }
  double v10 = p_mC2->y;
  if (v10 != 0.0)
  {
    *(float *)&double v10 = v10;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10), @"c2Y");
  }
  return v3;
}

- (void)setPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_mPoint = &self->mPoint;
  if (a3.x != self->mPoint.x || a3.y != self->mPoint.y)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    p_mPoint->CGFloat x = x;
    p_mPoint->CGFloat y = y;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setC1:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_mC1 = &self->mC1;
  if (a3.x != self->mC1.x || a3.y != self->mC1.y)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    p_mC1->CGFloat x = x;
    p_mC1->CGFloat y = y;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (void)setC2:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_mC2 = &self->mC2;
  if (a3.x != self->mC2.x || a3.y != self->mC2.y)
  {
    [(MCAnimationPathKeyframed *)self->super.mAnimationPath willChangeValueForKey:@"keyframes"];
    p_mC2->CGFloat x = x;
    p_mC2->CGFloat y = y;
    mAnimationPath = self->super.mAnimationPath;
    [(MCAnimationPathKeyframed *)mAnimationPath didChangeValueForKey:@"keyframes"];
  }
}

- (id)description
{
  CGFloat x = self->mPoint.x;
  CGFloat y = self->mPoint.y;
  [(MCAnimationKeyframe *)self timeOffset];
  return +[NSString stringWithFormat:@"(%f, %f) at %f (c1=(%f,%f), c2=(%f,%f))", *(void *)&x, *(void *)&y, v5, *(void *)&self->mC1.x, *(void *)&self->mC1.y, *(void *)&self->mC2.x, *(void *)&self->mC2.y];
}

- (void)_copySelfToSnapshot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCAnimationKeyframe2D;
  -[MCAnimationKeyframe _copySelfToSnapshot:](&v5, "_copySelfToSnapshot:");
  *(CGPoint *)((char *)a3 + 40) = self->mPoint;
  *(CGPoint *)((char *)a3 + 56) = self->mC1;
  *(CGPoint *)((char *)a3 + 72) = self->mC2;
}

- (CGPoint)point
{
  double x = self->mPoint.x;
  double y = self->mPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)c1
{
  double x = self->mC1.x;
  double y = self->mC1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)c2
{
  double x = self->mC2.x;
  double y = self->mC2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end