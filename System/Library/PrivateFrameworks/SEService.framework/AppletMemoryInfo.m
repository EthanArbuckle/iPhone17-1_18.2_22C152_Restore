@interface AppletMemoryInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9SEService16AppletMemoryInfo)init;
- (_TtC9SEService16AppletMemoryInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AppletMemoryInfo

- (NSString)description
{
  return (NSString *)sub_21477DBC4(self, (uint64_t)a2, (void (*)(void))sub_21477BD44);
}

+ (BOOL)supportsSecureCoding
{
  return byte_26781D7F0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26781D7F0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21477C10C(v4);
}

- (_TtC9SEService16AppletMemoryInfo)initWithCoder:(id)a3
{
  return (_TtC9SEService16AppletMemoryInfo *)AppletMemoryInfo.init(coder:)(a3);
}

- (_TtC9SEService16AppletMemoryInfo)init
{
  result = (_TtC9SEService16AppletMemoryInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService16AppletMemoryInfo_personalizedMemory);
}

@end