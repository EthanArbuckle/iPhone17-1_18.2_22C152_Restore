@interface PaginatedSwipingContainerView
- (BOOL)accessibilityScroll:(int64_t)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI29PaginatedSwipingContainerView)initWithCoder:(id)a3;
- (_TtC8VideosUI29PaginatedSwipingContainerView)initWithFrame:(CGRect)a3;
@end

@implementation PaginatedSwipingContainerView

- (_TtC8VideosUI29PaginatedSwipingContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI29PaginatedSwipingContainerView *)sub_1E32CB234();
}

- (_TtC8VideosUI29PaginatedSwipingContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32CB300();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  double v6 = OUTLINED_FUNCTION_11_2();
  sub_1E32CBC0C(a4, v6, v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI29PaginatedSwipingContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29PaginatedSwipingContainerView_mediaView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI29PaginatedSwipingContainerView_metadataView);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v4 = self;
  LOBYTE(a3) = sub_1E32CBD88(a3);

  return a3 & 1;
}

@end