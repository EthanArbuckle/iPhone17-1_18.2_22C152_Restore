@interface LiveLookupManagerProxy
+ (NSString)LLExtensionsChangedNotification;
- (BOOL)extensionEnabled:(id)a3;
- (LiveLookupManagerProxy)init;
- (id)extensionName:(id)a3;
- (id)extensions;
- (void)setEnabled:(BOOL)a3 forExtension:(_TtC14IdentityLookup21LiveLookupDBExtension *)a4 completion:(id)a5;
- (void)setWithPrioritizedExtensionIdentifiers:(id)a3;
@end

@implementation LiveLookupManagerProxy

+ (NSString)LLExtensionsChangedNotification
{
  if (qword_1EAE982F0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EAE982F8;
  return (NSString *)v2;
}

- (id)extensions
{
  swift_beginAccess();
  v3 = self;
  swift_retain();
  sub_1E4E0C278();

  swift_release();
  sub_1E4E0C268();
  v4 = (void *)sub_1E4E0C578();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)extensionName:(id)a3
{
  id v4 = a3;
  v5 = self;
  id result = objc_msgSend(v4, sel_identifier);
  if (result)
  {
    id v7 = result;
    sub_1E4E0C538();

    v8 = (void *)sub_1E4E0C528();
    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)extensionEnabled:(id)a3
{
  return objc_msgSend(a3, sel_isEnabled);
}

- (void)setEnabled:(BOOL)a3 forExtension:(_TtC14IdentityLookup21LiveLookupDBExtension *)a4 completion:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98060);
  MEMORY[0x1F4188790]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = self;
  uint64_t v13 = sub_1E4E0C5B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EAE98070;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EAE98080;
  v15[5] = v14;
  v16 = a4;
  v17 = self;
  sub_1E4E02940((uint64_t)v10, (uint64_t)&unk_1EAE98090, (uint64_t)v15);
  swift_release();
}

- (void)setWithPrioritizedExtensionIdentifiers:(id)a3
{
  sub_1E4E0C588();
  swift_beginAccess();
  id v4 = self;
  swift_retain();
  sub_1E4E0C288();

  swift_bridgeObjectRelease();
  swift_release();
}

- (LiveLookupManagerProxy)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___LiveLookupManagerProxy_manager;
  sub_1E4E0C2A8();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1E4E0C298();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(LiveLookupManagerProxy *)&v7 init];
}

- (void).cxx_destruct
{
}

@end