@interface MagazineFeedGroupTitleView
- (_TtC7NewsUI226MagazineFeedGroupTitleView)initWithCoder:(id)a3;
- (_TtC7NewsUI226MagazineFeedGroupTitleView)initWithFrame:(CGRect)a3;
@end

@implementation MagazineFeedGroupTitleView

- (_TtC7NewsUI226MagazineFeedGroupTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI226MagazineFeedGroupTitleView *)sub_1DF299590(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI226MagazineFeedGroupTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF2998CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineFeedGroupTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineFeedGroupTitleView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineFeedGroupTitleView_moreActionsButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI226MagazineFeedGroupTitleView_debugFeedAction);
}

@end