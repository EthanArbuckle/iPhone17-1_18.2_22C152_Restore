@interface PXPhotosVisibleContentSnapshot
- (NSArray)locationNames;
- (NSDateInterval)dateInterval;
- (NSString)localizedPlaceholderText;
- (PXPhotosVisibleContentSnapshot)init;
- (PXPhotosVisibleContentSnapshot)initWithPhotosLayout:(id)a3 dateType:(unint64_t)a4 dateIntervalGranularity:(unint64_t)a5;
- (unint64_t)dateIntervalGranularity;
@end

@implementation PXPhotosVisibleContentSnapshot

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationNamesFuture, 0);
  objc_storeStrong(&self->_dateIntervalFuture, 0);
}

- (unint64_t)dateIntervalGranularity
{
  return self->_dateIntervalGranularity;
}

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

- (NSArray)locationNames
{
  locationNamesFuture = (void (**)(void, void))self->_locationNamesFuture;
  if (locationNamesFuture)
  {
    locationNamesFuture[2](locationNamesFuture, self->_dataSourceIdentifier);
    locationNamesFuture = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)locationNamesFuture;
}

- (NSDateInterval)dateInterval
{
  dateIntervalFuture = (void (**)(void, void))self->_dateIntervalFuture;
  if (dateIntervalFuture)
  {
    dateIntervalFuture[2](dateIntervalFuture, self->_dataSourceIdentifier);
    dateIntervalFuture = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return (NSDateInterval *)dateIntervalFuture;
}

- (PXPhotosVisibleContentSnapshot)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosVisibleContentSnapshot.m", 37, @"%s is not available as initializer", "-[PXPhotosVisibleContentSnapshot init]");

  abort();
}

- (PXPhotosVisibleContentSnapshot)initWithPhotosLayout:(id)a3 dateType:(unint64_t)a4 dateIntervalGranularity:(unint64_t)a5
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosVisibleContentSnapshot;
  if ([(PXPhotosVisibleContentSnapshot *)&v8 init])
  {
    [v6 visibleRect];
    [v6 safeAreaInsets];
    PXEdgeInsetsInsetRect();
  }

  return 0;
}

@end