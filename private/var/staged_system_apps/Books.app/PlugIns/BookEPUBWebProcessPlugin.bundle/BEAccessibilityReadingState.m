@interface BEAccessibilityReadingState
+ (id)currentReadingState;
+ (void)registerBookContentElement:(id)a3;
+ (void)registerBookContentWrapper:(id)a3;
- (BEAccessibilityReadingState)init;
- (BOOL)delayForDocumentChanged;
- (BOOL)hasVisibleControls;
- (BOOL)isFixedLayoutBook;
- (BOOL)isPaginated;
- (BOOL)isRTL;
- (BOOL)isSpreadWithChapterBoundary;
- (BOOL)isTextHorizontal;
- (BOOL)isVisiblePageBookmarked;
- (BOOL)newDocumentFinishedLoading;
- (CGRect)primaryVisibleContentRect;
- (CGRect)secondaryVisibleContentRect;
- (NSArray)performableOperations;
- (NSArray)visibleAnnotations;
- (NSPointerArray)knownBookContentElements;
- (_NSRange)currentPage;
- (id)description;
- (int64_t)currentPageLength;
- (int64_t)currentPageLocation;
- (int64_t)currentPageNumber;
- (int64_t)screenHeight;
- (int64_t)screenWidth;
- (unint64_t)bookLayout;
- (unint64_t)pageCount;
- (void)documentChanged;
- (void)invalidateCaches;
- (void)setBookLayout:(unint64_t)a3;
- (void)setCurrentPageLength:(int64_t)a3;
- (void)setCurrentPageLocation:(int64_t)a3;
- (void)setCurrentPageNumber:(int64_t)a3;
- (void)setDelayForDocumentChanged:(BOOL)a3;
- (void)setHasVisibleControls:(BOOL)a3;
- (void)setIsFixedLayoutBook:(BOOL)a3;
- (void)setIsPaginated:(BOOL)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setIsSpreadWithChapterBoundary:(BOOL)a3;
- (void)setIsTextHorizontal:(BOOL)a3;
- (void)setIsVisiblePageBookmarked:(BOOL)a3;
- (void)setKnownBookContentElements:(id)a3;
- (void)setNewDocumentFinishedLoading:(BOOL)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPerformableOperations:(id)a3;
- (void)setPrimaryVisibleContentRect:(CGRect)a3;
- (void)setScreenHeight:(int64_t)a3;
- (void)setScreenWidth:(int64_t)a3;
- (void)setSecondaryVisibleContentRect:(CGRect)a3;
- (void)setVisibleAnnotations:(id)a3;
@end

@implementation BEAccessibilityReadingState

+ (id)currentReadingState
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10E54;
  block[3] = &unk_208B8;
  block[4] = a1;
  if (qword_27228 != -1) {
    dispatch_once(&qword_27228, block);
  }
  v2 = (void *)qword_27230;

  return v2;
}

- (BEAccessibilityReadingState)init
{
  v6.receiver = self;
  v6.super_class = (Class)BEAccessibilityReadingState;
  v2 = [(BEAccessibilityReadingState *)&v6 init];
  if (v2)
  {
    v3 = (NSPointerArray *)[objc_alloc((Class)NSPointerArray) initWithOptions:5];
    knownBookContentElements = v2->_knownBookContentElements;
    v2->_knownBookContentElements = v3;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = +[NSNumber numberWithInteger:[(BEAccessibilityReadingState *)self currentPageLocation]];
  v5 = +[NSNumber numberWithInteger:[(BEAccessibilityReadingState *)self currentPageLength]];
  objc_super v6 = +[NSNumber numberWithUnsignedInteger:[(BEAccessibilityReadingState *)self pageCount]];
  v7 = [(BEAccessibilityReadingState *)self visibleAnnotations];
  v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
  v9 = +[NSNumber numberWithBool:[(BEAccessibilityReadingState *)self isVisiblePageBookmarked]];
  v10 = +[NSNumber numberWithUnsignedInteger:[(BEAccessibilityReadingState *)self bookLayout]];
  v11 = +[NSNumber numberWithBool:[(BEAccessibilityReadingState *)self isFixedLayoutBook]];
  v12 = +[NSString stringWithFormat:@"<%@ %p currentPageLocation=%@ currentPageLength=%@ totalPages=%@ annotations=%@ bookmarked=%@ bookLayout=%@ fixedLayout=%@>", v3, self, v4, v5, v6, v8, v9, v10, v11];

  return v12;
}

- (_NSRange)currentPage
{
  int64_t v3 = [(BEAccessibilityReadingState *)self currentPageLocation];
  NSUInteger v4 = [(BEAccessibilityReadingState *)self currentPageLength];
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (void)setCurrentPageLocation:(int64_t)a3
{
  if (self->_currentPageLocation != a3) {
    self->_currentPageLocation = a3;
  }
}

- (void)setCurrentPageNumber:(int64_t)a3
{
  if (self->_currentPageNumber != a3) {
    self->_currentPageNumber = a3;
  }
}

- (void)setScreenHeight:(int64_t)a3
{
  if (self->_screenHeight != a3) {
    self->_screenHeight = a3;
  }
}

- (void)setScreenWidth:(int64_t)a3
{
  if (self->_screenWidth != a3) {
    self->_screenWidth = a3;
  }
}

- (void)setIsPaginated:(BOOL)a3
{
  if (self->_isPaginated != a3)
  {
    self->_isPaginated = a3;
    [(BEAccessibilityReadingState *)self documentChanged];
  }
}

- (void)documentChanged
{
  v2 = [(BEAccessibilityReadingState *)self knownBookContentElements];
  int64_t v3 = [v2 allObjects];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector())
        {
          [v9 baxInvalidateLineInfos];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v9 baxInvalidateCaches];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)invalidateCaches
{
  v2 = [(BEAccessibilityReadingState *)self knownBookContentElements];
  int64_t v3 = [v2 allObjects];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) baxInvalidateCaches:v9];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (void)registerBookContentElement:(id)a3
{
  id v8 = a3;
  id v4 = [a1 currentReadingState];
  id v5 = [v4 knownBookContentElements];

  id v6 = [v5 allObjects];
  unsigned __int8 v7 = [v6 containsObject:v8];

  if ((v7 & 1) == 0) {
    [v5 addPointer:v8];
  }
}

+ (void)registerBookContentWrapper:(id)a3
{
  id v8 = a3;
  id v4 = [a1 currentReadingState];
  id v5 = [v4 knownBookContentElements];

  id v6 = [v5 allObjects];
  unsigned __int8 v7 = [v6 containsObject:v8];

  if ((v7 & 1) == 0) {
    [v5 addPointer:v8];
  }
}

- (NSArray)visibleAnnotations
{
  return self->_visibleAnnotations;
}

- (void)setVisibleAnnotations:(id)a3
{
}

- (BOOL)isVisiblePageBookmarked
{
  return self->_isVisiblePageBookmarked;
}

- (void)setIsVisiblePageBookmarked:(BOOL)a3
{
  self->_isVisiblePageBookmarked = a3;
}

- (int64_t)currentPageLocation
{
  return self->_currentPageLocation;
}

- (int64_t)currentPageLength
{
  return self->_currentPageLength;
}

- (void)setCurrentPageLength:(int64_t)a3
{
  self->_currentPageLength = a3;
}

- (int64_t)currentPageNumber
{
  return self->_currentPageNumber;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (unint64_t)bookLayout
{
  return self->_bookLayout;
}

- (void)setBookLayout:(unint64_t)a3
{
  self->_bookLayout = a3;
}

- (BOOL)isFixedLayoutBook
{
  return self->_isFixedLayoutBook;
}

- (void)setIsFixedLayoutBook:(BOOL)a3
{
  self->_isFixedLayoutBook = a3;
}

- (NSPointerArray)knownBookContentElements
{
  return self->_knownBookContentElements;
}

- (void)setKnownBookContentElements:(id)a3
{
}

- (NSArray)performableOperations
{
  return self->_performableOperations;
}

- (void)setPerformableOperations:(id)a3
{
}

- (CGRect)primaryVisibleContentRect
{
  double x = self->_primaryVisibleContentRect.origin.x;
  double y = self->_primaryVisibleContentRect.origin.y;
  double width = self->_primaryVisibleContentRect.size.width;
  double height = self->_primaryVisibleContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPrimaryVisibleContentRect:(CGRect)a3
{
  self->_primaryVisibleContentRect = a3;
}

- (CGRect)secondaryVisibleContentRect
{
  double x = self->_secondaryVisibleContentRect.origin.x;
  double y = self->_secondaryVisibleContentRect.origin.y;
  double width = self->_secondaryVisibleContentRect.size.width;
  double height = self->_secondaryVisibleContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSecondaryVisibleContentRect:(CGRect)a3
{
  self->_secondaryVisibleContentRect = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)isSpreadWithChapterBoundary
{
  return self->_isSpreadWithChapterBoundary;
}

- (void)setIsSpreadWithChapterBoundary:(BOOL)a3
{
  self->_isSpreadWithChapterBoundardouble y = a3;
}

- (BOOL)isPaginated
{
  return self->_isPaginated;
}

- (BOOL)isTextHorizontal
{
  return self->_isTextHorizontal;
}

- (void)setIsTextHorizontal:(BOOL)a3
{
  self->_isTextHorizontal = a3;
}

- (BOOL)hasVisibleControls
{
  return self->_hasVisibleControls;
}

- (void)setHasVisibleControls:(BOOL)a3
{
  self->_hasVisibleControls = a3;
}

- (int64_t)screenHeight
{
  return self->_screenHeight;
}

- (int64_t)screenWidth
{
  return self->_screenWidth;
}

- (BOOL)delayForDocumentChanged
{
  return self->_delayForDocumentChanged;
}

- (void)setDelayForDocumentChanged:(BOOL)a3
{
  self->_delayForDocumentChanged = a3;
}

- (BOOL)newDocumentFinishedLoading
{
  return self->_newDocumentFinishedLoading;
}

- (void)setNewDocumentFinishedLoading:(BOOL)a3
{
  self->_newDocumentFinishedLoading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performableOperations, 0);
  objc_storeStrong((id *)&self->_knownBookContentElements, 0);

  objc_storeStrong((id *)&self->_visibleAnnotations, 0);
}

@end