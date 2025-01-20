@interface WBSBrowsingDataImportData
- (NSArray)extensionLockupViews;
- (NSString)errorMessage;
- (WBSBrowsingDataImportData)initWithNumberOfItemsSuccessfullyImported:(unint64_t)a3 numberOfItemsFailedToImport:(unint64_t)a4 errorMessage:(id)a5;
- (id)combine:(id)a3;
- (unint64_t)numberOfItemsFailedToImport;
- (unint64_t)numberOfItemsSuccessfullyImported;
- (void)setExtensionLockupViews:(id)a3;
- (void)setNumberOfItemsFailedToImport:(unint64_t)a3;
- (void)setNumberOfItemsSuccessfullyImported:(unint64_t)a3;
@end

@implementation WBSBrowsingDataImportData

- (WBSBrowsingDataImportData)initWithNumberOfItemsSuccessfullyImported:(unint64_t)a3 numberOfItemsFailedToImport:(unint64_t)a4 errorMessage:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WBSBrowsingDataImportData;
  v10 = [(WBSBrowsingDataImportData *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_numberOfItemsSuccessfullyImported = a3;
    v10->_numberOfItemsFailedToImport = a4;
    objc_storeStrong((id *)&v10->_errorMessage, a5);
    v12 = v11;
  }

  return v11;
}

- (id)combine:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    self->_numberOfItemsSuccessfullyImported += [v4 numberOfItemsSuccessfullyImported];
    self->_numberOfItemsFailedToImport += [v5 numberOfItemsFailedToImport];
    extensionLockupViews = self->_extensionLockupViews;
    v7 = [v5 extensionLockupViews];
    v8 = [(NSArray *)extensionLockupViews safari_arrayByAddingObjectsFromArrayIfNotDuplicates:v7];
    id v9 = self->_extensionLockupViews;
    self->_extensionLockupViews = v8;

    if (!self->_errorMessage)
    {
      v10 = [v5 errorMessage];
      errorMessage = self->_errorMessage;
      self->_errorMessage = v10;
    }
  }
  v12 = self;

  return self;
}

- (unint64_t)numberOfItemsSuccessfullyImported
{
  return self->_numberOfItemsSuccessfullyImported;
}

- (void)setNumberOfItemsSuccessfullyImported:(unint64_t)a3
{
  self->_numberOfItemsSuccessfullyImported = a3;
}

- (unint64_t)numberOfItemsFailedToImport
{
  return self->_numberOfItemsFailedToImport;
}

- (void)setNumberOfItemsFailedToImport:(unint64_t)a3
{
  self->_numberOfItemsFailedToImport = a3;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSArray)extensionLockupViews
{
  return self->_extensionLockupViews;
}

- (void)setExtensionLockupViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionLockupViews, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end