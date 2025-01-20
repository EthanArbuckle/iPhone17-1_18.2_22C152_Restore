@interface SiriQuickTypeGestureActivationManager
- (_TtC16SiriUIActivation37SiriQuickTypeGestureActivationManager)init;
- (void)canActivateWithCompletionHandler:(id)a3;
- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3;
- (void)prewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3;
@end

@implementation SiriQuickTypeGestureActivationManager

- (_TtC16SiriUIActivation37SiriQuickTypeGestureActivationManager)init
{
  return (_TtC16SiriUIActivation37SiriQuickTypeGestureActivationManager *)SiriQuickTypeGestureActivationManager.init()();
}

- (void)prewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F5C5E8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_221688DA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267F5C658;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267F5C660;
  v12[5] = v11;
  swift_retain();
  sub_221685C8C((uint64_t)v7, (uint64_t)&unk_267F5C668, (uint64_t)v12);
  swift_release();
}

- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F5C5E8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_221688DA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267F5C638;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267F5C640;
  v12[5] = v11;
  swift_retain();
  sub_221685C8C((uint64_t)v7, (uint64_t)&unk_267F5C648, (uint64_t)v12);
  swift_release();
}

- (void)canActivateWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F5C5E8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_221688DA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267F5C5F8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267F5C608;
  v12[5] = v11;
  swift_retain();
  sub_221685C8C((uint64_t)v7, (uint64_t)&unk_267F5C618, (uint64_t)v12);
  swift_release();
}

@end