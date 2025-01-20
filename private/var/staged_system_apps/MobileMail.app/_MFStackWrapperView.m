@interface _MFStackWrapperView
- (MFMessageContentView)messageContentView;
- (_MFStackLoadingView)loadingView;
- (_MFStackWrapperView)initWithFrame:(CGRect)a3;
- (unint64_t)stackWrapperViewState;
- (void)addWrappedView:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setMessageContentView:(id)a3;
- (void)setStackWrapperViewState:(unint64_t)a3;
@end

@implementation _MFStackWrapperView

- (_MFStackWrapperView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_MFStackWrapperView;
  v3 = -[_MFStackWrapperView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_MFStackWrapperView *)v3 setStackWrapperViewState:0];
    [(_MFStackWrapperView *)v4 setClipsToBounds:1];
    [(_MFStackWrapperView *)v4 setAutoresizingMask:18];
    v5 = [_MFStackLoadingView alloc];
    [(_MFStackWrapperView *)v4 bounds];
    v6 = -[_MFStackLoadingView initWithFrame:](v5, "initWithFrame:");
    [(_MFStackWrapperView *)v4 setLoadingView:v6];

    v7 = [(_MFStackWrapperView *)v4 loadingView];
    [v7 setAutoresizingMask:18];

    v8 = [(_MFStackWrapperView *)v4 loadingView];
    v9 = [v8 activityIndicatorView];
    [v9 startAnimating];

    v10 = [(_MFStackWrapperView *)v4 loadingView];
    [(_MFStackWrapperView *)v4 addSubview:v10];
  }
  return v4;
}

- (void)addWrappedView:(id)a3
{
  id v5 = a3;
  [(_MFStackWrapperView *)self bounds];
  [v5 setFrame:];
  [v5 setAutoresizingMask:18];
  if ([(_MFStackWrapperView *)self stackWrapperViewState])
  {
    [(_MFStackWrapperView *)self addSubview:v5];
  }
  else
  {
    v4 = [(_MFStackWrapperView *)self loadingView];
    [(_MFStackWrapperView *)self insertSubview:v5 below:v4];
  }
  [(_MFStackWrapperView *)self setMessageContentView:v5];
}

- (void)setStackWrapperViewState:(unint64_t)a3
{
  if (self->_stackWrapperViewState != a3)
  {
    self->_stackWrapperViewState = a3;
    BOOL v3 = a3 == 1;
    id v4 = [(_MFStackWrapperView *)self loadingView];
    [v4 setHidden:v3];
  }
}

- (unint64_t)stackWrapperViewState
{
  return self->_stackWrapperViewState;
}

- (MFMessageContentView)messageContentView
{
  return self->_messageContentView;
}

- (void)setMessageContentView:(id)a3
{
}

- (_MFStackLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);

  objc_storeStrong((id *)&self->_messageContentView, 0);
}

@end