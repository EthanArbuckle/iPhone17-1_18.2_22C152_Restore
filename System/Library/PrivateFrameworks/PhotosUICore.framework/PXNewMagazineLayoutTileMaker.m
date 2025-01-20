@interface PXNewMagazineLayoutTileMaker
- (BOOL)_findNextTileWithInputs:(id)a3 atIndex:(unint64_t)a4 baseIndex:(unint64_t)a5 coordinator:(id)a6;
- (BOOL)_generateNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 maxY:(unint64_t)a5 reserveNumberForPadding:(unint64_t)a6 context:(id)a7;
- (BOOL)_isSameRectsArray:(id)a3 otherArray:(id)a4;
- (BOOL)checkAndPrintResults:(BOOL)a3;
- (BOOL)convertRects:(PXMagazineRect *)a3 outFrames:(CGRect *)a4 count:(unint64_t)a5 forReferenceSize:(CGSize)a6;
- (BOOL)layoutFromRightToLeft;
- (CGRect)_frameFromTileFrame:(PXMagazineRect *)a3;
- (CGSize)defaultTileSize;
- (CGSize)referenceSize;
- (PXNewMagazineLayoutTileMaker)initWithReferenceSize:(CGSize)a3 numberOfColumns:(unint64_t)a4;
- (double)_normalizeWeightsByInputs:(id)a3;
- (double)height;
- (double)interTileSpacing;
- (double)tileAspectRatio;
- (id)_generateLastTilesWithInputs:(id)a3 baseIndex:(unint64_t)a4 returnFallback:(BOOL)a5;
- (id)_generateTilesWithInputs:(id)a3;
- (id)_getAllFramesInOrder;
- (id)description;
- (int64_t)_availableFrames:(id *)a3 maxReturnCount:(unint64_t)a4 forAspectRatio:(double)a5 weight:(double)a6 maxWidth:(unint64_t)a7;
- (unint64_t)_numberOfInputsForLastPadding;
- (unint64_t)getMagazineRects:(PXMagazineRect *)a3 withInputs:(id)a4;
- (unint64_t)maxTilesInFrame;
- (unint64_t)numberOfColumns;
- (void)_findNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 context:(id)a5;
- (void)_getFrames:(CGRect *)a3 magazineRects:(PXMagazineRect *)a4 withInputs:(id)a5;
- (void)_resetWithNumberOfAssets:(unint64_t)a3;
- (void)_setRandomSeedWithInputs:(id)a3;
- (void)_updateDimensionInfos;
- (void)dealloc;
- (void)getFrames:(CGRect *)a3 withInputs:(id)a4;
- (void)setInterTileSpacing:(double)a3;
- (void)setLayoutFromRightToLeft:(BOOL)a3;
- (void)setMaxTilesInFrame:(unint64_t)a3;
@end

@implementation PXNewMagazineLayoutTileMaker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTempArray, 0);
  objc_storeStrong((id *)&self->_allFrames, 0);
  objc_storeStrong((id *)&self->_cachedTileRects, 0);
}

- (void)setLayoutFromRightToLeft:(BOOL)a3
{
  self->_layoutFromRightToLeft = a3;
}

- (BOOL)layoutFromRightToLeft
{
  return self->_layoutFromRightToLeft;
}

- (void)setMaxTilesInFrame:(unint64_t)a3
{
  self->_maxTilesInFrame = a3;
}

- (unint64_t)maxTilesInFrame
{
  return self->_maxTilesInFrame;
}

- (double)interTileSpacing
{
  return self->_interTileSpacing;
}

- (CGSize)defaultTileSize
{
  double width = self->_defaultTileSize.width;
  double height = self->_defaultTileSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)height
{
  return self->_height;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)tileAspectRatio
{
  return self->_tileAspectRatio;
}

- (BOOL)checkAndPrintResults:(BOOL)a3
{
  return self->_isPerfectEnding;
}

- (int64_t)_availableFrames:(id *)a3 maxReturnCount:(unint64_t)a4 forAspectRatio:(double)a5 weight:(double)a6 maxWidth:(unint64_t)a7
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_sharedTempArray removeAllObjects];
  v11 = self->_sharedTempArray;
  if (1.0 / a5 <= a5) {
    double v12 = a5;
  }
  else {
    double v12 = 1.0 / a5;
  }
  v13 = [(PXNewMagazineLayoutTileMaker *)self _getAllFramesInOrder];
  if (![v13 count])
  {
    v71 = [MEMORY[0x1E4F28B00] currentHandler];
    [v71 handleFailureInMethod:a2 object:self file:@"PXNewMagazineLayoutTileMaker.m" lineNumber:706 description:@"We should never have no frames"];
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v89 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        [v19 aspectRatio];
        double v21 = v20;
        [v19 minAspectRatio];
        double v23 = v22;
        [v19 maxAspectRatio];
        double v25 = v24;
        unint64_t v26 = [v19 width];
        uint64_t v27 = [v19 height];
        if (v26 <= a7
          && v27 * v26 <= self->_maxTilesInFrame
          && (self->_startLastPadding || ((v26 | v27) & 1) == 0))
        {
          BOOL v28 = a5 <= 0.402;
          if (v21 >= 0.801) {
            BOOL v28 = 0;
          }
          BOOL v29 = v21 > 1.334 || v21 < 0.8;
          double v30 = v12 + -1.0;
          BOOL v31 = v29 || v12 + -1.0 > 0.15;
          if (!v31 || v28) {
            goto LABEL_39;
          }
          if (v23 > a5) {
            goto LABEL_42;
          }
          double v30 = 0.9;
          if (a5 >= 0.9 && v26 == 2 && v27 == 2) {
            goto LABEL_39;
          }
          BOOL v32 = v26 == 2 && a5 < 0.9;
          if (v32 && v27 == 4) {
            goto LABEL_39;
          }
          if (v25 >= a5)
          {
            double v30 = 0.9;
            BOOL v33 = v21 < 0.9;
            if (a5 < 0.9) {
              BOOL v33 = v21 >= 1.1;
            }
            if (!v33) {
LABEL_39:
            }
              -[NSMutableArray addObject:](v11, "addObject:", v19, v30);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v16);
  }
LABEL_42:

  BOOL v34 = 1;
  if (a5 > 0.402 && a5 < 2.3 && a6 < 0.66) {
    BOOL v34 = [(PXNewMagazineLayoutTileMaker *)self numberOfColumns] >= 4 && rand() % 10 > 4;
  }
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __95__PXNewMagazineLayoutTileMaker__availableFrames_maxReturnCount_forAspectRatio_weight_maxWidth___block_invoke;
  v86[3] = &__block_descriptor_41_e51_q24__0__PXNewMagazineFrame_8__PXNewMagazineFrame_16l;
  *(double *)&v86[4] = a5;
  BOOL v87 = v34;
  [(NSMutableArray *)v11 sortUsingComparator:v86];
  v35 = +[PXPhotosDetailsSettings sharedInstance];
  int v36 = [v35 editorialLayoutAvoidSmallestTile];

  unint64_t v37 = [(PXNewMagazineLayoutTileMaker *)self numberOfColumns];
  if (v36)
  {
    unint64_t v38 = v37;
    if ((unint64_t)[(NSMutableArray *)v11 count] >= 3)
    {
      unint64_t v39 = 2 * v38;
      v40 = [MEMORY[0x1E4F1CA48] array];
      v41 = [(NSMutableArray *)v11 firstObject];
      v42 = v41;
      if (a5 < 2.3)
      {
        if ([v41 width] != v39 || v34 && rand() % 100 < 6)
        {
          v43 = 0;
        }
        else
        {
          [(NSMutableArray *)v11 removeObjectAtIndex:0];
          [(NSMutableArray *)v11 firstObject];
          v42 = v43 = v42;
        }
        if (v39 >= 7 && v42)
        {
          unint64_t v75 = v39;
          v76 = v43;
          unint64_t v44 = 0;
          unint64_t v45 = v39 - 2;
          char v46 = 1;
          while ([v42 width] == v45)
          {
            if (rand() % 100 < 51)
            {
              ++v44;
            }
            else
            {
              [(NSMutableArray *)v11 removeObjectAtIndex:v44];
              [v40 addObject:v42];
            }
            if (v44 >= [(NSMutableArray *)v11 count])
            {

              v42 = 0;
              break;
            }
            uint64_t v47 = [(NSMutableArray *)v11 objectAtIndex:v44];

            char v48 = v46 & (v47 != 0);
            v42 = (void *)v47;
            char v46 = 0;
            if ((v48 & 1) == 0)
            {
              v42 = (void *)v47;
              break;
            }
          }
          unint64_t v39 = v75;
          v43 = v76;
        }
      }
      else
      {
        v43 = 0;
      }
      if ([v42 width] == 2
        && ([v42 height] == 2 || objc_msgSend(v42, "height") == 4)
        && (v39 >= 7 && [v42 height] == 4 || rand() % 100 <= 89))
      {
        [(NSMutableArray *)v11 removeObjectAtIndex:0];
        id v49 = v42;
        if (v43) {
          goto LABEL_78;
        }
      }
      else
      {
        id v49 = 0;
        if (v43) {
          goto LABEL_78;
        }
      }
      uint64_t v63 = [v40 count];
      if (!v49 && !v63) {
        goto LABEL_107;
      }
LABEL_78:
      if ((unint64_t)[(NSMutableArray *)v11 count] < 2)
      {
        uint64_t v50 = [(NSMutableArray *)v11 count];
        if (!v40) {
          goto LABEL_90;
        }
      }
      else
      {
        [(PXNewMagazineLayoutTileMaker *)self numberOfColumns];
        uint64_t v50 = 2;
        if (!v40) {
          goto LABEL_90;
        }
      }
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v77 = v40;
      id v51 = v40;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v82 objects:v93 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v83;
        do
        {
          for (uint64_t j = 0; j != v53; ++j)
          {
            if (*(void *)v83 != v54) {
              objc_enumerationMutation(v51);
            }
            [(NSMutableArray *)v11 insertObject:*(void *)(*((void *)&v82 + 1) + 8 * j) atIndex:v50 + j];
          }
          v50 += j;
          uint64_t v53 = [v51 countByEnumeratingWithState:&v82 objects:v93 count:16];
        }
        while (v53);
      }

      v40 = v77;
LABEL_90:
      if (v43 && v49)
      {
        int v56 = rand();
        if (v56 % 10) {
          v57 = v49;
        }
        else {
          v57 = v43;
        }
        if (v56 % 10) {
          v58 = v43;
        }
        else {
          v58 = v49;
        }
        id v59 = v57;

        id v60 = v58;
        [(NSMutableArray *)v11 insertObject:v59 atIndex:v50];
        [(NSMutableArray *)v11 insertObject:v60 atIndex:v50 + 1];

        v42 = v59;
        goto LABEL_107;
      }
      if (v43)
      {
        v61 = v11;
        id v62 = v43;
      }
      else
      {
        if (!v49)
        {
LABEL_107:

          goto LABEL_108;
        }
        v61 = v11;
        id v62 = v49;
      }
      [(NSMutableArray *)v61 insertObject:v62 atIndex:v50];
      goto LABEL_107;
    }
  }
LABEL_108:
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v64 = v11;
  uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v78 objects:v92 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    int64_t v67 = 0;
    uint64_t v68 = *(void *)v79;
    while (2)
    {
      for (uint64_t k = 0; k != v66; ++k)
      {
        if (*(void *)v79 != v68) {
          objc_enumerationMutation(v64);
        }
        *(&a3[v67] + k) = *(id *)(*((void *)&v78 + 1) + 8 * k);
        if (v67 + k + 1 >= a4)
        {
          v67 += k + 1;
          goto LABEL_119;
        }
      }
      v67 += k;
      uint64_t v66 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v78 objects:v92 count:16];
      if (v66) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v67 = 0;
  }
LABEL_119:

  return v67;
}

uint64_t __95__PXNewMagazineLayoutTileMaker__availableFrames_maxReturnCount_forAspectRatio_weight_maxWidth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 aspectRatio];
  double v8 = *(double *)(a1 + 32);
  if (v8 < v7)
  {
    double v8 = 1.0 / v8;
    double v7 = 1.0 / v7;
  }
  double v9 = (v8 - v7) / v8;
  [v6 aspectRatio];
  double v11 = *(double *)(a1 + 32);
  if (v11 < v10)
  {
    double v11 = 1.0 / v11;
    double v10 = 1.0 / v10;
  }
  double v12 = (v11 - v10) / v11;
  double v13 = v9 - v12;
  if (v9 - v12 < 0.0) {
    double v13 = -(v9 - v12);
  }
  if (v13 >= 0.06)
  {
    if (v9 <= v12)
    {
      if (v9 >= v12) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = -1;
      }
    }
    else
    {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v14 = [v5 numberOfTiles];
    if (v14 <= [v6 numberOfTiles]) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = 1;
    }
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v16 = -v15;
    }
    else {
      uint64_t v16 = v15;
    }
  }

  return v16;
}

- (id)_getAllFramesInOrder
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  allFrames = self->_allFrames;
  if (!allFrames || ![(NSMutableArray *)allFrames count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_allFrames;
    self->_allFrames = v4;

    unint64_t v6 = [(PXNewMagazineLayoutTileMaker *)self numberOfColumns];
    double tileAspectRatio = self->_tileAspectRatio;
    unint64_t v8 = [(PXNewMagazineLayoutTileMaker *)self numberOfColumns];
    unint64_t numberOfColumns = self->_numberOfColumns;
    if (numberOfColumns >= 2)
    {
      float v10 = tileAspectRatio * (double)v6;
      float v11 = roundf(v10);
      unint64_t v12 = (unint64_t)(float)(v11 + v11);
      unint64_t v13 = 2 * v8 * v12;
      unint64_t v14 = 2;
      uint64_t v15 = 4;
      double v16 = 1.25;
      do
      {
        if (v12 >= 2)
        {
          unint64_t v17 = v15;
          for (unint64_t i = 2; i <= v12; ++i)
          {
            if (v17 <= v13)
            {
              double v19 = self->_tileAspectRatio * (double)v14 / (double)i;
              if (v19 <= self->_maxFrameAspectRatio && v19 >= self->_minFrameAspectRatio)
              {
                double v20 = [[PXNewMagazineFrame alloc] initWithWidth:v14 height:i];
                [(PXNewMagazineFrame *)v20 setAspectRatio:v19];
                double v21 = v19 + -1.0;
                if (v19 + -1.0 < 0.0) {
                  double v21 = -(v19 + -1.0);
                }
                if (v19 < 2.3 && v19 > 0.402) {
                  double v23 = 1.35;
                }
                else {
                  double v23 = v16;
                }
                if (v21 >= 0.112) {
                  double v24 = v23;
                }
                else {
                  double v24 = 1.6;
                }
                -[PXNewMagazineFrame setMinAspectRatio:](v20, "setMinAspectRatio:", v19 / v24, v23);
                double v25 = v19 * v24;
                double v16 = 1.25;
                [(PXNewMagazineFrame *)v20 setMaxAspectRatio:v25];
                if (v19 >= 2.3)
                {
                  [(PXNewMagazineFrame *)v20 setMinAspectRatio:fmin(v19 / 1.25, 2.3)];
                  [(PXNewMagazineFrame *)v20 setMaxAspectRatio:1000.0];
                }
                if (v19 <= 0.402)
                {
                  [(PXNewMagazineFrame *)v20 setMinAspectRatio:0.0];
                  double v26 = v19 * 1.25;
                  if (v19 * 1.25 < 0.402) {
                    double v26 = 0.402;
                  }
                  [(PXNewMagazineFrame *)v20 setMaxAspectRatio:v26];
                }
                [(NSMutableArray *)self->_allFrames addObject:v20];
              }
            }
            v17 += v14;
          }
          unint64_t numberOfColumns = self->_numberOfColumns;
        }
        ++v14;
        v15 += 2;
      }
      while (v14 <= numberOfColumns);
    }
    [(NSMutableArray *)self->_allFrames sortUsingComparator:&__block_literal_global_194373];
    uint64_t v27 = [(NSMutableArray *)self->_allFrames objectAtIndexedSubscript:0];
    [v27 aspectRatio];
    double v29 = v28;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    double v30 = self->_allFrames;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v54;
LABEL_33:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v54 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v53 + 1) + 8 * v34);
        [v35 aspectRatio];
        if (v36 > v29) {
          break;
        }
        [v35 setMinAspectRatio:0.0];
        if (v32 == ++v34)
        {
          uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v53 objects:v58 count:16];
          if (v32) {
            goto LABEL_33;
          }
          break;
        }
      }
    }

    unint64_t v37 = [(NSMutableArray *)self->_allFrames lastObject];
    [v37 aspectRatio];
    double v39 = v38;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v40 = [(NSMutableArray *)self->_allFrames reverseObjectEnumerator];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v50;
LABEL_41:
      uint64_t v44 = 0;
      while (1)
      {
        if (*(void *)v50 != v43) {
          objc_enumerationMutation(v40);
        }
        unint64_t v45 = *(void **)(*((void *)&v49 + 1) + 8 * v44);
        [v45 aspectRatio];
        if (v46 < v39) {
          break;
        }
        [v45 setMaxAspectRatio:1000.0];
        if (v42 == ++v44)
        {
          uint64_t v42 = [v40 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v42) {
            goto LABEL_41;
          }
          break;
        }
      }
    }
  }
  uint64_t v47 = self->_allFrames;
  return v47;
}

uint64_t __52__PXNewMagazineLayoutTileMaker__getAllFramesInOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 aspectRatio];
  double v6 = v5;
  [v4 aspectRatio];
  double v8 = v7;

  if (v6 >= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 > v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (CGRect)_frameFromTileFrame:(PXMagazineRect *)a3
{
  double width = self->_defaultTileSize.width;
  double interTileSpacing = self->_interTileSpacing;
  double v5 = width + interTileSpacing;
  int64_t var0 = a3->var1.var0;
  double v7 = interTileSpacing * (double)(var0 - 1) + width * (double)var0;
  double lastTileWidthPadding = 0.0;
  if (var0 + a3->var0.var0 == self->_numberOfColumns) {
    double lastTileWidthPadding = self->_lastTileWidthPadding;
  }
  double v9 = v5 * (double)a3->var0.var0;
  double height = self->_defaultTileSize.height;
  double v11 = v7 + lastTileWidthPadding;
  if (self->_layoutFromRightToLeft) {
    double v9 = self->_referenceSize.width - v9 - v11;
  }
  double v12 = interTileSpacing * (double)(a3->var1.var1 - 1) + height * (double)a3->var1.var1;
  double v13 = (interTileSpacing + height) * (double)a3->var0.var1;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.y = v13;
  result.origin.x = v9;
  return result;
}

- (BOOL)_findNextTileWithInputs:(id)a3 atIndex:(unint64_t)a4 baseIndex:(unint64_t)a5 coordinator:(id)a6
{
  double v7 = self;
  unint64_t v8 = a5;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  [a3 objectAtIndexedSubscript:a4];
  [(id)objc_claimAutoreleasedReturnValue() size];
  PXSizeGetAspectRatio();
}

- (id)_generateLastTilesWithInputs:(id)a3 baseIndex:(unint64_t)a4 returnFallback:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  self->_startLastPadding = 1;
  uint64_t v9 = [PXNewMagazineLayoutCoordinator alloc];
  uint64_t v10 = -[PXNewMagazineGrid initWithNumberOfColumns:size:]([PXNewMagazineGrid alloc], "initWithNumberOfColumns:size:", self->_numberOfColumns, [v8 count]);
  uint64_t v11 = [(PXNewMagazineLayoutCoordinator *)v9 initWithPaddingInputs:v8 tileGrid:v10 tileAspectRatio:0 stopIfAnyGoodLayout:self->_tileAspectRatio];

  if ([(PXNewMagazineLayoutTileMaker *)self _findNextTileWithInputs:v8 atIndex:0 baseIndex:a4 coordinator:v11])
  {
    goto LABEL_4;
  }
  [(id)objc_opt_class() printInputs:v8];
  if (v5)
  {
    uint64_t v12 = [PXNewMagazineLayoutCoordinator alloc];
    double v13 = -[PXNewMagazineGrid initWithNumberOfColumns:size:]([PXNewMagazineGrid alloc], "initWithNumberOfColumns:size:", self->_numberOfColumns, [v8 count]);
    uint64_t v14 = [(PXNewMagazineLayoutCoordinator *)v12 initWithPaddingInputs:v8 tileGrid:v13 tileAspectRatio:1 stopIfAnyGoodLayout:self->_tileAspectRatio];

    [(PXNewMagazineLayoutTileMaker *)self _findNextTileWithInputs:v8 atIndex:0 baseIndex:a4 coordinator:v14];
    uint64_t v11 = (PXNewMagazineLayoutCoordinator *)v14;
LABEL_4:
    uint64_t v15 = [(PXNewMagazineLayoutCoordinator *)v11 currentBestLayout];
    goto LABEL_6;
  }
  uint64_t v15 = 0;
LABEL_6:

  return v15;
}

- (BOOL)_generateNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 maxY:(unint64_t)a5 reserveNumberForPadding:(unint64_t)a6 context:(id)a7
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a7;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  [v9 objectAtIndexedSubscript:a4];
  [(id)objc_claimAutoreleasedReturnValue() size];
  PXSizeGetAspectRatio();
}

- (void)_findNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 context:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = +[PXPhotosDetailsSettings sharedInstance];
  uint64_t v10 = [v9 editorialLayoutTargetRowsForChunk];
  if ([(PXNewMagazineLayoutTileMaker *)self numberOfColumns] <= 3) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v10 + 1;
  }

  if (![(PXNewMagazineLayoutTileMaker *)self _generateNextChunkWithInputs:v14 fromIndex:a4 maxY:2 * v11 reserveNumberForPadding:0 context:v8])
  {
    [v8 setFallbackRectArray:0];
    if (![(PXNewMagazineLayoutTileMaker *)self _generateNextChunkWithInputs:v14 fromIndex:a4 maxY:4 * v11 reserveNumberForPadding:0 context:v8])
    {
      unint64_t v12 = [(PXNewMagazineLayoutTileMaker *)self _numberOfInputsForLastPadding];
      [v8 setFallbackRectArray:0];
      if (![(PXNewMagazineLayoutTileMaker *)self _generateNextChunkWithInputs:v14 fromIndex:a4 maxY:-1 reserveNumberForPadding:v12 context:v8])
      {
        [v8 setFallbackRectArray:0];
        uint64_t v13 = [v8 outRectArray];
        [v13 reset];
      }
    }
  }
}

- (id)_generateTilesWithInputs:(id)a3
{
  id v33 = a3;
  unint64_t v4 = [v33 count];
  BOOL v5 = [PXNewMagazineRectArray alloc];
  double v6 = [[PXNewMagazineGrid alloc] initWithNumberOfColumns:self->_numberOfColumns size:50];
  double v7 = [(PXNewMagazineRectArray *)v5 initWithSize:50 tileGrid:v6];

  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = objc_opt_new();
  [v9 setGeneratedChunks:v8];
  [v9 setOutRectArray:v7];
  [v9 setFallbackRectArray:0];
  unint64_t v32 = [(PXNewMagazineLayoutTileMaker *)self _numberOfInputsForLastPadding];
  if (v4)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    unint64_t maxTilesInFrame = self->_maxTilesInFrame;
    while (1)
    {
      uint64_t v13 = [v9 outRectArray];
      [v13 reset];

      [v9 setFallbackRectArray:0];
      [(PXNewMagazineLayoutTileMaker *)self _findNextChunkWithInputs:v33 fromIndex:v12 context:v9];
      if (![(PXNewMagazineRectArray *)v7 count])
      {
        id v14 = [v9 fallbackRectArray];

        if (!v14) {
          break;
        }
      }
      if (v11)
      {
        if (![(PXNewMagazineRectArray *)v7 count])
        {
          unint64_t v15 = v4 - v12;
          if (v4 - v12 < v32) {
            goto LABEL_17;
          }
        }
      }
      if ([(PXNewMagazineRectArray *)v7 count]) {
        uint64_t v11 = 0;
      }
      else {
        ++v11;
      }
      if ([(PXNewMagazineRectArray *)v7 count]) {
        [(PXNewMagazineRectArray *)v7 immutableCopyForCurrentRectsCount];
      }
      else {
      double v16 = [v9 fallbackRectArray];
      }
      unint64_t v17 = [[PXNewMagazineChunk alloc] initWithStartY:v10 startIndexOfInputs:v12 rectsArray:v16];
      [v8 addObject:v17];
      v10 += [(PXNewMagazineChunk *)v17 height];
      v12 += [v16 count];

      if (v12 >= v4) {
        goto LABEL_27;
      }
    }
    unint64_t v15 = v4 - v12;
LABEL_17:
    self->_unint64_t maxTilesInFrame = maxTilesInFrame;
    v18 = objc_msgSend(v33, "subarrayWithRange:", v12, v15);
    if (v12) {
      BOOL v19 = v15 >= v32;
    }
    else {
      BOOL v19 = 1;
    }
    uint64_t v20 = v19;
    uint64_t v21 = [(PXNewMagazineLayoutTileMaker *)self _generateLastTilesWithInputs:v18 baseIndex:v12 returnFallback:v20];
    if (v21)
    {
      double v22 = (void *)v21;
      double v23 = [[PXNewMagazineChunk alloc] initWithStartY:v10 startIndexOfInputs:v12 rectsArray:v21];
      [v8 addObject:v23];
    }
    else
    {
      if (v20) {
        goto LABEL_26;
      }
      [v8 count];
      while (1)
      {
        double v25 = v18;
        double v23 = [v8 lastObject];
        [v8 removeLastObject];
        uint64_t v26 = [(PXNewMagazineChunk *)v23 startIndexOfInputs];
        v18 = objc_msgSend(v33, "subarrayWithRange:", v26, v4 - v26);

        BOOL v27 = !v26 || v4 - v26 >= v32;
        BOOL v28 = v27;
        uint64_t v29 = [(PXNewMagazineLayoutTileMaker *)self _generateLastTilesWithInputs:v18 baseIndex:v26 returnFallback:v28];
        if (v29) {
          break;
        }

        if (!v26) {
          goto LABEL_26;
        }
      }
      double v22 = (void *)v29;
      double v30 = [[PXNewMagazineChunk alloc] initWithStartY:[(PXNewMagazineChunk *)v23 startY] startIndexOfInputs:v26 rectsArray:v29];
      [v8 addObject:v30];
    }
LABEL_26:
  }
LABEL_27:

  return v8;
}

- (unint64_t)_numberOfInputsForLastPadding
{
  if ([(PXNewMagazineLayoutTileMaker *)self numberOfColumns] < 5) {
    return 9;
  }
  else {
    return 10;
  }
}

- (BOOL)_isSameRectsArray:(id)a3 otherArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = ([v5 isEqualToRectArray:v6] & 1) != 0
    || [v5 count] == 1 && objc_msgSend(v6, "count") == 1;

  return v7;
}

- (void)_resetWithNumberOfAssets:(unint64_t)a3
{
  allFrames = self->_allFrames;
  self->_allFrames = 0;

  self->_startLastPadding = 0;
}

- (void)_updateDimensionInfos
{
  double width = self->_referenceSize.width;
  unint64_t numberOfColumns = self->_numberOfColumns;
  double interTileSpacing = self->_interTileSpacing;
  CGFloat v5 = (width - (double)(numberOfColumns - 1) * interTileSpacing) / (double)numberOfColumns;
  CGFloat v6 = v5 / self->_tileAspectRatio;
  self->_defaultTileSize.double width = v5;
  self->_defaultTileSize.double height = v6;
  self->_double lastTileWidthPadding = width - -(interTileSpacing - (interTileSpacing + v5) * (double)numberOfColumns);
}

- (void)_setRandomSeedWithInputs:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    v3 = [v6 objectAtIndexedSubscript:0];
    [v3 size];
    double v5 = v4;

    srand(v5);
  }
}

- (double)_normalizeWeightsByInputs:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = v3;
  if (v3 && [v3 count])
  {
    double v5 = (double *)malloc_type_calloc([v4 count], 8uLL, 0x100004000313F17uLL);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      double v10 = 0.0;
      double v11 = 1.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * i) weight];
          if (v13 > v10) {
            double v10 = v13;
          }
          if (v13 < v11) {
            double v11 = v13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = 0.0;
      double v11 = 1.0;
    }

    if (v10 - v11 >= 0.0) {
      double v14 = v10 - v11;
    }
    else {
      double v14 = -(v10 - v11);
    }
    if (v14 < 0.01)
    {
      unint64_t v15 = PLUIGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        double v35 = v11;
        __int16 v36 = 2048;
        double v37 = v10;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, "No weights !!!  %.3f ~ %.3f", buf, 0x16u);
      }

      double v11 = 1.0;
      double v10 = 1.0;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v16);
          }
          double v22 = v10;
          if (v14 >= 0.01)
          {
            objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "weight", v10, (void)v25);
            double v22 = v11 + (v23 - v11) * ((1.0 - v11) / (v10 - v11));
            if (v22 > 1.0) {
              double v22 = 1.0;
            }
          }
          v5[v19 + j] = v22;
        }
        v19 += j;
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)_getFrames:(CGRect *)a3 magazineRects:(PXMagazineRect *)a4 withInputs:(id)a5
{
  id v9 = a5;
  if (self->_normalizedWeights)
  {
    long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PXNewMagazineLayoutTileMaker.m" lineNumber:204 description:@"normalizedWeights Memory leak."];
  }
  -[PXNewMagazineLayoutTileMaker _resetWithNumberOfAssets:](self, "_resetWithNumberOfAssets:", [v9 count]);
  [(PXNewMagazineLayoutTileMaker *)self _setRandomSeedWithInputs:v9];
  double v10 = [(PXNewMagazineLayoutTileMaker *)self _normalizeWeightsByInputs:v9];
  self->_normalizedWeights = v10;
  if (!v10)
  {
    long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PXNewMagazineLayoutTileMaker.m" lineNumber:208 description:@"Allocate normalizedWeights memory faill."];
  }
  self->_isPerfectEnding = 0;
  double v11 = [(PXNewMagazineLayoutTileMaker *)self _generateTilesWithInputs:v9];
  if ([v11 count])
  {
    unint64_t v12 = [v11 lastObject];
    double v13 = [v12 rectsArray];
    self->_isPerfectEnding = [v13 isPerfectEnding];
  }
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    double v35 = v9;
    if ([v11 count])
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      p_size = &a3->size;
      id v33 = v11;
      CGFloat MaxY = 0.0;
      do
      {
        uint64_t v17 = objc_msgSend(v11, "objectAtIndex:", v15, p_size);
        uint64_t v18 = [v17 rectsArray];
        if ([v18 count])
        {
          unint64_t v34 = v15;
          unint64_t v19 = 0;
          uint64_t v20 = &a4[v14];
          p_double width = (void *)&p_size[2 * v14].width;
          do
          {
            PXMagazineOrigin v37 = (PXMagazineOrigin)0;
            PXMagazineSize v38 = (PXMagazineSize)0;
            if (v18) {
              [v18 rectAtIndex:v19];
            }
            uint64_t v22 = [v17 startY];
            v37.var1 += v22;
            if (a4)
            {
              PXMagazineSize v23 = v38;
              v20->int64_t var0 = v37;
              v20->var1 = v23;
            }
            if (a3)
            {
              v36[0] = v37;
              v36[1] = v38;
              [(PXNewMagazineLayoutTileMaker *)self _frameFromTileFrame:v36];
              *(p_width - 2) = v24;
              *(p_width - 1) = v25;
              *p_double width = v26;
              p_width[1] = v27;
              unint64_t v28 = v14 + v19 + self->_numberOfColumns;
              if (v28 >= [v35 count] && CGRectGetMaxY(*(CGRect *)(p_width - 2)) > MaxY) {
                CGFloat MaxY = CGRectGetMaxY(*(CGRect *)(p_width - 2));
              }
            }
            ++v19;
            ++v20;
            p_width += 4;
          }
          while (v19 < [v18 count]);
          v14 += v19;
          double v11 = v33;
          unint64_t v15 = v34;
        }

        ++v15;
      }
      while (v15 < [v11 count]);
    }
    else
    {
      CGFloat MaxY = 0.0;
    }
    self->_double height = MaxY;
    id v9 = v35;
  }
  normalizedWeights = self->_normalizedWeights;
  if (normalizedWeights)
  {
    free(normalizedWeights);
    self->_normalizedWeights = 0;
  }
}

- (void)getFrames:(CGRect *)a3 withInputs:(id)a4
{
}

- (BOOL)convertRects:(PXMagazineRect *)a3 outFrames:(CGRect *)a4 count:(unint64_t)a5 forReferenceSize:(CGSize)a6
{
  self->_referenceSize = a6;
  [(PXNewMagazineLayoutTileMaker *)self _updateDimensionInfos];
  if (a4)
  {
    if (a5)
    {
      uint64_t v10 = 0;
      p_size = &a4->size;
      CGFloat MaxY = 0.0;
      do
      {
        PXMagazineSize var1 = a3->var1;
        v23[0] = a3->var0;
        v23[1] = var1;
        [(PXNewMagazineLayoutTileMaker *)self _frameFromTileFrame:v23];
        p_size[-1].double width = v14;
        p_size[-1].double height = v15;
        p_size->double width = v16;
        p_size->double height = v17;
        if (v10 + self->_numberOfColumns >= a5)
        {
          CGFloat v18 = v14;
          CGFloat v19 = v15;
          CGFloat v20 = v16;
          CGFloat v21 = v17;
          if (CGRectGetMaxY(*(CGRect *)&v14) > MaxY)
          {
            v24.origin.x = v18;
            v24.origin.y = v19;
            v24.size.double width = v20;
            v24.size.double height = v21;
            CGFloat MaxY = CGRectGetMaxY(v24);
          }
        }
        ++v10;
        p_size += 2;
        ++a3;
      }
      while (a5 != v10);
    }
    else
    {
      CGFloat MaxY = 0.0;
    }
    self->_double height = MaxY;
  }
  return 1;
}

- (unint64_t)getMagazineRects:(PXMagazineRect *)a3 withInputs:(id)a4
{
  return self->_numberOfColumns;
}

- (void)setInterTileSpacing:(double)a3
{
  if (self->_interTileSpacing != a3)
  {
    self->_double interTileSpacing = a3;
    [(PXNewMagazineLayoutTileMaker *)self _updateDimensionInfos];
  }
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns >> 1;
}

- (id)description
{
  id v3 = NSString;
  double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns"));
  double v5 = [NSNumber numberWithDouble:self->_interTileSpacing];
  [(PXNewMagazineLayoutTileMaker *)self tileAspectRatio];
  uint64_t v7 = v6;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_maxTilesInFrame >> 1];
  id v9 = [v3 stringWithFormat:@"Tile Maker = {Columns: %@, InterTileSpacing: %@, TileASP: %.2f, MaxTiles: %@, MaxASP: %.2f, MinASP: %.2f}", v4, v5, v7, v8, *(void *)&self->_maxFrameAspectRatio, *(void *)&self->_minFrameAspectRatio];

  return v9;
}

- (void)dealloc
{
  normalizedWeights = self->_normalizedWeights;
  if (normalizedWeights) {
    free(normalizedWeights);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXNewMagazineLayoutTileMaker;
  [(PXNewMagazineLayoutTileMaker *)&v4 dealloc];
}

- (PXNewMagazineLayoutTileMaker)initWithReferenceSize:(CGSize)a3 numberOfColumns:(unint64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PXNewMagazineLayoutTileMaker;
  uint64_t v7 = [(PXNewMagazineLayoutTileMaker *)&v13 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_referenceSize.CGFloat width = width;
    v7->_referenceSize.CGFloat height = height;
    uint64_t v9 = 80;
    if (a4 < 5) {
      uint64_t v9 = 48;
    }
    v7->_double interTileSpacing = 2.0;
    v7->_unint64_t maxTilesInFrame = v9;
    v7->_unint64_t numberOfColumns = 2 * a4;
    v7->_double tileAspectRatio = 1.33333333;
    v7->_maxFrameAspectRatio = (double)a4 * 1.33333333;
    v7->_minFrameAspectRatio = 0.25;
    v7->_startLastPadding = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:60];
    sharedTempArray = v8->_sharedTempArray;
    v8->_sharedTempArray = (NSMutableArray *)v10;

    v8->_isPerfectEnding = 0;
    [(PXNewMagazineLayoutTileMaker *)v8 _updateDimensionInfos];
  }
  return v8;
}

@end