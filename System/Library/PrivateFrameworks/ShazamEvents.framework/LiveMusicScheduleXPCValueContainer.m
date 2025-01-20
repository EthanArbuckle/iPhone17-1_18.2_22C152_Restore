@interface LiveMusicScheduleXPCValueContainer
+ (BOOL)supportsSecureCoding;
- (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer)init;
- (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LiveMusicScheduleXPCValueContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer *)sub_235C7C1D4(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s12ShazamEvents34LiveMusicScheduleXPCValueContainerC6encode4withySo7NSCoderC_tF_0(v4);
}

- (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer)init
{
  result = (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end