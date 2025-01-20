@interface NUPaywallEventData
- (NUPaywallEventData)init;
- (NUPaywallEventData)initWithPaywallViewData:(id)a3 headline:(id)a4 channel:(id)a5 feed:(id)a6 paywallGroupData:(id)a7 referral:(id)a8 qToken:(id)a9;
@end

@implementation NUPaywallEventData

- (NUPaywallEventData)initWithPaywallViewData:(id)a3 headline:(id)a4 channel:(id)a5 feed:(id)a6 paywallGroupData:(id)a7 referral:(id)a8 qToken:(id)a9
{
  if (a9)
  {
    uint64_t v15 = sub_1DFDFDD20();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  id v18 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v22 = (NUPaywallEventData *)sub_1DF6ABBF8((uint64_t)v18, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, v21, v15, v17);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v22;
}

- (NUPaywallEventData)init
{
  result = (NUPaywallEventData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___NUPaywallEventData_viewData;
  uint64_t v4 = sub_1DFDEC450();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1DF6AAF4C((uint64_t)self + OBJC_IVAR___NUPaywallEventData_articleData, (unint64_t *)&unk_1EBAA7190, MEMORY[0x1E4F7B338]);
  swift_unknownObjectRelease();
  sub_1DF6AAF4C((uint64_t)self + OBJC_IVAR___NUPaywallEventData_feedData, (unint64_t *)&unk_1EBAA7360, MEMORY[0x1E4F7CE00]);
  sub_1DF6AAF4C((uint64_t)self + OBJC_IVAR___NUPaywallEventData_groupData, (unint64_t *)&unk_1EBAA7390, MEMORY[0x1E4F7D0F0]);

  swift_bridgeObjectRelease();
}

@end