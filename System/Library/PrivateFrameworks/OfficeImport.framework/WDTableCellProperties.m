@interface WDTableCellProperties
- (BOOL)firstInSetOfVerticallyMergedCells;
- (BOOL)isBottomBorderOverridden;
- (BOOL)isBottomMarginOverridden;
- (BOOL)isBottomMarginTypeOverridden;
- (BOOL)isDeletedOverridden;
- (BOOL)isDeletionDateOverridden;
- (BOOL)isDiagonalDownBorderOverridden;
- (BOOL)isDiagonalUpBorderOverridden;
- (BOOL)isEditDateOverridden;
- (BOOL)isEditedOverridden;
- (BOOL)isFirstInSetOfVerticallyMergedCellsOverridden;
- (BOOL)isFormattingChangeDateOverridden;
- (BOOL)isFormattingChangedOverridden;
- (BOOL)isIndexToAuthorIDOfDeletionOverridden;
- (BOOL)isIndexToAuthorIDOfEditOverridden;
- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden;
- (BOOL)isInsideHorizontalBorderOverridden;
- (BOOL)isInsideVerticalBorderOverridden;
- (BOOL)isLeftBorderOverridden;
- (BOOL)isLeftMarginOverridden;
- (BOOL)isLeftMarginTypeOverridden;
- (BOOL)isNoWrapOverridden;
- (BOOL)isRightBorderOverridden;
- (BOOL)isRightMarginOverridden;
- (BOOL)isRightMarginTypeOverridden;
- (BOOL)isShadingOverridden;
- (BOOL)isTextDirectionOverridden;
- (BOOL)isTopBorderOverridden;
- (BOOL)isTopMarginOverridden;
- (BOOL)isTopMarginTypeOverridden;
- (BOOL)isVerticalAlignmentOverridden;
- (BOOL)isVerticallyMergedCellOverridden;
- (BOOL)isWidthTypeOverridden;
- (BOOL)noWrap;
- (BOOL)verticallyMergedCell;
- (WDDocument)document;
- (WDTableCellProperties)init;
- (WDTableCellProperties)initWithDocument:(id)a3;
- (id).cxx_construct;
- (id)bottomBorder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deletionDate;
- (id)description;
- (id)diagonalDownBorder;
- (id)diagonalUpBorder;
- (id)editDate;
- (id)formattingChangeDate;
- (id)insideHorizontalBorder;
- (id)insideVerticalBorder;
- (id)leftBorder;
- (id)mutableBottomBorder;
- (id)mutableDiagonalDownBorder;
- (id)mutableDiagonalUpBorder;
- (id)mutableInsideHorizontalBorder;
- (id)mutableInsideVerticalBorder;
- (id)mutableLeftBorder;
- (id)mutableRightBorder;
- (id)mutableShading;
- (id)mutableTopBorder;
- (id)rightBorder;
- (id)shading;
- (id)topBorder;
- (int)bottomMarginType;
- (int)deleted;
- (int)edited;
- (int)formattingChanged;
- (int)leftMarginType;
- (int)resolveMode;
- (int)rightMarginType;
- (int)textDirection;
- (int)topMarginType;
- (int)verticalAlignment;
- (int)widthType;
- (signed)bottomMargin;
- (signed)leftMargin;
- (signed)position;
- (signed)rightMargin;
- (signed)topMargin;
- (signed)width;
- (unsigned)indexToAuthorIDOfDeletion;
- (unsigned)indexToAuthorIDOfEdit;
- (unsigned)indexToAuthorIDOfFormattingChange;
- (void)addProperties:(id)a3;
- (void)addPropertiesValues:(id *)a3 to:(id *)a4;
- (void)clearShading;
- (void)originalToTracked;
- (void)setBottomMargin:(signed __int16)a3;
- (void)setBottomMarginType:(int)a3;
- (void)setDeleted:(int)a3;
- (void)setDeletionDate:(id)a3;
- (void)setEditDate:(id)a3;
- (void)setEdited:(int)a3;
- (void)setFirstInSetOfVerticallyMergedCells:(BOOL)a3;
- (void)setFormattingChangeDate:(id)a3;
- (void)setFormattingChanged:(int)a3;
- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3;
- (void)setLeftMargin:(signed __int16)a3;
- (void)setLeftMarginType:(int)a3;
- (void)setNoWrap:(BOOL)a3;
- (void)setPosition:(signed __int16)a3;
- (void)setResolveMode:(int)a3;
- (void)setRightMargin:(signed __int16)a3;
- (void)setRightMarginType:(int)a3;
- (void)setTextDirection:(int)a3;
- (void)setTopMargin:(signed __int16)a3;
- (void)setTopMarginType:(int)a3;
- (void)setVerticalAlignment:(int)a3;
- (void)setVerticallyMergedCell:(BOOL)a3;
- (void)setWidth:(signed __int16)a3;
- (void)setWidthType:(int)a3;
@end

@implementation WDTableCellProperties

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 19) = 0;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((void *)self + 31) = 0;
  *((void *)self + 41) = 0;
  *((void *)self + 42) = 0;
  *((void *)self + 40) = 0;
  return self;
}

- (WDTableCellProperties)initWithDocument:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WDTableCellProperties;
  v5 = [(WDTableCellProperties *)&v8 init];
  v6 = v5;
  if (v5)
  {
    *((unsigned char *)v5 + 12) = *((unsigned char *)v5 + 12) & 0xF8 | 1;
    objc_storeWeak((id *)&v5->mDocument, v4);
  }

  return v6;
}

- (void)setResolveMode:(int)a3
{
  *((unsigned char *)self + 12) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((unsigned char *)self + 12) & 0xF8;
}

- (void)setPosition:(signed __int16)a3
{
  self->mPosition = a3;
}

- (id)mutableTopBorder
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_topBorder = &self->mTrackedProperties.topBorder;
    topBorder = self->mTrackedProperties.topBorder;
    if (!topBorder)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 2u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_topBorder;
      *p_topBorder = v6;

      topBorder = *p_topBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      v2 = 0;
      goto LABEL_10;
    }
    p_topBorder = &self->mOriginalProperties.topBorder;
    topBorder = self->mOriginalProperties.topBorder;
    if (!topBorder)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  v2 = topBorder;
LABEL_10:
  return v2;
}

- (id)mutableLeftBorder
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_leftBorder = &self->mTrackedProperties.leftBorder;
    leftBorder = self->mTrackedProperties.leftBorder;
    if (!leftBorder)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 4u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_leftBorder;
      *p_leftBorder = v6;

      leftBorder = *p_leftBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      v2 = 0;
      goto LABEL_10;
    }
    p_leftBorder = &self->mOriginalProperties.leftBorder;
    leftBorder = self->mOriginalProperties.leftBorder;
    if (!leftBorder)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  v2 = leftBorder;
LABEL_10:
  return v2;
}

- (id)mutableBottomBorder
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_bottomBorder = &self->mTrackedProperties.bottomBorder;
    bottomBorder = self->mTrackedProperties.bottomBorder;
    if (!bottomBorder)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 8u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_bottomBorder;
      *p_bottomBorder = v6;

      bottomBorder = *p_bottomBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      v2 = 0;
      goto LABEL_10;
    }
    p_bottomBorder = &self->mOriginalProperties.bottomBorder;
    bottomBorder = self->mOriginalProperties.bottomBorder;
    if (!bottomBorder)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  v2 = bottomBorder;
LABEL_10:
  return v2;
}

- (id)mutableRightBorder
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_rightBorder = &self->mTrackedProperties.rightBorder;
    rightBorder = self->mTrackedProperties.rightBorder;
    if (!rightBorder)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x10u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_rightBorder;
      *p_rightBorder = v6;

      rightBorder = *p_rightBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      v2 = 0;
      goto LABEL_10;
    }
    p_rightBorder = &self->mOriginalProperties.rightBorder;
    rightBorder = self->mOriginalProperties.rightBorder;
    if (!rightBorder)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  v2 = rightBorder;
LABEL_10:
  return v2;
}

- (void)setVerticalAlignment:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 292;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 124;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40000u;
}

- (void)setTextDirection:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 296;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 128;
  }
  *((unsigned char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x80000u;
}

- (void)setVerticallyMergedCell:(BOOL)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
  }
  uint64_t v4 = (char *)self + v3;
  unint64_t v5 = *(_DWORD *)v4 & 0xFFCFFFFF | ((unint64_t)v4[4] << 32);
  int v6 = 0x200000;
  if (a3) {
    int v6 = 3145728;
  }
  *(_DWORD *)uint64_t v4 = v6 | *(_DWORD *)v4 & 0xFFCFFFFF;
  v4[4] = BYTE4(v5);
}

- (void)setFirstInSetOfVerticallyMergedCells:(BOOL)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
  }
  uint64_t v4 = (char *)self + v3;
  unint64_t v5 = *(_DWORD *)v4 & 0xFF3FFFFF | ((unint64_t)v4[4] << 32);
  int v6 = 0x800000;
  if (a3) {
    int v6 = 12582912;
  }
  *(_DWORD *)uint64_t v4 = v6 | *(_DWORD *)v4 & 0xFF3FFFFF;
  v4[4] = BYTE4(v5);
}

- (void)setWidth:(signed __int16)a3
{
  self->mWidth = a3;
}

- (void)setWidthType:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 256;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 88;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x200u;
}

- (BOOL)isWidthTypeOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x200;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 9) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x200) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x200) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 9) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x200;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)widthType
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x200) != 0)
  {
    uint64_t v3 = 256;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x200) == 0) {
      return 1;
    }
    uint64_t v3 = 88;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (signed)width
{
  return self->mWidth;
}

- (BOOL)isTopBorderOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 2;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 1) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 2) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 2) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 1) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 2;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)topBorder
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 2) != 0)
  {
    uint64_t v3 = 192;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 2) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 24;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isLeftBorderOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 4;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 2) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 4) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 4) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 2) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 4;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)leftBorder
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 4) != 0)
  {
    uint64_t v3 = 200;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 4) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 32;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isBottomBorderOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 8;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 3) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 8) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 8) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 3) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 8;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)bottomBorder
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 8) != 0)
  {
    uint64_t v3 = 208;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 8) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 40;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isRightBorderOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x10;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 4) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x10) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 4) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x10;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)rightBorder
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x10) != 0)
  {
    uint64_t v3 = 216;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 48;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isVerticalAlignmentOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x40000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 18) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x40000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 18) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *(void *)&v4 & 0x40000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)verticalAlignment
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x40000) != 0)
  {
    uint64_t v3 = 292;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40000) == 0) {
      return 0;
    }
    uint64_t v3 = 124;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isLeftMarginOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x4000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 14) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x4000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x4000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 14) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x4000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)isRightMarginOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x10000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 16) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x10000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 16) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *(void *)&v4 & 0x10000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)isShadingOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = 344;
    return *(_DWORD *)((unsigned char *)&self->super.isa + v2) & 1;
  }
  if ((*((unsigned char *)self + 12) & 4) != 0)
  {
    if (*((_DWORD *)&self->mTrackedProperties + 40))
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    if (*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)self + 12))
  {
LABEL_10:
    uint64_t v2 = 176;
    return *(_DWORD *)((unsigned char *)&self->super.isa + v2) & 1;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (WDTableCellProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)WDTableCellProperties;
  result = [(WDTableCellProperties *)&v3 init];
  if (result) {
    *((unsigned char *)result + 12) = *((unsigned char *)result + 12) & 0xF8 | 1;
  }
  return result;
}

- (id)mutableShading
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    shading = self->mTrackedProperties.shading;
    if (!shading)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 1u;
      int v6 = objc_alloc_init(WDShading);
      v7 = p_mTrackedProperties->shading;
      p_mTrackedProperties->shading = v6;

      shading = p_mTrackedProperties->shading;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      uint64_t v2 = 0;
      goto LABEL_10;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    shading = self->mOriginalProperties.shading;
    if (!shading)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  uint64_t v2 = shading;
LABEL_10:
  return v2;
}

- (id)shading
{
  if (*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40))
  {
    uint64_t v3 = 184;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 1) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 16;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (id)mutableInsideHorizontalBorder
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_insideHorizontalBorder = &self->mTrackedProperties.insideHorizontalBorder;
    insideHorizontalBorder = self->mTrackedProperties.insideHorizontalBorder;
    if (!insideHorizontalBorder)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x80u;
      int v6 = objc_alloc_init(WDBorder);
      v7 = *p_insideHorizontalBorder;
      *p_insideHorizontalBorder = v6;

      insideHorizontalBorder = *p_insideHorizontalBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      id v2 = 0;
      goto LABEL_10;
    }
    p_insideHorizontalBorder = &self->mOriginalProperties.insideHorizontalBorder;
    insideHorizontalBorder = self->mOriginalProperties.insideHorizontalBorder;
    if (!insideHorizontalBorder)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  id v2 = insideHorizontalBorder;
LABEL_10:
  return v2;
}

- (id)mutableInsideVerticalBorder
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_insideVerticalBorder = &self->mTrackedProperties.insideVerticalBorder;
    insideVerticalBorder = self->mTrackedProperties.insideVerticalBorder;
    if (!insideVerticalBorder)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x100u;
      int v6 = objc_alloc_init(WDBorder);
      v7 = *p_insideVerticalBorder;
      *p_insideVerticalBorder = v6;

      insideVerticalBorder = *p_insideVerticalBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      id v2 = 0;
      goto LABEL_10;
    }
    p_insideVerticalBorder = &self->mOriginalProperties.insideVerticalBorder;
    insideVerticalBorder = self->mOriginalProperties.insideVerticalBorder;
    if (!insideVerticalBorder)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  id v2 = insideVerticalBorder;
LABEL_10:
  return v2;
}

- (void)setTopMargin:(signed __int16)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 260;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 92;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x400u;
}

- (void)setTopMarginType:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 264;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 96;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x800u;
}

- (void)setBottomMargin:(signed __int16)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 268;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 100;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x1000u;
}

- (void)setBottomMarginType:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 272;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 104;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x2000u;
}

- (void)setLeftMargin:(signed __int16)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 276;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 108;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x4000u;
}

- (void)setLeftMarginType:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 280;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 112;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x8000u;
}

- (void)setRightMargin:(signed __int16)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 284;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 116;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x10000u;
}

- (void)setRightMarginType:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 288;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 120;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x20000u;
}

- (signed)leftMargin
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x4000) != 0)
  {
    uint64_t v3 = 276;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((unsigned char *)self + 12) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x4000) != 0)
  {
    uint64_t v3 = 108;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (signed)rightMargin
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x10000) != 0)
  {
    uint64_t v3 = 284;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((unsigned char *)self + 12) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10000) != 0)
  {
    uint64_t v3 = 116;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (void)addProperties:(id)a3
{
  uint64_t v4 = (char *)a3;
  [(WDTableCellProperties *)self addPropertiesValues:v4 + 16 to:&self->mOriginalProperties];
  [(WDTableCellProperties *)self addPropertiesValues:v4 + 184 to:&self->mTrackedProperties];
}

- (void)addPropertiesValues:(id *)a3 to:(id *)a4
{
  uint64_t v6 = *((unsigned int *)a4 + 40);
  unint64_t v7 = v6 | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  if (v6 & 1) == 0 && (*((_DWORD *)a3 + 40))
  {
    *((_DWORD *)a4 + 40) = v6 | 1;
    objc_super v8 = (unsigned int *)((char *)a4 + 160);
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    v9 = (void *)[a3->var0 copy];
    id var0 = a4->var0;
    a4->id var0 = v9;

    unint64_t v7 = *v8 | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 2) == 0 && (*((_DWORD *)a3 + 40) & 2) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 2;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var1, a3->var1);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 4) == 0 && (*((_DWORD *)a3 + 40) & 4) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 4;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var2, a3->var2);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 8) == 0 && (*((_DWORD *)a3 + 40) & 8) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 8;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var3, a3->var3);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x10) == 0 && (*((_DWORD *)a3 + 40) & 0x10) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x10;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var4, a3->var4);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x20) == 0 && (*((_DWORD *)a3 + 40) & 0x20) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x20;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var5, a3->var5);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x40) == 0 && (*((_DWORD *)a3 + 40) & 0x40) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x40;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var6, a3->var6);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x80) == 0 && (*((_DWORD *)a3 + 40) & 0x80) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x80;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var7, a3->var7);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x100) == 0 && (*((_DWORD *)a3 + 40) & 0x100) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x100;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var8, a3->var8);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x200) == 0 && (*((_DWORD *)a3 + 40) & 0x200) != 0)
  {
    unint64_t v11 = HIDWORD(v7);
    v7 |= 0x200uLL;
    *((unsigned char *)a4 + 164) = v11;
    *((_DWORD *)a4 + 40) = v7;
    a4->var9 = a3->var9;
  }
  if ((v7 & 0x400) == 0 && (*((_DWORD *)a3 + 40) & 0x400) != 0)
  {
    unint64_t v12 = HIDWORD(v7);
    v7 |= 0x400uLL;
    *((unsigned char *)a4 + 164) = v12;
    *((_DWORD *)a4 + 40) = v7;
    a4->var10 = a3->var10;
  }
  if ((v7 & 0x800) == 0 && (*((_DWORD *)a3 + 40) & 0x800) != 0)
  {
    unint64_t v13 = HIDWORD(v7);
    v7 |= 0x800uLL;
    *((unsigned char *)a4 + 164) = v13;
    *((_DWORD *)a4 + 40) = v7;
    a4->var11 = a3->var11;
  }
  if ((v7 & 0x1000) == 0 && (*((_DWORD *)a3 + 40) & 0x1000) != 0)
  {
    unint64_t v14 = HIDWORD(v7);
    v7 |= 0x1000uLL;
    *((unsigned char *)a4 + 164) = v14;
    *((_DWORD *)a4 + 40) = v7;
    a4->var12 = a3->var12;
  }
  if ((v7 & 0x2000) == 0 && (*((_DWORD *)a3 + 40) & 0x2000) != 0)
  {
    unint64_t v15 = HIDWORD(v7);
    v7 |= 0x2000uLL;
    *((unsigned char *)a4 + 164) = v15;
    *((_DWORD *)a4 + 40) = v7;
    a4->var13 = a3->var13;
  }
  if ((v7 & 0x4000) == 0 && (*((_DWORD *)a3 + 40) & 0x4000) != 0)
  {
    unint64_t v16 = HIDWORD(v7);
    v7 |= 0x4000uLL;
    *((unsigned char *)a4 + 164) = v16;
    *((_DWORD *)a4 + 40) = v7;
    a4->var14 = a3->var14;
  }
  if ((v7 & 0x8000) == 0 && (*((_DWORD *)a3 + 40) & 0x8000) != 0)
  {
    unint64_t v17 = HIDWORD(v7);
    v7 |= 0x8000uLL;
    *((unsigned char *)a4 + 164) = v17;
    *((_DWORD *)a4 + 40) = v7;
    a4->var15 = a3->var15;
  }
  if ((v7 & 0x10000) == 0 && (*((_DWORD *)a3 + 40) & 0x10000) != 0)
  {
    unint64_t v18 = HIDWORD(v7);
    v7 |= 0x10000uLL;
    *((unsigned char *)a4 + 164) = v18;
    *((_DWORD *)a4 + 40) = v7;
    a4->var16 = a3->var16;
  }
  if ((v7 & 0x20000) == 0 && (*((_DWORD *)a3 + 40) & 0x20000) != 0)
  {
    unint64_t v19 = HIDWORD(v7);
    v7 |= 0x20000uLL;
    *((unsigned char *)a4 + 164) = v19;
    *((_DWORD *)a4 + 40) = v7;
    a4->var17 = a3->var17;
  }
  if ((v7 & 0x40000) == 0 && (*((_DWORD *)a3 + 40) & 0x40000) != 0)
  {
    unint64_t v20 = HIDWORD(v7);
    v7 |= 0x40000uLL;
    *((unsigned char *)a4 + 164) = v20;
    *((_DWORD *)a4 + 40) = v7;
    a4->var18 = a3->var18;
  }
  if ((v7 & 0x80000) == 0 && (*((_DWORD *)a3 + 40) & 0x80000) != 0)
  {
    unint64_t v21 = HIDWORD(v7);
    v7 |= 0x80000uLL;
    *((_DWORD *)a4 + 40) = v7;
    *((unsigned char *)a4 + 164) = v21;
    a4->var19 = a3->var19;
  }
  if ((v7 & 0x200000) == 0 && (*((_DWORD *)a3 + 40) & 0x200000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x200000;
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    unint64_t v22 = v7 & 0xFFFFFFFFFFCFFFFFLL | 0x200000;
    unint64_t v7 = *((_DWORD *)a3 + 40) & 0x100000 | v22;
    *((unsigned char *)a4 + 164) = BYTE4(v22);
    *((_DWORD *)a4 + 40) = v7;
  }
  if ((v7 & 0x800000) == 0 && (*((_DWORD *)a3 + 40) & 0x800000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x800000;
    unint64_t v23 = HIDWORD(v7);
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    unint64_t v7 = *((_DWORD *)a3 + 40) & 0x400000 | v7 & 0xFFFF3FFFFFLL | 0x800000;
    *((unsigned char *)a4 + 164) = v23;
    *((_DWORD *)a4 + 40) = v7;
  }
  if ((v7 & 0x2000000) == 0 && (*((_DWORD *)a3 + 40) & 0x2000000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x2000000;
    unint64_t v24 = HIDWORD(v7);
    *((unsigned char *)a4 + 164) = BYTE4(v7);
    unint64_t v7 = *((_DWORD *)a3 + 40) & 0x1000000 | v7 & 0xFFFCFFFFFFLL | 0x2000000;
    *((unsigned char *)a4 + 164) = v24;
    *((_DWORD *)a4 + 40) = v7;
  }
  if ((v7 & 0x20000000) == 0 && (*((_DWORD *)a3 + 40) & 0x20000000) != 0)
  {
    unint64_t v25 = HIDWORD(v7);
    v7 |= 0x20000000uLL;
    *((unsigned char *)a4 + 164) = v25;
    *((_DWORD *)a4 + 40) = v7;
    a4->var23 = a3->var23;
  }
  if ((v7 & 0x40000000) == 0 && (*((_DWORD *)a3 + 40) & 0x40000000) != 0)
  {
    unint64_t v26 = HIDWORD(v7);
    v7 |= 0x40000000uLL;
    *((unsigned char *)a4 + 164) = v26;
    *((_DWORD *)a4 + 40) = v7;
    a4->var24 = a3->var24;
  }
  if ((v7 & 0x80000000) == 0 && (*((_DWORD *)a3 + 40) & 0x80000000) != 0)
  {
    unint64_t v27 = HIDWORD(v7);
    v7 |= 0x80000000uLL;
    *((unsigned char *)a4 + 164) = v27;
    *((_DWORD *)a4 + 40) = v7;
    a4->var25 = a3->var25;
  }
  if ((v7 & 0x100000000) == 0
    && ((*((unsigned int *)a3 + 40) | ((unint64_t)*((unsigned __int8 *)a3 + 164) << 32)) & 0x100000000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7;
    *((unsigned char *)a4 + 164) = (v7 | 0x100000000) >> 32;
    objc_storeStrong(&a4->var26, a3->var26);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x200000000) == 0
    && ((*((unsigned int *)a3 + 40) | ((unint64_t)*((unsigned __int8 *)a3 + 164) << 32)) & 0x200000000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7;
    *((unsigned char *)a4 + 164) = (v7 | 0x200000000) >> 32;
    objc_storeStrong(&a4->var27, a3->var27);
    unint64_t v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x400000000) == 0
    && ((*((unsigned int *)a3 + 40) | ((unint64_t)*((unsigned __int8 *)a3 + 164) << 32)) & 0x400000000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7;
    *((unsigned char *)a4 + 164) = (v7 | 0x400000000) >> 32;
    id var28 = a3->var28;
    objc_storeStrong(&a4->var28, var28);
  }
}

- (id)mutableDiagonalUpBorder
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_diagonalUpBorder = &self->mTrackedProperties.diagonalUpBorder;
    diagonalUpBorder = self->mTrackedProperties.diagonalUpBorder;
    if (!diagonalUpBorder)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x20u;
      uint64_t v6 = objc_alloc_init(WDBorder);
      unint64_t v7 = *p_diagonalUpBorder;
      *p_diagonalUpBorder = v6;

      diagonalUpBorder = *p_diagonalUpBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      id v2 = 0;
      goto LABEL_10;
    }
    p_diagonalUpBorder = &self->mOriginalProperties.diagonalUpBorder;
    diagonalUpBorder = self->mOriginalProperties.diagonalUpBorder;
    if (!diagonalUpBorder)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  id v2 = diagonalUpBorder;
LABEL_10:
  return v2;
}

- (id)mutableDiagonalDownBorder
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    p_diagonalDownBorder = &self->mTrackedProperties.diagonalDownBorder;
    diagonalDownBorder = self->mTrackedProperties.diagonalDownBorder;
    if (!diagonalDownBorder)
    {
      uint64_t v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x40u;
      uint64_t v6 = objc_alloc_init(WDBorder);
      unint64_t v7 = *p_diagonalDownBorder;
      *p_diagonalDownBorder = v6;

      diagonalDownBorder = *p_diagonalDownBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0)
    {
      id v2 = 0;
      goto LABEL_10;
    }
    p_diagonalDownBorder = &self->mOriginalProperties.diagonalDownBorder;
    diagonalDownBorder = self->mOriginalProperties.diagonalDownBorder;
    if (!diagonalDownBorder)
    {
      uint64_t v5 = 176;
      goto LABEL_8;
    }
  }
  id v2 = diagonalDownBorder;
LABEL_10:
  return v2;
}

- (signed)position
{
  return self->mPosition;
}

- (int)resolveMode
{
  unsigned int v2 = *((unsigned __int8 *)self + 12);
  if ((v2 & 2) != 0) {
    int v3 = 1;
  }
  else {
    int v3 = (v2 >> 1) & 2;
  }
  if (v2) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)originalToTracked
{
}

- (void)clearShading
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((unsigned int *)&self->mTrackedProperties + 40);
    unint64_t v3 = v2 | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32);
    if (v2)
    {
      uint64_t v4 = (char *)&self->mTrackedProperties + 160;
      uint64_t v5 = 184;
LABEL_8:
      v4[4] = BYTE4(v3);
      *(_DWORD *)uint64_t v4 = v3 & 0xFFFFFFFE;
      uint64_t v6 = *(Class *)((char *)&self->super.isa + v5);
      *(Class *)((char *)&self->super.isa + v5) = 0;

      return;
    }
  }
  if (*((unsigned char *)self + 12))
  {
    uint64_t v4 = (char *)&self->mOriginalProperties + 160;
    unint64_t v3 = *((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                 + 164) << 32);
    if (*((_DWORD *)&self->mOriginalProperties + 40))
    {
      uint64_t v5 = 16;
      goto LABEL_8;
    }
  }
}

- (id)diagonalUpBorder
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x20) != 0)
  {
    uint64_t v3 = 224;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 56;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isDiagonalUpBorderOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x20;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 5) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x20) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 5) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x20;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)diagonalDownBorder
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x40) != 0)
  {
    uint64_t v3 = 232;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 64;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isDiagonalDownBorderOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x40;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 6) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x40) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 6) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x40;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)insideHorizontalBorder
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x80) != 0)
  {
    uint64_t v3 = 240;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 72;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isInsideHorizontalBorderOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x80;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 7) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x80) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 7) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x80;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)insideVerticalBorder
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x100) != 0)
  {
    uint64_t v3 = 248;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x100) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 80;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isInsideVerticalBorderOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x100;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 8) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x100) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x100) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 8) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x100;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (signed)topMargin
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x400) != 0)
  {
    uint64_t v3 = 260;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((unsigned char *)self + 12) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x400) != 0)
  {
    uint64_t v3 = 92;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isTopMarginOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x400;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 10) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x400) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x400) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 10) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x400;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)topMarginType
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x800) != 0)
  {
    uint64_t v3 = 264;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x800) == 0) {
      return 1;
    }
    uint64_t v3 = 96;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isTopMarginTypeOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x800;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 11) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x800) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x800) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 11) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x800;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (signed)bottomMargin
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x1000) != 0)
  {
    uint64_t v3 = 268;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((unsigned char *)self + 12) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x1000) != 0)
  {
    uint64_t v3 = 100;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isBottomMarginOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x1000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 12) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x1000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x1000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 12) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x1000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)bottomMarginType
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x2000) != 0)
  {
    uint64_t v3 = 272;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x2000) == 0) {
      return 1;
    }
    uint64_t v3 = 104;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isBottomMarginTypeOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x2000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 13) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x2000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x2000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 13) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x2000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)leftMarginType
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000) != 0)
  {
    uint64_t v3 = 280;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x8000) == 0) {
      return 1;
    }
    uint64_t v3 = 112;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isLeftMarginTypeOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = (unsigned __int16)*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 15) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x8000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 15) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = (unsigned __int16)*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)rightMarginType
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x20000) != 0)
  {
    uint64_t v3 = 288;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20000) == 0) {
      return 1;
    }
    uint64_t v3 = 120;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isRightMarginTypeOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x20000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 17) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x20000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 17) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *(void *)&v4 & 0x20000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)textDirection
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x80000) != 0)
  {
    uint64_t v3 = 296;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80000) == 0) {
      return 1;
    }
    uint64_t v3 = 128;
  }
  return *((char *)&self->super.isa + v3);
}

- (BOOL)isTextDirectionOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x80000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 19) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x80000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 19) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *(void *)&v4 & 0x80000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)verticallyMergedCell
{
  if ((*((unsigned char *)self + 12) & 6) != 0
    && (uint64_t v2 = *((unsigned int *)&self->mTrackedProperties + 40), (v2 & 0x200000) != 0))
  {
    return ((v2 | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32)) >> 20) & 1;
  }
  else
  {
    LOBYTE(self) = (*((unsigned char *)self + 12) & 5) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x200000) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x100000) != 0;
  }
  return (char)self;
}

- (BOOL)isVerticallyMergedCellOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x200000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 21) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x200000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x200000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 21) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *(void *)&v4 & 0x200000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)firstInSetOfVerticallyMergedCells
{
  if ((*((unsigned char *)self + 12) & 6) != 0
    && (uint64_t v2 = *((unsigned int *)&self->mTrackedProperties + 40), (v2 & 0x800000) != 0))
  {
    return ((v2 | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32)) >> 22) & 1;
  }
  else
  {
    LOBYTE(self) = (*((unsigned char *)self + 12) & 5) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x800000) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x400000) != 0;
  }
  return (char)self;
}

- (BOOL)isFirstInSetOfVerticallyMergedCellsOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x800000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 23) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x800000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x800000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 23) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = *(void *)&v4 & 0x800000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)noWrap
{
  if ((*((unsigned char *)self + 12) & 6) != 0
    && (uint64_t v2 = *((unsigned int *)&self->mTrackedProperties + 40), (v2 & 0x2000000) != 0))
  {
    return ((v2 | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32)) >> 24) & 1;
  }
  else if ((*((unsigned char *)self + 12) & 5) != 0)
  {
    if ((*((_DWORD *)&self->mOriginalProperties + 40) & 0x2000000) != 0) {
      LOBYTE(self) = HIBYTE(*((_DWORD *)&self->mOriginalProperties + 40)) & 1;
    }
    else {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }
  return (char)self;
}

- (void)setNoWrap:(BOOL)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
  }
  int v4 = (char *)self + v3;
  unint64_t v5 = *(_DWORD *)v4 & 0xFCFFFFFF | ((unint64_t)v4[4] << 32);
  int v6 = 0x2000000;
  if (a3) {
    int v6 = 50331648;
  }
  *(_DWORD *)int v4 = v6 | *(_DWORD *)v4 & 0xFCFFFFFF;
  v4[4] = BYTE4(v5);
}

- (BOOL)isNoWrapOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x2000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 25) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x2000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x2000000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 25) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = v4 & 0x2000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)deleted
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x4000000) != 0)
  {
    uint64_t v3 = 300;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x4000000) == 0) {
      return 0;
    }
    uint64_t v3 = 132;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setDeleted:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 300;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 132;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x4000000u;
}

- (BOOL)isDeletedOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x4000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 26) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x4000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x4000000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 26) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = v4 & 0x4000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)edited
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000000) != 0)
  {
    uint64_t v3 = 304;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x8000000) == 0) {
      return 0;
    }
    uint64_t v3 = 136;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setEdited:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 304;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 136;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x8000000u;
}

- (BOOL)isEditedOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x8000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 27) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x8000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x8000000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 27) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = v4 & 0x8000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)formattingChanged
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x10000000) != 0)
  {
    uint64_t v3 = 308;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10000000) == 0) {
      return 0;
    }
    uint64_t v3 = 140;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setFormattingChanged:(int)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 308;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 140;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x10000000u;
}

- (BOOL)isFormattingChangedOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x10000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 28) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x10000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10000000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 28) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = v4 & 0x10000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (unsigned)indexToAuthorIDOfDeletion
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x20000000) != 0)
  {
    uint64_t v3 = 312;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20000000) == 0) {
      return 0;
    }
    uint64_t v3 = 144;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 312;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 144;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x20000000u;
}

- (BOOL)isIndexToAuthorIDOfDeletionOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x20000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 29) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x20000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20000000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 29) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = v4 & 0x20000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (unsigned)indexToAuthorIDOfEdit
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x40000000) != 0)
  {
    uint64_t v3 = 314;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40000000) == 0) {
      return 0;
    }
    uint64_t v3 = 146;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 314;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 146;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40000000u;
}

- (BOOL)isIndexToAuthorIDOfEditOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x40000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 30) & 1;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x40000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40000000) != 0) {
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 30) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = v4 & 0x40000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  if ((*((unsigned char *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x80000000) != 0)
  {
    uint64_t v3 = 316;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80000000) == 0) {
      return 0;
    }
    uint64_t v3 = 148;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v3 = 344;
    uint64_t v4 = 316;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      return;
    }
    uint64_t v3 = 176;
    uint64_t v4 = 148;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x80000000;
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x80000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return *((_DWORD *)&self->mOriginalProperties + 40) >> 31;
      }
      goto LABEL_10;
    }
    int v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x80000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80000000) != 0) {
        return *((_DWORD *)&self->mOriginalProperties + 40) >> 31;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v2 = v4 & 0x80000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)deletionDate
{
  if ((*((unsigned char *)self + 12) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32)) & 0x100000000) != 0)
  {
    uint64_t v3 = 320;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                   + 164) << 32)) & 0x100000000) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 152;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (void)setDeletionDate:(id)a3
{
  id v5 = a3;
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    id v8 = v5;
    uint64_t v6 = 344;
    uint64_t v7 = 320;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      goto LABEL_6;
    }
    id v8 = v5;
    uint64_t v6 = 176;
    uint64_t v7 = 152;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v7), a3);
  *((unsigned char *)&self->super.isa + v6 + 4) |= 1u;
  id v5 = v8;
LABEL_6:
}

- (BOOL)isDeletionDateOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    uint64_t v2 = (unint64_t)(*((unsigned char *)&self->mTrackedProperties + 164) & 1) << 32;
    return v2 != 0;
  }
  if ((*((unsigned char *)self + 12) & 4) != 0)
  {
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32);
    if ((v4 & 0x100000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                     + 164) << 32)) & 0x100000000) != 0)
      {
        return *((unsigned char *)&self->mOriginalProperties + 164) & 1;
      }
      return 0;
    }
    uint64_t v2 = v4 & 0x100000000;
    return v2 != 0;
  }
  if ((*((unsigned char *)self + 12) & 1) == 0) {
    return 0;
  }
  return *((unsigned char *)&self->mOriginalProperties + 164) & 1;
}

- (id)editDate
{
  if ((*((unsigned char *)self + 12) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32)) & 0x200000000) != 0)
  {
    uint64_t v3 = 328;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                   + 164) << 32)) & 0x200000000) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 160;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (void)setEditDate:(id)a3
{
  id v5 = a3;
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    id v8 = v5;
    uint64_t v6 = 344;
    uint64_t v7 = 328;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      goto LABEL_6;
    }
    id v8 = v5;
    uint64_t v6 = 176;
    uint64_t v7 = 160;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v7), a3);
  *((unsigned char *)&self->super.isa + v6 + 4) |= 2u;
  id v5 = v8;
LABEL_6:
}

- (BOOL)isEditDateOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32) & 0x200000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 164) >> 1) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32);
    if ((v4 & 0x200000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                     + 164) << 32)) & 0x200000000) != 0)
      {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 164) >> 1) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x200000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)formattingChangeDate
{
  if ((*((unsigned char *)self + 12) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32)) & 0x400000000) != 0)
  {
    uint64_t v3 = 336;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                   + 164) << 32)) & 0x400000000) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 168;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (void)setFormattingChangeDate:(id)a3
{
  id v5 = a3;
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    id v8 = v5;
    uint64_t v6 = 344;
    uint64_t v7 = 336;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 1) == 0) {
      goto LABEL_6;
    }
    id v8 = v5;
    uint64_t v6 = 176;
    uint64_t v7 = 168;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v7), a3);
  *((unsigned char *)&self->super.isa + v6 + 4) |= 4u;
  id v5 = v8;
LABEL_6:
}

- (BOOL)isFormattingChangeDateOverridden
{
  if ((*((unsigned char *)self + 12) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32) & 0x400000000;
  }
  else
  {
    if ((*((unsigned char *)self + 12) & 4) == 0)
    {
      if (*((unsigned char *)self + 12)) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 164) >> 2) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32);
    if ((v4 & 0x400000000) == 0)
    {
      if ((*((unsigned char *)self + 12) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                     + 164) << 32)) & 0x400000000) != 0)
      {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 164) >> 2) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x400000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [+[WDTableCellProperties allocWithZone:a3] init];
  id v5 = v4;
  if (v4)
  {
    v4->mWidth = self->mWidth;
    v4->mPosition = self->mPosition;
    int v6 = *((unsigned char *)v4 + 12) & 0xFE | *((unsigned char *)self + 12) & 1;
    *((unsigned char *)v4 + 12) = v6;
    unsigned int v7 = v6 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 12) >> 1) & 1));
    *((unsigned char *)v4 + 12) = v7;
    *((unsigned char *)v4 + 12) = v7 & 0xFB | *((unsigned char *)self + 12) & 4;
    WDTableCellPropertiesValues::operator=((uint64_t)&v4->mOriginalProperties, (uint64_t)&self->mOriginalProperties);
    WDTableCellPropertiesValues::operator=((uint64_t)&v5->mTrackedProperties, (uint64_t)&self->mTrackedProperties);
    id v8 = v5;
  }

  return v5;
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);

  shading = self->mOriginalProperties.shading;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDTableCellProperties;
  unint64_t v2 = [(WDTableCellProperties *)&v4 description];
  return v2;
}

@end