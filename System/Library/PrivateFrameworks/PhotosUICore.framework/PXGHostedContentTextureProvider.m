@interface PXGHostedContentTextureProvider
- (PXGHostedContentTextureProvider)init;
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)cancelTextureRequests:(id)a3;
@end

@implementation PXGHostedContentTextureProvider

- (PXGHostedContentTextureProvider)init
{
  uint64_t v3 = OBJC_IVAR___PXGHostedContentTextureProvider_requestQueue_requestByID;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1A9CD9268(MEMORY[0x1E4FBC860]);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HostedContentTextureProvider();
  return [(PXGTextureProvider *)&v5 init];
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  id v12 = a7;
  v13 = self;
  id v14 = sub_1A9FD5C24(*(void *)&a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v12);
  NSUInteger v16 = v15;

  NSUInteger v17 = (NSUInteger)v14;
  NSUInteger v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

- (void)cancelTextureRequests:(id)a3
{
  uint64_t v4 = sub_1AB230A8C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB2309FC();
  v9 = self;
  sub_1A9FD640C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void).cxx_destruct
{
}

@end