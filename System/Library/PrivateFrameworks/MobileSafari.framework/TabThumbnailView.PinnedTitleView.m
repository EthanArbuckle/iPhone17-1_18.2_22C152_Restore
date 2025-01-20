@interface TabThumbnailView.PinnedTitleView
- (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView)initWithFrame:(CGRect)a3;
- (void)contentSizeCategoryDidChange;
- (void)layoutSubviews;
@end

@implementation TabThumbnailView.PinnedTitleView

- (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView *)sub_18C5E68B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView *)sub_18C5E69FC(a3);
}

- (void)contentSizeCategoryDidChange
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView15PinnedTitleView_titleLabel);
  v7 = self;
  id v3 = [(TabThumbnailView.PinnedTitleView *)v7 traitCollection];
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);
  char v5 = sub_18C6F9FD8();

  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  objc_msgSend(v2, sel_setNumberOfLines_, v6);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18C5E6F88();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView15PinnedTitleView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView15PinnedTitleView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView15PinnedTitleView_unreadIndicator);
}

@end