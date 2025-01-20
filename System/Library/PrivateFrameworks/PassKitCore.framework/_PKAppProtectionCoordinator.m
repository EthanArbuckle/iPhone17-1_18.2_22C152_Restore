@interface _PKAppProtectionCoordinator
+ (_PKAppProtectionCoordinator)shared;
- (APApplication)application;
- (BOOL)isEffectivelyLocked;
- (_PKAppProtectionCoordinator)init;
- (void)isShieldRequiredWithCompletionHandler:(id)a3;
- (void)registerObserver:(id)a3;
- (void)requestAccess;
- (void)requestAccessWithCompletionHandler:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation _PKAppProtectionCoordinator

- (APApplication)application
{
  return (APApplication *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____PKAppProtectionCoordinator_application));
}

+ (_PKAppProtectionCoordinator)shared
{
  if (qword_1E92BA7F8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E92BAF40;
  return (_PKAppProtectionCoordinator *)v2;
}

- (BOOL)isEffectivelyLocked
{
  v2 = self;
  if (PKAppProtectionEnabled()) {
    unsigned __int8 v3 = objc_msgSend(*(id *)((char *)&v2->super.isa + OBJC_IVAR____PKAppProtectionCoordinator_application), sel_isEffectivelyLocked);
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)isShieldRequiredWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92BCC30);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_1915EF3A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1E92BAFA8;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E92BAFB0;
  v11[5] = v10;
  v12 = self;
  sub_190F96784((uint64_t)v6, (uint64_t)&unk_1E92BAFB8, (uint64_t)v11);
  swift_release();
}

- (void)requestAccess
{
  v2 = self;
  AppProtectionCoordinator.requestAccess()();
}

- (void)requestAccessWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92BCC30);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_1915EF3A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1E92BAF88;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E92BAF90;
  v11[5] = v10;
  v12 = self;
  sub_190F96784((uint64_t)v6, (uint64_t)&unk_1E92BAF98, (uint64_t)v11);
  swift_release();
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (_PKAppProtectionCoordinator)init
{
  return (_PKAppProtectionCoordinator *)AppProtectionCoordinator.init()();
}

- (void).cxx_destruct
{
  swift_release();
  unsigned __int8 v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppProtectionCoordinator_replyQueue);
}

@end