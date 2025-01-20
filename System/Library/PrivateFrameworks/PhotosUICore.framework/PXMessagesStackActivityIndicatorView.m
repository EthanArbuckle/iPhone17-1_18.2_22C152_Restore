@interface PXMessagesStackActivityIndicatorView
- (CGRect)clippingRect;
- (NSCopying)userData;
- (PXMessagesStackActivityIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXMessagesStackActivityIndicatorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->clippingRect.origin.x;
  double y = self->clippingRect.origin.y;
  double width = self->clippingRect.size.width;
  double height = self->clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSCopying)userData
{
  return (NSCopying *)self->_userData;
}

- (void)setUserData:(id)a3
{
  v9 = (PXMessagesStackActivityIndicatorViewUserData *)a3;
  v4 = self->_userData;
  if (v4 == v9)
  {
  }
  else
  {
    v5 = v4;
    char v6 = [(PXMessagesStackActivityIndicatorViewUserData *)v4 isEqual:v9];

    if ((v6 & 1) == 0)
    {
      v7 = [(PXMessagesStackActivityIndicatorViewUserData *)v9 copyWithZone:0];
      userData = self->_userData;
      self->_userData = v7;

      if (self->_userData) {
        [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
      }
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackActivityIndicatorView;
  [(PXMessagesStackActivityIndicatorView *)&v3 layoutSubviews];
  -[UIActivityIndicatorView sizeThatFits:](self->_activityIndicatorView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  PXSizeAdd();
}

- (PXMessagesStackActivityIndicatorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXMessagesStackActivityIndicatorView;
  objc_super v3 = -[PXMessagesStackActivityIndicatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v5;

    [(UIVisualEffectView *)v3->_visualEffectView _setContinuousCornerRadius:5.0];
    [(UIVisualEffectView *)v3->_visualEffectView setClipsToBounds:1];
    [(PXMessagesStackActivityIndicatorView *)v3 addSubview:v3->_visualEffectView];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    activityIndicatorView = v3->_activityIndicatorView;
    v3->_activityIndicatorView = (UIActivityIndicatorView *)v7;

    [(UIActivityIndicatorView *)v3->_activityIndicatorView setHidesWhenStopped:0];
    [(UIActivityIndicatorView *)v3->_activityIndicatorView startAnimating];
    v9 = [(UIVisualEffectView *)v3->_visualEffectView contentView];
    [v9 addSubview:v3->_activityIndicatorView];
  }
  return v3;
}

@end