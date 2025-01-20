@interface UIKeyboardCandidateViewStyle
+ (id)darkKeyboardStyle;
+ (id)darkKeyboardStyleForDisambiguation;
+ (id)disambiguationStyleForDarkKeyboard:(BOOL)a3;
+ (id)lightKeyboardStyle;
+ (id)lightKeyboardStyleForDisambiguation;
+ (id)styleForDarkKeyboard:(BOOL)a3;
+ (id)tvGridStyleForDarkKeyboard:(BOOL)a3;
+ (id)tvLinearStyleForDarkKeyboard:(BOOL)a3;
+ (id)visionInlineStyle;
- (BOOL)allowCandidateGridExpanding;
- (BOOL)applyCornerRadiusToAllCandidates;
- (BOOL)arrowButtonBackgroundHidden;
- (BOOL)arrowButtonHighlightBackgroundHidden;
- (BOOL)darkBackdrop;
- (BOOL)disableSwitchingSortingMethodByTabKey;
- (BOOL)doNotClipToBounds;
- (BOOL)dontSelectLastItemByBackwardMoving;
- (BOOL)dragGestureDisabled;
- (BOOL)fillGridWithLines;
- (BOOL)hasShadow;
- (BOOL)hideLinesOnDisambiguationGridEdges;
- (BOOL)hideSlottedCellSeparators;
- (BOOL)hidesPartialCandidates;
- (BOOL)isEqual:(id)a3;
- (BOOL)maximizeSortControlWidthWithPadding;
- (BOOL)performScalingAnimationOnCellHighlight;
- (BOOL)roundsArrowButtonEdge;
- (BOOL)scrollDisabled;
- (BOOL)shouldJustifyRow;
- (BOOL)shouldScrollIfShowingLastVisibleRow;
- (BOOL)shouldUpdateCollectionViewWidthForArrowButtonVisibility;
- (BOOL)showCellBorderForSpaceConfirmationCandidate;
- (BOOL)showExtraLineBeforeFirstRow;
- (BOOL)showOneMoreCandidate;
- (BOOL)showsIndex;
- (BOOL)skipInlineCandidate;
- (CGPoint)gridLineOffset;
- (NSDictionary)suggestionCandidateBodyFontAttributes;
- (NSDictionary)suggestionCandidateHeaderFontAttributes;
- (NSString)arrowButtonImageName;
- (NSString)proactiveCandidateContentsGravity;
- (UIButtonConfiguration)arrowButtonConfig;
- (UIColor)alternativeTextColor;
- (UIColor)arrowButtonBackgroundColor;
- (UIColor)arrowButtonColor;
- (UIColor)backgroundColor;
- (UIColor)candidateNumberColor;
- (UIColor)cellBackgroundColor;
- (UIColor)gridBackgroundColor;
- (UIColor)groupHeaderBackgroundColor;
- (UIColor)highlightedAlternativeTextColor;
- (UIColor)highlightedBackgroundColor;
- (UIColor)highlightedCandidateNumberColor;
- (UIColor)highlightedRowBackgroundColor;
- (UIColor)highlightedTextColor;
- (UIColor)lineColor;
- (UIColor)sortControlBackgroundColor;
- (UIColor)sortControlColor;
- (UIColor)spaceConfirmationCandidateCellBackgroundColor;
- (UIColor)textColor;
- (UIColor)transliterationCandidateBackgroundColor;
- (UIEdgeInsets)arrowButtonPadding;
- (UIEdgeInsets)extraCellPadding;
- (UIEdgeInsets)gridLinePadding;
- (UIEdgeInsets)gridPadding;
- (UIEdgeInsets)groupHeaderPadding;
- (UIEdgeInsets)sortControlPadding;
- (UIFont)alternativeTextFont;
- (UIFont)annotationTextFont;
- (UIFont)candidateFont;
- (UIFont)candidateNumberFont;
- (UIFont)sortControlFont;
- (UIFont)supplementalLexiconCandidateFont;
- (UIImage)arrowButtonSeparatorImage;
- (UIImage)autofillExtraCandidateImage;
- (UIImage)cellBackgroundImage;
- (UIImage)cellSeparatorImage;
- (UIImage)highlightedCellBackgroundImage;
- (UIImage)leftEdgeMaskImage;
- (UIImage)leftEdgeSeparatorImage;
- (UIImage)rightEdgeMaskImage;
- (UIImage)rightEdgeSeparatorImage;
- (UIImage)slottedCellSeparatorImage;
- (UIImage)transliterationCandidateBackgroundImage;
- (double)alternativeTextLeftSpacing;
- (double)arrowButtonHeight;
- (double)backgroundOpacity;
- (double)cellCornerRadius;
- (double)cornerRadius;
- (double)foregroundOpacity;
- (double)interRowSpacing;
- (double)maximumIconWidth;
- (double)minimumCellPadding;
- (double)minimumCellWidth;
- (double)minimumInterItemSpacing;
- (double)rowHeight;
- (double)singleSlottedCellMargin;
- (double)slottedCandidatesIterItemSpacing;
- (double)widthOfGridGradient;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)alternativeTextAlignment;
- (int64_t)cellTextAlignment;
- (int64_t)layoutOrientation;
- (int64_t)lineBreakMode;
- (int64_t)minimumNumberOfCandidates;
- (unint64_t)columnsCount;
- (unint64_t)gridMaskedCorners;
- (unint64_t)maskedCorners;
- (unint64_t)maxNumberOfProactiveCells;
- (void)setAllowCandidateGridExpanding:(BOOL)a3;
- (void)setAlternativeTextAlignment:(int64_t)a3;
- (void)setAlternativeTextColor:(id)a3;
- (void)setAlternativeTextFont:(id)a3;
- (void)setAlternativeTextLeftSpacing:(double)a3;
- (void)setAnnotationTextFont:(id)a3;
- (void)setApplyCornerRadiusToAllCandidates:(BOOL)a3;
- (void)setArrowButtonBackgroundColor:(id)a3;
- (void)setArrowButtonBackgroundHidden:(BOOL)a3;
- (void)setArrowButtonColor:(id)a3;
- (void)setArrowButtonConfig:(id)a3;
- (void)setArrowButtonHeight:(double)a3;
- (void)setArrowButtonHighlightBackgroundHidden:(BOOL)a3;
- (void)setArrowButtonImageName:(id)a3;
- (void)setArrowButtonPadding:(UIEdgeInsets)a3;
- (void)setArrowButtonSeparatorImage:(id)a3;
- (void)setAutofillExtraCandidateImage:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundOpacity:(double)a3;
- (void)setCandidateFont:(id)a3;
- (void)setCandidateNumberColor:(id)a3;
- (void)setCandidateNumberFont:(id)a3;
- (void)setCellBackgroundColor:(id)a3;
- (void)setCellBackgroundImage:(id)a3;
- (void)setCellCornerRadius:(double)a3;
- (void)setCellSeparatorImage:(id)a3;
- (void)setCellTextAlignment:(int64_t)a3;
- (void)setColumnsCount:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDarkBackdrop:(BOOL)a3;
- (void)setDisableSwitchingSortingMethodByTabKey:(BOOL)a3;
- (void)setDoNotClipToBounds:(BOOL)a3;
- (void)setDontSelectLastItemByBackwardMoving:(BOOL)a3;
- (void)setDragGestureDisabled:(BOOL)a3;
- (void)setExtraCellPadding:(UIEdgeInsets)a3;
- (void)setFillGridWithLines:(BOOL)a3;
- (void)setForegroundOpacity:(double)a3;
- (void)setGridBackgroundColor:(id)a3;
- (void)setGridLineOffset:(CGPoint)a3;
- (void)setGridLinePadding:(UIEdgeInsets)a3;
- (void)setGridMaskedCorners:(unint64_t)a3;
- (void)setGridPadding:(UIEdgeInsets)a3;
- (void)setGroupHeaderBackgroundColor:(id)a3;
- (void)setGroupHeaderPadding:(UIEdgeInsets)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setHideLinesOnDisambiguationGridEdges:(BOOL)a3;
- (void)setHideSlottedCellSeparators:(BOOL)a3;
- (void)setHidesPartialCandidates:(BOOL)a3;
- (void)setHighlightedAlternativeTextColor:(id)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setHighlightedCandidateNumberColor:(id)a3;
- (void)setHighlightedCellBackgroundImage:(id)a3;
- (void)setHighlightedRowBackgroundColor:(id)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setInterRowSpacing:(double)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLeftEdgeMaskImage:(id)a3;
- (void)setLeftEdgeSeparatorImage:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setLineColor:(id)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setMaxNumberOfProactiveCells:(unint64_t)a3;
- (void)setMaximizeSortControlWidthWithPadding:(BOOL)a3;
- (void)setMaximumIconWidth:(double)a3;
- (void)setMinimumCellPadding:(double)a3;
- (void)setMinimumCellWidth:(double)a3;
- (void)setMinimumInterItemSpacing:(double)a3;
- (void)setMinimumNumberOfCandidates:(int64_t)a3;
- (void)setPerformScalingAnimationOnCellHighlight:(BOOL)a3;
- (void)setProactiveCandidateContentsGravity:(id)a3;
- (void)setRightEdgeMaskImage:(id)a3;
- (void)setRightEdgeSeparatorImage:(id)a3;
- (void)setRoundsArrowButtonEdge:(BOOL)a3;
- (void)setRowHeight:(double)a3;
- (void)setScrollDisabled:(BOOL)a3;
- (void)setShouldJustifyRow:(BOOL)a3;
- (void)setShouldScrollIfShowingLastVisibleRow:(BOOL)a3;
- (void)setShouldUpdateCollectionViewWidthForArrowButtonVisibility:(BOOL)a3;
- (void)setShowCellBorderForSpaceConfirmationCandidate:(BOOL)a3;
- (void)setShowExtraLineBeforeFirstRow:(BOOL)a3;
- (void)setShowOneMoreCandidate:(BOOL)a3;
- (void)setShowsIndex:(BOOL)a3;
- (void)setSingleSlottedCellMargin:(double)a3;
- (void)setSkipInlineCandidate:(BOOL)a3;
- (void)setSlottedCandidatesIterItemSpacing:(double)a3;
- (void)setSlottedCellSeparatorImage:(id)a3;
- (void)setSortControlBackgroundColor:(id)a3;
- (void)setSortControlColor:(id)a3;
- (void)setSortControlFont:(id)a3;
- (void)setSortControlPadding:(UIEdgeInsets)a3;
- (void)setSpaceConfirmationCandidateCellBackgroundColor:(id)a3;
- (void)setSuggestionCandidateBodyFontAttributes:(id)a3;
- (void)setSuggestionCandidateHeaderFontAttributes:(id)a3;
- (void)setSupplementalLexiconCandidateFont:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTransliterationCandidateBackgroundColor:(id)a3;
- (void)setWidthOfGridGradient:(double)a3;
@end

@implementation UIKeyboardCandidateViewStyle

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 5, self->_candidateFont);
  objc_storeStrong(v4 + 8, self->_candidateFont);
  objc_storeStrong(v4 + 7, self->_annotationTextFont);
  objc_storeStrong(v4 + 9, self->_candidateNumberFont);
  objc_storeStrong(v4 + 10, self->_sortControlFont);
  objc_storeStrong(v4 + 11, self->_textColor);
  objc_storeStrong(v4 + 12, self->_highlightedTextColor);
  objc_storeStrong(v4 + 13, self->_alternativeTextColor);
  objc_storeStrong(v4 + 14, self->_highlightedAlternativeTextColor);
  objc_storeStrong(v4 + 15, self->_candidateNumberColor);
  objc_storeStrong(v4 + 16, self->_highlightedCandidateNumberColor);
  objc_storeStrong(v4 + 18, self->_cellBackgroundColor);
  objc_storeStrong(v4 + 17, self->_backgroundColor);
  objc_storeStrong(v4 + 19, self->_arrowButtonBackgroundColor);
  *((unsigned char *)v4 + 8) = self->_arrowButtonBackgroundHidden;
  objc_storeStrong(v4 + 20, self->_arrowButtonColor);
  objc_storeStrong(v4 + 21, self->_gridBackgroundColor);
  objc_storeStrong(v4 + 22, self->_highlightedBackgroundColor);
  objc_storeStrong(v4 + 24, self->_groupHeaderBackgroundColor);
  objc_storeStrong(v4 + 26, self->_lineColor);
  objc_storeStrong(v4 + 27, self->_sortControlColor);
  objc_storeStrong(v4 + 28, self->_sortControlBackgroundColor);
  uint64_t v5 = [(NSString *)self->_arrowButtonImageName copy];
  id v6 = v4[29];
  v4[29] = (id)v5;

  objc_storeStrong(v4 + 30, self->_cellSeparatorImage);
  objc_storeStrong(v4 + 31, self->_slottedCellSeparatorImage);
  objc_storeStrong(v4 + 32, self->_leftEdgeSeparatorImage);
  objc_storeStrong(v4 + 33, self->_rightEdgeSeparatorImage);
  objc_storeStrong(v4 + 29, self->_arrowButtonImageName);
  objc_storeStrong(v4 + 35, self->_leftEdgeMaskImage);
  objc_storeStrong(v4 + 36, self->_rightEdgeMaskImage);
  objc_storeStrong(v4 + 37, self->_cellBackgroundImage);
  objc_storeStrong(v4 + 38, self->_highlightedCellBackgroundImage);
  v4[40] = *(id *)&self->_rowHeight;
  v4[42] = *(id *)&self->_cornerRadius;
  v4[44] = self->_maskedCorners;
  v4[46] = *(id *)&self->_foregroundOpacity;
  v4[47] = *(id *)&self->_backgroundOpacity;
  *((unsigned char *)v4 + 10) = self->_hasShadow;
  *((unsigned char *)v4 + 11) = self->_roundsArrowButtonEdge;
  v4[48] = self->_layoutOrientation;
  v4[49] = self->_columnsCount;
  v4[50] = self->_maxNumberOfProactiveCells;
  v4[51] = *(id *)&self->_minimumCellPadding;
  v4[52] = *(id *)&self->_minimumCellWidth;
  v4[53] = *(id *)&self->_minimumInterItemSpacing;
  v4[54] = *(id *)&self->_maximumIconWidth;
  *((unsigned char *)v4 + 12) = self->_shouldJustifyRow;
  v4[55] = *(id *)&self->_singleSlottedCellMargin;
  long long v7 = *(_OWORD *)&self->_extraCellPadding.bottom;
  *((_OWORD *)v4 + 36) = *(_OWORD *)&self->_extraCellPadding.top;
  *((_OWORD *)v4 + 37) = v7;
  long long v8 = *(_OWORD *)&self->_gridPadding.bottom;
  *((_OWORD *)v4 + 40) = *(_OWORD *)&self->_gridPadding.top;
  *((_OWORD *)v4 + 41) = v8;
  long long v9 = *(_OWORD *)&self->_gridLinePadding.bottom;
  *((_OWORD *)v4 + 42) = *(_OWORD *)&self->_gridLinePadding.top;
  *((_OWORD *)v4 + 43) = v9;
  *((_OWORD *)v4 + 35) = self->_gridLineOffset;
  long long v10 = *(_OWORD *)&self->_sortControlPadding.bottom;
  *((_OWORD *)v4 + 44) = *(_OWORD *)&self->_sortControlPadding.top;
  *((_OWORD *)v4 + 45) = v10;
  v4[56] = self->_cellTextAlignment;
  v4[58] = self->_lineBreakMode;
  *((unsigned char *)v4 + 13) = self->_darkBackdrop;
  *((unsigned char *)v4 + 14) = self->_scrollDisabled;
  *((unsigned char *)v4 + 15) = self->_dragGestureDisabled;
  *((unsigned char *)v4 + 17) = self->_showsIndex;
  *((unsigned char *)v4 + 20) = self->_dontSelectLastItemByBackwardMoving;
  *((unsigned char *)v4 + 21) = self->_showOneMoreCandidate;
  *((unsigned char *)v4 + 22) = self->_disableSwitchingSortingMethodByTabKey;
  *((unsigned char *)v4 + 23) = self->_skipInlineCandidate;
  *((unsigned char *)v4 + 24) = self->_hidesPartialCandidates;
  v4[59] = self->_minimumNumberOfCandidates;
  v4[60] = *(id *)&self->_widthOfGridGradient;
  *((unsigned char *)v4 + 25) = self->_showCellBorderForSpaceConfirmationCandidate;
  *((unsigned char *)v4 + 26) = self->_performScalingAnimationOnCellHighlight;
  *((unsigned char *)v4 + 27) = self->_arrowButtonHighlightBackgroundHidden;
  objc_storeStrong(v4 + 61, self->_arrowButtonConfig);
  objc_storeStrong(v4 + 62, self->_spaceConfirmationCandidateCellBackgroundColor);
  *((unsigned char *)v4 + 28) = self->_hideLinesOnDisambiguationGridEdges;
  *((unsigned char *)v4 + 29) = self->_maximizeSortControlWidthWithPadding;
  v4[63] = *(id *)&self->_alternativeTextLeftSpacing;
  long long v11 = *(_OWORD *)&self->_groupHeaderPadding.bottom;
  *((_OWORD *)v4 + 46) = *(_OWORD *)&self->_groupHeaderPadding.top;
  *((_OWORD *)v4 + 47) = v11;
  v4[64] = *(id *)&self->_interRowSpacing;
  *((unsigned char *)v4 + 30) = self->_applyCornerRadiusToAllCandidates;
  objc_storeStrong(v4 + 65, self->_autofillExtraCandidateImage);
  v4[66] = *(id *)&self->_slottedCandidatesIterItemSpacing;
  objc_storeStrong(v4 + 67, self->_suggestionCandidateHeaderFontAttributes);
  objc_storeStrong(v4 + 68, self->_suggestionCandidateBodyFontAttributes);
  *((unsigned char *)v4 + 31) = self->_shouldUpdateCollectionViewWidthForArrowButtonVisibility;
  *((unsigned char *)v4 + 32) = self->_hideSlottedCellSeparators;
  objc_storeStrong(v4 + 69, self->_proactiveCandidateContentsGravity);
  *((unsigned char *)v4 + 33) = self->_shouldScrollIfShowingLastVisibleRow;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIKeyboardCandidateViewStyle *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    candidateFont = self->_candidateFont;
    if (candidateFont == v6->_candidateFont) {
      char v8 = 1;
    }
    else {
      char v8 = -[UIFont isEqual:](candidateFont, "isEqual:");
    }
    alternativeTextFont = self->_alternativeTextFont;
    if (alternativeTextFont == v6->_alternativeTextFont) {
      char v11 = 1;
    }
    else {
      char v11 = -[UIFont isEqual:](alternativeTextFont, "isEqual:");
    }
    char v12 = v8 & v11;
    annotationTextFont = self->_annotationTextFont;
    if (annotationTextFont == v6->_annotationTextFont) {
      char v14 = 1;
    }
    else {
      char v14 = -[UIFont isEqual:](annotationTextFont, "isEqual:");
    }
    char v15 = v12 & v14;
    candidateNumberFont = self->_candidateNumberFont;
    if (candidateNumberFont == v6->_candidateNumberFont) {
      char v17 = 1;
    }
    else {
      char v17 = -[UIFont isEqual:](candidateNumberFont, "isEqual:");
    }
    char v18 = v15 & v17;
    sortControlFont = self->_sortControlFont;
    if (sortControlFont == v6->_sortControlFont) {
      char v20 = 1;
    }
    else {
      char v20 = -[UIFont isEqual:](sortControlFont, "isEqual:");
    }
    char v21 = v18 & v20;
    textColor = self->_textColor;
    if (textColor == v6->_textColor) {
      char v23 = 1;
    }
    else {
      char v23 = -[UIColor isEqual:](textColor, "isEqual:");
    }
    char v24 = v21 & v23;
    highlightedTextColor = self->_highlightedTextColor;
    if (highlightedTextColor == v6->_highlightedTextColor) {
      char v26 = 1;
    }
    else {
      char v26 = -[UIColor isEqual:](highlightedTextColor, "isEqual:");
    }
    char v27 = v24 & v26;
    alternativeTextColor = self->_alternativeTextColor;
    if (alternativeTextColor == v6->_alternativeTextColor) {
      char v29 = 1;
    }
    else {
      char v29 = -[UIColor isEqual:](alternativeTextColor, "isEqual:");
    }
    char v30 = v27 & v29;
    highlightedAlternativeTextColor = self->_highlightedAlternativeTextColor;
    if (highlightedAlternativeTextColor == v6->_highlightedAlternativeTextColor) {
      char v32 = 1;
    }
    else {
      char v32 = -[UIColor isEqual:](highlightedAlternativeTextColor, "isEqual:");
    }
    char v33 = v30 & v32;
    candidateNumberColor = self->_candidateNumberColor;
    if (candidateNumberColor == v6->_candidateNumberColor) {
      char v35 = 1;
    }
    else {
      char v35 = -[UIColor isEqual:](candidateNumberColor, "isEqual:");
    }
    char v36 = v33 & v35;
    highlightedCandidateNumberColor = self->_highlightedCandidateNumberColor;
    if (highlightedCandidateNumberColor == v6->_highlightedCandidateNumberColor) {
      char v38 = 1;
    }
    else {
      char v38 = -[UIColor isEqual:](highlightedCandidateNumberColor, "isEqual:");
    }
    char v39 = v36 & v38;
    backgroundColor = self->_backgroundColor;
    if (backgroundColor == v6->_backgroundColor) {
      char v41 = 1;
    }
    else {
      char v41 = -[UIColor isEqual:](backgroundColor, "isEqual:");
    }
    char v42 = v39 & v41;
    arrowButtonBackgroundColor = self->_arrowButtonBackgroundColor;
    if (arrowButtonBackgroundColor == v6->_arrowButtonBackgroundColor) {
      char v44 = 1;
    }
    else {
      char v44 = -[UIColor isEqual:](arrowButtonBackgroundColor, "isEqual:");
    }
    if (self->_arrowButtonBackgroundHidden == v6->_arrowButtonBackgroundHidden) {
      char v45 = v42 & v44;
    }
    else {
      char v45 = 0;
    }
    arrowButtonColor = self->_arrowButtonColor;
    if (arrowButtonColor == v6->_arrowButtonColor) {
      char v47 = 1;
    }
    else {
      char v47 = -[UIColor isEqual:](arrowButtonColor, "isEqual:");
    }
    char v48 = v45 & v47;
    cellBackgroundColor = self->_cellBackgroundColor;
    if (cellBackgroundColor == v6->_cellBackgroundColor) {
      char v50 = 1;
    }
    else {
      char v50 = -[UIColor isEqual:](cellBackgroundColor, "isEqual:");
    }
    char v51 = v48 & v50;
    gridBackgroundColor = self->_gridBackgroundColor;
    if (gridBackgroundColor == v6->_gridBackgroundColor) {
      char v53 = 1;
    }
    else {
      char v53 = -[UIColor isEqual:](gridBackgroundColor, "isEqual:");
    }
    char v54 = v51 & v53;
    highlightedBackgroundColor = self->_highlightedBackgroundColor;
    if (highlightedBackgroundColor == v6->_highlightedBackgroundColor) {
      char v56 = 1;
    }
    else {
      char v56 = -[UIColor isEqual:](highlightedBackgroundColor, "isEqual:");
    }
    char v57 = v54 & v56;
    groupHeaderBackgroundColor = self->_groupHeaderBackgroundColor;
    if (groupHeaderBackgroundColor == v6->_groupHeaderBackgroundColor) {
      char v59 = 1;
    }
    else {
      char v59 = -[UIColor isEqual:](groupHeaderBackgroundColor, "isEqual:");
    }
    char v60 = v57 & v59;
    lineColor = self->_lineColor;
    if (lineColor == v6->_lineColor) {
      char v62 = 1;
    }
    else {
      char v62 = -[UIColor isEqual:](lineColor, "isEqual:");
    }
    char v63 = v60 & v62;
    sortControlColor = self->_sortControlColor;
    if (sortControlColor == v6->_sortControlColor) {
      char v65 = 1;
    }
    else {
      char v65 = -[UIColor isEqual:](sortControlColor, "isEqual:");
    }
    char v66 = v63 & v65;
    sortControlBackgroundColor = self->_sortControlBackgroundColor;
    if (sortControlBackgroundColor == v6->_sortControlBackgroundColor) {
      char v68 = 1;
    }
    else {
      char v68 = -[UIColor isEqual:](sortControlBackgroundColor, "isEqual:");
    }
    char v69 = v66 & v68;
    arrowButtonImageName = self->_arrowButtonImageName;
    if (arrowButtonImageName == v6->_arrowButtonImageName)
    {
      char v71 = 1;
      v72 = self->_arrowButtonImageName;
    }
    else
    {
      char v71 = -[NSString isEqual:](arrowButtonImageName, "isEqual:");
      v72 = self->_arrowButtonImageName;
      arrowButtonImageName = v6->_arrowButtonImageName;
    }
    char v73 = v69 & v71;
    if (self->_cellSeparatorImage != v6->_cellSeparatorImage) {
      char v73 = 0;
    }
    if (self->_slottedCellSeparatorImage != v6->_slottedCellSeparatorImage) {
      char v73 = 0;
    }
    if (self->_leftEdgeSeparatorImage != v6->_leftEdgeSeparatorImage) {
      char v73 = 0;
    }
    if (self->_rightEdgeSeparatorImage != v6->_rightEdgeSeparatorImage) {
      char v73 = 0;
    }
    if (self->_leftEdgeMaskImage != v6->_leftEdgeMaskImage) {
      char v73 = 0;
    }
    if (self->_rightEdgeMaskImage != v6->_rightEdgeMaskImage) {
      char v73 = 0;
    }
    if (v72 != arrowButtonImageName) {
      char v73 = 0;
    }
    if (self->_cellBackgroundImage != v6->_cellBackgroundImage) {
      char v73 = 0;
    }
    if (self->_highlightedCellBackgroundImage != v6->_highlightedCellBackgroundImage) {
      char v73 = 0;
    }
    if (self->_rowHeight != v6->_rowHeight) {
      char v73 = 0;
    }
    if (self->_cornerRadius != v6->_cornerRadius) {
      char v73 = 0;
    }
    if (self->_maskedCorners != v6->_maskedCorners) {
      char v73 = 0;
    }
    if (self->_foregroundOpacity != v6->_foregroundOpacity) {
      char v73 = 0;
    }
    if (self->_backgroundOpacity != v6->_backgroundOpacity) {
      char v73 = 0;
    }
    if (self->_hasShadow != v6->_hasShadow) {
      char v73 = 0;
    }
    if (self->_roundsArrowButtonEdge != v6->_roundsArrowButtonEdge) {
      char v73 = 0;
    }
    if (self->_layoutOrientation != v6->_layoutOrientation) {
      char v73 = 0;
    }
    if (self->_columnsCount != v6->_columnsCount) {
      char v73 = 0;
    }
    if (self->_maxNumberOfProactiveCells != v6->_maxNumberOfProactiveCells) {
      char v73 = 0;
    }
    if (self->_minimumCellPadding != v6->_minimumCellPadding) {
      char v73 = 0;
    }
    if (self->_minimumCellWidth != v6->_minimumCellWidth) {
      char v73 = 0;
    }
    if (self->_minimumInterItemSpacing != v6->_minimumInterItemSpacing) {
      char v73 = 0;
    }
    if (self->_maximumIconWidth != v6->_maximumIconWidth) {
      char v73 = 0;
    }
    if (self->_shouldJustifyRow != v6->_shouldJustifyRow) {
      char v73 = 0;
    }
    if (self->_singleSlottedCellMargin != v6->_singleSlottedCellMargin) {
      char v73 = 0;
    }
    BOOL v74 = self->_extraCellPadding.left == v6->_extraCellPadding.left;
    if (self->_extraCellPadding.top != v6->_extraCellPadding.top) {
      BOOL v74 = 0;
    }
    if (self->_extraCellPadding.right != v6->_extraCellPadding.right) {
      BOOL v74 = 0;
    }
    if (self->_extraCellPadding.bottom != v6->_extraCellPadding.bottom) {
      BOOL v74 = 0;
    }
    BOOL v75 = self->_gridPadding.left == v6->_gridPadding.left;
    if (self->_gridPadding.top != v6->_gridPadding.top) {
      BOOL v75 = 0;
    }
    if (self->_gridPadding.right != v6->_gridPadding.right) {
      BOOL v75 = 0;
    }
    if (self->_gridPadding.bottom != v6->_gridPadding.bottom) {
      BOOL v75 = 0;
    }
    BOOL v76 = v74 && v75;
    BOOL v77 = self->_gridLinePadding.left == v6->_gridLinePadding.left;
    if (self->_gridLinePadding.top != v6->_gridLinePadding.top) {
      BOOL v77 = 0;
    }
    if (self->_gridLinePadding.right != v6->_gridLinePadding.right) {
      BOOL v77 = 0;
    }
    if (self->_gridLinePadding.bottom != v6->_gridLinePadding.bottom) {
      BOOL v77 = 0;
    }
    BOOL v78 = v76 && v77;
    BOOL v79 = self->_gridLineOffset.x == v6->_gridLineOffset.x;
    if (self->_gridLineOffset.y != v6->_gridLineOffset.y) {
      BOOL v79 = 0;
    }
    BOOL v80 = v78 && v79;
    BOOL v81 = self->_sortControlPadding.left == v6->_sortControlPadding.left;
    if (self->_sortControlPadding.top != v6->_sortControlPadding.top) {
      BOOL v81 = 0;
    }
    if (self->_sortControlPadding.right != v6->_sortControlPadding.right) {
      BOOL v81 = 0;
    }
    if (self->_sortControlPadding.bottom != v6->_sortControlPadding.bottom) {
      BOOL v81 = 0;
    }
    char v82 = v73 & (v80 && v81);
    if (self->_cellTextAlignment != v6->_cellTextAlignment) {
      char v82 = 0;
    }
    if (self->_lineBreakMode != v6->_lineBreakMode) {
      char v82 = 0;
    }
    if (self->_darkBackdrop != v6->_darkBackdrop) {
      char v82 = 0;
    }
    if (self->_scrollDisabled != v6->_scrollDisabled) {
      char v82 = 0;
    }
    if (self->_dragGestureDisabled != v6->_dragGestureDisabled) {
      char v82 = 0;
    }
    if (self->_showsIndex != v6->_showsIndex) {
      char v82 = 0;
    }
    if (self->_dontSelectLastItemByBackwardMoving != v6->_dontSelectLastItemByBackwardMoving) {
      char v82 = 0;
    }
    if (self->_showOneMoreCandidate != v6->_showOneMoreCandidate) {
      char v82 = 0;
    }
    if (self->_disableSwitchingSortingMethodByTabKey != v6->_disableSwitchingSortingMethodByTabKey) {
      char v82 = 0;
    }
    if (self->_skipInlineCandidate != v6->_skipInlineCandidate) {
      char v82 = 0;
    }
    if (self->_hidesPartialCandidates != v6->_hidesPartialCandidates) {
      char v82 = 0;
    }
    if (self->_minimumNumberOfCandidates != v6->_minimumNumberOfCandidates) {
      char v82 = 0;
    }
    if (self->_widthOfGridGradient != v6->_widthOfGridGradient) {
      char v82 = 0;
    }
    if (self->_showCellBorderForSpaceConfirmationCandidate != v6->_showCellBorderForSpaceConfirmationCandidate) {
      char v82 = 0;
    }
    if (self->_performScalingAnimationOnCellHighlight != v6->_performScalingAnimationOnCellHighlight) {
      char v82 = 0;
    }
    if (self->_arrowButtonHighlightBackgroundHidden == v6->_arrowButtonHighlightBackgroundHidden) {
      char v83 = v82;
    }
    else {
      char v83 = 0;
    }
    arrowButtonConfig = self->_arrowButtonConfig;
    if (arrowButtonConfig == v6->_arrowButtonConfig) {
      char v85 = 1;
    }
    else {
      char v85 = -[UIButtonConfiguration isEqual:](arrowButtonConfig, "isEqual:");
    }
    char v86 = v83 & v85;
    spaceConfirmationCandidateCellBackgroundColor = self->_spaceConfirmationCandidateCellBackgroundColor;
    if (spaceConfirmationCandidateCellBackgroundColor == v6->_spaceConfirmationCandidateCellBackgroundColor) {
      char v88 = 1;
    }
    else {
      char v88 = -[UIColor isEqual:](spaceConfirmationCandidateCellBackgroundColor, "isEqual:");
    }
    char v89 = v86 & v88;
    if (self->_hideLinesOnDisambiguationGridEdges != v6->_hideLinesOnDisambiguationGridEdges) {
      char v89 = 0;
    }
    if (self->_maximizeSortControlWidthWithPadding != v6->_maximizeSortControlWidthWithPadding) {
      char v89 = 0;
    }
    if (self->_alternativeTextLeftSpacing != v6->_alternativeTextLeftSpacing) {
      char v89 = 0;
    }
    BOOL v90 = self->_groupHeaderPadding.left == v6->_groupHeaderPadding.left;
    if (self->_groupHeaderPadding.top != v6->_groupHeaderPadding.top) {
      BOOL v90 = 0;
    }
    if (self->_groupHeaderPadding.right != v6->_groupHeaderPadding.right) {
      BOOL v90 = 0;
    }
    if (self->_groupHeaderPadding.bottom != v6->_groupHeaderPadding.bottom) {
      BOOL v90 = 0;
    }
    char v91 = v89 & v90;
    if (self->_interRowSpacing != v6->_interRowSpacing) {
      char v91 = 0;
    }
    if (self->_applyCornerRadiusToAllCandidates != v6->_applyCornerRadiusToAllCandidates) {
      char v91 = 0;
    }
    if (self->_autofillExtraCandidateImage != v6->_autofillExtraCandidateImage) {
      char v91 = 0;
    }
    if (self->_slottedCandidatesIterItemSpacing == v6->_slottedCandidatesIterItemSpacing) {
      char v92 = v91;
    }
    else {
      char v92 = 0;
    }
    suggestionCandidateHeaderFontAttributes = self->_suggestionCandidateHeaderFontAttributes;
    if (suggestionCandidateHeaderFontAttributes == v6->_suggestionCandidateHeaderFontAttributes) {
      char v94 = 1;
    }
    else {
      char v94 = -[NSDictionary isEqual:](suggestionCandidateHeaderFontAttributes, "isEqual:");
    }
    char v95 = v92 & v94;
    suggestionCandidateBodyFontAttributes = self->_suggestionCandidateBodyFontAttributes;
    if (suggestionCandidateBodyFontAttributes == v6->_suggestionCandidateBodyFontAttributes) {
      char v97 = 1;
    }
    else {
      char v97 = -[NSDictionary isEqual:](suggestionCandidateBodyFontAttributes, "isEqual:");
    }
    char v98 = v95 & v97;
    if (self->_shouldUpdateCollectionViewWidthForArrowButtonVisibility != v6->_shouldUpdateCollectionViewWidthForArrowButtonVisibility) {
      char v98 = 0;
    }
    if (self->_hideSlottedCellSeparators == v6->_hideSlottedCellSeparators) {
      char v99 = v98;
    }
    else {
      char v99 = 0;
    }
    proactiveCandidateContentsGravity = self->_proactiveCandidateContentsGravity;
    if (proactiveCandidateContentsGravity == v6->_proactiveCandidateContentsGravity) {
      char v101 = 1;
    }
    else {
      char v101 = -[NSString isEqual:](proactiveCandidateContentsGravity, "isEqual:");
    }
    if (self->_shouldScrollIfShowingLastVisibleRow == v6->_shouldScrollIfShowingLastVisibleRow) {
      char v9 = v99 & v101;
    }
    else {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)lightKeyboardStyle
{
  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  uint64_t v3 = [off_1E52D39B8 systemFontOfSize:20.0];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [off_1E52D39B8 systemFontOfSize:14.0];
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  uint64_t v7 = [off_1E52D39B8 systemFontOfSize:10.0];
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  uint64_t v9 = [off_1E52D39B8 systemFontOfSize:14.0];
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  uint64_t v11 = [off_1E52D39B8 systemFontOfSize:14.0];
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  uint64_t v13 = +[UIColor blackColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  uint64_t v15 = [(UIKeyboardCandidateViewStyle *)v2 textColor];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  uint64_t v17 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorBlack_Alpha35")];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  uint64_t v19 = [(UIKeyboardCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  uint64_t v21 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBLegacyCandidateGridPadCellCandidateNumber")];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  uint64_t v23 = [(UIKeyboardCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  uint64_t v25 = +[UIColor clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v25;

  uint64_t v27 = +[UIColor clearColor];
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  uint64_t v29 = +[UIColor clearColor];
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  uint64_t v31 = +[UIColor blackColor];
  arrowButtonColor = v2->_arrowButtonColor;
  v2->_arrowButtonColor = (UIColor *)v31;

  uint64_t v33 = +[UIColor clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v33;

  uint64_t v35 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBLightCandidateBarCellHighlightedBackground")];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v35;

  uint64_t v37 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorCandidateCellGroupHeaderLight")];
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v37;

  uint64_t v39 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorGray_Percent55")];
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v39;

  uint64_t v41 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorKeyGrayKeyLightBackground")];
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v41;

  uint64_t v43 = +[UIColor clearColor];
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v43;

  v2->_rowHeight = 44.0;
  v2->_maskedCorners = 15;
  v2->_minimumCellPadding = 10.0;
  v2->_minimumCellWidth = 40.0;
  *(_OWORD *)&v2->_maximumIconWidth = xmmword_186B98FE0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q0;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 0x10000;
  v2->_alternativeTextLeftSpacing = 5.0;
  return v2;
}

+ (id)darkKeyboardStyle
{
  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  uint64_t v3 = [off_1E52D39B8 systemFontOfSize:20.0];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [off_1E52D39B8 systemFontOfSize:14.0];
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  uint64_t v7 = [off_1E52D39B8 systemFontOfSize:10.0];
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  uint64_t v9 = [off_1E52D39B8 systemFontOfSize:14.0];
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  uint64_t v11 = [off_1E52D39B8 systemFontOfSize:14.0];
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  uint64_t v13 = +[UIColor whiteColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  uint64_t v15 = [(UIKeyboardCandidateViewStyle *)v2 textColor];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  uint64_t v17 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorWhite_Alpha35")];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  uint64_t v19 = [(UIKeyboardCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  uint64_t v21 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBLegacyCandidateGridPadCellCandidateNumber")];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  uint64_t v23 = [(UIKeyboardCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  uint64_t v25 = +[UIColor clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v25;

  uint64_t v27 = +[UIColor clearColor];
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  uint64_t v29 = +[UIColor clearColor];
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  uint64_t v31 = +[UIColor whiteColor];
  arrowButtonColor = v2->_arrowButtonColor;
  v2->_arrowButtonColor = (UIColor *)v31;

  uint64_t v33 = +[UIColor clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v33;

  uint64_t v35 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBDarkCandidateBarCellHighlightedBackground")];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v35;

  uint64_t v37 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorWhite_Alpha40")];
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v37;

  uint64_t v39 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorBlack_Alpha70")];
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v39;

  uint64_t v41 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorKeyGrayKeyDarkBackground")];
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v41;

  uint64_t v43 = +[UIColor clearColor];
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v43;

  v2->_rowHeight = 44.0;
  v2->_maskedCorners = 15;
  v2->_minimumCellPadding = 10.0;
  v2->_minimumCellWidth = 40.0;
  *(_OWORD *)&v2->_maximumIconWidth = xmmword_186B98FE0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q0;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 16842752;
  v2->_alternativeTextLeftSpacing = 5.0;
  return v2;
}

+ (id)visionInlineStyle
{
  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  uint64_t v3 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  uint64_t v7 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  uint64_t v9 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  uint64_t v11 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  uint64_t v13 = +[UIColor labelColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  uint64_t v15 = +[UIColor blackColor];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  uint64_t v17 = +[UIColor secondaryLabelColor];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  uint64_t v19 = +[UIColor blackColor];
  uint64_t v20 = [v19 colorWithAlphaComponent:0.4];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v20;

  uint64_t v22 = +[UIColor secondaryLabelColor];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v22;

  char v24 = +[UIColor blackColor];
  uint64_t v25 = [v24 colorWithAlphaComponent:0.4];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v25;

  uint64_t v27 = +[UIColor clearColor];
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  uint64_t v29 = +[UIColor clearColor];
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  uint64_t v31 = +[UIColor labelColor];
  arrowButtonColor = v2->_arrowButtonColor;
  v2->_arrowButtonColor = (UIColor *)v31;

  v2->_arrowButtonBackgroundHidden = 1;
  v2->_arrowButtonHeight = 36.0;
  *(_OWORD *)&v2->_arrowButtonPadding.top = 0u;
  *(_OWORD *)&v2->_arrowButtonPadding.bottom = 0u;
  v2->_arrowButtonHighlightBackgroundHidden = 1;
  uint64_t v33 = +[UIColor clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v33;

  uint64_t v35 = +[UIColor clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v35;

  __asm { FMOV            V1.2D, #4.0 }
  *(_OWORD *)&v2->_sortControlPadding.top = xmmword_186B98FF0;
  *(_OWORD *)&v2->_sortControlPadding.bottom = _Q1;
  uint64_t v42 = +[UIColor whiteColor];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v42;

  uint64_t v44 = +[UIColor clearColor];
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v44;

  uint64_t v46 = +[UIColor clearColor];
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v46;

  v2->_rowHeight = 36.0;
  [(UIKeyboardCandidateViewStyle *)v2 rowHeight];
  v2->_cellCornerRadius = v48 * 0.5;
  *(_OWORD *)&v2->_extraCellPadding.top = 0u;
  *(_OWORD *)&v2->_extraCellPadding.bottom = 0u;
  v2->_maskedCorners = 15;
  v2->_minimumCellPadding = 12.0;
  *(_OWORD *)&v2->_gridPadding.top = 0u;
  *(_OWORD *)&v2->_gridPadding.bottom = xmmword_186B99000;
  __asm { FMOV            V1.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q1;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 0x10000;
  v2->_scrollDisabled = 1;
  v2->_alternativeTextLeftSpacing = 4.0;
  v2->_interRowSpacing = 16.0;
  *(_OWORD *)&v2->_minimumCellWidth = xmmword_186B99010;
  *(_OWORD *)&v2->_maximumIconWidth = xmmword_186B98FE0;
  v2->_columnsCount = 9;
  return v2;
}

+ (id)lightKeyboardStyleForDisambiguation
{
  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  uint64_t v3 = [off_1E52D39B8 systemFontOfSize:16.0];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = +[UIColor blackColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v5;

  objc_storeStrong((id *)&v2->_highlightedTextColor, v2->_textColor);
  uint64_t v7 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorBlack_Alpha35")];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v7;

  uint64_t v9 = [(UIKeyboardCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v9;

  uint64_t v11 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBLegacyCandidateGridPadCellCandidateNumber")];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v11;

  uint64_t v13 = [(UIKeyboardCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v13;

  uint64_t v15 = +[UIColor clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v15;

  uint64_t v17 = +[UIColor clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v17;

  uint64_t v19 = +[UIColor clearColor];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v19;

  lineColor = v2->_lineColor;
  v2->_lineColor = 0;

  v2->_rowHeight = 32.0;
  v2->_minimumCellPadding = 10.0;
  v2->_minimumCellWidth = 40.0;
  v2->_maximumIconWidth = 20.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q0;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 0x10000;
  v2->_alternativeTextLeftSpacing = 5.0;
  return v2;
}

+ (id)darkKeyboardStyleForDisambiguation
{
  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  uint64_t v3 = [off_1E52D39B8 systemFontOfSize:16.0];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = +[UIColor whiteColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v5;

  uint64_t v7 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorWhite")];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v7;

  uint64_t v9 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorBlack_Alpha35")];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v9;

  uint64_t v11 = [(UIKeyboardCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v11;

  uint64_t v13 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBLegacyCandidateGridPadCellCandidateNumber")];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v13;

  uint64_t v15 = [(UIKeyboardCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v15;

  uint64_t v17 = +[UIColor clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v17;

  uint64_t v19 = +[UIColor clearColor];
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v19;

  uint64_t v21 = +[UIColor clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v21;

  uint64_t v23 = +[UIColor clearColor];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v23;

  lineColor = v2->_lineColor;
  v2->_lineColor = 0;

  v2->_rowHeight = 32.0;
  v2->_minimumCellPadding = 10.0;
  v2->_minimumCellWidth = 40.0;
  v2->_maximumIconWidth = 20.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q0;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 16842752;
  v2->_alternativeTextLeftSpacing = 5.0;
  return v2;
}

+ (id)styleForDarkKeyboard:(BOOL)a3
{
  if (a3) {
    [a1 darkKeyboardStyle];
  }
  else {
  uint64_t v3 = [a1 lightKeyboardStyle];
  }
  return v3;
}

+ (id)disambiguationStyleForDarkKeyboard:(BOOL)a3
{
  if (a3) {
    [a1 darkKeyboardStyleForDisambiguation];
  }
  else {
  uint64_t v3 = [a1 lightKeyboardStyleForDisambiguation];
  }
  return v3;
}

+ (id)tvLinearStyleForDarkKeyboard:(BOOL)a3
{
  v4 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  uint64_t v5 = [off_1E52D39B8 systemFontOfSize:36.0];
  candidateFont = v4->_candidateFont;
  v4->_candidateFont = (UIFont *)v5;

  uint64_t v7 = [off_1E52D39B8 systemFontOfSize:10.0];
  alternativeTextFont = v4->_alternativeTextFont;
  v4->_alternativeTextFont = (UIFont *)v7;

  uint64_t v9 = [off_1E52D39B8 systemFontOfSize:10.0];
  annotationTextFont = v4->_annotationTextFont;
  v4->_annotationTextFont = (UIFont *)v9;

  uint64_t v11 = [off_1E52D39B8 systemFontOfSize:14.0];
  candidateNumberFont = v4->_candidateNumberFont;
  v4->_candidateNumberFont = (UIFont *)v11;

  uint64_t v13 = [off_1E52D39B8 systemFontOfSize:14.0];
  sortControlFont = v4->_sortControlFont;
  v4->_sortControlFont = (UIFont *)v13;

  if (a3) {
    +[UIColor whiteColor];
  }
  else {
  uint64_t v15 = +[UIColor blackColor];
  }
  textColor = v4->_textColor;
  v4->_textColor = (UIColor *)v15;

  uint64_t v17 = +[UIColor blackColor];
  highlightedTextColor = v4->_highlightedTextColor;
  v4->_highlightedTextColor = (UIColor *)v17;

  uint64_t v19 = [(UIKeyboardCandidateViewStyle *)v4 textColor];
  uint64_t v20 = [v19 colorWithAlphaComponent:0.4];
  alternativeTextColor = v4->_alternativeTextColor;
  v4->_alternativeTextColor = (UIColor *)v20;

  uint64_t v22 = [(UIKeyboardCandidateViewStyle *)v4 highlightedTextColor];
  uint64_t v23 = [v22 colorWithAlphaComponent:0.4];
  highlightedAlternativeTextColor = v4->_highlightedAlternativeTextColor;
  v4->_highlightedAlternativeTextColor = (UIColor *)v23;

  uint64_t v25 = +[UIColor clearColor];
  candidateNumberColor = v4->_candidateNumberColor;
  v4->_candidateNumberColor = (UIColor *)v25;

  uint64_t v27 = [(UIKeyboardCandidateViewStyle *)v4 candidateNumberColor];
  highlightedCandidateNumberColor = v4->_highlightedCandidateNumberColor;
  v4->_highlightedCandidateNumberColor = (UIColor *)v27;

  uint64_t v29 = +[UIColor clearColor];
  backgroundColor = v4->_backgroundColor;
  v4->_backgroundColor = (UIColor *)v29;

  uint64_t v31 = +[UIColor clearColor];
  gridBackgroundColor = v4->_gridBackgroundColor;
  v4->_gridBackgroundColor = (UIColor *)v31;

  uint64_t v33 = +[UIColor colorWithWhite:1.0 alpha:0.9];
  highlightedBackgroundColor = v4->_highlightedBackgroundColor;
  v4->_highlightedBackgroundColor = (UIColor *)v33;

  uint64_t v35 = +[UIColor clearColor];
  groupHeaderBackgroundColor = v4->_groupHeaderBackgroundColor;
  v4->_groupHeaderBackgroundColor = (UIColor *)v35;

  uint64_t v37 = +[UIColor clearColor];
  lineColor = v4->_lineColor;
  v4->_lineColor = (UIColor *)v37;

  uint64_t v39 = +[UIColor clearColor];
  sortControlColor = v4->_sortControlColor;
  v4->_sortControlColor = (UIColor *)v39;

  v4->_columnsCount = 6;
  v4->_minimumCellPadding = 20.0;
  v4->_minimumCellWidth = 60.0;
  v4->_maximumIconWidth = 20.0;
  v4->_cellCornerRadius = 12.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v4->_foregroundOpacity = _Q0;
  v4->_cellTextAlignment = 1;
  v4->_lineBreakMode = 5;
  v4->_rowHeight = 75.0;
  *(_DWORD *)&v4->_hasShadow = 0;
  v4->_alternativeTextLeftSpacing = 5.0;
  return v4;
}

+ (id)tvGridStyleForDarkKeyboard:(BOOL)a3
{
  v4 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  uint64_t v5 = [off_1E52D39B8 systemFontOfSize:34.0];
  candidateFont = v4->_candidateFont;
  v4->_candidateFont = (UIFont *)v5;

  uint64_t v7 = [off_1E52D39B8 systemFontOfSize:10.0];
  alternativeTextFont = v4->_alternativeTextFont;
  v4->_alternativeTextFont = (UIFont *)v7;

  uint64_t v9 = [off_1E52D39B8 systemFontOfSize:10.0];
  annotationTextFont = v4->_annotationTextFont;
  v4->_annotationTextFont = (UIFont *)v9;

  uint64_t v11 = [off_1E52D39B8 systemFontOfSize:14.0];
  candidateNumberFont = v4->_candidateNumberFont;
  v4->_candidateNumberFont = (UIFont *)v11;

  uint64_t v13 = [off_1E52D39B8 systemFontOfSize:14.0];
  sortControlFont = v4->_sortControlFont;
  v4->_sortControlFont = (UIFont *)v13;

  if (a3) {
    +[UIColor whiteColor];
  }
  else {
  uint64_t v15 = +[UIColor blackColor];
  }
  textColor = v4->_textColor;
  v4->_textColor = (UIColor *)v15;

  uint64_t v17 = +[UIColor blackColor];
  highlightedTextColor = v4->_highlightedTextColor;
  v4->_highlightedTextColor = (UIColor *)v17;

  uint64_t v19 = [(UIKeyboardCandidateViewStyle *)v4 textColor];
  uint64_t v20 = [v19 colorWithAlphaComponent:0.4];
  alternativeTextColor = v4->_alternativeTextColor;
  v4->_alternativeTextColor = (UIColor *)v20;

  uint64_t v22 = [(UIKeyboardCandidateViewStyle *)v4 highlightedTextColor];
  uint64_t v23 = [v22 colorWithAlphaComponent:0.4];
  highlightedAlternativeTextColor = v4->_highlightedAlternativeTextColor;
  v4->_highlightedAlternativeTextColor = (UIColor *)v23;

  uint64_t v25 = +[UIColor clearColor];
  candidateNumberColor = v4->_candidateNumberColor;
  v4->_candidateNumberColor = (UIColor *)v25;

  uint64_t v27 = [(UIKeyboardCandidateViewStyle *)v4 candidateNumberColor];
  highlightedCandidateNumberColor = v4->_highlightedCandidateNumberColor;
  v4->_highlightedCandidateNumberColor = (UIColor *)v27;

  uint64_t v29 = +[UIColor clearColor];
  backgroundColor = v4->_backgroundColor;
  v4->_backgroundColor = (UIColor *)v29;

  uint64_t v31 = +[UIColor clearColor];
  gridBackgroundColor = v4->_gridBackgroundColor;
  v4->_gridBackgroundColor = (UIColor *)v31;

  uint64_t v33 = +[UIColor colorWithWhite:1.0 alpha:0.9];
  highlightedBackgroundColor = v4->_highlightedBackgroundColor;
  v4->_highlightedBackgroundColor = (UIColor *)v33;

  uint64_t v35 = +[UIColor clearColor];
  groupHeaderBackgroundColor = v4->_groupHeaderBackgroundColor;
  v4->_groupHeaderBackgroundColor = (UIColor *)v35;

  uint64_t v37 = +[UIColor clearColor];
  lineColor = v4->_lineColor;
  v4->_lineColor = (UIColor *)v37;

  uint64_t v39 = +[UIColor clearColor];
  sortControlColor = v4->_sortControlColor;
  v4->_sortControlColor = (UIColor *)v39;

  v4->_columnsCount = 5;
  v4->_minimumCellPadding = 9.0;
  *(_OWORD *)&v4->_minimumCellWidth = xmmword_186B99020;
  v4->_cellCornerRadius = 12.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v4->_foregroundOpacity = _Q0;
  v4->_gridPadding.top = 0.0;
  *(_OWORD *)&v4->_gridPadding.left = 0u;
  v4->_gridPadding.right = 20.0;
  *(_OWORD *)&v4->_gridLinePadding.top = 0u;
  *(_OWORD *)&v4->_gridLinePadding.bottom = xmmword_186B99030;
  v4->_cellTextAlignment = 1;
  v4->_lineBreakMode = 5;
  v4->_rowHeight = 64.0;
  v4->_darkBackdrop = 0;
  v4->_alternativeTextLeftSpacing = 5.0;
  *(_DWORD *)&v4->_doNotClipToBounds = 1;
  return v4;
}

- (UIFont)candidateFont
{
  return self->_candidateFont;
}

- (void)setCandidateFont:(id)a3
{
}

- (UIFont)supplementalLexiconCandidateFont
{
  return self->_supplementalLexiconCandidateFont;
}

- (void)setSupplementalLexiconCandidateFont:(id)a3
{
}

- (UIFont)annotationTextFont
{
  return self->_annotationTextFont;
}

- (void)setAnnotationTextFont:(id)a3
{
}

- (UIFont)alternativeTextFont
{
  return self->_alternativeTextFont;
}

- (void)setAlternativeTextFont:(id)a3
{
}

- (UIFont)candidateNumberFont
{
  return self->_candidateNumberFont;
}

- (void)setCandidateNumberFont:(id)a3
{
}

- (UIFont)sortControlFont
{
  return self->_sortControlFont;
}

- (void)setSortControlFont:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
}

- (UIColor)alternativeTextColor
{
  return self->_alternativeTextColor;
}

- (void)setAlternativeTextColor:(id)a3
{
}

- (UIColor)highlightedAlternativeTextColor
{
  return self->_highlightedAlternativeTextColor;
}

- (void)setHighlightedAlternativeTextColor:(id)a3
{
}

- (UIColor)candidateNumberColor
{
  return self->_candidateNumberColor;
}

- (void)setCandidateNumberColor:(id)a3
{
}

- (UIColor)highlightedCandidateNumberColor
{
  return self->_highlightedCandidateNumberColor;
}

- (void)setHighlightedCandidateNumberColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
}

- (UIColor)arrowButtonBackgroundColor
{
  return self->_arrowButtonBackgroundColor;
}

- (void)setArrowButtonBackgroundColor:(id)a3
{
}

- (BOOL)arrowButtonBackgroundHidden
{
  return self->_arrowButtonBackgroundHidden;
}

- (void)setArrowButtonBackgroundHidden:(BOOL)a3
{
  self->_arrowButtonBackgroundHidden = a3;
}

- (UIColor)arrowButtonColor
{
  return self->_arrowButtonColor;
}

- (void)setArrowButtonColor:(id)a3
{
}

- (UIColor)gridBackgroundColor
{
  return self->_gridBackgroundColor;
}

- (void)setGridBackgroundColor:(id)a3
{
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
}

- (UIColor)highlightedRowBackgroundColor
{
  return self->_highlightedRowBackgroundColor;
}

- (void)setHighlightedRowBackgroundColor:(id)a3
{
}

- (UIColor)groupHeaderBackgroundColor
{
  return self->_groupHeaderBackgroundColor;
}

- (void)setGroupHeaderBackgroundColor:(id)a3
{
}

- (UIColor)transliterationCandidateBackgroundColor
{
  return self->_transliterationCandidateBackgroundColor;
}

- (void)setTransliterationCandidateBackgroundColor:(id)a3
{
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
}

- (UIColor)sortControlColor
{
  return self->_sortControlColor;
}

- (void)setSortControlColor:(id)a3
{
}

- (UIColor)sortControlBackgroundColor
{
  return self->_sortControlBackgroundColor;
}

- (void)setSortControlBackgroundColor:(id)a3
{
}

- (NSString)arrowButtonImageName
{
  return self->_arrowButtonImageName;
}

- (void)setArrowButtonImageName:(id)a3
{
}

- (UIImage)cellSeparatorImage
{
  return self->_cellSeparatorImage;
}

- (void)setCellSeparatorImage:(id)a3
{
}

- (UIImage)slottedCellSeparatorImage
{
  return self->_slottedCellSeparatorImage;
}

- (void)setSlottedCellSeparatorImage:(id)a3
{
}

- (UIImage)leftEdgeSeparatorImage
{
  return self->_leftEdgeSeparatorImage;
}

- (void)setLeftEdgeSeparatorImage:(id)a3
{
}

- (UIImage)rightEdgeSeparatorImage
{
  return self->_rightEdgeSeparatorImage;
}

- (void)setRightEdgeSeparatorImage:(id)a3
{
}

- (UIImage)arrowButtonSeparatorImage
{
  return self->_arrowButtonSeparatorImage;
}

- (void)setArrowButtonSeparatorImage:(id)a3
{
}

- (UIImage)leftEdgeMaskImage
{
  return self->_leftEdgeMaskImage;
}

- (void)setLeftEdgeMaskImage:(id)a3
{
}

- (UIImage)rightEdgeMaskImage
{
  return self->_rightEdgeMaskImage;
}

- (void)setRightEdgeMaskImage:(id)a3
{
}

- (UIImage)cellBackgroundImage
{
  return self->_cellBackgroundImage;
}

- (void)setCellBackgroundImage:(id)a3
{
}

- (UIImage)highlightedCellBackgroundImage
{
  return self->_highlightedCellBackgroundImage;
}

- (void)setHighlightedCellBackgroundImage:(id)a3
{
}

- (UIImage)transliterationCandidateBackgroundImage
{
  return self->_transliterationCandidateBackgroundImage;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)arrowButtonHeight
{
  return self->_arrowButtonHeight;
}

- (void)setArrowButtonHeight:(double)a3
{
  self->_arrowButtonHeight = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cellCornerRadius
{
  return self->_cellCornerRadius;
}

- (void)setCellCornerRadius:(double)a3
{
  self->_cellCornerRadius = a3;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (unint64_t)gridMaskedCorners
{
  return self->_gridMaskedCorners;
}

- (void)setGridMaskedCorners:(unint64_t)a3
{
  self->_gridMaskedCorners = a3;
}

- (double)foregroundOpacity
{
  return self->_foregroundOpacity;
}

- (void)setForegroundOpacity:(double)a3
{
  self->_foregroundOpacity = a3;
}

- (double)backgroundOpacity
{
  return self->_backgroundOpacity;
}

- (void)setBackgroundOpacity:(double)a3
{
  self->_backgroundOpacity = a3;
}

- (BOOL)doNotClipToBounds
{
  return self->_doNotClipToBounds;
}

- (void)setDoNotClipToBounds:(BOOL)a3
{
  self->_doNotClipToBounds = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (BOOL)roundsArrowButtonEdge
{
  return self->_roundsArrowButtonEdge;
}

- (void)setRoundsArrowButtonEdge:(BOOL)a3
{
  self->_roundsArrowButtonEdge = a3;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (unint64_t)columnsCount
{
  return self->_columnsCount;
}

- (void)setColumnsCount:(unint64_t)a3
{
  self->_columnsCount = a3;
}

- (unint64_t)maxNumberOfProactiveCells
{
  return self->_maxNumberOfProactiveCells;
}

- (void)setMaxNumberOfProactiveCells:(unint64_t)a3
{
  self->_maxNumberOfProactiveCells = a3;
}

- (double)minimumCellPadding
{
  return self->_minimumCellPadding;
}

- (void)setMinimumCellPadding:(double)a3
{
  self->_minimumCellPadding = a3;
}

- (double)minimumCellWidth
{
  return self->_minimumCellWidth;
}

- (void)setMinimumCellWidth:(double)a3
{
  self->_minimumCellWidth = a3;
}

- (double)minimumInterItemSpacing
{
  return self->_minimumInterItemSpacing;
}

- (void)setMinimumInterItemSpacing:(double)a3
{
  self->_minimumInterItemSpacing = a3;
}

- (double)maximumIconWidth
{
  return self->_maximumIconWidth;
}

- (void)setMaximumIconWidth:(double)a3
{
  self->_maximumIconWidth = a3;
}

- (BOOL)shouldJustifyRow
{
  return self->_shouldJustifyRow;
}

- (void)setShouldJustifyRow:(BOOL)a3
{
  self->_shouldJustifyRow = a3;
}

- (double)singleSlottedCellMargin
{
  return self->_singleSlottedCellMargin;
}

- (void)setSingleSlottedCellMargin:(double)a3
{
  self->_singleSlottedCellMargin = a3;
}

- (UIEdgeInsets)extraCellPadding
{
  double top = self->_extraCellPadding.top;
  double left = self->_extraCellPadding.left;
  double bottom = self->_extraCellPadding.bottom;
  double right = self->_extraCellPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setExtraCellPadding:(UIEdgeInsets)a3
{
  self->_extraCellPadding = a3;
}

- (UIEdgeInsets)arrowButtonPadding
{
  double top = self->_arrowButtonPadding.top;
  double left = self->_arrowButtonPadding.left;
  double bottom = self->_arrowButtonPadding.bottom;
  double right = self->_arrowButtonPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setArrowButtonPadding:(UIEdgeInsets)a3
{
  self->_arrowButtonPadding = a3;
}

- (UIEdgeInsets)gridPadding
{
  double top = self->_gridPadding.top;
  double left = self->_gridPadding.left;
  double bottom = self->_gridPadding.bottom;
  double right = self->_gridPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGridPadding:(UIEdgeInsets)a3
{
  self->_gridPadding = a3;
}

- (UIEdgeInsets)gridLinePadding
{
  double top = self->_gridLinePadding.top;
  double left = self->_gridLinePadding.left;
  double bottom = self->_gridLinePadding.bottom;
  double right = self->_gridLinePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGridLinePadding:(UIEdgeInsets)a3
{
  self->_gridLinePadding = a3;
}

- (CGPoint)gridLineOffset
{
  double x = self->_gridLineOffset.x;
  double y = self->_gridLineOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGridLineOffset:(CGPoint)a3
{
  self->_gridLineOffset = a3;
}

- (UIEdgeInsets)sortControlPadding
{
  double top = self->_sortControlPadding.top;
  double left = self->_sortControlPadding.left;
  double bottom = self->_sortControlPadding.bottom;
  double right = self->_sortControlPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSortControlPadding:(UIEdgeInsets)a3
{
  self->_sortControlPadding = a3;
}

- (int64_t)cellTextAlignment
{
  return self->_cellTextAlignment;
}

- (void)setCellTextAlignment:(int64_t)a3
{
  self->_cellTextAlignment = a3;
}

- (int64_t)alternativeTextAlignment
{
  return self->_alternativeTextAlignment;
}

- (void)setAlternativeTextAlignment:(int64_t)a3
{
  self->_alternativeTextAlignment = a3;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (BOOL)darkBackdrop
{
  return self->_darkBackdrop;
}

- (void)setDarkBackdrop:(BOOL)a3
{
  self->_darkBackdrop = a3;
}

- (BOOL)scrollDisabled
{
  return self->_scrollDisabled;
}

- (void)setScrollDisabled:(BOOL)a3
{
  self->_scrollDisabled = a3;
}

- (BOOL)dragGestureDisabled
{
  return self->_dragGestureDisabled;
}

- (void)setDragGestureDisabled:(BOOL)a3
{
  self->_dragGestureDisabled = a3;
}

- (BOOL)allowCandidateGridExpanding
{
  return self->_allowCandidateGridExpanding;
}

- (void)setAllowCandidateGridExpanding:(BOOL)a3
{
  self->_allowCandidateGridExpanding = a3;
}

- (BOOL)showsIndex
{
  return self->_showsIndex;
}

- (void)setShowsIndex:(BOOL)a3
{
  self->_showsIndedouble x = a3;
}

- (BOOL)showExtraLineBeforeFirstRow
{
  return self->_showExtraLineBeforeFirstRow;
}

- (void)setShowExtraLineBeforeFirstRow:(BOOL)a3
{
  self->_showExtraLineBeforeFirstRow = a3;
}

- (BOOL)fillGridWithLines
{
  return self->_fillGridWithLines;
}

- (void)setFillGridWithLines:(BOOL)a3
{
  self->_fillGridWithLines = a3;
}

- (BOOL)dontSelectLastItemByBackwardMoving
{
  return self->_dontSelectLastItemByBackwardMoving;
}

- (void)setDontSelectLastItemByBackwardMoving:(BOOL)a3
{
  self->_dontSelectLastItemByBackwardMoving = a3;
}

- (BOOL)showOneMoreCandidate
{
  return self->_showOneMoreCandidate;
}

- (void)setShowOneMoreCandidate:(BOOL)a3
{
  self->_showOneMoreCandidate = a3;
}

- (BOOL)disableSwitchingSortingMethodByTabKey
{
  return self->_disableSwitchingSortingMethodByTabKey;
}

- (void)setDisableSwitchingSortingMethodByTabKey:(BOOL)a3
{
  self->_disableSwitchingSortingMethodByTabKedouble y = a3;
}

- (BOOL)skipInlineCandidate
{
  return self->_skipInlineCandidate;
}

- (void)setSkipInlineCandidate:(BOOL)a3
{
  self->_skipInlineCandidate = a3;
}

- (BOOL)hidesPartialCandidates
{
  return self->_hidesPartialCandidates;
}

- (void)setHidesPartialCandidates:(BOOL)a3
{
  self->_hidesPartialCandidates = a3;
}

- (int64_t)minimumNumberOfCandidates
{
  return self->_minimumNumberOfCandidates;
}

- (void)setMinimumNumberOfCandidates:(int64_t)a3
{
  self->_minimumNumberOfCandidates = a3;
}

- (double)widthOfGridGradient
{
  return self->_widthOfGridGradient;
}

- (void)setWidthOfGridGradient:(double)a3
{
  self->_widthOfGridGradient = a3;
}

- (BOOL)showCellBorderForSpaceConfirmationCandidate
{
  return self->_showCellBorderForSpaceConfirmationCandidate;
}

- (void)setShowCellBorderForSpaceConfirmationCandidate:(BOOL)a3
{
  self->_showCellBorderForSpaceConfirmationCandidate = a3;
}

- (BOOL)performScalingAnimationOnCellHighlight
{
  return self->_performScalingAnimationOnCellHighlight;
}

- (void)setPerformScalingAnimationOnCellHighlight:(BOOL)a3
{
  self->_performScalingAnimationOnCellHighlight = a3;
}

- (BOOL)arrowButtonHighlightBackgroundHidden
{
  return self->_arrowButtonHighlightBackgroundHidden;
}

- (void)setArrowButtonHighlightBackgroundHidden:(BOOL)a3
{
  self->_arrowButtonHighlightBackgroundHidden = a3;
}

- (UIButtonConfiguration)arrowButtonConfig
{
  return self->_arrowButtonConfig;
}

- (void)setArrowButtonConfig:(id)a3
{
}

- (UIColor)spaceConfirmationCandidateCellBackgroundColor
{
  return self->_spaceConfirmationCandidateCellBackgroundColor;
}

- (void)setSpaceConfirmationCandidateCellBackgroundColor:(id)a3
{
}

- (BOOL)hideLinesOnDisambiguationGridEdges
{
  return self->_hideLinesOnDisambiguationGridEdges;
}

- (void)setHideLinesOnDisambiguationGridEdges:(BOOL)a3
{
  self->_hideLinesOnDisambiguationGridEdges = a3;
}

- (BOOL)maximizeSortControlWidthWithPadding
{
  return self->_maximizeSortControlWidthWithPadding;
}

- (void)setMaximizeSortControlWidthWithPadding:(BOOL)a3
{
  self->_maximizeSortControlWidthWithPadding = a3;
}

- (double)alternativeTextLeftSpacing
{
  return self->_alternativeTextLeftSpacing;
}

- (void)setAlternativeTextLeftSpacing:(double)a3
{
  self->_alternativeTextLeftSpacing = a3;
}

- (UIEdgeInsets)groupHeaderPadding
{
  double top = self->_groupHeaderPadding.top;
  double left = self->_groupHeaderPadding.left;
  double bottom = self->_groupHeaderPadding.bottom;
  double right = self->_groupHeaderPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGroupHeaderPadding:(UIEdgeInsets)a3
{
  self->_groupHeaderPadding = a3;
}

- (double)interRowSpacing
{
  return self->_interRowSpacing;
}

- (void)setInterRowSpacing:(double)a3
{
  self->_interRowSpacing = a3;
}

- (BOOL)applyCornerRadiusToAllCandidates
{
  return self->_applyCornerRadiusToAllCandidates;
}

- (void)setApplyCornerRadiusToAllCandidates:(BOOL)a3
{
  self->_applyCornerRadiusToAllCandidates = a3;
}

- (UIImage)autofillExtraCandidateImage
{
  return self->_autofillExtraCandidateImage;
}

- (void)setAutofillExtraCandidateImage:(id)a3
{
}

- (double)slottedCandidatesIterItemSpacing
{
  return self->_slottedCandidatesIterItemSpacing;
}

- (void)setSlottedCandidatesIterItemSpacing:(double)a3
{
  self->_slottedCandidatesIterItemSpacing = a3;
}

- (NSDictionary)suggestionCandidateHeaderFontAttributes
{
  return self->_suggestionCandidateHeaderFontAttributes;
}

- (void)setSuggestionCandidateHeaderFontAttributes:(id)a3
{
}

- (NSDictionary)suggestionCandidateBodyFontAttributes
{
  return self->_suggestionCandidateBodyFontAttributes;
}

- (void)setSuggestionCandidateBodyFontAttributes:(id)a3
{
}

- (BOOL)shouldUpdateCollectionViewWidthForArrowButtonVisibility
{
  return self->_shouldUpdateCollectionViewWidthForArrowButtonVisibility;
}

- (void)setShouldUpdateCollectionViewWidthForArrowButtonVisibility:(BOOL)a3
{
  self->_shouldUpdateCollectionViewWidthForArrowButtonVisibilitdouble y = a3;
}

- (BOOL)hideSlottedCellSeparators
{
  return self->_hideSlottedCellSeparators;
}

- (void)setHideSlottedCellSeparators:(BOOL)a3
{
  self->_hideSlottedCellSeparators = a3;
}

- (NSString)proactiveCandidateContentsGravity
{
  return self->_proactiveCandidateContentsGravity;
}

- (void)setProactiveCandidateContentsGravity:(id)a3
{
}

- (BOOL)shouldScrollIfShowingLastVisibleRow
{
  return self->_shouldScrollIfShowingLastVisibleRow;
}

- (void)setShouldScrollIfShowingLastVisibleRow:(BOOL)a3
{
  self->_shouldScrollIfShowingLastVisibleRow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveCandidateContentsGravity, 0);
  objc_storeStrong((id *)&self->_suggestionCandidateBodyFontAttributes, 0);
  objc_storeStrong((id *)&self->_suggestionCandidateHeaderFontAttributes, 0);
  objc_storeStrong((id *)&self->_autofillExtraCandidateImage, 0);
  objc_storeStrong((id *)&self->_spaceConfirmationCandidateCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_arrowButtonConfig, 0);
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundImage, 0);
  objc_storeStrong((id *)&self->_highlightedCellBackgroundImage, 0);
  objc_storeStrong((id *)&self->_cellBackgroundImage, 0);
  objc_storeStrong((id *)&self->_rightEdgeMaskImage, 0);
  objc_storeStrong((id *)&self->_leftEdgeMaskImage, 0);
  objc_storeStrong((id *)&self->_arrowButtonSeparatorImage, 0);
  objc_storeStrong((id *)&self->_rightEdgeSeparatorImage, 0);
  objc_storeStrong((id *)&self->_leftEdgeSeparatorImage, 0);
  objc_storeStrong((id *)&self->_slottedCellSeparatorImage, 0);
  objc_storeStrong((id *)&self->_cellSeparatorImage, 0);
  objc_storeStrong((id *)&self->_arrowButtonImageName, 0);
  objc_storeStrong((id *)&self->_sortControlBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sortControlColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_groupHeaderBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedRowBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_gridBackgroundColor, 0);
  objc_storeStrong((id *)&self->_arrowButtonColor, 0);
  objc_storeStrong((id *)&self->_arrowButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedCandidateNumberColor, 0);
  objc_storeStrong((id *)&self->_candidateNumberColor, 0);
  objc_storeStrong((id *)&self->_highlightedAlternativeTextColor, 0);
  objc_storeStrong((id *)&self->_alternativeTextColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_sortControlFont, 0);
  objc_storeStrong((id *)&self->_candidateNumberFont, 0);
  objc_storeStrong((id *)&self->_alternativeTextFont, 0);
  objc_storeStrong((id *)&self->_annotationTextFont, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconCandidateFont, 0);
  objc_storeStrong((id *)&self->_candidateFont, 0);
}

@end