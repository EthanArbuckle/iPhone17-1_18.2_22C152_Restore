@interface SXTextTangierLayout
- (BOOL)alwaysStartsNewTarget;
- (BOOL)columnsAreLeftToRight;
- (BOOL)shouldHyphenateTextLayout:(id)a3;
- (BOOL)shrinkTextToFit;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGSize)adjustedInsets;
- (CGSize)initialTextSize;
- (Class)repClassForTextLayout:(id)a3;
- (SXTextTangierTextWrapper)textWrapper;
- (TSWPPadding)layoutMargins;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (id)additionalReliedOnLayoutsForTextWrap;
- (id)dependentsOfTextLayout:(id)a3;
- (id)textWrapperForExteriorWrap;
- (unint64_t)columnCount;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)invalidate;
- (void)setTextWrapper:(id)a3;
@end

@implementation SXTextTangierLayout

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
}

- (Class)repClassForTextLayout:(id)a3
{
  v3 = objc_opt_class();
  return (Class)v3;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (CGSize)initialTextSize
{
  v2 = [(TSDLayout *)self info];
  double v3 = [v2 geometry];
  [v3 size];
  double v5 = v4;

  double v6 = 10000000.0;
  double v7 = v5;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (BOOL)shouldHyphenateTextLayout:(id)a3
{
  return 1;
}

- (void)invalidate
{
  v16.receiver = self;
  v16.super_class = (Class)SXTextTangierLayout;
  [(TSDLayout *)&v16 invalidate];
  [(SXTextTangierLayout *)self setTextWrapper:0];
  double v3 = [(TSDAbstractLayout *)self children];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    double v5 = [(TSDAbstractLayout *)self children];
    double v6 = [v5 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v8 = [MEMORY[0x263F7C7F0] currentHandler];
      v9 = [NSString stringWithUTF8String:"-[SXTextTangierLayout invalidate]"];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierLayout.mm"];
      [v8 handleFailureInFunction:v9 file:v10 lineNumber:77 description:@"TSWPLayout expected here"];
    }
    objc_opt_class();
    v11 = [(TSDAbstractLayout *)self children];
    v12 = [v11 firstObject];
    v13 = TSUDynamicCast();

    uint64_t v14 = (int)*MEMORY[0x263F7C7B0];
    int v15 = *((unsigned __int8 *)&self->super.super.super.super.isa + v14);
    if ((v15 & 2) != 0)
    {
      [v13 invalidateTextLayout];
      int v15 = *((unsigned __int8 *)&self->super.super.super.super.isa + v14);
    }
    if ((~v15 & 3) == 0) {
      [v13 invalidateFrame];
    }
  }
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  return 0.0;
}

- (CGSize)adjustedInsets
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)textWrapperForExteriorWrap
{
  double v3 = [(SXTextTangierLayout *)self textWrapper];

  if (!v3)
  {
    uint64_t v4 = objc_alloc_init(SXTextTangierTextWrapper);
    [(SXTextTangierLayout *)self setTextWrapper:v4];

    double v5 = [(TSDLayout *)self info];
    double v6 = [v5 fixedExclusionPaths];
    double v7 = [v6 allObjects];
    v8 = [(SXTextTangierLayout *)self textWrapper];
    [v8 setExclusionPaths:v7];
  }
  return [(SXTextTangierLayout *)self textWrapper];
}

- (id)additionalReliedOnLayoutsForTextWrap
{
  return 0;
}

- (SXTextTangierTextWrapper)textWrapper
{
  return self->_textWrapper;
}

- (void)setTextWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end