@interface PXPlacesSearchProvider
+ (id)_extendedTraitCollectionForTraitCollection:(id)a3;
+ (id)_placesSnapshotOptionsForSize:(CGSize)a3 extendedTraitCollection:(id)a4 serialQueue:(id)a5;
- (OS_dispatch_queue)serialQueue;
- (PXPlacesSearchProvider)init;
- (PXPlacesSnapshotFactory)factory;
- (void)requestBoundingRegionForQuery:(id)a3 completion:(id)a4;
- (void)requestMapSnapshotForQuery:(id)a3 size:(CGSize)a4 traitCollectionForSnapshot:(id)a5 completion:(id)a6;
- (void)requestMapSnapshotOfRegion:(id *)a3 size:(CGSize)a4 traitCollectionForSnapshot:(id)a5 completion:(id)a6;
- (void)setFactory:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation PXPlacesSearchProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_factory, 0);
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setFactory:(id)a3
{
}

- (PXPlacesSnapshotFactory)factory
{
  return self->_factory;
}

- (void)requestBoundingRegionForQuery:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXPlacesSearchProvider *)self factory];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PXPlacesSearchProvider_requestBoundingRegionForQuery_completion___block_invoke;
  v10[3] = &unk_1E5DC2578;
  id v11 = v6;
  id v9 = v6;
  [v8 requestBoundingRegionForQuery:v7 completion:v10];
}

uint64_t __67__PXPlacesSearchProvider_requestBoundingRegionForQuery_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMapSnapshotOfRegion:(id *)a3 size:(CGSize)a4 traitCollectionForSnapshot:(id)a5 completion:(id)a6
{
  double v11 = v9;
  double v12 = v8;
  double v13 = v7;
  double v14 = v6;
  double height = a4.height;
  double width = a4.width;
  id v18 = a5;
  id v22 = +[PXPlacesSearchProvider _extendedTraitCollectionForTraitCollection:a3];
  v19 = [(PXPlacesSearchProvider *)self serialQueue];
  v20 = +[PXPlacesSearchProvider _placesSnapshotOptionsForSize:extendedTraitCollection:serialQueue:](PXPlacesSearchProvider, "_placesSnapshotOptionsForSize:extendedTraitCollection:serialQueue:", v22, v19, v12, v11);

  v21 = [(PXPlacesSearchProvider *)self factory];
  objc_msgSend(v21, "requestMapSnapshotOfRegion:snapshotOptions:completion:", v20, v18, width, height, v14, v13);
}

- (void)requestMapSnapshotForQuery:(id)a3 size:(CGSize)a4 traitCollectionForSnapshot:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  id v16 = +[PXPlacesSearchProvider _extendedTraitCollectionForTraitCollection:a5];
  double v13 = [(PXPlacesSearchProvider *)self serialQueue];
  double v14 = +[PXPlacesSearchProvider _placesSnapshotOptionsForSize:extendedTraitCollection:serialQueue:](PXPlacesSearchProvider, "_placesSnapshotOptionsForSize:extendedTraitCollection:serialQueue:", v16, v13, width, height);

  v15 = [(PXPlacesSearchProvider *)self factory];
  [v15 requestMapSnapshotForQuery:v12 snapshotOptions:v14 completion:v11];
}

- (PXPlacesSearchProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesSearchProvider;
  v2 = [(PXPlacesSearchProvider *)&v9 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v4 = [[PXPlacesSnapshotFactory alloc] initWithPhotoLibrary:v3];
    factory = v2->_factory;
    v2->_factory = v4;

    dispatch_queue_t v6 = dispatch_queue_create("PXPlacesSearchProvider", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)_placesSnapshotOptionsForSize:(CGSize)a3 extendedTraitCollection:(id)a4 serialQueue:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc_init(PXPlacesSnapshotOptions);
  [(PXPlacesSnapshotOptions *)v10 setQueue:v8];

  -[PXPlacesSnapshotOptions setViewSize:](v10, "setViewSize:", width, height);
  [(PXPlacesSnapshotOptions *)v10 setExtendedTraitCollection:v9];

  [(PXPlacesSnapshotOptions *)v10 setShowsPointLabels:0];
  return v10;
}

+ (id)_extendedTraitCollectionForTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKExtendedTraitCollection);
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  -[PKExtendedTraitCollection setDisplayScale:](v4, "setDisplayScale:");

  [(PKExtendedTraitCollection *)v4 setTraitCollectionForMapKit:v3];
  return v4;
}

@end