@interface UIProgressIndicator
+ (CGSize)size;
- (int)progressIndicatorStyle;
- (void)setAnimating:(BOOL)a3;
- (void)setProgressIndicatorStyle:(int)a3;
@end

@implementation UIProgressIndicator

- (int)progressIndicatorStyle
{
  return [(UIActivityIndicatorView *)self activityIndicatorViewStyle];
}

- (void)setProgressIndicatorStyle:(int)a3
{
}

+ (CGSize)size
{
  [a1 defaultSizeForStyle:1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setAnimating:(BOOL)a3
{
  if (a3) {
    [(UIActivityIndicatorView *)self startAnimating];
  }
  else {
    [(UIActivityIndicatorView *)self stopAnimating];
  }
}

@end