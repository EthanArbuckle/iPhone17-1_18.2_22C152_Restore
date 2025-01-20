@interface _PXPhotosSearchBodyCollectionSectionLayout
- (PXPhotosSearchBodyContainerInfo)containerInfo;
- (_PXPhotosSearchBodyCollectionSectionLayout)init;
- (id)axSpriteIndexes;
- (id)axSpriteIndexesInRect:(CGRect)a3;
- (void)referenceSizeDidChange;
@end

@implementation _PXPhotosSearchBodyCollectionSectionLayout

- (void).cxx_destruct
{
}

- (PXPhotosSearchBodyContainerInfo)containerInfo
{
  return self->_containerInfo;
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v3;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_PXPhotosSearchBodyCollectionSectionLayout;
  [(PXGSingleViewLayout *)&v3 referenceSizeDidChange];
  [(PXGLayout *)self referenceSize];
  -[PXPhotosSearchBodyContainerInfo setContainerSize:](self->_containerInfo, "setContainerSize:");
}

- (_PXPhotosSearchBodyCollectionSectionLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXPhotosSearchBodyCollectionSectionLayout;
  id v2 = [(PXGSingleViewLayout *)&v6 init];
  if (v2)
  {
    objc_super v3 = objc_alloc_init(PXPhotosSearchBodyContainerInfo);
    containerInfo = v2->_containerInfo;
    v2->_containerInfo = v3;
  }
  return v2;
}

@end