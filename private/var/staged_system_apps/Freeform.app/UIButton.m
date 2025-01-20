@interface UIButton
- (BOOL)crl_deprecatedAdjustsImageWhenDisabled;
- (BOOL)crl_deprecatedAdjustsImageWhenHighlighted;
- (CGRect)crl_deprecatedBackgroundRectForBounds:(CGRect)a3;
- (CGRect)crl_deprecatedContentRectForBounds:(CGRect)a3;
- (CGRect)crl_deprecatedImageRectForContentRect:(CGRect)a3;
- (CGRect)crl_deprecatedTitleRectForContentRect:(CGRect)a3;
- (UIEdgeInsets)crl_deprecatedContentEdgeInsets;
- (UIEdgeInsets)crl_deprecatedImageEdgeInsets;
- (UIEdgeInsets)crl_deprecatedTitleEdgeInsets;
- (void)setCrl_deprecatedAdjustsImageWhenDisabled:(BOOL)a3;
- (void)setCrl_deprecatedTitleEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation UIButton

- (UIEdgeInsets)crl_deprecatedContentEdgeInsets
{
  [(UIButton *)self contentEdgeInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setCrl_deprecatedTitleEdgeInsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)crl_deprecatedTitleEdgeInsets
{
  [(UIButton *)self titleEdgeInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)crl_deprecatedImageEdgeInsets
{
  [(UIButton *)self imageEdgeInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)crl_deprecatedAdjustsImageWhenHighlighted
{
  return [(UIButton *)self adjustsImageWhenHighlighted];
}

- (void)setCrl_deprecatedAdjustsImageWhenDisabled:(BOOL)a3
{
}

- (BOOL)crl_deprecatedAdjustsImageWhenDisabled
{
  return [(UIButton *)self adjustsImageWhenDisabled];
}

- (CGRect)crl_deprecatedBackgroundRectForBounds:(CGRect)a3
{
  -[UIButton backgroundRectForBounds:](self, "backgroundRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)crl_deprecatedContentRectForBounds:(CGRect)a3
{
  -[UIButton contentRectForBounds:](self, "contentRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)crl_deprecatedTitleRectForContentRect:(CGRect)a3
{
  -[UIButton titleRectForContentRect:](self, "titleRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)crl_deprecatedImageRectForContentRect:(CGRect)a3
{
  -[UIButton imageRectForContentRect:](self, "imageRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end