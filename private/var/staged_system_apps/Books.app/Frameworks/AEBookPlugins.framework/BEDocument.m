@interface BEDocument
- (BEDocument)init;
- (NSArray)contentFragments;
- (NSArray)pages;
- (NSString)assetId;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)href;
- (NSString)manifestId;
- (NSString)title;
- (_TtP13AEBookPlugins30DocumentPaginationDataProvider_)paginationData;
- (_TtP13AEBookPlugins38DocumentCollectionInformationCacheType_)protocolCacheItem;
- (int64_t)file_size;
- (int64_t)ordinal;
- (int64_t)pageOffset;
- (void)setFile_size:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)setPages:(id)a3;
- (void)setPaginationData:(id)a3;
@end

@implementation BEDocument

- (int64_t)ordinal
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BEDocument_ordinal);
}

- (NSString)href
{
  return (NSString *)sub_126014();
}

- (NSString)title
{
  if (*(void *)&self->ordinal[OBJC_IVAR___BEDocument_title])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_139250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)manifestId
{
  return (NSString *)sub_126014();
}

- (NSString)assetId
{
  return (NSString *)sub_126014();
}

- (int64_t)file_size
{
  NSString v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocument_file_size);
  swift_beginAccess();
  return *v2;
}

- (void)setFile_size:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocument_file_size);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (_TtP13AEBookPlugins38DocumentCollectionInformationCacheType_)protocolCacheItem
{
  return (_TtP13AEBookPlugins38DocumentCollectionInformationCacheType_ *)0;
}

- (NSArray)contentFragments
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1391A0();
  swift_release();
  swift_release();
  sub_133C74(v6);
  swift_bridgeObjectRelease();

  sub_11EC74(&qword_22B4A8);
  v4.super.isa = sub_1392E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (int64_t)pageOffset
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1391A0();
  swift_release();
  swift_release();

  return v5;
}

- (void)setPageOffset:(int64_t)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  NSArray v4 = self;
  sub_1391B0();
}

- (NSArray)pages
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1391A0();
  swift_release();
  swift_release();

  type metadata accessor for Page();
  v4.super.isa = sub_1392E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setPages:(id)a3
{
  type metadata accessor for Page();
  sub_1392F0();
  swift_getKeyPath();
  swift_getKeyPath();
  NSArray v4 = self;
  sub_1391B0();
}

- (_TtP13AEBookPlugins30DocumentPaginationDataProvider_)paginationData
{
  NSString v2 = (void *)swift_unknownObjectRetain();

  return (_TtP13AEBookPlugins30DocumentPaginationDataProvider_ *)v2;
}

- (void)setPaginationData:(id)a3
{
  swift_unknownObjectRetain();
  int64_t v5 = self;
  sub_1371B8((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (BEDocument)init
{
  result = (BEDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___BEDocument__pageOffset;
  uint64_t v4 = sub_11EC74(&qword_22B1B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  int64_t v5 = (char *)self + OBJC_IVAR___BEDocument__pages;
  uint64_t v6 = sub_11EC74(&qword_22B460);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_unknownObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_135C38(self, (uint64_t)a2, (void (*)(void))Document.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_135C38(self, (uint64_t)a2, (void (*)(void))Document.debugDescription.getter);
}

@end