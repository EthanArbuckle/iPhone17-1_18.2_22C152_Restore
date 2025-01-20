@interface TVButton
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI8TVButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI8TVButton)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVButton

- (BOOL)canBecomeFocused
{
  return (*((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI8TVButton_underlyingControlState) & 2) == 0;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_23A062DEC();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI8TVButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A065898();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A062F84();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_23A063190(a3);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  double v6 = self;
  id v7 = sub_23A0659F0();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v5 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9SeymourUI8TVButton_onWillDisplayMenu);
  if (v5)
  {
    id v8 = a3;
    id v9 = a4;
    swift_unknownObjectRetain();
    v11 = self;
    uint64_t v10 = sub_239D03E2C((uint64_t)v5);
    v5(v10);
    sub_239C25118((uint64_t)v5);

    swift_unknownObjectRelease();
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_239C24FF0(0, &qword_268A102C8);
  sub_23A065B10();
  uint64_t v6 = sub_23A7FFF58();
  id v7 = a4;
  id v8 = self;
  if (sub_23A065CBC(v6)
    && (uint64_t v9 = *(uint64_t *)((char *)&v8->super.super.super.super.isa
                        + OBJC_IVAR____TtC9SeymourUI8TVButton_underlyingControlState),
        (v9 & 8) != 0))
  {
    sub_23A0635D4(v9 | 1, 1);

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = (void *)sub_23A7FFF48();
    v11.receiver = v8;
    v11.super_class = (Class)type metadata accessor for TVButton();
    [(TVButton *)&v11 pressesBegan:v10 withEvent:v7];

    swift_bridgeObjectRelease();
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  sub_239C24FF0(0, &qword_268A102C8);
  sub_23A065B10();
  uint64_t v6 = sub_23A7FFF58();
  id v7 = a4;
  id v8 = self;
  if (sub_23A065CBC(v6))
  {
    sub_23A0635D4(*(unint64_t *)((unsigned char *)&v8->super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI8TVButton_underlyingControlState) & 0xFFFFFFFFFFFFFFFELL, 1);

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = (void *)sub_23A7FFF48();
    v10.receiver = v8;
    v10.super_class = (Class)type metadata accessor for TVButton();
    [(TVButton *)&v10 pressesCancelled:v9 withEvent:v7];

    swift_bridgeObjectRelease();
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  sub_239C24FF0(0, &qword_268A102C8);
  sub_23A065B10();
  uint64_t v6 = sub_23A7FFF58();
  id v7 = a4;
  id v8 = self;
  if (sub_23A065CBC(v6))
  {
    sub_23A0635D4(*(unint64_t *)((unsigned char *)&v8->super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI8TVButton_underlyingControlState) & 0xFFFFFFFFFFFFFFFELL, 1);
    [(TVButton *)v8 sendActionsForControlEvents:0x2000];

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = (void *)sub_23A7FFF48();
    v10.receiver = v8;
    v10.super_class = (Class)type metadata accessor for TVButton();
    [(TVButton *)&v10 pressesEnded:v9 withEvent:v7];

    swift_bridgeObjectRelease();
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_23A063F30(v6, (uint64_t)v7);
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI8TVButton_floatingView), sel__preferredConfigurationForFocusAnimation_inContext_, a3, a4);

  return v4;
}

- (_TtC9SeymourUI8TVButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI8TVButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_backgroundVisualEffectView));

  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI8TVButton_onWillDisplayMenu));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_leftPaddingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_rightPaddingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_topPaddingConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI8TVButton_bottomPaddingConstraint);
}

@end