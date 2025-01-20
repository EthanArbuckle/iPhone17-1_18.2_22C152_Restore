@interface ViewControllerHostingCollectionViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI39ViewControllerHostingCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI39ViewControllerHostingCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation ViewControllerHostingCollectionViewCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  OUTLINED_FUNCTION_11_2();
  sub_1E33A2B64(a4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC8VideosUI39ViewControllerHostingCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI39ViewControllerHostingCollectionViewCell *)sub_1E33A32F0();
}

- (_TtC8VideosUI39ViewControllerHostingCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI39ViewControllerHostingCollectionViewCell *)sub_1E33A3398(a3);
}

- (void).cxx_destruct
{
}

@end