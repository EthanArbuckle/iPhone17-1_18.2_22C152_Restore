@interface SKUIDownloadsTableViewCell
- (SKUIDownloadsCellView)cellView;
- (SKUIDownloadsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation SKUIDownloadsTableViewCell

- (SKUIDownloadsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDownloadsTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIDownloadsTableViewCell;
  v7 = [(SKUIDownloadsTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = objc_alloc_init(SKUIDownloadsCellView);
    cellView = v7->_cellView;
    v7->_cellView = v8;

    v10 = [(SKUIDownloadsTableViewCell *)v7 contentView];
    [v10 addSubview:v7->_cellView];
  }
  return v7;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIDownloadsTableViewCell;
  [(SKUIDownloadsTableViewCell *)&v5 layoutSubviews];
  cellView = self->_cellView;
  v4 = [(SKUIDownloadsTableViewCell *)self contentView];
  [v4 bounds];
  -[SKUIDownloadsCellView setFrame:](cellView, "setFrame:");
}

- (SKUIDownloadsCellView)cellView
{
  return self->_cellView;
}

- (void).cxx_destruct
{
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDownloadsTableViewCell initWithStyle:reuseIdentifier:]";
}

@end