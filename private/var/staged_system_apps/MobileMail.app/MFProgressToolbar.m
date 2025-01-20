@interface MFProgressToolbar
- (MFProgressToolbar)initWithFrame:(CGRect)a3;
- (UIProgressView)progressView;
- (void)layoutSubviews;
- (void)setItems:(id)a3 animated:(BOOL)a4;
- (void)setProgressView:(id)a3;
- (void)showProgress:(BOOL)a3;
- (void)updateProgress:(float)a3;
@end

@implementation MFProgressToolbar

- (MFProgressToolbar)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFProgressToolbar;
  v3 = -[MFProgressToolbar initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIProgressView *)[objc_alloc((Class)UIProgressView) initWithProgressViewStyle:1];
    progressView = v3->_progressView;
    v3->_progressView = v4;

    [(UIProgressView *)v3->_progressView setAutoresizingMask:2];
    [(MFProgressToolbar *)v3 addSubview:v3->_progressView];
  }
  return v3;
}

- (void)showProgress:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MFProgressToolbar *)self progressView];
  id v6 = v5;
  if (v3)
  {
    [v5 setAlpha:1.0];
  }
  else
  {
    [v5 setAlpha:0.0];

    id v6 = [(MFProgressToolbar *)self progressView];
    [v6 setProgress:0.0];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MFProgressToolbar;
  [(MFProgressToolbar *)&v12 layoutSubviews];
  [(MFProgressToolbar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MFProgressToolbar *)self progressView];
  [v11 setFrame:v4, v6, v8, v10];
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFProgressToolbar;
  [(MFProgressToolbar *)&v19 setItems:v6 animated:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_super v12 = [v11 view:v15];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v14 = [v11 view];
          [v14 setToolbarView:self];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)updateProgress:(float)a3
{
  id v5 = [(MFProgressToolbar *)self progressView];
  *(float *)&double v4 = a3;
  [v5 setProgress:v4];
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end