@interface TagFeedViewerPuzzleFullArchiveTitleView
- (_TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView)initWithCoder:(id)a3;
- (_TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TagFeedViewerPuzzleFullArchiveTitleView

- (_TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView *)sub_1DF60A4A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF60A874();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1DF60A68C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView_subtitleLabel);
}

@end