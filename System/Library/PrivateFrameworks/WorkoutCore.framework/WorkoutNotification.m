@interface WorkoutNotification
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC11WorkoutCore19WorkoutNotification)init;
@end

@implementation WorkoutNotification

- (NSString)description
{
  v2 = self;
  sub_236ADE4D0();

  v3 = (void *)sub_236C74E28();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC11WorkoutCore19WorkoutNotification)init
{
  v2 = self;
  sub_236C73F38();
  *((unsigned char *)&v2->super.isa + OBJC_IVAR____TtC11WorkoutCore19WorkoutNotification_notificationType) = 5;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC11WorkoutCore19WorkoutNotification_units) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC11WorkoutCore19WorkoutNotification_displayDuration) = 0;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for WorkoutNotification();
  return [(WorkoutNotification *)&v4 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    objc_super v4 = self;
    swift_unknownObjectRetain();
    sub_236C75478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_236A67084((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_236A73174((uint64_t)v9, (uint64_t *)&unk_2688AA9F0);
    goto LABEL_8;
  }
  type metadata accessor for WorkoutNotification();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = _s11WorkoutCore0A12NotificationC2eeoiySbAC_ACtFZ_0((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_236A73174((uint64_t)v11, (uint64_t *)&unk_2688AA9F0);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore19WorkoutNotification_createdAt;
  uint64_t v4 = sub_236C73F58();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end