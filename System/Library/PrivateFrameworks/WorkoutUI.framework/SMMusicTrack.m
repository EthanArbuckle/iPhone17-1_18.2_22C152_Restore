@interface SMMusicTrack
- (NSString)album;
- (NSString)artist;
- (NSString)identifier;
- (NSString)title;
- (SMMusicTrack)init;
- (double)duration;
- (double)startTime;
@end

@implementation SMMusicTrack

- (NSString)identifier
{
  return (NSString *)sub_261A5AD5C(self, (uint64_t)a2, MEMORY[0x263F68FF0]);
}

- (NSString)title
{
  return (NSString *)sub_261A5AD5C(self, (uint64_t)a2, MEMORY[0x263F69000]);
}

- (NSString)artist
{
  return (NSString *)sub_261A5AD5C(self, (uint64_t)a2, MEMORY[0x263F69008]);
}

- (NSString)album
{
  return (NSString *)sub_261A5AD5C(self, (uint64_t)a2, MEMORY[0x263F68FF8]);
}

- (double)startTime
{
  v2 = self;
  sub_261B8B0F8();
  double v4 = v3;

  return v4;
}

- (double)duration
{
  v2 = self;
  sub_261B8B0E8();
  double v4 = v3;

  return v4;
}

- (SMMusicTrack)init
{
  result = (SMMusicTrack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SMMusicTrack_musicTrack;
  uint64_t v3 = sub_261B8B108();
  double v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end