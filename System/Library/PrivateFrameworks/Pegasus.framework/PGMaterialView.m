@interface PGMaterialView
- (BOOL)PG_preferredVisibilityForView:(id)a3;
- (BOOL)isBackdropHidden;
- (PGMaterialView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (double)_continuousCornerRadius;
- (double)_cornerRadius;
- (id)backgroundColor;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)addSubview:(id)a3;
- (void)layoutSubviews;
- (void)setBackdropHidden:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation PGMaterialView

- (PGMaterialView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PGMaterialView;
  v3 = -[PGLayoutContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PGCABackdropLayerView alloc];
    [(PGMaterialView *)v3 bounds];
    uint64_t v5 = -[PGCABackdropLayerView initWithFrame:](v4, "initWithFrame:");
    backdropLayerView = v3->_backdropLayerView;
    v3->_backdropLayerView = (PGCABackdropLayerView *)v5;

    [(PGMaterialView *)v3 insertSubview:v3->_backdropLayerView atIndex:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PGMaterialView;
  [(PGMaterialView *)&v5 layoutSubviews];
  backdropLayerView = self->_backdropLayerView;
  [(PGMaterialView *)self bounds];
  -[PGCABackdropLayerView setFrame:](backdropLayerView, "setFrame:");
  contentView = self->_contentView;
  [(PGMaterialView *)self bounds];
  -[UIView setFrame:](contentView, "setFrame:");
}

- (void)addSubview:(id)a3
{
  objc_super v5 = (PGCABackdropLayerView *)a3;
  v6 = v5;
  if ((PGCABackdropLayerView *)self->_contentView != v5 && self->_backdropLayerView != v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PGMaterialView.m", 44, @"Invalid parameter not satisfying: %@", @"view == _contentView || view == _backdropLayerView" object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)PGMaterialView;
  [(PGMaterialView *)&v8 addSubview:v6];
}

- (id)backgroundColor
{
  return [(PGCABackdropLayerView *)self->_backdropLayerView customBackgroundColor];
}

- (void)setBackgroundColor:(id)a3
{
  id v7 = a3;
  v4 = [(PGMaterialView *)self backgroundColor];
  if ([v7 isEqual:v4])
  {
  }
  else
  {
    id v5 = [(PGMaterialView *)self backgroundColor];

    v6 = v7;
    if (v5 == v7) {
      goto LABEL_6;
    }
    [(PGCABackdropLayerView *)self->_backdropLayerView setCustomBackgroundColor:v7];
  }
  v6 = v7;
LABEL_6:
}

- (double)_cornerRadius
{
  [(PGCABackdropLayerView *)self->_backdropLayerView _cornerRadius];
  return result;
}

- (void)_setCornerRadius:(double)a3
{
}

- (double)_continuousCornerRadius
{
  [(PGCABackdropLayerView *)self->_backdropLayerView _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

- (BOOL)isBackdropHidden
{
  return [(PGCABackdropLayerView *)self->_backdropLayerView isHidden];
}

- (void)setBackdropHidden:(BOOL)a3
{
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = [PGLayoutContainerView alloc];
    [(PGMaterialView *)self bounds];
    id v5 = -[PGLayoutContainerView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_contentView;
    self->_contentView = v5;

    id v7 = self->_contentView;
    objc_super v8 = [(PGMaterialView *)self subviews];
    -[PGMaterialView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, [v8 count]);

    [(UIView *)self PG_recursivelyDisallowGroupBlending];
    contentView = self->_contentView;
  }

  return contentView;
}

- (BOOL)PG_preferredVisibilityForView:(id)a3
{
  v4 = (PGCABackdropLayerView *)a3;
  id v5 = [(PGMaterialView *)self superview];
  v6 = v5;
  if (self->_backdropLayerView == v4) {
    id v7 = self;
  }
  else {
    id v7 = (PGMaterialView *)v4;
  }
  char v8 = objc_msgSend(v5, "PG_preferredVisibilityForView:", v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backdropLayerView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end