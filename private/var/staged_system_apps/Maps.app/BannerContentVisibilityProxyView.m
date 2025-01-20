@interface BannerContentVisibilityProxyView
- (UIView)visibilityModel;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setVisibilityModel:(id)a3;
@end

@implementation BannerContentVisibilityProxyView

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityModel);
  [WeakRetained removeObserver:self forKeyPath:@"hidden" context:&off_1012F7460];

  v4.receiver = self;
  v4.super_class = (Class)BannerContentVisibilityProxyView;
  [(BannerContentVisibilityProxyView *)&v4 dealloc];
}

- (void)setVisibilityModel:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityModel);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [WeakRetained removeObserver:self forKeyPath:@"hidden" context:&off_1012F7460];
    }
    v5 = obj;
    if (obj)
    {
      [obj addObserver:self forKeyPath:@"hidden" options:0 context:&off_1012F7460];
      -[BannerContentVisibilityProxyView setHidden:](self, "setHidden:", [obj isHidden]);
      v5 = obj;
    }
    objc_storeWeak((id *)&self->_visibilityModel, v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if (a6 == &off_1012F7460)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[BannerContentVisibilityProxyView setHidden:](self, "setHidden:", [v10 isHidden]);
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)BannerContentVisibilityProxyView;
    [(BannerContentVisibilityProxyView *)&v11 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (UIView)visibilityModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityModel);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end