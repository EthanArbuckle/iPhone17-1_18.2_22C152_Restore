@interface SCKPMessageCardSectionAttachmentView
- (CGSize)_translateImageSizeForMaxSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPLinkMetadata)fullMetadata;
- (LPLinkView)linkView;
- (SCKPGradientView)gradientView;
- (SCKPMessageCardSectionAttachmentView)initWithAttachment:(id)a3;
- (SCKPMessageCardSectionAttachmentViewDelegate)delegate;
- (UIImageView)imageView;
- (UIImageView)livePhotoBadge;
- (UILabel)videoDurationLabel;
- (UIView)imageContainer;
- (id)_thumbnailImageForVideoURL:(id)a3;
- (id)_videoDurationStringForVideoURL:(id)a3;
- (unint64_t)alignmentStyle;
- (void)_handleTap:(id)a3;
- (void)_linkViewMetadataDidBecomeComplete:(id)a3;
- (void)_loadAttachment:(id)a3;
- (void)_loadAttachmentFromFileURL:(id)a3 type:(int)a4;
- (void)_loadLinkWith:(id)a3 metadata:(id)a4;
- (void)layoutSubviews;
- (void)setAlignmentStyle:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFullMetadata:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setImageContainer:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLinkView:(id)a3;
- (void)setLivePhotoBadge:(id)a3;
- (void)setVideoDurationLabel:(id)a3;
@end

@implementation SCKPMessageCardSectionAttachmentView

- (SCKPMessageCardSectionAttachmentView)initWithAttachment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKPMessageCardSectionAttachmentView;
  v5 = -[SCKPMessageCardSectionAttachmentView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    [(SCKPMessageCardSectionAttachmentView *)v5 _loadAttachment:v4];
    v7 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v6 action:sel__handleTap_];
    [(SCKPMessageCardSectionAttachmentView *)v6 addGestureRecognizer:v7];
  }
  return v6;
}

- (void)_loadAttachment:(id)a3
{
  id v4 = a3;
  id v7 = [v4 url];
  if ([v7 isFileURL])
  {
    uint64_t v5 = [v4 type];

    [(SCKPMessageCardSectionAttachmentView *)self _loadAttachmentFromFileURL:v7 type:v5];
  }
  else
  {
    v6 = [v4 linkMetadata];

    [(SCKPMessageCardSectionAttachmentView *)self _loadLinkWith:v7 metadata:v6];
  }
}

- (void)_loadAttachmentFromFileURL:(id)a3 type:(int)a4
{
  id v30 = a3;
  v6 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  imageContainer = self->_imageContainer;
  self->_imageContainer = v6;

  v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
  imageView = self->_imageView;
  self->_imageView = v8;

  [(UIView *)self->_imageContainer addSubview:self->_imageView];
  [(SCKPMessageCardSectionAttachmentView *)self addSubview:self->_imageContainer];
  v10 = (void *)MEMORY[0x263F1D920];
  v11 = [v30 pathExtension];
  v12 = [v10 typeWithFilenameExtension:v11];

  if ([v12 conformsToType:*MEMORY[0x263F1DB18]])
  {
    v13 = (void *)MEMORY[0x263F1C6B0];
    v14 = [v30 path];
    v15 = [v13 imageWithContentsOfFile:v14];

    [(UIImageView *)self->_imageView setImage:v15];
    [(UIImageView *)self->_imageView setContentMode:1];
    if (a4 == 2)
    {
      v16 = [MEMORY[0x263F15208] livePhotoBadgeImageWithOptions:1];
      v17 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v16];
      livePhotoBadge = self->_livePhotoBadge;
      self->_livePhotoBadge = v17;

      [(UIImageView *)self->_livePhotoBadge setUserInteractionEnabled:0];
      [(UIView *)self->_imageContainer addSubview:self->_livePhotoBadge];
    }
  }
  else if ([v12 conformsToType:*MEMORY[0x263F1DBC8]])
  {
    v15 = [(SCKPMessageCardSectionAttachmentView *)self _thumbnailImageForVideoURL:v30];
    v19 = [SCKPGradientView alloc];
    v20 = [(SCKPGradientView *)v19 initWithGradientType:*MEMORY[0x263F15DD0]];
    gradientView = self->_gradientView;
    self->_gradientView = v20;

    [(UIView *)self->_imageContainer addSubview:self->_gradientView];
    [(SCKPGradientView *)self->_gradientView setGradientEndOpacity:0.0];
    [(SCKPGradientView *)self->_gradientView setGradientStartOpacity:0.75];
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    videoDurationLabel = self->_videoDurationLabel;
    self->_videoDurationLabel = v22;

    v24 = self->_videoDurationLabel;
    v25 = [(SCKPMessageCardSectionAttachmentView *)self _videoDurationStringForVideoURL:v30];
    [(UILabel *)v24 setText:v25];

    v26 = self->_videoDurationLabel;
    v27 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v26 setBackgroundColor:v27];

    v28 = self->_videoDurationLabel;
    v29 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v28 setTextColor:v29];

    [(UILabel *)self->_videoDurationLabel setTextAlignment:2];
    [(UIView *)self->_imageContainer addSubview:self->_videoDurationLabel];
  }
  else
  {
    v15 = 0;
  }
  [(UIView *)self->_imageContainer _setContinuousCornerRadius:16.0];
  [(UIView *)self->_imageContainer setClipsSubviews:1];
  [(UIImageView *)self->_imageView setImage:v15];
  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setUserInteractionEnabled:0];
  [(UIView *)self->_imageContainer setUserInteractionEnabled:0];
}

- (void)_loadLinkWith:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (!v6)
    {
      id v10 = 0;
      goto LABEL_11;
    }
    id v8 = objc_alloc_init(MEMORY[0x263F103F0]);
    [v8 setTimeout:5.0];
    id v10 = objc_alloc_init(MEMORY[0x263F103E0]);
    id v12 = objc_alloc_init(MEMORY[0x263F103D8]);
    [v12 setURL:v6];
    [v10 _setMetadata:v12 isFinal:0];
    objc_initWeak(&location, self);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke;
    v16 = &unk_26484DDF8;
    objc_copyWeak(&v18, &location);
    id v17 = v6;
    [v8 startFetchingMetadataForURL:v17 completionHandler:&v13];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

LABEL_9:
LABEL_11:
    objc_msgSend(v10, "setDelegate:", self, v13, v14, v15, v16);
    [v10 _setDisableAutoPlay:1];
    [v10 _setDisablePlayback:1];
    [v10 _setDisablePlaybackControls:1];
    [v10 _setDisablePreviewGesture:1];
    [v10 setUserInteractionEnabled:0];
    [(SCKPMessageCardSectionAttachmentView *)self setLinkView:v10];
    [(SCKPMessageCardSectionAttachmentView *)self addSubview:v10];
    goto LABEL_12;
  }
  id v20 = 0;
  id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v20];
  id v9 = v20;
  if (!v9)
  {
    [(SCKPMessageCardSectionAttachmentView *)self setFullMetadata:v8];
    id v10 = (id)[objc_alloc(MEMORY[0x263F103E0]) initWithMetadata:v8];
    [v10 _setDisableAnimations:1];
    goto LABEL_9;
  }
  id v10 = v9;
  v11 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    -[SCKPMessageCardSectionAttachmentView _loadLinkWith:metadata:](v11, v10);
  }

LABEL_12:
}

void __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke_2;
  v9[3] = &unk_26484DDD0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = v3;
    if (*(void *)(a1 + 40)) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      id v6 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke_2_cold_1((uint64_t *)(a1 + 40), v6);
      }
      id v4 = objc_alloc_init(MEMORY[0x263F103D8]);
      [v4 setURL:*(void *)(a1 + 48)];
    }
    id v7 = (void *)*((void *)WeakRetained + 54);
    *((void *)WeakRetained + 54) = v4;
    id v8 = v4;

    [*((id *)WeakRetained + 55) _setMetadata:v8 isFinal:1];
  }
}

- (id)_thumbnailImageForVideoURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v3 options:0];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263EFA4B0]) initWithAsset:v4];
  [v5 setAppliesPreferredTrackTransform:1];
  CMTimeMake(&v12, 0, 1);
  id v11 = 0;
  id v6 = (CGImage *)[v5 copyCGImageAtTime:&v12 actualTime:0 error:&v11];
  id v7 = v11;
  if (v7)
  {
    id v8 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      [(SCKPMessageCardSectionAttachmentView *)(uint64_t)v7 _thumbnailImageForVideoURL:v8];
    }
    id v9 = 0;
  }
  else
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v6];
  }
  CGImageRelease(v6);

  return v9;
}

- (id)_videoDurationStringForVideoURL:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFA8D0];
  id v4 = a3;
  BOOL v5 = (void *)[[v3 alloc] initWithURL:v4 options:0];

  [v5 duration];
  [v5 duration];
  id v6 = [MEMORY[0x263F1C7C8] timeStringForSeconds:v9 / v8 forceFullWidthComponents:0 isElapsed:1];

  return v6;
}

- (void)_handleTap:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SCKPMessageCardSectionAttachmentView _handleTap:]";
    _os_log_impl(&dword_228A19000, v4, OS_LOG_TYPE_DEFAULT, "%s #messages: Tap on attachment - punching out", (uint8_t *)&v6, 0xCu);
  }
  BOOL v5 = [(SCKPMessageCardSectionAttachmentView *)self delegate];
  [v5 userDidTapAttachmentView:self];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_linkView)
  {
    if (self->_fullMetadata)
    {
      double width = 275.0;
      -[LPLinkView sizeThatFits:](self->_linkView, "sizeThatFits:", 275.0, 200.0);
      double v5 = fmin(v4, 200.0);
    }
    else
    {
      double v5 = 200.0;
      double width = 275.0;
    }
  }
  else if (self->_imageView)
  {
    double width = a3.width;
    double v5 = 200.0;
    -[SCKPMessageCardSectionAttachmentView _translateImageSizeForMaxSize:](self, "_translateImageSizeForMaxSize:", a3.width, 200.0);
    if (v6 <= width) {
      double width = v6;
    }
  }
  else
  {
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SCKPMessageCardSectionAttachmentView sizeThatFits:](v7);
    }
    double width = *MEMORY[0x263F001B0];
    double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v8 = width;
  double v9 = v5;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  [(SCKPMessageCardSectionAttachmentView *)self bounds];
  double v4 = v3;
  [(SCKPMessageCardSectionAttachmentView *)self bounds];
  double v6 = v5;
  linkView = self->_linkView;
  if (linkView)
  {
    -[LPLinkView sizeThatFits:](linkView, "sizeThatFits:", v4, v5);
    double v10 = v9;
    double v11 = v4 - v9;
    if (!self->_alignmentStyle) {
      double v11 = 0.0;
    }
    -[LPLinkView setFrame:](self->_linkView, "setFrame:", v11, v6 - v8, v10);
  }
  if (self->_imageView)
  {
    -[UIView setFrame:](self->_imageContainer, "setFrame:", 0.0, 0.0, v4, v6);
    -[SCKPMessageCardSectionAttachmentView _translateImageSizeForMaxSize:](self, "_translateImageSizeForMaxSize:", v4, v6);
    if (v12 <= v4)
    {
      imageView = self->_imageView;
      double v14 = 0.0;
      double v13 = v4;
    }
    else
    {
      double v13 = v12;
      double v14 = -(v12 * 0.5 - v4 * 0.5);
      imageView = self->_imageView;
    }
    -[UIImageView setFrame:](imageView, "setFrame:", v14, 0.0, v13, v6);
    -[UIImageView setFrame:](self->_livePhotoBadge, "setFrame:", 0.0, 0.0, 30.0, 30.0);
  }
  videoDurationLabel = self->_videoDurationLabel;
  if (videoDurationLabel)
  {
    -[UILabel sizeThatFits:](videoDurationLabel, "sizeThatFits:", v4, v6);
    double v18 = v17;
    -[UILabel setFrame:](self->_videoDurationLabel, "setFrame:", v4 - v19 + -10.0, v6 - v17 + -10.0, v19, v17);
    gradientView = self->_gradientView;
    [(UIView *)self->_imageContainer size];
    double v22 = v21;
    [(UIView *)self->_imageContainer size];
    -[SCKPGradientView setFrame:](gradientView, "setFrame:", 0.0, 0.0, v22, v23);
    [(SCKPGradientView *)self->_gradientView setGradientHeight:v18 + 10.0 + 10.0];
    v24 = self->_gradientView;
    [(SCKPGradientView *)v24 setVisible:1 animated:0];
  }
}

- (CGSize)_translateImageSizeForMaxSize:(CGSize)a3
{
  double height = a3.height;
  double v5 = [(UIImageView *)self->_imageView image];
  [v5 size];
  double v7 = v6;

  double v8 = [(UIImageView *)self->_imageView image];
  [v8 size];
  double v10 = v9;

  double v11 = 0.0;
  if (v10 > 0.0 && v7 > 0.0) {
    double v11 = v7 / v10;
  }
  double v13 = height * v11;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)_linkViewMetadataDidBecomeComplete:(id)a3
{
  [a3 _setPreferredSizeClass:3];
  [(SCKPMessageCardSectionAttachmentView *)self setNeedsLayout];

  [(SCKPMessageCardSectionAttachmentView *)self layoutIfNeeded];
}

- (unint64_t)alignmentStyle
{
  return self->_alignmentStyle;
}

- (void)setAlignmentStyle:(unint64_t)a3
{
  self->_alignmentStyle = a3;
}

- (SCKPMessageCardSectionAttachmentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCKPMessageCardSectionAttachmentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCKPGradientView)gradientView
{
  return (SCKPGradientView *)objc_getProperty(self, a2, 424, 1);
}

- (void)setGradientView:(id)a3
{
}

- (LPLinkMetadata)fullMetadata
{
  return (LPLinkMetadata *)objc_getProperty(self, a2, 432, 1);
}

- (void)setFullMetadata:(id)a3
{
}

- (LPLinkView)linkView
{
  return (LPLinkView *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLinkView:(id)a3
{
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)livePhotoBadge
{
  return (UIImageView *)objc_getProperty(self, a2, 456, 1);
}

- (void)setLivePhotoBadge:(id)a3
{
}

- (UILabel)videoDurationLabel
{
  return (UILabel *)objc_getProperty(self, a2, 464, 1);
}

- (void)setVideoDurationLabel:(id)a3
{
}

- (UIView)imageContainer
{
  return (UIView *)objc_getProperty(self, a2, 472, 1);
}

- (void)setImageContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageContainer, 0);
  objc_storeStrong((id *)&self->_videoDurationLabel, 0);
  objc_storeStrong((id *)&self->_livePhotoBadge, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_fullMetadata, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_loadLinkWith:(void *)a1 metadata:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v3 = a1;
  double v4 = [a2 localizedDescription];
  int v5 = 136315394;
  double v6 = "-[SCKPMessageCardSectionAttachmentView _loadLinkWith:metadata:]";
  __int16 v7 = 2112;
  double v8 = v4;
  _os_log_error_impl(&dword_228A19000, v3, OS_LOG_TYPE_ERROR, "%s #messages: error converting metadata to LPLinkMetadata:%@", (uint8_t *)&v5, 0x16u);
}

void __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  double v4 = "-[SCKPMessageCardSectionAttachmentView _loadLinkWith:metadata:]_block_invoke_2";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_228A19000, a2, OS_LOG_TYPE_ERROR, "%s #messages Metadata fetch failed with error: %@ creating new metadata", (uint8_t *)&v3, 0x16u);
}

- (void)_thumbnailImageForVideoURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_228A19000, log, OS_LOG_TYPE_ERROR, "error: %@ creating thumbnail from movie url: %@", (uint8_t *)&v3, 0x16u);
}

- (void)sizeThatFits:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SCKPMessageCardSectionAttachmentView sizeThatFits:]";
  _os_log_error_impl(&dword_228A19000, log, OS_LOG_TYPE_ERROR, "%s Calling size that fits before setting a valid URL", (uint8_t *)&v1, 0xCu);
}

@end