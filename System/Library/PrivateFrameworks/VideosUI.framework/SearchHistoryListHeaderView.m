@interface SearchHistoryListHeaderView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI27SearchHistoryListHeaderView)initWithCoder:(id)a3;
- (_TtC8VideosUI27SearchHistoryListHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation SearchHistoryListHeaderView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E3402E24(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8VideosUI27SearchHistoryListHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI27SearchHistoryListHeaderView *)sub_1E340331C();
}

- (_TtC8VideosUI27SearchHistoryListHeaderView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI27SearchHistoryListHeaderView *)sub_1E34033C0(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchHistoryListHeaderView_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchHistoryListHeaderView_clearButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI27SearchHistoryListHeaderView____lazy_storage___bottomSeparatorView);
}

@end