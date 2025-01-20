@interface ISAnimatedImageView
- (BOOL)animatedImagePlayerIsReadyToDisplay:(id)a3;
- (BOOL)isPlaying;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ISAnimatedImagePlayer)player;
- (ISAnimatedImageView)initWithAnimatedImage:(id)a3;
- (ISAnimatedImageView)initWithAnimatedImagePlayer:(id)a3;
- (PFAnimatedImage)image;
- (UIImageView)placeholderImageView;
- (unint64_t)displayedFrameIndex;
- (void)animatedImagePlayerDidBeginAnimating:(id)a3;
- (void)animatedImagePlayerFrameDidChange:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)displayLayer:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setDisplayedFrameIndex:(unint64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setPlaceholderImageView:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlaying:(BOOL)a3;
@end

@implementation ISAnimatedImageView

- (void).cxx_destruct
{
}

- (ISAnimatedImagePlayer)player
{
  return self->_player;
}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (void)displayLayer:(id)a3
{
  player = self->_player;
  id v4 = a3;
  objc_msgSend(v4, "setContents:", -[ISAnimatedImagePlayer currentImage](player, "currentImage"));
}

- (void)setPlaceholderImageView:(id)a3
{
  placeholderImageView = self->_placeholderImageView;
  if (placeholderImageView != a3)
  {
    v6 = (UIImageView *)a3;
    [(UIImageView *)placeholderImageView removeFromSuperview];
    self->_placeholderImageView = v6;
    -[ISAnimatedImageView addSubview:](self, "addSubview:");
    v5 = self->_placeholderImageView;
    [(ISAnimatedImageView *)self bounds];
    -[UIImageView setFrame:](v5, "setFrame:");
    [(UIImageView *)v6 setAutoresizingMask:18];
    [(ISAnimatedImagePlayer *)self->_player updateAnimation];
  }
}

- (unint64_t)displayedFrameIndex
{
  return [(ISAnimatedImagePlayer *)self->_player displayedFrameIndex];
}

- (void)setDisplayedFrameIndex:(unint64_t)a3
{
}

- (BOOL)isPlaying
{
  return [(ISAnimatedImagePlayer *)self->_player isPlaying];
}

- (void)setPlaying:(BOOL)a3
{
}

- (PFAnimatedImage)image
{
  return [(ISAnimatedImagePlayer *)self->_player animatedImage];
}

- (void)setImage:(id)a3
{
  id v7 = a3;
  id v4 = [(ISAnimatedImagePlayer *)self->_player animatedImage];

  v5 = v7;
  if (v4 != v7)
  {
    if (v7) {
      v6 = [[ISAnimatedImagePlayer alloc] initWithAnimatedImage:v7];
    }
    else {
      v6 = 0;
    }
    [(ISAnimatedImageView *)self setPlayer:v6];

    v5 = v7;
  }
}

- (void)animatedImagePlayerDidBeginAnimating:(id)a3
{
  placeholderImageView = self->_placeholderImageView;
  if (placeholderImageView) {
    [(UIImageView *)placeholderImageView setHidden:1];
  }
}

- (BOOL)animatedImagePlayerIsReadyToDisplay:(id)a3
{
  id v4 = [(ISAnimatedImageView *)self window];
  if (v4)
  {
    v5 = [(ISAnimatedImageView *)self superview];
    if (v5 && ([(ISAnimatedImageView *)self isHidden] & 1) == 0)
    {
      [(ISAnimatedImageView *)self alpha];
      BOOL v6 = v7 > 0.0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)animatedImagePlayerFrameDidChange:(id)a3
{
  id v3 = [(ISAnimatedImageView *)self layer];
  [v3 setNeedsDisplay];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ISAnimatedImageView;
  [(ISAnimatedImageView *)&v4 setHidden:a3];
  [(ISAnimatedImagePlayer *)self->_player updateAnimation];
}

- (void)setAlpha:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ISAnimatedImageView;
  [(ISAnimatedImageView *)&v4 setAlpha:a3];
  [(ISAnimatedImagePlayer *)self->_player updateAnimation];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImageView;
  [(ISAnimatedImageView *)&v3 didMoveToSuperview];
  [(ISAnimatedImagePlayer *)self->_player updateAnimation];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImageView;
  [(ISAnimatedImageView *)&v3 didMoveToWindow];
  [(ISAnimatedImagePlayer *)self->_player updateAnimation];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(ISAnimatedImagePlayer *)self->_player animatedImage];
  [v5 pixelSize];
  if (v7 == 0.0)
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v8 = v6;
    double v9 = v7;
    if (height != 0.0 && width != 0.0)
    {
      double v12 = v6 / v7;
      if (width / height <= v8 / v7)
      {
        double v8 = width;
        double v9 = width / v12;
      }
      else
      {
        double v8 = height * v12;
        double v9 = height;
      }
    }
  }

  double v10 = v8;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)dealloc
{
  [(ISAnimatedImagePlayer *)self->_player unregisterDestination:self];
  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImageView;
  [(ISAnimatedImageView *)&v3 dealloc];
}

- (void)setPlayer:(id)a3
{
  id v5 = a3;
  id player = self->_player;
  if (player != v5)
  {
    id v8 = v5;
    [player unregisterDestination:self];
    objc_storeStrong((id *)&self->_player, a3);
    if (v8)
    {
      id player = (id)[(ISAnimatedImagePlayer *)self->_player registerDestination:self];
    }
    else
    {
      double v7 = [(ISAnimatedImageView *)self layer];
      [v7 setNeedsDisplay];

      id v5 = 0;
      id player = self->_placeholderImageView;
      if (!player) {
        goto LABEL_7;
      }
      id player = (id)[player setHidden:0];
    }
    id v5 = v8;
  }
LABEL_7:

  MEMORY[0x1F41817F8](player, v5);
}

- (ISAnimatedImageView)initWithAnimatedImagePlayer:(id)a3
{
  id v5 = a3;
  double v6 = -[ISAnimatedImageView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    [(ISAnimatedImagePlayer *)v7->_player registerDestination:v7];
  }

  return v7;
}

- (ISAnimatedImageView)initWithAnimatedImage:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ISAnimatedImagePlayer alloc] initWithAnimatedImage:v4];
  }
  else
  {
    id v5 = 0;
  }
  double v6 = [(ISAnimatedImageView *)self initWithAnimatedImagePlayer:v5];

  return v6;
}

@end