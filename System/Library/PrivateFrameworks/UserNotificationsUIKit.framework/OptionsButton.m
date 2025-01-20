@interface OptionsButton
- (_TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton)initWithCoder:(id)a3;
- (_TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation OptionsButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for OptionsButton();
  id v8 = a3;
  id v9 = a4;
  v10 = v13.receiver;
  swift_unknownObjectRetain();
  [(OptionsButton *)&v13 contextMenuInteraction:v8 willDisplayMenuForConfiguration:v9 animator:a5];
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onShowMenu];
  if (v11)
  {
    uint64_t v12 = swift_retain();
    v11(v12);
    sub_1D7D26378((uint64_t)v11);
  }
  v10[OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_isPresentingMenu] = 1;

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for OptionsButton();
  id v8 = a3;
  id v9 = a4;
  v10 = v13.receiver;
  swift_unknownObjectRetain();
  [(OptionsButton *)&v13 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:a5];
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onDismissMenu];
  if (v11)
  {
    uint64_t v12 = swift_retain();
    v11(v12);
    sub_1D7D26378((uint64_t)v11);
  }
  v10[OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_isPresentingMenu] = 0;

  swift_unknownObjectRelease();
}

- (_TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onShowMenu);
  void *v7 = 0;
  v7[1] = 0;
  id v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onDismissMenu);
  *id v8 = 0;
  v8[1] = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_isPresentingMenu) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for OptionsButton();
  return -[OptionsButton initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onShowMenu);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onDismissMenu);
  void *v5 = 0;
  v5[1] = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_isPresentingMenu) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for OptionsButton();
  return [(OptionsButton *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1D7D26378(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onShowMenu));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onDismissMenu);

  sub_1D7D26378(v3);
}

@end