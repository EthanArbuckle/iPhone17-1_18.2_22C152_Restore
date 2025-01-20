@interface MoreOptionsButton
- (_TtC9SeymourUI17MoreOptionsButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI17MoreOptionsButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)layoutSubviews;
@end

@implementation MoreOptionsButton

- (_TtC9SeymourUI17MoreOptionsButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17MoreOptionsButton *)sub_23A349814(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MoreOptionsButton();
  v2 = (char *)v3.receiver;
  [(MoreOptionsButton *)&v3 layoutSubviews];
  if (*(void *)&v2[OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_visualEffectView]) {
    objc_msgSend(v2, sel_sendSubviewToBack_, v3.receiver, v3.super_class);
  }
}

- (_TtC9SeymourUI17MoreOptionsButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A34AF9C();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MoreOptionsButton();
  id v8 = a3;
  id v9 = a4;
  v10 = (char *)v13.receiver;
  swift_unknownObjectRetain();
  [(MoreOptionsButton *)&v13 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:a5];
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_onMenuDismissed];
  if (v11)
  {
    uint64_t v12 = swift_retain();
    v11(v12);
    sub_239C25118((uint64_t)v11);
  }
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_onMenuDismissed));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  v4 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  v5 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  v6 = *(id *)((char *)&self->super.super.super._swiftAnimationInfo
             + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  v7 = *(NSArray **)((char *)&self->super.super.super._gestureRecognizers
                   + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  objc_release(*(id *)((char *)&self->super.super.super._viewDelegate
                     + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_normalTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_scrollEdgeTintColor));
  id v8 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_visualEffectView);
}

@end