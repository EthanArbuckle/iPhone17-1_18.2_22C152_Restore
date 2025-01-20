@interface OADTableStyleResolver
- (OADTMatrixPos)dominantCellInRowRange:(_NSRange)a3 columnRange:(_NSRange)a4;
- (OADTableStyleResolver)initWithTable:(id)a3;
- (id)sourceCellAtI1:(int)a3 i2:(int)a4 dir1:(int)a5;
- (id)strokeOfSegmentNormalToDir1:(int)a3 i1:(int)a4 fromI2:(int)a5;
- (int)cellCountAlongDir:(int)a3;
- (int)cellParityRelativeToDir1:(int)a3 i1:(int)a4 i2:(int)a5;
- (void)applyBandCellStyles;
- (void)applyBandStrokes;
- (void)applyCellStyleFromPart:(int)a3 dir1:(int)a4 fromI1:(int)a5 fromI2:(int)a6 dir1Span:(int)a7 dir2Span:(int)a8;
- (void)applyCellStyleOfBandsNormalToDir:(int)a3 parity:(int)a4 part:(int)a5;
- (void)applyCellStyleOfExtremeVectorNormalToDir:(int)a3 atExtremePos:(int)a4 part:(int)a5;
- (void)applyCellStyles;
- (void)applyCornerCellStyleWithRowPos:(int)a3 columnPos:(int)a4 part:(int)a5;
- (void)applyCornerCellStyles;
- (void)applyCornerStrokes;
- (void)applyCornerStrokesWithRowPos:(int)a3 columnPos:(int)a4 part:(int)a5;
- (void)applyExtremeVectorCellStyles;
- (void)applyExtremeVectorStrokes;
- (void)applyResolvedPartStyle:(id)a3 leftStroke:(id)a4 rightStroke:(id)a5 topStroke:(id)a6 bottomStroke:(id)a7 toCell:(id)a8;
- (void)applyResolvedStyling;
- (void)applyStroke:(int)a3 fromPart:(int)a4 normalToDir1:(int)a5 i1:(int)a6 fromI2:(int)a7 dir2Span:(int)a8;
- (void)applyStroke:(int)a3 fromPart:(int)a4 normalToDir1:(int)a5 i1:(int)a6 fromI2:(int)a7 toI2:(int)a8;
- (void)applyStrokeOfExtremeVectorNormalToDir:(int)a3 atExtremePos:(int)a4;
- (void)applyStrokesFromPart:(int)a3 fromPos:(OADTMatrixPos)a4 toPos:(OADTMatrixPos)a5;
- (void)applyStrokesOfBandsNormalToDir:(int)a3 parity:(int)a4 part:(int)a5;
- (void)applyStyleStrokes;
- (void)applyTextStyle:(id)a3 toCell:(id)a4;
- (void)applyTextStyle:(id)a3 toParagraph:(id)a4;
- (void)applyWholeTableCellStyle;
- (void)applyWholeTableStrokes;
- (void)createStrokeMatrices;
- (void)dealloc;
- (void)fixVectorAtExtremePositionFlags;
- (void)flatten;
- (void)loadCells;
- (void)setStroke:(id)a3 ofSegmentNormalToDir1:(int)a4 i1:(int)a5 fromI2:(int)a6;
@end

@implementation OADTableStyleResolver

- (OADTableStyleResolver)initWithTable:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OADTableStyleResolver;
  v6 = [(OADTableStyleResolver *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mTable, a3);
    uint64_t v8 = [(OADTable *)v7->mTable tableProperties];
    mTableProperties = v7->mTableProperties;
    v7->mTableProperties = (OADTableProperties *)v8;

    uint64_t v10 = [(OADTableProperties *)v7->mTableProperties style];
    mTableStyle = v7->mTableStyle;
    v7->mTableStyle = (OADTableStyle *)v10;

    v12 = [(OADTable *)v7->mTable grid];
    v7->mColumnCount = [v12 columnCount];
    v7->mRowCount = [(OADTable *)v7->mTable rowCount];
  }
  return v7;
}

- (void)dealloc
{
  mCellMatrix = (char *)self->mCellMatrix;
  if (mCellMatrix)
  {
    uint64_t v8 = (void **)(mCellMatrix + 8);
    std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x23EC997B0](mCellMatrix, 0x1080C409938AC02);
  }
  mCellStyles = (char *)self->mCellStyles;
  if (mCellStyles)
  {
    uint64_t v8 = (void **)(mCellStyles + 8);
    std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x23EC997B0](mCellStyles, 0x1080C409938AC02);
  }
  id v5 = (char *)self->mStrokes[0];
  if (v5)
  {
    uint64_t v8 = (void **)(v5 + 8);
    std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x23EC997B0](v5, 0x1080C409938AC02);
  }
  v6 = (char *)self->mStrokes[1];
  if (v6)
  {
    uint64_t v8 = (void **)(v6 + 8);
    std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x23EC997B0](v6, 0x1080C409938AC02);
  }
  v7.receiver = self;
  v7.super_class = (Class)OADTableStyleResolver;
  [(OADTableStyleResolver *)&v7 dealloc];
}

- (void)fixVectorAtExtremePositionFlags
{
  v3 = [(OADTableStyle *)self->mTableStyle firstRowStyle];

  if (!v3) {
    [(OADTableProperties *)self->mTableProperties setFirstRow:0];
  }
  v4 = [(OADTableStyle *)self->mTableStyle lastRowStyle];

  if (!v4) {
    [(OADTableProperties *)self->mTableProperties setLastRow:0];
  }
  id v5 = [(OADTableStyle *)self->mTableStyle firstColumnStyle];

  if (!v5) {
    [(OADTableProperties *)self->mTableProperties setFirstColumn:0];
  }
  v6 = [(OADTableStyle *)self->mTableStyle lastColumnStyle];

  if (!v6)
  {
    mTableProperties = self->mTableProperties;
    [(OADTableProperties *)mTableProperties setLastColumn:0];
  }
}

- (void)loadCells
{
}

- (id)sourceCellAtI1:(int)a3 i2:(int)a4 dir1:(int)a5
{
  OADTMatrixPos::OADTMatrixPos(&v8, a3, a4, a5);
  if ((v8 & 0x80000000) != 0 || (int)v8 >= self->mRowCount || v8 < 0 || SHIDWORD(v8) >= self->mColumnCount) {
    id v6 = 0;
  }
  else {
    id v6 = *(id *)OADTFTemplateMatrix<OADTableCell * {__strong}>::operator[]((uint64_t)self->mCellMatrix, v8);
  }
  return v6;
}

- (int)cellCountAlongDir:(int)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 36;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)applyCellStyleFromPart:(int)a3 dir1:(int)a4 fromI1:(int)a5 fromI2:(int)a6 dir1Span:(int)a7 dir2Span:(int)a8
{
  objc_super v14 = [(OADTableStyle *)self->mTableStyle partStyle:*(void *)&a3];
  if (v14)
  {
    OADTMatrixPos::OADTMatrixPos(v21, a5, a6, a4);
    OADTMatrixPos::OADTMatrixPos(&v19, a7, a8, a4);
    int v15 = v19;
    if (v19 >= 1)
    {
      int v16 = 0;
      int v17 = v20;
      do
      {
        if (v17 >= 1)
        {
          int v18 = 0;
          do
          {
            objc_msgSend(*(id *)OADTFTemplateMatrix<OADTablePartStyle * {__strong}>::operator[]((uint64_t)self->mCellStyles, (v21[0] + v16) | ((unint64_t)(v18 + v21[1]) << 32)), "applyOverridesFrom:", v14);
            ++v18;
            int v17 = v20;
          }
          while (v18 < v20);
          int v15 = v19;
        }
        ++v16;
      }
      while (v16 < v15);
    }
  }
}

- (void)applyWholeTableCellStyle
{
}

- (void)applyCellStyleOfBandsNormalToDir:(int)a3 parity:(int)a4 part:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  if (-[OADTableProperties hasBandsNormalToDir:](self->mTableProperties, "hasBandsNormalToDir:"))
  {
    BOOL v9 = [(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:v7 atExtremePos:0];
    if (v9) {
      unsigned int v10 = 2;
    }
    else {
      unsigned int v10 = 1;
    }
    if (a4 == 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v9;
    }
    int v12 = [(OADTableStyleResolver *)self cellCountAlongDir:v7];
    if ([(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:v7 atExtremePos:1])
    {
      int v13 = -2;
    }
    else
    {
      int v13 = -1;
    }
    int v14 = v13 + v12;
    uint64_t v15 = [(OADTableStyleResolver *)self cellCountAlongDir:v7 == 0];
    if ((int)v11 <= v14)
    {
      uint64_t v16 = v15;
      do
      {
        [(OADTableStyleResolver *)self applyCellStyleFromPart:v5 dir1:v7 fromI1:v11 fromI2:0 dir1Span:1 dir2Span:v16];
        uint64_t v11 = (v11 + 2);
      }
      while ((int)v11 <= v14);
    }
  }
}

- (void)applyBandCellStyles
{
  [(OADTableStyleResolver *)self applyCellStyleOfBandsNormalToDir:0 parity:1 part:2];
  [(OADTableStyleResolver *)self applyCellStyleOfBandsNormalToDir:0 parity:2 part:3];
  [(OADTableStyleResolver *)self applyCellStyleOfBandsNormalToDir:1 parity:1 part:4];
  [(OADTableStyleResolver *)self applyCellStyleOfBandsNormalToDir:1 parity:2 part:5];
}

- (void)applyCellStyleOfExtremeVectorNormalToDir:(int)a3 atExtremePos:(int)a4 part:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  if (-[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:"))
  {
    if (a4 == 1) {
      uint64_t v9 = [(OADTableStyleResolver *)self cellCountAlongDir:v7] - 1;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [(OADTableStyleResolver *)self cellCountAlongDir:v7 == 0];
    [(OADTableStyleResolver *)self applyCellStyleFromPart:v5 dir1:v7 fromI1:v9 fromI2:0 dir1Span:1 dir2Span:v10];
  }
}

- (void)applyExtremeVectorCellStyles
{
  [(OADTableStyleResolver *)self applyCellStyleOfExtremeVectorNormalToDir:1 atExtremePos:1 part:9];
  [(OADTableStyleResolver *)self applyCellStyleOfExtremeVectorNormalToDir:1 atExtremePos:0 part:8];
  [(OADTableStyleResolver *)self applyCellStyleOfExtremeVectorNormalToDir:0 atExtremePos:1 part:7];
  [(OADTableStyleResolver *)self applyCellStyleOfExtremeVectorNormalToDir:0 atExtremePos:0 part:6];
}

- (void)applyCornerCellStyleWithRowPos:(int)a3 columnPos:(int)a4 part:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if (![(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:0 atExtremePos:*(void *)&a3]|| ![(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:1 atExtremePos:v6])
  {
    return;
  }
  if (!a3)
  {
    uint64_t v9 = 0;
    if (v6) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = (self->mRowCount - 1);
  if (!v6) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v10 = (self->mColumnCount - 1);
LABEL_9:
  [(OADTableStyleResolver *)self applyCellStyleFromPart:v5 dir1:0 fromI1:v9 fromI2:v10 dir1Span:1 dir2Span:1];
}

- (void)applyCornerCellStyles
{
  [(OADTableStyleResolver *)self applyCornerCellStyleWithRowPos:1 columnPos:1 part:13];
  [(OADTableStyleResolver *)self applyCornerCellStyleWithRowPos:1 columnPos:0 part:12];
  [(OADTableStyleResolver *)self applyCornerCellStyleWithRowPos:0 columnPos:1 part:11];
  [(OADTableStyleResolver *)self applyCornerCellStyleWithRowPos:0 columnPos:0 part:10];
}

- (void)applyCellStyles
{
}

- (OADTMatrixPos)dominantCellInRowRange:(_NSRange)a3 columnRange:(_NSRange)a4
{
  int length = a4.length;
  NSUInteger location = a4.location;
  int v6 = a3.length;
  unsigned int v7 = a3.location;
  if (a3.length != 1 || a4.length != 1)
  {
    BOOL v9 = [(OADTableProperties *)self->mTableProperties firstRow];
    int v10 = [(OADTableProperties *)self->mTableProperties lastRow] ? self->mRowCount - 1 : -1;
    int v11 = v9 - 1;
    int v12 = [(OADTableProperties *)self->mTableProperties firstColumn] - 1;
    unsigned int v13 = [(OADTableProperties *)self->mTableProperties lastColumn] ? self->mColumnCount - 1 : -1;
    BOOL v14 = v7 == v11 && location == v12;
    if (!v14)
    {
      int v15 = location + length - 1;
      if (v7 == v11 && v15 == v13)
      {
        NSUInteger location = (location + length - 1);
      }
      else
      {
        int v16 = v7 + v6 - 1;
        if (v16 == v10 && location == v12)
        {
          unsigned int v7 = v7 + v6 - 1;
        }
        else
        {
          BOOL v17 = v7 == v11;
          if (v7 == v11) {
            int v18 = v11;
          }
          else {
            int v18 = v10;
          }
          BOOL v14 = v16 == v10;
          BOOL v19 = v16 == v10;
          if (v14) {
            BOOL v17 = 1;
          }
          BOOL v14 = v15 == v13;
          BOOL v20 = v15 == v13;
          if (v14) {
            unsigned int v21 = v13;
          }
          else {
            unsigned int v21 = location;
          }
          if (v19 && v20)
          {
            unsigned int v22 = v10;
          }
          else
          {
            unsigned int v13 = location;
            unsigned int v22 = v18;
          }
          if (location == v12) {
            unsigned int v23 = v12;
          }
          else {
            unsigned int v23 = v21;
          }
          if (v17) {
            NSUInteger location = v13;
          }
          else {
            NSUInteger location = v23;
          }
          if (v17) {
            unsigned int v7 = v22;
          }
        }
      }
    }
  }
  return (OADTMatrixPos)(v7 | (location << 32));
}

- (id)strokeOfSegmentNormalToDir1:(int)a3 i1:(int)a4 fromI2:(int)a5
{
  uint64_t v5 = *(void **)OADTFTemplateMatrix<OADStroke * {__strong}>::operator[]((uint64_t)self->mStrokes[a3], a4 | (*(void *)&a5 << 32));
  return v5;
}

- (void)setStroke:(id)a3 ofSegmentNormalToDir1:(int)a4 i1:(int)a5 fromI2:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  int v11 = (void **)OADTFTemplateMatrix<OADStroke * {__strong}>::operator[]((uint64_t)self->mStrokes[a4], a5 | (unint64_t)(v6 << 32));
  int v12 = *v11;
  *int v11 = v10;
}

- (void)applyStroke:(int)a3 fromPart:(int)a4 normalToDir1:(int)a5 i1:(int)a6 fromI2:(int)a7 dir2Span:(int)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v13 = *(void *)&a3;
  id v20 = [(OADTableStyle *)self->mTableStyle partStyle:*(void *)&a4];
  int v15 = [v20 cellStyle];
  int v16 = [v15 borderStyle];
  uint64_t v17 = [v16 stroke:v13];

  id v21 = (id)v17;
  if (!v17)
  {
    if (a4 != 1)
    {
      id v21 = 0;
      goto LABEL_11;
    }
    id v21 = +[OADTableCellBorderStyle defaultAxisParallelStroke];
  }
  uint64_t v18 = (a8 + v9);
  if (a8 >= 1)
  {
    uint64_t v19 = v9;
    do
    {
      [(OADTableStyleResolver *)self setStroke:v21 ofSegmentNormalToDir1:v11 i1:v10 fromI2:v19];
      uint64_t v19 = (v19 + 1);
    }
    while ((int)v19 < (int)v18);
  }
  if (a8 < 0)
  {
    do
    {
      [(OADTableStyleResolver *)self setStroke:v21 ofSegmentNormalToDir1:v11 i1:v10 fromI2:v18];
      uint64_t v18 = (v18 + 1);
    }
    while ((int)v18 < (int)v9);
  }
LABEL_11:
}

- (void)applyStroke:(int)a3 fromPart:(int)a4 normalToDir1:(int)a5 i1:(int)a6 fromI2:(int)a7 toI2:(int)a8
{
}

- (void)applyStrokesFromPart:(int)a3 fromPos:(OADTMatrixPos)a4 toPos:(OADTMatrixPos)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t var1 = a4.var1;
  uint64_t v10 = a5.var1;
  [(OADTableStyleResolver *)self applyStroke:3 fromPart:*(void *)&a3 normalToDir1:0 i1:a4 fromI2:a4.var1 toI2:a5.var1];
  [(OADTableStyleResolver *)self applyStroke:4 fromPart:v7 normalToDir1:0 i1:a5 fromI2:var1 toI2:v10];
  [(OADTableStyleResolver *)self applyStroke:1 fromPart:v7 normalToDir1:1 i1:var1 fromI2:a4 toI2:a5];
  [(OADTableStyleResolver *)self applyStroke:2 fromPart:v7 normalToDir1:1 i1:v10 fromI2:a4 toI2:a5];
  uint64_t v11 = (a4.var0 + 1);
  if ((int)v11 < a5.var0)
  {
    do
    {
      [(OADTableStyleResolver *)self applyStroke:5 fromPart:v7 normalToDir1:0 i1:v11 fromI2:var1 toI2:v10];
      uint64_t v11 = (v11 + 1);
    }
    while (a5.var0 != v11);
  }
  uint64_t v12 = (var1 + 1);
  if ((int)v12 < (int)v10)
  {
    do
    {
      [(OADTableStyleResolver *)self applyStroke:6 fromPart:v7 normalToDir1:1 i1:v12 fromI2:a4 toI2:a5];
      uint64_t v12 = (v12 + 1);
    }
    while (v10 != v12);
  }
}

- (void)createStrokeMatrices
{
}

- (void)applyWholeTableStrokes
{
}

- (int)cellParityRelativeToDir1:(int)a3 i1:(int)a4 i2:(int)a5
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [(OADTableStyleResolver *)self sourceCellAtI1:*(void *)&a4 i2:*(void *)&a5 dir1:*(void *)&a3];
  uint64_t v8 = v7;
  if (!v7
    || (!v5
      ? (v9 = [v7 topRow], int v10 = objc_msgSend(v8, "rowSpan"))
      : (v9 = [v7 leftColumn], int v10 = objc_msgSend(v8, "gridSpan")),
        (int v11 = v10,
         v12 = [(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:v5 atExtremePos:0], v13 = [(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:v5 atExtremePos:1], !v9)? (BOOL v14 = v12): (BOOL v14 = 0), v14 || v13 && v11 + v9 == [(OADTableStyleResolver *)self cellCountAlongDir:v5]))
  {
    int v15 = 0;
  }
  else if (((v9 & 1) == 0) != v12)
  {
    int v15 = 1;
  }
  else
  {
    int v15 = 2;
  }

  return v15;
}

- (void)applyStrokesOfBandsNormalToDir:(int)a3 parity:(int)a4 part:(int)a5
{
  uint64_t v6 = *(void *)&a3;
  int v8 = [(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:*(void *)&a3 atExtremePos:0];
  int v9 = [(OADTableStyleResolver *)self cellCountAlongDir:v6];
  if ([(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:v6 atExtremePos:1])
  {
    int v10 = -2;
  }
  else
  {
    int v10 = -1;
  }
  int v11 = v10 + v9;
  HIDWORD(v36) = v6 == 0;
  int v12 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:");
  LODWORD(v36) = v8;
  int v37 = v11;
  if (v11 >= v8)
  {
    if (v6) {
      int v13 = 3;
    }
    else {
      int v13 = 1;
    }
    if (v6) {
      int v14 = 5;
    }
    else {
      int v14 = 6;
    }
    if (v6) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    uint64_t v16 = v36;
    do
    {
      if ((v12 & 0x80000000) == 0)
      {
        int v17 = -1;
        do
        {
          uint64_t v18 = (v17 + 1);
          int v19 = [(OADTableStyleResolver *)self cellParityRelativeToDir1:v6 i1:v16 i2:v36];
          int v20 = [(OADTableStyleResolver *)self cellParityRelativeToDir1:v6 i1:v16 i2:v18];
          BOOL v21 = v20 == a4 || v19 != a4;
          if (v19 != a4 && v20 == a4) {
            unsigned int v22 = v13;
          }
          else {
            unsigned int v22 = 0;
          }
          if (v19 == a4 && v20 == a4) {
            unsigned int v22 = v14;
          }
          if (v21) {
            uint64_t v23 = v22;
          }
          else {
            uint64_t v23 = v15;
          }
          if (v23) {
            [(OADTableStyleResolver *)self applyStroke:v23 fromPart:a5 normalToDir1:HIDWORD(v36) i1:v18 fromI2:v16 dir2Span:1];
          }
          int v17 = v18;
        }
        while (v12 != v18);
      }
      BOOL v24 = v16 == v37;
      uint64_t v16 = (v16 + 1);
    }
    while (!v24);
  }
  if (v12 >= 1)
  {
    uint64_t v25 = 0;
    HIDWORD(v36) = v37 + 1;
    if (v6) {
      int v26 = 1;
    }
    else {
      int v26 = 3;
    }
    if (v6) {
      int v27 = 6;
    }
    else {
      int v27 = 5;
    }
    if (v6) {
      unsigned int v28 = 2;
    }
    else {
      unsigned int v28 = 4;
    }
    do
    {
      uint64_t v29 = v36;
      if (SHIDWORD(v36) >= (int)v36)
      {
        do
        {
          int v30 = -[OADTableStyleResolver cellParityRelativeToDir1:i1:i2:](self, "cellParityRelativeToDir1:i1:i2:", v6, (v29 - 1), v25, v36);
          int v31 = [(OADTableStyleResolver *)self cellParityRelativeToDir1:v6 i1:v29 i2:v25];
          BOOL v32 = v31 == a4 || v30 != a4;
          if (v30 != a4 && v31 == a4) {
            unsigned int v33 = v26;
          }
          else {
            unsigned int v33 = 0;
          }
          if (v30 == a4 && v31 == a4) {
            unsigned int v33 = v27;
          }
          if (v32) {
            uint64_t v34 = v33;
          }
          else {
            uint64_t v34 = v28;
          }
          if (v34) {
            [(OADTableStyleResolver *)self applyStroke:v34 fromPart:a5 normalToDir1:v6 i1:v29 fromI2:v25 dir2Span:1];
          }
          BOOL v35 = (int)v29 <= v37;
          uint64_t v29 = (v29 + 1);
        }
        while (v35);
      }
      uint64_t v25 = (v25 + 1);
    }
    while (v25 != v12);
  }
}

- (void)applyBandStrokes
{
  if ([(OADTableProperties *)self->mTableProperties hasBandsNormalToDir:0])
  {
    [(OADTableStyleResolver *)self applyStrokesOfBandsNormalToDir:0 parity:1 part:2];
    [(OADTableStyleResolver *)self applyStrokesOfBandsNormalToDir:0 parity:2 part:3];
  }
  if ([(OADTableProperties *)self->mTableProperties hasBandsNormalToDir:1])
  {
    [(OADTableStyleResolver *)self applyStrokesOfBandsNormalToDir:1 parity:1 part:4];
    [(OADTableStyleResolver *)self applyStrokesOfBandsNormalToDir:1 parity:2 part:5];
  }
}

- (void)applyStrokeOfExtremeVectorNormalToDir:(int)a3 atExtremePos:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  if (-[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:"))
  {
    if (a4 == 1)
    {
      uint64_t v7 = [(OADTableStyleResolver *)self cellCountAlongDir:v5];
      uint64_t v8 = [(OADTableStyleResolver *)self cellCountAlongDir:v5] - 1;
      if (v5) {
        int v9 = 5;
      }
      else {
        int v9 = 6;
      }
      unsigned int v36 = v9;
      if (v5) {
        int v10 = 1;
      }
      else {
        int v10 = 3;
      }
      unsigned int v40 = v10;
      if (v5) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 2;
      }
      if (v5) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 1;
      }
      if (v5) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 4;
      }
      if (v5) {
        uint64_t v14 = 9;
      }
      else {
        uint64_t v14 = 7;
      }
      int v15 = -1;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      if (v5) {
        int v16 = 5;
      }
      else {
        int v16 = 6;
      }
      unsigned int v36 = v16;
      if (v5) {
        int v17 = 2;
      }
      else {
        int v17 = 4;
      }
      unsigned int v40 = v17;
      if (v5) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 2;
      }
      if (v5) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 1;
      }
      if (v5) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 3;
      }
      if (v5) {
        uint64_t v14 = 8;
      }
      else {
        uint64_t v14 = 6;
      }
      int v15 = 1;
    }
    int v42 = [(OADTableStyleResolver *)self cellCountAlongDir:v5 == 0];
    -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:", v13, v14, v5, v7, 0);
    id v33 = [(OADTableStyleResolver *)self sourceCellAtI1:v8 i2:0 dir1:v5];
    -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v12, v14, v5 == 0, 0, v7, [v33 spanAlongDir:v5] * v15);
    BOOL v43 = v5 == 0;
    unsigned int v41 = v14;
    int v37 = [(OADTableStyleResolver *)self sourceCellAtI1:v8 i2:(v42 - 1) dir1:v5];
    int v18 = v15;
    -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v11, v41, v5 == 0, v42, v7, [v37 spanAlongDir:v5] * v15);
    int v19 = v37;
    if (v42 >= 1)
    {
      uint64_t v20 = 0;
      do
      {
        BOOL v21 = [(OADTableStyleResolver *)self sourceCellAtI1:v8 i2:v20 dir1:v5];
        int v22 = [v21 spanAlongDir:v5];
        uint64_t v23 = [v21 spanAlongDir:v5 == 0];
        [(OADTableStyleResolver *)self applyStroke:v40 fromPart:v41 normalToDir1:v5 i1:(v7 + v22 * v18) fromI2:v20 dir2Span:v23];
        uint64_t v20 = (v23 + v20);
      }
      while ((int)v20 < v42);
      uint64_t v24 = 0;
      unsigned int v34 = v5;
      unsigned int v35 = v8;
      while (1)
      {
        uint64_t v25 = [(OADTableStyleResolver *)self sourceCellAtI1:v8 i2:v24 dir1:v5];
        v39 = v25;
        int v26 = [v25 spanAlongDir:v5];
        uint64_t v24 = [v25 spanAlongDir:v43] + v24;
        if ((int)v24 >= v42) {
          break;
        }
        [(OADTableStyleResolver *)self sourceCellAtI1:v8 i2:v24 dir1:v5];
        v38 = uint64_t v27 = v7;
        int v28 = [v38 spanAlongDir:v5];
        int v29 = v28;
        if (v26 >= v28) {
          int v30 = v28;
        }
        else {
          int v30 = v26;
        }
        uint64_t v31 = (v30 * v18);
        [(OADTableStyleResolver *)self applyStroke:v36 fromPart:v41 normalToDir1:v43 i1:v24 fromI2:v27 dir2Span:v31];
        if (v26 <= v29) {
          int v32 = v29;
        }
        else {
          int v32 = v26;
        }
        [(OADTableStyleResolver *)self applyStroke:v40 fromPart:v41 normalToDir1:v43 i1:v24 fromI2:(v31 + v27) dir2Span:((v32 - v30) * v18)];

        uint64_t v7 = v27;
        uint64_t v5 = v34;
        uint64_t v8 = v35;
        int v19 = v37;
      }
    }
  }
}

- (void)applyExtremeVectorStrokes
{
  [(OADTableStyleResolver *)self applyStrokeOfExtremeVectorNormalToDir:1 atExtremePos:1];
  [(OADTableStyleResolver *)self applyStrokeOfExtremeVectorNormalToDir:1 atExtremePos:0];
  [(OADTableStyleResolver *)self applyStrokeOfExtremeVectorNormalToDir:0 atExtremePos:1];
  [(OADTableStyleResolver *)self applyStrokeOfExtremeVectorNormalToDir:0 atExtremePos:0];
}

- (void)applyCornerStrokesWithRowPos:(int)a3 columnPos:(int)a4 part:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if (![(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:0 atExtremePos:*(void *)&a3]|| ![(OADTableProperties *)self->mTableProperties hasVectorNormalToDir:1 atExtremePos:v6])
  {
    return;
  }
  if (!a3)
  {
    uint64_t v9 = 0;
    if (v6) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = (self->mRowCount - 1);
  if (!v6) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v10 = (self->mColumnCount - 1);
LABEL_9:
  id v13 = [(OADTableStyleResolver *)self sourceCellAtI1:v9 i2:v10 dir1:0];
  unsigned int v11 = [v13 topRow];
  uint64_t v12 = [v13 leftColumn];
  -[OADTableStyleResolver applyStrokesFromPart:fromPos:toPos:](self, "applyStrokesFromPart:fromPos:toPos:", v5, v11 | (unint64_t)(v12 << 32), ([v13 rowSpan] + v11) | ((unint64_t)(objc_msgSend(v13, "gridSpan")+ v12) << 32));
}

- (void)applyCornerStrokes
{
  [(OADTableStyleResolver *)self applyCornerStrokesWithRowPos:1 columnPos:1 part:13];
  [(OADTableStyleResolver *)self applyCornerStrokesWithRowPos:1 columnPos:0 part:12];
  [(OADTableStyleResolver *)self applyCornerStrokesWithRowPos:0 columnPos:1 part:11];
  [(OADTableStyleResolver *)self applyCornerStrokesWithRowPos:0 columnPos:0 part:10];
}

- (void)applyStyleStrokes
{
  [(OADTableStyleResolver *)self createStrokeMatrices];
  [(OADTableStyleResolver *)self applyWholeTableStrokes];
  [(OADTableStyleResolver *)self applyBandStrokes];
  [(OADTableStyleResolver *)self applyExtremeVectorStrokes];
  [(OADTableStyleResolver *)self applyCornerStrokes];
}

- (void)applyTextStyle:(id)a3 toParagraph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [NSString stringWithUTF8String:"-[OADTableStyleResolver applyTextStyle:toParagraph:]"];
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADTableStyleFlattener.mm"];
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  +[OITSUAssertionHandler handleFailureInFunction:v7, v8, 731, 0, "Abstract method not overridden by %@", v10 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  unsigned int v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = NSString;
  id v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  int v15 = [v12 stringWithFormat:@"Abstract method not overridden by %@: %s", v14, "-[OADTableStyleResolver applyTextStyle:toParagraph:]"];
  id v16 = [v11 exceptionWithName:*MEMORY[0x263EFF498] reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (void)applyTextStyle:(id)a3 toCell:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 textBody];
  for (unsigned int i = 0; [v7 paragraphCount] > (unint64_t)i; ++i)
  {
    uint64_t v9 = [v7 paragraphAtIndex:i];
    [(OADTableStyleResolver *)self applyTextStyle:v10 toParagraph:v9];
  }
}

- (void)applyResolvedPartStyle:(id)a3 leftStroke:(id)a4 rightStroke:(id)a5 topStroke:(id)a6 bottomStroke:(id)a7 toCell:(id)a8
{
  a3;
  a4;
  a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = [NSString stringWithUTF8String:"-[OADTableStyleResolver applyResolvedPartStyle:leftStroke:rightStroke:topStroke:bottomStroke:toCell:]"];
  int v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADTableStyleFlattener.mm"];
  int v18 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v18);
  +[OITSUAssertionHandler handleFailureInFunction:v16, v17, 749, 0, "Abstract method not overridden by %@", v25 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  int v19 = (void *)MEMORY[0x263EFF940];
  uint64_t v20 = NSString;
  BOOL v21 = (objc_class *)objc_opt_class();
  int v22 = NSStringFromClass(v21);
  uint64_t v23 = [v20 stringWithFormat:@"Abstract method not overridden by %@: %s", v22, "-[OADTableStyleResolver applyResolvedPartStyle:leftStroke:rightStroke:topStroke:bottomStroke:toCell:]"];
  id v24 = [v19 exceptionWithName:*MEMORY[0x263EFF498] reason:v23 userInfo:0];

  objc_exception_throw(v24);
}

- (void)applyResolvedStyling
{
  int mRowCount = self->mRowCount;
  if (mRowCount >= 1)
  {
    uint64_t v4 = 0;
    LODWORD(mColumnCount) = self->mColumnCount;
    do
    {
      if ((int)mColumnCount >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        do
        {
          id v8 = *(id *)OADTFTemplateMatrix<OADTableCell * {__strong}>::operator[]((uint64_t)self->mCellMatrix, v6 | v4);
          if (v4 == [v8 topRow] && v7 == objc_msgSend(v8, "leftColumn"))
          {
            id v9 = *(id *)OADTFTemplateMatrix<OADTablePartStyle * {__strong}>::operator[]((uint64_t)self->mCellStyles, -[OADTableStyleResolver dominantCellInRowRange:columnRange:](self, "dominantCellInRowRange:columnRange:", (int)[v8 topRow], (int)objc_msgSend(v8, "rowSpan"), (int)objc_msgSend(v8, "leftColumn"), (int)objc_msgSend(v8, "gridSpan")));
            id v10 = [(OADTableStyleResolver *)self strokeOfSegmentNormalToDir1:1 i1:v7 fromI2:v4];
            unsigned int v11 = -[OADTableStyleResolver strokeOfSegmentNormalToDir1:i1:fromI2:](self, "strokeOfSegmentNormalToDir1:i1:fromI2:", 1, v7 + [v8 gridSpan], v4);
            uint64_t v12 = [(OADTableStyleResolver *)self strokeOfSegmentNormalToDir1:0 i1:v4 fromI2:v7];
            id v13 = -[OADTableStyleResolver strokeOfSegmentNormalToDir1:i1:fromI2:](self, "strokeOfSegmentNormalToDir1:i1:fromI2:", 0, [v8 rowSpan] + v4, v7);
            [(OADTableStyleResolver *)self applyResolvedPartStyle:v9 leftStroke:v10 rightStroke:v11 topStroke:v12 bottomStroke:v13 toCell:v8];
          }
          ++v7;
          uint64_t mColumnCount = self->mColumnCount;
          v6 += 0x100000000;
        }
        while (v7 < mColumnCount);
        int mRowCount = self->mRowCount;
      }
      ++v4;
    }
    while (v4 < mRowCount);
  }
}

- (void)flatten
{
  [(OADTableStyleResolver *)self fixVectorAtExtremePositionFlags];
  [(OADTableStyleResolver *)self loadCells];
  [(OADTableStyleResolver *)self applyCellStyles];
  [(OADTableStyleResolver *)self applyStyleStrokes];
  [(OADTableStyleResolver *)self applyResolvedStyling];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTableStyle, 0);
  objc_storeStrong((id *)&self->mTableProperties, 0);
  objc_storeStrong((id *)&self->mTable, 0);
}

@end