@interface ICThumbnailGeneratorSystemPaper
+ (CGSize)chromeSize;
+ (id)chromeBackdropImageUrlFor:(id)a3;
- (ICThumbnailCaching)cache;
- (ICThumbnailGeneratorSystemPaper)initWithManagedObjectContext:(id)a3;
- (ICThumbnailGeneratorSystemPaper)initWithManagedObjectContext:(id)a3 cache:(id)a4;
- (id)thumbnailWith:(id)a3;
- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation ICThumbnailGeneratorSystemPaper

- (ICThumbnailCaching)cache
{
  v2 = (void *)swift_unknownObjectRetain();
  return (ICThumbnailCaching *)v2;
}

- (ICThumbnailGeneratorSystemPaper)initWithManagedObjectContext:(id)a3 cache:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ICThumbnailGeneratorSystemPaper_cache) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(ICThumbnailGenerator *)&v9 initWithManagedObjectContext:a3];
}

+ (id)chromeBackdropImageUrlFor:(id)a3
{
  uint64_t v4 = sub_1B0B7FBEC();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone((Class)ICThumbnailConfiguration);
  id v9 = a3;
  id v10 = objc_msgSend(v8, sel_initForSystemPaperChromeLayerWithThumbnailType_traitCollection_, 5, v9);
  id v11 = objc_msgSend(v10, sel_uniqueKey);

  sub_1B0AF5D28((uint64_t)v7);
  v12 = (void *)sub_1B0B7FB8C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

+ (CGSize)chromeSize
{
  if (qword_1EBBB4E20 != -1) {
    swift_once();
  }
  double v3 = *((double *)&xmmword_1EBBB4C98 + 1);
  double v2 = *(double *)&xmmword_1EBBB4C98;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  id v10 = [(ICThumbnailGenerator *)v9 managedObjectContext];
  id v11 = (void *)swift_allocObject();
  v11[2] = v9;
  v11[3] = v8;
  v11[4] = sub_1B0AF329C;
  v11[5] = v7;
  v15[4] = sub_1B0B69D98;
  v15[5] = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = sub_1B0A965E8;
  v15[3] = &block_descriptor_11;
  v12 = _Block_copy(v15);
  id v13 = v8;
  uint64_t v14 = v9;
  swift_retain();
  swift_release();
  [(NSManagedObjectContext *)v10 performBlock:v12];
  _Block_release(v12);

  swift_release();
}

- (id)thumbnailWith:(id)a3
{
  uint64_t v4 = (ICThumbnailConfiguration *)a3;
  uint64_t v5 = self;
  ThumbnailGeneratorSystemPaper.thumbnail(with:)(v6, v4);
  id v8 = v7;

  return v8;
}

- (ICThumbnailGeneratorSystemPaper)initWithManagedObjectContext:(id)a3
{
  id v3 = a3;
  CGSize result = (ICThumbnailGeneratorSystemPaper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end