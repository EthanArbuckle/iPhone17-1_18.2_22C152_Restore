@interface BKLibraryBookshelfInfoBadge
- (BKLibraryBookshelfInfoBadge)initWithCoder:(id)a3;
- (BKLibraryBookshelfInfoBadge)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedBadgeText;
- (NSString)badgeText;
- (NSString)fallbackBadgeText;
- (void)layoutSubviews;
- (void)setAttributedBadgeText:(id)a3;
- (void)setBadgeText:(id)a3;
- (void)setFallbackBadgeText:(id)a3;
@end

@implementation BKLibraryBookshelfInfoBadge

- (NSString)badgeText
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKLibraryBookshelfInfoBadge_badgeText);
}

- (void)setBadgeText:(id)a3
{
}

- (NSString)fallbackBadgeText
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKLibraryBookshelfInfoBadge_fallbackBadgeText);
}

- (void)setFallbackBadgeText:(id)a3
{
}

- (BKLibraryBookshelfInfoBadge)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLibraryBookshelfInfoBadge_badgeText);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLibraryBookshelfInfoBadge_fallbackBadgeText);
  v10 = (objc_class *)type metadata accessor for LibraryBookshelfInfoBadge();
  void *v9 = 0;
  v9[1] = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return -[BKLibraryBookshelfInfoBadge initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (BKLibraryBookshelfInfoBadge)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLibraryBookshelfInfoBadge_badgeText);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLibraryBookshelfInfoBadge_fallbackBadgeText);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (BKLibraryBookshelfInfoBadge *)sub_1007FF260();
  __break(1u);
  return result;
}

- (NSAttributedString)attributedBadgeText
{
  v2 = self;
  id v3 = sub_1005C22FC();

  return (NSAttributedString *)v3;
}

- (void)setAttributedBadgeText:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1005C28B8(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005C2578();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end