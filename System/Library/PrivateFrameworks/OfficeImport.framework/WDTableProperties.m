@interface WDTableProperties
- (BOOL)biDirectional;
- (BOOL)isAlignmentOverridden;
- (BOOL)isBaseStyleOverridden;
- (BOOL)isBiDirectionalOverridden;
- (BOOL)isBottomBorderOverridden;
- (BOOL)isBottomDistanceFromTextOverridden;
- (BOOL)isCellSpacingOverridden;
- (BOOL)isCellSpacingTypeOverridden;
- (BOOL)isDeletedOverridden;
- (BOOL)isDeletionDateOverridden;
- (BOOL)isEditDateOverridden;
- (BOOL)isEditedOverridden;
- (BOOL)isFormattingChangeDateOverridden;
- (BOOL)isFormattingChangedOverridden;
- (BOOL)isHorizontalAnchorOverridden;
- (BOOL)isHorizontalPositionOverridden;
- (BOOL)isIndentOverridden;
- (BOOL)isIndentTypeOverridden;
- (BOOL)isIndexToAuthorIDOfDeletionOverridden;
- (BOOL)isIndexToAuthorIDOfEditOverridden;
- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden;
- (BOOL)isInsideHorizontalBorderOverridden;
- (BOOL)isInsideVerticalBorderOverridden;
- (BOOL)isJustificationOverridden;
- (BOOL)isLeftBorderOverridden;
- (BOOL)isLeftDistanceFromTextOverridden;
- (BOOL)isLookOverridden;
- (BOOL)isRightBorderOverridden;
- (BOOL)isRightDistanceFromTextOverridden;
- (BOOL)isShadingOverridden;
- (BOOL)isTableFloating;
- (BOOL)isTopBorderOverridden;
- (BOOL)isTopDistanceFromTextOverridden;
- (BOOL)isVerticalAnchorOverridden;
- (BOOL)isVerticalPositionOverridden;
- (BOOL)isWidthOverridden;
- (BOOL)isWidthTypeOverridden;
- (WDDocument)document;
- (WDTableProperties)init;
- (WDTableProperties)initWithDocument:(id)a3;
- (id)baseStyle;
- (id)bottomBorder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deletionDate;
- (id)description;
- (id)editDate;
- (id)formattingChangeDate;
- (id)insideHorizontalBorder;
- (id)insideVerticalBorder;
- (id)leftBorder;
- (id)mutableBottomBorder;
- (id)mutableInsideHorizontalBorder;
- (id)mutableInsideVerticalBorder;
- (id)mutableLeftBorder;
- (id)mutableRightBorder;
- (id)mutableShading;
- (id)mutableTopBorder;
- (id)rightBorder;
- (id)shading;
- (id)topBorder;
- (int)alignment;
- (int)cellSpacingType;
- (int)deleted;
- (int)edited;
- (int)formattingChanged;
- (int)horizontalAnchor;
- (int)indentType;
- (int)justification;
- (int)resolveMode;
- (int)verticalAnchor;
- (int)widthType;
- (int64_t)bottomDistanceFromText;
- (int64_t)horizontalPosition;
- (int64_t)leftDistanceFromText;
- (int64_t)rightDistanceFromText;
- (int64_t)topDistanceFromText;
- (int64_t)verticalPosition;
- (int64_t)width;
- (signed)cellSpacing;
- (signed)indent;
- (unsigned)indexToAuthorIDOfDeletion;
- (unsigned)indexToAuthorIDOfEdit;
- (unsigned)indexToAuthorIDOfFormattingChange;
- (unsigned)look;
- (void)clearBottomBorder;
- (void)clearInsideHorizontalBorder;
- (void)clearInsideVerticalBorder;
- (void)clearLeftBorder;
- (void)clearRightBorder;
- (void)clearShading;
- (void)clearTopBorder;
- (void)moveOrignalToTracked;
- (void)setAlignment:(int)a3;
- (void)setBaseStyle:(id)a3;
- (void)setBiDirectional:(BOOL)a3;
- (void)setBottomDistanceFromText:(int64_t)a3;
- (void)setCellSpacing:(signed __int16)a3;
- (void)setCellSpacingType:(int)a3;
- (void)setDeleted:(int)a3;
- (void)setDeletionDate:(id)a3;
- (void)setEditDate:(id)a3;
- (void)setEdited:(int)a3;
- (void)setFormattingChangeDate:(id)a3;
- (void)setFormattingChanged:(int)a3;
- (void)setHorizontalAnchor:(int)a3;
- (void)setHorizontalPosition:(int64_t)a3;
- (void)setIndent:(signed __int16)a3;
- (void)setIndentType:(int)a3;
- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3;
- (void)setJustification:(int)a3;
- (void)setLeftDistanceFromText:(int64_t)a3;
- (void)setLook:(unsigned __int16)a3;
- (void)setResolveMode:(int)a3;
- (void)setRightDistanceFromText:(int64_t)a3;
- (void)setTopDistanceFromText:(int64_t)a3;
- (void)setVerticalAnchor:(int)a3;
- (void)setVerticalPosition:(int64_t)a3;
- (void)setWidth:(int64_t)a3;
- (void)setWidthType:(int)a3;
@end

@implementation WDTableProperties

- (WDTableProperties)initWithDocument:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDTableProperties;
  v5 = [(WDTableProperties *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    *((unsigned char *)v6 + 8) = *((unsigned char *)v6 + 8) & 0xF8 | 1;
    v7 = objc_alloc_init(WDTablePropertiesValues);
    mOriginalProperties = v6->mOriginalProperties;
    v6->mOriginalProperties = v7;

    v9 = objc_alloc_init(WDTablePropertiesValues);
    mTrackedProperties = v6->mTrackedProperties;
    v6->mTrackedProperties = v9;
  }
  return v6;
}

- (void)setResolveMode:(int)a3
{
  *((unsigned char *)self + 8) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((unsigned char *)self + 8) & 0xF8;
}

- (id)mutableTopBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    id v4 = [(WDTablePropertiesValues *)self->mTrackedProperties topBorder];

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      v3 = [(WDTablePropertiesValues *)mTrackedProperties topBorder];
      goto LABEL_10;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setTopBorderOverridden:1];
    mOriginalProperties = self->mTrackedProperties;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      v3 = 0;
      goto LABEL_10;
    }
    v7 = [(WDTablePropertiesValues *)self->mOriginalProperties topBorder];

    mTrackedProperties = self->mOriginalProperties;
    if (v7) {
      goto LABEL_7;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setTopBorderOverridden:1];
    mOriginalProperties = self->mOriginalProperties;
  }
  v3 = objc_alloc_init(WDBorder);
  [(WDTablePropertiesValues *)mOriginalProperties setTopBorder:v3];
LABEL_10:
  return v3;
}

- (id)mutableLeftBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    id v4 = [(WDTablePropertiesValues *)self->mTrackedProperties leftBorder];

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      v3 = [(WDTablePropertiesValues *)mTrackedProperties leftBorder];
      goto LABEL_10;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setLeftBorderOverridden:1];
    mOriginalProperties = self->mTrackedProperties;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      v3 = 0;
      goto LABEL_10;
    }
    v7 = [(WDTablePropertiesValues *)self->mOriginalProperties leftBorder];

    mTrackedProperties = self->mOriginalProperties;
    if (v7) {
      goto LABEL_7;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setLeftBorderOverridden:1];
    mOriginalProperties = self->mOriginalProperties;
  }
  v3 = objc_alloc_init(WDBorder);
  [(WDTablePropertiesValues *)mOriginalProperties setLeftBorder:v3];
LABEL_10:
  return v3;
}

- (id)mutableBottomBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    id v4 = [(WDTablePropertiesValues *)self->mTrackedProperties bottomBorder];

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      v3 = [(WDTablePropertiesValues *)mTrackedProperties bottomBorder];
      goto LABEL_10;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setBottomBorderOverridden:1];
    mOriginalProperties = self->mTrackedProperties;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      v3 = 0;
      goto LABEL_10;
    }
    v7 = [(WDTablePropertiesValues *)self->mOriginalProperties bottomBorder];

    mTrackedProperties = self->mOriginalProperties;
    if (v7) {
      goto LABEL_7;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setBottomBorderOverridden:1];
    mOriginalProperties = self->mOriginalProperties;
  }
  v3 = objc_alloc_init(WDBorder);
  [(WDTablePropertiesValues *)mOriginalProperties setBottomBorder:v3];
LABEL_10:
  return v3;
}

- (id)mutableRightBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    id v4 = [(WDTablePropertiesValues *)self->mTrackedProperties rightBorder];

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      v3 = [(WDTablePropertiesValues *)mTrackedProperties rightBorder];
      goto LABEL_10;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setRightBorderOverridden:1];
    mOriginalProperties = self->mTrackedProperties;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      v3 = 0;
      goto LABEL_10;
    }
    v7 = [(WDTablePropertiesValues *)self->mOriginalProperties rightBorder];

    mTrackedProperties = self->mOriginalProperties;
    if (v7) {
      goto LABEL_7;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setRightBorderOverridden:1];
    mOriginalProperties = self->mOriginalProperties;
  }
  v3 = objc_alloc_init(WDBorder);
  [(WDTablePropertiesValues *)mOriginalProperties setRightBorder:v3];
LABEL_10:
  return v3;
}

- (id)mutableInsideHorizontalBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    id v4 = [(WDTablePropertiesValues *)self->mTrackedProperties insideHorizontalBorder];

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      v3 = [(WDTablePropertiesValues *)mTrackedProperties insideHorizontalBorder];
      goto LABEL_10;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setInsideHorizontalBorderOverridden:1];
    mOriginalProperties = self->mTrackedProperties;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      v3 = 0;
      goto LABEL_10;
    }
    v7 = [(WDTablePropertiesValues *)self->mOriginalProperties insideHorizontalBorder];

    mTrackedProperties = self->mOriginalProperties;
    if (v7) {
      goto LABEL_7;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setInsideHorizontalBorderOverridden:1];
    mOriginalProperties = self->mOriginalProperties;
  }
  v3 = objc_alloc_init(WDBorder);
  [(WDTablePropertiesValues *)mOriginalProperties setInsideHorizontalBorder:v3];
LABEL_10:
  return v3;
}

- (id)mutableInsideVerticalBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    id v4 = [(WDTablePropertiesValues *)self->mTrackedProperties insideVerticalBorder];

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      v3 = [(WDTablePropertiesValues *)mTrackedProperties insideVerticalBorder];
      goto LABEL_10;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setInsideVerticalBorderOverridden:1];
    mOriginalProperties = self->mTrackedProperties;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      v3 = 0;
      goto LABEL_10;
    }
    v7 = [(WDTablePropertiesValues *)self->mOriginalProperties insideVerticalBorder];

    mTrackedProperties = self->mOriginalProperties;
    if (v7) {
      goto LABEL_7;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setInsideVerticalBorderOverridden:1];
    mOriginalProperties = self->mOriginalProperties;
  }
  v3 = objc_alloc_init(WDBorder);
  [(WDTablePropertiesValues *)mOriginalProperties setInsideVerticalBorder:v3];
LABEL_10:
  return v3;
}

- (void)setAlignment:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setAlignment:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setAlignmentOverridden:1];
}

- (void)clearShading
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties shadingOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0) {
    return;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties shadingOverridden]) {
    return;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  [(WDTablePropertiesValues *)*p_mTrackedProperties setShadingOverridden:0];
  v7 = *p_mTrackedProperties;
  [(WDTablePropertiesValues *)v7 setShading:0];
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (BOOL)isBaseStyleOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties baseStyleOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties baseStyleOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 baseStyleOverridden];
}

- (BOOL)isTableFloating
{
  if ([(WDTableProperties *)self isHorizontalAnchorOverridden]
    && [(WDTableProperties *)self horizontalAnchor]
    || [(WDTableProperties *)self isVerticalAnchorOverridden]
    && [(WDTableProperties *)self verticalAnchor] != 2
    || [(WDTableProperties *)self isHorizontalPositionOverridden]
    && [(WDTableProperties *)self horizontalPosition])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(WDTableProperties *)self isVerticalPositionOverridden];
    if (v3) {
      LOBYTE(v3) = [(WDTableProperties *)self verticalPosition] != 0;
    }
  }
  return v3;
}

- (BOOL)isHorizontalAnchorOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties horizontalAnchorOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties horizontalAnchorOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 horizontalAnchorOverridden];
}

- (BOOL)isVerticalAnchorOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties verticalAnchorOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties verticalAnchorOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 verticalAnchorOverridden];
}

- (BOOL)isHorizontalPositionOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties horizontalPositionOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties horizontalPositionOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 horizontalPositionOverridden];
}

- (BOOL)isVerticalPositionOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties verticalPositionOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties verticalPositionOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 verticalPositionOverridden];
}

- (BOOL)isTopBorderOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties topBorderOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties topBorderOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 topBorderOverridden];
}

- (id)topBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties topBorderOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties topBorder];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties topBorderOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (BOOL)isLeftBorderOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties leftBorderOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties leftBorderOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 leftBorderOverridden];
}

- (id)leftBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties leftBorderOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties leftBorder];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties leftBorderOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (BOOL)isBottomBorderOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties bottomBorderOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties bottomBorderOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 bottomBorderOverridden];
}

- (id)bottomBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties bottomBorderOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties bottomBorder];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties bottomBorderOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (BOOL)isRightBorderOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties rightBorderOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties rightBorderOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 rightBorderOverridden];
}

- (id)rightBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties rightBorderOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties rightBorder];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties rightBorderOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (BOOL)isInsideHorizontalBorderOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties insideHorizontalBorderOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties insideHorizontalBorderOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 insideHorizontalBorderOverridden];
}

- (id)insideHorizontalBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties insideHorizontalBorderOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties insideHorizontalBorder];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties insideHorizontalBorderOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (BOOL)isInsideVerticalBorderOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties insideVerticalBorderOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties insideVerticalBorderOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 insideVerticalBorderOverridden];
}

- (id)insideVerticalBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties insideVerticalBorderOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties insideVerticalBorder];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties insideVerticalBorderOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (int64_t)horizontalPosition
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties horizontalPositionOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties horizontalPositionOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 horizontalPosition];
}

- (int64_t)leftDistanceFromText
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties leftDistanceFromTextOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties leftDistanceFromTextOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 leftDistanceFromText];
}

- (void)setWidth:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setWidth:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setWidthOverridden:1];
}

- (void)setWidthType:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setWidthType:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setWidthTypeOverridden:1];
}

- (void)setIndent:(signed __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setIndent:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setIndentOverridden:1];
}

- (void)setIndentType:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setIndentType:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setIndentTypeOverridden:1];
}

- (void)setBaseStyle:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    [(WDTablePropertiesValues *)mTrackedProperties setBaseStyle:v4];
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      goto LABEL_6;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    [(WDTablePropertiesValues *)mOriginalProperties setBaseStyle:v4];
  }
  [(WDTablePropertiesValues *)*p_mTrackedProperties setBaseStyleOverridden:1];
LABEL_6:
}

- (void)setJustification:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setJustification:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setJustificationOverridden:1];
}

- (id)baseStyle
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties baseStyleOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties baseStyle];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties baseStyleOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (void)setCellSpacing:(signed __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setCellSpacing:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setCellSpacingOverridden:1];
}

- (void)setVerticalAnchor:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setVerticalAnchor:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setVerticalAnchorOverridden:1];
}

- (void)setHorizontalAnchor:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setHorizontalAnchor:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setHorizontalAnchorOverridden:1];
}

- (void)setVerticalPosition:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setVerticalPosition:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setVerticalPositionOverridden:1];
}

- (void)setLeftDistanceFromText:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setLeftDistanceFromText:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setLeftDistanceFromTextOverridden:1];
}

- (void)setRightDistanceFromText:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setRightDistanceFromText:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setRightDistanceFromTextOverridden:1];
}

- (int)horizontalAnchor
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties horizontalAnchorOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 2;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties horizontalAnchorOverridden]) {
    return 2;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 horizontalAnchor];
}

- (int64_t)verticalPosition
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties verticalPositionOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties verticalPositionOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 verticalPosition];
}

- (int)verticalAnchor
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties verticalAnchorOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 1;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties verticalAnchorOverridden]) {
    return 1;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 verticalAnchor];
}

- (id)mutableShading
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = [(WDTablePropertiesValues *)self->mTrackedProperties shading];

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      char v3 = [(WDTablePropertiesValues *)mTrackedProperties shading];
      goto LABEL_10;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setShadingOverridden:1];
    mOriginalProperties = self->mTrackedProperties;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      char v3 = 0;
      goto LABEL_10;
    }
    v7 = [(WDTablePropertiesValues *)self->mOriginalProperties shading];

    mTrackedProperties = self->mOriginalProperties;
    if (v7) {
      goto LABEL_7;
    }
    [(WDTablePropertiesValues *)mTrackedProperties setShadingOverridden:1];
    mOriginalProperties = self->mOriginalProperties;
  }
  char v3 = objc_alloc_init(WDShading);
  [(WDTablePropertiesValues *)mOriginalProperties setShading:v3];
LABEL_10:
  return v3;
}

- (void)setCellSpacingType:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setCellSpacingType:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setCellSpacingTypeOverridden:1];
}

- (void)setHorizontalPosition:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setHorizontalPosition:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setHorizontalPositionOverridden:1];
}

- (void)setBottomDistanceFromText:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setBottomDistanceFromText:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setBottomDistanceFromTextOverridden:1];
}

- (WDTableProperties)init
{
  return 0;
}

- (int)resolveMode
{
  unsigned int v2 = *((unsigned __int8 *)self + 8);
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

- (unsigned)look
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties lookOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties lookOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 look];
}

- (void)setLook:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setLook:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setLookOverridden:1];
}

- (BOOL)isLookOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties lookOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0 || ![(WDTablePropertiesValues *)self->mOriginalProperties lookOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 lookOverridden];
}

- (id)shading
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties shadingOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties shading];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties shadingOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (BOOL)isShadingOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties shadingOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0 || ![(WDTablePropertiesValues *)self->mOriginalProperties shadingOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 shadingOverridden];
}

- (void)clearTopBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties topBorderOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0) {
    return;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties topBorderOverridden]) {
    return;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  [(WDTablePropertiesValues *)*p_mTrackedProperties setTopBorderOverridden:0];
  v7 = *p_mTrackedProperties;
  [(WDTablePropertiesValues *)v7 setTopBorder:0];
}

- (void)clearLeftBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties leftBorderOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0) {
    return;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties leftBorderOverridden]) {
    return;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  [(WDTablePropertiesValues *)*p_mTrackedProperties setLeftBorderOverridden:0];
  v7 = *p_mTrackedProperties;
  [(WDTablePropertiesValues *)v7 setLeftBorder:0];
}

- (void)clearBottomBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties bottomBorderOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0) {
    return;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties bottomBorderOverridden]) {
    return;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  [(WDTablePropertiesValues *)*p_mTrackedProperties setBottomBorderOverridden:0];
  v7 = *p_mTrackedProperties;
  [(WDTablePropertiesValues *)v7 setBottomBorder:0];
}

- (void)clearRightBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties rightBorderOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0) {
    return;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties rightBorderOverridden]) {
    return;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  [(WDTablePropertiesValues *)*p_mTrackedProperties setRightBorderOverridden:0];
  v7 = *p_mTrackedProperties;
  [(WDTablePropertiesValues *)v7 setRightBorder:0];
}

- (void)clearInsideHorizontalBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties insideHorizontalBorderOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0) {
    return;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties insideHorizontalBorderOverridden])return; {
  p_mTrackedProperties = p_mOriginalProperties;
  }
LABEL_7:
  [(WDTablePropertiesValues *)*p_mTrackedProperties setInsideHorizontalBorderOverridden:0];
  v7 = *p_mTrackedProperties;
  [(WDTablePropertiesValues *)v7 setInsideHorizontalBorder:0];
}

- (void)clearInsideVerticalBorder
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties insideVerticalBorderOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0) {
    return;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties insideVerticalBorderOverridden]) {
    return;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  [(WDTablePropertiesValues *)*p_mTrackedProperties setInsideVerticalBorderOverridden:0];
  v7 = *p_mTrackedProperties;
  [(WDTablePropertiesValues *)v7 setInsideVerticalBorder:0];
}

- (int)justification
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties justificationOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties justificationOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 justification];
}

- (BOOL)isJustificationOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties justificationOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties justificationOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 justificationOverridden];
}

- (int)alignment
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties alignmentOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties alignmentOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 alignment];
}

- (BOOL)isAlignmentOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties alignmentOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties alignmentOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 alignmentOverridden];
}

- (int64_t)width
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties widthOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties widthOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 width];
}

- (BOOL)isWidthOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties widthOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0 || ![(WDTablePropertiesValues *)self->mOriginalProperties widthOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 widthOverridden];
}

- (int)widthType
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties widthTypeOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 1;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties widthTypeOverridden]) {
    return 1;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 widthType];
}

- (BOOL)isWidthTypeOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties widthTypeOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties widthTypeOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 widthTypeOverridden];
}

- (signed)indent
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indentOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties indentOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 indent];
}

- (BOOL)isIndentOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indentOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0 || ![(WDTablePropertiesValues *)self->mOriginalProperties indentOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 indentOverridden];
}

- (int)indentType
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indentTypeOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 1;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties indentTypeOverridden]) {
    return 1;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 indentType];
}

- (BOOL)isIndentTypeOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indentTypeOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties indentTypeOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 indentTypeOverridden];
}

- (signed)cellSpacing
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties cellSpacingOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties cellSpacingOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 cellSpacing];
}

- (BOOL)isCellSpacingOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties cellSpacingOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties cellSpacingOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 cellSpacingOverridden];
}

- (int)cellSpacingType
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties cellSpacingTypeOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 1;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties cellSpacingTypeOverridden]) {
    return 1;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 cellSpacingType];
}

- (BOOL)isCellSpacingTypeOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties cellSpacingTypeOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties cellSpacingTypeOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 cellSpacingTypeOverridden];
}

- (BOOL)isLeftDistanceFromTextOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties leftDistanceFromTextOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties leftDistanceFromTextOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 leftDistanceFromTextOverridden];
}

- (int64_t)topDistanceFromText
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties topDistanceFromTextOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties topDistanceFromTextOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 topDistanceFromText];
}

- (void)setTopDistanceFromText:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setTopDistanceFromText:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setTopDistanceFromTextOverridden:1];
}

- (BOOL)isTopDistanceFromTextOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties topDistanceFromTextOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties topDistanceFromTextOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 topDistanceFromTextOverridden];
}

- (int64_t)rightDistanceFromText
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties rightDistanceFromTextOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties rightDistanceFromTextOverridden])return 0; {
  p_mTrackedProperties = p_mOriginalProperties;
  }
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 rightDistanceFromText];
}

- (BOOL)isRightDistanceFromTextOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties rightDistanceFromTextOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties rightDistanceFromTextOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 rightDistanceFromTextOverridden];
}

- (int64_t)bottomDistanceFromText
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties bottomDistanceFromTextOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties bottomDistanceFromTextOverridden])return 0; {
  p_mTrackedProperties = p_mOriginalProperties;
  }
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 bottomDistanceFromText];
}

- (BOOL)isBottomDistanceFromTextOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties bottomDistanceFromTextOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties bottomDistanceFromTextOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 bottomDistanceFromTextOverridden];
}

- (int)deleted
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties deletedOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties deletedOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 deleted];
}

- (void)setDeleted:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setDeleted:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setDeletedOverridden:1];
}

- (BOOL)isDeletedOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties deletedOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0 || ![(WDTablePropertiesValues *)self->mOriginalProperties deletedOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 deletedOverridden];
}

- (int)edited
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties editedOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties editedOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 edited];
}

- (void)setEdited:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setEdited:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setEditedOverridden:1];
}

- (BOOL)isEditedOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties editedOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0 || ![(WDTablePropertiesValues *)self->mOriginalProperties editedOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 editedOverridden];
}

- (int)formattingChanged
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties formattingChangedOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties formattingChangedOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 formattingChanged];
}

- (void)setFormattingChanged:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setFormattingChanged:*(void *)&a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setFormattingChangedOverridden:1];
}

- (BOOL)isFormattingChangedOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties formattingChangedOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties formattingChangedOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 formattingChangedOverridden];
}

- (BOOL)biDirectional
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties biDirectionalOverridden]) {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties biDirectionalOverridden]) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 biDirectional];
}

- (void)setBiDirectional:(BOOL)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setBiDirectional:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setBiDirectionalOverridden:1];
}

- (BOOL)isBiDirectionalOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties biDirectionalOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties biDirectionalOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 biDirectionalOverridden];
}

- (unsigned)indexToAuthorIDOfDeletion
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indexToAuthorIDOfDeletionOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties indexToAuthorIDOfDeletionOverridden])return 0; {
  p_mTrackedProperties = p_mOriginalProperties;
  }
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 indexToAuthorIDOfDeletion];
}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setIndexToAuthorIDOfDeletion:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setIndexToAuthorIDOfDeletionOverridden:1];
}

- (BOOL)isIndexToAuthorIDOfDeletionOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indexToAuthorIDOfDeletionOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties indexToAuthorIDOfDeletionOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 indexToAuthorIDOfDeletionOverridden];
}

- (unsigned)indexToAuthorIDOfEdit
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indexToAuthorIDOfEditOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties indexToAuthorIDOfEditOverridden])return 0; {
  p_mTrackedProperties = p_mOriginalProperties;
  }
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 indexToAuthorIDOfEdit];
}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setIndexToAuthorIDOfEdit:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setIndexToAuthorIDOfEditOverridden:1];
}

- (BOOL)isIndexToAuthorIDOfEditOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indexToAuthorIDOfEditOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties indexToAuthorIDOfEditOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 indexToAuthorIDOfEditOverridden];
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indexToAuthorIDOfFormattingChangeOverridden])
    {
      goto LABEL_7;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  if (![(WDTablePropertiesValues *)mOriginalProperties indexToAuthorIDOfFormattingChangeOverridden])return 0; {
  p_mTrackedProperties = p_mOriginalProperties;
  }
LABEL_7:
  v7 = *p_mTrackedProperties;
  return [(WDTablePropertiesValues *)v7 indexToAuthorIDOfFormattingChange];
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v4 = 16;
  }
  [*(id *)((char *)&self->super.isa + v4) setIndexToAuthorIDOfFormattingChange:a3];
  v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 setIndexToAuthorIDOfFormattingChangeOverridden:1];
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties indexToAuthorIDOfFormattingChangeOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties indexToAuthorIDOfFormattingChangeOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 indexToAuthorIDOfFormattingChangeOverridden];
}

- (id)deletionDate
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties deletionDateOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties deletionDate];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties deletionDateOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (void)setDeletionDate:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    [(WDTablePropertiesValues *)mTrackedProperties setDeletionDate:v4];
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      goto LABEL_6;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    [(WDTablePropertiesValues *)mOriginalProperties setDeletionDate:v4];
  }
  [(WDTablePropertiesValues *)*p_mTrackedProperties setDeletionDateOverridden:1];
LABEL_6:
}

- (BOOL)isDeletionDateOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties deletionDateOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties deletionDateOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 deletionDateOverridden];
}

- (id)editDate
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties editDateOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties editDate];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties editDateOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (void)setEditDate:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    [(WDTablePropertiesValues *)mTrackedProperties setEditDate:v4];
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      goto LABEL_6;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    [(WDTablePropertiesValues *)mOriginalProperties setEditDate:v4];
  }
  [(WDTablePropertiesValues *)*p_mTrackedProperties setEditDateOverridden:1];
LABEL_6:
}

- (BOOL)isEditDateOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties editDateOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0 || ![(WDTablePropertiesValues *)self->mOriginalProperties editDateOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 editDateOverridden];
}

- (id)formattingChangeDate
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if ([(WDTablePropertiesValues *)self->mTrackedProperties formattingChangeDateOverridden])
    {
LABEL_7:
      v7 = [(WDTablePropertiesValues *)*p_mTrackedProperties formattingChangeDate];
      goto LABEL_9;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if ([(WDTablePropertiesValues *)mOriginalProperties formattingChangeDateOverridden])
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_9:
  return v7;
}

- (void)setFormattingChangeDate:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    [(WDTablePropertiesValues *)mTrackedProperties setFormattingChangeDate:v4];
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      goto LABEL_6;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    [(WDTablePropertiesValues *)mOriginalProperties setFormattingChangeDate:v4];
  }
  [(WDTablePropertiesValues *)*p_mTrackedProperties setFormattingChangeDateOverridden:1];
LABEL_6:
}

- (BOOL)isFormattingChangeDateOverridden
{
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 2) != 0) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    if ([(WDTablePropertiesValues *)self->mTrackedProperties formattingChangeDateOverridden])
    {
LABEL_4:
      uint64_t v4 = 24;
      goto LABEL_10;
    }
    char v3 = *((unsigned char *)self + 8);
  }
  if ((v3 & 1) == 0
    && ((v3 & 4) == 0
     || ![(WDTablePropertiesValues *)self->mOriginalProperties formattingChangeDateOverridden]))
  {
    return 0;
  }
  uint64_t v4 = 16;
LABEL_10:
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 formattingChangeDateOverridden];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[WDTableProperties allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  uint64_t v6 = [(WDTableProperties *)v4 initWithDocument:WeakRetained];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)(v6 + 32), v7);

    int v8 = *(unsigned char *)(v6 + 8) & 0xFE | *((unsigned char *)self + 8) & 1;
    *(unsigned char *)(v6 + 8) = v8;
    unsigned int v9 = v8 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 8) >> 1) & 1));
    *(unsigned char *)(v6 + 8) = v9;
    *(unsigned char *)(v6 + 8) = v9 & 0xFB | *((unsigned char *)self + 8) & 4;
    objc_storeStrong((id *)(v6 + 16), self->mOriginalProperties);
    objc_storeStrong((id *)(v6 + 24), self->mTrackedProperties);
    id v10 = (id)v6;
  }

  return (id)v6;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDTableProperties;
  unsigned int v2 = [(WDTableProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mTrackedProperties, 0);
  objc_storeStrong((id *)&self->mOriginalProperties, 0);
}

- (void)moveOrignalToTracked
{
  char v3 = (WDTablePropertiesValues *)[(WDTablePropertiesValues *)self->mOriginalProperties copy];
  mTrackedProperties = self->mTrackedProperties;
  self->mTrackedProperties = v3;

  v5 = objc_alloc_init(WDTablePropertiesValues);
  mOriginalProperties = self->mOriginalProperties;
  self->mOriginalProperties = v5;
}

@end