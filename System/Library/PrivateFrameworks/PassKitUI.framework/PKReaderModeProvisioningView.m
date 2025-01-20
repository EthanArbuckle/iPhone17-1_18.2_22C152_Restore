@interface PKReaderModeProvisioningView
+ (id)watchImage:(BOOL)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKReaderModeProvisioningView)initWithContext:(int64_t)a3 product:(id)a4 isWatch:(BOOL)a5;
- (PKReaderModeProvisioningView)initWithFrame:(CGRect)a3 context:(int64_t)a4 product:(id)a5 isWatch:(BOOL)a6;
- (PKReaderModeProvisioningView)initWithFrame:(CGRect)a3 product:(id)a4;
- (void)_loadAnimation;
- (void)layoutSubviews;
- (void)setDigitalCardImage:(id)a3;
- (void)setPlasticCardImage:(id)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setTransferringProgress:(double)a3 duration:(double)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKReaderModeProvisioningView

- (PKReaderModeProvisioningView)initWithContext:(int64_t)a3 product:(id)a4 isWatch:(BOOL)a5
{
  return -[PKReaderModeProvisioningView initWithFrame:context:product:isWatch:](self, "initWithFrame:context:product:isWatch:", a3, a4, a5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKReaderModeProvisioningView)initWithFrame:(CGRect)a3 context:(int64_t)a4 product:(id)a5 isWatch:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PKReaderModeProvisioningView;
  v14 = -[PKReaderModeProvisioningView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  if (v14)
  {
    v15 = [v13 provisioningMethodMetadataForType:*MEMORY[0x1E4F87AA0]];
    v16 = [v15 readerModeResources];

    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F87AB8]];
    uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F87AA8]];
    cardPlacement = v14->_cardPlacement;
    v14->_cardPlacement = (NSString *)v18;

    if (PKPaymentSetupContextIsBridge()) {
      LOBYTE(v20) = 1;
    }
    else {
      int v20 = PKPaymentSetupForceBridgeAppearance() | v6;
    }
    v14->_isProvisioningToWatch = v20;
    [(PKReaderModeProvisioningView *)v14 _loadAnimation];
    v21 = [[PKReaderModeHeaderView alloc] initWithState:2 context:a4 product:v13];
    headerView = v14->_headerView;
    v14->_headerView = v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:0];
    progressView = v14->_progressView;
    v14->_progressView = (UIProgressView *)v23;

    [(UIProgressView *)v14->_progressView setHidden:1];
    [(PKReaderModeProvisioningView *)v14 addSubview:v14->_headerView];
    [(PKReaderModeProvisioningView *)v14 addSubview:v14->_progressView];
  }
  return v14;
}

- (PKReaderModeProvisioningView)initWithFrame:(CGRect)a3 product:(id)a4
{
  return -[PKReaderModeProvisioningView initWithFrame:context:product:isWatch:](self, "initWithFrame:context:product:isWatch:", 0, a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_loadAnimation
{
  v3 = [(PKReaderModeProvisioningView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    v5 = @"Reader_mode_Dark_ICE";
  }
  else {
    v5 = @"Reader_mode_Light_ICE";
  }
  id v11 = v5;
  if (self->_isProvisioningToWatch)
  {
    BOOL v6 = +[PKReaderModeProvisioningView watchImage:v4 == 2];
  }
  else
  {
    BOOL v6 = 0;
  }
  if ([(NSString *)self->_cardPlacement isEqualToString:*MEMORY[0x1E4F87AB0]])
  {
    id v11 = [v11 stringByAppendingString:@"_Lower"];
  }
  animationView = self->_animationView;
  if (animationView)
  {
    uint64_t v8 = [(PKReaderModeAnimationView *)animationView state];
    [(PKReaderModeAnimationView *)self->_animationView removeFromSuperview];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [[PKReaderModeAnimationView alloc] initWithAssetName:v11 forPhoneTarget:!self->_isProvisioningToWatch];
  v10 = self->_animationView;
  self->_animationView = v9;

  [(PKReaderModeAnimationView *)self->_animationView setClipsToBounds:1];
  if (self->_digitalCardImage) {
    -[PKReaderModeAnimationView setDigitalCardImage:](self->_animationView, "setDigitalCardImage:");
  }
  if (self->_plasticCardImage) {
    -[PKReaderModeAnimationView setPlasticCardImage:](self->_animationView, "setPlasticCardImage:");
  }
  [(PKReaderModeAnimationView *)self->_animationView setWatchAssetImage:v6];
  [(PKReaderModeAnimationView *)self->_animationView setState:v8];
  [(PKReaderModeProvisioningView *)self addSubview:self->_animationView];
  [(PKReaderModeProvisioningView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKReaderModeProvisioningView;
  [(PKReaderModeProvisioningView *)&v16 layoutSubviews];
  [(PKReaderModeAnimationView *)self->_animationView frame];
  double v4 = v3;
  double v6 = v5;
  headerView = self->_headerView;
  [(PKReaderModeProvisioningView *)self bounds];
  -[PKTableHeaderView sizeThatFits:](headerView, "sizeThatFits:", v8, 1.79769313e308);
  double v10 = v9;
  double v11 = v4 + v6 + 10.0;
  -[PKReaderModeHeaderView setFrame:](self->_headerView, "setFrame:", 0.0, v11, v12, v9);
  [(PKReaderModeHeaderView *)self->_headerView setNeedsLayout];
  [(UIProgressView *)self->_progressView frame];
  double v14 = v13;
  [(PKReaderModeProvisioningView *)self bounds];
  -[UIProgressView setFrame:](self->_progressView, "setFrame:", 80.0, v11 + v10, v15 + -160.0, v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[PKReaderModeAnimationView sizeThatFits:](self->_animationView, "sizeThatFits:");
  double v7 = v6;
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", width, height);
  double v9 = v7 + 10.0 + v8;
  if (([(UIProgressView *)self->_progressView isHidden] & 1) == 0)
  {
    -[UIProgressView sizeThatFits:](self->_progressView, "sizeThatFits:", width, height);
    double v9 = v9 + v10;
  }
  double v11 = width;
  double v12 = v9;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  [(PKReaderModeAnimationView *)self->_animationView setState:a3 animated:a4];
  [(PKReaderModeHeaderView *)self->_headerView setState:a3];
  [(UIProgressView *)self->_progressView setHidden:a3 != 3];
  if (!a3) {
    [(UIProgressView *)self->_progressView setProgress:0.0];
  }

  [(PKReaderModeProvisioningView *)self setNeedsLayout];
}

- (void)setTransferringProgress:(double)a3 duration:(double)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKReaderModeProvisioningView_setTransferringProgress_duration___block_invoke;
  block[3] = &unk_1E59CBCB8;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__PKReaderModeProvisioningView_setTransferringProgress_duration___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  return [*(id *)(*(void *)(a1 + 32) + 424) _setProgressAnimated:4 duration:v1 delay:*(double *)(a1 + 48) options:0.0];
}

- (void)setPlasticCardImage:(id)a3
{
  p_plasticCardImage = &self->_plasticCardImage;
  objc_storeStrong((id *)&self->_plasticCardImage, a3);
  id v6 = a3;
  [(PKReaderModeAnimationView *)self->_animationView setPlasticCardImage:*p_plasticCardImage];
}

- (void)setDigitalCardImage:(id)a3
{
  p_digitalCardImage = &self->_digitalCardImage;
  objc_storeStrong((id *)&self->_digitalCardImage, a3);
  id v6 = a3;
  [(PKReaderModeAnimationView *)self->_animationView setDigitalCardImage:*p_digitalCardImage];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKReaderModeProvisioningView;
  [(PKReaderModeProvisioningView *)&v8 traitCollectionDidChange:v4];
  if (!v4
    || (uint64_t v5 = [v4 userInterfaceStyle],
        [(PKReaderModeProvisioningView *)self traitCollection],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 userInterfaceStyle],
        v6,
        v5 != v7))
  {
    [(PKReaderModeProvisioningView *)self _loadAnimation];
  }
}

+ (id)watchImage:(BOOL)a3
{
  id v4 = objc_alloc_init(PKWatchHeroImageView);
  [(PKWatchHeroImageView *)v4 setHideDoneLabel:1];
  -[PKWatchHeroImageView sizeThatFits:](v4, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  CGFloat v6 = v5;
  PKSizeAlignedInRect();
  CGRect v23 = CGRectInset(v22, 23.0, 0.0);
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  double v10 = v23.origin.x + 1.5;
  -[PKWatchHeroImageView setFrame:](v4, "setFrame:", v23.origin.x + 1.5, v23.origin.y);
  [(PKWatchHeroImageView *)v4 setNeedsLayout];
  [(PKWatchHeroImageView *)v4 layoutIfNeeded];
  double v11 = PKUIScreenScale();
  v20.double width = width;
  v20.double height = height;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v11);
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  double v13 = [(PKWatchHeroImageView *)v4 layer];
  [v13 renderInContext:CurrentContext];

  double v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v21.double width = v6;
  v21.double height = v6;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v11);
  double v15 = UIGraphicsGetCurrentContext();
  if (a3) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  objc_super v16 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [v16 setFill];
  v24.origin.double x = 0.0;
  v24.origin.double y = 0.0;
  v24.size.double width = v6;
  v24.size.double height = v6;
  CGContextFillRect(v15, v24);
  objc_msgSend(v14, "drawInRect:", v10, y, width, height);
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalCardImage, 0);
  objc_storeStrong((id *)&self->_plasticCardImage, 0);
  objc_storeStrong((id *)&self->_cardPlacement, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_animationView, 0);
}

@end