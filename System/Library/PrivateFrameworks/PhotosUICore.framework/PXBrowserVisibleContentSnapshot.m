@interface PXBrowserVisibleContentSnapshot
+ (PXBrowserVisibleContentSnapshot)snapshotWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5;
+ (PXBrowserVisibleContentSnapshot)snapshotWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5 dateType:(unint64_t)a6;
- (NSArray)locationNames;
- (NSDateInterval)dateInterval;
- (PXBrowserVisibleContentSnapshot)init;
- (PXBrowserVisibleContentSnapshot)initWithDateIntervalGranularity:(unint64_t)a3;
- (unint64_t)dateIntervalGranularity;
@end

@implementation PXBrowserVisibleContentSnapshot

- (void).cxx_destruct
{
}

- (NSArray)locationNames
{
  return self->_locationNames;
}

- (unint64_t)dateIntervalGranularity
{
  return self->_dateIntervalGranularity;
}

- (NSDateInterval)dateInterval
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 52, @"Method %s is a responsibility of subclass %@", "-[PXBrowserVisibleContentSnapshot dateInterval]", v6 object file lineNumber description];

  abort();
}

- (PXBrowserVisibleContentSnapshot)init
{
  return [(PXBrowserVisibleContentSnapshot *)self initWithDateIntervalGranularity:8];
}

- (PXBrowserVisibleContentSnapshot)initWithDateIntervalGranularity:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXBrowserVisibleContentSnapshot;
  result = [(PXBrowserVisibleContentSnapshot *)&v5 init];
  if (result) {
    result->_dateIntervalGranularity = a3;
  }
  return result;
}

+ (PXBrowserVisibleContentSnapshot)snapshotWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5 dateType:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = [[_PXBrowserDataSourceVisibleContentSnapshot alloc] initWithIndexPaths:v10 dataSource:v9 dateIntervalGranularity:a5 dateType:a6];

  return (PXBrowserVisibleContentSnapshot *)v11;
}

+ (PXBrowserVisibleContentSnapshot)snapshotWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5
{
  return (PXBrowserVisibleContentSnapshot *)[a1 snapshotWithIndexPaths:a3 dataSource:a4 dateIntervalGranularity:a5 dateType:0];
}

@end