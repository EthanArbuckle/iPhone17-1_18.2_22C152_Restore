@interface SXStandaloneTextLayout
- (BOOL)alwaysStartsNewTarget;
- (BOOL)columnsAreLeftToRight;
- (BOOL)shrinkTextToFit;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGSize)adjustedInsets;
- (Class)repClassForTextLayout:(id)a3;
- (Class)repClassOverride;
- (SXStandaloneTextLayoutDelegate)delegate;
- (TSWPPadding)layoutMargins;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)dependentsOfTextLayout:(id)a3;
- (id)p_wpLayoutParent;
- (id)styleProviderForLayout:(id)a3;
- (unint64_t)columnCount;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SXStandaloneTextLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)computeLayoutGeometry
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained positionForTextLayout:self];
  double v6 = v5;

  id v7 = objc_loadWeakRetained((id *)p_delegate);
  [v7 marginForTextLayout:self];
  double v9 = v8;

  id v10 = objc_loadWeakRetained((id *)p_delegate);
  [v10 widthForTextLayout:self];
  double v12 = v11;

  v13 = [(TSDAbstractLayout *)self children];
  v14 = [v13 lastObject];

  if (v14)
  {
    [v14 frame];
    double v16 = v15;
  }
  else
  {
    double v16 = 0.0;
  }
  v17 = objc_msgSend(objc_alloc(MEMORY[0x263F7C6D0]), "initWithFrame:", v9, v6, v12 + v9 * -2.0, v16);

  return v17;
}

- (id)childInfosForLayout
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(TSDLayout *)self info];
  v3 = [v2 storage];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
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
  CGFloat height = a4.height;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained marginForTextLayout:self];
  double v9 = v8;

  id v10 = objc_loadWeakRetained((id *)p_delegate);
  [v10 widthForTextLayout:self];
  double v12 = v11 + v9 * -2.0;

  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v12;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (id)styleProviderForLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(SXStandaloneTextLayout *)self p_wpLayoutParent];
  double v6 = [v5 styleProviderForLayout:v4];

  return v6;
}

- (CGSize)adjustedInsets
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.CGFloat height = v3;
  result.width = v2;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  if (a3)
  {
    double v9 = [MEMORY[0x263F7C7F0] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[SXStandaloneTextLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]"];
    double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXStandaloneTextLayout.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:121 description:@"unexpected column index"];
  }
  if (a5) {
    *a5 = a4;
  }
  if (a6) {
    *a6 = 0.0;
  }
  return 0.0;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (id)p_wpLayoutParent
{
  double v2 = [(TSDAbstractLayout *)self parent];
  double v3 = TSUProtocolCast();

  return v3;
}

- (SXStandaloneTextLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXStandaloneTextLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end