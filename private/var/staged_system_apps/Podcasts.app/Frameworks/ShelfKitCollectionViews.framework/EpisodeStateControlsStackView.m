@interface EpisodeStateControlsStackView
- (_TtC23ShelfKitCollectionViews13BookmarkBadge)accessibilityBookmarkBadge;
- (_TtC23ShelfKitCollectionViews14DownloadButton)accessibilityDownloadBadge;
- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)accessibilityMoreButton;
- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EpisodeStateControlsStackView

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(EpisodeStateControlsStackView *)&v15 layoutSubviews];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [*(id *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_moreButton] frame];
  sub_34DBB0(v4, v6, v8, v10, v11, v12, v13, v14);
}

- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)initWithFrame:(CGRect)a3
{
}

- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_34EFB0();
}

- (_TtC23ShelfKitCollectionViews13BookmarkBadge)accessibilityBookmarkBadge
{
  return (_TtC23ShelfKitCollectionViews13BookmarkBadge *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_bookmarkBadge));
}

- (_TtC23ShelfKitCollectionViews14DownloadButton)accessibilityDownloadBadge
{
  return (_TtC23ShelfKitCollectionViews14DownloadButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_downloadBadge));
}

- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)accessibilityMoreButton
{
  return (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_moreButton);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_bookmarkBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_downloadBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_moreButton));
  swift_bridgeObjectRelease();
  sub_34EF50((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_iconsSet, type metadata accessor for PlayControlsIconsSet);
  swift_release();

  swift_release();
}

@end