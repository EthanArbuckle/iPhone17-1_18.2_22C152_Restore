@interface THWReviewTextAnswerLayout
- (BOOL)alwaysStartsNewTarget;
- (BOOL)columnsAreLeftToRight;
- (BOOL)shouldHyphenateTextLayout:(id)a3;
- (BOOL)shrinkTextToFit;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)labelFrame;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGSize)adjustedInsets;
- (Class)repClassForTextLayout:(id)a3;
- (Class)repClassOverride;
- (THWReviewChoice)choice;
- (THWReviewTextAnswerLayout)initWithChoice:(id)a3 index:(unint64_t)a4 delegate:(id)a5;
- (THWReviewTextAnswerLayoutDelegate)delegate;
- (THWReviewTextAnswerStyleProvider)styleProvider;
- (TSWPPadding)layoutMargins;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)horizontalOffset;
- (double)p_maxTextWidth;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)textWidth;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)dependentsOfTextLayout:(id)a3;
- (id)p_wpLayout;
- (id)styleProviderForLayout:(id)a3;
- (unint64_t)columnCount;
- (unint64_t)index;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)dealloc;
- (void)setHorizontalOffset:(double)a3;
@end

@implementation THWReviewTextAnswerLayout

- (THWReviewTextAnswerLayout)initWithChoice:(id)a3 index:(unint64_t)a4 delegate:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)THWReviewTextAnswerLayout;
  v8 = [(THWReviewTextAnswerLayout *)&v11 initWithInfo:0];
  v9 = v8;
  if (v8)
  {
    v8->_index = a4;
    v8->_choice = (THWReviewChoice *)a3;
    v9->_delegate = (THWReviewTextAnswerLayoutDelegate *)a5;
    v9->_styleProvider = [[THWReviewTextAnswerStyleProvider alloc] initWithIndex:a4 storage:[(THWReviewChoice *)v9->_choice contentStorage] listLabelStyle:[(THWReviewTextAnswerLayoutDelegate *)v9->_delegate reviewTextAnswerLayoutListLabelParagraphStyle:v9]];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextAnswerLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)childInfosForLayout
{
  id result = [(THWReviewChoice *)self->_choice contentStorage];
  if (result)
  {
    return +[NSArray arrayWithObject:result];
  }
  return result;
}

- (id)computeLayoutGeometry
{
  [self p_wpLayout].frame
  double v4 = v3;
  [(THWReviewTextAnswerLayout *)self p_maxTextWidth];
  if (v4 < 6.0) {
    double v4 = 6.0;
  }
  id v6 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:0.0, 0.0, v5, v4];

  return v6;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 7;
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
  double height = a4.height;
  double width = a4.width;
  double horizontalOffset = self->_horizontalOffset;
  double v7 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v7;
  result.origin.double x = horizontalOffset;
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
  return self->_styleProvider;
}

- (BOOL)shouldHyphenateTextLayout:(id)a3
{
  return 1;
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
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewTextAnswerLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewTextAnswerLayout.m") lineNumber:258 description:@"unexpected column index"];
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

- (double)p_maxTextWidth
{
  delegate = self->_delegate;
  if (!delegate) {
    return 100.0;
  }
  [(THWReviewTextAnswerLayoutDelegate *)delegate reviewTextAnswerLayoutWidth:self];
  return result;
}

- (id)p_wpLayout
{
  id result = [(THWReviewChoice *)self->_choice contentStorage];
  if (result)
  {
    id v4 = result;
    objc_opt_class();
    [layoutController layoutForInfo:v4 childOfLayout:self];
    return (id)TSUDynamicCast();
  }
  return result;
}

- (double)textWidth
{
  id v2 = [self p_wpLayout].geometry;

  [v2 size];
  return result;
}

- (void)setHorizontalOffset:(double)a3
{
  if (self->_horizontalOffset != a3)
  {
    [self p_wpLayout].offsetGeometryBy:(a3 - self->_horizontalOffset) y:0.0;
    self->_double horizontalOffset = a3;
  }
}

- (CGRect)labelFrame
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  id v6 = [(THWReviewTextAnswerLayout *)self p_wpLayout];
  if (v6)
  {
    double v7 = v6;
    id v8 = [[v6 columns] lastObject];
    if ([v8 countLines])
    {
      [v8 labelBoundsOfLineFragmentAtIndex:0];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [v7 transform];
      v22.origin.CGFloat x = v10;
      v22.origin.CGFloat y = v12;
      v22.size.CGFloat width = v14;
      v22.size.CGFloat height = v16;
      CGRect v23 = CGRectApplyAffineTransform(v22, &v21);
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat width = v23.size.width;
      CGFloat height = v23.size.height;
    }
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (THWReviewChoice)choice
{
  return self->_choice;
}

- (double)horizontalOffset
{
  return self->_horizontalOffset;
}

- (unint64_t)index
{
  return self->_index;
}

- (THWReviewTextAnswerLayoutDelegate)delegate
{
  return self->_delegate;
}

- (THWReviewTextAnswerStyleProvider)styleProvider
{
  return self->_styleProvider;
}

@end