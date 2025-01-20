@interface SXVideoFillView
- (BOOL)accessibilityIgnoresInvertColors;
- (CGRect)contentFrame;
- (CGRect)fillFrameWithBoundingSize:(CGSize)a3;
- (SXClippingView)clippingView;
- (SXImageResource)imageResource;
- (SXImageView)imageView;
- (SXVideoFill)videoFill;
- (SXVideoFillPlayerView)playerView;
- (SXVideoFillView)initWithVideoFill:(id)a3 DOMObjectProvider:(id)a4 imageViewFactory:(id)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)load;
- (void)pause;
- (void)play;
- (void)reset;
- (void)setClippingView:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setImageResource:(id)a3;
- (void)setPlayerView:(id)a3;
@end

@implementation SXVideoFillView

- (SXVideoFillView)initWithVideoFill:(id)a3 DOMObjectProvider:(id)a4 imageViewFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SXVideoFillView;
  v12 = [(SXFillView *)&v26 initWithFill:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_videoFill, a3);
    v14 = [v9 resourceIdentifier];
    v15 = [v10 resourceForIdentifier:v14];

    v16 = [v9 stillImageIdentifier];
    uint64_t v17 = [v10 imageResourceForIdentifier:v16];
    imageResource = v13->_imageResource;
    v13->_imageResource = (SXImageResource *)v17;

    uint64_t v19 = [v11 imageViewForResource:v13->_imageResource];
    imageView = v13->_imageView;
    v13->_imageView = (SXImageView *)v19;

    [(SXImageView *)v13->_imageView setIsDecorative:1];
    v21 = [[SXVideoFillPlayerView alloc] initWithVideoResource:v15 imageView:v13->_imageView];
    playerView = v13->_playerView;
    v13->_playerView = v21;

    -[SXVideoFillPlayerView setFillMode:](v13->_playerView, "setFillMode:", [v9 fillMode]);
    -[SXVideoFillPlayerView setShouldLoop:](v13->_playerView, "setShouldLoop:", [v9 loop]);
    v23 = [[SXClippingView alloc] initWithContentView:v13->_playerView];
    clippingView = v13->_clippingView;
    v13->_clippingView = v23;

    [(SXVideoFillView *)v13 addSubview:v13->_clippingView];
  }

  return v13;
}

- (void)dealloc
{
  if ([(SXImageView *)self->_imageView objectHasQualityInterest:self quality:0])
  {
    [(SXImageView *)self->_imageView giveUpInterestForObject:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)SXVideoFillView;
  [(SXVideoFillView *)&v3 dealloc];
}

- (void)load
{
  v5.receiver = self;
  v5.super_class = (Class)SXVideoFillView;
  [(SXFillView *)&v5 load];
  if (![(SXImageView *)self->_imageView objectHasQualityInterest:self quality:0])
  {
    [(SXVideoFillView *)self contentFrame];
    -[SXImageView setPreferredImageSize:](self->_imageView, "setPreferredImageSize:", v3, v4);
    [(SXImageView *)self->_imageView addInterestInImageQuality:0 forObject:self];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SXVideoFillView;
  [(SXVideoFillView *)&v4 layoutSubviews];
  double v3 = [(SXVideoFillView *)self clippingView];
  [(SXVideoFillView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SXVideoFillView *)self imageResource];
  [v6 dimensions];
  double v8 = v7;
  double v10 = v9;

  id v11 = [(SXFillView *)self fill];
  uint64_t v12 = [v11 fillMode];

  v13 = [(SXFillView *)self fill];
  uint64_t v14 = [v13 horizontalAlignment];

  v15 = [(SXFillView *)self fill];
  uint64_t v16 = [v15 verticalAlignment];

  +[SXFillPositioning frameForFillWithDimensions:withinBounds:fillMode:horizontalAlignment:verticalAlignment:](SXFillPositioning, "frameForFillWithDimensions:withinBounds:fillMode:horizontalAlignment:verticalAlignment:", v12, v14, v16, v8, v10, width, height);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)play
{
  id v2 = [(SXVideoFillView *)self playerView];
  [v2 play];
}

- (void)pause
{
  id v2 = [(SXVideoFillView *)self playerView];
  [v2 pause];
}

- (void)reset
{
  id v2 = [(SXVideoFillView *)self playerView];
  [v2 reset];
}

- (CGRect)contentFrame
{
  id v2 = [(SXVideoFillView *)self clippingView];
  [v2 contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(SXVideoFillView *)self clippingView];
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (SXVideoFill)videoFill
{
  return self->_videoFill;
}

- (SXClippingView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (SXVideoFillPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
}

- (SXImageResource)imageResource
{
  return self->_imageResource;
}

- (void)setImageResource:(id)a3
{
}

- (SXImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageResource, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_videoFill, 0);
}

@end