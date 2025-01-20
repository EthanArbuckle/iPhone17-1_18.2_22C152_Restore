@interface WFSetupClientInternal
- (CUMessageSession)messageSessionTemplate;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (WFSetupClientInternal)init;
- (WFSetupClientInternal)initWithQueue:(id)a3 deviceIdentifier:(id)a4;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)receivedObjectHandler;
- (id)setupProgressEventHandler;
- (id)setupSecurePairingCompletionHandler;
- (id)showPinHandler;
- (id)userInteractionProgressEventHandler;
- (void)activate;
- (void)dealloc;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)invalidate;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)sendObject:(id)a3 encrypted:(BOOL)a4;
- (void)sendUserInteractionEventInEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessageSessionTemplate:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setReceivedObjectHandler:(id)a3;
- (void)setSetupProgressEventHandler:(id)a3;
- (void)setSetupSecurePairingCompletionHandler:(id)a3;
- (void)setShowPinHandler:(id)a3;
- (void)setUserInteractionProgressEventHandler:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation WFSetupClientInternal

- (void)provisionAnisetteWithCompletion:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E79B1B0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_25E79AE80((uint64_t)v4, v5, (uint64_t)&block_descriptor_27, (SEL *)&selRef_provisionWithCompletion_);
  sub_25E785F38((uint64_t)v4);
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  uint64_t v5 = (uint64_t (*)())_Block_copy(a4);
  if (a3)
  {
    v6 = self;
    id v7 = a3;
    a3 = (id)sub_25E7BC210();
    unint64_t v9 = v8;

    if (v5)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v5;
      uint64_t v5 = sub_25E79B1B0;
      goto LABEL_6;
    }
  }
  else
  {
    v11 = self;
    unint64_t v9 = 0xF000000000000000;
    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  _s10TDGSharing13WFSetupClientC12syncAnisette11withSIMData10completiony10Foundation4DataVSg_ySb_s5Error_pSgtcSgtF_0((uint64_t)a3, v9, v5, v10);
  sub_25E785F38((uint64_t)v5);
  sub_25E77D710((uint64_t)a3, v9);
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E79B18C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_25E79AE80((uint64_t)v4, v5, (uint64_t)&block_descriptor_21, (SEL *)&selRef_eraseWithCompletion_);
  sub_25E785F38((uint64_t)v4);
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v5 = (uint64_t (*)())_Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v5 = sub_25E79B1AC;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = self;
  sub_25E79AF68(v5, v6);
  sub_25E785F38((uint64_t)v5);
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  uint64_t v6 = (void (*)(uint64_t, uint64_t))_Block_copy(a4);
  id v7 = v6;
  if (a3)
  {
    uint64_t v8 = sub_25E7BC3E0();
    a3 = v9;
    if (v7)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v7;
      id v7 = sub_25E79B184;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  v11 = self;
  _s10TDGSharing13WFSetupClientC18legacyAnisetteData7forDSID14withCompletionySSSg_ySo010AKAnisetteF0CSg_s5Error_pSgtcSgtF_0(v8, a3, v7, v10);
  sub_25E785F38((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (OS_dispatch_queue)dispatchQueue
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  return (OS_dispatch_queue *)*v2;
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  uint64_t v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (id)interruptionHandler
{
  return sub_25E79BF70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_interruptionHandler, (uint64_t)&block_descriptor_149);
}

- (void)setInterruptionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E7A5BD8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_interruptionHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)invalidationHandler
{
  return sub_25E79BF70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_invalidationHandler, (uint64_t)&block_descriptor_142);
}

- (void)setInvalidationHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E7A5910;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_invalidationHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (SFDevice)peerDevice
{
  return (SFDevice *)sub_25E79C2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_peerDevice);
}

- (void)setPeerDevice:(id)a3
{
}

- (CUMessageSession)messageSessionTemplate
{
  return (CUMessageSession *)sub_25E79C2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
}

- (void)setMessageSessionTemplate:(id)a3
{
}

- (id)setupProgressEventHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E79B7DC;
    aBlock[3] = &block_descriptor_136;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setSetupProgressEventHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E7A588C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)userInteractionProgressEventHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E79C724;
    aBlock[3] = &block_descriptor_130_0;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setUserInteractionProgressEventHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E79982C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)setupSecurePairingCompletionHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E79B70C;
    aBlock[3] = &block_descriptor_124;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setSetupSecurePairingCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E799848;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)receivedObjectHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E79B8EC;
    aBlock[3] = &block_descriptor_118;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setReceivedObjectHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E7A5818;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)showPinHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_showPinHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E79CE34;
    aBlock[3] = &block_descriptor_112;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setShowPinHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E7A57B0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_showPinHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (WFSetupClientInternal)init
{
  sub_25E78314C(0, (unint64_t *)&qword_26A706610);
  uint64_t v3 = (void *)sub_25E7BC4D0();
  v4 = [(WFSetupClientInternal *)self initWithQueue:v3 deviceIdentifier:0];

  return v4;
}

- (WFSetupClientInternal)initWithQueue:(id)a3 deviceIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v5 = sub_25E7BC3E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  return (WFSetupClientInternal *)WFSetupClient.init(queue:deviceIdentifier:)(a3, v5, v7);
}

- (void)dealloc
{
  v2 = self;
  WFSetupClient.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_interruptionHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_invalidationHandler));

  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_showPinHandler));
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_sfSession);
}

- (void)invalidate
{
  v2 = self;
  WFSetupClient.invalidate()();
}

- (void)sendUserInteractionEventInEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_25E7BC390();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    uint64_t v7 = sub_25E799E44;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = self;
  WFSetupClient.sendUserInteractionEvent(inEvent:withEncryption:responseHandler:)(v8, a4, (void (*)(void, void, void))v7, v9);
  sub_25E785F38((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)activate
{
  v2 = self;
  WFSetupClient.activate()();
}

- (void)sendObject:(id)a3 encrypted:(BOOL)a4
{
  uint64_t v6 = sub_25E7BC390();
  uint64_t v7 = self;
  WFSetupClient.sendObject(_:encrypted:)((Swift::OpaquePointer)v6, a4);

  swift_bridgeObjectRelease();
}

@end