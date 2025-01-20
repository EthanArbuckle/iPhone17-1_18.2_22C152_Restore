@interface MSAudioProgressView
- (BOOL)isHighlighted;
- (MSAudioProgressView)initWithFrame:(CGRect)a3;
- (SUPlayerStatus)playerStatus;
- (id)_newBufferingImageView;
- (id)_newProgressView;
- (void)_cancelBufferingTimer;
- (void)_showBufferingImageView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setPlayerStatus:(id)a3;
@end

@implementation MSAudioProgressView

- (MSAudioProgressView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MSAudioProgressView;
  v3 = -[MSAudioProgressView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(MSAudioProgressView *)v3 _newProgressView];
    v4->_progressView = (MSPieImageView *)v5;
    [(MSAudioProgressView *)v4 addSubview:v5];
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v8 = [MEMORY[0x263F1C6B0] imageNamed:@"StopButton" inBundle:v6];
    v9 = (UIImageView *)objc_msgSend(v7, "initWithImage:highlightedImage:", v8, objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"StopButtonPressed", v6));
    v4->_stopImageView = v9;
    [(UIImageView *)v9 setContentMode:4];
    [(MSAudioProgressView *)v4 addSubview:v4->_stopImageView];
  }
  return v4;
}

- (void)dealloc
{
  [(MSAudioProgressView *)self _cancelBufferingTimer];

  v3.receiver = self;
  v3.super_class = (Class)MSAudioProgressView;
  [(MSAudioProgressView *)&v3 dealloc];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[UIImageView setHighlighted:](self->_stopImageView, "setHighlighted:");
  }
}

- (void)setPlayerStatus:(id)a3
{
  playerStatus = self->_playerStatus;
  if (playerStatus != a3)
  {

    uint64_t v6 = (SUPlayerStatus *)[a3 copy];
    self->_playerStatus = v6;
    if ([(SUPlayerStatus *)v6 playerState] == 1)
    {
      if (!self->_bufferingTimer && !self->_bufferingImageView)
      {
        uint64_t v7 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
        uint64_t v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
        self->_bufferingTimer = v8;
        dispatch_time_t v9 = dispatch_time(0, 500000000);
        dispatch_source_set_timer((dispatch_source_t)v8, v9, 0, 0);
        bufferingTimer = self->_bufferingTimer;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __39__MSAudioProgressView_setPlayerStatus___block_invoke;
        handler[3] = &unk_264CE8A10;
        handler[4] = v7;
        dispatch_source_set_event_handler(bufferingTimer, handler);
        dispatch_resume((dispatch_object_t)self->_bufferingTimer);
      }
    }
    else
    {
      [(MSAudioProgressView *)self _cancelBufferingTimer];
      [(UIImageView *)self->_bufferingImageView stopAnimating];
      [(UIImageView *)self->_bufferingImageView removeFromSuperview];

      self->_bufferingImageView = 0;
      if (!self->_progressView)
      {
        objc_super v11 = [(MSAudioProgressView *)self _newProgressView];
        self->_progressView = v11;
        [(MSAudioProgressView *)self insertSubview:v11 belowSubview:self->_stopImageView];
      }
      [(SUPlayerStatus *)self->_playerStatus duration];
      double v13 = v12;
      if (v12 < 0.00000011920929)
      {
        progressView = self->_progressView;
        double v15 = 0.0;
      }
      else
      {
        [(SUPlayerStatus *)self->_playerStatus currentTime];
        if (v16 < 0.00000011920929) {
          double v16 = 0.0;
        }
        progressView = self->_progressView;
        double v15 = v16 / v13;
      }
      [(MSPieImageView *)progressView setPieFraction:v15];
    }
    [(MSAudioProgressView *)self setNeedsLayout];
  }
}

uint64_t __39__MSAudioProgressView_setPlayerStatus___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) object];
  return [v1 _showBufferingImageView];
}

- (void)layoutSubviews
{
  [(MSAudioProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  bufferingImageView = self->_bufferingImageView;
  if (bufferingImageView)
  {
    [(UIImageView *)bufferingImageView frame];
    float v9 = (v4 - v8) * 0.5;
    float v11 = (v6 - v10) * 0.5;
    -[UIImageView setFrame:](self->_bufferingImageView, "setFrame:", floorf(v9), floorf(v11));
  }
  progressView = self->_progressView;
  if (progressView)
  {
    [(MSPieImageView *)progressView frame];
    float v14 = (v4 - v13) * 0.5;
    float v16 = (v6 - v15) * 0.5;
    -[MSPieImageView setFrame:](self->_progressView, "setFrame:", floorf(v14), floorf(v16));
  }
  [(UIImageView *)self->_stopImageView frame];
  stopImageView = self->_stopImageView;
  -[UIImageView setFrame:](stopImageView, "setFrame:");
}

- (void)_cancelBufferingTimer
{
  bufferingTimer = self->_bufferingTimer;
  if (bufferingTimer)
  {
    dispatch_source_cancel(bufferingTimer);
    dispatch_release((dispatch_object_t)self->_bufferingTimer);
    self->_bufferingTimer = 0;
  }
}

- (id)_newBufferingImageView
{
  id v2 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  for (uint64_t i = 1; i != 13; ++i)
  {
    double v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"PreviewLoading%ld", i);
    uint64_t v7 = [MEMORY[0x263F1C6B0] imageNamed:v6 inBundle:v4];
    if (v7) {
      [v3 addObject:v7];
    }
  }
  objc_msgSend(v2, "setAnimationDuration:", (double)(unint64_t)objc_msgSend(v3, "count") / 15.0);
  [v2 setAnimationImages:v3];
  if ([v3 count])
  {
    [v2 frame];
    double v9 = v8;
    double v11 = v10;
    objc_msgSend((id)objc_msgSend(v3, "lastObject"), "size");
    objc_msgSend(v2, "setFrame:", v9, v11, v12, v13);
  }

  return v2;
}

- (id)_newProgressView
{
  id v2 = objc_alloc_init(MSPieImageView);
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[MSPieImageView setBackgroundColor:](v2, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  -[MSPieImageView setBackgroundImage:](v2, "setBackgroundImage:", [MEMORY[0x263F1C6B0] imageNamed:@"PreviewProgressBackground" inBundle:v3]);
  -[MSPieImageView setForegroundImage:](v2, "setForegroundImage:", [MEMORY[0x263F1C6B0] imageNamed:@"PreviewProgressForeground" inBundle:v3]);
  [(MSPieImageView *)v2 setPieRadius:24.5];
  [(MSPieImageView *)v2 sizeToFit];
  return v2;
}

- (void)_showBufferingImageView
{
  if ([(SUPlayerStatus *)self->_playerStatus playerState] == 1)
  {
    [(MSPieImageView *)self->_progressView removeFromSuperview];

    self->_progressView = 0;
    bufferingImageView = self->_bufferingImageView;
    if (!bufferingImageView)
    {
      uint64_t v4 = [(MSAudioProgressView *)self _newBufferingImageView];
      self->_bufferingImageView = v4;
      [(MSAudioProgressView *)self insertSubview:v4 belowSubview:self->_stopImageView];
      bufferingImageView = self->_bufferingImageView;
    }
    [(UIImageView *)bufferingImageView startAnimating];
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (SUPlayerStatus)playerStatus
{
  return self->_playerStatus;
}

@end