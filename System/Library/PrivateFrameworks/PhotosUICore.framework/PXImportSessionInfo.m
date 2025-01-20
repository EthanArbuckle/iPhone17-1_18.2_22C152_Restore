@interface PXImportSessionInfo
- (BOOL)importComplete;
- (BOOL)importStopped;
- (NSArray)itemsToImport;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableArray)errorItems;
- (NSMutableArray)importedItems;
- (int64_t)completedItemsCount;
- (void)setCompletedItemsCount:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setErrorItems:(id)a3;
- (void)setImportComplete:(BOOL)a3;
- (void)setImportStopped:(BOOL)a3;
- (void)setImportedItems:(id)a3;
- (void)setItemsToImport:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PXImportSessionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorItems, 0);
  objc_storeStrong((id *)&self->_importedItems, 0);
  objc_storeStrong((id *)&self->_itemsToImport, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)setCompletedItemsCount:(int64_t)a3
{
  self->_completedItemsCount = a3;
}

- (int64_t)completedItemsCount
{
  return self->_completedItemsCount;
}

- (void)setErrorItems:(id)a3
{
}

- (NSMutableArray)errorItems
{
  return self->_errorItems;
}

- (void)setImportedItems:(id)a3
{
}

- (NSMutableArray)importedItems
{
  return self->_importedItems;
}

- (void)setImportStopped:(BOOL)a3
{
  self->_importStopped = a3;
}

- (BOOL)importStopped
{
  return self->_importStopped;
}

- (void)setImportComplete:(BOOL)a3
{
  self->_importComplete = a3;
}

- (BOOL)importComplete
{
  return self->_importComplete;
}

- (void)setItemsToImport:(id)a3
{
}

- (NSArray)itemsToImport
{
  return self->_itemsToImport;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

@end