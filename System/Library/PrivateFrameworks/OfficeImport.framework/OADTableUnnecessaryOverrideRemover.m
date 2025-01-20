@interface OADTableUnnecessaryOverrideRemover
- (OADTableUnnecessaryOverrideRemover)initWithTable:(id)a3 parentTextListStyle:(id)a4;
- (OADTextListStyle)parentTextListStyle;
- (void)applyResolvedPartStyle:(id)a3 leftStroke:(id)a4 rightStroke:(id)a5 topStroke:(id)a6 bottomStroke:(id)a7 toCell:(id)a8;
- (void)applyTextBodyPropertiesToCellPropertiesInCell:(id)a3;
- (void)applyTextStyle:(id)a3 toParagraph:(id)a4;
- (void)fixFill:(id)a3;
- (void)removeUnnecessaryOverridesInCellProperties:(id)a3 strokeType:(int)a4 resolvedStroke:(id)a5;
@end

@implementation OADTableUnnecessaryOverrideRemover

- (OADTableUnnecessaryOverrideRemover)initWithTable:(id)a3 parentTextListStyle:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OADTableUnnecessaryOverrideRemover;
  v8 = [(OADTableStyleResolver *)&v11 initWithTable:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_parentTextListStyle, a4);
  }

  return v9;
}

- (void)applyTextBodyPropertiesToCellPropertiesInCell:(id)a3
{
  id v6 = a3;
  v3 = [v6 properties];
  v4 = [v6 textBody];
  v5 = [v4 properties];

  if ([v5 hasLeftInset] && (objc_msgSend(v3, "isLeftMarginOverridden") & 1) == 0)
  {
    [v5 leftInset];
    objc_msgSend(v3, "setLeftMargin:");
  }
  if ([v5 hasRightInset] && (objc_msgSend(v3, "isRightMarginOverridden") & 1) == 0)
  {
    [v5 rightInset];
    objc_msgSend(v3, "setRightMargin:");
  }
  if ([v5 hasTopInset] && (objc_msgSend(v3, "isTopMarginOverridden") & 1) == 0)
  {
    [v5 topInset];
    objc_msgSend(v3, "setTopMargin:");
  }
  if ([v5 hasBottomInset] && (objc_msgSend(v3, "isBottomMarginOverridden") & 1) == 0)
  {
    [v5 bottomInset];
    objc_msgSend(v3, "setBottomMargin:");
  }
  if ([v5 hasFlowType] && (objc_msgSend(v3, "isTextFlowOverridden") & 1) == 0) {
    objc_msgSend(v3, "setTextFlow:", objc_msgSend(v5, "flowType"));
  }
  if ([v5 hasTextAnchorType] && (objc_msgSend(v3, "isTextAnchorOverridden") & 1) == 0) {
    objc_msgSend(v3, "setTextAnchor:", objc_msgSend(v5, "textAnchorType"));
  }
  if ([v5 hasIsAnchorCenter]
    && ([v3 isTextAnchorCenterOverridden] & 1) == 0)
  {
    objc_msgSend(v3, "setTextAnchorCenter:", objc_msgSend(v5, "isAnchorCenter"));
  }
  if ([v5 hasHorizontalOverflowType]
    && ([v3 isTextHorizontalOverflowOverridden] & 1) == 0)
  {
    objc_msgSend(v3, "setTextHorizontalOverflow:", objc_msgSend(v5, "horizontalOverflowType"));
  }
  if ([v5 hasIsAnchorCenter]
    && ([v3 isTextAnchorCenterOverridden] & 1) == 0)
  {
    objc_msgSend(v3, "setTextAnchorCenter:", objc_msgSend(v5, "isAnchorCenter"));
  }
}

- (void)fixFill:(id)a3
{
  id v8 = a3;
  uint64_t v3 = [v8 isMergedWithParent];
  [v8 setMergedWithParent:0];
  uint64_t v4 = objc_opt_class();
  v5 = TSUDynamicCast(v4, (uint64_t)v8);
  id v6 = v5;
  if (v5 && ([v5 isColorOverridden] & 1) == 0)
  {
    id v7 = +[OADRgbColor black];
    [v6 setColor:v7];
  }
  [v8 setMergedWithParent:v3];
}

- (void)removeUnnecessaryOverridesInCellProperties:(id)a3 strokeType:(int)a4 resolvedStroke:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v13 = a3;
  id v8 = a5;
  v9 = [v13 stroke:v6];
  if (v9)
  {
    v10 = objc_opt_new();
    [v10 setParent:v9];
    [v10 changeParentPreservingEffectiveValues:v8];
    if ([v10 isAnythingOverridden])
    {
      objc_super v11 = +[OADStroke defaultProperties];
      [v9 changeParentPreservingEffectiveValues:v11];

      v12 = [v9 fill];
      [(OADTableUnnecessaryOverrideRemover *)self fixFill:v12];
    }
    else
    {
      [v13 setStrokeOfType:v6 toValue:0];
    }
  }
}

- (void)applyResolvedPartStyle:(id)a3 leftStroke:(id)a4 rightStroke:(id)a5 topStroke:(id)a6 bottomStroke:(id)a7 toCell:(id)a8
{
  id v35 = a3;
  id v34 = a4;
  id v33 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = [v16 properties];
  [(OADTableUnnecessaryOverrideRemover *)self applyTextBodyPropertiesToCellPropertiesInCell:v16];
  v18 = [v35 textStyle];
  [(OADTableStyleResolver *)self applyTextStyle:v18 toCell:v16];

  v19 = [v17 fill];
  uint64_t v20 = objc_opt_class();
  v21 = [v35 cellStyle];
  v22 = [v21 fill];
  uint64_t v23 = objc_opt_class();

  if (v20 == v23)
  {
    v24 = [v17 fill];
    id v25 = objc_alloc_init((Class)objc_opt_class());

    v26 = [v17 fill];
    [v25 setParent:v26];

    v27 = [v35 cellStyle];
    v28 = [v27 fill];
    [v25 changeParentPreservingEffectiveValues:v28];

    if ([v25 isAnythingOverridden])
    {
      v29 = [v17 fill];
      v30 = [v17 fill];
      v31 = [(id)objc_opt_class() defaultProperties];
      [v29 changeParentPreservingEffectiveValues:v31];

      v32 = [v17 fill];
      [(OADTableUnnecessaryOverrideRemover *)self fixFill:v32];
    }
    else
    {
      [v17 setFill:0];
    }
  }
  [(OADTableUnnecessaryOverrideRemover *)self removeUnnecessaryOverridesInCellProperties:v17 strokeType:1 resolvedStroke:v34];
  [(OADTableUnnecessaryOverrideRemover *)self removeUnnecessaryOverridesInCellProperties:v17 strokeType:2 resolvedStroke:v33];
  [(OADTableUnnecessaryOverrideRemover *)self removeUnnecessaryOverridesInCellProperties:v17 strokeType:3 resolvedStroke:v14];
  [(OADTableUnnecessaryOverrideRemover *)self removeUnnecessaryOverridesInCellProperties:v17 strokeType:4 resolvedStroke:v15];
}

- (void)applyTextStyle:(id)a3 toParagraph:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setParent:0];
  if ([v24 bold] != 2) {
    objc_msgSend(v7, "setIsBold:", objc_msgSend(v24, "bold") == 0);
  }
  if ([v24 italic] != 2) {
    objc_msgSend(v7, "setIsItalic:", objc_msgSend(v24, "italic") == 0);
  }
  id v8 = [v24 color];

  if (v8)
  {
    v9 = objc_alloc_init(OADSolidFill);
    v10 = [v24 color];
    [(OADSolidFill *)v9 setColor:v10];

    [v7 setFill:v9];
  }
  uint64_t v11 = objc_opt_class();
  v12 = [v24 fontReference];
  id v13 = TSUDynamicCast(v11, (uint64_t)v12);

  if (v13)
  {
    id v14 = [v13 latinFont];
    [v7 setLatinFont:v14];

    id v15 = [v13 eastAsianFont];
    [v7 setEastAsianFont:v15];

    id v16 = [v13 complexScriptFont];
    [v7 setBidiFont:v16];
    goto LABEL_9;
  }
  uint64_t v20 = objc_opt_class();
  v21 = [v24 fontReference];
  id v16 = TSUDynamicCast(v20, (uint64_t)v21);

  if (v16)
  {
    int v22 = [v16 index];
    if (v22)
    {
      if (v22 != 1) {
        goto LABEL_9;
      }
      [v7 setLatinFont:@"+mn-lt"];
      [v7 setEastAsianFont:@"+mn-ea"];
      uint64_t v23 = @"+mn-cs";
    }
    else
    {
      [v7 setLatinFont:@"+mj-lt"];
      [v7 setEastAsianFont:@"+mj-ea"];
      uint64_t v23 = @"+mj-cs";
    }
    [v7 setBidiFont:v23];
  }
LABEL_9:

  v17 = [(OADTableUnnecessaryOverrideRemover *)self parentTextListStyle];
  v18 = [v6 properties];
  v19 = objc_msgSend(v17, "propertiesForListLevel:", (int)objc_msgSend(v18, "level"));
  [v7 setParent:v19];

  [v6 changeParentParagraphPropertiesPreservingEffectiveValues:v7];
}

- (OADTextListStyle)parentTextListStyle
{
  return self->_parentTextListStyle;
}

- (void).cxx_destruct
{
}

@end