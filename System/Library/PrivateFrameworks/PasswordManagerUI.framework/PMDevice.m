@interface PMDevice
- (NSString)deviceImageSymbolName;
- (NSString)deviceName;
- (NSString)operatingSystemName;
- (NSString)operatingSystemVersion;
- (PMDevice)init;
- (PMDevice)initWithDeviceName:(id)a3 operatingSystemName:(id)a4 operatingSystemVersion:(id)a5 deviceImageSymbolName:(id)a6;
@end

@implementation PMDevice

- (NSString)deviceName
{
  return (NSString *)sub_258B027D8();
}

- (NSString)operatingSystemName
{
  return (NSString *)sub_258B027D8();
}

- (NSString)operatingSystemVersion
{
  return (NSString *)sub_258B027D8();
}

- (NSString)deviceImageSymbolName
{
  return (NSString *)sub_258B027D8();
}

- (PMDevice)initWithDeviceName:(id)a3 operatingSystemName:(id)a4 operatingSystemVersion:(id)a5 deviceImageSymbolName:(id)a6
{
  uint64_t v7 = sub_258D6F498();
  uint64_t v9 = v8;
  uint64_t v10 = sub_258D6F498();
  uint64_t v12 = v11;
  uint64_t v13 = sub_258D6F498();
  uint64_t v15 = v14;
  uint64_t v16 = sub_258D6F498();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___PMDevice_deviceName);
  uint64_t *v17 = v7;
  v17[1] = v9;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___PMDevice_operatingSystemName);
  uint64_t *v18 = v10;
  v18[1] = v12;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___PMDevice_operatingSystemVersion);
  uint64_t *v19 = v13;
  v19[1] = v15;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___PMDevice_deviceImageSymbolName);
  uint64_t *v20 = v16;
  v20[1] = v21;
  v23.receiver = self;
  v23.super_class = (Class)PMDevice;
  return [(PMDevice *)&v23 init];
}

- (PMDevice)init
{
  result = (PMDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end