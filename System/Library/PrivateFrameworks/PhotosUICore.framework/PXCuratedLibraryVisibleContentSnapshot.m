@interface PXCuratedLibraryVisibleContentSnapshot
- (NSArray)locationNames;
- (NSDateInterval)dateInterval;
- (NSString)localizedPlaceholderText;
- (PXCuratedLibraryVisibleContentSnapshot)init;
- (PXCuratedLibraryVisibleContentSnapshot)initWithLibraryLayout:(id)a3 dateType:(unint64_t)a4;
- (unint64_t)dateIntervalGranularity;
@end

@implementation PXCuratedLibraryVisibleContentSnapshot

- (NSString)localizedPlaceholderText
{
  if (self->_isFiltering)
  {
    v2 = PXLocalizedStringFromTable(@"PXBrowserSummaryNoFilteringResultsPlaceholderText", @"PhotosUICore");
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)(*((uint64_t (**)(id, int64_t))self->_dateIntervalFuture + 2))(self->_dateIntervalFuture, self->_dataSourceIdentifier);
}

- (unint64_t)dateIntervalGranularity
{
  return 16;
}

- (PXCuratedLibraryVisibleContentSnapshot)initWithLibraryLayout:(id)a3 dateType:(unint64_t)a4
{
  id v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryVisibleContentSnapshot;
  if ([(PXCuratedLibraryVisibleContentSnapshot *)&v7 init])
  {
    [v5 visibleRect];
    [v5 safeAreaInsets];
    PXEdgeInsetsInsetRect();
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationNamesFuture, 0);
  objc_storeStrong(&self->_dateIntervalFuture, 0);
}

- (NSArray)locationNames
{
  return (NSArray *)(*((uint64_t (**)(id, int64_t))self->_locationNamesFuture + 2))(self->_locationNamesFuture, self->_dataSourceIdentifier);
}

- (PXCuratedLibraryVisibleContentSnapshot)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryVisibleContentSnapshot.m", 27, @"%s is not available as initializer", "-[PXCuratedLibraryVisibleContentSnapshot init]");

  abort();
}

@end