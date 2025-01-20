@interface PXPhotosGridTitleBackdropBlurView
- (CGRect)clippingRect;
- (NSString)userData;
- (PXPhotosGridTitleBackdropBlurView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXPhotosGridTitleBackdropBlurView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

- (NSString)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUserData:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_userData;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      userData = self->_userData;
      self->_userData = v6;

      [(UIVisualEffectView *)self->_visualEffectView _setGroupName:self->_userData];
    }
  }
}

- (void)layoutSubviews
{
  [(PXPhotosGridTitleBackdropBlurView *)self bounds];
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:");
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridTitleBackdropBlurView;
  [(PXPhotosGridTitleBackdropBlurView *)&v3 layoutSubviews];
}

- (PXPhotosGridTitleBackdropBlurView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosGridTitleBackdropBlurView;
  objc_super v3 = -[PXPhotosGridTitleBackdropBlurView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v5;

    [(PXPhotosGridTitleBackdropBlurView *)v3 addSubview:v3->_visualEffectView];
  }
  return v3;
}

@end