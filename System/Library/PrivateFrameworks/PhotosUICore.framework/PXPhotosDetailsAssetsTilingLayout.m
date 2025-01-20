@interface PXPhotosDetailsAssetsTilingLayout
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGRect)_placeholderFrame;
- (CGRect)contentBounds;
- (PXPhotosDetailsAssetsSpec)spec;
- (UIEdgeInsets)contentInset;
- (int64_t)placeholderMode;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)prepareLayout;
- (void)setPlaceholderMode:(int64_t)a3;
- (void)setSpec:(id)a3;
@end

@implementation PXPhotosDetailsAssetsTilingLayout

- (void).cxx_destruct
{
}

- (int64_t)placeholderMode
{
  return self->_placeholderMode;
}

- (void)setSpec:(id)a3
{
}

- (PXPhotosDetailsAssetsSpec)spec
{
  return self->_spec;
}

- (CGRect)_placeholderFrame
{
  v3 = [(PXEngineDrivenAssetsTilingLayout *)self layoutSnapshot];
  v4 = v3;
  if (v3)
  {
    [v3 contentRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  if (v10 == 0.0)
  {
    [(PXTilingLayout *)self referenceSize];
    double v10 = v11;
  }
  v12 = +[PXPhotosDetailsSettings sharedInstance];
  [v12 assetsWidgetPlaceholderAspectRatio];
  double v14 = v10 * v13;

  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  if (a6->length == 1 && a6->index[0] >> 1 == 16050)
  {
    int64_t v7 = [(PXPhotosDetailsAssetsTilingLayout *)self placeholderMode];
    if (v7)
    {
      [(PXPhotosDetailsAssetsTilingLayout *)self _placeholderFrame];
      [(PXTilingLayout *)self coordinateSpaceIdentifier];
      PXRectGetCenter();
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
    long long v8 = *(_OWORD *)&a6->index[5];
    v11[2] = *(_OWORD *)&a6->index[3];
    v11[3] = v8;
    v11[4] = *(_OWORD *)&a6->index[7];
    unint64_t v12 = a6->index[9];
    long long v9 = *(_OWORD *)&a6->index[1];
    v11[0] = *(_OWORD *)&a6->length;
    v11[1] = v9;
    LOBYTE(v7) = [(PXEngineDrivenAssetsTilingLayout *)&v13 getGeometry:a3 group:a4 userData:a5 forTileWithIdentifier:v11];
  }
  return v7;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v11 = a5;
  v54.receiver = self;
  v54.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
  -[PXEngineDrivenAssetsTilingLayout enumerateTilesInRect:withOptions:usingBlock:](&v54, sel_enumerateTilesInRect_withOptions_usingBlock_, a4, v11, x, y, width, height);
  int64_t v12 = [(PXPhotosDetailsAssetsTilingLayout *)self placeholderMode];
  if ((unint64_t)(v12 - 1) <= 1)
  {
    char v53 = 0;
    if (v12 == 1) {
      uint64_t v13 = 32100;
    }
    else {
      uint64_t v13 = 32101;
    }
    long long v14 = *((_OWORD *)off_1E5DAB048 + 9);
    long long v49 = *((_OWORD *)off_1E5DAB048 + 8);
    long long v50 = v14;
    long long v15 = *((_OWORD *)off_1E5DAB048 + 11);
    long long v51 = *((_OWORD *)off_1E5DAB048 + 10);
    long long v52 = v15;
    long long v16 = *((_OWORD *)off_1E5DAB048 + 5);
    long long v45 = *((_OWORD *)off_1E5DAB048 + 4);
    long long v46 = v16;
    long long v17 = *((_OWORD *)off_1E5DAB048 + 7);
    long long v47 = *((_OWORD *)off_1E5DAB048 + 6);
    long long v48 = v17;
    long long v18 = *((_OWORD *)off_1E5DAB048 + 1);
    long long v41 = *(_OWORD *)off_1E5DAB048;
    long long v42 = v18;
    long long v19 = *((_OWORD *)off_1E5DAB048 + 3);
    long long v43 = *((_OWORD *)off_1E5DAB048 + 2);
    long long v44 = v19;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    *(void *)&long long v21 = 1;
    *((void *)&v21 + 1) = v13;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    *(void *)&long long v26 = 0;
    if ([(PXPhotosDetailsAssetsTilingLayout *)self getGeometry:&v41 group:&v40 userData:&v39 forTileWithIdentifier:&v21])
    {
      v20 = (void (*)(void *, void *, long long *, uint64_t, uint64_t, char *))v11[2];
      v33[0] = 1;
      v33[1] = v13;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v38 = 0;
      long long v29 = v49;
      long long v30 = v50;
      long long v31 = v51;
      long long v32 = v52;
      long long v25 = v45;
      long long v26 = v46;
      long long v27 = v47;
      long long v28 = v48;
      long long v21 = v41;
      long long v22 = v42;
      long long v23 = v43;
      long long v24 = v44;
      v20(v11, v33, &v21, v40, v39, &v53);
    }
  }
}

- (CGRect)contentBounds
{
  if ([(PXPhotosDetailsAssetsTilingLayout *)self placeholderMode])
  {
    CGFloat v3 = *MEMORY[0x1E4F1DB28];
    CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    [(PXPhotosDetailsAssetsTilingLayout *)self _placeholderFrame];
    v18.origin.double x = v7;
    v18.origin.double y = v8;
    v18.size.double width = v9;
    v18.size.double height = v10;
    v16.origin.double x = v3;
    v16.origin.double y = v4;
    v16.size.double width = v5;
    v16.size.double height = v6;
    CGRectUnion(v16, v18);
    [(PXPhotosDetailsAssetsTilingLayout *)self contentInset];
    sub_1AB23B20C();
  }
  v15.receiver = self;
  v15.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
  [(PXEngineDrivenAssetsTilingLayout *)&v15 contentBounds];
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (UIEdgeInsets)contentInset
{
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
  [(PXTilingLayout *)&v16 contentInset];
  double v4 = v3;
  double v6 = v5;
  CGFloat v7 = [(PXPhotosDetailsAssetsTilingLayout *)self spec];
  [v7 contentGuideInsets];
  double v9 = v8;
  double v11 = v10;

  double v12 = v4;
  double v13 = v9;
  double v14 = v6;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)setPlaceholderMode:(int64_t)a3
{
  if (self->_placeholderMode != a3)
  {
    self->_placeholderMode = a3;
    double v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v4 invalidateAllTiles];
    [(PXTilingLayoutInvalidationContext *)v4 invalidateContentBounds];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)prepareLayout
{
  v2.receiver = self;
  v2.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
  [(PXTilingLayout *)&v2 prepareLayout];
}

@end