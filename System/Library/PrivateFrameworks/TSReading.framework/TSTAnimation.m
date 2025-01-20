@interface TSTAnimation
+ (BOOL)deliveryStyleSupportedForExport:(unint64_t)a3;
+ (id)newAnimationWithLayout:(id)a3 andCellRange:(id)a4;
+ (id)newAnimationWithLayout:(id)a3 andDeliveryStyle:(unint64_t)a4;
+ (id)textureDeliveryStylesLocalized:(BOOL)a3;
+ (unint64_t)stageCountForTextureDeliveryStyle:(unint64_t)a3 andTable:(id)a4;
+ (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3;
- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeAtIndex:(unint64_t)a3;
- (BOOL)clipStrokes;
- (BOOL)drawCellBackground;
- (BOOL)drawCellContent;
- (BOOL)drawStrokes;
- (BOOL)drawTableBackground;
- (BOOL)drawTableName;
- (BOOL)drawsBlackAndWhite;
- (BOOL)enabled;
- (BOOL)expandBackgroundFill;
- (BOOL)final;
- (BOOL)showsOverlayLayers;
- (BOOL)showsTableChrome;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)cellRangeCount;
- (unint64_t)stage;
- (unint64_t)stageCount;
- (void)addCellRange:(id)a3;
- (void)clearCellRanges;
- (void)dealloc;
- (void)setDrawsBlackAndWhite:(BOOL)a3;
- (void)setExpandBackgroundFill:(BOOL)a3;
- (void)setShowsOverlayLayers:(BOOL)a3;
- (void)setShowsTableChrome:(BOOL)a3;
- (void)setStage:(unint64_t)a3 andFinal:(BOOL)a4;
@end

@implementation TSTAnimation

+ (id)newAnimationWithLayout:(id)a3 andDeliveryStyle:(unint64_t)a4
{
  v6 = objc_alloc_init(TSTAnimation);
  v7 = v6;
  v6->mLayout = (TSTLayout *)a3;
  if (a4 > 0xC) {
    int v8 = 1;
  }
  else {
    int v8 = dword_22383BD30[a4];
  }
  TSTAnimationSetKind((uint64_t)v6, v8);
  return v7;
}

+ (id)newAnimationWithLayout:(id)a3 andCellRange:(id)a4
{
  v6 = objc_alloc_init(TSTAnimation);
  v6->mLayout = (TSTLayout *)a3;
  TSTAnimationSetKind((uint64_t)v6, 14);
  [(TSTAnimation *)v6 addCellRange:a4];
  return v6;
}

- (void)dealloc
{
  mCellRanges = self->mCellRanges;
  if (mCellRanges) {
    free(mCellRanges);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTAnimation;
  [(TSTAnimation *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[TSTAnimation allocWithZone:a3] init];
  v4->mLayout = self->mLayout;
  v4->mKind = self->mKind;
  v5 = ($CA3468F20078D5D2DB35E78E73CA60DA *)malloc_type_malloc(8 * self->mCellRangeCount, 0x100004000313F17uLL);
  v4->mCellRanges = v5;
  memcpy(v5, self->mCellRanges, 8 * self->mCellRangeCount);
  v4->mCellRangeCount = self->mCellRangeCount;
  v4->mStageCount = self->mStageCount;
  v4->mStage = self->mStage;
  v4->mFinal = self->mFinal;
  v4->mByColumn = self->mByColumn;
  v4->mByRow = self->mByRow;
  v4->mByCell = self->mByCell;
  v4->mByContent = self->mByContent;
  v4->mByCellRange = self->mByCellRange;
  v4->mByMissingCellRange = self->mByMissingCellRange;
  v4->mReverse = self->mReverse;
  v4->mShowsTableChrome = self->mShowsTableChrome;
  v4->mShowsOverlayLayers = self->mShowsOverlayLayers;
  v4->mExpandBackgroundFill = self->mExpandBackgroundFill;
  v4->mDrawsBlackAndWhite = self->mDrawsBlackAndWhite;
  return v4;
}

+ (id)textureDeliveryStylesLocalized:(BOOL)a3
{
  v4[13] = *MEMORY[0x263EF8340];
  if (!a3) {
    return &unk_26D739C60;
  }
  v4[0] = [(id)TSTBundle() localizedStringForKey:@"All at Once" value:&stru_26D688A48 table:@"TSTables"];
  v4[1] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", @"By Row", &stru_26D688A48, @"TSTables", v4[0]);
  v4[2] = [(id)TSTBundle() localizedStringForKey:@"By Column" value:&stru_26D688A48 table:@"TSTables"];
  v4[3] = [(id)TSTBundle() localizedStringForKey:@"By Cell" value:&stru_26D688A48 table:@"TSTables"];
  v4[4] = [(id)TSTBundle() localizedStringForKey:@"By Row Content" value:&stru_26D688A48 table:@"TSTables"];
  v4[5] = [(id)TSTBundle() localizedStringForKey:@"By Column Content" value:&stru_26D688A48 table:@"TSTables"];
  v4[6] = [(id)TSTBundle() localizedStringForKey:@"By Cell Content" value:&stru_26D688A48 table:@"TSTables"];
  v4[7] = [(id)TSTBundle() localizedStringForKey:@"By Row Reverse" value:&stru_26D688A48 table:@"TSTables"];
  v4[8] = [(id)TSTBundle() localizedStringForKey:@"By Row Content Reverse" value:&stru_26D688A48 table:@"TSTables"];
  v4[9] = [(id)TSTBundle() localizedStringForKey:@"By Column Reverse" value:&stru_26D688A48 table:@"TSTables"];
  v4[10] = [(id)TSTBundle() localizedStringForKey:@"By Column Content Reverse" value:&stru_26D688A48 table:@"TSTables"];
  v4[11] = [(id)TSTBundle() localizedStringForKey:@"By Cell Reverse" value:&stru_26D688A48 table:@"TSTables"];
  v4[12] = [(id)TSTBundle() localizedStringForKey:@"By Cell Content Reverse" value:&stru_26D688A48 table:@"TSTables"];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:13];
}

+ (unint64_t)stageCountForTextureDeliveryStyle:(unint64_t)a3 andTable:(id)a4
{
  if (a3 > 0xC) {
    int v4 = 1;
  }
  else {
    int v4 = dword_22383BD30[a3];
  }
  return TSTAnimationGetStageCountForChunkStyle((TSTTableModel *)a4, v4);
}

+ (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3
{
  unint64_t result = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "textureDeliveryStylesLocalized:", 0), "indexOfObject:", a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[TSTAnimation textureDeliveryStyleFromDeliveryString:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTAnimation.mm"), 682, @"bad delivery string to delivery style mapping");
    return 0;
  }
  return result;
}

+ (BOOL)deliveryStyleSupportedForExport:(unint64_t)a3
{
  if (a3 > 0xC) {
    LOBYTE(v3) = 1;
  }
  else {
    return (0x5D77u >> dword_22383BD30[a3]) & 1;
  }
  return v3;
}

- (void)setStage:(unint64_t)a3 andFinal:(BOOL)a4
{
  if (self->mStageCount > a3) {
    self->mStage = a3;
  }
  self->mFinal = a4;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeAtIndex:(unint64_t)a3
{
  if (self->mCellRangeCount <= a3) {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
  else {
    return self->mCellRanges[a3];
  }
}

- (unint64_t)cellRangeCount
{
  uint64_t PartitionRange = TSTLayoutGetPartitionRange(self->mLayout);
  int mKind = self->mKind;
  if (mKind != 14)
  {
    uint64_t v5 = PartitionRange;
    mCellRanges = self->mCellRanges;
    if (mCellRanges)
    {
      free(mCellRanges);
      self->mCellRanges = 0;
      self->mCellRangeCount = 0;
      int mKind = self->mKind;
    }
    switch(mKind)
    {
      case 0:
      case 1:
        goto LABEL_20;
      case 2:
      case 3:
        unint64_t mStage = self->mStage;
        if (self->mReverse)
        {
          unint64_t v8 = self->mStageCount + ~mStage;
LABEL_23:
          v14 = [(TSTLayout *)self->mLayout tableModel];
          v16 = self;
          uint64_t v15 = v8;
        }
        else
        {
          v14 = [(TSTLayout *)self->mLayout tableModel];
          uint64_t v15 = mStage;
          v16 = self;
        }
        TSTAnimationAddCellRangesForColumnIndex(v16, v14, v15);
        break;
      case 4:
      case 5:
        unint64_t v9 = self->mStage;
        if (self->mReverse) {
          unint64_t v9 = self->mStageCount + ~v9;
        }
        goto LABEL_26;
      case 6:
      case 7:
        unint64_t v10 = self->mStage;
        if (self->mReverse) {
          unint64_t v10 = self->mStageCount + ~v10;
        }
        goto LABEL_28;
      case 8:
      case 9:
        unint64_t v11 = self->mStage;
        if (!v11) {
          goto LABEL_20;
        }
        if (self->mReverse) {
          unint64_t v8 = self->mStageCount + ~v11;
        }
        else {
          unint64_t v8 = v11 - 1;
        }
        goto LABEL_23;
      case 10:
      case 11:
        unint64_t v12 = self->mStage;
        if (!v12) {
          goto LABEL_20;
        }
        if (self->mReverse) {
          unint64_t v9 = self->mStageCount + ~v12;
        }
        else {
          unint64_t v9 = v12 - 1;
        }
LABEL_26:
        TSTAnimationAddCellRangesForRowIndex(self, [(TSTLayout *)self->mLayout tableModel], v9);
        return self->mCellRangeCount;
      case 12:
      case 13:
        unint64_t v13 = self->mStage;
        if (v13)
        {
          if (self->mReverse) {
            unint64_t v10 = self->mStageCount + ~v13;
          }
          else {
            unint64_t v10 = v13 - 1;
          }
LABEL_28:
          TSTAnimationAddCellRangeForCellIndex(self, [(TSTLayout *)self->mLayout tableModel], v10);
        }
        else
        {
LABEL_20:
          [(TSTAnimation *)self addCellRange:v5];
        }
        return self->mCellRangeCount;
      default:
        return self->mCellRangeCount;
    }
  }
  return self->mCellRangeCount;
}

- (void)addCellRange:(id)a3
{
  if (a3.var0.var0 != 0xFFFF
    && (*(void *)&a3 & 0xFF0000) != 0xFF0000
    && a3.var1.var1
    && (*(void *)&a3 & 0xFFFF00000000) != 0)
  {
    p_mCellRanges = &self->mCellRanges;
    mCellRanges = self->mCellRanges;
    unint64_t v7 = (unint64_t)p_mCellRanges[1] + 1;
    self->mCellRangeCount = v7;
    unint64_t v8 = ($CA3468F20078D5D2DB35E78E73CA60DA *)malloc_type_realloc(mCellRanges, 8 * v7, 0x100004000313F17uLL);
    self->mCellRanges = v8;
    v8[self->mCellRangeCount - 1] = a3;
  }
}

- (void)clearCellRanges
{
  p_mCellRanges = &self->mCellRanges;
  mCellRanges = self->mCellRanges;
  if (mCellRanges)
  {
    free(mCellRanges);
    *p_mCellRanges = 0;
    p_mCellRanges[1] = 0;
  }
}

- (BOOL)enabled
{
  return self->mKind != 0;
}

- (BOOL)drawTableName
{
  BOOL v3 = [(TSTAnimation *)self enabled];
  if (v3)
  {
    if (self->mByCellRange) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = self->mFinal || self->mStage == 0;
    }
  }
  return v3;
}

- (BOOL)drawTableBackground
{
  BOOL v3 = [(TSTAnimation *)self enabled];
  if (v3) {
    LOBYTE(v3) = ![(TSTAnimation *)self drawsBlackAndWhite]
  }
              && (self->mFinal || self->mByCellRange || !self->mByContent || self->mStage == 0);
  return v3;
}

- (BOOL)drawCellBackground
{
  BOOL v3 = [(TSTAnimation *)self enabled];
  if (v3) {
    LOBYTE(v3) = ![(TSTAnimation *)self drawsBlackAndWhite]
  }
              && (self->mByCellRange || !self->mByContent || self->mStage != 0);
  return v3;
}

- (BOOL)drawCellContent
{
  BOOL v3 = [(TSTAnimation *)self enabled];
  if (v3) {
    LOBYTE(v3) = self->mByCellRange || !self->mByContent || self->mStage != 0;
  }
  return v3;
}

- (BOOL)clipStrokes
{
  BOOL v3 = [(TSTAnimation *)self enabled];
  if (v3) {
    LOBYTE(v3) = self->mByCellRange || !self->mByContent;
  }
  return v3;
}

- (BOOL)drawStrokes
{
  BOOL v3 = [(TSTAnimation *)self enabled];
  if (v3) {
    LOBYTE(v3) = self->mFinal || self->mByCellRange || !self->mByContent || self->mStage == 0;
  }
  return v3;
}

- (unint64_t)stageCount
{
  return self->mStageCount;
}

- (unint64_t)stage
{
  return self->mStage;
}

- (BOOL)final
{
  return self->mFinal;
}

- (BOOL)showsTableChrome
{
  return self->mShowsTableChrome;
}

- (void)setShowsTableChrome:(BOOL)a3
{
  self->mShowsTableChrome = a3;
}

- (BOOL)showsOverlayLayers
{
  return self->mShowsOverlayLayers;
}

- (void)setShowsOverlayLayers:(BOOL)a3
{
  self->mShowsOverlayLayers = a3;
}

- (BOOL)expandBackgroundFill
{
  return self->mExpandBackgroundFill;
}

- (void)setExpandBackgroundFill:(BOOL)a3
{
  self->mExpandBackgroundFill = a3;
}

- (BOOL)drawsBlackAndWhite
{
  return self->mDrawsBlackAndWhite;
}

- (void)setDrawsBlackAndWhite:(BOOL)a3
{
  self->mDrawsBlackAndWhite = a3;
}

@end