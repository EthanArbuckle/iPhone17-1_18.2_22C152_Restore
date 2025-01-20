@interface PKHeadUnitPairingFlowBridge
+ (void)startHeadUnitPairingFlowWithContext:(id)a3 navController:(id)a4 provisioningController:(id)a5 completion:(id)a6;
- (PKHeadUnitPairingFlowBridge)init;
@end

@implementation PKHeadUnitPairingFlowBridge

+ (void)startHeadUnitPairingFlowWithContext:(id)a3 navController:(id)a4 provisioningController:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  sub_19F76019C(v11, (uint64_t)a4, a5, (uint64_t)sub_19F5789D8, v10);

  swift_release();
}

- (PKHeadUnitPairingFlowBridge)init
{
  return (PKHeadUnitPairingFlowBridge *)sub_19F7592F4(self, (uint64_t)a2, type metadata accessor for HeadUnitPairingFlowBridge);
}

@end