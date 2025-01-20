@interface DragAndDropPreviewImage
- (BOOL)nightMode;
- (UIBezierPath)visiblePath;
- (UIDragPreview)dragPreview;
- (UIImage)image;
- (double)cornerRadius;
- (id)targetedDragPreviewWithTarget:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setImage:(id)a3;
- (void)setNightMode:(BOOL)a3;
- (void)setVisiblePath:(id)a3;
@end

@implementation DragAndDropPreviewImage

- (UIDragPreview)dragPreview
{
  id v3 = objc_alloc_init((Class)UIDragPreviewParameters);
  v4 = [(DragAndDropPreviewImage *)self visiblePath];
  [v3 setVisiblePath:v4];

  id v5 = objc_alloc((Class)UIImageView);
  v6 = [(DragAndDropPreviewImage *)self image];
  id v7 = [v5 initWithImage:v6];

  id v8 = [objc_alloc((Class)UIDragPreview) initWithView:v7 parameters:v3];

  return (UIDragPreview *)v8;
}

- (id)targetedDragPreviewWithTarget:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)UIDragPreviewParameters);
  v6 = [(DragAndDropPreviewImage *)self visiblePath];
  [v5 setVisiblePath:v6];

  id v7 = objc_alloc((Class)UIImageView);
  id v8 = [(DragAndDropPreviewImage *)self image];
  id v9 = [v7 initWithImage:v8];

  id v10 = [objc_alloc((Class)UITargetedDragPreview) initWithView:v9 parameters:v5 target:v4];

  return v10;
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(BOOL)a3
{
  self->_nightMode = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIBezierPath)visiblePath
{
  return self->_visiblePath;
}

- (void)setVisiblePath:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visiblePath, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end