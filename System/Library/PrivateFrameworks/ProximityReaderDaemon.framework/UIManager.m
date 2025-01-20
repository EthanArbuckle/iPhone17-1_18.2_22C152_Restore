@interface UIManager
- (_TtC21ProximityReaderDaemon9UIManager)init;
- (void)cancelRegistration;
- (void)closeIdentityRegUI;
- (void)closePINUI;
- (void)closePINUIImmediate;
- (void)closeRegUI;
- (void)closeRegUIImmediate;
- (void)closeUI;
- (void)closeUIImmediate;
- (void)displayIdentityInformation:(id)a3;
- (void)errorInDaemonWithError:(int64_t)a3;
- (void)identityRegUIDidLoad;
- (void)identityRegUIFinished;
- (void)identityUIDidLoad;
- (void)identityUIFinished;
- (void)notifyRegUIResultWithResult:(id)a3;
- (void)notifyUIButtonTapWithButton:(int64_t)a3;
- (void)pinAuthNeeded;
- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4;
- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7;
- (void)pinUIDidLoad;
- (void)pinValidateSession;
- (void)qrCodeScanErrorWithError:(id)a3;
- (void)qrCodeScanInitiated;
- (void)readDocumentFromScannedQRCodeWithPayload:(id)a3;
- (void)regUIAccountWithAccount:(id)a3;
- (void)regUIDidLoad;
- (void)regUIFinishedWithUserCancelled:(BOOL)a3 regStatus:(BOOL)a4;
- (void)registerWithCompletion:(id)a3;
- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4;
- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7;
- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4;
- (void)requestCancelReadWithIsEngagementTransition:(BOOL)a3;
- (void)requestRestartReadWithTriggeredByMultipleCheck:(BOOL)a3;
- (void)requiresCardPIN:(id)a3;
- (void)setVoiceOverWithEnabled:(BOOL)a3;
- (void)tapUIDidLoad;
- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4;
- (void)tapUIRequestingCancel;
- (void)tapUIRequestingRetry;
- (void)updateAccountSubscription;
- (void)updateSessionEventWithSessionEvent:(int64_t)a3;
- (void)updateUIState:(int64_t)a3;
- (void)updateWithTransactionEvent:(int64_t)a3;
- (void)vasReadSuccessWithMerchantNames:(id)a3;
@end

@implementation UIManager

- (_TtC21ProximityReaderDaemon9UIManager)init
{
  return (_TtC21ProximityReaderDaemon9UIManager *)sub_25ABA0660();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_invalidationHandler);
  sub_25AB74948(v3);
}

- (void)updateWithTransactionEvent:(int64_t)a3
{
}

- (void)vasReadSuccessWithMerchantNames:(id)a3
{
  sub_25AC35080();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI);
  if (v4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    v6 = (void *)sub_25AC35070();
    objc_msgSend(v4, sel_vasReadSuccessWithMerchantNames_, v6);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)closeUI
{
}

- (void)closeUIImmediate
{
}

- (void)requiresCardPIN:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25ABA099C((uint64_t)v4);
}

- (void)closePINUI
{
}

- (void)closePINUIImmediate
{
}

- (void)errorInDaemonWithError:(int64_t)a3
{
}

- (void)updateSessionEventWithSessionEvent:(int64_t)a3
{
}

- (void)tapUIDidLoad
{
  v2 = self;
  sub_25ABA0C3C();
}

- (void)tapUIRequestingCancel
{
  v2 = self;
  sub_25ABA116C("daemon | tapUIRequestingCancel", (SEL *)&selRef_tapUIRequestingCancel);
}

- (void)tapUIRequestingRetry
{
  v2 = self;
  sub_25ABA116C("daemon | tapUIRequestingRetry", (SEL *)&selRef_tapUIRequestingRetry);
}

- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4
{
  v6 = self;
  sub_25ABA13B8(a3, a4);
}

- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4
{
  BOOL v4 = a3;
  sub_25AC34E40();
  uint64_t v6 = MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = self;
    id v9 = (id)sub_25AC34E10();
    objc_msgSend(v7, sel_reportGuidanceUpdateWithVisible_trigger_, v4, v9);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  id v8 = (id)MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate, a2);
  v7 = self;
  objc_msgSend(v8, sel_reportProxEventInRange_inRangeTime_, v5, v4);
}

- (void)pinUIDidLoad
{
  v2 = self;
  sub_25ABA17D0();
}

- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v15 = (id)MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate, a2);
  id v13 = a3;
  v14 = self;
  objc_msgSend(v15, sel_pinDataReceivedWithPinData_isCardRequest_isAccessibilityEnabled_accessibilityEntryType_drawNumberFailures_, v13, v10, v9, a6, a7);
}

- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  BOOL v10 = a4;
  v12 = self;
  sub_25ABA1A9C(a3, v10, a5, a6, a7);
}

- (void)pinValidateSession
{
}

- (void)pinAuthNeeded
{
}

- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4
{
  if (a3)
  {
    sub_25AC34E40();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate);
  if (v7)
  {
    id v8 = (void *)v7;
    BOOL v9 = self;
    if (v6) {
      uint64_t v10 = sub_25AC34E10();
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = (id)v10;
    objc_msgSend(v8, sel_pinAuthResultWithError_cancelsFlow_);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)setVoiceOverWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate, a2);
  uint64_t v5 = self;
  objc_msgSend(v6, sel_setVoiceOverWithEnabled_, v3);
}

- (void)notifyRegUIResultWithResult:(id)a3
{
  uint64_t v4 = sub_25AC34E40();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  sub_25ABA3764(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)closeRegUI
{
  v2 = self;
  sub_25ABA3D5C(0x67655265736F6C63, 0xEC00000029284955, (SEL *)&selRef_closeRegUI);
}

- (void)closeRegUIImmediate
{
  v2 = self;
  sub_25ABA3D5C(0xD000000000000015, 0x800000025AC40690, (SEL *)&selRef_closeRegUIImmediate);
}

- (void)regUIDidLoad
{
  v2 = self;
  sub_25ABA4054();
}

- (void)regUIAccountWithAccount:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_25ABA4650(v4);
}

- (void)regUIFinishedWithUserCancelled:(BOOL)a3 regStatus:(BOOL)a4
{
  unint64_t v6 = self;
  sub_25ABA48A4(a3, a4);
}

- (void)updateAccountSubscription
{
  v2 = self;
  sub_25ABA4B34();
}

- (void)updateUIState:(int64_t)a3
{
}

- (void)displayIdentityInformation:(id)a3
{
}

- (void)identityUIDidLoad
{
}

- (void)identityUIFinished
{
  v2 = self;
  sub_25ABA6590(sub_25ABF9670);
}

- (void)requestCancelReadWithIsEngagementTransition:(BOOL)a3
{
}

- (void)readDocumentFromScannedQRCodeWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v10 = self;
  uint64_t v5 = sub_25AC323A0();
  unint64_t v7 = v6;

  uint64_t v8 = MEMORY[0x261151D10]((char *)v10 + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate);
  if (v8)
  {
    BOOL v9 = (void *)v8;
    sub_25ABF9DFC(v5, v7);
  }
  sub_25AB16958(v5, v7);
}

- (void)requestRestartReadWithTriggeredByMultipleCheck:(BOOL)a3
{
}

- (void)qrCodeScanInitiated
{
}

- (void)qrCodeScanErrorWithError:(id)a3
{
  uint64_t v4 = sub_25AC34E40();
  uint64_t v6 = v5;
  uint64_t v7 = MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate);
  if (v7)
  {
    id v9 = (id)v7;
    uint64_t v8 = self;
    sub_25AC123DC(v4, v6);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)notifyUIButtonTapWithButton:(int64_t)a3
{
  uint64_t v5 = MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate, a2);
  if (v5)
  {
    id v7 = (id)v5;
    uint64_t v6 = self;
    sub_25ABFA61C(a3);
  }
}

- (void)closeIdentityRegUI
{
}

- (void)registerWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate);
  if (v6)
  {
    id v8 = (id)v6;
    id v7 = self;
    sub_25ABFAF40((uint64_t)sub_25ABA69D8, v5);

    swift_release();
  }
  else
  {
    swift_release();
  }
}

- (void)cancelRegistration
{
}

- (void)identityRegUIDidLoad
{
  uint64_t v3 = MEMORY[0x261151D10]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate, a2);
  if (v3)
  {
    id v5 = (id)v3;
    uint64_t v4 = self;
    -[IdentityReaderService identityRegUIDidLoad]_0();
  }
}

- (void)identityRegUIFinished
{
  v2 = self;
  sub_25ABA6590(sub_25ABF8D98);
}

@end