@interface CATComputableWrapper
- (id)valueForComputedProperty:(id)a3 typeName:(id)a4 propName:(id)a5 params:(id)a6;
@end

@implementation CATComputableWrapper

- (id)valueForComputedProperty:(id)a3 typeName:(id)a4 propName:(id)a5 params:(id)a6
{
  uint64_t v7 = sub_1C647A508();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1C647A508();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1C647A508();
  uint64_t v15 = v14;
  id v16 = a6;
  swift_retain();
  sub_1C6476B78(v7, v9, v10, v12, v13, v15, v16);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = v25;
  if (v25)
  {
    v18 = __swift_project_boxed_opaque_existential_1(v24, v25);
    uint64_t v19 = *(void *)(v17 - 8);
    MEMORY[0x1F4188790](v18);
    v21 = (char *)v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v21);
    v22 = (void *)sub_1C647AC48();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end