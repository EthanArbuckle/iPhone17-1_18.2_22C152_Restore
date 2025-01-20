@interface PUIObjCArtworkProvider
+ (PUIObjCArtworkProvider)shared;
+ (PUIObjCArtworkProvider)uiShared;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)hasArtworkForShow:(id)a3 withDimensions:(CGRect)a4 fromSource:(id)a5;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (PUIObjCArtworkProvider)init;
- (id)cachedArtworkForMTPodcast:(id)a3 withSize:(CGSize)a4;
- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)legacyUICachedArtworkForPodcastUuid:(id)a3 withSize:(CGSize)a4;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)artworkForMTPodcast:(MTPodcast *)a3 withSize:(CGSize)a4 completionHandler:(id)a5;
- (void)artworkForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5;
- (void)artworkForShow:(NSString *)a3 size:(CGSize)a4 source:(NSString *)a5 completionHandler:(id)a6;
- (void)artworkForURL:(NSString *)a3 withSize:(CGSize)a4 completionHandler:(id)a5;
- (void)artworkPathForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5;
- (void)artworkPathForShow:(NSString *)a3 size:(CGSize)a4 source:(NSString *)a5 completionHandler:(id)a6;
- (void)cacheArtwork:(id)a3 withDimension:(CGRect)a4 forShow:(id)a5 fromSource:(id)a6;
- (void)keyedArtworkForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5;
- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4;
- (void)migrateLibraryArtworkFromImageStoreWithCompletionHandler:(id)a3;
- (void)placeholderWithSize:(CGSize)a3 completionHandler:(id)a4;
@end

@implementation PUIObjCArtworkProvider

+ (PUIObjCArtworkProvider)shared
{
  return (PUIObjCArtworkProvider *)sub_1E3D00908((uint64_t)a1, (uint64_t)a2, qword_1EBFDF3D8, (void **)&qword_1EBFE0090);
}

+ (PUIObjCArtworkProvider)uiShared
{
  return (PUIObjCArtworkProvider *)sub_1E3D00908((uint64_t)a1, (uint64_t)a2, &qword_1EAE24170, (void **)&qword_1EAE270B8);
}

- (void)cacheArtwork:(id)a3 withDimension:(CGRect)a4 forShow:(id)a5 fromSource:(id)a6
{
  uint64_t v8 = type metadata accessor for PreparedArtworkRequest();
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E3E7CD30();
  uint64_t v12 = sub_1E3E7CD30();
  uint64_t v14 = v13;
  v17[1] = a3;
  id v15 = a3;
  v16 = self;
  sub_1E3D06BB8(v11, v12, v14, (uint64_t)v10);
  sub_1E3C13DF4();
  sub_1E3E78EE0();
  sub_1E3D0B0DC((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for PreparedArtworkRequest);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)hasArtworkForShow:(id)a3 withDimensions:(CGRect)a4 fromSource:(id)a5
{
  uint64_t v6 = type metadata accessor for PreparedArtworkRequest();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1E3E7CD30();
  uint64_t v10 = sub_1E3E7CD30();
  uint64_t v12 = v11;
  uint64_t v13 = self;
  sub_1E3D06BB8(v9, v10, v12, (uint64_t)v8);
  sub_1E3C13DF4();
  LOBYTE(v10) = sub_1E3E78EC0();
  sub_1E3D0B0DC((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for PreparedArtworkRequest);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (void)artworkForShow:(NSString *)a3 size:(CGSize)a4 source:(NSString *)a5 completionHandler:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a6);
  v16 = (CGFloat *)swift_allocObject();
  *((void *)v16 + 2) = a3;
  v16[3] = width;
  v16[4] = height;
  *((void *)v16 + 5) = a5;
  *((void *)v16 + 6) = v15;
  *((void *)v16 + 7) = self;
  uint64_t v17 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EAE272C0;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EAE272C8;
  v19[5] = v18;
  v20 = a3;
  v21 = a5;
  v22 = self;
  sub_1E3C8B220((uint64_t)v14, (uint64_t)&unk_1EAE272D0, (uint64_t)v19);
  swift_release();
}

- (void)artworkForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = (CGFloat *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EAE272A0;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  void v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EAE272A8;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1E3C8B220((uint64_t)v12, (uint64_t)&unk_1EAE272B0, (uint64_t)v17);
  swift_release();
}

- (void)keyedArtworkForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = (CGFloat *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EAE27280;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  void v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EAE27288;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1E3C8B220((uint64_t)v12, (uint64_t)&unk_1EAE27290, (uint64_t)v17);
  swift_release();
}

- (void)artworkPathForShow:(NSString *)a3 size:(CGSize)a4 source:(NSString *)a5 completionHandler:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a6);
  v16 = (CGFloat *)swift_allocObject();
  *((void *)v16 + 2) = a3;
  v16[3] = width;
  v16[4] = height;
  *((void *)v16 + 5) = a5;
  *((void *)v16 + 6) = v15;
  *((void *)v16 + 7) = self;
  uint64_t v17 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EAE27260;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EAE27268;
  v19[5] = v18;
  uint64_t v20 = a3;
  v21 = a5;
  v22 = self;
  sub_1E3C8B220((uint64_t)v14, (uint64_t)&unk_1EAE27270, (uint64_t)v19);
  swift_release();
}

- (void)artworkPathForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = (CGFloat *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EAE27240;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  void v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EAE27248;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1E3C8B220((uint64_t)v12, (uint64_t)&unk_1EAE27250, (uint64_t)v17);
  swift_release();
}

- (id)legacyUICachedArtworkForPodcastUuid:(id)a3 withSize:(CGSize)a4
{
  uint64_t v5 = sub_1E3E78E70();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PreparedArtworkRequest();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E3E7CD30();
  uint64_t v14 = v13;
  uint64_t v15 = self;
  sub_1E3D0765C(v12, v14, (uint64_t)v8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v8, v5);
  sub_1E3C13DF4();
  sub_1E3E78ED0();
  sub_1E3D0B0DC((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for PreparedArtworkRequest);
  swift_bridgeObjectRelease();

  v16 = (void *)v18[0];

  return v16;
}

- (id)cachedArtworkForMTPodcast:(id)a3 withSize:(CGSize)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_1E3D048EC();

  return v7;
}

- (void)artworkForMTPodcast:(MTPodcast *)a3 withSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = (CGFloat *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EAE27220;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  void v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EAE27228;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1E3C8B220((uint64_t)v12, (uint64_t)&unk_1EAE27230, (uint64_t)v17);
  swift_release();
}

- (void)artworkForURL:(NSString *)a3 withSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = (CGFloat *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EAE27200;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  void v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EAE27208;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1E3C8B220((uint64_t)v12, (uint64_t)&unk_1EAE27210, (uint64_t)v17);
  swift_release();
}

- (void)placeholderWithSize:(CGSize)a3 completionHandler:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (CGFloat *)swift_allocObject();
  v12[2] = width;
  v12[3] = height;
  *((void *)v12 + 4) = v11;
  *((void *)v12 + 5) = self;
  uint64_t v13 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EAE271E0;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EAE271E8;
  v15[5] = v14;
  v16 = self;
  sub_1E3C8B220((uint64_t)v10, (uint64_t)&unk_1EAE271F0, (uint64_t)v15);
  swift_release();
}

- (void)migrateLibraryArtworkFromImageStoreWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EAE271C0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EAE27910;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_1E3C8B220((uint64_t)v7, (uint64_t)&unk_1EAE271D0, (uint64_t)v12);
  swift_release();
}

- (PUIObjCArtworkProvider)init
{
  result = (PUIObjCArtworkProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIObjCArtworkProvider_backingProvider);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIObjCArtworkProvider_bucketingStrategy);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PUIObjCArtworkProvider_managedObjectContext);
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 1;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = ObjCArtworkProvider.existingRepresentation(for:)(v4);

  return v6;
}

- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EAE27900;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EAE27910;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1E3C8B220((uint64_t)v9, (uint64_t)&unk_1EAE271D0, (uint64_t)v14);
  swift_release();
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4 = (PUIObjCArtworkProvider *)a3;
  uint64_t v5 = self;
  sub_1E3D2CDCC(v4);
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_allocWithZone(MEMORY[0x1E4F91FD8]);
    uint64_t v9 = sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(v8, sel_initWithArtworkIdentifier_, v9);

    id v4 = v5;
    uint64_t v5 = (PUIObjCArtworkProvider *)v9;
  }

  return v7;
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v8 = self;
  if (a3 == 1 && (id v9 = sub_1E3D2CF60(v7)) != 0)
  {
    uint64_t v10 = v9;
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F319D0]), sel_init);
    objc_msgSend(v11, sel_setBackgroundColor_, v10);
    uint64_t v12 = sub_1E3D2D084();
    uint64_t v17 = v12;

    v16[0] = v11;
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE6190);
    uint64_t v17 = v12;
    uint64_t v13 = swift_allocObject();
    v16[0] = v13;
    *(_OWORD *)(v13 + 16) = 0u;
    *(_OWORD *)(v13 + 32) = 0u;
  }
  __swift_project_boxed_opaque_existential_1(v16, v12);
  uint64_t v14 = (void *)sub_1E3E7E140();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);

  return v14;
}

@end