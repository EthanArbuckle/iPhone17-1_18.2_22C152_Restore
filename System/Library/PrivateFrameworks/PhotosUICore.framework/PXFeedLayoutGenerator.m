@interface PXFeedLayoutGenerator
- (BOOL)isAtEnd;
- (BOOL)parseNextTiles;
- (BOOL)scanAnyTile:(PXTileInfo *)a3;
- (BOOL)scanTile:(PXTileInfo *)a3 ofType:(int64_t)a4;
- (BOOL)scanTile:(PXTileInfo *)a3 passingTest:(id)a4;
- (BOOL)scanTile:(PXTileInfo *)a3 type:(int64_t *)a4;
- (BOOL)scanTileWithHorizontalPanorama:(PXTileInfo *)a3;
- (BOOL)scanTileWithLandscapeImage:(PXTileInfo *)a3;
- (BOOL)scanTileWithPortraitImage:(PXTileInfo *)a3;
- (BOOL)scanTileWithSquareImage:(PXTileInfo *)a3;
- (BOOL)scannedBatchHasCaption;
- (BOOL)shouldStop;
- (CGSize)captionSizeForTileAtIndex:(int64_t)a3 proposedSize:(CGSize)a4;
- (CGSize)commentSizeForTileAtIndex:(int64_t)a3 commentIndex:(int64_t)a4 proposedSize:(CGSize)a5;
- (CGSize)interTileSpacing;
- (CGSize)likesSizeForTileAtIndex:(int64_t)a3 proposedSize:(CGSize)a4;
- (CGSize)noCaptionSpacing;
- (PXFeedLayoutGenerator)init;
- (PXFeedLayoutGeneratorScanState)scanState;
- (UIEdgeInsets)captionPadding;
- (double)roundingScale;
- (double)valueByRounding:(double)a3 usingMagneticGuidelines:(BOOL)a4;
- (id)parsedFrameBlock;
- (id)scannedBatchID;
- (id)tileBatchIDBlock;
- (id)tileCaptionSizeBlock;
- (id)tileCommentCountBlock;
- (id)tileCommentSizeBlock;
- (id)tileHasCaptionBlock;
- (id)tileHasLikesBlock;
- (id)tileImageSizeBlock;
- (id)tileLikesSizeBlock;
- (id)tileMinimumSizeBlock;
- (int64_t)numberOfMagneticGuidelines;
- (int64_t)scanLocation;
- (int64_t)scanSpecialSequenceCount;
- (int64_t)tileCount;
- (void)enumerateFramesWithBlock:(id)a3;
- (void)parseTiles;
- (void)parsedFrame:(CGRect)a3 type:(int64_t)a4 forTileAtIndex:(int64_t)a5;
- (void)setCaptionPadding:(UIEdgeInsets)a3;
- (void)setInterTileSpacing:(CGSize)a3;
- (void)setNoCaptionSpacing:(CGSize)a3;
- (void)setNumberOfMagneticGuidelines:(int64_t)a3;
- (void)setParsedFrameBlock:(id)a3;
- (void)setRoundingScale:(double)a3;
- (void)setScanLocation:(int64_t)a3;
- (void)setScanSpecialSequenceCount:(int64_t)a3;
- (void)setScanState:(id)a3;
- (void)setScannedBatchHasCaption:(BOOL)a3;
- (void)setScannedBatchID:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setTileBatchIDBlock:(id)a3;
- (void)setTileCaptionSizeBlock:(id)a3;
- (void)setTileCommentCountBlock:(id)a3;
- (void)setTileCommentSizeBlock:(id)a3;
- (void)setTileCount:(int64_t)a3;
- (void)setTileHasCaptionBlock:(id)a3;
- (void)setTileHasLikesBlock:(id)a3;
- (void)setTileImageSizeBlock:(id)a3;
- (void)setTileLikesSizeBlock:(id)a3;
- (void)setTileMinimumSizeBlock:(id)a3;
- (void)willParseTiles;
@end

@implementation PXFeedLayoutGenerator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scannedBatchID, 0);
  objc_storeStrong(&self->_parsedFrameBlock, 0);
  objc_storeStrong(&self->_tileBatchIDBlock, 0);
  objc_storeStrong(&self->_tileCommentSizeBlock, 0);
  objc_storeStrong(&self->_tileCommentCountBlock, 0);
  objc_storeStrong(&self->_tileLikesSizeBlock, 0);
  objc_storeStrong(&self->_tileHasLikesBlock, 0);
  objc_storeStrong(&self->_tileCaptionSizeBlock, 0);
  objc_storeStrong(&self->_tileHasCaptionBlock, 0);
  objc_storeStrong(&self->_tileMinimumSizeBlock, 0);
  objc_storeStrong(&self->_tileImageSizeBlock, 0);
  uint64_t v3 = 0;
  v4 = &self->_cachedBatchID[19];
  do
    objc_storeStrong(&v4[v3--], 0);
  while (v3 != -20);
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setScanSpecialSequenceCount:(int64_t)a3
{
  self->_scanSpecialSequenceCount = a3;
}

- (int64_t)scanSpecialSequenceCount
{
  return self->_scanSpecialSequenceCount;
}

- (void)setScannedBatchHasCaption:(BOOL)a3
{
  self->_scannedBatchHasCaption = a3;
}

- (BOOL)scannedBatchHasCaption
{
  return self->_scannedBatchHasCaption;
}

- (void)setScannedBatchID:(id)a3
{
}

- (id)scannedBatchID
{
  return self->_scannedBatchID;
}

- (void)setScanLocation:(int64_t)a3
{
  self->_scanLocation = a3;
}

- (int64_t)scanLocation
{
  return self->_scanLocation;
}

- (void)setParsedFrameBlock:(id)a3
{
}

- (id)parsedFrameBlock
{
  return self->_parsedFrameBlock;
}

- (void)setRoundingScale:(double)a3
{
  self->_roundingScale = a3;
}

- (double)roundingScale
{
  return self->_roundingScale;
}

- (void)setNumberOfMagneticGuidelines:(int64_t)a3
{
  self->_numberOfMagneticGuidelines = a3;
}

- (int64_t)numberOfMagneticGuidelines
{
  return self->_numberOfMagneticGuidelines;
}

- (void)setTileBatchIDBlock:(id)a3
{
}

- (id)tileBatchIDBlock
{
  return self->_tileBatchIDBlock;
}

- (void)setTileCommentSizeBlock:(id)a3
{
}

- (id)tileCommentSizeBlock
{
  return self->_tileCommentSizeBlock;
}

- (void)setTileCommentCountBlock:(id)a3
{
}

- (id)tileCommentCountBlock
{
  return self->_tileCommentCountBlock;
}

- (void)setTileLikesSizeBlock:(id)a3
{
}

- (id)tileLikesSizeBlock
{
  return self->_tileLikesSizeBlock;
}

- (void)setTileHasLikesBlock:(id)a3
{
}

- (id)tileHasLikesBlock
{
  return self->_tileHasLikesBlock;
}

- (void)setTileCaptionSizeBlock:(id)a3
{
}

- (id)tileCaptionSizeBlock
{
  return self->_tileCaptionSizeBlock;
}

- (void)setTileHasCaptionBlock:(id)a3
{
}

- (id)tileHasCaptionBlock
{
  return self->_tileHasCaptionBlock;
}

- (void)setNoCaptionSpacing:(CGSize)a3
{
  self->_noCaptionSpacing = a3;
}

- (CGSize)noCaptionSpacing
{
  double width = self->_noCaptionSpacing.width;
  double height = self->_noCaptionSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCaptionPadding:(UIEdgeInsets)a3
{
  self->_captionPadding = a3;
}

- (UIEdgeInsets)captionPadding
{
  double top = self->_captionPadding.top;
  double left = self->_captionPadding.left;
  double bottom = self->_captionPadding.bottom;
  double right = self->_captionPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTileMinimumSizeBlock:(id)a3
{
}

- (id)tileMinimumSizeBlock
{
  return self->_tileMinimumSizeBlock;
}

- (void)setTileImageSizeBlock:(id)a3
{
}

- (id)tileImageSizeBlock
{
  return self->_tileImageSizeBlock;
}

- (void)setInterTileSpacing:(CGSize)a3
{
  self->_interTileSpacing = a3;
}

- (CGSize)interTileSpacing
{
  double width = self->_interTileSpacing.width;
  double height = self->_interTileSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTileCount:(int64_t)a3
{
  self->_tileCount = a3;
}

- (int64_t)tileCount
{
  return self->_tileCount;
}

- (double)valueByRounding:(double)a3 usingMagneticGuidelines:(BOOL)a4
{
  if (a4 && [(PXFeedLayoutGenerator *)self numberOfMagneticGuidelines] >= 1)
  {
    [(PXFeedLayoutGenerator *)self referenceDistanceForMagneticGuidelines];
    double v7 = v6;
    int64_t v8 = [(PXFeedLayoutGenerator *)self numberOfMagneticGuidelines] + 1;
    a3 = v7 / (double)v8 * round(a3 / (v7 / (double)v8));
  }
  [(PXFeedLayoutGenerator *)self roundingScale];
  return round(a3 * v9) / v9;
}

- (void)parsedFrame:(CGRect)a3 type:(int64_t)a4 forTileAtIndex:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12 = [(PXFeedLayoutGenerator *)self parsedFrameBlock];

  if (v12)
  {
    char v14 = 0;
    v13 = [(PXFeedLayoutGenerator *)self parsedFrameBlock];
    ((void (**)(void, int64_t, int64_t, char *, double, double, double, double))v13)[2](v13, a5, a4, &v14, x, y, width, height);

    if (v14) {
      [(PXFeedLayoutGenerator *)self setShouldStop:1];
    }
  }
}

- (CGSize)commentSizeForTileAtIndex:(int64_t)a3 commentIndex:(int64_t)a4 proposedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v10 = [(PXFeedLayoutGenerator *)self tileCommentSizeBlock];

  if (v10)
  {
    v11 = [(PXFeedLayoutGenerator *)self tileCommentSizeBlock];
    double width = v11[2](v11, a3, a4, width, height);
    double height = v12;
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)likesSizeForTileAtIndex:(int64_t)a3 proposedSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  int64_t v8 = [(PXFeedLayoutGenerator *)self tileLikesSizeBlock];

  if (v8)
  {
    double v9 = [(PXFeedLayoutGenerator *)self tileLikesSizeBlock];
    double width = v9[2](v9, a3, width, height);
    double height = v10;
  }
  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)captionSizeForTileAtIndex:(int64_t)a3 proposedSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  int64_t v8 = [(PXFeedLayoutGenerator *)self tileCaptionSizeBlock];

  if (v8)
  {
    double v9 = [(PXFeedLayoutGenerator *)self tileCaptionSizeBlock];
    double width = v9[2](v9, a3, width, height);
    double height = v10;
  }
  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)scanTile:(PXTileInfo *)a3 ofType:(int64_t)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PXFeedLayoutGenerator_scanTile_ofType___block_invoke;
  v5[3] = &__block_descriptor_40_e47_B72__0_PXTileInfo_q_CGSize_dd__CGSize_dd_BBqB_8l;
  v5[4] = a4;
  return [(PXFeedLayoutGenerator *)self scanTile:a3 passingTest:v5];
}

BOOL __41__PXFeedLayoutGenerator_scanTile_ofType___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a2 + 8) / *(double *)(a2 + 16);
  if (v2 >= 2.5)
  {
    uint64_t v3 = 3;
  }
  else if (v2 <= 1.04999995)
  {
    if (v2 >= 0.952380996)
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 4;
      if (v2 > 0.4) {
        uint64_t v3 = 2;
      }
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  return v3 == *(void *)(a1 + 32);
}

- (BOOL)scanTile:(PXTileInfo *)a3 type:(int64_t *)a4
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PXFeedLayoutGenerator_scanTile_type___block_invoke;
  v7[3] = &unk_1E5DB7DC8;
  v7[4] = &v8;
  BOOL v5 = [(PXFeedLayoutGenerator *)self scanTile:a3 passingTest:v7];
  if (a4) {
    *a4 = v9[3];
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __39__PXFeedLayoutGenerator_scanTile_type___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a2 + 8) / *(double *)(a2 + 16);
  if (v2 >= 2.5)
  {
    uint64_t v3 = 3;
  }
  else if (v2 <= 1.04999995)
  {
    if (v2 >= 0.952380996)
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 4;
      if (v2 > 0.4) {
        uint64_t v3 = 2;
      }
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return 1;
}

- (BOOL)scanTileWithSquareImage:(PXTileInfo *)a3
{
  return [(PXFeedLayoutGenerator *)self scanTile:a3 ofType:0];
}

- (BOOL)scanTileWithHorizontalPanorama:(PXTileInfo *)a3
{
  return [(PXFeedLayoutGenerator *)self scanTile:a3 ofType:3];
}

- (BOOL)scanTileWithLandscapeImage:(PXTileInfo *)a3
{
  return [(PXFeedLayoutGenerator *)self scanTile:a3 ofType:1];
}

- (BOOL)scanTileWithPortraitImage:(PXTileInfo *)a3
{
  return [(PXFeedLayoutGenerator *)self scanTile:a3 ofType:2];
}

- (BOOL)scanAnyTile:(PXTileInfo *)a3
{
  return [(PXFeedLayoutGenerator *)self scanTile:a3 passingTest:&__block_literal_global_85925];
}

uint64_t __37__PXFeedLayoutGenerator_scanAnyTile___block_invoke()
{
  return 1;
}

- (BOOL)scanTile:(PXTileInfo *)a3 passingTest:(id)a4
{
  double v6 = a4;
  if ([(PXFeedLayoutGenerator *)self isAtEnd])
  {
    BOOL v7 = 0;
  }
  else
  {
    int64_t v8 = [(PXFeedLayoutGenerator *)self scanLocation];
    id v9 = [(PXFeedLayoutGenerator *)self scannedBatchID];
    int v55 = 0;
    __int16 v56 = 0;
    v54[0] = 0;
    *(_DWORD *)((char *)v54 + 3) = 0;
    uint64_t v10 = v8 % 20;
    v45 = v9;
    if (v8 < self->_cacheTailLocation || v8 >= self->_cacheHeadLocation)
    {
      v24 = [(PXFeedLayoutGenerator *)self tileImageSizeBlock];
      CGFloat v13 = v24[2](v24, v8);
      CGFloat v14 = v25;

      v26 = [(PXFeedLayoutGenerator *)self tileMinimumSizeBlock];
      if (v26)
      {
        v27 = [(PXFeedLayoutGenerator *)self tileMinimumSizeBlock];
        CGFloat v15 = v27[2](v27, v8);
        CGFloat v16 = v28;
      }
      else
      {
        CGFloat v15 = *MEMORY[0x1E4F1DB30];
        CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }

      v29 = [(PXFeedLayoutGenerator *)self tileHasCaptionBlock];
      if (v29)
      {
        v30 = [(PXFeedLayoutGenerator *)self tileHasCaptionBlock];
        int v17 = v30[2](v30, v8);
      }
      else
      {
        int v17 = 0;
      }

      v31 = [(PXFeedLayoutGenerator *)self tileHasLikesBlock];
      if (v31)
      {
        v32 = [(PXFeedLayoutGenerator *)self tileHasLikesBlock];
        char v44 = v32[2](v32, v8);
      }
      else
      {
        char v44 = 0;
      }

      v33 = [(PXFeedLayoutGenerator *)self tileCommentCountBlock];
      uint64_t v34 = v8 % 20;
      if (v33)
      {
        v35 = [(PXFeedLayoutGenerator *)self tileCommentCountBlock];
        int64_t v19 = v35[2](v35, v8);
      }
      else
      {
        int64_t v19 = 0;
      }

      v36 = [(PXFeedLayoutGenerator *)self tileBatchIDBlock];
      if (v36)
      {
        v37 = [(PXFeedLayoutGenerator *)self tileBatchIDBlock];
        v37[2](v37, v8);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        id v9 = v45;
      }
      else
      {
        id v23 = 0;
      }

      if (v8)
      {
        if (v9 == v23) {
          int v20 = 0;
        }
        else {
          int v20 = [v9 isEqual:v23] ^ 1;
        }
      }
      else
      {
        int v20 = 1;
      }
      BOOL v22 = v44;
      v38 = (char *)self + 64 * v34;
      *((void *)v38 + 3) = v8;
      *((CGFloat *)v38 + 4) = v13;
      *((CGFloat *)v38 + 5) = v14;
      *((CGFloat *)v38 + 6) = v15;
      *((CGFloat *)v38 + 7) = v16;
      v38[64] = v17;
      v38[65] = v44;
      *(_DWORD *)(v38 + 66) = 0;
      *((_WORD *)v38 + 35) = 0;
      *((void *)v38 + 9) = v19;
      v38[80] = v20;
      *(_DWORD *)(v38 + 81) = 0;
      *((_DWORD *)v38 + 21) = 0;
      objc_storeStrong(&self->_cachedBatchID[v34], v23);
      self->_cacheHeadLocation = v8 + 1;
      int64_t cacheTailLocation = self->_cacheTailLocation;
      if (v8 >= cacheTailLocation)
      {
        if (cacheTailLocation <= v8 - 19) {
          int64_t cacheTailLocation = v8 - 19;
        }
        self->_int64_t cacheTailLocation = cacheTailLocation;
      }
      else
      {
        self->_int64_t cacheTailLocation = v8;
      }
      int64_t v12 = v8;
    }
    else
    {
      uint64_t v11 = (char *)self + 64 * v10;
      int64_t v12 = *((void *)v11 + 3);
      CGFloat v13 = *((double *)v11 + 4);
      CGFloat v14 = *((double *)v11 + 5);
      CGFloat v15 = *((double *)v11 + 6);
      CGFloat v16 = *((double *)v11 + 7);
      int v17 = v11[64];
      char v18 = v11[65];
      int v55 = *(_DWORD *)(v11 + 66);
      __int16 v56 = *((_WORD *)v11 + 35);
      int64_t v19 = *((void *)v11 + 9);
      int v20 = v11[80];
      *(_DWORD *)((char *)v54 + 3) = *((_DWORD *)v11 + 21);
      v54[0] = *(_DWORD *)(v11 + 81);
      v21 = (id *)(&self->super.isa + v10);
      BOOL v22 = v18;
      id v23 = v21[163];
    }
    v40 = (uint64_t (*)(void *, void *))v6[2];
    v46[0] = v12;
    *(CGFloat *)&v46[1] = v13;
    *(CGFloat *)&v46[2] = v14;
    *(CGFloat *)&v46[3] = v15;
    *(CGFloat *)&v46[4] = v16;
    char v47 = v17;
    BOOL v48 = v22;
    int v49 = v55;
    __int16 v50 = v56;
    int64_t v51 = v19;
    char v52 = v20;
    *(_DWORD *)v53 = v54[0];
    *(_DWORD *)&v53[3] = *(_DWORD *)((char *)v54 + 3);
    int v41 = v40(v6, v46);
    BOOL v42 = v22;
    BOOL v7 = v41;
    if (v41)
    {
      if (a3)
      {
        a3->indedouble x = v12;
        a3->imageSize.double width = v13;
        a3->imageSize.double height = v14;
        a3->minimumSize.double width = v15;
        a3->minimumSize.double height = v16;
        a3->hasCaption = v17;
        a3->hasLikes = v42;
        *(_DWORD *)(&a3->hasLikes + 1) = v55;
        *(_WORD *)(&a3->hasLikes + 5) = v56;
        a3->commentCount = v19;
        a3->isBatchStart = v20;
        *(_DWORD *)(&a3->isBatchStart + 1) = v54[0];
        *((_DWORD *)&a3->isBatchStart + 1) = *(_DWORD *)((char *)v54 + 3);
      }
      [(PXFeedLayoutGenerator *)self setScanLocation:v8 + 1];
      [(PXFeedLayoutGenerator *)self setScannedBatchID:v23];
      if ((v17 | v20)) {
        [(PXFeedLayoutGenerator *)self setScannedBatchHasCaption:v17 & 1];
      }
    }
  }
  return v7;
}

- (BOOL)isAtEnd
{
  int64_t v3 = [(PXFeedLayoutGenerator *)self scanLocation];
  return v3 >= [(PXFeedLayoutGenerator *)self tileCount];
}

- (void)setScanState:(id)a3
{
  id v4 = a3;
  -[PXFeedLayoutGenerator setScanLocation:](self, "setScanLocation:", [v4 scanLocation]);
  BOOL v5 = [v4 scannedBatchID];
  [(PXFeedLayoutGenerator *)self setScannedBatchID:v5];

  -[PXFeedLayoutGenerator setScannedBatchHasCaption:](self, "setScannedBatchHasCaption:", [v4 scannedBatchHasCaption]);
  uint64_t v6 = [v4 scanSpecialSequenceCount];

  [(PXFeedLayoutGenerator *)self setScanSpecialSequenceCount:v6];
}

- (PXFeedLayoutGeneratorScanState)scanState
{
  int64_t v3 = objc_alloc_init(PXFeedLayoutGeneratorScanState);
  [(PXFeedLayoutGeneratorScanState *)v3 setScanLocation:[(PXFeedLayoutGenerator *)self scanLocation]];
  id v4 = [(PXFeedLayoutGenerator *)self scannedBatchID];
  [(PXFeedLayoutGeneratorScanState *)v3 setScannedBatchID:v4];

  [(PXFeedLayoutGeneratorScanState *)v3 setScannedBatchHasCaption:[(PXFeedLayoutGenerator *)self scannedBatchHasCaption]];
  [(PXFeedLayoutGeneratorScanState *)v3 setScanSpecialSequenceCount:[(PXFeedLayoutGenerator *)self scanSpecialSequenceCount]];
  return v3;
}

- (BOOL)parseNextTiles
{
  return 0;
}

- (void)willParseTiles
{
  self->_int64_t cacheTailLocation = 0;
  self->_cacheHeadLocation = 0;
  [(PXFeedLayoutGenerator *)self setScanLocation:0];
  [(PXFeedLayoutGenerator *)self setScannedBatchID:0];
  [(PXFeedLayoutGenerator *)self setScannedBatchHasCaption:0];
}

- (void)parseTiles
{
  while (![(PXFeedLayoutGenerator *)self isAtEnd]
       && [(PXFeedLayoutGenerator *)self parseNextTiles]
       && ![(PXFeedLayoutGenerator *)self shouldStop])
    ;
}

- (void)enumerateFramesWithBlock:(id)a3
{
  [(PXFeedLayoutGenerator *)self setParsedFrameBlock:a3];
  [(PXFeedLayoutGenerator *)self willParseTiles];
  [(PXFeedLayoutGenerator *)self parseTiles];
  [(PXFeedLayoutGenerator *)self didParseTiles];
  [(PXFeedLayoutGenerator *)self setParsedFrameBlock:0];
}

- (PXFeedLayoutGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedLayoutGenerator;
  CGSize result = [(PXFeedLayoutGenerator *)&v3 init];
  if (result) {
    result->_roundingScale = 1.0;
  }
  return result;
}

@end