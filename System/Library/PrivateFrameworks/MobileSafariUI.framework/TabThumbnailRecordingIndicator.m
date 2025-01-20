@interface TabThumbnailRecordingIndicator
- (TabThumbnailRecordingIndicator)initWithFrame:(CGRect)a3;
- (unint64_t)mediaStateIcon;
- (void)layoutSubviews;
- (void)setMediaStateIcon:(unint64_t)a3;
@end

@implementation TabThumbnailRecordingIndicator

- (TabThumbnailRecordingIndicator)initWithFrame:(CGRect)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)TabThumbnailRecordingIndicator;
  v3 = -[TabThumbnailRecordingIndicator initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TabThumbnailRecordingIndicator *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(TabThumbnailRecordingIndicator *)v4 setBackgroundColor:v5];

    [(TabThumbnailRecordingIndicator *)v4 setClipsToBounds:0];
    v27 = [(TabThumbnailRecordingIndicator *)v4 layer];
    LODWORD(v6) = 0.25;
    [v27 setShadowOpacity:v6];
    objc_msgSend(v27, "setShadowOffset:", 0.0, 0.0);
    [v27 setShadowRadius:12.0];
    [v27 setShadowPathIsBounds:1];
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v7;

    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v4->_imageView setTintColor:v9];

    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = (void *)MEMORY[0x1E4FB1830];
    v11 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28E0]];
    [v11 pointSize];
    v12 = objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 6, 2);
    [(UIImageView *)v4->_imageView setPreferredSymbolConfiguration:v12];

    [(UIImageView *)v4->_imageView _sf_setMatchesIntrinsicContentSize];
    [(TabThumbnailRecordingIndicator *)v4 addSubview:v4->_imageView];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(UIImageView *)v4->_imageView centerXAnchor];
    v25 = [(TabThumbnailRecordingIndicator *)v4 centerXAnchor];
    v13 = [v26 constraintEqualToAnchor:v25];
    v29[0] = v13;
    v14 = [(UIImageView *)v4->_imageView centerYAnchor];
    v15 = [(TabThumbnailRecordingIndicator *)v4 centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v29[1] = v16;
    v17 = [(TabThumbnailRecordingIndicator *)v4 widthAnchor];
    v18 = [v17 constraintEqualToConstant:22.0];
    v29[2] = v18;
    v19 = [(TabThumbnailRecordingIndicator *)v4 heightAnchor];
    v20 = [v19 constraintEqualToConstant:22.0];
    v29[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    [v24 activateConstraints:v21];

    v22 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TabThumbnailRecordingIndicator;
  [(TabThumbnailRecordingIndicator *)&v3 layoutSubviews];
  [(TabThumbnailRecordingIndicator *)self frame];
  [(TabThumbnailRecordingIndicator *)self _setCornerRadius:CGRectGetWidth(v4) * 0.5];
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    CGRect v4 = (void *)MEMORY[0x1E4FB1818];
    SFSystemImageNameForMediaStateIcon();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [v4 systemImageNamed:v6];
    [(UIImageView *)self->_imageView setImage:v5];
  }
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (void).cxx_destruct
{
}

@end