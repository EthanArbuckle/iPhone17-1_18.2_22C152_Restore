@interface PXStoryTiltedEdgeInsetsAnimation
- ($AFFB3261E48324223FE33B3CF9FC7872)currentEdgeInsets;
- ($AFFB3261E48324223FE33B3CF9FC7872)sourceEdgeInsets;
- ($AFFB3261E48324223FE33B3CF9FC7872)targetEdgeInsets;
- (PXStoryTiltedEdgeInsetsAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5;
- (PXStoryTiltedEdgeInsetsAnimation)initWithIdentifier:(id)a3 sourceEdgeInsets:(id *)a4 targetEdgeInsets:(id *)a5 duration:(id *)a6 curveInfo:(id)a7;
- (PXStoryTiltedEdgeInsetsAnimation)initWithSourceEdgeInsets:(id *)a3 targetEdgeInsets:(id *)a4 duration:(id *)a5 curveInfo:(id)a6;
- (void)setCurrentEdgeInsets:(id *)a3;
- (void)updateCurrentValueWithProgress:(double)a3;
@end

@implementation PXStoryTiltedEdgeInsetsAnimation

- ($AFFB3261E48324223FE33B3CF9FC7872)currentEdgeInsets
{
  long long v3 = *(_OWORD *)&self[5].var1.var0;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[5].var0.var1;
  *(_OWORD *)&retstr->var2.var0 = v3;
  long long v4 = *(_OWORD *)&self[5].var2.var1;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&self[5].var1.var2;
  *(_OWORD *)&retstr->var3.var1 = v4;
  long long v5 = *(_OWORD *)&self[4].var3.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var3.var0;
  *(_OWORD *)&retstr->var0.var2 = v5;
  return self;
}

- ($AFFB3261E48324223FE33B3CF9FC7872)targetEdgeInsets
{
  long long v3 = *(_OWORD *)&self[4].var1.var0;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var0.var1;
  *(_OWORD *)&retstr->var2.var0 = v3;
  long long v4 = *(_OWORD *)&self[4].var2.var1;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&self[4].var1.var2;
  *(_OWORD *)&retstr->var3.var1 = v4;
  long long v5 = *(_OWORD *)&self[3].var3.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var3.var0;
  *(_OWORD *)&retstr->var0.var2 = v5;
  return self;
}

- ($AFFB3261E48324223FE33B3CF9FC7872)sourceEdgeInsets
{
  long long v3 = *(_OWORD *)&self[3].var1.var0;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var2.var0 = v3;
  long long v4 = *(_OWORD *)&self[3].var2.var1;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&self[3].var1.var2;
  *(_OWORD *)&retstr->var3.var1 = v4;
  long long v5 = *(_OWORD *)&self[2].var3.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var3.var0;
  *(_OWORD *)&retstr->var0.var2 = v5;
  return self;
}

- (void)setCurrentEdgeInsets:(id *)a3
{
  if (a3->var0.var0 != self->_currentEdgeInsets.top.preRotationInset
    || a3->var0.var1 != self->_currentEdgeInsets.top.rotationAngle
    || a3->var0.var2 != self->_currentEdgeInsets.top.postRotationInset)
  {
    goto LABEL_34;
  }
  BOOL v5 = a3->var1.var0 == self->_currentEdgeInsets.left.preRotationInset
    && a3->var1.var1 == self->_currentEdgeInsets.left.rotationAngle;
  BOOL v6 = v5 && a3->var1.var2 == self->_currentEdgeInsets.left.postRotationInset;
  BOOL v7 = v6 && a3->var2.var0 == self->_currentEdgeInsets.bottom.preRotationInset;
  BOOL v8 = v7 && a3->var2.var1 == self->_currentEdgeInsets.bottom.rotationAngle;
  BOOL v9 = v8 && a3->var2.var2 == self->_currentEdgeInsets.bottom.postRotationInset;
  BOOL v10 = v9 && a3->var3.var0 == self->_currentEdgeInsets.right.preRotationInset;
  BOOL v11 = v10 && a3->var3.var1 == self->_currentEdgeInsets.right.rotationAngle;
  if (!v11 || a3->var3.var2 != self->_currentEdgeInsets.right.postRotationInset)
  {
LABEL_34:
    long long v13 = *(_OWORD *)&a3->var0.var2;
    *(_OWORD *)&self->_currentEdgeInsets.top.preRotationInset = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&self->_currentEdgeInsets.top.postRotationInset = v13;
    long long v14 = *(_OWORD *)&a3->var1.var1;
    long long v15 = *(_OWORD *)&a3->var2.var0;
    long long v16 = *(_OWORD *)&a3->var3.var1;
    *(_OWORD *)&self->_currentEdgeInsets.bottom.postRotationInset = *(_OWORD *)&a3->var2.var2;
    *(_OWORD *)&self->_currentEdgeInsets.right.rotationAngle = v16;
    *(_OWORD *)&self->_currentEdgeInsets.left.rotationAngle = v14;
    *(_OWORD *)&self->_currentEdgeInsets.bottom.preRotationInset = v15;
    [(PXStoryTiltedEdgeInsetsAnimation *)self signalChange:4];
  }
}

- (void)updateCurrentValueWithProgress:(double)a3
{
}

- (PXStoryTiltedEdgeInsetsAnimation)initWithSourceEdgeInsets:(id *)a3 targetEdgeInsets:(id *)a4 duration:(id *)a5 curveInfo:(id)a6
{
  long long v6 = *(_OWORD *)&a3->var2.var0;
  v15[2] = *(_OWORD *)&a3->var1.var1;
  v15[3] = v6;
  long long v7 = *(_OWORD *)&a3->var3.var1;
  v15[4] = *(_OWORD *)&a3->var2.var2;
  v15[5] = v7;
  long long v8 = *(_OWORD *)&a3->var0.var2;
  v15[0] = *(_OWORD *)&a3->var0.var0;
  v15[1] = v8;
  long long v9 = *(_OWORD *)&a4->var2.var0;
  v14[2] = *(_OWORD *)&a4->var1.var1;
  v14[3] = v9;
  long long v10 = *(_OWORD *)&a4->var3.var1;
  v14[4] = *(_OWORD *)&a4->var2.var2;
  v14[5] = v10;
  long long v11 = *(_OWORD *)&a4->var0.var2;
  v14[0] = *(_OWORD *)&a4->var0.var0;
  v14[1] = v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a5;
  return -[PXStoryTiltedEdgeInsetsAnimation initWithIdentifier:sourceEdgeInsets:targetEdgeInsets:duration:curveInfo:](self, "initWithIdentifier:sourceEdgeInsets:targetEdgeInsets:duration:curveInfo:", 0, v15, v14, &v13, a6.var0, *(void *)&a6.var1.var0);
}

- (PXStoryTiltedEdgeInsetsAnimation)initWithIdentifier:(id)a3 sourceEdgeInsets:(id *)a4 targetEdgeInsets:(id *)a5 duration:(id *)a6 curveInfo:(id)a7
{
  v19.receiver = self;
  v19.super_class = (Class)PXStoryTiltedEdgeInsetsAnimation;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a6;
  result = -[PXStoryValueAnimation initWithIdentifier:duration:curveInfo:](&v19, sel_initWithIdentifier_duration_curveInfo_, a3, &v18, a7.var0, *(void *)&a7.var1.var0);
  if (result)
  {
    long long v10 = *(_OWORD *)&a4->var0.var2;
    *(_OWORD *)&result->_sourceEdgeInsets.top.preRotationInset = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&result->_sourceEdgeInsets.top.postRotationInset = v10;
    long long v11 = *(_OWORD *)&a4->var3.var1;
    long long v13 = *(_OWORD *)&a4->var1.var1;
    long long v12 = *(_OWORD *)&a4->var2.var0;
    *(_OWORD *)&result->_sourceEdgeInsets.bottom.postRotationInset = *(_OWORD *)&a4->var2.var2;
    *(_OWORD *)&result->_sourceEdgeInsets.right.rotationAngle = v11;
    *(_OWORD *)&result->_sourceEdgeInsets.left.rotationAngle = v13;
    *(_OWORD *)&result->_sourceEdgeInsets.bottom.preRotationInset = v12;
    long long v14 = *(_OWORD *)&a5->var0.var2;
    *(_OWORD *)&result->_targetEdgeInsets.top.preRotationInset = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&result->_targetEdgeInsets.top.postRotationInset = v14;
    long long v15 = *(_OWORD *)&a5->var3.var1;
    long long v17 = *(_OWORD *)&a5->var1.var1;
    long long v16 = *(_OWORD *)&a5->var2.var0;
    *(_OWORD *)&result->_targetEdgeInsets.bottom.postRotationInset = *(_OWORD *)&a5->var2.var2;
    *(_OWORD *)&result->_targetEdgeInsets.right.rotationAngle = v15;
    *(_OWORD *)&result->_targetEdgeInsets.left.rotationAngle = v17;
    *(_OWORD *)&result->_targetEdgeInsets.bottom.preRotationInset = v16;
    *(_OWORD *)&result->_currentEdgeInsets.bottom.postRotationInset = xmmword_1AB35B838;
    *(_OWORD *)&result->_currentEdgeInsets.right.rotationAngle = unk_1AB35B848;
    *(_OWORD *)&result->_currentEdgeInsets.left.rotationAngle = xmmword_1AB35B818;
    *(_OWORD *)&result->_currentEdgeInsets.bottom.preRotationInset = unk_1AB35B828;
    *(_OWORD *)&result->_currentEdgeInsets.top.preRotationInset = PXStoryTiltedEdgeInsetsNull;
    *(_OWORD *)&result->_currentEdgeInsets.top.postRotationInset = unk_1AB35B808;
  }
  return result;
}

- (PXStoryTiltedEdgeInsetsAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5
{
  id v7 = a3;
  long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTiltedEdgeInsetsAnimation.m", 17, @"%s is not available as initializer", "-[PXStoryTiltedEdgeInsetsAnimation initWithIdentifier:duration:curveInfo:]");

  abort();
}

@end