@interface PXPhotosLayoutState
- (PXAssetReference)anchorAssetReference;
- (PXPhotosSectionBodyLayoutProvider)bodyProvider;
- (PXPhotosSectionHeaderLayoutProvider)headerProvider;
- (PXPhotosViewLens)lens;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAnchorAssetReference:(id)a3;
- (void)setBodyProvider:(id)a3;
- (void)setHeaderProvider:(id)a3;
- (void)setLens:(id)a3;
@end

@implementation PXPhotosLayoutState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorAssetReference, 0);
  objc_storeStrong((id *)&self->_headerProvider, 0);
  objc_storeStrong((id *)&self->_bodyProvider, 0);
  objc_storeStrong((id *)&self->_lens, 0);
}

- (void)setAnchorAssetReference:(id)a3
{
}

- (PXAssetReference)anchorAssetReference
{
  return self->_anchorAssetReference;
}

- (void)setHeaderProvider:(id)a3
{
}

- (PXPhotosSectionHeaderLayoutProvider)headerProvider
{
  return self->_headerProvider;
}

- (void)setBodyProvider:(id)a3
{
}

- (PXPhotosSectionBodyLayoutProvider)bodyProvider
{
  return self->_bodyProvider;
}

- (void)setLens:(id)a3
{
}

- (PXPhotosViewLens)lens
{
  return self->_lens;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PXPhotosLayoutState);
  v5 = [(PXPhotosLayoutState *)self lens];
  [(PXPhotosLayoutState *)v4 setLens:v5];

  v6 = [(PXPhotosLayoutState *)self bodyProvider];
  [(PXPhotosLayoutState *)v4 setBodyProvider:v6];

  v7 = [(PXPhotosLayoutState *)self headerProvider];
  [(PXPhotosLayoutState *)v4 setHeaderProvider:v7];

  v8 = [(PXPhotosLayoutState *)self anchorAssetReference];
  [(PXPhotosLayoutState *)v4 setAnchorAssetReference:v8];

  return v4;
}

@end