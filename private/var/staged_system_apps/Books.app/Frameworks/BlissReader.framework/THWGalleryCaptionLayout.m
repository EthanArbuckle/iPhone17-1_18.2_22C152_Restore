@interface THWGalleryCaptionLayout
- (BOOL)alwaysStartsNewTarget;
- (BOOL)columnsAreLeftToRight;
- (BOOL)shrinkTextToFit;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGSize)adjustedInsets;
- (Class)repClassForTextLayout:(id)a3;
- (Class)repClassOverride;
- (THWGalleryCaptionLayout)initWithDelegate:(id)a3;
- (THWGalleryCaptionLayoutDelegate)delegate;
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
- (void)captionStorageUpdated;
@end

@implementation THWGalleryCaptionLayout

- (THWGalleryCaptionLayout)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWGalleryCaptionLayout;
  result = [(THWGalleryCaptionLayout *)&v5 initWithInfo:0];
  if (result) {
    result->_delegate = (THWGalleryCaptionLayoutDelegate *)a3;
  }
  return result;
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)computeLayoutGeometry
{
  [(THWGalleryCaptionLayoutDelegate *)self->_delegate galleryCaptionPosition];
  double v4 = v3;
  [(THWGalleryCaptionLayoutDelegate *)self->_delegate galleryCaptionMargin];
  double v6 = v5;
  [(THWGalleryCaptionLayoutDelegate *)self->_delegate galleryCaptionWidth];
  double v8 = v7;
  id v9 = [[self children] lastObject];
  if (v9)
  {
    [v9 frame];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }
  id v12 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v6, v4, v8 + v6 * -2.0, v11];

  return v12;
}

- (id)childInfosForLayout
{
  id result = [(THWGalleryCaptionLayoutDelegate *)self->_delegate galleryCaptionStorage];
  if (result)
  {
    return +[NSArray arrayWithObject:result];
  }
  return result;
}

- (void)captionStorageUpdated
{
  [(THWGalleryCaptionLayout *)self invalidateFrame];

  [(THWGalleryCaptionLayout *)self invalidateChildren];
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
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  CGFloat height = a4.height;
  [(THWGalleryCaptionLayoutDelegate *)self->_delegate galleryCaptionMargin];
  double v7 = v6;
  [(THWGalleryCaptionLayoutDelegate *)self->_delegate galleryCaptionWidth];
  double v9 = v8 + v7 * -2.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.double width = v9;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return +[NSArray arrayWithObject:self];
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (id)styleProviderForLayout:(id)a3
{
  id v4 = [(THWGalleryCaptionLayout *)self p_wpLayoutParent];

  return [v4 styleProviderForLayout:a3];
}

- (CGSize)adjustedInsets
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
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
  if (a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWGalleryCaptionLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Gallery/THWGalleryCaptionLayout.m") lineNumber:138 description:@"unexpected column index"];
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
  [(THWGalleryCaptionLayout *)self parent];

  return (id)TSUProtocolCast();
}

- (THWGalleryCaptionLayoutDelegate)delegate
{
  return self->_delegate;
}

@end