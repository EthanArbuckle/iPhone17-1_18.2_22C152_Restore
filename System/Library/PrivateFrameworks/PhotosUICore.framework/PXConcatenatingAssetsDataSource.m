@interface PXConcatenatingAssetsDataSource
- (PXConcatenatingAssetsDataSource)init;
- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3;
- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetReferenceForAssetReference:(id)a3;
- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)startingAssetReference;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXConcatenatingAssetsDataSource

- (int64_t)numberOfSections
{
  v2 = self;
  int64_t v3 = sub_1A9FAFFA0();

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  int64_t v3 = self;
  sub_1A9FAF024();
}

- (id)startingAssetReference
{
  v2 = self;
  sub_1A9FAF150();
}

- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3
{
  id v5 = a4;
  v6 = self;
  sub_1A9FAF338();
}

- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t v3 = self;
  sub_1A9FAF590();
}

- (id)assetReferenceForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = sub_1A9FAF758(v4);

  return v6;
}

- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t v3 = self;
  sub_1A9FAF954();
}

- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t v3 = self;
  sub_1A9FAFAD4();
}

- (PXConcatenatingAssetsDataSource)init
{
  result = (PXConcatenatingAssetsDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end