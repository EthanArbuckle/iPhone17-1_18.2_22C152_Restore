@interface WDParagraphPropertiesValues
- ($06D0163FE0D7AFE752A9F21F38483579)dropCap;
- (BOOL)anchorLock;
- (BOOL)anchorLockOverridden;
- (BOOL)barBorderOverridden;
- (BOOL)baseStyleOverridden;
- (BOOL)betweenBorderOverridden;
- (BOOL)biDi;
- (BOOL)biDiOverridden;
- (BOOL)bottomBorderOverridden;
- (BOOL)cachedRtl;
- (BOOL)cachedRtlOverridden;
- (BOOL)contextualSpacing;
- (BOOL)contextualSpacingOverridden;
- (BOOL)dropCapOverridden;
- (BOOL)firstLineIndentCharsOverridden;
- (BOOL)firstLineIndentOverridden;
- (BOOL)followingIndentOverridden;
- (BOOL)formattingChangedOverridden;
- (BOOL)heightOverridden;
- (BOOL)heightRuleOverridden;
- (BOOL)horizontalAnchorOverridden;
- (BOOL)horizontalPositionOverridden;
- (BOOL)horizontalSpaceOverridden;
- (BOOL)indexToAuthorIDOfFormattingChangeOverridden;
- (BOOL)justificationOverridden;
- (BOOL)keepLinesTogether;
- (BOOL)keepLinesTogetherOverridden;
- (BOOL)keepNextParagraphTogether;
- (BOOL)keepNextParagraphTogetherOverridden;
- (BOOL)kinsokuOff;
- (BOOL)kinsokuOffOverridden;
- (BOOL)leadingIndentOverridden;
- (BOOL)leftBorderOverridden;
- (BOOL)leftIndentCharsOverridden;
- (BOOL)leftIndentOverridden;
- (BOOL)lineSpacingOverridden;
- (BOOL)lineSpacingRuleOverridden;
- (BOOL)listIndexOverridden;
- (BOOL)listLevelOverridden;
- (BOOL)outlineLevelOverridden;
- (BOOL)pageBreakBefore;
- (BOOL)pageBreakBeforeOverridden;
- (BOOL)physicalJustificationOverridden;
- (BOOL)rightBorderOverridden;
- (BOOL)rightIndentCharsOverridden;
- (BOOL)rightIndentOverridden;
- (BOOL)shadingOverridden;
- (BOOL)spaceAfterAuto;
- (BOOL)spaceAfterAutoOverridden;
- (BOOL)spaceAfterOverridden;
- (BOOL)spaceBeforeAuto;
- (BOOL)spaceBeforeAutoOverridden;
- (BOOL)spaceBeforeOverridden;
- (BOOL)suppressAutoHyphens;
- (BOOL)suppressAutoHyphensOverridden;
- (BOOL)suppressLineNumbers;
- (BOOL)suppressLineNumbersOverridden;
- (BOOL)tabStopAddedCountOverridden;
- (BOOL)tabStopDeletedCountOverridden;
- (BOOL)topBorderOverridden;
- (BOOL)verticalAnchorOverridden;
- (BOOL)verticalPositionOverridden;
- (BOOL)verticalSpaceOverridden;
- (BOOL)widowControl;
- (BOOL)widowControlOverridden;
- (BOOL)widthOverridden;
- (BOOL)wrap;
- (BOOL)wrapCodeOverridden;
- (BOOL)wrapOverridden;
- (NSMutableData)tabStopAddedTable;
- (NSMutableData)tabStopDeletedTable;
- (WDBorder)barBorder;
- (WDBorder)betweenBorder;
- (WDBorder)bottomBorder;
- (WDBorder)leftBorder;
- (WDBorder)rightBorder;
- (WDBorder)topBorder;
- (WDShading)shading;
- (WDStyle)baseStyle;
- (char)wrapCode;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)horizontalPosition;
- (int64_t)horizontalSpace;
- (int64_t)listIndex;
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
- (unint64_t)tabStopAddedCount;
- (unint64_t)tabStopDeletedCount;
- (unsigned)formattingChanged;
- (unsigned)height;
- (unsigned)heightRule;
- (unsigned)horizontalAnchor;
- (unsigned)indexToAuthorIDOfFormattingChange;
- (unsigned)justification;
- (unsigned)lineSpacingRule;
- (unsigned)listLevel;
- (unsigned)outlineLevel;
- (unsigned)physicalJustification;
- (unsigned)spaceAfter;
- (unsigned)spaceBefore;
- (unsigned)verticalAnchor;
- (void)setAnchorLock:(BOOL)a3;
- (void)setAnchorLockOverridden:(BOOL)a3;
- (void)setBarBorder:(id)a3;
- (void)setBarBorderOverridden:(BOOL)a3;
- (void)setBaseStyle:(id)a3;
- (void)setBaseStyleOverridden:(BOOL)a3;
- (void)setBetweenBorder:(id)a3;
- (void)setBetweenBorderOverridden:(BOOL)a3;
- (void)setBiDi:(BOOL)a3;
- (void)setBiDiOverridden:(BOOL)a3;
- (void)setBottomBorder:(id)a3;
- (void)setBottomBorderOverridden:(BOOL)a3;
- (void)setCachedRtl:(BOOL)a3;
- (void)setCachedRtlOverridden:(BOOL)a3;
- (void)setContextualSpacing:(BOOL)a3;
- (void)setContextualSpacingOverridden:(BOOL)a3;
- (void)setDropCap:(id)a3;
- (void)setDropCapOverridden:(BOOL)a3;
- (void)setFirstLineIndent:(signed __int16)a3;
- (void)setFirstLineIndentChars:(signed __int16)a3;
- (void)setFirstLineIndentCharsOverridden:(BOOL)a3;
- (void)setFirstLineIndentOverridden:(BOOL)a3;
- (void)setFollowingIndent:(signed __int16)a3;
- (void)setFollowingIndentOverridden:(BOOL)a3;
- (void)setFormattingChanged:(unsigned __int8)a3;
- (void)setFormattingChangedOverridden:(BOOL)a3;
- (void)setHeight:(unsigned __int16)a3;
- (void)setHeightOverridden:(BOOL)a3;
- (void)setHeightRule:(unsigned __int8)a3;
- (void)setHeightRuleOverridden:(BOOL)a3;
- (void)setHorizontalAnchor:(unsigned __int8)a3;
- (void)setHorizontalAnchorOverridden:(BOOL)a3;
- (void)setHorizontalPosition:(int64_t)a3;
- (void)setHorizontalPositionOverridden:(BOOL)a3;
- (void)setHorizontalSpace:(int64_t)a3;
- (void)setHorizontalSpaceOverridden:(BOOL)a3;
- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3;
- (void)setJustification:(unsigned __int8)a3;
- (void)setJustificationOverridden:(BOOL)a3;
- (void)setKeepLinesTogether:(BOOL)a3;
- (void)setKeepLinesTogetherOverridden:(BOOL)a3;
- (void)setKeepNextParagraphTogether:(BOOL)a3;
- (void)setKeepNextParagraphTogetherOverridden:(BOOL)a3;
- (void)setKinsokuOff:(BOOL)a3;
- (void)setKinsokuOffOverridden:(BOOL)a3;
- (void)setLeadingIndent:(signed __int16)a3;
- (void)setLeadingIndentOverridden:(BOOL)a3;
- (void)setLeftBorder:(id)a3;
- (void)setLeftBorderOverridden:(BOOL)a3;
- (void)setLeftIndent:(signed __int16)a3;
- (void)setLeftIndentChars:(signed __int16)a3;
- (void)setLeftIndentCharsOverridden:(BOOL)a3;
- (void)setLeftIndentOverridden:(BOOL)a3;
- (void)setLineSpacing:(signed __int16)a3;
- (void)setLineSpacingOverridden:(BOOL)a3;
- (void)setLineSpacingRule:(unsigned __int8)a3;
- (void)setLineSpacingRuleOverridden:(BOOL)a3;
- (void)setListIndex:(int64_t)a3;
- (void)setListIndexOverridden:(BOOL)a3;
- (void)setListLevel:(unsigned __int8)a3;
- (void)setListLevelOverridden:(BOOL)a3;
- (void)setOutlineLevel:(unsigned __int16)a3;
- (void)setOutlineLevelOverridden:(BOOL)a3;
- (void)setPageBreakBefore:(BOOL)a3;
- (void)setPageBreakBeforeOverridden:(BOOL)a3;
- (void)setPhysicalJustification:(unsigned __int8)a3;
- (void)setPhysicalJustificationOverridden:(BOOL)a3;
- (void)setRightBorder:(id)a3;
- (void)setRightBorderOverridden:(BOOL)a3;
- (void)setRightIndent:(signed __int16)a3;
- (void)setRightIndentChars:(signed __int16)a3;
- (void)setRightIndentCharsOverridden:(BOOL)a3;
- (void)setRightIndentOverridden:(BOOL)a3;
- (void)setShading:(id)a3;
- (void)setShadingOverridden:(BOOL)a3;
- (void)setSpaceAfter:(unsigned __int16)a3;
- (void)setSpaceAfterAuto:(BOOL)a3;
- (void)setSpaceAfterAutoOverridden:(BOOL)a3;
- (void)setSpaceAfterOverridden:(BOOL)a3;
- (void)setSpaceBefore:(unsigned __int16)a3;
- (void)setSpaceBeforeAuto:(BOOL)a3;
- (void)setSpaceBeforeAutoOverridden:(BOOL)a3;
- (void)setSpaceBeforeOverridden:(BOOL)a3;
- (void)setSuppressAutoHyphens:(BOOL)a3;
- (void)setSuppressAutoHyphensOverridden:(BOOL)a3;
- (void)setSuppressLineNumbers:(BOOL)a3;
- (void)setSuppressLineNumbersOverridden:(BOOL)a3;
- (void)setTabStopAddedCount:(unint64_t)a3;
- (void)setTabStopAddedCountOverridden:(BOOL)a3;
- (void)setTabStopAddedTable:(id)a3;
- (void)setTabStopDeletedCount:(unint64_t)a3;
- (void)setTabStopDeletedCountOverridden:(BOOL)a3;
- (void)setTabStopDeletedTable:(id)a3;
- (void)setTopBorder:(id)a3;
- (void)setTopBorderOverridden:(BOOL)a3;
- (void)setVerticalAnchor:(unsigned __int8)a3;
- (void)setVerticalAnchorOverridden:(BOOL)a3;
- (void)setVerticalPosition:(int64_t)a3;
- (void)setVerticalPositionOverridden:(BOOL)a3;
- (void)setVerticalSpace:(int64_t)a3;
- (void)setVerticalSpaceOverridden:(BOOL)a3;
- (void)setWidowControl:(BOOL)a3;
- (void)setWidowControlOverridden:(BOOL)a3;
- (void)setWidth:(int64_t)a3;
- (void)setWidthOverridden:(BOOL)a3;
- (void)setWrap:(BOOL)a3;
- (void)setWrapCode:(char)a3;
- (void)setWrapCodeOverridden:(BOOL)a3;
- (void)setWrapOverridden:(BOOL)a3;
@end

@implementation WDParagraphPropertiesValues

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[WDParagraphPropertiesValues allocWithZone:a3] init];
  if (v4)
  {
    v5 = [(WDParagraphPropertiesValues *)self baseStyle];
    [(WDParagraphPropertiesValues *)v4 setBaseStyle:v5];

    v6 = [(WDParagraphPropertiesValues *)self topBorder];
    [(WDParagraphPropertiesValues *)v4 setTopBorder:v6];

    v7 = [(WDParagraphPropertiesValues *)self leftBorder];
    [(WDParagraphPropertiesValues *)v4 setLeftBorder:v7];

    v8 = [(WDParagraphPropertiesValues *)self bottomBorder];
    [(WDParagraphPropertiesValues *)v4 setBottomBorder:v8];

    v9 = [(WDParagraphPropertiesValues *)self rightBorder];
    [(WDParagraphPropertiesValues *)v4 setRightBorder:v9];

    v10 = [(WDParagraphPropertiesValues *)self betweenBorder];
    [(WDParagraphPropertiesValues *)v4 setBetweenBorder:v10];

    v11 = [(WDParagraphPropertiesValues *)self barBorder];
    [(WDParagraphPropertiesValues *)v4 setBarBorder:v11];

    v12 = [(WDParagraphPropertiesValues *)self shading];
    [(WDParagraphPropertiesValues *)v4 setShading:v12];

    [(WDParagraphPropertiesValues *)v4 setDropCap:(unsigned __int16)[(WDParagraphPropertiesValues *)self dropCap]];
    v13 = [(WDParagraphPropertiesValues *)self tabStopAddedTable];
    [(WDParagraphPropertiesValues *)v4 setTabStopAddedTable:v13];

    v14 = [(WDParagraphPropertiesValues *)self tabStopDeletedTable];
    [(WDParagraphPropertiesValues *)v4 setTabStopDeletedTable:v14];

    [(WDParagraphPropertiesValues *)v4 setListIndex:[(WDParagraphPropertiesValues *)self listIndex]];
    [(WDParagraphPropertiesValues *)v4 setTabStopAddedCount:[(WDParagraphPropertiesValues *)self tabStopAddedCount]];
    [(WDParagraphPropertiesValues *)v4 setTabStopDeletedCount:[(WDParagraphPropertiesValues *)self tabStopDeletedCount]];
    [(WDParagraphPropertiesValues *)v4 setWidth:[(WDParagraphPropertiesValues *)self width]];
    [(WDParagraphPropertiesValues *)v4 setVerticalSpace:[(WDParagraphPropertiesValues *)self verticalSpace]];
    [(WDParagraphPropertiesValues *)v4 setHorizontalSpace:[(WDParagraphPropertiesValues *)self horizontalSpace]];
    [(WDParagraphPropertiesValues *)v4 setHorizontalPosition:[(WDParagraphPropertiesValues *)self horizontalPosition]];
    [(WDParagraphPropertiesValues *)v4 setVerticalPosition:[(WDParagraphPropertiesValues *)self verticalPosition]];
    [(WDParagraphPropertiesValues *)v4 setLineSpacing:[(WDParagraphPropertiesValues *)self lineSpacing]];
    [(WDParagraphPropertiesValues *)v4 setLeftIndent:[(WDParagraphPropertiesValues *)self leftIndent]];
    [(WDParagraphPropertiesValues *)v4 setRightIndent:[(WDParagraphPropertiesValues *)self rightIndent]];
    [(WDParagraphPropertiesValues *)v4 setLeadingIndent:[(WDParagraphPropertiesValues *)self leadingIndent]];
    [(WDParagraphPropertiesValues *)v4 setFollowingIndent:[(WDParagraphPropertiesValues *)self followingIndent]];
    [(WDParagraphPropertiesValues *)v4 setFirstLineIndent:[(WDParagraphPropertiesValues *)self firstLineIndent]];
    [(WDParagraphPropertiesValues *)v4 setLeftIndentChars:[(WDParagraphPropertiesValues *)self leftIndentChars]];
    [(WDParagraphPropertiesValues *)v4 setRightIndentChars:[(WDParagraphPropertiesValues *)self rightIndentChars]];
    [(WDParagraphPropertiesValues *)v4 setFirstLineIndentChars:[(WDParagraphPropertiesValues *)self firstLineIndentChars]];
    [(WDParagraphPropertiesValues *)v4 setSpaceBefore:[(WDParagraphPropertiesValues *)self spaceBefore]];
    [(WDParagraphPropertiesValues *)v4 setSpaceAfter:[(WDParagraphPropertiesValues *)self spaceAfter]];
    [(WDParagraphPropertiesValues *)v4 setHeight:[(WDParagraphPropertiesValues *)self height]];
    [(WDParagraphPropertiesValues *)v4 setOutlineLevel:[(WDParagraphPropertiesValues *)self outlineLevel]];
    [(WDParagraphPropertiesValues *)v4 setIndexToAuthorIDOfFormattingChange:[(WDParagraphPropertiesValues *)self indexToAuthorIDOfFormattingChange]];
    [(WDParagraphPropertiesValues *)v4 setWrapCode:[(WDParagraphPropertiesValues *)self wrapCode]];
    [(WDParagraphPropertiesValues *)v4 setHorizontalAnchor:[(WDParagraphPropertiesValues *)self horizontalAnchor]];
    [(WDParagraphPropertiesValues *)v4 setVerticalAnchor:[(WDParagraphPropertiesValues *)self verticalAnchor]];
    [(WDParagraphPropertiesValues *)v4 setLineSpacingRule:[(WDParagraphPropertiesValues *)self lineSpacingRule]];
    [(WDParagraphPropertiesValues *)v4 setHeightRule:[(WDParagraphPropertiesValues *)self heightRule]];
    [(WDParagraphPropertiesValues *)v4 setListLevel:[(WDParagraphPropertiesValues *)self listLevel]];
    [(WDParagraphPropertiesValues *)v4 setJustification:[(WDParagraphPropertiesValues *)self justification]];
    [(WDParagraphPropertiesValues *)v4 setPhysicalJustification:[(WDParagraphPropertiesValues *)self physicalJustification]];
    [(WDParagraphPropertiesValues *)v4 setFormattingChanged:[(WDParagraphPropertiesValues *)self formattingChanged]];
    [(WDParagraphPropertiesValues *)v4 setBaseStyleOverridden:[(WDParagraphPropertiesValues *)self baseStyleOverridden]];
    [(WDParagraphPropertiesValues *)v4 setPageBreakBefore:[(WDParagraphPropertiesValues *)self pageBreakBefore]];
    [(WDParagraphPropertiesValues *)v4 setPageBreakBeforeOverridden:[(WDParagraphPropertiesValues *)self pageBreakBeforeOverridden]];
    [(WDParagraphPropertiesValues *)v4 setListLevelOverridden:[(WDParagraphPropertiesValues *)self listLevelOverridden]];
    [(WDParagraphPropertiesValues *)v4 setListIndexOverridden:[(WDParagraphPropertiesValues *)self listIndexOverridden]];
    [(WDParagraphPropertiesValues *)v4 setTopBorderOverridden:[(WDParagraphPropertiesValues *)self topBorderOverridden]];
    [(WDParagraphPropertiesValues *)v4 setLeftBorderOverridden:[(WDParagraphPropertiesValues *)self leftBorderOverridden]];
    [(WDParagraphPropertiesValues *)v4 setBottomBorderOverridden:[(WDParagraphPropertiesValues *)self bottomBorderOverridden]];
    [(WDParagraphPropertiesValues *)v4 setRightBorderOverridden:[(WDParagraphPropertiesValues *)self rightBorderOverridden]];
    [(WDParagraphPropertiesValues *)v4 setBetweenBorderOverridden:[(WDParagraphPropertiesValues *)self betweenBorderOverridden]];
    [(WDParagraphPropertiesValues *)v4 setBarBorderOverridden:[(WDParagraphPropertiesValues *)self barBorderOverridden]];
    [(WDParagraphPropertiesValues *)v4 setShadingOverridden:[(WDParagraphPropertiesValues *)self shadingOverridden]];
    [(WDParagraphPropertiesValues *)v4 setDropCapOverridden:[(WDParagraphPropertiesValues *)self dropCapOverridden]];
    [(WDParagraphPropertiesValues *)v4 setWidthOverridden:[(WDParagraphPropertiesValues *)self widthOverridden]];
    [(WDParagraphPropertiesValues *)v4 setHeightOverridden:[(WDParagraphPropertiesValues *)self heightOverridden]];
    [(WDParagraphPropertiesValues *)v4 setHeightRuleOverridden:[(WDParagraphPropertiesValues *)self heightRuleOverridden]];
    [(WDParagraphPropertiesValues *)v4 setVerticalSpaceOverridden:[(WDParagraphPropertiesValues *)self verticalSpaceOverridden]];
    [(WDParagraphPropertiesValues *)v4 setHorizontalSpaceOverridden:[(WDParagraphPropertiesValues *)self horizontalSpaceOverridden]];
    [(WDParagraphPropertiesValues *)v4 setWrap:[(WDParagraphPropertiesValues *)self wrap]];
    [(WDParagraphPropertiesValues *)v4 setWrapOverridden:[(WDParagraphPropertiesValues *)self wrapOverridden]];
    [(WDParagraphPropertiesValues *)v4 setHorizontalAnchorOverridden:[(WDParagraphPropertiesValues *)self horizontalAnchorOverridden]];
    [(WDParagraphPropertiesValues *)v4 setVerticalAnchorOverridden:[(WDParagraphPropertiesValues *)self verticalAnchorOverridden]];
    [(WDParagraphPropertiesValues *)v4 setHorizontalPositionOverridden:[(WDParagraphPropertiesValues *)self horizontalPositionOverridden]];
    [(WDParagraphPropertiesValues *)v4 setVerticalPositionOverridden:[(WDParagraphPropertiesValues *)self verticalPositionOverridden]];
    [(WDParagraphPropertiesValues *)v4 setWrapCodeOverridden:[(WDParagraphPropertiesValues *)self wrapCodeOverridden]];
    [(WDParagraphPropertiesValues *)v4 setAnchorLock:[(WDParagraphPropertiesValues *)self anchorLock]];
    [(WDParagraphPropertiesValues *)v4 setAnchorLockOverridden:[(WDParagraphPropertiesValues *)self anchorLockOverridden]];
    [(WDParagraphPropertiesValues *)v4 setSpaceBeforeOverridden:[(WDParagraphPropertiesValues *)self spaceBeforeOverridden]];
    [(WDParagraphPropertiesValues *)v4 setSpaceBeforeAuto:[(WDParagraphPropertiesValues *)self spaceBeforeAuto]];
    [(WDParagraphPropertiesValues *)v4 setSpaceBeforeAutoOverridden:[(WDParagraphPropertiesValues *)self spaceBeforeAutoOverridden]];
    [(WDParagraphPropertiesValues *)v4 setSpaceAfterOverridden:[(WDParagraphPropertiesValues *)self spaceAfterOverridden]];
    [(WDParagraphPropertiesValues *)v4 setSpaceAfterAuto:[(WDParagraphPropertiesValues *)self spaceAfterAuto]];
    [(WDParagraphPropertiesValues *)v4 setSpaceAfterAutoOverridden:[(WDParagraphPropertiesValues *)self spaceAfterAutoOverridden]];
    [(WDParagraphPropertiesValues *)v4 setLineSpacingOverridden:[(WDParagraphPropertiesValues *)self lineSpacingOverridden]];
    [(WDParagraphPropertiesValues *)v4 setLineSpacingRuleOverridden:[(WDParagraphPropertiesValues *)self lineSpacingRuleOverridden]];
    [(WDParagraphPropertiesValues *)v4 setLeftIndentOverridden:[(WDParagraphPropertiesValues *)self leftIndentOverridden]];
    [(WDParagraphPropertiesValues *)v4 setRightIndentOverridden:[(WDParagraphPropertiesValues *)self rightIndentOverridden]];
    [(WDParagraphPropertiesValues *)v4 setLeadingIndentOverridden:[(WDParagraphPropertiesValues *)self leadingIndentOverridden]];
    [(WDParagraphPropertiesValues *)v4 setFollowingIndentOverridden:[(WDParagraphPropertiesValues *)self followingIndentOverridden]];
    [(WDParagraphPropertiesValues *)v4 setFirstLineIndentOverridden:[(WDParagraphPropertiesValues *)self firstLineIndentOverridden]];
    [(WDParagraphPropertiesValues *)v4 setLeftIndentCharsOverridden:[(WDParagraphPropertiesValues *)self leftIndentCharsOverridden]];
    [(WDParagraphPropertiesValues *)v4 setRightIndentCharsOverridden:[(WDParagraphPropertiesValues *)self rightIndentCharsOverridden]];
    [(WDParagraphPropertiesValues *)v4 setFirstLineIndentCharsOverridden:[(WDParagraphPropertiesValues *)self firstLineIndentCharsOverridden]];
    [(WDParagraphPropertiesValues *)v4 setJustificationOverridden:[(WDParagraphPropertiesValues *)self justificationOverridden]];
    [(WDParagraphPropertiesValues *)v4 setPhysicalJustificationOverridden:[(WDParagraphPropertiesValues *)self physicalJustificationOverridden]];
    [(WDParagraphPropertiesValues *)v4 setOutlineLevelOverridden:[(WDParagraphPropertiesValues *)self outlineLevelOverridden]];
    [(WDParagraphPropertiesValues *)v4 setKeepNextParagraphTogether:[(WDParagraphPropertiesValues *)self keepNextParagraphTogether]];
    [(WDParagraphPropertiesValues *)v4 setKeepNextParagraphTogetherOverridden:[(WDParagraphPropertiesValues *)self keepNextParagraphTogetherOverridden]];
    [(WDParagraphPropertiesValues *)v4 setKeepLinesTogether:[(WDParagraphPropertiesValues *)self keepLinesTogether]];
    [(WDParagraphPropertiesValues *)v4 setKeepLinesTogetherOverridden:[(WDParagraphPropertiesValues *)self keepLinesTogetherOverridden]];
    [(WDParagraphPropertiesValues *)v4 setSuppressAutoHyphens:[(WDParagraphPropertiesValues *)self suppressAutoHyphens]];
    [(WDParagraphPropertiesValues *)v4 setSuppressAutoHyphensOverridden:[(WDParagraphPropertiesValues *)self suppressAutoHyphensOverridden]];
    [(WDParagraphPropertiesValues *)v4 setSuppressLineNumbers:[(WDParagraphPropertiesValues *)self suppressLineNumbers]];
    [(WDParagraphPropertiesValues *)v4 setSuppressLineNumbersOverridden:[(WDParagraphPropertiesValues *)self suppressLineNumbersOverridden]];
    [(WDParagraphPropertiesValues *)v4 setWidowControl:[(WDParagraphPropertiesValues *)self widowControl]];
    [(WDParagraphPropertiesValues *)v4 setWidowControlOverridden:[(WDParagraphPropertiesValues *)self widowControlOverridden]];
    [(WDParagraphPropertiesValues *)v4 setKinsokuOff:[(WDParagraphPropertiesValues *)self kinsokuOff]];
    [(WDParagraphPropertiesValues *)v4 setKinsokuOffOverridden:[(WDParagraphPropertiesValues *)self kinsokuOffOverridden]];
    [(WDParagraphPropertiesValues *)v4 setTabStopAddedCountOverridden:[(WDParagraphPropertiesValues *)self tabStopAddedCountOverridden]];
    [(WDParagraphPropertiesValues *)v4 setTabStopDeletedCountOverridden:[(WDParagraphPropertiesValues *)self tabStopDeletedCountOverridden]];
    [(WDParagraphPropertiesValues *)v4 setFormattingChangedOverridden:[(WDParagraphPropertiesValues *)self formattingChangedOverridden]];
    [(WDParagraphPropertiesValues *)v4 setBiDi:[(WDParagraphPropertiesValues *)self biDi]];
    [(WDParagraphPropertiesValues *)v4 setBiDiOverridden:[(WDParagraphPropertiesValues *)self biDiOverridden]];
    [(WDParagraphPropertiesValues *)v4 setCachedRtl:[(WDParagraphPropertiesValues *)self cachedRtl]];
    [(WDParagraphPropertiesValues *)v4 setCachedRtlOverridden:[(WDParagraphPropertiesValues *)self cachedRtlOverridden]];
    [(WDParagraphPropertiesValues *)v4 setIndexToAuthorIDOfFormattingChangeOverridden:[(WDParagraphPropertiesValues *)self indexToAuthorIDOfFormattingChangeOverridden]];
    [(WDParagraphPropertiesValues *)v4 setContextualSpacing:[(WDParagraphPropertiesValues *)self contextualSpacing]];
    [(WDParagraphPropertiesValues *)v4 setContextualSpacingOverridden:[(WDParagraphPropertiesValues *)self contextualSpacingOverridden]];
  }
  return v4;
}

- (BOOL)baseStyleOverridden
{
  return *((unsigned char *)self + 8) & 1;
}

- (void)setBaseStyleOverridden:(BOOL)a3
{
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFE | a3;
}

- (BOOL)pageBreakBefore
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setPageBreakBefore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFD | v3;
}

- (BOOL)pageBreakBeforeOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setPageBreakBeforeOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v3;
}

- (BOOL)listLevelOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setListLevelOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xF7 | v3;
}

- (BOOL)listIndexOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setListIndexOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xEF | v3;
}

- (BOOL)topBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 5) & 1;
}

- (void)setTopBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xDF | v3;
}

- (BOOL)leftBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 6) & 1;
}

- (void)setLeftBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xBF | v3;
}

- (BOOL)bottomBorderOverridden
{
  return *((unsigned __int8 *)self + 8) >> 7;
}

- (void)setBottomBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = v3 & 0x80 | *((unsigned char *)self + 8) & 0x7F;
}

- (BOOL)rightBorderOverridden
{
  return *((unsigned char *)self + 9) & 1;
}

- (void)setRightBorderOverridden:(BOOL)a3
{
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFE | a3;
}

- (BOOL)betweenBorderOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 1) & 1;
}

- (void)setBetweenBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFD | v3;
}

- (BOOL)barBorderOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 2) & 1;
}

- (void)setBarBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFB | v3;
}

- (BOOL)shadingOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 3) & 1;
}

- (void)setShadingOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xF7 | v3;
}

- (BOOL)dropCapOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 4) & 1;
}

- (void)setDropCapOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xEF | v3;
}

- (BOOL)widthOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 5) & 1;
}

- (void)setWidthOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xDF | v3;
}

- (BOOL)heightOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 6) & 1;
}

- (void)setHeightOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xBF | v3;
}

- (BOOL)heightRuleOverridden
{
  return *((unsigned __int8 *)self + 9) >> 7;
}

- (void)setHeightRuleOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = v3 & 0x80 | *((unsigned char *)self + 9) & 0x7F;
}

- (BOOL)verticalSpaceOverridden
{
  return *((unsigned char *)self + 10) & 1;
}

- (void)setVerticalSpaceOverridden:(BOOL)a3
{
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFE | a3;
}

- (BOOL)horizontalSpaceOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 1) & 1;
}

- (void)setHorizontalSpaceOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFD | v3;
}

- (BOOL)wrap
{
  return (*((unsigned __int8 *)self + 10) >> 2) & 1;
}

- (void)setWrap:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFB | v3;
}

- (BOOL)wrapOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 3) & 1;
}

- (void)setWrapOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xF7 | v3;
}

- (BOOL)horizontalAnchorOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 4) & 1;
}

- (void)setHorizontalAnchorOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xEF | v3;
}

- (BOOL)verticalAnchorOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 5) & 1;
}

- (void)setVerticalAnchorOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xDF | v3;
}

- (BOOL)horizontalPositionOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 6) & 1;
}

- (void)setHorizontalPositionOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xBF | v3;
}

- (BOOL)verticalPositionOverridden
{
  return *((unsigned __int8 *)self + 10) >> 7;
}

- (void)setVerticalPositionOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = v3 & 0x80 | *((unsigned char *)self + 10) & 0x7F;
}

- (BOOL)wrapCodeOverridden
{
  return *((unsigned char *)self + 11) & 1;
}

- (void)setWrapCodeOverridden:(BOOL)a3
{
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFE | a3;
}

- (BOOL)anchorLock
{
  return (*((unsigned __int8 *)self + 11) >> 1) & 1;
}

- (void)setAnchorLock:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFD | v3;
}

- (BOOL)anchorLockOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 2) & 1;
}

- (void)setAnchorLockOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFB | v3;
}

- (BOOL)spaceBeforeOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 3) & 1;
}

- (void)setSpaceBeforeOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xF7 | v3;
}

- (BOOL)spaceBeforeAuto
{
  return (*((unsigned __int8 *)self + 11) >> 4) & 1;
}

- (void)setSpaceBeforeAuto:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xEF | v3;
}

- (BOOL)spaceBeforeAutoOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 5) & 1;
}

- (void)setSpaceBeforeAutoOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xDF | v3;
}

- (BOOL)spaceAfterOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 6) & 1;
}

- (void)setSpaceAfterOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xBF | v3;
}

- (BOOL)spaceAfterAuto
{
  return *((unsigned __int8 *)self + 11) >> 7;
}

- (void)setSpaceAfterAuto:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = v3 & 0x80 | *((unsigned char *)self + 11) & 0x7F;
}

- (BOOL)spaceAfterAutoOverridden
{
  return *((unsigned char *)self + 12) & 1;
}

- (void)setSpaceAfterAutoOverridden:(BOOL)a3
{
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFE | a3;
}

- (BOOL)lineSpacingOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 1) & 1;
}

- (void)setLineSpacingOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFD | v3;
}

- (BOOL)lineSpacingRuleOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 2) & 1;
}

- (void)setLineSpacingRuleOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFB | v3;
}

- (BOOL)leftIndentOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 3) & 1;
}

- (void)setLeftIndentOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xF7 | v3;
}

- (BOOL)rightIndentOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 4) & 1;
}

- (void)setRightIndentOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xEF | v3;
}

- (BOOL)leadingIndentOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 5) & 1;
}

- (void)setLeadingIndentOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xDF | v3;
}

- (BOOL)followingIndentOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 6) & 1;
}

- (void)setFollowingIndentOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xBF | v3;
}

- (BOOL)firstLineIndentOverridden
{
  return *((unsigned __int8 *)self + 12) >> 7;
}

- (void)setFirstLineIndentOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = v3 & 0x80 | *((unsigned char *)self + 12) & 0x7F;
}

- (BOOL)leftIndentCharsOverridden
{
  return *((unsigned char *)self + 13) & 1;
}

- (void)setLeftIndentCharsOverridden:(BOOL)a3
{
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xFE | a3;
}

- (BOOL)rightIndentCharsOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 1) & 1;
}

- (void)setRightIndentCharsOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xFD | v3;
}

- (BOOL)firstLineIndentCharsOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 2) & 1;
}

- (void)setFirstLineIndentCharsOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xFB | v3;
}

- (BOOL)justificationOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 3) & 1;
}

- (void)setJustificationOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xF7 | v3;
}

- (BOOL)physicalJustificationOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 4) & 1;
}

- (void)setPhysicalJustificationOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xEF | v3;
}

- (BOOL)outlineLevelOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 5) & 1;
}

- (void)setOutlineLevelOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xDF | v3;
}

- (BOOL)keepNextParagraphTogether
{
  return (*((unsigned __int8 *)self + 13) >> 6) & 1;
}

- (void)setKeepNextParagraphTogether:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xBF | v3;
}

- (BOOL)keepNextParagraphTogetherOverridden
{
  return *((unsigned __int8 *)self + 13) >> 7;
}

- (void)setKeepNextParagraphTogetherOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = v3 & 0x80 | *((unsigned char *)self + 13) & 0x7F;
}

- (BOOL)keepLinesTogether
{
  return *((unsigned char *)self + 14) & 1;
}

- (void)setKeepLinesTogether:(BOOL)a3
{
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xFE | a3;
}

- (BOOL)keepLinesTogetherOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 1) & 1;
}

- (void)setKeepLinesTogetherOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xFD | v3;
}

- (BOOL)suppressAutoHyphens
{
  return (*((unsigned __int8 *)self + 14) >> 2) & 1;
}

- (void)setSuppressAutoHyphens:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xFB | v3;
}

- (BOOL)suppressAutoHyphensOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 3) & 1;
}

- (void)setSuppressAutoHyphensOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xF7 | v3;
}

- (BOOL)suppressLineNumbers
{
  return (*((unsigned __int8 *)self + 14) >> 4) & 1;
}

- (void)setSuppressLineNumbers:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xEF | v3;
}

- (BOOL)suppressLineNumbersOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 5) & 1;
}

- (void)setSuppressLineNumbersOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xDF | v3;
}

- (BOOL)widowControl
{
  return (*((unsigned __int8 *)self + 14) >> 6) & 1;
}

- (void)setWidowControl:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xBF | v3;
}

- (BOOL)widowControlOverridden
{
  return *((unsigned __int8 *)self + 14) >> 7;
}

- (void)setWidowControlOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = v3 & 0x80 | *((unsigned char *)self + 14) & 0x7F;
}

- (BOOL)kinsokuOff
{
  return *((unsigned char *)self + 15) & 1;
}

- (void)setKinsokuOff:(BOOL)a3
{
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xFE | a3;
}

- (BOOL)kinsokuOffOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 1) & 1;
}

- (void)setKinsokuOffOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xFD | v3;
}

- (BOOL)tabStopAddedCountOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 2) & 1;
}

- (void)setTabStopAddedCountOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xFB | v3;
}

- (BOOL)tabStopDeletedCountOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 3) & 1;
}

- (void)setTabStopDeletedCountOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xF7 | v3;
}

- (BOOL)formattingChangedOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 4) & 1;
}

- (void)setFormattingChangedOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xEF | v3;
}

- (BOOL)biDi
{
  return (*((unsigned __int8 *)self + 15) >> 5) & 1;
}

- (void)setBiDi:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xDF | v3;
}

- (BOOL)biDiOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 6) & 1;
}

- (void)setBiDiOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xBF | v3;
}

- (BOOL)cachedRtl
{
  return *((unsigned __int8 *)self + 15) >> 7;
}

- (void)setCachedRtl:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = v3 & 0x80 | *((unsigned char *)self + 15) & 0x7F;
}

- (BOOL)cachedRtlOverridden
{
  return *((unsigned char *)self + 16) & 1;
}

- (void)setCachedRtlOverridden:(BOOL)a3
{
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFE | a3;
}

- (BOOL)indexToAuthorIDOfFormattingChangeOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFD | v3;
}

- (BOOL)contextualSpacing
{
  return (*((unsigned __int8 *)self + 16) >> 2) & 1;
}

- (void)setContextualSpacing:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFB | v3;
}

- (BOOL)contextualSpacingOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setContextualSpacingOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xF7 | v3;
}

- (WDStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
}

- (WDBorder)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
}

- (WDBorder)leftBorder
{
  return self->_leftBorder;
}

- (void)setLeftBorder:(id)a3
{
}

- (WDBorder)bottomBorder
{
  return self->_bottomBorder;
}

- (void)setBottomBorder:(id)a3
{
}

- (WDBorder)rightBorder
{
  return self->_rightBorder;
}

- (void)setRightBorder:(id)a3
{
}

- (WDBorder)betweenBorder
{
  return self->_betweenBorder;
}

- (void)setBetweenBorder:(id)a3
{
}

- (WDBorder)barBorder
{
  return self->_barBorder;
}

- (void)setBarBorder:(id)a3
{
}

- (WDShading)shading
{
  return self->_shading;
}

- (void)setShading:(id)a3
{
}

- ($06D0163FE0D7AFE752A9F21F38483579)dropCap
{
  objc_copyStruct(&dest, &self->_dropCap, 2, 1, 0);
  return dest;
}

- (void)setDropCap:(id)a3
{
  $06D0163FE0D7AFE752A9F21F38483579 src = a3;
  objc_copyStruct(&self->_dropCap, &src, 2, 1, 0);
}

- (NSMutableData)tabStopAddedTable
{
  return self->_tabStopAddedTable;
}

- (void)setTabStopAddedTable:(id)a3
{
}

- (NSMutableData)tabStopDeletedTable
{
  return self->_tabStopDeletedTable;
}

- (void)setTabStopDeletedTable:(id)a3
{
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(int64_t)a3
{
  self->_listIndex = a3;
}

- (unint64_t)tabStopAddedCount
{
  return self->_tabStopAddedCount;
}

- (void)setTabStopAddedCount:(unint64_t)a3
{
  self->_tabStopAddedCount = a3;
}

- (unint64_t)tabStopDeletedCount
{
  return self->_tabStopDeletedCount;
}

- (void)setTabStopDeletedCount:(unint64_t)a3
{
  self->_tabStopDeletedCount = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)verticalSpace
{
  return self->_verticalSpace;
}

- (void)setVerticalSpace:(int64_t)a3
{
  self->_verticalSpace = a3;
}

- (int64_t)horizontalSpace
{
  return self->_horizontalSpace;
}

- (void)setHorizontalSpace:(int64_t)a3
{
  self->_horizontalSpace = a3;
}

- (int64_t)horizontalPosition
{
  return self->_horizontalPosition;
}

- (void)setHorizontalPosition:(int64_t)a3
{
  self->_horizontalPosition = a3;
}

- (int64_t)verticalPosition
{
  return self->_verticalPosition;
}

- (void)setVerticalPosition:(int64_t)a3
{
  self->_verticalPosition = a3;
}

- (signed)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(signed __int16)a3
{
  self->_lineSpacing = a3;
}

- (signed)leftIndent
{
  return self->_leftIndent;
}

- (void)setLeftIndent:(signed __int16)a3
{
  self->_leftIndent = a3;
}

- (signed)rightIndent
{
  return self->_rightIndent;
}

- (void)setRightIndent:(signed __int16)a3
{
  self->_rightIndent = a3;
}

- (signed)leadingIndent
{
  return self->_leadingIndent;
}

- (void)setLeadingIndent:(signed __int16)a3
{
  self->_leadingIndent = a3;
}

- (signed)followingIndent
{
  return self->_followingIndent;
}

- (void)setFollowingIndent:(signed __int16)a3
{
  self->_followingIndent = a3;
}

- (signed)firstLineIndent
{
  return self->_firstLineIndent;
}

- (void)setFirstLineIndent:(signed __int16)a3
{
  self->_firstLineIndent = a3;
}

- (signed)leftIndentChars
{
  return self->_leftIndentChars;
}

- (void)setLeftIndentChars:(signed __int16)a3
{
  self->_leftIndentChars = a3;
}

- (signed)rightIndentChars
{
  return self->_rightIndentChars;
}

- (void)setRightIndentChars:(signed __int16)a3
{
  self->_rightIndentChars = a3;
}

- (signed)firstLineIndentChars
{
  return self->_firstLineIndentChars;
}

- (void)setFirstLineIndentChars:(signed __int16)a3
{
  self->_firstLineIndentChars = a3;
}

- (unsigned)spaceBefore
{
  return self->_spaceBefore;
}

- (void)setSpaceBefore:(unsigned __int16)a3
{
  self->_spaceBefore = a3;
}

- (unsigned)spaceAfter
{
  return self->_spaceAfter;
}

- (void)setSpaceAfter:(unsigned __int16)a3
{
  self->_spaceAfter = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned __int16)a3
{
  self->_height = a3;
}

- (unsigned)outlineLevel
{
  return self->_outlineLevel;
}

- (void)setOutlineLevel:(unsigned __int16)a3
{
  self->_outlineLevel = a3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  return self->_indexToAuthorIDOfFormattingChange;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfFormattingChange = a3;
}

- (char)wrapCode
{
  return self->_wrapCode;
}

- (void)setWrapCode:(char)a3
{
  self->_wrapCode = a3;
}

- (unsigned)horizontalAnchor
{
  return self->_horizontalAnchor;
}

- (void)setHorizontalAnchor:(unsigned __int8)a3
{
  self->_horizontalAnchor = a3;
}

- (unsigned)verticalAnchor
{
  return self->_verticalAnchor;
}

- (void)setVerticalAnchor:(unsigned __int8)a3
{
  self->_verticalAnchor = a3;
}

- (unsigned)lineSpacingRule
{
  return self->_lineSpacingRule;
}

- (void)setLineSpacingRule:(unsigned __int8)a3
{
  self->_lineSpacingRule = a3;
}

- (unsigned)heightRule
{
  return self->_heightRule;
}

- (void)setHeightRule:(unsigned __int8)a3
{
  self->_heightRule = a3;
}

- (unsigned)listLevel
{
  return self->_listLevel;
}

- (void)setListLevel:(unsigned __int8)a3
{
  self->_listLevel = a3;
}

- (unsigned)justification
{
  return self->_justification;
}

- (void)setJustification:(unsigned __int8)a3
{
  self->_justification = a3;
}

- (unsigned)physicalJustification
{
  return self->_physicalJustification;
}

- (void)setPhysicalJustification:(unsigned __int8)a3
{
  self->_physicalJustification = a3;
}

- (unsigned)formattingChanged
{
  return self->_formattingChanged;
}

- (void)setFormattingChanged:(unsigned __int8)a3
{
  self->_formattingChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabStopDeletedTable, 0);
  objc_storeStrong((id *)&self->_tabStopAddedTable, 0);
  objc_storeStrong((id *)&self->_shading, 0);
  objc_storeStrong((id *)&self->_barBorder, 0);
  objc_storeStrong((id *)&self->_betweenBorder, 0);
  objc_storeStrong((id *)&self->_rightBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_leftBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end