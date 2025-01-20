@interface CATCallbackParams
- (_TtC16SiriDialogEngine17CATCallbackParams)init;
- (id)valueForKey:(id)a3;
@end

@implementation CATCallbackParams

- (id)valueForKey:(id)a3
{
  sub_1C647A508();
  v4 = self;
  sub_1C6467064(&v12);

  swift_bridgeObjectRelease();
  uint64_t v5 = v13;
  if (v13)
  {
    v6 = __swift_project_boxed_opaque_existential_1(&v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = (void *)sub_1C647AC48();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v12);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_TtC16SiriDialogEngine17CATCallbackParams)init
{
}

- (void).cxx_destruct
{
}

@end