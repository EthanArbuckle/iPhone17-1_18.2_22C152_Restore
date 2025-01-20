@interface PUPhotoEditApertureButton
- (CGRect)_pointerRect;
- (PUPhotoEditApertureButton)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation PUPhotoEditApertureButton

- (CGRect)_pointerRect
{
  PXEdgeInsetsMake();
  [(PUPhotoEditApertureButton *)self tappableEdgeInsets];
  [(PUPhotoEditApertureButton *)self frame];
  PXEdgeInsetsInsetRect();
  PXEdgeInsetsInsetRect();
  double v7 = v6 + v5 * 0.5 + -18.5;
  double v8 = 37.0;
  result.size.height = v8;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v3;
  return result;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  double v6 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v5];
  [(PUPhotoEditApertureButton *)self _pointerRect];
  double v7 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:");
  double v8 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v7];

  return v8;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (PUPhotoEditApertureButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditApertureButton;
  double v3 = -[PUPhotoEditApertureButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    [(PUPhotoEditApertureButton *)v3 addInteraction:v4];
    double v5 = +[PUInterfaceManager currentTheme];
    double v6 = [v5 photoEditingToolbarButtonSelectedColor];
    [(PUPhotoEditApertureButton *)v3 setTintColor:v6];
  }
  return v3;
}

@end