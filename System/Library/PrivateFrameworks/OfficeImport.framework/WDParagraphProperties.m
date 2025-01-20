@interface WDParagraphProperties
- ($06D0163FE0D7AFE752A9F21F38483579)dropCap;
- ($373952EDE9DECE7FE473A72CF4B2C093)tabStopAddedAt:(unint64_t)a3;
- (BOOL)anchorLock;
- (BOOL)biDi;
- (BOOL)contextualSpacing;
- (BOOL)hasTabStopAddedAtPosition:(signed __int16)a3;
- (BOOL)hasTabStopDeletedAtPosition:(signed __int16)a3;
- (BOOL)isAnchorLockOverridden;
- (BOOL)isAnythingOverridden;
- (BOOL)isAnythingOverriddenIn:(id)a3;
- (BOOL)isBarBorderOverridden;
- (BOOL)isBaseStyleOverridden;
- (BOOL)isBetweenBorderOverridden;
- (BOOL)isBiDiOverridden;
- (BOOL)isBottomBorderOverridden;
- (BOOL)isCharacterPropertiesOverridden;
- (BOOL)isContextualSpacingOverridden;
- (BOOL)isDropCapOverridden;
- (BOOL)isFirstLineIndentCharsOverridden;
- (BOOL)isFirstLineIndentOverridden;
- (BOOL)isFollowingIndentOverridden;
- (BOOL)isFormattingChangedOverridden;
- (BOOL)isHeightOverridden;
- (BOOL)isHeightRuleOverridden;
- (BOOL)isHorizontalAnchorOverridden;
- (BOOL)isHorizontalPositionOverridden;
- (BOOL)isHorizontalSpaceOverridden;
- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden;
- (BOOL)isJustificationOverridden;
- (BOOL)isKeepLinesTogetherOverridden;
- (BOOL)isKeepNextParagraphTogetherOverridden;
- (BOOL)isKinsokuOffOverridden;
- (BOOL)isLeadingIndentOverridden;
- (BOOL)isLeftBorderOverridden;
- (BOOL)isLeftIndentCharsOverridden;
- (BOOL)isLeftIndentOverridden;
- (BOOL)isLineSpacingOverridden;
- (BOOL)isLineSpacingRuleOverridden;
- (BOOL)isListIndexOverridden;
- (BOOL)isListLevelOverridden;
- (BOOL)isOutlineLevelOverridden;
- (BOOL)isPageBreakBefore;
- (BOOL)isPageBreakBeforeOverridden;
- (BOOL)isPhysicalJustificationOverridden;
- (BOOL)isRightBorderOverridden;
- (BOOL)isRightIndentCharsOverridden;
- (BOOL)isRightIndentOverridden;
- (BOOL)isShadingOverridden;
- (BOOL)isSpaceAfterAutoOverridden;
- (BOOL)isSpaceAfterOverridden;
- (BOOL)isSpaceBeforeAutoOverridden;
- (BOOL)isSpaceBeforeOverridden;
- (BOOL)isSuppressAutoHyphensOverridden;
- (BOOL)isSuppressLineNumbersOverridden;
- (BOOL)isTopBorderOverridden;
- (BOOL)isVerticalAnchorOverridden;
- (BOOL)isVerticalPositionOverridden;
- (BOOL)isVerticalSpaceOverridden;
- (BOOL)isWidowControlOverridden;
- (BOOL)isWidthOverridden;
- (BOOL)isWrapCodeOverridden;
- (BOOL)isWrapOverridden;
- (BOOL)keepLinesTogether;
- (BOOL)keepNextParagraphTogether;
- (BOOL)kinsokuOff;
- (BOOL)spaceAfterAuto;
- (BOOL)spaceBeforeAuto;
- (BOOL)suppressAutoHyphens;
- (BOOL)suppressLineNumbers;
- (BOOL)widowControl;
- (BOOL)wrap;
- (WDDocument)document;
- (WDParagraphProperties)initWithDocument:(id)a3;
- (char)wrapCode;
- (id)barBorder;
- (id)baseStyle;
- (id)betweenBorder;
- (id)bottomBorder;
- (id)characterProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)leftBorder;
- (id)mutableBarBorder;
- (id)mutableBetweenBorder;
- (id)mutableBottomBorder;
- (id)mutableCharacterProperties;
- (id)mutableLeftBorder;
- (id)mutableRightBorder;
- (id)mutableShading;
- (id)mutableTopBorder;
- (id)rightBorder;
- (id)shading;
- (id)topBorder;
- (int)formattingChanged;
- (int)heightRule;
- (int)horizontalAnchor;
- (int)justification;
- (int)lineSpacingRule;
- (int)physicalJustification;
- (int)resolveMode;
- (int)verticalAnchor;
- (int64_t)height;
- (int64_t)horizontalPosition;
- (int64_t)horizontalSpace;
- (int64_t)verticalPosition;
- (int64_t)verticalSpace;
- (int64_t)width;
- (signed)firstLineIndent;
- (signed)firstLineIndentChars;
- (signed)followingIndent;
- (signed)leadingIndent;
- (signed)leftIndent;
- (signed)leftIndentChars;
- (signed)lineSpacing;
- (signed)rightIndent;
- (signed)rightIndentChars;
- (signed)tabStopDeletedPositionAt:(unint64_t)a3;
- (unint64_t)listIndex;
- (unint64_t)tabStopAddedCount;
- (unint64_t)tabStopDeletedPositionCount;
- (unsigned)indexToAuthorIDOfFormattingChange;
- (unsigned)listLevel;
- (unsigned)outlineLevel;
- (unsigned)spaceAfter;
- (unsigned)spaceBefore;
- (void)addTabStopAdded:(id *)a3;
- (void)addTabStopDeletedPosition:(signed __int16)a3;
- (void)clearBaseStyle;
- (void)clearChararacterProperties;
- (void)clearFirstLineIndent;
- (void)clearFollowingIndent;
- (void)clearLeadingIndent;
- (void)clearLeftIndent;
- (void)clearRightIndent;
- (void)copyPropertiesInto:(id)a3;
- (void)negateFormattingChangesWithDefaults:(id)a3;
- (void)removeTabStopAddedWithPosition:(signed __int16)a3;
- (void)removeTabStopDeletedPosition:(signed __int16)a3;
- (void)setAnchorLock:(BOOL)a3;
- (void)setBaseStyle:(id)a3;
- (void)setBiDi:(BOOL)a3;
- (void)setCharacterProperties:(id)a3;
- (void)setContextualSpacing:(BOOL)a3;
- (void)setDropCap:(id)a3;
- (void)setFirstLineIndent:(signed __int16)a3;
- (void)setFirstLineIndentChars:(signed __int16)a3;
- (void)setFollowingIndent:(signed __int16)a3;
- (void)setFormattingChanged:(int)a3;
- (void)setHeight:(int64_t)a3;
- (void)setHeightRule:(int)a3;
- (void)setHorizontalAnchor:(int)a3;
- (void)setHorizontalPosition:(int64_t)a3;
- (void)setHorizontalSpace:(int64_t)a3;
- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3;
- (void)setJustification:(int)a3;
- (void)setKeepLinesTogether:(BOOL)a3;
- (void)setKeepNextParagraphTogether:(BOOL)a3;
- (void)setKinsokuOff:(BOOL)a3;
- (void)setLeadingIndent:(signed __int16)a3;
- (void)setLeftIndent:(signed __int16)a3;
- (void)setLeftIndentChars:(signed __int16)a3;
- (void)setLineSpacing:(signed __int16)a3;
- (void)setLineSpacingRule:(int)a3;
- (void)setListIndex:(unint64_t)a3;
- (void)setListLevel:(unsigned __int8)a3;
- (void)setOutlineLevel:(unsigned __int16)a3;
- (void)setPageBreakBefore:(BOOL)a3;
- (void)setPhysicalJustification:(int)a3;
- (void)setResolveMode:(int)a3;
- (void)setRightIndent:(signed __int16)a3;
- (void)setRightIndentChars:(signed __int16)a3;
- (void)setSpaceAfter:(unsigned __int16)a3;
- (void)setSpaceAfterAuto:(BOOL)a3;
- (void)setSpaceBefore:(unsigned __int16)a3;
- (void)setSpaceBeforeAuto:(BOOL)a3;
- (void)setSuppressAutoHyphens:(BOOL)a3;
- (void)setSuppressLineNumbers:(BOOL)a3;
- (void)setTabStopAddedCount:(unint64_t)a3;
- (void)setTabStopDeletedPositionCount:(unint64_t)a3;
- (void)setVerticalAnchor:(int)a3;
- (void)setVerticalPosition:(int64_t)a3;
- (void)setVerticalSpace:(int64_t)a3;
- (void)setWidowControl:(BOOL)a3;
- (void)setWidth:(int64_t)a3;
- (void)setWrap:(BOOL)a3;
- (void)setWrapCode:(char)a3;
@end

@implementation WDParagraphProperties

- (WDParagraphProperties)initWithDocument:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDParagraphProperties;
  v5 = [(WDParagraphProperties *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    *((unsigned char *)v6 + 17) = *((unsigned char *)v6 + 17) & 0xF8 | 1;
    mCharacterProperties = v6->mCharacterProperties;
    v6->mCharacterProperties = 0;

    mOriginalProperties = v6->mOriginalProperties;
    v6->mOriginalProperties = 0;

    mTrackedProperties = v6->mTrackedProperties;
    v6->mTrackedProperties = 0;
  }
  return v6;
}

- (void)setResolveMode:(int)a3
{
  *((unsigned char *)self + 17) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((unsigned char *)self + 17) & 0xF8;
  -[WDCharacterProperties setResolveMode:](self->mCharacterProperties, "setResolveMode:");
}

- (void)setPageBreakBefore:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setPageBreakBefore:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setPageBreakBeforeOverridden:1];
}

- (void)setListLevel:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setListLevel:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setListLevelOverridden:1];
}

- (void)setListIndex:(unint64_t)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setListIndex:a3];
  id v12 = *p_mOriginalProperties;
  [v12 setListIndexOverridden:1];
}

- (void)setDropCap:(id)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setDropCap:*(unsigned __int16 *)&a3];
  id v12 = *p_mOriginalProperties;
  [v12 setDropCapOverridden:1];
}

- (void)setWidth:(int64_t)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setWidth:a3];
  id v12 = *p_mOriginalProperties;
  [v12 setWidthOverridden:1];
}

- (void)setHeight:(int64_t)a3
{
  unsigned __int16 v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setHeight:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setHeightOverridden:1];
}

- (void)setHeightRule:(int)a3
{
  unsigned __int8 v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setHeightRule:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setHeightRuleOverridden:1];
}

- (void)setVerticalSpace:(int64_t)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setVerticalSpace:a3];
  id v12 = *p_mOriginalProperties;
  [v12 setVerticalSpaceOverridden:1];
}

- (void)setHorizontalSpace:(int64_t)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setHorizontalSpace:a3];
  id v12 = *p_mOriginalProperties;
  [v12 setHorizontalSpaceOverridden:1];
}

- (void)setWrap:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setWrap:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setWrapOverridden:1];
}

- (void)setHorizontalAnchor:(int)a3
{
  unsigned __int8 v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setHorizontalAnchor:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setHorizontalAnchorOverridden:1];
}

- (void)setVerticalAnchor:(int)a3
{
  unsigned __int8 v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setVerticalAnchor:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setVerticalAnchorOverridden:1];
}

- (void)setHorizontalPosition:(int64_t)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setHorizontalPosition:a3];
  id v12 = *p_mOriginalProperties;
  [v12 setHorizontalPositionOverridden:1];
}

- (void)setVerticalPosition:(int64_t)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setVerticalPosition:a3];
  id v12 = *p_mOriginalProperties;
  [v12 setVerticalPositionOverridden:1];
}

- (void)setAnchorLock:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setAnchorLock:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setAnchorLockOverridden:1];
}

- (id)mutableTopBorder
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties) {
        goto LABEL_13;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopAddedTable:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopDeletedTable:v15];

      mTrackedProperties = self->mTrackedProperties;
    }
    BOOL v16 = [(WDParagraphPropertiesValues *)mTrackedProperties topBorderOverridden];
    id v9 = self->mTrackedProperties;
    if (!v16)
    {
      [(WDParagraphPropertiesValues *)v9 setTopBorderOverridden:1];
      id v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
LABEL_12:
    v17 = [(WDParagraphPropertiesValues *)v9 topBorder];
    goto LABEL_16;
  }
  if ((*((unsigned char *)self + 17) & 1) == 0) {
    goto LABEL_13;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties) {
    goto LABEL_6;
  }
  id v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopAddedTable:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopDeletedTable:v7];

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  BOOL v8 = [(WDParagraphPropertiesValues *)mOriginalProperties topBorderOverridden];
  id v9 = self->mOriginalProperties;
  if (v8) {
    goto LABEL_12;
  }
  [(WDParagraphPropertiesValues *)v9 setTopBorderOverridden:1];
  id v10 = self->mOriginalProperties;
LABEL_15:
  v17 = objc_alloc_init(WDBorder);
  [(WDParagraphPropertiesValues *)v10 setTopBorder:v17];
LABEL_16:
  return v17;
}

- (id)mutableLeftBorder
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties) {
        goto LABEL_13;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopAddedTable:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopDeletedTable:v15];

      mTrackedProperties = self->mTrackedProperties;
    }
    BOOL v16 = [(WDParagraphPropertiesValues *)mTrackedProperties leftBorderOverridden];
    id v9 = self->mTrackedProperties;
    if (!v16)
    {
      [(WDParagraphPropertiesValues *)v9 setLeftBorderOverridden:1];
      id v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
LABEL_12:
    v17 = [(WDParagraphPropertiesValues *)v9 leftBorder];
    goto LABEL_16;
  }
  if ((*((unsigned char *)self + 17) & 1) == 0) {
    goto LABEL_13;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties) {
    goto LABEL_6;
  }
  id v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopAddedTable:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopDeletedTable:v7];

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  BOOL v8 = [(WDParagraphPropertiesValues *)mOriginalProperties leftBorderOverridden];
  id v9 = self->mOriginalProperties;
  if (v8) {
    goto LABEL_12;
  }
  [(WDParagraphPropertiesValues *)v9 setLeftBorderOverridden:1];
  id v10 = self->mOriginalProperties;
LABEL_15:
  v17 = objc_alloc_init(WDBorder);
  [(WDParagraphPropertiesValues *)v10 setLeftBorder:v17];
LABEL_16:
  return v17;
}

- (id)mutableBottomBorder
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties) {
        goto LABEL_13;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopAddedTable:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopDeletedTable:v15];

      mTrackedProperties = self->mTrackedProperties;
    }
    BOOL v16 = [(WDParagraphPropertiesValues *)mTrackedProperties bottomBorderOverridden];
    id v9 = self->mTrackedProperties;
    if (!v16)
    {
      [(WDParagraphPropertiesValues *)v9 setBottomBorderOverridden:1];
      id v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
LABEL_12:
    v17 = [(WDParagraphPropertiesValues *)v9 bottomBorder];
    goto LABEL_16;
  }
  if ((*((unsigned char *)self + 17) & 1) == 0) {
    goto LABEL_13;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties) {
    goto LABEL_6;
  }
  id v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopAddedTable:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopDeletedTable:v7];

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  BOOL v8 = [(WDParagraphPropertiesValues *)mOriginalProperties bottomBorderOverridden];
  id v9 = self->mOriginalProperties;
  if (v8) {
    goto LABEL_12;
  }
  [(WDParagraphPropertiesValues *)v9 setBottomBorderOverridden:1];
  id v10 = self->mOriginalProperties;
LABEL_15:
  v17 = objc_alloc_init(WDBorder);
  [(WDParagraphPropertiesValues *)v10 setBottomBorder:v17];
LABEL_16:
  return v17;
}

- (id)mutableRightBorder
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties) {
        goto LABEL_13;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopAddedTable:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopDeletedTable:v15];

      mTrackedProperties = self->mTrackedProperties;
    }
    BOOL v16 = [(WDParagraphPropertiesValues *)mTrackedProperties rightBorder];

    id v9 = self->mTrackedProperties;
    if (!v16)
    {
      [(WDParagraphPropertiesValues *)v9 setRightBorderOverridden:1];
      id v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
LABEL_12:
    v17 = [(WDParagraphPropertiesValues *)v9 rightBorder];
    goto LABEL_16;
  }
  if ((*((unsigned char *)self + 17) & 1) == 0) {
    goto LABEL_13;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties) {
    goto LABEL_6;
  }
  id v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopAddedTable:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopDeletedTable:v7];

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  BOOL v8 = [(WDParagraphPropertiesValues *)mOriginalProperties rightBorder];

  id v9 = self->mOriginalProperties;
  if (v8) {
    goto LABEL_12;
  }
  [(WDParagraphPropertiesValues *)v9 setRightBorderOverridden:1];
  id v10 = self->mOriginalProperties;
LABEL_15:
  v17 = objc_alloc_init(WDBorder);
  [(WDParagraphPropertiesValues *)v10 setRightBorder:v17];
LABEL_16:
  return v17;
}

- (id)mutableBetweenBorder
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties) {
        goto LABEL_13;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopAddedTable:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopDeletedTable:v15];

      mTrackedProperties = self->mTrackedProperties;
    }
    BOOL v16 = [(WDParagraphPropertiesValues *)mTrackedProperties betweenBorder];

    id v9 = self->mTrackedProperties;
    if (!v16)
    {
      [(WDParagraphPropertiesValues *)v9 setBetweenBorderOverridden:1];
      id v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
LABEL_12:
    v17 = [(WDParagraphPropertiesValues *)v9 betweenBorder];
    goto LABEL_16;
  }
  if ((*((unsigned char *)self + 17) & 1) == 0) {
    goto LABEL_13;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties) {
    goto LABEL_6;
  }
  id v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopAddedTable:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopDeletedTable:v7];

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  BOOL v8 = [(WDParagraphPropertiesValues *)mOriginalProperties betweenBorder];

  id v9 = self->mOriginalProperties;
  if (v8) {
    goto LABEL_12;
  }
  [(WDParagraphPropertiesValues *)v9 setBetweenBorderOverridden:1];
  id v10 = self->mOriginalProperties;
LABEL_15:
  v17 = objc_alloc_init(WDBorder);
  [(WDParagraphPropertiesValues *)v10 setBetweenBorder:v17];
LABEL_16:
  return v17;
}

- (id)mutableBarBorder
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties) {
        goto LABEL_13;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopAddedTable:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopDeletedTable:v15];

      mTrackedProperties = self->mTrackedProperties;
    }
    BOOL v16 = [(WDParagraphPropertiesValues *)mTrackedProperties barBorderOverridden];
    id v9 = self->mTrackedProperties;
    if (!v16)
    {
      [(WDParagraphPropertiesValues *)v9 setBarBorderOverridden:1];
      id v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
LABEL_12:
    v17 = [(WDParagraphPropertiesValues *)v9 barBorder];
    goto LABEL_16;
  }
  if ((*((unsigned char *)self + 17) & 1) == 0) {
    goto LABEL_13;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties) {
    goto LABEL_6;
  }
  id v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopAddedTable:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopDeletedTable:v7];

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  BOOL v8 = [(WDParagraphPropertiesValues *)mOriginalProperties barBorderOverridden];
  id v9 = self->mOriginalProperties;
  if (v8) {
    goto LABEL_12;
  }
  [(WDParagraphPropertiesValues *)v9 setBarBorderOverridden:1];
  id v10 = self->mOriginalProperties;
LABEL_15:
  v17 = objc_alloc_init(WDBorder);
  [(WDParagraphPropertiesValues *)v10 setBarBorder:v17];
LABEL_16:
  return v17;
}

- (id)mutableShading
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties) {
        goto LABEL_13;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopAddedTable:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF990]);
      [(WDParagraphPropertiesValues *)self->mTrackedProperties setTabStopDeletedTable:v15];

      mTrackedProperties = self->mTrackedProperties;
    }
    BOOL v16 = [(WDParagraphPropertiesValues *)mTrackedProperties shading];

    id v9 = self->mTrackedProperties;
    if (!v16)
    {
      [(WDParagraphPropertiesValues *)v9 setShadingOverridden:1];
      id v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
LABEL_12:
    v17 = [(WDParagraphPropertiesValues *)v9 shading];
    goto LABEL_16;
  }
  if ((*((unsigned char *)self + 17) & 1) == 0) {
    goto LABEL_13;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties) {
    goto LABEL_6;
  }
  id v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopAddedTable:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(WDParagraphPropertiesValues *)self->mOriginalProperties setTabStopDeletedTable:v7];

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  BOOL v8 = [(WDParagraphPropertiesValues *)mOriginalProperties shading];

  id v9 = self->mOriginalProperties;
  if (v8) {
    goto LABEL_12;
  }
  [(WDParagraphPropertiesValues *)v9 setShadingOverridden:1];
  id v10 = self->mOriginalProperties;
LABEL_15:
  v17 = objc_alloc_init(WDShading);
  [(WDParagraphPropertiesValues *)v10 setShading:v17];
LABEL_16:
  return v17;
}

- (void)setSpaceBefore:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setSpaceBefore:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setSpaceBeforeOverridden:1];
}

- (void)setSpaceBeforeAuto:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setSpaceBeforeAuto:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setSpaceBeforeAutoOverridden:1];
}

- (void)setSpaceAfter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setSpaceAfter:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setSpaceAfterOverridden:1];
}

- (void)setSpaceAfterAuto:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setSpaceAfterAuto:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setSpaceAfterAutoOverridden:1];
}

- (void)setLineSpacing:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setLineSpacing:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setLineSpacingOverridden:1];
}

- (void)setLineSpacingRule:(int)a3
{
  unsigned __int8 v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setLineSpacingRule:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setLineSpacingRuleOverridden:1];
}

- (void)setLeftIndent:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setLeftIndent:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setLeftIndentOverridden:1];
}

- (void)setRightIndent:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setRightIndent:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setRightIndentOverridden:1];
}

- (void)setFirstLineIndent:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setFirstLineIndent:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setFirstLineIndentOverridden:1];
}

- (void)setJustification:(int)a3
{
  unsigned __int8 v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setJustification:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setJustificationOverridden:1];
}

- (void)setSuppressLineNumbers:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setSuppressLineNumbers:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setSuppressLineNumbersOverridden:1];
}

- (void)setSuppressAutoHyphens:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setSuppressAutoHyphens:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setSuppressAutoHyphensOverridden:1];
}

- (void)setWidowControl:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    BOOL v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setWidowControl:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setWidowControlOverridden:1];
}

- (void)setBaseStyle:(id)a3
{
  id v16 = a3;
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    id v4 = mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v12 = objc_alloc_init(WDParagraphPropertiesValues);
      id v13 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v12;

      if (!*p_mTrackedProperties) {
        goto LABEL_11;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopAddedTable:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopDeletedTable:v15];

      id v4 = *p_mTrackedProperties;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      goto LABEL_11;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    id v4 = mOriginalProperties;
    if (!mOriginalProperties)
    {
      id v7 = objc_alloc_init(WDParagraphPropertiesValues);
      id v8 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v7;

      if (!*p_mTrackedProperties) {
        goto LABEL_11;
      }
      id v9 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopAddedTable:v9];

      id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopDeletedTable:v10];

      id v4 = *p_mTrackedProperties;
    }
  }
  [v4 setBaseStyle:v16];
  [*p_mTrackedProperties setBaseStyleOverridden:1];
LABEL_11:
}

- (void)clearBaseStyle
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) != 0) {
    goto LABEL_5;
  }
  if ((*((unsigned char *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties baseStyleOverridden])
      {
LABEL_5:
        uint64_t v5 = 32;
        goto LABEL_12;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 1) == 0)
  {
    if ((v3 & 4) == 0) {
      return;
    }
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties
      || ![(WDParagraphPropertiesValues *)mOriginalProperties baseStyleOverridden])
    {
      return;
    }
  }
  uint64_t v5 = 24;
LABEL_12:
  [*(id *)((char *)&self->super.isa + v5) setBaseStyleOverridden:0];
  id v7 = *(Class *)((char *)&self->super.isa + v5);
  [v7 setBaseStyle:0];
}

- (void)setOutlineLevel:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setOutlineLevel:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setOutlineLevelOverridden:1];
}

- (void)setKeepNextParagraphTogether:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setKeepNextParagraphTogether:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setKeepNextParagraphTogetherOverridden:1];
}

- (void)addTabStopAdded:(id *)a3
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v10 = objc_alloc_init(WDParagraphPropertiesValues);
      id v11 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v10;

      if (!*p_mTrackedProperties) {
        return;
      }
      id v12 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopAddedTable:v12];

      id v13 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopDeletedTable:v13];

      mTrackedProperties = (WDParagraphPropertiesValues *)*p_mTrackedProperties;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
      id v6 = objc_alloc_init(WDParagraphPropertiesValues);
      id v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      if (!*p_mTrackedProperties) {
        return;
      }
      id v8 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopAddedTable:v8];

      id v9 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopDeletedTable:v9];

      mTrackedProperties = (WDParagraphPropertiesValues *)*p_mTrackedProperties;
    }
  }
  id v14 = [(WDParagraphPropertiesValues *)mTrackedProperties tabStopAddedTable];
  [v14 appendBytes:a3 length:4];

  objc_msgSend(*p_mTrackedProperties, "setTabStopAddedCount:", objc_msgSend(*p_mTrackedProperties, "tabStopAddedCount") + 1);
  id v15 = *p_mTrackedProperties;
  [v15 setTabStopAddedCountOverridden:1];
}

- (void)setTabStopAddedCount:(unint64_t)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setTabStopAddedCount:a3];
  id v12 = *p_mOriginalProperties;
  [v12 setTabStopAddedCountOverridden:1];
}

- (void)setTabStopDeletedPositionCount:(unint64_t)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setTabStopDeletedCount:a3];
  id v12 = *p_mOriginalProperties;
  [v12 setTabStopDeletedCountOverridden:1];
}

- (void)setCharacterProperties:(id)a3
{
  self->mCharacterPropertiesOverridden = 1;
}

- (void)addTabStopDeletedPosition:(signed __int16)a3
{
  signed __int16 v14 = a3;
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      id v9 = objc_alloc_init(WDParagraphPropertiesValues);
      id v10 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v9;

      if (!*p_mTrackedProperties) {
        return;
      }
      id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopAddedTable:v11];

      id v12 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopDeletedTable:v12];

      mTrackedProperties = (WDParagraphPropertiesValues *)*p_mTrackedProperties;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
      uint64_t v5 = objc_alloc_init(WDParagraphPropertiesValues);
      id v6 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v5;

      if (!*p_mTrackedProperties) {
        return;
      }
      id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopAddedTable:v7];

      id v8 = objc_alloc_init(MEMORY[0x263EFF990]);
      [*p_mTrackedProperties setTabStopDeletedTable:v8];

      mTrackedProperties = (WDParagraphPropertiesValues *)*p_mTrackedProperties;
    }
  }
  id v13 = [(WDParagraphPropertiesValues *)mTrackedProperties tabStopDeletedTable];
  [v13 appendBytes:&v14 length:2];

  objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedCount:", objc_msgSend(*p_mTrackedProperties, "tabStopDeletedCount") + 1);
  [*p_mTrackedProperties setTabStopDeletedCountOverridden:1];
}

- (BOOL)isHorizontalAnchorOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties horizontalAnchorOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties horizontalAnchorOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 horizontalAnchorOverridden];
}

- (BOOL)isVerticalAnchorOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties verticalAnchorOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties verticalAnchorOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 verticalAnchorOverridden];
}

- (BOOL)isHorizontalPositionOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties horizontalPositionOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties horizontalPositionOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 horizontalPositionOverridden];
}

- (BOOL)isVerticalPositionOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties verticalPositionOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties verticalPositionOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 verticalPositionOverridden];
}

- (BOOL)isBaseStyleOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties baseStyleOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties baseStyleOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 baseStyleOverridden];
}

- (id)baseStyle
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties baseStyleOverridden])
      {
LABEL_8:
        id v6 = [(WDParagraphPropertiesValues *)*p_mTrackedProperties baseStyle];
        goto LABEL_10;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    id v6 = mOriginalProperties;
    if (!mOriginalProperties) {
      goto LABEL_10;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if ([v6 baseStyleOverridden]) {
      goto LABEL_8;
    }
  }
  id v6 = 0;
LABEL_10:
  return v6;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (BOOL)isSpaceAfterOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties spaceAfterOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties spaceAfterOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 spaceAfterOverridden];
}

- (BOOL)isSpaceBeforeOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties spaceBeforeOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties spaceBeforeOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 spaceBeforeOverridden];
}

- (BOOL)isLineSpacingOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) != 0)
  {
LABEL_5:
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties
      && [(WDParagraphPropertiesValues *)mTrackedProperties lineSpacingOverridden]
      && [(WDParagraphPropertiesValues *)self->mTrackedProperties lineSpacing])
    {
      LOBYTE(v6) = 1;
      return (char)v6;
    }
LABEL_18:
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  if ((*((unsigned char *)self + 17) & 4) != 0)
  {
    id v4 = self->mTrackedProperties;
    if (v4)
    {
      if ([(WDParagraphPropertiesValues *)v4 lineSpacingOverridden]) {
        goto LABEL_5;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 1) == 0)
  {
    if ((v3 & 4) == 0) {
      goto LABEL_18;
    }
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties
      || ![(WDParagraphPropertiesValues *)mOriginalProperties lineSpacingOverridden])
    {
      goto LABEL_18;
    }
  }
  id v6 = self->mOriginalProperties;
  if (v6)
  {
    LOBYTE(v6) = [(WDParagraphPropertiesValues *)v6 lineSpacingOverridden];
  }
  return (char)v6;
}

- (BOOL)isJustificationOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties justificationOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties justificationOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 justificationOverridden];
}

- (BOOL)isLeftIndentOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties leftIndentOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties leftIndentOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 leftIndentOverridden];
}

- (BOOL)isRightIndentOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties rightIndentOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties rightIndentOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 rightIndentOverridden];
}

- (BOOL)isFirstLineIndentOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties firstLineIndentOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties firstLineIndentOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 firstLineIndentOverridden];
}

- (BOOL)isListIndexOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties listIndexOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties listIndexOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 listIndexOverridden];
}

- (BOOL)isListLevelOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties listLevelOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties listLevelOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 listLevelOverridden];
}

- (BOOL)isBottomBorderOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties bottomBorderOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties bottomBorderOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 bottomBorderOverridden];
}

- (BOOL)isShadingOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties shadingOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties shadingOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 shadingOverridden];
}

- (int)justification
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties justificationOverridden])
      {
LABEL_8:
        LODWORD(v6) = [(WDParagraphPropertiesValues *)*p_mTrackedProperties justification];
        return (int)v6;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
    LODWORD(v6) = 0;
    return (int)v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    LODWORD(v6) = [(WDParagraphPropertiesValues *)v6 justificationOverridden];
    p_mTrackedProperties = p_mOriginalProperties;
    if (v6) {
      goto LABEL_8;
    }
  }
  return (int)v6;
}

- (signed)leftIndent
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties leftIndentOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 leftIndentOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 leftIndent];
}

- (signed)firstLineIndent
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties firstLineIndentOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 firstLineIndentOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 firstLineIndent];
}

- (unint64_t)listIndex
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties listIndexOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 listIndexOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 listIndex];
}

- (unsigned)listLevel
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties listLevelOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 listLevelOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 listLevel];
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (BOOL)isCharacterPropertiesOverridden
{
  return self->mCharacterPropertiesOverridden;
}

- (unsigned)spaceBefore
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties spaceBeforeOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 spaceBeforeOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 spaceBefore];
}

- (signed)lineSpacing
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties lineSpacingOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 lineSpacingOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 lineSpacing];
}

- (unsigned)spaceAfter
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties spaceAfterOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 spaceAfterOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 spaceAfter];
}

- (void)setWrapCode:(char)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setWrapCode:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setWrapCodeOverridden:1];
}

- (int)horizontalAnchor
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties horizontalAnchorOverridden]) {
        return [(WDParagraphPropertiesValues *)*p_mTrackedProperties horizontalAnchor];
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    id v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if ([(WDParagraphPropertiesValues *)v6 horizontalAnchorOverridden]) {
        return [(WDParagraphPropertiesValues *)*p_mTrackedProperties horizontalAnchor];
      }
    }
  }
  return 2;
}

- (BOOL)isWidthOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties widthOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties widthOverridden])
      {
        return 0;
      }
    }
    uint64_t v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 widthOverridden];
}

- (id)bottomBorder
{
  if ((*((unsigned char *)self + 17) & 4) == 0
    || (char v3 = self->mTrackedProperties) == 0
    || [(WDParagraphPropertiesValues *)v3 bottomBorderOverridden]
    || (id v4 = self->mOriginalProperties) == 0
    || ![(WDParagraphPropertiesValues *)v4 bottomBorderOverridden])
  {
    char v5 = *((unsigned char *)self + 17);
    if ((v5 & 6) != 0)
    {
      p_mTrackedProperties = &self->mTrackedProperties;
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties bottomBorderOverridden])
        {
LABEL_13:
          id v8 = [(WDParagraphPropertiesValues *)*p_mTrackedProperties bottomBorder];
          goto LABEL_15;
        }
        char v5 = *((unsigned char *)self + 17);
      }
    }
    if ((v5 & 5) != 0)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mOriginalProperties = &self->mOriginalProperties;
      id v8 = mOriginalProperties;
      if (!mOriginalProperties) {
        goto LABEL_15;
      }
      p_mTrackedProperties = p_mOriginalProperties;
      if ([v8 bottomBorderOverridden]) {
        goto LABEL_13;
      }
    }
  }
  id v8 = 0;
LABEL_15:
  return v8;
}

- (id)shading
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties shadingOverridden])
      {
LABEL_8:
        id v6 = [(WDParagraphPropertiesValues *)*p_mTrackedProperties shading];
        goto LABEL_10;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    id v6 = mOriginalProperties;
    if (!mOriginalProperties) {
      goto LABEL_10;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if ([v6 shadingOverridden]) {
      goto LABEL_8;
    }
  }
  id v6 = 0;
LABEL_10:
  return v6;
}

- (signed)rightIndent
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties rightIndentOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 rightIndentOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 rightIndent];
}

- (void)setKeepLinesTogether:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setKeepLinesTogether:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setKeepLinesTogetherOverridden:1];
}

- (BOOL)isLineSpacingRuleOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties lineSpacingRuleOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties lineSpacingRuleOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 lineSpacingRuleOverridden];
}

- (int)lineSpacingRule
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties lineSpacingRuleOverridden])
      {
LABEL_8:
        LODWORD(v6) = [(WDParagraphPropertiesValues *)*p_mTrackedProperties lineSpacingRule];
        return (int)v6;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
    LODWORD(v6) = 0;
    return (int)v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    LODWORD(v6) = [(WDParagraphPropertiesValues *)v6 lineSpacingRuleOverridden];
    p_mTrackedProperties = p_mOriginalProperties;
    if (v6) {
      goto LABEL_8;
    }
  }
  return (int)v6;
}

- (int)resolveMode
{
  unsigned int v2 = *((unsigned __int8 *)self + 17);
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

- (id)mutableCharacterProperties
{
  mCharacterProperties = self->mCharacterProperties;
  if (!mCharacterProperties)
  {
    id v4 = [WDCharacterProperties alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    id v6 = [(WDCharacterProperties *)v4 initWithDocument:WeakRetained];
    id v7 = self->mCharacterProperties;
    self->mCharacterProperties = v6;

    self->mCharacterPropertiesOverridden = 1;
    mCharacterProperties = self->mCharacterProperties;
  }
  return mCharacterProperties;
}

- (int)verticalAnchor
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties verticalAnchorOverridden]) {
        return [(WDParagraphPropertiesValues *)*p_mTrackedProperties verticalAnchor];
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    id v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if ([(WDParagraphPropertiesValues *)v6 verticalAnchorOverridden]) {
        return [(WDParagraphPropertiesValues *)*p_mTrackedProperties verticalAnchor];
      }
    }
  }
  return 1;
}

- (int64_t)horizontalPosition
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties horizontalPositionOverridden])
      {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 horizontalPositionOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 horizontalPosition];
}

- (int64_t)width
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties widthOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 widthOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 width];
}

- (int64_t)verticalPosition
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties verticalPositionOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 verticalPositionOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 verticalPosition];
}

- (void)setFormattingChanged:(int)a3
{
  unsigned __int8 v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setFormattingChanged:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setFormattingChangedOverridden:1];
}

- (void)clearChararacterProperties
{
  mCharacterProperties = self->mCharacterProperties;
  self->mCharacterProperties = 0;

  self->mCharacterPropertiesOverridden = 0;
}

- (BOOL)isAnythingOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 5) != 0)
  {
    if ([(WDParagraphProperties *)self isAnythingOverriddenIn:self->mOriginalProperties]
      || [(WDCharacterProperties *)self->mCharacterProperties isAnythingOverridden])
    {
      return 1;
    }
    char v3 = *((unsigned char *)self + 17);
  }
  return (v3 & 6) != 0
      && ([(WDParagraphProperties *)self isAnythingOverriddenIn:self->mTrackedProperties]
       || [(WDCharacterProperties *)self->mCharacterProperties isAnythingOverridden]);
}

- (void)negateFormattingChangesWithDefaults:(id)a3
{
  id v166 = a3;
  uint64_t v4 = [(WDParagraphProperties *)self resolveMode];
  [(WDParagraphProperties *)self setResolveMode:2];
  if ([(WDParagraphProperties *)self isFormattingChangedOverridden]
    && [(WDParagraphProperties *)self formattingChanged])
  {
    [(WDParagraphProperties *)self setResolveMode:1];
    [v166 setResolveMode:2];
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      if ([(WDParagraphPropertiesValues *)mOriginalProperties pageBreakBeforeOverridden])
      {
        mTrackedProperties = self->mTrackedProperties;
        if (!mTrackedProperties
          || ![(WDParagraphPropertiesValues *)mTrackedProperties pageBreakBeforeOverridden])
        {
          if ([v166 isPageBreakBeforeOverridden]) {
            uint64_t v7 = [v166 isPageBreakBefore];
          }
          else {
            uint64_t v7 = 0;
          }
          [(WDParagraphProperties *)self setPageBreakBefore:v7];
        }
      }
      id v8 = self->mOriginalProperties;
      if (v8)
      {
        if ([(WDParagraphPropertiesValues *)v8 listLevelOverridden])
        {
          id v9 = self->mTrackedProperties;
          if (!v9 || ![(WDParagraphPropertiesValues *)v9 listLevelOverridden])
          {
            if ([v166 isListLevelOverridden]) {
              uint64_t v10 = [v166 listLevel];
            }
            else {
              uint64_t v10 = 0;
            }
            [(WDParagraphProperties *)self setListLevel:v10];
          }
        }
        id v11 = self->mOriginalProperties;
        if (v11)
        {
          if ([(WDParagraphPropertiesValues *)v11 listIndexOverridden])
          {
            id v12 = self->mTrackedProperties;
            if (!v12 || ![(WDParagraphPropertiesValues *)v12 listIndexOverridden])
            {
              if ([v166 isListIndexOverridden]) {
                uint64_t v13 = [v166 listIndex];
              }
              else {
                uint64_t v13 = -1;
              }
              [(WDParagraphProperties *)self setListIndex:v13];
            }
          }
          signed __int16 v14 = self->mOriginalProperties;
          if (v14)
          {
            if ([(WDParagraphPropertiesValues *)v14 widthOverridden])
            {
              id v15 = self->mTrackedProperties;
              if (!v15 || ![(WDParagraphPropertiesValues *)v15 widthOverridden])
              {
                if ([v166 isWidthOverridden]) {
                  uint64_t v16 = [v166 width];
                }
                else {
                  uint64_t v16 = 0;
                }
                [(WDParagraphProperties *)self setWidth:v16];
              }
            }
            v17 = self->mOriginalProperties;
            if (v17)
            {
              if ([(WDParagraphPropertiesValues *)v17 heightOverridden])
              {
                v18 = self->mTrackedProperties;
                if (!v18 || ![(WDParagraphPropertiesValues *)v18 heightOverridden])
                {
                  if ([v166 isHeightOverridden]) {
                    uint64_t v19 = [v166 height];
                  }
                  else {
                    uint64_t v19 = 0;
                  }
                  [(WDParagraphProperties *)self setHeight:v19];
                }
              }
              v20 = self->mOriginalProperties;
              if (v20)
              {
                if ([(WDParagraphPropertiesValues *)v20 heightRuleOverridden])
                {
                  v21 = self->mTrackedProperties;
                  if (!v21 || ![(WDParagraphPropertiesValues *)v21 heightRuleOverridden])
                  {
                    if ([v166 isHeightRuleOverridden]) {
                      uint64_t v22 = [v166 heightRule];
                    }
                    else {
                      uint64_t v22 = 1;
                    }
                    [(WDParagraphProperties *)self setHeightRule:v22];
                  }
                }
                v23 = self->mOriginalProperties;
                if (v23)
                {
                  if ([(WDParagraphPropertiesValues *)v23 verticalSpaceOverridden])
                  {
                    v24 = self->mTrackedProperties;
                    if (!v24 || ![(WDParagraphPropertiesValues *)v24 verticalSpaceOverridden])
                    {
                      if ([v166 isVerticalSpaceOverridden]) {
                        uint64_t v25 = [v166 verticalSpace];
                      }
                      else {
                        uint64_t v25 = 0;
                      }
                      [(WDParagraphProperties *)self setVerticalSpace:v25];
                    }
                  }
                  v26 = self->mOriginalProperties;
                  if (v26)
                  {
                    if ([(WDParagraphPropertiesValues *)v26 horizontalSpaceOverridden])
                    {
                      v27 = self->mTrackedProperties;
                      if (!v27
                        || ![(WDParagraphPropertiesValues *)v27 horizontalSpaceOverridden])
                      {
                        if ([v166 isHorizontalSpaceOverridden]) {
                          uint64_t v28 = [v166 horizontalSpace];
                        }
                        else {
                          uint64_t v28 = 0;
                        }
                        [(WDParagraphProperties *)self setHorizontalSpace:v28];
                      }
                    }
                    v29 = self->mOriginalProperties;
                    if (v29)
                    {
                      if ([(WDParagraphPropertiesValues *)v29 wrapOverridden])
                      {
                        v30 = self->mTrackedProperties;
                        if (!v30 || ![(WDParagraphPropertiesValues *)v30 wrapOverridden])
                        {
                          if ([v166 isWrapOverridden]) {
                            uint64_t v31 = [v166 wrap];
                          }
                          else {
                            uint64_t v31 = 0;
                          }
                          [(WDParagraphProperties *)self setWrap:v31];
                        }
                      }
                      v32 = self->mOriginalProperties;
                      if (v32)
                      {
                        if ([(WDParagraphPropertiesValues *)v32 horizontalAnchorOverridden])
                        {
                          v33 = self->mTrackedProperties;
                          if (!v33
                            || ![(WDParagraphPropertiesValues *)v33 horizontalAnchorOverridden])
                          {
                            if ([v166 isHorizontalAnchorOverridden]) {
                              uint64_t v34 = [v166 horizontalAnchor];
                            }
                            else {
                              uint64_t v34 = 2;
                            }
                            [(WDParagraphProperties *)self setHorizontalAnchor:v34];
                          }
                        }
                        v35 = self->mOriginalProperties;
                        if (v35)
                        {
                          if ([(WDParagraphPropertiesValues *)v35 verticalAnchorOverridden])
                          {
                            v36 = self->mTrackedProperties;
                            if (!v36
                              || ![(WDParagraphPropertiesValues *)v36 verticalAnchorOverridden])
                            {
                              if ([v166 isVerticalAnchorOverridden]) {
                                uint64_t v37 = [v166 verticalAnchor];
                              }
                              else {
                                uint64_t v37 = 1;
                              }
                              [(WDParagraphProperties *)self setVerticalAnchor:v37];
                            }
                          }
                          v38 = self->mOriginalProperties;
                          if (v38)
                          {
                            if ([(WDParagraphPropertiesValues *)v38 horizontalPositionOverridden])
                            {
                              v39 = self->mTrackedProperties;
                              if (!v39
                                || ![(WDParagraphPropertiesValues *)v39 horizontalPositionOverridden])
                              {
                                if ([v166 isHorizontalPositionOverridden]) {
                                  uint64_t v40 = [v166 horizontalPosition];
                                }
                                else {
                                  uint64_t v40 = 0;
                                }
                                [(WDParagraphProperties *)self setHorizontalPosition:v40];
                              }
                            }
                            v41 = self->mOriginalProperties;
                            if (v41)
                            {
                              if ([(WDParagraphPropertiesValues *)v41 verticalPositionOverridden])
                              {
                                v42 = self->mTrackedProperties;
                                if (!v42
                                  || ![(WDParagraphPropertiesValues *)v42 verticalPositionOverridden])
                                {
                                  if ([v166 isVerticalPositionOverridden]) {
                                    uint64_t v43 = [v166 verticalPosition];
                                  }
                                  else {
                                    uint64_t v43 = 0;
                                  }
                                  [(WDParagraphProperties *)self setVerticalPosition:v43];
                                }
                              }
                              v44 = self->mOriginalProperties;
                              if (v44)
                              {
                                if ([(WDParagraphPropertiesValues *)v44 wrapCodeOverridden])
                                {
                                  v45 = self->mTrackedProperties;
                                  if (!v45
                                    || ![(WDParagraphPropertiesValues *)v45 wrapCodeOverridden])
                                  {
                                    if ([v166 isWrapCodeOverridden]) {
                                      uint64_t v46 = [v166 wrapCode];
                                    }
                                    else {
                                      uint64_t v46 = 0;
                                    }
                                    [(WDParagraphProperties *)self setWrapCode:v46];
                                  }
                                }
                                v47 = self->mOriginalProperties;
                                if (v47)
                                {
                                  if ([(WDParagraphPropertiesValues *)v47 anchorLockOverridden])
                                  {
                                    v48 = self->mTrackedProperties;
                                    if (!v48
                                      || ![(WDParagraphPropertiesValues *)v48 anchorLockOverridden])
                                    {
                                      if ([v166 isAnchorLockOverridden]) {
                                        uint64_t v49 = [v166 anchorLock];
                                      }
                                      else {
                                        uint64_t v49 = 0;
                                      }
                                      [(WDParagraphProperties *)self setAnchorLock:v49];
                                    }
                                  }
                                  v50 = self->mOriginalProperties;
                                  if (v50)
                                  {
                                    if ([(WDParagraphPropertiesValues *)v50 spaceBeforeOverridden])
                                    {
                                      v51 = self->mTrackedProperties;
                                      if (!v51
                                        || ![(WDParagraphPropertiesValues *)v51 spaceBeforeOverridden])
                                      {
                                        if ([v166 isSpaceBeforeOverridden]) {
                                          uint64_t v52 = [v166 spaceBefore];
                                        }
                                        else {
                                          uint64_t v52 = 0;
                                        }
                                        [(WDParagraphProperties *)self setSpaceBefore:v52];
                                      }
                                    }
                                    v53 = self->mOriginalProperties;
                                    if (v53)
                                    {
                                      if ([(WDParagraphPropertiesValues *)v53 spaceBeforeAutoOverridden])
                                      {
                                        v54 = self->mTrackedProperties;
                                        if (!v54
                                          || ![(WDParagraphPropertiesValues *)v54 spaceBeforeAutoOverridden])
                                        {
                                          if ([v166 isSpaceBeforeAutoOverridden]) {
                                            uint64_t v55 = [v166 spaceBeforeAuto];
                                          }
                                          else {
                                            uint64_t v55 = 0;
                                          }
                                          [(WDParagraphProperties *)self setSpaceBeforeAuto:v55];
                                        }
                                      }
                                      v56 = self->mOriginalProperties;
                                      if (v56)
                                      {
                                        if ([(WDParagraphPropertiesValues *)v56 spaceAfterOverridden])
                                        {
                                          v57 = self->mTrackedProperties;
                                          if (!v57
                                            || ![(WDParagraphPropertiesValues *)v57 spaceAfterOverridden])
                                          {
                                            if ([v166 isSpaceAfterOverridden]) {
                                              uint64_t v58 = [v166 spaceAfter];
                                            }
                                            else {
                                              uint64_t v58 = 0;
                                            }
                                            [(WDParagraphProperties *)self setSpaceAfter:v58];
                                          }
                                        }
                                        v59 = self->mOriginalProperties;
                                        if (v59)
                                        {
                                          if ([(WDParagraphPropertiesValues *)v59 spaceAfterAutoOverridden])
                                          {
                                            v60 = self->mTrackedProperties;
                                            if (!v60
                                              || ![(WDParagraphPropertiesValues *)v60 spaceAfterAutoOverridden])
                                            {
                                              if ([v166 isSpaceAfterAutoOverridden]) {
                                                uint64_t v61 = [v166 spaceAfterAuto];
                                              }
                                              else {
                                                uint64_t v61 = 0;
                                              }
                                              [(WDParagraphProperties *)self setSpaceAfterAuto:v61];
                                            }
                                          }
                                          v62 = self->mOriginalProperties;
                                          if (v62)
                                          {
                                            if ([(WDParagraphPropertiesValues *)v62 lineSpacingOverridden])
                                            {
                                              v63 = self->mTrackedProperties;
                                              if (!v63
                                                || ![(WDParagraphPropertiesValues *)v63 lineSpacingOverridden])
                                              {
                                                if ([v166 isLineSpacingOverridden]) {
                                                  uint64_t v64 = [v166 lineSpacing];
                                                }
                                                else {
                                                  uint64_t v64 = 0;
                                                }
                                                [(WDParagraphProperties *)self setLineSpacing:v64];
                                              }
                                            }
                                            v65 = self->mOriginalProperties;
                                            if (v65)
                                            {
                                              if ([(WDParagraphPropertiesValues *)v65 lineSpacingRuleOverridden])
                                              {
                                                v66 = self->mTrackedProperties;
                                                if (!v66
                                                  || ![(WDParagraphPropertiesValues *)v66 lineSpacingRuleOverridden])
                                                {
                                                  if ([v166 isLineSpacingRuleOverridden]) {
                                                    uint64_t v67 = [v166 lineSpacingRule];
                                                  }
                                                  else {
                                                    uint64_t v67 = 0;
                                                  }
                                                  [(WDParagraphProperties *)self setLineSpacingRule:v67];
                                                }
                                              }
                                              v68 = self->mOriginalProperties;
                                              if (v68)
                                              {
                                                if ([(WDParagraphPropertiesValues *)v68 leftIndentOverridden])
                                                {
                                                  v69 = self->mTrackedProperties;
                                                  if (!v69
                                                    || ![(WDParagraphPropertiesValues *)v69 leftIndentOverridden])
                                                  {
                                                    if ([v166 isLeftIndentOverridden]) {
                                                      uint64_t v70 = [v166 leftIndent];
                                                    }
                                                    else {
                                                      uint64_t v70 = 0;
                                                    }
                                                    [(WDParagraphProperties *)self setLeftIndent:v70];
                                                  }
                                                }
                                                v71 = self->mOriginalProperties;
                                                if (v71)
                                                {
                                                  if ([(WDParagraphPropertiesValues *)v71 leadingIndentOverridden])
                                                  {
                                                    v72 = self->mTrackedProperties;
                                                    if (!v72
                                                      || ![(WDParagraphPropertiesValues *)v72 leadingIndentOverridden])
                                                    {
                                                      if ([v166 isLeadingIndentOverridden]) {
                                                        uint64_t v73 = [v166 leadingIndent];
                                                      }
                                                      else {
                                                        uint64_t v73 = 0;
                                                      }
                                                      [(WDParagraphProperties *)self setLeadingIndent:v73];
                                                    }
                                                  }
                                                  v74 = self->mOriginalProperties;
                                                  if (v74)
                                                  {
                                                    if ([(WDParagraphPropertiesValues *)v74 followingIndentOverridden])
                                                    {
                                                      v75 = self->mTrackedProperties;
                                                      if (!v75
                                                        || ![(WDParagraphPropertiesValues *)v75 followingIndentOverridden])
                                                      {
                                                        if ([v166 isFollowingIndentOverridden])uint64_t v76 = objc_msgSend(v166, "followingIndent"); {
                                                        else
                                                        }
                                                          uint64_t v76 = 0;
                                                        [(WDParagraphProperties *)self setFollowingIndent:v76];
                                                      }
                                                    }
                                                    v77 = self->mOriginalProperties;
                                                    if (v77)
                                                    {
                                                      if ([(WDParagraphPropertiesValues *)v77 rightIndentOverridden])
                                                      {
                                                        v78 = self->mTrackedProperties;
                                                        if (!v78
                                                          || ![(WDParagraphPropertiesValues *)v78 rightIndentOverridden])
                                                        {
                                                          if ([v166 isRightIndentOverridden])uint64_t v79 = objc_msgSend(v166, "rightIndent"); {
                                                          else
                                                          }
                                                            uint64_t v79 = 0;
                                                          [(WDParagraphProperties *)self setRightIndent:v79];
                                                        }
                                                      }
                                                      v80 = self->mOriginalProperties;
                                                      if (v80)
                                                      {
                                                        if ([(WDParagraphPropertiesValues *)v80 firstLineIndentOverridden])
                                                        {
                                                          v81 = self->mTrackedProperties;
                                                          if (!v81
                                                            || ![(WDParagraphPropertiesValues *)v81 firstLineIndentOverridden])
                                                          {
                                                            if ([v166 isFirstLineIndentOverridden])uint64_t v82 = objc_msgSend(v166, "firstLineIndent"); {
                                                            else
                                                            }
                                                              uint64_t v82 = 0;
                                                            [(WDParagraphProperties *)self setFirstLineIndent:v82];
                                                          }
                                                        }
                                                        v83 = self->mOriginalProperties;
                                                        if (v83)
                                                        {
                                                          if ([(WDParagraphPropertiesValues *)v83 justificationOverridden])
                                                          {
                                                            v84 = self->mTrackedProperties;
                                                            if (!v84
                                                              || ![(WDParagraphPropertiesValues *)v84 justificationOverridden])
                                                            {
                                                              if ([v166 isJustificationOverridden])uint64_t v85 = objc_msgSend(v166, "justification"); {
                                                              else
                                                              }
                                                                uint64_t v85 = 0;
                                                              [(WDParagraphProperties *)self setJustification:v85];
                                                            }
                                                          }
                                                          v86 = self->mOriginalProperties;
                                                          if (v86)
                                                          {
                                                            if ([(WDParagraphPropertiesValues *)v86 physicalJustificationOverridden])
                                                            {
                                                              v87 = self->mTrackedProperties;
                                                              if (!v87
                                                                || ![(WDParagraphPropertiesValues *)v87 physicalJustificationOverridden])
                                                              {
                                                                if ([v166 isPhysicalJustificationOverridden])uint64_t v88 = objc_msgSend(v166, "physicalJustification"); {
                                                                else
                                                                }
                                                                  uint64_t v88 = 0;
                                                                [(WDParagraphProperties *)self setPhysicalJustification:v88];
                                                              }
                                                            }
                                                            v89 = self->mOriginalProperties;
                                                            if (v89)
                                                            {
                                                              if ([(WDParagraphPropertiesValues *)v89 outlineLevelOverridden])
                                                              {
                                                                v90 = self->mTrackedProperties;
                                                                if (!v90
                                                                  || ![(WDParagraphPropertiesValues *)v90 outlineLevelOverridden])
                                                                {
                                                                  if ([v166 isOutlineLevelOverridden])-[WDParagraphProperties setOutlineLevel:](self, "setOutlineLevel:", objc_msgSend(v166, "outlineLevel")); {
                                                                }
                                                                  }
                                                              }
                                                              v91 = self->mOriginalProperties;
                                                              if (v91)
                                                              {
                                                                if ([(WDParagraphPropertiesValues *)v91 keepNextParagraphTogetherOverridden])
                                                                {
                                                                  v92 = self->mTrackedProperties;
                                                                  if (!v92
                                                                    || ![(WDParagraphPropertiesValues *)v92 keepNextParagraphTogetherOverridden])
                                                                  {
                                                                    if ([v166 isKeepNextParagraphTogetherOverridden])uint64_t v93 = objc_msgSend(v166, "keepNextParagraphTogether"); {
                                                                    else
                                                                    }
                                                                      uint64_t v93 = 0;
                                                                    [(WDParagraphProperties *)self setKeepNextParagraphTogether:v93];
                                                                  }
                                                                }
                                                                v94 = self->mOriginalProperties;
                                                                if (v94)
                                                                {
                                                                  if ([(WDParagraphPropertiesValues *)v94 keepLinesTogetherOverridden])
                                                                  {
                                                                    v95 = self->mTrackedProperties;
                                                                    if (!v95
                                                                      || ![(WDParagraphPropertiesValues *)v95 keepLinesTogetherOverridden])
                                                                    {
                                                                      if ([v166 isKeepLinesTogetherOverridden])uint64_t v96 = objc_msgSend(v166, "keepLinesTogether"); {
                                                                      else
                                                                      }
                                                                        uint64_t v96 = 0;
                                                                      [(WDParagraphProperties *)self setKeepLinesTogether:v96];
                                                                    }
                                                                  }
                                                                  v97 = self->mOriginalProperties;
                                                                  if (v97)
                                                                  {
                                                                    if ([(WDParagraphPropertiesValues *)v97 suppressAutoHyphensOverridden])
                                                                    {
                                                                      v98 = self->mTrackedProperties;
                                                                      if (!v98
                                                                        || ![(WDParagraphPropertiesValues *)v98 suppressAutoHyphensOverridden])
                                                                      {
                                                                        if ([v166 isSuppressAutoHyphensOverridden])uint64_t v99 = objc_msgSend(v166, "suppressAutoHyphens"); {
                                                                        else
                                                                        }
                                                                          uint64_t v99 = 0;
                                                                        [(WDParagraphProperties *)self setSuppressAutoHyphens:v99];
                                                                      }
                                                                    }
                                                                    v100 = self->mOriginalProperties;
                                                                    if (v100)
                                                                    {
                                                                      if ([(WDParagraphPropertiesValues *)v100 suppressLineNumbersOverridden])
                                                                      {
                                                                        v101 = self->mTrackedProperties;
                                                                        if (!v101
                                                                          || ![(WDParagraphPropertiesValues *)v101 suppressLineNumbersOverridden])
                                                                        {
                                                                          if ([v166 isSuppressLineNumbersOverridden])uint64_t v102 = objc_msgSend(v166, "suppressLineNumbers"); {
                                                                          else
                                                                          }
                                                                            uint64_t v102 = 0;
                                                                          [(WDParagraphProperties *)self setSuppressLineNumbers:v102];
                                                                        }
                                                                      }
                                                                      v103 = self->mOriginalProperties;
                                                                      if (v103)
                                                                      {
                                                                        if ([(WDParagraphPropertiesValues *)v103 widowControlOverridden])
                                                                        {
                                                                          v104 = self->mTrackedProperties;
                                                                          if (!v104
                                                                            || ![(WDParagraphPropertiesValues *)v104 widowControlOverridden])
                                                                          {
                                                                            if ([v166 isWidowControlOverridden])uint64_t v105 = objc_msgSend(v166, "widowControl"); {
                                                                            else
                                                                            }
                                                                              uint64_t v105 = 0;
                                                                            [(WDParagraphProperties *)self setWidowControl:v105];
                                                                          }
                                                                        }
                                                                        v106 = self->mOriginalProperties;
                                                                        if (v106)
                                                                        {
                                                                          if ([(WDParagraphPropertiesValues *)v106 biDiOverridden])
                                                                          {
                                                                            v107 = self->mTrackedProperties;
                                                                            if (!v107
                                                                              || ![(WDParagraphPropertiesValues *)v107 biDiOverridden])
                                                                            {
                                                                              if ([v166 isBiDiOverridden])uint64_t v108 = objc_msgSend(v166, "biDi"); {
                                                                              else
                                                                              }
                                                                                uint64_t v108 = 0;
                                                                              [(WDParagraphProperties *)self setBiDi:v108];
                                                                            }
                                                                          }
                                                                          v109 = self->mOriginalProperties;
                                                                          if (v109)
                                                                          {
                                                                            if ([(WDParagraphPropertiesValues *)v109 kinsokuOffOverridden])
                                                                            {
                                                                              v110 = self->mTrackedProperties;
                                                                              if (!v110
                                                                                || ![(WDParagraphPropertiesValues *)v110 kinsokuOffOverridden])
                                                                              {
                                                                                if ([v166 isKinsokuOffOverridden])uint64_t v111 = objc_msgSend(v166, "kinsokuOff"); {
                                                                                else
                                                                                }
                                                                                  uint64_t v111 = 0;
                                                                                [(WDParagraphProperties *)self setKinsokuOff:v111];
                                                                              }
                                                                            }
                                                                            v112 = self->mOriginalProperties;
                                                                            if (v112)
                                                                            {
                                                                              if ([(WDParagraphPropertiesValues *)v112 topBorderOverridden])
                                                                              {
                                                                                v113 = self->mTrackedProperties;
                                                                                if (!v113
                                                                                  || ![(WDParagraphPropertiesValues *)v113 topBorderOverridden])
                                                                                {
                                                                                  v114 = [(WDParagraphProperties *)self mutableTopBorder];
                                                                                  v115 = [(WDParagraphPropertiesValues *)self->mOriginalProperties topBorder];
                                                                                  int v116 = [v115 style];

                                                                                  if (v116)
                                                                                  {
                                                                                    [v114 setNullBorder];
                                                                                  }
                                                                                  else if ([v166 isTopBorderOverridden])
                                                                                  {
                                                                                    v117 = [v166 topBorder];
                                                                                    [v114 setBorder:v117];
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    [v114 setSingleBlackBorder];
                                                                                  }
                                                                                }
                                                                              }
                                                                              v118 = self->mOriginalProperties;
                                                                              if (v118)
                                                                              {
                                                                                if ([(WDParagraphPropertiesValues *)v118 leftBorderOverridden])
                                                                                {
                                                                                  v119 = self->mTrackedProperties;
                                                                                  if (!v119
                                                                                    || ![(WDParagraphPropertiesValues *)v119 leftBorderOverridden])
                                                                                  {
                                                                                    v120 = [(WDParagraphProperties *)self mutableLeftBorder];
                                                                                    v121 = [(WDParagraphPropertiesValues *)self->mOriginalProperties leftBorder];
                                                                                    int v122 = [v121 style];

                                                                                    if (v122)
                                                                                    {
                                                                                      [v120 setNullBorder];
                                                                                    }
                                                                                    else if ([v166 isLeftBorderOverridden])
                                                                                    {
                                                                                      v123 = [v166 leftBorder];
                                                                                      [v120 setBorder:v123];
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      [v120 setSingleBlackBorder];
                                                                                    }
                                                                                  }
                                                                                }
                                                                                v124 = self->mOriginalProperties;
                                                                                if (v124)
                                                                                {
                                                                                  if ([(WDParagraphPropertiesValues *)v124 bottomBorderOverridden])
                                                                                  {
                                                                                    v125 = self->mTrackedProperties;
                                                                                    if (!v125
                                                                                      || ![(WDParagraphPropertiesValues *)v125 bottomBorderOverridden])
                                                                                    {
                                                                                      v126 = [(WDParagraphProperties *)self mutableBottomBorder];
                                                                                      v127 = [(WDParagraphPropertiesValues *)self->mOriginalProperties bottomBorder];
                                                                                      int v128 = [v127 style];

                                                                                      if (v128)
                                                                                      {
                                                                                        [v126 setNullBorder];
                                                                                      }
                                                                                      else if ([v166 isBottomBorderOverridden])
                                                                                      {
                                                                                        v129 = [v166 bottomBorder];
                                                                                        [v126 setBorder:v129];
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        [v126 setSingleBlackBorder];
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                  v130 = self->mOriginalProperties;
                                                                                  if (v130)
                                                                                  {
                                                                                    if ([(WDParagraphPropertiesValues *)v130 rightBorderOverridden])
                                                                                    {
                                                                                      v131 = self->mTrackedProperties;
                                                                                      if (!v131
                                                                                        || ![(WDParagraphPropertiesValues *)v131 rightBorderOverridden])
                                                                                      {
                                                                                        v132 = [(WDParagraphProperties *)self mutableRightBorder];
                                                                                        v133 = [(WDParagraphPropertiesValues *)self->mOriginalProperties rightBorder];
                                                                                        int v134 = [v133 style];

                                                                                        if (v134)
                                                                                        {
                                                                                          [v132 setNullBorder];
                                                                                        }
                                                                                        else if ([v166 isRightBorderOverridden])
                                                                                        {
                                                                                          v135 = [v166 rightBorder];
                                                                                          [v132 setBorder:v135];
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          [v132 setSingleBlackBorder];
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                    v136 = self->mOriginalProperties;
                                                                                    if (v136)
                                                                                    {
                                                                                      if ([(WDParagraphPropertiesValues *)v136 betweenBorderOverridden])
                                                                                      {
                                                                                        v137 = self->mTrackedProperties;
                                                                                        if (!v137
                                                                                          || ![(WDParagraphPropertiesValues *)v137 betweenBorderOverridden])
                                                                                        {
                                                                                          v138 = [(WDParagraphProperties *)self mutableBetweenBorder];
                                                                                          v139 = [(WDParagraphPropertiesValues *)self->mOriginalProperties betweenBorder];
                                                                                          int v140 = [v139 style];

                                                                                          if (v140)
                                                                                          {
                                                                                            [v138 setNullBorder];
                                                                                          }
                                                                                          else if ([v166 isBetweenBorderOverridden])
                                                                                          {
                                                                                            v141 = [v166 betweenBorder];
                                                                                            [v138 setBorder:v141];
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            [v138 setSingleBlackBorder];
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                      v142 = self->mOriginalProperties;
                                                                                      if (v142)
                                                                                      {
                                                                                        if ([(WDParagraphPropertiesValues *)v142 barBorderOverridden])
                                                                                        {
                                                                                          v143 = self->mTrackedProperties;
                                                                                          if (!v143
                                                                                            || ![(WDParagraphPropertiesValues *)v143 barBorderOverridden])
                                                                                          {
                                                                                            v144 = [(WDParagraphProperties *)self mutableBarBorder];
                                                                                            v145 = [(WDParagraphPropertiesValues *)self->mOriginalProperties barBorder];
                                                                                            int v146 = [v145 style];

                                                                                            if (v146)
                                                                                            {
                                                                                              [v144 setNullBorder];
                                                                                            }
                                                                                            else if ([v166 isBarBorderOverridden])
                                                                                            {
                                                                                              v147 = [v166 barBorder];
                                                                                              [v144 setBorder:v147];
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              [v144 setSingleBlackBorder];
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                        v148 = self->mOriginalProperties;
                                                                                        if (v148)
                                                                                        {
                                                                                          if ([(WDParagraphPropertiesValues *)v148 shadingOverridden])
                                                                                          {
                                                                                            v149 = self->mTrackedProperties;
                                                                                            if (!v149
                                                                                              || ![(WDParagraphPropertiesValues *)v149 shadingOverridden])
                                                                                            {
                                                                                              v150 = [(WDParagraphProperties *)self mutableShading];
                                                                                              v151 = [(WDParagraphPropertiesValues *)self->mOriginalProperties shading];
                                                                                              int v152 = [v151 style];

                                                                                              if (v152)
                                                                                              {
                                                                                                [v150 setStyle:0];
                                                                                                v153 = +[WDShading autoForegroundColor];
                                                                                                [v150 setForeground:v153];

                                                                                                v154 = +[WDShading autoBackgroundColor];
                                                                                                [v150 setBackground:v154];
                                                                                              }
                                                                                              else if ([v166 isShadingOverridden])
                                                                                              {
                                                                                                v154 = [v166 shading];
                                                                                                [v150 setShading:v154];
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                [v150 setStyle:1];
                                                                                                v155 = +[OITSUColor blackColor];
                                                                                                [v150 setForeground:v155];

                                                                                                v154 = +[OITSUColor whiteColor];
                                                                                                [v150 setBackground:v154];
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                          v156 = self->mOriginalProperties;
                                                                                          if (v156)
                                                                                          {
                                                                                            if ([(WDParagraphPropertiesValues *)v156 dropCapOverridden])
                                                                                            {
                                                                                              v157 = self->mTrackedProperties;
                                                                                              if (!v157
                                                                                                || ![(WDParagraphPropertiesValues *)v157 dropCapOverridden])
                                                                                              {
                                                                                                if ([v166 isDropCapOverridden]) {
                                                                                                  -[WDParagraphProperties setDropCap:](self, "setDropCap:", (unsigned __int16)[v166 dropCap]);
                                                                                                }
                                                                                                else {
                                                                                                  [(WDParagraphProperties *)self setDropCap:256];
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                            v158 = self->mOriginalProperties;
                                                                                            if (v158)
                                                                                            {
                                                                                              if ([(WDParagraphPropertiesValues *)v158 tabStopAddedCountOverridden])
                                                                                              {
                                                                                                v159 = self->mTrackedProperties;
                                                                                                if (!v159 || ![(WDParagraphPropertiesValues *)v159 tabStopAddedCountOverridden])
                                                                                                {
                                                                                                  uint64_t v160 = [v166 tabStopAddedCount];
                                                                                                  if (v160)
                                                                                                  {
                                                                                                    [(WDParagraphProperties *)self setTabStopAddedCount:v160];
                                                                                                    for (uint64_t i = 0;
                                                                                                          i != v160;
                                                                                                          ++i)
                                                                                                    {
                                                                                                      -[WDParagraphProperties addTabStopAdded:](self, "addTabStopAdded:", [v166 tabStopAddedAt:i]);
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    [(WDParagraphProperties *)self setTabStopAddedCount:0];
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                              v162 = self->mOriginalProperties;
                                                                                              if (v162)
                                                                                              {
                                                                                                if ([(WDParagraphPropertiesValues *)v162 tabStopDeletedCountOverridden])
                                                                                                {
                                                                                                  v163 = self->mTrackedProperties;
                                                                                                  if (!v163 || ![(WDParagraphPropertiesValues *)v163 tabStopDeletedCountOverridden])
                                                                                                  {
                                                                                                    uint64_t v164 = [v166 tabStopDeletedPositionCount];
                                                                                                    if (v164)
                                                                                                    {
                                                                                                      [(WDParagraphProperties *)self setTabStopDeletedPositionCount:v164];
                                                                                                      for (uint64_t j = 0;
                                                                                                            j != v164;
                                                                                                            ++j)
                                                                                                      {
                                                                                                        -[WDParagraphProperties addTabStopDeletedPosition:](self, "addTabStopDeletedPosition:", [v166 tabStopDeletedPositionAt:j]);
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      [(WDParagraphProperties *)self setTabStopDeletedPositionCount:0];
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    [(WDParagraphProperties *)self setResolveMode:v4];
  }
}

- (BOOL)isPageBreakBefore
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties pageBreakBeforeOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 pageBreakBeforeOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 pageBreakBefore];
}

- (BOOL)isPageBreakBeforeOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties pageBreakBeforeOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties pageBreakBeforeOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 pageBreakBeforeOverridden];
}

- ($06D0163FE0D7AFE752A9F21F38483579)dropCap
{
  if ((*((unsigned char *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (![(WDParagraphPropertiesValues *)mTrackedProperties dropCapOverridden])
      {
        mOriginalProperties = self->mOriginalProperties;
        if (mOriginalProperties)
        {
          if ([(WDParagraphPropertiesValues *)mOriginalProperties dropCapOverridden]) {
            goto LABEL_16;
          }
        }
      }
    }
  }
  char v5 = *((unsigned char *)self + 17);
  if ((v5 & 6) == 0 || (id v6 = self->mTrackedProperties) == 0)
  {
LABEL_11:
    if ((v5 & 5) != 0)
    {
      id v8 = self->mOriginalProperties;
      if (v8)
      {
        LODWORD(v8) = [(WDParagraphPropertiesValues *)v8 dropCapOverridden];
        if (v8)
        {
          uint64_t v7 = self->mOriginalProperties;
          goto LABEL_15;
        }
      }
LABEL_17:
      __int16 v9 = 0;
      return ($06D0163FE0D7AFE752A9F21F38483579)(v8 | (unsigned __int16)(v9 << 8));
    }
LABEL_16:
    LOBYTE(v8) = 0;
    goto LABEL_17;
  }
  if (![(WDParagraphPropertiesValues *)v6 dropCapOverridden])
  {
    char v5 = *((unsigned char *)self + 17);
    goto LABEL_11;
  }
  uint64_t v7 = self->mTrackedProperties;
LABEL_15:
  LOWORD(v8) = [(WDParagraphPropertiesValues *)v7 dropCap];
  __int16 v9 = BYTE1(v8);
  return ($06D0163FE0D7AFE752A9F21F38483579)(v8 | (unsigned __int16)(v9 << 8));
}

- (BOOL)isDropCapOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties dropCapOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties dropCapOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 dropCapOverridden];
}

- (int64_t)height
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties heightOverridden]) {
        return [(WDParagraphPropertiesValues *)*p_mTrackedProperties height];
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    int64_t result = (int64_t)mOriginalProperties;
    if (!mOriginalProperties) {
      return result;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if ([(id)result heightOverridden]) {
      return [(WDParagraphPropertiesValues *)*p_mTrackedProperties height];
    }
  }
  return 0;
}

- (BOOL)isHeightOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties heightOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties heightOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 heightOverridden];
}

- (int)heightRule
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties heightRuleOverridden]) {
        return [(WDParagraphPropertiesValues *)*p_mTrackedProperties heightRule];
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    id v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if ([(WDParagraphPropertiesValues *)v6 heightRuleOverridden]) {
        return [(WDParagraphPropertiesValues *)*p_mTrackedProperties heightRule];
      }
    }
  }
  return 1;
}

- (BOOL)isHeightRuleOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties heightRuleOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties heightRuleOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 heightRuleOverridden];
}

- (int64_t)verticalSpace
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties verticalSpaceOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 verticalSpaceOverridden]) {
    return 0;
  }
LABEL_8:
  __int16 v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 verticalSpace];
}

- (BOOL)isVerticalSpaceOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties verticalSpaceOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties verticalSpaceOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 verticalSpaceOverridden];
}

- (int64_t)horizontalSpace
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties horizontalSpaceOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 horizontalSpaceOverridden]) {
    return 0;
  }
LABEL_8:
  __int16 v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 horizontalSpace];
}

- (BOOL)isHorizontalSpaceOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties horizontalSpaceOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties horizontalSpaceOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 horizontalSpaceOverridden];
}

- (BOOL)wrap
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties wrapOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 wrapOverridden]) {
    return 0;
  }
LABEL_8:
  __int16 v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 wrap];
}

- (BOOL)isWrapOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties wrapOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties || ![(WDParagraphPropertiesValues *)mOriginalProperties wrapOverridden]) {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 wrapOverridden];
}

- (char)wrapCode
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties wrapCodeOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 wrapCodeOverridden]) {
    return 0;
  }
LABEL_8:
  __int16 v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 wrapCode];
}

- (BOOL)isWrapCodeOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties wrapCodeOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties wrapCodeOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 wrapCodeOverridden];
}

- (BOOL)anchorLock
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties anchorLockOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 anchorLockOverridden]) {
    return 0;
  }
LABEL_8:
  __int16 v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 anchorLock];
}

- (BOOL)isAnchorLockOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties anchorLockOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties anchorLockOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 anchorLockOverridden];
}

- (id)topBorder
{
  if ((*((unsigned char *)self + 17) & 4) == 0
    || (char v3 = self->mTrackedProperties) == 0
    || [(WDParagraphPropertiesValues *)v3 topBorderOverridden]
    || (uint64_t v4 = self->mOriginalProperties) == 0
    || ![(WDParagraphPropertiesValues *)v4 topBorderOverridden])
  {
    char v5 = *((unsigned char *)self + 17);
    if ((v5 & 6) != 0)
    {
      p_mTrackedProperties = &self->mTrackedProperties;
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties topBorderOverridden])
        {
LABEL_13:
          id v8 = [(WDParagraphPropertiesValues *)*p_mTrackedProperties topBorder];
          goto LABEL_15;
        }
        char v5 = *((unsigned char *)self + 17);
      }
    }
    if ((v5 & 5) != 0)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mOriginalProperties = &self->mOriginalProperties;
      id v8 = mOriginalProperties;
      if (!mOriginalProperties) {
        goto LABEL_15;
      }
      p_mTrackedProperties = p_mOriginalProperties;
      if ([v8 topBorderOverridden]) {
        goto LABEL_13;
      }
    }
  }
  id v8 = 0;
LABEL_15:
  return v8;
}

- (BOOL)isTopBorderOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties topBorderOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties topBorderOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 topBorderOverridden];
}

- (id)leftBorder
{
  if ((*((unsigned char *)self + 17) & 4) == 0
    || (char v3 = self->mTrackedProperties) == 0
    || [(WDParagraphPropertiesValues *)v3 leftBorderOverridden]
    || (uint64_t v4 = self->mOriginalProperties) == 0
    || ![(WDParagraphPropertiesValues *)v4 leftBorderOverridden])
  {
    char v5 = *((unsigned char *)self + 17);
    if ((v5 & 6) != 0)
    {
      p_mTrackedProperties = &self->mTrackedProperties;
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties leftBorderOverridden])
        {
LABEL_13:
          id v8 = [(WDParagraphPropertiesValues *)*p_mTrackedProperties leftBorder];
          goto LABEL_15;
        }
        char v5 = *((unsigned char *)self + 17);
      }
    }
    if ((v5 & 5) != 0)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mOriginalProperties = &self->mOriginalProperties;
      id v8 = mOriginalProperties;
      if (!mOriginalProperties) {
        goto LABEL_15;
      }
      p_mTrackedProperties = p_mOriginalProperties;
      if ([v8 leftBorderOverridden]) {
        goto LABEL_13;
      }
    }
  }
  id v8 = 0;
LABEL_15:
  return v8;
}

- (BOOL)isLeftBorderOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties leftBorderOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties leftBorderOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 leftBorderOverridden];
}

- (id)rightBorder
{
  if ((*((unsigned char *)self + 17) & 4) == 0
    || (char v3 = self->mTrackedProperties) == 0
    || [(WDParagraphPropertiesValues *)v3 rightBorderOverridden]
    || (uint64_t v4 = self->mOriginalProperties) == 0
    || ![(WDParagraphPropertiesValues *)v4 rightBorderOverridden])
  {
    char v5 = *((unsigned char *)self + 17);
    if ((v5 & 6) != 0)
    {
      p_mTrackedProperties = &self->mTrackedProperties;
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties rightBorderOverridden])
        {
LABEL_13:
          id v8 = [(WDParagraphPropertiesValues *)*p_mTrackedProperties rightBorder];
          goto LABEL_15;
        }
        char v5 = *((unsigned char *)self + 17);
      }
    }
    if ((v5 & 5) != 0)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mOriginalProperties = &self->mOriginalProperties;
      id v8 = mOriginalProperties;
      if (!mOriginalProperties) {
        goto LABEL_15;
      }
      p_mTrackedProperties = p_mOriginalProperties;
      if ([v8 rightBorderOverridden]) {
        goto LABEL_13;
      }
    }
  }
  id v8 = 0;
LABEL_15:
  return v8;
}

- (BOOL)isRightBorderOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties rightBorderOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties rightBorderOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 rightBorderOverridden];
}

- (id)betweenBorder
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties betweenBorderOverridden])
      {
LABEL_8:
        id v6 = [(WDParagraphPropertiesValues *)*p_mTrackedProperties betweenBorder];
        goto LABEL_10;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    id v6 = mOriginalProperties;
    if (!mOriginalProperties) {
      goto LABEL_10;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if ([v6 betweenBorderOverridden]) {
      goto LABEL_8;
    }
  }
  id v6 = 0;
LABEL_10:
  return v6;
}

- (BOOL)isBetweenBorderOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties betweenBorderOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties betweenBorderOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 betweenBorderOverridden];
}

- (id)barBorder
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties barBorderOverridden])
      {
LABEL_8:
        id v6 = [(WDParagraphPropertiesValues *)*p_mTrackedProperties barBorder];
        goto LABEL_10;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    id v6 = mOriginalProperties;
    if (!mOriginalProperties) {
      goto LABEL_10;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if ([v6 barBorderOverridden]) {
      goto LABEL_8;
    }
  }
  id v6 = 0;
LABEL_10:
  return v6;
}

- (BOOL)isBarBorderOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties barBorderOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties barBorderOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 barBorderOverridden];
}

- (BOOL)spaceBeforeAuto
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties spaceBeforeAutoOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 spaceBeforeAutoOverridden]) {
    return 0;
  }
LABEL_8:
  __int16 v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 spaceBeforeAuto];
}

- (BOOL)isSpaceBeforeAutoOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties spaceBeforeAutoOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties spaceBeforeAutoOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 spaceBeforeAutoOverridden];
}

- (BOOL)spaceAfterAuto
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties spaceAfterAutoOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 spaceAfterAutoOverridden]) {
    return 0;
  }
LABEL_8:
  __int16 v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 spaceAfterAuto];
}

- (BOOL)isSpaceAfterAutoOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties spaceAfterAutoOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties spaceAfterAutoOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 spaceAfterAutoOverridden];
}

- (void)clearLeftIndent
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  [(WDParagraphPropertiesValues *)mTrackedProperties setLeftIndent:0];
  uint64_t v4 = *p_mTrackedProperties;
  [(WDParagraphPropertiesValues *)v4 setLeftIndentOverridden:0];
}

- (signed)leadingIndent
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties leadingIndentOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 leadingIndentOverridden]) {
    return 0;
  }
LABEL_8:
  __int16 v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 leadingIndent];
}

- (void)setLeadingIndent:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setLeadingIndent:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setLeadingIndentOverridden:1];
}

- (BOOL)isLeadingIndentOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties leadingIndentOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties leadingIndentOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 leadingIndentOverridden];
}

- (void)clearLeadingIndent
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  [(WDParagraphPropertiesValues *)mTrackedProperties setLeadingIndent:0];
  uint64_t v4 = *p_mTrackedProperties;
  [(WDParagraphPropertiesValues *)v4 setLeadingIndentOverridden:0];
}

- (signed)followingIndent
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties followingIndentOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 followingIndentOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 followingIndent];
}

- (void)setFollowingIndent:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setFollowingIndent:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setFollowingIndentOverridden:1];
}

- (BOOL)isFollowingIndentOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties followingIndentOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties followingIndentOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 followingIndentOverridden];
}

- (void)clearFollowingIndent
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  [(WDParagraphPropertiesValues *)mTrackedProperties setFollowingIndent:0];
  uint64_t v4 = *p_mTrackedProperties;
  [(WDParagraphPropertiesValues *)v4 setFollowingIndentOverridden:0];
}

- (void)clearRightIndent
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  [(WDParagraphPropertiesValues *)mTrackedProperties setRightIndent:0];
  uint64_t v4 = *p_mTrackedProperties;
  [(WDParagraphPropertiesValues *)v4 setRightIndentOverridden:0];
}

- (void)clearFirstLineIndent
{
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties) {
      return;
    }
  }
  [(WDParagraphPropertiesValues *)mTrackedProperties setFirstLineIndent:0];
  uint64_t v4 = *p_mTrackedProperties;
  [(WDParagraphPropertiesValues *)v4 setFirstLineIndentOverridden:0];
}

- (signed)leftIndentChars
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties leftIndentCharsOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 leftIndentCharsOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 leftIndentChars];
}

- (void)setLeftIndentChars:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setLeftIndentChars:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setLeftIndentCharsOverridden:1];
}

- (BOOL)isLeftIndentCharsOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties leftIndentCharsOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties leftIndentCharsOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 leftIndentCharsOverridden];
}

- (signed)rightIndentChars
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties rightIndentCharsOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 rightIndentCharsOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 rightIndentChars];
}

- (void)setRightIndentChars:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setRightIndentChars:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setRightIndentCharsOverridden:1];
}

- (BOOL)isRightIndentCharsOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties rightIndentCharsOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties rightIndentCharsOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 rightIndentCharsOverridden];
}

- (signed)firstLineIndentChars
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties firstLineIndentCharsOverridden])
      {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 firstLineIndentCharsOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 firstLineIndentChars];
}

- (void)setFirstLineIndentChars:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setFirstLineIndentChars:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setFirstLineIndentCharsOverridden:1];
}

- (BOOL)isFirstLineIndentCharsOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties firstLineIndentCharsOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties firstLineIndentCharsOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 firstLineIndentCharsOverridden];
}

- (int)physicalJustification
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties physicalJustificationOverridden])
      {
LABEL_8:
        LODWORD(v6) = [(WDParagraphPropertiesValues *)*p_mTrackedProperties physicalJustification];
        return (int)v6;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
    LODWORD(v6) = 0;
    return (int)v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    LODWORD(v6) = [(WDParagraphPropertiesValues *)v6 physicalJustificationOverridden];
    p_mTrackedProperties = p_mOriginalProperties;
    if (v6) {
      goto LABEL_8;
    }
  }
  return (int)v6;
}

- (void)setPhysicalJustification:(int)a3
{
  unsigned __int8 v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setPhysicalJustification:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setPhysicalJustificationOverridden:1];
}

- (BOOL)isPhysicalJustificationOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties physicalJustificationOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties physicalJustificationOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 physicalJustificationOverridden];
}

- (unsigned)outlineLevel
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties outlineLevelOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 outlineLevelOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 outlineLevel];
}

- (BOOL)isOutlineLevelOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties outlineLevelOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties outlineLevelOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 outlineLevelOverridden];
}

- (BOOL)keepNextParagraphTogether
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties keepNextParagraphTogetherOverridden])
      {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 keepNextParagraphTogetherOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 keepNextParagraphTogether];
}

- (BOOL)isKeepNextParagraphTogetherOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties keepNextParagraphTogetherOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties keepNextParagraphTogetherOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 keepNextParagraphTogetherOverridden];
}

- (BOOL)keepLinesTogether
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties keepLinesTogetherOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 keepLinesTogetherOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 keepLinesTogether];
}

- (BOOL)isKeepLinesTogetherOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties keepLinesTogetherOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties keepLinesTogetherOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 keepLinesTogetherOverridden];
}

- (BOOL)suppressAutoHyphens
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties suppressAutoHyphensOverridden])
      {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 suppressAutoHyphensOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 suppressAutoHyphens];
}

- (BOOL)isSuppressAutoHyphensOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties suppressAutoHyphensOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties suppressAutoHyphensOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 suppressAutoHyphensOverridden];
}

- (BOOL)suppressLineNumbers
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties suppressLineNumbersOverridden])
      {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 suppressLineNumbersOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 suppressLineNumbers];
}

- (BOOL)isSuppressLineNumbersOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties suppressLineNumbersOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties suppressLineNumbersOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 suppressLineNumbersOverridden];
}

- (BOOL)widowControl
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties widowControlOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 widowControlOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 widowControl];
}

- (BOOL)isWidowControlOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties widowControlOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties widowControlOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 widowControlOverridden];
}

- (BOOL)biDi
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties biDiOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 biDiOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 biDi];
}

- (void)setBiDi:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setBiDi:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setBiDiOverridden:1];
}

- (BOOL)isBiDiOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties biDiOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties || ![(WDParagraphPropertiesValues *)mOriginalProperties biDiOverridden]) {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 biDiOverridden];
}

- (BOOL)kinsokuOff
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties kinsokuOffOverridden]) {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  id v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 kinsokuOffOverridden]) {
    return 0;
  }
LABEL_8:
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 kinsokuOff];
}

- (void)setKinsokuOff:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    id v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    id v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setKinsokuOff:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setKinsokuOffOverridden:1];
}

- (BOOL)isKinsokuOffOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties kinsokuOffOverridden]) {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties kinsokuOffOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 kinsokuOffOverridden];
}

- (unint64_t)tabStopAddedCount
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties tabStopAddedCountOverridden])
      {
        char v5 = [(WDParagraphPropertiesValues *)self->mTrackedProperties tabStopAddedTable];
        unint64_t v6 = [v5 length];
        goto LABEL_10;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties
    || ![(WDParagraphPropertiesValues *)mOriginalProperties tabStopAddedCountOverridden])
  {
    return 0;
  }
  char v5 = [(WDParagraphPropertiesValues *)self->mOriginalProperties tabStopAddedTable];
  unint64_t v6 = [v5 length];
LABEL_10:
  unint64_t v8 = v6 >> 2;

  return v8;
}

- (BOOL)hasTabStopAddedAtPosition:(signed __int16)a3
{
  uint64_t v5 = [(WDParagraphProperties *)self tabStopAddedCount];
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = v5;
  int v7 = (unsigned __int16)a3;
  if (*(unsigned __int16 *)[(WDParagraphProperties *)self tabStopAddedAt:0] == (unsigned __int16)a3) {
    return 1;
  }
  uint64_t v9 = 1;
  do
  {
    uint64_t v10 = v9;
    if (v6 == v9) {
      break;
    }
    id v11 = [(WDParagraphProperties *)self tabStopAddedAt:v9];
    uint64_t v9 = v10 + 1;
  }
  while ((unsigned __int16)v11->var0 != v7);
  return v10 < v6;
}

- (BOOL)hasTabStopDeletedAtPosition:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v5 = [(WDParagraphProperties *)self tabStopDeletedPositionCount];
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = v5;
  if ([(WDParagraphProperties *)self tabStopDeletedPositionAt:0] == v3) {
    return 1;
  }
  uint64_t v8 = 1;
  do
  {
    uint64_t v9 = v8;
    if (v6 == v8) {
      break;
    }
    int v10 = [(WDParagraphProperties *)self tabStopDeletedPositionAt:v8];
    uint64_t v8 = v9 + 1;
  }
  while (v10 != v3);
  return v9 < v6;
}

- ($373952EDE9DECE7FE473A72CF4B2C093)tabStopAddedAt:(unint64_t)a3
{
  unint64_t v4 = 4 * a3;
  char v5 = *((unsigned char *)self + 17);
  if ((v5 & 6) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties tabStopAddedCountOverridden])
      {
        int v7 = [(WDParagraphPropertiesValues *)self->mTrackedProperties tabStopAddedTable];
        uint64_t v8 = objc_msgSend(v7, "subdataWithRange:", v4, 4);
        goto LABEL_10;
      }
      char v5 = *((unsigned char *)self + 17);
    }
  }
  if ((v5 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties) == 0
    || ![(WDParagraphPropertiesValues *)mOriginalProperties tabStopAddedCountOverridden])
  {
    int v10 = 0;
    goto LABEL_12;
  }
  int v7 = [(WDParagraphPropertiesValues *)self->mOriginalProperties tabStopAddedTable];
  uint64_t v8 = objc_msgSend(v7, "subdataWithRange:", v4, 4);
LABEL_10:
  int v10 = (void *)v8;

LABEL_12:
  id v11 = v10;
  id v12 = ($373952EDE9DECE7FE473A72CF4B2C093 *)[v11 bytes];

  return v12;
}

- (void)removeTabStopAddedWithPosition:(signed __int16)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0)
    {
      id v13 = 0;
      goto LABEL_19;
    }
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties) {
      goto LABEL_7;
    }
LABEL_5:
    id v13 = [(WDParagraphPropertiesValues *)mOriginalProperties tabStopAddedTable];
    goto LABEL_8;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (mOriginalProperties) {
    goto LABEL_5;
  }
LABEL_7:
  id v13 = 0;
LABEL_8:
  unint64_t v6 = [(WDParagraphProperties *)self tabStopAddedCount];
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v7 = 0;
  int v8 = (unsigned __int16)a3;
  while (1)
  {
    objc_msgSend(v13, "subdataWithRange:", v7, 4);
    id v9 = objc_claimAutoreleasedReturnValue();
    int v10 = (unsigned __int16 *)[v9 bytes];

    if (v10)
    {
      if (*v10 == v8) {
        break;
      }
    }
    v7 += 4;
    if (!--v6) {
      goto LABEL_19;
    }
  }
  objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", v7, 4, 0, 0);
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    uint64_t v12 = [(WDParagraphPropertiesValues *)mTrackedProperties tabStopAddedCount];
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      goto LABEL_19;
    }
    mTrackedProperties = self->mOriginalProperties;
    uint64_t v12 = [(WDParagraphPropertiesValues *)mTrackedProperties tabStopAddedCount];
  }
  [(WDParagraphPropertiesValues *)mTrackedProperties setTabStopAddedCount:v12 - 1];
LABEL_19:
}

- (unint64_t)tabStopDeletedPositionCount
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties tabStopDeletedCountOverridden])
      {
        char v5 = [(WDParagraphPropertiesValues *)self->mTrackedProperties tabStopDeletedTable];
        unint64_t v6 = [v5 length];
        goto LABEL_10;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties
    || ![(WDParagraphPropertiesValues *)mOriginalProperties tabStopDeletedCountOverridden])
  {
    return 0;
  }
  char v5 = [(WDParagraphPropertiesValues *)self->mOriginalProperties tabStopDeletedTable];
  unint64_t v6 = [v5 length];
LABEL_10:
  unint64_t v8 = v6 >> 1;

  return v8;
}

- (signed)tabStopDeletedPositionAt:(unint64_t)a3
{
  signed __int16 v10 = 0;
  unint64_t v4 = 2 * a3;
  char v5 = *((unsigned char *)self + 17);
  if ((v5 & 6) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties tabStopDeletedCountOverridden])
      {
        uint64_t v7 = [(WDParagraphPropertiesValues *)self->mTrackedProperties tabStopDeletedTable];
        objc_msgSend(v7, "getBytes:range:", &v10, v4, 2);
LABEL_10:

        return v10;
      }
      char v5 = *((unsigned char *)self + 17);
    }
  }
  if ((v5 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      if ([(WDParagraphPropertiesValues *)mOriginalProperties tabStopDeletedCountOverridden])
      {
        uint64_t v7 = [(WDParagraphPropertiesValues *)self->mOriginalProperties tabStopDeletedTable];
        objc_msgSend(v7, "getBytes:range:", &v10, v4, 2);
        goto LABEL_10;
      }
    }
  }
  return v10;
}

- (void)removeTabStopDeletedPosition:(signed __int16)a3
{
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0)
    {
      id v13 = 0;
      goto LABEL_19;
    }
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties) {
      goto LABEL_7;
    }
LABEL_5:
    id v13 = [(WDParagraphPropertiesValues *)mOriginalProperties tabStopDeletedTable];
    goto LABEL_8;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (mOriginalProperties) {
    goto LABEL_5;
  }
LABEL_7:
  id v13 = 0;
LABEL_8:
  unint64_t v6 = [(WDParagraphProperties *)self tabStopDeletedPositionCount];
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v7 = 0;
  int v8 = (unsigned __int16)a3;
  while (1)
  {
    objc_msgSend(v13, "subdataWithRange:", v7, 2);
    id v9 = objc_claimAutoreleasedReturnValue();
    signed __int16 v10 = (unsigned __int16 *)[v9 bytes];

    if (v10)
    {
      if (*v10 == v8) {
        break;
      }
    }
    v7 += 2;
    if (!--v6) {
      goto LABEL_19;
    }
  }
  objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", v7, 2, 0, 0);
  if ((*((unsigned char *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    uint64_t v12 = [(WDParagraphPropertiesValues *)mTrackedProperties tabStopDeletedCount];
  }
  else
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      goto LABEL_19;
    }
    mTrackedProperties = self->mOriginalProperties;
    uint64_t v12 = [(WDParagraphPropertiesValues *)mTrackedProperties tabStopDeletedCount];
  }
  [(WDParagraphPropertiesValues *)mTrackedProperties setTabStopDeletedCount:v12 - 1];
LABEL_19:
}

- (int)formattingChanged
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties formattingChangedOverridden])
      {
LABEL_8:
        LODWORD(v6) = [(WDParagraphPropertiesValues *)*p_mTrackedProperties formattingChanged];
        return (int)v6;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
    LODWORD(v6) = 0;
    return (int)v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  unint64_t v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    LODWORD(v6) = [(WDParagraphPropertiesValues *)v6 formattingChangedOverridden];
    p_mTrackedProperties = p_mOriginalProperties;
    if (v6) {
      goto LABEL_8;
    }
  }
  return (int)v6;
}

- (BOOL)isFormattingChangedOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties formattingChangedOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties formattingChangedOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 formattingChangedOverridden];
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties indexToAuthorIDOfFormattingChangeOverridden])
      {
        goto LABEL_8;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  unint64_t v6 = mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if (![(WDParagraphPropertiesValues *)v6 indexToAuthorIDOfFormattingChangeOverridden])return 0; {
LABEL_8:
  }
  id v9 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v9 indexToAuthorIDOfFormattingChange];
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    unint64_t v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    int v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setIndexToAuthorIDOfFormattingChange:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setIndexToAuthorIDOfFormattingChangeOverridden:1];
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if ([(WDParagraphPropertiesValues *)mTrackedProperties indexToAuthorIDOfFormattingChangeOverridden])
        {
          goto LABEL_5;
        }
        char v3 = *((unsigned char *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0) {
        return 0;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDParagraphPropertiesValues *)mOriginalProperties indexToAuthorIDOfFormattingChangeOverridden])
      {
        return 0;
      }
    }
    char v5 = self->mOriginalProperties;
    if (!v5) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_5:
  char v5 = self->mTrackedProperties;
  if (!v5) {
    return 0;
  }
LABEL_13:
  return [(WDParagraphPropertiesValues *)v5 indexToAuthorIDOfFormattingChangeOverridden];
}

- (BOOL)contextualSpacing
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) != 0) {
    goto LABEL_5;
  }
  if ((*((unsigned char *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDParagraphPropertiesValues *)mTrackedProperties contextualSpacingOverridden])
      {
LABEL_5:
        p_mTrackedProperties = &self->mTrackedProperties;
        goto LABEL_6;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mTrackedProperties = &self->mOriginalProperties;
  int v8 = mOriginalProperties;
  if (!mOriginalProperties
    || ![(WDParagraphPropertiesValues *)v8 contextualSpacingOverridden])
  {
    return 0;
  }
LABEL_6:
  unint64_t v6 = *p_mTrackedProperties;
  return [(WDParagraphPropertiesValues *)v6 contextualSpacing];
}

- (void)setContextualSpacing:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 17) & 2) == 0)
  {
    if ((*((unsigned char *)self + 17) & 1) == 0) {
      return;
    }
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_9;
    }
    unint64_t v6 = objc_alloc_init(WDParagraphPropertiesValues);
    id v7 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties) {
      return;
    }
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    int v8 = objc_alloc_init(WDParagraphPropertiesValues);
    id v9 = *p_mOriginalProperties;
    id *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties) {
      return;
    }
LABEL_8:
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopAddedTable:v10];

    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    [*p_mOriginalProperties setTabStopDeletedTable:v11];

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  [(WDParagraphPropertiesValues *)mOriginalProperties setContextualSpacing:v3];
  id v12 = *p_mOriginalProperties;
  [v12 setContextualSpacingOverridden:1];
}

- (BOOL)isContextualSpacingOverridden
{
  char v3 = *((unsigned char *)self + 17);
  if ((v3 & 2) != 0)
  {
LABEL_5:
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties) {
      goto LABEL_6;
    }
    return 0;
  }
  if ((*((unsigned char *)self + 17) & 4) != 0)
  {
    unint64_t v4 = self->mTrackedProperties;
    if (v4)
    {
      if ([(WDParagraphPropertiesValues *)v4 contextualSpacingOverridden]) {
        goto LABEL_5;
      }
      char v3 = *((unsigned char *)self + 17);
    }
  }
  if ((v3 & 5) == 0) {
    return 0;
  }
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  if (![(WDParagraphPropertiesValues *)mOriginalProperties contextualSpacingOverridden]) {
    return 0;
  }
  mTrackedProperties = self->mOriginalProperties;
  if (!mTrackedProperties) {
    return 0;
  }
LABEL_6:
  return [(WDParagraphPropertiesValues *)mTrackedProperties contextualSpacingOverridden];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [+[WDParagraphProperties allocWithZone:a3] init];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)&v4->mDocument, WeakRetained);

    uint64_t v6 = [(WDCharacterProperties *)self->mCharacterProperties copy];
    mCharacterProperties = v4->mCharacterProperties;
    v4->mCharacterProperties = (WDCharacterProperties *)v6;

    v4->mCharacterPropertiesOverridden = self->mCharacterPropertiesOverridden;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      uint64_t v9 = [(WDParagraphPropertiesValues *)mOriginalProperties copy];
      id v10 = v4->mOriginalProperties;
      v4->mOriginalProperties = (WDParagraphPropertiesValues *)v9;
    }
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      uint64_t v12 = [(WDParagraphPropertiesValues *)mTrackedProperties copy];
      id v13 = v4->mTrackedProperties;
      v4->mTrackedProperties = (WDParagraphPropertiesValues *)v12;
    }
    signed __int16 v14 = v4;
  }

  return v4;
}

- (void)copyPropertiesInto:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    unint64_t v4 = (void *)*((void *)v15 + 3);
    if (v4)
    {
      *((void *)v15 + 3) = 0;
    }
    char v5 = (void *)*((void *)v15 + 4);
    if (v5)
    {
      *((void *)v15 + 4) = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)v15 + 5, WeakRetained);

    uint64_t v7 = [(WDCharacterProperties *)self->mCharacterProperties copy];
    int v8 = (void *)*((void *)v15 + 1);
    *((void *)v15 + 1) = v7;

    *((unsigned char *)v15 + 16) = self->mCharacterPropertiesOverridden;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      uint64_t v10 = [(WDParagraphPropertiesValues *)mOriginalProperties copy];
      id v11 = (void *)*((void *)v15 + 3);
      *((void *)v15 + 3) = v10;
    }
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      uint64_t v13 = [(WDParagraphPropertiesValues *)mTrackedProperties copy];
      signed __int16 v14 = (void *)*((void *)v15 + 4);
      *((void *)v15 + 4) = v13;
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mTrackedProperties, 0);
  objc_storeStrong((id *)&self->mOriginalProperties, 0);
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
}

- (BOOL)isAnythingOverriddenIn:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3)
  {
    if (([v3 baseStyleOverridden] & 1) != 0
      || ([v4 pageBreakBeforeOverridden] & 1) != 0
      || ([v4 listLevelOverridden] & 1) != 0
      || ([v4 listIndexOverridden] & 1) != 0
      || ([v4 topBorderOverridden] & 1) != 0
      || ([v4 leftBorderOverridden] & 1) != 0
      || ([v4 bottomBorderOverridden] & 1) != 0
      || ([v4 rightBorderOverridden] & 1) != 0
      || ([v4 betweenBorderOverridden] & 1) != 0
      || ([v4 barBorderOverridden] & 1) != 0
      || ([v4 shadingOverridden] & 1) != 0
      || ([v4 dropCapOverridden] & 1) != 0
      || ([v4 widthOverridden] & 1) != 0
      || ([v4 heightOverridden] & 1) != 0
      || ([v4 heightRuleOverridden] & 1) != 0
      || ([v4 verticalSpaceOverridden] & 1) != 0
      || ([v4 horizontalSpaceOverridden] & 1) != 0
      || ([v4 wrapOverridden] & 1) != 0
      || ([v4 horizontalAnchorOverridden] & 1) != 0
      || ([v4 verticalAnchorOverridden] & 1) != 0
      || ([v4 horizontalPositionOverridden] & 1) != 0
      || ([v4 verticalPositionOverridden] & 1) != 0
      || ([v4 wrapCodeOverridden] & 1) != 0
      || ([v4 anchorLockOverridden] & 1) != 0
      || ([v4 spaceBeforeOverridden] & 1) != 0
      || ([v4 spaceBeforeAutoOverridden] & 1) != 0
      || ([v4 spaceAfterOverridden] & 1) != 0
      || ([v4 spaceAfterAutoOverridden] & 1) != 0
      || ([v4 lineSpacingOverridden] & 1) != 0
      || ([v4 lineSpacingRuleOverridden] & 1) != 0
      || ([v4 leftIndentOverridden] & 1) != 0
      || ([v4 leadingIndentOverridden] & 1) != 0
      || ([v4 followingIndentOverridden] & 1) != 0
      || ([v4 rightIndentOverridden] & 1) != 0
      || ([v4 firstLineIndentOverridden] & 1) != 0
      || ([v4 justificationOverridden] & 1) != 0
      || ([v4 physicalJustificationOverridden] & 1) != 0
      || ([v4 outlineLevelOverridden] & 1) != 0
      || ([v4 keepNextParagraphTogetherOverridden] & 1) != 0
      || ([v4 keepLinesTogetherOverridden] & 1) != 0
      || ([v4 suppressAutoHyphensOverridden] & 1) != 0
      || ([v4 suppressLineNumbersOverridden] & 1) != 0
      || ([v4 widowControlOverridden] & 1) != 0
      || ([v4 biDiOverridden] & 1) != 0
      || ([v4 kinsokuOffOverridden] & 1) != 0
      || ([v4 tabStopAddedCountOverridden] & 1) != 0
      || ([v4 tabStopDeletedCountOverridden] & 1) != 0
      || ([v4 formattingChangedOverridden] & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = [v4 indexToAuthorIDOfFormattingChangeOverridden];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDParagraphProperties;
  unsigned int v2 = [(WDParagraphProperties *)&v4 description];
  return v2;
}

@end