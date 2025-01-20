@interface PXExploreLayoutGenerator
- ($340E233F617FB3D5D9EFCE5A6F22D754)presentedItemLocationForItemAtIndex:(SEL)a3;
- (BOOL)_isShortRowNextFollowedByLargeHero;
- (BOOL)_parseFourColumnLayoutWithOptions:(unint64_t)a3;
- (BOOL)_parseSevenColumnLayoutWithOptions:(unint64_t)a3;
- (BOOL)_parseSixColumnLayoutWithOptions:(unint64_t)a3;
- (BOOL)_parseThreeColumnLayoutWithOptions:(unint64_t)a3;
- (BOOL)canReorderItemsAcrossRows;
- (BOOL)canUseSingleSevenColumnHeroRowForNumberOfRemainingItems:(int64_t)a3;
- (BOOL)isAcceptableLargeHeroNextItemAtIndex:(int64_t)a3;
- (BOOL)nextInputItems:(unint64_t)a3;
- (BOOL)nextItems:(int64_t)a3 areAll:(unint64_t)a4;
- (BOOL)nextItems:(int64_t)a3 isAny:(unint64_t)a4;
- (BOOL)parseFourColumnGroupWithShortRowFollowedByLargeHero;
- (BOOL)parseFourColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4;
- (BOOL)parseMacLayout;
- (BOOL)parsePadLandscapeLayout;
- (BOOL)parsePadPortraitLayout;
- (BOOL)parsePhoneLandscapeLayout;
- (BOOL)parsePhonePortraitLayout;
- (BOOL)parseSevenColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 options:(unint64_t)a5;
- (BOOL)parseSevenColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6;
- (BOOL)parseSixColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 options:(unint64_t)a5;
- (BOOL)parseSixColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6;
- (BOOL)parseThreeColumnGroupWithFiveItems;
- (BOOL)parseThreeColumnGroupWithShortRowFollowedByLargeHero;
- (BOOL)parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:(BOOL)a3;
- (BOOL)parseThreeColumnMediumHeroRowWithPano;
- (BOOL)parseThreeColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4;
- (BOOL)parseThreeColumnShortRowWithPano;
- (BOOL)prepareNextItems:(int64_t)a3 withLargeHeroIndex:(int64_t)a4;
- (CGRect)presentedRectForItemAtIndex:(int64_t)a3;
- (CGSize)_cellSizeForNumberOfColumns:(int64_t)a3;
- (CGSize)_estimatedSizeForColumns:(int64_t)a3 headerRows:(int64_t)a4 averageItemsPerBlock:(double)a5 averageRowsPerBlock:(double)a6 withOptions:(unint64_t)a7;
- (CGSize)_estimatedSizeForFourColumnLayoutWithOptions:(unint64_t)a3;
- (CGSize)_estimatedSizeForSevenColumnLayoutWithOptions:(unint64_t)a3;
- (CGSize)_estimatedSizeForSixColumnLayoutWithOptions:(unint64_t)a3;
- (CGSize)_estimatedSizeForThreeColumnLayoutWithOptions:(unint64_t)a3;
- (CGSize)buildingBlockSize;
- (CGSize)estimatedSize;
- (CGSize)estimatedSizeForPadLandscape;
- (CGSize)estimatedSizeForPadPortrait;
- (CGSize)estimatedSizeForPhoneLandscape;
- (CGSize)estimatedSizeForPhonePortrait;
- (CGSize)headerItemSize;
- (CGSize)minHeroItemsSize;
- (CGSize)minimumItemSize;
- (CGSize)size;
- (NSString)diagnosticDescription;
- (PXExploreLayoutGenerator)initWithMetrics:(id)a3;
- (PXExploreParsingState)localState;
- (_PXCornerSpriteIndexes)cornerSpriteIndexes;
- (double)_buildingBlockAspectRatioForNumberOfColumns:(int64_t)a3 options:(unint64_t)a4;
- (double)score:(int64_t)a3 forNextItemAtIndex:(int64_t)a4;
- (id)presentedItemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4;
- (id)presentedItemsInRect:(CGRect)a3;
- (int64_t)indexWithinNextItems:(int64_t)a3 having:(int64_t)a4 keyIndex:(int64_t)a5;
- (int64_t)itemIndexForItem:(int64_t)a3 inDirection:(unint64_t)a4;
- (int64_t)itemIndexForPresentedItemIndex:(int64_t)a3;
- (int64_t)numberOf:(unint64_t)a3 withinNextItems:(int64_t)a4;
- (int64_t)numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:(int64_t)a3;
- (int64_t)numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:(int64_t)a3;
- (int64_t)numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:(int64_t)a3;
- (int64_t)numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:(int64_t)a3 rowOptions:(unint64_t *)a4;
- (int64_t)numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:(int64_t)a3;
- (int64_t)numberOfRemainingItems;
- (int64_t)preferredRowTypeAfterRowWithType:(int64_t)a3;
- (int64_t)presentedNumberOfColumnsAtRow:(int64_t)a3;
- (int64_t)presentedNumberOfRows;
- (unint64_t)attributesForNextItemAtIndex:(int64_t)a3;
- (void)_addThreeItemsToSixColumnRowWithHeroItemType:(int64_t)a3 options:(unint64_t)a4 rowType:(int64_t *)a5;
- (void)_addTwoItemsForThreeColumnRowPreferringTallVariant:(BOOL)a3;
- (void)_parseFourColumnHeroRowWithType:(int64_t)a3 heroItemType:(int64_t)a4 numberOfItems:(int64_t)a5;
- (void)_parseFourColumnShortRowWithNumberOfItems:(int64_t)a3;
- (void)_parseSevenColumnHeroRowWithNumberOfItems:(int64_t)a3 heroItemType:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6;
- (void)_parseSevenColumnShortRowWithNumberOfItems:(int64_t)a3;
- (void)_parseSixColumnHeroRowWithNumberOfItems:(int64_t)a3 heroItemType:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6;
- (void)_parseSixColumnShortRowWithNumberOfItems:(int64_t)a3;
- (void)_parseThreeColumnHeaderRowWithNumberOfItems:(int64_t)a3;
- (void)_parseThreeColumnMediumHeroRowWithNumberOfItems:(int64_t)a3;
- (void)_parseThreeColumnShortRowWithNumberOfItems:(int64_t)a3;
- (void)_prepareIfNeeded;
- (void)addFullWidthItemWithType:(int64_t)a3 atRow:(int64_t)a4 aspectRatio:(double)a5;
- (void)addLocalItemWithType:(int64_t)a3 atColumn:(int64_t)a4 row:(int64_t)a5 columnSpan:(int64_t)a6 rowSpan:(int64_t)a7;
- (void)beginRowWithNumberOfColumns:(int64_t)a3;
- (void)dealloc;
- (void)endFullWidthRowWithType:(int64_t)a3 aspectRatio:(double)a4;
- (void)endRowWithType:(int64_t)a3;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)getLowestAspectRatio:(double *)a3 highestAspectRatio:(double *)a4 forNextItems:(int64_t)a5;
- (void)invalidate;
- (void)moveNextItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)reorderNextItems:(int64_t)a3 usingMapping:(id)a4;
- (void)setBuildingBlockColumnSpan:(int64_t)a3 rowSpan:(int64_t)a4 withNumberOfColumns:(int64_t)a5;
- (void)sortNextItems:(int64_t)a3 withItemAtIndex:(int64_t)a4 having:(int64_t)a5;
@end

@implementation PXExploreLayoutGenerator

- (double)_buildingBlockAspectRatioForNumberOfColumns:(int64_t)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v6 = [(PXExploreLayoutGenerator *)self metrics];
  [v6 buildingBlockAspectRatio];
  if (v7 > 0.0)
  {
    [v6 buildingBlockAspectRatio];
LABEL_10:
    double v9 = v8;
    goto LABEL_11;
  }
  double v9 = 1.0;
  if ((v4 & 1) == 0)
  {
    if ((v4 & 4) != 0)
    {
      double v8 = PXExploreLayoutCellPreferredAspectRatio([v6 layoutType], objc_msgSend(v6, "layoutSubtype"));
      goto LABEL_10;
    }
    [v6 referenceSize];
    double v11 = v10;
    double v13 = v12;
    if ((v4 & 2) == 0)
    {
      [v6 safeAreaInsets];
      double v15 = v14;
      [v6 safeAreaInsets];
      double v13 = v13 - (v15 + v16);
    }
    double v17 = round(v13/ (v11/ (double)a3/ PXExploreLayoutCellPreferredAspectRatio([v6 layoutType], objc_msgSend(v6, "layoutSubtype"))));
    [v6 interitemSpacing];
    double v9 = v11 / -(v18 - (v13 + v18) / (double)(uint64_t)v17 * (double)a3);
    if ((*(void *)&v9 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
      double v9 = 1.0;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)_parseSevenColumnLayoutWithOptions:(unint64_t)a3
{
  v5 = [(PXExploreLayoutGenerator *)self localState];
  [(PXExploreLayoutGenerator *)self _buildingBlockAspectRatioForNumberOfColumns:7 options:a3];
  objc_msgSend(v5, "setBuildingBlockAspectRatio:");
  [v5 setEffectiveLargeHeroDensity:0];
  [(PXExploreLayoutGenerator *)self setBuildingBlockColumnSpan:1 rowSpan:1 withNumberOfColumns:7];
  uint64_t v6 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    while (1)
    {
      uint64_t v9 = [v5 nextRowType];
      if ([(PXExploreLayoutGenerator *)self canUseSingleSevenColumnHeroRowForNumberOfRemainingItems:v7]&& v9 == 1)
      {
        uint64_t v9 = 2;
      }
      if ((unint64_t)(v9 - 2) >= 2)
      {
        if (v9 != 1
          || ![(PXExploreLayoutGenerator *)self parseSevenColumnRowWithType:1 numberOfItems:[(PXExploreLayoutGenerator *)self numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:v7] options:0])
        {
          goto LABEL_13;
        }
      }
      else if (![(PXExploreLayoutGenerator *)self parseSevenColumnRowWithType:v9 numberOfItems:[(PXExploreLayoutGenerator *)self numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:v7] options:0])
      {
        goto LABEL_13;
      }
      uint64_t v7 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
      char v8 = 1;
      if (v7 <= 0) {
        goto LABEL_13;
      }
    }
  }
  char v8 = 0;
LABEL_13:

  return v8 & 1;
}

- (BOOL)_parseSixColumnLayoutWithOptions:(unint64_t)a3
{
  v5 = [(PXExploreLayoutGenerator *)self localState];
  [(PXExploreLayoutGenerator *)self _buildingBlockAspectRatioForNumberOfColumns:6 options:a3];
  objc_msgSend(v5, "setBuildingBlockAspectRatio:");
  [v5 setEffectiveLargeHeroDensity:0];
  [(PXExploreLayoutGenerator *)self setBuildingBlockColumnSpan:1 rowSpan:1 withNumberOfColumns:6];
  uint64_t v6 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    while (1)
    {
      uint64_t v9 = [v5 nextRowType];
      uint64_t v10 = v9;
      if ((unint64_t)(v9 - 2) < 2)
      {
        uint64_t v17 = 0;
        int64_t v13 = [(PXExploreLayoutGenerator *)self numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:v7 rowOptions:&v17];
        if (![(PXExploreLayoutGenerator *)self parseSixColumnRowWithType:v10 numberOfItems:v13 options:v17])goto LABEL_25; {
      }
        }
      else
      {
        if (v9 == 1)
        {
          int64_t v14 = [(PXExploreLayoutGenerator *)self numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:v7];
          double v15 = self;
        }
        else
        {
          if (v9) {
            goto LABEL_25;
          }
          uint64_t v11 = 0;
          uint64_t v12 = 3;
          switch(v7)
          {
            case 1:
            case 2:
            case 5:
              goto LABEL_17;
            case 4:
            case 7:
            case 8:
            case 11:
              uint64_t v11 = 2;
              goto LABEL_16;
            case 6:
              uint64_t v11 = 4;
              goto LABEL_8;
            case 10:
            case 19:
            case 23:
            case 26:
            case 28:
              uint64_t v11 = 4;
LABEL_16:
              uint64_t v7 = 4;
              goto LABEL_17;
            case 14:
              goto LABEL_22;
            case 17:
              uint64_t v12 = 4;
LABEL_22:
              if (![(PXExploreLayoutGenerator *)self parseSixColumnRowWithType:0 numberOfItems:4 subsequentShortRowItems:v12 options:2])goto LABEL_25; {
              double v15 = self;
              }
              int64_t v14 = v12;
              break;
            default:
              uint64_t v11 = 0;
LABEL_8:
              uint64_t v7 = 3;
LABEL_17:
              if ([(PXExploreLayoutGenerator *)self parseSixColumnRowWithType:0 numberOfItems:v7 subsequentShortRowItems:0 options:v11])
              {
                goto LABEL_18;
              }
              goto LABEL_25;
          }
        }
        if (![(PXExploreLayoutGenerator *)v15 parseSixColumnRowWithType:1 numberOfItems:v14 options:0])goto LABEL_25; {
      }
        }
LABEL_18:
      uint64_t v7 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
      char v8 = 1;
      if (v7 <= 0) {
        goto LABEL_25;
      }
    }
  }
  char v8 = 0;
LABEL_25:

  return v8 & 1;
}

- (BOOL)_parseFourColumnLayoutWithOptions:(unint64_t)a3
{
  v5 = [(PXExploreLayoutGenerator *)self localState];
  [(PXExploreLayoutGenerator *)self _buildingBlockAspectRatioForNumberOfColumns:4 options:a3];
  objc_msgSend(v5, "setBuildingBlockAspectRatio:");
  int64_t v6 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  uint64_t v7 = [(PXExploreLayoutGenerator *)self metrics];
  int v8 = [v7 allowHeaders];

  uint64_t v9 = v6 + (v8 ^ 1u);
  if (v9 <= 24) {
    [v5 setEffectiveLargeHeroDensity:0];
  }
  if ((unint64_t)v9 > 0xE || ((1 << v9) & 0x449C) == 0)
  {
    uint64_t v11 = self;
    uint64_t v12 = 1;
    uint64_t v13 = 1;
    uint64_t v14 = 4;
  }
  else
  {
    [v5 setNumberOfColumnsOverride:3];
    uint64_t v11 = self;
    uint64_t v12 = 4;
    uint64_t v13 = 3;
    uint64_t v14 = 12;
  }
  [(PXExploreLayoutGenerator *)v11 setBuildingBlockColumnSpan:v12 rowSpan:v13 withNumberOfColumns:v14];
  uint64_t v15 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  if (v15 >= 1)
  {
    uint64_t v16 = v15;
    char v17 = 0;
    while (2)
    {
      switch([v5 nextRowType])
      {
        case 0:
          double v18 = self;
          uint64_t v19 = 0;
          if ((unint64_t)v16 > 3) {
            int64_t v20 = 1;
          }
          else {
            int64_t v20 = v16;
          }
          goto LABEL_29;
        case 1:
          if ([(PXExploreLayoutGenerator *)self parseFourColumnGroupWithShortRowFollowedByLargeHero])
          {
            goto LABEL_30;
          }
          if ((unint64_t)v16 <= 0xD
            && ((1 << v16) & 0x2240) != 0
            && [v5 numberOfColumnsOverride] == 3)
          {
            double v18 = self;
            uint64_t v19 = 1;
LABEL_21:
            int64_t v20 = 3;
          }
          else
          {
            if (v16 >= 4) {
              int64_t v20 = 4;
            }
            else {
              int64_t v20 = v16;
            }
            double v18 = self;
            uint64_t v19 = 1;
          }
LABEL_29:
          if (![(PXExploreLayoutGenerator *)v18 parseFourColumnRowWithType:v19 numberOfItems:v20])goto LABEL_35; {
LABEL_30:
          }
          uint64_t v16 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
          char v17 = 1;
          if (v16 <= 0) {
            goto LABEL_35;
          }
          continue;
        case 2:
          int64_t v20 = [(PXExploreLayoutGenerator *)self numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:v16];
          double v18 = self;
          uint64_t v19 = 2;
          goto LABEL_29;
        case 3:
          switch(v16)
          {
            case 2:
              double v18 = self;
              uint64_t v19 = 2;
              int64_t v20 = 2;
              goto LABEL_29;
            case 3:
            case 6:
            case 7:
              double v18 = self;
              uint64_t v19 = 2;
              goto LABEL_21;
            case 4:
              double v18 = self;
              uint64_t v19 = 2;
              int64_t v20 = 4;
              goto LABEL_29;
            default:
              if ([(PXExploreLayoutGenerator *)self parseFourColumnRowWithType:3 numberOfItems:1])
              {
                goto LABEL_30;
              }
              break;
          }
          goto LABEL_35;
        default:
          goto LABEL_35;
      }
    }
  }
  char v17 = 0;
LABEL_35:

  return v17 & 1;
}

- (BOOL)_parseThreeColumnLayoutWithOptions:(unint64_t)a3
{
  v5 = [(PXExploreLayoutGenerator *)self localState];
  [(PXExploreLayoutGenerator *)self _buildingBlockAspectRatioForNumberOfColumns:3 options:a3];
  objc_msgSend(v5, "setBuildingBlockAspectRatio:");
  uint64_t v6 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  if (v6 <= 19) {
    [v5 setEffectiveLargeHeroDensity:0];
  }
  [(PXExploreLayoutGenerator *)self setBuildingBlockColumnSpan:1 rowSpan:1 withNumberOfColumns:3];
  uint64_t v7 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  if (v7 < 1)
  {
    char v9 = 0;
  }
  else
  {
    uint64_t v8 = v7;
    char v9 = 0;
    while (2)
    {
      switch([v5 nextRowType])
      {
        case 0:
          if (v8 != 2)
          {
            uint64_t v12 = self;
            uint64_t v13 = 0;
            goto LABEL_20;
          }
          BOOL v10 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 1, 2, 0);
          BOOL v11 = [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:0 numberOfItems:1];
          if (v10) {
            goto LABEL_39;
          }
          if (v11)
          {
            uint64_t v12 = self;
            uint64_t v13 = 3;
LABEL_20:
            uint64_t v14 = 1;
            goto LABEL_38;
          }
          break;
        case 1:
          if ([(PXExploreLayoutGenerator *)self parseThreeColumnGroupWithShortRowFollowedByLargeHero])
          {
            goto LABEL_40;
          }
          if (![(PXExploreLayoutGenerator *)self nextItems:3 isAny:2])
          {
            uint64_t v16 = [v5 parseLocation];
            switch(v8)
            {
              case 1:
                goto LABEL_52;
              case 2:
                if (v6 == 3)
                {
                  double v18 = self;
                  uint64_t v19 = 2;
                  uint64_t v20 = 2;
                }
                else
                {
                  uint64_t v8 = 2;
LABEL_52:
                  double v18 = self;
                  uint64_t v19 = 1;
                  uint64_t v20 = v8;
                }
                [(PXExploreLayoutGenerator *)v18 parseThreeColumnRowWithType:v19 numberOfItems:v20];
LABEL_54:
                if ([v5 parseLocation] <= v16) {
                  goto LABEL_58;
                }
                goto LABEL_40;
              case 3:
                goto LABEL_51;
              case 4:
              case 7:
              case 10:
                if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 0x20000, 2, 0))
                {
                  goto LABEL_51;
                }
                [(PXExploreLayoutGenerator *)self parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:(v6 & 0xFFFFFFFFFFFFFFFELL) == 4];
                goto LABEL_54;
              case 5:
                if ([(PXExploreLayoutGenerator *)self nextItems:5 isAny:2]) {
                  goto LABEL_51;
                }
                [(PXExploreLayoutGenerator *)self parseThreeColumnGroupWithFiveItems];
                goto LABEL_54;
              default:
                if (![(PXExploreLayoutGenerator *)self nextItems:6 isAny:2])
                {
                  if ([(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows])
                  {
                    uint64_t v21 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:6 having:0 keyIndex:5];
                    if (v21 <= 2)
                    {
                      [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v21 toIndex:3];
                      [v5 setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:1];
                    }
                  }
                }
LABEL_51:
                uint64_t v8 = 3;
                goto LABEL_52;
            }
          }
          LOBYTE(v11) = [(PXExploreLayoutGenerator *)self parseThreeColumnShortRowWithPano];
          goto LABEL_39;
        case 2:
          if ([(PXExploreLayoutGenerator *)self nextItems:3 isAny:2])
          {
            LOBYTE(v11) = [(PXExploreLayoutGenerator *)self parseThreeColumnMediumHeroRowWithPano];
            goto LABEL_39;
          }
          if (v8 != 4)
          {
            if (v8 >= 3) {
              uint64_t v15 = 3;
            }
            else {
              uint64_t v15 = v8;
            }
            if ((unint64_t)(v8 - 5) <= 1)
            {
              if ([(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows])
              {
                if (([v5 didMoveBestItemOutOfPreviousShortRowIntoHeroRow] & 1) == 0
                  && ![(PXExploreLayoutGenerator *)self nextItems:v8 isAny:2])
                {
                  uint64_t v17 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:v8 having:0 keyIndex:0];
                  if (v17 >= 3) {
                    [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v17 toIndex:2];
                  }
                }
              }
            }
            goto LABEL_37;
          }
          if ([(PXExploreLayoutGenerator *)self nextItems:4 isAny:2])
          {
            uint64_t v15 = 3;
LABEL_37:
            uint64_t v12 = self;
            uint64_t v13 = 2;
            uint64_t v14 = v15;
            goto LABEL_38;
          }
          LOBYTE(v11) = [(PXExploreLayoutGenerator *)self parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:0];
LABEL_39:
          if (!v11) {
            break;
          }
LABEL_40:
          uint64_t v8 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
          char v9 = 1;
          if (v8 <= 0) {
            break;
          }
          continue;
        case 3:
          if (v8 == 2 && !-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 1, 2, 0))
          {
            uint64_t v12 = self;
            uint64_t v13 = 2;
            uint64_t v14 = 2;
LABEL_38:
            LOBYTE(v11) = [(PXExploreLayoutGenerator *)v12 parseThreeColumnRowWithType:v13 numberOfItems:v14];
            goto LABEL_39;
          }
          if (![(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:3 numberOfItems:1])goto LABEL_58; {
          goto LABEL_40;
          }
        default:
          goto LABEL_58;
      }
      break;
    }
  }
LABEL_58:

  return v9 & 1;
}

- (BOOL)parseMacLayout
{
  v3 = [(PXExploreLayoutGenerator *)self metrics];
  uint64_t v4 = [v3 layoutSubtype];

  if (v4 == 3)
  {
    return [(PXExploreLayoutGenerator *)self _parseSevenColumnLayoutWithOptions:4];
  }
  else
  {
    return [(PXExploreLayoutGenerator *)self _parseSixColumnLayoutWithOptions:4];
  }
}

- (BOOL)parsePadLandscapeLayout
{
  v3 = [(PXExploreLayoutGenerator *)self metrics];
  uint64_t v4 = [v3 layoutSubtype];

  if (v4 == 3)
  {
    return [(PXExploreLayoutGenerator *)self _parseSevenColumnLayoutWithOptions:2];
  }
  else
  {
    return [(PXExploreLayoutGenerator *)self _parseSixColumnLayoutWithOptions:2];
  }
}

- (BOOL)parsePadPortraitLayout
{
  return [(PXExploreLayoutGenerator *)self _parseFourColumnLayoutWithOptions:2];
}

- (BOOL)parsePhoneLandscapeLayout
{
  v3 = [(PXExploreLayoutGenerator *)self metrics];
  uint64_t v4 = [v3 layoutSubtype];

  if (v4 == 3)
  {
    return [(PXExploreLayoutGenerator *)self _parseSevenColumnLayoutWithOptions:2];
  }
  else
  {
    return [(PXExploreLayoutGenerator *)self _parseSixColumnLayoutWithOptions:2];
  }
}

- (BOOL)parsePhonePortraitLayout
{
  return [(PXExploreLayoutGenerator *)self _parseThreeColumnLayoutWithOptions:1];
}

- (CGSize)_estimatedSizeForColumns:(int64_t)a3 headerRows:(int64_t)a4 averageItemsPerBlock:(double)a5 averageRowsPerBlock:(double)a6 withOptions:(unint64_t)a7
{
  char v7 = a7;
  uint64_t v13 = [(PXExploreLayoutGenerator *)self metrics];
  [v13 referenceSize];
  double v15 = v14;

  uint64_t v16 = [(PXExploreLayoutGenerator *)self itemCount];
  uint64_t v17 = [(PXExploreLayoutGenerator *)self metrics];
  [v17 buildingBlockAspectRatio];
  if (v18 <= 0.0)
  {
    double v20 = 1.0;
    if ((v7 & 1) == 0)
    {
      uint64_t v21 = [(PXExploreLayoutGenerator *)self metrics];
      uint64_t v22 = [v21 layoutType];
      v23 = [(PXExploreLayoutGenerator *)self metrics];
      double v20 = PXExploreLayoutCellPreferredAspectRatio(v22, [v23 layoutSubtype]);
    }
  }
  else
  {
    [v17 buildingBlockAspectRatio];
    double v20 = v19;
  }

  double v24 = v15;
  double v25 = v15 / (double)a3 / v20 * ((double)a4 + (double)((a3 + v16 - 2) / a3) / a5 * a6);
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)_estimatedSizeForSevenColumnLayoutWithOptions:(unint64_t)a3
{
  [(PXExploreLayoutGenerator *)self _estimatedSizeForColumns:7 headerRows:3 averageItemsPerBlock:a3 averageRowsPerBlock:12.0 withOptions:4.0];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_estimatedSizeForSixColumnLayoutWithOptions:(unint64_t)a3
{
  [(PXExploreLayoutGenerator *)self _estimatedSizeForColumns:6 headerRows:3 averageItemsPerBlock:a3 averageRowsPerBlock:9.0 withOptions:4.0];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_estimatedSizeForFourColumnLayoutWithOptions:(unint64_t)a3
{
  [(PXExploreLayoutGenerator *)self _estimatedSizeForColumns:4 headerRows:3 averageItemsPerBlock:a3 averageRowsPerBlock:4.0 withOptions:2.0];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_estimatedSizeForThreeColumnLayoutWithOptions:(unint64_t)a3
{
  [(PXExploreLayoutGenerator *)self _estimatedSizeForColumns:3 headerRows:3 averageItemsPerBlock:a3 averageRowsPerBlock:3.0 withOptions:1.5];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)estimatedSizeForPadLandscape
{
  [(PXExploreLayoutGenerator *)self _estimatedSizeForSixColumnLayoutWithOptions:2];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)estimatedSizeForPadPortrait
{
  [(PXExploreLayoutGenerator *)self _estimatedSizeForFourColumnLayoutWithOptions:2];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)estimatedSizeForPhoneLandscape
{
  [(PXExploreLayoutGenerator *)self _estimatedSizeForSixColumnLayoutWithOptions:2];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)estimatedSizeForPhonePortrait
{
  [(PXExploreLayoutGenerator *)self _estimatedSizeForThreeColumnLayoutWithOptions:1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
}

- (PXExploreParsingState)localState
{
  return self->_localState;
}

- (id)presentedItemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (self->_isPrepared)
  {
    int64_t v8 = a3 & ~(a3 >> 63);
    uint64_t v9 = [(PXExploreLayoutGenerator *)self itemCount];
    if (v9 - 1 < (unint64_t)a4) {
      a4 = v9 - 1;
    }
    [(PXExploreLayoutGenerator *)self presentedRectForItemAtIndex:v8];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(PXExploreLayoutGenerator *)self presentedRectForItemAtIndex:a4];
    CGFloat x = v37.origin.x;
    CGFloat y = v37.origin.y;
    CGFloat width = v37.size.width;
    CGFloat height = v37.size.height;
    double MaxX = CGRectGetMaxX(v37);
    v38.origin.CGFloat x = v11;
    v38.origin.CGFloat y = v13;
    v38.size.CGFloat width = v15;
    v38.size.CGFloat height = v17;
    double MinX = CGRectGetMinX(v38);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v39);
    v40.origin.CGFloat x = v11;
    v40.origin.CGFloat y = v13;
    v40.size.CGFloat width = v15;
    v40.size.CGFloat height = v17;
    double MinY = CGRectGetMinY(v40);
    double v24 = MaxX;
    if (MaxX > MinX && MaxY > MinY)
    {
      inputItemInfos = self->_inputItemInfos;
      int64_t var1 = inputItemInfos[v8].var1;
      int64_t v28 = inputItemInfos[a4].var1;
      int64_t v29 = var1 - v28;
      if (var1 >= v28)
      {
        if (var1 > v28)
        {
          int64_t v32 = v28;
          do
          {
            objc_msgSend(v7, "addIndex:", self->_inputItemInfos[v32++].var0, MinY, v24, *(void *)&MinX);
            --v29;
          }
          while (v29);
        }
      }
      else
      {
        int64_t v30 = v28 - var1;
        int64_t v31 = var1;
        do
        {
          objc_msgSend(v7, "addIndex:", self->_inputItemInfos[v31++].var0, MinY, v24, *(void *)&MinX);
          --v30;
        }
        while (v30);
      }
    }
  }
  return v7;
}

- (id)presentedItemsInRect:(CGRect)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (self->_isPrepared) {
    PXDistanceBetweenPoints();
  }
  return v4;
}

- ($340E233F617FB3D5D9EFCE5A6F22D754)presentedItemLocationForItemAtIndex:(SEL)a3
{
  *retstr = *($340E233F617FB3D5D9EFCE5A6F22D754 *)PXLayoutItemLocationNull;
  if (LOBYTE(self[3].var2))
  {
    id v7 = self;
    if (a4 < 0)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a3, v7, @"PXExploreLayoutGenerator.m", 927, @"Invalid parameter not satisfying: %@", @"index >= 0" object file lineNumber description];
    }
    if (v7[1].var2 <= a4)
    {
      CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a3, v7, @"PXExploreLayoutGenerator.m", 928, @"Invalid parameter not satisfying: %@", @"index < _capacity" object file lineNumber description];
    }
    int64_t v8 = (_OWORD *)(v7[2].var2 + 32 * a4);
    long long v9 = v8[1];
    *(_OWORD *)&retstr->var0 = *v8;
    *(_OWORD *)&retstr->var2 = v9;
  }
  return self;
}

- (CGRect)presentedRectForItemAtIndex:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && self->_isPrepared)
  {
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
    -[PXExploreLayoutGenerator getGeometries:inRange:withKind:](self, "getGeometries:inRange:withKind:", v7, a3, 1, 0);
    PXRectWithCenterAndSize();
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (int64_t)presentedNumberOfColumnsAtRow:(int64_t)a3
{
  if (!self->_isPrepared) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 < 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 907, @"Invalid parameter not satisfying: %@", @"row >= 0" object file lineNumber description];
  }
  if (self->_rowCount <= a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 908, @"Invalid parameter not satisfying: %@", @"row < _rowCount" object file lineNumber description];
  }
  return self->_outputNumberOfColumnsAtRow[a3];
}

- (int64_t)presentedNumberOfRows
{
  if (self->_isPrepared) {
    return self->_row;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)itemIndexForItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  if (a4 - 7 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:882 description:@"Only next/previous directions are supported"];
  }
  if (self->_isPrepared)
  {
    int64_t v7 = self->_outputItemIndexToParseLocation[a3];
    if (a4 == 6 && v7 > 0)
    {
      uint64_t v8 = -1;
      return self->_inputItemInfos[v7 + v8].var0;
    }
    if (a4 == 5 && v7 < self->_capacity - 1)
    {
      uint64_t v8 = 1;
      return self->_inputItemInfos[v7 + v8].var0;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)itemIndexForPresentedItemIndex:(int64_t)a3
{
  if (!self->_isPrepared) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 < 0)
  {
    int64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 874, @"Invalid parameter not satisfying: %@", @"presentedItem >= 0" object file lineNumber description];
  }
  if (self->_capacity <= a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 875, @"Invalid parameter not satisfying: %@", @"presentedItem < _capacity" object file lineNumber description];
  }
  return self->_inputItemInfos[a3].var0;
}

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v10.receiver = self;
  v10.super_class = (Class)PXExploreLayoutGenerator;
  double v4 = [(PXExploreLayoutGenerator *)&v10 diagnosticDescription];
  double v5 = [(PXExploreLayoutGenerator *)self localState];
  double v6 = (void *)[v3 initWithFormat:@"<%@\n\tparsed=%li\n", v4, objc_msgSend(v5, "parseLocation")];

  if (self->_count >= 1)
  {
    uint64_t v7 = 0;
    int64_t v8 = 0;
    do
    {
      objc_msgSend(v6, "appendFormat:", @"\t%li w=%0.2f ar=%0.2f attr=0x%lx\n", self->_inputItemInfos[v7].var0, *(void *)&self->_inputItemInfos[v7].var3, *(void *)&self->_inputItemInfos[v7].var4, self->_inputItemInfos[v7].var2);
      ++v8;
      ++v7;
    }
    while (v8 < self->_count);
  }
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (_PXCornerSpriteIndexes)cornerSpriteIndexes
{
  [(PXExploreLayoutGenerator *)self _prepareIfNeeded];
  uint64_t v3 = *(void *)&self->_cornerSpriteIndexes.topLeft;
  uint64_t v4 = *(void *)&self->_cornerSpriteIndexes.bottomLeft;
  result.bottomLeft = v4;
  result.bottomRight = HIDWORD(v4);
  result.topLeft = v3;
  result.topRight = HIDWORD(v3);
  return result;
}

- (unint64_t)attributesForNextItemAtIndex:(int64_t)a3
{
  inputItemInfos = self->_inputItemInfos;
  double v5 = [(PXExploreLayoutGenerator *)self localState];
  unint64_t var2 = inputItemInfos[[v5 parseLocation] + a3].var2;

  return var2;
}

- (void)getLowestAspectRatio:(double *)a3 highestAspectRatio:(double *)a4 forNextItems:(int64_t)a5
{
  long long v9 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v10 = [v9 parseLocation];

  if (a5 < 1)
  {
    double v13 = 1.79769313e308;
    double v12 = -1.79769313e308;
    if (a3) {
LABEL_9:
    }
      *a3 = v13;
  }
  else
  {
    p_var4 = &self->_inputItemInfos[v10].var4;
    double v12 = -1.79769313e308;
    double v13 = 1.79769313e308;
    do
    {
      double v14 = *p_var4;
      p_var4 += 5;
      double v15 = v14;
      if (v13 >= v14) {
        double v13 = v15;
      }
      if (v12 < v15) {
        double v12 = v15;
      }
      --a5;
    }
    while (a5);
    if (a3) {
      goto LABEL_9;
    }
  }
  if (a4) {
    *a4 = v12;
  }
}

- (double)score:(int64_t)a3 forNextItemAtIndex:(int64_t)a4
{
  int64_t v8 = [(PXExploreLayoutGenerator *)self localState];
  int64_t v9 = [v8 parseLocation] + a4;

  if (v9 >= self->_count)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 802, @"score index out of bounds %li, count: %li", v9, self->_count object file lineNumber description];
  }
  uint64_t v10 = &self->_inputItemInfos[v9];
  long long v11 = *(_OWORD *)&v10->var2;
  long long v30 = *(_OWORD *)&v10->var0;
  long long v31 = v11;
  double var4 = v10->var4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXExploreLayoutGenerator_score_forNextItemAtIndex___block_invoke;
  aBlock[3] = &__block_descriptor_72_e5_d8__0l;
  double v29 = var4;
  long long v27 = v30;
  long long v28 = v11;
  double v12 = (double (**)(void))_Block_copy(aBlock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __53__PXExploreLayoutGenerator_score_forNextItemAtIndex___block_invoke_2;
  v22[3] = &__block_descriptor_72_e5_d8__0l;
  long long v23 = v30;
  long long v24 = v31;
  double v25 = var4;
  double v13 = _Block_copy(v22);
  double v14 = v13;
  switch(a3)
  {
    case 0:
      double v15 = v12[2](v12);
      goto LABEL_6;
    case 1:
      double v15 = (*((double (**)(void *))v13 + 2))(v13);
LABEL_6:
      double v16 = v15;
      break;
    case 2:
      double v16 = -(*((double (**)(void *))v13 + 2))(v13);
      break;
    case 3:
      double v17 = (*((double (**)(void *))v13 + 2))(v13);
      double v16 = v17 + v12[2](v12);
      break;
    case 4:
      double v18 = (*((double (**)(void *))v13 + 2))(v13);
      double v16 = v12[2](v12) - v18;
      break;
    default:
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:826 description:@"Code which should be unreachable has been reached"];

      abort();
  }

  return v16;
}

double __53__PXExploreLayoutGenerator_score_forNextItemAtIndex___block_invoke(uint64_t a1)
{
  return tanh(*(long double *)(a1 + 56));
}

double __53__PXExploreLayoutGenerator_score_forNextItemAtIndex___block_invoke_2(uint64_t a1)
{
  return round(*(double *)(a1 + 64) * 4.0) * 10.0;
}

- (BOOL)isAcceptableLargeHeroNextItemAtIndex:(int64_t)a3
{
  double v5 = [(PXExploreLayoutGenerator *)self metrics];
  double v6 = [v5 acceptableLargeHeroPredicate];

  if (v6)
  {
    inputItemInfos = self->_inputItemInfos;
    int64_t v8 = [(PXExploreLayoutGenerator *)self localState];
    int64_t var0 = inputItemInfos[[v8 parseLocation] + a3].var0;

    uint64_t v10 = [(PXExploreLayoutGenerator *)self itemLayoutInfoBlock];
    long long v11 = v10[2](v10, var0);

    char v12 = ((uint64_t (**)(void, void *))v6)[2](v6, v11);
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (BOOL)prepareNextItems:(int64_t)a3 withLargeHeroIndex:(int64_t)a4
{
  uint64_t v4 = self;
  LOBYTE(self) = 0;
  if (a3 >= 1 && a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](v4, "indexWithinNextItems:having:keyIndex:");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      LOBYTE(self) = 0;
    }
    else
    {
      uint64_t v7 = v6;
      LODWORD(self) = [(PXExploreLayoutGenerator *)v4 isAcceptableLargeHeroNextItemAtIndex:v6];
      if (self)
      {
        if ([(PXExploreLayoutGenerator *)v4 canReorderItemsAcrossRows]) {
          [(PXExploreLayoutGenerator *)v4 moveNextItemAtIndex:v7 toIndex:a4];
        }
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (int64_t)indexWithinNextItems:(int64_t)a3 having:(int64_t)a4 keyIndex:(int64_t)a5
{
  if (a3 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v8 = 0;
  int64_t v9 = -a5;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  double v11 = -1.79769313e308;
  int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    [(PXExploreLayoutGenerator *)self score:a4 forNextItemAtIndex:v8];
    uint64_t v14 = v9 + v8;
    if (v9 + v8 < 0) {
      uint64_t v14 = -v14;
    }
    if (v13 > v11 || (v13 == v11 ? (BOOL v15 = v14 < v10) : (BOOL v15 = 0), v15))
    {
      int64_t v12 = v8;
      uint64_t v10 = v14;
      double v11 = v13;
    }
    ++v8;
  }
  while (a3 != v8);
  return v12;
}

- (void)reorderNextItems:(int64_t)a3 usingMapping:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = a4;
  uint64_t v6 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v7 = [v6 parseLocation];

  if (a3 >= 1)
  {
    uint64_t v8 = v7;
    memcpy((char *)v15 - ((40 * a3 + 15) & 0xFFFFFFFFFFFFFFF0), &self->_inputItemInfos[v7], 40 * a3);
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = (*(uint64_t (**)(void, uint64_t))(v15[0] + 16))(v15[0], v9);
      double v11 = &self->_inputItemInfos[v8];
      int64_t v12 = (double *)((char *)&v15[5 * v10] - ((40 * a3 + 15) & 0xFFFFFFFFFFFFFFF0));
      v11->double var4 = v12[4];
      long long v13 = *((_OWORD *)v12 + 1);
      *(_OWORD *)&v11->int64_t var0 = *(_OWORD *)v12;
      *(_OWORD *)&v11->unint64_t var2 = v13;
      ++v9;
      ++v8;
    }
    while (a3 != v9);
  }
  uint64_t v14 = (void *)v15[0];
}

- (void)moveNextItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  if (a3 != a4)
  {
    uint64_t v8 = [(PXExploreLayoutGenerator *)self localState];
    uint64_t v9 = [v8 parseLocation];

    uint64_t v10 = v9 + a3;
    int64_t v11 = v9 + a4;
    int64_t count = self->_count;
    if (v9 + a3 >= count)
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 730, @"out of bounds info fromIndex: %li, count: %li", v9 + a3, self->_count object file lineNumber description];

      int64_t count = self->_count;
    }
    if (v11 >= count)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 731, @"out of bounds info toIndex: %li, count: %li", v9 + a4, self->_count object file lineNumber description];
    }
    long long v13 = &self->_inputItemInfos[v10];
    long long v23 = *(_OWORD *)&v13->var0;
    long long v24 = *(_OWORD *)&v13->var2;
    double var4 = v13->var4;
    if (a4 <= a3)
    {
      if (a3 > a4)
      {
        uint64_t v17 = v9;
        do
        {
          double v18 = &self->_inputItemInfos[a3 + v17];
          --v10;
          long long v19 = *(_OWORD *)&v18[-1].var2;
          *(_OWORD *)&v18->int64_t var0 = *(_OWORD *)&v18[-1].var0;
          *(_OWORD *)&v18->unint64_t var2 = v19;
          v18->double var4 = v18[-1].var4;
          --v17;
        }
        while (v10 > v11);
      }
    }
    else
    {
      uint64_t v14 = v9;
      do
      {
        BOOL v15 = &self->_inputItemInfos[a3 + v14];
        ++v10;
        long long v16 = *(_OWORD *)&v15[1].var2;
        *(_OWORD *)&v15->int64_t var0 = *(_OWORD *)&v15[1].var0;
        *(_OWORD *)&v15->unint64_t var2 = v16;
        v15->double var4 = v15[1].var4;
        ++v14;
      }
      while (v10 < v11);
    }
    double v20 = &self->_inputItemInfos[v11];
    *(_OWORD *)&v20->int64_t var0 = v23;
    *(_OWORD *)&v20->unint64_t var2 = v24;
    v20->double var4 = var4;
  }
}

- (void)sortNextItems:(int64_t)a3 withItemAtIndex:(int64_t)a4 having:(int64_t)a5
{
  if (a3 <= 0)
  {
    int64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 716, @"Invalid parameter not satisfying: %@", @"count > 0" object file lineNumber description];
  }
  int64_t v9 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:a3 having:a5 keyIndex:a4];
  if (v9 != a4 && v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v9 toIndex:a4];
  }
}

- (int64_t)numberOf:(unint64_t)a3 withinNextItems:(int64_t)a4
{
  uint64_t v7 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v8 = [v7 parseLocation];

  int64_t v9 = self->_count - v8;
  if (v9 >= a4) {
    int64_t v9 = a4;
  }
  if (v9 < 1) {
    return 0;
  }
  int64_t result = 0;
  p_unint64_t var2 = &self->_inputItemInfos[v8].var2;
  do
  {
    unint64_t v12 = *p_var2;
    p_var2 += 5;
    if ((a3 & ~v12) == 0) {
      ++result;
    }
    --v9;
  }
  while (v9);
  return result;
}

- (BOOL)nextItems:(int64_t)a3 isAny:(unint64_t)a4
{
  uint64_t v7 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v8 = [v7 parseLocation];

  int64_t v9 = self->_count - v8;
  if (v9 >= a3) {
    int64_t v9 = a3;
  }
  if (v9 < 1) {
    return 0;
  }
  inputItemInfos = self->_inputItemInfos;
  if ((a4 & ~inputItemInfos[v8].var2) == 0) {
    return 1;
  }
  int64_t v12 = 0;
  p_unint64_t var2 = &inputItemInfos[v8 + 1].var2;
  while (v9 - 1 != v12)
  {
    unint64_t v14 = *p_var2;
    p_var2 += 5;
    ++v12;
    if ((a4 & ~v14) == 0) {
      return v12 < v9;
    }
  }
  int64_t v12 = v9;
  return v12 < v9;
}

- (BOOL)nextItems:(int64_t)a3 areAll:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  int64_t v5 = a3;
  uint64_t v7 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v8 = [v7 parseLocation];

  if (v8 + v5 > self->_count) {
    return 0;
  }
  if (v5 < 1) {
    return 1;
  }
  p_unint64_t var2 = &self->_inputItemInfos[v8].var2;
  while (1)
  {
    unint64_t v11 = *p_var2;
    p_var2 += 5;
    BOOL result = (v11 & a4) == a4;
    if ((v11 & a4) != a4) {
      break;
    }
    if (!--v5) {
      return 1;
    }
  }
  return result;
}

- (BOOL)nextInputItems:(unint64_t)a3
{
  int64_t v5 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v21 = [v5 parseLocation];
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PXExploreLayoutGenerator_nextInputItems___block_invoke;
  aBlock[3] = &unk_1E5DBA890;
  void aBlock[4] = self;
  aBlock[5] = &v18;
  aBlock[6] = &v14;
  uint64_t v6 = (uint64_t (**)(void))_Block_copy(aBlock);
  uint64_t v7 = v6;
  if (a3 && ((unsigned int (*)(uint64_t (**)(void), unint64_t))v6[2])(v6, a3))
  {
    int64_t v12 = &v22;
    do
      uint64_t v8 = v12++;
    while (*v8 && (v7[2](v7) & 1) != 0);
  }
  uint64_t v9 = v19[3];
  BOOL v10 = v9 > objc_msgSend(v5, "parseLocation", v12) && *((unsigned char *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

uint64_t __43__PXExploreLayoutGenerator_nextInputItems___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(v2 + 40);
  if ((a2 & 0x10000) == 0)
  {
    if (v4 >= v5 || (a2 & ~*(void *)(*(void *)(v2 + 56) + 40 * v4 + 16)) != 0) {
      goto LABEL_4;
    }
LABEL_6:
    *(void *)(v3 + 24) = v4 + 1;
    return 1;
  }
  if (v4 >= v5) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v6 = 0;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  return v6;
}

- (void)setBuildingBlockColumnSpan:(int64_t)a3 rowSpan:(int64_t)a4 withNumberOfColumns:(int64_t)a5
{
  [(PXExploreLayoutGenerator *)self _cellSizeForNumberOfColumns:a5];
  CGFloat v10 = -(self->_intercellSpacing.height - (double)a4 * (v9 + self->_intercellSpacing.height));
  self->_buildingBlockSize.CGFloat width = -(self->_intercellSpacing.width - (double)a3 * (v8 + self->_intercellSpacing.width));
  self->_buildingBlockSize.CGFloat height = v10;
}

- (int64_t)preferredRowTypeAfterRowWithType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      return 1;
    case 1:
      uint64_t v4 = [(PXExploreLayoutGenerator *)self localState];
      uint64_t v5 = [v4 effectiveLargeHeroDensity];
      if (v5 == 1)
      {
        if ([v4 numberOfConsecutiveMediumHeroRows] >= 3) {
          goto LABEL_12;
        }
      }
      else
      {
        if (v5 != 3)
        {
          if (v5 != 2 || [v4 numberOfConsecutiveMediumHeroRows] <= 1) {
            goto LABEL_7;
          }
LABEL_12:
          int64_t v3 = 3;
          goto LABEL_13;
        }
        if ([v4 numberOfConsecutiveMediumHeroRows] > 0) {
          goto LABEL_12;
        }
      }
LABEL_7:
      int64_t v3 = 2;
LABEL_13:

      return v3;
    default:
      return 0;
  }
}

- (void)endFullWidthRowWithType:(int64_t)a3 aspectRatio:(double)a4
{
  if (self->_localNumberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
    [v6 handleFailureInMethod:a2 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:556 description:@"current row doesn't exists"];
  }
  self->_rowCount = self->_localNumberOfRows + self->_row;
  _PXGArrayCapacityResizeToCount();
}

- (void)addFullWidthItemWithType:(int64_t)a3 atRow:(int64_t)a4 aspectRatio:(double)a5
{
  uint64_t v7 = [(PXExploreLayoutGenerator *)self localState];
  if (self->_localNumberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:497 description:@"current row doesn't exists"];
  }
  uint64_t v8 = [v7 parseLocation];
  if (v8 >= self->_count)
  {
    CGFloat v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXExploreLayoutGenerator.m", 507, @"out of bounds %li", self->_count);
  }
  self->_inputItemInfos[v8].int64_t var1 = v8;
  PXRectGetCenter();
}

- (void)endRowWithType:(int64_t)a3
{
  if (self->_localNumberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v5 handleFailureInMethod:a2 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:458 description:@"current row doesn't exists"];
  }
  self->_rowCount = self->_localNumberOfRows + self->_row;
  _PXGArrayCapacityResizeToCount();
}

- (void)addLocalItemWithType:(int64_t)a3 atColumn:(int64_t)a4 row:(int64_t)a5 columnSpan:(int64_t)a6 rowSpan:(int64_t)a7
{
  double v9 = [(PXExploreLayoutGenerator *)self localState];
  if (self->_localNumberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:399 description:@"current row doesn't exists"];
  }
  uint64_t v10 = [v9 parseLocation];
  if (v10 >= self->_count)
  {
    int64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXExploreLayoutGenerator.m", 410, @"out of bounds %li", self->_count);
  }
  self->_inputItemInfos[v10].int64_t var1 = v10;
  PXRectGetCenter();
}

- (CGSize)_cellSizeForNumberOfColumns:(int64_t)a3
{
  uint64_t v5 = [(PXExploreLayoutGenerator *)self metrics];
  [v5 referenceSize];
  double v7 = v6;

  double v8 = (double)a3;
  double v9 = (v7 + self->_intercellSpacing.width) / (double)a3 - self->_intercellSpacing.width;
  uint64_t v10 = [(PXExploreLayoutGenerator *)self localState];
  [v10 buildingBlockAspectRatio];
  double v12 = (v7 / v11 + self->_intercellSpacing.height) / v8 - self->_intercellSpacing.height;

  double v13 = v9;
  double v14 = v12;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (void)beginRowWithNumberOfColumns:(int64_t)a3
{
  if (self->_localNumberOfColumns != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:381 description:@"current row already exists"];
  }
  self->_localNumberOfColumns = a3;
  self->_localNumberOfRows = 0;
  [(PXExploreLayoutGenerator *)self _cellSizeForNumberOfColumns:a3];
  self->_cellSize.CGFloat width = v5;
  self->_cellSize.CGFloat height = v6;
}

- (BOOL)canReorderItemsAcrossRows
{
  uint64_t v2 = [(PXExploreLayoutGenerator *)self metrics];
  uint64_t v3 = [v2 reorderingTolerance];

  return v3 == 0;
}

- (int64_t)numberOfRemainingItems
{
  int64_t count = self->_count;
  uint64_t v3 = [(PXExploreLayoutGenerator *)self localState];
  int64_t v4 = count - [v3 parseLocation];

  return v4;
}

- (void)_prepareIfNeeded
{
  void (**v10)(uint8_t *__return_ptr, void *, int64_t);
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v14;
  long long v15;
  long long v16;
  uint64_t v17;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *inputItemInfos;
  long long v19;
  long long v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v24;
  long long v25;
  long long v26;
  int64_t v27;
  uint64_t v28;
  double *v29;
  long long v30;
  long long v31;
  void *v32;
  double v33;
  CGFloat v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGSize v39;
  void *v40;
  void *v41;
  SEL v42;
  uint64_t v43;
  id v44;
  void aBlock[4];
  id v46;
  uint64_t v47;
  uint8_t buf[16];
  long long v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E4F143B8];
  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    int64_t v4 = [(PXExploreLayoutGenerator *)self itemCount];
    self->_int64_t count = v4;
    if (v4)
    {
      v42 = a2;
      capacitCGFloat y = self->_capacity;
      if (v4 > capacity)
      {
        if (capacity)
        {
          do
          {
            capacity *= 2;
            self->_capacitCGFloat y = capacity;
          }
          while (capacity < self->_count);
        }
        else
        {
          self->_capacitCGFloat y = v4;
        }
        _PXGArrayResize();
      }
      CGFloat v6 = [(PXExploreLayoutGenerator *)self metrics];
      [v6 buildingBlockAspectRatio];
      uint64_t v8 = v7;
      double v9 = [(PXExploreLayoutGenerator *)self itemLayoutInfoBlock];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__PXExploreLayoutGenerator__prepareIfNeeded__block_invoke;
      aBlock[3] = &unk_1E5DBA868;
      v44 = v9;
      v46 = v44;
      v47 = v8;
      uint64_t v10 = (void (**)(uint8_t *__return_ptr, void *, int64_t))_Block_copy(aBlock);
      double v11 = [(PXExploreLayoutGenerator *)self keyItemIndex];
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (self->_count >= 1)
        {
          double v12 = 0;
          double v13 = 0;
          do
          {
            double v14 = &self->_inputItemInfos[v12];
            v10[2](buf, v10, v13);
            BOOL v15 = *(_OWORD *)buf;
            uint64_t v16 = v49;
            v14->double var4 = v50;
            *(_OWORD *)&v14->int64_t var0 = v15;
            *(_OWORD *)&v14->unint64_t var2 = v16;
            ++v13;
            ++v12;
          }
          while (v13 < self->_count);
        }
      }
      else
      {
        char v17 = v11;
        inputItemInfos = self->_inputItemInfos;
        v10[2](buf, v10, v11);
        long long v19 = *(_OWORD *)buf;
        uint64_t v20 = v49;
        inputItemInfos->double var4 = v50;
        *(_OWORD *)&inputItemInfos->int64_t var0 = v19;
        *(_OWORD *)&inputItemInfos->unint64_t var2 = v20;
        if (v17 >= 1)
        {
          uint64_t v21 = 0;
          uint64_t v22 = 1;
          do
          {
            long long v23 = v21 + 1;
            long long v24 = &self->_inputItemInfos[v22];
            ((void (*)(uint8_t *__return_ptr, void (**)(uint8_t *__return_ptr, void *, int64_t)))v10[2])(buf, v10);
            double v25 = *(_OWORD *)buf;
            v26 = v49;
            v24->double var4 = v50;
            *(_OWORD *)&v24->int64_t var0 = v25;
            *(_OWORD *)&v24->unint64_t var2 = v26;
            ++v22;
            uint64_t v21 = v23;
          }
          while (v17 != v23);
        }
        long long v27 = v17 + 1;
        if (v17 + 1 < self->_count)
        {
          long long v28 = 40 * v17 + 40;
          do
          {
            double v29 = (double *)((char *)&self->_inputItemInfos->var0 + v28);
            v10[2](buf, v10, v27);
            long long v30 = *(_OWORD *)buf;
            long long v31 = v49;
            v29[4] = v50;
            *(_OWORD *)double v29 = v30;
            *((_OWORD *)v29 + 1) = v31;
            ++v27;
            v28 += 40;
          }
          while (v27 < self->_count);
        }
      }
      int64_t v32 = [(PXExploreLayoutGenerator *)self metrics];
      [v32 padding];
      v34 = v33;
      v35 = [(PXExploreLayoutGenerator *)self metrics];
      [v35 padding];
      self->_origin.CGFloat x = v34;
      self->_origin.CGFloat y = v36;

      self->_row = 0;
      self->_localNumberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
      [v6 interitemSpacing];
      self->_intercellSpacing.CGFloat width = v37;
      self->_intercellSpacing.CGFloat height = v37;
      [v6 referenceSize];
      self->_contentSize.CGFloat width = v38;
      self->_contentSize.CGFloat height = 0.0;
      *(void *)&self->_cornerSpriteIndexes.topLeft = -1;
      *(void *)&self->_cornerSpriteIndexes.bottomLeft = -1;
      CGRect v39 = *(CGSize *)off_1E5DAB030;
      self->_headerItemSize = *(CGSize *)off_1E5DAB030;
      self->_minHeroItemsSize = v39;
      self->_minimumItemSize = v39;
      self->_buildingBlockSize = v39;
      CGRect v40 = [(PXExploreLayoutGenerator *)self localState];
      [v40 prepareWithMetrics:v6];

      switch([v6 layoutType])
      {
        case 0:
          v41 = [MEMORY[0x1E4F28B00] currentHandler];
          [v41 handleFailureInMethod:v43 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:357 description:@"Code which should be unreachable has been reached"];

          abort();
        case 1:
          [(PXExploreLayoutGenerator *)self parsePhonePortraitLayout];
          break;
        case 2:
          [(PXExploreLayoutGenerator *)self parsePhoneLandscapeLayout];
          break;
        case 3:
          [(PXExploreLayoutGenerator *)self parsePadPortraitLayout];
          break;
        case 4:
          [(PXExploreLayoutGenerator *)self parsePadLandscapeLayout];
          break;
        case 5:
          [(PXExploreLayoutGenerator *)self parseMacLayout];
          break;
        default:
          break;
      }
      if ([(PXExploreLayoutGenerator *)self numberOfRemainingItems]) {
        PXAssertGetLog();
      }
    }
  }
}

void __44__PXExploreLayoutGenerator__prepareIfNeeded__block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v7 = v6;
  double v8 = *(double *)(a1 + 40);
  if (v8 == 0.0)
  {
    [v6 size];
    PXSizeGetAspectRatio();
  }
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PXExploreLayoutGenerator__prepareIfNeeded__block_invoke_2;
  aBlock[3] = &unk_1E5DBA840;
  void aBlock[4] = &v12;
  double v9 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v9[2](v9, 1, 1);
  v9[2](v9, 2, v8 >= 2.0);
  v9[2](v9, 4, v8 < 0.99009901);
  v9[2](v9, 8, v8 > 1.01);
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = v13[3];
  [v7 weight];
  *(void *)(a3 + 24) = v10;
  *(double *)(a3 + 32) = v8;

  _Block_object_dispose(&v12, 8);
}

uint64_t __44__PXExploreLayoutGenerator__prepareIfNeeded__block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = a2 << 16;
  if (a3) {
    uint64_t v3 = a2;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= v3;
  return result;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v11 = [(PXExploreLayoutGenerator *)self itemCount];
  if (location >= v11 && length != 0 || location + length > v11)
  {
    unint64_t v23 = v11;
    long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v26.NSUInteger location = location;
    v26.NSUInteger length = length;
    double v25 = NSStringFromRange(v26);
    [v24 handleFailureInMethod:a2, self, @"PXExploreLayoutGenerator.m", 237, @"range %@ out of bounds (0..<%li)", v25, v23 object file lineNumber description];
  }
  [(PXExploreLayoutGenerator *)self _prepareIfNeeded];
  if (length)
  {
    NSUInteger v14 = location;
    do
    {
      uint64_t v15 = &self->_outputGeometries[v14];
      long long v17 = *(_OWORD *)&v15->var6.origin.y;
      long long v16 = *(_OWORD *)&v15->var6.size.height;
      CGFloat height = v15->var7.height;
      *(_OWORD *)&a3->var5 = *(_OWORD *)&v15->var5;
      long long v19 = *(_OWORD *)&v15->var1.y;
      *(_OWORD *)&a3->int64_t var0 = *(_OWORD *)&v15->var0;
      *(_OWORD *)&a3->var1.CGFloat y = v19;
      long long v20 = *(_OWORD *)&v15->var2.height;
      long long v21 = *(_OWORD *)&v15->var3.b;
      long long v22 = *(_OWORD *)&v15->var3.ty;
      *(_OWORD *)&a3->var3.d = *(_OWORD *)&v15->var3.d;
      *(_OWORD *)&a3->var3.tCGFloat y = v22;
      *(_OWORD *)&a3->var2.CGFloat height = v20;
      *(_OWORD *)&a3->var3.b = v21;
      a3->var7.CGFloat height = height;
      *(_OWORD *)&a3->var6.origin.CGFloat y = v17;
      *(_OWORD *)&a3->var6.size.CGFloat height = v16;
      a3->var5 = a5;
      ++a3;
      ++v14;
      --length;
    }
    while (length);
  }
}

- (CGSize)buildingBlockSize
{
  [(PXExploreLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_buildingBlockSize.width;
  double height = self->_buildingBlockSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)minimumItemSize
{
  [(PXExploreLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_minimumItemSize.width;
  double height = self->_minimumItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)minHeroItemsSize
{
  [(PXExploreLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_minHeroItemsSize.width;
  double height = self->_minHeroItemsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)headerItemSize
{
  [(PXExploreLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_headerItemSize.width;
  double height = self->_headerItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)size
{
  [(PXExploreLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedSize
{
  int64_t v4 = [(PXExploreLayoutGenerator *)self metrics];
  uint64_t v5 = [v4 layoutType];

  switch(v5)
  {
    case 0:
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PXExploreLayoutGenerator.m" lineNumber:201 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      [(PXExploreLayoutGenerator *)self estimatedSizeForPhonePortrait];
      break;
    case 2:
      [(PXExploreLayoutGenerator *)self estimatedSizeForPhoneLandscape];
      break;
    case 3:
      [(PXExploreLayoutGenerator *)self estimatedSizeForPadPortrait];
      break;
    case 4:
    case 5:
      [(PXExploreLayoutGenerator *)self estimatedSizeForPadLandscape];
      break;
    default:
      double v6 = *MEMORY[0x1E4F1DB30];
      double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PXExploreLayoutGenerator;
  [(PXExploreLayoutGenerator *)&v3 invalidate];
  self->_isPrepared = 0;
}

- (void)dealloc
{
  free(self->_inputItemInfos);
  free(self->_outputGeometries);
  free(self->_outputItemIndexToParseLocation);
  free(self->_outputItemLocations);
  free(self->_outputNumberOfColumnsAtRow);
  v3.receiver = self;
  v3.super_class = (Class)PXExploreLayoutGenerator;
  [(PXExploreLayoutGenerator *)&v3 dealloc];
}

- (PXExploreLayoutGenerator)initWithMetrics:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXExploreLayoutGenerator;
  objc_super v3 = [(PXExploreLayoutGenerator *)&v7 initWithMetrics:a3];
  if (v3)
  {
    int64_t v4 = objc_alloc_init(PXExploreParsingState);
    localState = v3->_localState;
    v3->_localState = v4;
  }
  return v3;
}

- (BOOL)canUseSingleSevenColumnHeroRowForNumberOfRemainingItems:(int64_t)a3
{
  return ((unint64_t)a3 < 0x18) & (0x8CF800u >> a3);
}

- (void)_parseSevenColumnShortRowWithNumberOfItems:(int64_t)a3
{
  uint64_t v5 = [(PXExploreLayoutGenerator *)self numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:[(PXExploreLayoutGenerator *)self numberOfRemainingItems] - a3];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    objc_super v7 = [(PXExploreLayoutGenerator *)self localState];
    if ([v7 didMoveBestItemOutOfNextShortRow])
    {
    }
    else
    {
      BOOL v8 = [(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows];

      if (v8)
      {
        int64_t v9 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:v6 + a3 having:0 keyIndex:v6 + a3 - 1];
        if (v9 < a3) {
          [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v9 toIndex:a3];
        }
      }
    }
  }
  [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:7];
  if (a3 == 7)
  {
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:1 rowSpan:1];
    uint64_t v10 = self;
    uint64_t v11 = 1;
    uint64_t v12 = 1;
  }
  else
  {
    if (a3 != 6) {
      PXAssertGetLog();
    }
    uint64_t v10 = self;
    uint64_t v11 = 0;
    uint64_t v12 = 2;
  }
  [(PXExploreLayoutGenerator *)v10 addLocalItemWithType:0 atColumn:v11 row:0 columnSpan:v12 rowSpan:1];
  [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:1 rowSpan:1];
  [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:0 columnSpan:1 rowSpan:1];
  [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
  [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:0 columnSpan:1 rowSpan:1];
  [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:6 row:0 columnSpan:1 rowSpan:1];
  [(PXExploreLayoutGenerator *)self endRowWithType:1];
}

- (void)_parseSevenColumnHeroRowWithNumberOfItems:(int64_t)a3 heroItemType:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6
{
  int64_t v6 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [(PXExploreLayoutGenerator *)self localState];
  if (!v6) {
    int64_t v6 = [(PXExploreLayoutGenerator *)self numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:[(PXExploreLayoutGenerator *)self numberOfRemainingItems] - a3];
  }
  if (v6 >= 1)
  {
    if ([(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows])
    {
      int64_t v11 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:v6 + a3 having:0 keyIndex:0];
      if (v11 >= a3)
      {
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v11 toIndex:a3 - 1];
        [v10 setDidMoveBestItemOutOfNextShortRow:1];
      }
    }
  }
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:7];
      unint64_t v12 = 0;
      do
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v12 % 7);
        ++v12;
      }
      while (a3 != v12);
      goto LABEL_37;
    case 9:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:7];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:3 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:6 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:1 columnSpan:1 rowSpan:1];
      uint64_t v15 = self;
      int64_t v16 = 0;
      uint64_t v17 = 6;
      uint64_t v18 = 1;
      goto LABEL_35;
    case 11:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:7];
      if (v6)
      {
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:3 rowSpan:2];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:0 columnSpan:1 rowSpan:1];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:0 columnSpan:1 rowSpan:1];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:6 row:0 columnSpan:1 rowSpan:1];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:1 columnSpan:1 rowSpan:1];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:2 columnSpan:1 rowSpan:1];
LABEL_30:
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:1 row:2 columnSpan:1 rowSpan:1];
LABEL_31:
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:2 columnSpan:1 rowSpan:1];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:2 columnSpan:1 rowSpan:1];
        uint64_t v15 = self;
        int64_t v16 = a4;
        uint64_t v17 = 4;
        uint64_t v18 = 1;
        uint64_t v19 = 3;
LABEL_32:
        uint64_t v21 = 2;
LABEL_36:
        [(PXExploreLayoutGenerator *)v15 addLocalItemWithType:v16 atColumn:v17 row:v18 columnSpan:v19 rowSpan:v21];
      }
      else
      {
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:2 rowSpan:2];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __121__PXExploreLayoutGenerator_Rows___parseSevenColumnHeroRowWithNumberOfItems_heroItemType_subsequentShortRowItems_options___block_invoke;
        aBlock[3] = &unk_1E5DCF720;
        void aBlock[4] = self;
        long long v22 = (void (**)(void *, void))_Block_copy(aBlock);
        v22[2](v22, 0);
        v22[2](v22, 1);
      }
LABEL_37:
      [(PXExploreLayoutGenerator *)self endRowWithType:2];
      [v10 setLastHeroRowTag:0];

      return;
    case 12:
    case 13:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:7];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:6 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:1 columnSpan:1 rowSpan:1];
      if (a3 == 12) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 1;
      }
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:2 columnSpan:v13 rowSpan:1];
      if (a3 != 13) {
        goto LABEL_31;
      }
      goto LABEL_30;
    case 14:
    case 15:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:7];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:6 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:1 columnSpan:1 rowSpan:1];
      if (a3 == 14) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:2 columnSpan:v14 rowSpan:1];
      if (a3 == 15) {
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:1 row:2 columnSpan:1 rowSpan:1];
      }
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:2 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:2 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:2 columnSpan:1 rowSpan:1];
      uint64_t v15 = self;
      int64_t v16 = a4;
      uint64_t v17 = 5;
      uint64_t v18 = 1;
      uint64_t v19 = 2;
      goto LABEL_32;
    case 18:
    case 19:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:7];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:6 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:5 row:1 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:2 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:1 row:2 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:3 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:1 row:3 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:2 row:2 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:2 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:3 columnSpan:1 rowSpan:1];
      if (a3 == 18) {
        uint64_t v20 = 2;
      }
      else {
        uint64_t v20 = 1;
      }
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:3 columnSpan:v20 rowSpan:1];
      if (a3 != 19) {
        goto LABEL_37;
      }
      uint64_t v15 = self;
      int64_t v16 = 0;
      uint64_t v17 = 6;
      uint64_t v18 = 3;
LABEL_35:
      uint64_t v19 = 1;
      uint64_t v21 = 1;
      goto LABEL_36;
    case 23:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:7];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:6 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:1 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:5 row:1 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:2 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:1 row:2 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:2 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:3 row:2 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:3 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:6 row:3 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:3 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:3 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:4 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:3 row:4 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:4 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:4 columnSpan:1 rowSpan:1];
      uint64_t v15 = self;
      int64_t v16 = 0;
      uint64_t v17 = 6;
      uint64_t v18 = 4;
      goto LABEL_35;
    default:
      PXAssertGetLog();
  }
}

uint64_t __121__PXExploreLayoutGenerator_Rows___parseSevenColumnHeroRowWithNumberOfItems_heroItemType_subsequentShortRowItems_options___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:2 row:a2 columnSpan:1 rowSpan:1];
  [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:3 row:a2 columnSpan:1 rowSpan:1];
  [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:4 row:a2 columnSpan:1 rowSpan:1];
  [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:5 row:a2 columnSpan:1 rowSpan:1];
  int64_t v4 = *(void **)(a1 + 32);
  return [v4 addLocalItemWithType:0 atColumn:6 row:a2 columnSpan:1 rowSpan:1];
}

- (BOOL)parseSevenColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6
{
  int64_t v11 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v12 = [v11 parseLocation];
  if ((unint64_t)(a3 - 2) < 2)
  {
    uint64_t v14 = self;
    int64_t v15 = a4;
    uint64_t v16 = 1;
    int64_t v17 = a5;
    unint64_t v13 = a6;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    [(PXExploreLayoutGenerator *)self _parseSevenColumnShortRowWithNumberOfItems:a4];
    goto LABEL_8;
  }
  if (!a3)
  {
    unint64_t v13 = a6 | 1;
    uint64_t v14 = self;
    int64_t v15 = a4;
    uint64_t v16 = 2;
    int64_t v17 = a5;
LABEL_6:
    [(PXExploreLayoutGenerator *)v14 _parseSevenColumnHeroRowWithNumberOfItems:v15 heroItemType:v16 subsequentShortRowItems:v17 options:v13];
  }
LABEL_8:
  BOOL v18 = [v11 parseLocation] > v12;

  return v18;
}

- (BOOL)parseSevenColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 options:(unint64_t)a5
{
  return [(PXExploreLayoutGenerator *)self parseSevenColumnRowWithType:a3 numberOfItems:a4 subsequentShortRowItems:0 options:a5];
}

- (int64_t)numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:(int64_t)a3
{
  if ((unint64_t)a3 > 0x26) {
    return 23;
  }
  else {
    return qword_1AB35CE00[a3];
  }
}

- (int64_t)numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:(int64_t)a3
{
  if ((unint64_t)a3 > 0x19) {
    return 7;
  }
  int64_t result = a3;
  if (((1 << a3) & 0x3224000) != 0) {
    return 6;
  }
  if (a3 && a3 != 6) {
    return 7;
  }
  return result;
}

- (void)_parseSixColumnShortRowWithNumberOfItems:(int64_t)a3
{
  uint64_t v5 = [(PXExploreLayoutGenerator *)self numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:[(PXExploreLayoutGenerator *)self numberOfRemainingItems] - a3 rowOptions:0];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    objc_super v7 = [(PXExploreLayoutGenerator *)self localState];
    if ([v7 didMoveBestItemOutOfNextShortRow])
    {
    }
    else
    {
      BOOL v8 = [(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows];

      if (v8)
      {
        int64_t v9 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:v6 + a3 having:0 keyIndex:v6 + a3 - 1];
        if (v9 < a3) {
          [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v9 toIndex:a3];
        }
      }
    }
  }
  [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:6];
  if (a3 == 6)
  {
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:1 rowSpan:1];
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:1 row:0 columnSpan:1 rowSpan:1];
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:1 rowSpan:1];
    unint64_t v13 = self;
    uint64_t v14 = 3;
    uint64_t v15 = 1;
LABEL_13:
    [(PXExploreLayoutGenerator *)v13 addLocalItemWithType:0 atColumn:v14 row:0 columnSpan:v15 rowSpan:1];
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
    uint64_t v10 = self;
    uint64_t v11 = 5;
    uint64_t v12 = 1;
    goto LABEL_14;
  }
  if (a3 == 4)
  {
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:1];
    unint64_t v13 = self;
    uint64_t v14 = 2;
    uint64_t v15 = 2;
    goto LABEL_13;
  }
  if (a3 != 3) {
    PXAssertGetLog();
  }
  [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:1];
  [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:2 rowSpan:1];
  uint64_t v10 = self;
  uint64_t v11 = 4;
  uint64_t v12 = 2;
LABEL_14:
  [(PXExploreLayoutGenerator *)v10 addLocalItemWithType:0 atColumn:v11 row:0 columnSpan:v12 rowSpan:1];
  [(PXExploreLayoutGenerator *)self endRowWithType:1];
}

- (void)_addThreeItemsToSixColumnRowWithHeroItemType:(int64_t)a3 options:(unint64_t)a4 rowType:(int64_t *)a5
{
  uint64_t v10 = 0;
  v68[3] = *MEMORY[0x1E4F143B8];
  double v11 = -1.79769313e308;
  double v12 = 1.79769313e308;
  do
  {
    [(PXExploreLayoutGenerator *)self score:0 forNextItemAtIndex:v10];
    double v14 = v13;
    unint64_t v15 = [(PXExploreLayoutGenerator *)self attributesForNextItemAtIndex:v10];
    uint64_t v16 = (v15 >> 3) & 1;
    if ((v15 & 4) != 0) {
      uint64_t v16 = 2;
    }
    if (v14 < v12) {
      double v12 = v14;
    }
    if (v14 >= v11) {
      double v11 = v14;
    }
    *(double *)&v68[v10] = v14;
    v67[v10++] = v16;
  }
  while (v10 != 3);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke;
  aBlock[3] = &unk_1E5DCF170;
  void aBlock[4] = self;
  void aBlock[5] = a2;
  int64_t v17 = _Block_copy(aBlock);
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3810000000;
  v63 = &unk_1AB5D584F;
  uint64_t v65 = 0;
  long long v64 = xmmword_1AB35CDE8;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0x8000000000000001;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_2;
  v49[3] = &unk_1E5DCF1C0;
  id v18 = v17;
  v54 = v68;
  double v55 = v12;
  double v56 = v11;
  char v58 = a4 & 1;
  unint64_t v57 = a4;
  id v50 = v18;
  v51 = v59;
  v52 = &v60;
  v53 = v67;
  uint64_t v19 = _Block_copy(v49);
  uint64_t v20 = [(PXExploreLayoutGenerator *)self localState];
  char v21 = [v20 canIgnoreNextHeroSide];
  if (a3 == 2) {
    char v22 = 0;
  }
  else {
    char v22 = v21;
  }
  unint64_t v23 = [(PXExploreLayoutGenerator *)self metrics];
  BOOL v24 = [v23 layoutSubtype] != 1;

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v43 = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_4;
  v44 = &unk_1E5DCF1E8;
  id v25 = v20;
  id v45 = v25;
  char v47 = v22;
  BOOL v48 = v24;
  id v26 = v19;
  id v46 = v26;
  long long v27 = v42;
  __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_4((uint64_t)v27, 0);
  v43((uint64_t)v27, 1);

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_5;
  v39[3] = &unk_1E5DCF210;
  id v28 = v18;
  id v40 = v28;
  v41 = &v60;
  [(PXExploreLayoutGenerator *)self reorderNextItems:3 usingMapping:v39];
  double v29 = v61;
  switch(v61[5])
  {
    case 0:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:6];
      double v29 = v61;
      uint64_t v30 = v61[4];
      if (v30 == 1)
      {
        uint64_t v37 = 2;
        uint64_t v38 = 1;
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:1];
        goto LABEL_26;
      }
      if (!v30)
      {
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a3 atColumn:0 row:0 columnSpan:4 rowSpan:3];
        uint64_t v31 = 2;
        uint64_t v32 = 1;
        uint64_t v33 = 4;
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:2 rowSpan:1];
        a3 = 0;
        uint64_t v34 = 2;
        goto LABEL_27;
      }
      break;
    case 1:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:12];
      double v29 = v61;
      uint64_t v35 = v61[4];
      if (v35 == 1)
      {
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:4 rowSpan:3];
        uint64_t v33 = 4;
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:3 columnSpan:4 rowSpan:3];
        uint64_t v32 = 0;
        uint64_t v34 = 6;
        uint64_t v31 = 8;
        goto LABEL_27;
      }
      if (!v35)
      {
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a3 atColumn:0 row:0 columnSpan:8 rowSpan:6];
        uint64_t v31 = 4;
        uint64_t v32 = 3;
        uint64_t v33 = 8;
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:8 row:0 columnSpan:4 rowSpan:3];
        a3 = 0;
        uint64_t v34 = 3;
        goto LABEL_27;
      }
      break;
    case 2:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:6];
      double v29 = v61;
      uint64_t v36 = v61[4];
      if (v36 == 1)
      {
        uint64_t v38 = 2;
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:2];
        uint64_t v37 = 1;
LABEL_26:
        uint64_t v33 = 2;
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:v38 columnSpan:2 rowSpan:v37];
        uint64_t v32 = 0;
        uint64_t v34 = 3;
        uint64_t v31 = 4;
        goto LABEL_27;
      }
      if (!v36)
      {
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a3 atColumn:0 row:0 columnSpan:4 rowSpan:3];
        uint64_t v32 = 2;
        uint64_t v33 = 4;
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:2 rowSpan:2];
        a3 = 0;
        uint64_t v34 = 1;
        uint64_t v31 = 2;
        goto LABEL_27;
      }
      break;
    case 3:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:6];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:3];
      uint64_t v34 = 3;
      uint64_t v31 = 2;
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:2 rowSpan:3];
      a3 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 4;
LABEL_27:
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a3 atColumn:v33 row:v32 columnSpan:v31 rowSpan:v34];
      double v29 = v61;
      break;
    default:
      break;
  }
  [v25 setNextHeroSide:v29[4]];
  if (a5) {
    *a5 = v61[5];
  }

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(&v60, 8);
}

uint64_t __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return qword_1AB35CD58[3 * a3 + a2];
}

void __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v46 = 0;
  v47[0] = &v46;
  v47[1] = 0x2020000000;
  v47[2] = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  CGRect v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v36 = 0;
  v37[0] = &v36;
  v37[1] = 0x2020000000;
  v37[2] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_3;
  aBlock[3] = &unk_1E5DCF198;
  id v27 = *(id *)(a1 + 32);
  id v28 = &v42;
  long long v8 = *(_OWORD *)(a1 + 72);
  long long v33 = *(_OWORD *)(a1 + 56);
  long long v34 = v8;
  char v35 = *(unsigned char *)(a1 + 96);
  double v29 = &v38;
  uint64_t v30 = &v46;
  uint64_t v31 = &v36;
  uint64_t v32 = a4;
  int64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = (void (**)(void, void, void, void))v9;
  switch(a3)
  {
    case 0:
      double v11 = (void (*)(void *, void, uint64_t, uint64_t))*((void *)v9 + 2);
      if (a2)
      {
        v11(v9, 0, 1, 0);
        v10[2](v10, 1, 0, 1);
        goto LABEL_8;
      }
      v11(v9, 0, 0, 2);
      uint64_t v18 = 1;
      v10[2](v10, 1, 1, 0);
      uint64_t v19 = 0;
      goto LABEL_17;
    case 1:
      double v12 = (void (*)(void *, void, void, uint64_t))*((void *)v9 + 2);
      if (a2)
      {
        v12(v9, 0, 0, 1);
        v10[2](v10, 1, 0, 1);
        v10[2](v10, 2, 0, 2);
        uint64_t v13 = 0;
        uint64_t v14 = 1;
      }
      else
      {
        v12(v9, 0, 0, 2);
        v10[2](v10, 1, 0, 1);
        uint64_t v13 = 1;
        uint64_t v14 = 2;
        v10[2](v10, 2, 0, 1);
      }
      if (*(void *)(*(void *)(a1 + 56) + 8 * v13) != *(void *)(*(void *)(a1 + 56) + 8 * v14)) {
        goto LABEL_18;
      }
      uint64_t v16 = v37;
      uint64_t v17 = 2;
      break;
    case 2:
      unint64_t v15 = (void (*)(void *, void, void, uint64_t))*((void *)v9 + 2);
      if (a2)
      {
        v15(v9, 0, 0, 1);
        v10[2](v10, 1, 1, 0);
LABEL_8:
        v10[2](v10, 2, 0, 2);
      }
      else
      {
        v15(v9, 0, 0, 2);
        uint64_t v19 = 1;
        v10[2](v10, 1, 0, 1);
        uint64_t v18 = 0;
LABEL_17:
        v10[2](v10, 2, v19, v18);
        a2 = 0;
      }
      goto LABEL_18;
    case 3:
      (*((void (**)(void *, void, uint64_t, uint64_t))v9 + 2))(v9, 0, 2, 1);
      v10[2](v10, 1, 2, 1);
      v10[2](v10, 2, 2, 1);
      a2 = PXFlippedExploreHeroSide(a2);
      if (!*(unsigned char *)(a1 + 96)) {
        goto LABEL_18;
      }
      uint64_t v16 = v47;
      uint64_t v17 = 1;
      break;
    default:
      goto LABEL_18;
  }
  *(void *)(*v16 + 24) += v17;
LABEL_18:
  unint64_t v20 = *(void *)(a1 + 88);
  uint64_t v21 = (v20 >> 1) & 1;
  if (a3 == 2) {
    LODWORD(v21) = 0;
  }
  uint64_t v22 = (v20 >> 2) & 1;
  if (!a3) {
    LODWORD(v22) = 0;
  }
  int64_t v23 = (a4 == 0) | (10
                   * (((v22 | v21 | (unint64_t)(10
                                                                                 * (*(void *)(v37[0] + 24)
                                                                                  + 10
                                                                                  * (v39[3]
                                                                                   + 10
                                                                                   * (10
                                                                                    * (3 - *(void *)(v47[0] + 24))
                                                                                    - v43[3])))))
                     + 3000) ^ 1));
  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v23 > *(void *)(v24 + 24))
  {
    *(void *)(v24 + 24) = v23;
    id v25 = *(void **)(*(void *)(a1 + 48) + 8);
    v25[4] = a2;
    v25[5] = a3;
    v25[6] = a4;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

uint64_t __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) nextHeroSide];
  if (result == a2 || *(unsigned char *)(a1 + 48))
  {
    for (uint64_t i = 0; i != 6; ++i)
    {
      if (!i || *(unsigned char *)(a1 + 49))
      {
        for (uint64_t j = 0; j != 4; ++j)
        {
          if (j == 3)
          {
            uint64_t result = [*(id *)(a1 + 32) lastHeroRowTag];
            if (result == 3) {
              break;
            }
          }
          uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
    }
  }
  return result;
}

uint64_t __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
}

uint64_t __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a3 == 1)
  {
    if (*(void *)(*(void *)(a1 + 80) + 8 * result) == 1) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3 == 2 && *(void *)(*(void *)(a1 + 80) + 8 * result) != 2) {
LABEL_6:
  }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
LABEL_7:
  if (a4 != 2)
  {
    if (a4 != 1 || *(double *)(*(void *)(a1 + 88) + 8 * result) <= *(double *)(a1 + 96)) {
      goto LABEL_20;
    }
    uint64_t v9 = a1 + 48;
    goto LABEL_19;
  }
  double v10 = *(double *)(*(void *)(a1 + 88) + 8 * result);
  if (v10 > *(double *)(a1 + 96))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void *)(v11 + 24);
    if (v10 == *(double *)(a1 + 104)) {
      uint64_t v13 = v12 + 3;
    }
    else {
      uint64_t v13 = v12 + 1;
    }
    *(void *)(v11 + 24) = v13;
  }
  if (*(unsigned char *)(a1 + 112) && result != a2)
  {
    uint64_t v9 = a1 + 56;
LABEL_19:
    ++*(void *)(*(void *)(*(void *)v9 + 8) + 24);
  }
LABEL_20:
  if (*(void *)(*(void *)(a1 + 80) + 8 * result) == a3) {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  return result;
}

- (void)_parseSixColumnHeroRowWithNumberOfItems:(int64_t)a3 heroItemType:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v28 = 0;
  uint64_t v12 = [v11 nextHeroSide];
  if (!a5) {
    a5 = [(PXExploreLayoutGenerator *)self numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:[(PXExploreLayoutGenerator *)self numberOfRemainingItems] - a3];
  }
  if (a5 >= 1)
  {
    if ([(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows])
    {
      int64_t v13 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:a5 + a3 having:0 keyIndex:0];
      if (v13 >= a3)
      {
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v13 toIndex:a3 - 1];
        [v11 setDidMoveBestItemOutOfNextShortRow:1];
      }
    }
  }
  switch(a3)
  {
    case 1:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:6];
      uint64_t v14 = self;
      int64_t v15 = a4;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 6;
      goto LABEL_45;
    case 2:
      if (a4 == 2)
      {
        [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:2];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:2 atColumn:0 row:0 columnSpan:1 rowSpan:1];
        uint64_t v14 = self;
        int64_t v15 = 1;
        uint64_t v16 = 1;
        uint64_t v17 = 0;
        goto LABEL_19;
      }
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:6];
      if (v12 == 1)
      {
        if ((a6 & 1) == 0) {
          [(PXExploreLayoutGenerator *)self sortNextItems:2 withItemAtIndex:1 having:0];
        }
        uint64_t v22 = self;
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        uint64_t v25 = 2;
        uint64_t v26 = 3;
        goto LABEL_44;
      }
      if (v12) {
        goto LABEL_47;
      }
      if ((a6 & 1) == 0) {
        [(PXExploreLayoutGenerator *)self sortNextItems:2 withItemAtIndex:0 having:0];
      }
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:4 rowSpan:3];
      uint64_t v14 = self;
      int64_t v15 = 0;
      uint64_t v16 = 4;
      uint64_t v17 = 0;
      uint64_t v18 = 2;
      goto LABEL_45;
    case 3:
      [(PXExploreLayoutGenerator *)self _addThreeItemsToSixColumnRowWithHeroItemType:a4 options:a6 rowType:&v28];
      goto LABEL_47;
    case 4:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:6];
      if ((a6 & 4) == 0)
      {
        if (v12 != 1)
        {
          if (v12) {
            goto LABEL_47;
          }
          if ((a6 & 1) == 0) {
            [(PXExploreLayoutGenerator *)self sortNextItems:4 withItemAtIndex:0 having:0];
          }
          [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:4 rowSpan:3];
          [(PXExploreLayoutGenerator *)self sortNextItems:3 withItemAtIndex:0 having:0];
          [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:2 rowSpan:2];
          [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:2 columnSpan:1 rowSpan:1];
          uint64_t v14 = self;
          int64_t v15 = 0;
          uint64_t v16 = 5;
          uint64_t v17 = 2;
LABEL_19:
          uint64_t v18 = 1;
          uint64_t v19 = 1;
          goto LABEL_46;
        }
        if ((a6 & 1) == 0) {
          [(PXExploreLayoutGenerator *)self sortNextItems:4 withItemAtIndex:3 having:0];
        }
        [(PXExploreLayoutGenerator *)self sortNextItems:3 withItemAtIndex:0 having:0];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:2];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:2 columnSpan:1 rowSpan:1];
        uint64_t v22 = self;
        uint64_t v23 = 1;
        uint64_t v24 = 2;
        uint64_t v25 = 1;
        uint64_t v26 = 1;
LABEL_44:
        [(PXExploreLayoutGenerator *)v22 addLocalItemWithType:0 atColumn:v23 row:v24 columnSpan:v25 rowSpan:v26];
        uint64_t v14 = self;
        int64_t v15 = a4;
        uint64_t v16 = 2;
        uint64_t v17 = 0;
        uint64_t v18 = 4;
LABEL_45:
        uint64_t v19 = 3;
        goto LABEL_46;
      }
      if (v12 == 1)
      {
        if ((a6 & 1) == 0) {
          [(PXExploreLayoutGenerator *)self sortNextItems:4 withItemAtIndex:3 having:0];
        }
        [(PXExploreLayoutGenerator *)self sortNextItems:3 withItemAtIndex:2 having:0];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:1 rowSpan:1];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:1 row:0 columnSpan:1 rowSpan:1];
        uint64_t v22 = self;
        uint64_t v23 = 0;
        uint64_t v24 = 1;
        uint64_t v25 = 2;
        uint64_t v26 = 2;
        goto LABEL_44;
      }
      if (v12) {
        goto LABEL_47;
      }
      if ((a6 & 1) == 0) {
        [(PXExploreLayoutGenerator *)self sortNextItems:4 withItemAtIndex:0 having:0];
      }
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:4 rowSpan:3];
      [(PXExploreLayoutGenerator *)self sortNextItems:3 withItemAtIndex:2 having:0];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:5 row:0 columnSpan:1 rowSpan:1];
      uint64_t v14 = self;
      int64_t v15 = 0;
      uint64_t v16 = 4;
      uint64_t v17 = 1;
      uint64_t v18 = 2;
      uint64_t v19 = 2;
LABEL_46:
      [(PXExploreLayoutGenerator *)v14 addLocalItemWithType:v15 atColumn:v16 row:v17 columnSpan:v18 rowSpan:v19];
LABEL_47:
      [(PXExploreLayoutGenerator *)self endRowWithType:2];
      [v11 setLastHeroRowTag:v28];

      return;
    case 5:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:12];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __119__PXExploreLayoutGenerator_Rows___parseSixColumnHeroRowWithNumberOfItems_heroItemType_subsequentShortRowItems_options___block_invoke;
      v27[3] = &unk_1E5DCF720;
      v27[4] = self;
      unint64_t v20 = _Block_copy(v27);
      uint64_t v21 = (void (**)(void, void))v20;
      if (v12 == 1)
      {
        (*((void (**)(void *, void))v20 + 2))(v20, 0);
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:4 row:0 columnSpan:8 rowSpan:6];
      }
      else if (!v12)
      {
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:8 rowSpan:6];
        v21[2](v21, 8);
      }

      goto LABEL_47;
    default:
      PXAssertGetLog();
  }
}

uint64_t __119__PXExploreLayoutGenerator_Rows___parseSixColumnHeroRowWithNumberOfItems_heroItemType_subsequentShortRowItems_options___block_invoke(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) nextItems:4 isAny:8] & 1) == 0
    && [*(id *)(a1 + 32) numberOf:4 withinNextItems:4] >= 1)
  {
    [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:a2 row:0 columnSpan:2 rowSpan:3];
    [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:a2 + 2 row:0 columnSpan:2 rowSpan:3];
    [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:a2 row:3 columnSpan:2 rowSpan:3];
    int64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = a2 + 2;
    uint64_t v6 = 3;
    uint64_t v7 = 3;
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 32) numberOf:8 withinNextItems:4] == 1
    && [*(id *)(a1 + 32) numberOf:4 withinNextItems:4] >= 2)
  {
    [*(id *)(a1 + 32) sortNextItems:4 withItemAtIndex:0 having:1];
    long long v8 = *(void **)(a1 + 32);
    if (a2)
    {
      [v8 addLocalItemWithType:0 atColumn:a2 row:0 columnSpan:4 rowSpan:2];
      [*(id *)(a1 + 32) sortNextItems:3 withItemAtIndex:2 having:2];
      [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:a2 row:2 columnSpan:2 rowSpan:2];
      [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:a2 row:4 columnSpan:2 rowSpan:2];
      int64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = a2 + 2;
      uint64_t v6 = 2;
      uint64_t v7 = 4;
      goto LABEL_10;
    }
    [v8 addLocalItemWithType:0 atColumn:0 row:0 columnSpan:4 rowSpan:2];
    [*(id *)(a1 + 32) sortNextItems:3 withItemAtIndex:0 having:2];
    [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:0 row:2 columnSpan:2 rowSpan:4];
    [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:2 row:2 columnSpan:2 rowSpan:2];
    int64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = 2;
  }
  else
  {
    [*(id *)(a1 + 32) sortNextItems:4 withItemAtIndex:0 having:1];
    [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:a2 row:0 columnSpan:4 rowSpan:2];
    [*(id *)(a1 + 32) sortNextItems:3 withItemAtIndex:1 having:2];
    [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:a2 row:2 columnSpan:4 rowSpan:2];
    [*(id *)(a1 + 32) addLocalItemWithType:0 atColumn:a2 row:4 columnSpan:2 rowSpan:2];
    int64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = a2 + 2;
  }
  uint64_t v6 = 4;
  uint64_t v7 = 2;
LABEL_10:
  return [v4 addLocalItemWithType:0 atColumn:v5 row:v6 columnSpan:2 rowSpan:v7];
}

- (BOOL)parseSixColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6
{
  uint64_t v11 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v12 = [v11 parseLocation];
  if ((unint64_t)(a3 - 2) < 2)
  {
    uint64_t v14 = self;
    int64_t v15 = a4;
    uint64_t v16 = 1;
    int64_t v17 = a5;
    unint64_t v13 = a6;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    [(PXExploreLayoutGenerator *)self _parseSixColumnShortRowWithNumberOfItems:a4];
    goto LABEL_8;
  }
  if (!a3)
  {
    unint64_t v13 = a6 | 1;
    uint64_t v14 = self;
    int64_t v15 = a4;
    uint64_t v16 = 2;
    int64_t v17 = a5;
LABEL_6:
    [(PXExploreLayoutGenerator *)v14 _parseSixColumnHeroRowWithNumberOfItems:v15 heroItemType:v16 subsequentShortRowItems:v17 options:v13];
  }
LABEL_8:
  BOOL v18 = [v11 parseLocation] > v12;

  return v18;
}

- (BOOL)parseSixColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 options:(unint64_t)a5
{
  return [(PXExploreLayoutGenerator *)self parseSixColumnRowWithType:a3 numberOfItems:a4 subsequentShortRowItems:0 options:a5];
}

- (int64_t)numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:(int64_t)a3 rowOptions:(unint64_t *)a4
{
  unint64_t v4 = a3;
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
    case 5:
      unint64_t v4 = 0;
LABEL_9:
      if (a4) {
        goto LABEL_10;
      }
      return a3;
    case 2:
      PXAssertGetLog();
    case 4:
    case 7:
    case 8:
    case 11:
    case 14:
    case 17:
      unint64_t v4 = 2;
      a3 = 4;
      if (!a4) {
        return a3;
      }
      goto LABEL_10;
    case 10:
    case 23:
    case 26:
    case 28:
      a3 = 4;
      unint64_t v4 = 4;
      if (!a4) {
        return a3;
      }
      goto LABEL_10;
    default:
      unint64_t v4 = 0;
      a3 = 3;
      if (!a4) {
        return a3;
      }
LABEL_10:
      *a4 = v4;
      return a3;
  }
}

- (int64_t)numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int64_t v3 = a3;
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
    case 2:
      PXAssertGetLog();
    case 3:
    case 7:
      int64_t v3 = 3;
      break;
    case 4:
      int64_t v3 = 4;
      break;
    case 5:
      PXAssertGetLog();
    case 8:
    case 11:
      PXAssertGetLog();
    case 14:
      PXAssertGetLog();
    case 16:
    case 20:
    case 23:
    case 25:
      PXAssertGetLog();
    default:
      int64_t v3 = 6;
      break;
  }
  return v3;
}

- (BOOL)_isShortRowNextFollowedByLargeHero
{
  int64_t v3 = [(PXExploreLayoutGenerator *)self localState];
  BOOL v4 = [v3 nextRowType] == 1
    && -[PXExploreLayoutGenerator preferredRowTypeAfterRowWithType:](self, "preferredRowTypeAfterRowWithType:", [v3 nextRowType]) == 3;

  return v4;
}

- (BOOL)parseFourColumnGroupWithShortRowFollowedByLargeHero
{
  if (![(PXExploreLayoutGenerator *)self _isShortRowNextFollowedByLargeHero]) {
    return 0;
  }
  uint64_t v3 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  uint64_t v4 = v3 <= 8 ? 0 : 9;
  unint64_t v5 = v3 + ~v4;
  if (v5 < 9 && ((0x113u >> v5) & 1) != 0) {
    return 0;
  }
  if (!-[PXExploreLayoutGenerator prepareNextItems:withLargeHeroIndex:](self, "prepareNextItems:withLargeHeroIndex:")) {
    return 0;
  }
  BOOL v6 = 1;
  [(PXExploreLayoutGenerator *)self parseFourColumnRowWithType:1 numberOfItems:4];
  [(PXExploreLayoutGenerator *)self parseFourColumnRowWithType:3 numberOfItems:1];
  return v6;
}

- (BOOL)parseThreeColumnGroupWithShortRowFollowedByLargeHero
{
  if (![(PXExploreLayoutGenerator *)self _isShortRowNextFollowedByLargeHero]) {
    return 0;
  }
  uint64_t v3 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  uint64_t v4 = 7;
  if (v3 <= 6) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = 3;
  if (v3 <= 6) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v3 == 8)
  {
    uint64_t v4 = 6;
    uint64_t v5 = 3;
  }
  uint64_t v6 = v3 == 6 ? 6 : v4;
  uint64_t v7 = v3 == 6 ? 3 : v5;
  if ([(PXExploreLayoutGenerator *)self nextItems:v6 isAny:2]
    || ![(PXExploreLayoutGenerator *)self prepareNextItems:v6 withLargeHeroIndex:v7])
  {
    return 0;
  }
  BOOL v8 = 1;
  [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:1 numberOfItems:3];
  [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:3 numberOfItems:1];
  return v8;
}

- (BOOL)parseThreeColumnGroupWithFiveItems
{
  uint64_t v3 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  if (v3 < 5) {
    return v3 > 4;
  }
  id v4 = 0;
  uint64_t v5 = 4;
  double v6 = 1.79769313e308;
  double v7 = -1.79769313e308;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    [(PXExploreLayoutGenerator *)self score:0 forNextItemAtIndex:v5];
    double v11 = v10;
    char v12 = [(PXExploreLayoutGenerator *)self attributesForNextItemAtIndex:v5];
    if ((v12 & 8) != 0) {
      uint64_t v13 = v5;
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((v12 & 8) != 0) {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v14 = v5;
    }
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v13 = v8;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = v9;
    }
    if (v11 != v7)
    {
      uint64_t v14 = v9;
      uint64_t v13 = v8;
    }
    if ((v12 & 8) != 0) {
      uint64_t v15 = v5;
    }
    else {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((v12 & 8) != 0) {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v16 = v5;
    }
    if (v11 > v7) {
      uint64_t v9 = v16;
    }
    else {
      uint64_t v9 = v14;
    }
    if (v11 > v7) {
      uint64_t v8 = v15;
    }
    else {
      uint64_t v8 = v13;
    }
    if (v11 > v7) {
      double v7 = v11;
    }
    if (v6 >= v11) {
      double v6 = v11;
    }
    if ((v12 & 4) != 0)
    {
      if (!v4) {
        id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      }
      [v4 addIndex:v5];
    }
    --v5;
  }
  while (v5 != -1);
  int64_t v17 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v18 = [v17 parseLocation];
  if (v6 == v7 || ![(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows]) {
    goto LABEL_50;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 <= 2) {
      [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v8 toIndex:3];
    }
LABEL_50:
    [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:1 numberOfItems:3];
    [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:2 numberOfItems:2];
    goto LABEL_51;
  }
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = (void *)[v4 mutableCopy];
    [v19 removeIndex:v9];
    if ([v19 count])
    {
      uint64_t v20 = [v19 lastIndex];
      if (v9 <= v20) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = v9;
      }
      if (v9 >= v20) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = v9;
      }
      [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v21 toIndex:4];
      [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v22 toIndex:3];
      [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:1 numberOfItems:3];
      uint64_t v23 = self;
      uint64_t v24 = 2;
    }
    else
    {
      [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v9 toIndex:2];
      uint64_t v26 = 0;
      uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if (v26 != 2)
        {
          char v29 = [(PXExploreLayoutGenerator *)self attributesForNextItemAtIndex:v26];
          uint64_t v30 = v28 == 0x7FFFFFFFFFFFFFFFLL ? v26 : v28;
          if ((v29 & 8) != 0)
          {
            uint64_t v28 = v30;
            uint64_t v27 = v26;
          }
        }
        ++v26;
      }
      while (v26 != 5);
      if (v28 == 0x7FFFFFFFFFFFFFFFLL || v27 == v28)
      {
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:2 toIndex:v9];
        goto LABEL_74;
      }
      if (v28 > 2) {
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v28 toIndex:1];
      }
      if (v27 < 2) {
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v27 toIndex:3];
      }
      [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:1 numberOfItems:2];
      [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:3 numberOfItems:1];
      uint64_t v23 = self;
      uint64_t v24 = 1;
    }
    [(PXExploreLayoutGenerator *)v23 parseThreeColumnRowWithType:v24 numberOfItems:2];
LABEL_74:
  }
LABEL_51:
  if ([v17 parseLocation] == v18)
  {
    if ([(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows] && v9 <= 2) {
      [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v9 toIndex:3];
    }
    [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:1 numberOfItems:3];
    [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:2 numberOfItems:2];
  }

  return v3 > 4;
}

- (BOOL)parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:(BOOL)a3
{
  uint64_t v5 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  if (v5 >= 4)
  {
    BOOL v6 = [(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows];
    if (v5 != 4 || a3)
    {
      if (v6)
      {
        if ((unint64_t)v5 < 7
          || (uint64_t v10 = 7, [(PXExploreLayoutGenerator *)self nextItems:7 isAny:2]))
        {
          uint64_t v10 = 4;
        }
        [(PXExploreLayoutGenerator *)self sortNextItems:v10 withItemAtIndex:3 having:0];
      }
      [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:1 numberOfItems:3];
      double v7 = self;
      uint64_t v8 = 3;
      uint64_t v9 = 1;
    }
    else
    {
      if (v6) {
        [(PXExploreLayoutGenerator *)self sortNextItems:4 withItemAtIndex:0 having:0];
      }
      [(PXExploreLayoutGenerator *)self parseThreeColumnRowWithType:3 numberOfItems:1];
      double v7 = self;
      uint64_t v8 = 1;
      uint64_t v9 = 3;
    }
    [(PXExploreLayoutGenerator *)v7 parseThreeColumnRowWithType:v8 numberOfItems:v9];
  }
  return v5 > 3;
}

- (void)_parseFourColumnHeroRowWithType:(int64_t)a3 heroItemType:(int64_t)a4 numberOfItems:(int64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v10 = [v9 nextHeroSide];

  uint64_t v11 = 3;
  uint64_t v12 = 16;
  if (v10)
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  if (v10 == 1) {
    int64_t v13 = a5 - 1;
  }
  else {
    int64_t v13 = 0;
  }
  if (v10 == 1) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v12;
  }
  if (v10 == 1) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v11;
  }
  BOOL v16 = v10 == 1;
  switch(a5)
  {
    case 1:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:4];
      int64_t v17 = self;
      int64_t v18 = a4;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 4;
      uint64_t v22 = 3;
      goto LABEL_42;
    case 2:
      if (a3)
      {
        uint64_t v24 = [(PXExploreLayoutGenerator *)self localState];
        uint64_t v25 = [v24 numberOfColumnsOverride];

        if (v25 == 3)
        {
          [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:24];
          [(PXExploreLayoutGenerator *)self sortNextItems:2 withItemAtIndex:v13 having:0];
          [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v13 toIndex:0];
          [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:8 * v16 row:0 columnSpan:16 rowSpan:12];
          int64_t v17 = self;
          int64_t v18 = 0;
          uint64_t v19 = v14;
          uint64_t v20 = 0;
          uint64_t v21 = 8;
          uint64_t v22 = 12;
        }
        else
        {
          [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:8];
          [(PXExploreLayoutGenerator *)self sortNextItems:2 withItemAtIndex:v13 having:0];
          [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v13 toIndex:0];
          [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:2 * v16 row:0 columnSpan:6 rowSpan:4];
          uint64_t v19 = 2 * v15;
          int64_t v17 = self;
          int64_t v18 = 0;
          uint64_t v20 = 0;
          uint64_t v21 = 2;
          uint64_t v22 = 4;
        }
LABEL_42:
        [(PXExploreLayoutGenerator *)v17 addLocalItemWithType:v18 atColumn:v19 row:v20 columnSpan:v21 rowSpan:v22];
        uint64_t v32 = self;
        int64_t v33 = a3;
      }
      else
      {
        [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:4];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:0 row:0 columnSpan:4 rowSpan:3];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:1 atColumn:0 row:3 columnSpan:4 rowSpan:3];
        uint64_t v32 = self;
        int64_t v33 = 0;
      }
      [(PXExploreLayoutGenerator *)v32 endRowWithType:v33];
      return;
    case 3:
      uint64_t v26 = [(PXExploreLayoutGenerator *)self localState];
      uint64_t v27 = [v26 numberOfColumnsOverride];

      if (v27 == 3)
      {
        [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:24];
        if (a3)
        {
          [(PXExploreLayoutGenerator *)self sortNextItems:3 withItemAtIndex:v13 having:0];
          uint64_t v28 = 6;
        }
        else
        {
          uint64_t v28 = 9;
        }
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v13 toIndex:0];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:8 * v16 row:0 columnSpan:16 rowSpan:2 * v28];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:v14 row:0 columnSpan:8 rowSpan:v28];
        int64_t v17 = self;
        int64_t v18 = 0;
        uint64_t v19 = v14;
        uint64_t v20 = v28;
        uint64_t v21 = 8;
        uint64_t v22 = v28;
      }
      else
      {
        [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:8];
        if (a3)
        {
          [(PXExploreLayoutGenerator *)self sortNextItems:3 withItemAtIndex:v13 having:0];
          uint64_t v31 = 2;
        }
        else
        {
          uint64_t v31 = 3;
        }
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v13 toIndex:0];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:2 * v16 row:0 columnSpan:6 rowSpan:2 * v31];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 * v15 row:0 columnSpan:2 rowSpan:v31];
        int64_t v17 = self;
        int64_t v18 = 0;
        uint64_t v19 = 2 * v15;
        uint64_t v20 = v31;
        uint64_t v21 = 2;
        uint64_t v22 = v31;
      }
      goto LABEL_42;
    case 4:
      char v29 = [(PXExploreLayoutGenerator *)self localState];
      uint64_t v30 = [v29 numberOfColumnsOverride];

      if (v30 == 3)
      {
        [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:24];
        if (a3) {
          [(PXExploreLayoutGenerator *)self sortNextItems:4 withItemAtIndex:v13 having:0];
        }
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v13 toIndex:0];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:8 * v16 row:0 columnSpan:16 rowSpan:18];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:v14 row:0 columnSpan:8 rowSpan:6];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:v14 row:6 columnSpan:8 rowSpan:6];
        int64_t v17 = self;
        int64_t v18 = 0;
        uint64_t v19 = v14;
        uint64_t v20 = 12;
        uint64_t v21 = 8;
        uint64_t v22 = 6;
      }
      else
      {
        [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:4];
        if (a3) {
          [(PXExploreLayoutGenerator *)self sortNextItems:4 withItemAtIndex:v13 having:0];
        }
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v13 toIndex:0];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:a4 atColumn:v16 row:0 columnSpan:3 rowSpan:3];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:v15 row:0 columnSpan:1 rowSpan:1];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:v15 row:1 columnSpan:1 rowSpan:1];
        int64_t v17 = self;
        int64_t v18 = 0;
        uint64_t v19 = v15;
        uint64_t v20 = 2;
        uint64_t v21 = 1;
        uint64_t v22 = 1;
      }
      goto LABEL_42;
    case 5:
      PXAssertGetLog();
    case 6:
      [(PXExploreLayoutGenerator *)self _parseFourColumnHeroRowWithType:a3 heroItemType:a4 numberOfItems:3];
      [(PXExploreLayoutGenerator *)self _parseFourColumnHeroRowWithType:a3 heroItemType:a4 numberOfItems:3];
      return;
    default:
      uint64_t v23 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v34 = 134217984;
        int64_t v35 = a5;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "four-column layout shouldn't have to parse a hero row with %li items", (uint8_t *)&v34, 0xCu);
      }

      [(PXExploreLayoutGenerator *)self _parseFourColumnHeroRowWithType:a3 heroItemType:a4 numberOfItems:3];
      return;
  }
}

- (int64_t)numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:(int64_t)a3
{
  if (a3 < 1) {
    return 0;
  }
  switch(a3)
  {
    case 1:
      return a3;
    case 2:
      a3 = 2;
      break;
    case 4:
    case 8:
    case 12:
    case 16:
      a3 = 4;
      break;
    case 5:
    case 9:
      a3 = 5;
      break;
    case 10:
      uint64_t v3 = [(PXExploreLayoutGenerator *)self localState];
      uint64_t v4 = [v3 numberOfColumnsOverride];

      if (v4 == 3) {
        a3 = 4;
      }
      else {
        a3 = 3;
      }
      break;
    default:
      a3 = 3;
      break;
  }
  return a3;
}

- (void)_parseFourColumnShortRowWithNumberOfItems:(int64_t)a3
{
  uint64_t v5 = [(PXExploreLayoutGenerator *)self numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:[(PXExploreLayoutGenerator *)self numberOfRemainingItems] - a3];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    if ([(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows])
    {
      int64_t v7 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:v6 + a3 having:0 keyIndex:v6 + a3 - 1];
      if (v7 < a3)
      {
        [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v7 toIndex:a3];
        uint64_t v8 = [(PXExploreLayoutGenerator *)self localState];
        [v8 setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:1];
      }
    }
  }
  switch(a3)
  {
    case 3:
      uint64_t v10 = [(PXExploreLayoutGenerator *)self localState];
      uint64_t v11 = [v10 numberOfColumnsOverride];

      if (v11 == 3)
      {
        [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:12];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:4 rowSpan:3];
        [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:4 row:0 columnSpan:4 rowSpan:3];
        uint64_t v12 = self;
        uint64_t v13 = 8;
        uint64_t v14 = 4;
        uint64_t v15 = 3;
LABEL_18:
        [(PXExploreLayoutGenerator *)v12 addLocalItemWithType:0 atColumn:v13 row:0 columnSpan:v14 rowSpan:v15];
        [(PXExploreLayoutGenerator *)self endRowWithType:1];
        return;
      }
      [(PXExploreLayoutGenerator *)self parseFourColumnRowWithType:2 numberOfItems:3];
      break;
    case 2:
      BOOL v16 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int64_t v17 = 0;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "four-column layout shouldn't contain any short row with 2 items", v17, 2u);
      }

      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:4];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:2 rowSpan:2];
      [(PXExploreLayoutGenerator *)self endRowWithType:1];
      break;
    case 1:
      uint64_t v9 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "four-column layout shouldn't contain any short row with 1 item", buf, 2u);
      }

      [(PXExploreLayoutGenerator *)self parseFourColumnRowWithType:3 numberOfItems:1];
      return;
    default:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:4];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:1 row:0 columnSpan:1 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:1 rowSpan:1];
      uint64_t v12 = self;
      uint64_t v13 = 3;
      uint64_t v14 = 1;
      uint64_t v15 = 1;
      goto LABEL_18;
  }
}

- (BOOL)parseFourColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4
{
  int64_t v7 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v8 = [v7 parseLocation];
  if ((unint64_t)(a3 - 2) < 2)
  {
    int64_t v12 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
    if ((unint64_t)(v12 - a4 - 3) >= 2) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v12 - a4;
    }
    if (v12 - a4 >= 1 && v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows])
      {
        if (([v7 didMoveBestItemOutOfPreviousShortRowIntoHeroRow] & 1) == 0)
        {
          int64_t v14 = [(PXExploreLayoutGenerator *)self indexWithinNextItems:v13 + a4 having:0 keyIndex:0];
          if (v14 >= a4) {
            [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:v14 toIndex:a4 - 1];
          }
        }
      }
    }
    uint64_t v9 = self;
    int64_t v10 = a3;
    uint64_t v11 = 1;
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    [(PXExploreLayoutGenerator *)self _parseFourColumnShortRowWithNumberOfItems:a4];
    goto LABEL_17;
  }
  if (!a3)
  {
    uint64_t v9 = self;
    int64_t v10 = 0;
    uint64_t v11 = 2;
LABEL_15:
    [(PXExploreLayoutGenerator *)v9 _parseFourColumnHeroRowWithType:v10 heroItemType:v11 numberOfItems:a4];
  }
LABEL_17:
  BOOL v15 = [v7 parseLocation] > v8;

  return v15;
}

- (BOOL)parseThreeColumnMediumHeroRowWithPano
{
  uint64_t v3 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v4 = [v3 parseLocation];
  int64_t v5 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  switch(v5)
  {
    case 1:
      goto LABEL_22;
    case 2:
      int64_t v5 = 2;
      goto LABEL_22;
    case 3:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0)) {
        goto LABEL_10;
      }
      int64_t v5 = 2;
      if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 0))
      {
        BOOL v6 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 2, 0, v12);
        goto LABEL_6;
      }
      goto LABEL_22;
    case 4:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0x20000, 0))
      {
LABEL_10:
        int64_t v5 = 1;
        int64_t v7 = self;
        uint64_t v8 = 1;
        uint64_t v9 = 0;
LABEL_21:
        [(PXExploreLayoutGenerator *)v7 moveNextItemAtIndex:v8 toIndex:v9];
        goto LABEL_22;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 0x20000, 0))
      {
        int64_t v5 = 2;
        int64_t v7 = self;
        uint64_t v8 = 1;
        uint64_t v9 = 2;
        goto LABEL_21;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 2, 0))
      {
        int64_t v5 = 2;
        int64_t v7 = self;
        uint64_t v8 = 2;
        uint64_t v9 = 1;
        goto LABEL_21;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0x20000, 0x20000, 0x20000, 0)|| -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 2, 0x20000, 0)|| -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 2, 0)|| -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0x20000, 2, 2, 0))
      {
        int64_t v5 = 1;
      }
      else if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 2, 2, 0))
      {
        int64_t v5 = 1;
      }
      else
      {
        int64_t v5 = 2;
      }
LABEL_22:
      [(PXExploreLayoutGenerator *)self _parseThreeColumnShortRowWithNumberOfItems:v5];
      BOOL v10 = [v3 parseLocation] > v4;

      return v10;
    default:
      int64_t v5 = 2;
      if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0x20000, 0))
      {
        int64_t v5 = 2;
        if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 0x20000, 0))
        {
          int64_t v5 = 2;
          if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 2, 0x20000, 0))
          {
            int64_t v5 = 2;
            if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 2, 0))
            {
              int64_t v5 = 2;
              if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 2, 0))
              {
                BOOL v6 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 2, 2, 0);
LABEL_6:
                if (v6) {
                  int64_t v5 = 2;
                }
                else {
                  int64_t v5 = 1;
                }
              }
            }
          }
        }
      }
      goto LABEL_22;
  }
}

- (BOOL)parseThreeColumnShortRowWithPano
{
  uint64_t v3 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v4 = [v3 parseLocation];
  int64_t v5 = [(PXExploreLayoutGenerator *)self numberOfRemainingItems];
  switch(v5)
  {
    case 1:
      goto LABEL_25;
    case 2:
      BOOL v6 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0, v13, v15);
      goto LABEL_3;
    case 3:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0)) {
        goto LABEL_20;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0x20000, 0x20000, 0)
        || -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 0))
      {
        goto LABEL_15;
      }
      uint64_t v14 = 0;
      goto LABEL_29;
    case 4:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0x20000, 0)&& [(PXExploreLayoutGenerator *)self canReorderItemsAcrossRows])
      {
        int64_t v5 = 3;
        uint64_t v8 = self;
        uint64_t v9 = 1;
LABEL_23:
        uint64_t v10 = 3;
        goto LABEL_24;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 0x20000, 0))
      {
LABEL_20:
        int64_t v5 = 2;
        uint64_t v8 = self;
        uint64_t v9 = 1;
        uint64_t v10 = 2;
LABEL_24:
        [(PXExploreLayoutGenerator *)v8 moveNextItemAtIndex:v9 toIndex:v10];
        goto LABEL_25;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 0x20000, 0))
      {
LABEL_22:
        int64_t v5 = 3;
        uint64_t v8 = self;
        uint64_t v9 = 2;
        goto LABEL_23;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 2, 0))
      {
        int64_t v5 = 2;
        uint64_t v8 = self;
        uint64_t v9 = 2;
        uint64_t v10 = 1;
        goto LABEL_24;
      }
      BOOL v7 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0x20000, 0x20000, 0x20000, 0);
LABEL_8:
      if (v7
        || -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 2, 0x20000, 0)
        || -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 2, 0))
      {
LABEL_15:
        int64_t v5 = 1;
      }
      else
      {
        uint64_t v14 = 2;
        uint64_t v15 = 0;
LABEL_29:
        BOOL v6 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 2, v14, v15);
LABEL_3:
        if (v6) {
          int64_t v5 = 1;
        }
        else {
          int64_t v5 = 2;
        }
      }
LABEL_25:
      [(PXExploreLayoutGenerator *)self _parseThreeColumnShortRowWithNumberOfItems:v5];
      BOOL v11 = [v3 parseLocation] > v4;

      return v11;
    default:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 0x20000, 0))
      {
        goto LABEL_22;
      }
      BOOL v7 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 0x20000, 0);
      goto LABEL_8;
  }
}

- (void)_addTwoItemsForThreeColumnRowPreferringTallVariant:(BOOL)a3
{
  uint64_t v5 = 0;
  v43[2] = *MEMORY[0x1E4F143B8];
  char v6 = 1;
  double v7 = 1.79769313e308;
  do
  {
    char v8 = v6;
    [(PXExploreLayoutGenerator *)self score:0 forNextItemAtIndex:v5];
    double v10 = v9;
    unint64_t v11 = [(PXExploreLayoutGenerator *)self attributesForNextItemAtIndex:v5];
    char v6 = 0;
    uint64_t v12 = (v11 >> 3) & 1;
    if ((v11 & 4) != 0) {
      uint64_t v12 = 2;
    }
    *(double *)&v43[v5] = v10;
    if (v10 < v7) {
      double v7 = v10;
    }
    v42[v5] = v11;
    v41[v5] = v12;
    uint64_t v5 = 1;
  }
  while ((v8 & 1) != 0);
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3010000000;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v38 = &unk_1AB5D584F;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0x8000000000000001;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke;
  aBlock[3] = &unk_1E5DCF0F8;
  BOOL v33 = a3;
  void aBlock[6] = v41;
  void aBlock[7] = v42;
  aBlock[8] = v43;
  *(double *)&aBlock[9] = v7;
  void aBlock[4] = v34;
  void aBlock[5] = &v35;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v15 = [(PXExploreLayoutGenerator *)self metrics];
  BOOL v16 = [v15 layoutSubtype] != 1;

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  uint64_t v27 = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_3;
  uint64_t v28 = &unk_1E5DCF148;
  id v17 = v14;
  id v29 = v17;
  BOOL v31 = v16;
  id v18 = v13;
  id v30 = v18;
  uint64_t v19 = v26;
  __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_3((uint64_t)v19, 0);
  v27((uint64_t)v19, 1);

  uint64_t v20 = v36;
  if (*((unsigned char *)v36 + 41))
  {
    [(PXExploreLayoutGenerator *)self moveNextItemAtIndex:0 toIndex:1];
    uint64_t v20 = v36;
  }
  [v17 setNextHeroSide:v20[4]];
  uint64_t v21 = v36[4];
  if (*((unsigned char *)v36 + 40))
  {
    if (v21 == 1)
    {
      uint64_t v22 = 2;
      uint64_t v24 = 1;
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:1 rowSpan:2];
      uint64_t v23 = 1;
      uint64_t v25 = 2;
      goto LABEL_18;
    }
    if (!v21)
    {
      uint64_t v22 = 1;
      uint64_t v23 = 2;
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:1 atColumn:0 row:0 columnSpan:2 rowSpan:2];
      uint64_t v24 = 0;
      uint64_t v25 = 2;
LABEL_18:
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:v24 atColumn:v23 row:0 columnSpan:v22 rowSpan:v25];
    }
  }
  else
  {
    if (v21 == 1)
    {
      uint64_t v23 = 1;
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:1 rowSpan:1];
      uint64_t v24 = 0;
      uint64_t v22 = 2;
      uint64_t v25 = 1;
      goto LABEL_18;
    }
    if (!v21)
    {
      uint64_t v22 = 1;
      uint64_t v23 = 2;
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:1];
      uint64_t v24 = 0;
      uint64_t v25 = 1;
      goto LABEL_18;
    }
  }

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);
}

void __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  int v8 = *(unsigned __int8 *)(a1 + 80);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_2;
  aBlock[3] = &unk_1E5DCF0D0;
  long long v18 = *(_OWORD *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 72);
  void aBlock[4] = &v29;
  void aBlock[5] = &v25;
  void aBlock[6] = &v21;
  double v9 = _Block_copy(aBlock);
  double v10 = (void (**)(void, void, void, void))v9;
  unint64_t v11 = (void (*)(void *, void, uint64_t, uint64_t))*((void *)v9 + 2);
  if (a3)
  {
    if (a2)
    {
      v11(v9, a4, 2, 0);
      uint64_t v12 = 0;
LABEL_6:
      uint64_t v13 = 1;
      goto LABEL_9;
    }
    v11(v9, a4, 0, 1);
    uint64_t v13 = 0;
    uint64_t v12 = 2;
  }
  else
  {
    if (a2)
    {
      v11(v9, a4, 0, 0);
      uint64_t v12 = 1;
      goto LABEL_6;
    }
    v11(v9, a4, 1, 1);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
LABEL_9:
  v10[2](v10, a4 ^ 1, v12, v13);
  int64_t v14 = a4 ^ 1 | (10 * ((v8 == a3) | (unint64_t)(10 * (v22[3] + 10 * (v26[3] + 10 * (2 - v30[3]))))));
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v14 > *(void *)(v15 + 24))
  {
    *(void *)(v15 + 24) = v14;
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v16 + 32) = a2;
    *(unsigned char *)(v16 + 40) = a3;
    *(unsigned char *)(v16 + 41) = a4;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

void __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) nextHeroSide] == a2
    || [*(id *)(a1 + 32) canIgnoreNextHeroSide])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    uint64_t v5 = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_4;
    char v6 = &unk_1E5DCF120;
    char v9 = *(unsigned char *)(a1 + 48);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = a2;
    __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_4((uint64_t)v4, 0);
    v5((uint64_t)v4, 1);
  }
}

void __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_4(uint64_t a1, int a2)
{
  char v2 = a2;
  if (!a2 || *(unsigned char *)(a1 + 48))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    id v7 = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_5;
    uint64_t v8 = &unk_1E5DCF120;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v9 = v4;
    uint64_t v10 = v5;
    char v11 = v2;
    __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_5((uint64_t)v6, 0);
    v7((uint64_t)v6, 1);
  }
}

uint64_t __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 48));
}

uint64_t __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v5 = *(void *)(v4 + 8 * a2);
  if (a3 == 1 && v5 == 2 || a3 == 2 && v5 == 1 || !a3 && (*(void *)(*(void *)(result + 64) + 8 * a2) & 2) != 0) {
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  if (a4 == 1 && *(double *)(*(void *)(result + 72) + 8 * a2) > *(double *)(result + 80)) {
    ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  }
  if (*(void *)(v4 + 8 * a2) == a3) {
    ++*(void *)(*(void *)(*(void *)(result + 48) + 8) + 24);
  }
  return result;
}

- (void)_parseThreeColumnMediumHeroRowWithNumberOfItems:(int64_t)a3
{
  if (a3 <= 1)
  {
    -[PXExploreLayoutGenerator _parseThreeColumnShortRowWithNumberOfItems:](self, "_parseThreeColumnShortRowWithNumberOfItems:");
    return;
  }
  id v12 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v5 = [v12 nextHeroSide];
  [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:3];
  if (a3 == 2)
  {
    if ([(PXExploreLayoutGenerator *)self nextItems:2 areAll:2])
    {
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:3 rowSpan:1];
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:1 columnSpan:3 rowSpan:1];
      [v12 setNextHeroSide:PXFlippedExploreHeroSide(v5)];
    }
    else
    {
      [(PXExploreLayoutGenerator *)self _addTwoItemsForThreeColumnRowPreferringTallVariant:1];
    }
    goto LABEL_14;
  }
  if (v5 == 1)
  {
    [(PXExploreLayoutGenerator *)self sortNextItems:3 withItemAtIndex:2 having:0];
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:1 rowSpan:1];
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:1 columnSpan:1 rowSpan:1];
    char v6 = self;
    uint64_t v7 = 1;
    uint64_t v8 = 1;
    uint64_t v9 = 0;
    uint64_t v10 = 2;
    uint64_t v11 = 2;
    goto LABEL_13;
  }
  if (!v5)
  {
    [(PXExploreLayoutGenerator *)self sortNextItems:3 withItemAtIndex:0 having:0];
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:1 atColumn:0 row:0 columnSpan:2 rowSpan:2];
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:2 row:0 columnSpan:1 rowSpan:1];
    char v6 = self;
    uint64_t v7 = 0;
    uint64_t v8 = 2;
    uint64_t v9 = 1;
    uint64_t v10 = 1;
    uint64_t v11 = 1;
LABEL_13:
    [(PXExploreLayoutGenerator *)v6 addLocalItemWithType:v7 atColumn:v8 row:v9 columnSpan:v10 rowSpan:v11];
  }
LABEL_14:
  [(PXExploreLayoutGenerator *)self endRowWithType:2];
}

- (void)_parseThreeColumnShortRowWithNumberOfItems:(int64_t)a3
{
  [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:3];
  if (a3 == 2)
  {
    if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0))
    {
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:3 rowSpan:1];
      uint64_t v5 = self;
      uint64_t v6 = 1;
      goto LABEL_7;
    }
    [(PXExploreLayoutGenerator *)self _addTwoItemsForThreeColumnRowPreferringTallVariant:0];
    uint64_t v8 = [(PXExploreLayoutGenerator *)self localState];
    objc_msgSend(v8, "setNextHeroSide:", PXFlippedExploreHeroSide(objc_msgSend(v8, "nextHeroSide")));
  }
  else
  {
    if (a3 == 1)
    {
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0))
      {
        uint64_t v5 = self;
        uint64_t v6 = 0;
LABEL_7:
        [(PXExploreLayoutGenerator *)v5 addLocalItemWithType:0 atColumn:0 row:v6 columnSpan:3 rowSpan:1];
        goto LABEL_14;
      }
    }
    else if (a3 < 1)
    {
      goto LABEL_14;
    }
    uint64_t v7 = 0;
    if (a3 >= 3) {
      a3 = 3;
    }
    do
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:v7++ row:0 columnSpan:1 rowSpan:1];
    while (a3 != v7);
  }
LABEL_14:
  [(PXExploreLayoutGenerator *)self endRowWithType:1];
}

- (void)_parseThreeColumnHeaderRowWithNumberOfItems:(int64_t)a3
{
  [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:3];
  uint64_t v5 = [(PXExploreLayoutGenerator *)self metrics];
  [v5 preferredFullWidthHeaderAspectRatio];

  uint64_t v6 = [(PXExploreLayoutGenerator *)self metrics];
  if (![v6 allowSpecialPanoHeaders])
  {

LABEL_6:
    PXFloatApproximatelyEqualToFloat();
  }
  BOOL v7 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0);

  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = self;
  if (a3 == 2)
  {
    [(PXExploreLayoutGenerator *)self addLocalItemWithType:0 atColumn:0 row:0 columnSpan:2 rowSpan:1];
    uint64_t v8 = self;
    uint64_t v9 = 0;
    uint64_t v10 = 2;
    uint64_t v11 = 1;
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v9 = 2;
    uint64_t v10 = 0;
    uint64_t v11 = 3;
    uint64_t v12 = 2;
  }
  [(PXExploreLayoutGenerator *)v8 addLocalItemWithType:v9 atColumn:v10 row:0 columnSpan:v11 rowSpan:v12];
  [(PXExploreLayoutGenerator *)self endRowWithType:0];
}

- (BOOL)parseThreeColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4
{
  BOOL v7 = [(PXExploreLayoutGenerator *)self localState];
  uint64_t v8 = [v7 parseLocation];
  switch(a3)
  {
    case 0:
      [(PXExploreLayoutGenerator *)self _parseThreeColumnHeaderRowWithNumberOfItems:a4];
      break;
    case 1:
      [(PXExploreLayoutGenerator *)self _parseThreeColumnShortRowWithNumberOfItems:a4];
      break;
    case 2:
      [(PXExploreLayoutGenerator *)self _parseThreeColumnMediumHeroRowWithNumberOfItems:a4];
      break;
    case 3:
      [(PXExploreLayoutGenerator *)self beginRowWithNumberOfColumns:3];
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0)) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 3;
      }
      [(PXExploreLayoutGenerator *)self addLocalItemWithType:1 atColumn:0 row:0 columnSpan:3 rowSpan:v9];
      [(PXExploreLayoutGenerator *)self endRowWithType:3];
      break;
    default:
      break;
  }
  BOOL v10 = [v7 parseLocation] > v8;

  return v10;
}

@end