@interface SXContentScaleManager
- (SXContentScaleManager)initWithContentScale:(int64_t)a3;
- (SXContentScaleManagerDelegate)delegate;
- (double)contentScaleFactor;
- (int64_t)contentScale;
- (void)decrease;
- (void)increase;
- (void)reset;
- (void)setContentScale:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SXContentScaleManager

- (SXContentScaleManager)initWithContentScale:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXContentScaleManager;
  result = [(SXContentScaleManager *)&v6 init];
  if (result)
  {
    result->_contentScale = a3;
    double v5 = 1.0;
    if ((unint64_t)(a3 - 1) <= 0xA) {
      double v5 = dbl_222BEF3A8[a3 - 1];
    }
    result->_contentScaleFactor = v5;
  }
  return result;
}

- (void)increase
{
  int64_t contentScale = self->_contentScale;
  if (contentScale >= 10) {
    int64_t contentScale = 10;
  }
  [(SXContentScaleManager *)self setContentScale:contentScale + 1];
}

- (void)decrease
{
  int64_t contentScale = self->_contentScale;
  if (contentScale <= 2) {
    int64_t contentScale = 2;
  }
  [(SXContentScaleManager *)self setContentScale:contentScale - 1];
}

- (void)reset
{
}

- (void)setContentScale:(int64_t)a3
{
  if (self->_contentScale != a3)
  {
    self->_int64_t contentScale = a3;
    double v4 = 1.0;
    if ((unint64_t)(a3 - 1) <= 0xA) {
      double v4 = dbl_222BEF3A8[a3 - 1];
    }
    self->_contentScaleFactor = v4;
    double v5 = [(SXContentScaleManager *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(SXContentScaleManager *)self delegate];
      [v7 contentScaleManagerDidChangeContentScaleFactor:self];
    }
  }
}

- (int64_t)contentScale
{
  return self->_contentScale;
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (SXContentScaleManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXContentScaleManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end