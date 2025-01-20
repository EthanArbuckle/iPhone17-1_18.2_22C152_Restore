@interface BridgedResolver
- (_TtC13TeaFoundation15BridgedResolver)init;
- (id)resolveClass:(Class)a3;
- (id)resolveClass:(Class)a3 contextBlock:(id)a4;
- (id)resolveClass:(Class)a3 name:(id)a4;
- (id)resolveClass:(Class)a3 name:(id)a4 contextBlock:(id)a5;
- (id)resolveOptionalClass:(Class)a3;
- (id)resolveOptionalClass:(Class)a3 contextBlock:(id)a4;
- (id)resolveOptionalClass:(Class)a3 name:(id)a4;
- (id)resolveOptionalClass:(Class)a3 name:(id)a4 contextBlock:(id)a5;
- (id)resolveOptionalProtocol:(id)a3;
- (id)resolveOptionalProtocol:(id)a3 contextBlock:(id)a4;
- (id)resolveOptionalProtocol:(id)a3 name:(id)a4;
- (id)resolveOptionalProtocol:(id)a3 name:(id)a4 contextBlock:(id)a5;
- (id)resolveProtocol:(id)a3;
- (id)resolveProtocol:(id)a3 contextBlock:(id)a4;
- (id)resolveProtocol:(id)a3 name:(id)a4;
- (id)resolveProtocol:(id)a3 name:(id)a4 contextBlock:(id)a5;
@end

@implementation BridgedResolver

- (id)resolveClass:(Class)a3
{
  swift_getObjCClassMetadata();
  v4 = self;
  sub_191E2258C((void *(*)(long long *__return_ptr))sub_191E21858, &v7);

  __swift_project_boxed_opaque_existential_1(&v7, v8);
  v5 = (void *)sub_191EE9750();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);

  return v5;
}

- (id)resolveOptionalClass:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  sub_191E21858(ObjCClassMetadata);

  uint64_t v6 = v14;
  if (v14)
  {
    long long v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x1F4188790](v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_191EE9750();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)resolveClass:(Class)a3 name:(id)a4
{
  if (a4) {
    sub_191EE8110();
  }
  swift_getObjCClassMetadata();
  v5 = self;
  sub_191E22BC4((void *(*)(long long *__return_ptr))sub_191E21ADC, &v8);

  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(&v8, v9);
  uint64_t v6 = (void *)sub_191EE9750();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);

  return v6;
}

- (id)resolveOptionalClass:(Class)a3 name:(id)a4
{
  if (a4) {
    sub_191EE8110();
  }
  swift_getObjCClassMetadata();
  v5 = self;
  sub_191E21ADC();

  swift_bridgeObjectRelease();
  uint64_t v6 = v14;
  if (v14)
  {
    long long v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x1F4188790](v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_191EE9750();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)resolveClass:(Class)a3 contextBlock:(id)a4
{
  v5 = _Block_copy(a4);
  swift_getObjCClassMetadata();
  *(void *)(swift_allocObject() + 16) = v5;
  uint64_t v6 = self;
  sub_191E22BC4((void *(*)(long long *__return_ptr))sub_191E21DE0, &v9);

  swift_release();
  __swift_project_boxed_opaque_existential_1(&v9, v10);
  long long v7 = (void *)sub_191EE9750();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);

  return v7;
}

- (id)resolveOptionalClass:(Class)a3 contextBlock:(id)a4
{
  v5 = _Block_copy(a4);
  swift_getObjCClassMetadata();
  *(void *)(swift_allocObject() + 16) = v5;
  uint64_t v6 = self;
  sub_191E21DE0();

  swift_release();
  uint64_t v7 = v15;
  if (v15)
  {
    uint64_t v8 = __swift_project_boxed_opaque_existential_1(v14, v15);
    uint64_t v9 = *(void *)(v7 - 8);
    MEMORY[0x1F4188790](v8);
    v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = (void *)sub_191EE9750();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)resolveClass:(Class)a3 name:(id)a4 contextBlock:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  if (a4) {
    sub_191EE8110();
  }
  swift_getObjCClassMetadata();
  *(void *)(swift_allocObject() + 16) = v7;
  uint64_t v8 = self;
  sub_191E22F1C((void *(*)(long long *__return_ptr))sub_191E22138, &v11);

  swift_release();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(&v11, v12);
  uint64_t v9 = (void *)sub_191EE9750();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);

  return v9;
}

- (id)resolveOptionalClass:(Class)a3 name:(id)a4 contextBlock:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  if (a4) {
    sub_191EE8110();
  }
  swift_getObjCClassMetadata();
  *(void *)(swift_allocObject() + 16) = v7;
  uint64_t v8 = self;
  sub_191E22138();

  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v9 = v17;
  if (v17)
  {
    uint64_t v10 = __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v11 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v10);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    uint64_t v14 = (void *)sub_191EE9750();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)resolveProtocol:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191E2258C((void *(*)(long long *__return_ptr))sub_191E225D8, &v8);

  __swift_project_boxed_opaque_existential_1(&v8, v9);
  uint64_t v6 = (void *)sub_191EE9750();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);

  return v6;
}

- (id)resolveOptionalProtocol:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191E225D8(v4);

  uint64_t v6 = v14;
  if (v14)
  {
    uint64_t v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x1F4188790](v7);
    uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    uint64_t v11 = (void *)sub_191EE9750();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)resolveProtocol:(id)a3 contextBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  uint64_t v8 = self;
  sub_191E22BC4((void *(*)(long long *__return_ptr))sub_191E22864, &v11);

  swift_release();
  __swift_project_boxed_opaque_existential_1(&v11, v12);
  uint64_t v9 = (void *)sub_191EE9750();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);

  return v9;
}

- (id)resolveOptionalProtocol:(id)a3 contextBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  uint64_t v8 = self;
  sub_191E22864();

  swift_release();
  uint64_t v9 = v17;
  if (v17)
  {
    uint64_t v10 = __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v11 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v10);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    uint64_t v14 = (void *)sub_191EE9750();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)resolveProtocol:(id)a3 name:(id)a4
{
  if (a4) {
    sub_191EE8110();
  }
  id v6 = a3;
  id v7 = self;
  sub_191E22BC4((void *(*)(long long *__return_ptr))sub_191E22C10, &v10);

  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(&v10, v11);
  uint64_t v8 = (void *)sub_191EE9750();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);

  return v8;
}

- (id)resolveOptionalProtocol:(id)a3 name:(id)a4
{
  if (a4) {
    sub_191EE8110();
  }
  id v6 = a3;
  id v7 = self;
  sub_191E22C10();

  swift_bridgeObjectRelease();
  uint64_t v8 = v16;
  if (v16)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_1(v15, v16);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x1F4188790](v9);
    uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    v13 = (void *)sub_191EE9750();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)resolveProtocol:(id)a3 name:(id)a4 contextBlock:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4) {
    sub_191EE8110();
  }
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  uint64_t v10 = self;
  sub_191E22F1C((void *(*)(long long *__return_ptr))sub_191E22F68, &v13);

  swift_release();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(&v13, v14);
  uint64_t v11 = (void *)sub_191EE9750();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);

  return v11;
}

- (id)resolveOptionalProtocol:(id)a3 name:(id)a4 contextBlock:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4) {
    sub_191EE8110();
  }
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  uint64_t v10 = self;
  sub_191E22F68();

  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v11 = v19;
  if (v19)
  {
    uint64_t v12 = __swift_project_boxed_opaque_existential_1(v18, v19);
    uint64_t v13 = *(void *)(v11 - 8);
    MEMORY[0x1F4188790](v12);
    uint64_t v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = (void *)sub_191EE9750();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (_TtC13TeaFoundation15BridgedResolver)init
{
}

- (void).cxx_destruct
{
}

@end