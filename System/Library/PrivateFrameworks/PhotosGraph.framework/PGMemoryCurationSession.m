@interface PGMemoryCurationSession
- (CLSCurationContext)curationContext;
- (PGCurationManager)curationManager;
- (PGGraphLocationHelper)locationHelper;
- (PGMemoryCurationSession)initWithCurationManager:(id)a3 photoLibrary:(id)a4 curationContext:(id)a5 locationHelper:(id)a6;
- (PHPhotoLibrary)photoLibrary;
@end

@implementation PGMemoryCurationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationHelper, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_curationManager, 0);
}

- (PGGraphLocationHelper)locationHelper
{
  return self->_locationHelper;
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (PGCurationManager)curationManager
{
  return self->_curationManager;
}

- (PGMemoryCurationSession)initWithCurationManager:(id)a3 photoLibrary:(id)a4 curationContext:(id)a5 locationHelper:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGMemoryCurationSession;
  v15 = [(PGMemoryCurationSession *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_curationManager, a3);
    objc_storeWeak((id *)&v16->_photoLibrary, v12);
    objc_storeStrong((id *)&v16->_curationContext, a5);
    objc_storeStrong((id *)&v16->_locationHelper, a6);
  }

  return v16;
}

@end