@interface SMContributor
- (NSString)identifier;
- (NSString)name;
- (SMContributor)init;
@end

@implementation SMContributor

- (NSString)identifier
{
  return (NSString *)sub_261B3AB18(self, (uint64_t)a2, MEMORY[0x263F69110]);
}

- (NSString)name
{
  return (NSString *)sub_261B3AB18(self, (uint64_t)a2, MEMORY[0x263F69118]);
}

- (SMContributor)init
{
  result = (SMContributor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SMContributor_contributor;
  uint64_t v3 = sub_261B8B1D8();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end