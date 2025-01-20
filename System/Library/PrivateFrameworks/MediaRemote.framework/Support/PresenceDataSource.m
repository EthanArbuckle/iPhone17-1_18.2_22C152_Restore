@interface PresenceDataSource
- (_TtC12mediaremotedP33_5F812221C055B7907E48F2E367000FFE18PresenceDataSource)init;
- (void)presentDevicesChangedForPresence:(id)a3;
@end

@implementation PresenceDataSource

- (void)presentDevicesChangedForPresence:(id)a3
{
  v4 = (char *)a3;
  v5 = self;
  sub_10022846C(v4);
}

- (_TtC12mediaremotedP33_5F812221C055B7907E48F2E367000FFE18PresenceDataSource)init
{
  result = (_TtC12mediaremotedP33_5F812221C055B7907E48F2E367000FFE18PresenceDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_5F812221C055B7907E48F2E367000FFE18PresenceDataSource_localHandle));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_5F812221C055B7907E48F2E367000FFE18PresenceDataSource_presence));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_5F812221C055B7907E48F2E367000FFE18PresenceDataSource_queue));
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC12mediaremotedP33_5F812221C055B7907E48F2E367000FFE18PresenceDataSource__presentDevices;
  uint64_t v4 = sub_100013A80(&qword_100479F80);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC12mediaremotedP33_5F812221C055B7907E48F2E367000FFE18PresenceDataSource__presentHandles;
  uint64_t v6 = sub_100013A80(&qword_100479F88);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end