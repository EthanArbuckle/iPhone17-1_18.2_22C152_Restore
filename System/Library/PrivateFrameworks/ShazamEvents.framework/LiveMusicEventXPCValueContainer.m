@interface LiveMusicEventXPCValueContainer
+ (BOOL)supportsSecureCoding;
- (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer)init;
- (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LiveMusicEventXPCValueContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer)initWithCoder:(id)a3
{
  return (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer *)sub_235C7AEBC((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_235C7BEF4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235C7A894(v4, (uint64_t)&OBJC_IVAR____TtC12ShazamEvents31LiveMusicEventXPCValueContainer_value, &qword_2688368D0, (void (*)(void))sub_235C7CF0C);
}

- (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer)init
{
  result = (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end