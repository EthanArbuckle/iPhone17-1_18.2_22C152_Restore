@interface THWReviewDraggablePlacardLayout
- (BOOL)allowsLastLineTruncation:(id)a3;
- (BOOL)alwaysStartsNewTarget;
- (BOOL)columnsAreLeftToRight;
- (BOOL)shrinkTextToFit;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGSize)adjustedInsets;
- (Class)repClassForTextLayout:(id)a3;
- (Class)repClassOverride;
- (NSString)contentImageAccessibilityDescription;
- (THWReviewChoice)choice;
- (THWReviewDraggablePlacardLayout)init;
- (THWReviewDraggablePlacardLayout)initWithIndex:(unint64_t)a3 choice:(id)a4 delegate:(id)a5;
- (THWReviewDraggablePlacardLayoutDelegate)delegate;
- (TSUImage)contentImage;
- (TSWPPadding)layoutMargins;
- (TSWPStorage)contentStorage;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)maxAutoGrowWidthForTextLayout:(id)a3;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)additionalLayouts;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)dependentsOfTextLayout:(id)a3;
- (id)p_wpLayout;
- (int)placement;
- (unint64_t)columnCount;
- (unint64_t)index;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)maxLineCountForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)dealloc;
- (void)invalidatePlacement;
- (void)setContentImage:(id)a3;
- (void)setContentStorage:(id)a3;
- (void)setPlacement:(int)a3;
@end

@implementation THWReviewDraggablePlacardLayout

- (THWReviewDraggablePlacardLayout)initWithIndex:(unint64_t)a3 choice:(id)a4 delegate:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)THWReviewDraggablePlacardLayout;
  v8 = [(THWReviewDraggablePlacardLayout *)&v11 initWithInfo:0];
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    v8->_choice = (THWReviewChoice *)a4;
    v9->_delegate = (THWReviewDraggablePlacardLayoutDelegate *)a5;
  }
  return v9;
}

- (THWReviewDraggablePlacardLayout)init
{
  return [(THWReviewDraggablePlacardLayout *)self initWithIndex:0x7FFFFFFFFFFFFFFFLL choice:0 delegate:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewDraggablePlacardLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (void)setPlacement:(int)a3
{
  if (self->_placement != a3)
  {
    self->_placement = a3;
    if (self->_contentStorage) {
      [(THWReviewDraggablePlacardLayout *)self invalidatePlacement];
    }
  }
}

- (void)invalidatePlacement
{
  [(THWReviewDraggablePlacardLayout *)self invalidateFrame];
  id v3 = [(THWReviewDraggablePlacardLayout *)self p_wpLayout];

  [v3 invalidateSize];
}

- (id)p_wpLayout
{
  if (!self->_contentStorage) {
    return 0;
  }
  objc_opt_class();
  [layoutController layoutForInfo:self->_contentStorage childOfLayout:self];

  return (id)TSUDynamicCast();
}

- (id)computeLayoutGeometry
{
  delegate = self->_delegate;
  if (delegate)
  {
    [(THWReviewDraggablePlacardLayoutDelegate *)delegate draggablePlacardLayoutInsets:self];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = TSDEdgeInsetsZero[0].f64[0];
    double v7 = TSDEdgeInsetsZero[0].f64[1];
    double v9 = TSDEdgeInsetsZero[1].f64[0];
    double v11 = TSDEdgeInsetsZero[1].f64[1];
  }
  contentImage = self->_contentImage;
  if (contentImage)
  {
    v13 = self->_delegate;
    [(TSUImage *)contentImage size];
    if (v13) {
      -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayout:imageSizeForSize:](v13, "draggablePlacardLayout:imageSizeForSize:", self);
    }
    double width = v11 + v7 + v14;
    double height = v9 + v5 + v15;
  }
  else if (self->_contentStorage)
  {
    id v18 = [(THWReviewDraggablePlacardLayout *)self p_wpLayout];
    [v18 frame];
    double v20 = v19;
    double v22 = v5 + v21;
    v23 = self->_delegate;
    if (self->_placement)
    {
      if (v23)
      {
        [(THWReviewDraggablePlacardLayoutDelegate *)v23 draggablePlacardLayoutTextInsets:self];
      }
      else
      {
        double v24 = TSDEdgeInsetsZero[0].f64[1];
        double v25 = TSDEdgeInsetsZero[1].f64[1];
      }
      double width = v20 + v24 + v25;
    }
    else
    {
      [(THWReviewDraggablePlacardLayoutDelegate *)v23 draggablePlacardLayoutTextWidth:self];
      double width = v11 + v7 + v26;
    }
    double height = v9 + v22;
    [v18 frame];
    TSDSubtractPoints();
    [v18 offsetGeometryBy:];
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  v27 = self->_delegate;
  if (v27) {
    -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayout:originForSize:](v27, "draggablePlacardLayout:originForSize:", self, width, height);
  }
  TSDRectWithOriginAndSize();
  id v32 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v28, v29, v30, v31];

  return v32;
}

- (id)childInfosForLayout
{
  if (self->_contentStorage) {
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:");
  }
  else {
    return 0;
  }
}

- (id)additionalLayouts
{
  return 0;
}

- (void)setContentStorage:(id)a3
{
  contentImage = self->_contentImage;
  if (contentImage)
  {

    self->_contentImage = 0;
    p_contentStorage = &self->_contentStorage;
    contentStorage = self->_contentStorage;
    if (contentStorage == a3) {
      goto LABEL_6;
    }
  }
  else
  {
    p_contentStorage = &self->_contentStorage;
    contentStorage = self->_contentStorage;
    if (contentStorage == a3) {
      return;
    }
  }

  *p_contentStorage = (TSWPStorage *)a3;
LABEL_6:

  [(THWContainerLayout *)self invalidate];
}

- (void)setContentImage:(id)a3
{
  contentStorage = self->_contentStorage;
  if (contentStorage)
  {

    self->_contentStorage = 0;
    p_contentImage = &self->_contentImage;
    contentImage = self->_contentImage;
    if (contentImage == a3) {
      goto LABEL_6;
    }
  }
  else
  {
    p_contentImage = &self->_contentImage;
    contentImage = self->_contentImage;
    if (contentImage == a3) {
      return;
    }
  }

  *p_contentImage = (TSUImage *)a3;
LABEL_6:

  [(THWContainerLayout *)self invalidate];
}

- (NSString)contentImageAccessibilityDescription
{
  v2 = [(THWReviewDraggablePlacardLayout *)self choice];

  return [(THWReviewChoice *)v2 accessibilityDescription];
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 12;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 1;
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
  CGFloat width = a4.width;
  delegate = self->_delegate;
  if (delegate)
  {
    -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayoutInsets:](delegate, "draggablePlacardLayoutInsets:", self, a4.width, a4.height);
    float64_t v8 = v7;
    float64_t v10 = v9;
    delegate = self->_delegate;
  }
  else
  {
    float64_t v8 = TSDEdgeInsetsZero[0].f64[0];
    float64_t v10 = TSDEdgeInsetsZero[1].f64[0];
  }
  [(THWReviewDraggablePlacardLayoutDelegate *)delegate draggablePlacardLayoutTextHeight:self];
  double v12 = v11;
  double v13 = v8;
  double v14 = v10;
  double v15 = width;
  result.size.double height = v12;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
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

- (double)maxAutoGrowWidthForTextLayout:(id)a3
{
  [(THWReviewDraggablePlacardLayoutDelegate *)self->_delegate draggablePlacardLayoutTextMaxWidth:self];
  return result;
}

- (BOOL)allowsLastLineTruncation:(id)a3
{
  return 1;
}

- (unsigned)maxLineCountForTextLayout:(id)a3
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

- (THWReviewChoice)choice
{
  return self->_choice;
}

- (unint64_t)index
{
  return self->_index;
}

- (THWReviewDraggablePlacardLayoutDelegate)delegate
{
  return self->_delegate;
}

- (TSWPStorage)contentStorage
{
  return self->_contentStorage;
}

- (TSUImage)contentImage
{
  return self->_contentImage;
}

- (int)placement
{
  return self->_placement;
}

@end