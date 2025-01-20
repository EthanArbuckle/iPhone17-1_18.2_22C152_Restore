@interface QLThumbnailExtensionGenerator
- (QLThumbnailExtensionGenerator)init;
- (void)cancel;
- (void)generateThumbnailWithThumbnailRequest:(QLTGeneratorThumbnailRequest *)a3 item:(QLThumbnailItem *)a4 flavor:(int)a5 wantsLowQuality:(BOOL)a6 generationData:(NSDictionary *)a7 completionHandler:(id)a8;
@end

@implementation QLThumbnailExtensionGenerator

- (void)generateThumbnailWithThumbnailRequest:(QLTGeneratorThumbnailRequest *)a3 item:(QLThumbnailItem *)a4 flavor:(int)a5 wantsLowQuality:(BOOL)a6 generationData:(NSDictionary *)a7 completionHandler:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E618);
  MEMORY[0x1F4188790](v15 - 8);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a3;
  *(void *)(v19 + 24) = a4;
  *(_DWORD *)(v19 + 32) = a5;
  *(unsigned char *)(v19 + 36) = a6;
  *(void *)(v19 + 40) = a7;
  *(void *)(v19 + 48) = v18;
  *(void *)(v19 + 56) = self;
  uint64_t v20 = sub_1DDCB4C40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EAB91C98;
  v21[5] = v19;
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EAB91CA8;
  v22[5] = v21;
  v23 = a3;
  v24 = a4;
  v25 = a7;
  v26 = self;
  sub_1DDCA0878((uint64_t)v17, (uint64_t)&unk_1EAB91CB8, (uint64_t)v22);
  swift_release();
}

- (void)cancel
{
}

- (QLThumbnailExtensionGenerator)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___QLThumbnailExtensionGenerator_operation) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ThumbnailExtensionGenerator();
  return [(QLThumbnailExtensionGenerator *)&v3 init];
}

- (void).cxx_destruct
{
}

@end