@interface MFPPen
- (CGAffineTransform)transform;
- (MFPPen)init;
- (const)compoundArray;
- (const)dashPattern;
- (float)dashOffset;
- (float)miterLimit;
- (float)width;
- (id)brush;
- (id)customEndCap;
- (id)customStartCap;
- (int)alignment;
- (int)compoundArrayCount;
- (int)dashCap;
- (int)dashPatternCount;
- (int)dashStyle;
- (int)endCap;
- (int)lineJoin;
- (int)startCap;
- (void)applyDashCapToPath:(id)a3;
- (void)applyDashPatternToPath:(id)a3;
- (void)applyLineCapToPath:(id)a3;
- (void)applyLineJoinToPath:(id)a3;
- (void)dealloc;
- (void)setAlignment:(int)a3;
- (void)setBrush:(id)a3;
- (void)setCompoundArray:(const float *)a3 count:(int)a4;
- (void)setCustomEndCap:(id)a3;
- (void)setCustomStartCap:(id)a3;
- (void)setDashCap:(int)a3;
- (void)setDashOffset:(float)a3;
- (void)setDashPattern:(const float *)a3 count:(int)a4;
- (void)setDashPattern:(const float *)a3 count:(int)a4 toPath:(id)a5;
- (void)setDashStyle:(int)a3;
- (void)setEndCap:(int)a3;
- (void)setLineJoin:(int)a3;
- (void)setMiterLimit:(float)a3;
- (void)setStartCap:(int)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setWidth:(float)a3;
- (void)strokePath:(id)a3;
@end

@implementation MFPPen

- (MFPPen)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFPPen;
  result = [(MFPPen *)&v6 init];
  if (result)
  {
    v3 = (_OWORD *)MEMORY[0x263F000D0];
    result->mWidth = 1.0;
    long long v5 = v3[1];
    long long v4 = v3[2];
    *(_OWORD *)&result->mTransform.a = *v3;
    *(_OWORD *)&result->mTransform.c = v5;
    *(_OWORD *)&result->mTransform.tx = v4;
    *(void *)&result->mStartCap = 0;
    *(void *)&result->mLineJoin = 0x4120000000000000;
    *(void *)&result->mDashStyle = 0;
  }
  return result;
}

- (void)dealloc
{
  mDashPattern = self->mDashPattern;
  if (mDashPattern) {
    MEMORY[0x23EC99790](mDashPattern, 0x1000C8052888210);
  }
  mCompoundArray = self->mCompoundArray;
  if (mCompoundArray) {
    MEMORY[0x23EC99790](mCompoundArray, 0x1000C8052888210);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFPPen;
  [(MFPPen *)&v5 dealloc];
}

- (id)brush
{
  return self->mBrush;
}

- (void)setBrush:(id)a3
{
}

- (float)width
{
  return self->mWidth;
}

- (void)setWidth:(float)a3
{
  self->mWidth = a3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransform.c = v4;
  *(_OWORD *)&self->mTransform.a = v3;
}

- (int)startCap
{
  return self->mStartCap;
}

- (void)setStartCap:(int)a3
{
  self->mStartCap = a3;
}

- (int)endCap
{
  return self->mEndCap;
}

- (void)setEndCap:(int)a3
{
  self->mEndCap = a3;
}

- (int)lineJoin
{
  return self->mLineJoin;
}

- (void)setLineJoin:(int)a3
{
  self->mLineJoin = a3;
}

- (float)miterLimit
{
  return self->mMiterLimit;
}

- (void)setMiterLimit:(float)a3
{
  self->mMiterLimit = a3;
}

- (int)dashStyle
{
  return self->mDashStyle;
}

- (void)setDashStyle:(int)a3
{
  self->mDashStyle = a3;
}

- (int)dashCap
{
  return self->mDashCap;
}

- (void)setDashCap:(int)a3
{
  self->mDashCap = a3;
}

- (float)dashOffset
{
  return self->mDashOffset;
}

- (void)setDashOffset:(float)a3
{
  self->mDashOffset = a3;
}

- (int)dashPatternCount
{
  return self->mDashPatternCount;
}

- (const)dashPattern
{
  return self->mDashPattern;
}

- (void)setDashPattern:(const float *)a3 count:(int)a4
{
  self->mDashPatternCount = a4;
  operator new[]();
}

- (int)alignment
{
  return self->mAlignment;
}

- (void)setAlignment:(int)a3
{
  self->mAlignment = a3;
}

- (int)compoundArrayCount
{
  return self->mCompoundArrayCount;
}

- (const)compoundArray
{
  return self->mCompoundArray;
}

- (void)setCompoundArray:(const float *)a3 count:(int)a4
{
  self->mCompoundArrayCount = a4;
  operator new[]();
}

- (id)customStartCap
{
  return self->mCustomStartCap;
}

- (void)setCustomStartCap:(id)a3
{
}

- (id)customEndCap
{
  return self->mCustomEndCap;
}

- (void)setCustomEndCap:(id)a3
{
}

- (void)setDashPattern:(const float *)a3 count:(int)a4 toPath:(id)a5
{
}

- (void)applyDashPatternToPath:(id)a3
{
  id v9 = a3;
  objc_super v5 = (float *)&-[MFPPen applyDashPatternToPath:]::dashPattern;
  switch(self->mDashStyle)
  {
    case 0:
      goto LABEL_13;
    case 1:
      goto LABEL_5;
    case 2:
      objc_super v5 = (float *)&-[MFPPen applyDashPatternToPath:]::dotPattern;
      goto LABEL_5;
    case 3:
      objc_super v5 = (float *)&-[MFPPen applyDashPatternToPath:]::dashDotPattern;
      goto LABEL_5;
    case 4:
      objc_super v5 = (float *)&-[MFPPen applyDashPatternToPath:]::dashDotDotPattern;
LABEL_5:
      uint64_t v6 = 0;
      LODWORD(v4) = -1.0;
      do
        float v7 = v5[v6++];
      while (v7 != -1.0);
      uint64_t v8 = (v6 - 1);
      goto LABEL_8;
    case 5:
      [(MFPPen *)self setDashPattern:self->mDashPattern count:self->mDashPatternCount toPath:v9];
      goto LABEL_13;
    default:
      objc_super v5 = 0;
      uint64_t v8 = 0;
LABEL_8:
      if (self->mDashCap) {
        operator new[]();
      }
      -[MFPPen setDashPattern:count:toPath:](self, "setDashPattern:count:toPath:", v5, v8, v9, v4);
LABEL_13:

      return;
  }
}

- (void)applyLineJoinToPath:(id)a3
{
  id v4 = a3;
  int mLineJoin = self->mLineJoin;
  if (mLineJoin == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2 * (mLineJoin == 1);
  }
  id v7 = v4;
  [v4 setLineJoinStyle:v6];
  [v7 setMiterLimit:self->mMiterLimit];
}

- (void)applyLineCapToPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 1;
  switch(self->mStartCap)
  {
    case 1:
    case 0x11:
      uint64_t v5 = 2;
      break;
    case 2:
    case 0x12:
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  id v6 = v4;
  [v4 setLineCapStyle:v5];
}

- (void)applyDashCapToPath:(id)a3
{
  id v4 = a3;
  uint64_t mDashCap = self->mDashCap;
  if (mDashCap > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_238EDE5C0[mDashCap];
  }
  id v7 = v4;
  [v4 setLineCapStyle:v6];
}

- (void)strokePath:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->mDashStyle) {
    [(MFPPen *)self applyDashCapToPath:v4];
  }
  else {
    [(MFPPen *)self applyLineCapToPath:v4];
  }
  [(MFPPen *)self applyLineJoinToPath:v8];
  [(MFPPen *)self applyDashPatternToPath:v8];
  uint64_t v5 = [(MFPPen *)self brush];
  uint64_t v6 = [v5 color];
  [v6 set];
  [(MFPPen *)self width];
  [v8 setLineWidth:v7];
  [v8 stroke];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCustomEndCap, 0);
  objc_storeStrong((id *)&self->mCustomStartCap, 0);
  objc_storeStrong((id *)&self->mBrush, 0);
}

@end