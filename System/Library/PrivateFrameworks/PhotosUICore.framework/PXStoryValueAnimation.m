@interface PXStoryValueAnimation
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($72632A4D4D55CFB1110DF69B22A11D8B)curveInfo;
- (PXStoryValueAnimation)init;
- (PXStoryValueAnimation)initWithDuration:(id *)a3 curveInfo:(id)a4;
- (PXStoryValueAnimation)initWithIdentifier:(id)a3;
- (PXStoryValueAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5;
- (void)timeDidChange;
- (void)updateCurrentValueWithProgress:(double)a3;
@end

@implementation PXStoryValueAnimation

- ($72632A4D4D55CFB1110DF69B22A11D8B)curveInfo
{
  p_curveInfo = &self->_curveInfo;
  int64_t curve = self->_curveInfo.curve;
  v4.var0 = p_curveInfo->var0.linearFraction;
  result.var1 = v4;
  result.var0 = curve;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[10];
  return self;
}

- (void)updateCurrentValueWithProgress:(double)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXStoryValueAnimation.m", 44, @"Method %s is a responsibility of subclass %@", "-[PXStoryValueAnimation updateCurrentValueWithProgress:]", v7 object file lineNumber description];

  abort();
}

- (void)timeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryValueAnimation;
  [(PXStoryAnimation *)&v8 timeDidChange];
  uint64_t v3 = [(PXStoryValueAnimation *)self curveInfo];
  uint64_t v5 = v4;
  [(PXStoryAnimation *)self time];
  [(PXStoryValueAnimation *)self duration];
  [(PXStoryValueAnimation *)self updateCurrentValueWithProgress:PXStoryAnimationCurveGetProgress(v3, v5, &v7, &v6)];
}

- (PXStoryValueAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5
{
  double var0 = a5.var1.var0;
  int64_t v6 = a5.var0;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryValueAnimation;
  $72632A4D4D55CFB1110DF69B22A11D8B result = [(PXStoryAnimation *)&v10 initWithIdentifier:a3];
  if (result)
  {
    int64_t var3 = a4->var3;
    *(_OWORD *)&result->_duration.value = *(_OWORD *)&a4->var0;
    result->_duration.epoch = var3;
    result->_curveInfo.int64_t curve = v6;
    result->_curveInfo.var0.linearFraction = var0;
  }
  return result;
}

- (PXStoryValueAnimation)initWithDuration:(id *)a3 curveInfo:(id)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  return -[PXStoryValueAnimation initWithIdentifier:duration:curveInfo:](self, "initWithIdentifier:duration:curveInfo:", 0, &v5, a4.var0, *(void *)&a4.var1.var0);
}

- (PXStoryValueAnimation)initWithIdentifier:(id)a3
{
  id v5 = a3;
  int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryValueAnimation.m", 20, @"%s is not available as initializer", "-[PXStoryValueAnimation initWithIdentifier:]");

  abort();
}

- (PXStoryValueAnimation)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryValueAnimation.m", 16, @"%s is not available as initializer", "-[PXStoryValueAnimation init]");

  abort();
}

@end