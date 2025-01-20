@interface PXStoryRectAnimation
- ($810C7C628FE0F9AC50A6216490AB88B8)currentRect;
- ($810C7C628FE0F9AC50A6216490AB88B8)sourceRect;
- ($810C7C628FE0F9AC50A6216490AB88B8)targetRect;
- (CGRect)outerBounds;
- (CGSize)referenceSize;
- (PXStoryRectAnimation)initWithDuration:(id *)a3 curveInfo:(id)a4;
- (PXStoryRectAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5;
- (PXStoryRectAnimation)initWithIdentifier:(id)a3 sourceRect:(id *)a4 targetRect:(id *)a5 outerBounds:(CGRect)a6 referenceSize:(CGSize)a7 duration:(id *)a8 curveInfo:(id)a9;
- (void)setCurrentRect:(id *)a3;
- (void)updateCurrentValueWithProgress:(double)a3;
@end

@implementation PXStoryRectAnimation

- ($810C7C628FE0F9AC50A6216490AB88B8)currentRect
{
  long long v3 = *(_OWORD *)&self[11].var0.d;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[11].var0.b;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[11].var0.ty;
  return self;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)outerBounds
{
  double x = self->_outerBounds.origin.x;
  double y = self->_outerBounds.origin.y;
  double width = self->_outerBounds.size.width;
  double height = self->_outerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)targetRect
{
  long long v3 = *(_OWORD *)&self[10].var0.d;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[10].var0.b;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tdouble x = *(_OWORD *)&self[10].var0.ty;
  return self;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)sourceRect
{
  long long v3 = *(_OWORD *)&self[9].var0.d;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[9].var0.b;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tdouble x = *(_OWORD *)&self[9].var0.ty;
  return self;
}

- (void)setCurrentRect:(id *)a3
{
}

- (void)updateCurrentValueWithProgress:(double)a3
{
}

- (PXStoryRectAnimation)initWithIdentifier:(id)a3 sourceRect:(id *)a4 targetRect:(id *)a5 outerBounds:(CGRect)a6 referenceSize:(CGSize)a7 duration:(id *)a8 curveInfo:(id)a9
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryRectAnimation;
  *(_OWORD *)&v19.a = *(_OWORD *)&a8->var0;
  *(void *)&v19.c = a8->var3;
  v13 = -[PXStoryValueAnimation initWithIdentifier:duration:curveInfo:](&v20, sel_initWithIdentifier_duration_curveInfo_, a3, &v19, a9.var0, *(void *)&a9.var1.var0);
  if (v13)
  {
    long long v15 = *(_OWORD *)&a4->var0.c;
    long long v14 = *(_OWORD *)&a4->var0.tx;
    *(_OWORD *)(v13 + 440) = *(_OWORD *)&a4->var0.a;
    *(_OWORD *)(v13 + 456) = v15;
    *(_OWORD *)(v13 + 472) = v14;
    long long v16 = *(_OWORD *)&a5->var0.a;
    long long v17 = *(_OWORD *)&a5->var0.tx;
    *(_OWORD *)(v13 + 504) = *(_OWORD *)&a5->var0.c;
    *(_OWORD *)(v13 + 520) = v17;
    *(_OWORD *)(v13 + 488) = v16;
    *((CGFloat *)v13 + 49) = width;
    *((CGFloat *)v13 + 50) = height;
    memset(&v19, 0, sizeof(v19));
    PXSizeIsValid();
  }
  return 0;
}

- (PXStoryRectAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5
{
  id v7 = a3;
  v8 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRectAnimation.m", 27, @"%s is not available as initializer", "-[PXStoryRectAnimation initWithIdentifier:duration:curveInfo:]");

  abort();
}

- (PXStoryRectAnimation)initWithDuration:(id *)a3 curveInfo:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4.var0, *(void *)&a4.var1.var0);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRectAnimation.m", 23, @"%s is not available as initializer", "-[PXStoryRectAnimation initWithDuration:curveInfo:]");

  abort();
}

@end