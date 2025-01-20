@interface BEDocumentPaginationDataInfo
- (BEDocumentPaginationDataInfo)init;
- (BEDocumentPaginationDataInfo)initWithPageSize:(CGSize)a3 pageCount:(int64_t)a4 contentSize:(CGSize)a5 pageOffset:(int64_t)a6 paginationDirection:(int64_t)a7 documentNavigationDirection:(int64_t)a8;
- (CGSize)contentSize;
- (CGSize)pageSize;
- (NSArray)bookmarks;
- (NSArray)historyEntries;
- (NSArray)landmarkAnchorItems;
- (NSArray)navigationAnchorItems;
- (NSArray)physicalPageAnchors;
- (NSArray)userAnnotations;
- (NSDictionary)mediaElements;
- (NSDictionary)navigationAnchors;
- (int64_t)navigationDirection;
- (int64_t)pageCount;
- (int64_t)pageOffset;
- (int64_t)paginationDirection;
- (void)setBookmarks:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setHistoryEntries:(id)a3;
- (void)setLandmarkAnchorItems:(id)a3;
- (void)setMediaElements:(id)a3;
- (void)setNavigationAnchorItems:(id)a3;
- (void)setNavigationAnchors:(id)a3;
- (void)setNavigationDirection:(int64_t)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)setPageSize:(CGSize)a3;
- (void)setPaginationDirection:(int64_t)a3;
- (void)setPhysicalPageAnchors:(id)a3;
- (void)setUserAnnotations:(id)a3;
@end

@implementation BEDocumentPaginationDataInfo

- (CGSize)pageSize
{
  double v2 = sub_122330((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_pageSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
}

- (int64_t)pageCount
{
  double v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageCount);
  swift_beginAccess();
  return *v2;
}

- (void)setPageCount:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageCount);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (CGSize)contentSize
{
  double v2 = sub_122330((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
}

- (int64_t)pageOffset
{
  double v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageOffset);
  swift_beginAccess();
  return *v2;
}

- (void)setPageOffset:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageOffset);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)paginationDirection
{
  double v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_paginationDirection);
  swift_beginAccess();
  return *v2;
}

- (void)setPaginationDirection:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_paginationDirection);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)navigationDirection
{
  double v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_navigationDirection);
  swift_beginAccess();
  return *v2;
}

- (void)setNavigationDirection:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_navigationDirection);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSArray)userAnnotations
{
  return (NSArray *)sub_122E78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_userAnnotations);
}

- (void)setUserAnnotations:(id)a3
{
}

- (NSDictionary)navigationAnchors
{
  return (NSDictionary *)sub_122A94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_navigationAnchors);
}

- (void)setNavigationAnchors:(id)a3
{
}

- (NSDictionary)mediaElements
{
  return (NSDictionary *)sub_122A94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_mediaElements);
}

- (void)setMediaElements:(id)a3
{
}

- (NSArray)navigationAnchorItems
{
  return (NSArray *)sub_122E78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_navigationAnchorItems);
}

- (void)setNavigationAnchorItems:(id)a3
{
}

- (NSArray)landmarkAnchorItems
{
  return (NSArray *)sub_122E78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_landmarkAnchorItems);
}

- (void)setLandmarkAnchorItems:(id)a3
{
}

- (NSArray)physicalPageAnchors
{
  return (NSArray *)sub_122E78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_physicalPageAnchors);
}

- (void)setPhysicalPageAnchors:(id)a3
{
}

- (NSArray)bookmarks
{
  return (NSArray *)sub_122E78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_bookmarks);
}

- (void)setBookmarks:(id)a3
{
}

- (NSArray)historyEntries
{
  return (NSArray *)sub_122E78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_historyEntries);
}

- (void)setHistoryEntries:(id)a3
{
}

- (BEDocumentPaginationDataInfo)initWithPageSize:(CGSize)a3 pageCount:(int64_t)a4 contentSize:(CGSize)a5 pageOffset:(int64_t)a6 paginationDirection:(int64_t)a7 documentNavigationDirection:(int64_t)a8
{
  return (BEDocumentPaginationDataInfo *)DocumentPaginationDataInfo.init(pageSize:pageCount:contentSize:pageOffset:paginationDirection:documentNavigationDirection:)(a4, a6, a7, a8, a3.width, a3.height, a5.width, a5.height);
}

- (BEDocumentPaginationDataInfo)init
{
  CGSize result = (BEDocumentPaginationDataInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end