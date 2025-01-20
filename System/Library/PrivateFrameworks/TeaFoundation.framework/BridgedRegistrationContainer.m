@interface BridgedRegistrationContainer
- (_TtC13TeaFoundation28BridgedRegistrationContainer)init;
- (id)registerClass:(Class)a3 factory:(id)a4;
- (id)registerClass:(Class)a3 name:(id)a4 factory:(id)a5;
- (id)registerProtocol:(id)a3 factory:(id)a4;
- (id)registerProtocol:(id)a3 name:(id)a4 factory:(id)a5;
- (id)registerUncheckedProtocol:(id)a3 factory:(id)a4;
- (id)registerUncheckedProtocol:(id)a3 name:(id)a4 factory:(id)a5;
@end

@implementation BridgedRegistrationContainer

- (id)registerClass:(Class)a3 factory:(id)a4
{
  v5 = _Block_copy(a4);
  swift_getObjCClassMetadata();
  *(void *)(swift_allocObject() + 16) = v5;
  v6 = self;
  id v7 = sub_191E37354();

  swift_release();

  return v7;
}

- (id)registerClass:(Class)a3 name:(id)a4 factory:(id)a5
{
  id v7 = _Block_copy(a5);
  if (a4) {
    sub_191EE8110();
  }
  swift_getObjCClassMetadata();
  *(void *)(swift_allocObject() + 16) = v7;
  v8 = self;
  id v9 = sub_191E3752C();

  swift_release();
  swift_bridgeObjectRelease();

  return v9;
}

- (id)registerProtocol:(id)a3 factory:(id)a4
{
  return sub_191E37A90(self, (int)a2, a3, a4, (uint64_t)&unk_1EE2BF338, (uint64_t)sub_191E37EBC, (uint64_t (*)(id, uint64_t, uint64_t))sub_191E377A8);
}

- (id)registerProtocol:(id)a3 name:(id)a4 factory:(id)a5
{
  return sub_191E37C4C(self, (int)a2, a3, (uint64_t)a4, a5, (uint64_t)&unk_1EE2BF2E8, (uint64_t)sub_191E37EBC, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))sub_191E37898);
}

- (id)registerUncheckedProtocol:(id)a3 factory:(id)a4
{
  return sub_191E37A90(self, (int)a2, a3, a4, (uint64_t)&unk_1EE2BF298, (uint64_t)sub_191E37EBC, (uint64_t (*)(id, uint64_t, uint64_t))sub_191E379A0);
}

- (id)registerUncheckedProtocol:(id)a3 name:(id)a4 factory:(id)a5
{
  return sub_191E37C4C(self, (int)a2, a3, (uint64_t)a4, a5, (uint64_t)&unk_1EE2BF220, (uint64_t)sub_191E37DE4, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))sub_191E37B44);
}

- (_TtC13TeaFoundation28BridgedRegistrationContainer)init
{
}

- (void).cxx_destruct
{
}

@end