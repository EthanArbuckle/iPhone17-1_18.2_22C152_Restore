@interface PXPhotosFileProviderRegister
+ (BOOL)canRegisterFileRepresentationsFor:(id)a3 contentType:(id)a4 configuration:(id)a5;
+ (NSString)urlQueryItemClientEncodingPolicyKey;
+ (NSString)urlQueryItemDownscalingTargetDimensionKey;
+ (NSString)urlQueryItemIdentifierCodeKey;
+ (NSString)urlQueryItemIncludeCaptionKey;
+ (NSString)urlQueryItemIncludeLocationKey;
+ (NSString)urlQueryItemItemTypeKey;
+ (NSString)urlQueryItemLibraryIdentifierKey;
+ (NSString)urlQueryItemThumbnailSizeKey;
+ (NSString)urlQueryItemUUIDKey;
+ (NSString)urlQueryItemVideoPresetKey;
- (PXPhotosFileProviderRegister)init;
- (PXPhotosFileProviderRegister)initWithConfiguration:(id)a3 fileProviderManager:(id)a4 domain:(id)a5;
- (id)registerFileRepresentationsWithItemProvider:(id)a3 asset:(id)a4;
- (id)registerFolderRepresentationWithItemProvider:(id)a3 object:(id)a4;
- (id)registeredFileRepresentationWithContentType:(id)a3 uuid:(id)a4 identifierCode:(id)a5 libraryIdentifier:(id)a6 itemType:(unint64_t)a7 encodingPolicy:(int64_t)a8 hasLimitedVisibility:(BOOL)a9;
- (id)registeredFileRepresentationsWithAsset:(id)a3;
- (id)registeredFolderRepresentationWithObject:(id)a3;
@end

@implementation PXPhotosFileProviderRegister

+ (NSString)urlQueryItemUUIDKey
{
}

+ (NSString)urlQueryItemIdentifierCodeKey
{
}

+ (NSString)urlQueryItemLibraryIdentifierKey
{
}

+ (NSString)urlQueryItemItemTypeKey
{
}

+ (NSString)urlQueryItemClientEncodingPolicyKey
{
}

+ (NSString)urlQueryItemDownscalingTargetDimensionKey
{
}

+ (NSString)urlQueryItemIncludeLocationKey
{
}

+ (NSString)urlQueryItemIncludeCaptionKey
{
}

+ (NSString)urlQueryItemThumbnailSizeKey
{
}

+ (NSString)urlQueryItemVideoPresetKey
{
}

- (PXPhotosFileProviderRegister)initWithConfiguration:(id)a3 fileProviderManager:(id)a4 domain:(id)a5
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegister_configuration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegister_fileProviderManager) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegister_domain) = (Class)a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PhotosFileProviderRegister();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  return [(PXPhotosFileProviderRegister *)&v12 init];
}

- (id)registerFileRepresentationsWithItemProvider:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1AA9421B8(v6, v7);

  sub_1AB2305AC();
  id v9 = (void *)sub_1AB23AABC();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)registerFolderRepresentationWithItemProvider:(id)a3 object:(id)a4
{
  sub_1A9DC0688();
  MEMORY[0x1F4188790](v7 - 8, v8);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_1AA943828(v11, v12, (uint64_t)v10);

  uint64_t v14 = sub_1AB2305AC();
  uint64_t v15 = *(void *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14) != 1)
  {
    v16 = (void *)sub_1AB23049C();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v14);
  }
  return v16;
}

- (id)registeredFolderRepresentationWithObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_1AA944148(v4);

  return v6;
}

- (id)registeredFileRepresentationsWithAsset:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA944410(v4);

  type metadata accessor for PhotosFileProviderRegister.FileRepresentation(0);
  id v6 = (void *)sub_1AB23AABC();
  swift_bridgeObjectRelease();
  return v6;
}

+ (BOOL)canRegisterFileRepresentationsFor:(id)a3 contentType:(id)a4 configuration:(id)a5
{
  uint64_t v8 = sub_1AB23560C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  id v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = a5;
  sub_1AB23552C();

  sub_1AA94ACB8(v13, v15);
  v19 = v12;
  LOBYTE(a5) = sub_1AA94D8D0(v16, (uint64_t)sub_1AA94D744);

  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v12, v8);
  return a5 & 1;
}

- (id)registeredFileRepresentationWithContentType:(id)a3 uuid:(id)a4 identifierCode:(id)a5 libraryIdentifier:(id)a6 itemType:(unint64_t)a7 encodingPolicy:(int64_t)a8 hasLimitedVisibility:(BOOL)a9
{
  v32 = (void *)a8;
  unint64_t v33 = a7;
  HIDWORD(v31) = a9;
  uint64_t v34 = sub_1AB23560C();
  MEMORY[0x1F4188790](v34, v14);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  self;
  sub_1AB23552C();

  uint64_t v21 = sub_1AB23A76C();
  uint64_t v23 = v22;

  uint64_t v24 = sub_1AB23A76C();
  uint64_t v26 = v25;

  uint64_t v27 = sub_1AB23A76C();
  v29 = v28;

  sub_1AA944B54((uint64_t)v16, v21, v23, v24, v26, v27, v29, v33, v32, BYTE4(v31));
}

- (PXPhotosFileProviderRegister)init
{
  result = (PXPhotosFileProviderRegister *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegister_domain);
}

@end