@interface NANowPlayingArtworkView
- (BOOL)isAccessibilityElement;
- (CGSize)artworkSize;
- (CGSize)artworkSizeForTitleViewWidth:(double)a3;
- (CGSize)sizeThatFits:(CGSize)result;
- (NANowPlayingArtworkView)initWithFrame:(CGRect)a3;
- (UIImageView)trackImageView;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setTrackImage:(id)a3 animated:(BOOL)a4;
- (void)setTrackImageView:(id)a3;
@end

@implementation NANowPlayingArtworkView

- (NANowPlayingArtworkView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NANowPlayingArtworkView;
  v3 = -[NANowPlayingArtworkView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__NANowPlayingArtworkView_initWithFrame___block_invoke;
    v9[3] = &unk_1E6406068;
    v5 = v3;
    v10 = v5;
    uint64_t v6 = __41__NANowPlayingArtworkView_initWithFrame___block_invoke((uint64_t)v9);
    trackImageView = v5->_trackImageView;
    v5->_trackImageView = (UIImageView *)v6;
  }
  return v4;
}

id __41__NANowPlayingArtworkView_initWithFrame___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setContentMode:1];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityIgnoresInvertColors:1];
  [*(id *)(a1 + 32) addSubview:v3];
  return v3;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NANowPlayingArtworkView;
  [(NANowPlayingArtworkView *)&v6 layoutSubviews];
  [(NANowPlayingArtworkView *)self bounds];
  double Width = CGRectGetWidth(v7);
  [(NANowPlayingArtworkView *)self bounds];
  double Height = CGRectGetHeight(v8);
  v5 = [(NANowPlayingArtworkView *)self trackImageView];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, Width, Height);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width = result.width;
  result.height = width;
  return result;
}

- (void)setTrackImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    double v7 = 0.25;
  }
  else {
    double v7 = 0.0;
  }
  CGRect v8 = (void *)MEMORY[0x1E4FB1EB0];
  v9 = [(NANowPlayingArtworkView *)self trackImageView];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__NANowPlayingArtworkView_setTrackImage_animated___block_invoke;
  v11[3] = &unk_1E64060B8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 transitionWithView:v9 duration:5242880 options:v11 animations:0 completion:v7];
}

void __50__NANowPlayingArtworkView_setTrackImage_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) trackImageView];
  [v2 setImage:v1];
}

- (CGSize)artworkSize
{
  id v2 = [(NANowPlayingArtworkView *)self trackImageView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)artworkSizeForTitleViewWidth:(double)a3
{
  result.height = a3;
  result.double width = a3;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2558];
}

- (UIImageView)trackImageView
{
  return self->_trackImageView;
}

- (void)setTrackImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end