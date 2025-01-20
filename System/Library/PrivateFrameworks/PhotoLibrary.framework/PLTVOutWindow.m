@interface PLTVOutWindow
- (BOOL)_setupTargetScreen:(id)a3;
- (BOOL)setVideoView:(id)a3;
- (PLTVOutWindow)init;
- (id)videoView;
- (void)dealloc;
@end

@implementation PLTVOutWindow

- (id)videoView
{
  return self->_videoView;
}

- (BOOL)setVideoView:(id)a3
{
  BOOL v5 = [(PLTVOutWindow *)self _setupTargetScreen:[(PLTVOutWindow *)self screen]];
  if (v5)
  {
    videoView = self->_videoView;
    if (videoView != a3)
    {
      if ([(UIView *)videoView isDescendantOfView:self]) {
        [(UIView *)self->_videoView removeFromSuperview];
      }

      a3 = a3;
      self->_videoView = (UIView *)a3;
    }
    if (a3 && ([a3 isDescendantOfView:self->_backgroundView] & 1) == 0)
    {
      v7 = self->_videoView;
      [(UIView *)self->_backgroundView bounds];
      -[UIView setFrame:](v7, "setFrame:");
      [(UIView *)self->_backgroundView addSubview:self->_videoView];
    }
  }
  return v5;
}

- (BOOL)_setupTargetScreen:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [a3 setOverscanCompensation:2];
  uint64_t v4 = [a3 preferredMode];
  if (v4) {
    goto LABEL_2;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(a3, "availableModes", 0);
  uint64_t v5 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5) {
    return v5;
  }
  uint64_t v7 = v5;
  uint64_t v4 = 0;
  uint64_t v8 = *(void *)v18;
  double v9 = 0.0;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      [v11 size];
      if (fabs(v12 + -1280.0) < 0.00000011920929 && fabs(v13 + -720.0) < 0.00000011920929)
      {
        uint64_t v4 = (uint64_t)v11;
        goto LABEL_22;
      }
      double v14 = v12 * v13;
      if (v14 > 921600.0 && (v9 >= 921600.0 ? (BOOL v15 = v14 < v9) : (BOOL v15 = 1), v15) || v14 > v9)
      {
        uint64_t v4 = (uint64_t)v11;
        double v9 = v14;
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_22:
  if (v4)
  {
LABEL_2:
    [a3 setCurrentMode:v4];
    LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLTVOutWindow;
  [(PLTVOutWindow *)&v3 dealloc];
}

- (PLTVOutWindow)init
{
  uint64_t v3 = MPTVOutScreen();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    [(PLTVOutWindow *)self _setupTargetScreen:v3];
    [v4 bounds];
    v10.receiver = self;
    v10.super_class = (Class)PLTVOutWindow;
    uint64_t v5 = -[PLTVOutWindow initWithFrame:](&v10, sel_initWithFrame_);
    v6 = v5;
    if (v5)
    {
      [(PLTVOutWindow *)v5 setScreen:v4];
      id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
      [(PLTVOutWindow *)v6 bounds];
      uint64_t v8 = (UIView *)objc_msgSend(v7, "initWithFrame:");
      v6->_backgroundView = v8;
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", [MEMORY[0x1E4F428B8] blackColor]);
      [(PLTVOutWindow *)v6 addSubview:v6->_backgroundView];
    }
  }
  else
  {
    NSLog(&cfstr_ErrorNoExterna.isa);

    return 0;
  }
  return v6;
}

@end