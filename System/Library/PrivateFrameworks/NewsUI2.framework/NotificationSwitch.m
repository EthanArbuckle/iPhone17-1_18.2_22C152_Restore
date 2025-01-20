@interface NotificationSwitch
- (BOOL)accessibilityActivate;
- (_TtC7NewsUI218NotificationSwitch)initWithCoder:(id)a3;
- (_TtC7NewsUI218NotificationSwitch)initWithFrame:(CGRect)a3;
@end

@implementation NotificationSwitch

- (_TtC7NewsUI218NotificationSwitch)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC7NewsUI218NotificationSwitch_onValueChanged;
  sub_1DEC193E8();
  id v8 = objc_allocWithZone(v7);
  id v9 = a3;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v8, sel_init);
  v11 = (char *)v10 + OBJC_IVAR____TtC7NewsUI218NotificationSwitch_toggleState;
  uint64_t v12 = *MEMORY[0x1E4FABC70];
  uint64_t v13 = sub_1DFDF07E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);

  v16.receiver = v10;
  v16.super_class = ObjectType;
  v14 = [(NotificationSwitch *)&v16 initWithCoder:v9];

  return v14;
}

- (_TtC7NewsUI218NotificationSwitch)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC7NewsUI218NotificationSwitch_onValueChanged;
  sub_1DEC193E8();
  id v11 = objc_allocWithZone(v10);
  uint64_t v12 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)objc_msgSend(v11, sel_init);
  uint64_t v13 = (char *)v12 + OBJC_IVAR____TtC7NewsUI218NotificationSwitch_toggleState;
  uint64_t v14 = *MEMORY[0x1E4FABC70];
  uint64_t v15 = sub_1DFDF07E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);

  v17.receiver = v12;
  v17.super_class = ObjectType;
  return -[NotificationSwitch initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI218NotificationSwitch_onValueChanged));
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI218NotificationSwitch_toggleState;
  uint64_t v4 = sub_1DFDF07E0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (BOOL)accessibilityActivate
{
  uint64_t v3 = sub_1DFDF07E0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Class v7 = self;
  unsigned int v8 = [(NotificationSwitch *)v7 isOn];
  uint64_t v9 = (unsigned int *)MEMORY[0x1E4FABC78];
  if (!v8) {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FABC70];
  }
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *v9, v3);
  sub_1DF7F42AC((uint64_t)v6, 1);
  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  MEMORY[0x1E01E38A0](v10);

  return 1;
}

@end