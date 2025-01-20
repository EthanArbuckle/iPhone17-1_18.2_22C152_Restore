@interface PXPhotosMapControllerAccessor
- (PKExtendedTraitCollection)pk_extendedTraitCollection;
- (PXPhotosMapControllerAccessor)initWithMapController:(id)a3 traitCollection:(id)a4 mapViewController:(id)a5;
- (PXPlacesMapController)mapController;
- (PXPlacesMapViewController)mapViewController;
@end

@implementation PXPhotosMapControllerAccessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewController, 0);
  objc_storeStrong((id *)&self->_pkExtendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_mapController, 0);
}

- (PXPlacesMapViewController)mapViewController
{
  return self->_mapViewController;
}

- (PKExtendedTraitCollection)pk_extendedTraitCollection
{
  return self->_pkExtendedTraitCollection;
}

- (PXPlacesMapController)mapController
{
  return self->_mapController;
}

- (PXPhotosMapControllerAccessor)initWithMapController:(id)a3 traitCollection:(id)a4 mapViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosMapControllerAccessor;
  v12 = [(PXPhotosMapControllerAccessor *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mapController, a3);
    v14 = objc_alloc_init(PXPlacesUtils);
    uint64_t v15 = [(PXPlacesUtils *)v14 pkExtendedTraitCollectionFromPXExtendedTraitCollection:v10];
    pkExtendedTraitCollection = v13->_pkExtendedTraitCollection;
    v13->_pkExtendedTraitCollection = (PKExtendedTraitCollection *)v15;

    objc_storeStrong((id *)&v13->_mapViewController, a5);
  }

  return v13;
}

@end