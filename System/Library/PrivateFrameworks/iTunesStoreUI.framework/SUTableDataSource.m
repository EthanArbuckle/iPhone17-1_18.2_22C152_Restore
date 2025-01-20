@interface SUTableDataSource
- (BOOL)canDeleteIndexPath:(id)a3;
- (BOOL)canDoubleTapIndexPath:(id)a3;
- (BOOL)canSelectIndexPath:(id)a3;
- (BOOL)deleteIndexPath:(id)a3;
- (BOOL)isPreferringUserInteraction;
- (ISURLOperationPool)imagePool;
- (NSArray)sectionIndexTitles;
- (SUImageCache)imageCache;
- (SUTableDataSource)init;
- (double)cellHeightForIndexPath:(id)a3;
- (double)heightForFooterInSection:(int64_t)a3;
- (double)heightForPlaceholderCells;
- (id)cachedConfigurationForClass:(Class)a3 index:(int64_t)a4;
- (id)cellContextForConfigurationClass:(Class)a3;
- (id)cellForIndexPath:(id)a3;
- (id)cellReuseSource;
- (id)headerViewForSection:(int64_t)a3;
- (id)placeholderCellForIndexPath:(id)a3;
- (id)titleForDeleteConfirmationForIndexPath:(id)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (int64_t)columnCount;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (int64_t)tableViewStyle;
- (void)beginPreferringUserInteraction;
- (void)dealloc;
- (void)didBeginPreferringUserInteraction;
- (void)didEndPreferringUserInteraction;
- (void)endPreferringUserInteraction;
- (void)reloadCellContexts;
- (void)resetLayoutCaches;
- (void)setCellReuseSource:(id)a3;
- (void)setColumnCount:(int64_t)a3;
@end

@implementation SUTableDataSource

- (SUTableDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUTableDataSource;
  result = [(SUTableDataSource *)&v3 init];
  if (result) {
    result->_columnCount = 1;
  }
  return result;
}

- (void)dealloc
{
  self->_configurationCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableDataSource;
  [(SUTableDataSource *)&v3 dealloc];
}

- (void)beginPreferringUserInteraction
{
  int64_t preferringUserInteractionCount = self->_preferringUserInteractionCount;
  self->_int64_t preferringUserInteractionCount = preferringUserInteractionCount + 1;
  if (!preferringUserInteractionCount) {
    [(SUTableDataSource *)self didBeginPreferringUserInteraction];
  }
}

- (id)cachedConfigurationForClass:(Class)a3 index:(int64_t)a4
{
  id v6 = [(SUVariableCellConfigurationCache *)self->_configurationCache cacheForClass:a3];
  v7 = (void *)[v6 configurationForRow:a4];
  id v8 = (id)[v6 cellContext];
  if (!v8) {
    id v8 = [(SUVariableCellConfigurationCache *)self->_configurationCache cellContext];
  }
  objc_msgSend(v8, "setTableViewStyle:", -[SUTableDataSource tableViewStyle](self, "tableViewStyle"));
  [v7 setContext:v8];
  return v7;
}

- (BOOL)canDeleteIndexPath:(id)a3
{
  return 0;
}

- (BOOL)canDoubleTapIndexPath:(id)a3
{
  return 0;
}

- (BOOL)canSelectIndexPath:(id)a3
{
  return 1;
}

- (id)cellContextForConfigurationClass:(Class)a3
{
  id v3 = [(SUVariableCellConfigurationCache *)self->_configurationCache cacheForClass:a3];

  return (id)[v3 cellContext];
}

- (id)cellForIndexPath:(id)a3
{
  return 0;
}

- (double)cellHeightForIndexPath:(id)a3
{
  return 44.0;
}

- (BOOL)deleteIndexPath:(id)a3
{
  return 0;
}

- (void)didBeginPreferringUserInteraction
{
  v2 = (void *)[(ISURLOperationPool *)[(SUTableDataSource *)self imagePool] operationQueue];

  [v2 setSuspended:1];
}

- (void)didEndPreferringUserInteraction
{
  v2 = (void *)[(ISURLOperationPool *)[(SUTableDataSource *)self imagePool] operationQueue];

  [v2 setSuspended:0];
}

- (void)endPreferringUserInteraction
{
  int64_t preferringUserInteractionCount = self->_preferringUserInteractionCount;
  BOOL v3 = preferringUserInteractionCount == 1;
  BOOL v4 = preferringUserInteractionCount < 1;
  int64_t v5 = preferringUserInteractionCount - 1;
  if (!v4)
  {
    self->_int64_t preferringUserInteractionCount = v5;
    if (v3) {
      [(SUTableDataSource *)self didEndPreferringUserInteraction];
    }
  }
}

- (id)headerViewForSection:(int64_t)a3
{
  return 0;
}

- (double)heightForFooterInSection:(int64_t)a3
{
  return *MEMORY[0x263F1D600];
}

- (double)heightForPlaceholderCells
{
  return -1.0;
}

- (SUImageCache)imageCache
{
  return (SUImageCache *)+[SUClientDispatch imageCache];
}

- (ISURLOperationPool)imagePool
{
  return (ISURLOperationPool *)+[SUClientDispatch imagePool];
}

- (BOOL)isPreferringUserInteraction
{
  return self->_preferringUserInteractionCount > 0;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)placeholderCellForIndexPath:(id)a3
{
  return 0;
}

- (void)reloadCellContexts
{
  configurationCache = self->_configurationCache;
  if (!configurationCache)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    configurationCache = [[SUVariableCellConfigurationCache alloc] initWithTableHeight:v4 * (double)[(SUTableDataSource *)self columnCount]];
    self->_configurationCache = configurationCache;
  }

  [(SUVariableCellConfigurationCache *)configurationCache reset];
}

- (void)resetLayoutCaches
{
}

- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return 0;
}

- (NSArray)sectionIndexTitles
{
  return 0;
}

- (void)setCellReuseSource:(id)a3
{
  if (a3 && (objc_opt_respondsToSelector() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUTableDataSource.m", 180, @"Invalid cell reuse source");
  }
  self->_cellReuseSource = a3;
}

- (int64_t)tableViewStyle
{
  return 0;
}

- (id)titleForDeleteConfirmationForIndexPath:(id)a3
{
  BOOL v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return (id)[v3 localizedStringForKey:@"DELETE" value:&stru_26DB8C5F8 table:0];
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)cellReuseSource
{
  return self->_cellReuseSource;
}

- (int64_t)columnCount
{
  return self->_columnCount;
}

- (void)setColumnCount:(int64_t)a3
{
  self->_columnCount = a3;
}

@end