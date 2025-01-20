@interface _UIMirrorNinePatchView
- (_UIMirrorNinePatchView)initWithFrame:(CGRect)a3;
- (void)_updateResizableImageAndViews;
- (void)layoutSubviews;
- (void)setImage:(id)a3 withResizableCornerSize:(CGSize)a4;
@end

@implementation _UIMirrorNinePatchView

- (_UIMirrorNinePatchView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIMirrorNinePatchView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    for (unint64_t i = 0; i != 4; ++i)
    {
      v6 = objc_alloc_init(UIImageView);
      [(UIImageView *)v6 setContentMode:0];
      [(UIView *)v6 setClipsToBounds:1];
      memset(&v11, 0, sizeof(v11));
      if (i) {
        double v7 = -1.0;
      }
      else {
        double v7 = 1.0;
      }
      if (i >= 2) {
        double v8 = -1.0;
      }
      else {
        double v8 = 1.0;
      }
      CGAffineTransformMakeScale(&v11, v7, v8);
      CGAffineTransform v10 = v11;
      [(UIView *)v6 setTransform:&v10];
      [(UIView *)v4 addSubview:v6];
      v4->_imageViews[i] = v6;
    }
  }
  return v4;
}

- (void)setImage:(id)a3 withResizableCornerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  objc_storeStrong((id *)&self->_originalImage, a3);
  id v8 = a3;
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  self->_insets.top = v12 - height;
  self->_insets.left = v10 - width;
  self->_insets.bottom = 0.0;
  self->_insets.right = 0.0;
  [(_UIMirrorNinePatchView *)self _updateResizableImageAndViews];
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v2 = self;
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  *(float *)&double v5 = v5 * 0.5;
  double v9 = floorf(*(float *)&v5);
  *(float *)&double v3 = v7 * 0.5;
  double v10 = floorf(*(float *)&v3);
  double v20 = v4 + 0.0;
  double v21 = v11;
  double v12 = v11 + 0.0;
  double v19 = v6 - (v9 + 0.0);
  double v13 = v7 - (v10 + 0.0);
  v2 = (_UIMirrorNinePatchView *)((char *)v2 + 448);
  -[objc_class setFrame:](v2->super.super.super.isa, "setFrame:");
  double v14 = v4 + v6 - v9;
  double v15 = v6 - (v6 - v9 + 0.0);
  objc_msgSend(*(id *)&v2->super.super._responderFlags, "setFrame:", v14, v12, v15, v13);
  double v16 = v21 + v8 - v10;
  double v17 = v8 - (v8 - v10 + 0.0);
  -[FBSSceneIdentityToken setFrame:](v2->super.super.__layeringSceneIdentity, "setFrame:", v20, v16, v19, v17);
  constraintsExceptingSubviewAutoresizingConstraints = v2->super._constraintsExceptingSubviewAutoresizingConstraints;
  -[NSMutableArray setFrame:](constraintsExceptingSubviewAutoresizingConstraints, "setFrame:", v14, v16, v15, v17);
}

- (void)_updateResizableImageAndViews
{
  double v3 = [(UIImage *)self->_originalImage imageAsset];
  double v4 = [(UIView *)self traitCollection];
  double v5 = [v3 imageWithTraitCollection:v4];
  originalImage = v5;
  if (!v5) {
    originalImage = self->_originalImage;
  }
  double v10 = originalImage;

  double v7 = -[UIImage resizableImageWithCapInsets:](v10, "resizableImageWithCapInsets:", self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);
  uint64_t v8 = 0;
  imageViews = self->_imageViews;
  do
    [(UIImageView *)imageViews[v8++] setImage:v7];
  while (v8 != 4);
}

- (void).cxx_destruct
{
}

@end