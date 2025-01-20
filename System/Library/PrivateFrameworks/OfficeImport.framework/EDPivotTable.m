@interface EDPivotTable
+ (id)pivotTableWithResources:(id)a3;
- (BOOL)applyAlignmentFormats;
- (BOOL)applyBorderFormats;
- (BOOL)applyFontFormats;
- (BOOL)applyNumberFormats;
- (BOOL)applyPatternFormats;
- (BOOL)applyWidthHeightFormats;
- (BOOL)colGrandTotals;
- (BOOL)compact;
- (BOOL)compactData;
- (BOOL)customListSort;
- (BOOL)dataCaption;
- (BOOL)dataOnRows;
- (BOOL)disableFieldList;
- (BOOL)mergeItem;
- (BOOL)multipleFieldFilters;
- (BOOL)outline;
- (BOOL)outlineData;
- (BOOL)pageOverThenDown;
- (BOOL)rowGrandTotals;
- (BOOL)showCalcMbrs;
- (BOOL)showColumnHeaders;
- (BOOL)showColumnStripes;
- (BOOL)showDataDropDown;
- (BOOL)showDropZones;
- (BOOL)showEmptyCol;
- (BOOL)showEmptyRow;
- (BOOL)showHeaders;
- (BOOL)showLastColumn;
- (BOOL)showMemberPropertyTips;
- (BOOL)showMissing;
- (BOOL)showMultipleLabel;
- (BOOL)showRowHeaders;
- (BOOL)showRowStripes;
- (BOOL)subtotalHiddenItems;
- (BOOL)useAutoFormatting;
- (EDPivotTable)initWithResources:(id)a3;
- (id)columnFields;
- (id)columnHeaderCaption;
- (id)columnItems;
- (id)conditionalFormats;
- (id)dataFields;
- (id)description;
- (id)name;
- (id)pageFields;
- (id)pageStyleName;
- (id)pivotAreas;
- (id)pivotFields;
- (id)pivotTableRange;
- (id)rowFields;
- (id)rowHeaderCaption;
- (id)rowItems;
- (id)style;
- (id)styleName;
- (int64_t)firstDataColumn;
- (int64_t)firstDataRow;
- (int64_t)firstHeaderRow;
- (unint64_t)autoFormatId;
- (unint64_t)columnPageCount;
- (unint64_t)dataPosition;
- (unint64_t)pageWrap;
- (unint64_t)rowPageCount;
- (unint64_t)styleIndex;
- (void)setApplyAlignmentFormats:(BOOL)a3;
- (void)setApplyBorderFormats:(BOOL)a3;
- (void)setApplyFontFormats:(BOOL)a3;
- (void)setApplyNumberFormats:(BOOL)a3;
- (void)setApplyPatternFormats:(BOOL)a3;
- (void)setApplyWidthHeightFormats:(BOOL)a3;
- (void)setAutoFormatId:(unint64_t)a3;
- (void)setColGrandTotals:(BOOL)a3;
- (void)setColumnHeaderCaption:(id)a3;
- (void)setColumnPageCount:(unint64_t)a3;
- (void)setCompact:(BOOL)a3;
- (void)setCompactData:(BOOL)a3;
- (void)setCustomListSort:(BOOL)a3;
- (void)setDataCaption:(BOOL)a3;
- (void)setDataOnRows:(BOOL)a3;
- (void)setDataPosition:(unint64_t)a3;
- (void)setDisableFieldList:(BOOL)a3;
- (void)setFirstDataColumn:(int64_t)a3;
- (void)setFirstDataRow:(int64_t)a3;
- (void)setFirstHeaderRow:(int64_t)a3;
- (void)setMergeItem:(BOOL)a3;
- (void)setMultipleFieldFilters:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOutline:(BOOL)a3;
- (void)setOutlineData:(BOOL)a3;
- (void)setPageOverThenDown:(BOOL)a3;
- (void)setPageStyleName:(id)a3;
- (void)setPageWrap:(unint64_t)a3;
- (void)setPivotTableRange:(id)a3;
- (void)setRowGrandTotals:(BOOL)a3;
- (void)setRowHeaderCaption:(id)a3;
- (void)setRowPageCount:(unint64_t)a3;
- (void)setShowCalcMbrs:(BOOL)a3;
- (void)setShowColumnHeaders:(BOOL)a3;
- (void)setShowColumnStripes:(BOOL)a3;
- (void)setShowDataDropDown:(BOOL)a3;
- (void)setShowDropZones:(BOOL)a3;
- (void)setShowEmptyCol:(BOOL)a3;
- (void)setShowEmptyRow:(BOOL)a3;
- (void)setShowHeaders:(BOOL)a3;
- (void)setShowLastColumn:(BOOL)a3;
- (void)setShowMemberPropertyTips:(BOOL)a3;
- (void)setShowMissing:(BOOL)a3;
- (void)setShowMultipleLabel:(BOOL)a3;
- (void)setShowRowHeaders:(BOOL)a3;
- (void)setShowRowStripes:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setStyleIndex:(unint64_t)a3;
- (void)setStyleName:(id)a3;
- (void)setSubtotalHiddenItems:(BOOL)a3;
- (void)setUseAutoFormatting:(BOOL)a3;
@end

@implementation EDPivotTable

+ (id)pivotTableWithResources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

- (EDPivotTable)initWithResources:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EDPivotTable;
  v5 = [(EDPivotTable *)&v26 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mStyleIndex = -1;
    *(void *)&v6->mShowLastColumn = 0;
    *(void *)&v6->mApplyPatternFormats = 0;
    v6->mCompact = 1;
    *(void *)&v6->mShowCalcMbrs = 0;
    *(void *)&v6->mDataCaption = 0;
    *(_WORD *)&v6->mShowMultipleLabel = 0;
    *(_OWORD *)&v6->mFirstHeaderRow = 0u;
    *(_OWORD *)&v6->mFirstDataColumn = 0u;
    *(_OWORD *)&v6->mColumnPageCount = 0u;
    *(_OWORD *)&v6->mAutoFormatId = 0u;
    v7 = objc_alloc_init(EDCollection);
    mRowFields = v6->mRowFields;
    v6->mRowFields = v7;

    v9 = objc_alloc_init(EDCollection);
    mColumnFields = v6->mColumnFields;
    v6->mColumnFields = v9;

    v11 = objc_alloc_init(EDCollection);
    mColumnItems = v6->mColumnItems;
    v6->mColumnItems = v11;

    v13 = objc_alloc_init(EDCollection);
    mRowItems = v6->mRowItems;
    v6->mRowItems = v13;

    v15 = objc_alloc_init(EDCollection);
    mPivotFields = v6->mPivotFields;
    v6->mPivotFields = v15;

    v17 = objc_alloc_init(EDCollection);
    mDataFields = v6->mDataFields;
    v6->mDataFields = v17;

    v19 = objc_alloc_init(EDCollection);
    mConditionalFields = v6->mConditionalFields;
    v6->mConditionalFields = v19;

    v21 = objc_alloc_init(EDCollection);
    mPivotAreas = v6->mPivotAreas;
    v6->mPivotAreas = v21;

    v23 = objc_alloc_init(EDCollection);
    mPageFields = v6->mPageFields;
    v6->mPageFields = v23;
  }
  return v6;
}

- (void)setPivotTableRange:(id)a3
{
  v5 = (EDReference *)a3;
  mPivotTableRange = self->mPivotTableRange;
  p_mPivotTableRange = &self->mPivotTableRange;
  if (mPivotTableRange != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mPivotTableRange, a3);
    v5 = v8;
  }
}

- (void)setFirstHeaderRow:(int64_t)a3
{
  self->mFirstHeaderRow = a3;
}

- (void)setFirstDataRow:(int64_t)a3
{
  self->mFirstDataRow = a3;
}

- (void)setFirstDataColumn:(int64_t)a3
{
  self->mFirstDataColumn = a3;
}

- (void)setStyleName:(id)a3
{
  v5 = (NSString *)a3;
  mStyleName = self->mStyleName;
  p_mStyleName = &self->mStyleName;
  if (mStyleName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mStyleName, a3);
    v5 = v8;
  }
}

- (void)setShowLastColumn:(BOOL)a3
{
  self->mShowLastColumn = a3;
}

- (void)setShowRowStripes:(BOOL)a3
{
  self->mShowRowStripes = a3;
}

- (void)setShowColumnStripes:(BOOL)a3
{
  self->mShowColumnStripes = a3;
}

- (void)setShowRowHeaders:(BOOL)a3
{
  self->mShowRowHeaders = a3;
}

- (void)setShowColumnHeaders:(BOOL)a3
{
  self->mShowColumnHeaders = a3;
}

- (id)pivotFields
{
  return self->mPivotFields;
}

- (id)rowFields
{
  return self->mRowFields;
}

- (id)rowItems
{
  return self->mRowItems;
}

- (id)columnFields
{
  return self->mColumnFields;
}

- (id)columnItems
{
  return self->mColumnItems;
}

- (id)pageFields
{
  return self->mPageFields;
}

- (id)dataFields
{
  return self->mDataFields;
}

- (id)conditionalFormats
{
  return self->mConditionalFields;
}

- (id)pivotAreas
{
  return self->mPivotAreas;
}

- (void)setName:(id)a3
{
  v5 = (NSString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }
}

- (void)setApplyNumberFormats:(BOOL)a3
{
  self->mApplyNumberFormats = a3;
}

- (void)setApplyBorderFormats:(BOOL)a3
{
  self->mApplyBorderFormats = a3;
}

- (void)setApplyFontFormats:(BOOL)a3
{
  self->mApplyFontFormats = a3;
}

- (void)setApplyPatternFormats:(BOOL)a3
{
  self->mApplyPatternFormats = a3;
}

- (void)setApplyAlignmentFormats:(BOOL)a3
{
  self->mApplyAlignmentFormats = a3;
}

- (void)setApplyWidthHeightFormats:(BOOL)a3
{
  self->mApplyWidthHeightFormats = a3;
}

- (void)setUseAutoFormatting:(BOOL)a3
{
  self->mUseAutoFormatting = a3;
}

- (void)setDataCaption:(BOOL)a3
{
  self->mDataCaption = a3;
}

- (void)setMultipleFieldFilters:(BOOL)a3
{
  self->mMultipleFieldFilters = a3;
}

- (void)setOutline:(BOOL)a3
{
  self->mOutline = a3;
}

- (void)setOutlineData:(BOOL)a3
{
  self->mOutlineData = a3;
}

- (void)setShowCalcMbrs:(BOOL)a3
{
  self->mShowCalcMbrs = a3;
}

- (id)style
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained tableStyles];

  mStyleName = self->mStyleName;
  v6 = mStyleName;
  if (!mStyleName)
  {
    v6 = [v4 defaultPivotStyleName];
  }
  v7 = [v4 objectWithName:v6];
  if (!mStyleName) {

  }
  return v7;
}

- (id)pivotTableRange
{
  return self->mPivotTableRange;
}

- (int64_t)firstHeaderRow
{
  return self->mFirstHeaderRow;
}

- (int64_t)firstDataRow
{
  return self->mFirstDataRow;
}

- (int64_t)firstDataColumn
{
  return self->mFirstDataColumn;
}

- (BOOL)showColumnHeaders
{
  return self->mShowColumnHeaders;
}

- (BOOL)showRowHeaders
{
  return self->mShowRowHeaders;
}

- (BOOL)showColumnStripes
{
  return self->mShowColumnStripes;
}

- (BOOL)showRowStripes
{
  return self->mShowRowStripes;
}

- (BOOL)compact
{
  return self->mCompact;
}

- (void)setStyle:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained tableStyles];

  self->mStyleIndex = [v5 addObject:v6];
}

- (id)columnHeaderCaption
{
  return self->mColumnHeaderCaption;
}

- (void)setColumnHeaderCaption:(id)a3
{
  v5 = (NSString *)a3;
  mColumnHeaderCaption = self->mColumnHeaderCaption;
  p_mColumnHeaderCaption = &self->mColumnHeaderCaption;
  if (mColumnHeaderCaption != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mColumnHeaderCaption, a3);
    v5 = v8;
  }
}

- (id)rowHeaderCaption
{
  return self->mRowHeaderCaption;
}

- (void)setRowHeaderCaption:(id)a3
{
  v5 = (NSString *)a3;
  mRowHeaderCaption = self->mRowHeaderCaption;
  p_mRowHeaderCaption = &self->mRowHeaderCaption;
  if (mRowHeaderCaption != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mRowHeaderCaption, a3);
    v5 = v8;
  }
}

- (id)pageStyleName
{
  return self->mPageStyleName;
}

- (void)setPageStyleName:(id)a3
{
  v5 = (NSString *)a3;
  mPageStyleName = self->mPageStyleName;
  p_mPageStyleName = &self->mPageStyleName;
  if (mPageStyleName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mPageStyleName, a3);
    v5 = v8;
  }
}

- (id)styleName
{
  return self->mStyleName;
}

- (id)name
{
  return self->mName;
}

- (unint64_t)rowPageCount
{
  return self->mRowPageCount;
}

- (void)setRowPageCount:(unint64_t)a3
{
  self->mRowPageCount = a3;
}

- (unint64_t)columnPageCount
{
  return self->mColumnPageCount;
}

- (void)setColumnPageCount:(unint64_t)a3
{
  self->mColumnPageCount = a3;
}

- (unint64_t)pageWrap
{
  return self->mPageWrap;
}

- (void)setPageWrap:(unint64_t)a3
{
  self->mPageWrap = a3;
}

- (unint64_t)autoFormatId
{
  return self->mAutoFormatId;
}

- (void)setAutoFormatId:(unint64_t)a3
{
  self->mAutoFormatId = a3;
}

- (unint64_t)dataPosition
{
  return self->mDataPosition;
}

- (void)setDataPosition:(unint64_t)a3
{
  self->mDataPosition = a3;
}

- (BOOL)showLastColumn
{
  return self->mShowLastColumn;
}

- (BOOL)applyNumberFormats
{
  return self->mApplyNumberFormats;
}

- (BOOL)applyBorderFormats
{
  return self->mApplyBorderFormats;
}

- (BOOL)applyFontFormats
{
  return self->mApplyFontFormats;
}

- (BOOL)applyPatternFormats
{
  return self->mApplyPatternFormats;
}

- (BOOL)applyAlignmentFormats
{
  return self->mApplyAlignmentFormats;
}

- (BOOL)applyWidthHeightFormats
{
  return self->mApplyWidthHeightFormats;
}

- (BOOL)colGrandTotals
{
  return self->mColGrandTotals;
}

- (void)setColGrandTotals:(BOOL)a3
{
  self->mColGrandTotals = a3;
}

- (BOOL)useAutoFormatting
{
  return self->mUseAutoFormatting;
}

- (BOOL)rowGrandTotals
{
  return self->mRowGrandTotals;
}

- (void)setRowGrandTotals:(BOOL)a3
{
  self->mRowGrandTotals = a3;
}

- (BOOL)customListSort
{
  return self->mCustomListSort;
}

- (void)setCustomListSort:(BOOL)a3
{
  self->mCustomListSort = a3;
}

- (BOOL)compactData
{
  return self->mCompactData;
}

- (void)setCompactData:(BOOL)a3
{
  self->mCompactData = a3;
}

- (void)setCompact:(BOOL)a3
{
  self->mCompact = a3;
}

- (BOOL)dataCaption
{
  return self->mDataCaption;
}

- (BOOL)dataOnRows
{
  return self->mDataOnRows;
}

- (void)setDataOnRows:(BOOL)a3
{
  self->mDataOnRows = a3;
}

- (BOOL)disableFieldList
{
  return self->mDisableFieldList;
}

- (void)setDisableFieldList:(BOOL)a3
{
  self->mDisableFieldList = a3;
}

- (BOOL)mergeItem
{
  return self->mMergeItem;
}

- (void)setMergeItem:(BOOL)a3
{
  self->mMergeItem = a3;
}

- (BOOL)multipleFieldFilters
{
  return self->mMultipleFieldFilters;
}

- (BOOL)outline
{
  return self->mOutline;
}

- (BOOL)outlineData
{
  return self->mOutlineData;
}

- (BOOL)pageOverThenDown
{
  return self->mPageOverThenDown;
}

- (void)setPageOverThenDown:(BOOL)a3
{
  self->mPageOverThenDown = a3;
}

- (BOOL)showCalcMbrs
{
  return self->mShowCalcMbrs;
}

- (BOOL)showDataDropDown
{
  return self->mShowDataDropDown;
}

- (void)setShowDataDropDown:(BOOL)a3
{
  self->mShowDataDropDown = a3;
}

- (BOOL)showDropZones
{
  return self->mShowDropZones;
}

- (void)setShowDropZones:(BOOL)a3
{
  self->mShowDropZones = a3;
}

- (BOOL)showEmptyCol
{
  return self->mShowEmptyCol;
}

- (void)setShowEmptyCol:(BOOL)a3
{
  self->mShowEmptyCol = a3;
}

- (BOOL)showEmptyRow
{
  return self->mShowEmptyRow;
}

- (void)setShowEmptyRow:(BOOL)a3
{
  self->mShowEmptyRow = a3;
}

- (BOOL)showHeaders
{
  return self->mShowHeaders;
}

- (void)setShowHeaders:(BOOL)a3
{
  self->mShowHeaders = a3;
}

- (BOOL)showMemberPropertyTips
{
  return self->mShowMemberPropertyTips;
}

- (void)setShowMemberPropertyTips:(BOOL)a3
{
  self->mShowMemberPropertyTips = a3;
}

- (BOOL)showMissing
{
  return self->mShowMissing;
}

- (void)setShowMissing:(BOOL)a3
{
  self->mShowMissing = a3;
}

- (BOOL)showMultipleLabel
{
  return self->mShowMultipleLabel;
}

- (void)setShowMultipleLabel:(BOOL)a3
{
  self->mShowMultipleLabel = a3;
}

- (BOOL)subtotalHiddenItems
{
  return self->mSubtotalHiddenItems;
}

- (void)setSubtotalHiddenItems:(BOOL)a3
{
  self->mSubtotalHiddenItems = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPivotTable;
  v2 = [(EDPivotTable *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPageFields, 0);
  objc_storeStrong((id *)&self->mPivotAreas, 0);
  objc_storeStrong((id *)&self->mConditionalFields, 0);
  objc_storeStrong((id *)&self->mDataFields, 0);
  objc_storeStrong((id *)&self->mPivotFields, 0);
  objc_storeStrong((id *)&self->mColumnItems, 0);
  objc_storeStrong((id *)&self->mRowItems, 0);
  objc_storeStrong((id *)&self->mColumnFields, 0);
  objc_storeStrong((id *)&self->mRowFields, 0);
  objc_storeStrong((id *)&self->mPivotTableRange, 0);
  objc_storeStrong((id *)&self->mPageStyleName, 0);
  objc_storeStrong((id *)&self->mRowHeaderCaption, 0);
  objc_storeStrong((id *)&self->mColumnHeaderCaption, 0);
  objc_storeStrong((id *)&self->mStyleName, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)styleIndex
{
  return self->mStyleIndex;
}

- (void)setStyleIndex:(unint64_t)a3
{
  self->mStyleIndex = a3;
}

@end