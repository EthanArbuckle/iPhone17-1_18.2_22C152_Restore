@interface JournalEntryCellChinView
- (_TtC7Journal24JournalEntryCellChinView)initWithCoder:(id)a3;
- (_TtC7Journal24JournalEntryCellChinView)initWithFrame:(CGRect)a3;
- (void)handleTapUnsupportedTriangleView:(id)a3;
- (void)updateOverflowMenu:(id)a3;
@end

@implementation JournalEntryCellChinView

- (_TtC7Journal24JournalEntryCellChinView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal24JournalEntryCellChinView *)sub_1003E2714(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal24JournalEntryCellChinView)initWithCoder:(id)a3
{
  return (_TtC7Journal24JournalEntryCellChinView *)sub_1003E2900(a3);
}

- (void)updateOverflowMenu:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003E4C10(v4);
}

- (void)handleTapUnsupportedTriangleView:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_actionHandler;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 48);
    id v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_actionHandler);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_overflowButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_bookmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_bookmarkViewLeadingSpaceConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_dividerLineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_unsupportedAlertButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_unsupportedAlertButtonTrailingSpaceConstraint));

  swift_bridgeObjectRelease();
}

@end