@interface SessionMessageBase
@end

@implementation SessionMessageBase

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes18SessionMessageBase_sessionId;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_3_7();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);
  v5(v2, v3);
}

@end