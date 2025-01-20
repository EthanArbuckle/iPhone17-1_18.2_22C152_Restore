@interface BKTOCWebViewTableViewCell
- (BKTOCImageCache2)imageCache;
- (NSString)selectedCacheKey;
- (UIImageView)webViewCachedImageView;
- (void)_setSelectedAppearance:(BOOL)a3;
- (void)prepareForReuse;
- (void)setCacheKey:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setWebViewCachedImageView:(id)a3;
@end

@implementation BKTOCWebViewTableViewCell

- (void)setCacheKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [v4 copy];
    v6.receiver = self;
    v6.super_class = (Class)BKTOCWebViewTableViewCell;
    [(BKTOCTableViewCell *)&v6 setCacheKey:v5];

    [(BKTOCWebViewTableViewCell *)self _setSelectedAppearance:[(BKTOCWebViewTableViewCell *)self isSelected]];
  }
}

- (NSString)selectedCacheKey
{
  v2 = [(BKTOCTableViewCell *)self cacheKey];
  v3 = [v2 stringByAppendingString:@"-selected"];

  return (NSString *)v3;
}

- (void)prepareForReuse
{
  [(UIImageView *)self->_webViewCachedImageView setImage:0];
  [(BKTOCWebViewTableViewCell *)self setCacheKey:0];
  v3.receiver = self;
  v3.super_class = (Class)BKTOCWebViewTableViewCell;
  [(BKTOCTableViewCell *)&v3 prepareForReuse];
}

- (UIImageView)webViewCachedImageView
{
  webViewCachedImageView = self->_webViewCachedImageView;
  if (!webViewCachedImageView)
  {
    id v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    id v5 = self->_webViewCachedImageView;
    self->_webViewCachedImageView = v4;

    [(UIImageView *)self->_webViewCachedImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_webViewCachedImageView setUserInteractionEnabled:0];
    [(UIImageView *)self->_webViewCachedImageView setContentMode:7];
    [(UIImageView *)self->_webViewCachedImageView setClipsToBounds:1];
    objc_super v6 = +[UIColor clearColor];
    [(UIImageView *)self->_webViewCachedImageView setBackgroundColor:v6];

    v7 = [(BKTOCWebViewTableViewCell *)self contentView];
    [v7 addSubview:self->_webViewCachedImageView];

    v8 = [(BKTOCWebViewTableViewCell *)self contentView];
    v9 = [(BKTOCTableViewCell *)self pageLabel];
    [v8 bringSubviewToFront:v9];

    v10 = [(UIImageView *)self->_webViewCachedImageView superview];
    v24 = [(UIImageView *)self->_webViewCachedImageView topAnchor];
    v23 = [v10 topAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v25[0] = v22;
    v21 = [(UIImageView *)self->_webViewCachedImageView bottomAnchor];
    v20 = [v10 bottomAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v25[1] = v19;
    v11 = [(UIImageView *)self->_webViewCachedImageView leadingAnchor];
    v12 = [v10 leadingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v25[2] = v13;
    v14 = [(UIImageView *)self->_webViewCachedImageView trailingAnchor];
    v15 = [v10 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v25[3] = v16;
    v17 = +[NSArray arrayWithObjects:v25 count:4];
    [v10 addConstraints:v17];

    webViewCachedImageView = self->_webViewCachedImageView;
  }

  return webViewCachedImageView;
}

- (void)_setSelectedAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(BKTOCTableViewCell *)self cacheKey];
  if (v3)
  {
    uint64_t v5 = [(BKTOCWebViewTableViewCell *)self selectedCacheKey];

    id v9 = (id)v5;
  }
  objc_super v6 = [(BKTOCWebViewTableViewCell *)self imageCache];
  v7 = [v6 objectForKey:v9];

  v8 = [(BKTOCWebViewTableViewCell *)self webViewCachedImageView];
  [v8 setImage:v7];
}

- (BKTOCImageCache2)imageCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageCache);

  return (BKTOCImageCache2 *)WeakRetained;
}

- (void)setImageCache:(id)a3
{
}

- (void)setWebViewCachedImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewCachedImageView, 0);

  objc_destroyWeak((id *)&self->_imageCache);
}

@end