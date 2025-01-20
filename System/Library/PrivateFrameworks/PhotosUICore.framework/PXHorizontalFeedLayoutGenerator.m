@interface PXHorizontalFeedLayoutGenerator
- (BOOL)_addColumnWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4;
- (BOOL)_addColumnWithTiles:(PXTileInfo *)a3 imageFrames:(CGRect *)a4 count:(int64_t)a5;
- (BOOL)_addSpecialSequenceBlock:(PXTileInfo *)a3;
- (BOOL)_hasLeftSuboptimalColumn;
- (BOOL)_parseSingleTile;
- (BOOL)_parseSpecialSequence;
- (BOOL)_parseSpecialSubsequenceWithColumnRequired:(BOOL)a3 columnParsed:(BOOL *)a4;
- (BOOL)_parseSpecialTileTriplet;
- (BOOL)_parseTilePair;
- (BOOL)_parseTileTriplet;
- (BOOL)_scanNonPanoramaSequence:(PXTileInfo *)a3 count:(int64_t)a4;
- (BOOL)_scanSpecialSequenceBlock:(PXTileInfo *)a3;
- (BOOL)_scanSpecialSequenceColumn:(PXTileInfo *)a3 count:(int64_t *)a4;
- (BOOL)_scanTripletWithLargeLead:(PXTileInfo *)a3;
- (BOOL)parseNextTiles;
- (double)referenceHeight;
- (void)_enumerateColumnFramesWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4 useMagneticGuidelines:(BOOL)a5 block:(id)a6;
- (void)setReferenceHeight:(double)a3;
- (void)willParseTiles;
@end

@implementation PXHorizontalFeedLayoutGenerator

- (void)setReferenceHeight:(double)a3
{
  self->_referenceHeight = a3;
}

- (double)referenceHeight
{
  return self->_referenceHeight;
}

- (BOOL)_addSpecialSequenceBlock:(PXTileInfo *)a3
{
  char v5 = [(PXFeedLayoutGenerator *)self scanSpecialSequenceCount];
  double width = a3->imageSize.width;
  double height = a3->imageSize.height;
  [(PXFeedLayoutGenerator *)self interTileSpacing];
  double v9 = v8;
  [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
  [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:width * ((v10 - v9) / 3.0 / height)];
  [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
  if ((v5 & 1) == 0)
  {
    [(PXFeedLayoutGenerator *)self valueByRounding:1 usingMagneticGuidelines:(v11 + v11) / 3.0];
    PXRectWithEdges();
  }
  [(PXFeedLayoutGenerator *)self valueByRounding:1 usingMagneticGuidelines:v11 / 3.0];
  PXRectWithEdges();
}

- (BOOL)_addColumnWithTiles:(PXTileInfo *)a3 imageFrames:(CGRect *)a4 count:(int64_t)a5
{
  int64_t v5 = a5;
  v7 = a3;
  if (a5 < 2)
  {
LABEL_6:
    p_origin = &self->_origin;
    double x = self->_origin.x;
    double y = self->_origin.y;
    if (x > 0.0)
    {
      [(PXFeedLayoutGenerator *)self interTileSpacing];
      double x = x + v15;
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
        double v20 = p_size->width;
        double v21 = p_size->height;
        p_size += 2;
        CGFloat v22 = x + width;
        CGFloat v23 = y + height;
        -[PXFeedLayoutGenerator parsedFrame:type:forTileAtIndex:](self, "parsedFrame:type:forTileAtIndex:", 0, index, x + width, y + height, v20, v21);
        double v24 = p_origin->x;
        v27.origin.double x = v22;
        v27.origin.double y = v23;
        v27.size.double width = v20;
        v27.size.double height = v21;
        double MaxX = CGRectGetMaxX(v27);
        if (v24 >= MaxX) {
          double MaxX = v24;
        }
        p_origin->double x = MaxX;
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

- (void)_enumerateColumnFramesWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4 useMagneticGuidelines:(BOOL)a5 block:(id)a6
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
      double v16 = v16 + *p_height / *(p_height - 1);
      p_height += 8;
      --v17;
    }
    while (v17);
  }
  [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
  double v19 = (v18 - (double)(a4 - 1) * v14) / v16;
  [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v19];
  if (a4 >= 1)
  {
    double v21 = v20;
    int64_t v22 = 0;
    double x = self->_origin.x;
    double y = self->_origin.y;
    double v25 = -0.0;
    if (x > 0.0) {
      double v25 = v12;
    }
    double v26 = x + v25;
    CGRect v27 = &a3->imageSize.height;
    double v28 = self->_origin.y;
    do
    {
      double v29 = y + *v27 / *(v27 - 1) * v19;
      if (v22 >= a4 - 1) {
        double v30 = 0.0;
      }
      else {
        double v30 = v14 * 0.5;
      }
      [(PXFeedLayoutGenerator *)self valueByRounding:v6 usingMagneticGuidelines:v30 + v29];
      double v32 = v31 - v30;
      [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
      if (v32 >= v33) {
        double v32 = v33;
      }
      char v34 = 0;
      v10[2](v10, v22, &v34, v26, v28, v21, v32 - v28);
      if (v34) {
        break;
      }
      double y = v14 + v29;
      double v28 = v14 + v32;
      ++v22;
      v27 += 8;
    }
    while (a4 != v22);
  }
}

- (BOOL)_addColumnWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4
{
  uint64_t v21 = 0;
  int64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  BOOL v20 = 0;
  BOOL v20 = [(PXFeedLayoutGenerator *)self numberOfMagneticGuidelines] > 0;
  if (*((unsigned char *)v18 + 24))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke;
    v16[3] = &unk_1E5DD23D0;
    v16[4] = &v17;
    [(PXHorizontalFeedLayoutGenerator *)self _enumerateColumnFramesWithContiguousTiles:a3 count:a4 useMagneticGuidelines:1 block:v16];
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
    uint64_t v10 = *((unsigned __int8 *)v18 + 24);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_2;
    v15[3] = &unk_1E5DD23F8;
    v15[4] = &v21;
    v15[5] = a3;
    [(PXHorizontalFeedLayoutGenerator *)self _enumerateColumnFramesWithContiguousTiles:a3 count:a4 useMagneticGuidelines:v10 block:v15];
  }
LABEL_11:
  if (*((unsigned char *)v22 + 24))
  {
    uint64_t v11 = *((unsigned __int8 *)v18 + 24);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_3;
    v14[3] = &unk_1E5DD2420;
    v14[4] = self;
    v14[5] = a3;
    [(PXHorizontalFeedLayoutGenerator *)self _enumerateColumnFramesWithContiguousTiles:a3 count:a4 useMagneticGuidelines:v11 block:v14];
    BOOL v12 = *((unsigned char *)v22 + 24) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

uint64_t __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke(uint64_t result, double a2, double a3, double a4, double a5, uint64_t a6, unsigned char *a7)
{
  if (a5 < 0.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *a7 = 1;
  }
  return result;
}

void __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
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

void __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_3(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  objc_msgSend(*(id *)(a1 + 32), "parsedFrame:type:forTileAtIndex:", 0, *(void *)(*(void *)(a1 + 40) + (a2 << 6)));
  double v11 = *(double *)(*(void *)(a1 + 32) + 1664);
  v13.origin.double x = a3;
  v13.origin.double y = a4;
  v13.size.double width = a5;
  v13.size.double height = a6;
  double MaxX = CGRectGetMaxX(v13);
  if (v11 >= MaxX) {
    double MaxX = v11;
  }
  *(double *)(*(void *)(a1 + 32) + 1664) = MaxX;
}

- (BOOL)_hasLeftSuboptimalColumn
{
  v3 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:0]) {
    BOOL v4 = [(PXFeedLayoutGenerator *)self isAtEnd];
  }
  else {
    BOOL v4 = 0;
  }
  [(PXFeedLayoutGenerator *)self setScanState:v3];

  return v4;
}

- (BOOL)_scanNonPanoramaSequence:(PXTileInfo *)a3 count:(int64_t)a4
{
  int64_t v7 = a4 - 1;
  if (a4 <= 1)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXHorizontalFeedLayoutGenerator.m", 461, @"Invalid parameter not satisfying: %@", @"count >= 2" object file lineNumber description];
  }
  int64_t v8 = [(PXFeedLayoutGenerator *)self scanState];
  uint64_t v15 = 0;
  if (![(PXFeedLayoutGenerator *)self scanTile:a3 type:&v15]
    || (unint64_t)(v15 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_13:
    [(PXFeedLayoutGenerator *)self setScanState:v8];
    BOOL v11 = 0;
    goto LABEL_14;
  }
  if (a4 >= 2)
  {
    double v9 = a3 + 1;
    do
    {
      uint64_t v10 = a3 ? v9 : 0;
      if (![(PXFeedLayoutGenerator *)self scanTile:v10 ofType:v15]) {
        goto LABEL_13;
      }
      ++v9;
    }
    while (--v7);
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_scanSpecialSequenceColumn:(PXTileInfo *)a3 count:(int64_t *)a4
{
  int64_t v7 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXFeedLayoutGenerator *)self scanTile:a3 ofType:4])
  {
    int64_t v8 = 1;
  }
  else
  {
    [(PXFeedLayoutGenerator *)self setScanState:v7];
    if ([(PXHorizontalFeedLayoutGenerator *)self _scanNonPanoramaSequence:a3 count:3]&& ![(PXHorizontalFeedLayoutGenerator *)self _hasLeftSuboptimalColumn])
    {
      int64_t v8 = 3;
    }
    else
    {
      [(PXFeedLayoutGenerator *)self setScanState:v7];
      if (![(PXHorizontalFeedLayoutGenerator *)self _scanNonPanoramaSequence:a3 count:2]|| [(PXHorizontalFeedLayoutGenerator *)self _hasLeftSuboptimalColumn])
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
  return [(PXHorizontalFeedLayoutGenerator *)self _scanNonPanoramaSequence:a3 count:3];
}

- (BOOL)_scanTripletWithLargeLead:(PXTileInfo *)a3
{
  if (!a3)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXHorizontalFeedLayoutGenerator.m", 300, @"Invalid parameter not satisfying: %@", @"tileInfos != NULL" object file lineNumber description];
  }
  int64_t v5 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:a3]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[2]]
    && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn])
  {
    goto LABEL_43;
  }
  [(PXFeedLayoutGenerator *)self setScanState:v5];
  if ([(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:a3])
  {
    if ([(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[1]]
      && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[2]]
      && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn])
    {
      goto LABEL_43;
    }
  }
  [(PXFeedLayoutGenerator *)self setScanState:v5];
  if ([(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:a3])
  {
    if ([(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[1]]
      && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
      && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn])
    {
      goto LABEL_43;
    }
  }
  if (([(PXFeedLayoutGenerator *)self setScanState:v5],
        [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:a3])
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[2]]
    && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:a3])
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[1]]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[2]]
    && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:a3])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[1]]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:&a3[2]]
    && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:a3])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[1]]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
    && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3])
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[2]]
    && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3])
    && [(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:&a3[1]]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
    && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn]
    || ([(PXFeedLayoutGenerator *)self setScanState:v5],
        [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:a3])
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[1]]
    && [(PXFeedLayoutGenerator *)self scanTileWithSquareImage:&a3[2]]
    && [(PXHorizontalFeedLayoutGenerator *)self _isAtEndOfColumn])
  {
LABEL_43:
    BOOL v6 = 1;
  }
  else
  {
    [(PXFeedLayoutGenerator *)self setScanState:v5];
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_parseSpecialSubsequenceWithColumnRequired:(BOOL)a3 columnParsed:(BOOL *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXHorizontalFeedLayoutGenerator *)self _scanSpecialSequenceBlock:v14])
  {
    int64_t v8 = [(PXFeedLayoutGenerator *)self scanState];
    uint64_t v12 = 0;
    if ([(PXHorizontalFeedLayoutGenerator *)self _scanSpecialSequenceColumn:v13 count:&v12])
    {
      if ([(PXHorizontalFeedLayoutGenerator *)self _addSpecialSequenceBlock:v14])
      {
        if ([(PXHorizontalFeedLayoutGenerator *)self _addColumnWithContiguousTiles:v13 count:v12])
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
    else if (!a3 && ![(PXHorizontalFeedLayoutGenerator *)self _hasLeftSuboptimalColumn])
    {
      BOOL v10 = [(PXHorizontalFeedLayoutGenerator *)self _addSpecialSequenceBlock:v14];
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
  BOOL v3 = [(PXHorizontalFeedLayoutGenerator *)self _parseSpecialSubsequenceWithColumnRequired:1 columnParsed:&v5];
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
    while ([(PXHorizontalFeedLayoutGenerator *)self _parseSpecialSubsequenceWithColumnRequired:0 columnParsed:&v5]);
  }
  return v3;
}

- (BOOL)_parseSpecialTileTriplet
{
  v8[8] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  BOOL v4 = [(PXHorizontalFeedLayoutGenerator *)self _scanTripletWithLargeLead:v6];
  if (v4)
  {
    [(PXHorizontalFeedLayoutGenerator *)self _addColumnWithContiguousTiles:v6 count:1];
    if (![(PXHorizontalFeedLayoutGenerator *)self _addColumnWithContiguousTiles:v7 count:2])
    {
      [(PXHorizontalFeedLayoutGenerator *)self _addColumnWithContiguousTiles:v7 count:1];
      [(PXHorizontalFeedLayoutGenerator *)self _addColumnWithContiguousTiles:v8 count:1];
    }
  }
  else
  {
    [(PXFeedLayoutGenerator *)self setScanState:v3];
  }

  return v4;
}

- (BOOL)_parseTileTriplet
{
  v65[8] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  if ([(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v63])
  {
    if ([(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v64])
    {
      if ([(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v65])
      {
        if (![(PXHorizontalFeedLayoutGenerator *)self _hasLeftSuboptimalColumn])
        {
          [(PXFeedLayoutGenerator *)self interTileSpacing];
          double v5 = v4;
          double v7 = v6;
          [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
          double v9 = v8 - v7;
          [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:(v8 - v7) * 0.75 * 0.5];
          double v11 = v10 + v10;
          [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v9 * 0.5];
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          double v53 = v11 * 0.5;
          double v54 = (v12 + v12) * 0.5;
          double v55 = v5 + v11 * 0.5;
          double v56 = 0.0;
          double v57 = v11 * 0.5;
          double v58 = v54;
          [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
          double v59 = 0.0;
          double v60 = v7 + v54;
          double v61 = v5 + v11;
          double v62 = v13 - (v7 + v54);
          if ([(PXHorizontalFeedLayoutGenerator *)self _addColumnWithTiles:v63 imageFrames:&v51 count:3])
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  [(PXFeedLayoutGenerator *)self setScanState:v3];
  if ([(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v63])
  {
    if ([(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v64])
    {
      if ([(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v65])
      {
        if (![(PXHorizontalFeedLayoutGenerator *)self _hasLeftSuboptimalColumn])
        {
          [(PXFeedLayoutGenerator *)self interTileSpacing];
          double v15 = v14;
          double v17 = v16;
          [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
          double v19 = v18 - v17;
          [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:(v18 - v17) * 0.75 * 0.5];
          double v21 = v20 + v20;
          [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v19 * 0.5];
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          double v53 = v15 + v21;
          double v54 = (v22 + v22) * 0.5;
          double v23 = v17 + v54;
          [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
          double v55 = 0.0;
          double v56 = v23;
          double v57 = v21 * 0.5;
          double v58 = v24 - v23;
          [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
          double v59 = v15 + v21 * 0.5;
          double v60 = v23;
          double v61 = v21 * 0.5;
          double v62 = v25 - v23;
          if ([(PXHorizontalFeedLayoutGenerator *)self _addColumnWithTiles:v63 imageFrames:&v51 count:3])
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  [(PXFeedLayoutGenerator *)self setScanState:v3];
  if ([(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v63])
  {
    if ([(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v64])
    {
      if ([(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v65])
      {
        if (![(PXHorizontalFeedLayoutGenerator *)self _hasLeftSuboptimalColumn])
        {
          [(PXFeedLayoutGenerator *)self interTileSpacing];
          double v27 = v26;
          double v29 = v28;
          [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
          double v31 = v30 - v29;
          [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:(v30 - v29) * 0.75 * 0.5];
          double v33 = v32 + v32;
          [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v31 * 0.5];
          double v35 = (v34 + v34) * 0.5;
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          double v53 = v33 * 0.5;
          double v54 = v35;
          [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
          double v55 = 0.0;
          double v56 = v29 + v35;
          double v57 = v27 + v33;
          double v58 = v36 - (v29 + v35);
          double v59 = v27 + v33 * 0.5;
          double v60 = 0.0;
          double v61 = v33 * 0.5;
          double v62 = v35;
          if ([(PXHorizontalFeedLayoutGenerator *)self _addColumnWithTiles:v63 imageFrames:&v51 count:3])
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  [(PXFeedLayoutGenerator *)self setScanState:v3];
  if (![(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v63]) {
    goto LABEL_22;
  }
  if (![(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v64]) {
    goto LABEL_22;
  }
  if (![(PXFeedLayoutGenerator *)self scanTileWithLandscapeImage:v65]) {
    goto LABEL_22;
  }
  if ([(PXHorizontalFeedLayoutGenerator *)self _hasLeftSuboptimalColumn]) {
    goto LABEL_22;
  }
  [(PXFeedLayoutGenerator *)self interTileSpacing];
  double v38 = v37;
  double v40 = v39;
  [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
  double v42 = v41 - v40;
  [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:(v41 - v40) * 1.33333337 * 0.5];
  double v44 = v43 + v43;
  [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v42 * 0.5];
  double v46 = v45 + v45;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  double v53 = v44 * 0.5;
  double v54 = (v45 + v45) * 0.5;
  [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
  double v55 = v38 + v44 * 0.5;
  double v56 = 0.0;
  double v57 = v44 * 0.5;
  double v58 = v47;
  [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
  double v59 = 0.0;
  double v60 = v40 + v46 * 0.5;
  double v61 = v44 * 0.5;
  double v62 = v48 - v60;
  if ([(PXHorizontalFeedLayoutGenerator *)self _addColumnWithTiles:v63 imageFrames:&v51 count:3])
  {
LABEL_21:
    BOOL v49 = 1;
  }
  else
  {
LABEL_22:
    [(PXFeedLayoutGenerator *)self setScanState:v3];
    BOOL v49 = 0;
  }

  return v49;
}

- (BOOL)_parseTilePair
{
  v7[8] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  if (![(PXFeedLayoutGenerator *)self scanLocation]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v6]
    && [(PXFeedLayoutGenerator *)self scanTileWithPortraitImage:v7]
    && [(PXFeedLayoutGenerator *)self isAtEnd])
  {
    BOOL v4 = 1;
    [(PXHorizontalFeedLayoutGenerator *)self _addColumnWithContiguousTiles:v6 count:1];
    [(PXHorizontalFeedLayoutGenerator *)self _addColumnWithContiguousTiles:v7 count:1];
  }
  else
  {
    [(PXFeedLayoutGenerator *)self setScanState:v3];
    if ([(PXFeedLayoutGenerator *)self scanAnyTile:v6]
      && [(PXFeedLayoutGenerator *)self scanAnyTile:v7]
      && [(PXHorizontalFeedLayoutGenerator *)self _addColumnWithContiguousTiles:v6 count:2])
    {
      BOOL v4 = 1;
    }
    else
    {
      [(PXFeedLayoutGenerator *)self setScanState:v3];
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (BOOL)_parseSingleTile
{
  BOOL v3 = [(PXFeedLayoutGenerator *)self scanState];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v4 = [(PXFeedLayoutGenerator *)self scanAnyTile:&v10];
  if (v4)
  {
    [(PXHorizontalFeedLayoutGenerator *)self referenceHeight];
    double v6 = v5;
    [(PXFeedLayoutGenerator *)self valueByRounding:0 usingMagneticGuidelines:v5 * (*((double *)&v10 + 1) / *(double *)&v11)];
    v9[0] = 0;
    v9[1] = 0;
    v9[2] = v7;
    *(double *)&v9[3] = v6;
    [(PXHorizontalFeedLayoutGenerator *)self _addColumnWithTiles:&v10 imageFrames:v9 count:1];
  }
  else
  {
    [(PXFeedLayoutGenerator *)self setScanState:v3];
  }

  return v4;
}

- (BOOL)parseNextTiles
{
  if ([(PXHorizontalFeedLayoutGenerator *)self _parseSpecialSequence]
    || [(PXHorizontalFeedLayoutGenerator *)self _parseSpecialTileTriplet]
    || [(PXHorizontalFeedLayoutGenerator *)self _parseTileTriplet]
    || [(PXHorizontalFeedLayoutGenerator *)self _parseTilePair])
  {
    return 1;
  }
  return [(PXHorizontalFeedLayoutGenerator *)self _parseSingleTile];
}

- (void)willParseTiles
{
  v3.receiver = self;
  v3.super_class = (Class)PXHorizontalFeedLayoutGenerator;
  [(PXFeedLayoutGenerator *)&v3 willParseTiles];
  self->_origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
}

@end