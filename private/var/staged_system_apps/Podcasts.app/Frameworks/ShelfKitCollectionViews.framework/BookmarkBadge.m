@interface BookmarkBadge
- (_TtC23ShelfKitCollectionViews13BookmarkBadge)initWithCoder:(id)a3;
- (void)primaryActionTriggered;
@end

@implementation BookmarkBadge

- (_TtC23ShelfKitCollectionViews13BookmarkBadge)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13BookmarkBadge_bookmarkButtonPresenter) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews13BookmarkBadge *)sub_385890();
  __break(1u);
  return result;
}

- (void)primaryActionTriggered
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews13BookmarkBadge_bookmarkButtonPresenter))
  {
    v2 = self;
    swift_retain();
    sub_382600();

    swift_release();
  }
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews13BookmarkBadge_iconsSet;

  sub_336608((uint64_t)v3);
}

@end