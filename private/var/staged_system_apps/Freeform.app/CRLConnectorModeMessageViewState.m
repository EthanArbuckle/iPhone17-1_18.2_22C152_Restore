@interface CRLConnectorModeMessageViewState
- (BOOL)isConnectorModeEnabled;
- (BOOL)isMessageVisible;
- (_TtC8Freeform32CRLConnectorModeMessageViewState)init;
- (void)setIsConnectorModeEnabled:(BOOL)a3;
- (void)setIsMessageVisible:(BOOL)a3;
@end

@implementation CRLConnectorModeMessageViewState

- (BOOL)isConnectorModeEnabled
{
  return sub_1007D33AC(self);
}

- (void)setIsConnectorModeEnabled:(BOOL)a3
{
}

- (BOOL)isMessageVisible
{
  return sub_1007D33AC(self);
}

- (void)setIsMessageVisible:(BOOL)a3
{
}

- (_TtC8Freeform32CRLConnectorModeMessageViewState)init
{
  return (_TtC8Freeform32CRLConnectorModeMessageViewState *)CRLConnectorModeMessageViewState.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform32CRLConnectorModeMessageViewState__isConnectorModeEnabled;
  uint64_t v4 = sub_1005057FC(&qword_10169FCE0);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform32CRLConnectorModeMessageViewState__isMessageVisible;

  v6(v5, v4);
}

@end