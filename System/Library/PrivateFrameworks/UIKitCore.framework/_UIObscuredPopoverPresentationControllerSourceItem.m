@interface _UIObscuredPopoverPresentationControllerSourceItem
+ (id)obscuredSourceItemForItem:(id)a3;
- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4;
- (CGRect)_sourceRectForPresentationInWindow:(id)a3;
- (CGRect)frameInView:(id)a3;
- (id)_nearestViewController;
- (id)_sourceViewForPresentationInWindow:(id)a3;
@end

@implementation _UIObscuredPopoverPresentationControllerSourceItem

+ (id)obscuredSourceItemForItem:(id)a3
{
  id v4 = a3;
  objc_getAssociatedObject(v4, &obscuredSourceItemForItem___UIObscuredPopoverPresentationControllerSourceItemTag);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (id *)objc_opt_new();
    objc_storeStrong(v5 + 1, a3);
    objc_setAssociatedObject(v4, &obscuredSourceItemForItem___UIObscuredPopoverPresentationControllerSourceItemTag, v5, (void *)1);
  }

  return v5;
}

- (CGRect)frameInView:(id)a3
{
  [(_UIObscuredPopoverPresentationControllerSourceItem *)self _frameInCoordinateSpace:a3 window:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  [(_UIPopoverPresentationControllerSourceItem_Internal *)self->_sourceItem _frameInCoordinateSpace:a3 window:a4];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)_nearestViewController
{
  return (id)[(_UIPopoverPresentationControllerSourceItem_Internal *)self->_sourceItem _nearestViewController];
}

- (id)_sourceViewForPresentationInWindow:(id)a3
{
  return (id)[(_UIPopoverPresentationControllerSourceItem_Internal *)self->_sourceItem _sourceViewForPresentationInWindow:a3];
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  [(_UIPopoverPresentationControllerSourceItem_Internal *)self->_sourceItem _sourceRectForPresentationInWindow:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void).cxx_destruct
{
}

@end