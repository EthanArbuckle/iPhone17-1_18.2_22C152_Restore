@interface NSTextLayoutManager
+ (BOOL)_throwsOnAssertionError;
+ (BOOL)_usesOutlinedHighlightByDefault;
+ (BOOL)_validatesInternalCaches;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)shouldBeUsedForNSTextView;
+ (BOOL)supportsSecureCoding;
+ (BOOL)usesHyphenation;
+ (Class)companionLayoutManagerClass;
+ (Class)viewportLayoutControllerClass;
+ (NSDictionary)linkRenderingAttributes;
+ (NSDictionary)linkRenderingAttributesForLabels;
+ (double)_textHighlightBackgroundColorPercentage;
+ (id)textHighlightAttributes_iOS;
+ (id)textHighlightBackgroundColorForForegroundColor_iOS:(id)a3;
+ (id)validRenderingAttributes;
+ (int64_t)maximumNumberOfCachedTextLayoutFragments;
+ (int64_t)maximumNumberOfSeedElements;
+ (void)_setThrowsOnAssertionError:(BOOL)a3;
+ (void)_setValidatesInternalCaches:(BOOL)a3;
- (BOOL)_addTextAnimationContext:(id)a3;
- (BOOL)_adjustedTextLayoutFragmentBoundaryTextRangeForTextRange:(id)a3 location:(id *)a4 endLocation:(id *)a5;
- (BOOL)_appendTextContainer;
- (BOOL)_hasLayoutForLocation:(id)a3;
- (BOOL)_setSoftInvalidationLocation:(id)a3 onlyIfUpstream:(BOOL)a4;
- (BOOL)_shouldDrawTextCorrectionMarkerWithType:(int64_t)a3 inRange:(id)a4;
- (BOOL)_validateTextContainerEntries;
- (BOOL)allowsAddingTextContainer;
- (BOOL)allowsFontSubstitutionAffectingVerticalMetrics;
- (BOOL)breaksLinesForInteractiveText;
- (BOOL)flushTextLayoutFragmentsFromLocation:(id)a3 direction:(BOOL)a4;
- (BOOL)hasNonSimpleRectangularTextContainer;
- (BOOL)isCountableDataSource;
- (BOOL)lastContainerFilled;
- (BOOL)limitsLayoutForSuspiciousContents;
- (BOOL)rendersBackgroundColorAttribute;
- (BOOL)requiresCTLineRef;
- (BOOL)usesContiguousLayout;
- (BOOL)usesFontLeading;
- (BOOL)usesHyphenation;
- (CGRect)usageBoundsForLastTextContainer;
- (CGRect)usageBoundsInTextContainerAtIndex:(int64_t)a3;
- (CGSize)estimatedSizeForLastTextContainer;
- (NSArray)textContainers;
- (NSArray)textSelections;
- (NSDictionary)renderingAttributesForLink:(id)link atLocation:(id)location;
- (NSOperationQueue)layoutQueue;
- (NSTextContainer)templateTextContainer;
- (NSTextContainer)textContainer;
- (NSTextContentManager)textContentManager;
- (NSTextHighlightShapeProvider)_textHighlightShapeProvider;
- (NSTextLayoutFragment)textLayoutFragmentForLocation:(id)location;
- (NSTextLayoutFragment)textLayoutFragmentForPosition:(CGPoint)position;
- (NSTextLayoutManager)init;
- (NSTextLayoutManager)initWithCoder:(NSCoder *)coder;
- (NSTextLineFragment)_extraTextLineFragment;
- (NSTextRange)documentRange;
- (NSTextSelectionNavigation)textSelectionNavigation;
- (NSTextViewportLayoutController)textViewportLayoutController;
- (double)_estimatedVerticalSizeForTextRange:(id)a3 adjustedTextRange:(id *)a4;
- (id)_copyTextLineFragmentRangeForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 pointPlacement:(unint64_t *)a5;
- (id)_currentTextLayoutFragmentEnumerated;
- (id)_descriptionForTextLayoutFragmentStorage;
- (id)_estimatedTextLocationForVerticalOffset:(double)a3 originLocation:(id)a4 originOffset:(double)a5;
- (id)_estimatedTextLocationForVerticalOffset:(double)a3 originLocation:(id)a4 originOffset:(double)a5 deltaFromOffset:(double *)a6;
- (id)_fillSoftInvalidationToLocation:(id)a3 verticalOffset:(double)a4;
- (id)_rangeForAllLinesContainingTextInRange:(id)a3;
- (id)_selectionAndMarkedTextAttributesForLocation:(id)a3 inTextRange:(id)a4 effectiveTextRange:(id *)a5;
- (id)_textAnimationContextForLocation:(id)a3;
- (id)_textContainerForCurrentEnumeratedElement;
- (id)_textLayoutFragmentAtLocation:(id)a3;
- (id)_textLineFragmentAtLocation:(id)a3 textLayoutFragment:(id *)a4 rangeDelta:(int64_t *)a5;
- (id)_textParagraphForEmptyDocument;
- (id)_textRangeForDoubleClickAtLocation:(id)a3;
- (id)_textSelectionsFromTextView;
- (id)_textViewRespondingToSelector:(SEL)a3;
- (id)_textViewportLayoutControllerForTextContainer:(id)a3;
- (id)_viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5 textContainer:(id)a6;
- (id)adjustedTextSelectionsForEditingContextFromTextSelections:(id)a3;
- (id)attributedStringForTruncatedRange:(id)a3 defaultAttributedString:(id)a4;
- (id)baseLocation;
- (id)companionLayoutManager;
- (id)delegate;
- (id)enumerateTextLayoutFragmentsFromLocation:(id)location options:(NSTextLayoutFragmentEnumerationOptions)options usingBlock:(void *)block;
- (id)enumerateTextLayoutFragmentsInTextRange:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (id)isSelectionOverridableColor;
- (id)lineFragmentRangeForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4;
- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4;
- (id)rangeForTextContainerAtIndex:(int64_t)a3;
- (id)renderingColorForDocumentColor:(id)a3 atLocation:(id)a4;
- (id)temporaryAttributesTable;
- (id)textContainerForLocation:(id)a3;
- (id)textHighlightRenderingAttributesForTextRange:(id)a3 attributes:(id)a4;
- (id)textLayoutFragmentForPosition:(CGPoint)a3 inTextContainerAtIndex:(int64_t)a4;
- (id)textLayoutFragmentForPosition:(CGPoint)a3 inTextContainerAtIndex:(int64_t)a4 avoidsAdditionalLayout:(BOOL)a5;
- (id)textRangeForSelectionGranularity:(int64_t)a3 enclosingLocation:(id)a4;
- (id)viewProviderForTextAttachment:(id)a3 location:(id)a4;
- (int64_t)_fallbackWritingDirection;
- (int64_t)_numberOfLinesToCurrentlyEnumeratedTextLayoutFragment;
- (int64_t)applicationFrameworkContext;
- (int64_t)baseWritingDirectionAtLocation:(id)a3;
- (int64_t)maximumNumberOfCachedTextLayoutFragments;
- (int64_t)maximumNumberOfLinesForLastContainer;
- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4;
- (int64_t)textLayoutOrientationAtLocation:(id)a3;
- (unint64_t)placementOfPoint:(CGPoint)a3 inContainerAtLocation:(id)a4;
- (void)_addTextContainer:(id)a3;
- (void)_addTextContainerForLocation:(id)a3;
- (void)_commonInit;
- (void)_configureCoreTypesetter:(id)a3 forTextParagraph:(id)a4 textContainer:(id)a5;
- (void)_enumerateTextSegmentAndCategoryInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 allowsZeroWidthExtensions:(BOOL)a6 usingBlock:(id)a7;
- (void)_fillLayoutToLocation:(id)a3 enumerationCache:(id *)a4;
- (void)_fixSelectionAfterChangeInCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4;
- (void)_invalidateLayoutForTextRange:(id)a3 hard:(BOOL)a4;
- (void)_invalidateTextAnimationContextForTextRange:(id)a3 reason:(int64_t)a4;
- (void)_invalidateTextParagraphForEmptyDocument;
- (void)_removeTextAnimationContext:(id)a3;
- (void)_removeTextContainer;
- (void)_removeTextContainersToCondition:(id)a3;
- (void)addTemporaryAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5;
- (void)dealloc;
- (void)drawTextHighlightBackgroundForRunTextRanges:(id)a3 attributes:(id)a4 documentRange:(id)a5 origin:(CGPoint)a6 context:(CGContext *)a7;
- (void)drawTextHighlightBackgroundForTextRange:(id)a3 attributes:(id)a4 options:(unint64_t)a5 origin:(CGPoint)a6 context:(CGContext *)a7;
- (void)drawTextHighlightBackgroundForTextRange:(id)a3 highlightStyle:(id)a4 options:(unint64_t)a5 origin:(CGPoint)a6 context:(CGContext *)a7;
- (void)encodeWithCoder:(id)a3;
- (void)ensureLayoutForBounds:(CGRect)bounds;
- (void)ensureLayoutForRange:(NSTextRange *)range;
- (void)enumerateCaretOffsetsInLineFragmentAtLocation:(id)a3 usingBlock:(id)a4;
- (void)enumerateContainerBoundariesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateRenderingAttributesFromLocation:(id)location reverse:(BOOL)reverse usingBlock:(void *)block;
- (void)enumerateSubstringsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateTemporaryAttributesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateTextSegmentAndCategoryInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)enumerateTextSegmentsInRange:(NSTextRange *)textRange type:(NSTextLayoutManagerSegmentType)type options:(NSTextLayoutManagerSegmentOptions)options usingBlock:(void *)block;
- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5;
- (void)invalidateLayoutForRange:(NSTextRange *)range;
- (void)invalidateTemporaryAttributesForTextRange:(id)a3;
- (void)markedTextAttributesForRange:(id)a3 usingBlock:(id)a4;
- (void)processLayoutInvalidationForTextRange:(id)a3 synchronizing:(BOOL)a4;
- (void)removeTemporaryAttribute:(id)a3 forTextRange:(id)a4;
- (void)renderingAttributesValidator;
- (void)replaceContentsInRange:(NSTextRange *)range withAttributedString:(NSAttributedString *)attributedString;
- (void)replaceContentsInRange:(NSTextRange *)range withTextElements:(NSArray *)textElements;
- (void)replaceTextContentManager:(NSTextContentManager *)textContentManager;
- (void)setAllowsFontSubstitutionAffectingVerticalMetrics:(BOOL)a3;
- (void)setApplicationFrameworkContext:(int64_t)a3;
- (void)setBreaksLinesForInteractiveText:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setIsSelectionOverridableColor:(id)a3;
- (void)setLayoutQueue:(NSOperationQueue *)layoutQueue;
- (void)setLimitsLayoutForSuspiciousContents:(BOOL)limitsLayoutForSuspiciousContents;
- (void)setMaximumNumberOfCachedTextLayoutFragments:(int64_t)a3;
- (void)setRenderingAttributesValidator:(void *)renderingAttributesValidator;
- (void)setRendersBackgroundColorAttribute:(BOOL)a3;
- (void)setRequiresCTLineRef:(BOOL)a3;
- (void)setTemplateTextContainer:(id)a3;
- (void)setTemporaryAttributes:(id)a3 forTextRange:(id)a4;
- (void)setTextContainer:(NSTextContainer *)textContainer;
- (void)setTextContentManager:(id)a3;
- (void)setTextSelectionNavigation:(NSTextSelectionNavigation *)textSelectionNavigation;
- (void)setTextSelections:(NSArray *)textSelections;
- (void)setUsesFontLeading:(BOOL)usesFontLeading;
- (void)setUsesHyphenation:(BOOL)usesHyphenation;
- (void)setViewProvider:(id)a3 forTextAttachment:(id)a4 location:(id)a5;
- (void)synchronize;
- (void)textContainerChangedGeometry:(id)a3;
- (void)updateLayoutWithTextLayoutFragment:(id)a3 addition:(BOOL)a4;
@end

@implementation NSTextLayoutManager

- (CGRect)usageBoundsForLastTextContainer
{
  [(NSTextLayoutManager *)self usageBoundsInTextContainerAtIndex:0x7FFFFFFFFFFFFFFFLL];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)markedTextAttributesForRange:(id)a3 usingBlock:(id)a4
{
  v7 = (void *)[a3 location];
  uint64_t v8 = [a3 endLocation];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = (void *)MEMORY[0x192FAE510]();
    while ([v7 compare:v9] == -1)
    {
      v13 = 0;
      id v11 = [(NSTextLayoutManager *)self _selectionAndMarkedTextAttributesForLocation:v7 inTextRange:a3 effectiveTextRange:&v13];
      id v12 = v13;
      if (!v13) {
        id v12 = a3;
      }
      v7 = (void *)[v12 endLocation];
      (*((void (**)(id, void *, id))a4 + 2))(a4, v13, v11);
    }
  }
}

uint64_t __82__NSTextLayoutManager_enumerateTextLayoutFragmentsInTextRange_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "representedRange"), "endLocation"), "compare:", objc_msgSend(*(id *)(a1 + 32), "location"));
    char v6 = v4 != 1;
    if (v4 != 1) {
      return 0;
    }
    goto LABEL_8;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "endLocation"), "compare:", objc_msgSend((id)objc_msgSend(a2, "representedRange"), "location")) == 1)
  {
    char v6 = 0;
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return v6 == 0;
  }
  if (!*(unsigned char *)(a1 + 49)) {
    return 0;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "representedRange"), "containsLocation:", objc_msgSend(*(id *)(a1 + 32), "location"));
  char v6 = result ^ 1;
  if (result) {
    goto LABEL_8;
  }
  return result;
}

- (void)ensureLayoutForRange:(NSTextRange *)range
{
  objc_sync_enter(self);
  id v5 = [(NSTextRange *)range location];
  id v6 = [(NSTextRange *)range endLocation];
  if ([(NSTextRange *)range location] && v6)
  {
    if (objc_msgSend(v5, "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")))
    {
      v7 = &__block_literal_global_143;
      uint64_t v8 = 13;
    }
    else
    {
      v7 = v9;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__NSTextLayoutManager_ensureLayoutForRange___block_invoke_2;
      v9[3] = &unk_1E55C5D40;
      v9[4] = v6;
      uint64_t v8 = 12;
    }
    [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v5 options:v8 usingBlock:v7];
    __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, [(NSTextRange *)range endLocation], 1.79769313e308);
  }
  objc_sync_exit(self);
}

uint64_t __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 rangeInElement];
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    || (v8 = (void *)result, uint64_t result = [(id)result isNotEmpty], !result)
    || (!*(unsigned char *)(a1 + 96)
      ? (id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40),
         uint64_t v10 = [v8 endLocation],
         uint64_t v9 = v11)
      : (void *)(uint64_t v9 = (void *)[v8 location],
                 uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)),
        uint64_t result = [v9 compare:v10],
        result == -1))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = a2;
    if (*(unsigned char *)(a1 + 97))
    {
      if (*(unsigned char *)(a1 + 98) && !*(unsigned char *)(a1 + 96) && [a2 state] != 3)
      {
        [a2 layoutFragmentFrameOrigin];
        objc_msgSend(a2, "setLayoutFragmentFrameOrigin:");
      }
      if (([objc_loadWeak((id *)(a1 + 80)) lastContainerFilled] & 1) == 0)
      {
        uint64_t v12 = [objc_loadWeak((id *)(a1 + 80)) maximumNumberOfLinesForLastContainer];
        if (v12 < 1 || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56) < v12) {
          [a2 layout];
        }
      }
      uint64_t v13 = [a2 state];
      if (v13 == 3)
      {
        [a2 layoutFragmentFrame];
        double v15 = v14;
        double v17 = v16;
        v18 = (void *)[a2 rangeInElement];
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56) += objc_msgSend((id)objc_msgSend(a2, "textLineFragments"), "count");
        uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
        double v20 = -0.0;
        if (!*(unsigned char *)(v19 + 81)) {
          double v20 = v17;
        }
        *(double *)(v19 + 48) = v15 + v20;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 81)) {
          uint64_t v21 = [v18 location];
        }
        else {
          uint64_t v21 = [v18 endLocation];
        }
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v21;
      }
      uint64_t result = [objc_loadWeak((id *)(a1 + 80)) lastContainerFilled];
      BOOL v22 = 1;
      if ((result & 1) != 0 || v13 != 3)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        BOOL v22 = v13 == 3;
      }
    }
    else
    {
      if ((*(unsigned char *)(a1 + 88) & 2) != 0)
      {
        if (![a2 state]) {
          objc_msgSend(objc_loadWeak((id *)(a1 + 80)), "_setSoftInvalidationLocation:onlyIfUpstream:", objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location"), 1);
        }
        uint64_t result = [a2 estimateSize];
      }
      BOOL v22 = 1;
    }
    uint64_t v23 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v23 + 128))
    {
      if (*(void *)(v23 + 280))
      {
        uint64_t result = [a2 _isRenderingAttributesValidated];
        if ((result & 1) == 0)
        {
          (*(void (**)(void, uint64_t, void *))(*(void *)(*(void *)(a1 + 32) + 280) + 16))(*(void *)(*(void *)(a1 + 32) + 280), [a2 textLayoutManager], a2);
          uint64_t result = objc_msgSend(a2, "set_renderingAttributesValidated:", 1);
        }
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = 0;
    if (v22)
    {
      if (*(unsigned char *)(a1 + 97))
      {
        v24 = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location");
        uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if (!v25 || ([*(id *)(v25 + 16) containsLocation:v24] & 1) == 0)
        {
          Weak = objc_loadWeak((id *)(a1 + 80));
          *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(Weak, v24);
        }
        v27 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if (v27) {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 72) = *v27;
        }
      }
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result ^ 1;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 72) = 0;
    }
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  return result;
}

- (BOOL)usesContiguousLayout
{
  objc_sync_enter(self);
  TextContainerEntryAtIndex = (id *)__NSTextLayoutManagerGetTextContainerEntryAtIndex(self, 0x7FFFFFFFFFFFFFFFuLL, 1);
  if (TextContainerEntryAtIndex)
  {
    id v4 = *TextContainerEntryAtIndex;
    [*TextContainerEntryAtIndex size];
    BOOL v6 = v5 > 0.0 && v5 < 10000000.0
      || [(NSTextLayoutManager *)self hasNonSimpleRectangularTextContainer]
      || [v4 maximumNumberOfLines] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  objc_sync_exit(self);
  return v6;
}

- (BOOL)lastContainerFilled
{
  objc_sync_enter(self);
  if ((self->_textContainerEntriesCount & 0x8000000000000000) != 0)
  {
    textContainerEntries = self->_textContainerEntries;
    var0 = (NSTextContainer *)textContainerEntries[-1].var0;
    p_lastTextContainerEntry = ($12329A12E88B98FC1E4249E14A3806EA *)&textContainerEntries[-1];
    textContainer = var0;
  }
  else
  {
    p_lastTextContainerEntry = &self->_lastTextContainerEntry;
    textContainer = self->_lastTextContainerEntry.textContainer;
    if (!textContainer)
    {
LABEL_9:
      BOOL containerFilled = 0;
      goto LABEL_10;
    }
  }
  [(NSTextContainer *)textContainer size];
  if ((v7 <= 0.0 || v7 >= 10000000.0)
    && ![(NSTextContainer *)p_lastTextContainerEntry->textContainer maximumNumberOfLines])
  {
    goto LABEL_9;
  }
  BOOL containerFilled = p_lastTextContainerEntry->containerFilled;
LABEL_10:
  objc_sync_exit(self);
  return containerFilled;
}

- (id)textContainerForLocation:(id)a3
{
  objc_sync_enter(self);
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, a3);
  if (TextContainerEntryAndIndexForLocation) {
    BOOL v6 = *(void **)TextContainerEntryAndIndexForLocation;
  }
  else {
    BOOL v6 = 0;
  }
  objc_sync_exit(self);
  return v6;
}

- (int64_t)maximumNumberOfLinesForLastContainer
{
  objc_sync_enter(self);
  TextContainerEntryAtIndex = (id *)__NSTextLayoutManagerGetTextContainerEntryAtIndex(self, 0x7FFFFFFFFFFFFFFFuLL, 1);
  if (TextContainerEntryAtIndex) {
    int64_t v4 = [*TextContainerEntryAtIndex maximumNumberOfLines];
  }
  else {
    int64_t v4 = 0;
  }
  objc_sync_exit(self);
  return v4;
}

- (BOOL)hasNonSimpleRectangularTextContainer
{
  objc_sync_enter(self);
  templateTextContainer = self->_templateTextContainer;
  if (templateTextContainer
    && ![(NSTextContainer *)templateTextContainer isSimpleRectangularTextContainer]
    || self->_delegateWithSimpleTextContainerQuery
    && !objc_msgSend(-[NSTextLayoutManager delegate](self, "delegate"), "textLayoutManagerAllowsSimpleRectangularTextContainerOnly:", self))
  {
LABEL_19:
    BOOL v8 = 1;
    goto LABEL_20;
  }
  if (self->_lastTextContainerEntry.textContainer) {
    unint64_t textContainerEntriesCount = self->_textContainerEntriesCount + 1;
  }
  else {
    unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
  }
  if (textContainerEntriesCount)
  {
    uint64_t v5 = 0;
    for (unint64_t i = 0; i != textContainerEntriesCount; ++i)
    {
      if (self->_textContainerEntriesCount <= i) {
        double v7 = self->_lastTextContainerEntry.textContainer ? &self->_lastTextContainerEntry : 0;
      }
      else {
        double v7 = ($12329A12E88B98FC1E4249E14A3806EA *)&self->_textContainerEntries[v5];
      }
      if (v7->textContainer
        && ![(NSTextContainer *)v7->textContainer isSimpleRectangularTextContainer])
      {
        goto LABEL_19;
      }
      ++v5;
    }
  }
  BOOL v8 = 0;
LABEL_20:
  objc_sync_exit(self);
  return v8;
}

uint64_t __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_7(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(a1 + 72)) {
    goto LABEL_26;
  }
  double v3 = (void *)[a2 elementRange];
  int64_t v4 = v3;
  if (*(unsigned char *)(a1 + 73)) {
    uint64_t v5 = [v3 endLocation];
  }
  else {
    uint64_t v5 = [v3 location];
  }
  BOOL v6 = (void *)v5;
  double v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v7)
  {
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v9) {
      goto LABEL_12;
    }
    double v7 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 73)) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = [v7 endLocation];
    goto LABEL_11;
  }
  if (!*(unsigned char *)(a1 + 73)) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = [v7 location];
LABEL_11:
  uint64_t v9 = (void *)v8;
LABEL_12:
  if (([v6 isEqual:v9] & 1) == 0
    && ([v4 containsLocation:v9] & 1) == 0
    && ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsRange:v4] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 73)) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v9;
    }
    if (*(unsigned char *)(a1 + 73)) {
      BOOL v6 = v9;
    }
    if (v10) {
      BOOL v11 = v6 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      uint64_t v12 = [[NSTextRange alloc] initWithLocation:v10 endLocation:v6];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v4;
LABEL_26:
  uint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v13();
}

uint64_t __44__NSTextLayoutManager_ensureLayoutForRange___block_invoke()
{
  return 0;
}

BOOL __44__NSTextLayoutManager_ensureLayoutForRange___block_invoke_2(uint64_t a1, void *a2)
{
  return !a2
      || objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location"), "compare:", *(void *)(a1 + 32)) == -1;
}

uint64_t __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_6(uint64_t a1, void *a2)
{
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation")) == -1|| *(unsigned char *)(a1 + 56)&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "location")))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a2;
  }
  return 0;
}

- (id)_textContainerForCurrentEnumeratedElement
{
  activeEnumerationCache = self->_activeEnumerationCache;
  if (activeEnumerationCache && activeEnumerationCache->var6) {
    return activeEnumerationCache->var5;
  }
  else {
    return 0;
  }
}

BOOL __76__NSTextLayoutManager__estimatedVerticalSizeForTextRange_adjustedTextRange___block_invoke(uint64_t a1, void *a2)
{
  int64_t v4 = (void *)[a2 elementRange];
  uint64_t v5 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && (objc_msgSend((id)objc_msgSend(v4, "location"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "location")) & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[v5 location];
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "endLocation"), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation"));
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void *)(v7 + 24) + 1;
  *(void *)(v7 + 24) = v8;
  if (v8 >= *(void *)(a1 + 80))
  {
    BOOL v10 = 0;
LABEL_10:
    if (v6) {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = (id)[v5 location];
    }
    return v10;
  }
  if (objc_msgSend((id)objc_msgSend(v5, "location"), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation")) == -1)
  {
    [a2 estimatedIntrinsicContentSizeForTextLayoutManager:*(void *)(a1 + 40)];
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v9
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
  }
  BOOL v10 = v6 == -1;
  if (v6 != -1) {
    goto LABEL_10;
  }
  return v10;
}

BOOL __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_6(uint64_t a1, void *a2)
{
  int64_t v4 = (void *)[a2 rangeInElement];
  uint64_t v5 = [v4 endLocation];
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) compare:v5];
  if (v6 != -1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) += objc_msgSend((id)objc_msgSend(a2, "textLineFragments"), "count");
    int v7 = *(unsigned __int8 *)(a1 + 48);
    [a2 layoutFragmentFrame];
    if (v7) {
      double MinY = CGRectGetMinY(*(CGRect *)&v8);
    }
    else {
      double MinY = CGRectGetMaxY(*(CGRect *)&v8);
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = MinY;
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v5 = [v4 location];
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v5;
  }
  return v6 != -1;
}

BOOL __45__NSTextLayoutManager_ensureLayoutForBounds___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 layoutFragmentFrame];
  return v4 + v5 < *(double *)(a1 + 48) + *(double *)(a1 + 64)
      && objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation")) == 1;
}

uint64_t __54__NSTextLayoutManager_baseWritingDirectionAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  if (objc_opt_isKindOfClass()) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  }
  return 0;
}

uint64_t __53__NSTextLayoutManager__textLayoutFragmentAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  return 0;
}

uint64_t __53__NSTextLayoutManager_textLayoutFragmentForLocation___block_invoke(uint64_t a1, void *a2)
{
  int v4 = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "containsLocation:", *(void *)(a1 + 32));
  if (v4) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  }
  return v4 ^ 1u;
}

uint64_t __45__NSTextLayoutManager_ensureLayoutForBounds___block_invoke(uint64_t a1, void *a2)
{
  [a2 layoutFragmentFrame];
  if (v4 + v5 < *(double *)(a1 + 48) + *(double *)(a1 + 64)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location");
  }
  return 0;
}

BOOL __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_3(uint64_t a1, void *a2)
{
  double v4 = (void *)[a2 elementRange];
  double v5 = v4;
  if (*(void *)(a1 + 32)
    && (objc_msgSend((id)objc_msgSend(v4, "location"), "isEqual:", *(void *)(a1 + 32)) & 1) != 0)
  {
    return 0;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[v5 location];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v7 = *(void *)(v6 + 24) + 1;
  *(void *)(v6 + 24) = v7;
  if (v7 < *(void *)(a1 + 104))
  {
    [a2 estimatedIntrinsicContentSizeForTextLayoutManager:*(void *)(a1 + 40)];
    double v9 = v8;
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    double v11 = *(double *)(v10 + 24);
    double v12 = *(double *)(a1 + 120);
    double v13 = v8 + *(double *)(a1 + 112) + v11;
    BOOL v14 = v13 <= v12;
    if (v13 > v12)
    {
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location");
      *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 112)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                              + 24)
                                                                  - *(double *)(a1 + 120);
      uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
      double v11 = *(double *)(v10 + 24);
    }
    double v15 = v9 + v11;
    goto LABEL_13;
  }
  unint64_t v16 = objc_msgSend(*(id *)(a1 + 40), "offsetFromLocation:toLocation:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), objc_msgSend(v5, "endLocation"));
  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (!v17)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "offsetFromLocation:toLocation:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40), objc_msgSend(v5, "location"));
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  double v18 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  double v19 = *(double *)(a1 + 112);
  double v20 = *(double *)(a1 + 120);
  if (v19 + v18 * ((double)v16 / (double)v17) <= v20)
  {
    uint64_t v22 = [*(id *)(a1 + 48) locationFromLocation:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withOffset:(unint64_t)((v20 - v19) * (double)v17 / v18)];
    uint64_t v23 = *(void **)(a1 + 48);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_4;
    v28[3] = &unk_1E55C5CD0;
    uint64_t v24 = *(void *)(a1 + 88);
    uint64_t v25 = *(void *)(a1 + 96);
    v28[4] = v23;
    v28[5] = v24;
    v28[6] = *(void *)(a1 + 56);
    v28[7] = v25;
    long long v26 = *(_OWORD *)(a1 + 112);
    int8x16_t v29 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    long long v30 = v26;
    [v23 enumerateTextElementsFromLocation:v22 options:1 usingBlock:v28];
    return 0;
  }
  unint64_t v21 = objc_msgSend(*(id *)(a1 + 40), "offsetFromLocation:toLocation:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), objc_msgSend(v5, "location"));
  BOOL v14 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location");
  double v15 = *(double *)(a1 + 112)
      + *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
      * ((double)v21
       / (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      - *(double *)(a1 + 120);
  uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
LABEL_13:
  *(double *)(v10 + 24) = v15;
  return v14;
}

- (id)baseLocation
{
  double v2 = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange];

  return [(NSTextRange *)v2 location];
}

uint64_t __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_2(uint64_t result, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24)) {
    goto LABEL_5;
  }
  uint64_t v7 = a3;
  if (!a3) {
    uint64_t v7 = (void *)[a2 rangeInElement];
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 32), "endLocation"), "compare:", objc_msgSend(v7, "location"));
  *(unsigned char *)(*(void *)(*(void *)(v6 + 48) + 8) + 24) = result != 1;
  if (*(unsigned char *)(*(void *)(*(void *)(v6 + 48) + 8) + 24))
  {
LABEL_5:
    if (!*(unsigned char *)(v6 + 64))
    {
      *a4 = 1;
      return result;
    }
    goto LABEL_6;
  }
  if (!*(unsigned char *)(v6 + 65))
  {
LABEL_6:
    return [a2 invalidateLayout];
  }

  *(void *)(*(void *)(*(void *)(v6 + 56) + 8) + 40) = 0;
  uint64_t result = [a2 textElement];
  if (result)
  {
    if (!v7) {
      uint64_t v7 = (void *)[a2 rangeInElement];
    }
    *(void *)(*(void *)(*(void *)(v6 + 56) + 8) + 40) = (id)[v7 endLocation];
    double v8 = *(void **)(v6 + 40);
    return [v8 updateLayoutWithTextLayoutFragment:a2 addition:0];
  }
  return result;
}

uint64_t __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t result = [a2 state];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

- (void)enumerateTextSegmentsInRange:(NSTextRange *)textRange type:(NSTextLayoutManagerSegmentType)type options:(NSTextLayoutManagerSegmentOptions)options usingBlock:(void *)block
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__NSTextLayoutManager_enumerateTextSegmentsInRange_type_options_usingBlock___block_invoke;
  v6[3] = &unk_1E55C6118;
  v6[4] = block;
  [(NSTextLayoutManager *)self _enumerateTextSegmentAndCategoryInRange:textRange type:type options:options allowsZeroWidthExtensions:0 usingBlock:v6];
}

char *__113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_4(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v6 = (void *)[a2 textParagraph];
  uint64_t v7 = (void *)[a2 rangeInElement];
  uint64_t result = (char *)objc_msgSend(*(id *)(a1 + 32), "textContainerForLocation:", objc_msgSend(v7, "location"));
  if (*(unsigned char *)(a1 + 88))
  {
    BOOL v9 = 1;
    if (!v6) {
      goto LABEL_58;
    }
  }
  else
  {
    BOOL v9 = *(unsigned char *)(a1 + 89) != 0;
    if (!v6) {
      goto LABEL_58;
    }
  }
  uint64_t result = (char *)[*(id *)(a1 + 40) textRangeByIntersectingWithTextRange:v7];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t result = (char *)[result isEmpty];
    if (!result
      || *(unsigned char *)(a1 + 89)
      && (uint64_t result = (char *)objc_msgSend(v7, "containsLocation:", objc_msgSend(*(id *)(a1 + 40), "location")),
          result))
    {
      double v11 = (void *)[v6 paragraphSeparatorRange];
      double v12 = (void *)[a2 textLineFragments];
      objc_msgSend(v6, "_resolvedBaseWritingDirectionWithFallbackDirection:", objc_msgSend(*(id *)(a1 + 32), "_fallbackWritingDirection"));
      v47 = v12;
      uint64_t v49 = [v12 count];
      [a2 layoutFragmentFrameOrigin];
      double v14 = v13;
      double v16 = v15;
      if (*(unsigned char *)(a1 + 89)
        || (uint64_t v17 = v7,
            uint64_t v18 = [v10 endLocation],
            uint64_t v19 = [*(id *)(a1 + 40) endLocation],
            double v20 = (void *)v18,
            uint64_t v7 = v17,
            [v20 isEqual:v19]))
      {
        if (([v11 isEmpty] & 1) == 0) {
          objc_msgSend((id)objc_msgSend(v11, "endLocation"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "endLocation"));
        }
        int v21 = 0;
      }
      else
      {
        int v21 = 1;
      }
      uint64_t v22 = *(unsigned char *)(a1 + 89) ? *(char **)(a1 + 40) : v10;
      uint64_t result = (char *)objc_msgSend(v6, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v22, "location"), 0);
      NSUInteger v23 = (NSUInteger)result;
      if (*(unsigned char *)(a1 + 89))
      {
        v48 = 0;
      }
      else
      {
        uint64_t result = (char *)objc_msgSend(v6, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v10, "endLocation"), 1);
        v48 = &result[-v23];
      }
      if (v49 >= 1)
      {
        v40 = v6;
        uint64_t v24 = 0;
        v42 = a2;
        NSUInteger v43 = (NSUInteger)&v48[v23];
        if (v48) {
          char v25 = v21;
        }
        else {
          char v25 = 1;
        }
        char v44 = v25;
        int v46 = v21 ^ 1;
        NSUInteger v26 = (NSUInteger)v48;
        NSUInteger v45 = v23;
        v41 = a3;
        do
        {
          v27 = (void *)[v47 objectAtIndexedSubscript:v24];
          v51.NSUInteger location = [v27 characterRange];
          NSUInteger location = v51.location;
          NSUInteger length = v51.length;
          v52.NSUInteger location = v23;
          v52.NSUInteger length = v26;
          NSRange v30 = NSIntersectionRange(v51, v52);
          uint64_t result = (char *)v30.location;
          if (v30.length)
          {
            BOOL v31 = v46;
            if ((v44 & 1) == 0) {
              BOOL v31 = location + length >= v43;
            }
          }
          else
          {
            if (v26)
            {
              NSUInteger v32 = location + length;
LABEL_32:
              if (v32 <= v23)
              {
                NSUInteger v26 = (NSUInteger)v48;
                if (*(void *)(a1 + 72) && (*(unsigned char *)(a1 + 83) & 2) != 0)
                {
                  uint64_t result = (char *)[v27 typographicBounds];
                  **(double **)(a1 + 72) = v16 + v33 + v34;
                }
              }
              else
              {
                BOOL v9 = 1;
                NSUInteger v26 = (NSUInteger)v48;
              }
              goto LABEL_54;
            }
            if (v23 < location || (BOOL v31 = v46, v23 - location >= length))
            {
              NSUInteger v32 = location + length;
              if (!*(unsigned char *)(a1 + 90)) {
                goto LABEL_32;
              }
              BOOL v31 = v46;
              if (v23 != v32) {
                goto LABEL_32;
              }
            }
          }
          v35 = *(double **)(a1 + 72);
          if (v35 && *v35 == 0.0 && (*(unsigned char *)(a1 + 83) & 2) != 0)
          {
            uint64_t v36 = objc_msgSend(v42, "textLayoutManager", *v35);
            uint64_t v37 = [v7 location];
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_5;
            v50[3] = &__block_descriptor_40_e30_B16__0__NSTextLayoutFragment_8l;
            v50[4] = *(void *)(a1 + 72);
            v38 = (void *)v36;
            a3 = v41;
            [v38 enumerateTextLayoutFragmentsFromLocation:v37 options:5 usingBlock:v50];
          }
          uint64_t result = (char *)(*(uint64_t (**)(double, double))(*(void *)(a1 + 48) + 16))(v14, v16);
          if (result) {
            BOOL v9 = 1;
          }
          if (v9)
          {
            if (((v31 | result) & 1) == 0)
            {
              uint64_t result = (char *)(id)[v40 locationForCharacterIndex:location + length dataSourceLocationsOnly:0 actualRange:0];
              *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
            }
            break;
          }
          BOOL v39 = *(unsigned char *)(a1 + 92) && !*(unsigned char *)(a1 + 89) || *(unsigned char *)(a1 + 93) != 0;
          NSUInteger v23 = v45;
          NSUInteger v26 = (NSUInteger)v48;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v39;
LABEL_54:
          ++v24;
        }
        while (v49 != v24);
      }
    }
  }
LABEL_58:
  *a3 = v9;
  return result;
}

- (void)_enumerateTextSegmentAndCategoryInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 allowsZeroWidthExtensions:(BOOL)a6 usingBlock:(id)a7
{
  unsigned int v64 = (a5 >> 1) & 1;
  unint64_t v12 = a5 & 1;
  unsigned int v13 = BYTE3(a5) & 1;
  unint64_t v14 = a4 - 1;
  BOOL v15 = (unint64_t)(a4 - 1) < 2;
  int v16 = [a3 isEmpty];
  BOOL v17 = +[NSTextLayoutFragment coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled];
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  unint64_t v63 = v14;
  v91 = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke;
  v92 = &unk_1E55C6080;
  BOOL v95 = v17;
  BOOL v18 = v14 > 1;
  BOOL v96 = (a5 & 0x4000000) == 0;
  BOOL v61 = v17;
  BOOL v62 = v14 > 1;
  BOOL v97 = (a5 & 0x8000000) != 0;
  unint64_t v19 = (a5 >> 3) & 1;
  char v98 = v13;
  double v20 = (void (**)(id, id, void *, uint64_t, __n128, __n128, double))a7;
  int v21 = v16;
  uint64_t v22 = self;
  char v99 = v12;
  BOOL v100 = a6;
  char v101 = v21;
  BOOL v102 = v15;
  v93 = self;
  v94 = v20;
  char v103 = v21 & (a5 >> 4);
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  BOOL v89 = (a5 & 4) != 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3052000000;
  v85 = __Block_byref_object_copy__2;
  v86 = __Block_byref_object_dispose__2;
  uint64_t v87 = 0;
  uint64_t v81 = 0;
  if (v18) {
    int v23 = 1;
  }
  else {
    int v23 = v21;
  }
  if (v23) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = &v81;
  }
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_4;
  v74[3] = &unk_1E55C60C8;
  char v75 = v64;
  char v76 = v21;
  v74[4] = self;
  v74[5] = a3;
  char v77 = v21 & (a5 >> 4);
  BOOL v78 = (a5 & 8) != 0;
  BOOL v79 = v15;
  v74[9] = v24;
  v74[10] = a5;
  v74[6] = v90;
  v74[7] = v88;
  v65 = v24;
  v74[8] = &v82;
  BOOL v80 = (a5 & 4) != 0;
  [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsInTextRange:a3 options:12 usingBlock:v74];
  if (v21) {
    int v25 = objc_msgSend((id)objc_msgSend(a3, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation"));
  }
  else {
    int v25 = 0;
  }
  if (v83[5] || v25)
  {
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3052000000;
    v71 = __Block_byref_object_copy__2;
    v72 = __Block_byref_object_dispose__2;
    uint64_t v73 = 0;
    uint64_t v26 = [a3 endLocation];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_6;
    v66[3] = &unk_1E55C60F0;
    v66[4] = a3;
    v66[5] = &v82;
    char v67 = v25;
    v66[6] = &v68;
    [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v26 options:13 usingBlock:v66];
    v27 = (void *)v69[5];
    if (v27)
    {
      v28 = (void *)[v27 textParagraph];
      v60 = (void *)[(id)v69[5] rangeInElement];
      id v59 = -[NSTextLayoutManager textContainerForLocation:](v22, "textContainerForLocation:", [v60 location]);
      if (v28)
      {
        int8x16_t v29 = (void *)[(id)v69[5] textLineFragments];
        uint64_t v58 = objc_msgSend(v28, "_resolvedBaseWritingDirectionWithFallbackDirection:", -[NSTextLayoutManager _fallbackWritingDirection](v22, "_fallbackWritingDirection"));
        uint64_t v30 = [v29 count];
        [(id)v69[5] layoutFragmentFrameOrigin];
        if (v30 >= 1)
        {
          double v33 = v31;
          double v34 = v32;
          if (v25)
          {
            v35 = (void *)[v29 lastObject];
            [v35 characterRange];
            if (v36)
            {
              if (v63 < 2) {
                uint64_t v37 = v21 ^ 1u;
              }
              else {
                uint64_t v37 = 0;
              }
              ((void (*)(void *, void *, id, void *, uint64_t, uint64_t, void, id, double, double, void))v91)(v90, v35, a3, v60, v58, v37, 0, v59, v33, v34, 0);
            }
            else
            {
              [v35 glyphOrigin];
              double v44 = v43;
              [v59 lineFragmentPadding];
              double v46 = v45;
              [v35 typographicBounds];
              if (v61) {
                double v50 = v44;
              }
              else {
                double v50 = v33;
              }
              if (v61) {
                double v49 = v49 + v46 * -2.0;
              }
              double v51 = v50 + v47.n128_f64[0];
              v48.n128_f64[0] = v34 + v48.n128_f64[0];
              if (v58 == 1) {
                double v49 = -0.0;
              }
              v47.n128_f64[0] = v51 + v49;
              if (v12) {
                id v52 = 0;
              }
              else {
                id v52 = a3;
              }
              v20[2](v20, v52, v59, 1, v47, v48, 0.0);
            }
          }
          else
          {
            NSUInteger v38 = objc_msgSend(v28, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v60, "location"), 0);
            NSUInteger v39 = objc_msgSend(v28, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(a3, "endLocation"), 1);
            v40 = (void *)[v28 paragraphSeparatorRange];
            char v41 = (a5 & 8) != 0 || v62;
            if ((v41 & 1) == 0)
            {
              v42 = v40;
              if ([v40 isEmpty]) {
                LOBYTE(v19) = 0;
              }
              else {
                LOBYTE(v19) = objc_msgSend((id)objc_msgSend(v42, "endLocation"), "isEqual:", objc_msgSend(a3, "endLocation"));
              }
            }
            while (1)
            {
              BOOL v18 = v30-- < 1;
              if (v18) {
                break;
              }
              char v53 = v19;
              v54 = (void *)[v29 objectAtIndexedSubscript:v30];
              v105.NSUInteger location = [v54 characterRange];
              v105.NSUInteger length = v55;
              v104.NSUInteger location = v38;
              v104.NSUInteger length = v39;
              LOBYTE(v19) = 0;
              if (NSIntersectionRange(v104, v105).length)
              {
                uint64_t v56 = [v60 textRangeByIntersectingWithTextRange:a3];
                if (v63 < 2) {
                  uint64_t v57 = v21 ^ 1u;
                }
                else {
                  uint64_t v57 = 0;
                }
                ((void (*)(void *, void *, uint64_t, void *, uint64_t, uint64_t, void, id, double, double, uint64_t *))v91)(v90, v54, v56, v60, v58, v57, v53 & 1, v59, v33, v34, v65);
                break;
              }
            }
          }
        }
      }
    }
    _Block_object_dispose(&v68, 8);
  }
  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(v88, 8);
}

- (int64_t)_fallbackWritingDirection
{
  if ([(NSTextLayoutManager *)self applicationFrameworkContext] != 2) {
    return 0;
  }

  return +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
}

- (int64_t)applicationFrameworkContext
{
  objc_sync_enter(self);
  int64_t applicationFrameworkContext = self->_applicationFrameworkContext;
  objc_sync_exit(self);
  return applicationFrameworkContext;
}

- (id)enumerateTextLayoutFragmentsInTextRange:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v9 = a4 & 1;
  char v10 = [a3 isEmpty];
  if (a4) {
    uint64_t v11 = [a3 endLocation];
  }
  else {
    uint64_t v11 = [a3 location];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__NSTextLayoutManager_enumerateTextLayoutFragmentsInTextRange_options_usingBlock___block_invoke;
  v13[3] = &unk_1E55C5F98;
  char v14 = v9;
  char v15 = v10;
  v13[4] = a3;
  v13[5] = a5;
  return [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v11 options:a4 usingBlock:v13];
}

uint64_t __76__NSTextLayoutManager_enumerateTextSegmentsInRange_type_options_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, double a5, uint64_t a6, uint64_t a7, int a8, int a9, void *a10, double *a11)
{
  unint64_t v19 = objc_msgSend((id)objc_msgSend(a10, "textLayoutManager"), "textViewportLayoutController");
  [a2 glyphOrigin];
  double v80 = v20;
  double v22 = v21;
  [a10 size];
  double v24 = v23;
  double v25 = 10000000.0;
  BOOL v26 = v23 >= 10000000.0 || v23 <= 0.0;
  if (v19)
  {
    [v19 _viewportBounds];
    double v25 = v27;
  }
  double v75 = v22;
  [a10 lineFragmentPadding];
  double v29 = v28;
  double v30 = v24 - v28;
  if (v26) {
    double v30 = v25;
  }
  double v82 = v30;
  [a2 typographicBounds];
  double v35 = v34;
  if (a11) {
    double v36 = *a11;
  }
  else {
    double v36 = 0.0;
  }
  double v37 = *MEMORY[0x1E4F28AD8];
  double v38 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v40 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v39 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x3052000000;
  v121 = __Block_byref_object_copy__2;
  v122 = __Block_byref_object_dispose__2;
  uint64_t v123 = 0;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x3052000000;
  v115 = __Block_byref_object_copy__2;
  v116 = __Block_byref_object_dispose__2;
  uint64_t v117 = 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2020000000;
  char v111 = 0;
  double v41 = v32 + v29 * -2.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v41 = v32;
  }
  double v73 = v41;
  double v74 = a4;
  if (*(unsigned char *)(a1 + 48)) {
    a4 = v80;
  }
  double v42 = a5 + v31;
  BOOL v43 = v36 < a5 + v31;
  double v44 = v33 + a5 + v31 - v36;
  if (v36 > 0.0 && v43) {
    double v42 = v36;
  }
  else {
    double v44 = v33;
  }
  double v76 = v42;
  double v77 = v44;
  if (v29 >= v82)
  {
    double v51 = v38;
    double v52 = v37;
    double v53 = v39;
    double v78 = v40;
    double v79 = v52;
  }
  else
  {
    double v45 = (void *)[a2 textLineFragmentRange];
    double v46 = (objc_class *)objc_opt_class();
    __n128 v47 = NSStringFromClass(v46);
    _UIFoundationAssert(a2, v47, v45 != 0, &__block_literal_global_168);
    if (!v45)
    {
      BOOL v54 = 0;
      goto LABEL_70;
    }
    double v79 = v37;
    double v72 = v35 + a4;
    if (a8)
    {
      __n128 v48 = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", [v45 location]);
      double v49 = v48;
      if (a7 == 1)
      {
        double v71 = v73 + v72;
        if (v77 <= 0.0)
        {
          double v69 = v39;
          double v70 = v38;
          double v68 = v40;
          double v38 = v76;
          double v40 = v82 - (v73 + v72);
          double v39 = v77;
        }
        else
        {
          double v50 = v48;
          double v68 = v40;
          double v69 = v39;
          if (v82 - (v73 + v72) >= 0.0) {
            double v40 = v82 - (v73 + v72);
          }
          else {
            double v40 = 0.0;
          }
          double v70 = v38;
          v113[5] = (uint64_t)v50;
          double v38 = v76;
          double v39 = v77;
        }
        double v52 = v37;
      }
      else
      {
        double v55 = v72 - v29;
        if (v77 <= 0.0)
        {
          double v69 = v77;
          double v70 = v76;
          double v71 = v37;
          double v68 = v72 - v29;
        }
        else
        {
          uint64_t v56 = v48;
          if (v55 < 0.0) {
            double v55 = 0.0;
          }
          v119[5] = (uint64_t)v56;
          double v68 = v55;
          double v69 = v77;
          double v70 = v76;
          double v71 = v37;
        }
        double v52 = v29;
      }
      double v53 = v39;
      double v78 = v40;
      double v51 = v38;

      double v39 = v69;
      double v38 = v70;
      double v40 = v68;
      double v79 = v71;
    }
    else
    {
      double v51 = v38;
      double v78 = v40;
      double v53 = v39;
      double v52 = v79;
    }
    if (a9)
    {
      uint64_t v57 = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", [v45 endLocation]);
      uint64_t v58 = v57;
      if (a7 == 1)
      {
        double v40 = v72 - v29;
        double v39 = v77;
        if (v77 <= 0.0)
        {
          double v38 = v76;
        }
        else
        {
          id v59 = v57;
          if (v40 < 0.0) {
            double v40 = 0.0;
          }
          v119[5] = (uint64_t)v59;
          double v38 = v76;
          double v39 = v77;
        }
        double v52 = v29;
      }
      else
      {
        double v79 = v73 + v72;
        double v78 = v82 - (v73 + v72);
        double v53 = v77;
        if (v77 > 0.0)
        {
          v60 = v57;
          double v53 = v77;
          double v61 = v82 - (v73 + v72);
          if (v78 < 0.0) {
            double v61 = 0.0;
          }
          double v78 = v61;
          v113[5] = (uint64_t)v60;
        }
        double v51 = v76;
      }
    }
  }
  uint64_t v62 = *(unsigned __int8 *)(a1 + 49);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_3;
  v83[3] = &unk_1E55C6058;
  char v104 = *(unsigned char *)(a1 + 48);
  double v88 = v74;
  double v89 = a5;
  double v90 = v36;
  v83[4] = a2;
  v85 = &v118;
  uint64_t v91 = a7;
  double v92 = v52;
  double v93 = v38;
  double v94 = v40;
  double v95 = v39;
  int v105 = *(_DWORD *)(a1 + 50);
  double v96 = v80;
  double v97 = v75;
  v83[5] = a10;
  v86 = &v108;
  uint64_t v87 = &v112;
  double v98 = v79;
  double v99 = v51;
  double v100 = v78;
  double v101 = v53;
  char v106 = *(unsigned char *)(a1 + 54);
  __int16 v107 = *(_WORD *)(a1 + 55);
  long long v84 = *(_OWORD *)(a1 + 32);
  double v102 = v29;
  double v103 = v82;
  [a2 enumerateTextSegmentBoundsInTextRange:a3 dataSourceLocationsOnly:v62 usingBlock:v83];
  if (v119[5])
  {
    if (*(unsigned char *)(a1 + 53)
      || (v124.origin.x = v52,
          v124.origin.y = v38,
          v124.size.width = v40,
          v124.size.height = v39,
          CGRectGetWidth(v124) > 0.0))
    {
      if (*(unsigned char *)(a1 + 52)) {
        uint64_t v63 = 0;
      }
      else {
        uint64_t v63 = v119[5];
      }
      char v64 = (*(uint64_t (**)(void, uint64_t, void *, uint64_t, double, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v63, a10, 2, v52, v38, v40, v39, v75);
      *((unsigned char *)v109 + 24) = v64 ^ 1;
    }
  }
  if (v113[5])
  {
    if (*(unsigned char *)(a1 + 53)
      || (v125.size.width = v78,
          v125.origin.x = v79,
          v125.origin.y = v51,
          v125.size.height = v53,
          CGRectGetWidth(v125) > 0.0))
    {
      if (*(unsigned char *)(a1 + 52)) {
        uint64_t v65 = 0;
      }
      else {
        uint64_t v65 = v113[5];
      }
      char v66 = (*(uint64_t (**)(void, uint64_t, void *, uint64_t, double, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v65, a10, 4, v79, v51, v78, v53, v75);
      *((unsigned char *)v109 + 24) = v66 ^ 1;
    }
  }

  if (a11) {
    *a11 = v76 + v77;
  }
  BOOL v54 = *((unsigned char *)v109 + 24) != 0;
LABEL_70:
  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v118, 8);
  return v54;
}

- (NSTextRange)documentRange
{
  double v3 = [(NSTextLayoutManager *)self textContentManager];
  if (v3)
  {
    return [(NSTextContentManager *)v3 documentRange];
  }
  else
  {
    NSLog((NSString *)@"%@: .documentRange called while .textContentManager is nil.", self);
    if (NSTextLayoutManagerBreakOnNilContentManager_onceToken != -1) {
      dispatch_once(&NSTextLayoutManagerBreakOnNilContentManager_onceToken, &__block_literal_global_4);
    }
    double v5 = [[NSTextRange alloc] initWithLocation:+[NSNotATextLocation notATextLocation]];
    return v5;
  }
}

- (id)enumerateTextLayoutFragmentsFromLocation:(id)location options:(NSTextLayoutFragmentEnumerationOptions)options usingBlock:(void *)block
{
  double v37 = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange];
  id v8 = [(NSTextLayoutManager *)self delegate];
  if (v8)
  {
    id v9 = v8;
    if (objc_opt_respondsToSelector()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  objc_sync_enter(self);
  BOOL v36 = [(NSTextRange *)v37 isNotEmpty];
  BOOL v11 = [(NSTextLayoutManager *)self usesContiguousLayout];
  activeEnumerationCache = self->_activeEnumerationCache;
  uint64_t v76 = 0;
  double v77 = &v76;
  uint64_t v78 = 0x5810000000;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v80 = 0u;
  *(void *)&long long v82 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v83 = (options & 4) != 0;
  *(_DWORD *)((char *)&v83 + 1) = options & 1;
  uint64_t v72 = 0;
  double v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  uint64_t v66 = 0;
  char v67 = &v66;
  uint64_t v68 = 0x3052000000;
  double v69 = __Block_byref_object_copy__2;
  double v70 = __Block_byref_object_dispose__2;
  id v71 = location;
  objc_initWeak(&locationa, self);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  double v53 = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke;
  BOOL v54 = &unk_1E55C5EF8;
  objc_copyWeak(v61, &locationa);
  BOOL v62 = (options & 4) != 0;
  BOOL v63 = v11;
  char v64 = options & 1;
  double v55 = self;
  id v56 = v10;
  v61[1] = (id)options;
  uint64_t v57 = block;
  uint64_t v58 = &v76;
  id v59 = &v66;
  v60 = &v72;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v51[0] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_4;
  v51[1] = &unk_1E55C5F20;
  v51[2] = self;
  self->_activeEnumerationCache = ($2B150901B53E279622BCD82FC26F074A *)(v77 + 4);
  if (v36) {
    [(NSTextLayoutManager *)self _invalidateTextParagraphForEmptyDocument];
  }
  [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] synchronizeTextLayoutManagers:0];
  if ((options & 4) != 0 && v11)
  {
    if (v67[5])
    {
      id v12 = [(NSTextRange *)v37 location];
      if ([v12 compare:v67[5]] == -1)
      {
        if (!activeEnumerationCache || !activeEnumerationCache->var8)
        {
          if ([(NSTextLayoutManager *)self hasNonSimpleRectangularTextContainer])
          {
            softInvalidationLocation = self->_softInvalidationLocation;
            if (softInvalidationLocation)
            {
              if ([(NSTextLocation *)softInvalidationLocation compare:v67[5]] == -1)
              {
                char v14 = [NSTextRange alloc];
                char v15 = [(NSTextRange *)v14 initWithLocation:self->_softInvalidationLocation endLocation:v67[5]];
                [(NSTextLayoutManager *)self invalidateLayoutForRange:v15];
              }
            }
          }
          [(NSTextLayoutManager *)self _fillLayoutToLocation:v67[5] enumerationCache:v77 + 4];
        }
        if (![(NSTextLayoutManager *)self lastContainerFilled])
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_6;
          v48[3] = &unk_1E55C5F48;
          v48[4] = &v66;
          v48[5] = &v76;
          char v49 = options & 1;
          [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:0 options:0 usingBlock:v48];
        }
      }
    }
  }
  if (!v67[5])
  {
    if (options) {
      uint64_t v16 = [(NSTextRange *)v37 endLocation];
    }
    else {
      uint64_t v16 = [(NSTextRange *)v37 location];
    }
    v67[5] = v16;
  }
  double v34 = v51;
  uint64_t v42 = 0;
  BOOL v43 = &v42;
  uint64_t v44 = 0x3052000000;
  double v45 = __Block_byref_object_copy__2;
  double v46 = __Block_byref_object_dispose__2;
  uint64_t v47 = 0;
  while (1)
  {
    BOOL v17 = [(NSTextLayoutManager *)self textContentManager];
    uint64_t v18 = v67[5];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_7;
    v39[3] = &unk_1E55C5F70;
    char v40 = (options & 4) >> 2;
    char v41 = options & 1;
    v39[7] = &v42;
    v39[8] = &v66;
    v39[4] = v37;
    v39[5] = v50;
    v39[6] = v52;
    id v19 = [(NSTextContentManager *)v17 enumerateTextElementsFromLocation:v18 options:options usingBlock:v39];
    double v20 = (void *)v77[5];
    if (v20 && [v20 compare:v19] == -1) {
      id v19 = (id)v77[5];
    }
    double v21 = v73;
    if (!*((unsigned char *)v73 + 24)) {
      break;
    }
    if (![(NSTextLayoutManager *)self lastContainerFilled])
    {
      double v21 = v73;
      break;
    }
    BOOL v22 = [(NSTextLayoutManager *)self _appendTextContainer];
    double v21 = v73;
    if (!v22) {
      break;
    }
    double v23 = v77;
    v77[6] = 0;
    v23[7] = 0;
    v23[8] = 0x7FFFFFFFFFFFFFFFLL;
    v43[5] = 0;
    v67[5] = (uint64_t)v19;
    *((unsigned char *)v21 + 24) = 0;
  }
  if ((options & 8) != 0
    && !*((unsigned char *)v21 + 24)
    && (!v19 || [v19 isEqual:v67[5]])
    && [(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange] isEmpty])
  {
    id v24 = [(NSTextLayoutManager *)self _textParagraphForEmptyDocument];
    BOOL v25 = v53((uint64_t)v52, v24);
    *((unsigned char *)v73 + 24) = !v25;
  }
  if ((options & 4) != 0 && !*((unsigned char *)v73 + 24) && (v43[5] || v67[5]))
  {
    if (options)
    {
      id v26 = [(NSTextRange *)v37 location];
      double v29 = (void *)v43[5];
      if (v29)
      {
        uint64_t v28 = [v29 location];
        goto LABEL_50;
      }
    }
    else
    {
      id v26 = [(NSTextRange *)v37 endLocation];
      double v27 = (void *)v43[5];
      if (v27)
      {
        uint64_t v28 = [v27 endLocation];
LABEL_50:
        double v30 = (void *)v28;
LABEL_52:
        if (([v26 isEqual:v30] & 1) == 0
          && [(NSTextRange *)v37 containsLocation:v30])
        {
          if (options) {
            id v31 = v26;
          }
          else {
            id v31 = v30;
          }
          if (options) {
            id v26 = v30;
          }
          if (v31 && v26)
          {
            double v32 = [[NSTextRange alloc] initWithLocation:v31 endLocation:v26];
            ((void (*)(void *, NSTextRange *))v51[0])(v50, v32);
          }
        }
        goto LABEL_62;
      }
    }
    double v30 = (void *)v67[5];
    goto LABEL_52;
  }
LABEL_62:
  _Block_object_dispose(&v42, 8);
  self->_activeEnumerationCache = activeEnumerationCache;
  objc_destroyWeak(v61);
  objc_destroyWeak(&locationa);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  objc_sync_exit(self);
  return v19;
}

- (NSTextContentManager)textContentManager
{
  return (NSTextContentManager *)objc_loadWeak((id *)&self->_textContentManager);
}

- (id)delegate
{
  objc_sync_enter(self);
  id Weak = objc_loadWeak((id *)&self->_delegate);
  objc_sync_exit(self);
  return Weak;
}

BOOL __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v67 = 0;
  uint64_t v68 = &v67;
  uint64_t v69 = 0x2020000000;
  TextContainerEntryAndIndexForLocation = 0;
  double v4 = (id *)(a1 + 80);
  id Weak = objc_loadWeak((id *)(a1 + 80));
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(Weak, objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location"));
  uint64_t v63 = 0;
  char v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  if (v68[3])
  {
    uint64_t v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) objectForKey:a2];
    uint64_t v7 = (NSTextRange *)[v6 lastObject];
    id v8 = &off_18E5F7000;
    if (v7)
    {
      if (!*(unsigned char *)(a1 + 96) || !*(unsigned char *)(a1 + 97) || *(unsigned char *)(a1 + 98)) {
        goto LABEL_51;
      }
      uint64_t v9 = *(void *)(v68[3] + 56);
      id v10 = objc_loadWeak(v4);
      unint64_t v11 = v10[31];
      if (v10[19]) {
        ++v11;
      }
      if (v9 + 1 >= v11) {
        goto LABEL_51;
      }
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v12) {
        uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      uint64_t v13 = [v6 countByEnumeratingWithState:&v59 objects:v72 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v60;
LABEL_13:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v60 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = *(void **)(*((void *)&v59 + 1) + 8 * v15);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "rangeInElement"), "location"), "compare:", v12) != -1) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v6 countByEnumeratingWithState:&v59 objects:v72 count:16];
            if (v13) {
              goto LABEL_13;
            }
            goto LABEL_35;
          }
        }
        if (v16)
        {
          if ((unint64_t)[v16 state] >= 3)
          {
            [v16 layoutFragmentFrame];
            uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
            if (*(void *)(v23 + 40))
            {
              CGFloat v24 = v19;
              CGFloat v25 = v20;
              CGFloat v26 = v21;
              CGFloat v27 = v22;
              double v28 = *(double *)(v23 + 48);
              if (v28 != CGRectGetMinY(*(CGRect *)&v19))
              {
                if ([v16 hasPartialLayout]) {
                  goto LABEL_26;
                }
                double v29 = *(void **)v68[3];
                if (v29
                  && ((unint64_t)[v6 count] > 1
                   || (unint64_t)objc_msgSend((id)objc_msgSend(v16, "textLineFragments"), "count") >= 2))
                {
                  [v29 size];
                  double v31 = v30;
                  unint64_t v32 = [v29 maximumNumberOfLines];
                  if (v31 <= 0.0 || v31 >= 10000000.0)
                  {
                    double v33 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
                    v74.origin.x = v24;
                    v74.origin.y = v25;
                    v74.size.width = v26;
                    v74.size.height = v27;
                    if (v33 + CGRectGetHeight(v74) > v31) {
                      goto LABEL_26;
                    }
                  }
                  if (v32)
                  {
                    uint64_t v55 = 0;
                    id v56 = &v55;
                    uint64_t v57 = 0x2020000000;
                    uint64_t v58 = 0;
                    uint64_t v58 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56);
                    v54[0] = MEMORY[0x1E4F143A8];
                    v54[1] = 3221225472;
                    v54[2] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_2;
                    v54[3] = &unk_1E55C5EA8;
                    v54[4] = &v55;
                    v54[5] = v32;
                    [v6 enumerateObjectsUsingBlock:v54];
                    unint64_t v34 = v56[3];
                    _Block_object_dispose(&v55, 8);
                    if (v34 > v32)
                    {
LABEL_26:
                      objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutForRange:", objc_msgSend(a2, "elementRange"));
                      uint64_t v6 = 0;
                      uint64_t v7 = 0;
                      id v8 = &off_18E5F7000;
                      goto LABEL_38;
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_35:
      if (!*(unsigned char *)(v68[3] + 64) || ![(NSTextRange *)v7 hasPartialLayout])
      {
        id v8 = &off_18E5F7000;
LABEL_51:
        uint64_t v42 = *(unsigned __int8 *)(a1 + 98);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = *((void *)v8 + 80);
        v47[2] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_3;
        v47[3] = &unk_1E55C5ED0;
        char v52 = v42;
        int8x16_t v48 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
        __int16 v53 = *(_WORD *)(a1 + 96);
        objc_copyWeak(v51, v4);
        v51[1] = *(id *)(a1 + 88);
        uint64_t v43 = *(void *)(a1 + 32);
        char v49 = &v63;
        double v50 = &v67;
        uint64_t v44 = *(void *)(a1 + 48);
        v47[4] = v43;
        v47[5] = v44;
        [v6 enumerateObjectsWithOptions:2 * v42 usingBlock:v47];
        objc_destroyWeak(v51);
        BOOL v17 = (char *)(v64 + 3);
        char v18 = *((unsigned char *)v64 + 24);
        goto LABEL_52;
      }
      id v8 = &off_18E5F7000;
      uint64_t v7 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend((id)-[NSTextRange rangeInElement](v7, "rangeInElement"), "endLocation"), objc_msgSend((id)objc_msgSend(a2, "elementRange"), "endLocation"));
    }
LABEL_38:
    double v35 = *(void **)(a1 + 40);
    if (!v35) {
      goto LABEL_42;
    }
    id v36 = objc_loadWeak(v4);
    uint64_t v37 = [(NSTextRange *)v7 location];
    if (!v37) {
      uint64_t v37 = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location");
    }
    double v38 = (NSTextLayoutFragment *)(id)[v35 textLayoutManager:v36 textLayoutFragmentForLocation:v37 inTextElement:a2];
    if (!v38) {
LABEL_42:
    }
      double v38 = [[NSTextLayoutFragment alloc] initWithTextElement:a2 range:v7];
    [(NSTextLayoutFragment *)v38 setTextLayoutManager:objc_loadWeak(v4)];
    if (v6)
    {
      uint64_t v39 = [v6 arrayByAddingObject:v38];
    }
    else
    {
      id v71 = v38;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    }
    uint64_t v6 = (void *)v39;
    id v40 = objc_loadWeak(v4);
    id v41 = (id)*((void *)v40 + 11);
    if (!v41)
    {
      id v41 = (id)[MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      *((void *)v40 + 11) = v41;
    }
    if (!*((void *)v40 + 10))
    {
      *((void *)v40 + 10) = [(_NSTextRunStorage *)[_NSTextLayoutFragmentStorage alloc] initWithDataSource:v40];
      id v41 = (id)*((void *)v40 + 11);
    }
    [v41 setObject:v6 forKey:a2];
    [*((id *)v40 + 10) setTextLayoutFragments:v6];

    goto LABEL_51;
  }
  BOOL v17 = &v66;
  char v18 = 1;
  char v66 = 1;
LABEL_52:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v18;
  BOOL v45 = *v17 == 0;
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  return v45;
}

- (id)_textParagraphForEmptyDocument
{
  objc_sync_enter(self);
  textParagraphForEmptyDocument = self->_textParagraphForEmptyDocument;
  if (!textParagraphForEmptyDocument)
  {
    id v4 = [(NSArray *)[(NSTextLayoutManager *)self textSelections] firstObject];
    if (v4) {
      id v5 = (id)[v4 typingAttributes];
    }
    else {
      id v5 = [(NSTextContainer *)[(NSTextLayoutManager *)self textContainer] attributesForExtraLineFragment];
    }
    id v6 = v5;
    uint64_t v7 = [NSTextParagraph alloc];
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)MEMORY[0x1E4F1CC08];
    }
    textParagraphForEmptyDocument = [(NSTextParagraph *)v7 initWithString:&stru_1EDD49F70 attributes:v8];
    uint64_t v9 = [(NSTextLayoutManager *)self textContentManager];
    [(NSTextElement *)textParagraphForEmptyDocument setTextContentManager:v9];
    [(NSTextParagraph *)textParagraphForEmptyDocument setElementRange:[(NSTextContentManager *)v9 documentRange]];
    [(NSTextParagraph *)textParagraphForEmptyDocument setParagraphContentRange:[(NSTextContentManager *)v9 documentRange]];
    [(NSTextParagraph *)textParagraphForEmptyDocument setParagraphSeparatorRange:[(NSTextContentManager *)v9 documentRange]];
    self->_textParagraphForEmptyDocument = textParagraphForEmptyDocument;
  }
  objc_sync_exit(self);
  return textParagraphForEmptyDocument;
}

- (void)_invalidateTextParagraphForEmptyDocument
{
  objc_sync_enter(self);
  if (self->_textParagraphForEmptyDocument)
  {
    if (objc_msgSend(-[NSMapTable objectForKey:](self->_textLayoutFragmentTable, "objectForKey:"), "count"))
    {
      if (self->_textContainerEntriesCount) {
        textContainerEntries = self->_textContainerEntries;
      }
      else {
        textContainerEntries = self->_lastTextContainerEntry.textContainer
      }
                             ? ($CD956B2ACB38B728AB2E3DF9A3B345A0 *)&self->_lastTextContainerEntry
                             : 0;
      [(NSMapTable *)self->_textLayoutFragmentTable removeObjectForKey:self->_textParagraphForEmptyDocument];
      if (textContainerEntries)
      {
        textContainerEntries->var5 = 0;
        if (![(NSMapTable *)self->_textLayoutFragmentTable count])
        {
          CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
          textContainerEntries->var3.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
          textContainerEntries->var3.size = v4;
        }
      }
    }

    self->_textParagraphForEmptyDocument = 0;
  }

  objc_sync_exit(self);
}

- (NSTextViewportLayoutController)textViewportLayoutController
{
  double v2 = [(NSTextLayoutManager *)self textContainer];

  return (NSTextViewportLayoutController *)[(NSTextContainer *)v2 textViewportLayoutController];
}

- (NSTextContainer)textContainer
{
  double v2 = [(NSTextLayoutManager *)self textContainers];

  return (NSTextContainer *)[(NSArray *)v2 lastObject];
}

- (NSArray)textContainers
{
  objc_sync_enter(self);
  if ([(NSTextLayoutManager *)self textContentManager])
  {
    uint64_t v3 = self->_lastTextContainerEntry.textContainer ? -1 : 0;
    if (self->_textContainerEntriesCount == v3) {
      [(NSTextLayoutManager *)self _addTextContainerForLocation:[(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange] location]];
    }
  }
  textContainers = self->_textContainers;
  if (!textContainers)
  {
    textContainers = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (self->_lastTextContainerEntry.textContainer) {
      unint64_t textContainerEntriesCount = self->_textContainerEntriesCount + 1;
    }
    else {
      unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
    }
    if (textContainerEntriesCount)
    {
      uint64_t v6 = 0;
      for (unint64_t i = 0; i != textContainerEntriesCount; ++i)
      {
        if (self->_textContainerEntriesCount <= i)
        {
          if (self->_lastTextContainerEntry.textContainer) {
            p_lastTextContainerEntry = &self->_lastTextContainerEntry;
          }
          else {
            p_lastTextContainerEntry = 0;
          }
        }
        else
        {
          p_lastTextContainerEntry = ($12329A12E88B98FC1E4249E14A3806EA *)&self->_textContainerEntries[v6];
        }
        [(NSArray *)textContainers addObject:p_lastTextContainerEntry->textContainer];
        ++v6;
      }
    }
    self->_textContainers = textContainers;
  }
  uint64_t v9 = textContainers;
  objc_sync_exit(self);
  return v9;
}

- (void)_fillLayoutToLocation:(id)a3 enumerationCache:(id *)a4
{
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, a3);
  id v8 = TextContainerEntryAndIndexForLocation;
  if (TextContainerEntryAndIndexForLocation
    && (softInvalidationLocation = (NSTextLocation *)*((void *)TextContainerEntryAndIndexForLocation + 1)) != 0
    || (softInvalidationLocation = [(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange] location], v8))
  {
    id v10 = (void *)*((void *)v8 + 2);
  }
  else
  {
    id v10 = 0;
  }
  if (self->_softInvalidationLocation
    && objc_msgSend((id)objc_msgSend(v10, "location"), "compare:", self->_softInvalidationLocation) == -1)
  {
    softInvalidationLocation = self->_softInvalidationLocation;
  }
  if ([(NSTextLocation *)softInvalidationLocation compare:a3] == -1)
  {
    unint64_t v11 = [[NSTextRange alloc] initWithLocation:softInvalidationLocation endLocation:a3];
    a4->var8 = 1;
    [(NSTextLayoutManager *)self ensureLayoutForRange:v11];
    a4->var8 = 0;
  }
}

- (BOOL)isCountableDataSource
{
  double v2 = [(NSTextLayoutManager *)self textContentManager];

  return [(NSTextContentManager *)v2 isCountableDataSource];
}

- (BOOL)_appendTextContainer
{
  textContainer = self->_lastTextContainerEntry.textContainer;
  unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
  if ((textContainerEntriesCount & 0x8000000000000000) != 0)
  {
    p_lastTextContainerEntry = ($12329A12E88B98FC1E4249E14A3806EA *)&self->_textContainerEntries[-1];
  }
  else if (textContainer)
  {
    p_lastTextContainerEntry = &self->_lastTextContainerEntry;
  }
  else
  {
    p_lastTextContainerEntry = 0;
  }
  if ([(NSTextLayoutManager *)self applicationFrameworkContext] == 2
    && ([(NSTextLayoutManager *)self templateTextContainer]
     || self->_delegateWithTextContainerQuery)
    && p_lastTextContainerEntry
    && [(NSTextContainer *)p_lastTextContainerEntry->textContainer lineBreakMode] <= NSLineBreakByCharWrapping
    && p_lastTextContainerEntry->containerFilled
    && [(NSTextRange *)p_lastTextContainerEntry->textRange isNotEmpty]
    && objc_msgSend(-[NSTextRange endLocation](p_lastTextContainerEntry->textRange, "endLocation"), "compare:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")) == -1)
  {
    [(NSTextLayoutManager *)self _addTextContainerForLocation:[(NSTextRange *)p_lastTextContainerEntry->textRange endLocation]];
  }
  if (textContainer) {
    unint64_t v6 = textContainerEntriesCount + 1;
  }
  else {
    unint64_t v6 = textContainerEntriesCount;
  }
  unint64_t v7 = self->_textContainerEntriesCount;
  if (self->_lastTextContainerEntry.textContainer) {
    ++v7;
  }
  return v7 > v6;
}

uint64_t __52__NSTextLayoutManager_textContainerChangedGeometry___block_invoke(uint64_t a1, void *a2)
{
  [a2 _resetLayoutFragmentFrame];
  uint64_t result = [a2 hasPartialLayout];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "textElement"), "elementRange");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

void __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_3(uint64_t a1, void *a2, __n128 a3, double a4, __n128 a5, double a6)
{
  double width = a5.n128_f64[0];
  double x = a3.n128_f64[0];
  if (!*(unsigned char *)(a1 + 216)) {
    double x = a3.n128_f64[0] + *(double *)(a1 + 88);
  }
  double y = a4 + *(double *)(a1 + 96);
  if (*(unsigned char *)(a1 + 217))
  {
    [*(id *)(a1 + 32) glyphOrigin];
    double height = 2.0;
    double y = y + v12 + 2.0;
  }
  else
  {
    double v13 = *(double *)(a1 + 104);
    BOOL v14 = v13 > 0.0 && v13 < y;
    double v15 = a6 + y - v13;
    if (v14) {
      double y = *(double *)(a1 + 104);
    }
    if (v14) {
      double height = v15;
    }
    else {
      double height = a6;
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (*(void *)(a1 + 112) == 1) {
      uint64_t v16 = [a2 endLocation];
    }
    else {
      uint64_t v16 = [a2 location];
    }
    if (*(unsigned char *)(a1 + 218)
      || x - (*(double *)(a1 + 120) + *(double *)(a1 + 136)) >= 0.001
      || !objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "endLocation"), "isEqual:", v16))
    {
      if (*(unsigned char *)(a1 + 220) || CGRectGetWidth(*(CGRect *)(a1 + 120)) > 0.0)
      {
        if (*(unsigned char *)(a1 + 219)) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (*(uint64_t (**)(void, uint64_t, void, uint64_t, double, double, double, double, double))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v18, *(void *)(a1 + 40), 2, *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 160)) ^ 1;
      }
      uint64_t v17 = 1;
    }
    else
    {
      v22.origin.double x = x;
      v22.origin.double y = y;
      v22.size.double width = width;
      v22.size.double height = height;
      NSRect v23 = NSUnionRect(v22, *(NSRect *)(a1 + 120));
      double x = v23.origin.x;
      double y = v23.origin.y;
      double width = v23.size.width;
      double height = v23.size.height;
      if (!*(unsigned char *)(a1 + 219)) {
        a2 = (void *)[a2 textRangeByFormingUnionWithTextRange:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      }
      uint64_t v17 = 3;
    }

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }
  if (!*(unsigned char *)(a1 + 218))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) && *(double *)(a1 + 168) - (x + width) < 0.001)
    {
      uint64_t v19 = *(void *)(a1 + 112) == 1 ? [a2 location] : objc_msgSend(a2, "endLocation");
      if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "location"), "isEqual:", v19))
      {
        v24.origin.double x = x;
        v24.origin.double y = y;
        v24.size.double width = width;
        v24.size.double height = height;
        NSRect v25 = NSUnionRect(v24, *(NSRect *)(a1 + 168));
        double x = v25.origin.x;
        double y = v25.origin.y;
        double width = v25.size.width;
        double height = v25.size.height;
        if (!*(unsigned char *)(a1 + 219)) {
          a2 = (void *)[a2 textRangeByFormingUnionWithTextRange:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
        }
        v17 |= 4uLL;

        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = 0;
      }
    }
    if (!*(unsigned char *)(a1 + 218))
    {
      if (*(unsigned char *)(a1 + 221))
      {
        if (*(unsigned char *)(a1 + 222))
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "textSelectionNavigation"), "_caretOffsetForTextLocation:affinity:", objc_msgSend(a2, "location"), *(unsigned char *)(a1 + 223) == 0);
          if (a3.n128_f64[0] >= 0.0) {
            double x = a3.n128_f64[0];
          }
        }
      }
      if (!*(unsigned char *)(a1 + 222)) {
        goto LABEL_54;
      }
      a3.n128_u64[0] = *(void *)(a1 + 200);
      double v20 = *(double *)(a1 + 208);
      if (a3.n128_f64[0] >= v20) {
        goto LABEL_54;
      }
      if (width + x > v20) {
        double width = v20 - x;
      }
      if (x < a3.n128_f64[0]) {
        double width = width - (a3.n128_f64[0] - x);
      }
      else {
LABEL_54:
      }
        a3.n128_f64[0] = x;
      if (width >= 0.0) {
        a5.n128_f64[0] = width;
      }
      else {
        a5.n128_f64[0] = 0.0;
      }
      if (*(unsigned char *)(a1 + 219)) {
        double v21 = 0;
      }
      else {
        double v21 = a2;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (*(uint64_t (**)(void, void *, void, uint64_t, __n128, double, __n128, double, double))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v21, *(void *)(a1 + 40), v17, a3, y, a5, height, *(double *)(a1 + 160)) ^ 1;
    }
  }
}

- (NSTextSelectionNavigation)textSelectionNavigation
{
  objc_sync_enter(self);
  textSelectionNavigation = self->_textSelectionNavigation;
  if (!textSelectionNavigation)
  {
    textSelectionNavigation = [[NSTextSelectionNavigation alloc] initWithDataSource:self];
    self->_textSelectionNavigation = textSelectionNavigation;
  }
  objc_sync_exit(self);
  return textSelectionNavigation;
}

- (void)enumerateSubstringsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  unint64_t v8 = (a4 >> 8) & 1;
  uint64_t v9 = a4;
  v17[0] = 0;
  v17[1] = v17;
  if ((_BYTE)a4)
  {
    uint64_t v18 = 0x2020000000;
    LOBYTE(v19) = 1;
    id v10 = [(NSTextLayoutManager *)self textContentManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_4;
    v11[3] = &unk_1E55C6320;
    v11[6] = v17;
    v11[7] = v9;
    char v12 = v8;
    v11[8] = a4;
    v11[4] = a3;
    v11[5] = a5;
    [(NSTextContentManager *)v10 enumerateTextElementsFromLocation:a3 options:v8 usingBlock:v11];
  }
  else
  {
    uint64_t v18 = 0x3052000000;
    uint64_t v19 = __Block_byref_object_copy__2;
    double v20 = __Block_byref_object_dispose__2;
    id v21 = a3;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke;
    v13[3] = &unk_1E55C62D0;
    char v14 = BYTE1(a4) & 1;
    v13[4] = a5;
    v13[5] = v17;
    void v13[6] = v15;
    v13[7] = a4;
    [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:a3 options:v8 | 4 usingBlock:v13];
    _Block_object_dispose(v15, 8);
  }
  _Block_object_dispose(v17, 8);
}

- (NSTextLayoutManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSTextLayoutManager;
  double v2 = [(NSTextLayoutManager *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(NSTextLayoutManager *)v2 _commonInit];
    v3->_usesHyphenation = [(id)objc_opt_class() usesHyphenation];
    v3->_rendersBackgroundColorAttribute = 1;
  }
  return v3;
}

- (void)_commonInit
{
  self->_int64_t applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
  self->_usesFontLeading = 1;
}

+ (BOOL)usesHyphenation
{
  if (usesHyphenation_onceToken != -1) {
    dispatch_once(&usesHyphenation_onceToken, &__block_literal_global_81);
  }
  return usesHyphenation_hyphenationEnabled;
}

- (id)_selectionAndMarkedTextAttributesForLocation:(id)a3 inTextRange:(id)a4 effectiveTextRange:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = -[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:");
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  id v10 = [(NSTextLayoutManager *)self textSelections];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v44 objects:&v48 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(a3, "compare:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "textRanges"), "firstObject"), "location")) != -1)
        {
          char v16 = (NSTextRange *)[v15 textRangeContainingLocation:a3];
          goto LABEL_12;
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v44 objects:&v48 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  char v16 = 0;
LABEL_12:
  uint64_t v17 = [(NSTextLayoutManager *)self textContentManager];
  int64_t v18 = [(NSTextLayoutManager *)self offsetFromLocation:[(NSTextRange *)[(NSTextContentManager *)v17 documentRange] location] toLocation:a3];
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v19 = [v9 markedTextAttributesAtCharacterIndex:v18 effectiveRange:&v48];
  if (v49)
  {
    uint64_t v20 = v19;
    uint64_t v42 = v16;
    id v21 = a5;
    NSRect v22 = [(NSTextLayoutManager *)self textContentManager];
    uint64_t v23 = [(NSTextRange *)[(NSTextContentManager *)v17 documentRange] location];
    uint64_t v25 = v48;
    uint64_t v24 = v49;
    uint64_t v26 = [(NSTextContentManager *)v22 locationFromLocation:v23 withOffset:v48];
    if (v24) {
      uint64_t v27 = [(NSTextContentManager *)v22 locationFromLocation:v23 withOffset:v24 + v25];
    }
    else {
      uint64_t v27 = 0;
    }
    double v30 = [[NSTextRange alloc] initWithLocation:v26 endLocation:v27];
    double v28 = [(NSTextRange *)v30 textRangeByIntersectingWithTextRange:a4];

    a5 = v21;
    if (v28)
    {
      char v29 = 0;
      char v16 = v42;
      if (![(NSTextRange *)v28 isEmpty]) {
        goto LABEL_22;
      }
    }
    else
    {
      char v29 = 1;
      char v16 = v42;
    }
  }
  else
  {
    double v28 = 0;
    char v29 = 1;
  }
  uint64_t v20 = 0;
LABEL_22:
  uint64_t v31 = 0;
  if (v20 || !v16) {
    goto LABEL_37;
  }
  unint64_t v32 = [(NSTextRange *)v16 textRangeByIntersectingWithTextRange:a4];
  char v16 = v32;
  if (v32 && ![(NSTextRange *)v32 isEmpty])
  {
    uint64_t v31 = [v9 selectedTextAttributes];
    if ([(id)v31 count])
    {
      if (![(id)v31 objectForKeyedSubscript:@"NSBackgroundColor"])
      {
LABEL_32:
        id v33 = 0;
LABEL_33:
        uint64_t v34 = [(id)v31 objectForKeyedSubscript:@"NSColor"];
        if (v34)
        {
          uint64_t v35 = v34;
          if (!v33) {
            id v33 = (id)[(id)v31 mutableCopy];
          }
          [v33 setObject:v35 forKeyedSubscript:0x1EDD4E410];
          [v33 removeObjectForKey:@"NSColor"];
          uint64_t v31 = (uint64_t)v33;
        }
        goto LABEL_37;
      }
      if ((unint64_t)[(id)v31 count] >= 2)
      {
        uint64_t v31 = (uint64_t)(id)[(id)v31 mutableCopy];
        objc_msgSend((id)v31, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"NSBackgroundColor");
        id v33 = (id)v31;
        goto LABEL_33;
      }
    }
    uint64_t v31 = 0;
    goto LABEL_32;
  }
  uint64_t v31 = 0;
LABEL_37:
  if (v20 | v31)
  {
    if (v20 && v31)
    {
      id v36 = (id)[(id)v31 mutableCopy];
      [v36 addEntriesFromDictionary:v20];
      uint64_t v37 = [(NSTextRange *)v16 textRangeByIntersectingWithTextRange:v16];
    }
    else
    {
      if (v31) {
        uint64_t v37 = v16;
      }
      else {
        uint64_t v37 = v28;
      }
      if (v31) {
        id v36 = (id)v31;
      }
      else {
        id v36 = (id)v20;
      }
    }
    goto LABEL_60;
  }
  id v38 = (id)[a4 endLocation];
  if ((v29 & 1) == 0
    && ![(NSTextRange *)v28 isEmpty]
    && objc_msgSend(a3, "compare:", -[NSTextRange location](v28, "location")) == -1
    && objc_msgSend(-[NSTextRange location](v28, "location"), "compare:", v38) == -1)
  {
    id v38 = [(NSTextRange *)v28 location];
  }
  uint64_t v39 = objc_msgSend((id)objc_msgSend(-[NSArray firstObject](-[NSTextLayoutManager textSelections](self, "textSelections"), "firstObject"), "textRanges"), "firstObject");
  if (v39)
  {
    id v40 = v39;
    if (([v39 isEmpty] & 1) == 0
      && objc_msgSend(a3, "compare:", objc_msgSend(v40, "location")) == -1
      && objc_msgSend((id)objc_msgSend(v40, "location"), "compare:", v38) == -1)
    {
      id v38 = (id)[v40 location];
    }
  }
  if ((objc_msgSend(v38, "isEqual:", objc_msgSend(a4, "endLocation")) & 1) == 0)
  {
    uint64_t v37 = [[NSTextRange alloc] initWithLocation:a3 endLocation:v38];
    id v36 = 0;
LABEL_60:
    *a5 = v37;
    return v36;
  }
  return 0;
}

- (NSArray)textSelections
{
  objc_sync_enter(self);
  uint64_t v3 = self->_textSelections;
  objc_sync_exit(self);
  return v3;
}

- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4
{
  unint64_t v6 = [(NSTextLayoutManager *)self textContentManager];

  return [(NSTextContentManager *)v6 offsetFromLocation:a3 toLocation:a4];
}

- (void)updateLayoutWithTextLayoutFragment:(id)a3 addition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = objc_sync_enter(self);
  id v8 = (void *)MEMORY[0x192FAE510](v7);
  uint64_t v9 = (NSTextRange *)[a3 rangeInElement];
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, [(NSTextRange *)v9 location]);
  uint64_t v11 = ($12329A12E88B98FC1E4249E14A3806EA *)TextContainerEntryAndIndexForLocation;
  if (!TextContainerEntryAndIndexForLocation) {
    goto LABEL_88;
  }
  CGFloat v12 = *((double *)TextContainerEntryAndIndexForLocation + 3);
  double v13 = *((double *)TextContainerEntryAndIndexForLocation + 4);
  p_lastTextContainerEntrdouble y = &self->_lastTextContainerEntry;
  CGFloat v15 = *((double *)TextContainerEntryAndIndexForLocation + 5);
  double v16 = *((double *)TextContainerEntryAndIndexForLocation + 6);
  if (v4)
  {
    if ((unint64_t)[a3 state] <= 2)
    {
      v11->BOOL containerFilled = 1;
      goto LABEL_88;
    }
    [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage revalidateLayoutFragmentRangeForLocation:[(NSTextRange *)v9 location]];
  }
  else
  {
    if (TextContainerEntryAndIndexForLocation == (char *)p_lastTextContainerEntry
      && ([*((id *)TextContainerEntryAndIndexForLocation + 2) containsRange:v9] & 1) == 0)
    {
      goto LABEL_88;
    }
    v11->BOOL containerFilled = 0;
  }
  textRange = v11->textRange;
  if (textRange && ![(NSTextRange *)textRange isEmpty])
  {
    if (v4)
    {
      uint64_t v19 = [(NSTextRange *)v11->textRange textRangeByFormingUnionWithTextRange:v9];
      int v18 = 0;
    }
    else if (objc_msgSend(-[NSTextRange location](v9, "location"), "compare:", -[NSTextRange location](v11->textRange, "location")) == 1&& objc_msgSend(-[NSTextRange endLocation](v9, "endLocation"), "compare:", -[NSTextRange endLocation](v11->textRange, "endLocation")) == -1)
    {
      int v18 = 0;
      uint64_t v19 = v11->textRange;
    }
    else
    {
      if ([(NSTextRange *)v9 containsRange:v11->textRange])
      {
        uint64_t v19 = 0;
      }
      else
      {
        if (objc_msgSend(-[NSTextRange location](v11->textRange, "location"), "compare:", -[NSTextRange location](v9, "location")) == -1)
        {
          uint64_t v37 = [NSTextRange alloc];
          uint64_t v38 = [(NSTextRange *)v11->textRange location];
          uint64_t v39 = [(NSTextRange *)v9 location];
        }
        else
        {
          uint64_t v37 = [NSTextRange alloc];
          uint64_t v38 = [(NSTextRange *)v9 endLocation];
          uint64_t v39 = [(NSTextRange *)v11->textRange endLocation];
        }
        uint64_t v19 = [(NSTextRange *)v37 initWithLocation:v38 endLocation:v39];
      }
      int v18 = 1;
    }
  }
  else
  {
    int v18 = 0;
    if (v4) {
      uint64_t v19 = v9;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  uint64_t v20 = v11->textRange;
  if (v19 != v20)
  {

    v11->textRange = v19;
  }
  if (!v4)
  {
    if (v18)
    {
      v54.origin.double x = v12;
      v54.origin.double y = v13;
      v54.size.double width = v15;
      v54.size.double height = v16;
      if (!NSIsEmptyRect(v54))
      {
        [a3 layoutFragmentFrame];
        double v25 = v24;
        double v27 = v26;
        if (self->_softInvalidationLocation
          && objc_msgSend(-[NSTextRange location](v9, "location"), "compare:", self->_softInvalidationLocation) == -1)
        {
          __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, [(NSTextRange *)v9 endLocation], 1.79769313e308);
        }
        double v28 = v13 + v16;
        double v29 = v13 + v16 - (v25 + v27);
        if (v13 >= v25) {
          double v13 = v25 + v27;
        }
        else {
          double v29 = v16;
        }
        if (v28 > v25 + v27 || v29 <= 0.0) {
          double v16 = v29;
        }
        else {
          double v16 = v25 - v13;
        }
        if (v16 <= 0.0)
        {
          CGFloat v12 = *MEMORY[0x1E4F28AD8];
          double v13 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
          CGFloat v15 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
          double v16 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
        }
      }
    }
    goto LABEL_79;
  }
  activeEnumerationCache = self->_activeEnumerationCache;
  if (!activeEnumerationCache || !activeEnumerationCache->var6)
  {
    if (self->_softInvalidationLocation)
    {
      if (objc_msgSend(-[NSTextRange location](v9, "location"), "compare:", self->_softInvalidationLocation) == -1) {
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v48 = 0;
      uint64_t v49 = &v48;
      uint64_t v50 = 0x3052000000;
      double v51 = __Block_byref_object_copy__2;
      char v52 = __Block_byref_object_dispose__2;
      uint64_t v53 = 0;
      uint64_t v31 = [(NSTextRange *)v11->textRange endLocation];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __67__NSTextLayoutManager_updateLayoutWithTextLayoutFragment_addition___block_invoke;
      v47[3] = &unk_1E55C5C80;
      v47[4] = &v48;
      [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:v31 options:3 usingBlock:v47];
      if (v49[5])
      {
        id v32 = [(NSTextRange *)v9 location];
        uint64_t v33 = objc_msgSend(v32, "compare:", objc_msgSend((id)objc_msgSend((id)v49[5], "rangeInElement"), "location"));
        _Block_object_dispose(&v48, 8);
        if (v33 != 1)
        {
LABEL_48:
          [(NSTextLayoutManager *)self _setSoftInvalidationLocation:[(NSTextRange *)v9 location] onlyIfUpstream:0];
          goto LABEL_68;
        }
      }
      else
      {
        _Block_object_dispose(&v48, 8);
      }
    }
    if ([(NSTextLocation *)self->_softInvalidationLocation compare:[(NSTextRange *)v9 location]] != 1)__NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, [(NSTextRange *)v9 endLocation], 1.79769313e308); {
    goto LABEL_68;
    }
  }
  BOOL var7 = activeEnumerationCache->var7;
  if (activeEnumerationCache->var7) {
    uint64_t v23 = [(NSTextRange *)v9 endLocation];
  }
  else {
    uint64_t v23 = [(NSTextRange *)v9 location];
  }
  uint64_t v34 = v23;
  id var1 = self->_activeEnumerationCache->var1;
  if (var1 && [var1 isEqual:v34])
  {
    [a3 layoutFragmentFrame];
    objc_msgSend(a3, "setLayoutFragmentFrameOrigin:");
    if (var7) {
      uint64_t v36 = [(NSTextRange *)v9 location];
    }
    else {
      uint64_t v36 = [(NSTextRange *)v9 endLocation];
    }
    [(NSTextLayoutManager *)self _setSoftInvalidationLocation:v36 onlyIfUpstream:[(NSTextLocation *)self->_softInvalidationLocation compare:v34] == -1];
  }
  else if (objc_msgSend(-[NSTextRange location](v9, "location"), "isEqual:", -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "location")))
  {
    [(NSTextLayoutManager *)self _setSoftInvalidationLocation:[(NSTextRange *)v9 endLocation] onlyIfUpstream:1];
  }
  else
  {
    [(NSTextLayoutManager *)self _setSoftInvalidationLocation:[(NSTextRange *)v9 location] onlyIfUpstream:1];
    __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, [(NSTextRange *)v9 endLocation], 1.79769313e308);
  }
LABEL_68:
  v55.origin.double x = v12;
  v55.origin.double y = v13;
  v55.size.double width = v15;
  v55.size.double height = v16;
  if (CGRectIsEmpty(v55))
  {
    [a3 layoutFragmentFrame];
  }
  else
  {
    [a3 layoutFragmentFrame];
    v57.origin.double x = v12;
    v57.origin.double y = v13;
    v57.size.double width = v15;
    v57.size.double height = v16;
    *(CGRect *)&CGFloat v40 = CGRectUnion(v56, v57);
  }
  CGFloat v12 = v40;
  CGFloat v15 = v42;
  if (v41 == 0.0) {
    double v44 = -0.0;
  }
  else {
    double v44 = v41;
  }
  if (v41 == 0.0) {
    double v13 = v41;
  }
  else {
    double v13 = 0.0;
  }
  double v16 = v43 + v44;
  if ([a3 hasPartialLayout]) {
    v11->BOOL containerFilled = 1;
  }
LABEL_79:
  double v45 = -0.0;
  if (v13 < 0.0) {
    double v45 = v13;
  }
  double v46 = v16 + v45;
  if (v13 < 0.0) {
    double v13 = 0.0;
  }
  v58.origin.double x = v12;
  v58.origin.double y = v13;
  v58.size.double width = v15;
  v58.size.double height = v46;
  if (!NSEqualRects(v11->usageBounds, v58))
  {
    if (v11 == p_lastTextContainerEntry)
    {
      [(NSTextLayoutManager *)self willChangeValueForKey:@"usageBoundsForTextContainer"];
      [(NSTextLayoutManager *)self willChangeValueForKey:@"usageBoundsForLastTextContainer"];
      v11->usageBounds.origin.double x = v12;
      v11->usageBounds.origin.double y = v13;
      v11->usageBounds.size.double width = v15;
      v11->usageBounds.size.double height = v46;
      [(NSTextLayoutManager *)self didChangeValueForKey:@"usageBoundsForTextContainer"];
      [(NSTextLayoutManager *)self didChangeValueForKey:@"usageBoundsForLastTextContainer"];
    }
    else
    {
      v11->usageBounds.origin.double x = v12;
      v11->usageBounds.origin.double y = v13;
      v11->usageBounds.size.double width = v15;
      v11->usageBounds.size.double height = v46;
    }
    [(NSTextContainer *)v11->textContainer invalidateTextContainerOrigin];
  }
LABEL_88:
  objc_sync_exit(self);
}

- (BOOL)_setSoftInvalidationLocation:(id)a3 onlyIfUpstream:(BOOL)a4
{
  if (a3 && a4 && self->_softInvalidationLocation && objc_msgSend(a3, "compare:") != -1)
  {
    BOOL v6 = 0;
    softInvalidationLocation = self->_softInvalidationLocation;
  }
  else
  {

    softInvalidationLocation = (NSTextLocation *)a3;
    self->_softInvalidationLocation = softInvalidationLocation;
    BOOL v6 = 1;
  }
  if ([(NSTextLocation *)softInvalidationLocation isEqual:[(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange] endLocation]])
  {

    self->_softInvalidationLocation = 0;
  }
  return v6;
}

- (void)enumerateTemporaryAttributesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  objc_sync_enter(self);
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__2;
  id v21 = __Block_byref_object_dispose__2;
  uint64_t v22 = 0;
  self->_isProcessingRenderingAttributesMethod = 1;
  uint64_t v9 = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange];
  id v10 = [NSTextRange alloc];
  if (v6)
  {
    id v11 = [(NSTextRange *)v9 location];
    id v12 = a3;
  }
  else
  {
    id v12 = [(NSTextRange *)v9 endLocation];
    id v11 = a3;
  }
  uint64_t v13 = [(NSTextRange *)v10 initWithLocation:v11 endLocation:v12];
  v18[5] = v13;
  temporaryAttributesTable = self->_temporaryAttributesTable;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__NSTextLayoutManager_enumerateTemporaryAttributesFromLocation_reverse_usingBlock___block_invoke;
  v16[3] = &unk_1E55C6168;
  v16[5] = a5;
  v16[6] = &v17;
  v16[4] = self;
  [(_NSTextAttributeStorage *)temporaryAttributesTable enumerateAttributesFromLocation:a3 reverse:v6 usingBlock:v16];
  CGFloat v15 = (void *)v18[5];
  if (v15) {

  }
  self->_isProcessingRenderingAttributesMethod = 0;
  _Block_object_dispose(&v17, 8);
  objc_sync_exit(self);
}

- (BOOL)rendersBackgroundColorAttribute
{
  return self->_rendersBackgroundColorAttribute;
}

- (BOOL)requiresCTLineRef
{
  return self->_requiresCTLineRef;
}

- (void)_configureCoreTypesetter:(id)a3 forTextParagraph:(id)a4 textContainer:(id)a5
{
  objc_msgSend(a3, "setApplicationFrameworkContext:", -[NSTextLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext"));
  objc_msgSend(a3, "setUsesFontLeading:", -[NSTextLayoutManager usesFontLeading](self, "usesFontLeading"));
  objc_msgSend(a3, "setUsesDefaultHyphenation:", -[NSTextLayoutManager usesHyphenation](self, "usesHyphenation"));
  objc_msgSend(a3, "setAllowsFontSubstitutionAffectingVerticalMetrics:", -[NSTextLayoutManager allowsFontSubstitutionAffectingVerticalMetrics](self, "allowsFontSubstitutionAffectingVerticalMetrics"));
  objc_msgSend(a3, "setLimitsLayoutForSuspiciousContents:", -[NSTextLayoutManager limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents"));
  objc_msgSend(a3, "set_extraLineFragmentAttributes:", objc_msgSend(a4, "attributes"));
  objc_msgSend(a3, "setDefaultParagraphStyle:", objc_msgSend(a5, "defaultParagraphStyle"));
  if (a4) {
    uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "elementRange"), "location"), "isEqual:", -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "location"));
  }
  else {
    uint64_t v9 = 1;
  }
  [a3 setBeginningOfDocument:v9];
  BOOL v10 = [(NSTextLayoutManager *)self breaksLinesForInteractiveText];

  [a3 setBreaksLinesForInteractiveText:v10];
}

- (BOOL)usesFontLeading
{
  objc_sync_enter(self);
  BOOL usesFontLeading = self->_usesFontLeading;
  objc_sync_exit(self);
  return usesFontLeading;
}

- (BOOL)allowsFontSubstitutionAffectingVerticalMetrics
{
  objc_sync_enter(self);
  BOOL allowsFontSubstitutionAffectingVerticalMetrics = self->_allowsFontSubstitutionAffectingVerticalMetrics;
  objc_sync_exit(self);
  return allowsFontSubstitutionAffectingVerticalMetrics;
}

- (BOOL)usesHyphenation
{
  objc_sync_enter(self);
  BOOL usesHyphenation = self->_usesHyphenation;
  objc_sync_exit(self);
  return usesHyphenation;
}

- (BOOL)limitsLayoutForSuspiciousContents
{
  objc_sync_enter(self);
  BOOL limitsLayoutForSuspiciousContents = self->_limitsLayoutForSuspiciousContents;
  objc_sync_exit(self);
  return limitsLayoutForSuspiciousContents;
}

- (BOOL)breaksLinesForInteractiveText
{
  return self->_breaksLinesForInteractiveText;
}

- (int64_t)_numberOfLinesToCurrentlyEnumeratedTextLayoutFragment
{
  activeEnumerationCache = self->_activeEnumerationCache;
  if (activeEnumerationCache && activeEnumerationCache->var0) {
    return activeEnumerationCache->var3;
  }
  else {
    return 0;
  }
}

- (id)_currentTextLayoutFragmentEnumerated
{
  activeEnumerationCache = self->_activeEnumerationCache;
  if (activeEnumerationCache) {
    return activeEnumerationCache->var0;
  }
  else {
    return 0;
  }
}

- (id)_viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5 textContainer:(id)a6
{
  id v11 = [(NSTextLayoutManager *)self viewProviderForTextAttachment:a3 location:a5];
  if (!v11)
  {
    id v11 = (id)[a3 viewProviderForParentView:a4 location:a5 textContainer:a6];
    if (v11) {
      [(NSTextLayoutManager *)self setViewProvider:v11 forTextAttachment:a3 location:a5];
    }
  }
  return v11;
}

- (id)viewProviderForTextAttachment:(id)a3 location:(id)a4
{
  objc_super v5 = [(NSTextLayoutManager *)self textLayoutFragmentForLocation:a4];

  return [(NSTextLayoutFragment *)v5 textAttachmentViewProviderForLocation:a4];
}

- (NSTextLayoutFragment)textLayoutFragmentForLocation:(id)location
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  BOOL v10 = __Block_byref_object_dispose__2;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__NSTextLayoutManager_textLayoutFragmentForLocation___block_invoke;
  v5[3] = &unk_1E55C5E58;
  v5[4] = location;
  v5[5] = &v6;
  [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:location options:0 usingBlock:v5];
  uint64_t v3 = (NSTextLayoutFragment *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setViewProvider:(id)a3 forTextAttachment:(id)a4 location:(id)a5
{
  uint64_t v7 = -[NSTextLayoutManager textLayoutFragmentForLocation:](self, "textLayoutFragmentForLocation:", a5, a4);

  [(NSTextLayoutFragment *)v7 setTextAttachmentProvider:a3 forLocation:a5];
}

- (void)setBreaksLinesForInteractiveText:(BOOL)a3
{
  self->_breaksLinesForInteractiveText = a3;
}

- (CGRect)usageBoundsInTextContainerAtIndex:(int64_t)a3
{
  objc_sync_enter(self);
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x4010000000;
  double v29 = "";
  objc_super v5 = &origin;
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v31 = v6;
  uint64_t v7 = (double *)&v31;
  p_double height = &v31.height;
  p_double y = &origin.y;
  if (self->_textContainerEntriesCount <= a3)
  {
    p_lastTextContainerEntrdouble y = &self->_lastTextContainerEntry;
    if (!self->_lastTextContainerEntry.textContainer) {
      goto LABEL_13;
    }
  }
  else
  {
    textContainerEntries = self->_textContainerEntries;
    if (!textContainerEntries) {
      goto LABEL_13;
    }
    p_lastTextContainerEntrdouble y = ($12329A12E88B98FC1E4249E14A3806EA *)&textContainerEntries[a3];
  }
  CGSize size = p_lastTextContainerEntry->usageBounds.size;
  CGPoint origin = p_lastTextContainerEntry->usageBounds.origin;
  CGSize v31 = size;
  v33.CGPoint origin = origin;
  v33.CGSize size = size;
  BOOL v13 = CGRectEqualToRect(v33, *MEMORY[0x1E4F1DB28]);
  if (p_lastTextContainerEntry == &self->_lastTextContainerEntry && v13)
  {
    startLocation = self->_lastTextContainerEntry.startLocation;
    if (!startLocation) {
      startLocation = (NSTextLocation *)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_textContentManager), "documentRange"), "location");
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__NSTextLayoutManager_usageBoundsInTextContainerAtIndex___block_invoke;
    v25[3] = &unk_1E55C5C80;
    v25[4] = &v26;
    [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:startLocation options:2 usingBlock:v25];
    objc_super v5 = (CGPoint *)(v27 + 4);
    p_double y = (double *)(v27 + 5);
    uint64_t v7 = (double *)(v27 + 6);
    p_double height = (double *)(v27 + 7);
    CGSize v16 = (CGSize)*((_OWORD *)v27 + 3);
    p_lastTextContainerEntry->usageBounds.CGPoint origin = (CGPoint)*((_OWORD *)v27 + 2);
    p_lastTextContainerEntry->usageBounds.CGSize size = v16;
  }
  else
  {
    objc_super v5 = (CGPoint *)(v27 + 4);
    p_double y = (double *)(v27 + 5);
    uint64_t v7 = (double *)(v27 + 6);
    p_double height = (double *)(v27 + 7);
  }
LABEL_13:
  CGFloat x = v5->x;
  double v18 = *p_y;
  double v19 = *v7;
  double v20 = *p_height;
  _Block_object_dispose(&v26, 8);
  objc_sync_exit(self);
  double v21 = x;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (int64_t)baseWritingDirectionAtLocation:(id)a3
{
  objc_super v5 = [(NSTextLayoutManager *)self textContentManager];
  CGSize v6 = [(NSTextContentManager *)v5 documentRange];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  double v19 = __Block_byref_object_copy__2;
  double v20 = __Block_byref_object_dispose__2;
  uint64_t v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__NSTextLayoutManager_baseWritingDirectionAtLocation___block_invoke;
  void v15[3] = &unk_1E55C6280;
  v15[4] = &v16;
  [(NSTextContentManager *)v5 enumerateTextElementsFromLocation:a3 options:0 usingBlock:v15];
  if (v17[5] || !objc_msgSend(-[NSTextRange endLocation](v6, "endLocation"), "isEqual:", a3)) {
    goto LABEL_11;
  }
  id v7 = [(NSArray *)[(NSTextLayoutManager *)self textSelections] firstObject];
  if (![(NSTextRange *)v6 isEmpty])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__NSTextLayoutManager_baseWritingDirectionAtLocation___block_invoke_2;
    v14[3] = &unk_1E55C6280;
    v14[4] = &v16;
    [(NSTextContentManager *)v5 enumerateTextElementsFromLocation:a3 options:1 usingBlock:v14];
  }
  if (v7
    && (uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "textRanges"), "firstObject"),
        [v8 isEmpty])
    && objc_msgSend((id)objc_msgSend(v8, "location"), "isEqual:", a3)
    && [v7 typingAttributes]
    && ((uint64_t v9 = (void *)v17[5]) == 0
     || (objc_msgSend((id)objc_msgSend(v9, "paragraphSeparatorRange"), "isEmpty") & 1) == 0))
  {
    BOOL v13 = (NSParagraphStyle *)objc_msgSend((id)objc_msgSend(v7, "typingAttributes"), "objectForKeyedSubscript:", @"NSParagraphStyle");
    if (!v13) {
      BOOL v13 = +[NSParagraphStyle defaultParagraphStyle];
    }
    NSWritingDirection v10 = [(NSParagraphStyle *)v13 baseWritingDirection];
    if (v10 == NSWritingDirectionNatural) {
      NSWritingDirection v10 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
    }
    v17[5] = 0;
  }
  else
  {
LABEL_11:
    NSWritingDirection v10 = NSWritingDirectionLeftToRight;
  }
  uint64_t v11 = (void *)v17[5];
  if (v11) {
    NSWritingDirection v10 = objc_msgSend(v11, "_resolvedBaseWritingDirectionWithFallbackDirection:", -[NSTextLayoutManager _fallbackWritingDirection](self, "_fallbackWritingDirection"));
  }
  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)setTextSelections:(NSArray *)textSelections
{
  objc_sync_enter(self);
  objc_super v5 = self->_textSelections;
  if (v5 != textSelections && ![(NSArray *)v5 isEqualToArray:textSelections])
  {
    if (!self->_delegateWithTextSelectionNotification
      || (CGSize v6 = (NSArray *)[objc_loadWeak((id *)&self->_delegate) textLayoutManager:self willChangeFromTextSelections:self->_textSelections toTextSelections:textSelections], !-[NSArray count](v6, "count"))|| (v7 = self->_textSelections, v7 != v6)&& (textSelections = v6, !-[NSArray isEqualToArray:](v7, "isEqualToArray:", v6)))
    {
      [(NSTextLayoutManager *)self willChangeValueForKey:@"textSelections"];

      self->_textSelections = (NSArray *)[(NSArray *)textSelections copy];
      textParagraphForEmptyDocument = self->_textParagraphForEmptyDocument;
      if (textParagraphForEmptyDocument
        && !-[NSDictionary isEqualToDictionary:](-[NSTextParagraph attributes](textParagraphForEmptyDocument, "attributes"), "isEqualToDictionary:", objc_msgSend(-[NSArray firstObject](self->_textSelections, "firstObject"), "typingAttributes")))
      {
        [(NSTextLayoutManager *)self _invalidateTextParagraphForEmptyDocument];
      }
      uint64_t v9 = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange];
      NSWritingDirection v10 = v9;
      if (v9)
      {
        if (![(NSTextRange *)v9 isEmpty])
        {
          uint64_t v11 = objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->_textSelections, "firstObject"), "textRanges"), "firstObject");
          id v12 = v11;
          if (v11)
          {
            if ([v11 isEmpty])
            {
              if (objc_msgSend(-[NSTextRange endLocation](v10, "endLocation"), "isEqual:", objc_msgSend(v12, "location")))
              {
                BOOL v13 = [(NSTextLayoutManager *)self _extraTextLineFragment];
                if (v13)
                {
                  char v14 = objc_msgSend(-[NSArray firstObject](self->_textSelections, "firstObject"), "typingAttributes");
                  if ([v14 count])
                  {
                    if ((objc_msgSend(v14, "isEqualToDictionary:", -[NSTextLayoutFragment extraLineFragmentAttributes](-[NSTextLineFragment textLayoutFragment](v13, "textLayoutFragment"), "extraLineFragmentAttributes")) & 1) == 0)-[NSTextLayoutFragment invalidateExtraLineFragment](-[NSTextLineFragment textLayoutFragment](-[NSTextLayoutManager _extraTextLineFragment](self, "_extraTextLineFragment"), "textLayoutFragment"), "invalidateExtraLineFragment"); {
                  }
                    }
                }
              }
            }
          }
        }
      }
      [(NSTextLayoutManager *)self didChangeValueForKey:@"textSelections"];
    }
  }

  objc_sync_exit(self);
}

- (void)enumerateCaretOffsetsInLineFragmentAtLocation:(id)a3 usingBlock:(id)a4
{
  id v17 = 0;
  uint64_t v16 = 0;
  id v6 = [(NSTextLayoutManager *)self _textLineFragmentAtLocation:a3 textLayoutFragment:&v17 rangeDelta:&v16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (void *)[v17 textParagraph];
    if (v8)
    {
      uint64_t v9 = [v8 locationForCharacterIndex:v16 dataSourceLocationsOnly:0 actualRange:0];
    }
    else
    {
      NSWritingDirection v10 = [(NSTextLayoutManager *)self textContentManager];
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v17, "rangeInElement"), "location");
      uint64_t v9 = [(NSTextContentManager *)v10 locationFromLocation:v11 withOffset:v16];
    }
    uint64_t v12 = v9;
    BOOL v13 = +[NSTextLayoutFragment coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled];
    double MinX = 0.0;
    if (!v13)
    {
      objc_msgSend(v17, "layoutFragmentFrame", 0.0);
      double MinX = CGRectGetMinX(v18);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__NSTextLayoutManager_enumerateCaretOffsetsInLineFragmentAtLocation_usingBlock___block_invoke;
    void v15[3] = &unk_1E55C6348;
    v15[4] = a4;
    *(double *)&void v15[5] = MinX;
    [v7 enumerateCaretOffsetsWithTextSelectionDataSource:self baseLocation:v12 usingBlock:v15];
  }
}

uint64_t __80__NSTextLayoutManager_enumerateCaretOffsetsInLineFragmentAtLocation_usingBlock___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40) + a2);
}

- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4
{
  id v6 = [(NSTextLayoutManager *)self textContentManager];

  return [(NSTextContentManager *)v6 locationFromLocation:a3 withOffset:a4];
}

- (id)_textLineFragmentAtLocation:(id)a3 textLayoutFragment:(id *)a4 rangeDelta:(int64_t *)a5
{
  id v9 = [(NSTextLayoutManager *)self _textLayoutFragmentAtLocation:"_textLayoutFragmentAtLocation:"];
  NSWritingDirection v10 = v9;
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x3052000000;
  double v27 = __Block_byref_object_copy__2;
  uint64_t v28 = __Block_byref_object_dispose__2;
  uint64_t v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (v9)
  {
    uint64_t v11 = (void *)[v9 textParagraph];
    if (v11) {
      uint64_t v12 = [v11 rangeForLocation:a3 allowsTrailingEdge:1];
    }
    else {
      uint64_t v12 = -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "offsetFromLocation:toLocation:", objc_msgSend((id)objc_msgSend(v10, "rangeInElement"), "location"), a3);
    }
    uint64_t v13 = v12;
    char v14 = objc_msgSend(a3, "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation"));
    CGFloat v15 = (void *)[v10 textLineFragments];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__NSTextLayoutManager__textLineFragmentAtLocation_textLayoutFragment_rangeDelta___block_invoke;
    v18[3] = &unk_1E55C6208;
    char v19 = v14;
    v18[4] = &v20;
    v18[5] = &v24;
    v18[6] = v13;
    [v15 enumerateObjectsUsingBlock:v18];
  }
  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = v21[3];
  }
  uint64_t v16 = (void *)v25[5];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)_textLayoutFragmentAtLocation:(id)a3
{
  uint64_t v9 = 0;
  NSWritingDirection v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__2;
  uint64_t v13 = __Block_byref_object_dispose__2;
  uint64_t v14 = 0;
  if (objc_msgSend(-[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation"), "isEqual:", a3))uint64_t v5 = 5; {
  else
  }
    uint64_t v5 = 4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__NSTextLayoutManager__textLayoutFragmentAtLocation___block_invoke;
  v8[3] = &unk_1E55C5E30;
  v8[4] = &v9;
  [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:a3 options:v5 usingBlock:v8];
  id v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)processLayoutInvalidationForTextRange:(id)a3 synchronizing:(BOOL)a4
{
  [(NSTextLayoutManager *)self _invalidateLayoutForTextRange:a3 hard:1];
  uint64_t v5 = [(NSTextLayoutManager *)self textViewportLayoutController];

  [(NSTextViewportLayoutController *)v5 setNeedsLayout];
}

- (void)setLimitsLayoutForSuspiciousContents:(BOOL)limitsLayoutForSuspiciousContents
{
  BOOL v3 = limitsLayoutForSuspiciousContents;
  objc_sync_enter(self);
  if (self->_limitsLayoutForSuspiciousContents != v3)
  {
    self->_BOOL limitsLayoutForSuspiciousContents = v3;
    [(NSTextLayoutManager *)self invalidateLayoutForRange:[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange]];
  }

  objc_sync_exit(self);
}

- (void)setUsesFontLeading:(BOOL)usesFontLeading
{
  BOOL v3 = usesFontLeading;
  objc_sync_enter(self);
  if (self->_usesFontLeading != v3)
  {
    self->_BOOL usesFontLeading = v3;
    [(NSTextLayoutManager *)self invalidateLayoutForRange:[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange]];
  }

  objc_sync_exit(self);
}

- (void)invalidateLayoutForRange:(NSTextRange *)range
{
  if ([(NSTextRange *)range isNotEmpty])
  {
    [(NSTextLayoutManager *)self _invalidateLayoutForTextRange:range hard:0];
  }
}

- (void)setRequiresCTLineRef:(BOOL)a3
{
  self->_requiresCTLineRef = a3;
}

uint64_t __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 characterRange];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v4;
  return result;
}

- (void)_invalidateLayoutForTextRange:(id)a3 hard:(BOOL)a4
{
  BOOL v67 = a4;
  objc_sync_enter(self);
  id v6 = [(NSTextLayoutManager *)self textContentManager];
  id v7 = [(NSTextContentManager *)v6 documentRange];
  id v8 = [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage adjustedTextRangeWithTextRange:a3 adjustment:6];
  BOOL v9 = [(NSTextLayoutManager *)self hasNonSimpleRectangularTextContainer];
  if (v7) {
    BOOL v10 = v67;
  }
  else {
    BOOL v10 = 0;
  }
  BOOL v68 = v10;
  id v64 = a3;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = a3;
  }
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, (void *)[v11 location]);
  double v70 = v6;
  if (TextContainerEntryAndIndexForLocation)
  {
    unint64_t v13 = *((void *)TextContainerEntryAndIndexForLocation + 7);
    if (v9)
    {
      uint64_t v14 = [*((id *)TextContainerEntryAndIndexForLocation + 2) location];
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke;
      v91[3] = &unk_1E55C5D68;
      v91[4] = v14;
      [(NSTextLayoutManager *)self _removeTextContainersToCondition:v91];
    }
  }
  else
  {
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x2020000000;
  char v90 = 0;
  uint64_t v83 = 0;
  long long v84 = &v83;
  uint64_t v85 = 0x3052000000;
  v86 = __Block_byref_object_copy__2;
  uint64_t v87 = __Block_byref_object_dispose__2;
  uint64_t v88 = 0;
  uint64_t v15 = [v11 location];
  v80[0] = MEMORY[0x1E4F143A8];
  if (v67) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 2;
  }
  v80[1] = 3221225472;
  v80[2] = __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_2;
  v80[3] = &unk_1E55C5D90;
  BOOL v81 = v9;
  BOOL v82 = v67;
  v80[6] = v89;
  v80[7] = &v83;
  v80[4] = v11;
  v80[5] = self;
  [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:v15 options:v16 usingBlock:v80];
  uint64_t v17 = v84[5];
  if (v67)
  {
    if (!v17)
    {
      id v71 = (NSTextRange *)v11;
      goto LABEL_19;
    }
  }
  else if (!v17)
  {
    goto LABEL_90;
  }
  CGRect v18 = [NSTextRange alloc];
  uint64_t v19 = [v11 location];
  id v71 = [(NSTextRange *)v18 initWithLocation:v19 endLocation:v84[5]];
LABEL_19:
  int64_t v69 = [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage offsetDeltaForLastTextLayoutFragment];
  if (v84[5]) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = &__block_literal_global_145;
  }
  __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange((id *)&self->super.isa, v71, (uint64_t)v20);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_lastTextContainerEntrdouble y = ($CD956B2ACB38B728AB2E3DF9A3B345A0 *)__NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, (void *)[v11 location]);
    goto LABEL_26;
  }
  if (self->_textContainerEntriesCount > v13)
  {
    p_lastTextContainerEntrdouble y = &self->_textContainerEntries[v13];
LABEL_26:
    if (!p_lastTextContainerEntry) {
      goto LABEL_85;
    }
    goto LABEL_29;
  }
  p_lastTextContainerEntrdouble y = ($CD956B2ACB38B728AB2E3DF9A3B345A0 *)&self->_lastTextContainerEntry;
  if (!self->_lastTextContainerEntry.textContainer) {
    goto LABEL_85;
  }
LABEL_29:
  id var2 = p_lastTextContainerEntry->var2;
  if (!var2) {
    goto LABEL_85;
  }
  uint64_t v23 = objc_msgSend((id)objc_msgSend(var2, "location"), "compare:", -[NSTextRange endLocation](v71, "endLocation"));
  BOOL v24 = v23 != -1;
  if (objc_msgSend(p_lastTextContainerEntry->var2, "containsLocation:", -[NSTextRange endLocation](v71, "endLocation")))LOBYTE(v25) = 1; {
  else
  }
    LOBYTE(v25) = objc_msgSend((id)objc_msgSend(p_lastTextContainerEntry->var2, "endLocation"), "isEqual:", -[NSTextRange endLocation](v71, "endLocation"));
  BOOL v26 = v23 == 0;
  unint64_t var4 = p_lastTextContainerEntry->var4;
  unint64_t v28 = var4;
  uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
    textContainer = self->_lastTextContainerEntry.textContainer;
    unint64_t v31 = textContainer ? textContainerEntriesCount + 1 : self->_textContainerEntriesCount;
    if (var4 >= v31) {
      break;
    }
    if (textContainerEntriesCount <= var4)
    {
      if (textContainer) {
        id v32 = &self->_lastTextContainerEntry;
      }
      else {
        id v32 = 0;
      }
      if (v25)
      {
LABEL_46:
        int v25 = 1;
        goto LABEL_47;
      }
    }
    else
    {
      id v32 = ($12329A12E88B98FC1E4249E14A3806EA *)&self->_textContainerEntries[v28];
      if (v25) {
        goto LABEL_46;
      }
    }
    if ([(NSTextRange *)v32->textRange containsLocation:[(NSTextRange *)v71 endLocation]])
    {
      goto LABEL_46;
    }
    int v25 = objc_msgSend(-[NSTextRange endLocation](v32->textRange, "endLocation"), "isEqual:", -[NSTextRange endLocation](v71, "endLocation"));
    if (v26)
    {
      __NSTextLayoutManagerClearTextContainerEntry((uint64_t)v32);
      uint64_t v36 = v66;
      if (v66 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v36 = var4;
      }
      uint64_t v66 = v36;
      uint64_t v65 = var4;
    }
LABEL_47:
    textRange = v32->textRange;
    if (!v7)
    {

      v32->textRange = 0;
      v32->startLocation = 0;
      goto LABEL_75;
    }
    if (textRange)
    {
      if (v24)
      {
        id v34 = [(NSTextContentManager *)v70 locationFromLocation:[(NSTextRange *)v32->textRange location] withOffset:v69];
        if ((v25 & 1) == 0)
        {
          uint64_t v35 = [(NSTextRange *)textRange endLocation];
          goto LABEL_60;
        }
LABEL_58:
        uint64_t v35 = [(NSTextContentManager *)v70 locationFromLocation:[(NSTextRange *)textRange endLocation] withOffset:v69];
      }
      else
      {
        id v34 = [(NSTextRange *)v32->textRange location];
        if (v25) {
          goto LABEL_58;
        }
        uint64_t v35 = [(NSTextRange *)v71 location];
      }
LABEL_60:
      uint64_t v37 = v35;
      if (v34)
      {
        if (!v35) {
LABEL_64:
        }
          uint64_t v37 = [(NSTextRange *)v7 endLocation];
      }
      else
      {
        id v34 = [(NSTextRange *)v7 location];
        if (!v37) {
          goto LABEL_64;
        }
      }
      if ([v34 compare:v37] == -1) {
        uint64_t v38 = [[NSTextRange alloc] initWithLocation:v34 endLocation:v37];
      }
      else {
        uint64_t v38 = 0;
      }

      v32->textRange = v38;
      if (v24)
      {
        startLocation = v32->startLocation;
        if (startLocation)
        {
          CGFloat v40 = (NSTextLocation *)[(NSTextContentManager *)v70 locationFromLocation:startLocation withOffset:v69];

          v32->startLocation = v40;
        }
      }
      if (v68)
      {
        id v41 = [(NSTextContainer *)v32->textContainer textViewportLayoutController];
        double v42 = (void *)[v11 location];
        double v43 = (void *)[v41 viewportRange];
        if (v43)
        {
          if (objc_msgSend(v42, "compare:", objc_msgSend(v43, "location")) == -1) {
            [v41 _resetLayout];
          }
        }
      }
    }
LABEL_75:
    v32->BOOL containerFilled = 0;
    double v44 = (objc_class *)objc_opt_class();
    double v45 = NSStringFromClass(v44);
    if (v32->textRange && !-[NSTextRange containsRange:](v7, "containsRange:"))
    {
      int v46 = 0;
    }
    else if (v32->startLocation)
    {
      int v46 = -[NSTextRange containsLocation:](v7, "containsLocation:");
    }
    else
    {
      int v46 = 1;
    }
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_4;
    v79[3] = &unk_1E55C5DB8;
    v79[4] = v7;
    v79[5] = v32;
    ++v28;
    ++var4;
    BOOL v24 = 1;
    _UIFoundationAssert(self, v45, v46, v79);
    BOOL v26 = 1;
  }
  if (v66 != 0x7FFFFFFFFFFFFFFFLL)
  {
    size_t v47 = 72 * (textContainerEntriesCount - (v65 + 1));
    self->_unint64_t textContainerEntriesCount = v66 + ~v65 + textContainerEntriesCount;
    if (v47) {
      memmove(&self->_textContainerEntries[v66], &self->_textContainerEntries[v65 + 1], v47);
    }
  }
LABEL_85:
  if (v67)
  {
    uint64_t v73 = 0;
    CGRect v74 = &v73;
    uint64_t v75 = 0x3052000000;
    uint64_t v76 = __Block_byref_object_copy__2;
    double v77 = __Block_byref_object_dispose__2;
    uint64_t v78 = 0;
    uint64_t v48 = [v11 endLocation];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_5;
    v72[3] = &unk_1E55C5C80;
    v72[4] = &v73;
    [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:v48 options:2 usingBlock:v72];
    if (v74[5]
      || (softInvalidationLocation = self->_softInvalidationLocation) != 0
      && -[NSTextLocation compare:](softInvalidationLocation, "compare:", [v11 location]) != -1)
    {
      -[NSTextLayoutManager _setSoftInvalidationLocation:onlyIfUpstream:](self, "_setSoftInvalidationLocation:onlyIfUpstream:");
    }
    _Block_object_dispose(&v73, 8);
  }

LABEL_90:
  [(NSTextLayoutManager *)self _invalidateTextParagraphForEmptyDocument];
  uint64_t v49 = &self->_lastTextContainerEntry;
  uint64_t v50 = self->_lastTextContainerEntry.textContainer;
  if ([(_NSTextRunStorage *)self->_textLayoutFragmentStorage isEmpty])
  {
    while (1)
    {
      unint64_t v51 = self->_textContainerEntriesCount;
      if (!v51) {
        break;
      }
      textContainerEntries = self->_textContainerEntries;
      unint64_t v53 = v51 - 1;
      self->_unint64_t textContainerEntriesCount = v53;
      __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&textContainerEntries[v53]);
    }
    v49->textContainer = 0;
    __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_lastTextContainerEntry);
    v49->textContainer = v50;
  }
  else if (v64)
  {
    if (v67)
    {
      if (v7)
      {
        NSRect v54 = (void *)[v64 location];
        uint64_t v55 = objc_msgSend(v54, "compare:", -[NSTextRange endLocation](v7, "endLocation"));
        if (v55 != 1)
        {
          id v56 = [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage textLayoutFragmentForTextLocation:v54 allowsTrailingEdge:1];
          CGRect v57 = v56;
          if (v55 == -1
            && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v56, "textLineFragments"), "lastObject"), "isExtra"))
          {
            CGRect v57 = 0;
          }
          [v57 invalidateExtraLineFragment];
        }
      }
    }
  }
  if (v50) {
    BOOL v58 = v68;
  }
  else {
    BOOL v58 = 0;
  }
  if (v58)
  {
    if (objc_msgSend((id)objc_msgSend(v11, "location"), "compare:", -[NSTextRange endLocation](v7, "endLocation")) == -1) {
      uint64_t v59 = [v11 location];
    }
    else {
      uint64_t v59 = [(NSTextRange *)v7 endLocation];
    }
    long long v60 = (void *)v59;
    id v61 = [(NSTextContainer *)v50 textViewportLayoutController];
    long long v62 = (void *)[v61 viewportRange];
    if (v62 && objc_msgSend(v60, "compare:", objc_msgSend(v62, "location")) == -1) {
      [v61 _resetLayout];
    }
  }
  [(NSTextSelectionNavigation *)self->_textSelectionNavigation flushLayoutCache];

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(v89, 8);
  objc_sync_exit(self);
}

- (void)textContainerChangedGeometry:(id)a3
{
  objc_sync_enter(self);
  unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
  if ((textContainerEntriesCount & 0x8000000000000000) != 0)
  {
    textContainerEntries = self->_textContainerEntries;
    var0 = (NSTextContainer *)textContainerEntries[-1].var0;
    p_lastTextContainerEntrdouble y = ($12329A12E88B98FC1E4249E14A3806EA *)&textContainerEntries[-1];
    textContainer = var0;
  }
  else
  {
    p_lastTextContainerEntrdouble y = &self->_lastTextContainerEntry;
    textContainer = self->_lastTextContainerEntry.textContainer;
    if (!textContainer)
    {
      p_lastTextContainerEntrdouble y = 0;
      goto LABEL_7;
    }
  }
  if (textContainer == a3)
  {
LABEL_20:
    uint64_t v14 = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange];
    if (p_lastTextContainerEntry == &self->_lastTextContainerEntry
      && (CGRect v18 = self->_lastTextContainerEntry.textRange) != 0
      && (objc_msgSend(-[NSTextRange endLocation](v18, "endLocation"), "isEqual:", -[NSTextRange endLocation](v14, "endLocation")) & 1) == 0&& objc_msgSend(-[NSTextRange location](self->_lastTextContainerEntry.textRange, "location"), "compare:", -[NSTextRange endLocation](v14, "endLocation")) == -1)
    {
      uint64_t v16 = [[NSTextRange alloc] initWithLocation:[(NSTextRange *)self->_lastTextContainerEntry.textRange location] endLocation:[(NSTextRange *)v14 endLocation]];
    }
    else
    {
      textRange = p_lastTextContainerEntry->textRange;
      if (!textRange) {
        textRange = v14;
      }
      uint64_t v16 = textRange;
    }
    uint64_t v17 = v16;
    if ([(NSTextLayoutManager *)self usesContiguousLayout])
    {
      __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange((id *)&self->super.isa, v17, 0);
    }
    else
    {
      uint64_t v23 = 0;
      BOOL v24 = &v23;
      uint64_t v25 = 0x3052000000;
      BOOL v26 = __Block_byref_object_copy__2;
      double v27 = __Block_byref_object_dispose__2;
      uint64_t v28 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__NSTextLayoutManager_textContainerChangedGeometry___block_invoke;
      v22[3] = &unk_1E55C5C80;
      v22[4] = &v23;
      if (objc_msgSend(-[NSTextRange endLocation](v17, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", -[NSTextRange location](v17, "location"), 2, v22); {
      else
      }
        [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:v17 options:2 usingBlock:v22];
      uint64_t v19 = (void *)v24[5];
      if (v19) {
        __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange((id *)&self->super.isa, v19, 0);
      }
      _Block_object_dispose(&v23, 8);
    }
    [(NSTextLayoutManager *)self _invalidateTextParagraphForEmptyDocument];

    CGSize v20 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    p_lastTextContainerEntry->usageBounds.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    p_lastTextContainerEntry->usageBounds.CGSize size = v20;

    p_lastTextContainerEntry->textRange = 0;
    p_lastTextContainerEntry->BOOL containerFilled = 0;

    self->_softInvalidationLocation = 0;
    goto LABEL_37;
  }
  textContainer = self->_lastTextContainerEntry.textContainer;
LABEL_7:
  if (textContainer) {
    unint64_t v10 = textContainerEntriesCount + 1;
  }
  else {
    unint64_t v10 = self->_textContainerEntriesCount;
  }
  if (v10)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      if (textContainerEntriesCount <= v12)
      {
        p_lastTextContainerEntrdouble y = &self->_lastTextContainerEntry;
        if (textContainer) {
          goto LABEL_16;
        }
      }
      else
      {
        unint64_t v13 = self->_textContainerEntries;
        if (v13)
        {
          p_lastTextContainerEntrdouble y = ($12329A12E88B98FC1E4249E14A3806EA *)&v13[v11];
LABEL_16:
          if (p_lastTextContainerEntry->textContainer == a3) {
            goto LABEL_20;
          }
        }
      }
      ++v12;
      ++v11;
      if (v10 == v12) {
        goto LABEL_37;
      }
    }
  }
  if (p_lastTextContainerEntry) {
    goto LABEL_20;
  }
LABEL_37:
  textSelectionNavigation = self->_textSelectionNavigation;
  if (textSelectionNavigation) {
    [(NSTextSelectionNavigation *)textSelectionNavigation flushLayoutCache];
  }
  objc_sync_exit(self);
}

- (id)_textAnimationContextForLocation:(id)a3
{
  objc_sync_enter(self);
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  unint64_t v12 = __Block_byref_object_copy__2;
  unint64_t v13 = __Block_byref_object_dispose__2;
  uint64_t v14 = 0;
  textAnimationContextStorage = self->_textAnimationContextStorage;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSTextLayoutManager__textAnimationContextForLocation___block_invoke;
  v8[3] = &unk_1E55C6460;
  v8[4] = a3;
  void v8[5] = &v9;
  [(_NSTextRunStorage *)textAnimationContextStorage enumerateObjectsFromLocation:a3 options:2 usingBlock:v8];
  id v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  objc_sync_exit(self);
  return v6;
}

- (id)_estimatedTextLocationForVerticalOffset:(double)a3 originLocation:(id)a4 originOffset:(double)a5 deltaFromOffset:(double *)a6
{
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x3052000000;
  uint64_t v63 = __Block_byref_object_copy__2;
  id v64 = __Block_byref_object_dispose__2;
  uint64_t v65 = 0;
  id v10 = a4;
  if (!a4) {
    id v10 = [(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange] location];
  }
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3052000000;
  CGRect v57 = __Block_byref_object_copy__2;
  BOOL v58 = __Block_byref_object_dispose__2;
  uint64_t v59 = 0;
  uint64_t v50 = 0;
  unint64_t v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  TextContainerEntryAndIndexForLocation = (id *)__NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, v10);
  unint64_t v12 = TextContainerEntryAndIndexForLocation;
  if (TextContainerEntryAndIndexForLocation)
  {
    uint64_t v44 = 0;
    double v45 = &v44;
    uint64_t v46 = 0x3052000000;
    size_t v47 = __Block_byref_object_copy__2;
    uint64_t v48 = __Block_byref_object_dispose__2;
    uint64_t v49 = 0;
    if (a4)
    {
      if ([TextContainerEntryAndIndexForLocation[2] containsLocation:v10])
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke;
        v43[3] = &unk_1E55C5CA8;
        v43[4] = &v44;
        v43[5] = v12;
        [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:v10 options:0 usingBlock:v43];
      }
    }
    else
    {
      uint64_t LayoutFragmentForPosition = __NSTextLayoutManagerGetLayoutFragmentForPosition(self, TextContainerEntryAndIndexForLocation, 1, 0.0, a3);
      v45[5] = LayoutFragmentForPosition;
    }
    uint64_t v14 = (void *)v45[5];
    if (v14)
    {
      [v14 layoutFragmentFrame];
      double v16 = v15;
      double v18 = v17;
      uint64_t v19 = objc_msgSend((id)objc_msgSend((id)v45[5], "rangeInElement"), "endLocation");
      id v10 = (id)v19;
      a5 = v16 + v18;
      CGSize v20 = v55;
      if (a5 > a3)
      {
        v55[5] = v19;
        void v51[3] = v16 - a3;
      }
    }
    else
    {
      CGSize v20 = v55;
    }
    if (!v20[5] && [v12[2] isNotEmpty])
    {
      id v21 = v12[2];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_2;
      v42[3] = &unk_1E55C5C80;
      v42[4] = &v60;
      if (objc_msgSend((id)objc_msgSend(v21, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(v21, "location"), 2, v42); {
      else
      }
        [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:v21 options:2 usingBlock:v42];
    }
    _Block_object_dispose(&v44, 8);
  }
  uint64_t v22 = [(NSTextLayoutManager *)self textContentManager];
  uint64_t v23 = [(NSTextRange *)[(NSTextContentManager *)v22 documentRange] endLocation];
  uint64_t v35 = [(id)objc_opt_class() maximumNumberOfSeedElements];
  uint64_t v24 = objc_msgSend((id)objc_msgSend((id)v61[5], "rangeInElement"), "location");
  if (!v55[5])
  {
    double v27 = (void *)v24;
    CGRect v33 = v37;
    do
    {
      if (objc_msgSend(v10, "compare:", v23, v33) != -1) {
        break;
      }
      uint64_t v44 = 0;
      double v45 = &v44;
      uint64_t v46 = 0x3052000000;
      size_t v47 = __Block_byref_object_copy__2;
      uint64_t v48 = __Block_byref_object_dispose__2;
      uint64_t v49 = 0;
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      v41[3] = 0;
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v40[3] = 0;
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2020000000;
      v39[3] = 0;
      if (!v27 || ([v10 isEqual:v27] & 1) == 0)
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_3;
        v38[3] = &unk_1E55C5CF8;
        v38[4] = v27;
        v38[5] = self;
        v38[8] = v39;
        v38[9] = v41;
        *(double *)&v38[14] = a5;
        *(double *)&v38[15] = a3;
        v38[10] = v40;
        v38[11] = &v54;
        v38[12] = &v50;
        v38[13] = v35;
        v38[6] = v22;
        v38[7] = &v44;
        id v10 = [(NSTextContentManager *)v22 enumerateTextElementsFromLocation:v10 options:0 usingBlock:v38];
      }
      if (!v55[5])
      {
        uint64_t v28 = (void *)v61[5];
        if (v28)
        {
          [v28 layoutFragmentFrame];
          double v30 = v29;
          double v32 = v31;
          if (!self->_softInvalidationLocation || objc_msgSend(v27, "compare:") == -1) {
            a5 = v30 + v32;
          }
          if (a5 <= a3)
          {
            id v10 = (id)objc_msgSend((id)objc_msgSend((id)v61[5], "rangeInElement"), "endLocation");
            v61[5] = 0;
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v37[0] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_5;
            v37[1] = &unk_1E55C5C80;
            v37[2] = &v60;
            [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:v10 options:2 usingBlock:v36];
            double v27 = objc_msgSend((id)objc_msgSend((id)v61[5], "rangeInElement"), "location");
          }
          else
          {
            v55[5] = (uint64_t)v27;
            void v51[3] = v30 - a3;
          }
        }
      }
      _Block_object_dispose(v39, 8);
      _Block_object_dispose(v40, 8);
      _Block_object_dispose(v41, 8);
      _Block_object_dispose(&v44, 8);
    }
    while (!v55[5]);
  }
  if (a6) {
    *a6 = v51[3];
  }
  uint64_t v25 = (void *)v55[5];
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);
  return v25;
}

- (double)_estimatedVerticalSizeForTextRange:(id)a3 adjustedTextRange:(id *)a4
{
  id v7 = [(NSTextLayoutManager *)self textContentManager];
  uint64_t v34 = 0;
  uint64_t v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  double v30 = __Block_byref_object_copy__2;
  double v31 = __Block_byref_object_dispose__2;
  uint64_t v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  uint64_t v26 = 0;
  uint64_t v8 = [(id)objc_opt_class() maximumNumberOfSeedElements];
  uint64_t v9 = [a3 location];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__NSTextLayoutManager__estimatedVerticalSizeForTextRange_adjustedTextRange___block_invoke;
  v20[3] = &unk_1E55C5C10;
  v20[6] = v33;
  v20[7] = &v27;
  v20[4] = a3;
  v20[5] = self;
  v20[8] = &v34;
  v20[9] = &v21;
  v20[10] = v8;
  [(NSTextContentManager *)v7 enumerateTextElementsFromLocation:v9 options:0 usingBlock:v20];
  id v10 = (void *)v22[5];
  if (v10 && objc_msgSend(v10, "compare:", objc_msgSend(a3, "endLocation")) == -1)
  {
    uint64_t v11 = v28[5];
    if (!v11) {
      uint64_t v11 = [a3 location];
    }
    unint64_t v12 = [(NSTextContentManager *)v7 offsetFromLocation:v11 toLocation:v22[5]];
    if (v12)
    {
      unint64_t v13 = -[NSTextContentManager offsetFromLocation:toLocation:](v7, "offsetFromLocation:toLocation:", [a3 location], objc_msgSend(a3, "endLocation"));
      v35[3] = (double)v13 / (double)v12 * v35[3];
    }
  }
  if (v22[5] || v28[5])
  {
    if (a4)
    {
      uint64_t v14 = [NSTextRange alloc];
      uint64_t v15 = v28[5];
      if (!v15) {
        uint64_t v15 = [a3 location];
      }
      uint64_t v16 = v22[5];
      if (!v16) {
        uint64_t v16 = [a3 endLocation];
      }
      double v17 = [(NSTextRange *)v14 initWithLocation:v15 endLocation:v16];
    }
    else
    {
      double v17 = 0;
    }

    if (v17) {
      *a4 = v17;
    }
  }
  double v18 = v35[3];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);
  return v18;
}

+ (int64_t)maximumNumberOfSeedElements
{
  return 20;
}

uint64_t __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 state];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (id)_textViewportLayoutControllerForTextContainer:(id)a3
{
  id v5 = [(NSTextLayoutManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[v5 textLayoutManager:self textViewportLayoutControllerForTextContainer:a3]) == 0)
  {
    id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewportLayoutControllerClass")), "initWithTextContainer:", a3);
    return v7;
  }
  return result;
}

+ (Class)viewportLayoutControllerClass
{
  return (Class)objc_opt_class();
}

uint64_t __45__NSTextLayoutManager_setTextContentManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 textLayoutManager];
  if (result == *(void *)(a1 + 32))
  {
    return [a2 setTextLayoutManager:result];
  }
  return result;
}

- (void)setTextContainer:(NSTextContainer *)textContainer
{
  objc_sync_enter(self);
  [(NSTextLayoutManager *)self _removeTextContainersToCondition:&__block_literal_global_132];
  [(NSTextLayoutManager *)self _addTextContainer:textContainer];

  objc_sync_exit(self);
}

- (void)_removeTextContainersToCondition:(id)a3
{
  [(NSTextLayoutManager *)self willChangeValueForKey:@"textContainers"];
  objc_sync_enter(self);
  p_lastTextContainerEntrdouble y = &self->_lastTextContainerEntry;
  if (self->_lastTextContainerEntry.textContainer) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = 0;
  }
  if (self->_textContainerEntriesCount != v6)
  {
    do
    {
      if ((*((uint64_t (**)(id))a3 + 2))(a3)) {
        break;
      }
      __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_lastTextContainerEntry);
      unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
      if (textContainerEntriesCount)
      {
        self->_unint64_t textContainerEntriesCount = --textContainerEntriesCount;
        uint64_t v8 = &self->_textContainerEntries[textContainerEntriesCount];
        *(_OWORD *)&p_lastTextContainerEntry->textContainer = *(_OWORD *)&v8->var0;
        long long v9 = *(_OWORD *)&v8->var2;
        long long v10 = *(_OWORD *)&v8->var3.origin.y;
        long long v11 = *(_OWORD *)&v8->var3.size.height;
        *(void *)&self->_lastTextContainerEntry.BOOL containerFilled = *(void *)&v8->var5;
        *(_OWORD *)&self->_lastTextContainerEntry.usageBounds.origin.double y = v10;
        *(_OWORD *)&self->_lastTextContainerEntry.usageBounds.size.double height = v11;
        *(_OWORD *)&self->_lastTextContainerEntry.textRange = v9;
        self->_textContainerEntriesAccessHint = 0;
      }
      uint64_t v12 = p_lastTextContainerEntry->textContainer ? -1 : 0;
    }
    while (textContainerEntriesCount != v12);
  }

  self->_textContainers = 0;
  objc_sync_exit(self);

  [(NSTextLayoutManager *)self didChangeValueForKey:@"textContainers"];
}

- (void)_addTextContainer:(id)a3
{
  [(NSTextLayoutManager *)self willChangeValueForKey:@"textContainers"];
  objc_sync_enter(self);
  __NSTextLayoutManagerAddTextContainerEntry((uint64_t)self, a3);

  self->_textContainers = 0;
  objc_sync_exit(self);

  [(NSTextLayoutManager *)self didChangeValueForKey:@"textContainers"];
}

- (void)replaceTextContentManager:(NSTextContentManager *)textContentManager
{
  objc_sync_enter(self);
  id v5 = self;
  [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] removeTextLayoutManager:self];
  [(NSTextContentManager *)textContentManager addTextLayoutManager:self];

  objc_sync_exit(self);
}

- (void)setTextContentManager:(id)a3
{
  p_textContentManager = &self->_textContentManager;
  if (objc_loadWeak((id *)&self->_textContentManager) != a3)
  {
    uint64_t v6 = (void *)[objc_loadWeak((id *)p_textContentManager) documentRange];
    if ([v6 isNotEmpty])
    {
      [(NSTextLayoutManager *)self _invalidateLayoutForTextRange:v6 hard:1];
      [(NSTextLayoutManager *)self invalidateTemporaryAttributesForTextRange:v6];
    }
    objc_storeWeak((id *)p_textContentManager, a3);
    id v7 = [(NSTextLayoutManager *)self textContainers];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__NSTextLayoutManager_setTextContentManager___block_invoke;
    v8[3] = &unk_1E55C5C38;
    v8[4] = self;
    [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
  }
}

uint64_t __38__NSTextLayoutManager_usesHyphenation__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSUsesDefaultHyphenation");
  usesHyphenation_hyphenationEnabled = result;
  return result;
}

BOOL __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 textParagraph];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v66 = 0;
    BOOL v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v48 = a1;
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v6 = (void *)[a2 textLineFragments];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_2;
      v65[3] = &unk_1E55C5448;
      v65[4] = &v66;
      [v6 enumerateObjectsUsingBlock:v65];
    }
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v7) {
      uint64_t v8 = [v5 rangeForLocation:v7 allowsTrailingEdge:1];
    }
    else {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    long long v9 = (void *)[v5 paragraphContentRange];
    size_t v47 = v5;
    long long v10 = (void *)[v5 paragraphSeparatorRange];
    long long v11 = v10;
    if (*(unsigned char *)(a1 + 64)
      || (double v43 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) == 0
      || objc_msgSend(v43, "compare:", objc_msgSend(v10, "location"))
      || [v9 isEmpty])
    {
      uint64_t v45 = ([v11 isEmpty] & 1) != 0
          ? 0x7FFFFFFFFFFFFFFFLL
          : objc_msgSend(v47, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v11, "location"), 1);
      uint64_t v12 = (void *)[a2 textLineFragments];
      uint64_t v13 = [v12 count];
      uint64_t v14 = v13 - 1;
      if (v13 >= 1)
      {
        uint64_t v15 = 0;
        uint64_t v44 = v52;
        uint64_t v46 = v12;
        while (1)
        {
          uint64_t v16 = MEMORY[0x192FAE510](v13);
          if (*(unsigned char *)(v48 + 64)) {
            uint64_t v17 = v14;
          }
          else {
            uint64_t v17 = v15;
          }
          double v18 = objc_msgSend(v12, "objectAtIndex:", v17, v44);
          unint64_t v19 = [v18 characterRange];
          unint64_t v21 = v19;
          unint64_t v22 = v20;
          context = (void *)v16;
          if (v19)
          {
            unint64_t v23 = 0;
            int v24 = *(unsigned __int8 *)(v48 + 64);
          }
          else
          {
            int v24 = *(unsigned __int8 *)(v48 + 64);
            if (*(unsigned char *)(v48 + 64)) {
              unint64_t v25 = v20;
            }
            else {
              unint64_t v25 = 0;
            }
            unint64_t v23 = v67[3] - v25;
          }
          if (v24) {
            unint64_t v26 = -(uint64_t)v20;
          }
          else {
            unint64_t v26 = v20;
          }
          v67[3] += v26;
          uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
          if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_38;
          }
          unint64_t v27 = v8 - v23;
          if (v8 - v23 < v19 || v8 - v23 - v19 >= v20)
          {
            if (!v24)
            {
              uint64_t v50 = v8;
              goto LABEL_38;
            }
            uint64_t v50 = v8;
            if (v19 + v20 != v27) {
              goto LABEL_38;
            }
          }
          uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
          if (!v24 || v27 != v19)
          {
            uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_38:
            if (v19 + v20 <= v45 - v23) {
              unint64_t v30 = v20;
            }
            else {
              unint64_t v30 = v45 - v23 - v19;
            }
            if (v45 - v23 >= v19) {
              unint64_t v31 = v30;
            }
            else {
              unint64_t v31 = v20;
            }
            if (v45 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v32 = v20;
            }
            else {
              unint64_t v32 = v31;
            }
            if (v50 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((*(unsigned char *)(v48 + 57) & 2) == 0)
              {
                CGRect v33 = objc_msgSend((id)objc_msgSend(v18, "attributedString"), "string");
                uint64_t v34 = v33;
                if (v21 || v32 != [v33 length]) {
                  objc_msgSend(v34, "substringWithRange:", v21, v32);
                }
              }
              unint64_t v35 = v23 + v21;
              uint64_t v36 = [v47 locationForCharacterIndex:v23 + v21 dataSourceLocationsOnly:0 actualRange:0];
              uint64_t v37 = [v47 locationForCharacterIndex:v32 + v23 + v21 dataSourceLocationsOnly:0 actualRange:0];
              uint64_t v59 = 0;
              uint64_t v60 = &v59;
              uint64_t v61 = 0x3052000000;
              uint64_t v62 = __Block_byref_object_copy__2;
              uint64_t v63 = __Block_byref_object_dispose__2;
              id v64 = 0;
              id v64 = [[NSTextRange alloc] initWithLocation:v36 endLocation:v37];
              uint64_t v53 = 0;
              uint64_t v54 = &v53;
              uint64_t v55 = 0x3052000000;
              uint64_t v56 = __Block_byref_object_copy__2;
              CGRect v57 = __Block_byref_object_dispose__2;
              uint64_t v58 = 0;
              if (!v23 && v32 == v22
                || (uint64_t v36 = [v47 locationForCharacterIndex:v21 dataSourceLocationsOnly:0 actualRange:0], v38 = objc_msgSend(v47, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v21 + v22, 0, 0), (id)v54[5], v39 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v36, v38), (v54[5] = (uint64_t)v39) == 0))
              {
                uint64_t v39 = (NSTextRange *)v60[5];
              }
              CGFloat v40 = v39;
              uint64_t v41 = *(void *)(v48 + 56) | 0x200;
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v52[0] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_3;
              v52[1] = &unk_1E55C62A8;
              void v52[2] = v40;
              v52[3] = v18;
              v52[6] = &v53;
              v52[7] = v35;
              v52[8] = v32;
              v52[4] = v47;
              v52[5] = &v59;
              [v47 enumerateSubstringsFromLocation:v36 options:v41 usingBlock:v51];
              (*(void (**)(void))(*(void *)(v48 + 32) + 16))();
              *(unsigned char *)(*(void *)(*(void *)(v48 + 48) + 8) + 24) = 0;

              _Block_object_dispose(&v53, 8);
              _Block_object_dispose(&v59, 8);
            }
            int v29 = 0;
            uint64_t v8 = v50;
            goto LABEL_60;
          }
          int v29 = 4;
LABEL_60:
          uint64_t v12 = v46;
          if ((v29 | 4) == 4)
          {
            ++v15;
            if (--v14 != -1) {
              continue;
            }
          }
          break;
        }
      }
    }
    _Block_object_dispose(&v66, 8);
    a1 = v48;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0;
}

unint64_t __81__NSTextLayoutManager__textLineFragmentAtLocation_textLayoutFragment_rangeDelta___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t result = [a2 characterRange];
  if (!result) {
    unint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  unint64_t v9 = *(void *)(a1 + 48);
  BOOL v10 = v9 < result || v9 - result >= v8;
  if (!v10 || (v9 == result ? (BOOL v11 = *(unsigned char *)(a1 + 56) == 0) : (BOOL v11 = 1), !v11 ? (v12 = v8 == 0) : (v12 = 0), v12))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
    *a4 = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v8;
  }
  return result;
}

- (void)_addTextContainerForLocation:(id)a3
{
  if (self->_delegateWithTextContainerQuery) {
    uint64_t v4 = objc_msgSend(-[NSTextLayoutManager delegate](self, "delegate"), "textLayoutManager:textContainerForLocation:", self, a3);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  if (v5
    || (id v5 = (id)[(NSTextContainer *)[(NSTextLayoutManager *)self templateTextContainer] copy]) != 0)
  {
    id v6 = v5;
    [(NSTextLayoutManager *)self _addTextContainer:v5];
  }
}

- (NSTextContainer)templateTextContainer
{
  return (NSTextContainer *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDelegate:(id)delegate
{
  objc_sync_enter(self);
  if (objc_loadWeak((id *)&self->_delegate) != delegate)
  {
    objc_storeWeak((id *)&self->_delegate, delegate);
    self->_delegateWithTextSelectionNotification = objc_opt_respondsToSelector() & 1;
    char v5 = objc_opt_respondsToSelector();
    self->_delegateWithTextContainerQuerdouble y = v5 & 1;
    if (v5) {
      char v6 = objc_opt_respondsToSelector();
    }
    else {
      char v6 = 0;
    }
    self->_delegateWithSimpleTextContainerQuerdouble y = v6 & 1;
    self->_delegateWithTruncationToken = objc_opt_respondsToSelector() & 1;
  }

  objc_sync_exit(self);
}

- (id)rangeForTextContainerAtIndex:(int64_t)a3
{
  objc_sync_enter(self);
  if (self->_textContainerEntriesCount <= a3)
  {
    p_lastTextContainerEntrdouble y = &self->_lastTextContainerEntry;
    if (self->_lastTextContainerEntry.textContainer) {
      goto LABEL_5;
    }
LABEL_6:
    textRange = 0;
    goto LABEL_7;
  }
  textContainerEntries = self->_textContainerEntries;
  if (!textContainerEntries) {
    goto LABEL_6;
  }
  p_lastTextContainerEntrdouble y = ($12329A12E88B98FC1E4249E14A3806EA *)&textContainerEntries[a3];
LABEL_5:
  textRange = p_lastTextContainerEntry->textRange;
LABEL_7:
  objc_sync_exit(self);
  return textRange;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_textContentManager, 0);
  __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_lastTextContainerEntry);
  for (unint64_t i = self->_textContainerEntriesCount; i; unint64_t i = self->_textContainerEntriesCount)
  {
    unint64_t v4 = i - 1;
    self->_unint64_t textContainerEntriesCount = v4;
    __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_textContainerEntries[v4]);
  }
  textContainerEntries = self->_textContainerEntries;
  if (textContainerEntries) {
    NSZoneFree(0, textContainerEntries);
  }

  objc_storeWeak((id *)&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)NSTextLayoutManager;
  [(NSTextLayoutManager *)&v6 dealloc];
}

NSTextRange *__74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  if (a4) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = a3;
  }
  unint64_t result = (NSTextRange *)[*(id *)(a1 + 32) isEqual:v9];
  if (result)
  {

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a3;
    unint64_t result = a4;
    uint64_t v11 = *(void *)(a1 + 64);
LABEL_6:
    *(void *)(*(void *)(v11 + 8) + 40) = result;
    goto LABEL_9;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    unint64_t result = (NSTextRange *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "endLocation"), "compare:", objc_msgSend(v9, "endLocation"));
    if (result == (NSTextRange *)-1)
    {
      BOOL v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "attributedString"), "string");
      unint64_t v13 = *(void *)(a1 + 80) + *(void *)(a1 + 72);
      unint64_t result = (NSTextRange *)[v12 characterAtIndex:v13 - 1];
      if ((int)result > 132)
      {
        if ((result - 8232) >= 2 && result != 133) {
          goto LABEL_9;
        }
      }
      else if (result != 10 && result != 12)
      {
        if (result != 13) {
          goto LABEL_9;
        }
        if (v13 < [0 length])
        {
          unint64_t result = (NSTextRange *)[0 characterAtIndex:v13];
          if (result == 10) {
            goto LABEL_9;
          }
        }
      }
      uint64_t v14 = [*(id *)(a1 + 48) locationForCharacterIndex:*(void *)(a1 + 72) + *(void *)(a1 + 80) - 1 dataSourceLocationsOnly:0 actualRange:0];
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 40);
      unint64_t result = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) location], v14);
      uint64_t v11 = *(void *)(a1 + 56);
      goto LABEL_6;
    }
  }
LABEL_9:
  *a5 = 1;
  return result;
}

- (void)_fixSelectionAfterChangeInCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v8 = [(NSTextLayoutManager *)self textSelections];
  if (v8)
  {
    id v9 = [(NSTextLayoutManager *)self adjustedTextSelectionsForEditingContextFromTextSelections:v8];
    if (v9) {
      [(NSTextLayoutManager *)self setTextSelections:v9];
    }
  }

  if (self->_temporaryAttributesTable)
  {
    BOOL v10 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", location, length - a4);
    [(_NSTextRunStorage *)self->_temporaryAttributesTable invalidateElementsInRange:v10 delta:a4];
  }
}

- (void)ensureLayoutForBounds:(CGRect)bounds
{
  double height = bounds.size.height;
  CGFloat width = bounds.size.width;
  double y = bounds.origin.y;
  CGFloat x = bounds.origin.x;
  unint64_t v8 = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange];
  objc_sync_enter(self);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  double v18 = __Block_byref_object_dispose__2;
  uint64_t v19 = 0;
  uint64_t v9 = [(NSTextRange *)v8 endLocation];
  uint64_t v13 = 0;
  __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, 0, y + height);
  id v10 = [(NSTextLayoutManager *)self _estimatedTextLocationForVerticalOffset:0 originLocation:&v13 originOffset:y deltaFromOffset:0.0];
  void v15[5] = (uint64_t)v10;
  if (!v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__NSTextLayoutManager_ensureLayoutForBounds___block_invoke;
    v12[3] = &unk_1E55C5DE0;
    *(CGFloat *)&v12[5] = x;
    *(double *)&v12[6] = y;
    *(CGFloat *)&v12[7] = width;
    *(double *)&v12[8] = height;
    v12[4] = &v14;
    [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v9 options:13 usingBlock:v12];
    id v10 = (id)v15[5];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__NSTextLayoutManager_ensureLayoutForBounds___block_invoke_2;
  v11[3] = &unk_1E55C5E08;
  *(CGFloat *)&v11[5] = x;
  *(double *)&v11[6] = y;
  *(CGFloat *)&v11[7] = width;
  *(double *)&v11[8] = height;
  v11[4] = v9;
  [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v10 options:12 usingBlock:v11];
  __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, 0, y + height);
  _Block_object_dispose(&v14, 8);
  objc_sync_exit(self);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_textContentManager);
}

- (id)_descriptionForTextLayoutFragmentStorage
{
  return [(_NSTextRunStorage *)self->_textLayoutFragmentStorage description];
}

- (BOOL)_hasLayoutForLocation:(id)a3
{
  return [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage textLayoutFragmentForTextLocation:a3 allowsTrailingEdge:0] != 0;
}

+ (BOOL)_throwsOnAssertionError
{
  int v2 = __NSTextLayoutManagerThrowsExceptionOnAssertionError;
  if (__NSTextLayoutManagerThrowsExceptionOnAssertionError < 0)
  {
    int v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"__NSTextLayoutManagerThrowsExceptionOnAssertionError");
    __NSTextLayoutManagerThrowsExceptionOnAssertionError = v2;
  }
  return v2 != 0;
}

+ (void)_setThrowsOnAssertionError:(BOOL)a3
{
  __NSTextLayoutManagerThrowsExceptionOnAssertionError = a3;
}

+ (BOOL)_validatesInternalCaches
{
  int v2 = __NSTextLayoutManagerValidatesInternalCaches;
  if (__NSTextLayoutManagerValidatesInternalCaches < 0)
  {
    int v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"__NSTextLayoutManagerValidatesInternalCaches");
    __NSTextLayoutManagerValidatesInternalCaches = v2;
  }
  return v2 != 0;
}

+ (void)_setValidatesInternalCaches:(BOOL)a3
{
  __NSTextLayoutManagerValidatesInternalCaches = a3;
}

- (BOOL)_validateTextContainerEntries
{
  int v3 = [(id)objc_opt_class() _throwsOnAssertionError];
  unint64_t textContainerEntriesSize = self->_textContainerEntriesSize;
  BOOL v5 = (textContainerEntriesSize == 0) ^ (self->_textContainerEntries != 0);
  if ((textContainerEntriesSize == 0) == (self->_textContainerEntries != 0) && ((v3 ^ 1) & 1) == 0)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "-[NSTextLayoutManager _validateTextContainerEntries]"), @"NSTextLayoutManager.m", 727, @"_textContainerEntries inconsistency, _textContainerEntries:%p, _textContainerEntriesSize:%lu", self->_textContainerEntries, self->_textContainerEntriesSize file lineNumber description];
    unint64_t textContainerEntriesSize = self->_textContainerEntriesSize;
  }
  unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
  BOOL v7 = textContainerEntriesCount >= textContainerEntriesSize;
  if (textContainerEntriesCount >= textContainerEntriesSize) {
    char v8 = 1;
  }
  else {
    char v8 = v3 ^ 1;
  }
  BOOL result = v7 && v5;
  if ((v8 & 1) == 0)
  {
    uint64_t v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "-[NSTextLayoutManager _validateTextContainerEntries]"), @"NSTextLayoutManager.m", 733, @"_textContainerEntriesSize inconsistency, _textContainerEntriesSize:%lu, _textContainerEntriesCount:%lu", self->_textContainerEntriesSize, self->_textContainerEntriesCount file lineNumber description];
    BOOL result = 0;
  }
  textContainerEntriesAccessHint = self->_textContainerEntriesAccessHint;
  if (textContainerEntriesAccessHint)
  {
    textContainerEntries = self->_textContainerEntries;
    if (textContainerEntriesAccessHint < textContainerEntries)
    {
      if (!v3) {
        return 0;
      }
LABEL_26:
      double v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "-[NSTextLayoutManager _validateTextContainerEntries]"), @"NSTextLayoutManager.m", 739, @"_textContainerEntriesAccessHint inconsistency, _textContainerEntriesAccessHint:%p, _textContainerEntries:%p, _textContainerEntriesCount:%lu, (_textContainerEntriesAccessHint - _textContainerEntries):%ld", self->_textContainerEntriesAccessHint, self->_textContainerEntries, self->_textContainerEntriesCount, 0x8E38E38E38E38E39* (((char *)self->_textContainerEntriesAccessHint - (char *)self->_textContainerEntries) >> 3) file lineNumber description];
      return 0;
    }
    unint64_t v12 = self->_textContainerEntriesCount;
    uint64_t v13 = &textContainerEntries[v12];
    if (v12) {
      BOOL v14 = v13 > textContainerEntriesAccessHint;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14) {
      char v15 = 1;
    }
    else {
      char v15 = v3 ^ 1;
    }
    if (!v14) {
      BOOL result = 0;
    }
    if ((v15 & 1) == 0) {
      goto LABEL_26;
    }
  }
  return result;
}

+ (Class)companionLayoutManagerClass
{
  return (Class)objc_opt_class();
}

- (id)companionLayoutManager
{
  if (!self->_companion) {
    self->_companion = (NSLayoutManager *)objc_alloc_init((Class)[(id)objc_opt_class() companionLayoutManagerClass]);
  }
  objc_sync_exit(self);
  return self->_companion;
}

+ (id)validRenderingAttributes
{
  if (validRenderingAttributes_onceToken != -1) {
    dispatch_once(&validRenderingAttributes_onceToken, &__block_literal_global_78);
  }
  return (id)validRenderingAttributes_renderingAttributes;
}

uint64_t __47__NSTextLayoutManager_validRenderingAttributes__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t result = objc_msgSend(v0, "initWithObjects:", @"NSColor", @"NSBackgroundColor", @"NSShadow", @"NSTextEffect", @"NSLink", @"NSTextAlternatives", @"NSSpellingState", @"NSTextAlternativesDisplayStyle", NSTemporaryTextCorrectionAttributeName, 0);
  validRenderingAttributes_renderingAttributes = result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextLayoutManager)initWithCoder:(NSCoder *)coder
{
  [(NSTextLayoutManager *)self _commonInit];
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    unsigned int v5 = [(NSCoder *)coder decodeInt32ForKey:@"NS.flags"];
    [(NSTextLayoutManager *)self setDelegate:[(NSCoder *)coder decodeObjectForKey:@"NS.delegate"]];
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    -[NSTextLayoutManager setTextContentManager:](self, "setTextContentManager:", -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), @"NS.textContentManager"));
    [(NSTextLayoutManager *)self setTemplateTextContainer:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.templateTextContainer"]];
    [(NSTextLayoutManager *)self setLayoutQueue:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.layoutQueue"]];
    self->_BOOL usesFontLeading = v5 & 1;
    v8.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v5) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)&self->_BOOL limitsLayoutForSuspiciousContents = vmovn_s16(v8).u32[0];
    id v9 = [(NSCoder *)coder decodeObjectForKey:@"NS.firstTextContainer"];
    if (v9) {
      __NSTextLayoutManagerAddTextContainerEntry((uint64_t)self, v9);
    }
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    unsigned int v5 = [(NSTextLayoutManager *)self textContentManager];
    id v6 = [(NSTextLayoutManager *)self delegate];
    if (v6) {
      [a3 encodeObject:v6 forKey:@"NS.delegate"];
    }
    if (v5) {
      [a3 encodeObject:v5 forKey:@"NS.textContentManager"];
    }
    templateTextContainer = self->_templateTextContainer;
    if (templateTextContainer) {
      [a3 encodeObject:templateTextContainer forKey:@"NS.templateTextContainer"];
    }
    layoutQueue = self->_layoutQueue;
    if (layoutQueue) {
      [a3 encodeObject:layoutQueue forKey:@"NS.layoutQueue"];
    }
    unsigned int usesFontLeading = self->_usesFontLeading;
    if (self->_limitsLayoutForSuspiciousContents) {
      usesFontLeading |= 2u;
    }
    if (self->_usesHyphenation) {
      usesFontLeading |= 4u;
    }
    if (self->_allowsFontSubstitutionAffectingVerticalMetrics) {
      usesFontLeading |= 8u;
    }
    if (self->_breaksLinesForInteractiveText) {
      uint64_t v10 = usesFontLeading | 0x10;
    }
    else {
      uint64_t v10 = usesFontLeading;
    }
    if (v10) {
      [a3 encodeInt32:v10 forKey:@"NS.flags"];
    }
    p_textContainer = &self->_lastTextContainerEntry.textContainer;
    textContainer = self->_lastTextContainerEntry.textContainer;
    unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
    if (textContainer) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = 0;
    }
    if (textContainerEntriesCount != v14)
    {
      if (textContainerEntriesCount)
      {
        p_textContainer = &self->_textContainerEntries->var0;
      }
      else if (!textContainer)
      {
        p_textContainer = 0;
      }
      if (*p_textContainer)
      {
        objc_msgSend(a3, "encodeObject:forKey:");
      }
    }
  }
}

- (void)setUsesHyphenation:(BOOL)usesHyphenation
{
  BOOL v3 = usesHyphenation;
  objc_sync_enter(self);
  if (self->_usesHyphenation != v3)
  {
    self->_BOOL usesHyphenation = v3;
    [(NSTextLayoutManager *)self invalidateLayoutForRange:[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange]];
  }

  objc_sync_exit(self);
}

- (void)setAllowsFontSubstitutionAffectingVerticalMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  objc_sync_enter(self);
  if (self->_allowsFontSubstitutionAffectingVerticalMetrics != v3)
  {
    self->_BOOL allowsFontSubstitutionAffectingVerticalMetrics = v3;
    [(NSTextLayoutManager *)self invalidateLayoutForRange:[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange]];
  }

  objc_sync_exit(self);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if ([a3 isEqualToString:@"textSelections"]) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSTextLayoutManager;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  objc_sync_enter(self);
  if (!a3) {
    a3 = _NSTextScalingTypeForCurrentEnvironment();
  }
  self->_int64_t applicationFrameworkContext = a3;

  objc_sync_exit(self);
}

- (void)_removeTextContainer
{
  objc_sync_enter(self);
  if (self->_lastTextContainerEntry.textContainer) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 0;
  }
  if (self->_textContainerEntriesCount != v3)
  {
    __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_lastTextContainerEntry);
    unint64_t textContainerEntriesCount = self->_textContainerEntriesCount;
    if (textContainerEntriesCount)
    {
      unint64_t v5 = textContainerEntriesCount - 1;
      self->_unint64_t textContainerEntriesCount = v5;
      objc_super v6 = &self->_textContainerEntries[v5];
      *(_OWORD *)&self->_lastTextContainerEntry.textContainer = *(_OWORD *)&v6->var0;
      long long v7 = *(_OWORD *)&v6->var2;
      long long v8 = *(_OWORD *)&v6->var3.origin.y;
      long long v9 = *(_OWORD *)&v6->var3.size.height;
      *(void *)&self->_lastTextContainerEntry.BOOL containerFilled = *(void *)&v6->var5;
      *(_OWORD *)&self->_lastTextContainerEntry.usageBounds.origin.double y = v8;
      *(_OWORD *)&self->_lastTextContainerEntry.usageBounds.size.double height = v9;
      *(_OWORD *)&self->_lastTextContainerEntry.textRange = v7;
      self->_textContainerEntriesAccessHint = 0;
    }

    self->_textContainers = 0;
  }

  objc_sync_exit(self);
}

- (BOOL)allowsAddingTextContainer
{
  TextContainerEntryAtIndeCGFloat x = (id *)__NSTextLayoutManagerGetTextContainerEntryAtIndex(self, 0x7FFFFFFFFFFFFFFFuLL, 1);
  BOOL v4 = [(NSTextLayoutManager *)self usesContiguousLayout];
  BOOL result = 0;
  if (v4)
  {
    if (TextContainerEntryAtIndex) {
      return [*TextContainerEntryAtIndex lineBreakMode] < 2;
    }
  }
  return result;
}

uint64_t __40__NSTextLayoutManager_setTextContainer___block_invoke()
{
  return 0;
}

void __57__NSTextLayoutManager_usageBoundsInTextContainerAtIndex___block_invoke(uint64_t a1, void *a2)
{
  if ((unint64_t)[a2 state] >= 2)
  {
    [a2 layoutFragmentFrame];
    CGFloat v5 = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
    BOOL v12 = CGRectEqualToRect(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *MEMORY[0x1E4F1DB28]);
    uint64_t v13 = *(CGRect **)(*(void *)(a1 + 32) + 8);
    if (v12)
    {
      v13[1].origin.CGFloat x = v5;
    }
    else
    {
      v15.origin.CGFloat x = v5;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      CGRect v14 = CGRectUnion(v13[1], v15);
      CGFloat y = v14.origin.y;
      CGFloat width = v14.size.width;
      CGFloat height = v14.size.height;
      uint64_t v13 = *(CGRect **)(*(void *)(a1 + 32) + 8);
      v13[1].origin.CGFloat x = v14.origin.x;
    }
    v13[1].origin.CGFloat y = y;
    v13[1].size.CGFloat width = width;
    v13[1].size.CGFloat height = height;
  }
}

uint64_t __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "containsLocation:", objc_msgSend(a3, "location"));
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  }
  *a4 = 1;
  return result;
}

uint64_t __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_4(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location");
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 80)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24)
                                                              * ((double)[*(id *)(a1 + 32) offsetFromLocation:*(void *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 40) toLocation:*(void *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 40)]/ (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 72)+ 8)+ 24))- *(double *)(a1 + 88);
  return 0;
}

uint64_t __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 state];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (id)_estimatedTextLocationForVerticalOffset:(double)a3 originLocation:(id)a4 originOffset:(double)a5
{
  return [(NSTextLayoutManager *)self _estimatedTextLocationForVerticalOffset:a4 originLocation:0 originOffset:a3 deltaFromOffset:a5];
}

- (id)renderingColorForDocumentColor:(id)a3 atLocation:(id)a4
{
  id v5 = [(NSTextLayoutManager *)self textContainerForLocation:a4];
  if (!v5) {
    return a3;
  }

  return (id)[v5 renderingColorForDocumentColor:a3];
}

- (id)_fillSoftInvalidationToLocation:(id)a3 verticalOffset:(double)a4
{
  return (id)__NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, a3, a4);
}

uint64_t __67__NSTextLayoutManager_updateLayoutWithTextLayoutFragment_addition___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a2;
  *a4 = 1;
  return result;
}

BOOL __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 location] == *(void *)(a1 + 32);
}

BOOL __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "textElement"), "textContentManager") == 0;
}

uint64_t __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (NSTextLayoutManagerBreakOnNilContentManager_onceToken != -1) {
    dispatch_once(&NSTextLayoutManagerBreakOnNilContentManager_onceToken, &__block_literal_global_4);
  }
  double v4 = NSString;
  uint64_t v6 = *(void *)(a1 + 32);
  id v5 = *(uint64_t **)(a1 + 40);
  uint64_t v7 = v5[7];
  uint64_t v9 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v10 = *v5;
  uint64_t v11 = NSStringFromRect(*(NSRect *)(v5 + 3));
  BOOL v12 = @"Y";
  if (*((unsigned char *)v5 + 64)) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  if (!*((unsigned char *)v5 + 65)) {
    BOOL v12 = @"N";
  }
  return [v4 stringWithFormat:@"%@: NSTextContainer range out of document range %@: %@", a2, v6, objc_msgSend(v4, "stringWithFormat:", @"NSTextContainer entry %p: %@ %lu, textRange=%@, startLocation=%@, usageBounds=%@, filled=%@, anchored=%@", v5, v10, v7, v8, v9, v11, v13, v12)];
}

- (id)textLayoutFragmentForPosition:(CGPoint)a3 inTextContainerAtIndex:(int64_t)a4
{
  return -[NSTextLayoutManager textLayoutFragmentForPosition:inTextContainerAtIndex:avoidsAdditionalLayout:](self, "textLayoutFragmentForPosition:inTextContainerAtIndex:avoidsAdditionalLayout:", a4, 0, a3.x, a3.y);
}

- (NSTextLayoutFragment)textLayoutFragmentForPosition:(CGPoint)position
{
  return (NSTextLayoutFragment *)-[NSTextLayoutManager textLayoutFragmentForPosition:inTextContainerAtIndex:avoidsAdditionalLayout:](self, "textLayoutFragmentForPosition:inTextContainerAtIndex:avoidsAdditionalLayout:", 0x7FFFFFFFFFFFFFFFLL, 0, position.x, position.y);
}

- (id)textLayoutFragmentForPosition:(CGPoint)a3 inTextContainerAtIndex:(int64_t)a4 avoidsAdditionalLayout:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  unint64_t v22 = __Block_byref_object_copy__2;
  unint64_t v23 = __Block_byref_object_dispose__2;
  uint64_t v24 = 0;
  objc_sync_enter(self);
  if (v20[5]) {
    goto LABEL_21;
  }
  if (self->_textContainerEntriesCount <= a4)
  {
    p_lastTextContainerEntrdouble y = (NSTextLayoutManager *)&self->_lastTextContainerEntry;
    if (self->_lastTextContainerEntry.textContainer) {
      goto LABEL_6;
    }
LABEL_21:
    objc_sync_exit(self);
    CGRect v15 = (void *)v20[5];
    goto LABEL_22;
  }
  textContainerEntries = self->_textContainerEntries;
  if (!textContainerEntries) {
    goto LABEL_21;
  }
  p_lastTextContainerEntrdouble y = (NSTextLayoutManager *)&textContainerEntries[a4];
LABEL_6:
  if (p_lastTextContainerEntry == (NSTextLayoutManager *)&self->_lastTextContainerEntry && !a5) {
    -[NSTextLayoutManager ensureLayoutForBounds:](self, "ensureLayoutForBounds:", x, y, 1.0, 1.0);
  }
  if (y > 0.0
    || (!self->_textContainerEntriesCount
      ? (self->_lastTextContainerEntry.textContainer
       ? (BOOL v12 = (NSTextLayoutManager *)&self->_lastTextContainerEntry)
       : (BOOL v12 = 0))
      : (BOOL v12 = (NSTextLayoutManager *)self->_textContainerEntries),
        v12 == p_lastTextContainerEntry
      ? (textContainers = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange]): (textContainers = (NSTextRange *)p_lastTextContainerEntry->_textContainers), (uint64_t v14 = [(NSTextRange *)textContainers location]) == 0))
  {
    uint64_t LayoutFragmentForPosition = __NSTextLayoutManagerGetLayoutFragmentForPosition(self, (id *)&p_lastTextContainerEntry->super.isa, 0, x, y);
    v20[5] = LayoutFragmentForPosition;
    goto LABEL_21;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__NSTextLayoutManager_textLayoutFragmentForPosition_inTextContainerAtIndex_avoidsAdditionalLayout___block_invoke;
  v18[3] = &unk_1E55C5E30;
  v18[4] = &v19;
  [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v14 options:0 usingBlock:v18];
  CGRect v15 = (void *)v20[5];
  objc_sync_exit(self);
LABEL_22:
  _Block_object_dispose(&v19, 8);
  return v15;
}

uint64_t __99__NSTextLayoutManager_textLayoutFragmentForPosition_inTextContainerAtIndex_avoidsAdditionalLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  return 0;
}

- (NSTextLineFragment)_extraTextLineFragment
{
  id v3 = [(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange] endLocation];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__NSTextLayoutManager__extraTextLineFragment__block_invoke;
  v6[3] = &unk_1E55C5E80;
  v6[4] = v3;
  void v6[5] = &v7;
  [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:v3 options:1 usingBlock:v6];
  double v4 = (NSTextLineFragment *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __45__NSTextLayoutManager__extraTextLineFragment__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "endLocation"), "isEqual:", *(void *)(a1 + 32));
  if (result)
  {
    id result = (id)[a2 state];
    if (result == (id)3)
    {
      uint64_t v8 = (void *)[a2 textLineFragments];
      id result = (id)[v8 count];
      if ((unint64_t)result >= 2)
      {
        id result = (id)objc_msgSend((id)objc_msgSend(v8, "lastObject"), "characterRange");
        if (!v9)
        {
          id result = (id)[v8 lastObject];
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
        }
      }
    }
  }
  *a4 = 1;
  return result;
}

uint64_t __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "textLineFragments"), "count");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > *(void *)(a1 + 40)) {
    *a4 = 1;
  }
  return result;
}

__n128 __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange(*(id **)(a1 + 32), a2, 0);
  double v4 = *(void **)(a1 + 32);
  unint64_t v5 = v4[31];
  if (v5
    && (TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(v4, (void *)[a2 location])) != 0&& (unint64_t v7 = *((void *)TextContainerEntryAndIndexForLocation + 7), v7 < v5))
  {
    uint64_t v8 = (_OWORD *)MEMORY[0x1E4F1DB28];
    while (1)
    {
      TextContainerEntryAtIndedouble x = __NSTextLayoutManagerGetTextContainerEntryAtIndex(v4, v7, 1);
      if (![(id)TextContainerEntryAtIndex[2] intersectsWithTextRange:a2]) {
        break;
      }
      *((unsigned char *)TextContainerEntryAtIndex + 64) = 0;
      long long v11 = v8[1];
      *(_OWORD *)(TextContainerEntryAtIndex + 3) = *v8;
      *(_OWORD *)(TextContainerEntryAtIndex + 5) = v11;
      if (v5 == ++v7) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t v12 = __NSTextLayoutManagerGetTextContainerEntryAtIndex(v4, 0x7FFFFFFFFFFFFFFFuLL, 1);
    if ([(id)v12[2] intersectsWithTextRange:a2])
    {
      *((unsigned char *)v12 + 64) = 0;
      __n128 result = *(__n128 *)MEMORY[0x1E4F1DB28];
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)(v12 + 3) = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v12 + 5) = v13;
    }
  }
  return result;
}

- (CGSize)estimatedSizeForLastTextContainer
{
  uint64_t v29 = 0;
  unint64_t v30 = (CGFloat *)&v29;
  uint64_t v31 = 0x3010000000;
  unint64_t v32 = "";
  long long v33 = *MEMORY[0x1E4F1DB30];
  id v3 = [(NSTextRange *)[(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange] endLocation];
  id v4 = v3;
  if (v3)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    uint64_t v22 = 0;
    unint64_t v23 = &v22;
    uint64_t v24 = 0x3052000000;
    unint64_t v25 = __Block_byref_object_copy__2;
    unint64_t v26 = __Block_byref_object_dispose__2;
    uint64_t v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__NSTextLayoutManager_estimatedSizeForLastTextContainer__block_invoke;
    v21[3] = &unk_1E55C5FC0;
    v21[4] = v3;
    v21[5] = v28;
    v21[6] = &v22;
    v21[7] = &v29;
    [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v3 options:11 usingBlock:v21];
    if (![(NSTextLayoutManager *)self usesContiguousLayout])
    {
      unint64_t v5 = [NSTextRange alloc];
      if (v23[5]) {
        id v6 = (id)v23[5];
      }
      else {
        id v6 = v4;
      }
      unint64_t v7 = [(NSTextRange *)v5 initWithLocation:v6];
      [(NSTextLayoutManager *)self ensureLayoutForRange:v7];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __56__NSTextLayoutManager_estimatedSizeForLastTextContainer__block_invoke_2;
      v20[3] = &unk_1E55C5FE8;
      v20[4] = &v29;
      [(NSTextLayoutManager *)self enumerateTextSegmentsInRange:v7 type:1 options:1 usingBlock:v20];
    }
    uint64_t v8 = v30;
    if (v30[4] > 0.0 && v30[5] <= 0.0)
    {
      if ([(NSTextLayoutManager *)self usesContiguousLayout] || v23[5])
      {
        uint64_t v9 = [(NSTextLayoutManager *)self textContainers];
        unint64_t v10 = [(NSArray *)v9 indexOfObject:[(NSTextLayoutManager *)self textContainer]];
        if (v10 >= [(NSArray *)v9 count]) {
          [(NSTextLayoutManager *)self usageBoundsForTextContainer];
        }
        else {
          [(NSTextLayoutManager *)self usageBoundsInTextContainerAtIndex:v10];
        }
        CGFloat Height = CGRectGetHeight(*(CGRect *)&v11);
        uint64_t v8 = v30;
        v30[5] = Height;
      }
      else
      {
        uint64_t v8 = v30;
      }
    }
    double v15 = v8[4];
    double v16 = v8[5];
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(v28, 8);
  }
  else
  {
    double v15 = v30[4];
    double v16 = v30[5];
  }
  _Block_object_dispose(&v29, 8);
  double v18 = v15;
  double v19 = v16;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

BOOL __56__NSTextLayoutManager_estimatedSizeForLastTextContainer__block_invoke(void *a1, void *a2)
{
  [a2 layoutFragmentFrame];
  double v5 = v4;
  if (!*(void *)(*(void *)(a1[5] + 8) + 24)
    && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation"), "isEqual:", a1[4]) & 1) == 0)
  {
    *(void *)(*(void *)(a1[6] + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation");
  }
  uint64_t v6 = *(void *)(a1[7] + 8);
  if (v5 > *(double *)(v6 + 32)) {
    *(double *)(v6 + 32) = v5;
  }
  return ++*(void *)(*(void *)(a1[5] + 8) + 24) < 0x64uLL;
}

uint64_t __56__NSTextLayoutManager_estimatedSizeForLastTextContainer__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a3 + a5;
  return 1;
}

- (id)_rangeForAllLinesContainingTextInRange:(id)a3
{
  double v5 = [(NSTextLayoutManager *)self textContentManager];
  id v6 = (id)[a3 location];
  unint64_t v7 = [(NSTextLayoutManager *)self textLayoutFragmentForLocation:v6];
  uint64_t v8 = [(NSTextLayoutFragment *)v7 textParagraph];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  if (![(NSTextRange *)[(NSTextParagraph *)v8 paragraphContentRange] containsLocation:v6])
  {
    id v6 = [(NSTextRange *)[(NSTextParagraph *)v9 paragraphSeparatorRange] endLocation];
    if (objc_msgSend(v6, "compare:", objc_msgSend(a3, "endLocation")) != -1) {
      return 0;
    }
  }
  uint64_t v11 = objc_msgSend(-[NSTextLineFragment textLineFragmentRange](-[NSTextLayoutFragment textLineFragmentForTextLocation:isUpstreamAffinity:](v7, "textLineFragmentForTextLocation:isUpstreamAffinity:", v6, 0), "textLineFragmentRange"), "location");
  if (!v11) {
    uint64_t v11 = [(NSTextRange *)[(NSTextLayoutFragment *)v7 rangeInElement] location];
  }
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  unint64_t v23 = __Block_byref_object_dispose__2;
  uint64_t v24 = 0;
  uint64_t v12 = [(NSTextRange *)[(NSTextContentManager *)v5 documentRange] endLocation];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__NSTextLayoutManager__rangeForAllLinesContainingTextInRange___block_invoke;
  v18[3] = &unk_1E55C6010;
  v18[4] = v7;
  void v18[5] = a3;
  v18[6] = &v19;
  [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v12 options:1 usingBlock:v18];
  long long v13 = objc_msgSend((id)v20[5], "textLineFragmentForTextLocation:isUpstreamAffinity:", objc_msgSend(a3, "endLocation"), 1);
  if (v13) {
    uint64_t v14 = (void *)[v13 textLineFragmentRange];
  }
  else {
    uint64_t v14 = (void *)[(id)v20[5] rangeInElement];
  }
  uint64_t v15 = [v14 endLocation];
  double v16 = (NSTextRange *)[(id)v20[5] textParagraph];
  unint64_t v10 = v16;
  if (v16)
  {
    if ((objc_msgSend((id)-[NSTextRange paragraphContentRange](v16, "paragraphContentRange"), "containsLocation:", v15) & 1) == 0) {
      uint64_t v15 = objc_msgSend((id)-[NSTextRange paragraphContentRange](v10, "paragraphContentRange"), "endLocation");
    }
    unint64_t v10 = 0;
    if (v11 && v15) {
      unint64_t v10 = [[NSTextRange alloc] initWithLocation:v11 endLocation:v15];
    }
  }
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __62__NSTextLayoutManager__rangeForAllLinesContainingTextInRange___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) != a2
    && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "endLocation")) & 1) == 0&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location"), "compare:", objc_msgSend(*(id *)(a1 + 40), "endLocation")) != -1)
  {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a2;
  return result;
}

+ (int64_t)maximumNumberOfCachedTextLayoutFragments
{
  if (maximumNumberOfCachedTextLayoutFragments_onceToken != -1) {
    dispatch_once(&maximumNumberOfCachedTextLayoutFragments_onceToken, &__block_literal_global_162);
  }
  return maximumNumberOfCachedTextLayoutFragments_maxTextLayoutFragments;
}

uint64_t __63__NSTextLayoutManager_maximumNumberOfCachedTextLayoutFragments__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "integerForKey:", @"_NSTextLayoutManagerMaximumNumberOfCachedTextLayoutFragments");
  uint64_t v1 = 2000;
  if (result >= 1) {
    uint64_t v1 = result;
  }
  maximumNumberOfCachedTextLayoutFragments_maxTextLayoutFragments = v1;
  return result;
}

- (int64_t)maximumNumberOfCachedTextLayoutFragments
{
  if (self->_maximumNumberOfCachedTextLayoutFragments > 0) {
    return self->_maximumNumberOfCachedTextLayoutFragments;
  }
  id v3 = objc_opt_class();

  return [v3 maximumNumberOfCachedTextLayoutFragments];
}

- (void)setMaximumNumberOfCachedTextLayoutFragments:(int64_t)a3
{
  self->_maximumNumberOfCachedTextLayoutFragments = a3;
}

- (BOOL)flushTextLayoutFragmentsFromLocation:(id)a3 direction:(BOOL)a4
{
  BOOL v4 = a4;
  objc_sync_enter(self);
  unint64_t v7 = [(NSMapTable *)self->_textLayoutFragmentTable count];
  if (v7 > [(NSTextLayoutManager *)self maximumNumberOfCachedTextLayoutFragments])
  {
    uint64_t v8 = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange];
    if (v4)
    {
      id v9 = [(NSTextRange *)v8 location];
    }
    else
    {
      id v9 = a3;
      a3 = [(NSTextRange *)v8 endLocation];
    }
    if ([v9 compare:a3] == -1)
    {
      uint64_t v12 = [[NSTextRange alloc] initWithLocation:v9 endLocation:a3];
      __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange((id *)&self->super.isa, v12, 0);
      if ((self->_textContainerEntriesCount & 0x8000000000000000) != 0)
      {
        p_lastTextContainerEntrdouble y = ($12329A12E88B98FC1E4249E14A3806EA *)&self->_textContainerEntries[-1];
      }
      else
      {
        p_lastTextContainerEntrdouble y = &self->_lastTextContainerEntry;
        if (!self->_lastTextContainerEntry.textContainer) {
          goto LABEL_13;
        }
      }
      p_lastTextContainerEntry->BOOL containerFilled = 0;
LABEL_13:

      BOOL v10 = 1;
      goto LABEL_7;
    }
  }
  BOOL v10 = 0;
LABEL_7:
  objc_sync_exit(self);
  return v10;
}

uint64_t __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = NSString;
  v5.NSUInteger location = [a2 characterRange];
  return [v3 stringWithFormat:@"nil textRange for textLineFragment %@ %@", a2, NSStringFromRange(v5)];
}

uint64_t __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_5(uint64_t a1, void *a2)
{
  BOOL v4 = objc_msgSend((id)objc_msgSend(a2, "textLineFragments"), "lastObject");
  if (v4)
  {
    [v4 typographicBounds];
    double v7 = v5 + v6;
    [a2 layoutFragmentFrameOrigin];
    **(double **)(a1 + 32) = v8 + v7;
  }
  return 0;
}

- (void)enumerateTextSegmentAndCategoryInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
}

- (void)synchronize
{
  int v2 = [(NSTextLayoutManager *)self textContentManager];

  [(NSTextContentManager *)v2 synchronizeTextLayoutManagers:0];
}

- (void)replaceContentsInRange:(NSTextRange *)range withTextElements:(NSArray *)textElements
{
  double v6 = [(NSTextLayoutManager *)self textContentManager];

  [(NSTextContentManager *)v6 replaceContentsInRange:range withTextElements:textElements];
}

- (void)replaceContentsInRange:(NSTextRange *)range withAttributedString:(NSAttributedString *)attributedString
{
  id v6 = +[NSTextParagraph textParagraphsForAttributedString:range:](NSTextParagraph, "textParagraphsForAttributedString:range:", attributedString, 0, [(NSAttributedString *)attributedString length]);

  [(NSTextLayoutManager *)self replaceContentsInRange:range withTextElements:v6];
}

- (void)enumerateRenderingAttributesFromLocation:(id)location reverse:(BOOL)reverse usingBlock:(void *)block
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__NSTextLayoutManager_enumerateRenderingAttributesFromLocation_reverse_usingBlock___block_invoke;
  v5[3] = &unk_1E55C6140;
  v5[4] = block;
  [(NSTextLayoutManager *)self enumerateTemporaryAttributesFromLocation:location reverse:reverse usingBlock:v5];
}

uint64_t __83__NSTextLayoutManager_enumerateRenderingAttributesFromLocation_reverse_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a5 = result ^ 1;
  return result;
}

uint64_t __83__NSTextLayoutManager_enumerateTemporaryAttributesFromLocation_reverse_usingBlock___block_invoke(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t result = [a3 textRangeByIntersectingWithTextRange:*(void *)(*(void *)(a1[6] + 8) + 40)];
  if (result)
  {
    uint64_t v10 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v11 = [a3 textRangeByIntersectingWithTextRange:*(void *)(*(void *)(a1[6] + 8) + 40)];
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
    return v12(v9, v10, a2, v11, a4);
  }
  return result;
}

- (id)temporaryAttributesTable
{
  id result = self->_temporaryAttributesTable;
  if (!result)
  {
    id result = [(_NSTextRunStorage *)[_NSTextAttributeStorage alloc] initWithDataSource:self];
    self->_temporaryAttributesTable = (_NSTextAttributeStorage *)result;
  }
  return result;
}

- (void)setTemporaryAttributes:(id)a3 forTextRange:(id)a4
{
  objc_sync_enter(self);
  self->_isProcessingRenderingAttributesMethod = 1;
  if (objc_msgSend(-[NSTextLayoutManager temporaryAttributesTable](self, "temporaryAttributesTable"), "setAttributes:forTextRange:", a3, a4))
  {
    if (objc_msgSend((id)objc_msgSend(a4, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager", MEMORY[0x1E4F143A8], 3221225472, __59__NSTextLayoutManager_setTemporaryAttributes_forTextRange___block_invoke, &unk_1E55C6190, a3, a4), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a4, "location"), {
        0,
    }
        &v7);
    else {
      [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:a4 options:0 usingBlock:&v7];
    }
  }
  self->_isProcessingRenderingAttributesMethod = 0;
  objc_sync_exit(self);
}

uint64_t __59__NSTextLayoutManager_setTemporaryAttributes_forTextRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a3 textRangeByIntersectingWithTextRange:*(void *)(a1 + 40)];

  return [a2 layoutManagerDidSetTemporaryAttributes:v4 forTextRange:v5];
}

- (void)addTemporaryAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5
{
  objc_sync_enter(self);
  self->_isProcessingRenderingAttributesMethod = 1;
  if (objc_msgSend(-[NSTextLayoutManager temporaryAttributesTable](self, "temporaryAttributesTable"), "addAttribute:value:forTextRange:", a3, a4, a5))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__NSTextLayoutManager_addTemporaryAttribute_value_forTextRange___block_invoke;
    v9[3] = &unk_1E55C61B8;
    v9[4] = a3;
    void v9[5] = a4;
    v9[6] = a5;
    if (objc_msgSend((id)objc_msgSend(a5, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a5, "location"), 0, v9); {
    else
    }
      [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:a5 options:0 usingBlock:v9];
  }
  self->_isProcessingRenderingAttributesMethod = 0;
  objc_sync_exit(self);
}

uint64_t __64__NSTextLayoutManager_addTemporaryAttribute_value_forTextRange___block_invoke(void *a1, void *a2, void *a3)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[4];
  v6[0] = v3;
  return objc_msgSend(a2, "layoutManagerDidSetTemporaryAttributes:forTextRange:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1), objc_msgSend(a3, "textRangeByIntersectingWithTextRange:", a1[6]));
}

- (void)removeTemporaryAttribute:(id)a3 forTextRange:(id)a4
{
  objc_sync_enter(self);
  self->_isProcessingRenderingAttributesMethod = 1;
  if (objc_msgSend(-[NSTextLayoutManager temporaryAttributesTable](self, "temporaryAttributesTable"), "removeAttribute:forTextRange:", a3, a4))
  {
    if (objc_msgSend((id)objc_msgSend(a4, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager", MEMORY[0x1E4F143A8], 3221225472, __61__NSTextLayoutManager_removeTemporaryAttribute_forTextRange___block_invoke, &unk_1E55C6190, a3, a4), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a4, "location"), {
        0,
    }
        &v7);
    else {
      [(_NSTextLayoutFragmentStorage *)self->_textLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:a4 options:0 usingBlock:&v7];
    }
  }
  self->_isProcessingRenderingAttributesMethod = 0;
  objc_sync_exit(self);
}

uint64_t __61__NSTextLayoutManager_removeTemporaryAttribute_forTextRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1 + 32);
  v8[0] = [MEMORY[0x1E4F1CA98] null];
  return objc_msgSend(a2, "layoutManagerDidSetTemporaryAttributes:forTextRange:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), objc_msgSend(a3, "textRangeByIntersectingWithTextRange:", *(void *)(a1 + 40)));
}

- (void)invalidateTemporaryAttributesForTextRange:(id)a3
{
  objc_sync_enter(self);
  self->_isProcessingRenderingAttributesMethod = 1;
  objc_msgSend(-[NSTextLayoutManager temporaryAttributesTable](self, "temporaryAttributesTable"), "invalidateElementsInRange:delta:", a3, 0);
  self->_isProcessingRenderingAttributesMethod = 0;

  objc_sync_exit(self);
}

+ (NSDictionary)linkRenderingAttributes
{
  if (linkRenderingAttributes_onceToken != -1) {
    dispatch_once(&linkRenderingAttributes_onceToken, &__block_literal_global_183);
  }
  return (NSDictionary *)linkRenderingAttributes_defaultLinkAttributes;
}

uint64_t __46__NSTextLayoutManager_linkRenderingAttributes__block_invoke()
{
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    id v0 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:1];
  }
  else
  {
    id v0 = +[NSTextGraphicsContextProvider __defaultColorClass];
  }
  uint64_t v1 = [(objc_class *)v0 linkColor];
  id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t result = objc_msgSend(v2, "initWithObjectsAndKeys:", v1, @"NSColor", objc_msgSend(NSNumber, "numberWithInteger:", 1), @"NSUnderline", 0);
  linkRenderingAttributes_defaultLinkAttributes = result;
  return result;
}

+ (NSDictionary)linkRenderingAttributesForLabels
{
  if (linkRenderingAttributesForLabels_onceToken != -1) {
    dispatch_once(&linkRenderingAttributesForLabels_onceToken, &__block_literal_global_186);
  }
  return (NSDictionary *)linkRenderingAttributesForLabels_defaultLinkAttributes;
}

uint64_t __55__NSTextLayoutManager_linkRenderingAttributesForLabels__block_invoke()
{
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    id v0 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:1];
  }
  else
  {
    id v0 = +[NSTextGraphicsContextProvider __defaultColorClass];
  }
  uint64_t v1 = [(objc_class *)v0 linkColor];
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v1, @"NSColor", 0);
  linkRenderingAttributesForLabels_defaultLinkAttributes = result;
  return result;
}

- (NSDictionary)renderingAttributesForLink:(id)link atLocation:(id)location
{
  uint64_t v7 = (NSDictionary *)[(id)objc_opt_class() linkRenderingAttributes];
  id v8 = [(NSTextLayoutManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    uint64_t result = (NSDictionary *)[v8 textLayoutManager:self renderingAttributesForLink:link atLocation:location defaultAttributes:v7];
  }
  else {
    uint64_t result = (NSDictionary *)objc_msgSend(-[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:", location), "linkTextAttributes");
  }
  if (!result) {
    return v7;
  }
  return result;
}

- (id)adjustedTextSelectionsForEditingContextFromTextSelections:(id)a3
{
  [(NSTextLayoutManager *)self textContentManager];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(NSTextLayoutManager *)self textContentManager];
  if (!-[NSTextContentManager adjustedRangeFromRange:forEditingTextSelection:](v5, "adjustedRangeFromRange:forEditingTextSelection:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "textRanges"), "lastObject"), 1))return 0; {
  id v6 = (id)[a3 mutableCopy];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __81__NSTextLayoutManager_adjustedTextSelectionsForEditingContextFromTextSelections___block_invoke;
  v8[3] = &unk_1E55C61E0;
  v8[4] = v5;
  void v8[5] = v6;
  [a3 enumerateObjectsWithOptions:2 usingBlock:v8];
  return v6;
}

void __81__NSTextLayoutManager_adjustedTextSelectionsForEditingContextFromTextSelections___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = (void *)[a2 textRanges];
  uint64_t v9 = [v8 count];
  uint64_t v10 = (void *)MEMORY[0x192FAE510]();
  if (v9 < 1) {
    goto LABEL_9;
  }
  uint64_t v11 = 0;
  unint64_t v12 = v9 + 1;
  do
  {
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "adjustedRangeFromRange:forEditingTextSelection:", objc_msgSend(v8, "objectAtIndexedSubscript:", v12 - 2), 1);
    if (!v13) {
      break;
    }
    uint64_t v14 = v13;
    if (!v11) {
      uint64_t v11 = (void *)[v8 mutableCopy];
    }
    [v11 replaceObjectAtIndex:v12 - 2 withObject:v14];
    --v12;
  }
  while (v12 > 1);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a3, objc_msgSend(a2, "textSelectionWithTextRanges:", v11));
  }
  else
  {
LABEL_9:
    *a4 = 1;
  }
}

- (void)setTextSelectionNavigation:(NSTextSelectionNavigation *)textSelectionNavigation
{
  objc_sync_enter(self);
  uint64_t v5 = self->_textSelectionNavigation;
  if (v5 != textSelectionNavigation)
  {

    self->_textSelectionNavigation = textSelectionNavigation;
  }

  objc_sync_exit(self);
}

- (id)_textRangeForDoubleClickAtLocation:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__2;
  unint64_t v12 = __Block_byref_object_dispose__2;
  uint64_t v13 = 0;
  uint64_t v4 = [(NSTextLayoutManager *)self textContentManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NSTextLayoutManager__textRangeForDoubleClickAtLocation___block_invoke;
  v7[3] = &unk_1E55C6230;
  v7[4] = a3;
  v7[5] = &v8;
  [(NSTextContentManager *)v4 enumerateTextElementsFromLocation:a3 options:0 usingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __58__NSTextLayoutManager__textRangeForDoubleClickAtLocation___block_invoke(uint64_t a1, void *a2)
{
  int v4 = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "containsLocation:", *(void *)(a1 + 32));
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (void *)[a2 attributedString];
      CFIndex v6 = [a2 rangeForLocation:*(void *)(a1 + 32) allowsTrailingEdge:0];
      CFStringRef v7 = (const __CFString *)[v5 attribute:NSLanguageAttributeName atIndex:v6 effectiveRange:0];
      if (v7)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        if (isKindOfClass) {
          CFStringRef v7 = (const __CFString *)CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7);
        }
        else {
          CFStringRef v7 = 0;
        }
      }
      else
      {
        CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      }
      CFStringRef v10 = (const __CFString *)[v5 string];
      v18.CFIndex length = [v5 length];
      v18.CFIndex location = 0;
      uint64_t v11 = CFStringTokenizerCreate(v9, v10, v18, 4uLL, (CFLocaleRef)v7);
      CFStringTokenizerGoToTokenAtIndex(v11, v6);
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
      CFRelease(v11);
      if (v7) {
        CFRelease(v7);
      }
      if (CurrentTokenRange.length <= 0) {
        CFIndex length = 0;
      }
      else {
        CFIndex length = CurrentTokenRange.length;
      }
      if (CurrentTokenRange.length <= 0) {
        CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        CFIndex location = CurrentTokenRange.location;
      }
      if (length)
      {
        uint64_t v15 = [a2 locationForCharacterIndex:location dataSourceLocationsOnly:0 actualRange:0];
        uint64_t v16 = [a2 locationForCharacterIndex:location + length dataSourceLocationsOnly:0 actualRange:0];
        if (v15)
        {
          if (v16) {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[NSTextRange alloc] initWithLocation:v15 endLocation:v16];
          }
        }
      }
    }
  }
  return v4 ^ 1u;
}

- (id)textRangeForSelectionGranularity:(int64_t)a3 enclosingLocation:(id)a4
{
  id v21 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000;
  CFRange v18 = __Block_byref_object_copy__2;
  uint64_t v19 = __Block_byref_object_dispose__2;
  uint64_t v20 = 0;
  if (a3 == 1)
  {
    id v7 = [(NSTextLayoutManager *)self _textRangeForDoubleClickAtLocation:a4];
  }
  else
  {
    if ((unint64_t)(a3 - 2) > 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = qword_18E5F7460[a3 - 2];
    }
    id v7 = +[NSTextSelectionNavigation _substringRangeForEnumerationType:v8 location:a4 dataSource:self string:0 enclosingRange:&v21];
  }
  id v9 = v7;
  CFStringRef v10 = v16;
  v16[5] = (uint64_t)v9;
  if (a3 && !v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__NSTextLayoutManager_textRangeForSelectionGranularity_enclosingLocation___block_invoke;
    v14[3] = &unk_1E55C59E0;
    v14[4] = a4;
    void v14[5] = &v15;
    [(NSTextLayoutManager *)self enumerateSubstringsFromLocation:a4 options:514 usingBlock:v14];
    CFStringRef v10 = v16;
  }
  id v11 = (id)v10[5];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {

    id v11 = v21;
    v16[5] = (uint64_t)v11;
  }
  id v12 = v11;
  _Block_object_dispose(&v15, 8);
  return v12;
}

id __74__NSTextLayoutManager_textRangeForSelectionGranularity_enclosingLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id result = (id)[a3 containsLocation:*(void *)(a1 + 32)];
  if (result)
  {
    id result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  *a5 = 1;
  return result;
}

- (id)_copyTextLineFragmentRangeForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 pointPlacement:(unint64_t *)a5
{
  double y = a3.y;
  double x = a3.x;
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, a4);
  if (TextContainerEntryAndIndexForLocation) {
    uint64_t v10 = *((void *)TextContainerEntryAndIndexForLocation + 7);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v42 = 0;
  double v43 = &v42;
  uint64_t v44 = 0x3052000000;
  uint64_t v45 = __Block_byref_object_copy__2;
  uint64_t v46 = __Block_byref_object_dispose__2;
  uint64_t v47 = 0;
  id v11 = [(NSTextLayoutManager *)self textViewportLayoutController];
  *a5 = 0;
  [(NSTextViewportLayoutController *)v11 viewportBounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v48.double x = x;
  v48.double y = y;
  v49.origin.double x = v13;
  v49.origin.double y = v15;
  v49.size.CGFloat width = v17;
  v49.size.CGFloat height = v19;
  if (NSPointInRect(v48, v49)
    && (id v20 = -[NSTextViewportLayoutController textViewportElementAtPoint:](v11, "textViewportElementAtPoint:", x, y),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & (v20 != 0)) != 0)
    || (id v20 = -[NSTextLayoutManager textLayoutFragmentForPosition:inTextContainerAtIndex:](self, "textLayoutFragmentForPosition:inTextContainerAtIndex:", v10, x, y)) != 0)
  {
    [v20 layoutFragmentFrameOrigin];
    double v22 = v21;
    double v24 = v23;
    uint64_t v38 = 0;
    uint64_t v39 = (double *)&v38;
    uint64_t v40 = 0x2020000000;
    unint64_t v41 = 0xBFF0000000000000;
    uint64_t v34 = 0;
    unint64_t v35 = (double *)&v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0x7FEFFFFFFFFFFFFFLL;
    unint64_t v25 = (void *)[v20 textLineFragments];
    double v26 = y - v24;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __95__NSTextLayoutManager__copyTextLineFragmentRangeForPoint_inContainerAtLocation_pointPlacement___block_invoke;
    v32[3] = &unk_1E55C6258;
    v32[4] = &v38;
    v32[5] = &v34;
    *(double *)&v32[8] = x - v22;
    *(double *)&v32[9] = v26;
    v32[6] = &v42;
    v32[7] = v33;
    [v25 enumerateObjectsUsingBlock:v32];
    uint64_t v27 = v43;
    if (!v43[5])
    {
      if (v26 < v39[3])
      {
        id v28 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "textLineFragments"), "firstObject"), "textLineFragmentRange");
        unint64_t v29 = 2;
LABEL_13:
        uint64_t v27 = v43;
        v43[5] = (uint64_t)v28;
        *a5 = v29;
        goto LABEL_14;
      }
      if (v26 >= v35[3])
      {
        id v28 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "textLineFragments"), "lastObject"), "textLineFragmentRange");
        unint64_t v29 = 4;
        goto LABEL_13;
      }
    }
LABEL_14:
    unint64_t v30 = (void *)v27[5];
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    goto LABEL_15;
  }
  unint64_t v30 = 0;
LABEL_15:
  _Block_object_dispose(&v42, 8);
  return v30;
}

id __95__NSTextLayoutManager__copyTextLineFragmentRangeForPoint_inContainerAtLocation_pointPlacement___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = (id)[a2 typographicBounds];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  double v13 = *(double *)(v12 + 24);
  if (v13 < 0.0 || v13 < v9) {
    *(double *)(v12 + 24) = v9;
  }
  double v15 = v9 + v11;
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v15 > *(double *)(v16 + 24)) {
    *(double *)(v16 + 24) = v15;
  }
  double v17 = *(double *)(a1 + 72);
  if (v17 >= v9)
  {
    if (v17 >= v15) {
      return result;
    }
    double v18 = *(double *)(a1 + 64);
    if (v18 >= v8)
    {
      double v20 = v8 + v10;
      if (v20 > v18)
      {
LABEL_16:
        id result = (id)[a2 textLineFragmentRange];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
        goto LABEL_20;
      }
      double v19 = v18 - v20;
    }
    else
    {
      double v19 = v8 - v18;
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v19 < *(double *)(v21 + 24))
    {
      *(double *)(v21 + 24) = v19;

      id result = (id)[a2 textLineFragmentRange];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
      return result;
    }
  }
  else if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    goto LABEL_16;
  }
LABEL_20:
  *a4 = 1;
  return result;
}

- (id)lineFragmentRangeForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4
{
  uint64_t v5 = 0;
  return -[NSTextLayoutManager _copyTextLineFragmentRangeForPoint:inContainerAtLocation:pointPlacement:](self, "_copyTextLineFragmentRangeForPoint:inContainerAtLocation:pointPlacement:", a4, &v5, a3.x, a3.y);
}

- (unint64_t)placementOfPoint:(CGPoint)a3 inContainerAtLocation:(id)a4
{
  unint64_t v5 = 0;

  return v5;
}

- (void)enumerateContainerBoundariesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  p_lastTextContainerEntrdouble y = &self->_lastTextContainerEntry;
  if (self->_lastTextContainerEntry.textContainer) {
    int64_t textContainerEntriesCount = self->_textContainerEntriesCount + 1;
  }
  else {
    int64_t textContainerEntriesCount = self->_textContainerEntriesCount;
  }
  if (textContainerEntriesCount < 2)
  {
    double v18 = [(NSTextContentManager *)[(NSTextLayoutManager *)self textContentManager] documentRange];
    char v20 = 0;
    if (v6) {
      uint64_t v19 = [(NSTextRange *)v18 location];
    }
    else {
      uint64_t v19 = [(NSTextRange *)v18 endLocation];
    }
    (*((void (**)(id, uint64_t, char *))a5 + 2))(a5, v19, &v20);
  }
  else
  {
    TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, a3);
    if (TextContainerEntryAndIndexForLocation)
    {
      int64_t v11 = *((void *)TextContainerEntryAndIndexForLocation + 7);
      if ((v11 & 0x8000000000000000) == 0 && v11 < textContainerEntriesCount)
      {
        if (v6)
        {
          int64_t textContainerEntriesCount = -1;
          uint64_t v12 = -1;
        }
        else
        {
          uint64_t v12 = 1;
        }
        char v21 = 0;
        unint64_t v13 = v12 + v11;
        uint64_t v14 = v12 + v11;
        do
        {
          double v15 = (void *)*((void *)TextContainerEntryAndIndexForLocation + 2);
          if (v6) {
            uint64_t v16 = [v15 location];
          }
          else {
            uint64_t v16 = [v15 endLocation];
          }
          (*((void (**)(id, uint64_t, char *))a5 + 2))(a5, v16, &v21);
          if (v21) {
            break;
          }
          if (self->_textContainerEntriesCount <= v13) {
            TextContainerEntryAndIndexForLocation = p_lastTextContainerEntry->textContainer
          }
                                                  ? (char *)p_lastTextContainerEntry
                                                  : 0;
          else {
            TextContainerEntryAndIndexForLocation = (char *)&self->_textContainerEntries[v14];
          }
          BOOL v17 = !TextContainerEntryAndIndexForLocation || textContainerEntriesCount == v13;
          v13 += v12;
          v14 += v12;
        }
        while (!v17);
      }
    }
  }
}

- (int64_t)textLayoutOrientationAtLocation:(id)a3
{
  int64_t result = [(NSTextLayoutManager *)self textContainerForLocation:a3];
  if (result)
  {
    return [(id)result layoutOrientation];
  }
  return result;
}

uint64_t __54__NSTextLayoutManager_baseWritingDirectionAtLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (objc_opt_isKindOfClass()) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  }
  return 0;
}

BOOL __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = (void *)[a2 paragraphContentRange];
    unint64_t v5 = v4;
    if (*(void *)(a1 + 56) == 1)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (!*(unsigned char *)(a1 + 72))
        {
          uint64_t v14 = (void *)[a2 paragraphSeparatorRange];
          double v15 = v14;
          if (v14)
          {
            if (([v14 isEmpty] & 1) == 0
              && !objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(v15, "location")))
            {
              goto LABEL_18;
            }
          }
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
        && objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend((id)objc_msgSend(a2, "paragraphSeparatorRange"), "location"))&& (*(unsigned char *)(a1 + 65) & 2) == 0)
      {
        objc_msgSend((id)objc_msgSend(a2, "attributedString"), "string");
      }
      if (objc_msgSend((id)objc_msgSend(a2, "childElements"), "count"))
      {
        double v8 = (void *)[a2 paragraphSeparatorRange];
        double v9 = v5;
        if (v8)
        {
          double v10 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [v5 location], objc_msgSend(v8, "endLocation"));
LABEL_17:
          int64_t v11 = v10;
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

          goto LABEL_18;
        }
      }
      else
      {
        double v9 = (void *)[a2 elementRange];
      }
      double v10 = v9;
      goto LABEL_17;
    }
    if (![v4 isEmpty] || *(void *)(a1 + 56) != 3)
    {
      uint64_t v6 = *(void *)(a1 + 64);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_5;
      v16[3] = &unk_1E55C62F8;
      uint64_t v7 = *(void *)(a1 + 32);
      v16[4] = *(void *)(a1 + 40);
      v16[5] = &v17;
      [a2 enumerateSubstringsFromLocation:v7 options:v6 usingBlock:v16];
    }
  }
LABEL_18:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  BOOL v12 = *((unsigned char *)v18 + 24) == 0;
  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a5;
  return result;
}

- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__NSTextLayoutManager_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke;
  v5[3] = &unk_1E55C6370;
  v5[4] = a5;
  [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:a3 options:a4 | 8 usingBlock:v5];
}

BOOL __80__NSTextLayoutManager_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = 0;
  if (!a2) {
    return 1;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v3 == 0;
}

- (id)_textViewRespondingToSelector:(SEL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v3 = [(NSTextLayoutManager *)self textContainers];
  id result = (id)[(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = (void *)[*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) textView];
        if (objc_opt_respondsToSelector()) {
          return v8;
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id result = (id)[(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      id v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)_textSelectionsFromTextView
{
  v3[1] = *MEMORY[0x1E4F143B8];
  id result = [(NSTextLayoutManager *)self _textViewRespondingToSelector:sel__textSelection];
  if (result)
  {
    id result = (id)[result _textSelection];
    if (result)
    {
      v3[0] = result;
      return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
    }
  }
  return result;
}

- (BOOL)_shouldDrawTextCorrectionMarkerWithType:(int64_t)a3 inRange:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    double v26 = __71__NSTextLayoutManager__shouldDrawTextCorrectionMarkerWithType_inRange___block_invoke;
    uint64_t v27 = &unk_1E55C6398;
    id v28 = a4;
    unint64_t v29 = self;
    id v5 = [(NSTextLayoutManager *)self textSelections];
    if (v5
      || (v6 = [(NSTextLayoutManager *)self _textSelectionsFromTextView], (id v5 = v6) != 0))
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v6 = (NSArray *)[(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v6)
      {
        uint64_t v7 = (uint64_t)v6;
        uint64_t v8 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v22 != v8) {
              objc_enumerationMutation(v5);
            }
            long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            long long v17 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            long long v11 = objc_msgSend(v10, "textRanges", 0);
            uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v30 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v18;
LABEL_11:
              uint64_t v15 = 0;
              while (1)
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                if (v26((uint64_t)v25, *(void **)(*((void *)&v17 + 1) + 8 * v15))) {
                  goto LABEL_20;
                }
                if (v13 == ++v15)
                {
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v30 count:16];
                  if (v13) {
                    goto LABEL_11;
                  }
                  break;
                }
              }
            }
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
          LOBYTE(v6) = 0;
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
LABEL_20:
    LOBYTE(v6) = 1;
  }
  return (char)v6;
}

uint64_t __71__NSTextLayoutManager__shouldDrawTextCorrectionMarkerWithType_inRange___block_invoke(uint64_t a1, void *a2)
{
  if (textRangesAreConnected(a2, *(void **)(a1 + 32))) {
    return 1;
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  uint64_t v17 = 0;
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = [a2 location];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__NSTextLayoutManager__shouldDrawTextCorrectionMarkerWithType_inRange___block_invoke_2;
  v11[3] = &unk_1E55C59B8;
  v11[4] = &v12;
  [v5 enumerateSubstringsFromLocation:v6 options:771 usingBlock:v11];
  BOOL v4 = 0;
  if (v13[5])
  {
    uint64_t v7 = [NSTextRange alloc];
    uint64_t v8 = -[NSTextRange initWithLocation:endLocation:](v7, "initWithLocation:endLocation:", v13[5], [a2 endLocation]);
    BOOL v9 = textRangesAreConnected(v8, *(void **)(a1 + 32));

    if (v9) {
      BOOL v4 = 1;
    }
  }
  _Block_object_dispose(&v12, 8);
  return v4;
}

id __71__NSTextLayoutManager__shouldDrawTextCorrectionMarkerWithType_inRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id result = (id)[a3 location];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)attributedStringForTruncatedRange:(id)a3 defaultAttributedString:(id)a4
{
  id v7 = [(NSTextLayoutManager *)self delegate];
  if (self->_delegateWithTruncationToken) {
    id result = (id)[v7 textLayoutManager:self attributedStringForTruncatedRange:a3 defaultAttributedString:a4];
  }
  else {
    id result = 0;
  }
  if (!result) {
    return a4;
  }
  return result;
}

+ (BOOL)shouldBeUsedForNSTextView
{
  if (shouldBeUsedForNSTextView_once != -1) {
    dispatch_once(&shouldBeUsedForNSTextView_once, &__block_literal_global_205);
  }
  return shouldBeUsedForNSTextView_result;
}

uint64_t __48__NSTextLayoutManager_shouldBeUsedForNSTextView__block_invoke()
{
  id v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSUsesTextLayoutManager");
  if (v0) {
    uint64_t result = [v0 BOOLValue];
  }
  else {
    uint64_t result = 1;
  }
  shouldBeUsedForNSTextView_uint64_t result = result;
  return result;
}

+ (double)_textHighlightBackgroundColorPercentage
{
  if (_textHighlightBackgroundColorPercentage_onceToken != -1) {
    dispatch_once(&_textHighlightBackgroundColorPercentage_onceToken, &__block_literal_global_210);
  }
  return *(double *)&_textHighlightBackgroundColorPercentage_percentage;
}

uint64_t __62__NSTextLayoutManager__textHighlightBackgroundColorPercentage__block_invoke()
{
  id v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "valueForKey:", @"_NSTextHighlightBackgroundColorPercentage");
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = [v0 doubleValue];
    _textHighlightBackgroundColorPercentage_percentage = v2;
  }
  return result;
}

- (id)textHighlightRenderingAttributesForTextRange:(id)a3 attributes:(id)a4
{
  uint64_t v7 = [a4 objectForKeyedSubscript:@"NSTextHighlightStyle"];
  if (!v7) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  uint64_t v8 = (void *)v7;
  id v9 = [(NSTextLayoutManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v9 textLayoutManager:self textHighlightRenderingAttributesForTextRange:a3 attributes:a4];
LABEL_7:
    id v11 = (id)v10;
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v9 textLayoutManager:self textHighlightAttributesForTextRange:a3 highlightStyle:v8];
    goto LABEL_7;
  }
  id v11 = 0;
LABEL_9:
  if (![v11 count])
  {
    id v11 = (id)objc_msgSend(-[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:", objc_msgSend(a3, "location")), "textHighlightRenderingAttributesForAttributes:", a4);
    if (![v11 count])
    {
      int64_t v12 = [(NSTextLayoutManager *)self applicationFrameworkContext];
      uint64_t v13 = objc_opt_class();
      if (v12 == 1) {
        uint64_t v14 = objc_msgSend(v13, "textHighlightAttributes_iOS");
      }
      else {
        uint64_t v14 = objc_msgSend(v13, "textHighlightAttributes_macOS");
      }
      id v11 = (id)v14;
    }
    if (([(id)objc_opt_class() _usesOutlinedHighlightByDefault] & 1) == 0
      && ([v8 isEqualToString:@"NSTextHighlightStyleOutlined"] & 1) == 0
      && [v11 objectForKeyedSubscript:@"NSTextHighlightOutlineColor"])
    {
      objc_sync_enter(self);
      if ([(id)textHighlightRenderingAttributesForTextRange_attributes__baseAttributes isEqualToDictionary:v11])
      {
        uint64_t v15 = (void *)textHighlightRenderingAttributesForTextRange_attributes__attributesWithoutOutline;
      }
      else
      {
        uint64_t v15 = (void *)[v11 mutableCopy];
        [v15 removeObjectForKey:@"NSTextHighlightOutlineColor"];

        textHighlightRenderingAttributesForTextRange_attributes__baseAttributes = (uint64_t)v11;
        textHighlightRenderingAttributesForTextRange_attributes__attributesWithoutOutline = (uint64_t)v15;
      }
      id v11 = v15;
      objc_sync_exit(self);
    }
  }
  return v11;
}

- (NSTextHighlightShapeProvider)_textHighlightShapeProvider
{
  objc_sync_enter(self);
  textHighlightShapeProvider = self->_textHighlightShapeProvider;
  if (!textHighlightShapeProvider)
  {
    textHighlightShapeProvider = [[NSTextHighlightShapeProvider alloc] initWithTextLayoutManager:self];
    self->_textHighlightShapeProvider = textHighlightShapeProvider;
  }
  objc_sync_exit(self);
  return textHighlightShapeProvider;
}

- (void)drawTextHighlightBackgroundForRunTextRanges:(id)a3 attributes:(id)a4 documentRange:(id)a5 origin:(CGPoint)a6 context:(CGContext *)a7
{
  if (a7)
  {
    CGFloat y = a6.y;
    CGFloat x = a6.x;
    uint64_t v13 = [a3 count];
    if (v13 == [a4 count])
    {
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3052000000;
      v16[3] = __Block_byref_object_copy__2;
      v16[4] = __Block_byref_object_dispose__2;
      uint64_t v17 = 0;
      uint64_t v17 = [a4 copy];
      uint64_t v14 = [(NSTextLayoutManager *)self _textHighlightShapeProvider];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __107__NSTextLayoutManager_drawTextHighlightBackgroundForRunTextRanges_attributes_documentRange_origin_context___block_invoke;
      void v15[3] = &unk_1E55C63E8;
      v15[4] = self;
      void v15[5] = a3;
      void v15[6] = v16;
      v15[7] = a7;
      *(CGFloat *)&v15[8] = x;
      *(CGFloat *)&v15[9] = y;
      [(NSTextHighlightShapeProvider *)v14 enumerateHighlightShapesForRunClusterWithRanges:a3 usingBlock:v15];
      _Block_object_dispose(v16, 8);
    }
  }
}

void __107__NSTextLayoutManager_drawTextHighlightBackgroundForRunTextRanges_attributes_documentRange_origin_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "textHighlightRenderingAttributesForTextRange:attributes:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a4), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", a4));
  uint64_t v8 = [v7 objectForKeyedSubscript:@"NSBackgroundColor"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"NSTextHighlightOutlineColor"];
  if (v8
    || ((uint64_t v10 = [v7 objectForKeyedSubscript:@"NSColor"],
         uint64_t v11 = [*(id *)(a1 + 32) applicationFrameworkContext],
         int64_t v12 = objc_opt_class(),
         v11 != 1)
      ? (uint64_t v13 = objc_msgSend(v12, "textHighlightBackgroundColorForForegroundColor_macOS:", v10))
      : (uint64_t v13 = objc_msgSend(v12, "textHighlightBackgroundColorForForegroundColor_iOS:", v10)),
        uint64_t v8 = v13,
        v13 | v9))
  {
    uint64_t v14 = [[_NSCGTextGraphicsContext alloc] initWithCGContext:*(void *)(a1 + 56)];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __107__NSTextLayoutManager_drawTextHighlightBackgroundForRunTextRanges_attributes_documentRange_origin_context___block_invoke_2;
    v16[3] = &unk_1E55C63C0;
    uint64_t v15 = *(void *)(a1 + 56);
    void v16[5] = v9;
    void v16[6] = v15;
    long long v17 = *(_OWORD *)(a1 + 64);
    v16[4] = v8;
    uint64_t v18 = a2;
    uint64_t v19 = a3;
    +[NSTextGraphicsContextProvider setCurrentTextGraphicsContext:v14 duringBlock:v16];
  }
}

void __107__NSTextLayoutManager_drawTextHighlightBackgroundForRunTextRanges_attributes_documentRange_origin_context___block_invoke_2(uint64_t a1)
{
  CGContextSaveGState(*(CGContextRef *)(a1 + 48));
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 set];
    CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 72));
    CGContextFillPath(*(CGContextRef *)(a1 + 48));
  }
  char v3 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 set];
    CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 80));
    CGContextStrokePath(*(CGContextRef *)(a1 + 48));
  }
  BOOL v4 = *(CGContext **)(a1 + 48);

  CGContextRestoreGState(v4);
}

- (void)drawTextHighlightBackgroundForTextRange:(id)a3 attributes:(id)a4 options:(unint64_t)a5 origin:(CGPoint)a6 context:(CGContext *)a7
{
  double y = a6.y;
  double x = a6.x;
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 1, a5);
  id v14 = a4;
  -[NSTextLayoutManager drawTextHighlightBackgroundForRunTextRanges:attributes:documentRange:origin:context:](self, "drawTextHighlightBackgroundForRunTextRanges:attributes:documentRange:origin:context:", v13, [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1], a3, a7, x, y);
}

- (void)drawTextHighlightBackgroundForTextRange:(id)a3 highlightStyle:(id)a4 options:(unint64_t)a5 origin:(CGPoint)a6 context:(CGContext *)a7
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"NSTextHighlightStyle";
  v8[0] = a4;
  -[NSTextLayoutManager drawTextHighlightBackgroundForTextRange:attributes:options:origin:context:](self, "drawTextHighlightBackgroundForTextRange:attributes:options:origin:context:", a3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1], a5, a7, a6.x, a6.y);
}

+ (BOOL)_usesOutlinedHighlightByDefault
{
  if (_usesOutlinedHighlightByDefault_onceToken != -1) {
    dispatch_once(&_usesOutlinedHighlightByDefault_onceToken, &__block_literal_global_223);
  }
  return _usesOutlinedHighlightByDefault_usesOutlinedHighlightByDefault;
}

uint64_t __54__NSTextLayoutManager__usesOutlinedHighlightByDefault__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"_NSTextLayoutManagerUsesOutlinedHighlight");
  _usesOutlinedHighlightByDefault_usesOutlinedHighlightByDefault = result;
  return result;
}

- (BOOL)_adjustedTextLayoutFragmentBoundaryTextRangeForTextRange:(id)a3 location:(id *)a4 endLocation:(id *)a5
{
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3052000000;
  long long v22 = __Block_byref_object_copy__2;
  long long v23 = __Block_byref_object_dispose__2;
  uint64_t v24 = 0;
  uint64_t v9 = [a3 location];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__NSTextLayoutManager__adjustedTextLayoutFragmentBoundaryTextRangeForTextRange_location_endLocation___block_invoke;
  v18[3] = &unk_1E55C5E30;
  v18[4] = &v19;
  [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v9 options:0 usingBlock:v18];
  uint64_t v10 = v20[5];
  if (v10)
  {
    uint64_t v11 = (void *)[(id)v20[5] rangeInElement];
    if (objc_msgSend((id)objc_msgSend(v11, "location"), "isEqual:", objc_msgSend(a3, "location"))) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = (void *)[v11 location];
    }
    uint64_t v13 = objc_msgSend((id)objc_msgSend(v11, "endLocation"), "compare:", objc_msgSend(a3, "endLocation"));
    if (v13 == -1)
    {
      void v20[5] = 0;
    }
    else if (v13 == 1)
    {
      id v14 = (void *)[v11 endLocation];
      if (v14)
      {
LABEL_14:
        *a4 = v12;
        *a5 = v14;
        goto LABEL_15;
      }
    }
    if (v20[5])
    {
      id v14 = 0;
    }
    else
    {
      uint64_t v15 = [a3 endLocation];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __101__NSTextLayoutManager__adjustedTextLayoutFragmentBoundaryTextRangeForTextRange_location_endLocation___block_invoke_2;
      v17[3] = &unk_1E55C5E58;
      v17[4] = a3;
      v17[5] = &v19;
      [(NSTextLayoutManager *)self enumerateTextLayoutFragmentsFromLocation:v15 options:1 usingBlock:v17];
      id v14 = (void *)v20[5];
      if (v14) {
        id v14 = objc_msgSend((id)objc_msgSend(v14, "rangeInElement"), "endLocation");
      }
    }
    goto LABEL_14;
  }
LABEL_15:
  _Block_object_dispose(&v19, 8);
  return v10 != 0;
}

uint64_t __101__NSTextLayoutManager__adjustedTextLayoutFragmentBoundaryTextRangeForTextRange_location_endLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  return 0;
}

uint64_t __101__NSTextLayoutManager__adjustedTextLayoutFragmentBoundaryTextRangeForTextRange_location_endLocation___block_invoke_2(uint64_t a1, void *a2)
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "endLocation")) & 1) == 0)*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2; {
  return 0;
  }
}

- (void)_invalidateTextAnimationContextForTextRange:(id)a3 reason:(int64_t)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  textAnimationContextStorage = self->_textAnimationContextStorage;
  uint64_t v8 = [a3 location];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__NSTextLayoutManager__invalidateTextAnimationContextForTextRange_reason___block_invoke;
  v10[3] = &unk_1E55C6410;
  v10[4] = a3;
  v10[5] = v6;
  [(_NSTextRunStorage *)textAnimationContextStorage enumerateObjectsFromLocation:v8 options:2 usingBlock:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__NSTextLayoutManager__invalidateTextAnimationContextForTextRange_reason___block_invoke_2;
  v9[3] = &unk_1E55C6438;
  v9[4] = self;
  [v6 enumerateObjectsUsingBlock:v9];
}

uint64_t __74__NSTextLayoutManager__invalidateTextAnimationContextForTextRange_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "enclosingTextRange"), "location"), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation"));
  if (result == -1)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    return [v8 addObject:a2];
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

uint64_t __74__NSTextLayoutManager__invalidateTextAnimationContextForTextRange_reason___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 _overridden];
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 136);
  uint64_t v5 = [a2 enclosingTextRange];

  return [v4 setObject:0 forRange:v5];
}

- (BOOL)_addTextAnimationContext:(id)a3
{
  objc_sync_enter(self);
  uint64_t v5 = (void *)[a3 enclosingTextRange];
  if (v5)
  {
    long long v12 = 0uLL;
    if ([(NSTextLayoutManager *)self _adjustedTextLayoutFragmentBoundaryTextRangeForTextRange:v5 location:(char *)&v12 + 8 endLocation:&v12])
    {
      if (v12 == 0)
      {
        uint64_t v8 = v5;
      }
      else
      {
        id v6 = [NSTextRange alloc];
        uint64_t v7 = *((void *)&v12 + 1);
        if (!*((void *)&v12 + 1)) {
          uint64_t v7 = [v5 location];
        }
        if (!(void)v12) {
          [v5 endLocation];
        }
        uint64_t v8 = -[NSTextRange initWithLocation:endLocation:](v6, "initWithLocation:endLocation:", v7);
      }
      uint64_t v9 = v8;
      if ([(NSTextRange *)v8 isNotEmpty])
      {
        if (self->_textAnimationContextStorage)
        {
          [(NSTextLayoutManager *)self _invalidateTextAnimationContextForTextRange:v9 reason:1];
          textAnimationContextStorage = self->_textAnimationContextStorage;
        }
        else
        {
          textAnimationContextStorage = [[_NSTextRunStorage alloc] initWithDataSource:self];
          self->_textAnimationContextStorage = textAnimationContextStorage;
        }
        [(_NSTextRunStorage *)textAnimationContextStorage setObject:a3 forRange:v9];
        objc_msgSend(a3, "_updateEnclosingLocation:endLocation:", -[NSTextRange location](v9, "location"), -[NSTextRange endLocation](v9, "endLocation"));
      }
    }
  }
  objc_sync_exit(self);
  return 1;
}

- (void)_removeTextAnimationContext:(id)a3
{
  objc_sync_enter(self);
  -[_NSTextRunStorage setObject:forRange:](self->_textAnimationContextStorage, "setObject:forRange:", 0, [a3 enclosingTextRange]);

  objc_sync_exit(self);
}

uint64_t __56__NSTextLayoutManager__textAnimationContextForLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "enclosingTextRange"), "containsLocation:", *(void *)(a1 + 32));
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  }
  *a4 = 1;
  return result;
}

- (id)isSelectionOverridableColor
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setIsSelectionOverridableColor:(id)a3
{
}

- (void)renderingAttributesValidator
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setRenderingAttributesValidator:(void *)renderingAttributesValidator
{
}

- (void)setRendersBackgroundColorAttribute:(BOOL)a3
{
  self->_rendersBackgroundColorAttribute = a3;
}

- (void)setTemplateTextContainer:(id)a3
{
}

- (NSOperationQueue)layoutQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 296, 1);
}

- (void)setLayoutQueue:(NSOperationQueue *)layoutQueue
{
}

+ (id)textHighlightAttributes_iOS
{
  if (textHighlightAttributes_iOS_onceToken != -1) {
    dispatch_once(&textHighlightAttributes_iOS_onceToken, &__block_literal_global_17);
  }
  id v2 = (id)textHighlightAttributes_iOS_attributes;

  return v2;
}

id __79__NSTextLayoutManager_UIFoundation_UIKitAdditions__textHighlightAttributes_iOS__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    id v0 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:1];
  }
  else
  {
    id v0 = +[NSTextGraphicsContextProvider __defaultColorClass];
  }
  uint64_t v1 = v0;
  v3[0] = @"NSColor";
  v3[1] = @"NSTextHighlightOutlineColor";
  v4[0] = [(objc_class *)v0 selectionHighlightColor];
  v4[1] = [(objc_class *)v1 secondaryLabelColor];
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  textHighlightAttributes_iOS_attributes = (uint64_t)result;
  return result;
}

+ (id)textHighlightBackgroundColorForForegroundColor_iOS:(id)a3
{
  [a3 alphaComponent];
  double v6 = v5;
  [a1 _textHighlightBackgroundColorPercentage];
  double v8 = v6 * v7;

  return (id)[a3 colorWithAlphaComponent:v8];
}

@end