@interface _UIWTCPonderingChunk
- (BOOL)isEqual:(id)a3;
- (_TtC5UIKit20_UIWTCPonderingChunk)init;
- (int64_t)hash;
@end

@implementation _UIWTCPonderingChunk

- (int64_t)hash
{
  return NSMaxRange(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit20_UIWTCPonderingChunk_initialRange), *(void *)&self->_anon_0[OBJC_IVAR____TtC5UIKit20_UIWTCPonderingChunk_initialRange]);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_185A223A0((uint64_t)v8);

  sub_1853B93B8((uint64_t)v8, &qword_1EB256B10);
  return v6;
}

- (_TtC5UIKit20_UIWTCPonderingChunk)init
{
  result = (_TtC5UIKit20_UIWTCPonderingChunk *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end