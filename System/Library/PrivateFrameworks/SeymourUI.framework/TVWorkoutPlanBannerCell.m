@interface TVWorkoutPlanBannerCell
- (BOOL)canBecomeFocused;
- (_TtC9SeymourUI23TVWorkoutPlanBannerCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI23TVWorkoutPlanBannerCell)initWithFrame:(CGRect)a3;
- (void)handleTappedButton:(id)a3;
- (void)prepareForReuse;
@end

@implementation TVWorkoutPlanBannerCell

- (_TtC9SeymourUI23TVWorkoutPlanBannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23TVWorkoutPlanBannerCell *)sub_23A40FB80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23TVWorkoutPlanBannerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A412100();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVWorkoutPlanBannerCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVWorkoutPlanBannerCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void)handleTappedButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23A411090((uint64_t)v4);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_itemInfo, &qword_268A0E7E0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVWorkoutPlanBannerCell_containerView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end