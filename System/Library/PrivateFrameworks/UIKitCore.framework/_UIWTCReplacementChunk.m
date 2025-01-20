@interface _UIWTCReplacementChunk
- (_TtC5UIKit22_UIWTCReplacementChunk)init;
@end

@implementation _UIWTCReplacementChunk

- (_TtC5UIKit22_UIWTCReplacementChunk)init
{
  result = (_TtC5UIKit22_UIWTCReplacementChunk *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5UIKit22_UIWTCReplacementChunk_deliveryID;
  uint64_t v4 = sub_186A1D70C();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC5UIKit22_UIWTCReplacementChunk_effectiveContextID;
  v6(v5, v4);
}

@end