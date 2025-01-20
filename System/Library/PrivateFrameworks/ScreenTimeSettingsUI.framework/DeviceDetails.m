@interface DeviceDetails
+ (id)detailsForUserWithAltDSID:(id)a3 error:(id *)a4;
- (BOOL)isLocalDevice;
- (NSDate)lastUpdatedDate;
- (NSString)coreDuetIdentifier;
- (NSString)identifier;
- (NSString)name;
- (_TtC20ScreenTimeSettingsUI13DeviceDetails)init;
- (_TtC20ScreenTimeSettingsUI13DeviceDetails)initWithCoreDuetIdentifier:(id)a3 identifier:(id)a4 name:(id)a5 platform:(signed __int16)a6 isLocalDevice:(BOOL)a7 lastUpdatedDate:(id)a8;
- (signed)platform;
@end

@implementation DeviceDetails

- (NSString)coreDuetIdentifier
{
  return (NSString *)sub_225BC75DC();
}

- (NSString)identifier
{
  return (NSString *)sub_225BC75DC();
}

- (NSString)name
{
  return (NSString *)sub_225BC75DC();
}

- (signed)platform
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_platform);
}

- (BOOL)isLocalDevice
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_isLocalDevice);
}

- (NSDate)lastUpdatedDate
{
  v2 = (void *)sub_225C07610();

  return (NSDate *)v2;
}

- (_TtC20ScreenTimeSettingsUI13DeviceDetails)initWithCoreDuetIdentifier:(id)a3 identifier:(id)a4 name:(id)a5 platform:(signed __int16)a6 isLocalDevice:(BOOL)a7 lastUpdatedDate:(id)a8
{
  id v29 = a8;
  int v30 = a6;
  BOOL v31 = a7;
  uint64_t v9 = sub_225C07660();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_225C08420();
  uint64_t v16 = v15;
  uint64_t v17 = sub_225C08420();
  uint64_t v19 = v18;
  uint64_t v20 = sub_225C08420();
  uint64_t v22 = v21;
  sub_225C07640();
  v23 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_coreDuetIdentifier);
  uint64_t *v23 = v14;
  v23[1] = v16;
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_identifier);
  uint64_t *v24 = v17;
  v24[1] = v19;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_name);
  uint64_t *v25 = v20;
  v25[1] = v22;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_platform) = v30;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_isLocalDevice) = v31;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_lastUpdatedDate, v13, v9);
  v26 = (objc_class *)type metadata accessor for DeviceDetails();
  v32.receiver = self;
  v32.super_class = v26;
  v27 = [(DeviceDetails *)&v32 init];
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return v27;
}

+ (id)detailsForUserWithAltDSID:(id)a3 error:(id *)a4
{
  if (a3) {
    sub_225C08420();
  }
  sub_225BC7ED4();
  swift_bridgeObjectRelease();
  type metadata accessor for DeviceDetails();
  v4 = (void *)sub_225C084B0();
  swift_bridgeObjectRelease();

  return v4;
}

- (_TtC20ScreenTimeSettingsUI13DeviceDetails)init
{
  result = (_TtC20ScreenTimeSettingsUI13DeviceDetails *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_lastUpdatedDate;
  uint64_t v4 = sub_225C07660();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end