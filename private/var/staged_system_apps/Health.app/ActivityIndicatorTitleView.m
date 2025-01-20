@interface ActivityIndicatorTitleView
- (UIActivityIndicatorView)activityIndicatorView;
- (UILabel)titleLabel;
- (_TtC6Health26ActivityIndicatorTitleView)initWithCoder:(id)a3;
- (_TtC6Health26ActivityIndicatorTitleView)initWithFrame:(CGRect)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation ActivityIndicatorTitleView

- (UILabel)titleLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIActivityIndicatorView *)Strong;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (_TtC6Health26ActivityIndicatorTitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ActivityIndicatorTitleView();
  return -[ActivityIndicatorTitleView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC6Health26ActivityIndicatorTitleView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivityIndicatorTitleView();
  return [(ActivityIndicatorTitleView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end