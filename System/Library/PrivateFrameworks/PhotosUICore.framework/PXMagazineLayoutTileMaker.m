@interface PXMagazineLayoutTileMaker
- (BOOL)_findNextTileWithInputs:(id)a3 atIndex:(unint64_t)a4 baseIndex:(unint64_t)a5 coordinator:(id)a6;
- (BOOL)_generateTilesWithInputs:(id)a3 atIndex:(unint64_t)a4 forMaxY:(unint64_t)a5 reserveNumberForPadding:(unint64_t)a6 outArray:(id)a7;
- (BOOL)checkAndPrintResults:(BOOL)a3;
- (BOOL)layoutFromRightToLeft;
- (CGRect)_frameFromTileFrame:(PXMagazineRect *)a3;
- (CGSize)defaultTileSize;
- (CGSize)referenceSize;
- (PXMagazineLayoutTileMaker)initWithReferenceSize:(CGSize)a3 numberOfColumns:(unint64_t)a4;
- (double)_aspectRatioOfInput:(id)a3;
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
- (void)_findNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 outArray:(id)a5;
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

@implementation PXMagazineLayoutTileMaker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTempArray, 0);
  objc_storeStrong((id *)&self->_allFrames, 0);
  objc_storeStrong((id *)&self->_cachedTileRects, 0);
  objc_storeStrong((id *)&self->_tileGrid, 0);
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
  return [(PXMagazineGrid *)self->_tileGrid isPerfectEnding];
}

- (int64_t)_availableFrames:(id *)a3 maxReturnCount:(unint64_t)a4 forAspectRatio:(double)a5 weight:(double)a6 maxWidth:(unint64_t)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_sharedTempArray removeAllObjects];
  v12 = self->_sharedTempArray;
  if (1.0 / a5 <= a5) {
    double v13 = a5;
  }
  else {
    double v13 = 1.0 / a5;
  }
  v14 = [(PXMagazineLayoutTileMaker *)self _getAllFramesInOrder];
  if (![v14 count])
  {
    v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2 object:self file:@"PXMagazineLayoutTileMaker.m" lineNumber:598 description:@"We should never have no frames"];
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v66 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [v20 aspectRatio];
        double v22 = v21;
        [v20 minAspectRatio];
        double v24 = v23;
        [v20 maxAspectRatio];
        double v26 = v25;
        unint64_t v27 = [v20 width];
        uint64_t v28 = [v20 height];
        if (v27 <= a7 && (self->_startLastPadding || ((v27 | v28) & 1) == 0))
        {
          BOOL v29 = a5 <= 0.402;
          if (v22 >= 0.801) {
            BOOL v29 = 0;
          }
          BOOL v30 = v22 > 1.334 || v22 < 0.8;
          double v31 = v13 + -1.0;
          BOOL v32 = v30 || v13 + -1.0 > 0.15;
          if (!v32 || v29) {
            goto LABEL_40;
          }
          if (v24 > a5) {
            goto LABEL_43;
          }
          double v31 = 0.9;
          if (a5 >= 0.9 && v27 == 2 && v28 == 2) {
            goto LABEL_40;
          }
          BOOL v33 = v27 == 2 && a5 < 0.9;
          if (v33 && v28 == 4) {
            goto LABEL_40;
          }
          if (v26 >= a5)
          {
            double v31 = 0.9;
            BOOL v35 = v22 < 0.9;
            if (a5 < 0.9) {
              BOOL v35 = v22 >= 1.1;
            }
            if (!v35) {
LABEL_40:
            }
              -[NSMutableArray addObject:](v12, "addObject:", v20, v31);
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v17);
  }
LABEL_43:

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __92__PXMagazineLayoutTileMaker__availableFrames_maxReturnCount_forAspectRatio_weight_maxWidth___block_invoke;
  v63[3] = &__block_descriptor_41_e45_q24__0__PXMagazineFrame_8__PXMagazineFrame_16l;
  *(double *)&v63[4] = a5;
  BOOL v64 = a6 > 0.7;
  [(NSMutableArray *)v12 sortUsingComparator:v63];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v36 = v12;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    int64_t v39 = 0;
    uint64_t v40 = *(void *)v60;
    v41 = a3;
    while (2)
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v60 != v40) {
          objc_enumerationMutation(v36);
        }
        *(&a3[v39] + j) = *(id *)(*((void *)&v59 + 1) + 8 * j);
        if (v39 + j + 1 >= a4)
        {
          v39 += j + 1;
          goto LABEL_54;
        }
      }
      v39 += j;
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v59 objects:v69 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v39 = 0;
    v41 = a3;
  }
LABEL_54:

  v43 = +[PXPhotosDetailsSettings sharedInstance];
  int v44 = [v43 editorialLayoutAvoidSmallestTile];

  unint64_t v45 = [(PXMagazineLayoutTileMaker *)self numberOfColumns];
  if (v39 >= 2 && v44)
  {
    unint64_t v46 = v45;
    id v47 = *v41;
    if ([v47 width] != 2 || objc_msgSend(v47, "height") != 2 && objc_msgSend(v47, "height") != 4) {
      goto LABEL_76;
    }
    id v48 = v41[1];
    v49 = v48;
    if ((unint64_t)v39 < 3 || v46 < 4)
    {
      id v54 = v48;
      if (v46 <= 3)
      {
        id v50 = 0;
        if ((rand() & 1) == 0)
        {
LABEL_75:

LABEL_76:
          goto LABEL_77;
        }
      }
      else
      {
        id v50 = 0;
      }
      uint64_t v52 = 1;
    }
    else
    {
      id v50 = v41[2];
      if (v50)
      {
        char v51 = rand();
        if (v51) {
          uint64_t v52 = 2;
        }
        else {
          uint64_t v52 = 1;
        }
        if (v51) {
          v53 = v50;
        }
        else {
          v53 = v49;
        }
      }
      else
      {
        uint64_t v52 = 1;
        v53 = v49;
      }
      id v54 = v53;
    }
    id *v41 = v54;
    v41[v52] = v47;
    goto LABEL_75;
  }
LABEL_77:

  return v39;
}

uint64_t __92__PXMagazineLayoutTileMaker__availableFrames_maxReturnCount_forAspectRatio_weight_maxWidth___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (v13 >= 0.005)
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
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  allFrames = self->_allFrames;
  if (!allFrames || ![(NSMutableArray *)allFrames count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_allFrames;
    self->_allFrames = v4;

    unint64_t v6 = [(PXMagazineLayoutTileMaker *)self numberOfColumns];
    if (self->_numberOfColumns >= 2)
    {
      if (v6 >= 4) {
        uint64_t v7 = 13;
      }
      else {
        uint64_t v7 = 9;
      }
      unint64_t v8 = 2;
      uint64_t v9 = 4;
      double v41 = 1000.0;
      do
      {
        unint64_t v10 = v9;
        for (unint64_t i = 2; i != v7; ++i)
        {
          if (v10 <= self->_maxTilesInFrame)
          {
            double v12 = self->_tileAspectRatio * (double)v8 / (double)i;
            if (v12 <= self->_maxFrameAspectRatio && v12 >= self->_minFrameAspectRatio)
            {
              double v13 = [[PXMagazineFrame alloc] initWithWidth:v8 height:i];
              [(PXMagazineFrame *)v13 setAspectRatio:v12];
              double v14 = v12 + -1.0;
              if (v12 + -1.0 < 0.0) {
                double v14 = -(v12 + -1.0);
              }
              BOOL v15 = v12 < 2.498 && v12 > 0.402;
              double v16 = 1.35;
              if (!v15) {
                double v16 = 1.25;
              }
              if (v14 >= 0.112) {
                double v17 = v16;
              }
              else {
                double v17 = 1.6;
              }
              -[PXMagazineFrame setMinAspectRatio:](v13, "setMinAspectRatio:", v12 / v17, v16, *(void *)&v41);
              [(PXMagazineFrame *)v13 setMaxAspectRatio:v12 * v17];
              if (v12 >= 2.498)
              {
                [(PXMagazineFrame *)v13 setMinAspectRatio:fmin(v12 / 1.25, 2.498)];
                [(PXMagazineFrame *)v13 setMaxAspectRatio:v41];
              }
              if (v12 <= 0.402)
              {
                [(PXMagazineFrame *)v13 setMinAspectRatio:0.0];
                double v18 = v12 * 1.25;
                if (v12 * 1.25 < 0.402) {
                  double v18 = 0.402;
                }
                [(PXMagazineFrame *)v13 setMaxAspectRatio:v18];
              }
              [(NSMutableArray *)self->_allFrames addObject:v13];
            }
          }
          v10 += v8;
        }
        ++v8;
        v9 += 2;
      }
      while (v8 <= self->_numberOfColumns);
    }
    -[NSMutableArray sortUsingComparator:](self->_allFrames, "sortUsingComparator:", &__block_literal_global_107890, *(void *)&v41);
    v19 = [(NSMutableArray *)self->_allFrames objectAtIndexedSubscript:0];
    [v19 aspectRatio];
    double v21 = v20;

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    double v22 = self->_allFrames;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v47;
LABEL_33:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v22);
        }
        unint64_t v27 = *(void **)(*((void *)&v46 + 1) + 8 * v26);
        [v27 aspectRatio];
        if (v28 > v21) {
          break;
        }
        [v27 setMinAspectRatio:0.0];
        if (v24 == ++v26)
        {
          uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v24) {
            goto LABEL_33;
          }
          break;
        }
      }
    }

    BOOL v29 = [(NSMutableArray *)self->_allFrames lastObject];
    [v29 aspectRatio];
    double v31 = v30;

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    BOOL v32 = [(NSMutableArray *)self->_allFrames reverseObjectEnumerator];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v43;
LABEL_41:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void **)(*((void *)&v42 + 1) + 8 * v36);
        [v37 aspectRatio];
        if (v38 < v31) {
          break;
        }
        [v37 setMaxAspectRatio:1000.0];
        if (v34 == ++v36)
        {
          uint64_t v34 = [v32 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v34) {
            goto LABEL_41;
          }
          break;
        }
      }
    }
  }
  int64_t v39 = self->_allFrames;
  return v39;
}

uint64_t __49__PXMagazineLayoutTileMaker__getAllFramesInOrder__block_invoke(uint64_t a1, void *a2, void *a3)
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
  v52[1] = *MEMORY[0x1E4F143B8];
  uint64_t v51 = 0;
  v52[0] = 0;
  uint64_t v50 = 0;
  double v11 = [a3 objectAtIndexedSubscript:a4];
  [(PXMagazineLayoutTileMaker *)self _aspectRatioOfInput:v11];
  double v13 = v12;
  uint64_t v14 = [a3 count];
  if ([(PXMagazineGrid *)self->_tileGrid nextEmptyTileX:v52 Y:&v51 maxWidth:&v50])
  {
    uint64_t v37 = v11;
    id v40 = a3;
    unint64_t v15 = [a3 count];
    v36[1] = v36;
    uint64_t v16 = 10;
    if (v15 == 6) {
      uint64_t v16 = 8;
    }
    if (v15 == 7) {
      uint64_t v16 = 6;
    }
    if (v15 <= 7) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 5;
    }
    MEMORY[0x1F4188790](v15, 8 * v17);
    v19 = (id *)((char *)v36 - v18);
    bzero((char *)v36 - v18, v20);
    normalizedWeights = self->_normalizedWeights;
    unint64_t v41 = a5;
    unint64_t v44 = a5 + a4;
    unint64_t v45 = a4;
    uint64_t v22 = [(PXMagazineLayoutTileMaker *)self _availableFrames:v19 maxReturnCount:v17 forAspectRatio:v50 weight:v13 maxWidth:normalizedWeights[a5 + a4]];
    double v38 = (void *)MEMORY[0x1AD10CB00]();
    uint64_t v23 = [a6 currentLayout];
    int v42 = [a6 stopIfAnyGoodLayout];
    if (v22 >= 1)
    {
      uint64_t v43 = v14 - 1;
      unint64_t v39 = v45 + 1;
      do
      {
        id v24 = *v19;
        uint64_t v25 = v51;
        uint64_t v26 = v52[0];
        uint64_t v27 = [v24 width];
        uint64_t v28 = [v24 height];
        tileGrid = self->_tileGrid;
        uint64_t v46 = v26;
        uint64_t v47 = v25;
        uint64_t v48 = v27;
        uint64_t v49 = v28;
        [(PXMagazineGrid *)tileGrid setTileIdentifier:v44 forArea:&v46];
        uint64_t v46 = v26;
        uint64_t v47 = v25;
        uint64_t v48 = v27;
        uint64_t v49 = v28;
        [v23 addRect:&v46];
        if (v43 == v45)
        {
          unint64_t v30 = [(PXMagazineGrid *)self->_tileGrid endingType];
          if (v30 == 1) {
            int v31 = v42;
          }
          else {
            int v31 = 0;
          }
          if (v30 == 2 || v31)
          {
            [a6 validateCurrentLayout];
          }
          else if (v42 && ![a6 currentLayoutsCount])
          {
            [a6 validateCurrentLayoutAsFallback];
          }
          if ([a6 stop])
          {
LABEL_29:

            goto LABEL_33;
          }
          uint64_t v33 = self->_tileGrid;
          uint64_t v46 = v26;
          uint64_t v47 = v25;
          uint64_t v48 = v27;
          uint64_t v49 = v28;
          [(PXMagazineGrid *)v33 clearArea:&v46];
          [v23 removeLastRect];
        }
        else
        {
          if ([(PXMagazineLayoutTileMaker *)self _findNextTileWithInputs:v40 atIndex:v39 baseIndex:v41 coordinator:a6])
          {
            goto LABEL_29;
          }
          BOOL v32 = self->_tileGrid;
          uint64_t v46 = v26;
          uint64_t v47 = v25;
          uint64_t v48 = v27;
          uint64_t v49 = v28;
          [(PXMagazineGrid *)v32 clearArea:&v46];
          [v23 removeLastRect];
          if ([a6 stop])
          {

            break;
          }
        }

        ++v19;
        --v22;
      }
      while (v22);
    }

    if (v45 || ![a6 currentLayoutsCount]) {
      BOOL v34 = 0;
    }
    else {
LABEL_33:
    }
      BOOL v34 = 1;
    double v11 = v37;
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

- (id)_generateLastTilesWithInputs:(id)a3 baseIndex:(unint64_t)a4 returnFallback:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  self->_startLastPadding = 1;
  double v9 = [[PXMagazineLayoutCoordinator alloc] initWithPaddingInputs:v8 tileAspectRatio:0 stopIfAnyGoodLayout:self->_tileAspectRatio];
  if ([(PXMagazineLayoutTileMaker *)self _findNextTileWithInputs:v8 atIndex:0 baseIndex:a4 coordinator:v9])
  {
    goto LABEL_4;
  }
  [(id)objc_opt_class() printInputs:v8];
  if (v5)
  {
    unint64_t v10 = [[PXMagazineLayoutCoordinator alloc] initWithPaddingInputs:v8 tileAspectRatio:1 stopIfAnyGoodLayout:self->_tileAspectRatio];

    [(PXMagazineLayoutTileMaker *)self _findNextTileWithInputs:v8 atIndex:0 baseIndex:a4 coordinator:v10];
    double v9 = v10;
LABEL_4:
    double v11 = [(PXMagazineLayoutCoordinator *)v9 currentBestLayout];
    goto LABEL_6;
  }
  double v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)_generateTilesWithInputs:(id)a3 atIndex:(unint64_t)a4 forMaxY:(unint64_t)a5 reserveNumberForPadding:(unint64_t)a6 outArray:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v40 = a7;
  unint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v45 = 0;
  double v12 = [v11 objectAtIndexedSubscript:a4];
  [(PXMagazineLayoutTileMaker *)self _aspectRatioOfInput:v12];
  double v14 = v13;
  unint64_t v39 = a4;
  double v15 = self->_normalizedWeights[a4];
  uint64_t v37 = v11;
  uint64_t v16 = [v11 count];
  BOOL v17 = 0;
  if (![(PXMagazineGrid *)self->_tileGrid nextEmptyTileX:&v47 Y:&v46 maxWidth:&v45]
    || v46 > a5)
  {
    goto LABEL_27;
  }
  BOOL v34 = v12;
  memset(v48, 0, sizeof(v48));
  uint64_t v18 = [(PXMagazineLayoutTileMaker *)self _availableFrames:v48 maxReturnCount:12 forAspectRatio:v45 weight:v14 maxWidth:v15];
  if (v18 < 1)
  {
    BOOL v17 = 0;
    goto LABEL_26;
  }
  uint64_t v19 = v18;
  uint64_t v20 = 0;
  uint64_t v36 = v16 - 1;
  BOOL v21 = v14 >= 2.498;
  if (v15 >= 0.7) {
    BOOL v21 = 1;
  }
  BOOL v38 = v21;
  BOOL v17 = 1;
  while (1)
  {
    id v22 = *((id *)v48 + v20);
    if ([v22 height] == 2)
    {
      uint64_t v23 = [v22 width];
      BOOL v24 = a5 != -1 && v23 == 2;
      if (v24 && v38) {
        goto LABEL_22;
      }
    }
    unint64_t v26 = v46;
    if ([v22 height] + v26 > a5) {
      goto LABEL_22;
    }
    unint64_t v27 = v46;
    uint64_t v28 = v47;
    uint64_t v29 = [v22 width];
    uint64_t v30 = [v22 height];
    tileGrid = self->_tileGrid;
    uint64_t v41 = v28;
    unint64_t v42 = v27;
    uint64_t v43 = v29;
    uint64_t v44 = v30;
    [(PXMagazineGrid *)tileGrid setTileIdentifier:v39 forArea:&v41];
    uint64_t v41 = v28;
    unint64_t v42 = v27;
    uint64_t v43 = v29;
    uint64_t v44 = v30;
    [v40 addRect:&v41];
    if ([(PXMagazineGrid *)self->_tileGrid isPerfectEnding]) {
      break;
    }
    if (a6 + v39 == v36)
    {
      if (a5 == -1) {
        break;
      }
      goto LABEL_21;
    }
    if ([(PXMagazineLayoutTileMaker *)self _generateTilesWithInputs:v37 atIndex:v39 + 1 forMaxY:a5 reserveNumberForPadding:a6 outArray:v40])
    {
      break;
    }
LABEL_21:
    BOOL v32 = self->_tileGrid;
    uint64_t v41 = v28;
    unint64_t v42 = v27;
    uint64_t v43 = v29;
    uint64_t v44 = v30;
    [(PXMagazineGrid *)v32 clearArea:&v41];
    [v40 removeLastRect];
LABEL_22:

    BOOL v17 = ++v20 < v19;
    if (v19 == v20) {
      goto LABEL_26;
    }
  }

LABEL_26:
  double v12 = v34;
LABEL_27:

  return v17;
}

- (void)_findNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 outArray:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  double v9 = +[PXPhotosDetailsSettings sharedInstance];
  uint64_t v10 = [v9 editorialLayoutTargetRowsForChunk];

  unint64_t v11 = [(PXMagazineGrid *)self->_tileGrid currentRowsUsed];
  if (![(PXMagazineLayoutTileMaker *)self _generateTilesWithInputs:v12 atIndex:a4 forMaxY:v11 + 2 * v10 reserveNumberForPadding:0 outArray:v8]&& ![(PXMagazineLayoutTileMaker *)self _generateTilesWithInputs:v12 atIndex:a4 forMaxY:v11 + 6 * v10 reserveNumberForPadding:0 outArray:v8])
  {
    [(PXMagazineLayoutTileMaker *)self _generateTilesWithInputs:v12 atIndex:a4 forMaxY:-1 reserveNumberForPadding:[(PXMagazineLayoutTileMaker *)self _numberOfInputsForLastPadding] outArray:v8];
  }
}

- (unint64_t)_numberOfInputsForLastPadding
{
  if ([(PXMagazineLayoutTileMaker *)self numberOfColumns] >= 6) {
    return 2 * [(PXMagazineLayoutTileMaker *)self numberOfColumns];
  }
  else {
    return 10;
  }
}

- (id)_generateTilesWithInputs:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  double v6 = [[PXMagazineRectArray alloc] initWithSize:v5];
  unint64_t v7 = [(PXMagazineLayoutTileMaker *)self _numberOfInputsForLastPadding];
  unint64_t v8 = 0;
  while (v8 < v5)
  {
    unint64_t v9 = v8 + v7;
    if (v8 + v7 < v5)
    {
      [(PXMagazineLayoutTileMaker *)self _findNextChunkWithInputs:v4 fromIndex:v8 outArray:v6];
      uint64_t v10 = [(PXMagazineRectArray *)v6 count];
      BOOL v11 = v8 == v10;
      if (v8 != v10) {
        unint64_t v8 = [(PXMagazineRectArray *)v6 count];
      }
      if (v8 >= v5) {
        break;
      }
      unint64_t v9 = v8 + v7;
      if (v11) {
        goto LABEL_9;
      }
    }
    if (v9 >= v5)
    {
LABEL_9:
      id v12 = objc_msgSend(v4, "subarrayWithRange:", v8, v5 - v8);
      if (v8) {
        BOOL v13 = v5 - v8 >= v7;
      }
      else {
        BOOL v13 = 1;
      }
      uint64_t v14 = v13;
      double v15 = [(PXMagazineLayoutTileMaker *)self _generateLastTilesWithInputs:v12 baseIndex:v8 returnFallback:v14];
      if ([v15 count])
      {
        unint64_t v16 = 0;
        do
        {
          long long v27 = 0u;
          long long v28 = 0u;
          if (v15) {
            [v15 rectAtIndex:v16];
          }
          long long v25 = v27;
          long long v26 = v28;
          [(PXMagazineRectArray *)v6 addRect:&v25];
          ++v16;
        }
        while (v16 < [v15 count]);
      }
      if (v15) {
        char v17 = 1;
      }
      else {
        char v17 = v14;
      }
      if ((v17 & 1) == 0)
      {
        if (v7 >= v5) {
          unint64_t v18 = v5;
        }
        else {
          unint64_t v18 = v7;
        }
        unint64_t v19 = v5 - v18;
        uint64_t v20 = [v4 subarrayWithRange:v5 - v18];

        for (unint64_t i = [(PXMagazineRectArray *)v6 count] - 1; i >= v19; --i)
        {
          long long v27 = 0u;
          long long v28 = 0u;
          if (v6) {
            [(PXMagazineRectArray *)v6 rectAtIndex:i];
          }
          tileGrid = self->_tileGrid;
          long long v25 = v27;
          long long v26 = v28;
          [(PXMagazineGrid *)tileGrid clearArea:&v25];
          [(PXMagazineRectArray *)v6 removeLastRect];
        }
        double v15 = [(PXMagazineLayoutTileMaker *)self _generateLastTilesWithInputs:v20 baseIndex:v19 returnFallback:1];
        if ([v15 count])
        {
          unint64_t v23 = 0;
          do
          {
            long long v27 = 0u;
            long long v28 = 0u;
            if (v15) {
              [v15 rectAtIndex:v23];
            }
            long long v25 = v27;
            long long v26 = v28;
            [(PXMagazineRectArray *)v6 addRect:&v25];
            ++v23;
          }
          while (v23 < [v15 count]);
        }
        id v12 = (void *)v20;
      }

      break;
    }
  }

  return v6;
}

- (void)_resetWithNumberOfAssets:(unint64_t)a3
{
  unint64_t v5 = [[PXMagazineGrid alloc] initWithNumberOfColumns:self->_numberOfColumns size:a3];
  tileGrid = self->_tileGrid;
  self->_tileGrid = v5;

  unint64_t v7 = [[PXMagazineRectArray alloc] initWithSize:a3];
  cachedTileRects = self->_cachedTileRects;
  self->_cachedTileRects = v7;

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
      double v15 = PLUIGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        double v35 = v11;
        __int16 v36 = 2048;
        double v37 = v10;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, "No weights !!!  %.3f ~ %.3f", buf, 0x16u);
      }
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
    [v30 handleFailureInMethod:a2 object:self file:@"PXMagazineLayoutTileMaker.m" lineNumber:162 description:@"normalizedWeights Memory leak."];
  }
  -[PXMagazineLayoutTileMaker _resetWithNumberOfAssets:](self, "_resetWithNumberOfAssets:", [v9 count]);
  [(PXMagazineLayoutTileMaker *)self _setRandomSeedWithInputs:v9];
  double v10 = [(PXMagazineLayoutTileMaker *)self _normalizeWeightsByInputs:v9];
  self->_normalizedWeights = v10;
  if (!v10)
  {
    long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PXMagazineLayoutTileMaker.m" lineNumber:166 description:@"Allocate normalizedWeights memory faill."];
  }
  double v11 = [(PXMagazineLayoutTileMaker *)self _generateTilesWithInputs:v9];
  cachedTileRects = self->_cachedTileRects;
  self->_cachedTileRects = v11;

  uint64_t v13 = [v9 count];
  if (v13 != [(PXMagazineRectArray *)self->_cachedTileRects count])
  {
    long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PXMagazineLayoutTileMaker.m" lineNumber:170 description:@"The number of cached tiles cannot be != to the number of inputs"];
  }
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    if ([(PXMagazineRectArray *)self->_cachedTileRects count])
    {
      unint64_t v14 = 0;
      p_size = &a3->size;
      CGFloat MaxY = 0.0;
      uint64_t v17 = a4;
      do
      {
        PXMagazineOrigin v34 = (PXMagazineOrigin)0;
        PXMagazineSize v35 = (PXMagazineSize)0;
        uint64_t v18 = self->_cachedTileRects;
        if (v18) {
          [(PXMagazineRectArray *)v18 rectAtIndex:v14];
        }
        v33[0] = v34;
        v33[1] = v35;
        [(PXMagazineLayoutTileMaker *)self _frameFromTileFrame:v33];
        CGFloat v23 = v19;
        CGFloat v24 = v20;
        CGFloat v25 = v21;
        CGFloat v26 = v22;
        if (a3)
        {
          p_size[-1].double width = v19;
          p_size[-1].double height = v20;
          p_size->double width = v21;
          p_size->double height = v22;
        }
        if (a4)
        {
          PXMagazineSize v27 = v35;
          v17->int64_t var0 = v34;
          v17->var1 = v27;
        }
        unint64_t v28 = v14 + self->_numberOfColumns;
        if (v28 >= [(PXMagazineRectArray *)self->_cachedTileRects count])
        {
          v36.origin.x = v23;
          v36.origin.y = v24;
          v36.size.double width = v25;
          v36.size.double height = v26;
          if (CGRectGetMaxY(v36) > MaxY)
          {
            v37.origin.x = v23;
            v37.origin.y = v24;
            v37.size.double width = v25;
            v37.size.double height = v26;
            CGFloat MaxY = CGRectGetMaxY(v37);
          }
        }
        ++v14;
        ++v17;
        p_size += 2;
      }
      while (v14 < [(PXMagazineRectArray *)self->_cachedTileRects count]);
    }
    else
    {
      CGFloat MaxY = 0.0;
    }
    self->_double height = MaxY;
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

- (unint64_t)getMagazineRects:(PXMagazineRect *)a3 withInputs:(id)a4
{
  return self->_numberOfColumns;
}

- (void)setInterTileSpacing:(double)a3
{
  if (self->_interTileSpacing != a3)
  {
    self->_double interTileSpacing = a3;
    [(PXMagazineLayoutTileMaker *)self _updateDimensionInfos];
  }
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns >> 1;
}

- (double)_aspectRatioOfInput:(id)a3
{
  [a3 size];
  if (v4 > 0.0 && v3 > 0.0)
  {
    PXSizeGetAspectRatio();
  }
  return 1.0;
}

- (id)description
{
  double v3 = NSString;
  double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns"));
  double v5 = [NSNumber numberWithDouble:self->_interTileSpacing];
  [(PXMagazineLayoutTileMaker *)self tileAspectRatio];
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
  v4.super_class = (Class)PXMagazineLayoutTileMaker;
  [(PXMagazineLayoutTileMaker *)&v4 dealloc];
}

- (PXMagazineLayoutTileMaker)initWithReferenceSize:(CGSize)a3 numberOfColumns:(unint64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PXMagazineLayoutTileMaker;
  uint64_t v7 = [(PXMagazineLayoutTileMaker *)&v13 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_referenceSize.CGFloat width = width;
    v7->_referenceSize.CGFloat height = height;
    uint64_t v9 = 36;
    if (a4 < 5) {
      uint64_t v9 = 24;
    }
    v7->_double interTileSpacing = 2.0;
    v7->_maxTilesInFrame = v9;
    v7->_unint64_t numberOfColumns = 2 * a4;
    v7->_tileAspectRatio = 1.33333333;
    v7->_maxFrameAspectRatio = (double)a4 * 1.33333333;
    v7->_minFrameAspectRatio = 0.25;
    v7->_startLastPadding = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:60];
    sharedTempArray = v8->_sharedTempArray;
    v8->_sharedTempArray = (NSMutableArray *)v10;

    [(PXMagazineLayoutTileMaker *)v8 _updateDimensionInfos];
  }
  return v8;
}

@end