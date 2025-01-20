@interface SKUIMediaCollectionViewCell
- (SKUIEmbeddedMediaView)mediaView;
- (UIEdgeInsets)contentInset;
- (void)layoutSubviews;
- (void)mediaView;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIMediaCollectionViewCell

- (SKUIEmbeddedMediaView)mediaView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIMediaCollectionViewCell *)v3 mediaView];
      }
    }
  }
  mediaView = self->_mediaView;
  if (!mediaView)
  {
    v12 = [(SKUIMediaCollectionViewCell *)self contentView];
    v13 = [SKUIEmbeddedMediaView alloc];
    [v12 bounds];
    v18 = -[SKUIEmbeddedMediaView initWithFrame:](v13, "initWithFrame:", v14 + self->_contentInset.left, v15 + self->_contentInset.top, v16 - (self->_contentInset.left + self->_contentInset.right), v17 - (self->_contentInset.top + self->_contentInset.bottom));
    v19 = self->_mediaView;
    self->_mediaView = v18;

    v20 = self->_mediaView;
    v21 = [(SKUIMediaCollectionViewCell *)self backgroundColor];
    [(SKUIEmbeddedMediaView *)v20 setBackgroundColor:v21];

    [v12 addSubview:self->_mediaView];
    mediaView = self->_mediaView;
  }

  return mediaView;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIMediaCollectionViewCell setContentInset:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = self->_contentInset.top;
  if (self->_contentInset.left != left
    || v16 != top
    || self->_contentInset.right != right
    || self->_contentInset.bottom != bottom)
  {
    self->_contentInset.double top = top;
    self->_contentInset.double left = left;
    self->_contentInset.double bottom = bottom;
    self->_contentInset.double right = right;
    [(SKUIMediaCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMediaCollectionViewCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIEmbeddedMediaView *)self->_mediaView setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIMediaCollectionViewCell;
  [(SKUICollectionViewCell *)&v13 setBackgroundColor:v4];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

- (void)mediaView
{
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end