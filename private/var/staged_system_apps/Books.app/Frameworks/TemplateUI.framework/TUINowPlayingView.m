@interface TUINowPlayingView
+ (id)renderModelWithIdentifier:(id)a3 playing:(BOOL)a4 color:(id)a5;
- (BOOL)playing;
- (TUINowPlayingView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (_TUINowPlayingRenderModel)renderModel;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRenderModel:(id)a3;
@end

@implementation TUINowPlayingView

+ (id)renderModelWithIdentifier:(id)a3 playing:(BOOL)a4 color:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = objc_alloc_init(_TUINowPlayingRenderModel);
  [(_TUINowPlayingRenderModel *)v9 setPlaying:v5];
  [(_TUINowPlayingRenderModel *)v9 setColor:v7];

  v10 = [[TUIRenderModelView alloc] initWithReuseIdentifier:@"TUIReuseIdentifierNowPlayingView" identifier:v8 submodel:v9];

  return v10;
}

- (void)applyLayoutAttributes:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TUINowPlayingView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v12 applyLayoutAttributes:v4];
  BOOL v5 = [v4 renderModel];

  v6 = [v5 submodel];
  renderModel = self->_renderModel;
  self->_renderModel = v6;

  self->_playing = [(_TUINowPlayingRenderModel *)self->_renderModel playing];
  id v8 = [(_TUINowPlayingRenderModel *)self->_renderModel color];
  v9 = v8;
  if (!v8)
  {
    v9 = +[UIColor redColor];
  }
  objc_storeStrong((id *)&self->_color, v9);
  if (!v8) {

  }
  [(MPUNowPlayingIndicatorView *)self->_nowPlayingIndicatorView setLevelGuttersColor:self->_color];
  double v10 = 0.6;
  if (self->_playing)
  {
    double v10 = 1.0;
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 2;
  }
  [(MPUNowPlayingIndicatorView *)self->_nowPlayingIndicatorView setAlpha:v10];
  [(MPUNowPlayingIndicatorView *)self->_nowPlayingIndicatorView setPlaybackState:v11];
}

- (TUINowPlayingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TUINowPlayingView;
  v3 = -[TUINowPlayingView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)MPUNowPlayingIndicatorView);
    [(TUINowPlayingView *)v3 bounds];
    BOOL v5 = [v4 initWithFrame:];
    nowPlayingIndicatorView = v3->_nowPlayingIndicatorView;
    v3->_nowPlayingIndicatorView = v5;

    [(MPUNowPlayingIndicatorView *)v3->_nowPlayingIndicatorView setInterLevelSpacing:1.0];
    [(MPUNowPlayingIndicatorView *)v3->_nowPlayingIndicatorView setLevelCornerRadius:1.0];
    [(MPUNowPlayingIndicatorView *)v3->_nowPlayingIndicatorView setLevelWidth:2.5];
    [(MPUNowPlayingIndicatorView *)v3->_nowPlayingIndicatorView setMaximumLevelHeight:10.0];
    [(MPUNowPlayingIndicatorView *)v3->_nowPlayingIndicatorView setMinimumLevelHeight:2.0];
    [(MPUNowPlayingIndicatorView *)v3->_nowPlayingIndicatorView setNumberOfLevels:4];
    [(TUINowPlayingView *)v3 addSubview:v3->_nowPlayingIndicatorView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUINowPlayingView;
  [(TUINowPlayingView *)&v3 layoutSubviews];
  [(TUINowPlayingView *)self bounds];
  -[MPUNowPlayingIndicatorView setFrame:](self->_nowPlayingIndicatorView, "setFrame:");
}

- (_TUINowPlayingRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);

  objc_storeStrong((id *)&self->_nowPlayingIndicatorView, 0);
}

@end