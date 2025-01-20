@interface BMInternalManagerConfiguration
- (BMInternalManagerConfiguration)init;
- (BMInternalManagerConfiguration)initWithDirectory:(id)a3 shouldRunUpdatesOnSchedule:(BOOL)a4 shouldPurgeOutdatedData:(BOOL)a5;
- (NSString)description;
@end

@implementation BMInternalManagerConfiguration

- (BMInternalManagerConfiguration)initWithDirectory:(id)a3 shouldRunUpdatesOnSchedule:(BOOL)a4 shouldPurgeOutdatedData:(BOOL)a5
{
  uint64_t v8 = sub_37E90();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37E60();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)self + OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory, v11, v8);
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule) = a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData) = a5;
  v12 = (objc_class *)type metadata accessor for ManagerConfiguration();
  v15.receiver = self;
  v15.super_class = v12;
  v13 = [(BMInternalManagerConfiguration *)&v15 init];
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13;
}

- (NSString)description
{
  v2 = self;
  sub_12C8C();

  NSString v3 = sub_380A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BMInternalManagerConfiguration)init
{
  result = (BMInternalManagerConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory;
  uint64_t v3 = sub_37E90();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end