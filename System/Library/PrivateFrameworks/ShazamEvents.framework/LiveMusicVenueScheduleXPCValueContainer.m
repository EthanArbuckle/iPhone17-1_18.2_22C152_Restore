@interface LiveMusicVenueScheduleXPCValueContainer
+ (BOOL)supportsSecureCoding;
- (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer)init;
- (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LiveMusicVenueScheduleXPCValueContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer)initWithCoder:(id)a3
{
  return (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer *)sub_235C7AEBC((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_235C7C364);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235C7A894(v4, (uint64_t)&OBJC_IVAR____TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer_value, (uint64_t *)&unk_268837CA0, (void (*)(void))sub_235C7CA0C);
}

- (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer)init
{
  result = (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end