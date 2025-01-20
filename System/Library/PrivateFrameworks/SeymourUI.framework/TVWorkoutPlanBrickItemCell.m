@interface TVWorkoutPlanBrickItemCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI26TVWorkoutPlanBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI26TVWorkoutPlanBrickItemCell)initWithFrame:(CGRect)a3;
- (void)handleTappedButton:(id)a3;
- (void)prepareForReuse;
@end

@implementation TVWorkoutPlanBrickItemCell

- (_TtC9SeymourUI26TVWorkoutPlanBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26TVWorkoutPlanBrickItemCell *)sub_23A17C30C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26TVWorkoutPlanBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A17F0A0();
}

- (BOOL)canBecomeFocused
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_buttonStackView);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_arrangedSubviews);
  sub_239C24FF0(0, (unint64_t *)&qword_268A0EBE0);
  unint64_t v5 = sub_23A7FFC78();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_23A800DF8();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v6 == 0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_buttonStackView);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_arrangedSubviews);
  sub_239C24FF0(0, (unint64_t *)&qword_268A0EBE0);
  unint64_t v5 = sub_23A7FFC78();

  sub_23A5AD554(v5);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  uint64_t v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_23A17D01C();
}

- (void)handleTappedButton:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_23A17D92C(v4);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_itemInfo, &qword_268A0E7E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_textStackView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end