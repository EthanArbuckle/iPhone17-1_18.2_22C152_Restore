@interface TSTCellStateForLayout
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellID;
- ($CA3468F20078D5D2DB35E78E73CA60DA)mergedRange;
- (BOOL)cellPropsRowHeight;
- (BOOL)cellWraps;
- (BOOL)forDrawing;
- (BOOL)hasContent;
- (BOOL)inDynamicLayout;
- (CGSize)maxSize;
- (CGSize)minSize;
- (TSTCell)cell;
- (TSTCellStateForLayout)init;
- (TSTLayoutContentCachedKey)keyVal;
- (TSWPColumn)wpColumn;
- (UIEdgeInsets)paddingInsets;
- (id)cellContents;
- (int)layoutCacheFlags;
- (unint64_t)pageCount;
- (unint64_t)pageNumber;
- (unsigned)verticalAlignment;
- (void)dealloc;
- (void)setCell:(id)a3;
- (void)setCellContents:(id)a3;
- (void)setCellPropsRowHeight:(BOOL)a3;
- (void)setCellWraps:(BOOL)a3;
- (void)setForDrawing:(BOOL)a3;
- (void)setInDynamicLayout:(BOOL)a3;
- (void)setKeyVal:(id)a3;
- (void)setLayoutCacheFlags:(int)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setMergedRange:(id)a3;
- (void)setMinSize:(CGSize)a3;
- (void)setModelCellID:(id)a3;
- (void)setPaddingInsets:(UIEdgeInsets)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPageNumber:(unint64_t)a3;
- (void)setVerticalAlignment:(unsigned int)a3;
- (void)setWpColumn:(id)a3;
@end

@implementation TSTCellStateForLayout

- (TSTCellStateForLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSTCellStateForLayout;
  result = [(TSTCellStateForLayout *)&v4 init];
  if (result)
  {
    CGSize v3 = (CGSize)*MEMORY[0x263F001B0];
    result->mMaxSize = (CGSize)*MEMORY[0x263F001B0];
    *(_OWORD *)&result->mPaddingInsets.top = *(_OWORD *)TSDEdgeInsetsZero;
    result->mCell = 0;
    result->mMergedRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
    *(_OWORD *)&result->mPaddingInsets.bottom = *(_OWORD *)&TSDEdgeInsetsZero[16];
    *(void *)&result->mCellPropsRowHeight = 0xFFFFFF00000000;
    result->mCellContents = 0;
    result->mKeyVal = 0;
    result->mWPColumn = 0;
    *(void *)&result->mVerticalAlignment = 0xF00000000;
    *(int64x2_t *)&result->mPageNumber = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    result->mMinSize = v3;
  }
  return result;
}

- (void)dealloc
{
  self->mCell = 0;
  self->mWPColumn = 0;

  self->mCellContents = 0;
  self->mKeyVal = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTCellStateForLayout;
  [(TSTCellStateForLayout *)&v3 dealloc];
}

- (BOOL)hasContent
{
  objc_opt_class();
  [(TSTCellStateForLayout *)self cellContents];
  if (TSUDynamicCast())
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSTCellStateForLayout hasContent]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStateForLayout.m"), 79, @"expected nil value for '%s'", "TSUCastAsClass(TSWPColumn, [self cellContents])");
  }
  id v5 = [(TSTCellStateForLayout *)self cellContents];
  if (v5) {
    LOBYTE(v5) = objc_msgSend(-[TSTCellStateForLayout cellContents](self, "cellContents"), "length") != 0;
  }
  return (char)v5;
}

- (id)cellContents
{
  if (self->mCellContents) {
    return self->mCellContents;
  }
  mCell = self->mCell;
  if (!mCell) {
    return self->mCellContents;
  }
  int v5 = *((unsigned __int8 *)&mCell->mPrivate + 1);
  if (v5 != 6)
  {
    if (v5 == 9)
    {
      v7 = [(TSTRichTextPayload *)mCell->mPrivate.mRichTextPayload storage];
      self->mCellContents = v7;
      v6 = [(TSWPStorage *)v7 string];
      goto LABEL_11;
    }
    if (v5 == 8) {
      goto LABEL_7;
    }
LABEL_9:
    v6 = NSStringFromNativeTSTCell((__CFString *)mCell);
    self->mCellContents = v6;
    goto LABEL_11;
  }
  if (mCell->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType != 263) {
    goto LABEL_9;
  }
LABEL_7:
  v6 = 0;
  self->mCellContents = 0;
LABEL_11:
  if (TSTCellFormatUsesAccountingStyle(&self->mCell->super.isa)
    && v6
    && [(__CFString *)v6 length]
    && !self->mForDrawing)
  {
    v8 = (void *)[(__CFString *)v6 stringByReplacingOccurrencesOfString:@"\t" withString:&stru_26D688A48];

    self->mCellContents = 0;
    self->mCellContents = v8;
  }
  return self->mCellContents;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mModelCellID;
}

- (void)setModelCellID:(id)a3
{
  self->mModelCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (TSTCell)cell
{
  return self->mCell;
}

- (void)setCell:(id)a3
{
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)mergedRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mMergedRange;
}

- (void)setMergedRange:(id)a3
{
  self->mMergedRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
}

- (BOOL)cellPropsRowHeight
{
  return self->mCellPropsRowHeight;
}

- (void)setCellPropsRowHeight:(BOOL)a3
{
  self->mCellPropsRowHeight = a3;
}

- (BOOL)cellWraps
{
  return self->mCellWraps;
}

- (void)setCellWraps:(BOOL)a3
{
  self->mCellWraps = a3;
}

- (BOOL)forDrawing
{
  return self->mForDrawing;
}

- (void)setForDrawing:(BOOL)a3
{
  self->mForDrawing = a3;
}

- (BOOL)inDynamicLayout
{
  return self->mInDynamicLayout;
}

- (void)setInDynamicLayout:(BOOL)a3
{
  self->mInDynamicLayout = a3;
}

- (TSWPColumn)wpColumn
{
  return self->mWPColumn;
}

- (void)setWpColumn:(id)a3
{
}

- (CGSize)minSize
{
  double width = self->mMinSize.width;
  double height = self->mMinSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinSize:(CGSize)a3
{
  self->mMinSize = a3;
}

- (CGSize)maxSize
{
  double width = self->mMaxSize.width;
  double height = self->mMaxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->mMaxSize = a3;
}

- (UIEdgeInsets)paddingInsets
{
  double top = self->mPaddingInsets.top;
  double left = self->mPaddingInsets.left;
  double bottom = self->mPaddingInsets.bottom;
  double right = self->mPaddingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPaddingInsets:(UIEdgeInsets)a3
{
  self->mPaddingInsets = a3;
}

- (unsigned)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (void)setVerticalAlignment:(unsigned int)a3
{
  self->mVerticalAlignment = a3;
}

- (void)setCellContents:(id)a3
{
}

- (TSTLayoutContentCachedKey)keyVal
{
  return self->mKeyVal;
}

- (void)setKeyVal:(id)a3
{
}

- (int)layoutCacheFlags
{
  return self->mLayoutCacheFlags;
}

- (void)setLayoutCacheFlags:(int)a3
{
  self->mLayoutCacheFlags = a3;
}

- (unint64_t)pageNumber
{
  return self->mPageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->mPageNumber = a3;
}

- (unint64_t)pageCount
{
  return self->mPageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->mPageCount = a3;
}

@end