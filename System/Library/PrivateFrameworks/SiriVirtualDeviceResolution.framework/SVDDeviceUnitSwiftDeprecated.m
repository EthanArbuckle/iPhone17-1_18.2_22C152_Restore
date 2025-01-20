@interface SVDDeviceUnitSwiftDeprecated
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (SVDDeviceUnitSwiftDeprecated)init;
- (SVDDeviceUnitSwiftDeprecated)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDDeviceUnitSwiftDeprecated

+ (BOOL)supportsSecureCoding
{
  return static SVDDeviceUnit.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (SVDDeviceUnitSwiftDeprecated)initWithCoder:(id)a3
{
  return (SVDDeviceUnitSwiftDeprecated *)SVDDeviceUnit.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C9DE71C8(v4);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1C9DE75A4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1C9DE74A4);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1C9DE7660();

  return v3;
}

- (SVDDeviceUnitSwiftDeprecated)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_27();
  swift_bridgeObjectRelease();
}

@end