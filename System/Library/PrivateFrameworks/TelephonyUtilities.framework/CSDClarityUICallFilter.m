@interface CSDClarityUICallFilter
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (CSDClarityUICallFilter)initWithQueue:(id)a3;
@end

@implementation CSDClarityUICallFilter

- (CSDClarityUICallFilter)initWithQueue:(id)a3
{
  return (CSDClarityUICallFilter *)sub_100379388(a3);
}

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10037952C(v6, v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDClarityUICallFilter_contactStore);
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDClarityUICallFilter_favorites);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CSDClarityUICallFilter_incomingCommunicationLimit);
}

@end