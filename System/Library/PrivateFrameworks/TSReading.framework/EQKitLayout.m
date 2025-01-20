@interface EQKitLayout
- (CGRect)erasableBounds;
- (EQKitBox)box;
- (EQKitLayout)init;
- (EQKitLayout)initWithRoot:(id)a3 environment:(id)a4;
- (EQKitLayout)layoutWithContext:(id)a3;
- (NSString)description;
- (double)depth;
- (double)height;
- (double)naturalAlignmentOffset;
- (double)vsize;
- (double)width;
- (void)dealloc;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitLayout

- (EQKitLayout)init
{
  return [(EQKitLayout *)self initWithRoot:0 environment:0];
}

- (EQKitLayout)initWithRoot:(id)a3 environment:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EQKitLayout;
  v6 = [(EQKitLayout *)&v8 init];
  if (v6)
  {
    v6->mRoot = (EQKitRootNode *)a3;
    v6->mEnvironment = (EQKitEnvironmentInstance *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitLayout;
  [(EQKitLayout *)&v3 dealloc];
}

- (EQKitLayout)layoutWithContext:(id)a3
{
  self->mBox = 0;
  self->mScale = 1.0;
  if (a3)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [(EQKitRootNode *)self->mRoot attributeCollection];
      if (v5)
      {
        [(EQKitEnvironmentInstance *)self->mEnvironment beginLayout];
        EQKitLayoutManager::EQKitLayoutManager(v13, a3, self->mEnvironment, v5);
        self->mBox = EQKitLayoutManager::layoutExpression((EQKitLayoutManager *)v13, self->mRoot, &self->mAscent, &self->mDescent, &self->mLeading, &self->mNaturalAlignmentOffset, &self->mSingleLineHeight);
        [a3 containerWidth];
        if (v6 > 0.0)
        {
          [(EQKitBox *)self->mBox width];
          if (v7 > 0.0)
          {
            [a3 containerWidth];
            double v9 = v8;
            [(EQKitBox *)self->mBox width];
            *(float *)&double v10 = v9 / v10;
            self->mScale = fminf(*(float *)&v10, 1.0);
          }
        }
        [(EQKitEnvironmentInstance *)self->mEnvironment endLayout];
        EQKitLayoutManager::~EQKitLayoutManager((EQKitLayoutManager *)v13);
      }
    }
    return (EQKitLayout *)(self->mBox != 0);
  }
  else
  {
    v12 = (void *)[MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[EQKitLayout layoutWithContext:]"), @"EQKitLayoutPrivate.mm", 57, @"invalid inContext");
    return 0;
  }
}

- (double)height
{
  if (self->mSingleLineHeight)
  {
    double mAscent = self->mAscent;
  }
  else
  {
    [(EQKitBox *)self->mBox height];
    double v5 = v4 + self->mLeading * 0.5;
    double mAscent = self->mAscent;
    if (v5 > mAscent)
    {
      [(EQKitBox *)self->mBox height];
      double mAscent = v6 + self->mLeading * 0.5;
    }
  }
  return mAscent * self->mScale;
}

- (double)depth
{
  if (self->mSingleLineHeight)
  {
    double mDescent = self->mDescent;
  }
  else
  {
    [(EQKitBox *)self->mBox depth];
    double mDescent = self->mDescent;
    if (v4 + self->mLeading * 0.5 > mDescent)
    {
      [(EQKitBox *)self->mBox depth];
      double mDescent = v5 + self->mLeading * 0.5;
    }
  }
  return mDescent * self->mScale;
}

- (double)width
{
  [(EQKitBox *)self->mBox width];
  return v3 * self->mScale;
}

- (double)vsize
{
  [(EQKitLayout *)self height];
  double v4 = v3;
  [(EQKitLayout *)self depth];
  return v4 + v5;
}

- (double)naturalAlignmentOffset
{
  return self->mNaturalAlignmentOffset * self->mScale;
}

- (CGRect)erasableBounds
{
  mBox = self->mBox;
  if (mBox)
  {
    [(EQKitBox *)mBox erasableBounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGAffineTransformMakeScale(&v12, self->mScale, self->mScale);
    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    return CGRectApplyAffineTransform(v13, &v12);
  }
  else
  {
    return *(CGRect *)*(void *)&MEMORY[0x263F001A8];
  }
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGContextSaveGState(a3);
  CGContextScaleCTM(a3, self->mScale, self->mScale);
  CGAffineTransformMakeScale(&v8, 1.0 / self->mScale, 1.0 / self->mScale);
  [(EQKitBox *)self->mBox renderIntoContext:a3 offset:vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v8.c, y), *(float64x2_t *)&v8.a, x))];
  CGContextRestoreGState(a3);
}

- (NSString)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@ %p box=%@>", NSStringFromClass(v4), self, self->mBox];
}

- (EQKitBox)box
{
  return self->mBox;
}

@end