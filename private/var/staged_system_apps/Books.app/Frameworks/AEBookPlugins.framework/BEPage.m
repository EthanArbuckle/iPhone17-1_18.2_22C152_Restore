@interface BEPage
+ (id)generatePagesFrom:(id)a3;
- (BEPage)init;
- (BOOL)occludesSecondayContent;
- (BOOL)snapToContentBoundary;
- (NSArray)anchors;
- (NSArray)annotations;
- (NSArray)bookmarks;
- (NSArray)highlights;
- (NSArray)mediaElements;
- (NSArray)physicalChapterMarkers;
- (NSArray)physicalPageMarkers;
- (NSString)description;
- (void)setAnchors:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setBookmarks:(id)a3;
- (void)setHighlights:(id)a3;
- (void)setMediaElements:(id)a3;
- (void)setPhysicalChapterMarkers:(id)a3;
- (void)setPhysicalPageMarkers:(id)a3;
@end

@implementation BEPage

- (BOOL)snapToContentBoundary
{
  return 1;
}

- (BOOL)occludesSecondayContent
{
  return 0;
}

- (NSArray)annotations
{
  return (NSArray *)sub_12DAD0(self);
}

- (void)setAnnotations:(id)a3
{
}

- (NSArray)bookmarks
{
  return (NSArray *)sub_12DAD0(self);
}

- (void)setBookmarks:(id)a3
{
}

- (NSArray)highlights
{
  return (NSArray *)sub_12DAD0(self);
}

- (void)setHighlights:(id)a3
{
}

- (NSArray)anchors
{
  return (NSArray *)sub_12E0A0(self);
}

- (void)setAnchors:(id)a3
{
}

- (NSArray)mediaElements
{
  return (NSArray *)sub_12E0A0(self);
}

- (void)setMediaElements:(id)a3
{
}

- (NSArray)physicalPageMarkers
{
  return (NSArray *)sub_12E83C(self);
}

- (void)setPhysicalPageMarkers:(id)a3
{
}

- (NSArray)physicalChapterMarkers
{
  return (NSArray *)sub_12E83C(self);
}

- (void)setPhysicalChapterMarkers:(id)a3
{
}

- (BEPage)init
{
  result = (BEPage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___BEPage__annotations;
  uint64_t v4 = sub_11EC74(&qword_22B348);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___BEPage__bookmarks, v4);
  v5((char *)self + OBJC_IVAR___BEPage__highlights, v4);
  v6 = (char *)self + OBJC_IVAR___BEPage__anchors;
  uint64_t v7 = sub_11EC74(&qword_22B370);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR___BEPage__mediaElements, v7);
  v9 = (char *)self + OBJC_IVAR___BEPage__physicalPageMarkers;
  uint64_t v10 = sub_11EC74(&qword_22B390);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v12)((void *)(v10 - 8), v9, v10);
  v11 = (char *)self + OBJC_IVAR___BEPage__physicalChapterMarkers;

  v12(v11, v10);
}

- (NSString)description
{
  v2 = self;
  Page.description.getter();

  NSString v3 = sub_139250();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (id)generatePagesFrom:(id)a3
{
  swift_unknownObjectRetain();
  _s13AEBookPlugins4PageC13generatePages4fromSayACGAA30DocumentPaginationDataProvider_p_tFZ_0(a3);
  swift_unknownObjectRelease();
  type metadata accessor for Page();
  v4.super.isa = sub_1392E0().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

@end