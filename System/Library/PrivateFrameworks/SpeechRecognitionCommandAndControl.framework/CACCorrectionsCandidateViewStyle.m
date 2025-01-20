@interface CACCorrectionsCandidateViewStyle
+ (id)cacDarkStyle;
+ (id)cacLightStyle;
+ (id)darkKeyboardStyleForDisambiguation;
+ (id)defaultDarkKeyboardStyle;
+ (id)defaultLightKeyboardStyle;
+ (id)lightKeyboardStyleForDisambiguation;
+ (id)lightTVStyle;
+ (id)onePixelImageWithColor:(id)a3;
- (BOOL)allowCandidateGridExpanding;
- (BOOL)arrowButtonBackgroundHidden;
- (BOOL)darkBackdrop;
- (BOOL)disableSwitchingSortingMethodByTabKey;
- (BOOL)doNotClipToBounds;
- (BOOL)dontSelectLastItemByBackwardMoving;
- (BOOL)dragGestureDisabled;
- (BOOL)fillGridWithLines;
- (BOOL)hidesPartialCandidates;
- (BOOL)scrollDisabled;
- (BOOL)showExtraLineBeforeFirstRow;
- (BOOL)showOneMoreCandidate;
- (BOOL)showsIndex;
- (BOOL)skipInlineCandidate;
- (CGPoint)gridLineOffset;
- (NSString)arrowButtonImageName;
- (UIColor)alternativeTextColor;
- (UIColor)arrowButtonBackgroundColor;
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
- (UIColor)textColor;
- (UIColor)transliterationCandidateBackgroundColor;
- (UIEdgeInsets)arrowButtonPadding;
- (UIEdgeInsets)extraCellPadding;
- (UIEdgeInsets)gridLinePadding;
- (UIEdgeInsets)gridPadding;
- (UIEdgeInsets)sortControlPadding;
- (UIFont)alternativeTextFont;
- (UIFont)annotationTextFont;
- (UIFont)candidateFont;
- (UIFont)candidateNumberFont;
- (UIFont)sortControlFont;
- (UIFont)supplementalLexiconCandidateFont;
- (UIImage)arrowButtonSeparatorImage;
- (UIImage)cellBackgroundImage;
- (UIImage)cellSeparatorImage;
- (UIImage)highlightedCellBackgroundImage;
- (UIImage)leftEdgeMaskImage;
- (UIImage)leftEdgeSeparatorImage;
- (UIImage)rightEdgeMaskImage;
- (UIImage)rightEdgeSeparatorImage;
- (UIImage)slottedCellSeparatorImage;
- (UIImage)transliterationCandidateBackgroundImage;
- (double)arrowButtonHeight;
- (double)backgroundOpacity;
- (double)cellCornerRadius;
- (double)cornerRadius;
- (double)foregroundOpacity;
- (double)maximumIconWidth;
- (double)minimumCellPadding;
- (double)minimumCellWidth;
- (double)minimumInterItemSpacing;
- (double)rowHeight;
- (double)singleSlottedCellMargin;
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
- (void)setAnnotationTextFont:(id)a3;
- (void)setArrowButtonBackgroundColor:(id)a3;
- (void)setArrowButtonBackgroundHidden:(BOOL)a3;
- (void)setArrowButtonHeight:(double)a3;
- (void)setArrowButtonImageName:(id)a3;
- (void)setArrowButtonPadding:(UIEdgeInsets)a3;
- (void)setArrowButtonSeparatorImage:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundOpacity:(double)a3;
- (void)setCandidateFont:(id)a3;
- (void)setCandidateNumberColor:(id)a3;
- (void)setCandidateNumberFont:(id)a3;
- (void)setCellBackgroundColor:(id)a3;
- (void)setCellBackgroundImage:(id)a3;
- (void)setCellSeparatorImage:(id)a3;
- (void)setCellTextAlignment:(int64_t)a3;
- (void)setColumnsCount:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDarkBackdrop:(BOOL)a3;
- (void)setDisableSwitchingSortingMethodByTabKey:(BOOL)a3;
- (void)setDoNotClipToBounds:(BOOL)a3;
- (void)setDontSelectLastItemByBackwardMoving:(BOOL)a3;
- (void)setExtraCellPadding:(UIEdgeInsets)a3;
- (void)setFillGridWithLines:(BOOL)a3;
- (void)setForegroundOpacity:(double)a3;
- (void)setGridBackgroundColor:(id)a3;
- (void)setGridLineOffset:(CGPoint)a3;
- (void)setGridLinePadding:(UIEdgeInsets)a3;
- (void)setGridMaskedCorners:(unint64_t)a3;
- (void)setGridPadding:(UIEdgeInsets)a3;
- (void)setGroupHeaderBackgroundColor:(id)a3;
- (void)setHidesPartialCandidates:(BOOL)a3;
- (void)setHighlightedAlternativeTextColor:(id)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setHighlightedCandidateNumberColor:(id)a3;
- (void)setHighlightedCellBackgroundImage:(id)a3;
- (void)setHighlightedRowBackgroundColor:(id)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLeftEdgeMaskImage:(id)a3;
- (void)setLeftEdgeSeparatorImage:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setLineColor:(id)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setMaxNumberOfProactiveCells:(unint64_t)a3;
- (void)setMaximumIconWidth:(double)a3;
- (void)setMinimumCellPadding:(double)a3;
- (void)setMinimumCellWidth:(double)a3;
- (void)setMinimumNumberOfCandidates:(int64_t)a3;
- (void)setRightEdgeMaskImage:(id)a3;
- (void)setRightEdgeSeparatorImage:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setScrollDisabled:(BOOL)a3;
- (void)setShowExtraLineBeforeFirstRow:(BOOL)a3;
- (void)setShowOneMoreCandidate:(BOOL)a3;
- (void)setShowsIndex:(BOOL)a3;
- (void)setSingleSlottedCellMargin:(double)a3;
- (void)setSkipInlineCandidate:(BOOL)a3;
- (void)setSlottedCellSeparatorImage:(id)a3;
- (void)setSortControlBackgroundColor:(id)a3;
- (void)setSortControlColor:(id)a3;
- (void)setSortControlFont:(id)a3;
- (void)setSortControlPadding:(UIEdgeInsets)a3;
- (void)setSupplementalLexiconCandidateFont:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTransliterationCandidateBackgroundColor:(id)a3;
- (void)setTransliterationCandidateBackgroundImage:(id)a3;
@end

@implementation CACCorrectionsCandidateViewStyle

+ (id)cacLightStyle
{
  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  uint64_t v3 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [MEMORY[0x263F82760] systemFontOfSize:2.0];
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  uint64_t v7 = [MEMORY[0x263F82760] systemFontOfSize:2.0];
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  uint64_t v9 = [MEMORY[0x263F82760] systemFontOfSize:2.0];
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  uint64_t v11 = [MEMORY[0x263F82760] systemFontOfSize:2.0];
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  uint64_t v13 = [MEMORY[0x263F825C8] blackColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  uint64_t v15 = [(CACCorrectionsCandidateViewStyle *)v2 textColor];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  uint64_t v17 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  uint64_t v19 = [(CACCorrectionsCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  uint64_t v21 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  uint64_t v23 = [(CACCorrectionsCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  uint64_t v25 = [MEMORY[0x263F825C8] clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v25;

  uint64_t v27 = [MEMORY[0x263F825C8] clearColor];
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  uint64_t v29 = [MEMORY[0x263F825C8] clearColor];
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  uint64_t v31 = [MEMORY[0x263F825C8] clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v31;

  uint64_t v33 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v33;

  uint64_t v35 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v35;

  uint64_t v37 = [MEMORY[0x263F825C8] clearColor];
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v37;

  uint64_t v39 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v39;

  uint64_t v41 = [MEMORY[0x263F825C8] clearColor];
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v41;

  v2->_gridLineOffset = (CGPoint)*MEMORY[0x263F00148];
  v2->_maskedCorners = 15;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_238415B00;
  v2->_singleSlottedCellMargin = 10.0;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v43 = [MEMORY[0x263F82770] defaultMetrics];
  [v43 scaledValueForValue:32.0];
  v2->_rowHeight = v44;

  v2->_cellTextAlignment = 0;
  v2->_maxNumberOfProactiveCells = 3;
  v2->_darkBackdrop = 0;
  return v2;
}

+ (id)cacDarkStyle
{
  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  uint64_t v3 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [MEMORY[0x263F82760] systemFontOfSize:2.0];
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  uint64_t v7 = [MEMORY[0x263F82760] systemFontOfSize:2.0];
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  uint64_t v9 = [MEMORY[0x263F82760] systemFontOfSize:2.0];
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  uint64_t v11 = [MEMORY[0x263F82760] systemFontOfSize:2.0];
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  uint64_t v13 = [MEMORY[0x263F825C8] whiteColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  uint64_t v15 = [(CACCorrectionsCandidateViewStyle *)v2 textColor];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  uint64_t v17 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  uint64_t v19 = [(CACCorrectionsCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  uint64_t v21 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  uint64_t v23 = [(CACCorrectionsCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = 0;

  uint64_t v26 = [MEMORY[0x263F825C8] clearColor];
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v26;

  uint64_t v28 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v28;

  uint64_t v30 = [MEMORY[0x263F825C8] clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v30;

  uint64_t v32 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v32;

  uint64_t v34 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v34;

  uint64_t v36 = [MEMORY[0x263F825C8] clearColor];
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v36;

  uint64_t v38 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v38;

  uint64_t v40 = [MEMORY[0x263F825C8] clearColor];
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v40;

  v2->_gridLineOffset = (CGPoint)*MEMORY[0x263F00148];
  v2->_maskedCorners = 15;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_238415B00;
  v2->_singleSlottedCellMargin = 50.0;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v42 = [MEMORY[0x263F82770] defaultMetrics];
  [v42 scaledValueForValue:32.0];
  v2->_rowHeight = v43;

  v2->_cellTextAlignment = 0;
  v2->_maxNumberOfProactiveCells = 3;
  v2->_darkBackdrop = 1;
  return v2;
}

+ (id)defaultLightKeyboardStyle
{
  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  uint64_t v3 = [MEMORY[0x263F82760] systemFontOfSize:17.0];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [MEMORY[0x263F82760] systemFontOfSize:14.0];
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  uint64_t v7 = [MEMORY[0x263F82760] systemFontOfSize:10.0];
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  uint64_t v9 = [MEMORY[0x263F82760] systemFontOfSize:14.0];
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  uint64_t v11 = [MEMORY[0x263F82760] systemFontOfSize:14.0];
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  uint64_t v13 = [MEMORY[0x263F825C8] blackColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  uint64_t v15 = [(CACCorrectionsCandidateViewStyle *)v2 textColor];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  uint64_t v17 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  uint64_t v19 = [(CACCorrectionsCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  uint64_t v21 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  uint64_t v23 = [(CACCorrectionsCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  uint64_t v25 = [MEMORY[0x263F825C8] clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v25;

  uint64_t v27 = [MEMORY[0x263F825C8] clearColor];
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  uint64_t v29 = [MEMORY[0x263F825C8] clearColor];
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  uint64_t v31 = [MEMORY[0x263F825C8] clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v31;

  uint64_t v33 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v33;

  uint64_t v35 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v35;

  uint64_t v37 = [MEMORY[0x263F825C8] clearColor];
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v37;

  uint64_t v39 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v39;

  uint64_t v41 = [MEMORY[0x263F825C8] clearColor];
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v41;

  v2->_rowHeight = 44.0;
  v2->_maskedCorners = 15;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_238415B10;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v2->_singleSlottedCellMargin = 50.0;
  v2->_cellTextAlignment = 1;
  v2->_columnsCount = 3;
  v2->_darkBackdrop = 0;
  return v2;
}

+ (id)defaultDarkKeyboardStyle
{
  uint64_t v3 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  uint64_t v4 = [MEMORY[0x263F82760] systemFontOfSize:20.0];
  candidateFont = v3->_candidateFont;
  v3->_candidateFont = (UIFont *)v4;

  uint64_t v6 = [MEMORY[0x263F82760] systemFontOfSize:14.0];
  alternativeTextFont = v3->_alternativeTextFont;
  v3->_alternativeTextFont = (UIFont *)v6;

  uint64_t v8 = [MEMORY[0x263F82760] systemFontOfSize:10.0];
  annotationTextFont = v3->_annotationTextFont;
  v3->_annotationTextFont = (UIFont *)v8;

  uint64_t v10 = [MEMORY[0x263F82760] systemFontOfSize:14.0];
  candidateNumberFont = v3->_candidateNumberFont;
  v3->_candidateNumberFont = (UIFont *)v10;

  uint64_t v12 = [MEMORY[0x263F82760] systemFontOfSize:14.0];
  sortControlFont = v3->_sortControlFont;
  v3->_sortControlFont = (UIFont *)v12;

  uint64_t v14 = [MEMORY[0x263F825C8] whiteColor];
  textColor = v3->_textColor;
  v3->_textColor = (UIColor *)v14;

  uint64_t v16 = [(CACCorrectionsCandidateViewStyle *)v3 textColor];
  highlightedTextColor = v3->_highlightedTextColor;
  v3->_highlightedTextColor = (UIColor *)v16;

  uint64_t v18 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  alternativeTextColor = v3->_alternativeTextColor;
  v3->_alternativeTextColor = (UIColor *)v18;

  uint64_t v20 = [(CACCorrectionsCandidateViewStyle *)v3 alternativeTextColor];
  highlightedAlternativeTextColor = v3->_highlightedAlternativeTextColor;
  v3->_highlightedAlternativeTextColor = (UIColor *)v20;

  uint64_t v22 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  candidateNumberColor = v3->_candidateNumberColor;
  v3->_candidateNumberColor = (UIColor *)v22;

  uint64_t v24 = [(CACCorrectionsCandidateViewStyle *)v3 candidateNumberColor];
  highlightedCandidateNumberColor = v3->_highlightedCandidateNumberColor;
  v3->_highlightedCandidateNumberColor = (UIColor *)v24;

  backgroundColor = v3->_backgroundColor;
  v3->_backgroundColor = 0;

  uint64_t v27 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  arrowButtonBackgroundColor = v3->_arrowButtonBackgroundColor;
  v3->_arrowButtonBackgroundColor = (UIColor *)v27;

  uint64_t v29 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  gridBackgroundColor = v3->_gridBackgroundColor;
  v3->_gridBackgroundColor = (UIColor *)v29;

  uint64_t v31 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  highlightedBackgroundColor = v3->_highlightedBackgroundColor;
  v3->_highlightedBackgroundColor = (UIColor *)v31;

  uint64_t v33 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  groupHeaderBackgroundColor = v3->_groupHeaderBackgroundColor;
  v3->_groupHeaderBackgroundColor = (UIColor *)v33;

  uint64_t v35 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  lineColor = v3->_lineColor;
  v3->_lineColor = (UIColor *)v35;

  uint64_t v37 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  sortControlColor = v3->_sortControlColor;
  v3->_sortControlColor = (UIColor *)v37;

  uint64_t v39 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  sortControlBackgroundColor = v3->_sortControlBackgroundColor;
  v3->_sortControlBackgroundColor = (UIColor *)v39;

  uint64_t v41 = [a1 onePixelImageWithColor:v3->_lineColor];
  slottedCellSeparatorImage = v3->_slottedCellSeparatorImage;
  v3->_slottedCellSeparatorImage = (UIImage *)v41;

  *(_OWORD *)&v3->_columnsCount = xmmword_238415B20;
  *(_OWORD *)&v3->_minimumCellPadding = xmmword_238415B10;
  v3->_singleSlottedCellMargin = 30.0;
  v3->_foregroundOpacity = 1.0;
  v3->_backgroundOpacity = 1.0;
  v3->_rowHeight = 41.0;
  v3->_darkBackdrop = 1;
  return v3;
}

+ (id)lightKeyboardStyleForDisambiguation
{
  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  uint64_t v3 = [MEMORY[0x263F82760] systemFontOfSize:16.0];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [MEMORY[0x263F825C8] blackColor];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v5;

  objc_storeStrong((id *)&v2->_highlightedTextColor, v2->_textColor);
  uint64_t v7 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v7;

  uint64_t v9 = [(CACCorrectionsCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v9;

  uint64_t v11 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v11;

  uint64_t v13 = [(CACCorrectionsCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v13;

  uint64_t v15 = [MEMORY[0x263F825C8] clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v15;

  uint64_t v17 = [MEMORY[0x263F825C8] clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v17;

  uint64_t v19 = [MEMORY[0x263F825C8] clearColor];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v19;

  lineColor = v2->_lineColor;
  v2->_lineColor = 0;

  v2->_rowHeight = 32.0;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_238415B10;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v2->_cellTextAlignment = 0;
  v2->_darkBackdrop = 0;
  return v2;
}

+ (id)darkKeyboardStyleForDisambiguation
{
  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  uint64_t v3 = [MEMORY[0x263F82760] systemFontOfSize:16.0];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v5;

  uint64_t v7 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v7;

  uint64_t v9 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v9;

  uint64_t v11 = [(CACCorrectionsCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v11;

  uint64_t v13 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v13;

  uint64_t v15 = [(CACCorrectionsCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v15;

  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = 0;

  uint64_t v18 = [MEMORY[0x263F825C8] colorWithCGColor:UIKBGetNamedColor()];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v18;

  objc_storeStrong((id *)&v2->_highlightedBackgroundColor, v2->_backgroundColor);
  lineColor = v2->_lineColor;
  v2->_lineColor = 0;

  v2->_columnsCount = 6;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_238415B10;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v2->_rowHeight = 32.0;
  v2->_darkBackdrop = 1;
  return v2;
}

+ (id)lightTVStyle
{
  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  uint64_t v3 = [MEMORY[0x263F82760] systemFontOfSize:36.0];
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  uint64_t v5 = [MEMORY[0x263F82760] systemFontOfSize:10.0];
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  uint64_t v7 = [MEMORY[0x263F82760] systemFontOfSize:10.0];
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  uint64_t v9 = [MEMORY[0x263F82760] systemFontOfSize:14.0];
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  uint64_t v11 = [MEMORY[0x263F82760] systemFontOfSize:14.0];
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  uint64_t v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  uint64_t v15 = [(CACCorrectionsCandidateViewStyle *)v2 textColor];
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  uint64_t v17 = [(CACCorrectionsCandidateViewStyle *)v2 textColor];
  uint64_t v18 = [v17 colorWithAlphaComponent:0.4];
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v18;

  uint64_t v20 = [(CACCorrectionsCandidateViewStyle *)v2 alternativeTextColor];
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v20;

  uint64_t v22 = [MEMORY[0x263F825C8] clearColor];
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v22;

  uint64_t v24 = [(CACCorrectionsCandidateViewStyle *)v2 candidateNumberColor];
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v24;

  uint64_t v26 = [MEMORY[0x263F825C8] clearColor];
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v26;

  uint64_t v28 = [MEMORY[0x263F825C8] clearColor];
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v28;

  uint64_t v30 = [MEMORY[0x263F825C8] clearColor];
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v30;

  uint64_t v32 = [MEMORY[0x263F825C8] clearColor];
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v32;

  uint64_t v34 = [MEMORY[0x263F825C8] clearColor];
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v34;

  uint64_t v36 = [MEMORY[0x263F825C8] clearColor];
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v36;

  v2->_columnsCount = 6;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_238415B30;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v2->_rowHeight = 75.0;
  v2->_darkBackdrop = 0;
  return v2;
}

+ (id)onePixelImageWithColor:(id)a3
{
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 1.0);
  UIGraphicsGetCurrentContext();
  CGContextClear();
  CurrentContext = UIGraphicsGetCurrentContext();
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  CGContextFillRect(CurrentContext, v8);
  uint64_t v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v4;
}

- (int64_t)lineBreakMode
{
  return self->lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->lineBreakMode = a3;
}

- (double)cellCornerRadius
{
  return self->cellCornerRadius;
}

- (BOOL)dragGestureDisabled
{
  return self->dragGestureDisabled;
}

- (double)minimumInterItemSpacing
{
  return self->minimumInterItemSpacing;
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

- (UIColor)transliterationCandidateBackgroundColor
{
  return self->_transliterationCandidateBackgroundColor;
}

- (void)setTransliterationCandidateBackgroundColor:(id)a3
{
}

- (UIColor)groupHeaderBackgroundColor
{
  return self->_groupHeaderBackgroundColor;
}

- (void)setGroupHeaderBackgroundColor:(id)a3
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

- (void)setTransliterationCandidateBackgroundImage:(id)a3
{
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

- (double)maximumIconWidth
{
  return self->_maximumIconWidth;
}

- (void)setMaximumIconWidth:(double)a3
{
  self->_maximumIconWidth = a3;
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

- (void).cxx_destruct
{
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
  objc_storeStrong((id *)&self->_groupHeaderBackgroundColor, 0);
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedRowBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_gridBackgroundColor, 0);
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