@interface _UIBarBackgroundImageView
- (BOOL)isTranslucent;
- (id)image;
- (id)topStripView;
- (void)removeTopStripView;
- (void)setImage:(id)a3;
- (void)setTranslucent:(BOOL)a3;
- (void)updateTopStripViewCreateIfNecessary;
@end

@implementation _UIBarBackgroundImageView

- (void)setImage:(id)a3
{
  if (self->_topStripView)
  {
    customImageContainer = self->_customImageContainer;
    [(UIImageView *)customImageContainer setImage:a3];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIBarBackgroundImageView;
    [(UIImageView *)&v4 setImage:a3];
  }
}

- (void)removeTopStripView
{
  v3 = [(_UIBarBackgroundImageView *)self image];
  topStripView = self->_topStripView;
  if (topStripView)
  {
    [(UIView *)topStripView removeFromSuperview];
    v5 = self->_topStripView;
    self->_topStripView = 0;

    v19.receiver = self;
    v19.super_class = (Class)_UIBarBackgroundImageView;
    [(UIImageView *)&v19 setImage:v3];
    [(UIView *)self->_customImageContainer removeFromSuperview];
    customImageContainer = self->_customImageContainer;
    self->_customImageContainer = 0;
  }
  if (v3)
  {
    [v3 size];
    double v8 = v7;
    [(UIView *)self bounds];
    if (v8 < v9)
    {
      [v3 capInsets];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      if (([v3 _isResizable] & 1) == 0)
      {
        [v3 size];
        if (v16 > 1.0)
        {
          [v3 size];
          v18 = objc_msgSend(v3, "resizableImageWithCapInsets:", v17 + -1.0, v11, v13, v15);
          [(_UIBarBackgroundImageView *)self setImage:v18];
        }
      }
    }
  }
}

- (id)image
{
  if (self->_topStripView)
  {
    v2 = [(UIImageView *)self->_customImageContainer image];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIBarBackgroundImageView;
    v2 = [(UIImageView *)&v4 image];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageContainer, 0);
  objc_storeStrong((id *)&self->_topStripView, 0);
}

- (id)topStripView
{
  return self->_topStripView;
}

- (void)updateTopStripViewCreateIfNecessary
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(UIView *)self window];
  double v12 = __UIStatusBarManagerForWindow(v11);
  [v12 defaultStatusBarHeightInOrientation:1];
  double v14 = v13;

  double v15 = v10 - (v14 + 0.0);
  double v16 = [(_UIBarBackgroundImageView *)self image];
  topStripView = self->_topStripView;
  if (!topStripView)
  {
    v18 = -[UIView initWithFrame:]([_UIBarBackgroundTopCurtainView alloc], "initWithFrame:", v4, v6, v8, v14);
    objc_super v19 = self->_topStripView;
    self->_topStripView = &v18->super;

    [(UIView *)self->_topStripView setAutoresizingMask:2];
    [(UIView *)self addSubview:self->_topStripView];
    v20 = -[UIImageView initWithFrame:]([_UIBarBackgroundCustomImageContainer alloc], "initWithFrame:", v4 + 0.0, v6 + v14, v8, v15);
    customImageContainer = self->_customImageContainer;
    self->_customImageContainer = &v20->super;

    [(UIView *)self->_customImageContainer setAutoresizingMask:2];
    [(UIImageView *)self->_customImageContainer setImage:v16];
    v25.receiver = self;
    v25.super_class = (Class)_UIBarBackgroundImageView;
    [(UIImageView *)&v25 setImage:0];
    [(UIView *)self addSubview:self->_customImageContainer];
    topStripView = self->_topStripView;
  }
  BOOL v22 = [(_UIBarBackgroundImageView *)self isTranslucent];
  double v23 = 1.0;
  if (v22) {
    double v23 = 0.96;
  }
  v24 = +[UIColor colorWithWhite:0.0 alpha:v23];
  [(UIView *)topStripView setBackgroundColor:v24];

  -[UIView setFrame:](self->_topStripView, "setFrame:", v4, v6, v8, v14);
  -[UIImageView setFrame:](self->_customImageContainer, "setFrame:", v4 + 0.0, v6 + v14, v8, v15);
}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->_translucent = a3;
}

@end