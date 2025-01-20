@interface AskToAirDropSenderController
- (BOOL)hasSeenPrivacyPrompt;
- (OS_dispatch_queue)queue;
- (_TtC7Sharing28AskToAirDropSenderController)init;
- (_TtC7Sharing28AskToAirDropSenderController)initWithQueue:(id)a3;
- (id)didStopHandler;
- (id)nearbyDeviceCountChangedHandler;
- (int64_t)nearbyDeviceCount;
- (void)fetchPrivacyPromptInformationWithCompletion:(id)a3;
- (void)fetchSharingNameWithCompletionHandler:(id)a3;
- (void)setDidStopHandler:(id)a3;
- (void)setHasSeenPrivacyPrompt:(BOOL)a3;
- (void)setNearbyDeviceCount:(int64_t)a3;
- (void)setNearbyDeviceCountChangedHandler:(id)a3;
- (void)start;
- (void)startAs:(id)a3;
- (void)stop;
@end

@implementation AskToAirDropSenderController

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_queue));
}

- (int64_t)nearbyDeviceCount
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCount);
  swift_beginAccess();
  return *v2;
}

- (void)setNearbyDeviceCount:(int64_t)a3
{
  v5 = (int64_t *)((char *)self + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCount);
  swift_beginAccess();
  int64_t *v5 = a3;
  v6 = self;
  sub_1A560A690();
}

- (BOOL)hasSeenPrivacyPrompt
{
  return sub_1A560F998(self);
}

- (void)setHasSeenPrivacyPrompt:(BOOL)a3
{
}

- (id)nearbyDeviceCountChangedHandler
{
  return sub_1A560F13C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCountChangedHandler, (uint64_t)&block_descriptor_149);
}

- (void)setNearbyDeviceCountChangedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A55DC6A4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCountChangedHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A54F5EA8(v7);
}

- (id)didStopHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_didStopHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A560AF3C;
    aBlock[3] = &block_descriptor_142;
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

- (void)setDidStopHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A56142C4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_didStopHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A54F5EA8(v7);
}

- (_TtC7Sharing28AskToAirDropSenderController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCount) = 0;
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCountChangedHandler);
  void *v2 = 0;
  v2[1] = 0;
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_didStopHandler);
  *uint64_t v3 = 0;
  v3[1] = 0;

  result = (_TtC7Sharing28AskToAirDropSenderController *)sub_1A56D5BC8();
  __break(1u);
  return result;
}

- (_TtC7Sharing28AskToAirDropSenderController)initWithQueue:(id)a3
{
  id v3 = a3;
  v4 = (_TtC7Sharing28AskToAirDropSenderController *)sub_1A5613448(v3);

  return v4;
}

- (void)startAs:(id)a3
{
  id v3 = self;
  sub_1A56137A8();
}

- (void)start
{
  v2 = self;
  sub_1A56137A8();
}

- (void)stop
{
  v2 = self;
  AskToAirDropSenderController.stop()();
}

- (void)fetchPrivacyPromptInformationWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DB820);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_1A56D5478();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1A56146C0;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_1A54EB08C((uint64_t)v7, (uint64_t)&unk_1E9673708, (uint64_t)v11);
  swift_release();
  swift_release();
}

- (void)fetchSharingNameWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB3DB820);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A56D5478();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96736D0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96736E0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_1A56131BC((uint64_t)v7, (uint64_t)&unk_1E96736F0, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  sub_1A54F5EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCountChangedHandler));
  sub_1A54F5EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_didStopHandler));

  swift_release();
}

@end