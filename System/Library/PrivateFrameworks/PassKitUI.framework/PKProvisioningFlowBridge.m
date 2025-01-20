@interface PKProvisioningFlowBridge
+ (void)startCarKeyShareRedemptionFlowWithNavController:(id)a3 context:(id)a4 invitation:(id)a5 handle:(id)a6 originalShareURL:(id)a7 completion:(id)a8;
+ (void)startCredentialsProvisioningFlowWithNavController:(id)a3 context:(id)a4 credentials:(id)a5 parentNavController:(id)a6 presentNavController:(id)a7 completion:(id)a8;
+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 addCarKeyConfiguration:(id)a5 completion:(id)a6;
+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 addPassConfiguration:(id)a5 completion:(id)a6;
+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 requestConfiguration:(id)a5 phoneWebService:(id)a6 watchWebService:(id)a7 generateRequest:(id)a8 onViewLoaded:(id)a9 completion:(id)a10;
+ (void)startManualEntryFlowWithNavController:(id)a3 context:(id)a4 completion:(id)a5;
+ (void)startPaymentSetupFlowWithNavController:(id)a3 context:(id)a4 mode:(int64_t)a5 preflightCompletion:(id)a6 completion:(id)a7;
+ (void)startPrecursorPassFlowWithNavController:(id)a3 context:(id)a4 pass:(id)a5 precursorController:(id)a6 parentNavController:(id)a7 presentNavController:(id)a8 completion:(id)a9;
+ (void)startProductManualEntryFlowWithNavController:(id)a3 context:(id)a4 product:(id)a5 presentNavController:(id)a6 completion:(id)a7;
+ (void)startProvisionToPurchaseFlowWithNavController:(id)a3 context:(id)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6;
+ (void)startSetupAssistantFlowWithContext:(id)a3 allowManualEntry:(BOOL)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6;
+ (void)startSetupAssistantFlowWithContext:(id)a3 credentials:(id)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6;
+ (void)startSetupAssistantFollowupFlowWithNavController:(id)a3 context:(id)a4 preflightCompletion:(id)a5 completion:(id)a6;
+ (void)startShareRedemptionFlowWithNavController:(id)a3 context:(id)a4 invitation:(id)a5 referralSource:(id)a6 completion:(id)a7;
+ (void)startShareableCredentialFlowWithNavController:(id)a3 context:(id)a4 credentials:(id)a5 completion:(id)a6;
+ (void)startVerificationFlowWithNavController:(id)a3 context:(id)a4 pass:(id)a5 verificationController:(id)a6 presentNavController:(id)a7;
- (PKProvisioningFlowBridge)init;
@end

@implementation PKProvisioningFlowBridge

+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 requestConfiguration:(id)a5 phoneWebService:(id)a6 watchWebService:(id)a7 generateRequest:(id)a8 onViewLoaded:(id)a9 completion:(id)a10
{
  v15 = _Block_copy(a8);
  v16 = _Block_copy(a9);
  v17 = _Block_copy(a10);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  sub_19F759388((uint64_t)v21, v22, v23, a6, (void (*)(void, void))a7, (uint64_t)sub_19F760804, v18, (uint64_t)sub_19F57907C, v19, (void (*)(void, void))sub_19F760D84, v20);

  swift_release();
  swift_release();

  swift_release();
}

+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 addPassConfiguration:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a3;
  id v12 = a4;
  swift_unknownObjectRetain();
  _s9PassKitUI22ProvisioningFlowBridgeC010startInAppE017withNavController7context03addA13Configuration10completionySo012UINavigationL0C_So21PKProvisioningContextCSo010PKPushableaO8Provider_pySaySo015PKSecureElementA0CGSg_So7NSErrorCSgtctFZ_0((uint64_t)v11, v12, (uint64_t)a5, (uint64_t)sub_19F760D84, v10);

  swift_unknownObjectRelease();

  swift_release();
}

+ (void)startInAppFlowWithNavController:(id)a3 context:(id)a4 addCarKeyConfiguration:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  _s9PassKitUI22ProvisioningFlowBridgeC010startInAppE017withNavController7context22addCarKeyConfiguration10completionySo012UINavigationL0C_So21PKProvisioningContextCSo05PKAddopaQ0CySaySo015PKSecureElementA0CGSg_So7NSErrorCSgtctFZ_0((uint64_t)v11, v12, v13, (uint64_t)sub_19F760D84, v10);

  swift_release();
}

+ (void)startShareableCredentialFlowWithNavController:(id)a3 context:(id)a4 credentials:(id)a5 completion:(id)a6
{
  v8 = _Block_copy(a6);
  sub_19F48BAC4(0, (unint64_t *)&unk_1E94B4B70);
  uint64_t v9 = sub_1A03B4C58();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  id v11 = a3;
  id v12 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC024startShareableCredentialE017withNavController7context11credentials10completionySo012UINavigationL0C_So21PKProvisioningContextCSaySo09PKPaymenthI0CGyyctFZ_0((uint64_t)v11, v12, v9, (uint64_t)sub_19F57907C, v10);

  swift_bridgeObjectRelease();

  swift_release();
}

+ (void)startShareRedemptionFlowWithNavController:(id)a3 context:(id)a4 invitation:(id)a5 referralSource:(id)a6 completion:(id)a7
{
  id v11 = _Block_copy(a7);
  if (a6)
  {
    uint64_t v12 = sub_1A03B4988();
    a6 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  _s9PassKitUI22ProvisioningFlowBridgeC020startShareRedemptionE017withNavController7context10invitation14referralSource10completionySo012UINavigationL0C_So21PKProvisioningContextCSo013PKSharingPushD10InvitationCSSSgySaySo015PKSecureElementA0CGSg_So7NSErrorCSgtctFZ_0((uint64_t)v15, v16, v17, v12, (uint64_t)a6, (uint64_t)sub_19F760D84, v14);

  swift_release();

  swift_bridgeObjectRelease();
}

+ (void)startCarKeyShareRedemptionFlowWithNavController:(id)a3 context:(id)a4 invitation:(id)a5 handle:(id)a6 originalShareURL:(id)a7 completion:(id)a8
{
  uint64_t v12 = _Block_copy(a8);
  uint64_t v13 = sub_1A03B4988();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v12;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  _s9PassKitUI22ProvisioningFlowBridgeC026startCarKeyShareRedemptionE017withNavController7context10invitation6handle08originalJ3URL10completionySo012UINavigationN0C_So21PKProvisioningContextCSo09PKSharinghI10InvitationCSo0X13ChannelHandleCSSySaySo015PKSecureElementA0CGSg_So7NSErrorCSgtctFZ_0((uint64_t)v17, v18, v19, v20, v13, v15, (uint64_t)sub_19F7607FC, v16);

  swift_bridgeObjectRelease();

  swift_release();
}

+ (void)startManualEntryFlowWithNavController:(id)a3 context:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  id v10 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC016startManualEntryE017withNavController7context10completionySo012UINavigationL0C_So21PKProvisioningContextCyyctFZ_0((uint64_t)v9, v10, (uint64_t)sub_19F57907C, v8);

  swift_release();
}

+ (void)startProductManualEntryFlowWithNavController:(id)a3 context:(id)a4 product:(id)a5 presentNavController:(id)a6 completion:(id)a7
{
  id v11 = _Block_copy(a6);
  uint64_t v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  _s9PassKitUI22ProvisioningFlowBridgeC023startProductManualEntryE017withNavController7context7product07presentlM010completionySo012UINavigationM0C_So21PKProvisioningContextCSo014PKPaymentSetupH0CyycyyctFZ_0((uint64_t)v15, v16, v17, (uint64_t)sub_19F57907C, v13, (uint64_t)sub_19F57907C, v14);

  swift_release();

  swift_release();
}

+ (void)startProvisionToPurchaseFlowWithNavController:(id)a3 context:(id)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6
{
  id v9 = _Block_copy(a5);
  id v10 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    id v9 = sub_19F57907C;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  id v13 = a3;
  id v14 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC024startProvisionToPurchaseE017withNavController7context011onFirstViewM5Shown10completionySo012UINavigationM0C_So21PKProvisioningContextCyycSgyyctFZ_0((uint64_t)v13, v14, (uint64_t)v9, v11, (uint64_t)sub_19F57907C, v12);
  swift_release();
  sub_19F48BB68((uint64_t)v9);
}

+ (void)startVerificationFlowWithNavController:(id)a3 context:(id)a4 pass:(id)a5 verificationController:(id)a6 presentNavController:(id)a7
{
  uint64_t v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  _s9PassKitUI22ProvisioningFlowBridgeC017startVerificationE017withNavController7context4pass012verificationK007presentjK0ySo012UINavigationK0C_So21PKProvisioningContextCSo015PKSecureElementA0CSo09PKPaymenthK0CyyctFZ_0(v13, v14, v15, v16, (uint64_t)sub_19F57907C, v12);

  swift_release();
}

+ (void)startPrecursorPassFlowWithNavController:(id)a3 context:(id)a4 pass:(id)a5 precursorController:(id)a6 parentNavController:(id)a7 presentNavController:(id)a8 completion:(id)a9
{
  id v14 = _Block_copy(a8);
  id v15 = _Block_copy(a9);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  sub_19F75D55C((uint64_t)v18, v19, v20, v21, (uint64_t)v22, (uint64_t)sub_19F57907C, v16, (uint64_t)sub_19F57907C, v17);

  swift_release();

  swift_release();
}

+ (void)startCredentialsProvisioningFlowWithNavController:(id)a3 context:(id)a4 credentials:(id)a5 parentNavController:(id)a6 presentNavController:(id)a7 completion:(id)a8
{
  uint64_t v12 = _Block_copy(a7);
  id v13 = _Block_copy(a8);
  sub_19F48BAC4(0, (unint64_t *)&qword_1E94A8140);
  uint64_t v14 = sub_1A03B4C58();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  _s9PassKitUI22ProvisioningFlowBridgeC016startCredentialsdE017withNavController7context11credentials06parentjK007presentjK010completionySo012UINavigationK0C_So21PKProvisioningContextCSaySo19PKPaymentCredentialCGALyycyyctFZ_0((uint64_t)v17, v18, v14, (uint64_t)v19, (uint64_t)sub_19F57907C, v15, (uint64_t)sub_19F57907C, v16);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

+ (void)startSetupAssistantFlowWithContext:(id)a3 credentials:(id)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = _Block_copy(a6);
  sub_19F48BAC4(0, (unint64_t *)&qword_1E94A8140);
  uint64_t v10 = sub_1A03B4C58();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  id v13 = a3;
  _s9PassKitUI22ProvisioningFlowBridgeC019startSetupAssistantE07context11credentials26onFirstViewControllerShown10completionySo21PKProvisioningContextC_SaySo19PKPaymentCredentialCGySo06UIViewO0CcyyctFZ_0(v13, v10, (uint64_t)sub_19F760D88, v11, (uint64_t)sub_19F57907C, v12);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

+ (void)startSetupAssistantFlowWithContext:(id)a3 allowManualEntry:(BOOL)a4 onFirstViewControllerShown:(id)a5 completion:(id)a6
{
  id v9 = _Block_copy(a5);
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  id v13 = a3;
  _s9PassKitUI22ProvisioningFlowBridgeC019startSetupAssistantE07context16allowManualEntry26onFirstViewControllerShown10completionySo21PKProvisioningContextC_SbySo06UIViewQ0CcyyctFZ_0(v13, a4, (uint64_t)sub_19F533B00, v11, (uint64_t)sub_19F57907C, v12);

  swift_release();

  swift_release();
}

+ (void)startSetupAssistantFollowupFlowWithNavController:(id)a3 context:(id)a4 preflightCompletion:(id)a5 completion:(id)a6
{
  id v9 = _Block_copy(a5);
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  id v13 = a3;
  id v14 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC027startSetupAssistantFollowupE017withNavController7context19preflightCompletion10completionySo012UINavigationM0C_So21PKProvisioningContextCyycyyctFZ_0((uint64_t)v13, v14, (uint64_t)sub_19F57907C, v11, (uint64_t)sub_19F57907C, v12);

  swift_release();

  swift_release();
}

+ (void)startPaymentSetupFlowWithNavController:(id)a3 context:(id)a4 mode:(int64_t)a5 preflightCompletion:(id)a6 completion:(id)a7
{
  uint64_t v11 = _Block_copy(a6);
  uint64_t v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  id v15 = a3;
  id v16 = a4;
  _s9PassKitUI22ProvisioningFlowBridgeC017startPaymentSetupE017withNavController7context4mode19preflightCompletion10completionySo012UINavigationL0C_So21PKProvisioningContextCSo09PKPaymentI4ModeVyycyyctFZ_0((uint64_t)v15, v16, a5, (uint64_t)sub_19F57907C, v13, (uint64_t)sub_19F57907C, v14);

  swift_release();

  swift_release();
}

- (PKProvisioningFlowBridge)init
{
  return (PKProvisioningFlowBridge *)sub_19F7592F4(self, (uint64_t)a2, type metadata accessor for ProvisioningFlowBridge);
}

@end