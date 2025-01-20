@interface SMActivityManagerInternal
+ (SMActivityManagerInternal)shared;
- (BOOL)hasActivity;
- (SMActivityManagerInternal)init;
- (void)endActivities;
- (void)startActivityWith:(id)a3 localState:(id)a4;
- (void)updateActivityWith:(id)a3 localState:(id)a4 shouldNotify:(BOOL)a5;
@end

@implementation SMActivityManagerInternal

+ (SMActivityManagerInternal)shared
{
  if (qword_26B3494C0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B349488;
  return (SMActivityManagerInternal *)v2;
}

- (SMActivityManagerInternal)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SMActivityManagerInternal_activities) = (Class)MEMORY[0x263F8EE78];
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SMActivityManagerInternal_silentAudioFileName);
  void *v2 = 0xD000000000000010;
  v2[1] = 0x800000025B75E810;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SMActivityManager();
  v3 = [(SMActivityManagerInternal *)&v8 init];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B349498);
  v4 = v3;
  uint64_t v5 = sub_25B757F80();
  v6 = (uint64_t *)((char *)v4 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  uint64_t *v6 = v5;

  swift_bridgeObjectRelease();
  return v4;
}

- (void)startActivityWith:(id)a3 localState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  sub_25B6E48B4();
}

- (void)updateActivityWith:(id)a3 localState:(id)a4 shouldNotify:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_25B6E50B0(v8, v5);
}

- (void)endActivities
{
  v2 = self;
  sub_25B6E3B5C();
}

- (BOOL)hasActivity
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B349498);
  v3 = self;
  uint64_t v4 = sub_25B757F80();
  BOOL v5 = (uint64_t *)((char *)v3 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *BOOL v5 = v4;
  swift_bridgeObjectRelease();
  if ((unint64_t)*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25B758560();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v6 != 0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end