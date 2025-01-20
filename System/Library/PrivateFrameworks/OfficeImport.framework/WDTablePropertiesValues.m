@interface WDTablePropertiesValues
- (BOOL)alignmentOverridden;
- (BOOL)baseStyleOverridden;
- (BOOL)biDirectional;
- (BOOL)biDirectionalOverridden;
- (BOOL)bottomBorderOverridden;
- (BOOL)bottomDistanceFromTextOverridden;
- (BOOL)cellSpacingOverridden;
- (BOOL)cellSpacingTypeOverridden;
- (BOOL)deletedOverridden;
- (BOOL)deletionDateOverridden;
- (BOOL)editDateOverridden;
- (BOOL)editedOverridden;
- (BOOL)formattingChangeDateOverridden;
- (BOOL)formattingChangedOverridden;
- (BOOL)horizontalAnchorOverridden;
- (BOOL)horizontalPositionOverridden;
- (BOOL)indentOverridden;
- (BOOL)indentTypeOverridden;
- (BOOL)indexToAuthorIDOfDeletionOverridden;
- (BOOL)indexToAuthorIDOfEditOverridden;
- (BOOL)indexToAuthorIDOfFormattingChangeOverridden;
- (BOOL)insideHorizontalBorderOverridden;
- (BOOL)insideVerticalBorderOverridden;
- (BOOL)justificationOverridden;
- (BOOL)leftBorderOverridden;
- (BOOL)leftDistanceFromTextOverridden;
- (BOOL)lookOverridden;
- (BOOL)rightBorderOverridden;
- (BOOL)rightDistanceFromTextOverridden;
- (BOOL)shadingOverridden;
- (BOOL)topBorderOverridden;
- (BOOL)topDistanceFromTextOverridden;
- (BOOL)verticalAnchorOverridden;
- (BOOL)verticalPositionOverridden;
- (BOOL)widthOverridden;
- (BOOL)widthTypeOverridden;
- (NSDate)deletionDate;
- (NSDate)editDate;
- (NSDate)formattingChangeDate;
- (WDBorder)bottomBorder;
- (WDBorder)insideHorizontalBorder;
- (WDBorder)insideVerticalBorder;
- (WDBorder)leftBorder;
- (WDBorder)rightBorder;
- (WDBorder)topBorder;
- (WDShading)shading;
- (WDStyle)baseStyle;
- (id)copyWithZone:(_NSZone *)a3;
- (int)alignment;
- (int)cellSpacingType;
- (int)deleted;
- (int)edited;
- (int)formattingChanged;
- (int)horizontalAnchor;
- (int)indentType;
- (int)justification;
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
- (void)setAlignment:(int)a3;
- (void)setAlignmentOverridden:(BOOL)a3;
- (void)setBaseStyle:(id)a3;
- (void)setBaseStyleOverridden:(BOOL)a3;
- (void)setBiDirectional:(BOOL)a3;
- (void)setBiDirectionalOverridden:(BOOL)a3;
- (void)setBottomBorder:(id)a3;
- (void)setBottomBorderOverridden:(BOOL)a3;
- (void)setBottomDistanceFromText:(int64_t)a3;
- (void)setBottomDistanceFromTextOverridden:(BOOL)a3;
- (void)setCellSpacing:(signed __int16)a3;
- (void)setCellSpacingOverridden:(BOOL)a3;
- (void)setCellSpacingType:(int)a3;
- (void)setCellSpacingTypeOverridden:(BOOL)a3;
- (void)setDeleted:(int)a3;
- (void)setDeletedOverridden:(BOOL)a3;
- (void)setDeletionDate:(id)a3;
- (void)setDeletionDateOverridden:(BOOL)a3;
- (void)setEditDate:(id)a3;
- (void)setEditDateOverridden:(BOOL)a3;
- (void)setEdited:(int)a3;
- (void)setEditedOverridden:(BOOL)a3;
- (void)setFormattingChangeDate:(id)a3;
- (void)setFormattingChangeDateOverridden:(BOOL)a3;
- (void)setFormattingChanged:(int)a3;
- (void)setFormattingChangedOverridden:(BOOL)a3;
- (void)setHorizontalAnchor:(int)a3;
- (void)setHorizontalAnchorOverridden:(BOOL)a3;
- (void)setHorizontalPosition:(int64_t)a3;
- (void)setHorizontalPositionOverridden:(BOOL)a3;
- (void)setIndent:(signed __int16)a3;
- (void)setIndentOverridden:(BOOL)a3;
- (void)setIndentType:(int)a3;
- (void)setIndentTypeOverridden:(BOOL)a3;
- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfDeletionOverridden:(BOOL)a3;
- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfEditOverridden:(BOOL)a3;
- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3;
- (void)setInsideHorizontalBorder:(id)a3;
- (void)setInsideHorizontalBorderOverridden:(BOOL)a3;
- (void)setInsideVerticalBorder:(id)a3;
- (void)setInsideVerticalBorderOverridden:(BOOL)a3;
- (void)setJustification:(int)a3;
- (void)setJustificationOverridden:(BOOL)a3;
- (void)setLeftBorder:(id)a3;
- (void)setLeftBorderOverridden:(BOOL)a3;
- (void)setLeftDistanceFromText:(int64_t)a3;
- (void)setLeftDistanceFromTextOverridden:(BOOL)a3;
- (void)setLook:(unsigned __int16)a3;
- (void)setLookOverridden:(BOOL)a3;
- (void)setRightBorder:(id)a3;
- (void)setRightBorderOverridden:(BOOL)a3;
- (void)setRightDistanceFromText:(int64_t)a3;
- (void)setRightDistanceFromTextOverridden:(BOOL)a3;
- (void)setShading:(id)a3;
- (void)setShadingOverridden:(BOOL)a3;
- (void)setTopBorder:(id)a3;
- (void)setTopBorderOverridden:(BOOL)a3;
- (void)setTopDistanceFromText:(int64_t)a3;
- (void)setTopDistanceFromTextOverridden:(BOOL)a3;
- (void)setVerticalAnchor:(int)a3;
- (void)setVerticalAnchorOverridden:(BOOL)a3;
- (void)setVerticalPosition:(int64_t)a3;
- (void)setVerticalPositionOverridden:(BOOL)a3;
- (void)setWidth:(int64_t)a3;
- (void)setWidthOverridden:(BOOL)a3;
- (void)setWidthType:(int)a3;
- (void)setWidthTypeOverridden:(BOOL)a3;
@end

@implementation WDTablePropertiesValues

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[WDTablePropertiesValues allocWithZone:a3] init];
  if (v4)
  {
    v5 = [(WDTablePropertiesValues *)self baseStyle];
    [(WDTablePropertiesValues *)v4 setBaseStyle:v5];

    [(WDTablePropertiesValues *)v4 setLook:[(WDTablePropertiesValues *)self look]];
    v6 = [(WDTablePropertiesValues *)self shading];
    [(WDTablePropertiesValues *)v4 setShading:v6];

    v7 = [(WDTablePropertiesValues *)self topBorder];
    [(WDTablePropertiesValues *)v4 setTopBorder:v7];

    v8 = [(WDTablePropertiesValues *)self leftBorder];
    [(WDTablePropertiesValues *)v4 setLeftBorder:v8];

    v9 = [(WDTablePropertiesValues *)self bottomBorder];
    [(WDTablePropertiesValues *)v4 setBottomBorder:v9];

    v10 = [(WDTablePropertiesValues *)self rightBorder];
    [(WDTablePropertiesValues *)v4 setRightBorder:v10];

    v11 = [(WDTablePropertiesValues *)self insideHorizontalBorder];
    [(WDTablePropertiesValues *)v4 setInsideHorizontalBorder:v11];

    v12 = [(WDTablePropertiesValues *)self insideVerticalBorder];
    [(WDTablePropertiesValues *)v4 setInsideVerticalBorder:v12];

    [(WDTablePropertiesValues *)v4 setJustification:[(WDTablePropertiesValues *)self justification]];
    [(WDTablePropertiesValues *)v4 setAlignment:[(WDTablePropertiesValues *)self alignment]];
    [(WDTablePropertiesValues *)v4 setWidth:[(WDTablePropertiesValues *)self width]];
    [(WDTablePropertiesValues *)v4 setWidthType:[(WDTablePropertiesValues *)self widthType]];
    [(WDTablePropertiesValues *)v4 setIndent:[(WDTablePropertiesValues *)self indent]];
    [(WDTablePropertiesValues *)v4 setIndentType:[(WDTablePropertiesValues *)self indentType]];
    [(WDTablePropertiesValues *)v4 setCellSpacing:[(WDTablePropertiesValues *)self cellSpacing]];
    [(WDTablePropertiesValues *)v4 setCellSpacingType:[(WDTablePropertiesValues *)self cellSpacingType]];
    [(WDTablePropertiesValues *)v4 setVerticalAnchor:[(WDTablePropertiesValues *)self verticalAnchor]];
    [(WDTablePropertiesValues *)v4 setHorizontalAnchor:[(WDTablePropertiesValues *)self horizontalAnchor]];
    [(WDTablePropertiesValues *)v4 setVerticalPosition:[(WDTablePropertiesValues *)self verticalPosition]];
    [(WDTablePropertiesValues *)v4 setHorizontalPosition:[(WDTablePropertiesValues *)self horizontalPosition]];
    [(WDTablePropertiesValues *)v4 setLeftDistanceFromText:[(WDTablePropertiesValues *)self leftDistanceFromText]];
    [(WDTablePropertiesValues *)v4 setTopDistanceFromText:[(WDTablePropertiesValues *)self topDistanceFromText]];
    [(WDTablePropertiesValues *)v4 setRightDistanceFromText:[(WDTablePropertiesValues *)self rightDistanceFromText]];
    [(WDTablePropertiesValues *)v4 setBottomDistanceFromText:[(WDTablePropertiesValues *)self bottomDistanceFromText]];
    [(WDTablePropertiesValues *)v4 setDeleted:[(WDTablePropertiesValues *)self deleted]];
    [(WDTablePropertiesValues *)v4 setEdited:[(WDTablePropertiesValues *)self edited]];
    [(WDTablePropertiesValues *)v4 setFormattingChanged:[(WDTablePropertiesValues *)self formattingChanged]];
    [(WDTablePropertiesValues *)v4 setBiDirectional:[(WDTablePropertiesValues *)self biDirectional]];
    [(WDTablePropertiesValues *)v4 setIndexToAuthorIDOfDeletion:[(WDTablePropertiesValues *)self indexToAuthorIDOfDeletion]];
    [(WDTablePropertiesValues *)v4 setIndexToAuthorIDOfEdit:[(WDTablePropertiesValues *)self indexToAuthorIDOfEdit]];
    [(WDTablePropertiesValues *)v4 setIndexToAuthorIDOfFormattingChange:[(WDTablePropertiesValues *)self indexToAuthorIDOfFormattingChange]];
    v13 = [(WDTablePropertiesValues *)self deletionDate];
    [(WDTablePropertiesValues *)v4 setDeletionDate:v13];

    v14 = [(WDTablePropertiesValues *)self editDate];
    [(WDTablePropertiesValues *)v4 setEditDate:v14];

    v15 = [(WDTablePropertiesValues *)self formattingChangeDate];
    [(WDTablePropertiesValues *)v4 setFormattingChangeDate:v15];

    [(WDTablePropertiesValues *)v4 setBaseStyleOverridden:[(WDTablePropertiesValues *)self baseStyleOverridden]];
    [(WDTablePropertiesValues *)v4 setLookOverridden:[(WDTablePropertiesValues *)self lookOverridden]];
    [(WDTablePropertiesValues *)v4 setShadingOverridden:[(WDTablePropertiesValues *)self shadingOverridden]];
    [(WDTablePropertiesValues *)v4 setTopBorderOverridden:[(WDTablePropertiesValues *)self topBorderOverridden]];
    [(WDTablePropertiesValues *)v4 setLeftBorderOverridden:[(WDTablePropertiesValues *)self leftBorderOverridden]];
    [(WDTablePropertiesValues *)v4 setBottomBorderOverridden:[(WDTablePropertiesValues *)self bottomBorderOverridden]];
    [(WDTablePropertiesValues *)v4 setRightBorderOverridden:[(WDTablePropertiesValues *)self rightBorderOverridden]];
    [(WDTablePropertiesValues *)v4 setInsideHorizontalBorderOverridden:[(WDTablePropertiesValues *)self insideHorizontalBorderOverridden]];
    [(WDTablePropertiesValues *)v4 setInsideVerticalBorderOverridden:[(WDTablePropertiesValues *)self insideVerticalBorderOverridden]];
    [(WDTablePropertiesValues *)v4 setJustificationOverridden:[(WDTablePropertiesValues *)self justificationOverridden]];
    [(WDTablePropertiesValues *)v4 setAlignmentOverridden:[(WDTablePropertiesValues *)self alignmentOverridden]];
    [(WDTablePropertiesValues *)v4 setWidthOverridden:[(WDTablePropertiesValues *)self widthOverridden]];
    [(WDTablePropertiesValues *)v4 setWidthTypeOverridden:[(WDTablePropertiesValues *)self widthTypeOverridden]];
    [(WDTablePropertiesValues *)v4 setIndentOverridden:[(WDTablePropertiesValues *)self indentOverridden]];
    [(WDTablePropertiesValues *)v4 setIndentTypeOverridden:[(WDTablePropertiesValues *)self indentTypeOverridden]];
    [(WDTablePropertiesValues *)v4 setCellSpacingOverridden:[(WDTablePropertiesValues *)self cellSpacingOverridden]];
    [(WDTablePropertiesValues *)v4 setCellSpacingTypeOverridden:[(WDTablePropertiesValues *)self cellSpacingTypeOverridden]];
    [(WDTablePropertiesValues *)v4 setVerticalAnchorOverridden:[(WDTablePropertiesValues *)self verticalAnchorOverridden]];
    [(WDTablePropertiesValues *)v4 setHorizontalAnchorOverridden:[(WDTablePropertiesValues *)self horizontalAnchorOverridden]];
    [(WDTablePropertiesValues *)v4 setVerticalPositionOverridden:[(WDTablePropertiesValues *)self verticalPositionOverridden]];
    [(WDTablePropertiesValues *)v4 setHorizontalPositionOverridden:[(WDTablePropertiesValues *)self horizontalPositionOverridden]];
    [(WDTablePropertiesValues *)v4 setLeftDistanceFromTextOverridden:[(WDTablePropertiesValues *)self leftDistanceFromTextOverridden]];
    [(WDTablePropertiesValues *)v4 setTopDistanceFromTextOverridden:[(WDTablePropertiesValues *)self topDistanceFromTextOverridden]];
    [(WDTablePropertiesValues *)v4 setRightDistanceFromTextOverridden:[(WDTablePropertiesValues *)self rightDistanceFromTextOverridden]];
    [(WDTablePropertiesValues *)v4 setBottomDistanceFromTextOverridden:[(WDTablePropertiesValues *)self bottomDistanceFromTextOverridden]];
    [(WDTablePropertiesValues *)v4 setDeletedOverridden:[(WDTablePropertiesValues *)self deletedOverridden]];
    [(WDTablePropertiesValues *)v4 setEditedOverridden:[(WDTablePropertiesValues *)self editedOverridden]];
    [(WDTablePropertiesValues *)v4 setFormattingChangedOverridden:[(WDTablePropertiesValues *)self formattingChangedOverridden]];
    [(WDTablePropertiesValues *)v4 setBiDirectionalOverridden:[(WDTablePropertiesValues *)self biDirectionalOverridden]];
    [(WDTablePropertiesValues *)v4 setIndexToAuthorIDOfDeletionOverridden:[(WDTablePropertiesValues *)self indexToAuthorIDOfDeletionOverridden]];
    [(WDTablePropertiesValues *)v4 setIndexToAuthorIDOfEditOverridden:[(WDTablePropertiesValues *)self indexToAuthorIDOfEditOverridden]];
    [(WDTablePropertiesValues *)v4 setIndexToAuthorIDOfFormattingChangeOverridden:[(WDTablePropertiesValues *)self indexToAuthorIDOfFormattingChangeOverridden]];
    [(WDTablePropertiesValues *)v4 setDeletionDateOverridden:[(WDTablePropertiesValues *)self deletionDateOverridden]];
    [(WDTablePropertiesValues *)v4 setEditDateOverridden:[(WDTablePropertiesValues *)self editDateOverridden]];
    [(WDTablePropertiesValues *)v4 setFormattingChangeDateOverridden:[(WDTablePropertiesValues *)self formattingChangeDateOverridden]];
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

- (BOOL)lookOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setLookOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFD | v3;
}

- (BOOL)shadingOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setShadingOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v3;
}

- (BOOL)topBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setTopBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xF7 | v3;
}

- (BOOL)leftBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setLeftBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xEF | v3;
}

- (BOOL)bottomBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 5) & 1;
}

- (void)setBottomBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xDF | v3;
}

- (BOOL)rightBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 6) & 1;
}

- (void)setRightBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xBF | v3;
}

- (BOOL)insideHorizontalBorderOverridden
{
  return *((unsigned __int8 *)self + 8) >> 7;
}

- (void)setInsideHorizontalBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = v3 & 0x80 | *((unsigned char *)self + 8) & 0x7F;
}

- (BOOL)insideVerticalBorderOverridden
{
  return *((unsigned char *)self + 9) & 1;
}

- (void)setInsideVerticalBorderOverridden:(BOOL)a3
{
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFE | a3;
}

- (BOOL)justificationOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 1) & 1;
}

- (void)setJustificationOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFD | v3;
}

- (BOOL)alignmentOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 2) & 1;
}

- (void)setAlignmentOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFB | v3;
}

- (BOOL)widthOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 3) & 1;
}

- (void)setWidthOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xF7 | v3;
}

- (BOOL)widthTypeOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 4) & 1;
}

- (void)setWidthTypeOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xEF | v3;
}

- (BOOL)indentOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 5) & 1;
}

- (void)setIndentOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xDF | v3;
}

- (BOOL)indentTypeOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 6) & 1;
}

- (void)setIndentTypeOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xBF | v3;
}

- (BOOL)cellSpacingOverridden
{
  return *((unsigned __int8 *)self + 9) >> 7;
}

- (void)setCellSpacingOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = v3 & 0x80 | *((unsigned char *)self + 9) & 0x7F;
}

- (BOOL)cellSpacingTypeOverridden
{
  return *((unsigned char *)self + 10) & 1;
}

- (void)setCellSpacingTypeOverridden:(BOOL)a3
{
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFE | a3;
}

- (BOOL)verticalAnchorOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 1) & 1;
}

- (void)setVerticalAnchorOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFD | v3;
}

- (BOOL)horizontalAnchorOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 2) & 1;
}

- (void)setHorizontalAnchorOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFB | v3;
}

- (BOOL)verticalPositionOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 3) & 1;
}

- (void)setVerticalPositionOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xF7 | v3;
}

- (BOOL)horizontalPositionOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 4) & 1;
}

- (void)setHorizontalPositionOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xEF | v3;
}

- (BOOL)leftDistanceFromTextOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 5) & 1;
}

- (void)setLeftDistanceFromTextOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xDF | v3;
}

- (BOOL)topDistanceFromTextOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 6) & 1;
}

- (void)setTopDistanceFromTextOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xBF | v3;
}

- (BOOL)rightDistanceFromTextOverridden
{
  return *((unsigned __int8 *)self + 10) >> 7;
}

- (void)setRightDistanceFromTextOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = v3 & 0x80 | *((unsigned char *)self + 10) & 0x7F;
}

- (BOOL)bottomDistanceFromTextOverridden
{
  return *((unsigned char *)self + 11) & 1;
}

- (void)setBottomDistanceFromTextOverridden:(BOOL)a3
{
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFE | a3;
}

- (BOOL)deletedOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 1) & 1;
}

- (void)setDeletedOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFD | v3;
}

- (BOOL)editedOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 2) & 1;
}

- (void)setEditedOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFB | v3;
}

- (BOOL)formattingChangedOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 3) & 1;
}

- (void)setFormattingChangedOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xF7 | v3;
}

- (BOOL)biDirectionalOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 4) & 1;
}

- (void)setBiDirectionalOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xEF | v3;
}

- (BOOL)indexToAuthorIDOfDeletionOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 5) & 1;
}

- (void)setIndexToAuthorIDOfDeletionOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xDF | v3;
}

- (BOOL)indexToAuthorIDOfEditOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 6) & 1;
}

- (void)setIndexToAuthorIDOfEditOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xBF | v3;
}

- (BOOL)indexToAuthorIDOfFormattingChangeOverridden
{
  return *((unsigned __int8 *)self + 11) >> 7;
}

- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = v3 & 0x80 | *((unsigned char *)self + 11) & 0x7F;
}

- (BOOL)deletionDateOverridden
{
  return *((unsigned char *)self + 12) & 1;
}

- (void)setDeletionDateOverridden:(BOOL)a3
{
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFE | a3;
}

- (BOOL)editDateOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 1) & 1;
}

- (void)setEditDateOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFD | v3;
}

- (BOOL)formattingChangeDateOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 2) & 1;
}

- (void)setFormattingChangeDateOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFB | v3;
}

- (WDStyle)baseStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseStyle);
  return (WDStyle *)WeakRetained;
}

- (void)setBaseStyle:(id)a3
{
}

- (unsigned)look
{
  return self->_look;
}

- (void)setLook:(unsigned __int16)a3
{
  self->_look = a3;
}

- (WDShading)shading
{
  return self->_shading;
}

- (void)setShading:(id)a3
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

- (WDBorder)insideHorizontalBorder
{
  return self->_insideHorizontalBorder;
}

- (void)setInsideHorizontalBorder:(id)a3
{
}

- (WDBorder)insideVerticalBorder
{
  return self->_insideVerticalBorder;
}

- (void)setInsideVerticalBorder:(id)a3
{
}

- (int)justification
{
  return self->_justification;
}

- (void)setJustification:(int)a3
{
  self->_justification = a3;
}

- (int)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int)a3
{
  self->_alignment = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int)widthType
{
  return self->_widthType;
}

- (void)setWidthType:(int)a3
{
  self->_widthType = a3;
}

- (signed)indent
{
  return self->_indent;
}

- (void)setIndent:(signed __int16)a3
{
  self->_indent = a3;
}

- (int)indentType
{
  return self->_indentType;
}

- (void)setIndentType:(int)a3
{
  self->_indentType = a3;
}

- (signed)cellSpacing
{
  return self->_cellSpacing;
}

- (void)setCellSpacing:(signed __int16)a3
{
  self->_cellSpacing = a3;
}

- (int)cellSpacingType
{
  return self->_cellSpacingType;
}

- (void)setCellSpacingType:(int)a3
{
  self->_cellSpacingType = a3;
}

- (int)verticalAnchor
{
  return self->_verticalAnchor;
}

- (void)setVerticalAnchor:(int)a3
{
  self->_verticalAnchor = a3;
}

- (int)horizontalAnchor
{
  return self->_horizontalAnchor;
}

- (void)setHorizontalAnchor:(int)a3
{
  self->_horizontalAnchor = a3;
}

- (int64_t)verticalPosition
{
  return self->_verticalPosition;
}

- (void)setVerticalPosition:(int64_t)a3
{
  self->_verticalPosition = a3;
}

- (int64_t)horizontalPosition
{
  return self->_horizontalPosition;
}

- (void)setHorizontalPosition:(int64_t)a3
{
  self->_horizontalPosition = a3;
}

- (int64_t)leftDistanceFromText
{
  return self->_leftDistanceFromText;
}

- (void)setLeftDistanceFromText:(int64_t)a3
{
  self->_leftDistanceFromText = a3;
}

- (int64_t)topDistanceFromText
{
  return self->_topDistanceFromText;
}

- (void)setTopDistanceFromText:(int64_t)a3
{
  self->_topDistanceFromText = a3;
}

- (int64_t)rightDistanceFromText
{
  return self->_rightDistanceFromText;
}

- (void)setRightDistanceFromText:(int64_t)a3
{
  self->_rightDistanceFromText = a3;
}

- (int64_t)bottomDistanceFromText
{
  return self->_bottomDistanceFromText;
}

- (void)setBottomDistanceFromText:(int64_t)a3
{
  self->_bottomDistanceFromText = a3;
}

- (int)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(int)a3
{
  self->_deleted = a3;
}

- (int)edited
{
  return self->_edited;
}

- (void)setEdited:(int)a3
{
  self->_edited = a3;
}

- (int)formattingChanged
{
  return self->_formattingChanged;
}

- (void)setFormattingChanged:(int)a3
{
  self->_formattingChanged = a3;
}

- (BOOL)biDirectional
{
  return self->_biDirectional;
}

- (void)setBiDirectional:(BOOL)a3
{
  self->_biDirectional = a3;
}

- (unsigned)indexToAuthorIDOfDeletion
{
  return self->_indexToAuthorIDOfDeletion;
}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfDeletion = a3;
}

- (unsigned)indexToAuthorIDOfEdit
{
  return self->_indexToAuthorIDOfEdit;
}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfEdit = a3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  return self->_indexToAuthorIDOfFormattingChange;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfFormattingChange = a3;
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
}

- (NSDate)editDate
{
  return self->_editDate;
}

- (void)setEditDate:(id)a3
{
}

- (NSDate)formattingChangeDate
{
  return self->_formattingChangeDate;
}

- (void)setFormattingChangeDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattingChangeDate, 0);
  objc_storeStrong((id *)&self->_editDate, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_insideVerticalBorder, 0);
  objc_storeStrong((id *)&self->_insideHorizontalBorder, 0);
  objc_storeStrong((id *)&self->_rightBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_leftBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_shading, 0);
  objc_destroyWeak((id *)&self->_baseStyle);
}

@end