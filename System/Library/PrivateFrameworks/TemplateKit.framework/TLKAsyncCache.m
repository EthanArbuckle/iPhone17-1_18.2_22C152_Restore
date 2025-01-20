@interface TLKAsyncCache
- (TLKAsyncCache)init;
- (id)getCachedObjectIfAvailableForKey:(id)a3;
- (void)clear;
- (void)computeObjectForKey:(NSObject *)a3 completionHandler:(id)a4;
- (void)getObjectForKey:(id)a3 completionHandler:(id)a4;
- (void)getObjectsForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation TLKAsyncCache

- (TLKAsyncCache)init
{
  return (TLKAsyncCache *)TLKAsyncCache.init()();
}

- (id)getCachedObjectIfAvailableForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1B08C509C(v4);

  return v6;
}

- (void)getObjectForKey:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v9 = sub_1B08CD2A0;
  }
  else
  {
    v9 = 0;
    uint64_t v8 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46710);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1B08D3AC0;
  *(void *)(v10 + 32) = a3;
  unint64_t v13 = v10;
  sub_1B08CE288();
  id v11 = a3;
  sub_1B08CBCB0((uint64_t)v9);
  v12 = self;
  sub_1B08CA8E4(v13, (char *)v12, (void (*)(void))v9, v8);
  sub_1B08CD250((uint64_t)v9);
  swift_bridgeObjectRelease();
  sub_1B08CD250((uint64_t)v9);
}

- (void)getObjectsForKeys:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_1B08CD1CC();
  unint64_t v6 = sub_1B08CE268();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    uint64_t v8 = swift_allocObject();
    v5 = sub_1B08CD298;
    *(void *)(v8 + 16) = sub_1B08CD298;
    *(void *)(v8 + 24) = v7;
    v9 = (void (*)(uint64_t *))sub_1B08CE1D8;
  }
  else
  {
    v9 = (void (*)(uint64_t *))nullsub_1;
    uint64_t v8 = 0;
  }
  swift_retain();
  uint64_t v10 = self;
  sub_1B08CBCB0((uint64_t)v5);
  sub_1B08CB2C8(v6, (char *)v10, v9, v8);
  swift_release_n();
  sub_1B08CD250((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)clear
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46718);
  MEMORY[0x1F4188790](v3 - 8, v4);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B08CE388();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_1B08CE358();
  uint64_t v8 = self;
  uint64_t v9 = sub_1B08CE348();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x1E4FBCFD8];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v8;
  sub_1B08C6240((uint64_t)v6, (uint64_t)&unk_1E9B46CA0, (uint64_t)v10);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)computeObjectForKey:(NSObject *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46718);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1B08CE388();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E9B46C68;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E9B46C78;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1B08C73C4((uint64_t)v10, (uint64_t)&unk_1E9B46C88, (uint64_t)v15);
  swift_release();
}

@end