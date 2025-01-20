@interface VUILibraryEpisodeFrameView
+ (void)configureEpisodeFrameView:(id)a3 withMedia:(id)a4 layout:(int64_t)a5 imageSize:(CGSize)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (VUIButton)playButton;
- (VUIImageView)fullyPlayedImageView;
- (VUIImageView)imageView;
- (VUILibraryEpisodeFrameView)initWithFrame:(CGRect)a3;
- (VUILibraryEpisodeFrameViewDelegate)delegate;
- (VUIMediaItem)mediaItem;
- (_TVProgressView)progressView;
- (int64_t)layout;
- (void)_isPlaybackUIBeingShownDidChange:(id)a3;
- (void)_playButtonPressed;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFullyPlayedImageView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setMediaItem:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setProgressView:(id)a3;
- (void)updateProgress:(id)a3;
@end

@implementation VUILibraryEpisodeFrameView

- (VUILibraryEpisodeFrameView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VUILibraryEpisodeFrameView;
  v3 = -[VUILibraryEpisodeFrameView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    v6 = +[VUIPlaybackManager sharedInstance];
    [v4 addObserver:v3 selector:sel__isPlaybackUIBeingShownDidChange_ name:v5 object:v6];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(VUILibraryEpisodeFrameView *)self setMediaItem:0];
  v4.receiver = self;
  v4.super_class = (Class)VUILibraryEpisodeFrameView;
  [(VUILibraryEpisodeFrameView *)&v4 dealloc];
}

+ (void)configureEpisodeFrameView:(id)a3 withMedia:(id)a4 layout:(int64_t)a5 imageSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v10 = a3;
  id v11 = a4;
  int64_t v56 = a5;
  [v10 setLayout:a5];
  v12 = [v10 imageView];
  if (v12)
  {
    uint64_t v13 = [v10 imageView];
  }
  else
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3CE0]), "initWithFrame:", 0.0, 0.0, width, height);
  }
  v14 = (void *)v13;

  if (v56 == 1)
  {
    v15 = (void *)MEMORY[0x1E4FB1818];
    v16 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryDynamicBackgroundColor");
    v17 = [v15 imageWithColor:v16];
    [v14 setPlaceholderImage:v17];
  }
  else
  {
    v18 = [MEMORY[0x1E4FB1618] blackColor];
    [v10 setVuiBackgroundColor:v18];

    v16 = [v10 traitCollection];
    v17 = +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", [v16 userInterfaceStyle]);
    v19 = +[VUIImageResourceMap imageForResourceName:v17];
    [v14 setPlaceholderImage:v19];
  }
  v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v20 scale];
  double v22 = width * v21;
  v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v23 scale];
  double v25 = height * v24;

  v26 = (void *)MEMORY[0x1E4FB3CC8];
  v27 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
  v28 = objc_msgSend(v26, "decoratorWithOutlineColor:outlineWidths:", v27, 1.0, 1.0, 1.0, 1.0);

  objc_msgSend(v28, "setScaleToSize:", v22, v25);
  if (v56 == 1 && !+[VUIUtilities isIpadInterface])
  {
    objc_msgSend(v28, "setCornerRadii:", *MEMORY[0x1E4FB3D98], *(double *)(MEMORY[0x1E4FB3D98] + 8), *(double *)(MEMORY[0x1E4FB3D98] + 16), *(double *)(MEMORY[0x1E4FB3D98] + 24));
    [v14 setCornerRadius:0.0];
  }
  else
  {
    +[VUIUtilities imageCornerRadiusWithStyle:0];
    objc_msgSend(MEMORY[0x1E4FB3C70], "radiiFromRadius:");
    objc_msgSend(v28, "setCornerRadii:");
    +[VUIUtilities imageCornerRadiusWithStyle:0];
    objc_msgSend(v14, "setCornerRadius:");
    v29 = [v14 layer];
    +[VUIUtilities imageCornerRadiusWithStyle:0];
    objc_msgSend(v29, "setCornerRadius:");

    v30 = [v14 layer];
    [v30 setMasksToBounds:1];
  }
  [v28 setScaleMode:2];
  v31 = [MEMORY[0x1E4FB1618] blackColor];
  [v28 setBgColor:v31];

  SEL v32 = NSSelectorFromString(&cfstr_Previewartwork_0.isa);
  if (objc_opt_respondsToSelector())
  {
    v33 = ((void (*)(id, SEL))[v11 methodForSelector:v32])(v11, v32);
  }
  else
  {
    v33 = 0;
  }
  if ([v33 length])
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA9CC0]), "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v33, 0, @"jpeg", width, height, 70.0, v33);
    v35 = [MEMORY[0x1E4FA9CD0] imageURLWithDescription:v34];
    id v36 = objc_alloc(MEMORY[0x1E4FB3CD0]);
    v37 = [MEMORY[0x1E4FB3D58] sharedInstance];
    v38 = (void *)[v36 initWithObject:v35 imageLoader:v37 groupType:0];

LABEL_18:
    goto LABEL_19;
  }
  v34 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v11, 1, v33);
  if (v34)
  {
    id v39 = objc_alloc(MEMORY[0x1E4FB3CD0]);
    v35 = [v11 mediaLibrary];
    v38 = (void *)[v39 initWithObject:v34 imageLoader:v35 groupType:0];
    goto LABEL_18;
  }
  v38 = 0;
LABEL_19:

  [v38 setDecorator:v28];
  objc_initWeak(location, v10);
  objc_initWeak(&from, v11);
  objc_initWeak(&v61, v28);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __83__VUILibraryEpisodeFrameView_configureEpisodeFrameView_withMedia_layout_imageSize___block_invoke;
  v57[3] = &unk_1E6DF9AE8;
  objc_copyWeak(&v58, location);
  objc_copyWeak(&v59, &from);
  objc_copyWeak(&v60, &v61);
  [v14 setImageProxy:v38 completion:v57];
  [v14 setImageContainsCornerRadius:1];
  [v10 setImageView:v14];
  if (v56 == 1)
  {
    v40 = [v10 playButton];
    if (v40)
    {
      v41 = [v10 playButton];
    }
    else
    {
      v41 = [[VUIButton alloc] initWithType:5 interfaceStyle:0];
    }
    v42 = v41;

    [(VUIButton *)v42 setCornerRadius:32.0];
    v43 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v43 scale];
    double v45 = v44;
    v46 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v46 scale];
    double v48 = v47;

    v49 = [MEMORY[0x1E4FB1830] configurationWithPointSize:(uint64_t)*MEMORY[0x1E4FB09D8] weight:24.0];
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3D18]), "initWithSymbol:size:symbolConfiguration:", @"play.fill", v49, v45 * 32.0, v48 * 38.0);
    v51 = [MEMORY[0x1E4FB1618] whiteColor];
    [v50 setTintColor:v51];

    v52 = [MEMORY[0x1E4FB3CC0] makeImageViewWithResourceDescriptor:v50 existingView:0];
    [(VUIButton *)v42 setImageView:v52];
    [(VUIButton *)v42 setGroupName:0];
    [(VUIButton *)v42 setTextContentView:0];
    [(VUIButton *)v42 setImageTrailsTextContent:0];
    v53 = [MEMORY[0x1E4FB1618] colorWithRed:0.78 green:0.78 blue:0.8 alpha:0.8];
    [(VUIButton *)v42 setButtonBackgroundColor:v53];

    [(VUIButton *)v42 setExclusiveTouch:1];
    v54 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
    [(VUIButton *)v42 setHighlightColor:v54];

    [v10 setPlayButton:v42];
  }
  [v10 updateProgress:v11];
  if (!v56) {
    [v10 setUserInteractionEnabled:0];
  }
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __83__VUILibraryEpisodeFrameView_configureEpisodeFrameView_withMedia_layout_imageSize___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v6 = objc_loadWeakRetained(a1 + 5);
  id v7 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && v6 && (!a2 || a3))
  {
    objc_super v8 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:v6 imageType:0];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4FB3CD0]);
      id v10 = [v6 mediaLibrary];
      id v11 = (void *)[v9 initWithObject:v8 imageLoader:v10 groupType:0];

      if (v7) {
        [v11 setDecorator:v7];
      }
      v12 = [WeakRetained imageView];
      [v12 setImageProxy:v11];
    }
  }
}

- (void)updateProgress:(id)a3
{
  id v25 = a3;
  [(VUILibraryEpisodeFrameView *)self setMediaItem:v25];
  objc_super v4 = [v25 bookmark];
  [v4 floatValue];
  float v6 = v5;

  if (v6 <= 0.0)
  {
    id v9 = [v25 playedState];
    uint64_t v10 = [v9 integerValue];

    if (v10 != 3)
    {
      [(VUILibraryEpisodeFrameView *)self setProgressView:0];
      [(VUILibraryEpisodeFrameView *)self setFullyPlayedImageView:0];
      goto LABEL_16;
    }
    id v11 = [(VUILibraryEpisodeFrameView *)self fullyPlayedImageView];
    if (v11)
    {
      uint64_t v12 = [(VUILibraryEpisodeFrameView *)self fullyPlayedImageView];
    }
    else
    {
      id v22 = objc_alloc(MEMORY[0x1E4FB3CE0]);
      uint64_t v12 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    v14 = (void *)v12;

    if ([(VUILibraryEpisodeFrameView *)self layout] == 1)
    {
      v23 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", @"CornerGradientCheck");
    }
    else
    {
      v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
      double v24 = [MEMORY[0x1E4FB1618] whiteColor];
      [v14 _setTintColor:v24];
    }
    [v14 setImage:v23];
    [(VUILibraryEpisodeFrameView *)self setFullyPlayedImageView:v14];
    [(VUILibraryEpisodeFrameView *)self setProgressView:0];
  }
  else
  {
    id v7 = [(VUILibraryEpisodeFrameView *)self progressView];
    if (v7)
    {
      uint64_t v8 = [(VUILibraryEpisodeFrameView *)self progressView];
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x1E4FA9CF8]);
      uint64_t v8 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    v14 = (void *)v8;

    [v14 setCornerRadius:5.0];
    [v14 setStyle:0];
    v15 = [MEMORY[0x1E4FB1618] whiteColor];
    [v14 setProgressTintColor:v15];

    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.2 alpha:0.9];
    [v14 setCompleteTintColor:v16];

    v17 = [v25 bookmark];
    [v17 floatValue];
    float v19 = v18;
    v20 = [v25 duration];
    [v20 floatValue];
    [v14 setProgress:(float)(v19 / v21)];

    [(VUILibraryEpisodeFrameView *)self setProgressView:v14];
    [(VUILibraryEpisodeFrameView *)self setFullyPlayedImageView:0];
  }

LABEL_16:
}

- (void)setImageView:(id)a3
{
  float v5 = (VUIImageView *)a3;
  imageView = self->_imageView;
  if (imageView != v5)
  {
    id v7 = v5;
    [(VUIImageView *)imageView removeFromSuperview];
    objc_storeStrong((id *)&self->_imageView, a3);
    if (self->_imageView) {
      -[VUILibraryEpisodeFrameView addSubview:](self, "addSubview:");
    }
    [(VUILibraryEpisodeFrameView *)self setNeedsLayout];
    float v5 = v7;
  }
}

- (void)setProgressView:(id)a3
{
  float v5 = (_TVProgressView *)a3;
  progressView = self->_progressView;
  if (progressView != v5)
  {
    id v7 = v5;
    [(_TVProgressView *)progressView removeFromSuperview];
    objc_storeStrong((id *)&self->_progressView, a3);
    if (self->_progressView) {
      -[VUILibraryEpisodeFrameView addSubview:](self, "addSubview:");
    }
    [(VUILibraryEpisodeFrameView *)self setNeedsLayout];
    float v5 = v7;
  }
}

- (void)setPlayButton:(id)a3
{
  float v5 = (VUIButton *)a3;
  p_playButton = &self->_playButton;
  playButton = self->_playButton;
  if (playButton != v5)
  {
    [(VUIButton *)playButton removeFromSuperview];
    objc_storeStrong((id *)&self->_playButton, a3);
    if (*p_playButton)
    {
      -[VUILibraryEpisodeFrameView addSubview:](self, "addSubview:");
      objc_initWeak(&location, self);
      uint64_t v8 = *p_playButton;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      id v11 = __44__VUILibraryEpisodeFrameView_setPlayButton___block_invoke;
      uint64_t v12 = &unk_1E6DF4400;
      objc_copyWeak(&v13, &location);
      [(VUIButton *)v8 setSelectActionHandler:&v9];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    [(VUILibraryEpisodeFrameView *)self setNeedsLayout];
  }
}

void __44__VUILibraryEpisodeFrameView_setPlayButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playButtonPressed];
}

- (void)setFullyPlayedImageView:(id)a3
{
  float v5 = (VUIImageView *)a3;
  fullyPlayedImageView = self->_fullyPlayedImageView;
  if (fullyPlayedImageView != v5)
  {
    id v7 = v5;
    [(VUIImageView *)fullyPlayedImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_fullyPlayedImageView, a3);
    if (self->_fullyPlayedImageView) {
      -[VUIImageView addSubview:](self->_imageView, "addSubview:");
    }
    [(VUILibraryEpisodeFrameView *)self setNeedsLayout];
    float v5 = v7;
  }
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)VUILibraryEpisodeFrameView;
  [(VUILibraryEpisodeFrameView *)&v22 layoutSubviews];
  imageView = self->_imageView;
  [(VUILibraryEpisodeFrameView *)self bounds];
  -[VUIImageView setFrame:](imageView, "setFrame:");
  if (self->_layout == 1)
  {
    playButton = self->_playButton;
    [(VUILibraryEpisodeFrameView *)self bounds];
    CGFloat v5 = CGRectGetMidX(v23) + -32.0;
    [(VUILibraryEpisodeFrameView *)self bounds];
    -[VUIButton setFrame:](playButton, "setFrame:", v5, CGRectGetMidY(v24) + -32.0, 64.0, 64.0);
  }
  progressView = self->_progressView;
  [(VUILibraryEpisodeFrameView *)self bounds];
  double MinX = CGRectGetMinX(v25);
  if (self->_layout == 1) {
    double v8 = 12.0;
  }
  else {
    double v8 = 4.0;
  }
  double v9 = MinX + v8;
  [(VUILibraryEpisodeFrameView *)self bounds];
  double MaxY = CGRectGetMaxY(v26);
  double v11 = 9.0;
  if (self->_layout == 1) {
    double v11 = 17.0;
  }
  double v12 = MaxY - v11;
  [(VUILibraryEpisodeFrameView *)self bounds];
  double Width = CGRectGetWidth(v27);
  if (self->_layout == 1) {
    double v14 = 12.0;
  }
  else {
    double v14 = 4.0;
  }
  -[_TVProgressView setFrame:](progressView, "setFrame:", v9, v12, Width + v14 * -2.0, 5.0);
  v15 = [(VUIImageView *)self->_fullyPlayedImageView image];
  [v15 size];
  double v17 = v16;
  double v19 = v18;

  fullyPlayedImageView = self->_fullyPlayedImageView;
  [(VUILibraryEpisodeFrameView *)self bounds];
  CGFloat v21 = CGRectGetMaxX(v28) - v17;
  [(VUILibraryEpisodeFrameView *)self bounds];
  -[VUIImageView setFrame:](fullyPlayedImageView, "setFrame:", v21, CGRectGetMaxY(v29) - v19, v17, v19);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(VUIImageView *)self->_imageView frame];
  double v4 = CGRectGetHeight(v7) + 0.0;
  double v5 = width;
  result.double height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)_playButtonPressed
{
  id v3 = [(VUILibraryEpisodeFrameView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 didTapButtonForEpisodeFrameView:self];
  }
}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__VUILibraryEpisodeFrameView__isPlaybackUIBeingShownDidChange___block_invoke;
  v4[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__VUILibraryEpisodeFrameView__isPlaybackUIBeingShownDidChange___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[VUIPlaybackManager sharedInstance];
  char v3 = [v2 isPlaybackUIBeingShown];

  if ((v3 & 1) == 0)
  {
    double v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [WeakRetained mediaItem];
      float v6 = [v5 title];
      CGRect v7 = [WeakRetained mediaItem];
      double v8 = [v7 bookmark];
      [v8 floatValue];
      double v10 = v9;
      double v11 = [WeakRetained mediaItem];
      double v12 = [v11 playedState];
      [v12 integerValue];
      id v13 = VUIBoolLogString();
      int v15 = 138412802;
      double v16 = v6;
      __int16 v17 = 2048;
      double v18 = v10;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUILibraryEpisodeFrameView:: playback dismissed. Update progress for item %@ # bookmark time %f # isFullyWatched %@", (uint8_t *)&v15, 0x20u);
    }
    double v14 = [WeakRetained mediaItem];
    [WeakRetained updateProgress:v14];
  }
}

- (VUILibraryEpisodeFrameViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUILibraryEpisodeFrameViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUIImageView)imageView
{
  return self->_imageView;
}

- (_TVProgressView)progressView
{
  return self->_progressView;
}

- (VUIButton)playButton
{
  return self->_playButton;
}

- (int64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(int64_t)a3
{
  self->_layout = a3;
}

- (VUIImageView)fullyPlayedImageView
{
  return self->_fullyPlayedImageView;
}

- (VUIMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_fullyPlayedImageView, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end