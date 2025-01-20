@interface PXPhotosDetailsActionsTilingLayout
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (BOOL)shouldInsetAllSeparators;
- (BOOL)shouldShowSeparators;
- (CGRect)_frameForItemAtIndex:(int64_t)a3;
- (CGRect)_frameForSeparatorAtIndex:(int64_t)a3;
- (CGRect)contentBounds;
- (PXPhotosDetailsActionsTilingLayout)initWithNumberOfItems:(int64_t)a3;
- (double)_contentWidth;
- (double)interItemSpacing;
- (double)rowHeight;
- (double)separatorHeight;
- (int64_t)_numberOfSeparators;
- (int64_t)numberOfItems;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)prepareLayout;
- (void)setRowHeight:(double)a3;
- (void)setSeparatorHeight:(double)a3;
- (void)setShouldInsetAllSeparators:(BOOL)a3;
- (void)setShouldShowSeparators:(BOOL)a3;
@end

@implementation PXPhotosDetailsActionsTilingLayout

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (int64_t)_numberOfSeparators
{
  return self->__numberOfSeparators;
}

- (void)setShouldInsetAllSeparators:(BOOL)a3
{
  self->_shouldInsetAllSeparators = a3;
}

- (BOOL)shouldInsetAllSeparators
{
  return self->_shouldInsetAllSeparators;
}

- (void)setShouldShowSeparators:(BOOL)a3
{
  self->_shouldShowSeparators = a3;
}

- (BOOL)shouldShowSeparators
{
  return self->_shouldShowSeparators;
}

- (void)setSeparatorHeight:(double)a3
{
  self->_separatorHeight = a3;
}

- (double)separatorHeight
{
  return self->_separatorHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (CGRect)_frameForSeparatorAtIndex:(int64_t)a3
{
  [(PXPhotosDetailsActionsTilingLayout *)self separatorHeight];
  double v6 = v5;
  [(PXPhotosDetailsActionsTilingLayout *)self rowHeight];
  double v8 = v7;
  [(PXTilingLayout *)self contentInset];
  double v10 = v9;
  [(PXTilingLayout *)self contentInset];
  double v12 = v11;
  [(PXPhotosDetailsActionsTilingLayout *)self _contentWidth];
  double v14 = v13;
  [(PXPhotosDetailsActionsTilingLayout *)self separatorHeight];
  double v16 = v15;
  if (![(PXPhotosDetailsActionsTilingLayout *)self shouldInsetAllSeparators])
  {
    [(PXTilingLayout *)self contentInset];
    double v14 = v14 + v17;
    if (!a3 || [(PXPhotosDetailsActionsTilingLayout *)self numberOfItems] == a3)
    {
      [(PXTilingLayout *)self contentInset];
      double v10 = v10 - v18;
      [(PXTilingLayout *)self contentInset];
      double v14 = v14 + v19;
    }
  }
  double v20 = (v6 + v8) * (double)a3 + v12;
  double v21 = v10;
  double v22 = v14;
  double v23 = v16;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v21;
  return result;
}

- (CGRect)_frameForItemAtIndex:(int64_t)a3
{
  if (a3)
  {
    [(PXPhotosDetailsActionsTilingLayout *)self interItemSpacing];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }
  [(PXTilingLayout *)self contentInset];
  double v8 = v7;
  [(PXTilingLayout *)self contentInset];
  double v10 = v9;
  [(PXPhotosDetailsActionsTilingLayout *)self separatorHeight];
  double v12 = v6 + v10 + v11;
  [(PXPhotosDetailsActionsTilingLayout *)self rowHeight];
  double v14 = v13;
  [(PXPhotosDetailsActionsTilingLayout *)self separatorHeight];
  double v16 = v12 + (v14 + v15) * (double)a3;
  [(PXPhotosDetailsActionsTilingLayout *)self _contentWidth];
  double v18 = v17;
  [(PXPhotosDetailsActionsTilingLayout *)self rowHeight];
  double v20 = v19;
  double v21 = v8;
  double v22 = v16;
  double v23 = v18;
  result.size.height = v20;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)_contentWidth
{
  [(PXPhotosDetailsActionsTilingLayout *)self contentBounds];
  double v4 = v3;
  [(PXTilingLayout *)self contentInset];
  double v6 = v4 - v5;
  [(PXTilingLayout *)self contentInset];
  return v6 - v7;
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  if (a6->length - 3 > 2) {
    return 0;
  }
  unint64_t v6 = a6->index[1];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 != self->_dataSourceIdentifier) {
    return 0;
  }
  unint64_t v11 = a6->index[0];
  unint64_t v12 = a6->index[2];
  if (v11 == 6200435)
  {
    [(PXPhotosDetailsActionsTilingLayout *)self _frameForSeparatorAtIndex:v12];
  }
  else
  {
    if (v11 != 6200434)
    {
      double v16 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v12);
      long long v17 = *(_OWORD *)&a6->index[5];
      v20[2] = *(_OWORD *)&a6->index[3];
      v20[3] = v17;
      v20[4] = *(_OWORD *)&a6->index[7];
      unint64_t v21 = a6->index[9];
      long long v18 = *(_OWORD *)&a6->index[1];
      v20[0] = *(_OWORD *)&a6->length;
      v20[1] = v18;
      double v19 = PXTileIdentifierDescription((unint64_t *)v20);
      [v16 handleFailureInMethod:a2, self, @"PXPhotosDetailsActionsTilingLayout.m", 101, @"Unexpected tile kind:%@", v19 object file lineNumber description];

      abort();
    }
    [(PXPhotosDetailsActionsTilingLayout *)self _frameForItemAtIndex:v12];
  }
  if (a3)
  {
    [(PXTilingLayout *)self coordinateSpaceIdentifier];
    PXRectGetCenter();
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  return 1;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v28 = a5;
  int64_t dataSourceIdentifier = self->_dataSourceIdentifier;
  long long v7 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v62 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v63 = v7;
  long long v8 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v64 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v65 = v8;
  long long v9 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v58 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v59 = v9;
  long long v10 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v60 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v61 = v10;
  long long v11 = *((_OWORD *)off_1E5DAB048 + 1);
  long long v54 = *(_OWORD *)off_1E5DAB048;
  long long v55 = v11;
  long long v12 = *((_OWORD *)off_1E5DAB048 + 3);
  int64x2_t v56 = *((int64x2_t *)off_1E5DAB048 + 2);
  long long v57 = v12;
  uint64_t v53 = 0;
  char v52 = 0;
  id v13 = 0;
  if ([(PXPhotosDetailsActionsTilingLayout *)self shouldShowSeparators])
  {
    uint64_t v14 = [(PXPhotosDetailsActionsTilingLayout *)self _numberOfSeparators];
    if (v14 < 1)
    {
      id v13 = 0;
    }
    else
    {
      uint64_t v15 = v14;
      id v13 = 0;
      v26 = v28 + 2;
      int64x2_t v29 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      uint64_t v16 = 1;
      do
      {
        long long v17 = v13;
        id v51 = 0;
        long long v32 = xmmword_1AB359CA0;
        *(void *)&long long v33 = dataSourceIdentifier;
        *((void *)&v33 + 1) = v16 - 1;
        int64x2_t v34 = v29;
        long long v35 = 0u;
        long long v36 = 0u;
        *(void *)&long long v37 = 0;
        BOOL v18 = -[PXPhotosDetailsActionsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v54, &v53, &v51, &v32, v26);
        id v13 = v51;

        if (v18)
        {
          double v19 = (void (*)(void *, long long *, long long *, uint64_t, id, char *))v28[2];
          int64_t v45 = dataSourceIdentifier;
          uint64_t v46 = v16 - 1;
          int64x2_t v47 = v29;
          long long v48 = 0u;
          long long v49 = 0u;
          uint64_t v50 = 0;
          long long v40 = v62;
          long long v41 = v63;
          long long v42 = v64;
          long long v43 = v65;
          long long v44 = xmmword_1AB359CA0;
          long long v36 = v58;
          long long v37 = v59;
          long long v38 = v60;
          long long v39 = v61;
          long long v32 = v54;
          long long v33 = v55;
          int64x2_t v34 = v56;
          long long v35 = v57;
          v19(v28, &v44, &v32, v53, v13, &v52);
        }
        if (v16 >= v15) {
          break;
        }
        ++v16;
      }
      while (!v52);
    }
  }
  uint64_t v20 = [(PXPhotosDetailsActionsTilingLayout *)self numberOfItems];
  if (v20 >= 1 && !v52)
  {
    uint64_t v21 = v20;
    v27 = v28 + 2;
    uint64_t v22 = 1;
    int64x2_t v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    do
    {
      double v23 = v13;
      uint64_t v68 = 0;
      long long v66 = 0u;
      long long v67 = 0u;
      id v31 = 0;
      long long v32 = xmmword_1AB359CB0;
      *(void *)&long long v33 = dataSourceIdentifier;
      *((void *)&v33 + 1) = v22 - 1;
      int64x2_t v34 = v30;
      long long v35 = 0u;
      long long v36 = 0u;
      *(void *)&long long v37 = 0;
      BOOL v24 = -[PXPhotosDetailsActionsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v54, &v53, &v31, &v32, v27);
      id v13 = v31;

      if (v24)
      {
        v25 = (void (*)(void *, long long *, long long *, uint64_t, id, char *))v28[2];
        int64_t v45 = dataSourceIdentifier;
        uint64_t v46 = v22 - 1;
        int64x2_t v47 = v30;
        long long v48 = v66;
        long long v49 = v67;
        uint64_t v50 = v68;
        long long v40 = v62;
        long long v41 = v63;
        long long v42 = v64;
        long long v43 = v65;
        long long v44 = xmmword_1AB359CB0;
        long long v36 = v58;
        long long v37 = v59;
        long long v38 = v60;
        long long v39 = v61;
        long long v32 = v54;
        long long v33 = v55;
        int64x2_t v34 = v56;
        long long v35 = v57;
        v25(v28, &v44, &v32, v53, v13, &v52);
      }
      if (v22 >= v21) {
        break;
      }
      ++v22;
    }
    while (!v52);
  }
}

- (CGRect)contentBounds
{
  uint64_t v3 = [(PXPhotosDetailsActionsTilingLayout *)self numberOfItems];
  [(PXTilingLayout *)self referenceSize];
  double v5 = v4;
  double v6 = (double)[(PXPhotosDetailsActionsTilingLayout *)self _numberOfSeparators];
  [(PXPhotosDetailsActionsTilingLayout *)self separatorHeight];
  if (v7 * v6 == 0.0) {
    double v8 = 0.0;
  }
  else {
    double v8 = (double)[(PXPhotosDetailsActionsTilingLayout *)self shouldShowSeparators];
  }
  [(PXPhotosDetailsActionsTilingLayout *)self interItemSpacing];
  double v10 = v9 * (double)(v3 - 1);
  [(PXPhotosDetailsActionsTilingLayout *)self rowHeight];
  double v12 = v10 + v8 + (double)v3 * v11;
  [(PXTilingLayout *)self contentInset];
  double v14 = v13;
  [(PXTilingLayout *)self contentInset];
  double v16 = v12 + v14 + v15;
  double v17 = 0.0;
  double v18 = 0.0;
  double v19 = v5;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)prepareLayout
{
  v2.receiver = self;
  v2.super_class = (Class)PXPhotosDetailsActionsTilingLayout;
  [(PXTilingLayout *)&v2 prepareLayout];
}

- (PXPhotosDetailsActionsTilingLayout)initWithNumberOfItems:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsActionsTilingLayout;
  double v4 = [(PXTilingLayout *)&v7 init];
  if (v4)
  {
    v4->_numberOfItems = a3;
    if (a3 > 0) {
      int64_t v5 = a3 + 1;
    }
    else {
      int64_t v5 = 0;
    }
    v4->__numberOfSeparators = v5;
    sub_1AB2347DC();
  }
  return 0;
}

@end