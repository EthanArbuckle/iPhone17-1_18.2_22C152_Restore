@interface ActivityPreferenceReplicationFilter
- (_TtC11SessionCore35ActivityPreferenceReplicationFilter)init;
- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4;
- (void)settingsModel:(void *)a3 didAddSettings:;
@end

@implementation ActivityPreferenceReplicationFilter

- (_TtC11SessionCore35ActivityPreferenceReplicationFilter)init
{
  return (_TtC11SessionCore35ActivityPreferenceReplicationFilter *)sub_1C7C5FF50();
}

- (void).cxx_destruct
{
  sub_1C7C60EF0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11SessionCore35ActivityPreferenceReplicationFilter_filterDidUpdate));
  swift_release();
  sub_1C7C04290((uint64_t)self + OBJC_IVAR____TtC11SessionCore35ActivityPreferenceReplicationFilter_lockedAppSettings, &qword_1EBC67E00);
}

- (void)settingsModel:(void *)a3 didAddSettings:
{
  v3 = *(void (**)(uint64_t))&a1[OBJC_IVAR____TtC11SessionCore35ActivityPreferenceReplicationFilter_filterDidUpdate];
  if (v3)
  {
    id v5 = a3;
    v7 = a1;
    uint64_t v6 = sub_1C7C6113C((uint64_t)v3);
    v3(v6);
    sub_1C7C60EF0((uint64_t)v3);
  }
}

- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11SessionCore35ActivityPreferenceReplicationFilter_filterDidUpdate);
  if (v4)
  {
    id v6 = a3;
    swift_unknownObjectRetain();
    v8 = self;
    uint64_t v7 = sub_1C7C6113C((uint64_t)v4);
    v4(v7);
    sub_1C7C60EF0((uint64_t)v4);

    swift_unknownObjectRelease();
  }
}

@end