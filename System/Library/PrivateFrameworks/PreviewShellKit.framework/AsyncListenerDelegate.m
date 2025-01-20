@interface AsyncListenerDelegate
- (_TtC15PreviewShellKit21AsyncListenerDelegate)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation AsyncListenerDelegate

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a5;
  id v14 = a4;
  swift_unknownObjectRetain_n();
  v15 = self;
  id v16 = v14;
  id v17 = a3;
  sub_25A1844E4((uint64_t)v11, (uint64_t)&unk_26A40A8E0, (uint64_t)v13);

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC15PreviewShellKit21AsyncListenerDelegate)init
{
  result = (_TtC15PreviewShellKit21AsyncListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end