@interface SDAirDropHandlerPhotosImportResult
- (BOOL)shouldCleanupItems;
- (BOOL)shouldOfferOpenAction;
- (BOOL)success;
- (NSArray)assetIdentifiers;
- (SDAirDropHandlerPhotosImportResult)initWithImportedFiles:(id)a3 openAppURL:(id)a4 assetIdentifiers:(id)a5 success:(BOOL)a6 shouldOfferOpenAction:(BOOL)a7 shouldCleanupItems:(BOOL)a8;
@end

@implementation SDAirDropHandlerPhotosImportResult

- (SDAirDropHandlerPhotosImportResult)initWithImportedFiles:(id)a3 openAppURL:(id)a4 assetIdentifiers:(id)a5 success:(BOOL)a6 shouldOfferOpenAction:(BOOL)a7 shouldCleanupItems:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SDAirDropHandlerPhotosImportResult;
  v17 = [(SDAirDropHandlerPhotosImportResult *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(SDAirDropHandlerImportResult *)v17 setImportedFiles:v14];
    [(SDAirDropHandlerImportResult *)v18 setOpenAppURL:v15];
    objc_storeStrong((id *)&v18->_assetIdentifiers, a5);
    v18->_success = a6;
    v18->_shouldOfferOpenAction = a7;
    v18->_shouldCleanupItems = a8;
  }

  return v18;
}

- (NSArray)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)shouldOfferOpenAction
{
  return self->_shouldOfferOpenAction;
}

- (BOOL)shouldCleanupItems
{
  return self->_shouldCleanupItems;
}

- (void).cxx_destruct
{
}

@end