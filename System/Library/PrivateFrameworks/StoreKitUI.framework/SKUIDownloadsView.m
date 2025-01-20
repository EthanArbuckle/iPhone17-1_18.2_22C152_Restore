@interface SKUIDownloadsView
- (UIView)contentView;
- (UIView)overlayView;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setOverlayView:(id)a3;
@end

@implementation SKUIDownloadsView

- (void)setContentView:(id)a3
{
  v4 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDownloadsView setContentView:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UIView *)self->_contentView removeFromSuperview];
  contentView = self->_contentView;
  self->_contentView = v4;
  v14 = v4;

  [(SKUIDownloadsView *)self insertSubview:self->_contentView atIndex:0];
  [(SKUIDownloadsView *)self setNeedsLayout];
}

- (void)setOverlayView:(id)a3
{
  v4 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDownloadsView setOverlayView:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UIView *)self->_overlayView removeFromSuperview];
  overlayView = self->_overlayView;
  self->_overlayView = v4;
  v14 = v4;

  [(SKUIDownloadsView *)self addSubview:self->_overlayView];
  [(SKUIDownloadsView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setContentView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setOverlayView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end