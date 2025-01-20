@interface _PXStoryVisualDiagnosticsCropRectsConfiguration
- ($8D850169D18C61051B72E914142B6C27)kenBurnsAnimationInfo;
- (CGSize)TVPreviewSize;
- (PXStoryMovieHighlight)movieHighlight;
- (void)setKenBurnsAnimationInfo:(id *)a3;
- (void)setMovieHighlight:(id)a3;
- (void)setTVPreviewSize:(CGSize)a3;
@end

@implementation _PXStoryVisualDiagnosticsCropRectsConfiguration

- (void).cxx_destruct
{
}

- (void)setTVPreviewSize:(CGSize)a3
{
  self->TVPreviewSize = a3;
}

- (CGSize)TVPreviewSize
{
  double width = self->TVPreviewSize.width;
  double height = self->TVPreviewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMovieHighlight:(id)a3
{
}

- (PXStoryMovieHighlight)movieHighlight
{
  return self->movieHighlight;
}

- (void)setKenBurnsAnimationInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0.a;
  long long v4 = *(_OWORD *)&a3->var0.var0.c;
  long long v5 = *(_OWORD *)&a3->var1.var0.a;
  *(_OWORD *)&self->kenBurnsAnimationInfo.sourceContentsRect.t.tx = *(_OWORD *)&a3->var0.var0.tx;
  *(_OWORD *)&self->kenBurnsAnimationInfo.targetContentsRect.t.a = v5;
  *(_OWORD *)&self->kenBurnsAnimationInfo.sourceContentsRect.t.a = v3;
  *(_OWORD *)&self->kenBurnsAnimationInfo.sourceContentsRect.t.c = v4;
  long long v6 = *(_OWORD *)&a3->var1.var0.c;
  long long v7 = *(_OWORD *)&a3->var1.var0.tx;
  long long v8 = *(_OWORD *)&a3->var2.var0;
  self->kenBurnsAnimationInfo.duration.epoch = a3->var2.var3;
  *(_OWORD *)&self->kenBurnsAnimationInfo.targetContentsRect.t.tx = v7;
  *(_OWORD *)&self->kenBurnsAnimationInfo.duration.value = v8;
  *(_OWORD *)&self->kenBurnsAnimationInfo.targetContentsRect.t.c = v6;
}

- ($8D850169D18C61051B72E914142B6C27)kenBurnsAnimationInfo
{
  long long v3 = *(_OWORD *)&self->var2.var3;
  *(_OWORD *)&retstr->var1.var0.c = *(_OWORD *)&self->var2.var0;
  *(_OWORD *)&retstr->var1.var0.tx = v3;
  retstr->var2 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&self[1].var0.var0.b;
  long long v4 = *(_OWORD *)&self->var1.var0.a;
  *(_OWORD *)&retstr->var0.var0.a = *(_OWORD *)&self->var0.var0.tx;
  *(_OWORD *)&retstr->var0.var0.c = v4;
  long long v5 = *(_OWORD *)&self->var1.var0.tx;
  *(_OWORD *)&retstr->var0.var0.tx = *(_OWORD *)&self->var1.var0.c;
  *(_OWORD *)&retstr->var1.var0.a = v5;
  return self;
}

@end