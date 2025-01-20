@interface _PKDistributedAppLauncher
+ (void)launchAppWithDistributorBundleID:(id)a3 itemID:(unint64_t)a4 completion:(id)a5;
- (_TtC9PassKitUI25_PKDistributedAppLauncher)init;
@end

@implementation _PKDistributedAppLauncher

+ (void)launchAppWithDistributorBundleID:(id)a3 itemID:(unint64_t)a4 completion:(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A4920);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = sub_1A03B4988();
  uint64_t v14 = v13;
  if (v11)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v11;
    v11 = sub_19F5C125C;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = sub_1A03B4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v12;
  v17[5] = v14;
  v17[6] = a4;
  v17[7] = v11;
  v17[8] = v15;
  sub_1A03AE138();
  sub_19F48BAB4((uint64_t)v11);
  sub_19F501A58((uint64_t)v10, (uint64_t)&unk_1E94B29C8, (uint64_t)v17);
  swift_release();
  sub_19F48BB68((uint64_t)v11);
  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI25_PKDistributedAppLauncher)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _PKDistributedAppLauncher();
  return [(_PKDistributedAppLauncher *)&v3 init];
}

@end