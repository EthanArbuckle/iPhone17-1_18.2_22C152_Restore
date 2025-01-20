@interface WFSetupServerInternal
- (OS_dispatch_queue)dispatchQueue;
- (WFSetupServerInternal)init;
- (WFSetupServerInternal)initWithQueue:(id)a3;
- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider;
- (id)activationHandler;
- (id)completionHandler;
- (id)receivedObjectHandler;
- (id)setupProgressEventHandler;
- (id)setupPromptPinHandler;
- (id)userInteractionProgressEventHandler;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)prepareToRun;
- (void)sendObjectWithObject:(id)a3 encrypted:(BOOL)a4;
- (void)sendSetupWithAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5;
- (void)sendUserInteractionEventInEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5;
- (void)setActivationHandler:(id)a3;
- (void)setAnisetteDataProvider:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setReceivedObjectHandler:(id)a3;
- (void)setSetupProgressEventHandler:(id)a3;
- (void)setSetupPromptPinHandler:(id)a3;
- (void)setUserInteractionProgressEventHandler:(id)a3;
- (void)startSecureChannelPairingWith:(BOOL)a3 completion:(id)a4;
- (void)startSecureChannelPairingWith:(BOOL)a3 context:(id)a4 completion:(id)a5;
- (void)tryPin:(id)a3;
@end

@implementation WFSetupServerInternal

- (OS_dispatch_queue)dispatchQueue
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  return (OS_dispatch_queue *)*v2;
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (id)completionHandler
{
  return sub_25E785380((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupServerInternal_completionHandler, (uint64_t)&block_descriptor_190);
}

- (void)setCompletionHandler:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E799D10;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_completionHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)activationHandler
{
  return sub_25E785380((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupServerInternal_activationHandler, (uint64_t)&block_descriptor_183);
}

- (void)setActivationHandler:(id)a3
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
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_activationHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)setupProgressEventHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E79B7DC;
    aBlock[3] = &block_descriptor_177;
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
    v4 = sub_25E799840;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)userInteractionProgressEventHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E7858AC;
    aBlock[3] = &block_descriptor_171;
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
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)setupPromptPinHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E785B1C;
    aBlock[3] = &block_descriptor_165;
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

- (void)setSetupPromptPinHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_25E799814;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (id)receivedObjectHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E79B8EC;
    aBlock[3] = &block_descriptor_159;
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
    v4 = sub_25E79980C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_25E785F38(v7);
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  return (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider *)*v2;
}

- (void)setAnisetteDataProvider:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  uint64_t v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (WFSetupServerInternal)init
{
  return (WFSetupServerInternal *)WFSetupServer.init()();
}

- (WFSetupServerInternal)initWithQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFSetupServerInternal *)self init];
  id v6 = (void **)((char *)&v5->super.isa + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = v4;

  return v5;
}

- (void)dealloc
{
  uint64_t v2 = qword_26A7065D0;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A7089F8);
  uint64_t v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25E775000, v5, v6, "WFSetupServer deinit.", v7, 2u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  sub_25E78C7D8();
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for WFSetupServer();
  [(WFSetupServerInternal *)&v8 dealloc];
}

- (void).cxx_destruct
{
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_completionHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_activationHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler));
  sub_25E785F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler));

  sub_25E784970((uint64_t)self + OBJC_IVAR___WFSetupServerInternal_peer, &qword_26A706998);
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_preventExitForLocaleClient);
}

- (void)prepareToRun
{
  uint64_t v2 = self;
  WFSetupServer.prepareToRun()();
}

- (void)activate
{
  uint64_t v2 = self;
  WFSetupServer.activate()();
}

- (void)invalidate
{
  uint64_t v2 = self;
  WFSetupServer.invalidate()();
}

- (void)sendObjectWithObject:(id)a3 encrypted:(BOOL)a4
{
  uint64_t v6 = sub_25E7BC390();
  uint64_t v7 = self;
  WFSetupServer.sendObject(object:encrypted:)((Swift::OpaquePointer)v6, a4);

  swift_bridgeObjectRelease();
}

- (void)sendSetupWithAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5
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
  v10 = self;
  WFSetupServer.sendSetup(action:info:responseHandler:)(a3, v8, (void (*)(void *, void, void))v7, v9);
  sub_25E785F38((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)sendUserInteractionEventInEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_25E7BC390();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    uint64_t v7 = sub_25E799804;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  WFSetupServer.sendUserInteractionEvent(inEvent:withEncryption:responseHandler:)(v8, a4, (void (*)(void, void, void))v7, v9);
  sub_25E785F38((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)startSecureChannelPairingWith:(BOOL)a3 context:(id)a4 completion:(id)a5
{
  BOOL v5 = a3;
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = (void *)sub_25E7BC390();
  _Block_copy(v7);
  uint64_t v9 = self;
  sub_25E7972DC(v5, v8, (uint64_t)v9, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)startSecureChannelPairingWith:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_25E797FA4(v4, (uint64_t)v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)tryPin:(id)a3
{
  uint64_t v4 = sub_25E7BC3E0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  WFSetupServer.tryPin(_:)(v8);

  swift_bridgeObjectRelease();
}

@end