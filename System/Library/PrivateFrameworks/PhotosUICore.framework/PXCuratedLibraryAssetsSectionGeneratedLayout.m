@interface PXCuratedLibraryAssetsSectionGeneratedLayout
- (CGRect)presentedKeyAssetRect;
- (CGRect)sectionRect;
- (PXCuratedLibraryAssetsSectionGeneratedLayout)init;
- (PXCuratedLibrarySectionGeometryDescriptor)presentedGeometryDescriptor;
- (PXDisplayAsset)presentedKeyAsset;
- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)getSpriteZPosition:(float *)a3 clippingRect:(CGRect *)a4 forSpriteKind:(int64_t)a5;
- (void)setPresentedKeyAsset:(id)a3;
- (void)setPresentedKeyAssetRect:(CGRect)a3;
- (void)spritesDidUpdate;
@end

@implementation PXCuratedLibraryAssetsSectionGeneratedLayout

- (void).cxx_destruct
{
}

- (void)setPresentedKeyAssetRect:(CGRect)a3
{
  self->_presentedKeyAssetRect = a3;
}

- (CGRect)presentedKeyAssetRect
{
  double x = self->_presentedKeyAssetRect.origin.x;
  double y = self->_presentedKeyAssetRect.origin.y;
  double width = self->_presentedKeyAssetRect.size.width;
  double height = self->_presentedKeyAssetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentedKeyAsset:(id)a3
{
}

- (PXDisplayAsset)presentedKeyAsset
{
  return self->_presentedKeyAsset;
}

- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetsSectionGeneratedLayout.m", 89, @"Method %s is a responsibility of subclass %@", "-[PXCuratedLibraryAssetsSectionGeneratedLayout enumerateHeroSpritesInRect:usingBlock:]", v9 object file lineNumber description];

  abort();
}

- (CGRect)sectionRect
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetsSectionGeneratedLayout.m", 85, @"Method %s is a responsibility of subclass %@", "-[PXCuratedLibraryAssetsSectionGeneratedLayout sectionRect]", v6 object file lineNumber description];

  abort();
}

- (void)getSpriteZPosition:(float *)a3 clippingRect:(CGRect *)a4 forSpriteKind:(int64_t)a5
{
  if (!a5)
  {
    int v5 = 0;
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    int v5 = -1093874483;
LABEL_5:
    *(_DWORD *)a3 = v5;
  }
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  a4->origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  a4->size = v6;
}

- (PXCuratedLibrarySectionGeometryDescriptor)presentedGeometryDescriptor
{
  [(PXCuratedLibraryAssetsSectionGeneratedLayout *)self sectionRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PXCuratedLibraryAssetsSectionGeneratedLayout *)self presentedKeyAssetRect];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  v19 = [(PXCuratedLibraryAssetsSectionGeneratedLayout *)self presentedKeyAsset];
  v20 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
  HIDWORD(v23) = *((_DWORD *)off_1E5DAAF50 + 3);
  *(void *)((char *)&v23 + 4) = *(void *)((char *)off_1E5DAAF50 + 4);
  LODWORD(v23) = *(_DWORD *)off_1E5DAAF50;
  v21 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:](v20, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:", v19, v4, v6, v8, v10, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v12, v14, v16, v18, v23);

  return v21;
}

- (void)spritesDidUpdate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryAssetsSectionGeneratedLayout;
  [(PXGGeneratedLayout *)&v13 spritesDidUpdate];
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v7 = [(PXGGeneratedLayout *)self generator];
  uint64_t v8 = [v7 keyItemIndex];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v12 = *(_DWORD *)off_1E5DAAF60;
    memset(v11, 0, sizeof(v11));
    memset(v14, 0, sizeof(v14));
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    [(PXGLayout *)self copyLayoutForSpritesInRange:v8 | 0x100000000 entities:&v12 geometries:v11 styles:v14 infos:v9];
    PXRectWithCenterAndSize();
  }
  [(PXCuratedLibraryAssetsSectionGeneratedLayout *)self setPresentedKeyAsset:0];
  -[PXCuratedLibraryAssetsSectionGeneratedLayout setPresentedKeyAssetRect:](self, "setPresentedKeyAssetRect:", v3, v4, v5, v6);
}

- (PXCuratedLibraryAssetsSectionGeneratedLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryAssetsSectionGeneratedLayout;
  CGRect result = [(PXGGeneratedLayout *)&v4 init];
  if (result)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_presentedKeyAssetRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_presentedKeyAssetRect.size = v3;
  }
  return result;
}

@end