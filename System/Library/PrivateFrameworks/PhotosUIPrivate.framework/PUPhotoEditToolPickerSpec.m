@interface PUPhotoEditToolPickerSpec
- (PUPhotoEditToolPickerSpec)init;
- (double)dashSelectionIndicatorDistance;
- (double)dotSelectionIndicatorDistance;
- (double)horizontalToolBottomSpacing;
- (double)horizontalToolTopSpacing;
- (double)interToolSpacing;
- (double)interToolVerticalSpacingForToolCount:(unint64_t)a3;
- (double)toolButtonPointerInteractionHighlightPadding;
- (double)toolParentViewEdgeSpacing;
- (void)setDashSelectionIndicatorDistance:(double)a3;
- (void)setDotSelectionIndicatorDistance:(double)a3;
- (void)setHorizontalToolBottomSpacing:(double)a3;
- (void)setHorizontalToolTopSpacing:(double)a3;
- (void)setToolButtonPointerInteractionHighlightPadding:(double)a3;
- (void)setToolParentViewEdgeSpacing:(double)a3;
@end

@implementation PUPhotoEditToolPickerSpec

- (void)setToolButtonPointerInteractionHighlightPadding:(double)a3
{
  self->_toolButtonPointerInteractionHighlightPadding = a3;
}

- (double)toolButtonPointerInteractionHighlightPadding
{
  return self->_toolButtonPointerInteractionHighlightPadding;
}

- (void)setDashSelectionIndicatorDistance:(double)a3
{
  self->_dashSelectionIndicatorDistance = a3;
}

- (double)dashSelectionIndicatorDistance
{
  return self->_dashSelectionIndicatorDistance;
}

- (void)setDotSelectionIndicatorDistance:(double)a3
{
  self->_dotSelectionIndicatorDistance = a3;
}

- (double)dotSelectionIndicatorDistance
{
  return self->_dotSelectionIndicatorDistance;
}

- (void)setHorizontalToolBottomSpacing:(double)a3
{
  self->_horizontalToolBottomSpacing = a3;
}

- (double)horizontalToolBottomSpacing
{
  return self->_horizontalToolBottomSpacing;
}

- (void)setHorizontalToolTopSpacing:(double)a3
{
  self->_horizontalToolTopSpacing = a3;
}

- (double)horizontalToolTopSpacing
{
  return self->_horizontalToolTopSpacing;
}

- (void)setToolParentViewEdgeSpacing:(double)a3
{
  self->_toolParentViewEdgeSpacing = a3;
}

- (double)toolParentViewEdgeSpacing
{
  return self->_toolParentViewEdgeSpacing;
}

- (double)interToolVerticalSpacingForToolCount:(unint64_t)a3
{
  [(PUViewControllerSpec *)self layoutReferenceSize];
  double v6 = v5;
  unint64_t v7 = [(PUViewControllerSpec *)self currentLayoutStyle];
  if (v7 < 2)
  {
    BOOL v9 = a3 > 5;
    double result = 12.0;
    double v10 = 6.0;
LABEL_9:
    if (v9) {
      return v10;
    }
    return result;
  }
  if (v7 != 2)
  {
    double result = 22.0;
    if (v7 != 3) {
      return result;
    }
    BOOL v9 = v6 <= 402.0 && a3 > 5;
    double result = 16.0;
    double v10 = 8.0;
    goto LABEL_9;
  }
  if (a3 < 6) {
    return 14.0;
  }
  double result = 6.0;
  if (v6 > 375.0)
  {
    double result = 8.0;
    if (v6 > 393.0) {
      return 14.0;
    }
  }
  return result;
}

- (double)interToolSpacing
{
  int64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 28.0;
  if (v2 == 1) {
    return 18.0;
  }
  return result;
}

- (PUPhotoEditToolPickerSpec)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditToolPickerSpec;
  int64_t v2 = [(PUViewControllerSpec *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_toolParentViewEdgeSpacing = 10.0;
    v2->_horizontalToolTopSpacing = 12.0;
    v2->_horizontalToolBottomSpacing = 0.0;
    v2->_dotSelectionIndicatorDistance = 0.0;
    v2->_dashSelectionIndicatorDistance = 5.0;
    v2->_toolButtonPointerInteractionHighlightPadding = 6.0;
    v4 = v2;
  }

  return v3;
}

@end