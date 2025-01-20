@interface MessageBase
- (NSString)debugDescription;
- (NSString)description;
- (_TtC16SiriMessageTypes11MessageBase)init;
@end

@implementation MessageBase

- (NSString)description
{
  return (NSString *)sub_25CFC54B8(self, (uint64_t)a2, (void (*)(void))sub_25CFC5364);
}

- (NSString)debugDescription
{
  return (NSString *)sub_25CFC54B8(self, (uint64_t)a2, (void (*)(void))sub_25CFC5528);
}

- (_TtC16SiriMessageTypes11MessageBase)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes11MessageBase_messageId;
  uint64_t v3 = sub_25D0BCFE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end