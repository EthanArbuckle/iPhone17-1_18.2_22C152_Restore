@interface _SEServiceManager
+ (id)sharedInstance;
- (_SEServiceManager)init;
- (void)contentProcessWithConfiguration:(id)a3 completion:(id)a4;
- (void)gpuProcessWithConfiguration:(id)a3 completion:(id)a4;
- (void)networkProcessWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation _SEServiceManager

+ (id)sharedInstance
{
  if (qword_26A596CF0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26A597270;
  return v2;
}

- (void)gpuProcessWithConfiguration:(id)a3 completion:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E58);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = sub_25C221A68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = sub_25C20C790;
  v12[6] = v10;
  id v13 = a3;
  v14 = self;
  swift_retain();
  sub_25C21461C((uint64_t)v8, (uint64_t)&unk_26A596ED0, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)networkProcessWithConfiguration:(id)a3 completion:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E58);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = sub_25C221A68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = sub_25C20C76C;
  v12[6] = v10;
  id v13 = a3;
  v14 = self;
  swift_retain();
  sub_25C21461C((uint64_t)v8, (uint64_t)&unk_26A596EF0, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)contentProcessWithConfiguration:(id)a3 completion:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E58);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = sub_25C221A68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = sub_25C20C76C;
  v12[6] = v10;
  id v13 = a3;
  v14 = self;
  swift_retain();
  sub_25C21461C((uint64_t)v8, (uint64_t)&unk_26A596F00, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (_SEServiceManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _SEServiceManager();
  return [(_SEServiceManager *)&v3 init];
}

@end