@interface PXPeopleScalableAvatarView
- (BOOL)useLowMemoryMode;
- (PHFace)face;
- (PXPeopleScalableAvatarView)initWithFrame:(CGRect)a3;
- (PXPerson)person;
- (UIImageView)imageView;
- (double)imageViewCornerRadius;
- (int64_t)cornerStyle;
- (void)_updateImageAndWait:(BOOL)a3;
- (void)layoutSubviews;
- (void)setCornerStyle:(int64_t)a3;
- (void)setFace:(id)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewCornerRadius:(double)a3;
- (void)setPerson:(id)a3;
- (void)setPersonAndWaitForImage:(id)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)updateImage;
@end

@implementation PXPeopleScalableAvatarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (double)imageViewCornerRadius
{
  return self->_imageViewCornerRadius;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (PHFace)face
{
  return self->_face;
}

- (PXPerson)person
{
  return self->_person;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 448, 1);
}

- (void)_updateImageAndWait:(BOOL)a3
{
  uint64_t v4 = [(PXPeopleScalableAvatarView *)self person];
  uint64_t v5 = [(PXPeopleScalableAvatarView *)self face];
  if (v4 | v5)
  {
    [(PXPeopleScalableAvatarView *)self bounds];
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    double width = v25.size.width;
    double height = v25.size.height;
    double v10 = CGRectGetWidth(v25);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    double v11 = CGRectGetHeight(v26);
    [(PXSmartScaleView *)self displayScale];
    double v13 = v12;
    double v14 = v10 - v11;
    if (v10 - v11 < 0.0) {
      double v14 = -(v10 - v11);
    }
    if (v14 >= 2.0)
    {
      v15 = [(PXPeopleScalableAvatarView *)self imageView];
      [v15 setContentMode:2];
    }
    else
    {
      if (v10 >= v11) {
        double v10 = v11;
      }
      double v11 = v10;
      double height = v10;
      double width = v10;
    }
    self->_imagePixelSize.double width = v10;
    self->_imagePixelSize.double height = v11;
    int64_t v16 = [(PXPeopleScalableAvatarView *)self cornerStyle];
    if (v16 == 1)
    {
      +[PXPeopleFaceCropManager roundedCornerRadiusForTargetSize:displayScale:](PXPeopleFaceCropManager, "roundedCornerRadiusForTargetSize:displayScale:", width, height, v13);
    }
    else
    {
      double v17 = 0.0;
      if (v16 == 2)
      {
        double v17 = width * 0.5;
        if (width * 0.5 < 0.0) {
          double v17 = 0.0;
        }
      }
    }
    [(PXPeopleScalableAvatarView *)self setImageViewCornerRadius:v17];
    if (height > 0.0 && width > 0.0)
    {
      v18 = [PXPeopleFaceCropFetchOptions alloc];
      if (v4) {
        v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v18, "initWithPerson:targetSize:displayScale:", v4, width, height, v13);
      }
      else {
        v19 = -[PXPeopleFaceCropFetchOptions initWithFace:targetSize:displayScale:](v18, "initWithFace:targetSize:displayScale:", v5, width, height, v13);
      }
      v20 = v19;
      [(PXPeopleFaceCropFetchOptions *)v19 setUseLowMemoryMode:[(PXPeopleScalableAvatarView *)self useLowMemoryMode]];
      [(PXPeopleFaceCropFetchOptions *)v20 setCornerStyle:[(PXPeopleScalableAvatarView *)self cornerStyle]];
      v21 = +[PXPeopleFaceCropManager sharedManager];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__PXPeopleScalableAvatarView__updateImageAndWait___block_invoke;
      v22[3] = &unk_1E5DC48E0;
      v22[4] = self;
      id v23 = (id)v4;
      id v24 = (id)v5;
      [v21 requestFaceCropForOptions:v20 resultHandler:v22];
    }
  }
}

void __50__PXPeopleScalableAvatarView__updateImageAndWait___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
  [(id)objc_claimAutoreleasedReturnValue() CGRectValue];
  *(id *)(a1 + 40);
  *(id *)(a1 + 48);
  id v6 = v5;
  px_dispatch_on_main_queue();
}

void __50__PXPeopleScalableAvatarView__updateImageAndWait___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) person];
  if (v2 == *(void **)(a1 + 40))
  {
    id v10 = v2;
    v3 = [*(id *)(a1 + 32) face];
    uint64_t v4 = *(void **)(a1 + 48);

    if (v3 != v4) {
      return;
    }
    id v11 = [*(id *)(a1 + 32) imageView];
    [v11 setImage:*(void *)(a1 + 56)];
    double v5 = *(double *)(a1 + 64);
    double v6 = *(double *)(a1 + 72);
    double v7 = *(double *)(a1 + 80);
    double v8 = *(double *)(a1 + 88);
    v9 = [v11 layer];
    objc_msgSend(v9, "setContentsRect:", v5, v6, v7, v8);

    v2 = v11;
  }
}

- (void)updateImage
{
}

- (void)setPersonAndWaitForImage:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
  [(PXPeopleScalableAvatarView *)self _updateImageAndWait:1];
}

- (void)setImageViewCornerRadius:(double)a3
{
  if (self->_imageViewCornerRadius != a3)
  {
    self->_imageViewCornerRadius = a3;
    [(PXPeopleScalableAvatarView *)self setNeedsLayout];
  }
}

- (void)setCornerStyle:(int64_t)a3
{
  if (self->_cornerStyle != a3)
  {
    self->_cornerStyle = a3;
    [(PXPeopleScalableAvatarView *)self updateImage];
  }
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
  [(PXPeopleScalableAvatarView *)self updateImage];
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
  [(PXPeopleScalableAvatarView *)self updateImage];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleScalableAvatarView;
  [(PXPeopleScalableAvatarView *)&v14 layoutSubviews];
  v3 = [(PXPeopleScalableAvatarView *)self imageView];
  [(PXPeopleScalableAvatarView *)self bounds];
  objc_msgSend(v3, "setFrame:");
  [(PXPeopleScalableAvatarView *)self imageViewCornerRadius];
  double v5 = v4;
  double v6 = [v3 layer];
  [v6 setCornerRadius:v5];

  [(PXPeopleScalableAvatarView *)self bounds];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  double v11 = vabdd_f64(CGRectGetHeight(v15), self->_imagePixelSize.height);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v12 = vabdd_f64(CGRectGetWidth(v16), self->_imagePixelSize.width);
  if (v11 > 5.0 || v12 > 5.0) {
    [(PXPeopleScalableAvatarView *)self updateImage];
  }
}

- (PXPeopleScalableAvatarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleScalableAvatarView;
  double v7 = -[PXPeopleScalableAvatarView initWithFrame:](&v12, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v8;

    [(UIImageView *)v7->_imageView setAccessibilityIgnoresInvertColors:1];
    v7->_cornerStyle = +[PXPeopleFaceCropFetchOptions recommendedCornerStyleForCurrentAppConfiguration];
    id v10 = [(UIImageView *)v7->_imageView layer];
    [v10 setMasksToBounds:1];

    [(PXPeopleScalableAvatarView *)v7 addSubview:v7->_imageView];
  }
  return v7;
}

@end