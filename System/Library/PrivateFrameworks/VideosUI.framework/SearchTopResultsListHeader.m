@interface SearchTopResultsListHeader
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI26SearchTopResultsListHeader)initWithCoder:(id)a3;
- (_TtC8VideosUI26SearchTopResultsListHeader)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchTopResultsListHeader

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1E37FBFE4(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E37FC254();
}

- (_TtC8VideosUI26SearchTopResultsListHeader)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI26SearchTopResultsListHeader *)sub_1E37FC62C();
}

- (_TtC8VideosUI26SearchTopResultsListHeader)initWithCoder:(id)a3
{
  return (_TtC8VideosUI26SearchTopResultsListHeader *)sub_1E37FC6B8(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI26SearchTopResultsListHeader_titleView);
}

@end