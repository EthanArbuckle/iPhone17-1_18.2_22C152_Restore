@interface PUAbstractNavigationBanner
- (PUAbstractNavigationBannerDelegate)delegate;
- (UIView)view;
- (double)height;
- (void)setDelegate:(id)a3;
@end

@implementation PUAbstractNavigationBanner

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (PUAbstractNavigationBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAbstractNavigationBannerDelegate *)WeakRetained;
}

- (UIView)view
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAbstractNavigationBanner.m", 23, @"%s must be overriden by subclass", "-[PUAbstractNavigationBanner view]");

  [(PUAbstractNavigationBanner *)self doesNotRecognizeSelector:a2];
  return 0;
}

- (double)height
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAbstractNavigationBanner.m", 17, @"%s must be overriden by subclass", "-[PUAbstractNavigationBanner height]");

  [(PUAbstractNavigationBanner *)self doesNotRecognizeSelector:a2];
  return 0.0;
}

@end