@interface PXGPersonTextureProvider
- (PXGPersonTextureProvider)init;
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)cancelTextureRequests:(id)a3;
- (void)viewEnvironmentDidChange:(id)a3;
@end

@implementation PXGPersonTextureProvider

- (void)viewEnvironmentDidChange:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A9C26704(a3);
}

- (PXGPersonTextureProvider)init
{
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  id v12 = a7;
  v13 = self;
  id v14 = sub_1A9D7C8E4(*(void *)&a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v12);
  NSUInteger v16 = v15;

  NSUInteger v17 = (NSUInteger)v14;
  NSUInteger v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

- (void)cancelTextureRequests:(id)a3
{
  sub_1A9BF71C0(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  v7 = (char *)&v24 - v6;
  uint64_t v8 = sub_1AB230A8C();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v12 = MEMORY[0x1F4188790](v8, v11);
  v13 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12, v14);
  NSUInteger v16 = (char *)&v24 - v15;
  sub_1AB2309FC();
  uint64_t v17 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v16, v8);
  unint64_t v19 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  *((void *)v20 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v20[v19], v13, v8);
  v21 = self;
  sub_1A9D7D770((uint64_t)v7, (uint64_t)&unk_1E9821FC8, (uint64_t)v20);
  swift_release();
  v22 = (void *)sub_1AB2309CC();
  v23 = (objc_class *)type metadata accessor for PersonTextureProvider();
  v24.receiver = v21;
  v24.super_class = v23;
  [(PXGTextureProvider *)&v24 cancelTextureRequests:v22];

  (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
}

- (void).cxx_destruct
{
  sub_1A9D813E4(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___PXGPersonTextureProvider____lazy_storage___requestIDController));

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXGPersonTextureProvider_darkLoadingImage);
}

@end