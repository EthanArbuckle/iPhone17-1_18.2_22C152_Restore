@interface BrandBarNewsIcon
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12NewsArticles16BrandBarNewsIcon)initWithCoder:(id)a3;
- (_TtC12NewsArticles16BrandBarNewsIcon)initWithFrame:(CGRect)a3;
@end

@implementation BrandBarNewsIcon

- (_TtC12NewsArticles16BrandBarNewsIcon)initWithFrame:(CGRect)a3
{
  return (_TtC12NewsArticles16BrandBarNewsIcon *)sub_1BF61A9CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NewsArticles16BrandBarNewsIcon)initWithCoder:(id)a3
{
  result = (_TtC12NewsArticles16BrandBarNewsIcon *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 62.0;
  double v4 = 62.0;
  result.height = v4;
  result.width = v3;
  return result;
}

@end