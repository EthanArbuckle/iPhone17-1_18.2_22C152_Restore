@interface PXVerticalFeedLayoutGenerator
- (BOOL)_addRowWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4;
- (BOOL)_addRowWithTiles:(PXTileInfo *)a3 imageFrames:(CGRect *)a4 count:(int64_t)a5;
- (BOOL)_addSpecialSequenceBlock:(PXTileInfo *)a3;
- (BOOL)_dequeueCaption;
- (BOOL)_dequeueComments;
- (BOOL)_dequeueLikes;
- (BOOL)_hasEnqueuedCaption;
- (BOOL)_hasEnqueuedComments;
- (BOOL)_hasEnqueuedLikes;
- (BOOL)_hasLeftSuboptimalRow;
- (BOOL)_isAtEndOfRow;
- (BOOL)_parseSingleTile;
- (BOOL)_parseSpecialSequence;
- (BOOL)_parseSpecialSubsequenceWithRowRequired:(BOOL)a3 rowParsed:(BOOL *)a4;
- (BOOL)_parseSpecialTileTriplet;
- (BOOL)_parseTilePair;
- (BOOL)_parseTileRequiringFullWidth;
- (BOOL)_parseTileTriplet;
- (BOOL)_scanNonPanoramaSequence:(PXTileInfo *)a3 count:(int64_t)a4;
- (BOOL)_scanSpecialSequenceBlock:(PXTileInfo *)a3;
- (BOOL)_scanSpecialSequenceRow:(PXTileInfo *)a3 count:(int64_t *)a4;
- (BOOL)_scanTilePair:(PXTileInfo *)a3;
- (BOOL)_scanTileRequiringNewRow:(PXTileInfo *)a3;
- (BOOL)_scanTileTriplet:(PXTileInfo *)a3;
- (BOOL)_scanTripletWithLargeLead:(PXTileInfo *)a3;
- (BOOL)_scanTripletWithRearrangment:(PXTileInfo *)a3;
- (BOOL)parseNextTiles;
- (BOOL)shouldDisplayCaptionsBelowBatches;
- (double)referenceWidth;
- (void)_enqueueCaptionWithTileInfo:(PXTileInfo *)a3;
- (void)_enqueueCommentsWithTileInfo:(PXTileInfo *)a3;
- (void)_enqueueLikesWithTileInfo:(PXTileInfo *)a3;
- (void)_enumerateRowFramesWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4 useMagneticGuidelines:(BOOL)a5 block:(id)a6;
- (void)_willAddCaptionRowWithFirstTileInfo:(PXTileInfo *)a3;
- (void)_willAddCommentRowsWithFirstTileInfo:(PXTileInfo *)a3;
- (void)_willAddLikeRowWithFirstTileInfo:(PXTileInfo *)a3;
- (void)didParseTiles;
- (void)setReferenceWidth:(double)a3;
- (void)setShouldDisplayCaptionsBelowBatches:(BOOL)a3;
- (void)willParseTiles;
@end

@implementation PXVerticalFeedLayoutGenerator

- (void)setShouldDisplayCaptionsBelowBatches:(BOOL)a3
{
  self->_shouldDisplayCaptionsBelowBatches = a3;
}

- (BOOL)shouldDisplayCaptionsBelowBatches
{
  return self->_shouldDisplayCaptionsBelowBatches;
}

- (void)setReferenceWidth:(double)a3
{
  self->_referenceWidth = a3;
}

- (double)referenceWidth
{
  return self->_referenceWidth;
}

- (void)_willAddCommentRowsWithFirstTileInfo:(PXTileInfo *)a3
{
  if (a3->commentCount >= 1)
  {
    long long v3 = *(_OWORD *)&a3->imageSize.height;
    v5[0] = *(_OWORD *)&a3->index;
    v5[1] = v3;
    long long v4 = *(_OWORD *)&a3->commentCount;
    v5[2] = *(_OWORD *)&a3->minimumSize.height;
    v5[3] = v4;
    [(PXVerticalFeedLayoutGenerator *)self _enqueueCommentsWithTileInfo:v5];
  }
}

- (void)_willAddLikeRowWithFirstTileInfo:(PXTileInfo *)a3
{
  if (a3->hasLikes)
  {
    long long v3 = *(_OWORD *)&a3->imageSize.height;
    v5[0] = *(_OWORD *)&a3->index;
    v5[1] = v3;
    long long v4 = *(_OWORD *)&a3->commentCount;
    v5[2] = *(_OWORD *)&a3->minimumSize.height;
    v5[3] = v4;
    [(PXVerticalFeedLayoutGenerator *)self _enqueueLikesWithTileInfo:v5];
  }
}

- (void)_willAddCaptionRowWithFirstTileInfo:(PXTileInfo *)a3
{
  if (a3->isBatchStart
    && ![(PXVerticalFeedLayoutGenerator *)self _dequeueCaption]
    && a3->hasCaption
    && a3->index >= 1)
  {
    [(PXFeedLayoutGenerator *)self noCaptionSpacing];
    self->_origin.y = v5 + self->_origin.y;
  }
  if (a3->hasCaption)
  {
    long long v6 = *(_OWORD *)&a3->imageSize.height;
    v8[0] = *(_OWORD *)&a3->index;
    v8[1] = v6;
    long long v7 = *(_OWORD *)&a3->commentCount;
    v8[2] = *(_OWORD *)&a3->minimumSize.height;
    v8[3] = v7;
    [(PXVerticalFeedLayoutGenerator *)self _enqueueCaptionWithTileInfo:v8];
    if (![(PXVerticalFeedLayoutGenerator *)self shouldDisplayCaptionsBelowBatches]) {
      [(PXVerticalFeedLayoutGenerator *)self _dequeueCaption];
    }
  }
}

- (BOOL)_addSpecialSequenceBlock:(PXTileInfo *)a3
{
  char v5 = [(PXFeedLayoutGenerator *)self scanSpecialSequenceCount];
  double width = a3->imageSize.width;
  double height = a3->imageSize.height;
  [(PXFeedLayoutGenerator *)self interTileSpacing];
  double v9 = v8;
  [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
  [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:height * ((v10 - v9) / 3.0 / width)];
  [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
  if ((v5 & 1) == 0)
  {
    [(PXFeedLayoutGenerator *)self valueByRounding:1 usingMagneticGuidelines:(v11 + v11) / 3.0];
    PXRectWithEdges();
  }
  [(PXFeedLayoutGenerator *)self valueByRounding:1 usingMagneticGuidelines:v11 / 3.0];
  PXRectWithEdges();
}

- (BOOL)_addRowWithTiles:(PXTileInfo *)a3 imageFrames:(CGRect *)a4 count:(int64_t)a5
{
  int64_t v5 = a5;
  long long v7 = a3;
  if (a5 < 2)
  {
LABEL_6:
    long long v12 = *(_OWORD *)&a3->imageSize.height;
    long long v32 = *(_OWORD *)&a3->index;
    long long v33 = v12;
    long long v13 = *(_OWORD *)&a3->commentCount;
    long long v34 = *(_OWORD *)&a3->minimumSize.height;
    long long v35 = v13;
    [(PXVerticalFeedLayoutGenerator *)self _willAddCaptionRowWithFirstTileInfo:&v32];
    long long v14 = *(_OWORD *)&v7->imageSize.height;
    long long v32 = *(_OWORD *)&v7->index;
    long long v33 = v14;
    long long v15 = *(_OWORD *)&v7->commentCount;
    long long v34 = *(_OWORD *)&v7->minimumSize.height;
    long long v35 = v15;
    [(PXVerticalFeedLayoutGenerator *)self _willAddLikeRowWithFirstTileInfo:&v32];
    long long v16 = *(_OWORD *)&v7->imageSize.height;
    long long v32 = *(_OWORD *)&v7->index;
    long long v33 = v16;
    long long v17 = *(_OWORD *)&v7->commentCount;
    long long v34 = *(_OWORD *)&v7->minimumSize.height;
    long long v35 = v17;
    [(PXVerticalFeedLayoutGenerator *)self _willAddCommentRowsWithFirstTileInfo:&v32];
    double x = self->_origin.x;
    double y = self->_origin.y;
    if (y > 0.0)
    {
      [(PXFeedLayoutGenerator *)self interTileSpacing];
      double y = y + v20;
    }
    if (v5 >= 1)
    {
      p_size = &a4->size;
      do
      {
        indedouble x = v7->index;
        ++v7;
        double width = p_size[-1].width;
        double height = p_size[-1].height;
        double v25 = p_size->width;
        double v26 = p_size->height;
        p_size += 2;
        CGFloat v27 = x + width;
        CGFloat v28 = y + height;
        -[PXFeedLayoutGenerator parsedFrame:type:forTileAtIndex:](self, "parsedFrame:type:forTileAtIndex:", 0, index, x + width, y + height, v25, v26);
        double v29 = self->_origin.y;
        v36.origin.double x = v27;
        v36.origin.double y = v28;
        v36.size.double width = v25;
        v36.size.double height = v26;
        double MaxY = CGRectGetMaxY(v36);
        if (v29 >= MaxY) {
          double MaxY = v29;
        }
        self->_origin.double y = MaxY;
        --v5;
      }
      while (v5);
    }
    return 1;
  }
  else
  {
    p_double height = &a3->minimumSize.height;
    double v10 = &a4->size.height;
    int64_t v11 = a5;
    while (*(v10 - 1) >= *(p_height - 1) && *v10 >= *p_height)
    {
      p_height += 8;
      v10 += 4;
      if (!--v11) {
        goto LABEL_6;
      }
    }
    return 0;
  }
}

- (void)_enumerateRowFramesWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4 useMagneticGuidelines:(BOOL)a5 block:(id)a6
{
  BOOL v6 = a5;
  double v10 = (void (**)(id, int64_t, unsigned char *, double, double, double, double))a6;
  [(PXFeedLayoutGenerator *)self interTileSpacing];
  double v12 = v11;
  double v14 = v13;
  if (a4 < 1)
  {
    double v16 = 0.0;
  }
  else
  {
    p_double height = &a3->imageSize.height;
    double v16 = 0.0;
    int64_t v17 = a4;
    do
    {
      double v16 = v16 + *(p_height - 1) / *p_height;
      p_height += 8;
      --v17;
    }
    while (v17);
  }
  [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
  double v19 = (v18 - (double)(a4 - 1) * v12) / v16;
  [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v19];
  double v21 = v20;
  p_origin = &self->_origin;
  double y = self->_origin.y;
  double v24 = -0.0;
  if (y > 0.0) {
    double v24 = v14;
  }
  if (a4 >= 1)
  {
    int64_t v25 = 0;
    double v26 = y + v24;
    double x = p_origin->x;
    CGFloat v28 = &a3->imageSize.height;
    double v29 = p_origin->x;
    do
    {
      double v30 = x + *(v28 - 1) / *v28 * v19;
      if (v25 >= a4 - 1) {
        double v31 = 0.0;
      }
      else {
        double v31 = v12 * 0.5;
      }
      [(PXFeedLayoutGenerator *)self valueByRounding:v6 usingMagneticGuidelines:v31 + v30];
      double v33 = v32 - v31;
      [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
      if (v33 >= v34) {
        double v33 = v34;
      }
      char v35 = 0;
      v10[2](v10, v25, &v35, v29, v26, v33 - v29, v21);
      if (v35) {
        break;
      }
      double x = v12 + v30;
      double v29 = v12 + v33;
      ++v25;
      v28 += 8;
    }
    while (a4 != v25);
  }
}

- (BOOL)_addRowWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4
{
  uint64_t v31 = 0;
  double v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v27 = 0;
  CGFloat v28 = &v27;
  uint64_t v29 = 0x2020000000;
  BOOL v30 = 0;
  BOOL v30 = [(PXFeedLayoutGenerator *)self numberOfMagneticGuidelines] > 0;
  if (*((unsigned char *)v28 + 24))
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke;
    v26[3] = &unk_1E5DD23D0;
    v26[4] = &v27;
    [(PXVerticalFeedLayoutGenerator *)self _enumerateRowFramesWithContiguousTiles:a3 count:a4 useMagneticGuidelines:1 block:v26];
  }
  if (a4 >= 2)
  {
    p_double height = &a3->minimumSize.height;
    int64_t v8 = a4;
    while (*(p_height - 1) == *MEMORY[0x1E4F1DB30] && *p_height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      p_height += 8;
      if (!--v8) {
        goto LABEL_11;
      }
    }
    uint64_t v10 = *((unsigned __int8 *)v28 + 24);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_2;
    v25[3] = &unk_1E5DD23F8;
    v25[4] = &v31;
    v25[5] = a3;
    [(PXVerticalFeedLayoutGenerator *)self _enumerateRowFramesWithContiguousTiles:a3 count:a4 useMagneticGuidelines:v10 block:v25];
  }
LABEL_11:
  if (*((unsigned char *)v32 + 24))
  {
    long long v11 = *(_OWORD *)&a3->imageSize.height;
    long long v21 = *(_OWORD *)&a3->index;
    long long v22 = v11;
    long long v12 = *(_OWORD *)&a3->commentCount;
    long long v23 = *(_OWORD *)&a3->minimumSize.height;
    long long v24 = v12;
    [(PXVerticalFeedLayoutGenerator *)self _willAddCaptionRowWithFirstTileInfo:&v21];
    long long v13 = *(_OWORD *)&a3->imageSize.height;
    long long v21 = *(_OWORD *)&a3->index;
    long long v22 = v13;
    long long v14 = *(_OWORD *)&a3->commentCount;
    long long v23 = *(_OWORD *)&a3->minimumSize.height;
    long long v24 = v14;
    [(PXVerticalFeedLayoutGenerator *)self _willAddLikeRowWithFirstTileInfo:&v21];
    long long v15 = *(_OWORD *)&a3->imageSize.height;
    long long v21 = *(_OWORD *)&a3->index;
    long long v22 = v15;
    long long v16 = *(_OWORD *)&a3->commentCount;
    long long v23 = *(_OWORD *)&a3->minimumSize.height;
    long long v24 = v16;
    [(PXVerticalFeedLayoutGenerator *)self _willAddCommentRowsWithFirstTileInfo:&v21];
    uint64_t v17 = *((unsigned __int8 *)v28 + 24);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_3;
    v20[3] = &unk_1E5DD2420;
    v20[4] = self;
    v20[5] = a3;
    [(PXVerticalFeedLayoutGenerator *)self _enumerateRowFramesWithContiguousTiles:a3 count:a4 useMagneticGuidelines:v17 block:v20];
    BOOL v18 = *((unsigned char *)v32 + 24) != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  return v18;
}

uint64_t __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke(uint64_t result, double a2, double a3, double a4, uint64_t a5, unsigned char *a6)
{
  if (a4 < 0.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *a6 = 1;
  }
  return result;
}

void __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v13 = *(void *)(a1 + 40) + (a2 << 6);
  double v15 = *(double *)(v13 + 24);
  double v14 = *(double *)(v13 + 32);
  if (CGRectGetWidth(*(CGRect *)&a4) < v15
    || (v16.origin.x = a4, v16.origin.y = a5, v16.size.double width = a6, v16.size.height = a7, CGRectGetHeight(v16) < v14))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_3(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  objc_msgSend(*(id *)(a1 + 32), "parsedFrame:type:forTileAtIndex:", 0, *(void *)(*(void *)(a1 + 40) + (a2 << 6)));
  double v11 = *(double *)(*(void *)(a1 + 32) + 1672);
  v13.origin.double x = a3;
  v13.origin.double y = a4;
  v13.size.double width = a5;
  v13.size.double height = a6;
  double MaxY = CGRectGetMaxY(v13);
  if (v11 >= MaxY) {
    double MaxY = v11;
  }
  *(double *)(*(void *)(a1 + 32) + 1672) = MaxY;
}

- (BOOL)_dequeueComments
{
  BOOL v3 = [(PXVerticalFeedLayoutGenerator *)self _hasEnqueuedComments];
  if (v3)
  {
    p_enqueuedCommentsTileInfo = &self->_enqueuedCommentsTileInfo;
    int64_t commentCount = self->_enqueuedCommentsTileInfo.commentCount;
    if (commentCount >= 1)
    {
      for (uint64_t i = 0; i != commentCount; ++i)
      {
        [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
        -[PXFeedLayoutGenerator commentSizeForTileAtIndex:commentIndex:proposedSize:](self, "commentSizeForTileAtIndex:commentIndex:proposedSize:", p_enqueuedCommentsTileInfo->index, i);
        CGFloat v8 = v7;
        CGFloat v10 = v9;
        double x = self->_origin.x;
        double y = self->_origin.y;
        -[PXFeedLayoutGenerator parsedFrame:type:forCommentAtIndex:](self, "parsedFrame:type:forCommentAtIndex:", 3, i, x, y, v7, v9);
        v14.origin.double x = x;
        v14.origin.double y = y;
        v14.size.double width = v8;
        v14.size.double height = v10;
        self->_origin.double y = CGRectGetMaxY(v14);
      }
    }
    p_enqueuedCommentsTileInfo->indedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (BOOL)_hasEnqueuedComments
{
  return self->_enqueuedCommentsTileInfo.index != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_enqueueCommentsWithTileInfo:(PXTileInfo *)a3
{
  [(PXVerticalFeedLayoutGenerator *)self _dequeueComments];
  long long v5 = *(_OWORD *)&a3->commentCount;
  long long v7 = *(_OWORD *)&a3->index;
  long long v6 = *(_OWORD *)&a3->imageSize.height;
  *(_OWORD *)&self->_enqueuedCommentsTileInfo.minimumSize.double height = *(_OWORD *)&a3->minimumSize.height;
  *(_OWORD *)&self->_enqueuedCommentsTileInfo.int64_t commentCount = v5;
  *(_OWORD *)&self->_enqueuedCommentsTileInfo.indedouble x = v7;
  *(_OWORD *)&self->_enqueuedCommentsTileInfo.imageSize.double height = v6;
}

- (BOOL)_dequeueLikes
{
  BOOL v3 = [(PXVerticalFeedLayoutGenerator *)self _hasEnqueuedLikes];
  if (v3)
  {
    [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
    -[PXFeedLayoutGenerator likesSizeForTileAtIndex:proposedSize:](self, "likesSizeForTileAtIndex:proposedSize:", self->_enqueuedLikesTileInfo.index);
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double x = self->_origin.x;
    double y = self->_origin.y;
    -[PXFeedLayoutGenerator parsedFrame:type:forLikesAtIndex:](self, "parsedFrame:type:forLikesAtIndex:", 2, self->_enqueuedLikesTileInfo.index, x, y, v4, v6);
    v11.origin.double x = x;
    v11.origin.double y = y;
    v11.size.double width = v5;
    v11.size.double height = v7;
    self->_origin.double y = CGRectGetMaxY(v11);
    self->_enqueuedLikesTileInfo.indedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (BOOL)_hasEnqueuedLikes
{
  return self->_enqueuedLikesTileInfo.index != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_enqueueLikesWithTileInfo:(PXTileInfo *)a3
{
  [(PXVerticalFeedLayoutGenerator *)self _dequeueLikes];
  long long v5 = *(_OWORD *)&a3->commentCount;
  long long v7 = *(_OWORD *)&a3->index;
  long long v6 = *(_OWORD *)&a3->imageSize.height;
  *(_OWORD *)&self->_enqueuedLikesTileInfo.minimumSize.double height = *(_OWORD *)&a3->minimumSize.height;
  *(_OWORD *)&self->_enqueuedLikesTileInfo.int64_t commentCount = v5;
  *(_OWORD *)&self->_enqueuedLikesTileInfo.indedouble x = v7;
  *(_OWORD *)&self->_enqueuedLikesTileInfo.imageSize.double height = v6;
}

- (BOOL)_dequeueCaption
{
  BOOL v3 = [(PXVerticalFeedLayoutGenerator *)self _hasEnqueuedCaption];
  if (v3)
  {
    if ([(PXVerticalFeedLayoutGenerator *)self shouldDisplayCaptionsBelowBatches]
      || self->_enqueuedCaptionTileInfo.index >= 1)
    {
      [(PXFeedLayoutGenerator *)self captionPadding];
      self->_origin.double y = v4 + self->_origin.y;
    }
    [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
    -[PXFeedLayoutGenerator captionSizeForTileAtIndex:proposedSize:](self, "captionSizeForTileAtIndex:proposedSize:", self->_enqueuedCaptionTileInfo.index);
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double x = self->_origin.x;
    double y = self->_origin.y;
    -[PXFeedLayoutGenerator parsedFrame:type:forTileAtIndex:](self, "parsedFrame:type:forTileAtIndex:", 1, self->_enqueuedCaptionTileInfo.index, x, y, v5, v7);
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = v6;
    v13.size.double height = v8;
    self->_origin.double y = CGRectGetMaxY(v13);
    if ([(PXVerticalFeedLayoutGenerator *)self shouldDisplayCaptionsBelowBatches]
      || self->_enqueuedCaptionTileInfo.index >= 1)
    {
      [(PXFeedLayoutGenerator *)self captionPadding];
      self->_origin.double y = self->_origin.y + v11;
    }
    self->_enqueuedCaptionTileInfo.indedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (BOOL)_hasEnqueuedCaption
{
  return self->_enqueuedCaptionTileInfo.index != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_enqueueCaptionWithTileInfo:(PXTileInfo *)a3
{
  [(PXVerticalFeedLayoutGenerator *)self _dequeueCaption];
  long long v5 = *(_OWORD *)&a3->commentCount;
  long long v7 = *(_OWORD *)&a3->index;
  long long v6 = *(_OWORD *)&a3->imageSize.height;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.minimumSize.double height = *(_OWORD *)&a3->minimumSize.height;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.int64_t commentCount = v5;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.indedouble x = v7;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.imageSize.double height = v6;
}

- (BOOL)_isAtEndOfRow
{
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  BOOL v4 = [(PXFeedLayoutGenerator *)self isAtEnd]
    || [(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0];
  [(PXFeedLayoutGenerator *)self setScanState:v3];

  return v4;
}

- (BOOL)_hasLeftSuboptimalRow
{
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:0]) {
    BOOL v4 = [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow];
  }
  else {
    BOOL v4 = 0;
  }
  [(PXFeedLayoutGenerator *)self setScanState:v3];

  return v4;
}

- (BOOL)_scanTripletWithRearrangment:(PXTileInfo *)a3
{
  if (!a3)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXVerticalFeedLayoutGenerator.m", 598, @"Invalid parameter not satisfying: %@", @"tileInfos != NULL" object file lineNumber description];
  }
  long long v5 = [(PXFeedLayoutGenerator *)self scanState];
  if (![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0])
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow])
  {
    BOOL v6 = 1;
  }
  else
  {
    [(PXFeedLayoutGenerator *)self setScanState:v5];
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_scanTripletWithLargeLead:(PXTileInfo *)a3
{
  if (!a3)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXVerticalFeedLayoutGenerator.m", 469, @"Invalid parameter not satisfying: %@", @"tileInfos != NULL" object file lineNumber description];
  }
  long long v5 = [(PXFeedLayoutGenerator *)self scanState];
  if (![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow])
  {
    goto LABEL_80;
  }
  [(PXFeedLayoutGenerator *)self setScanState:v5];
  if (![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow])
  {
    goto LABEL_80;
  }
  [(PXFeedLayoutGenerator *)self setScanState:v5];
  if (![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow])
  {
    goto LABEL_80;
  }
  [(PXFeedLayoutGenerator *)self setScanState:v5];
  if (![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow])
  {
    goto LABEL_80;
  }
  if (([(PXFeedLayoutGenerator *)self setScanState:v5],
        ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[1]]
    && ![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
    && [(PXVerticalFeedLayoutGenerator *)self _isAtEndOfRow])
  {
LABEL_80:
    BOOL v6 = 1;
  }
  else
  {
    [(PXFeedLayoutGenerator *)self setScanState:v5];
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_scanNonPanoramaSequence:(PXTileInfo *)a3 count:(int64_t)a4
{
  int64_t v7 = a4 - 1;
  if (a4 <= 1)
  {
    CGRect v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXVerticalFeedLayoutGenerator.m", 443, @"Invalid parameter not satisfying: %@", @"count >= 2" object file lineNumber description];
  }
  CGFloat v8 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]
    || (uint64_t v15 = 0, ![(PXFeedLayoutGenerator *)self scanTile:a3 type:&v15])
    || (unint64_t)(v15 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_15:
    [(PXFeedLayoutGenerator *)self setScanState:v8];
    BOOL v11 = 0;
    goto LABEL_16;
  }
  if (a4 >= 2)
  {
    double v9 = a3 + 1;
    while (![(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0])
    {
      CGFloat v10 = a3 ? v9 : 0;
      if (![(PXFeedLayoutGenerator *)self scanTile:v10 ofType:v15]) {
        break;
      }
      ++v9;
      if (!--v7) {
        goto LABEL_14;
      }
    }
    goto LABEL_15;
  }
LABEL_14:
  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (BOOL)_scanSpecialSequenceRow:(PXTileInfo *)a3 count:(int64_t *)a4
{
  int64_t v7 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:a3])
  {
    int64_t v8 = 1;
  }
  else
  {
    [(PXFeedLayoutGenerator *)self setScanState:v7];
    if ([(PXVerticalFeedLayoutGenerator *)self _scanNonPanoramaSequence:a3 count:3]&& ![(PXVerticalFeedLayoutGenerator *)self _hasLeftSuboptimalRow])
    {
      int64_t v8 = 3;
    }
    else
    {
      [(PXFeedLayoutGenerator *)self setScanState:v7];
      if (![(PXVerticalFeedLayoutGenerator *)self _scanNonPanoramaSequence:a3 count:2]|| [(PXVerticalFeedLayoutGenerator *)self _hasLeftSuboptimalRow])
      {
        [(PXFeedLayoutGenerator *)self setScanState:v7];
        BOOL v9 = 0;
        goto LABEL_11;
      }
      int64_t v8 = 2;
    }
  }
  if (a4) {
    *a4 = v8;
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_scanSpecialSequenceBlock:(PXTileInfo *)a3
{
  return [(PXVerticalFeedLayoutGenerator *)self _scanNonPanoramaSequence:a3 count:3];
}

- (BOOL)_scanTileTriplet:(PXTileInfo *)a3
{
  long long v5 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]
    || ![(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:a3]
    || [(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    || (a3 ? (BOOL v6 = a3 + 1) : (BOOL v6 = 0),
        ![(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v6]
     || [(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
     || (a3 ? (int64_t v7 = a3 + 2) : (int64_t v7 = 0),
         ![(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v7]
      || [(PXVerticalFeedLayoutGenerator *)self _hasLeftSuboptimalRow])))
  {
    [(PXFeedLayoutGenerator *)self setScanState:v5];
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)_scanTilePair:(PXTileInfo *)a3
{
  long long v5 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]
    || ![(PXFeedLayoutGenerator *)self scanAnyTile:a3]
    || [(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]
    || (a3 ? (BOOL v6 = a3 + 1) : (BOOL v6 = 0), ![(PXFeedLayoutGenerator *)self scanAnyTile:v6]))
  {
    [(PXFeedLayoutGenerator *)self setScanState:v5];
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_scanTileRequiringNewRow:(PXTileInfo *)a3
{
  long long v5 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:a3])
  {
LABEL_2:
    LOBYTE(v6) = 1;
    goto LABEL_3;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  memset(v8, 0, sizeof(v8));
  BOOL v6 = [(PXFeedLayoutGenerator *)self scanAnyTile:v8];
  if (v6 && !BYTE8(v9))
  {
    if (![v5 scannedBatchHasCaption] || !BYTE8(v10))
    {
      [(PXFeedLayoutGenerator *)self setScanState:v5];
      LOBYTE(v6) = 0;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v6;
}

- (BOOL)_parseSpecialSubsequenceWithRowRequired:(BOOL)a3 rowParsed:(BOOL *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXVerticalFeedLayoutGenerator *)self _scanSpecialSequenceBlock:v14])
  {
    BOOL v8 = [(PXFeedLayoutGenerator *)self scanState];
    uint64_t v12 = 0;
    if ([(PXVerticalFeedLayoutGenerator *)self _scanSpecialSequenceRow:v13 count:&v12])
    {
      if ([(PXVerticalFeedLayoutGenerator *)self _addSpecialSequenceBlock:v14])
      {
        if ([(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v13 count:v12])
        {
          BOOL v9 = 1;
        }
        else
        {
          [(PXFeedLayoutGenerator *)self setScanState:v8];
          BOOL v9 = 0;
        }
        BOOL v10 = 1;
LABEL_14:

        if (!a4) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    else if (!a3 && ![(PXVerticalFeedLayoutGenerator *)self _hasLeftSuboptimalRow])
    {
      BOOL v10 = [(PXVerticalFeedLayoutGenerator *)self _addSpecialSequenceBlock:v14];
      BOOL v9 = 0;
      goto LABEL_14;
    }
    BOOL v9 = 0;
    BOOL v10 = 0;
    goto LABEL_14;
  }
  BOOL v9 = 0;
  BOOL v10 = 0;
  if (a4) {
LABEL_15:
  }
    *a4 = v9;
LABEL_16:
  if (!v10) {
    [(PXFeedLayoutGenerator *)self setScanState:v7];
  }

  return v10;
}

- (BOOL)_parseSpecialSequence
{
  char v5 = 0;
  BOOL v3 = [(PXVerticalFeedLayoutGenerator *)self _parseSpecialSubsequenceWithRowRequired:1 rowParsed:&v5];
  if (v3)
  {
    do
    {
      if (!v5) {
        break;
      }
      if ([(PXFeedLayoutGenerator *)self shouldStop]) {
        break;
      }
      char v5 = 0;
    }
    while ([(PXVerticalFeedLayoutGenerator *)self _parseSpecialSubsequenceWithRowRequired:0 rowParsed:&v5]);
  }
  return v3;
}

- (BOOL)_parseSpecialTileTriplet
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]) {
    goto LABEL_37;
  }
  if (![(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v57]) {
    goto LABEL_37;
  }
  if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]) {
    goto LABEL_37;
  }
  if (![(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v58]) {
    goto LABEL_37;
  }
  if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]) {
    goto LABEL_37;
  }
  if (![(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v59]) {
    goto LABEL_37;
  }
  if ([(PXVerticalFeedLayoutGenerator *)self _hasLeftSuboptimalRow]) {
    goto LABEL_37;
  }
  [(PXFeedLayoutGenerator *)self interTileSpacing];
  double v5 = v4;
  double v7 = v6;
  [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
  double v9 = v8 - v5;
  double v10 = v9 * 0.75;
  [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v9 * 0.5];
  double v12 = v11 + v11;
  [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v10 * 0.5];
  double v14 = v13 + v13;
  double v15 = v5 + v12 * 0.5;
  [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
  long long v51 = *(unint64_t *)&v15;
  *(double *)&long long v52 = v16 - v15;
  *((double *)&v52 + 1) = v14 * 0.5;
  [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
  *(double *)&long long v53 = v15;
  *((double *)&v53 + 1) = v7 + v14 * 0.5;
  *(double *)&long long v54 = v17 - v15;
  *((double *)&v54 + 1) = v14 * 0.5;
  if (![(PXVerticalFeedLayoutGenerator *)self _addRowWithTiles:v57 imageFrames:&v49 count:3])
  {
LABEL_37:
    [(PXFeedLayoutGenerator *)self setScanState:v3];
    if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]) {
      goto LABEL_38;
    }
    if (![(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v57]) {
      goto LABEL_38;
    }
    if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]) {
      goto LABEL_38;
    }
    if (![(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v58]) {
      goto LABEL_38;
    }
    if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]) {
      goto LABEL_38;
    }
    if (![(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v59]) {
      goto LABEL_38;
    }
    if ([(PXVerticalFeedLayoutGenerator *)self _hasLeftSuboptimalRow]) {
      goto LABEL_38;
    }
    [(PXFeedLayoutGenerator *)self interTileSpacing];
    double v19 = v18;
    double v21 = v20;
    [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
    double v23 = v22 - v19;
    double v24 = v23 * 0.75;
    [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v23 * 0.5];
    double v26 = v25 + v25;
    [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v24 * 0.5];
    double v28 = v27 + v27;
    double v29 = v26 * 0.5;
    double v30 = (v27 + v27) * 0.5;
    *(double *)&long long v50 = v26 * 0.5;
    *((double *)&v50 + 1) = v30;
    *(double *)&unint64_t v31 = v19 + v26 * 0.5;
    [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
    long long v51 = v31;
    *(double *)&long long v52 = v32 - *(double *)&v31;
    *((double *)&v52 + 1) = v21 + v28;
    *(void *)&long long v53 = 0;
    *((double *)&v53 + 1) = v19 + v28 * 0.5;
    *(double *)&long long v54 = v29;
    *((double *)&v54 + 1) = v30;
    if (![(PXVerticalFeedLayoutGenerator *)self _addRowWithTiles:v57 imageFrames:&v49 count:3])
    {
LABEL_38:
      [(PXFeedLayoutGenerator *)self setScanState:v3];
      if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:0]) {
        goto LABEL_26;
      }
      if (![(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v57]) {
        goto LABEL_26;
      }
      if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]) {
        goto LABEL_26;
      }
      if (![(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v58]) {
        goto LABEL_26;
      }
      if ([(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringNewRow:0]) {
        goto LABEL_26;
      }
      if (![(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v59]) {
        goto LABEL_26;
      }
      if ([(PXVerticalFeedLayoutGenerator *)self _hasLeftSuboptimalRow]) {
        goto LABEL_26;
      }
      [(PXFeedLayoutGenerator *)self interTileSpacing];
      double v34 = v33;
      double v36 = v35;
      [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
      double v38 = v37 - v34;
      double v39 = v38 * 0.75;
      [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v38 * 0.5];
      double v41 = v40 + v40;
      [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v39 * 0.5];
      double v43 = v42 + v42;
      *((double *)&v51 + 1) = v34 + (v42 + v42) * 0.5;
      *((double *)&v52 + 1) = (v42 + v42) * 0.5;
      *(double *)&unint64_t v44 = v34 + v41 * 0.5;
      [(PXVerticalFeedLayoutGenerator *)self referenceWidth];
      long long v53 = v44;
      *(double *)&long long v54 = v45 - *(double *)&v44;
      *((double *)&v54 + 1) = v36 + v43;
      if (![(PXVerticalFeedLayoutGenerator *)self _addRowWithTiles:v57 imageFrames:&v49 count:3])
      {
LABEL_26:
        [(PXFeedLayoutGenerator *)self setScanState:v3];
        if ([(PXVerticalFeedLayoutGenerator *)self _scanTripletWithLargeLead:v57])
        {
          BOOL v46 = 1;
          [(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v57 count:1];
          if ([(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v58 count:2])
          {
            goto LABEL_34;
          }
          BOOL v46 = 1;
          [(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v58 count:1];
          v47 = v59;
        }
        else
        {
          [(PXFeedLayoutGenerator *)self setScanState:v3];
          if (![(PXVerticalFeedLayoutGenerator *)self _scanTripletWithRearrangment:v57])goto LABEL_33; {
          long long v49 = v57[0];
          }
          long long v50 = v57[1];
          long long v51 = v57[2];
          long long v52 = v57[3];
          long long v53 = v59[0];
          long long v54 = v59[1];
          long long v55 = v59[2];
          long long v56 = v59[3];
          if (![(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:&v49 count:2])
          {
LABEL_33:
            [(PXFeedLayoutGenerator *)self setScanState:v3];
            BOOL v46 = 0;
            goto LABEL_34;
          }
          v47 = v58;
          BOOL v46 = 1;
        }
        [(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v47 count:1];
        goto LABEL_34;
      }
    }
  }
  BOOL v46 = 1;
LABEL_34:

  return v46;
}

- (BOOL)_parseTileRequiringFullWidth
{
  memset(v5, 0, sizeof(v5));
  BOOL v3 = [(PXVerticalFeedLayoutGenerator *)self _scanTileRequiringFullWidth:v5];
  if (v3) {
    [(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v5 count:1];
  }
  return v3;
}

- (BOOL)_parseTileTriplet
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  if (![(PXVerticalFeedLayoutGenerator *)self _scanTileTriplet:v6]) {
    goto LABEL_5;
  }
  if (![(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v6 count:3])
  {
    [(PXFeedLayoutGenerator *)self setScanState:v3];
LABEL_5:
    BOOL v4 = 0;
    goto LABEL_6;
  }
  BOOL v4 = 1;
LABEL_6:

  return v4;
}

- (BOOL)_parseTilePair
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  if (![(PXVerticalFeedLayoutGenerator *)self _scanTilePair:v6]) {
    goto LABEL_5;
  }
  if (![(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v6 count:2])
  {
    [(PXFeedLayoutGenerator *)self setScanState:v3];
LABEL_5:
    BOOL v4 = 0;
    goto LABEL_6;
  }
  BOOL v4 = 1;
LABEL_6:

  return v4;
}

- (BOOL)_parseSingleTile
{
  memset(v5, 0, sizeof(v5));
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanAnyTile:v5];
  if (v3) {
    [(PXVerticalFeedLayoutGenerator *)self _addRowWithContiguousTiles:v5 count:1];
  }
  return v3;
}

- (void)didParseTiles
{
  v3.receiver = self;
  v3.super_class = (Class)PXVerticalFeedLayoutGenerator;
  [(PXFeedLayoutGenerator *)&v3 didParseTiles];
  [(PXVerticalFeedLayoutGenerator *)self _dequeueCaption];
  [(PXVerticalFeedLayoutGenerator *)self _dequeueLikes];
  [(PXVerticalFeedLayoutGenerator *)self _dequeueComments];
}

- (BOOL)parseNextTiles
{
  if ([(PXVerticalFeedLayoutGenerator *)self _parseTileRequiringFullWidth]
    || [(PXVerticalFeedLayoutGenerator *)self _parseSpecialSequence]
    || [(PXVerticalFeedLayoutGenerator *)self _parseSpecialTileTriplet]
    || [(PXVerticalFeedLayoutGenerator *)self _parseTileTriplet]
    || [(PXVerticalFeedLayoutGenerator *)self _parseTilePair])
  {
    return 1;
  }
  return [(PXVerticalFeedLayoutGenerator *)self _parseSingleTile];
}

- (void)willParseTiles
{
  v3.receiver = self;
  v3.super_class = (Class)PXVerticalFeedLayoutGenerator;
  [(PXFeedLayoutGenerator *)&v3 willParseTiles];
  self->_origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_enqueuedCaptionTileInfo.indedouble x = 0x7FFFFFFFFFFFFFFFLL;
  self->_enqueuedLikesTileInfo.indedouble x = 0x7FFFFFFFFFFFFFFFLL;
  self->_enqueuedCommentsTileInfo.indedouble x = 0x7FFFFFFFFFFFFFFFLL;
}

@end