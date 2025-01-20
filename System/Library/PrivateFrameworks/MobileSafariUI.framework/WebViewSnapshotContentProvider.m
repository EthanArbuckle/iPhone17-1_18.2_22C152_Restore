@interface WebViewSnapshotContentProvider
- (BOOL)snapshotContentShouldUnderlapTopBackdrop;
- (CGRect)contentFrame;
- (CGRect)snapshotContentRectInBounds:(CGRect)a3;
- (UIColor)snapshotBackgroundColor;
- (UIImage)snapshotContentImage;
- (UIView)snapshotContentView;
- (WKWebView)webView;
- (WebViewSnapshotContentProvider)initWithWebView:(id)a3 contentFrame:(CGRect)a4;
- (void)prepareForSnapshotOfSize:(CGSize)a3 completion:(id)a4;
@end

@implementation WebViewSnapshotContentProvider

- (WebViewSnapshotContentProvider)initWithWebView:(id)a3 contentFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WebViewSnapshotContentProvider;
  v11 = [(WebViewSnapshotContentProvider *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_webView, a3);
    v12->_contentFrame.origin.CGFloat x = x;
    v12->_contentFrame.origin.CGFloat y = y;
    v12->_contentFrame.size.CGFloat width = width;
    v12->_contentFrame.size.CGFloat height = height;
    v13 = v12;
  }

  return v12;
}

- (UIView)snapshotContentView
{
  return (UIView *)self->_webView;
}

- (UIImage)snapshotContentImage
{
  return self->_snapshotImage;
}

- (UIColor)snapshotBackgroundColor
{
  v2 = [(WKWebView *)self->_webView scrollView];
  v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (BOOL)snapshotContentShouldUnderlapTopBackdrop
{
  v2 = [(WKWebView *)self->_webView scrollView];
  [v2 contentInset];
  BOOL v4 = v3 != 0.0;

  return v4;
}

- (CGRect)snapshotContentRectInBounds:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!self->_snapshotImage)
  {
    [(WKWebView *)self->_webView bounds];
    CGFloat v7 = v17.origin.x;
    CGFloat v8 = v17.origin.y;
    CGFloat v9 = v17.size.width;
    CGFloat v10 = v17.size.height;
    double v16 = CGRectGetHeight(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.double height = height;
    double v11 = v16 * CGRectGetWidth(v18);
    v19.origin.CGFloat x = v7;
    v19.origin.CGFloat y = v8;
    v19.size.CGFloat width = v9;
    v19.size.double height = v10;
    double height = v11 / CGRectGetWidth(v19);
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)prepareForSnapshotOfSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v7 = (void (**)(id, void))a4;
  CGFloat v8 = [(WKWebView *)self->_webView window];
  CGFloat v9 = [v8 windowScene];
  uint64_t v10 = [v9 activationState];

  if (v10 == 2)
  {
    v7[2](v7, 0);
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F46698]);
    double v12 = CGRectGetWidth(self->_contentFrame);
    objc_msgSend(v11, "setRect:", CGRectGetMinX(self->_contentFrame), 0.0, v12, height * v12 / width);
    double v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:CGRectGetWidth(self->_contentFrame)];
    [v11 setSnapshotWidth:v13];

    if ([(WKWebView *)self->_webView _isDisplayingPDF]) {
      [v11 setAfterScreenUpdates:0];
    }
    webView = self->_webView;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__WebViewSnapshotContentProvider_prepareForSnapshotOfSize_completion___block_invoke;
    v15[3] = &unk_1E6D7F038;
    v15[4] = self;
    double v16 = v7;
    [(WKWebView *)webView takeSnapshotWithConfiguration:v11 completionHandler:v15];
  }
}

void __70__WebViewSnapshotContentProvider_prepareForSnapshotOfSize_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  id v4 = a2;
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8) != 0);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_snapshotImage, 0);
}

@end