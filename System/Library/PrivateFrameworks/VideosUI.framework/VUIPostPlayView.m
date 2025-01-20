@interface VUIPostPlayView
+ (unint64_t)postPlayTypeFromString:(id)a3;
- (AVBackgroundView)backgroundView;
- (BOOL)canAutoPlay;
- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutForOriginal:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSNumber)autoPlayDuration;
- (NSNumber)defaultAutoPlayDuration;
- (NSString)header;
- (NSString)title;
- (TVImageProxy)episodeImageProxy;
- (VUICountDownProgressIndicator)autoPlayIndicator;
- (VUILabel)headerLabel;
- (VUILabel)nextEpisodeLabel;
- (VUIPostPlayView)initWithFrame:(CGRect)a3 andEpisodeArtworkURLStringFormat:(id)a4 andTitle:(id)a5 andHeader:(id)a6 andType:(unint64_t)a7;
- (VUIPostPlayView)initWithFrame:(CGRect)a3 andTVImageProxy:(id)a4 andTitle:(id)a5 andHeader:(id)a6 andType:(unint64_t)a7;
- (VUIPostPlayViewDelegate)delegate;
- (_TVImageView)episodeImageView;
- (unint64_t)type;
- (void)_dispatchAutoPlayEvent;
- (void)_initWithFrame:(CGRect)a3 andTVImageProxy:(id)a4 andTitle:(id)a5 andHeader:(id)a6 andType:(unint64_t)a7;
- (void)_invalidateAutoPlayIfNeeded;
- (void)_setupViews;
- (void)_startAutoPlayAnimation;
- (void)layoutSubviews;
- (void)setAutoPlayDuration:(id)a3;
- (void)setAutoPlayIndicator:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCanAutoPlay:(BOOL)a3;
- (void)setDefaultAutoPlayDuration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEpisodeImageProxy:(id)a3;
- (void)setEpisodeImageView:(id)a3;
- (void)setHeader:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setNextEpisodeLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation VUIPostPlayView

- (VUIPostPlayView)initWithFrame:(CGRect)a3 andTVImageProxy:(id)a4 andTitle:(id)a5 andHeader:(id)a6 andType:(unint64_t)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VUIPostPlayView;
  v18 = -[VUIPostPlayView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v19 = v18;
  if (v18) {
    -[VUIPostPlayView _initWithFrame:andTVImageProxy:andTitle:andHeader:andType:](v18, "_initWithFrame:andTVImageProxy:andTitle:andHeader:andType:", v15, v16, v17, a7, x, y, width, height);
  }

  return v19;
}

- (VUIPostPlayView)initWithFrame:(CGRect)a3 andEpisodeArtworkURLStringFormat:(id)a4 andTitle:(id)a5 andHeader:(id)a6 andType:(unint64_t)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v30.receiver = self;
  v30.super_class = (Class)VUIPostPlayView;
  v18 = -[VUIPostPlayView initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  v19 = v18;
  v20 = 0;
  if (v15 && v18)
  {
    if ([v15 length])
    {
      objc_super v21 = [(VUIPostPlayView *)v19 traitCollection];
      if ([v21 isAXEnabled]) {
        double v22 = 154.0;
      }
      else {
        double v22 = 107.0;
      }

      id v23 = objc_alloc(MEMORY[0x1E4FA9CC0]);
      [(VUIPostPlayView *)v19 bounds];
      v25 = objc_msgSend(v23, "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v15, 0, @"jpeg", v24, v22, 0.0);
      v26 = [MEMORY[0x1E4FA9CD0] imageURLWithDescription:v25];
      id v27 = objc_alloc(MEMORY[0x1E4FA9CA0]);
      v28 = [MEMORY[0x1E4FA9CC8] sharedInstance];
      v20 = (void *)[v27 initWithObject:v26 imageLoader:v28 groupType:0];
    }
    else
    {
      v20 = 0;
    }
  }
  -[VUIPostPlayView _initWithFrame:andTVImageProxy:andTitle:andHeader:andType:](v19, "_initWithFrame:andTVImageProxy:andTitle:andHeader:andType:", v20, v16, v17, a7, x, y, width, height);

  return v19;
}

- (void)_initWithFrame:(CGRect)a3 andTVImageProxy:(id)a4 andTitle:(id)a5 andHeader:(id)a6 andType:(unint64_t)a7
{
  id v25 = a4;
  id v12 = a6;
  [(VUIPostPlayView *)self setTitle:a5];
  [(VUIPostPlayView *)self setHeader:v12];

  [(VUIPostPlayView *)self setType:a7];
  if (v25)
  {
    v13 = [(VUIPostPlayView *)self traitCollection];
    if ([v13 isAXEnabled]) {
      double v14 = 154.0;
    }
    else {
      double v14 = 107.0;
    }

    id v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 scale];
    double v17 = v14 * 1.77777778 * v16;
    v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v18 scale];
    double v20 = v14 * v19;

    objc_super v21 = (void *)MEMORY[0x1E4FA9C98];
    double v22 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
    id v23 = objc_msgSend(v21, "decoratorWithOutlineColor:outlineWidths:", v22, 0.5, 0.5, 0.5, 0.5);

    objc_msgSend(v23, "setScaleToSize:", v17, v20);
    double v24 = [MEMORY[0x1E4FB1618] blackColor];
    [v23 setBgColor:v24];

    [v23 setScaleMode:2];
    [v25 setDecorator:v23];
    objc_storeStrong((id *)&self->_episodeImageProxy, a4);
  }
  [(VUIPostPlayView *)self _setupViews];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIPostPlayView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VUIPostPlayView;
  [(VUIPostPlayView *)&v4 layoutSubviews];
  [(VUIPostPlayView *)self bounds];
  double Width = CGRectGetWidth(v5);
  [(VUIPostPlayView *)self bounds];
  -[VUIPostPlayView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

+ (unint64_t)postPlayTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"nextEpisode"]) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:@"recommendedItems"];
  }

  return v4;
}

- (void)_setupViews
{
  self->_canAutoPladouble y = 1;
  LODWORD(v2) = 10.0;
  unint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithFloat:v2];
  defaultAutoPlayDuration = self->_defaultAutoPlayDuration;
  self->_defaultAutoPlayDuration = v4;

  id v37 = [(VUIPostPlayView *)self header];
  if ([v37 length])
  {
    CGRect v6 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v6 setTextStyle:13];
    [(VUITextLayout *)v6 setFontWeight:7];
    v7 = [(VUIPostPlayView *)self traitCollection];
    if ([v7 isAXEnabled]) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 2;
    }
    [(VUITextLayout *)v6 setNumberOfLines:v8];

    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(VUITextLayout *)v6 setColor:v9];

    [(VUITextLayout *)v6 setMaximumContentSizeCategory:8];
    v10 = +[VUILabel labelWithString:v37 textLayout:v6 existingLabel:0];
    headerLabel = self->_headerLabel;
    self->_headerLabel = v10;

    [(VUIPostPlayView *)self addSubview:self->_headerLabel];
  }
  [(VUIPostPlayView *)self bounds];
  double v13 = v12;
  [(VUIPostPlayView *)self bounds];
  double v15 = v14;
  [(VUIPostPlayView *)self bounds];
  double v17 = v16 + -34.0 + -12.0;
  v18 = (AVBackgroundView *)objc_alloc_init(MEMORY[0x1E4F16708]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v18;

  -[AVBackgroundView setFrame:](self->_backgroundView, "setFrame:", v13, 46.0, v15, v17);
  double v20 = [(AVBackgroundView *)self->_backgroundView layer];
  [v20 setCornerRadius:16.0];

  objc_super v21 = [(AVBackgroundView *)self->_backgroundView layer];
  [v21 setMasksToBounds:1];

  double v22 = [(VUIPostPlayView *)self backgroundView];
  [(VUIPostPlayView *)self addSubview:v22];

  id v23 = [(VUIPostPlayView *)self traitCollection];
  [v23 isAXEnabled];

  id v24 = objc_alloc(MEMORY[0x1E4FA9CE0]);
  [(VUIPostPlayView *)self bounds];
  id v25 = (_TVImageView *)objc_msgSend(v24, "initWithFrame:", 0.0, 0.0);
  episodeImageView = self->_episodeImageView;
  self->_episodeImageView = v25;

  id v27 = self->_episodeImageView;
  v28 = +[VUIImageResourceMap imageForResourceName:@"PreloadAsset-Dark-Generic16x9"];
  [(_TVImageView *)v27 setPlaceholderImage:v28];

  if (self->_episodeImageProxy) {
    -[_TVImageView setImageProxy:](self->_episodeImageView, "setImageProxy:");
  }
  [(AVBackgroundView *)self->_backgroundView addSubview:self->_episodeImageView];
  v29 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v29 setTextStyle:14];
  [(VUITextLayout *)v29 setFontWeight:10];
  objc_super v30 = [MEMORY[0x1E4FB1618] whiteColor];
  [(VUITextLayout *)v29 setColor:v30];

  if ([v37 length])
  {
    [(VUITextLayout *)v29 setMaximumContentSizeCategory:8];
    uint64_t v31 = 1;
  }
  else
  {
    uint64_t v31 = 2;
  }
  [(VUITextLayout *)v29 setNumberOfLines:v31];
  v32 = [(VUIPostPlayView *)self title];
  if (![v32 length])
  {
    v33 = +[VUILocalizationManager sharedInstance];
    uint64_t v34 = [v33 localizedStringForKey:@"TV.PostPlay.NextEpisode"];

    v32 = (void *)v34;
  }
  v35 = +[VUILabel labelWithString:v32 textLayout:v29 existingLabel:0];
  nextEpisodeLabel = self->_nextEpisodeLabel;
  self->_nextEpisodeLabel = v35;

  [(AVBackgroundView *)self->_backgroundView addSubview:self->_nextEpisodeLabel];
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = [(VUIPostPlayView *)self traitCollection];
  int v9 = [v8 isAXEnabled];

  if (v9)
  {
    -[VUIPostPlayView _layoutForCategoryAccessibility:metricsOnly:](self, "_layoutForCategoryAccessibility:metricsOnly:", v4, width, height);
  }
  else
  {
    -[VUIPostPlayView _layoutForOriginal:metricsOnly:](self, "_layoutForOriginal:metricsOnly:", v4, width, height);
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height = a3.height;
  if (self->_headerLabel) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  double width = a3.width;
  double v24 = a3.width + -32.0;
  -[VUILabel textRectForBounds:limitedToNumberOfLines:](self->_nextEpisodeLabel, "textRectForBounds:limitedToNumberOfLines:", v6, 16.0, 0.0);
  double v8 = v7;
  headerLabel = self->_headerLabel;
  [(VUIPostPlayView *)self bounds];
  -[VUILabel textRectForBounds:limitedToNumberOfLines:](headerLabel, "textRectForBounds:limitedToNumberOfLines:", 3);
  double v12 = v11 + 11.0;
  double v13 = v8 + v11 + 11.0 + 154.0;
  if (height >= v13) {
    double v14 = 0.0;
  }
  else {
    double v14 = height - (v8 + 154.0);
  }
  [(VUIPostPlayView *)self bounds];
  double v16 = v15;
  double v17 = [(VUIPostPlayView *)self backgroundView];
  objc_msgSend(v17, "setFrame:", v16, v14, width, fmax(v8 + 154.0 + 11.0, 141.0));

  -[VUILabel setFrame:](self->_nextEpisodeLabel, "setFrame:", 16.0, v8 * 0.5 + 154.0, v24, v8);
  if (self->_headerLabel)
  {
    [(AVBackgroundView *)self->_backgroundView frame];
    -[VUILabel setFrame:](self->_headerLabel, "setFrame:", 4.0, v18 - v12, v22, v21);
  }
  if (height >= v13) {
    double v19 = height;
  }
  else {
    double v19 = v13;
  }
  double v20 = width;
  result.double height = v19;
  result.double width = v20;
  return result;
}

- (CGSize)_layoutForOriginal:(CGSize)a3 metricsOnly:(BOOL)a4
{
  CGFloat height = a3.height;
  double width = a3.width;
  headerLabel = self->_headerLabel;
  if (headerLabel)
  {
    [(VUIPostPlayView *)self bounds];
    -[VUILabel sizeThatFits:](headerLabel, "sizeThatFits:", v8 + -8.0, 34.0);
    double v10 = v9;
    -[VUILabel setFrame:](self->_headerLabel, "setFrame:", 4.0, 0.0, v11, v9);
    double v12 = v10 + 11.0;
  }
  else
  {
    double v12 = 45.0;
  }
  [(VUIPostPlayView *)self bounds];
  double v14 = v13;
  double v15 = [(VUIPostPlayView *)self backgroundView];
  objc_msgSend(v15, "setFrame:", v14, v12, width, 141.0);

  nextEpisodeLabel = self->_nextEpisodeLabel;
  [(VUIPostPlayView *)self bounds];
  -[VUILabel sizeThatFits:](nextEpisodeLabel, "sizeThatFits:", v17 + -24.0, 34.0);
  double v19 = v18;
  double v20 = (34.0 - v18) * 0.5 + 107.0;
  [(VUIPostPlayView *)self bounds];
  -[VUILabel setFrame:](self->_nextEpisodeLabel, "setFrame:", 12.0, v20, v21 + -24.0, v19);
  double v22 = width;
  double v23 = height;
  result.CGFloat height = v23;
  result.double width = v22;
  return result;
}

- (void)setCanAutoPlay:(BOOL)a3
{
  self->_canAutoPladouble y = a3;
  CGRect v5 = [(VUIPostPlayView *)self title];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    if (a3)
    {
      nextEpisodeLabel = self->_nextEpisodeLabel;
      double v8 = +[VUILocalizationManager sharedInstance];
      double v9 = [v8 localizedStringForKey:@"TV.PostPlay.NextEpisode"];
    }
    else
    {
      int v10 = _os_feature_enabled_impl();
      double v11 = @"POST_PLAY_UP_NEXT";
      if (v10) {
        double v11 = @"POST_PLAY_CONTINUE_WATCHING";
      }
      nextEpisodeLabel = self->_nextEpisodeLabel;
      double v12 = v11;
      double v8 = +[VUILocalizationManager sharedInstance];
      double v9 = [v8 localizedStringForKey:v12];
    }
    [(VUILabel *)nextEpisodeLabel setText:v9];

    [(VUIPostPlayView *)self setNeedsLayout];
  }
}

- (void)_startAutoPlayAnimation
{
  id v3 = [(VUIPostPlayView *)self autoPlayIndicator];
  if (v3)
  {
  }
  else if ([(VUIPostPlayView *)self canAutoPlay])
  {
    BOOL v4 = +[VUIFeaturesConfiguration sharedInstance];
    CGRect v5 = [v4 playbackUpNextConfig];

    uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
    [v5 autoPlayTimerDuration];
    objc_msgSend(v6, "numberWithDouble:");
    double v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (v7 || (double v7 = self->_defaultAutoPlayDuration) != 0)
    {
      if ([(NSNumber *)v7 unsignedIntegerValue])
      {
        double v8 = (double)[(NSNumber *)v7 unsignedIntegerValue];
        double v9 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", @"PlayMask");
        int v10 = [MEMORY[0x1E4FB1618] whiteColor];
        double v11 = objc_msgSend(v9, "vui_imageWithColor:", v10);

        double v12 = [(VUIPostPlayView *)self traitCollection];
        int v13 = [v12 isAXEnabled];

        if (v13) {
          double v14 = 8.0;
        }
        else {
          double v14 = 4.0;
        }
        if (v13) {
          double v15 = 96.0;
        }
        else {
          double v15 = 48.0;
        }
        double v16 = [VUICountDownProgressIndicator alloc];
        [(_TVImageView *)self->_episodeImageView center];
        double v18 = v17 - v15 * 0.5;
        [(_TVImageView *)self->_episodeImageView center];
        double v20 = -[VUICountDownProgressIndicator initWithFrame:duration:](v16, "initWithFrame:duration:", v18, v19 - v15 * 0.5, v15, v15, v8);
        [(VUICountDownProgressIndicator *)v20 setProgressWidth:v14];
        double v21 = [MEMORY[0x1E4FB1618] whiteColor];
        [(VUICountDownProgressIndicator *)v20 setProgressTintColor:v21];

        double v22 = [MEMORY[0x1E4FB1618] blackColor];
        double v23 = [v22 colorWithAlphaComponent:0.7];
        [(VUICountDownProgressIndicator *)v20 setBackgroundTintColor:v23];

        [(VUICountDownProgressIndicator *)v20 setCenterImage:v11];
        [(VUICountDownProgressIndicator *)v20 setCountDownProgressDirection:1];
        objc_initWeak(&location, self);
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        v26 = __42__VUIPostPlayView__startAutoPlayAnimation__block_invoke;
        id v27 = &unk_1E6DF4A30;
        objc_copyWeak(&v28, &location);
        [(VUICountDownProgressIndicator *)v20 setCompletion:&v24];
        -[VUIPostPlayView setAutoPlayIndicator:](self, "setAutoPlayIndicator:", v20, v24, v25, v26, v27);
        [(_TVImageView *)self->_episodeImageView addSubview:v20];
        [(VUIPostPlayView *)self setNeedsLayout];
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __42__VUIPostPlayView__startAutoPlayAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dispatchAutoPlayEvent];
}

- (void)_invalidateAutoPlayIfNeeded
{
  id v3 = [(VUIPostPlayView *)self autoPlayIndicator];
  if (v3)
  {
    id v4 = v3;
    [v3 removeFromSuperview];
    [(VUIPostPlayView *)self setAutoPlayIndicator:0];
    id v3 = v4;
  }
}

- (void)_dispatchAutoPlayEvent
{
  id v3 = [(VUIPostPlayView *)self delegate];
  [v3 autoPlayTimerDidCompleteForPostPlayView:self];

  [(VUIPostPlayView *)self _invalidateAutoPlayIfNeeded];
}

- (VUIPostPlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIPostPlayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canAutoPlay
{
  return self->_canAutoPlay;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (AVBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (_TVImageView)episodeImageView
{
  return self->_episodeImageView;
}

- (void)setEpisodeImageView:(id)a3
{
}

- (VUILabel)nextEpisodeLabel
{
  return self->_nextEpisodeLabel;
}

- (void)setNextEpisodeLabel:(id)a3
{
}

- (VUILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (TVImageProxy)episodeImageProxy
{
  return self->_episodeImageProxy;
}

- (void)setEpisodeImageProxy:(id)a3
{
}

- (VUICountDownProgressIndicator)autoPlayIndicator
{
  return self->_autoPlayIndicator;
}

- (void)setAutoPlayIndicator:(id)a3
{
}

- (NSNumber)autoPlayDuration
{
  return self->_autoPlayDuration;
}

- (void)setAutoPlayDuration:(id)a3
{
}

- (NSNumber)defaultAutoPlayDuration
{
  return self->_defaultAutoPlayDuration;
}

- (void)setDefaultAutoPlayDuration:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_defaultAutoPlayDuration, 0);
  objc_storeStrong((id *)&self->_autoPlayDuration, 0);
  objc_storeStrong((id *)&self->_autoPlayIndicator, 0);
  objc_storeStrong((id *)&self->_episodeImageProxy, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_nextEpisodeLabel, 0);
  objc_storeStrong((id *)&self->_episodeImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end