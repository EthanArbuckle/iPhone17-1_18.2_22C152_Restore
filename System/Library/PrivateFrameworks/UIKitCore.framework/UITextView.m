@interface UITextView
+ (BOOL)_isTextLayoutManagerEnabled;
+ (BOOL)supportsDynamicallyTogglingAllowsTextAnimations;
+ (UITextView)textViewUsingTextLayoutManager:(BOOL)usingTextLayoutManager;
+ (id)_defaultFont;
+ (id)_defaultTextColor;
- ($BB3B25BBC364C7D98808033881F79914)_saveSizeBeforeLayoutCalculation:(SEL)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_allowAnimatedUpdateSelectionRectViews;
- (BOOL)_allowHighlightForTextInteractableItem:(id)a3;
- (BOOL)_allowInteraction:(int64_t)a3 forTextInteractableItem:(id)a4;
- (BOOL)_allowsOverflowForIntrinsicSizeCalculation;
- (BOOL)_areDefaultTextFormattingAffordancesAvailable;
- (BOOL)_customRenderControllerCanCheckFragmentsValid;
- (BOOL)_customRenderControllerCanConvertPointFromRenderSpace;
- (BOOL)_customRenderControllerCanConvertPointToRenderSpace;
- (BOOL)_customRenderControllerCanConvertPointToTextAnimationsCoordinateSpace;
- (BOOL)_customRenderControllerPermitsSetTextDidEditRange;
- (BOOL)_customRenderControllerPermitsTextSegmentEnumeration;
- (BOOL)_delegateSuppliesWritingToolsIgnoredRanges;
- (BOOL)_delegatesAllowingLinkInteraction;
- (BOOL)_delegatesAllowingTextItemInteractions;
- (BOOL)_delegatesAllowingTextItemMenuInteraction;
- (BOOL)_delegatesAllowingTextItemPrimaryActionInteraction;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_documentRangeEqualToViewportRange;
- (BOOL)_drawsDebugBaselines;
- (BOOL)_finishResignFirstResponder;
- (BOOL)_freezeTextContainerSize;
- (BOOL)_hasBaseline;
- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3;
- (BOOL)_hasFontInfoForVerticalBaselineSpacing;
- (BOOL)_implementsEditMenu;
- (BOOL)_interactionPossibleWithAttachment:(id)a3;
- (BOOL)_isDisplayingLookupViewController;
- (BOOL)_isDisplayingReferenceLibraryViewController;
- (BOOL)_isDisplayingShareViewController;
- (BOOL)_isDisplayingShortcutViewController;
- (BOOL)_isDisplayingTextService;
- (BOOL)_isExtremeSizingEnabled;
- (BOOL)_isInCompactHorizontalSizeClass;
- (BOOL)_isInteractiveTextSelectionDisabled;
- (BOOL)_isSelectionVisible;
- (BOOL)_isSystemAttachment:(id)a3;
- (BOOL)_isTextFormattingControllerPresented;
- (BOOL)_isTextFormattingInProgress;
- (BOOL)_isTextLayoutManagerEnabled;
- (BOOL)_isTextSizeCacheEnabled;
- (BOOL)_isWritingToolsStreamingReplacements;
- (BOOL)_mightHaveInteractableItems;
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (BOOL)_ownsInputAccessoryView;
- (BOOL)_performExternalEditsForWritingToolsSessionIdentifier:(id)a3 action:(int64_t)a4 usingBlock:(id)a5;
- (BOOL)_preserveSelectionDisplayForTextFormatting;
- (BOOL)_reconfigureWithLayoutManager:(id)a3 triggeredByLayoutManagerAccess:(BOOL)a4 triggeringSelector:(SEL)a5;
- (BOOL)_restoreFirstResponder;
- (BOOL)_shouldAcceptAutocorrection;
- (BOOL)_shouldAdjustKeyboardGuidesForTextFormattingIfNeeded;
- (BOOL)_shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment;
- (BOOL)_shouldBecomeEditableUponFocus;
- (BOOL)_shouldCollectAsKeyView;
- (BOOL)_shouldHideInputViewsForTextFormatting;
- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4;
- (BOOL)_shouldInvalidateLayoutForLinkAttributesChange;
- (BOOL)_shouldObscureInput;
- (BOOL)_shouldScrollEnclosingScrollView;
- (BOOL)_shouldShowEditMenu;
- (BOOL)_shouldStartDataDetectors;
- (BOOL)_shouldSuppressEditMenuForTextFormatting;
- (BOOL)_shouldSuppressSelectionCommands;
- (BOOL)_showsEditMenu;
- (BOOL)_supportsImagePasteCached;
- (BOOL)_supportsTextKit2TextLists;
- (BOOL)_textStorageOverridesReplaceCharactersInRangeWithAttributedString;
- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass;
- (BOOL)_wantsContentAwareTypesettingLanguage;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)allowsAttachments;
- (BOOL)allowsDraggingAttachments;
- (BOOL)allowsEditingTextAttributes;
- (BOOL)allowsTextAnimations;
- (BOOL)becomeFirstResponder;
- (BOOL)becomesEditableWithGestures;
- (BOOL)canBecomeDropResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResignFirstResponder;
- (BOOL)clearsOnInsertion;
- (BOOL)forceDisableDictation;
- (BOOL)forceEnableDictation;
- (BOOL)hasText;
- (BOOL)isAccessibilityElementByDefault;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isFindInteractionEnabled;
- (BOOL)isSelectable;
- (BOOL)isTextDragActive;
- (BOOL)isTextDropActive;
- (BOOL)isWritingToolsActive;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)keyboardInputChanged:(id)a3;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)performFinalGrammarChecking;
- (BOOL)replaceAnimatedTextPlaceholderWith:(id)a3;
- (BOOL)replaceAnimatedTextPlaceholderWith:(id)a3 completion:(id)a4;
- (BOOL)resignFirstResponder;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldAutoscrollAboveBottom;
- (BOOL)shouldPresentSheetsInAWindowLayeredAboveTheKeyboard;
- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5;
- (BOOL)supportsAdaptiveImageGlyph;
- (BOOL)supportsEmojiImageTextAttachments;
- (BOOL)supportsTextReplacement;
- (BOOL)textInput:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textInputShouldExtendCaretHeight:(id)a3;
- (BOOL)tiledViewsDrawAsynchronously;
- (BOOL)usesStandardTextScaling;
- (BOOL)usesTiledViews;
- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3;
- (BOOL)worksWithAnimatedTextSpacer;
- (CGPoint)_contentOffsetForScrollToVisible:(_NSRange)a3;
- (CGPoint)_contentOffsetForScrollingToRect:(CGRect)a3;
- (CGPoint)_convertPointFromRenderSpace:(CGPoint)a3;
- (CGPoint)_convertPointToRenderSpace:(CGPoint)a3 textRange:(id)a4;
- (CGPoint)textContainerOrigin;
- (CGRect)_boundingRectForRange:(id)a3;
- (CGRect)_customRenderBounds;
- (CGRect)_frameOfTrailingWhitespace;
- (CGRect)_rectForScrollToVisible:(_NSRange)a3;
- (CGRect)_rectToScrollToVisibleInCellInWindow:(id)a3;
- (CGRect)accessibilityFrame;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)frameForDictationResultPlaceholder:(id)a3;
- (CGRect)visibleRect;
- (CGRect)visibleRectIgnoringKeyboard;
- (CGSize)_containerSizeForBoundsSize:(CGSize)a3 allowingOverflow:(BOOL)a4;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (Class)_intelligenceBaseClass;
- (NSAttributedString)attributedText;
- (NSCustomTextRendering)customRenderController;
- (NSDictionary)linkTextAttributes;
- (NSDictionary)markedTextStyle;
- (NSDictionary)textHighlightAttributes;
- (NSDictionary)typingAttributes;
- (NSLayoutManager)layoutManager;
- (NSRange)selectedRange;
- (NSString)text;
- (NSTextAlignment)textAlignment;
- (NSTextContainer)textContainer;
- (NSTextLayoutManager)textLayoutManager;
- (NSTextStorage)textStorage;
- (UIColor)selectionHighlightColor;
- (UIColor)textColor;
- (UIDataDetectorTypes)dataDetectorTypes;
- (UIDragInteraction)textDragInteraction;
- (UIDropInteraction)textDropInteraction;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)textContainerInset;
- (UIFindInteraction)findInteraction;
- (UIFont)font;
- (UITextDragDelegate)textDragDelegate;
- (UITextDropDelegate)textDropDelegate;
- (UITextFormattingViewControllerConfiguration)textFormattingConfiguration;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextPasteDelegate)pasteDelegate;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (UITextView)initWithCoder:(NSCoder *)coder;
- (UITextView)initWithFrame:(CGRect)a3;
- (UITextView)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer;
- (UITextViewBorderStyle)borderStyle;
- (UIView)inputAccessoryView;
- (UIView)inputView;
- (UIView)textInputView;
- (_NSCustomTextRenderingDisplayLink)_customRenderDisplayLink;
- (_NSRange)_nsRangeForNonNullUITextRange:(id)a3;
- (_NSRange)_nsRangeForTextKitRanges:(id)a3;
- (_NSRange)_visibleRangeWithLayout:(BOOL)a3;
- (_UIAnimatedTextLayoutInfo)_uniqueWritingToolsAnimatedLayoutInfo;
- (_UITextAssistantManager)_textAssistantManager;
- (_UITextInteractableItemCache)_textInteractableItemCache;
- (_UITextLayoutController)textLayoutController;
- (_UITextViewSearchableObject)searchableObject;
- (_UITextViewVisualStyle)visualStyle;
- (double)_adjustedTextContainerInset;
- (double)_applicableContentOutsetsFromFonts;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8;
- (double)_baselineOffsetFromBottom;
- (double)_currentPreferredMaxLayoutWidth;
- (double)_firstBaselineOffsetFromTop;
- (double)_internalFirstBaselineOffsetFromTop;
- (double)_internalLastBaselineOffsetFromBottom;
- (double)_multilineContextWidth;
- (double)_preferredMaxLayoutWidth;
- (double)_textFormattingControllerOverlapHeight;
- (double)lineHeight;
- (double)maxTileHeight;
- (id)_NSTextRangeFromNSRange:(_NSRange)a3;
- (id)_activityItemsConfigurationAtLocation:(CGPoint)a3;
- (id)_allowedTypingAttributes;
- (id)_animatedPlaceholderSupport;
- (id)_animatorForTextAnimation:(id)a3;
- (id)_animatorForTextAnimation:(id)a3 notify:(id)a4;
- (id)_anyTextItemConstrainedToLineAtPoint:(CGPoint)a3;
- (id)_attributedPlaceholder;
- (id)_attributedStringForInsertionOfAttributedString:(id)a3;
- (id)_configurationForTextFormattingOptions;
- (id)_containerView;
- (id)_cuiCatalog;
- (id)_cuiStyleEffectConfiguration;
- (id)_currentDefaultAttributes;
- (id)_defaultFocusEffect;
- (id)_descriptorForTextFormattingOptions;
- (id)_disabledComponentsForTextFormattingOptions;
- (id)_effectivePasteConfiguration;
- (id)_existingSelectionContainerView;
- (id)_existingTextAssistantManager;
- (id)_existingWritingToolsCoordinator;
- (id)_fontInfoForBaselineSpacing;
- (id)_getDelegateZoomView;
- (id)_implicitPasteConfigurationClasses;
- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4;
- (id)_inputController;
- (id)_interactionState;
- (id)_internalTextLayoutController;
- (id)_layoutDebuggingTitle;
- (id)_linkTextAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4;
- (id)_menuConfigurationForTextInteractableItem:(id)a3 defaultMenu:(id)a4;
- (id)_newContainerViewWithFrame:(CGRect)a3 textContainer:(id)a4 textLayoutController:(id)a5;
- (id)_newTextContainer;
- (id)_newTextKit1LayoutControllerWithTextContainer:(id)a3 layoutManager:(id)a4 textStorage:(id)a5;
- (id)_nonNullIntersectionOfUITextRange:(id)a3 withOtherUITextRange:(id)a4;
- (id)_nonNullUITextRangeForTextKitRanges:(id)a3;
- (id)_nonNullUITextRangeFromNSRange:(_NSRange)a3;
- (id)_placeSelectionContainerView;
- (id)_placeholderLabel;
- (id)_previewRendererForRange:(id)a3 unifyRects:(BOOL)a4;
- (id)_primaryActionForTextInteractableItem:(id)a3 defaultAction:(id)a4;
- (id)_rangeForTextKitRanges:(id)a3;
- (id)_replaceRange:(id)a3 withAttributedText:(id)a4 updatingSelection:(BOOL)a5;
- (id)_resolvedTypesettingLanguage:(id)a3;
- (id)_restorableScrollPosition;
- (id)_restorableScrollPositionForStateRestoration;
- (id)_scrollViewToAdjustForTextFormattingController;
- (id)_supportedAnimationAccessibilityHintsForTextFormatting;
- (id)_supportedAnimationNamesForTextFormatting;
- (id)_supportedAnimationTitlesForTextFormatting;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_targetedPreviewForHighlightRange:(id)a3;
- (id)_targetedPreviewForRange:(id)a3 withRenderingAttributes:(id)a4;
- (id)_targetedPreviewForRange:(id)a3 withRenderingAttributes:(id)a4 includeFullDocument:(BOOL)a5;
- (id)_targetedPreviewForTextInteractableItem:(id)a3 dismissing:(BOOL)a4;
- (id)_textGeometry;
- (id)_textInputTraits;
- (id)_textInteractableItemAtPoint:(CGPoint)a3 precision:(unint64_t)a4;
- (id)_textInteractableItemForTag:(id)a3;
- (id)_textItemForItem:(id)a3;
- (id)_textLineRectsForRange:(id)a3;
- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6;
- (id)_writingToolsCoordinator;
- (id)attributedTextInRange:(id)a3;
- (id)automaticallySelectedOverlay;
- (id)bottomContentPadding;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4;
- (id)extractWordArrayFromTokensArray:(id)a3;
- (id)findInteraction:(id)a3 sessionForView:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4 textLayoutManagerEnabled:(BOOL)a5;
- (id)insertDictationResultPlaceholder;
- (id)insertTextPlaceholderWithSize:(CGSize)a3;
- (id)largeContentTitle;
- (id)metadataDictionariesForDictationResults;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4;
- (id)selectedText;
- (id)selectionContainerView;
- (id)selectionRectsForRange:(id)a3;
- (id)textContainerView:(id)a3 cuiCatalogForTextEffectName:(id)a4;
- (id)textContainerView:(id)a3 linkTextAttributesForLink:(id)a4 forCharacterAtIndex:(unint64_t)a5;
- (id)textInRange:(id)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)topContentPadding;
- (id)undoManager;
- (id)webView;
- (int64_t)_encodedTextKitFlavor;
- (int64_t)_indexForNonNullUITextPosition:(id)a3;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)selectionAffinity;
- (int64_t)sizingRule;
- (int64_t)textDragOptions;
- (int64_t)writingToolsBehavior;
- (uint64_t)_raiseIfNecessaryForWritingToolsResultOptions:(uint64_t)result;
- (unint64_t)_defaultTextPreviewOptions;
- (unint64_t)_defaultWritingToolsResultOptions;
- (unint64_t)_effectiveDataDetectorTypes;
- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete;
- (unint64_t)_totalNumberOfTextViewsInLayoutManager;
- (unint64_t)allowedWritingToolsResultOptions;
- (unint64_t)marginTop;
- (void)_addShortcut:(id)a3;
- (void)_adjustBottomContentInsetForTextFormattingController:(BOOL)a3;
- (void)_adjustFontForAccessibilityTraits:(BOOL)a3;
- (void)_adjustFontForTypesettingLanguage;
- (void)_applyHighlightStyle:(id)a3 colorScheme:(id)a4 toTextRange:(id)a5;
- (void)_applyHighlightStyle:(id)a3 toTextRange:(id)a4;
- (void)_applyOptionsToGeometry;
- (void)_assignTextStorageCheckingForOverrides:(uint64_t)a1;
- (void)_cancelDataDetectors;
- (void)_cleanUpForResignFirstResponder;
- (void)_clearHighlightView;
- (void)_commonInitWithTextContainer:(id)a3 decoding:(BOOL)a4 editable:(BOOL)a5 selectable:(BOOL)a6 draggable:(BOOL)a7 textLayoutManagerEnabled:(BOOL)a8;
- (void)_configureForLayoutCalculation:(id)a3 inSize:(CGSize)a4;
- (void)_configureWithTextContainer:(id)a3 layoutManager:(id)a4 textLayoutManagerEnabled:(BOOL)a5;
- (void)_createTextEmphasisBackgroundViewIfNeeded;
- (void)_customUndoManagerDidFinishUndoRedoChanges;
- (void)_customUndoManagerUndoRedoDidApplyAttributedText:(id)a3 toCharacterRange:(_NSRange)a4;
- (void)_define:(id)a3;
- (void)_deleteBackwardAndNotify:(BOOL)a3;
- (void)_diagnoseFocusabilityForReport:(id)a3;
- (void)_didFinishSpeechRecognition;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_didRecognizeSpeechStrings:(id)a3;
- (void)_didRecognizeSpeechTokens:(id)a3;
- (void)_disableTiledViews;
- (void)_dismissEditMenu;
- (void)_dismissTextFormattingControllerIfNeededWithAnimation:(BOOL)a3;
- (void)_ensureUpToDateTextContainerInsetAndNotifyIfNecessary;
- (void)_findSelected:(id)a3;
- (void)_hideTextFormattingOptions:(id)a3;
- (void)_insertAttributedTextWithoutClosingTyping:(id)a3;
- (void)_installContainerViewAtIndex:(unint64_t)a3;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_invalidateContainerViewSize;
- (void)_invalidateInteractionGeometry;
- (void)_invalidateLayoutForLinkAttributesChange:(BOOL)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_layoutPlaceholder;
- (void)_layoutText;
- (void)_logWarningForMenuControllerUsage;
- (void)_notifyDidBeginEditing;
- (void)_notifyDidEndEditing;
- (void)_observedTextViewDidChange:(id)a3;
- (void)_pasteAttributedString:(id)a3 pasteAsRichText:(BOOL)a4;
- (void)_performTextFormattingRestoration;
- (void)_performTextFormattingRestorationIfNeeded;
- (void)_performTextKit1LayoutCalculation:(id)a3 inSize:(CGSize)a4;
- (void)_performTextKit2LayoutCalculation:(id)a3 inSize:(CGSize)a4;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_prepareForFirstIntrinsicContentSizeCalculation;
- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3;
- (void)_prepareForTextFormattingControllerPresentationWithConfiguration:(id)a3 sender:(id)a4;
- (void)_prepareForTextFormattingRestoration;
- (void)_prepareForTextFormattingRestorationIfNeeded;
- (void)_presentEditMenu;
- (void)_presentTextFormattingController;
- (void)_promptForReplace:(id)a3;
- (void)_registerUndoOperationForReplacementWithActionName:(id)a3 replacementText:(id)a4;
- (void)_removeHighlightsFromTextRange:(id)a3;
- (void)_resetDataDetectorsResults;
- (void)_resetUsesExplicitPreferredMaxLayoutWidth;
- (void)_restoreScrollPosition:(id)a3 animated:(BOOL)a4;
- (void)_restoreSize:(id *)a3 afterLayoutCalculation:(id)a4;
- (void)_resyncContainerFrameForNonAutolayout;
- (void)_resyncContainerFrameForNonAutolayoutDeferringSizeToFit:(BOOL)a3;
- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4;
- (void)_scrollRect:(CGRect)a3 toVisibleInContainingScrollView:(BOOL)a4;
- (void)_scrollSelectionToVisibleInContainingScrollView;
- (void)_scrollSelectionToVisibleInContainingScrollView:(BOOL)a3;
- (void)_scrollToCaretIfNeeded;
- (void)_scrollToSelectionIfNeeded;
- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4;
- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3;
- (void)_scrollViewWillEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4;
- (void)_selectionMayChange:(id)a3;
- (void)_setAllowedTypingAttributes:(id)a3;
- (void)_setContentOffsetWithoutRecordingScrollPosition:(CGPoint)a3;
- (void)_setCuiCatalog:(id)a3;
- (void)_setCuiStyleEffectConfiguration:(id)a3;
- (void)_setCustomRenderDisplayLink:(id)a3;
- (void)_setDefaultTextPreviewOptions:(unint64_t)a3;
- (void)_setDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)_setDrawsDebugBaselines:(BOOL)a3;
- (void)_setEncodedTextKitFlavor:(int64_t)a3;
- (void)_setExtremeSizingEnabled:(BOOL)a3;
- (void)_setFrameOrBounds:(CGRect)a3 fromOldRect:(CGRect)a4 settingAction:(id)a5;
- (void)_setFreezeTextContainerSize:(BOOL)a3;
- (void)_setHorizontalMargins:(unint64_t)a3;
- (void)_setInteractionState:(id)a3;
- (void)_setInteractiveTextSelectionDisabled:(BOOL)a3;
- (void)_setMultilineContextWidth:(double)a3;
- (void)_setNeedsFrameUpdateForCustomRendering;
- (void)_setNeedsTextLayout;
- (void)_setOverridePlaceholder:(id)a3 alignment:(int64_t)a4;
- (void)_setPreferredMaxLayoutWidth:(double)a3;
- (void)_setShowsEditMenu:(BOOL)a3;
- (void)_setSiriAnimationDictationStyleWithCharacterInsertionRate:(double)a3 minimumDurationBetweenHypotheses:(double)a4;
- (void)_setTextColor:(id)a3;
- (void)_setTextSizeCacheEnabled:(BOOL)a3;
- (void)_setTypingAttributesTextColor:(id)a3;
- (void)_setUniqueWritingToolsAnimatedLayoutInfo:(id)a3;
- (void)_setUpWithTextContainer:(id)a3 textLayoutManagerEnabled:(BOOL)a4;
- (void)_setWantsContentAwareTypesettingLanguage:(BOOL)a3;
- (void)_setWritingToolsStreamingReplacements:(BOOL)a3;
- (void)_setupDefaultStyleEffectConfiguration;
- (void)_share:(id)a3;
- (void)_showTextFormattingAnimationOptions:(id)a3;
- (void)_showTextFormattingOptions:(id)a3;
- (void)_sizingRuleWillChangeShouldClearInsetEdges:(uint64_t)a1;
- (void)_startDataDetectors;
- (void)_startDataDetectorsIfNeeded;
- (void)_startSuppressingKeyboardForTextFormatting:(id)a3;
- (void)_stopSuppressingKeyboardForTextFormatting:(id)a3;
- (void)_syncTypingAttributesToTextContainerAttributesForExtraLineFragment;
- (void)_textContainerSizeDidChange:(id)a3;
- (void)_textFormattingDidDisappear:(id)a3;
- (void)_textFormattingRequestsFirstResponderResignation:(id)a3;
- (void)_textFormattingRequestsFirstResponderRestoration:(id)a3;
- (void)_textInteractableItem:(id)a3 willDismissMenuWithAnimator:(id)a4;
- (void)_textInteractableItem:(id)a3 willDisplayMenuWithAnimator:(id)a4;
- (void)_textStorageDidProcessEditing:(id)a3;
- (void)_textViewContentPaddingDidChange:(id)a3;
- (void)_textViewWillPresentTextFormattingOptions;
- (void)_translate:(id)a3;
- (void)_transliterateChinese:(id)a3;
- (void)_updateBaselineInformationDependentOnBounds;
- (void)_updateContainerTileAndSizingFlags;
- (void)_updateContentSize;
- (void)_updateFrameOfTrailingWhitespace:(CGSize)a3;
- (void)_updatePlaceholderVisibility;
- (void)_updateSelectableInteractions;
- (void)_updateSelectionGestures;
- (void)_updateTextContainerSizeAndSizeToFit;
- (void)_updateTextEffectsConfigurationIfNeeded;
- (void)_updateTextFormattingController;
- (void)_updateTextFormattingControllerPresentationSource;
- (void)_willDrawContentOfSurface:(id)a3 withBlock:(id)a4;
- (void)_wtc_highlightProofreadingReviewingRange:(_NSRange)a3;
- (void)_wtc_invalidateGrabberSuppression;
- (void)_wtc_invalidateSelectionUIHidden;
- (void)_wtc_removeUnderlineForProofreadingSuggestionID:(id)a3;
- (void)_wtc_underlineTextInCharacterRange:(_NSRange)a3 proofreadingSuggestionID:(id)a4;
- (void)addGhostedRange:(id)a3;
- (void)addInvisibleRange:(id)a3;
- (void)addTextAlternatives:(id)a3;
- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4;
- (void)adjustedContentInsetDidChange;
- (void)alignCenter:(id)a3;
- (void)alignJustified:(id)a3;
- (void)alignLeft:(id)a3;
- (void)alignRight:(id)a3;
- (void)applyGrammarCheckingIndication;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)beginSelectionChange;
- (void)cancelAutoscroll;
- (void)captureTextFromCamera:(id)a3;
- (void)clearAllDecoratedFoundText;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)decodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4;
- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5;
- (void)decreaseSize:(id)a3;
- (void)deleteBackward;
- (void)disableClearsOnInsertion;
- (void)draggingFinished:(id)a3;
- (void)drawTextHighlightBackgroundForTextRange:(id)a3 origin:(CGPoint)a4;
- (void)droppingFinished;
- (void)droppingStarted;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)endFloatingCursor;
- (void)endSelectionChange;
- (void)find:(id)a3;
- (void)findAndReplace:(id)a3;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)increaseSize:(id)a3;
- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4;
- (void)insertAnimatedTextPlaceholder;
- (void)insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4;
- (void)insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4 completion:(id)a5;
- (void)insertAttributedText:(id)a3;
- (void)insertAttributedText:(id)a3 withAnimationStyle:(int64_t)a4 completion:(id)a5;
- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)insertEmojiImageTextAttachment:(id)a3 replacementRange:(id)a4;
- (void)insertText:(id)a3;
- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5;
- (void)insertText:(id)a3 style:(int64_t)a4 alternatives:(id)a5;
- (void)insertTextSuggestion:(id)a3;
- (void)invalidateDropCaret;
- (void)invalidateIntrinsicContentSize;
- (void)keyboardInputChangedSelection:(id)a3;
- (void)layoutSubviews;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)paste:(id)a3;
- (void)pasteAndMatchStyle:(id)a3;
- (void)pasteItemProviders:(id)a3;
- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5;
- (void)removeAllGhostedRanges;
- (void)removeAnimatedTextPlaceholders;
- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
- (void)removeEmojiAlternatives;
- (void)removeInvisibleRange:(id)a3;
- (void)removeTextPlaceholder:(id)a3;
- (void)replace:(id)a3;
- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5;
- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5;
- (void)replaceRange:(id)a3 withAttributedText:(id)a4;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4;
- (void)scrollRangeToVisible:(NSRange)range;
- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4;
- (void)scrollSelectionToVisible:(BOOL)a3;
- (void)select:(id)a3;
- (void)selectAll:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAllowedWritingToolsResultOptions:(unint64_t)a3;
- (void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes;
- (void)setAllowsTextAnimations:(BOOL)a3;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setAttributedPlaceholder:(id)a3;
- (void)setAttributedText:(NSAttributedString *)attributedText;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setBorderStyle:(UITextViewBorderStyle)borderStyle;
- (void)setBounds:(CGRect)a3;
- (void)setClearsOnInsertion:(BOOL)clearsOnInsertion;
- (void)setContentMode:(int64_t)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentToHTMLString:(id)a3;
- (void)setContinuousSpellCheckingEnabled:(BOOL)a3;
- (void)setCustomRenderController:(id)a3;
- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes;
- (void)setDelegate:(id)delegate;
- (void)setEditable:(BOOL)editable;
- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled;
- (void)setFont:(UIFont *)font;
- (void)setForceDisableDictation:(BOOL)a3;
- (void)setForceEnableDictation:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInputAccessoryView:(UIView *)inputAccessoryView;
- (void)setInputDelegate:(id)a3;
- (void)setInputView:(UIView *)inputView;
- (void)setLineHeight:(double)a3;
- (void)setLinkTextAttributes:(NSDictionary *)linkTextAttributes;
- (void)setMarginTop:(unint64_t)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedTextStyle:(id)a3;
- (void)setMaxTileHeight:(double)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsFrameUpdateForSurface:(id)a3;
- (void)setNeedsLayout;
- (void)setPasteDelegate:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setSearchableObject:(id)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSelectable:(BOOL)selectable;
- (void)setSelectedRange:(NSRange)selectedRange;
- (void)setSelectedTextRange:(id)a3;
- (void)setShouldAutoscrollAboveBottom:(BOOL)a3;
- (void)setShouldPresentSheetsInAWindowLayeredAboveTheKeyboard:(BOOL)a3;
- (void)setSizingRule:(int64_t)a3;
- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3;
- (void)setText:(NSString *)text;
- (void)setTextAlignment:(NSTextAlignment)textAlignment;
- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset;
- (void)setTextDragDelegate:(id)a3;
- (void)setTextDragOptions:(int64_t)a3;
- (void)setTextDropDelegate:(id)a3;
- (void)setTextFormattingConfiguration:(id)a3;
- (void)setTextHighlightAttributes:(id)a3;
- (void)setTiledViewsDrawAsynchronously:(BOOL)a3;
- (void)setTypingAttributes:(NSDictionary *)typingAttributes;
- (void)setUsesStandardTextScaling:(BOOL)usesStandardTextScaling;
- (void)setUsesTiledViews:(BOOL)a3;
- (void)setVisualStyle:(id)a3;
- (void)setWritingToolsBehavior:(int64_t)a3;
- (void)set_textInteractableItemCache:(id)a3;
- (void)startAutoscroll:(CGPoint)a3;
- (void)startInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)takeTraitsFrom:(id)a3;
- (void)textInput:(id)a3 didApplyAttributedText:(id)a4 toCharacterRange:(_NSRange)a5;
- (void)textInput:(id)a3 undoRedoDidApplyAttributedText:(id)a4 toCharacterRange:(_NSRange)a5;
- (void)textInputDidAnimatePaste:(id)a3;
- (void)textInputDidChange:(id)a3;
- (void)textInputDidChangeSelection:(id)a3;
- (void)textInputDidFinishUndoRedoChanges:(id)a3;
- (void)textInputWillAnimatePaste:(id)a3;
- (void)tintColorDidChange;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unmarkText;
- (void)updateAutoscrollAboveBottom;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)updateSelection;
- (void)updateSelectionImmediately;
- (void)updateTextAttributesWithConversionHandler:(id)a3;
- (void)useSelectionForFind:(id)a3;
- (void)validateCommand:(id)a3;
- (void)willDismissEditMenuWithAnimator:(id)a3;
- (void)willHighlightFoundTextRange:(id)a3 inDocument:(id)a4;
- (void)willPresentEditMenuWithAnimator:(id)a3;
- (void)writingToolsCoordinator:(id)a3 adjustForUpdatedRange:(_NSRange)a4 forTextAnimation:(int64_t)a5 inContext:(id)a6 completion:(id)a7;
- (void)writingToolsCoordinator:(id)a3 finishTextAnimation:(int64_t)a4 forRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7;
- (void)writingToolsCoordinator:(id)a3 prepareForTextAnimation:(int64_t)a4 forRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7;
- (void)writingToolsCoordinator:(id)a3 replaceRange:(_NSRange)a4 inContext:(id)a5 proposedText:(id)a6 reason:(int64_t)a7 animationParameters:(id)a8 completion:(id)a9;
- (void)writingToolsCoordinator:(id)a3 requestsBoundingBezierPathsForRange:(_NSRange)a4 inContext:(id)a5 completion:(id)a6;
- (void)writingToolsCoordinator:(id)a3 requestsContextsForScope:(int64_t)a4 completion:(id)a5;
- (void)writingToolsCoordinator:(id)a3 requestsPreviewForTextAnimation:(int64_t)a4 ofRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7;
- (void)writingToolsCoordinator:(id)a3 requestsRangeInContextWithIdentifierForPoint:(CGPoint)a4 completion:(id)a5;
- (void)writingToolsCoordinator:(id)a3 requestsUnderlinePathsForRange:(_NSRange)a4 inContext:(id)a5 completion:(id)a6;
- (void)writingToolsCoordinator:(id)a3 selectRanges:(id)a4 inContext:(id)a5 completion:(id)a6;
- (void)writingToolsCoordinator:(id)a3 willChangeToState:(int64_t)a4 completion:(id)a5;
@end

@implementation UITextView

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITextView;
  [(UIScrollView *)&v13 _didMoveFromWindow:v6 toWindow:v7];
  if (v7 && dyld_program_sdk_at_least())
  {
    v8 = [v7 traitCollection];
    uint64_t v9 = [v8 userInterfaceIdiom];
    v10 = [v6 traitCollection];
    if (v9 == [v10 userInterfaceIdiom])
    {
    }
    else
    {
      v11 = [v7 traitCollection];
      uint64_t v12 = [v11 userInterfaceIdiom];

      if (v12 == 3) {
        [(UITextView *)self _adjustFontForAccessibilityTraits:1];
      }
    }
  }
}

- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass
{
  if ((*(void *)&self->super.super._viewFlags & 0x400000000000000) != 0) {
    return ![(UIScrollView *)self isScrollEnabled];
  }
  else {
    return 0;
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(UIScrollView *)self isScrollEnabled];
  double v4 = -1.0;
  double v5 = -1.0;
  if (v3) {
    goto LABEL_21;
  }
  if (dyld_program_sdk_at_least() && (*(void *)&self->super.super._viewFlags & 0x4000000000000) != 0)
  {
    uint64_t v12 = [(UITextView *)self font];
    [v12 lineHeight];
    UICeilToViewScale(self);
    double v11 = v13;
    double v10 = 65536.0;
  }
  else
  {
    [(UITextView *)self _currentPreferredMaxLayoutWidth];
    if (v6 <= 0.0) {
      double v6 = 3.40282347e38;
    }
    [(UITextView *)self _intrinsicSizeWithinSize:v6];
    double v10 = v9;
    double v11 = v7;
  }
  if (v10 > 0.0)
  {
    double v14 = 3.40282347e38;
    if (v10 < 3.40282347e38) {
      goto LABEL_12;
    }
  }
  double v14 = 0.0;
  if (v11 <= 0.0)
  {
    double v8 = 0.0;
    double v7 = 0.0;
    goto LABEL_13;
  }
  double v8 = 0.0;
  double v7 = 0.0;
  if (v11 < 3.40282347e38)
  {
LABEL_12:
    [(UITextView *)self alignmentRectInsets];
    double v7 = v15 + v16;
  }
LABEL_13:
  if (v10 <= 0.0) {
    double v7 = 0.0;
  }
  double v5 = v10 - v7;
  double v4 = -1.0;
  if (v10 >= 3.40282347e38) {
    double v5 = -1.0;
  }
  if (v11 < 3.40282347e38)
  {
    if (v11 <= 0.0) {
      double v4 = v11;
    }
    else {
      double v4 = v11 - (v14 + v8);
    }
  }
LABEL_21:
  double v17 = v5;
  result.height = v4;
  result.width = v17;
  return result;
}

- (void)setNeedsDisplay
{
  v29.receiver = self;
  v29.super_class = (Class)UITextView;
  [(UIView *)&v29 setNeedsDisplay];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(_UITextContainerView *)self->_containerView canvasView];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v20 = [(_UITextContainerView *)self->_containerView canvasView];
  [v20 bounds];
  v33.origin.double x = v21;
  v33.origin.double y = v22;
  v33.size.double width = v23;
  v33.size.double height = v24;
  v30.origin.double x = v13;
  v30.origin.double y = v15;
  v30.size.double width = v17;
  v30.size.double height = v19;
  CGRect v31 = CGRectIntersection(v30, v33);
  double x = v31.origin.x;
  double y = v31.origin.y;
  double width = v31.size.width;
  double height = v31.size.height;

  v32.origin.double x = x;
  v32.origin.double y = y;
  v32.size.double width = width;
  v32.size.double height = height;
  if (!CGRectIsEmpty(v32)) {
    -[_UITextContainerView setNeedsDisplayInRect:](self->_containerView, "setNeedsDisplayInRect:", x, y, width, height);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_insertTextSuggestion_ != a3 || (*((unsigned char *)&self->_tvFlags + 3) & 2) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextView;
    if ([(UITextView *)&v7 respondsToSelector:a3]) {
      char v5 = 1;
    }
    else {
      char v5 = [(id)objc_opt_class() instancesRespondToSelector:a3];
    }
  }
  else
  {
    double v4 = [(UIScrollView *)self delegate];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIScrollView *)self contentOffset];
  double v7 = v6;
  double v9 = v8;
  v19.receiver = self;
  v19.super_class = (Class)UITextView;
  -[UIScrollView setContentOffset:](&v19, sel_setContentOffset_, x, y);
  if (x != v7 || y != v9)
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_SingleLineTextViewAdjustsForHorizontalContentOffset, @"SingleLineTextViewAdjustsForHorizontalContentOffset") & 1) == 0)
    {
      double v11 = vabdd_f64(x, v7);
      BOOL v12 = !byte_1E8FD54FC || v11 <= 0.00000011920929;
      if (!v12
        && [(NSTextContainer *)self->_textContainer maximumNumberOfLines] == 1
        && [(UIView *)self clipsToBounds])
      {
        UIUserInterfaceLayoutDirection v13 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
        BOOL v14 = x <= 0.00000011920929;
        if (v13) {
          BOOL v14 = x >= -0.00000011920929;
        }
        if (!v14)
        {
          UIRoundToViewScale(self);
          self->_horizontalTextContainerGeometryAdjustment = v15;
          [(UITextView *)self _updateTextContainerSizeAndSizeToFit];
          -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
        }
      }
    }
    double v16 = [(_UITextContainerView *)self->_containerView canvasView];
    [v16 viewportBoundsDidChange];
  }
  if (!self->_scrollPositionDontRecordCount)
  {
    CGFloat v17 = [(UITextView *)self _restorableScrollPosition];
    scrollPosition = self->_scrollPosition;
    self->_scrollPosition = v17;

    self->_offsetFromScrollPosition = 0.0;
  }
}

- (id)_restorableScrollPosition
{
  return +[_UITextViewRestorableScrollPosition restorableScrollPositionForTextView:self];
}

- (void)setFont:(UIFont *)font
{
  double v4 = font;
  if ([(UIView *)self _shouldNotifyGeometryObserversForBaselineChanges]|| (*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0)
  {
    double v6 = [(UITextView *)self font];
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
    double v6 = 0;
  }
  double v7 = [(UITextView *)self text];
  double v8 = [(UITextView *)self _resolvedTypesettingLanguage:v7];

  uint64_t v9 = -[UIFont _fontAdjustedForTypesettingLanguage:]((CTFontRef)v4, v8);
  double v10 = (void *)v9;
  if (v9) {
    double v11 = (void *)v9;
  }
  else {
    double v11 = v4;
  }
  id v12 = v11;

  textStorage = self->_textStorage;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __22__UITextView_setFont___block_invoke;
  v43[3] = &unk_1E52DEA50;
  BOOL v14 = v4;
  v44 = v14;
  id v15 = v12;
  id v45 = v15;
  [(NSTextStorage *)textStorage coordinateEditing:v43];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained _addToTypingAttributes:*(void *)off_1E52D2040 value:v14];

  [(UITextView *)self _syncTypingAttributesToTextContainerAttributesForExtraLineFragment];
  id v17 = v15;
  id v18 = v6;
  objc_super v19 = v18;
  v20 = v18;
  CGFloat v21 = v18;
  if (v17 == v18) {
    goto LABEL_24;
  }
  if (v18 && v17)
  {
    char v22 = [v17 isEqual:v18];

    if (v22) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  self->_textContainerInsetAdjustment.top = -[UITextView _applicableContentOutsetsFromFonts](self);
  self->_textContainerInsetAdjustment.left = v23;
  self->_textContainerInsetAdjustment.bottom = v24;
  self->_textContainerInsetAdjustment.right = v25;
  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
  if (v5)
  {
    if (![(UIView *)self _wantsAutolayout]
      && (*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0)
    {
      self->_lastBaselineOffsetFromBottom = 0.0;
      self->_firstBaselineOffsetFromTop = 0.0;
    }
    if ([(UIView *)self _shouldNotifyGeometryObserversForBaselineChanges])
    {
      uint64_t v42 = 0;
      long long v41 = 0u;
      long long v40 = 0u;
      long long v39 = 0u;
      long long v38 = 0u;
      long long v37 = 0u;
      long long v36 = 0u;
      long long v35 = 0u;
      long long v34 = 0u;
      long long v33 = 0u;
      long long v32 = 0u;
      long long v31 = 0u;
      long long v30 = 0u;
      long long v29 = 0u;
      long long v28 = 0u;
      uint64_t v27 = 2048;
      -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v27);
    }
    if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0)
    {
      uint64_t v26 = [(UIView *)self superview];
      CGFloat v21 = (void *)v26;
      if (!v26 || (*(void *)(v26 + 96) & 0x8000000000000000) != 0) {
        goto LABEL_25;
      }
      v20 = [(UIView *)self superview];
      [v20 setNeedsLayout];
LABEL_24:

LABEL_25:
    }
  }
LABEL_26:
}

- (double)_applicableContentOutsetsFromFonts
{
  if (!a1) {
    return 0.0;
  }
  double v2 = 0.0;
  if ((a1[268] & 0x6000) != 0 && ([a1 isScrollEnabled] & 1) == 0)
  {
    double v3 = [a1 text];
    double v4 = +[UILabel _tooBigChars]();
    uint64_t v5 = [v3 rangeOfCharacterFromSet:v4];

    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v6 = (void *)a1[259];
      double v7 = [a1 font];
      double v2 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v6, v7, a1);
    }
  }
  return 0.0 - v2;
}

- (void)_adjustFontForAccessibilityTraits:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory || a3)
  {
    uint64_t v5 = [(UIView *)self traitCollection];
    double v6 = [(UITextView *)self font];
    double v7 = [v6 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v5];

    uint64_t v20 = 0;
    CGFloat v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    double v8 = [(UITextView *)self font];
    char v9 = 0;
    if (v8 && v7)
    {
      double v10 = [(UITextView *)self font];
      char v9 = [v10 isEqual:v7] ^ 1;
    }
    char v23 = v9;
    if (*((unsigned char *)v21 + 24))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
      [WeakRetained _addToTypingAttributes:*(void *)off_1E52D2040 value:v7];

      [(UITextView *)self _syncTypingAttributesToTextContainerAttributesForExtraLineFragment];
    }
    textStorage = self->_textStorage;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __48__UITextView__adjustFontForAccessibilityTraits___block_invoke;
    id v17 = &unk_1E530B430;
    id v13 = v5;
    id v18 = v13;
    objc_super v19 = &v20;
    [(NSTextStorage *)textStorage coordinateEditing:&v14];
    if (*((unsigned char *)v21 + 24)) {
      [(UITextView *)self invalidateIntrinsicContentSize];
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (void)_adjustFontForTypesettingLanguage
{
  double v3 = [(UITextView *)self text];
  double v4 = [(UITextView *)self _resolvedTypesettingLanguage:v3];

  uint64_t v5 = [(UIView *)self traitCollection];
  double v6 = [(UITextView *)self font];
  double v7 = -[UIFont _fontAdjustedForTypesettingLanguage:](v6, v4);

  uint64_t v20 = 0;
  CGFloat v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  double v8 = [(UITextView *)self font];
  char v9 = 0;
  if (v8 && v7)
  {
    double v10 = [(UITextView *)self font];
    char v9 = [v10 isEqual:v7] ^ 1;
  }
  char v23 = v9;
  if (*((unsigned char *)v21 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    [WeakRetained _addToTypingAttributes:*(void *)off_1E52D2040 value:v7];

    [(UITextView *)self _syncTypingAttributesToTextContainerAttributesForExtraLineFragment];
  }
  textStorage = self->_textStorage;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __47__UITextView__adjustFontForTypesettingLanguage__block_invoke;
  id v17 = &unk_1E530B430;
  id v13 = v4;
  id v18 = v13;
  objc_super v19 = &v20;
  [(NSTextStorage *)textStorage coordinateEditing:&v14];
  if (*((unsigned char *)v21 + 24)) {
    [(UITextView *)self invalidateIntrinsicContentSize];
  }

  _Block_object_dispose(&v20, 8);
}

- (UIFont)font
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  double v3 = [WeakRetained typingAttributes];
  double v4 = [v3 valueForKey:*(void *)off_1E52D2040];

  return (UIFont *)v4;
}

- (id)_resolvedTypesettingLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIView *)self traitCollection];
  double v6 = [(UITextView *)self text];
  if ([(UITextView *)self _wantsContentAwareTypesettingLanguage]
    && [v4 length]
    && (double v7 = (void *)CTFontCopyTallestTextStyleLanguageForString()) != 0)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  if (![v8 length])
  {
    uint64_t v9 = [v5 typesettingLanguage];

    id v8 = (id)v9;
  }

  return v8;
}

- (BOOL)_wantsContentAwareTypesettingLanguage
{
  return *((unsigned __int8 *)&self->_tvFlags + 1) >> 7;
}

- (void)_textStorageDidProcessEditing:(id)a3
{
  if ([(UITextView *)self isSelectable] && [(UIView *)self isFirstResponder]) {
    *(void *)&self->_tvFlags |= 1uLL;
  }
  if (![(UIScrollView *)self isScrollEnabled]) {
    [(UITextView *)self invalidateIntrinsicContentSize];
  }
  [(UITextView *)self _updatePlaceholderVisibility];
  [(UITextView *)self _invalidateContainerViewSize];
  [(UITextView *)self _updateTextFormattingController];
}

- (void)setAttributedPlaceholder:(id)a3
{
  id v5 = a3;
  id v13 = v5;
  if (self->_overriddenPlaceholder)
  {
    objc_storeStrong((id *)&self->_overriddenPlaceholder, a3);
  }
  else
  {
    placeholderLabel = self->_placeholderLabel;
    if (!placeholderLabel)
    {
      double v7 = [UILabel alloc];
      id v8 = -[UILabel initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v9 = self->_placeholderLabel;
      self->_placeholderLabel = v8;

      double v10 = [(UITextView *)self font];
      [(UILabel *)self->_placeholderLabel setFont:v10];

      double v11 = +[UIColor systemGrayColor];
      [(UILabel *)self->_placeholderLabel setTextColor:v11];

      [(UILabel *)self->_placeholderLabel setNumberOfLines:0];
      [(UILabel *)self->_placeholderLabel setAdjustsFontForContentSizeCategory:[(UITextView *)self adjustsFontForContentSizeCategory]];
      id v12 = [(UITextView *)self _contentView];
      [v12 addSubview:self->_placeholderLabel];

      id v5 = v13;
      placeholderLabel = self->_placeholderLabel;
    }
    [(UILabel *)placeholderLabel setAttributedText:v5];
    [(UITextView *)self _updatePlaceholderVisibility];
  }
}

- (void)_updatePlaceholderVisibility
{
  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel)
  {
    BOOL v4 = [(UIView *)placeholderLabel isHidden];
    id v5 = [(UITextView *)self text];
    -[UIView setHidden:](self->_placeholderLabel, "setHidden:", [v5 length] != 0);

    if (v4 && ![(UIView *)self->_placeholderLabel isHidden])
    {
      [(UITextView *)self _setNeedsTextLayout];
    }
  }
}

- (NSString)text
{
  double v2 = [(NSTextStorage *)self->_textStorage string];
  double v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (UIEdgeInsets)alignmentRectInsets
{
  BOOL v3 = [(UIScrollView *)self isScrollEnabled];
  double v4 = 0.0;
  if (v3)
  {
    double v5 = 0.0;
  }
  else
  {
    double v5 = 0.0;
    if ((*((unsigned char *)&self->_tvFlags + 1) & 0x40) != 0)
    {
      -[UITextView _applicableContentOutsetsFromFonts](self);
      double v4 = fmax(v6 - self->_unadjustedTextContainerInset.left, 0.0);
      double v5 = fmax(v7 - self->_unadjustedTextContainerInset.right, 0.0);
    }
  }
  double v8 = 0.0;
  double v9 = 0.0;
  result.right = v5;
  result.bottom = v9;
  result.left = v4;
  result.top = v8;
  return result;
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UITextView *)self _needsDoubleUpdateConstraintsPass];
  BOOL v6 = [(UIScrollView *)self isScrollEnabled];
  v8.receiver = self;
  v8.super_class = (Class)UITextView;
  [(UIScrollView *)&v8 setScrollEnabled:v3];
  if (v6 != v3)
  {
    -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v5);
    [(UITextView *)self _updateContainerTileAndSizingFlags];
    [(UITextView *)self _resyncContainerFrameForNonAutolayout];
    if (v3)
    {
      [(UIView *)self setClipsToBounds:1];
      *(_OWORD *)&self->_textContainerInsetAdjustment.top = 0u;
      *(_OWORD *)&self->_textContainerInsetAdjustment.bottom = 0u;
      *(void *)&self->_tvFlags &= 0xFFFFFFFFFFFF9FFFLL;
    }
    else
    {
      if (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_LabelDisableDefaultClipping, @"LabelDisableDefaultClipping"))int v7 = dyld_program_sdk_at_least(); {
      else
      }
        int v7 = byte_1EB256E6C != 0;
      [(UIView *)self setClipsToBounds:v7 ^ 1u];
    }
  }
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  return (*(void *)&self->super.super._viewFlags & 0x20000000000000) != 0
      && ![(UIScrollView *)self isScrollEnabled]
      && (*(unsigned char *)&self->_tvFlags & 8) == 0;
}

- (_UITextViewSearchableObject)searchableObject
{
  return self->_searchableObject;
}

- (NSCustomTextRendering)customRenderController
{
  return self->_customRenderController;
}

- (BOOL)isEditing
{
  BOOL v3 = [(UIView *)self isFirstResponder];
  if (v3)
  {
    LOBYTE(v3) = [(UITextView *)self isEditable];
  }
  return v3;
}

- (BOOL)_implementsEditMenu
{
  double v2 = [(UIScrollView *)self delegate];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (NSTextLayoutManager)textLayoutManager
{
  double v2 = [(UITextView *)self textContainer];
  char v3 = [v2 textLayoutManager];

  return (NSTextLayoutManager *)v3;
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (id)bottomContentPadding
{
  return self->_bottomContentPadding;
}

- (void)_startDataDetectors
{
  id v3 = [DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
  objc_msgSend(v3, "startURLificationForContainer:detectedTypes:", self, -[UITextView _effectiveDataDetectorTypes](self, "_effectiveDataDetectorTypes"));
}

- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes
{
  if (self->_dataDetectorTypes != dataDetectorTypes)
  {
    self->_dataDetectorTypes = dataDetectorTypes;
    [(UITextView *)self _resetDataDetectorsResults];
    if ([(UITextView *)self _shouldStartDataDetectors])
    {
      [(UITextView *)self _startDataDetectors];
    }
  }
}

- (void)setEditable:(BOOL)editable
{
  if (((((*(unsigned char *)&self->_tvFlags & 2) == 0) ^ editable) & 1) == 0)
  {
    BOOL v3 = editable;
    [(UITextView *)self resignFirstResponder];
    uint64_t v5 = 2;
    if (!v3) {
      uint64_t v5 = 0;
    }
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFFFFDLL | v5);
    if (v3 && ![(UITextView *)self isSelectable])
    {
      [(UITextView *)self setSelectable:1];
    }
    else
    {
      [(UITextView *)self _updateSelectionGestures];
      if ([(UITextView *)self _shouldStartDataDetectors]) {
        [(UITextView *)self _startDataDetectors];
      }
      else {
        [(UITextView *)self _resetDataDetectorsResults];
      }
    }
    [(_UITextContainerView *)self->_containerView setNeedsDisplay];
    textLayoutController = self->_textLayoutController;
    [(_UITextLayoutController *)textLayoutController setEditable:v3];
  }
}

- (BOOL)_isInteractiveTextSelectionDisabled
{
  if ((*(unsigned char *)&self->_tvFlags & 0x10) != 0) {
    return 1;
  }
  if ([(UITextView *)self isSelectable]) {
    return 0;
  }
  return [(UITextView *)self _delegatesAllowingLinkInteraction];
}

- (BOOL)isSelectable
{
  return (*(unsigned char *)&self->_tvFlags >> 5) & 1;
}

- (BOOL)resignFirstResponder
{
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = self->_tvFlags;
  if ((*(unsigned char *)&tvFlags & 4) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(unint64_t *)&tvFlags | 4);
    double v4 = self;
    uint64_t v5 = v4;
    if (!v4->_textFormattingShouldSkipHidingOnResignFirstResponder)
    {
      v4->_textFormattingShouldSkipRestoringFirstResponderWhenFinished = 1;
      [(UITextView *)v4 _prepareForTextFormattingRestorationIfNeeded];
      [(UITextView *)v5 _hideTextFormattingOptions:0];
    }
    v5->_textFormattingShouldSkipHidingOnResignFirstResponder = 0;
    v8.receiver = v5;
    v8.super_class = (Class)UITextView;
    BOOL v6 = [(UIResponder *)&v8 resignFirstResponder];
    if (v6) {
      -[UITextView _cleanUpForResignFirstResponder]((id *)&v5->super.super.super.super.isa);
    }
    *(void *)&self->_tvFlags &= ~4uLL;
  }
  return v6;
}

- (void)_prepareForTextFormattingRestorationIfNeeded
{
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v4 = [v3 _isPreservedRestorableResponder:self];

  if (v4)
  {
    [(UITextView *)self _prepareForTextFormattingRestoration];
  }
}

- (void)_hideTextFormattingOptions:(id)a3
{
  int v4 = [(UIView *)self traitCollection];
  if ([v4 userInterfaceIdiom])
  {

    goto LABEL_3;
  }
  uint64_t v5 = +[UISubstituteKeyboardSession activeSession];

  if (!v5)
  {
LABEL_3:
    if (self->_textFormattingViewController)
    {
      [(UITextView *)self _dismissTextFormattingControllerIfNeededWithAnimation:1];
    }
    return;
  }
  id v6 = +[UISubstituteKeyboardSession activeSession];
  [v6 hideForResponder:self];
}

- (void)_resetDataDetectorsResults
{
  if (sDataDetectorsUIFrameworkLoaded == 1)
  {
    id v3 = [DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
    [v3 resetResultsForContainer:self];
  }
}

- (void)_updateSelectionGestures
{
  if ([(UITextView *)self isSelectable])
  {
    if ([(UITextView *)self isTextDragActive]
      || [(UITextView *)self isTextDropActive])
    {
      if ([(UIView *)self isFirstResponder])
      {
        id v3 = [(UITextView *)self interactionAssistant];
        [v3 deactivateSelection];
      }
      int v4 = [(UITextView *)self interactionAssistant];
      [v4 clearGestureRecognizers:1];

      id v7 = [(UITextView *)self interactionAssistant];
      uint64_t v5 = [v7 _editMenuAssistant];
      [v5 hideSelectionCommands];
    }
    else
    {
      if ([(UIView *)self isFirstResponder])
      {
        id v6 = [(UITextView *)self interactionAssistant];
        [v6 activateSelection];
      }
      id v7 = [(UITextView *)self interactionAssistant];
      [v7 setGestureRecognizers];
    }
  }
  else
  {
    id v7 = [(UITextView *)self interactionAssistant];
    [v7 clearGestureRecognizers:1];
  }
}

- (void)setSelectable:(BOOL)selectable
{
  BOOL v4 = selectable
    && [(UITextView *)self _totalNumberOfTextViewsInLayoutManager] < 2;
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = self->_tvFlags;
  if (((*(_DWORD *)&tvFlags >> 5) & 1) != v4)
  {
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&tvFlags & 0xFFFFFFFFFFFFFFDFLL | (32 * v4));
    [(UITextView *)self resignFirstResponder];
    if (![(UITextView *)self isTextDragActive]) {
      [(UITextView *)self _updateSelectableInteractions];
    }
    if ([(UITextView *)self _shouldStartDataDetectors])
    {
      [(UITextView *)self _startDataDetectors];
    }
    else
    {
      [(UITextView *)self _resetDataDetectorsResults];
    }
  }
}

- (BOOL)isTextDragActive
{
  return [(UITextDragDropSupport *)self->_textDragDropSupport isDragActive];
}

- (void)_updateSelectableInteractions
{
  interactionAssistant = self->_interactionAssistant;
  if (interactionAssistant) {
    [(UITextInteractionAssistant *)interactionAssistant clearGestureRecognizers:0];
  }
  if ((*(unsigned char *)&self->_tvFlags & 0x20) != 0)
  {
    id v6 = [[UITextInteractionAssistant alloc] initWithView:self];
    id v7 = self->_interactionAssistant;
    self->_interactionAssistant = v6;

    objc_super v8 = [(UITextView *)self tokenizer];

    if (v8)
    {
      double v9 = +[UITextInputTraits defaultTextInputTraits];
      textInputTraits = self->_textInputTraits;
      self->_textInputTraits = v9;
    }
    else
    {
      uint64_t v15 = -[_UITextLayoutControllerBase textInputController]((UITextInputController *)self->_textLayoutController);
      objc_storeWeak((id *)&self->_inputController, v15);

      textInputTraits = objc_loadWeakRetained((id *)&self->_inputController);
      [textInputTraits setDelegate:self];
    }

    goto LABEL_16;
  }
  [(UITextView *)self willChangeValueForKey:@"editable"];
  *(void *)&self->_tvFlags &= ~2uLL;
  [(UITextView *)self didChangeValueForKey:@"editable"];
  BOOL v4 = [(UITextView *)self tokenizer];

  if (v4)
  {
    uint64_t v5 = self->_textInputTraits;
    self->_textInputTraits = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    [WeakRetained setDelegate:0];

    objc_storeWeak((id *)&self->_inputController, 0);
  }
  if ([(UITextView *)self _delegatesAllowingLinkInteraction])
  {
    id v12 = [[UITextInteractionAssistant alloc] initWithView:self textInteractionMode:1002];
    id v13 = self->_interactionAssistant;
    self->_interactionAssistant = v12;

LABEL_16:
    double v16 = self->_interactionAssistant;
    [(UITextInteractionAssistant *)v16 setGestureRecognizers];
    return;
  }
  uint64_t v14 = self->_interactionAssistant;
  self->_interactionAssistant = 0;
}

- (UITextInputTokenizer)tokenizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v3 = [WeakRetained tokenizer];

  return (UITextInputTokenizer *)v3;
}

- (unint64_t)_totalNumberOfTextViewsInLayoutManager
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v2 = [(_UITextLayoutController *)self->_textLayoutController textContainers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) textView];

        if (v8) {
          ++v5;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isTextDropActive
{
  return [(UITextDragDropSupport *)self->_textDragDropSupport isDropActive];
}

- (unint64_t)_effectiveDataDetectorTypes
{
  UIDataDetectorTypes v3 = [(UITextView *)self dataDetectorTypes];
  unint64_t result = [(UITextView *)self dataDetectorTypes];
  if (v3 == -1) {
    return result & 0x1FF;
  }
  return result;
}

- (BOOL)_shouldStartDataDetectors
{
  if (![(UITextView *)self dataDetectorTypes] || [(UITextView *)self isEditable]) {
    return 0;
  }
  return [(UITextView *)self isSelectable];
}

- (UIDataDetectorTypes)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_textDropDelegate);
  objc_destroyWeak((id *)&self->_textDragDelegate);
  objc_storeStrong((id *)&self->_textAssistantManager, 0);
  objc_storeStrong((id *)&self->_searchableObject, 0);
  objc_storeStrong((id *)&self->_findInteraction, 0);
  objc_storeStrong((id *)&self->_textInteractableItemCache, 0);
  objc_storeStrong((id *)&self->_customRenderController, 0);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
  objc_destroyWeak((id *)&self->_pasteDelegate);
  objc_storeStrong((id *)&self->_textEmphasisBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectionContainerView, 0);
  objc_storeStrong((id *)&self->_bottomContentPadding, 0);
  objc_storeStrong((id *)&self->_topContentPadding, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_textDragDropSupport, 0);
  objc_storeStrong(&self->_textFormattingKeyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_textFormattingRestorationConfiguration, 0);
  objc_storeStrong((id *)&self->_textFormattingConfiguration, 0);
  objc_storeStrong((id *)&self->_textFormattingViewController, 0);
  objc_storeStrong((id *)&self->_cuiCatalog, 0);
  objc_storeStrong((id *)&self->_intrinsicSizeCache, 0);
  objc_storeStrong((id *)&self->_siriParameters, 0);
  objc_storeStrong((id *)&self->_characterStreamingManager, 0);
  objc_storeStrong((id *)&self->_linkTextAttributes, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_activeAnimatedPlaceholder, 0);
  objc_storeStrong((id *)&self->_animatedPlaceholderSupport, 0);
  objc_storeStrong((id *)&self->_overriddenPlaceholder, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_scrollPosition, 0);
  objc_storeStrong((id *)&self->_scrollTarget, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_interactionAssistant, 0);
  objc_destroyWeak((id *)&self->_inputController);
  objc_destroyWeak(&self->_inputDelegate);
  objc_storeStrong((id *)&self->_layoutView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_cachedTintColor, 0);
}

- (void)dealloc
{
  v8[5] = *MEMORY[0x1E4F143B8];
  UIDataDetectorTypes v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8[0] = *(void *)off_1E52D6E60;
  v8[1] = @"_UITextContainerViewSizeDidChange";
  v8[2] = *(void *)off_1E52D2350;
  v8[3] = @"UIKeyboardDidShowNotification";
  v8[4] = @"UIKeyboardDidChangeFrameNotification";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  interactionAssistant = self->_interactionAssistant;
  self->_interactionAssistant = 0;

  findInteraction = self->_findInteraction;
  self->_findInteraction = 0;

  v7.receiver = self;
  v7.super_class = (Class)UITextView;
  [(UIScrollView *)&v7 dealloc];
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  id v5 = [(UIScrollView *)self delegate];

  if (v5 != v4)
  {
    char v6 = objc_opt_respondsToSelector();
    uint64_t v7 = 0x1000000;
    if ((v6 & 1) == 0) {
      uint64_t v7 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFEFFFFFFLL | v7);
    char v8 = objc_opt_respondsToSelector();
    uint64_t v9 = 0x4000000;
    if ((v8 & 1) == 0) {
      uint64_t v9 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFBFFFFFFLL | v9);
    char v10 = objc_opt_respondsToSelector();
    uint64_t v11 = 0x8000000;
    if ((v10 & 1) == 0) {
      uint64_t v11 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFF7FFFFFFLL | v11);
    char v12 = objc_opt_respondsToSelector();
    uint64_t v13 = 0x10000000;
    if ((v12 & 1) == 0) {
      uint64_t v13 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFEFFFFFFFLL | v13);
    char v14 = objc_opt_respondsToSelector();
    uint64_t v15 = 0x20000000;
    if ((v14 & 1) == 0) {
      uint64_t v15 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFDFFFFFFFLL | v15);
    char v16 = objc_opt_respondsToSelector();
    uint64_t v17 = 0x40000000;
    if ((v16 & 1) == 0) {
      uint64_t v17 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFBFFFFFFFLL | v17);
    char v18 = objc_opt_respondsToSelector();
    uint64_t v19 = 0x80000000;
    if ((v18 & 1) == 0) {
      uint64_t v19 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFF7FFFFFFFLL | v19);
    char v20 = objc_opt_respondsToSelector();
    uint64_t v21 = 0x100000000;
    if ((v20 & 1) == 0) {
      uint64_t v21 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFEFFFFFFFFLL | v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)UITextView;
  [(UIScrollView *)&v22 setDelegate:v4];
}

- (int64_t)textDragOptions
{
  return self->_textDragOptions;
}

- (id)_textGeometry
{
  return self->_geometry;
}

- (NSRange)selectedRange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  uint64_t v3 = [WeakRetained selectedRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (UITextRange)selectedTextRange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  uint64_t v3 = [WeakRetained selectedTextRange];

  return (UITextRange *)v3;
}

- (BOOL)textInputShouldExtendCaretHeight:(id)a3
{
  uint64_t v3 = [(UIView *)self traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] != 5;

  return v4;
}

- (void)_resyncContainerFrameForNonAutolayoutDeferringSizeToFit:(BOOL)a3
{
  [(UIView *)self->_containerView frame];
  double v58 = v5;
  double v59 = v6;
  double v61 = v7;
  double v9 = v8;
  [(UITextView *)self visibleRectIgnoringKeyboard];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v60 = v9;
  if ([(UITextView *)self _freezeTextContainerSize])
  {
    double width = self->_beforeFreezingFrameSize.width;
    double height = self->_beforeFreezingFrameSize.height;
    v63.origin.double x = v11;
    v63.origin.double y = v13;
    v63.size.double width = v15;
    v63.size.double height = v17;
    double v56 = CGRectGetWidth(v63)
        - width
        - (self->_duringFreezingTextContainerInset.right
         - self->_beforeFreezingTextContainerInset.right);
  }
  else
  {
    v64.origin.double x = v11;
    v64.origin.double y = v13;
    v64.size.double width = v15;
    v64.size.double height = v17;
    double width = CGRectGetWidth(v64);
    if ([(UIScrollView *)self isScrollEnabled])
    {
      double v56 = 0.0;
      double height = v9;
    }
    else
    {
      double v56 = 0.0;
      v65.origin.double x = v11;
      v65.origin.double y = v13;
      v65.size.double width = v15;
      v65.size.double height = v17;
      double height = CGRectGetHeight(v65);
    }
  }
  [(UIScrollView *)self _effectiveContentInset];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [(UIView *)self bounds];
  double v28 = v27 - (v22 + v26);
  double v55 = v20;
  double v30 = v29 - (v20 + v24);
  [(_UITextContainerView *)self->_containerView minSize];
  double v32 = v31;
  -[UIView convertSize:fromView:](self->_containerView, "convertSize:fromView:", self, v28, v30);
  double v34 = v33;
  double v36 = v35;
  if ([(UIScrollView *)self isScrollEnabled]) {
    double v37 = 0.0;
  }
  else {
    double v37 = v36;
  }
  [(_UITextContainerView *)self->_containerView minSize];
  BOOL v40 = v39 != v37 || v38 != v32;
  if (v40) {
    -[_UITextContainerView setMinSize:](self->_containerView, "setMinSize:", v32, v37);
  }
  BOOL v41 = [(UIScrollView *)self isScrollEnabled];
  if (v41) {
    double v42 = 1.79769313e308;
  }
  else {
    double v42 = v34;
  }
  if (v41) {
    double v36 = 1.79769313e308;
  }
  [(_UITextContainerView *)self->_containerView maxSize];
  if (v44 != v42 || v43 != v36)
  {
    -[_UITextContainerView setMaxSize:](self->_containerView, "setMaxSize:", v42, v36);
    BOOL v40 = 1;
  }
  if ([(NSTextContainer *)self->_textContainer layoutOrientation])
  {
    double v47 = v59;
    double v46 = v60;
    double v48 = v56;
    if ([(NSTextContainer *)self->_textContainer layoutOrientation] == 1)
    {
      [(UIView *)self bounds];
      double v50 = v49 - v24 - v55;
      double v51 = height;
      if (v50 < height) {
        double v51 = v50;
      }
      double v52 = v61;
    }
    else
    {
      double v52 = v61;
      double v51 = height;
    }
  }
  else
  {
    [(UIView *)self bounds];
    if (v53 - v22 - v26 < width) {
      double width = v53 - v22 - v26;
    }
    double v46 = v60;
    double v52 = v61;
    double v47 = v59;
    double v48 = v56;
    double v51 = height;
  }
  if (_UIRectEquivalentToRectWithAccuracy(v48, v47, width, v51, v58, v47, v52, v46, 0.00000011920929))
  {
LABEL_38:
    if (!v40) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  -[_UITextContainerView setFrame:](self->_containerView, "setFrame:", v48, v47, width, v51);
  if (!v40)
  {
    BOOL v54 = vabdd_f64(v51, v46) >= 0.00000011920929;
    BOOL v40 = vabdd_f64(width, v52) >= 0.00000011920929 || v54;
    goto LABEL_38;
  }
LABEL_39:
  if (!a3) {
    [(UITextView *)self _updateTextContainerSizeAndSizeToFit];
  }
LABEL_41:
  if (self->_unfreezingTextContainerSize)
  {
    [(UITextInteractionAssistant *)self->_interactionAssistant updateDisplayedSelection];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __70__UITextView__resyncContainerFrameForNonAutolayoutDeferringSizeToFit___block_invoke;
    v62[3] = &unk_1E52D9F70;
    v62[4] = self;
    [(id)UIApp _performBlockAfterCATransactionCommits:v62];
  }
}

- (BOOL)_freezeTextContainerSize
{
  return [(_UITextContainerView *)self->_containerView _freezeTextContainerSize];
}

- (CGRect)visibleRectIgnoringKeyboard
{
  [(UIScrollView *)self contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self frame];
  double v9 = v4;
  double v10 = v6;
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (void)_updateTextContainerSizeAndSizeToFit
{
  BOOL v3 = ([(UIScrollView *)self isScrollEnabled] || (dyld_program_sdk_at_least() & 1) == 0)
    && [(UITextView *)self _allowsOverflowForIntrinsicSizeCalculation];
  [(UIView *)self bounds];
  -[UITextView _containerSizeForBoundsSize:allowingOverflow:](self, "_containerSizeForBoundsSize:allowingOverflow:", v3, v4, v5);
  -[NSTextContainer setSize:](self->_textContainer, "setSize:");
  containerView = self->_containerView;
  [(_UITextContainerView *)containerView sizeToFit];
}

- (BOOL)_allowsOverflowForIntrinsicSizeCalculation
{
  [(UIView *)self bounds];
  if (v3 != 0.0
    || ([(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager] & 1) != 0)
  {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  double v5 = [WeakRetained typingAttributes];
  double v6 = [v5 valueForKey:*(void *)off_1E52D21B8];

  double v7 = [(UITextView *)self textStorage];
  uint64_t v8 = objc_msgSend(v7, "_ui_resolvedTextAlignmentForParagraphStyle:", v6);

  int64_t v9 = [(_UITextContainerView *)self->_containerView layoutOrientation];
  return v9 || v8 == 0;
}

- (void)_installContainerViewAtIndex:(unint64_t)a3
{
  [(_UITextLayoutController *)self->_textLayoutController usedRectForTextContainer:self->_textContainer];
  double v6 = v5;
  if (dyld_program_sdk_at_least())
  {
    double v7 = [(UIView *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];
    double v9 = 8.0;
    if (v8 == 6) {
      double v9 = 2.0;
    }
    double v10 = ceil(v6 + v9);
  }
  else
  {
    double v10 = ceil(v6 + 8.0);
  }
  [(UIView *)self bounds];
  double v12 = v11;
  [(UIView *)self bounds];
  double v14 = -[UITextView _newContainerViewWithFrame:textContainer:textLayoutController:](self, "_newContainerViewWithFrame:textContainer:textLayoutController:", self->_textContainer, self->_textLayoutController, 0.0, 0.0, v12, fmax(v10, v13));
  containerView = self->_containerView;
  self->_containerView = v14;

  double v16 = +[UIColor clearColor];
  [(_UITextContainerView *)self->_containerView setBackgroundColor:v16];

  CGSize v17 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_frameOfTrailingWhitespace.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_frameOfTrailingWhitespace.size = v17;
  id v18 = [(UITextView *)self _contentView];
  [v18 insertSubview:self->_containerView atIndex:a3];
}

- (id)_newContainerViewWithFrame:(CGRect)a3 textContainer:(id)a4 textLayoutController:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  double v13 = -[_UITextContainerView initWithFrame:textLayoutController:textContainer:delegate:]([_UITextContainerView alloc], "initWithFrame:textLayoutController:textContainer:delegate:", v11, v12, self, x, y, width, height);

  [(_UITextContainerView *)v13 setVerticallyResizable:[(UIScrollView *)self isScrollEnabled]];
  -[_UITextContainerView setMaxSize:](v13, "setMaxSize:", 1.79769313e308, 1.79769313e308);
  if (_UITextViewAllowSelectionContainerInTextLayoutCanvas()) {
    [(_UITextContainerView *)v13 setTextEmphasisBackgroundView:self->_textEmphasisBackgroundView withTextView:self];
  }
  return v13;
}

- (void)_updateContainerTileAndSizingFlags
{
  BOOL v3 = [(UIScrollView *)self isScrollEnabled];
  int v4 = [(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager];
  if (v3)
  {
    if (v4)
    {
      double v5 = [(_UITextLayoutController *)self->_textLayoutController layoutManager];
      [v5 setAllowsNonContiguousLayout:1];
    }
    p_textContainer = &self->_textContainer;
    uint64_t v7 = [(NSTextContainer *)self->_textContainer layoutOrientation];
    containerView = self->_containerView;
    if (v7)
    {
      [(_UITextContainerView *)containerView setVerticallyResizable:0];
      [(_UITextContainerView *)self->_containerView setHorizontallyResizable:1];
      [(NSTextContainer *)*p_textContainer setHeightTracksTextView:1];
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = 1;
      [(_UITextContainerView *)containerView setVerticallyResizable:1];
      [(_UITextContainerView *)self->_containerView setHorizontallyResizable:0];
      [(NSTextContainer *)*p_textContainer setHeightTracksTextView:0];
    }
  }
  else
  {
    if (v4)
    {
      double v10 = [(_UITextLayoutController *)self->_textLayoutController layoutManager];
      [v10 setAllowsNonContiguousLayout:0];
    }
    [(_UITextContainerView *)self->_containerView setVerticallyResizable:0];
    [(_UITextContainerView *)self->_containerView setHorizontallyResizable:0];
    p_textContainer = &self->_textContainer;
    if ([(NSTextContainer *)self->_textContainer layoutOrientation])
    {
      [(NSTextContainer *)*p_textContainer setHeightTracksTextView:1];
      uint64_t v9 = dyld_program_sdk_at_least();
    }
    else
    {
      [(NSTextContainer *)*p_textContainer setHeightTracksTextView:dyld_program_sdk_at_least()];
      uint64_t v9 = 1;
    }
  }
  id v11 = *p_textContainer;
  [(NSTextContainer *)v11 setWidthTracksTextView:v9];
}

- (id)selectionContainerView
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    if (self)
    {
      BOOL v3 = -[UITextView _existingSelectionContainerView]((id *)&self->super.super.super.super.isa);

      if (!v3)
      {
        int v4 = [UIView alloc];
        double v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        selectionContainerView = self->_selectionContainerView;
        self->_selectionContainerView = v5;

        -[UITextView _placeSelectionContainerView]((id *)&self->super.super.super.super.isa);
      }
    }
    uint64_t v7 = -[UITextView _existingSelectionContainerView]((id *)&self->super.super.super.super.isa);
  }
  else
  {
    uint64_t v7 = [(UITextView *)self textInputView];
  }
  return v7;
}

- (id)_existingSelectionContainerView
{
  v1 = a1;
  if (a1)
  {
    double v2 = [a1[261] selectionContainerView];
    id v3 = v2;
    if (!v2) {
      id v3 = v1[331];
    }
    v1 = (id *)v3;
  }
  return v1;
}

- (id)_placeSelectionContainerView
{
  if (!result) {
    return result;
  }
  v1 = result;
  if (!result[331]) {
    return result;
  }
  double v2 = [result textContainer];
  uint64_t v3 = [v2 textLayoutManager];
  if (v3)
  {
    int v4 = (void *)v3;
    int v5 = _UITextViewAllowSelectionContainerInTextLayoutCanvas();

    if (v5)
    {
      [v1[331] removeFromSuperview];
      id v6 = v1[331];
      id v7 = v1[261];
      return (id *)[v7 setSelectionContainerView:v6];
    }
  }
  else
  {
  }
  [v1[261] setSelectionContainerView:0];
  [v1 insertSubview:v1[331] belowSubview:v1[261]];
  return (id *)[v1 setNeedsLayout];
}

void __107__UITextView__commonInitWithTextContainer_decoding_editable_selectable_draggable_textLayoutManagerEnabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 2768) backgroundColor];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

- (void)updateSelection
{
  id v2 = [(UITextView *)self interactionAssistant];
  [v2 setNeedsSelectionDisplayUpdate];
}

- (BOOL)isEditable
{
  return (*(unsigned char *)&self->_tvFlags >> 1) & 1;
}

- (UIView)textInputView
{
  return (UIView *)self->_containerView;
}

- (UITextRange)markedTextRange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  uint64_t v3 = [WeakRetained markedTextRange];

  return (UITextRange *)v3;
}

- (BOOL)_mightHaveInteractableItems
{
  return 1;
}

- (BOOL)becomesEditableWithGestures
{
  return 0;
}

- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4
{
  return 0;
}

- (_NSRange)_nsRangeForTextKitRanges:(id)a3
{
  int v4 = [(UITextView *)self _nonNullUITextRangeForTextKitRanges:a3];
  uint64_t v5 = [(UIResponder *)self _nsrangeForTextRange:v4];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  int64_t v9 = [WeakRetained offsetFromPosition:v7 toPosition:v6];

  return v9;
}

- (id)_nonNullUITextRangeForTextKitRanges:(id)a3
{
  uint64_t v3 = [(UITextView *)self _rangeForTextKitRanges:a3];
  if (!v3)
  {
    uint64_t v3 = +[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", 0, 0);
  }
  return v3;
}

- (UITextPosition)beginningOfDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  uint64_t v3 = [WeakRetained beginningOfDocument];

  return (UITextPosition *)v3;
}

- (id)_rangeForTextKitRanges:(id)a3
{
  return (id)[(_UITextLayoutController *)self->_textLayoutController textRangeForTextKit2Ranges:a3];
}

- (CGRect)_frameOfTrailingWhitespace
{
  double x = self->_frameOfTrailingWhitespace.origin.x;
  double y = self->_frameOfTrailingWhitespace.origin.y;
  double width = self->_frameOfTrailingWhitespace.size.width;
  double height = self->_frameOfTrailingWhitespace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

void __28__UITextView__setTextColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)off_1E52D2048;
  id v5 = a2;
  uint64_t v4 = [v5 length];
  if (v2) {
    objc_msgSend(v5, "addAttribute:value:range:", v3, v2, 0, v4);
  }
  else {
    objc_msgSend(v5, "removeAttribute:range:", v3, 0, v4);
  }
}

void __22__UITextView_setFont___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 length];
  uint64_t v4 = *(void *)off_1E52D2040;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v5, "addAttribute:value:range:", v4, *(void *)(a1 + 40), 0, v3);
  }
  else {
    objc_msgSend(v5, "removeAttribute:range:", v4, 0, v3);
  }
}

void __47__UITextView__adjustFontForTypesettingLanguage__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  id v7 = [v14 objectForKeyedSubscript:*(void *)off_1E52D21A0];
  NSUInteger v8 = v7;
  if (v7)
  {
    int64_t v9 = v7;
  }
  else
  {
    int64_t v9 = [v14 objectForKeyedSubscript:*(void *)off_1E52D2040];
  }
  double v10 = v9;

  uint64_t v11 = -[UIFont _fontAdjustedForTypesettingLanguage:](v10, *(void **)(a1 + 32));
  id v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && ([(__CTFont *)v10 isEqual:v11] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D2040, v12, a3, a4);
  }
}

- (void)_setTextColor:(id)a3
{
  id v4 = a3;
  textStorage = self->_textStorage;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__UITextView__setTextColor___block_invoke;
  v7[3] = &unk_1E530B408;
  id v8 = v4;
  id v6 = v4;
  [(NSTextStorage *)textStorage coordinateEditing:v7];
  [(UITextView *)self _setTypingAttributesTextColor:v6];
  [(_UITextContainerView *)self->_containerView setNeedsDisplay];
}

- (void)_commonInitWithTextContainer:(id)a3 decoding:(BOOL)a4 editable:(BOOL)a5 selectable:(BOOL)a6 draggable:(BOOL)a7 textLayoutManagerEnabled:(BOOL)a8
{
  uint64_t v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id obj = a3;
  id v14 = a3;
  CGFloat v15 = +[_UITextViewVisualStyle inferredVisualStyle];
  visualStyle = self->_visualStyle;
  self->_visualStyle = v15;

  CGSize v17 = self;
  if (qword_1EB25AFE8 != -1) {
    dispatch_once(&qword_1EB25AFE8, &__block_literal_global_2281);
  }
  if ((dyld_program_sdk_at_least() & 1) == 0 && qword_1EB25AFF8 != -1) {
    dispatch_once(&qword_1EB25AFF8, &__block_literal_global_2291);
  }
  if (byte_1EB25AFA1)
  {
    id v18 = (objc_class *)objc_opt_class();
    double v19 = NSStringFromClass(v18);
    objc_msgSend((id)qword_1EB25AFE0, "objectForKeyedSubscript:", qword_1EB25AFF0, obj);
    BOOL v20 = v11;
    BOOL v21 = v12;
    id v22 = v14;
    BOOL v23 = v9;
    v25 = BOOL v24 = v10;
    int v26 = [v19 isEqualToString:v25];

    BOOL v10 = v24;
    BOOL v9 = v23;
    id v14 = v22;
    BOOL v12 = v21;
    BOOL v11 = v20;

    uint64_t v8 = v8 & ~v26;
  }

  double v27 = v17;
  if ((dyld_program_sdk_at_least() & 1) == 0 && qword_1EB25B010 != -1) {
    dispatch_once(&qword_1EB25B010, &__block_literal_global_2303);
  }
  if (byte_1EB25AFA2 && (objc_opt_isKindOfClass() & 1) != 0)
  {

    if (v14 && !v27->_textLayoutController)
    {
      uint64_t v28 = +[_UITextLayoutControllerBase layoutControllerWithTextView:textContainer:]((uint64_t)_UITextLayoutControllerBase, v27, v14);
      textLayoutController = v27->_textLayoutController;
      v27->_textLayoutController = (_UITextLayoutController *)v28;

      objc_storeStrong((id *)&v27->_textContainer, obj);
      double v30 = [(_UITextLayoutController *)v27->_textLayoutController textStorage];
      -[UITextView _assignTextStorageCheckingForOverrides:]((uint64_t)v27, v30);
    }
  }
  else
  {

    [(UITextView *)v27 _setUpWithTextContainer:v14 textLayoutManagerEnabled:v8];
  }
  [(UITextView *)v27 _setupDefaultStyleEffectConfiguration];
  double v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v31 addObserver:v27 selector:sel__textStorageDidProcessEditing_ name:*(void *)off_1E52D2350 object:v27->_textStorage];
  [v31 addObserver:v27 selector:sel__keyboardDidShow_ name:@"UIKeyboardDidShowNotification" object:0];
  [(UITextView *)v27 _installContainerViewAtIndex:0];
  [(UIView *)v27 setClipsToBounds:1];
  uint64_t v32 = objc_opt_new();
  layoutView = v27->_layoutView;
  v27->_layoutView = (_UITextLayoutView *)v32;

  [(_UITextLayoutView *)v27->_layoutView setDelegate:v27];
  [(UIView *)v27 insertSubview:v27->_layoutView atIndex:0];
  double v34 = 8.0;
  if (dyld_program_sdk_at_least())
  {
    double v35 = [(UIView *)v27 traitCollection];
    if ([v35 userInterfaceIdiom] == 6) {
      double v34 = 2.0;
    }
    else {
      double v34 = 8.0;
    }
  }
  [(UITextView *)v27 setMarginTop:(unint64_t)v34];
  [(UIView *)v27 bounds];
  double v37 = v36;
  [(UIView *)v27 bounds];
  -[UIScrollView setContentSize:](v27, "setContentSize:", v37, v38 - v34);
  double v39 = [[_UITextViewContentPadding alloc] initWithDelegate:v27];
  topContentPadding = v27->_topContentPadding;
  v27->_topContentPadding = v39;

  BOOL v41 = [[_UITextViewContentPadding alloc] initWithDelegate:v27];
  bottomContentPadding = v27->_bottomContentPadding;
  v27->_bottomContentPadding = v41;

  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v27->_inputController);

    if (!WeakRetained)
    {
      double v44 = -[_UITextLayoutControllerBase textInputController]((UITextInputController *)v27->_textLayoutController);
      objc_storeWeak((id *)&v27->_inputController, v44);

      id v45 = objc_loadWeakRetained((id *)&v27->_inputController);
      [v45 setDelegate:v27];
    }
  }
  v27->_defaultTextPreviewOptions = 0;
  double v46 = [[_UITextStorageDraggableGeometry alloc] initWithView:v27 textStorage:v27->_textStorage];
  geometrdouble y = v27->_geometry;
  v27->_geometrdouble y = v46;

  if (v9)
  {
    uint64_t v48 = +[UITextDragDropSupport installTextDragDropOnView:v27];
    textDragDropSupport = v27->_textDragDropSupport;
    v27->_textDragDropSupport = (UITextDragDropSupport *)v48;
  }
  double v50 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v50, sel_insertTextSuggestion_);
  IMP Implementation = method_getImplementation(InstanceMethod);
  double v53 = (objc_class *)objc_opt_class();
  BOOL v54 = class_getInstanceMethod(v53, sel_insertTextSuggestion_);
  v27->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&v27->_tvFlags & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)(Implementation != method_getImplementation(v54)) << 25));
  [(UITextView *)v27 setEditable:v11];
  if (!v11) {
    [(UITextView *)v27 setSelectable:v10];
  }
  [(UITextView *)v27 _setShowsEditMenu:1];
  if (!v12)
  {
    [(UITextView *)v27 setScrollEnabled:1];
    [(UIScrollView *)v27 setBounces:1];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __107__UITextView__commonInitWithTextContainer_decoding_editable_selectable_draggable_textLayoutManagerEnabled___block_invoke;
    v60[3] = &unk_1E52D9F70;
    v60[4] = v27;
    +[UIView _performSystemAppearanceModifications:v60];
  }
  double v55 = [(id)objc_opt_class() _defaultTextColor];
  [(UITextView *)v27 _setTypingAttributesTextColor:v55];

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    double v56 = [(UIView *)v27 traitCollection];
    uint64_t v57 = [v56 userInterfaceIdiom];

    if (v57 == 6)
    {
      [(UIView *)v27 _setContinuousCornerRadius:4.5];
      -[UITextView setTextContainerInset:](v27, "setTextContainerInset:", 16.0, 16.0, 16.0, 16.0);
    }
  }
  [(UITextView *)v27 _updateContainerTileAndSizingFlags];
  if (![(UIScrollView *)v27 isScrollEnabled]) {
    [(UITextView *)v27 invalidateIntrinsicContentSize];
  }
  [v31 addObserver:v27 selector:sel__textContainerSizeDidChange_ name:@"_UITextContainerViewSizeDidChange" object:v27->_containerView];
  v27->_canShowTextFormattingOptions = _os_feature_enabled_impl();
  if (dyld_program_sdk_at_least())
  {
    double v58 = objc_opt_new();
    [(UITextView *)v27 setTextFormattingConfiguration:v58];
  }
}

- (void)_syncTypingAttributesToTextContainerAttributesForExtraLineFragment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v7 = [WeakRetained typingAttributes];

  id v4 = [(UITextView *)self textContainer];
  id v5 = [v4 attributesForExtraLineFragment];

  if (v7 != v5 && ([v7 isEqual:v5] & 1) == 0)
  {
    id v6 = [(UITextView *)self textContainer];
    [v6 setAttributesForExtraLineFragment:v7];
  }
}

- (void)_setTypingAttributesTextColor:(id)a3
{
  p_inputController = &self->_inputController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _addToTypingAttributes:*(void *)off_1E52D2048 value:v5];

  [(UITextView *)self _syncTypingAttributesToTextContainerAttributesForExtraLineFragment];
}

- (void)setTextFormattingConfiguration:(id)a3
{
  id v4 = (UITextFormattingViewControllerConfiguration *)[a3 copy];
  textFormattingConfiguration = self->_textFormattingConfiguration;
  self->_textFormattingConfiguration = v4;
}

- (void)setMarginTop:(unint64_t)a3
{
  self->_unadjustedTextContainerInset.top = (double)a3;
  self->_unadjustedTextContainerInset.bottom = (double)a3;
  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
}

- (void)_setupDefaultStyleEffectConfiguration
{
  if (dyld_program_sdk_at_least())
  {
    uint64_t v3 = [(_UITextLayoutController *)self->_textLayoutController styleEffectConfiguration];

    if (!v3)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F5E088]);
      id v4 = [(UIView *)self traitCollection];
      id v5 = -[UITraitCollection _styleEffectAppearanceName](v4);
      [v6 setAppearanceName:v5];

      [(_UITextLayoutController *)self->_textLayoutController setStyleEffectConfiguration:v6];
    }
  }
}

- (void)_setUpWithTextContainer:(id)a3 textLayoutManagerEnabled:(BOOL)a4
{
}

- (void)_setShowsEditMenu:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)_configureWithTextContainer:(id)a3 layoutManager:(id)a4 textLayoutManagerEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id obj = a3;
  id v9 = a4;
  id v10 = obj;
  id v11 = v9;
  if (!obj)
  {
    id v10 = [(UITextView *)self _newTextContainer];
LABEL_7:
    id obj = v10;
    if (self->_textStorage)
    {
      if (v5)
      {
LABEL_9:
        id v16 = objc_alloc_init((Class)off_1E52D2EC8);
        [v16 setTextStorage:self->_textStorage];
        CGSize v17 = [[_UITextKit2LayoutController alloc] initWithTextView:self textContentStorage:v16 textContainer:obj];
        textLayoutController = self->_textLayoutController;
        self->_textLayoutController = (_UITextLayoutController *)v17;

        double v19 = [(_UITextLayoutController *)self->_textLayoutController firstTextContainer];
        textContainer = self->_textContainer;
        self->_textContainer = v19;

        [(UITextView *)self _createTextEmphasisBackgroundViewIfNeeded];
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      id v21 = objc_alloc_init((Class)off_1E52D2F08);
      -[UITextView _assignTextStorageCheckingForOverrides:]((uint64_t)self, v21);

      id v10 = obj;
      if (v5) {
        goto LABEL_9;
      }
    }
    objc_storeStrong((id *)&self->_textContainer, v10);
    id v16 = [(UITextView *)self _newTextKit1LayoutControllerWithTextContainer:self->_textContainer layoutManager:v11 textStorage:self->_textStorage];
    objc_storeStrong((id *)&self->_textLayoutController, v16);
    id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v23 = *(void *)off_1E52D6E60;
    BOOL v24 = [v16 layoutManager];
    [v22 addObserver:self selector:sel__observedTextViewDidChange_ name:v23 object:v24];

    textEmphasisBackgroundView = self->_textEmphasisBackgroundView;
    if (textEmphasisBackgroundView)
    {
      [(UIView *)textEmphasisBackgroundView removeFromSuperview];
      int v26 = self->_textEmphasisBackgroundView;
      self->_textEmphasisBackgroundView = 0;
    }
    goto LABEL_13;
  }
  if (self->_textLayoutController) {
    goto LABEL_7;
  }
  +[_UITextLayoutControllerBase layoutControllerWithTextView:textContainer:]((uint64_t)_UITextLayoutControllerBase, self, obj);
  BOOL v12 = (_UITextLayoutController *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = self->_textLayoutController;
  self->_textLayoutController = v12;

  objc_storeStrong((id *)&self->_textContainer, a3);
  id v14 = [(_UITextLayoutController *)self->_textLayoutController textStorage];
  -[UITextView _assignTextStorageCheckingForOverrides:]((uint64_t)self, v14);

  if (v5)
  {
    CGFloat v15 = [obj textLayoutManager];

    if (v15) {
      [(UITextView *)self _createTextEmphasisBackgroundViewIfNeeded];
    }
  }
LABEL_14:
  containerView = self->_containerView;
  if (containerView)
  {
    if (v5 && (int v28 = _UITextViewAllowSelectionContainerInTextLayoutCanvas(), containerView = self->_containerView, v28))
    {
      [(_UITextContainerView *)containerView setSelectionContainerView:self->_selectionContainerView];
      [(UITextView *)self _createTextEmphasisBackgroundViewIfNeeded];
      double v29 = self->_textEmphasisBackgroundView;
    }
    else
    {
      [(_UITextContainerView *)containerView setSelectionContainerView:0];
      double v29 = 0;
    }
    [(_UITextContainerView *)self->_containerView setTextEmphasisBackgroundView:v29 withTextView:self];
  }
  double v30 = self;
  [(NSTextStorage *)self->_textStorage _setIntentResolver:v30];
}

- (void)_assignTextStorageCheckingForOverrides:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 2072), a2);
    *(void *)(a1 + 2144) &= ~0x200000000uLL;
    if (([*(id *)(a1 + 2072) isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      id v4 = (objc_class *)objc_opt_class();
      MethodIMP Implementation = class_getMethodImplementation(v4, sel_replaceCharactersInRange_withAttributedString_);
      id v6 = (objc_class *)objc_opt_class();
      *(void *)(a1 + 2144) = *(void *)(a1 + 2144) & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)(class_getMethodImplementation(v6, sel_replaceCharactersInRange_withAttributedString_) != MethodImplementation) << 33);
    }
  }
}

+ (id)_defaultTextColor
{
  uint64_t v2 = +[_UITextAttributeDefaults _unspecifiedDefaults];
  uint64_t v3 = [v2 _textView];
  id v4 = [v3 _textColor];

  return v4;
}

- (id)_newTextContainer
{
  id v3 = objc_alloc((Class)off_1E52D2EB8);
  [(UIView *)self bounds];
  return (id)objc_msgSend(v3, "initWithSize:", v4, 1.79769313e308);
}

- (id)_getDelegateZoomView
{
  v5.receiver = self;
  v5.super_class = (Class)UITextView;
  id v3 = [(UIScrollView *)&v5 _getDelegateZoomView];
  if (!v3) {
    id v3 = self->_containerView;
  }
  return v3;
}

- (UITextInputDelegate)inputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v3 = [WeakRetained inputDelegate];

  return (UITextInputDelegate *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  double v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UITextView;
  [(UIScrollView *)&v14 traitCollectionDidChange:v4];
  objc_super v5 = [(UIView *)self traitCollection];
  id v6 = v5;
  if (v5 && (!v4 || v5[13] != v4[13] || v5[15] != v4[15])) {
    -[UITextView _adjustFontForAccessibilityTraits:](self, "_adjustFontForAccessibilityTraits:", [v5 legibilityWeight] != objc_msgSend(v4, "legibilityWeight"));
  }
  id v7 = [v6 typesettingLanguage];
  uint64_t v8 = [v4 typesettingLanguage];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0) {
    [(UITextView *)self _adjustFontForTypesettingLanguage];
  }
  uint64_t v10 = [v6 userInterfaceStyle];
  if (v10 != [v4 userInterfaceStyle])
  {
    [(UITextView *)self _updateTextEffectsConfigurationIfNeeded];
    BOOL v11 = +[UIKeyboard usesInputSystemUI];
    BOOL v12 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    BOOL v13 = v12;
    if (v11) {
      [v12 traitCollectionDidChange];
    }
    else {
      [v12 updateRenderConfigForCurrentResponder];
    }
  }
}

- (UITextView)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  char v9 = textContainer;
  v12.receiver = self;
  v12.super_class = (Class)UITextView;
  uint64_t v10 = -[UIScrollView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v10) {
    -[UITextView _commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:](v10, "_commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:", v9, 0, 1, 1, 1, [(id)objc_opt_class() _isTextLayoutManagerEnabled]);
  }

  return v10;
}

+ (BOOL)_isTextLayoutManagerEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if ((_os_feature_enabled_impl() & 1) != 0 || (int v2 = dyld_program_sdk_at_least()) != 0) {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (void)_createTextEmphasisBackgroundViewIfNeeded
{
  if (!self->_textEmphasisBackgroundView && _UITextViewAllowSelectionContainerInTextLayoutCanvas())
  {
    id v3 = [[_UITextEmphasisBackgroundView alloc] initWithTextView:self];
    textEmphasisBackgroundView = self->_textEmphasisBackgroundView;
    self->_textEmphasisBackgroundView = v3;

    objc_super v5 = self->_textEmphasisBackgroundView;
    [(UIView *)v5 setHidden:1];
  }
}

- (void)adjustedContentInsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  [(UIScrollView *)&v3 adjustedContentInsetDidChange];
  [(UITextView *)self _resyncContainerFrameForNonAutolayoutDeferringSizeToFit:1];
}

- (void)layoutSubviews
{
  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  [(UIScrollView *)&v3 layoutSubviews];
  [(UITextView *)self _layoutText];
  [(UIView *)self->_containerView bounds];
  -[UIView setFrame:](self->_selectionContainerView, "setFrame:");
  [(_UITextViewSearchableObject *)self->_searchableObject layoutManagedSubviews];
}

- (void)_setFrameOrBounds:(CGRect)a3 fromOldRect:(CGRect)a4 settingAction:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  objc_super v14 = (void (**)(void))a5;
  if ([(UITextView *)self _freezeTextContainerSize])
  {
    v14[2](v14);
    [(UITextView *)self _resyncContainerFrameForNonAutolayoutDeferringSizeToFit:1];
    [(UITextInteractionAssistant *)self->_interactionAssistant updateDisplayedSelection];
  }
  else
  {
    if ([(UIScrollView *)self isScrollEnabled] && vabdd_f64(v10, width) >= 2.22044605e-16)
    {
      unint64_t v17 = [(UITextView *)self _visibleRangeWithLayout:0];
      uint64_t v16 = v24;
      if ([(UITextView *)self isEditing])
      {
        unint64_t v25 = [(UITextView *)self selectedRange];
        BOOL v15 = v25 < v17 + v16 && v17 < v25 + v26;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
      uint64_t v16 = 0;
      unint64_t v17 = 0;
    }
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v35[0] = (double (*)(id, double, double))MEMORY[0x1E4F143A8];
      v35[1] = (double (*)(id, double, double))3221225472;
      v35[2] = (double (*)(id, double, double))__58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke;
      v35[3] = (double (*)(id, double, double))&unk_1E530C020;
      v35[4] = (double (*)(id, double, double))self;
      uint64_t v18 = _UITextLayoutSizeWillShrink(v35, width, height, v10, v9);
    }
    else
    {
      uint64_t v18 = 0;
    }
    double v19 = [(UIView *)self layer];
    char v20 = [v19 needsLayoutOnGeometryChange];

    if (v18)
    {
      id v21 = [(UIView *)self layer];
      [v21 setNeedsLayoutOnGeometryChange:0];
    }
    v14[2](v14);
    [(UITextView *)self _resyncContainerFrameForNonAutolayoutDeferringSizeToFit:v18];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke_2;
    aBlock[3] = &unk_1E530BD90;
    char v32 = v18;
    aBlock[4] = self;
    *(CGFloat *)&aBlock[5] = v12;
    *(CGFloat *)&aBlock[6] = v11;
    *(double *)&aBlock[7] = v10;
    *(double *)&aBlock[8] = v28;
    *(CGFloat *)&aBlock[9] = x;
    *(CGFloat *)&aBlock[10] = y;
    *(double *)&aBlock[11] = width;
    *(double *)&aBlock[12] = height;
    aBlock[13] = v17;
    aBlock[14] = v16;
    BOOL v33 = v15;
    char v34 = v20;
    id v22 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v23 = v22;
    if (v18)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke_3;
      v29[3] = &unk_1E52DA040;
      double v30 = v22;
      +[UIViewAnimationState _addSystemPostAnimationAction:v29];
    }
    else
    {
      v22[2](v22);
    }
    if (![(UIView *)self _wantsAutolayout]
      && (*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0
      && (v10 != width || v28 != height))
    {
      self->_lastBaselineOffsetFromBottom = 0.0;
      self->_firstBaselineOffsetFromTop = 0.0;
    }
  }
}

- (void)_layoutText
{
  p_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = &self->_tvFlags;
  if (*((unsigned char *)&self->_tvFlags + 1))
  {
    [(_UITextContainerView *)self->_containerView sizeToFit];
    *(void *)&self->_tvFlags &= ~0x100uLL;
  }
  [(UITextView *)self _resyncContainerFrameForNonAutolayout];
  if ((*((unsigned char *)p_tvFlags + 1) & 2) == 0) {
    [(UITextView *)self _scrollToSelectionIfNeeded];
  }
  [(UITextView *)self _layoutPlaceholder];
  if (([(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager] & 1) == 0)
  {
    [(UITextView *)self updateSelection];
  }
}

- (void)_resyncContainerFrameForNonAutolayout
{
}

- (void)_layoutPlaceholder
{
  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel && ![(UIView *)placeholderLabel isHidden])
  {
    [(UIView *)self bringSubviewToFront:self->_placeholderLabel];
    double v4 = [(UITextView *)self textLayoutController];
    [v4 extraLineFragmentRect];
    double v6 = v5;
    double v8 = v7;
    uint64_t rect = v9;
    CGFloat v11 = v10;

    CGFloat v12 = [(UITextView *)self font];
    [v12 ascender];
    double v14 = v8 + v13;

    [(UITextView *)self textContainerInset];
    double v47 = v14 + fmax(v15, self->_textContainerInsetAdjustment.top);
    [(UITextView *)self textContainerInset];
    double v17 = fmax(v16, self->_textContainerInsetAdjustment.top);
    double v19 = fmax(v18, self->_textContainerInsetAdjustment.left);
    double v21 = fmax(v20, self->_textContainerInsetAdjustment.bottom);
    double v23 = fmax(v22, self->_textContainerInsetAdjustment.right);
    if (self->_horizontalTextContainerGeometryAdjustment >= 0.0) {
      double horizontalTextContainerGeometryAdjustment = v19;
    }
    else {
      double horizontalTextContainerGeometryAdjustment = self->_horizontalTextContainerGeometryAdjustment;
    }
    unint64_t v25 = [(UITextView *)self textContainer];
    [v25 lineFragmentPadding];
    double v27 = horizontalTextContainerGeometryAdjustment + v26;

    double v28 = [(UITextView *)self textContainer];
    [v28 lineFragmentPadding];
    double v30 = v23 + v29;

    double v31 = v6 + v27;
    char v32 = [(UITextView *)self textContainer];
    [v32 size];
    double v34 = v33;
    v49.origin.CGFloat x = v6;
    v49.origin.CGFloat y = v8;
    v49.size.double width = recta;
    v49.size.double height = v11;
    double v35 = v30 + v34 - CGRectGetMaxX(v49);

    [(UIView *)self bounds];
    double v37 = v31 + v36;
    double v39 = v38 - (v31 + v35);
    double v41 = v40 - (v17 + v21);
    -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", v39, 0.0);
    if (v41 >= v42) {
      double v41 = v42;
    }
    [(UILabel *)self->_placeholderLabel _firstBaselineOffsetFromTop];
    double v44 = self->_placeholderLabel;
    -[UILabel setFrame:](v44, "setFrame:", v37, v47 - v43, v39, v41);
  }
}

void __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 120))
  {
    [*(id *)(a1 + 32) _setNeedsTextLayout];
    [*(id *)(a1 + 32) _updateTextContainerSizeAndSizeToFit];
  }
  if (*(double *)(a1 + 56) > *(double *)(a1 + 88) || *(double *)(a1 + 64) > *(double *)(a1 + 96))
  {
    int v2 = [*(id *)(*(void *)(a1 + 32) + 2680) usesTiledViews];
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 2088);
    if (v2)
    {
      [v3 setNeedsLayout];
    }
    else
    {
      double v4 = [v3 canvasView];
      [v4 viewportBoundsDidChange];
    }
  }
  if (*(void *)(a1 + 112))
  {
    double v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_contentOffsetForScrollToVisible:", *(void *)(a1 + 104), 1);
    objc_msgSend(v5, "setContentOffset:");
    if (*(unsigned char *)(a1 + 121)) {
      *(void *)(*(void *)(a1 + 32) + 2144) |= 1uLL;
    }
  }
  id v6 = [*(id *)(a1 + 32) layer];
  [v6 setNeedsLayoutOnGeometryChange:*(unsigned __int8 *)(a1 + 122)];
}

- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset
{
  CGFloat right = textContainerInset.right;
  CGFloat bottom = textContainerInset.bottom;
  CGFloat left = textContainerInset.left;
  double top = textContainerInset.top;
  self->_unadjustedTextContainerInset = textContainerInset;
  if ([(UITextView *)self _freezeTextContainerSize])
  {
    self->_duringFreezingTextContainerInset.double top = top;
    self->_duringFreezingTextContainerInset.CGFloat left = left;
    self->_duringFreezingTextContainerInset.CGFloat bottom = bottom;
    self->_duringFreezingTextContainerInset.CGFloat right = right;
  }
  else
  {
    if (self->_scrollPosition)
    {
      double v8 = fmax(top, self->_textContainerInsetAdjustment.top);
      [(_UITextContainerView *)self->_containerView textContainerInset];
      self->_offsetFromScrollPosition = self->_offsetFromScrollPosition + v9 - v8;
    }
    double v10 = [(_UITextContainerView *)self->_containerView textContainer];
    [v10 size];
    double v12 = v11;
    double v14 = v13;

    -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
    double v15 = [(_UITextContainerView *)self->_containerView textContainer];
    [v15 size];
    double v17 = v16;
    double v19 = v18;

    if (v12 != v17 || v14 != v19) {
      [(UITextView *)self _invalidateContainerViewSize];
    }
    if ((*(unsigned char *)&self->_tvFlags & 0x20) != 0)
    {
      id v21 = [(UITextView *)self interactionAssistant];
      [v21 setNeedsSelectionDisplayUpdate];
    }
  }
}

- (UITextInteractionAssistant)interactionAssistant
{
  return self->_interactionAssistant;
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  [(UIScrollView *)&v3 setNeedsLayout];
  [(UITextView *)self _setNeedsTextLayout];
}

- (void)_setNeedsTextLayout
{
  objc_super v3 = [(UIView *)self->_layoutView superview];

  if (v3 != self) {
    [(UIView *)self insertSubview:self->_layoutView atIndex:0];
  }
  layoutView = self->_layoutView;
  [(UIView *)layoutView setNeedsLayout];
}

- (void)_textContainerSizeDidChange:(id)a3
{
  [(UITextView *)self _updateContentSize];
  [(UITextView *)self _updateTextFormattingControllerPresentationSource];
}

- (void)_updateContentSize
{
  [(UIView *)self->_containerView frame];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(_UITextContainerView *)self->_containerView layoutOrientation];
  if (v7 == 1)
  {
    [(_UITextViewContentPadding *)self->_bottomContentPadding currentValue];
    double v4 = v4 + v9;
  }
  else if (!v7)
  {
    [(_UITextViewContentPadding *)self->_bottomContentPadding currentValue];
    double v6 = v6 + v8;
  }
  [(UIScrollView *)self contentSize];
  double v12 = vabdd_f64(v11, v4);
  BOOL v13 = vabdd_f64(v10, v6) < 0.00000011920929 && v12 < 0.00000011920929;
  if (v13 || [(UIScrollView *)self _isScrollingToTop])
  {
    if ((*((unsigned char *)&self->_tvFlags + 1) & 1) == 0)
    {
      -[UITextView _updateFrameOfTrailingWhitespace:](self, "_updateFrameOfTrailingWhitespace:", v4, v6);
    }
  }
  else
  {
    ++self->_contentSizeUpdateSeqNo;
    ++self->_scrollPositionDontRecordCount;
    int64_t contentSizeUpdateSeqNo = self->_contentSizeUpdateSeqNo;
    id WeakRetained = self->_scrollPosition;
    if ([(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager])
    {
      BOOL v15 = 0;
    }
    else
    {
      [(UIScrollView *)self contentSize];
      BOOL v15 = v16 == v4;
    }
    -[UIScrollView setContentSize:](self, "setContentSize:", v4, v6);
    -[UITextView _updateFrameOfTrailingWhitespace:](self, "_updateFrameOfTrailingWhitespace:", v4, v6);
    [(UIScrollView *)self contentOffset];
    double v19 = v18;
    double v20 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v21 = [(_UITextViewRestorableScrollPosition *)WeakRetained range];
      -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", v21, v22);
      double v20 = WeakRetained;
    }
    double v23 = v17;
    double v24 = v18;
    [(_UITextViewRestorableScrollPosition *)v20 offsetWithinLine];
    double v26 = v24 + v25 + self->_offsetFromScrollPosition;
    int64_t v27 = self->_contentSizeUpdateSeqNo;
    if (v27 == contentSizeUpdateSeqNo)
    {
      -[UIScrollView _adjustedContentOffsetForContentOffset:](self, "_adjustedContentOffsetForContentOffset:", v23, v26);
      double v23 = v28;
      double v26 = v29;
      int64_t v27 = self->_contentSizeUpdateSeqNo;
      if (v27 == contentSizeUpdateSeqNo && !v15)
      {
        [(NSTextContainer *)self->_textContainer textContainerOrigin];
        double v59 = v32;
        double v60 = v31;
        double v33 = [(NSTextContainer *)self->_textContainer textView];
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v33, v23, v26);
        double v58 = v34;
        double v36 = v35;

        [(UIView *)self bounds];
        double v38 = v37;
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        id v45 = [(NSTextContainer *)self->_textContainer textView];
        -[UIView convertRect:toView:](self, "convertRect:toView:", v45, v38, v40, v42, v44);
        double v47 = v46;
        double v49 = v48;

        -[_UITextLayoutController ensureLayoutForBounds:inTextContainer:](self->_textLayoutController, "ensureLayoutForBounds:inTextContainer:", self->_textContainer, v58 - v60, v36 - v59, v47, v49);
        int64_t v27 = self->_contentSizeUpdateSeqNo;
      }
    }
    if (v27 == contentSizeUpdateSeqNo && vabdd_f64(v19, v26) >= 0.5)
    {
      -[UITextView _setContentOffsetWithoutRecordingScrollPosition:](self, "_setContentOffsetWithoutRecordingScrollPosition:", v23, v26);
      scrollTarget = self->_scrollTarget;
      if (scrollTarget)
      {
        uint64_t v51 = [(_UITextViewRestorableScrollPosition *)scrollTarget range];
        -[UITextView _contentOffsetForScrollToVisible:](self, "_contentOffsetForScrollToVisible:", v51, v52);
        double v54 = v53;
        double v56 = v55;
        [(_UITextViewRestorableScrollPosition *)self->_scrollTarget offsetWithinLine];
        -[UIScrollView _updateScrollAnimationForChangedTargetOffset:](self, "_updateScrollAnimationForChangedTargetOffset:", v54, v56 + v57);
      }
      -[_UITextLayoutController resetTextViewportLayoutControllerLayoutForPosition:](self->_textLayoutController, "resetTextViewportLayoutControllerLayoutForPosition:", 0, *(void *)&v58);
      --self->_scrollPositionDontRecordCount;

      id WeakRetained = (_UITextViewRestorableScrollPosition *)objc_loadWeakRetained((id *)&self->_inputController);
      [(_UITextViewRestorableScrollPosition *)WeakRetained _selectionGeometryChanged];
    }
    else
    {
      --self->_scrollPositionDontRecordCount;
    }
  }
}

- (void)_updateFrameOfTrailingWhitespace:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if ([(NSTextStorage *)self->_textStorage length])
  {
    -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", [(NSTextStorage *)self->_textStorage length], 0);
    CGFloat x = v11.origin.x;
    CGFloat v7 = v11.size.height;
    CGFloat MaxY = CGRectGetMaxY(v11);
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = MaxY;
    v12.size.CGFloat width = width;
    v12.size.double height = v7;
    CGFloat MinX = CGRectGetMinX(v12);
    self->_frameOfTrailingWhitespace.origin.CGFloat x = x;
    self->_frameOfTrailingWhitespace.origin.CGFloat y = MaxY;
    self->_frameOfTrailingWhitespace.size.CGFloat width = width;
    self->_frameOfTrailingWhitespace.size.double height = height - MinX;
  }
  else
  {
    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_frameOfTrailingWhitespace.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_frameOfTrailingWhitespace.size = v10;
  }
}

- (CGRect)_rectForScrollToVisible:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v6 = [(UITextView *)self textStorage];
  unint64_t v7 = [v6 length];

  if (v7)
  {
    if (!length)
    {
      if (location >= v7)
      {
        NSUInteger length = 1;
      }
      else
      {
        double v8 = [(UITextView *)self textStorage];
        double v9 = [v8 string];
        NSUInteger location = [v9 rangeOfComposedCharacterSequenceAtIndex:location];
        NSUInteger length = v10;
      }
    }
    if (length + location >= v7)
    {
      CGRect v11 = [(UITextView *)self textStorage];
      CGRect v12 = [v11 string];
      NSUInteger location = [v12 rangeOfComposedCharacterSequenceAtIndex:v7 - 1];
      NSUInteger length = v13;
    }
  }
  else
  {
    NSUInteger location = 0;
    NSUInteger length = 0;
  }
  textLayoutController = self->_textLayoutController;
  -[UITextView _adjustedTextContainerInset]((double *)self);
  -[_UITextLayoutController unionRectForCharacterRange:bottomInset:](textLayoutController, "unionRectForCharacterRange:bottomInset:", location, length, v15);
  double x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  if (CGRectIsNull(v37))
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  if (width <= 0.0) {
    double width = 1.0;
  }
  [(NSTextContainer *)self->_textContainer textContainerOrigin];
  double v21 = x + v20;
  double v23 = y + v22;
  double v24 = [(NSTextContainer *)self->_textContainer textView];
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v24, v21, v23, width, height);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  double v33 = v26;
  double v34 = v28;
  double v35 = v30;
  double v36 = v32;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (double)_adjustedTextContainerInset
{
  if (!a1) {
    return 0.0;
  }
  [a1 textContainerInset];
  return fmax(v2, a1[293]);
}

- (UIEdgeInsets)textContainerInset
{
  double top = self->_unadjustedTextContainerInset.top;
  double left = self->_unadjustedTextContainerInset.left;
  double bottom = self->_unadjustedTextContainerInset.bottom;
  double right = self->_unadjustedTextContainerInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSTextStorage)textStorage
{
  return self->_textStorage;
}

- (_NSRange)_visibleRangeWithLayout:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  NSUInteger v13 = [(NSTextContainer *)self->_textContainer textView];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  textLayoutController = self->_textLayoutController;
  double v23 = [(UITextView *)self textContainer];
  double v24 = -[_UITextLayoutController textRangeForBounds:inTextContainer:layoutIfNeeded:](textLayoutController, "textRangeForBounds:inTextContainer:layoutIfNeeded:", v23, v3, v15, v17, v19, v21);

  uint64_t v25 = [(_UITextLayoutController *)self->_textLayoutController characterRangeForTextRange:v24];
  NSUInteger v27 = v26;

  NSUInteger v28 = v25;
  NSUInteger v29 = v27;
  result.NSUInteger length = v29;
  result.NSUInteger location = v28;
  return result;
}

- (CGSize)_containerSizeForBoundsSize:(CGSize)a3 allowingOverflow:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(_UITextContainerView *)self->_containerView textContainerInset];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = 1.79769313e308;
  if (width <= 1.79769313e308) {
    double v17 = width;
  }
  else {
    double v17 = 1.79769313e308;
  }
  if (height <= 1.79769313e308) {
    double v16 = height;
  }
  -[UIView convertSize:toView:](self, "convertSize:toView:", self->_containerView, v17, v16);
  double v20 = v18;
  double v21 = v19;
  if (v4)
  {
    if (v18 == 0.0 || [(_UITextContainerView *)self->_containerView layoutOrientation] == 1)
    {
      double v21 = v21 - (v9 + v13);
      double v20 = 1.79769313e308;
    }
    if (v21 == 0.0 || ![(_UITextContainerView *)self->_containerView layoutOrientation])
    {
      double v20 = v20 - (v11 + v15);
      double v21 = 1.79769313e308;
    }
  }
  else
  {
    double v20 = v18 - (v11 + v15);
    double v21 = v19 - (v9 + v13);
  }
  if (v20 < 1.79769313e308) {
    double v20 = v20 + fabs(self->_horizontalTextContainerGeometryAdjustment);
  }
  double v22 = 0.0;
  if (v21 >= 0.0) {
    double v23 = v21;
  }
  else {
    double v23 = 0.0;
  }
  if (v20 >= 0.0) {
    double v22 = v20;
  }
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)_ensureUpToDateTextContainerInsetAndNotifyIfNecessary
{
  if (!a1) {
    return;
  }
  [*(id *)(a1 + 2088) textContainerInset];
  double v6 = v5;
  double v7 = v2;
  double v8 = v3;
  double v9 = v4;
  double v10 = fmax(*(double *)(a1 + 2312), *(double *)(a1 + 2344));
  double v11 = fmax(*(double *)(a1 + 2320), *(double *)(a1 + 2352));
  double v12 = fmax(*(double *)(a1 + 2328), *(double *)(a1 + 2360));
  double v13 = fmax(*(double *)(a1 + 2336), *(double *)(a1 + 2368));
  double v14 = *(double *)(a1 + 2376) >= 0.0 ? v11 : *(double *)(a1 + 2376);
  BOOL v15 = v14 == v2 && v10 == v6;
  BOOL v16 = v15 && v13 == v4;
  if (v16 && v12 == v3) {
    return;
  }
  char v18 = [(id)a1 isScrollEnabled];
  if ((*(void *)(a1 + 96) & 0x400000000000000) != 0)
  {
    [(id)a1 bounds];
    CGFloat v36 = v28;
    CGFloat v37 = v27;
    CGFloat v34 = v30;
    CGFloat v35 = v29;
    id v38 = 0;
    BOOL v23 = 1;
LABEL_23:
    double v32 = *MEMORY[0x1E4F1DB30];
    double v33 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_24;
  }
  id v38 = [(id)a1 superview];
  [(id)a1 bounds];
  CGFloat v36 = v22;
  CGFloat v37 = v21;
  BOOL v23 = v38 == 0;
  if (v38) {
    char v24 = v18;
  }
  else {
    char v24 = 1;
  }
  CGFloat v34 = v20;
  CGFloat v35 = v19;
  if (v24) {
    goto LABEL_23;
  }
  objc_msgSend((id)a1, "sizeThatFits:", v19, v20);
  double v32 = v25;
  double v33 = v26;
  BOOL v23 = 0;
LABEL_24:
  objc_msgSend(*(id *)(a1 + 2088), "setTextContainerInset:", v10, v14, v12, v13);
  if ((v18 & 1) == 0)
  {
    [(id)a1 _updateBaselineInformationDependentOnBounds];
    uint64_t v31 = *(void *)(a1 + 96);
    if (v23)
    {
      if ((v31 & 0x400000000000000) != 0
        && ([(id)a1 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
      {
        [(id)a1 invalidateIntrinsicContentSize];
      }
    }
    else if ((v31 & 0x8000000000000000) == 0)
    {
      if (vabdd_f64(v10 + v12, v6 + v8) > 2.22044605e-16)
      {
        v40.origin.double y = v36;
        v40.origin.double x = v37;
        v40.size.double height = v34;
        v40.size.double width = v35;
        if (vabdd_f64(CGRectGetHeight(v40), v33) <= 2.22044605e-16) {
          goto LABEL_37;
        }
      }
      if (vabdd_f64(v13 + v14, v7 + v9) > 2.22044605e-16)
      {
        v41.origin.double y = v36;
        v41.origin.double x = v37;
        v41.size.double height = v34;
        v41.size.double width = v35;
        if (vabdd_f64(CGRectGetWidth(v41), v32) <= 2.22044605e-16) {
LABEL_37:
        }
          [v38 setNeedsLayout];
      }
    }
  }
}

- (BOOL)_documentRangeEqualToViewportRange
{
  double v3 = [(_UITextLayoutController *)self->_textLayoutController viewportRangeForTextContainer:self->_textContainer];
  double v4 = [(_UITextLayoutController *)self->_textLayoutController documentRange];
  if (v3)
  {
    id v5 = v3;
    id v6 = v4;
    double v7 = v6;
    if (v5 == v6)
    {
      char v8 = 1;
    }
    else if (v6)
    {
      char v8 = [v5 isEqual:v6];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_invalidateContainerViewSize
{
  *(void *)&self->_tvFlags |= 0x100uLL;
  [(UITextView *)self _setNeedsTextLayout];
}

id __24__UITextView_setBounds___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UITextView;
  return objc_msgSendSuper2(&v2, sel_setBounds_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id __23__UITextView_setFrame___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UITextView;
  return objc_msgSendSuper2(&v2, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__UITextView__shouldInvalidateLayoutForLinkAttributesChange__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)setAllowedWritingToolsResultOptions:(unint64_t)a3
{
  -[UITextView _raiseIfNecessaryForWritingToolsResultOptions:]((uint64_t)self, a3);
  id v5 = [(UITextView *)self writingToolsCoordinator];
  [v5 setPreferredResultOptions:a3];
}

- (void)tintColorDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)UITextView;
  [(UIView *)&v10 tintColorDidChange];
  double v3 = [(UITextView *)self _textInputTraits];
  double v4 = [(UIView *)self _inheritedInteractionTintColor];
  [v3 _setColorsToMatchTintColor:v4];

  if ([(UITextView *)self isEditing])
  {
    BOOL v5 = +[UIKeyboard usesInputSystemUI];
    id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v7 = v6;
    if (v5) {
      [v6 traitCollectionDidChange];
    }
    else {
      [v6 updateRenderConfigForCurrentResponder];
    }

    [(UITextView *)self updateSelection];
  }
  if (!self->_linkTextAttributes
    && ([(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager] & 1) == 0)
  {
    char v8 = [(UIView *)self tintColor];
    double v9 = v8;
    if (v8)
    {
      if (([v8 isEqual:self->_cachedTintColor] & 1) == 0)
      {
        objc_storeStrong((id *)&self->_cachedTintColor, v9);
        [(UITextView *)self _invalidateLayoutForLinkAttributesChange:1];
      }
    }
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ([(id)objc_opt_class() instancesRespondToSelector:a3])
  {
    BOOL v5 = [(UITextView *)self _textInputTraits];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextView;
    BOOL v5 = [(UITextView *)&v7 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (id)_textInputTraits
{
  p_inputController = &self->_inputController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v5 = objc_opt_respondsToSelector();

  id v6 = objc_loadWeakRetained((id *)p_inputController);
  objc_super v7 = v6;
  if (v5)
  {
    char v8 = [v6 _textInputTraits];
  }
  else
  {

    if (v7)
    {
      double v9 = (UITextInputTraits *)objc_loadWeakRetained((id *)p_inputController);
    }
    else
    {
      textInputTraits = self->_textInputTraits;
      if (!textInputTraits)
      {
        double v11 = +[UITextInputTraits defaultTextInputTraits];
        double v12 = self->_textInputTraits;
        self->_textInputTraits = v11;

        textInputTraits = self->_textInputTraits;
      }
      double v9 = textInputTraits;
    }
    char v8 = v9;
  }
  return v8;
}

- (UITextView)initWithFrame:(CGRect)a3
{
  return -[UITextView initWithFrame:textContainer:](self, "initWithFrame:textContainer:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_scrollToSelectionIfNeeded
{
  if (*(unsigned char *)&self->_tvFlags)
  {
    if ([(UIScrollView *)self isScrollEnabled]
      && [(UITextView *)self isEditing]
      && [(UITextView *)self _isSelectionVisible])
    {
      [(UIScrollView *)self _contentOffsetAnimationDuration];
      double v4 = v3;
      [(UIScrollView *)self _setContentOffsetAnimationDuration:0.1];
      [(UITextView *)self scrollSelectionToVisible:1];
      [(UIScrollView *)self _setContentOffsetAnimationDuration:v4];
    }
    else if ([(UITextView *)self _shouldScrollEnclosingScrollView])
    {
      [(UITextView *)self _scrollSelectionToVisibleInContainingScrollView];
    }
    *(void *)&self->_tvFlags &= ~1uLL;
  }
}

- (CGRect)visibleRect
{
  [(UITextView *)self visibleRectIgnoringKeyboard];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(UITextView *)self isEditing])
  {
    double v11 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v11, "subtractKeyboardFrameFromRect:inView:", self, v4, v6, v8, v10);
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)setInputAccessoryView:(UIView *)inputAccessoryView
{
}

- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled
{
  if (self->_findInteractionEnabled != findInteractionEnabled)
  {
    self->_findInteractionEnabled = findInteractionEnabled;
    if (findInteractionEnabled)
    {
      if (!self->_searchableObject)
      {
        double v4 = [[_UITextViewSearchableObject alloc] initWithTextView:self];
        searchableObject = self->_searchableObject;
        self->_searchableObject = v4;
      }
      findInteraction = self->_findInteraction;
      if (!findInteraction)
      {
        double v7 = [[UIFindInteraction alloc] initWithSessionDelegate:self];
        double v8 = self->_findInteraction;
        self->_findInteraction = v7;

        findInteraction = self->_findInteraction;
      }
      [(UIView *)self addInteraction:findInteraction];
    }
    else
    {
      [(UIView *)self removeInteraction:self->_findInteraction];
      double v9 = self->_searchableObject;
      self->_searchableObject = 0;

      double v10 = self->_findInteraction;
      self->_findInteraction = 0;
    }
  }
}

- (void)setMaxTileHeight:(double)a3
{
}

- (UIFindInteraction)findInteraction
{
  return self->_findInteraction;
}

- (id)_placeholderLabel
{
  return self->_placeholderLabel;
}

- (id)_containerView
{
  return self->_containerView;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __23__UITextView_setFrame___block_invoke;
  v12[3] = &unk_1E52DA520;
  *(double *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(double *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = self;
  -[UITextView _setFrameOrBounds:fromOldRect:settingAction:](self, "_setFrameOrBounds:fromOldRect:settingAction:", v12, x, y, width, height, v8, v9, v10, v11);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __24__UITextView_setBounds___block_invoke;
  v12[3] = &unk_1E52DA520;
  *(double *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(double *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = self;
  -[UITextView _setFrameOrBounds:fromOldRect:settingAction:](self, "_setFrameOrBounds:fromOldRect:settingAction:", v12, x, y, width, height, v8, v9, v10, v11);
}

- (void)setTextDropDelegate:(id)a3
{
}

- (void)setTextDragDelegate:(id)a3
{
}

- (void)setPasteDelegate:(id)a3
{
}

- (void)_setAllowedTypingAttributes:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _setAllowedTypingAttributes:v4];
}

- (void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes
{
  BOOL v3 = allowsEditingTextAttributes;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained setAllowsEditingTextAttributes:v3];
}

- (void)_textViewContentPaddingDidChange:(id)a3
{
  if (self->_bottomContentPadding == a3) {
    [(UITextView *)self _updateContentSize];
  }
}

- (void)_updateTextFormattingControllerPresentationSource
{
  uint64_t v3 = [(UIView *)self superview];
  id v4 = (void *)v3;
  if (v3) {
    double v5 = (UITextView *)v3;
  }
  else {
    double v5 = self;
  }
  double v46 = v5;

  textFormattingViewController = self->_textFormattingViewController;
  if (!textFormattingViewController
    || [(UIViewController *)textFormattingViewController isBeingDismissed])
  {
    goto LABEL_23;
  }
  double v7 = [(UIViewController *)self->_textFormattingViewController popoverPresentationController];
  double v8 = [v7 sourceView];
  if (v8 != v46)
  {
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  double v9 = [(UIViewController *)self->_textFormattingViewController popoverPresentationController];
  [v9 sourceRect];
  if (!CGRectEqualToRect(v48, *MEMORY[0x1E4F1DB20]))
  {

    double v8 = v46;
    goto LABEL_21;
  }
  uint64_t v10 = [(UITextView *)self selectedRange];
  unint64_t v12 = v10 + v11;
  double v13 = [(UITextView *)self textStorage];
  unint64_t v14 = [v13 length];

  if (v12 <= v14)
  {
    [(UIViewController *)self->_textFormattingViewController preferredContentSize];
    double v16 = v15;
    double v18 = v17;
    double v19 = [(UIResponder *)self _textInteraction];
    double v20 = [v19 assistantDelegate];
    double v21 = [v20 _editMenuAssistant];
    [v21 _editMenuTargetRect];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    -[UIView convertRect:toView:](self, "convertRect:toView:", v46, v23, v25, v27, v29);
    double v31 = v30;
    double MidY = v32;
    double v35 = v34;
    double v37 = v36;
    id v38 = [(UIView *)self window];
    [v38 frame];
    double v40 = v39;
    double v42 = v41;

    if (v40 - v35 + -40.0 < v16 && v42 - v37 + -40.0 < v18)
    {
      v49.origin.double x = v31;
      v49.origin.double y = MidY;
      v49.size.double width = v35;
      v49.size.double height = v37;
      CGFloat MidX = CGRectGetMidX(v49);
      v50.origin.double x = v31;
      v50.origin.double y = MidY;
      v50.size.double width = v35;
      v50.size.double height = v37;
      double MidY = CGRectGetMidY(v50);
      double v35 = 1.0;
      double v31 = MidX;
      double v37 = 1.0;
    }
    if ((v31 != *MEMORY[0x1E4F1DAD8] || MidY != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
      && (v35 != *MEMORY[0x1E4F1DB30] || v37 != *(double *)(MEMORY[0x1E4F1DB30] + 8)))
    {
      double v44 = [(UITextFormattingViewController *)self->_textFormattingViewController configuration];
      if ([v44 _isTextAnimationsConfiguration]) {
        double v45 = -6.0;
      }
      else {
        double v45 = -10.0;
      }

      double v7 = [(UIViewController *)self->_textFormattingViewController popoverPresentationController];
      v51.origin.double x = v31;
      v51.origin.double y = MidY;
      v51.size.double width = v35;
      v51.size.double height = v37;
      CGRect v52 = CGRectInset(v51, -10.0, v45);
      objc_msgSend(v7, "setSourceRect:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
      goto LABEL_22;
    }
  }
LABEL_23:
}

- (void)setLinkTextAttributes:(NSDictionary *)linkTextAttributes
{
  id v4 = (NSDictionary *)[(NSDictionary *)linkTextAttributes copy];
  double v5 = self->_linkTextAttributes;
  self->_linkTextAttributes = v4;

  [(UITextView *)self _invalidateLayoutForLinkAttributesChange:0];
}

- (id)_allowedTypingAttributes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  uint64_t v3 = [WeakRetained _allowedTypingAttributes];

  return v3;
}

- (void)_invalidateLayoutForLinkAttributesChange:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITextView *)self _shouldInvalidateLayoutForLinkAttributesChange])
  {
    id v6 = [(_UITextLayoutController *)self->_textLayoutController documentRange];
    if (([(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager] & 1) == 0)
    {
      double v5 = [(_UITextContainerView *)self->_containerView canvasView];
      [v5 setLayoutFragmentViewsNeedDisplay:v3];
    }
    [(_UITextLayoutController *)self->_textLayoutController invalidateLayoutForRange:v6];
    if ([(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager])[(_UITextContainerView *)self->_containerView setNeedsDisplay]; {
  }
    }
}

- (BOOL)_shouldInvalidateLayoutForLinkAttributesChange
{
  BOOL v3 = [(_UITextLayoutController *)self->_textLayoutController documentRange];
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (([v3 isEmpty] & 1) == 0)
  {
    textStorage = self->_textStorage;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__UITextView__shouldInvalidateLayoutForLinkAttributesChange__block_invoke;
    v7[3] = &unk_1E52DF988;
    void v7[4] = &v8;
    [(NSTextStorage *)textStorage coordinateReading:v7];
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (UITextPosition)endOfDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  BOOL v3 = [WeakRetained endOfDocument];

  return (UITextPosition *)v3;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategordouble y = a3;
    placeholderLabel = self->_placeholderLabel;
    if (placeholderLabel) {
      -[UILabel setAdjustsFontForContentSizeCategory:](placeholderLabel, "setAdjustsFontForContentSizeCategory:");
    }
    [(UITextView *)self _adjustFontForAccessibilityTraits:0];
  }
}

- (CGRect)caretRectForPosition:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained caretRectForPosition:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)_updateBaselineInformationDependentOnBounds
{
  id v14 = [(UITextView *)self textLayoutController];
  BOOL v3 = [v14 documentRange];
  if ([v3 isEmpty]) {
    goto LABEL_2;
  }
  id v4 = [v14 textContainers];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    BOOL v6 = [(UIView *)self _wantsAutolayout];
    if (v6)
    {
      BOOL v3 = [(UIView *)self _layoutEngineCreateIfNecessary];
      if (!v3)
      {
LABEL_2:

        goto LABEL_7;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
    _UIBaselineLayoutBoundsConsultingContentSizeConstraints(self);
    double firstBaselineOffsetFromTop = self->_firstBaselineOffsetFromTop;
    double lastBaselineOffsetFromBottom = self->_lastBaselineOffsetFromBottom;
    -[UITextView _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", v9, v10);
    if (firstBaselineOffsetFromTop != v11 || lastBaselineOffsetFromBottom != v12)
    {
      self->_double firstBaselineOffsetFromTop = v11;
      self->_double lastBaselineOffsetFromBottom = v12;
      if (v6) {
        [(UIView *)self _invalidateBaselineConstraints];
      }
    }
    goto LABEL_2;
  }
LABEL_7:
}

- (_UITextLayoutController)textLayoutController
{
  return self->_textLayoutController;
}

void __60__UITextView__shouldInvalidateLayoutForLinkAttributesChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)off_1E52D2110;
  id v4 = a2;
  uint64_t v5 = [v4 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__UITextView__shouldInvalidateLayoutForLinkAttributesChange__block_invoke_2;
  v6[3] = &unk_1E52DE5D8;
  v6[4] = *(void *)(a1 + 32);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v5, 0, v6);
}

void __48__UITextView__adjustFontForAccessibilityTraits___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__UITextView__adjustFontForAccessibilityTraits___block_invoke_2;
  v8[3] = &unk_1E52D9A58;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  id v9 = v5;
  id v7 = v3;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0x100000, v8);
}

void __47__UITextView__adjustFontForTypesettingLanguage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__UITextView__adjustFontForTypesettingLanguage__block_invoke_2;
  v8[3] = &unk_1E52D9A58;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  id v9 = v5;
  id v7 = v3;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0x100000, v8);
}

- (void)_updateTextFormattingController
{
  if ([(UIView *)self isFirstResponder])
  {
    id v3 = +[UISubstituteKeyboardSession activeSession];

    if (v3)
    {
      uint64_t v4 = +[UISubstituteKeyboardSession activeSession];
      id v5 = [(UITextView *)self _descriptorForTextFormattingOptions];
      [v4 setFormattingDescriptor:v5];
    }
  }
  if (self->_textFormattingViewController)
  {
    uint64_t v6 = [(UITextView *)self _descriptorForTextFormattingOptions];
    [(UITextFormattingViewController *)self->_textFormattingViewController setFormattingDescriptor:v6];

    [(UITextView *)self _updateTextFormattingControllerPresentationSource];
  }
}

- (NSDictionary)linkTextAttributes
{
  v13[1] = *MEMORY[0x1E4F143B8];
  linkTextAttributes = self->_linkTextAttributes;
  if (linkTextAttributes)
  {
    id v3 = linkTextAttributes;
  }
  else
  {
    uint64_t v6 = [(UIView *)self tintColor];
    if (!v6)
    {
      uint64_t v6 = [(UIView *)self _normalInheritedTintColor];
      if ([(UIView *)self tintAdjustmentMode] == UIViewTintAdjustmentModeDimmed)
      {
        double v10 = 0.0;
        double v11 = 0.0;
        [v6 getWhite:&v11 alpha:&v10];
        uint64_t v7 = +[UIColor colorWithWhite:v11 alpha:v10 * 0.8];

        uint64_t v6 = (void *)v7;
      }
      if (!v6)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"UITextView.m" lineNumber:5968 description:@"Unable to derive tintColor!"];

        uint64_t v6 = 0;
      }
    }
    uint64_t v12 = *(void *)off_1E52D2048;
    v13[0] = v6;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  return v3;
}

- (Class)_intelligenceBaseClass
{
  sub_1853B985C(0, &qword_1E8FB7F60);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  _sSo10UITextViewC5UIKitE27_intelligenceCollectContent2in9collectorySo6CGRectV_21UIIntelligenceSupport0J16ElementCollectorCtF_0((uint64_t)v5);
}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (id)largeContentTitle
{
  id v3 = [(UIView *)self _largeContentStoredProperties];
  int v4 = [v3 didSetLargeContentTitle];

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextView;
    id v5 = [(UIView *)&v8 largeContentTitle];
  }
  else
  {
    uint64_t v6 = [(UITextView *)self attributedText];
    id v5 = [v6 string];
  }
  return v5;
}

- (id)_animatedPlaceholderSupport
{
  animatedPlaceholderSupport = self->_animatedPlaceholderSupport;
  if (!animatedPlaceholderSupport)
  {
    int v4 = [[_UITextViewAnimatedPlaceholderSupport alloc] initWithTextView:self];
    id v5 = self->_animatedPlaceholderSupport;
    self->_animatedPlaceholderSupport = v4;

    animatedPlaceholderSupport = self->_animatedPlaceholderSupport;
  }
  return animatedPlaceholderSupport;
}

- (void)insertAnimatedTextPlaceholder
{
  id v3 = [(UITextView *)self endOfDocument];
  [(UITextView *)self insertAnimatedTextPlaceholderAtLocation:v3 numLines:0.0];
}

- (void)insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4
{
}

- (void)insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(UITextView *)self removeAnimatedTextPlaceholders];
  id v12 = [(UITextView *)self _animatedPlaceholderSupport];
  double v10 = [v12 insertLoadingPlaceholderAtLocation:v9 lines:v8 completion:a4];

  activeAnimatedPlaceholder = self->_activeAnimatedPlaceholder;
  self->_activeAnimatedPlaceholder = v10;
}

- (BOOL)replaceAnimatedTextPlaceholderWith:(id)a3
{
  return [(UITextView *)self replaceAnimatedTextPlaceholderWith:a3 completion:0];
}

- (BOOL)replaceAnimatedTextPlaceholderWith:(id)a3 completion:(id)a4
{
  activeAnimatedPlaceholder = self->_activeAnimatedPlaceholder;
  if (activeAnimatedPlaceholder)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = [(UITextView *)self _animatedPlaceholderSupport];
    [v9 replacePlaceholder:self->_activeAnimatedPlaceholder withText:v8 completion:v7];
  }
  return activeAnimatedPlaceholder != 0;
}

- (void)removeAnimatedTextPlaceholders
{
  if (self->_activeAnimatedPlaceholder)
  {
    id v3 = [(UITextView *)self _animatedPlaceholderSupport];
    [v3 removePlaceholder:self->_activeAnimatedPlaceholder];

    activeAnimatedPlaceholder = self->_activeAnimatedPlaceholder;
    self->_activeAnimatedPlaceholder = 0;
  }
}

- (void)insertAttributedText:(id)a3 withAnimationStyle:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(UITextView *)self _animatedPlaceholderSupport];
  [v10 insertAttributedText:v9 withAnimationStyle:a4 completion:v8];
}

- (id)_activityItemsConfigurationAtLocation:(CGPoint)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int v4 = [UIActivityItemsConfiguration alloc];
  id v5 = [(UITextView *)self selectedText];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [(UIActivityItemsConfiguration *)v4 initWithObjects:v6];

  return v7;
}

- (id)_newTextKit1LayoutControllerWithTextContainer:(id)a3 layoutManager:(id)a4 textStorage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = -[_UITextKit1LayoutController initWithTextView:textContainer:layoutManager:textStorage:]((id *)[_UITextKit1LayoutController alloc], self, v10, v9, v8);

  id v12 = -[_UITextKit1LayoutController originalLayoutManager](v11);
  [v12 setAllowsNonContiguousLayout:1];

  return v11;
}

- (BOOL)_reconfigureWithLayoutManager:(id)a3 triggeredByLayoutManagerAccess:(BOOL)a4 triggeringSelector:(SEL)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  textLayoutController = self->_textLayoutController;
  if (!textLayoutController
    || ([(_UITextLayoutController *)textLayoutController canAccessLayoutManager] & 1) != 0
    || ($CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = self->_tvFlags, (*(_WORD *)&tvFlags & 0x1000) != 0))
  {
    BOOL v12 = 0;
  }
  else
  {
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(unint64_t *)&tvFlags | 0x1000);
    id v10 = [(UITextView *)self _existingWritingToolsCoordinator];
    double v11 = v10;
    if (v10 && [v10 behavior] != -1) {
      [v11 setPreferredBehavior:2];
    }
    _UITextViewEnablingCompatibilityMode(self, v5);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__UITextView__reconfigureWithLayoutManager_triggeredByLayoutManagerAccess_triggeringSelector___block_invoke;
    v14[3] = &unk_1E52D9F98;
    v14[4] = self;
    id v15 = v7;
    +[UIView performWithoutAnimation:v14];

    BOOL v12 = 1;
  }

  return v12;
}

void __94__UITextView__reconfigureWithLayoutManager_triggeredByLayoutManagerAccess_triggeringSelector___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) textContainer];
  double v3 = -[UITextView _adjustedTextContainerInset](*(double **)(a1 + 32));
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:*(void *)(a1 + 32) name:@"_UITextContainerViewSizeDidChange" object:*(void *)(*(void *)(a1 + 32) + 2088)];
  double v11 = [*(id *)(a1 + 32) subviews];
  uint64_t v12 = [v11 indexOfObject:*(void *)(*(void *)(a1 + 32) + 2088)];

  [*(id *)(*(void *)(a1 + 32) + 2088) removeFromSuperview];
  [*(id *)(a1 + 32) _configureWithTextContainer:v2 layoutManager:*(void *)(a1 + 40) textLayoutManagerEnabled:0];
  [*(id *)(a1 + 32) _installContainerViewAtIndex:v12];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2088), "setTextContainerInset:", v3, v5, v7, v9);
  -[UITextView _placeSelectionContainerView](*(id **)(a1 + 32));
  [*(id *)(*(void *)(a1 + 32) + 2072) setEnsuresFixingAttributes:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2072), "fixAttributesInRange:", 0, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2072), "length"));
  [*(id *)(a1 + 32) _updateContentSize];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 2112));

  if (WeakRetained)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(v14 + 2680);
    id v16 = objc_loadWeakRetained((id *)(v14 + 2112));
    [v16 setTextLayoutController:v15];
  }
  [*(id *)(a1 + 32) _updateContainerTileAndSizingFlags];
  if (([*(id *)(a1 + 32) isScrollEnabled] & 1) == 0) {
    [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
  }
  [v10 addObserver:*(void *)(a1 + 32) selector:sel__textContainerSizeDidChange_ name:@"_UITextContainerViewSizeDidChange" object:*(void *)(*(void *)(a1 + 32) + 2088)];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];

  *(void *)(*(void *)(a1 + 32) + 2144) &= ~0x1000uLL;
}

- (int64_t)_encodedTextKitFlavor
{
  return self->_textKitCodingFlavor;
}

- (void)_setEncodedTextKitFlavor:(int64_t)a3
{
  if (self->_textKitCodingFlavor != a3) {
    self->_textKitCodingFlavor = a3;
  }
}

- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UITextView;
  double v5 = -[UIScrollView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5) {
    [(UITextView *)v5 _commonInitWithTextContainer:0 decoding:0 editable:1 selectable:1 draggable:1 textLayoutManagerEnabled:v4];
  }
  return v6;
}

+ (UITextView)textViewUsingTextLayoutManager:(BOOL)usingTextLayoutManager
{
  BOOL v3 = usingTextLayoutManager;
  id v4 = objc_alloc((Class)a1);
  double v5 = objc_msgSend(v4, "_initWithFrame:textLayoutManagerEnabled:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return (UITextView *)v5;
}

- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = -[UITextView initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:](self, "initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:", v9, [(id)objc_opt_class() _isTextLayoutManagerEnabled], x, y, width, height);

  return v10;
}

- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4 textLayoutManagerEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UITextView;
  uint64_t v12 = -[UIScrollView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  double v13 = v12;
  if (v12)
  {
    [(UITextView *)v12 _commonInitWithTextContainer:v11 decoding:0 editable:0 selectable:0 draggable:0 textLayoutManagerEnabled:v5];
    [(UITextView *)v13 setScrollEnabled:0];
  }

  return v13;
}

- (UITextView)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v21.receiver = self;
  v21.super_class = (Class)UITextView;
  BOOL v5 = [(UIScrollView *)&v21 initWithCoder:v4];
  if (!v5) {
    goto LABEL_46;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIEditable"]) {
    uint64_t v6 = [(NSCoder *)v4 decodeBoolForKey:@"UIEditable"];
  }
  else {
    uint64_t v6 = 1;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UISelectable"]) {
    uint64_t v7 = [(NSCoder *)v4 decodeBoolForKey:@"UISelectable"];
  }
  else {
    uint64_t v7 = 1;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UITextViewTextKitCodingFlavor"]) {
    [(UITextView *)v5 _setEncodedTextKitFlavor:[(NSCoder *)v4 decodeIntegerForKey:@"UITextViewTextKitCodingFlavor"]];
  }
  unsigned int v8 = [(id)objc_opt_class() _isTextLayoutManagerEnabled];
  uint64_t v9 = [(UITextView *)v5 _encodedTextKitFlavor];
  if (v9 == 2) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = v8;
  }
  if (v9 == 1) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  [(UITextView *)v5 _commonInitWithTextContainer:0 decoding:1 editable:v6 selectable:v7 draggable:1 textLayoutManagerEnabled:v11];
  if ([(NSCoder *)v4 containsValueForKey:@"UIAllowsEditingTextAttributes"]) {
    [(UITextView *)v5 setAllowsEditingTextAttributes:[(NSCoder *)v4 decodeBoolForKey:@"UIAllowsEditingTextAttributes"]];
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIAdjustsFontForContentSizeCategory"]) {
    [(UITextView *)v5 setAdjustsFontForContentSizeCategory:[(NSCoder *)v4 decodeBoolForKey:@"UIAdjustsFontForContentSizeCategory"]];
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIFont"])
  {
    uint64_t v12 = [(NSCoder *)v4 decodeObjectForKey:@"UIFont"];
    [(UITextView *)v5 setFont:v12];
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UITextColor"])
  {
    double v13 = [(NSCoder *)v4 decodeObjectForKey:@"UITextColor"];
    [(UITextView *)v5 setTextColor:v13];
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UITextAlignment"]) {
    [(UITextView *)v5 setTextAlignment:[(NSCoder *)v4 decodeIntegerForKey:@"UITextAlignment"]];
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIAttributedText"])
  {
    uint64_t v14 = [(NSCoder *)v4 decodeObjectForKey:@"UIAttributedText"];
    [(UITextView *)v5 setAttributedText:v14];
LABEL_30:

    goto LABEL_31;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIText"])
  {
    uint64_t v14 = [(NSCoder *)v4 decodeObjectForKey:@"UIText"];
    [(UITextView *)v5 setText:v14];
    goto LABEL_30;
  }
LABEL_31:
  if ([(NSCoder *)v4 containsValueForKey:@"UIFindInteractionEnabled"]) {
    [(UITextView *)v5 setFindInteractionEnabled:[(NSCoder *)v4 decodeBoolForKey:@"UIFindInteractionEnabled"]];
  }
  [(UITextView *)v5 setDataDetectorTypes:[(NSCoder *)v4 decodeIntegerForKey:@"UIDataDetectorTypes"]];
  objc_super v15 = [(UITextView *)v5 _textInputTraits];
  [v15 setAutocapitalizationType:2];
  if ([(NSCoder *)v4 containsValueForKey:@"UIAutocapitalizationType"]) {
    objc_msgSend(v15, "setAutocapitalizationType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UIAutocapitalizationType"));
  }
  objc_msgSend(v15, "setAutocorrectionType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UIAutocorrectionType"));
  objc_msgSend(v15, "setSpellCheckingType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UISpellCheckingType"));
  objc_msgSend(v15, "setKeyboardType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UIKeyboardType"));
  objc_msgSend(v15, "setKeyboardAppearance:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UIKeyboardAppearance"));
  objc_msgSend(v15, "setReturnKeyType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UIReturnKeyType"));
  objc_msgSend(v15, "setEnablesReturnKeyAutomatically:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", @"UIEnablesReturnKeyAutomatically"));
  id v16 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UITextContentType"];
  [v15 setTextContentType:v16];

  objc_msgSend(v15, "setSmartInsertDeleteType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UITextSmartInsertDeleteType"));
  objc_msgSend(v15, "setSmartQuotesType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UITextSmartQuotesType"));
  objc_msgSend(v15, "setSmartDashesType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UITextSmartDashesType"));
  objc_msgSend(v15, "setInlinePredictionType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UITextInlinePredictionType"));
  objc_msgSend(v15, "setMathExpressionCompletionType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UITextMathExpressionCompletionType"));
  objc_msgSend(v15, "setAllowsTextAnimationsType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UITextAllowsTextAnimationsType"));
  objc_msgSend(v15, "setWritingToolsBehavior:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", @"UIWritingToolsBehavior"));
  double v17 = @"UIAllowedWritingToolsResultOptions";
  if ([(NSCoder *)v4 containsValueForKey:@"UIAllowedWritingToolsResultOptions"]
    || (double v17 = @"UIWritingToolsAllowedInputOptions",
        [(NSCoder *)v4 containsValueForKey:@"UIWritingToolsAllowedInputOptions"]))
  {
    objc_msgSend(v15, "setAllowedWritingToolsResultOptions:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v17));
  }
  objc_msgSend(v15, "setSecureTextEntry:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", @"UISecureTextEntry"));
  if (![(UIScrollView *)v5 isScrollEnabled]
    && [(_UITextLayoutController *)v5->_textLayoutController canAccessLayoutManager])
  {
    double v18 = [(_UITextLayoutController *)v5->_textLayoutController layoutManager];
    [v18 setAllowsNonContiguousLayout:0];
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UITextViewUsesStandardTextScaling"]) {
    [(UITextView *)v5 setUsesStandardTextScaling:[(NSCoder *)v4 decodeBoolForKey:@"UITextViewUsesStandardTextScaling"]];
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UILetterformAwareSizingRule"]) {
    v5->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&v5->_tvFlags & 0xFFFFFFFFFFFFBFFFLL | (([(NSCoder *)v4 decodeIntegerForKey:@"UILetterformAwareSizingRule"] & 1) << 14));
  }
  double v19 = [(NSCoder *)v4 decodeObjectForKey:@"UITextHighlightAttributes"];
  [(UITextView *)v5 setTextHighlightAttributes:v19];

LABEL_46:
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UITextView;
  [(UIScrollView *)&v22 encodeWithCoder:v4];
  BOOL v5 = [(UITextView *)self attributedText];
  uint64_t v6 = v5;
  if (v5 && [v5 length])
  {
    uint64_t v7 = [v6 string];
    [v4 encodeObject:v7 forKey:@"UIText"];

    unsigned int v8 = [(UITextView *)self attributedText];
    [v4 encodeObject:v8 forKey:@"UIAttributedText"];
  }
  if ([(UITextView *)self allowsEditingTextAttributes]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[UITextView allowsEditingTextAttributes](self, "allowsEditingTextAttributes"), @"UIAllowsEditingTextAttributes");
  }
  if ([(UITextView *)self adjustsFontForContentSizeCategory]) {
    [v4 encodeBool:1 forKey:@"UIAdjustsFontForContentSizeCategory"];
  }
  uint64_t v9 = [(UITextView *)self font];

  if (v9)
  {
    unsigned int v10 = [(UITextView *)self font];
    [v4 encodeObject:v10 forKey:@"UIFont"];
  }
  uint64_t v11 = [(UITextView *)self textColor];

  if (v11)
  {
    uint64_t v12 = [(UITextView *)self textColor];
    [v4 encodeObject:v12 forKey:@"UITextColor"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  uint64_t v14 = [WeakRetained typingAttributes];
  objc_super v15 = [v14 valueForKey:*(void *)off_1E52D21B8];

  if (v15) {
    uint64_t v16 = [v15 alignment];
  }
  else {
    uint64_t v16 = 4;
  }
  [v4 encodeInteger:v16 forKey:@"UITextAlignment"];

  if (![(UITextView *)self isEditable]) {
    [v4 encodeBool:0 forKey:@"UIEditable"];
  }
  if ([(UITextView *)self dataDetectorTypes]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UITextView dataDetectorTypes](self, "dataDetectorTypes"), @"UIDataDetectorTypes");
  }
  if (![(UITextView *)self isSelectable]) {
    [v4 encodeBool:0 forKey:@"UISelectable"];
  }
  if ([(UITextView *)self isFindInteractionEnabled]) {
    [v4 encodeBool:1 forKey:@"UIFindInteractionEnabled"];
  }
  double v17 = [(UITextView *)self _textInputTraits];
  if ([v17 autocapitalizationType] != 2) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "autocapitalizationType"), @"UIAutocapitalizationType");
  }
  if ([v17 autocorrectionType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "autocorrectionType"), @"UIAutocorrectionType");
  }
  if ([v17 spellCheckingType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "spellCheckingType"), @"UISpellCheckingType");
  }
  if ([v17 keyboardType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "keyboardType"), @"UIKeyboardType");
  }
  if ([v17 keyboardAppearance]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "keyboardAppearance"), @"UIKeyboardAppearance");
  }
  if ([v17 returnKeyType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "returnKeyType"), @"UIReturnKeyType");
  }
  if ([v17 enablesReturnKeyAutomatically]) {
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v17, "enablesReturnKeyAutomatically"), @"UIEnablesReturnKeyAutomatically");
  }
  if ([v17 isSecureTextEntry]) {
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v17, "isSecureTextEntry"), @"UISecureTextEntry");
  }
  double v18 = [v17 textContentType];

  if (v18)
  {
    double v19 = [v17 textContentType];
    [v4 encodeObject:v19 forKey:@"UITextContentType"];
  }
  if ([v17 smartInsertDeleteType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "smartInsertDeleteType"), @"UITextSmartInsertDeleteType");
  }
  if ([v17 smartQuotesType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "smartQuotesType"), @"UITextSmartQuotesType");
  }
  if ([v17 smartDashesType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "smartDashesType"), @"UITextSmartDashesType");
  }
  if ([v17 inlinePredictionType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "inlinePredictionType"), @"UITextInlinePredictionType");
  }
  if ([v17 mathExpressionCompletionType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "mathExpressionCompletionType"), @"UITextMathExpressionCompletionType");
  }
  if ([v17 allowsTextAnimationsType]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "allowsTextAnimationsType"), @"UITextAllowsTextAnimationsType");
  }
  if ([v17 writingToolsBehavior]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "writingToolsBehavior"), @"UIWritingToolsBehavior");
  }
  if ([v17 allowedWritingToolsResultOptions]) {
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "allowedWritingToolsResultOptions"), @"UIAllowedWritingToolsResultOptions");
  }
  if ([(UITextView *)self usesStandardTextScaling]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[UITextView usesStandardTextScaling](self, "usesStandardTextScaling"), @"UITextViewUsesStandardTextScaling");
  }
  if ([(UITextView *)self _encodedTextKitFlavor] >= 1) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UITextView _encodedTextKitFlavor](self, "_encodedTextKitFlavor"), @"UITextViewTextKitCodingFlavor");
  }
  if ((*((unsigned char *)&self->_tvFlags + 1) & 0x40) != 0) {
    [v4 encodeInteger:1 forKey:@"UILetterformAwareSizingRule"];
  }
  double v20 = [(UITextView *)self textHighlightAttributes];

  if (v20)
  {
    objc_super v21 = [(UITextView *)self textHighlightAttributes];
    [v4 encodeObject:v21 forKey:@"UITextHighlightAttributes"];
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UITextView;
  [(UIScrollView *)&v15 _populateArchivedSubviews:v4];
  if (self->_containerView) {
    objc_msgSend(v4, "removeObject:");
  }
  BOOL v5 = [(UITextView *)self interactionAssistant];
  uint64_t v6 = [v5 _legacySelectionView];

  if (v6)
  {
    [v4 removeObject:v6];
    uint64_t v7 = [v6 rangeView];
    unsigned int v8 = [v7 startGrabber];
    uint64_t v9 = [v8 _dotView];

    if (v9) {
      [v4 removeObject:v9];
    }
    unsigned int v10 = [v6 rangeView];
    uint64_t v11 = [v10 endGrabber];
    uint64_t v12 = [v11 _dotView];

    if (v12) {
      [v4 removeObject:v12];
    }
  }
  if (self->_layoutView) {
    objc_msgSend(v4, "removeObject:");
  }
  double v13 = [(UITextView *)self interactionAssistant];
  uint64_t v14 = [v13 _selectionViewManager];
  [v14 _filterArchivedSubviews:v4];
}

- (NSLayoutManager)layoutManager
{
  [(UITextView *)self _reconfigureWithLayoutManager:0 triggeredByLayoutManagerAccess:1 triggeringSelector:a2];
  textLayoutController = (id *)self->_textLayoutController;
  return (NSLayoutManager *)-[_UITextKit1LayoutController originalLayoutManager](textLayoutController);
}

- (id)_inputController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  return WeakRetained;
}

- (void)setInputView:(UIView *)inputView
{
  BOOL v5 = inputView;
  if (self->_inputView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_inputView, inputView);
    BOOL v5 = v6;
  }
}

- (UIView)inputAccessoryView
{
  inputAccessoryView = self->_inputAccessoryView;
  if (inputAccessoryView)
  {
    BOOL v3 = inputAccessoryView;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextView;
    BOOL v3 = [(UIResponder *)&v5 inputAccessoryView];
  }
  return v3;
}

- (BOOL)_ownsInputAccessoryView
{
  if (self->_inputAccessoryView) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  return [(UIResponder *)&v3 _ownsInputAccessoryView];
}

- (NSAttributedString)attributedText
{
  p_inputController = &self->_inputController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_inputController);
    uint64_t v6 = [v5 filteredAttributedText];
  }
  else
  {
    uint64_t v6 = (void *)[(NSTextStorage *)self->_textStorage copy];
  }
  return (NSAttributedString *)v6;
}

- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[_UITextLayoutController textRangeForCharacterRange:](self->_textLayoutController, "textRangeForCharacterRange:", a4.location, a4.length);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  textLayoutController = self->_textLayoutController;
  uint64_t v9 = *(void *)off_1E52D2290;
  unsigned int v10 = [NSNumber numberWithInteger:a3];
  [(_UITextLayoutController *)textLayoutController addAnnotationAttribute:v9 value:v10 forRange:v11];

  -[_UITextLayoutController boundingRectForCharacterRange:](self->_textLayoutController, "boundingRectForCharacterRange:", location, length);
  -[UITextView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
  id v4 = attributedText;
  if (+[UIDictationUtilities shouldLogCorrectionInfoForCurrentBundleId])
  {
    if (!v4
      || ([(NSAttributedString *)v4 string],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isEqualToString:&stru_1ED0E84C0],
          v5,
          v6))
    {
      +[UIDictationController logCorrectionStatisticsForDelegate:self reason:25];
    }
  }
  if (([(NSTextStorage *)self->_textStorage isEqualToAttributedString:v4] & 1) == 0)
  {
    if (!v4) {
      id v4 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
    }
    unint64_t v7 = [(NSAttributedString *)v4 length];
    unsigned int v8 = self;
    uint64_t v9 = v4;
    if (qword_1EB25B020 != -1) {
      dispatch_once(&qword_1EB25B020, &__block_literal_global_2305);
    }
    uint64_t v58 = 0;
    double v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    unsigned int v10 = [(UITextView *)v8 textLayoutController];
    if ([v10 canAccessLayoutManager])
    {
    }
    else
    {
      char v11 = dyld_program_sdk_at_least();

      if ((v11 & 1) == 0 && qword_1EB25B038 != -1) {
        dispatch_once(&qword_1EB25B038, &__block_literal_global_2324);
      }
    }
    if (byte_1EB25AFA3)
    {
      if (!qword_1EB25B030)
      {
        uint64_t v12 = [(id)qword_1EB25B018 objectForKeyedSubscript:qword_1EB25B028];
        qword_1EB25B030 = (uint64_t)NSClassFromString(v12);
      }
      uint64_t v13 = [(NSAttributedString *)v9 length];
      uint64_t v14 = *(void *)off_1E52D1F50;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = ___downgradeToTextKit1IfNecessary_block_invoke_3;
      v57[3] = &unk_1E530BC18;
      v57[4] = &v58;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v9, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v13, 0, v57);
    }
    if (*((unsigned char *)v59 + 24))
    {
      [(UITextView *)v8 layoutManager];
    }
    _Block_object_dispose(&v58, 8);

    objc_super v15 = [(NSAttributedString *)v9 string];
    uint64_t v16 = [(UITextView *)v8 _resolvedTypesettingLanguage:v15];

    if ([(_UITextLayoutController *)v8->_textLayoutController canAccessLayoutManager])
    {
      int v17 = 0;
    }
    else
    {
      int v17 = dyld_program_sdk_at_least() ^ 1;
      if (v17) {
        goto LABEL_26;
      }
    }
    if (!v16)
    {
      double v18 = v9;
LABEL_32:
      if ([(_UITextLayoutController *)v8->_textLayoutController canAccessLayoutManager])
      {
        double v23 = v8->_textLayoutController;
        double v24 = [(_UITextLayoutController *)v23 layoutManager];
        if ([v24 allowsNonContiguousLayout] && v7)
        {
          if (v7 < 5) {
            goto LABEL_44;
          }
          double v45 = v23;
          double v46 = v16;
          uint64_t v25 = 0;
          int v26 = 0;
          unint64_t v47 = v7;
          unint64_t v27 = v7 / 5;
          uint64_t v28 = *(void *)off_1E52D2040;
          double v29 = 0.0;
          uint64_t v30 = 5;
          do
          {
            double v31 = [(NSAttributedString *)v18 attribute:v28 atIndex:v25 effectiveRange:0];
            double v32 = v31;
            if (v31)
            {
              [v31 pointSize];
              if (v33 > 0.0)
              {
                double v34 = 0.0;
                if ([v32 isSystemFont])
                {
                  [v32 _leading];
                  double v34 = v35;
                }
                [v24 defaultLineHeightForFont:v32];
                double v29 = (v29 * (double)v26 + v34 + v36) / (double)(v26 + 1);
                ++v26;
              }
            }

            v25 += v27;
            --v30;
          }
          while (v30);
          unint64_t v7 = v47;
          uint64_t v16 = v46;
          double v23 = v45;
          if (v29 <= 0.0)
          {
LABEL_44:
            [off_1E52D39B8 defaultFontSize];
            double v37 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
            [v24 defaultLineHeightForFont:v37];
            double v29 = v38;
          }
          [v24 _setGlyphsPerLineEstimate:0 offsetPerLineEstimate:v29];
        }
      }
      textStorage = self->_textStorage;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __32__UITextView_setAttributedText___block_invoke_3;
      v49[3] = &unk_1E530B408;
      id v4 = v18;
      CGRect v50 = v4;
      [(NSTextStorage *)textStorage coordinateEditing:v49];
      v8->_textContainerInsetAdjustment.double top = -[UITextView _applicableContentOutsetsFromFonts](v8);
      v8->_textContainerInsetAdjustment.double left = v40;
      v8->_textContainerInsetAdjustment.double bottom = v41;
      v8->_textContainerInsetAdjustment.double right = v42;
      -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)v8);
      if (([(_UITextLayoutController *)v8->_textLayoutController canAccessLayoutManager] & 1) == 0) {
        [(UITextView *)v8 _layoutText];
      }
      uint64_t v43 = *(void *)off_1E52D2288;
      uint64_t v44 = [(NSAttributedString *)v4 length];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __32__UITextView_setAttributedText___block_invoke_4;
      v48[3] = &unk_1E530BD68;
      v48[4] = v8;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v4, "enumerateAttribute:inRange:options:usingBlock:", v43, 0, v44, 0, v48);
      [(_UITextContainerView *)v8->_containerView setNeedsDisplay];
      [(UITextView *)v8 _syncTypingAttributesToTextContainerAttributesForExtraLineFragment];
      -[UITextView setSelectedRange:](v8, "setSelectedRange:", v7, 0);
      if ([(UITextView *)v8 _shouldStartDataDetectors]) {
        [(UITextView *)v8 _startDataDetectors];
      }
      [(_UITextInteractableItemCache *)v8->_textInteractableItemCache invalidate];

      goto LABEL_52;
    }
LABEL_26:
    double v18 = (NSAttributedString *)[(NSAttributedString *)v9 mutableCopy];
    [(NSAttributedString *)v18 beginEditing];
    if (v17)
    {
      double v19 = [(id)objc_opt_class() _defaultFont];
      uint64_t v20 = *(void *)off_1E52D2040;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __32__UITextView_setAttributedText___block_invoke;
      v54[3] = &unk_1E530BD18;
      double v55 = v18;
      id v56 = v19;
      id v21 = v19;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v55, "enumerateAttribute:inRange:options:usingBlock:", v20, 0, v7, 0, v54);
    }
    if (v16 && [v16 length])
    {
      uint64_t v22 = *(void *)off_1E52D2040;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __32__UITextView_setAttributedText___block_invoke_2;
      v51[3] = &unk_1E530BD40;
      v51[4] = v8;
      id v52 = v16;
      double v53 = v18;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v53, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v7, 0, v51);
    }
    [(NSAttributedString *)v18 endEditing];

    goto LABEL_32;
  }
LABEL_52:
}

uint64_t __32__UITextView_setAttributedText___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *(void *)off_1E52D2040, *(void *)(result + 40), a3, a4);
  }
  return result;
}

void __32__UITextView_setAttributedText___block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = a2;
  uint64_t v14 = v7;
  if (v7)
  {
    unsigned int v8 = -[UIFont _fontAdjustedForTypesettingLanguage:](v7, a1[5]);
    if (!v8) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = [a1[4] font];
    unsigned int v8 = -[UIFont _fontAdjustedForTypesettingLanguage:](v9, a1[5]);

    if (!v8) {
      goto LABEL_12;
    }
  }
  unsigned int v10 = v8;
  char v11 = v14;
  uint64_t v12 = v11;
  if (v10 == v11)
  {

    goto LABEL_12;
  }
  if (!v14)
  {

    goto LABEL_11;
  }
  char v13 = [(__CTFont *)v10 isEqual:v11];

  if ((v13 & 1) == 0) {
LABEL_11:
  }
    objc_msgSend(a1[6], "addAttribute:value:range:", *(void *)off_1E52D2040, v10, a3, a4);
LABEL_12:
}

uint64_t __32__UITextView_setAttributedText___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setAttributedString:*(void *)(a1 + 32)];
}

uint64_t __32__UITextView_setAttributedText___block_invoke_4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = result;
    uint64_t v7 = [a2 isLowConfidence];
    unsigned int v8 = *(void **)(v6 + 32);
    return objc_msgSend(v8, "addTextAlternativesDisplayStyle:toRange:", v7, a3, a4);
  }
  return result;
}

- (void)_observedTextViewDidChange:(id)a3
{
  if ([(UITextView *)self _totalNumberOfTextViewsInLayoutManager] >= 2)
  {
    [(UITextView *)self setSelectable:0];
  }
}

- (void)_setContentOffsetWithoutRecordingScrollPosition:(CGPoint)a3
{
}

- (id)topContentPadding
{
  return self->_topContentPadding;
}

- (void)_scrollViewWillEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  self->_scrollEndDraggingVelocitdouble y = a3;
}

- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    double y = self->_scrollEndDraggingVelocity.y;
    if (y >= 0.0)
    {
      if (y > 0.0)
      {
        [(UIView *)self bounds];
        double v10 = v9;
        [(UIScrollView *)self contentOffset];
        double v12 = v10 + v11;
        char v13 = [(UITextView *)self _containerView];
        [v13 bounds];
        double v7 = v12 - v14;

        if (v7 > 0.0)
        {
          unsigned int v8 = &OBJC_IVAR___UITextView__bottomContentPadding;
          goto LABEL_8;
        }
      }
    }
    else
    {
      [(UIScrollView *)self contentOffset];
      if (v6 < 0.0)
      {
        double v7 = -v6;
        unsigned int v8 = &OBJC_IVAR___UITextView__topContentPadding;
LABEL_8:
        [*(id *)((char *)&self->super.super.super.super.isa + *v8) increaseToValue:v7];
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)UITextView;
  [(UIScrollView *)&v15 _scrollViewDidEndDraggingWithDeceleration:v3];
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  scrollTarget = self->_scrollTarget;
  if (scrollTarget) {
    BOOL v8 = !v4;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    NSUInteger v9 = [(UITextView *)self _visibleRangeWithLayout:1];
    NSUInteger v11 = v10;
    v25.NSUInteger location = [(_UITextViewRestorableScrollPosition *)self->_scrollTarget range];
    v25.NSUInteger length = v12;
    v24.NSUInteger location = v9;
    v24.NSUInteger length = v11;
    NSRange v13 = NSUnionRange(v24, v25);
    textLayoutController = self->_textLayoutController;
    objc_super v15 = -[_UITextLayoutController textRangeForCharacterRange:](textLayoutController, "textRangeForCharacterRange:", v13.location, v13.length);
    [(_UITextLayoutController *)textLayoutController ensureLayoutForRange:v15];

    uint64_t v16 = [(_UITextViewRestorableScrollPosition *)self->_scrollTarget range];
    -[UITextView _contentOffsetForScrollToVisible:](self, "_contentOffsetForScrollToVisible:", v16, v17);
    double v19 = v18;
    double v21 = v20;
    [(_UITextViewRestorableScrollPosition *)self->_scrollTarget offsetWithinLine];
    -[UITextView setContentOffset:](self, "setContentOffset:", v19, v21 + v22);
    scrollTarget = self->_scrollTarget;
  }
  self->_scrollTarget = 0;

  v23.receiver = self;
  v23.super_class = (Class)UITextView;
  [(UIScrollView *)&v23 _scrollViewAnimationEnded:v6 finished:v4];
}

uint64_t __70__UITextView__resyncContainerFrameForNonAutolayoutDeferringSizeToFit___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 2480) = 0;
  return result;
}

- (void)_sizingRuleWillChangeShouldClearInsetEdges:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (([(id)a1 isScrollEnabled] & 1) == 0)
  {
    if ((*(void *)(a1 + 96) & 0x400000000000000) != 0) {
      goto LABEL_8;
    }
    uint64_t v4 = [(id)a1 superview];
    if (v4)
    {
      id v5 = (void *)v4;
      [(id)a1 bounds];
      double width = v10.size.width;
      double height = v10.size.height;
      double v8 = CGRectGetHeight(v10);
      objc_msgSend((id)a1, "sizeThatFits:", width, height);
      if (v8 == v9) {
        [v5 setNeedsLayout];
      }
      goto LABEL_11;
    }
    if ((*(void *)(a1 + 96) & 0x400000000000000) != 0)
    {
LABEL_8:
      if (([(id)a1 translatesAutoresizingMaskIntoConstraints] & 1) == 0) {
        [(id)a1 invalidateIntrinsicContentSize];
      }
    }
    id v5 = 0;
LABEL_11:
  }
  if (a2)
  {
    if (a2 == 15)
    {
      *(_OWORD *)(a1 + 2344) = 0u;
      *(_OWORD *)(a1 + 2360) = 0u;
    }
    else
    {
      *(void *)(a1 + 2344) = 0;
      *(void *)(a1 + 2360) = 0;
    }
  }
}

- (void)setSizingRule:(int64_t)a3
{
  if (((*(void *)&self->_tvFlags >> 14) & 1) != a3)
  {
    BOOL v4 = a3 == 1;
    if (a3 == 1) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = 15;
    }
    -[UITextView _sizingRuleWillChangeShouldClearInsetEdges:]((uint64_t)self, v5);
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)v4 << 14));
    self->_textContainerInsetAdjustment.double top = -[UITextView _applicableContentOutsetsFromFonts](self);
    self->_textContainerInsetAdjustment.double left = v6;
    self->_textContainerInsetAdjustment.double bottom = v7;
    self->_textContainerInsetAdjustment.double right = v8;
  }
}

- (int64_t)sizingRule
{
  return (*(void *)&self->_tvFlags >> 14) & 1;
}

- (void)_setExtremeSizingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITextView *)self _isExtremeSizingEnabled] != a3)
  {
    if (v3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = 5;
    }
    if (v3) {
      uint64_t v6 = 0x2000;
    }
    else {
      uint64_t v6 = 0;
    }
    -[UITextView _sizingRuleWillChangeShouldClearInsetEdges:]((uint64_t)self, v5);
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFDFFFLL | v6);
    self->_textContainerInsetAdjustment.double top = -[UITextView _applicableContentOutsetsFromFonts](self);
    self->_textContainerInsetAdjustment.double left = v7;
    self->_textContainerInsetAdjustment.double bottom = v8;
    self->_textContainerInsetAdjustment.double right = v9;
  }
}

- (BOOL)_isExtremeSizingEnabled
{
  return (*((unsigned __int8 *)&self->_tvFlags + 1) >> 5) & 1;
}

- (void)_scrollToCaretIfNeeded
{
  BOOL v3 = [(UITextView *)self interactionAssistant];
  BOOL v4 = [v3 activeSelection];
  uint64_t v5 = [v4 selectedRange];
  int v6 = [v5 _isCaret];

  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__UITextView__scrollToCaretIfNeeded__block_invoke;
    aBlock[3] = &unk_1E52F1760;
    aBlock[4] = self;
    CGFloat v7 = (double (**)(void))_Block_copy(aBlock);
    if ([(UIScrollView *)self isScrollEnabled])
    {
      if ([(UITextView *)self isEditing])
      {
        double v8 = v7[2](v7);
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        [(UIView *)self bounds];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        [(UIScrollView *)self _effectiveContentInset];
        CGFloat v24 = v18 + v23;
        CGFloat v27 = v20 - (v25 + v26);
        v40.size.double height = v22 - (v23 + v28);
        v40.origin.double x = v16 + v25;
        v40.origin.double y = v24;
        v40.size.double width = v27;
        v42.origin.double x = v8;
        v42.origin.double y = v10;
        v42.size.double width = v12;
        v42.size.double height = v14;
        if (!CGRectContainsRect(v40, v42))
        {
          [(UIScrollView *)self _contentOffsetAnimationDuration];
          double v30 = v29;
          [(UIScrollView *)self _setContentOffsetAnimationDuration:0.1];
          -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), v8, v10, v12, v14);
          [(UIScrollView *)self _setContentOffsetAnimationDuration:v30];
        }
      }
      else if ([(UITextView *)self _shouldScrollEnclosingScrollView])
      {
        double v31 = v7[2](v7);
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v38 = [(UIView *)self _scroller];
        [v38 bounds];
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", v38);
        v43.origin.double x = v31;
        v43.origin.double y = v33;
        v43.size.double width = v35;
        v43.size.double height = v37;
        if (!CGRectContainsRect(v41, v43)) {
          -[UITextView _scrollRect:toVisibleInContainingScrollView:](self, "_scrollRect:toVisibleInContainingScrollView:", 0, v31, v33, v35, v37);
        }
      }
    }
  }
}

double __36__UITextView__scrollToCaretIfNeeded__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(*(void *)(a1 + 32) + 2088) canvasView];
  [v2 layoutIfNeeded];

  BOOL v3 = [*(id *)(a1 + 32) interactionAssistant];
  BOOL v4 = [v3 activeSelection];
  [v4 caretRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = [*(id *)(a1 + 32) textInputView];
  objc_msgSend(v13, "convertRect:toView:", *(void *)(a1 + 32), v6, v8, v10, v12);
  double v15 = v14;

  return v15;
}

- (BOOL)_isSelectionVisible
{
  objc_super v2 = [(UITextView *)self interactionAssistant];
  BOOL v3 = [v2 _selectionViewManager];
  char v4 = [v3 _isVisible];

  return v4;
}

uint64_t __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_containerSizeForBoundsSize:allowingOverflow:", 0);
}

uint64_t __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)UITextView;
  -[UIView setNeedsDisplayInRect:](&v27, sel_setNeedsDisplayInRect_);
  double v8 = [(_UITextContainerView *)self->_containerView canvasView];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  double v17 = [(_UITextContainerView *)self->_containerView canvasView];
  [v17 bounds];
  v31.origin.double x = v18;
  v31.origin.double y = v19;
  v31.size.double width = v20;
  v31.size.double height = v21;
  v28.origin.double x = v10;
  v28.origin.double y = v12;
  v28.size.double width = v14;
  v28.size.double height = v16;
  CGRect v29 = CGRectIntersection(v28, v31);
  double v22 = v29.origin.x;
  double v23 = v29.origin.y;
  double v24 = v29.size.width;
  double v25 = v29.size.height;

  v30.origin.double x = v22;
  v30.origin.double y = v23;
  v30.size.double width = v24;
  v30.size.double height = v25;
  if (!CGRectIsEmpty(v30))
  {
    double v26 = [(_UITextContainerView *)self->_containerView canvasView];
    objc_msgSend(v26, "setNeedsDisplayInRect:", v22, v23, v24, v25);
  }
}

- (void)_resetUsesExplicitPreferredMaxLayoutWidth
{
  int v3 = [(UITextView *)self _needsDoubleUpdateConstraintsPass];
  *(void *)&self->_tvFlags &= ~8uLL;
  self->_preferredMaxLayoutWidth = 0.0;
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v3);
  [(UITextView *)self invalidateIntrinsicContentSize];
}

- (void)_setPreferredMaxLayoutWidth:(double)a3
{
  BOOL v5 = a3 != 0.0;
  int v6 = [(UITextView *)self _needsDoubleUpdateConstraintsPass];
  self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFFFF7 | (8 * v5));
  if (self->_preferredMaxLayoutWidth != a3)
  {
    self->_preferredMaxLayoutWidth = a3;
    if (![(UIScrollView *)self isScrollEnabled]) {
      [(UITextView *)self invalidateIntrinsicContentSize];
    }
  }
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v6);
}

- (double)_preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (double)_firstBaselineOffsetFromTop
{
  if ((*(void *)&self->super.super._viewFlags & 0x400000000000000) == 0)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITextView.m", 2575, @"%s only valid when using auto layout", "-[UITextView _firstBaselineOffsetFromTop]");
  }
  return self->_firstBaselineOffsetFromTop;
}

- (double)_baselineOffsetFromBottom
{
  if ((*(void *)&self->super.super._viewFlags & 0x400000000000000) == 0)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITextView.m", 2581, @"%s only valid when using auto layout", "-[UITextView _baselineOffsetFromBottom]");
  }
  return self->_lastBaselineOffsetFromBottom;
}

- (double)_internalFirstBaselineOffsetFromTop
{
  if (![(UIView *)self _wantsAutolayout]
    && self->_firstBaselineOffsetFromTop == 0.0
    && self->_lastBaselineOffsetFromBottom == 0.0)
  {
    [(UITextView *)self _updateBaselineInformationDependentOnBounds];
  }
  return self->_firstBaselineOffsetFromTop;
}

- (double)_internalLastBaselineOffsetFromBottom
{
  if (![(UIView *)self _wantsAutolayout]
    && self->_firstBaselineOffsetFromTop == 0.0
    && self->_lastBaselineOffsetFromBottom == 0.0)
  {
    [(UITextView *)self _updateBaselineInformationDependentOnBounds];
  }
  return self->_lastBaselineOffsetFromBottom;
}

- (BOOL)_hasBaseline
{
  return 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = self->_tvFlags;
  if (has_internal_diagnostics)
  {
    if ((*(_WORD *)&tvFlags & 0x4000) == 0)
    {
      [(UITextView *)self alignmentRectInsets];
      if (v24 != 0.0 || v21 != 0.0 || v23 != 0.0 || v22 != 0.0)
      {
        double v25 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "Text View not expected to have alignmnetRectInsets.", buf, 2u);
        }
      }
    }
  }
  else if ((*(_WORD *)&tvFlags & 0x4000) == 0)
  {
    [(UITextView *)self alignmentRectInsets];
    if (v11 != 0.0 || v8 != 0.0 || v10 != 0.0 || v9 != 0.0)
    {
      CGFloat v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_baselineOffsetsAtSize____s_category_0) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Text View not expected to have alignmnetRectInsets.", buf, 2u);
      }
    }
  }
  *(void *)buf = 0;
  CGRect v30 = buf;
  uint64_t v31 = 0x3010000000;
  double v32 = &unk_186D7DBA7;
  long long v33 = xmmword_186B9D9E0;
  double v13 = [(_UITextLayoutController *)self->_textLayoutController documentRange];
  char v14 = [v13 isEmpty];

  if ((v14 & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__UITextView__baselineOffsetsAtSize___block_invoke;
    aBlock[3] = &unk_1E52E4728;
    aBlock[4] = self;
    void aBlock[5] = buf;
    double v15 = _Block_copy(aBlock);
    if ([(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager])
    {
      CGFloat v16 = v27;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __37__UITextView__baselineOffsetsAtSize___block_invoke_2;
      v27[3] = &unk_1E530BDB8;
      v27[4] = v15;
      -[UITextView _performTextKit1LayoutCalculation:inSize:](self, "_performTextKit1LayoutCalculation:inSize:", v27, width, height);
    }
    else
    {
      CGFloat v16 = v26;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __37__UITextView__baselineOffsetsAtSize___block_invoke_3;
      v26[3] = &unk_1E530BDE0;
      v26[4] = v15;
      -[UITextView _performTextKit2LayoutCalculation:inSize:](self, "_performTextKit2LayoutCalculation:inSize:", v26, width, height);
    }
  }
  double v17 = *((double *)v30 + 4);
  double v18 = *((double *)v30 + 5);
  _Block_object_dispose(buf, 8);
  double v19 = v17;
  double v20 = v18;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

void __37__UITextView__baselineOffsetsAtSize___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _inputController];
  objc_super v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[335];
  char v4 = [v8 typingAttributes];
  [*(id *)(a1 + 32) textContainerOrigin];
  BOOL v5 = -[_UITextLayoutControllerBase baselineCalculatorForView:typingAttributes:usesLineFragmentOrigin:fallbackTextContainerOrigin:](v3, v2, v4, 1);

  [v5 firstBaselineOffsetFromTop];
  [v5 lastBaselineOffsetFromBottom];
  UIRoundToViewScale(*(void **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v6;
  UIRoundToViewScale(*(void **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v7;
}

uint64_t __37__UITextView__baselineOffsetsAtSize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37__UITextView__baselineOffsetsAtSize___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- ($BB3B25BBC364C7D98808033881F79914)_saveSizeBeforeLayoutCalculation:(SEL)a3
{
  *(void *)&retstr->var0 = 0;
  retstr->var2.double width = 0.0;
  retstr->var2.double height = 0.0;
  id v5 = a4;
  retstr->var0 = [v5 widthTracksTextView];
  retstr->var1 = [v5 heightTracksTextView];
  [v5 size];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  retstr->var2.double width = v7;
  retstr->var2.double height = v9;
  return result;
}

- (void)_restoreSize:(id *)a3 afterLayoutCalculation:(id)a4
{
  BOOL var0 = a3->var0;
  id v6 = a4;
  [v6 setWidthTracksTextView:var0];
  [v6 setHeightTracksTextView:a3->var1];
  objc_msgSend(v6, "setSize:", a3->var2.width, a3->var2.height);
}

- (void)_configureForLayoutCalculation:(id)a3 inSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 setWidthTracksTextView:0];
  [v6 setHeightTracksTextView:0];
  objc_msgSend(v6, "setSize:", width, height);
}

- (void)_performTextKit2LayoutCalculation:(id)a3 inSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  textContainer = self->_textContainer;
  double v8 = (void (**)(id, void *, void *))a3;
  CGFloat v9 = [(NSTextContainer *)textContainer textLayoutManager];
  double v10 = [(UITextView *)self textContainer];
  [v10 size];
  double v12 = v11;
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  [(UITextView *)self _saveSizeBeforeLayoutCalculation:v10];
  double v13 = [v9 delegate];
  if (width != v12) {
    [v10 setTextView:0];
  }
  -[UITextView _configureForLayoutCalculation:inSize:](self, "_configureForLayoutCalculation:inSize:", v10, width, height);
  objc_msgSend(v9, "ensureLayoutForBounds:", 0.0, 0.0, width, height);
  v8[2](v8, v9, v10);

  long long v14 = v16;
  uint64_t v15 = v17;
  [(UITextView *)self _restoreSize:&v14 afterLayoutCalculation:v10];
  if (width != v12) {
    [v10 setTextView:self->_containerView];
  }
  [v9 setDelegate:v13];
}

- (void)_performTextKit1LayoutCalculation:(id)a3 inSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  double v8 = [(UITextView *)self layoutManager];
  CGFloat v9 = [(UITextView *)self textContainer];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__UITextView__performTextKit1LayoutCalculation_inSize___block_invoke;
  v12[3] = &unk_1E530BE08;
  CGFloat v15 = width;
  CGFloat v16 = height;
  v12[4] = self;
  id v13 = v9;
  id v14 = v7;
  id v10 = v7;
  id v11 = v9;
  [v8 coordinateAccess:v12];
}

void __55__UITextView__performTextKit1LayoutCalculation_inSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(a1 + 56);
  [*(id *)(a1 + 32) size];
  double v6 = v5;
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    [v7 _saveSizeBeforeLayoutCalculation:*(void *)(a1 + 40)];
  }
  double v8 = [v3 delegate];
  if (v4 != v6) {
    [*(id *)(a1 + 40) setTextView:0];
  }
  objc_msgSend(*(id *)(a1 + 32), "_configureForLayoutCalculation:inSize:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  if ([v3 allowsNonContiguousLayout]) {
    [v3 ensureLayoutForTextContainer:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  CGFloat v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  long long v11 = v13;
  uint64_t v12 = v14;
  [v9 _restoreSize:&v11 afterLayoutCalculation:v10];
  if (v4 != v6) {
    [*(id *)(a1 + 40) setTextView:*(void *)(*(void *)(a1 + 32) + 2088)];
  }
  [v3 setDelegate:v8];
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  char v6 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIViewDebugSignposts, @"UIViewDebugSignposts");
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __39__UITextView__intrinsicSizeWithinSize___block_invoke;
  v30[3] = &unk_1E530C048;
  v30[4] = self;
  if ((v6 & 1) != 0 || !byte_1EB256E34)
  {
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
  }
  else
  {
    long long v36 = 0u;
    memset(v37, 0, sizeof(v37));
    long long v35 = 0u;
    __39__UITextView__intrinsicSizeWithinSize___block_invoke((uint64_t)v30, (uint64_t)&v35);
    if (v35) {
      kdebug_trace();
    }
    long long v31 = *(_OWORD *)((char *)v37 + 8);
    long long v32 = *(_OWORD *)((char *)&v37[1] + 8);
    uint64_t v33 = *((void *)&v37[2] + 1);
  }
  id v7 = [(UIView *)self superview];
  kdebug_trace();

  long long v34 = *MEMORY[0x1E4F1DB30];
  if ((*((unsigned char *)&self->_tvFlags + 1) & 4) == 0
    || !-[_UITextSizeCache getSize:baselineInfo:forTargetSize:isMultiline:](self->_intrinsicSizeCache, "getSize:baselineInfo:forTargetSize:isMultiline:", &v34, 0, 1, width, height))
  {
    -[UITextView _containerSizeForBoundsSize:allowingOverflow:](self, "_containerSizeForBoundsSize:allowingOverflow:", [(UITextView *)self _allowsOverflowForIntrinsicSizeCalculation], width, height);
    *(void *)&long long v34 = v8;
    *((void *)&v34 + 1) = v9;
    *(void *)&long long v35 = 0;
    *((void *)&v35 + 1) = &v35;
    *(void *)&long long v36 = 0x3010000000;
    *((void *)&v36 + 1) = &unk_186D7DBA7;
    v37[0] = v34;
    if ([(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager])
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __39__UITextView__intrinsicSizeWithinSize___block_invoke_2;
      v29[3] = &unk_1E530BE30;
      void v29[4] = &v35;
      [(UITextView *)self _performTextKit1LayoutCalculation:v29 inSize:v34];
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __39__UITextView__intrinsicSizeWithinSize___block_invoke_3;
      v27[3] = &unk_1E530BE58;
      long long v28 = v34;
      v27[4] = &v35;
      [(UITextView *)self _performTextKit2LayoutCalculation:v27 inSize:v34];
    }
    [(_UITextContainerView *)self->_containerView textContainerInset];
    uint64_t v12 = *((void *)&v35 + 1);
    double v13 = v10 + v11 + *(double *)(*((void *)&v35 + 1) + 40);
    *(double *)(*((void *)&v35 + 1) + 32) = v14 + v15 + *(double *)(*((void *)&v35 + 1) + 32);
    *(double *)(v12 + 40) = v13;
    UICeilToViewScale(self);
    double v17 = v16;
    UICeilToViewScale(self);
    double v19 = v18;
    *(double *)&long long v34 = v17;
    *((double *)&v34 + 1) = v18;
    if ((*((unsigned char *)&self->_tvFlags + 1) & 4) != 0)
    {
      intrinsicSizeCache = self->_intrinsicSizeCache;
      if (!intrinsicSizeCache)
      {
        double v21 = (_UITextSizeCache *)objc_opt_new();
        double v22 = self->_intrinsicSizeCache;
        self->_intrinsicSizeCache = v21;

        intrinsicSizeCache = self->_intrinsicSizeCache;
        double v19 = *((double *)&v34 + 1);
        double v17 = *(double *)&v34;
      }
      -[_UITextSizeCache addSize:baselineInfo:forTargetSize:](intrinsicSizeCache, "addSize:baselineInfo:forTargetSize:", 0, v17, v19, width, height);
    }
    _Block_object_dispose(&v35, 8);
  }
  if (kdebug_is_enabled())
  {
    id v23 = [(UIScrollView *)self description];
    [v23 UTF8String];
    kdebug_trace_string();

    double v24 = [(UIView *)self superview];
    kdebug_trace();
  }
  if (v31) {
    kdebug_trace();
  }
  double v26 = *((double *)&v34 + 1);
  double v25 = *(double *)&v34;
  result.double height = v26;
  result.double width = v25;
  return result;
}

void __39__UITextView__intrinsicSizeWithinSize___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  strncpy((char *)&v8, Name, 0x18uLL);
  *(_DWORD *)a2 = 91;
  char v6 = *(void **)(a1 + 32);
  *(void *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v8;
  *(void *)(a2 + 32) = v9;
  *(_DWORD *)(a2 + 40) = 92;
  *(void *)(a2 + 48) = v6;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = v6;
  id v7 = [v6 superview];
  *(void *)(a2 + 72) = v7;
}

void __39__UITextView__intrinsicSizeWithinSize___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 allowsNonContiguousLayout]) {
    [v9 ensureLayoutForTextContainer:v5];
  }
  [v9 glyphRangeForTextContainer:v5];
  [v9 usedRectForTextContainer:v5];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
}

void __39__UITextView__intrinsicSizeWithinSize___block_invoke_3(double *a1, void *a2)
{
  double v3 = a1[5];
  double v4 = a1[6];
  id v5 = a2;
  objc_msgSend(v5, "ensureLayoutForBounds:", 0.0, 0.0, v3, v4);
  objc_msgSend(v5, "ui_contentSizeForLastContainerView");
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  uint64_t v10 = *(void *)(*((void *)a1 + 4) + 8);
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 40) = v9;
}

- (id)_layoutDebuggingTitle
{
  double v3 = [(UITextView *)self text];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(UITextView *)self attributedText];
    id v5 = [v6 string];
  }
  return v5;
}

- (double)_currentPreferredMaxLayoutWidth
{
  if ((*(unsigned char *)&self->_tvFlags & 8) != 0) {
    return self->_preferredMaxLayoutWidth;
  }
  double result = 0.0;
  if ((*(void *)&self->super.super._viewFlags & 0x4000000000000) == 0) {
    return self->_preferredMaxLayoutWidth;
  }
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  [(_UITextSizeCache *)self->_intrinsicSizeCache removeAllSizes];
  BOOL v3 = (*(void *)&self->super.super._viewFlags & 0x4000000000000) == 0;
  [(UIView *)self _invalidateIntrinsicContentSizeNeedingLayout:v3];
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  self->_preferredMaxLayoutWidth = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UITextView;
  [(UIView *)&v2 _prepareForFirstIntrinsicContentSizeCalculation];
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)UITextView;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (void)_scrollRect:(CGRect)a3 toVisibleInContainingScrollView:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(UIView *)self _scroller];
  objc_msgSend(v10, "convertRect:fromView:", self, x, y, width, height);
  CGRect v13 = CGRectInset(v12, 0.0, -4.0);
  objc_msgSend(v10, "scrollRectToVisible:animated:", v4, v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
}

- (void)_scrollSelectionToVisibleInContainingScrollView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UITextView *)self selectedRange];
  -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", v5, v6);
  -[UITextView _scrollRect:toVisibleInContainingScrollView:](self, "_scrollRect:toVisibleInContainingScrollView:", v3);
}

- (void)_scrollSelectionToVisibleInContainingScrollView
{
}

- (void)_keyboardDidShow:(id)a3
{
  if ([(UIView *)self isFirstResponder])
  {
    if ([(UIScrollView *)self isScrollEnabled])
    {
      [(UITextView *)self scrollSelectionToVisible:1];
    }
    else
    {
      [(UITextView *)self _scrollSelectionToVisibleInContainingScrollView:1];
    }
  }
}

- (BOOL)_shouldScrollEnclosingScrollView
{
  if ([(UIScrollView *)self isScrollEnabled] || ![(UITextView *)self isEditing])
  {
    LOBYTE(v4) = 0;
  }
  else if ([(UIView *)self isFirstResponder])
  {
    BOOL v3 = [(UIView *)self window];
    int v4 = [v3 _isSettingFirstResponder] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)_shouldCollectAsKeyView
{
  BOOL v3 = [(UIView *)self isUserInteractionEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(UITextView *)self isEditable];
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v3 = [(UIView *)self window];
  if (v3)
  {
    int v4 = (void *)v3;
    BOOL v5 = [(UIView *)self _containedInAbsoluteResponderChain];

    if (!v5) {
      return 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (*(unsigned char *)&self->_tvFlags & 2) != 0 && (objc_opt_respondsToSelector()) {
    char v7 = [WeakRetained textViewShouldBeginEditing:self];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)becomeFirstResponder
{
  if ([(UIView *)self isFirstResponder])
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  if (+[UIResponder _currentChangeIntent] == 1
    && [(UITextView *)self _shouldBecomeEditableUponFocus]
    || +[UIResponder _currentChangeIntent] == 2
    && [(UITextView *)self _shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment])
  {
    [(UITextView *)self setEditable:1];
  }
  int v4 = [(UIView *)self keyboardSceneDelegate];
  if (![(UIView *)self isFirstResponder])
  {
    if ([v4 isOnScreen]) {
      goto LABEL_12;
    }
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  BOOL v5 = [v4 responder];
  if (v5 == self)
  {
    char v7 = [v4 isOnScreen];

    if (v7) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }

LABEL_12:
  [v4 _beginIgnoringReloadInputViews];
  char v6 = 1;
LABEL_15:
  v14.receiver = self;
  v14.super_class = (Class)UITextView;
  BOOL v3 = [(UIView *)&v14 becomeFirstResponder];
  BOOL v8 = [(UITextView *)self isEditable];
  if (v3)
  {
    BOOL v9 = v8;
    if (v8)
    {
      [(UITextView *)self _resetDataDetectorsResults];
      id v10 = [(UITextView *)self _textInputTraits];
      double v11 = [(UIView *)self _inheritedInteractionTintColor];
      [v10 _setColorsToMatchTintColor:v11];

      if ((v6 & 1) == 0) {
        [(UITextView *)self _notifyDidBeginEditing];
      }
      CGRect v12 = [(_UITextContainerView *)self->_containerView canvasView];
      [v12 isEditingDidChange];

      if ([(UITextView *)self shouldAutoscrollAboveBottom]) {
        [(UITextView *)self updateAutoscrollAboveBottom];
      }
    }
    [(UITextView *)self _updateSelectionGestures];
    if (![(UITextView *)self isTextDropActive] && (*(unsigned char *)&self->_tvFlags & 0x10) == 0)
    {
      [(UITextInteractionAssistant *)self->_interactionAssistant setSelectionDisplayVisible:1];
      [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
      [(UITextInteractionAssistant *)self->_interactionAssistant activateSelection];
      self->_forceSelectionDisplayForTextFormatting = 0;
    }
    if ([(UIScrollView *)self isProgrammaticScrollEnabled]) {
      *(void *)&self->_tvFlags |= 1uLL;
    }
    if (v6)
    {
      [v4 _endIgnoringReloadInputViews];
      [(UIResponder *)self reloadInputViews];
      if (v9) {
        [(UITextView *)self _notifyDidBeginEditing];
      }
    }
  }
  else if ((v6 & 1) != 0 && [v4 _endIgnoringReloadInputViews])
  {
    [v4 forceReloadInputViews];
  }

  return v3;
}

- (BOOL)canResignFirstResponder
{
  if (![(UITextView *)self isEditing]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained textViewShouldEndEditing:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_cleanUpForResignFirstResponder
{
  if (a1)
  {
    if (([a1 _preserveSelectionDisplayForTextFormatting] & 1) == 0)
    {
      [a1[265] setSelectionDisplayVisible:0];
      [a1[265] deactivateSelection];
    }
    [a1 _startDataDetectorsIfNeeded];
    if ([a1 isEditable])
    {
      [a1 _notifyDidEndEditing];
      objc_super v2 = [a1[261] canvasView];
      [v2 isEditingDidChange];

      if ([a1 shouldAutoscrollAboveBottom]) {
        [a1 updateAutoscrollAboveBottom];
      }
    }
    [a1 _updateSelectionGestures];
    id WeakRetained = objc_loadWeakRetained(a1 + 264);
    [WeakRetained didEndEditing];
  }
}

- (BOOL)_finishResignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)UITextView;
  BOOL v3 = [(UIResponder *)&v5 _finishResignFirstResponder];
  if (v3 && (*(unsigned char *)&self->_tvFlags & 4) == 0) {
    -[UITextView _cleanUpForResignFirstResponder]((id *)&self->super.super.super.super.isa);
  }
  return v3;
}

- (void)_notifyDidBeginEditing
{
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained textViewDidBeginEditing:self];
  }
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UITextViewTextDidBeginEditingNotification" object:self];
}

- (void)_notifyDidEndEditing
{
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained textViewDidEndEditing:self];
  }
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UITextViewTextDidEndEditingNotification" object:self];
}

- (BOOL)allowsEditingTextAttributes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained allowsEditingTextAttributes];

  return v3;
}

- (BOOL)usesTiledViews
{
  return [(_UITextLayoutController *)self->_textLayoutController usesTiledViews];
}

- (void)setUsesTiledViews:(BOOL)a3
{
  BOOL v3 = a3;
  if (dyld_program_sdk_at_least())
  {
    if (setUsesTiledViews__once != -1)
    {
      dispatch_once(&setUsesTiledViews__once, &__block_literal_global_584);
    }
  }
  else
  {
    textLayoutController = self->_textLayoutController;
    [(_UITextLayoutController *)textLayoutController setUsesTiledViews:v3];
  }
}

void __32__UITextView_setUsesTiledViews___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UISiriTrackingAttribute_block_invoke___s_category) + 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "-setUsesTiledViews: is no longer supported on iOS 13. Tiling is always on. If you explicitly need to disable tiling, use -_disableTiledViews", v1, 2u);
  }
}

- (void)_disableTiledViews
{
}

- (double)maxTileHeight
{
  [(_UITextLayoutController *)self->_textLayoutController maxTileHeight];
  return result;
}

- (BOOL)tiledViewsDrawAsynchronously
{
  objc_super v2 = [(_UITextContainerView *)self->_containerView canvasView];
  BOOL v3 = [v2 layer];
  char v4 = [v3 drawsAsynchronously];

  return v4;
}

- (void)setTiledViewsDrawAsynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UITextContainerView *)self->_containerView canvasView];
  char v4 = [v5 layer];
  [v4 setDrawsAsynchronously:v3];
}

- (void)setCustomRenderController:(id)a3
{
  id v5 = (NSCustomTextRendering *)a3;
  p_customRenderController = (id *)&self->_customRenderController;
  customRenderController = self->_customRenderController;
  if (customRenderController != v5)
  {
    double v26 = v5;
    id *p_customRenderController = 0;

    objc_storeStrong((id *)&self->_customRenderController, a3);
    [*p_customRenderController setDelegate:self];
    char v8 = objc_opt_respondsToSelector();
    uint64_t v9 = 0x10000;
    if ((v8 & 1) == 0) {
      uint64_t v9 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFEFFFFLL | v9);
    char v10 = objc_opt_respondsToSelector();
    uint64_t v11 = 0;
    if (v10)
    {
      char v12 = objc_opt_respondsToSelector();
      uint64_t v11 = 0x400000;
      if ((v12 & 1) == 0) {
        uint64_t v11 = 0;
      }
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFBFFFFFLL | v11);
    char v13 = objc_opt_respondsToSelector();
    uint64_t v14 = 0x800000;
    if ((v13 & 1) == 0) {
      uint64_t v14 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFF7FFFFFLL | v14);
    char v15 = objc_opt_respondsToSelector();
    uint64_t v16 = 0x20000;
    if ((v15 & 1) == 0) {
      uint64_t v16 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFDFFFFLL | v16);
    char v17 = objc_opt_respondsToSelector();
    uint64_t v18 = 0x40000;
    if ((v17 & 1) == 0) {
      uint64_t v18 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFBFFFFLL | v18);
    char v19 = objc_opt_respondsToSelector();
    uint64_t v20 = 0x80000;
    if ((v19 & 1) == 0) {
      uint64_t v20 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFF7FFFFLL | v20);
    char v21 = objc_opt_respondsToSelector();
    uint64_t v22 = 0x100000;
    if ((v21 & 1) == 0) {
      uint64_t v22 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFEFFFFFLL | v22);
    char v23 = objc_opt_respondsToSelector();
    uint64_t v24 = 0x200000;
    if ((v23 & 1) == 0) {
      uint64_t v24 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFDFFFFFLL | v24);
    double v25 = [(_UITextContainerView *)self->_containerView canvasView];
    [v25 flushFragmentViews];

    id v5 = v26;
  }
}

- (void)setAllowsTextAnimations:(BOOL)a3
{
  if (self->_allowsTextAnimations != a3)
  {
    BOOL v3 = a3;
    self->_allowsTextAnimations = a3;
    id v5 = [(UITextView *)self textLayoutManager];
    char v6 = [NSNumber numberWithBool:v3];
    [v5 setValue:v6 forKey:@"requiresCTLineRef"];

    char v7 = [(UITextView *)self _textInputTraits];
    char v8 = v7;
    if (v3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    [v7 setAllowsTextAnimationsType:v9];

    if (self->_allowsTextAnimations)
    {
      char v10 = UITextAnimationsNewRenderController();
      [(UITextView *)self setCustomRenderController:v10];
    }
    else
    {
      [(UITextView *)self setCustomRenderController:0];
    }
    if (v3)
    {
      uint64_t v11 = [(_UITextContainerView *)self->_containerView canvasView];
      [v11 configureCustomTextRenderer];
    }
    id v12 = [(_UITextContainerView *)self->_containerView canvasView];
    [v12 setNeedsLayout];
  }
}

+ (BOOL)supportsDynamicallyTogglingAllowsTextAnimations
{
  return 1;
}

- (CGRect)_customRenderBounds
{
  if ((*((unsigned char *)&self->_tvFlags + 2) & 0x80) != 0)
  {
    [(NSCustomTextRendering *)self->_customRenderController customTextBounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(UITextView *)self textContainerInset];
    double v16 = v15;
    double v18 = v17;
    double v20 = -v19;
    double v3 = v8 - v17;
    double v4 = v10 - v16;
    double v5 = v12 - (-v21 - v18);
    double v6 = v14 - (v20 - v16);
  }
  else
  {
    [(UIView *)self bounds];
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_setCustomRenderDisplayLink:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(NSCustomTextRendering *)self->_customRenderController setExternalDisplayLink:v4];
  }
}

- (_NSCustomTextRenderingDisplayLink)_customRenderDisplayLink
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NSCustomTextRendering *)self->_customRenderController externalDisplayLink];
  }
  else
  {
    double v3 = 0;
  }
  return (_NSCustomTextRenderingDisplayLink *)v3;
}

- (BOOL)_customRenderControllerPermitsTextSegmentEnumeration
{
  return *((unsigned char *)&self->_tvFlags + 2) & 1;
}

- (BOOL)_customRenderControllerPermitsSetTextDidEditRange
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 2) & 1;
}

- (BOOL)_customRenderControllerCanCheckFragmentsValid
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 1) & 1;
}

- (BOOL)_customRenderControllerCanConvertPointToTextAnimationsCoordinateSpace
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 3) & 1;
}

- (BOOL)_customRenderControllerCanConvertPointToRenderSpace
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 4) & 1;
}

- (BOOL)_customRenderControllerCanConvertPointFromRenderSpace
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 5) & 1;
}

- (CGPoint)_convertPointFromRenderSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextView *)self customRenderController];
  if (v6
    && [(UITextView *)self _customRenderControllerCanConvertPointFromRenderSpace])
  {
    objc_msgSend(v6, "convertPointFromRenderSpace:", x, y);
    double x = v7;
    double y = v8;
  }

  double v9 = x;
  double v10 = y;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)_convertPointToRenderSpace:(CGPoint)a3 textRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(UITextView *)self customRenderController];
  if (v8)
  {
    if ([(UITextView *)self _customRenderControllerCanConvertPointToRenderSpace])
    {
      double v9 = [v7 _asNSTextRange];
      objc_msgSend(v8, "convertPointToRenderSpace:textRange:", v9, x, y);
    }
    else
    {
      if (![(UITextView *)self _customRenderControllerCanConvertPointToTextAnimationsCoordinateSpace])
      {
        objc_msgSend(v8, "convertPointToTextAnimationsCoordinateSpace:", x, y);
        double x = v12;
        double y = v13;
        goto LABEL_8;
      }
      double v9 = [v7 _asNSTextRange];
      objc_msgSend(v8, "convertPointToTextAnimationsCoordinateSpace:textRange:", v9, x, y);
    }
    double x = v10;
    double y = v11;
  }
LABEL_8:

  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (id)_animatorForTextAnimation:(id)a3
{
  if ((*((unsigned char *)&self->_tvFlags + 2) & 0x40) != 0)
  {
    double v3 = [(NSCustomTextRendering *)self->_customRenderController animatorForTextAnimation:a3];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (id)_animatorForTextAnimation:(id)a3 notify:(id)a4
{
  if ((*((unsigned char *)&self->_tvFlags + 2) & 0x40) != 0)
  {
    id v4 = [(NSCustomTextRendering *)self->_customRenderController animatorForTextAnimation:a3 notify:a4];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)addGhostedRange:(id)a3
{
  if (a3) {
    -[_UITextLayoutController addGhostedRange:](self->_textLayoutController, "addGhostedRange:");
  }
}

- (void)removeAllGhostedRanges
{
}

- (void)addInvisibleRange:(id)a3
{
}

- (void)removeInvisibleRange:(id)a3
{
}

- (void)_setInteractiveTextSelectionDisabled:(BOOL)a3
{
  uint64_t v4 = 16;
  if (!a3) {
    uint64_t v4 = 0;
  }
  self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFFFEFLL | v4);
  if (a3 && [(UITextView *)self isEditable])
  {
    [(UITextView *)self setEditable:0];
  }
  else
  {
    [(UITextView *)self resignFirstResponder];
    [(UITextView *)self _updateSelectionGestures];
  }
}

- (BOOL)shouldPresentSheetsInAWindowLayeredAboveTheKeyboard
{
  return (*(unsigned char *)&self->_tvFlags >> 6) & 1;
}

- (BOOL)_shouldShowEditMenu
{
  BOOL v3 = [(UITextView *)self _showsEditMenu];
  if (v3) {
    LOBYTE(v3) = ![(UITextView *)self _shouldSuppressEditMenuForTextFormatting];
  }
  return v3;
}

- (void)setShouldPresentSheetsInAWindowLayeredAboveTheKeyboard:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setNeedsFrameUpdateForSurface:(id)a3
{
  id v3 = [(_UITextContainerView *)self->_containerView canvasView];
  [v3 setNeedsLayout];
}

- (void)_setNeedsFrameUpdateForCustomRendering
{
  id v3 = [(_UITextContainerView *)self->_containerView canvasView];
  [v3 setNeedsLayout];

  uint64_t v4 = [(UIScrollView *)self delegate];
  if (*((unsigned char *)&self->_tvFlags + 3))
  {
    id v5 = v4;
    [v4 _textViewDidChangeCustomRenderBounds:self];
    uint64_t v4 = v5;
  }
}

- (void)_invalidateInteractionGeometry
{
  id v2 = [(UITextView *)self interactionAssistant];
  [v2 updateSelectionForTextAnimation];
}

- (void)_willDrawContentOfSurface:(id)a3 withBlock:(id)a4
{
  id v5 = (void (**)(void))a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      double v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    double v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_willDrawContentOfSurface_withBlock____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v11, 2u);
    }
  }
  double v6 = +[UITraitCollection _currentTraitCollectionIfExists]();
  id v7 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v7];

  double v8 = (void *)_UISetCurrentFallbackEnvironment(self);
  v5[2](v5);

  _UIRestorePreviousFallbackEnvironment(v8);
  +[UITraitCollection setCurrentTraitCollection:v6];
}

- (void)_showTextFormattingOptions:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(UITextView *)self _configurationForTextFormattingOptions];
  if (v4) {
    [(UITextView *)self _prepareForTextFormattingControllerPresentationWithConfiguration:v4 sender:v5];
  }
}

- (BOOL)_shouldAcceptAutocorrection
{
  return ![(UITextView *)self _isTextFormattingInProgress];
}

- (void)_showTextFormattingAnimationOptions:(id)a3
{
  id v4 = a3;
  if (self->_allowsTextAnimations)
  {
    id v13 = v4;
    [(UIResponder *)self _endWritingTools];
    id v5 = +[UIKeyboardImpl activeInstance];
    [v5 removeAutocorrection];

    double v6 = [(UITextView *)self _supportedAnimationNamesForTextFormatting];
    id v7 = [(UITextView *)self _supportedAnimationTitlesForTextFormatting];
    double v8 = [(UITextView *)self _supportedAnimationAccessibilityHintsForTextFormatting];
    double v9 = +[UITextFormattingViewControllerConfiguration _forTextAnimationsUIWithSupportedAnimationNames:v6 titles:v7 accessibilityHints:v8];
    if ([(UIView *)self isFirstResponder]
      && ([(UIView *)self traitCollection],
          double v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 userInterfaceIdiom],
          v10,
          !v11))
    {
      double v12 = +[UISubstituteKeyboardSession sharedSession];
      [v12 showForResponder:self sender:self];

      [(UITextView *)self _updateTextFormattingController];
    }
    else
    {
      [(UITextView *)self _prepareForTextFormattingControllerPresentationWithConfiguration:v9 sender:v13];
    }

    id v4 = v13;
  }
}

- (id)_configurationForTextFormattingOptions
{
  return self->_textFormattingConfiguration;
}

- (id)_descriptorForTextFormattingOptions
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__214;
  double v59 = __Block_byref_object_dispose__214;
  id v60 = 0;
  CGRect v40 = [(UITextView *)self _configurationForTextFormattingOptions];
  uint64_t v3 = [(UITextView *)self selectedRange];
  uint64_t v5 = v4;
  if (v4 && (uint64_t v6 = v3, v3 + v4 <= (unint64_t)[(NSTextStorage *)self->_textStorage length]))
  {
    CGRect v30 = -[UITextFormattingViewControllerFormattingDescriptor initWithString:range:]([UITextFormattingViewControllerFormattingDescriptor alloc], "initWithString:range:", self->_textStorage, v6, v5);
    long long v31 = (void *)v56[5];
    v56[5] = (uint64_t)v30;

    long long v32 = [v40 formattingStyles];
    if (v32)
    {
      uint64_t v33 = [v40 formattingStyles];
      BOOL v34 = [v33 count] == 0;

      if (!v34)
      {
        textStorage = self->_textStorage;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __49__UITextView__descriptorForTextFormattingOptions__block_invoke;
        v52[3] = &unk_1E530B9E0;
        id v53 = v40;
        double v54 = &v55;
        -[NSTextStorage enumerateAttributesInRange:options:usingBlock:](textStorage, "enumerateAttributesInRange:options:usingBlock:", v6, v5, 0, v52);
        double v14 = v53;
LABEL_28:
      }
    }
  }
  else
  {
    id v7 = [UITextFormattingViewControllerFormattingDescriptor alloc];
    double v8 = [(UITextView *)self typingAttributes];
    uint64_t v9 = [(UITextFormattingViewControllerFormattingDescriptor *)v7 initWithAttributes:v8];
    double v10 = (void *)v56[5];
    v56[5] = v9;

    uint64_t v11 = [v40 formattingStyles];
    if (v11)
    {
      double v12 = [v40 formattingStyles];
      BOOL v13 = [v12 count] == 0;

      if (!v13)
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        double v14 = [v40 formattingStyles];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v62 count:16];
        if (v15)
        {
          id obj = v14;
          uint64_t v42 = *(void *)v49;
          while (2)
          {
            uint64_t v41 = v15;
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v49 != v42) {
                objc_enumerationMutation(obj);
              }
              CGRect v43 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              double v17 = [MEMORY[0x1E4F1CA60] dictionary];
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              double v18 = [v43 attributes];
              double v19 = [v18 allKeys];

              uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v61 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v45;
                do
                {
                  for (uint64_t j = 0; j != v20; ++j)
                  {
                    if (*(void *)v45 != v21) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                    uint64_t v24 = [(UITextView *)self typingAttributes];
                    double v25 = [v24 valueForKey:v23];

                    if (v25)
                    {
                      double v26 = [(UITextView *)self typingAttributes];
                      objc_super v27 = [v26 valueForKey:v23];
                      [v17 setValue:v27 forKey:v23];
                    }
                  }
                  uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v61 count:16];
                }
                while (v20);
              }

              long long v28 = [v43 attributes];
              int v29 = [v28 isEqualToDictionary:v17];

              if (v29)
              {
                long long v36 = [v43 styleKey];
                [(id)v56[5] setFormattingStyleKey:v36];

                goto LABEL_27;
              }
            }
            uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
            if (v15) {
              continue;
            }
            break;
          }
LABEL_27:
          double v14 = obj;
        }
        goto LABEL_28;
      }
    }
  }
  id v37 = (id)v56[5];

  _Block_object_dispose(&v55, 8);
  return v37;
}

void __49__UITextView__descriptorForTextFormattingOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v22 = a1;
  id obj = [*(id *)(a1 + 32) formattingStyles];
  uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        double v10 = [v8 attributes];
        uint64_t v11 = [v10 allKeys];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * j);
              double v17 = [v6 valueForKey:v16];

              if (v17)
              {
                double v18 = [v6 valueForKey:v16];
                [v9 setValue:v18 forKey:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v13);
        }

        double v19 = [v8 attributes];
        int v20 = [v19 isEqualToDictionary:v9];

        if (v20)
        {
          uint64_t v21 = [v8 styleKey];
          [*(id *)(*(void *)(*(void *)(v22 + 40) + 8) + 40) setFormattingStyleKey:v21];

          *a5 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
LABEL_20:
}

- (id)_disabledComponentsForTextFormattingOptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int v2 = [(_UITextLayoutController *)self->_textLayoutController canAccessLayoutManager];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  if (v2)
  {
    v7[0] = @"UITextFormattingViewControllerListStylesComponent";
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    uint64_t v5 = [v3 setWithArray:v4];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  return v5;
}

- (id)_supportedAnimationNamesForTextFormatting
{
  return 0;
}

- (id)_supportedAnimationTitlesForTextFormatting
{
  return 0;
}

- (id)_supportedAnimationAccessibilityHintsForTextFormatting
{
  return 0;
}

- (BOOL)_shouldAdjustKeyboardGuidesForTextFormattingIfNeeded
{
  return 1;
}

- (UITextFormattingViewControllerConfiguration)textFormattingConfiguration
{
  return self->_textFormattingConfiguration;
}

- (BOOL)_areDefaultTextFormattingAffordancesAvailable
{
  if (!self->_canShowTextFormattingOptions) {
    return 0;
  }
  uint64_t v3 = [(UIView *)self traitCollection];
  if ([v3 userInterfaceIdiom] != 6
    && [(UITextView *)self isEditable]
    && [(UITextView *)self isSelectable]
    && [(UITextView *)self allowsEditingTextAttributes])
  {
    uint64_t v4 = [(UITextView *)self _configurationForTextFormattingOptions];
    if (v4)
    {
      uint64_t v5 = [(UITextView *)self _supportedAnimationNamesForTextFormatting];
      BOOL v6 = v5 == 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isTextFormattingInProgress
{
  if ([(UITextView *)self _isTextFormattingControllerPresented]) {
    return 1;
  }
  uint64_t v3 = +[UISubstituteKeyboardSession activeSession];
  BOOL v2 = v3 != 0;

  return v2;
}

- (BOOL)_isTextFormattingControllerPresented
{
  textFormattingViewController = self->_textFormattingViewController;
  if (!textFormattingViewController) {
    return 0;
  }
  uint64_t v3 = [(UIViewController *)textFormattingViewController presentingViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isInCompactHorizontalSizeClass
{
  BOOL v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 horizontalSizeClass] == 1;

  return v3;
}

- (BOOL)_shouldHideInputViewsForTextFormatting
{
  textFormattingViewController = self->_textFormattingViewController;
  if (textFormattingViewController)
  {
    BOOL v4 = [(UIViewController *)textFormattingViewController popoverPresentationController];
    uint64_t v5 = [v4 sourceView];
    uint64_t v6 = [(UIView *)self superview];
    id v7 = (void *)v6;
    if (v6) {
      double v8 = (UITextView *)v6;
    }
    else {
      double v8 = self;
    }
    if (v5 == v8)
    {
      double v10 = [(UITextFormattingViewController *)self->_textFormattingViewController configuration];
      int v9 = [v10 _isTextAnimationsConfiguration] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)_shouldSuppressEditMenuForTextFormatting
{
  textFormattingViewController = self->_textFormattingViewController;
  if (textFormattingViewController)
  {
    BOOL v4 = [(UIViewController *)textFormattingViewController popoverPresentationController];
    uint64_t v5 = [v4 sourceView];
    uint64_t v6 = [(UIView *)self superview];
    id v7 = (void *)v6;
    if (v6) {
      double v8 = (UITextView *)v6;
    }
    else {
      double v8 = self;
    }
    if (v5 == v8)
    {
      uint64_t v12 = [(UITextFormattingViewController *)self->_textFormattingViewController configuration];
      BOOL v9 = ([v12 _isTextAnimationsConfiguration] & 1) != 0
        || [(UITextFormattingViewControllerConfiguration *)self->_textFormattingRestorationConfiguration _isTextAnimationsConfiguration];
    }
    else
    {
      BOOL v9 = [(UITextFormattingViewControllerConfiguration *)self->_textFormattingRestorationConfiguration _isTextAnimationsConfiguration];
    }

    return v9;
  }
  else
  {
    textFormattingRestorationConfiguration = self->_textFormattingRestorationConfiguration;
    return [(UITextFormattingViewControllerConfiguration *)textFormattingRestorationConfiguration _isTextAnimationsConfiguration];
  }
}

- (void)_textViewWillPresentTextFormattingOptions
{
  BOOL v3 = [(UIView *)self _viewControllerForAncestor];
  BOOL v4 = [v3 presentedViewController];

  if (v4)
  {
    id v6 = [(UIView *)self _viewControllerForAncestor];
    uint64_t v5 = [v6 presentedViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_prepareForTextFormattingControllerPresentationWithConfiguration:(id)a3 sender:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  if (self->_canShowTextFormattingOptions)
  {
    if (self->_textFormattingViewController)
    {
      [(UITextView *)self _dismissTextFormattingControllerIfNeededWithAnimation:1];
      goto LABEL_22;
    }
    objc_msgSend(v24, "set_preferringDimmingVisible:", 0);
    objc_msgSend(v24, "set_textViewConfiguration:", 1);
    id v7 = [[UITextFormattingViewController alloc] initWithConfiguration:v24];
    [(UITextFormattingViewController *)v7 _setInternalDelegate:self];
    [(UITextFormattingViewController *)v7 _setEditResponder:self];
    [(UIViewController *)v7 setModalPresentationStyle:7];
    double v8 = [(UIViewController *)v7 popoverPresentationController];
    [v8 setCanOverlapSourceViewRect:1];

    BOOL v9 = [(UIViewController *)v7 sheetPresentationController];
    [v9 setPrefersEdgeAttachedInCompactHeight:1];

    double v10 = [(UIViewController *)v7 popoverPresentationController];
    [v10 _setShouldDimPresentingViewTint:0];

    if ([v24 _isTextAnimationsConfiguration])
    {
      uint64_t v11 = [(UIViewController *)v7 popoverPresentationController];
      [v11 setDelegate:v7];
    }
    if ([(UITextView *)self _isInCompactHorizontalSizeClass]
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ([v24 _isTextAnimationsConfiguration]) {
          uint64_t v15 = 2;
        }
        else {
          uint64_t v15 = 15;
        }
        uint64_t v16 = [(UIViewController *)v7 popoverPresentationController];
        [v16 setPermittedArrowDirections:v15];

        double v17 = [(UIViewController *)v7 popoverPresentationController];
        uint64_t v18 = [(UIView *)self superview];
        double v19 = (void *)v18;
        if (v18) {
          int v20 = (UITextView *)v18;
        }
        else {
          int v20 = self;
        }
        [v17 setSourceView:v20];

        uint64_t v21 = [(UIViewController *)v7 popoverPresentationController];
        objc_msgSend(v21, "_setShouldHideArrow:", objc_msgSend(v24, "_isTextAnimationsConfiguration") ^ 1);

        if ([(UITextView *)self _isInCompactHorizontalSizeClass])
        {
          [(UITextFormattingViewController *)v7 _setShouldDeferFontPickerPresentationToViewController:0];
LABEL_21:
          textFormattingViewController = self->_textFormattingViewController;
          self->_textFormattingViewController = v7;

          [(UITextView *)self _updateTextFormattingController];
          [(UITextView *)self _presentTextFormattingController];
          goto LABEL_22;
        }
LABEL_20:
        uint64_t v22 = [(UIView *)self _viewControllerForAncestor];
        [(UITextFormattingViewController *)v7 _setShouldDeferFontPickerPresentationToViewController:v22];

        goto LABEL_21;
      }
      uint64_t v14 = [(UIViewController *)v7 popoverPresentationController];
      [v14 setPermittedArrowDirections:15];

      uint64_t v13 = [(UIViewController *)v7 popoverPresentationController];
      [v13 setSourceView:v6];
    }
    else
    {
      uint64_t v12 = [(UIViewController *)v7 popoverPresentationController];
      [v12 setPermittedArrowDirections:15];

      uint64_t v13 = [(UIViewController *)v7 popoverPresentationController];
      [v13 setBarButtonItem:v6];
    }

    goto LABEL_20;
  }
LABEL_22:
}

- (void)_presentTextFormattingController
{
  if (self->_textFormattingViewController)
  {
    [(UITextView *)self _textViewWillPresentTextFormattingOptions];
    objc_initWeak(&location, self);
    BOOL v3 = [(UIView *)self _viewControllerForAncestor];
    BOOL v4 = [(UITextFormattingViewController *)self->_textFormattingViewController configuration];
    if ([v4 _isTextAnimationsConfiguration])
    {
      char v5 = [v3 _isInSheetPresentation];

      if (v5)
      {
LABEL_6:
        textFormattingViewController = self->_textFormattingViewController;
        uint64_t v8 = MEMORY[0x1E4F143A8];
        uint64_t v9 = 3221225472;
        double v10 = __46__UITextView__presentTextFormattingController__block_invoke;
        uint64_t v11 = &unk_1E52DC308;
        objc_copyWeak(&v12, &location);
        [v3 presentViewController:textFormattingViewController animated:1 completion:&v8];
        -[UITextView _startSuppressingKeyboardForTextFormatting:](self, "_startSuppressingKeyboardForTextFormatting:", self->_textFormattingViewController, v8, v9, v10, v11);
        objc_destroyWeak(&v12);

        objc_destroyWeak(&location);
        return;
      }
      BOOL v4 = [(UIView *)self window];
      uint64_t v6 = [v4 rootViewController];

      BOOL v3 = (void *)v6;
    }

    goto LABEL_6;
  }
}

void __46__UITextView__presentTextFormattingController__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [WeakRetained _isInCompactHorizontalSizeClass]) {
    [WeakRetained _adjustBottomContentInsetForTextFormattingController:1];
  }
  id v2 = objc_loadWeakRetained(v1);
  BOOL v3 = [v2 interactionAssistant];
  [v3 dismissMenuForInputUI];
}

- (id)_scrollViewToAdjustForTextFormattingController
{
  uint64_t v3 = [(UIView *)self superview];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    char v5 = 0;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v4;

        char v5 = v6;
      }
      uint64_t v7 = [v4 superview];

      BOOL v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    char v5 = 0;
  }
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = self;
  }
  uint64_t v9 = v8;

  return v9;
}

- (void)_adjustBottomContentInsetForTextFormattingController:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UITextView *)self _shouldAdjustKeyboardGuidesForTextFormattingIfNeeded])
  {
    char v5 = [(UITextView *)self _scrollViewToAdjustForTextFormattingController];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    uint64_t v6 = _Block_copy(aBlock);
    if (v3)
    {
      [(UITextView *)self _textFormattingControllerOverlapHeight];
      double v8 = v7;
      [v5 adjustedContentInset];
      double v10 = v8 - v9;
      if (v8 - v9 <= 0.0)
      {
LABEL_9:

        return;
      }
      [v5 contentInset];
      [v5 contentInset];
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      uint64_t v16 = v15;
      double v18 = v10 + v17;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_2;
      v36[3] = &unk_1E52DA520;
      double v19 = (id *)v37;
      v37[0] = v5;
      v37[1] = v12;
      v37[2] = v14;
      *(double *)&_OWORD v37[3] = v18;
      v37[4] = v16;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_3;
      v34[3] = &unk_1E52D9FE8;
      int v20 = &v35;
      id v35 = v6;
      +[UIView animateWithDuration:v36 animations:v34 completion:0.2];
      self->_bottomContentInsetTextFormattingAdjustment = v10;
      self->_bottomContentInsetAfterTextFormattingAdjustment = v18;
    }
    else
    {
      if (self->_bottomContentInsetTextFormattingAdjustment <= 0.0) {
        goto LABEL_9;
      }
      [v5 contentInset];
      if (v21 != self->_bottomContentInsetAfterTextFormattingAdjustment) {
        goto LABEL_9;
      }
      [v5 contentInset];
      uint64_t v23 = v22;
      uint64_t v25 = v24;
      uint64_t v27 = v26;
      double v29 = v28 - self->_bottomContentInsetTextFormattingAdjustment;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_4;
      v32[3] = &unk_1E52DA520;
      double v19 = (id *)v33;
      v33[0] = v5;
      v33[1] = v23;
      v33[2] = v25;
      *(double *)&v33[3] = v29;
      v33[4] = v27;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_5;
      v30[3] = &unk_1E52D9FE8;
      int v20 = &v31;
      id v31 = v6;
      +[UIView animateWithDuration:v32 animations:v30 completion:0.2];
    }

    goto LABEL_9;
  }
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isScrollEnabled];
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 scrollSelectionToVisible:1];
  }
  else
  {
    return [v3 _scrollSelectionToVisibleInContainingScrollView:1];
  }
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)_textFormattingControllerOverlapHeight
{
  double height = 0.0;
  if (self->_textFormattingViewController
    && [(UITextView *)self _isInCompactHorizontalSizeClass])
  {
    BOOL v4 = [(UIViewController *)self->_textFormattingViewController view];
    char v5 = [(UIViewController *)self->_textFormattingViewController view];
    uint64_t v6 = [v5 safeAreaLayoutGuide];
    [v6 layoutFrame];
    objc_msgSend(v4, "convertRect:toView:", 0);
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    uint64_t v15 = [(UITextView *)self _scrollViewToAdjustForTextFormattingController];
    uint64_t v16 = [v15 superview];
    [v15 frame];
    objc_msgSend(v16, "convertRect:toView:", 0);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v26.origin.double x = v8;
    v26.origin.double y = v10;
    v26.size.double width = v12;
    v26.size.double height = v14;
    v28.origin.double x = v18;
    v28.origin.double y = v20;
    v28.size.double width = v22;
    v28.size.double height = v24;
    CGRect v27 = CGRectIntersection(v26, v28);
    double height = v27.size.height;
  }
  return height;
}

- (void)_dismissTextFormattingControllerIfNeededWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITextView *)self _isTextFormattingControllerPresented])
  {
    [(UIViewController *)self->_textFormattingViewController dismissViewControllerAnimated:v3 completion:0];
  }
  else if (self->_textFormattingViewController)
  {
    -[UITextView _textFormattingDidDisappear:](self, "_textFormattingDidDisappear:");
  }
  [(UITextView *)self _stopSuppressingKeyboardForTextFormatting:0];
}

- (BOOL)_preserveSelectionDisplayForTextFormatting
{
  return self->_textFormattingViewController && self->_forceSelectionDisplayForTextFormatting;
}

- (void)_prepareForTextFormattingRestoration
{
  BOOL v3 = [(UITextFormattingViewController *)self->_textFormattingViewController configuration];
  int v4 = [v3 _isTextAnimationsConfiguration];

  if (v4)
  {
    char v5 = [(UITextFormattingViewController *)self->_textFormattingViewController configuration];
    textFormattingRestorationConfiguration = self->_textFormattingRestorationConfiguration;
    self->_textFormattingRestorationConfiguration = v5;
  }
}

- (void)_performTextFormattingRestorationIfNeeded
{
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v4 = [v3 _isPreservedRestorableResponder:self];

  if (v4)
  {
    [(UITextView *)self _performTextFormattingRestoration];
  }
}

- (void)_performTextFormattingRestoration
{
  if (self->_textFormattingRestorationConfiguration)
  {
    textFormattingViewController = self->_textFormattingViewController;
    self->_textFormattingViewController = 0;

    if ([(UITextFormattingViewControllerConfiguration *)self->_textFormattingRestorationConfiguration _isTextAnimationsConfiguration])
    {
      [(UITextView *)self _showTextFormattingAnimationOptions:0];
    }
    else
    {
      [(UITextView *)self _prepareForTextFormattingControllerPresentationWithConfiguration:self->_textFormattingRestorationConfiguration sender:self];
    }
    textFormattingRestorationConfiguration = self->_textFormattingRestorationConfiguration;
    self->_textFormattingRestorationConfiguration = 0;
  }
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  if (self->_textFormattingViewController && self->_textFormattingKeyboardSuppressionAssertion)
  {
    BOOL v2 = 1;
    self->_didDisableAutomaticKeyboardBehaviorForTextFormatting = 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UITextView;
    return [(UIResponder *)&v4 _disableAutomaticKeyboardBehavior];
  }
  return v2;
}

- (id)_attributedPlaceholder
{
  if (a1)
  {
    BOOL v2 = (void *)*((void *)a1 + 277);
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [*((id *)a1 + 276) attributedText];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setOverridePlaceholder:(id)a3 alignment:(int64_t)a4
{
  id v6 = a3;
  id v14 = v6;
  if (self->_overriddenPlaceholder)
  {
    if (v6)
    {
      [(UITextView *)self setAttributedPlaceholder:v6];
      [(UILabel *)self->_placeholderLabel setTextAlignment:a4];
    }
    else
    {
      -[UITextView setAttributedPlaceholder:](self, "setAttributedPlaceholder:");
      [(UILabel *)self->_placeholderLabel setTextAlignment:self->_overriddenPlaceholderAlignment];
      overriddenPlaceholder = self->_overriddenPlaceholder;
      self->_overriddenPlaceholder = 0;
    }
  }
  else if (v6)
  {
    double v7 = [(UITextView *)self attributedPlaceholder];
    CGFloat v8 = v7;
    if (v7) {
      double v9 = v7;
    }
    else {
      double v9 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
    }
    double v11 = v9;

    NSTextAlignment v12 = [(UILabel *)self->_placeholderLabel textAlignment];
    [(UITextView *)self setAttributedPlaceholder:v14];
    [(UILabel *)self->_placeholderLabel setTextAlignment:a4];
    double v13 = self->_overriddenPlaceholder;
    self->_overriddenPlaceholder = v11;

    self->_overriddenPlaceholderAlignment = v12;
  }
  [(UITextView *)self _updatePlaceholderVisibility];
}

- (void)_setTextSizeCacheEnabled:(BOOL)a3
{
  if (((((*(void *)&self->_tvFlags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v3 = 1024;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFFBFFLL | v3);
    if (!a3)
    {
      intrinsicSizeCache = self->_intrinsicSizeCache;
      self->_intrinsicSizeCache = 0;
    }
  }
}

- (BOOL)_isTextSizeCacheEnabled
{
  return (*((unsigned __int8 *)&self->_tvFlags + 1) >> 2) & 1;
}

- (BOOL)hasText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained hasText];

  return v3;
}

- (void)insertText:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained insertText:v4];
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  id v6 = [off_1E52D2EA8 attributedText:a3 withAlternativeTexts:a4 style:a5];
  id v9 = (id)[v6 mutableCopy];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  CGFloat v8 = [WeakRetained typingAttributes];
  objc_msgSend(v9, "addAttributes:range:", v8, 0, objc_msgSend(v9, "length"));

  [(UITextView *)self insertAttributedText:v9];
}

- (void)insertText:(id)a3 style:(int64_t)a4 alternatives:(id)a5
{
}

- (void)addTextAlternatives:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained addTextAlternatives:v4];
}

- (void)removeEmojiAlternatives
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained removeEmojiAlternatives];
}

- (void)deleteBackward
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained deleteBackward];
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  if (a3)
  {
    [(UITextView *)self deleteBackward];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__UITextView__deleteBackwardAndNotify___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    [WeakRetained _performWhileSuppressingDelegateNotifications:v5];
  }
}

void __39__UITextView__deleteBackwardAndNotify___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 2112));
  [WeakRetained deleteBackward];
}

- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  unint64_t v3 = [WeakRetained textLengthToDeleteBeforeSelectedRangeForSmartDelete];

  return v3;
}

- (void)beginSelectionChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained beginSelectionChange];
}

- (void)endSelectionChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained endSelectionChange];
}

- (void)updateSelectionImmediately
{
  id v2 = [(UITextView *)self interactionAssistant];
  [v2 updateDisplayedSelection];
}

- (BOOL)_restoreFirstResponder
{
  unint64_t v3 = [(UITextView *)self interactionAssistant];
  id v4 = v3;
  if (!v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextView;
    if ([(UIResponder *)&v7 _restoreFirstResponder]) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
  [v3 checkEditabilityAndSetFirstResponderIfNecessary];
  if (![(UIView *)self isFirstResponder]) {
    goto LABEL_5;
  }
LABEL_3:
  [(UITextView *)self _performTextFormattingRestorationIfNeeded];
  BOOL v5 = 1;
LABEL_6:

  return v5;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UITextView *)self interactionAssistant];
  objc_msgSend(v5, "beginFloatingCursorAtPoint:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UITextView *)self interactionAssistant];
  objc_msgSend(v5, "updateFloatingCursorAtPoint:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v7 = [(UITextView *)self interactionAssistant];
  objc_msgSend(v7, "updateFloatingCursorAtPoint:animated:", v4, x, y);
}

- (void)endFloatingCursor
{
  id v2 = [(UITextView *)self interactionAssistant];
  [v2 endFloatingCursor];
}

- (BOOL)canBecomeFocused
{
  id v2 = self;
  unint64_t v3 = [(UIView *)self _focusBehavior];
  LOBYTE(v2) = [v3 textViewCanBecomeFocused:v2];

  return (char)v2;
}

- (id)_defaultFocusEffect
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  [(UITextView *)self visibleTextRect];
  -[UIView convertRect:toView:](self, "convertRect:toView:", 0);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  double v3 = [(UIView *)self _focusBehavior];
  __int16 v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x200) != 0)
  {
    double v5 = _UIFocusGroupIdentifierForInstance(self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextView;
    double v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (void)_diagnoseFocusabilityForReport:(id)a3
{
  id v5 = a3;
  if (![(UITextView *)self isSelectable])
  {
    __int16 v4 = +[_UIDebugIssue issueWithDescription:@"This text view is not selectable. Text views must return YES from -isSelectable in order to be focusable."];
    [v5 addIssue:v4];
  }
}

- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UITextView *)self _implementsEditMenu])
  {
    uint64_t v8 = [(_UITextLayoutController *)self->_textLayoutController characterRangeForTextRange:v6];
    uint64_t v10 = v9;
    double v11 = [(UIScrollView *)self delegate];
    NSTextAlignment v12 = objc_msgSend(v11, "textView:editMenuForTextInRange:suggestedActions:", self, v8, v10, v7);
  }
  else
  {
    NSTextAlignment v12 = 0;
  }

  return v12;
}

- (void)willPresentEditMenuWithAnimator:(id)a3
{
  id v7 = a3;
  __int16 v4 = [(UIScrollView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIScrollView *)self delegate];
    [v6 textView:self willPresentEditMenuWithAnimator:v7];
  }
}

- (void)willDismissEditMenuWithAnimator:(id)a3
{
  id v7 = a3;
  __int16 v4 = [(UIScrollView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIScrollView *)self delegate];
    [v6 textView:self willDismissEditMenuWithAnimator:v7];
  }
}

- (void)_logWarningForMenuControllerUsage
{
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Text", &_logWarningForMenuControllerUsage___s_category_0) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v3 = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Using UIMenuController to add items into text menus is deprecated. Please implement the UITextViewDelegate API textView:editMenuForTextInRange:suggestedActions: instead.", v3, 2u);
  }
}

- (CGPoint)_contentOffsetForScrollToVisible:(_NSRange)a3
{
  -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", a3.location, a3.length);
  double v5 = v4;
  double v7 = v6;
  [(UIScrollView *)self _effectiveContentInset];
  double v9 = v8;
  double v11 = v10;
  [(UIView *)self bounds];
  double v14 = v13 - (v9 + v11);
  if (v14 <= v7) {
    double v15 = 0.0;
  }
  else {
    double v15 = v9;
  }
  double v16 = -0.0;
  if (v14 > v7) {
    double v16 = v9;
  }
  double v17 = v12 + v16;
  if (v14 <= v7) {
    double v18 = v13;
  }
  else {
    double v18 = v14;
  }
  [(UIScrollView *)self contentOffset];
  if (v5 + v7 >= v18 + v17)
  {
    double v20 = v5 + v7 - v18;
  }
  else if (v5 < v17)
  {
    double v20 = v5 - v15;
  }
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (id)_previewRendererForRange:(id)a3 unifyRects:(BOOL)a4
{
  return (id)[(_UITextLayoutController *)self->_textLayoutController previewRendererForRange:a3 unifyRects:a4];
}

- (CGRect)_boundingRectForRange:(id)a3
{
  [(_UITextLayoutController *)self->_textLayoutController boundingRectForRange:a3];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_setSiriAnimationDictationStyleWithCharacterInsertionRate:(double)a3 minimumDurationBetweenHypotheses:(double)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"_UITextViewSiriAnimationStyleDictationRate";
  double v6 = [NSNumber numberWithDouble:a3];
  v10[1] = @"_UITextViewSiriAnimationStyleDictationDuration";
  v11[0] = v6;
  double v7 = [NSNumber numberWithDouble:a4];
  v11[1] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  siriParameters = self->_siriParameters;
  self->_siriParameters = v8;
}

- (id)extractWordArrayFromTokensArray:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F28E78] string];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        double v11 = v8;
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        double v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v11, "removeSpaceAfter", (void)v20) & 1) == 0
          && ([v12 removeSpaceBefore] & 1) == 0)
        {
          [(__CFString *)v4 appendString:@" "];
        }
        double v13 = [v12 text];
        [(__CFString *)v4 appendString:v13];

        id v8 = v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);

    if (v8 && ([v8 removeSpaceAfter] & 1) == 0) {
      [(__CFString *)v4 appendString:@" "];
    }
  }
  else
  {

    id v8 = 0;
  }
  double v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", (void)v20);
  CFIndex v15 = [(__CFString *)v4 length];
  CFLocaleRef v16 = [MEMORY[0x1E4F1CA20] currentLocale];
  v27.id location = 0;
  v27.NSUInteger length = v15;
  double v17 = CFStringTokenizerCreate(0, v4, v27, 3uLL, v16);
  while (1)
  {

    if (!CFStringTokenizerAdvanceToNextToken(v17)) {
      break;
    }
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v17);
    -[__CFString substringWithRange:](v4, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    CFLocaleRef v16 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
    [v14 addObject:v16];
  }
  CFRelease(v17);

  return v14;
}

- (void)_didRecognizeSpeechTokens:(id)a3
{
  id v4 = [(UITextView *)self extractWordArrayFromTokensArray:a3];
  [(UITextView *)self _didRecognizeSpeechStrings:v4];
}

- (void)_didRecognizeSpeechStrings:(id)a3
{
  id v11 = a3;
  id v4 = [(UITextView *)self interactionAssistant];
  [v4 setSelectionDisplayVisible:0];

  id v5 = [(UITextView *)self interactionAssistant];
  [v5 deactivateSelection];

  if (!self->_characterStreamingManager)
  {
    uint64_t v6 = [[_UICharacterStreamingManager alloc] initWithTextView:self];
    characterStreamingManager = self->_characterStreamingManager;
    self->_characterStreamingManager = v6;

    siriParameters = self->_siriParameters;
    if (siriParameters)
    {
      uint64_t v9 = [(NSDictionary *)siriParameters objectForKeyedSubscript:@"_UITextViewSiriAnimationStyleDictationDuration"];
      [v9 doubleValue];
      -[_UICharacterStreamingManager setMinDurationBetweenHypotheses:](self->_characterStreamingManager, "setMinDurationBetweenHypotheses:");

      double v10 = [(NSDictionary *)self->_siriParameters objectForKeyedSubscript:@"_UITextViewSiriAnimationStyleDictationRate"];
      [v10 doubleValue];
      -[_UICharacterStreamingManager setStreamingCharacterInsertionRate:](self->_characterStreamingManager, "setStreamingCharacterInsertionRate:");
    }
  }
  [(_UICharacterStreamingManager *)self->_characterStreamingManager setWords:v11];
}

- (void)_didFinishSpeechRecognition
{
  characterStreamingManager = self->_characterStreamingManager;
  if (characterStreamingManager)
  {
    [(_UICharacterStreamingManager *)characterStreamingManager commitFinalResults];
    id v4 = self->_characterStreamingManager;
    [(_UICharacterStreamingManager *)v4 _stopStreamingAnimation];
  }
}

- (void)_restoreScrollPosition:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  uint64_t v7 = [v15 range];
  -[UITextView _contentOffsetForScrollToVisible:](self, "_contentOffsetForScrollToVisible:", v7, v8);
  double v10 = v9;
  double v12 = v11;
  [v15 offsetWithinLine];
  double v14 = v12 + v13;
  if (v4)
  {
    -[UIScrollView _setContentOffset:animated:animationCurve:](self, "_setContentOffset:animated:animationCurve:", 1, 0, v10, v14);
    objc_storeStrong((id *)&self->_scrollTarget, a3);
  }
  else
  {
    -[UITextView setContentOffset:](self, "setContentOffset:", v10, v14);
  }
}

- (id)_restorableScrollPositionForStateRestoration
{
  return +[_UITextViewRestorableScrollPosition restorableScrollPositionForStateRestoration:self];
}

- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  +[_UITextViewRestorableScrollPosition restorableScrollPositionWithRange:](_UITextViewRestorableScrollPosition, "restorableScrollPositionWithRange:", a3.location, a3.length);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(UITextView *)self _restoreScrollPosition:v6 animated:v4];
}

- (void)scrollRangeToVisible:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if (dyld_program_sdk_at_least()) {
    BOOL v6 = +[UIView areAnimationsEnabled];
  }
  else {
    BOOL v6 = 1;
  }
  -[UITextView _scrollRangeToVisible:animated:](self, "_scrollRangeToVisible:animated:", location, length, v6);
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UITextView *)self selectedRange];
  -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", v5, v6);
  -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v3);
}

- (CGPoint)_contentOffsetForScrollingToRect:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  v18.receiver = self;
  v18.super_class = (Class)UITextView;
  -[UIScrollView _contentOffsetForScrollingToRect:](&v18, sel__contentOffsetForScrollingToRect_, a3.origin.x, a3.origin.y, a3.size.width);
  double v7 = v6;
  double v9 = v8;
  if (!dyld_program_sdk_at_least())
  {
    double y = v9;
    goto LABEL_16;
  }
  [(UIView *)self bounds];
  if (v10 - y >= 0.0) {
    double v12 = v10 - y;
  }
  else {
    double v12 = -(v10 - y);
  }
  double v13 = v10 + v11;
  double v14 = y + height;
  double v15 = v10 + v11 - (y + height);
  if (v15 < 0.0) {
    double v15 = -v15;
  }
  if (v15 >= v12)
  {
    if (y < v10) {
      goto LABEL_16;
    }
    double y = v9;
    if (v14 < v13) {
      goto LABEL_16;
    }
LABEL_15:
    double y = v14 - v11;
    goto LABEL_16;
  }
  if (v14 >= v13) {
    goto LABEL_15;
  }
  if (y >= v10) {
    double y = v9;
  }
LABEL_16:
  double v16 = v7;
  double v17 = y;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGRect)_rectToScrollToVisibleInCellInWindow:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = *MEMORY[0x1E4F1DB20];
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v9 = [(UIResponder *)self _textInteraction];
  double v10 = [v9 textInput];

  double v11 = [v10 selectedTextRange];
  if (v11)
  {
    double v12 = [v10 selectionRectsForRange:v11];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
    double height = v8;
    double width = v7;
    double y = v6;
    double x = v5;
    if (v13)
    {
      uint64_t v18 = v13;
      uint64_t v19 = *(void *)v46;
      double height = v8;
      double width = v7;
      double y = v6;
      double x = v5;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * v20) rect];
          v57.origin.double x = v21;
          v57.origin.double y = v22;
          v57.size.double width = v23;
          v57.size.double height = v24;
          v51.origin.double x = x;
          v51.origin.double y = y;
          v51.size.double width = width;
          v51.size.double height = height;
          CGRect v52 = CGRectUnion(v51, v57);
          double x = v52.origin.x;
          double y = v52.origin.y;
          double width = v52.size.width;
          double height = v52.size.height;
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v18);
    }
    v53.origin.double x = x;
    v53.origin.double y = y;
    v53.size.double width = width;
    v53.size.double height = height;
    if (CGRectIsNull(v53))
    {
      if ([v11 isEmpty])
      {
        uint64_t v25 = [v11 start];

        if (v25)
        {
          CGRect v26 = [v11 start];
          [v10 caretRectForPosition:v26];
          double x = v27;
          double y = v28;
          double width = v29;
          double height = v30;
        }
      }
    }
    v54.origin.double x = x;
    v54.origin.double y = y;
    v54.size.double width = width;
    v54.size.double height = height;
    if (!CGRectIsNull(v54))
    {
      id v31 = [v10 textInputView];
      objc_msgSend(v4, "convertRect:fromView:", v31, x, y, width, height);
      CGFloat v5 = v32;
      CGFloat v6 = v33;
      CGFloat v7 = v34;
      CGFloat v8 = v35;
    }
  }
  v55.origin.double x = v5;
  v55.origin.double y = v6;
  v55.size.double width = v7;
  v55.size.double height = v8;
  if (CGRectIsNull(v55))
  {
    v44.receiver = self;
    v44.super_class = (Class)UITextView;
    [(UIView *)&v44 _rectToScrollToVisibleInCellInWindow:v4];
    CGFloat v5 = v36;
    CGFloat v6 = v37;
    CGFloat v7 = v38;
    CGFloat v8 = v39;
  }

  double v40 = v5;
  double v41 = v6;
  double v42 = v7;
  double v43 = v8;
  result.size.double height = v43;
  result.size.double width = v42;
  result.origin.double y = v41;
  result.origin.double x = v40;
  return result;
}

- (id)selectedText
{
  BOOL v3 = [(UITextView *)self selectedTextRange];
  if (v3)
  {
    id v4 = [(UITextView *)self textInRange:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)textInRange:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  CGFloat v6 = [WeakRetained textInRange:v4];

  return v6;
}

- (void)insertAttributedText:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained insertAttributedText:v4];
}

- (id)attributedTextInRange:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  CGFloat v6 = [WeakRetained attributedTextInRange:v4];

  return v6;
}

- (void)_setWritingToolsStreamingReplacements:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_inputController = &self->_inputController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  int v7 = [WeakRetained isWritingToolsStreamingReplacements];

  CGFloat v8 = [(UITextView *)self undoManager];
  id v9 = objc_loadWeakRetained((id *)p_inputController);
  double v10 = [v9 undoManager];

  int v11 = v7 ^ 1;
  if ((v7 & 1) == 0 && v3)
  {
    if ((*((unsigned char *)&self->_tvFlags + 3) & 0x80) != 0)
    {
      double v12 = [(UIScrollView *)self delegate];
      [v12 _textViewWillBeginUndoCoalescingForWritingTools:self];
    }
    if (v8 != v10)
    {
      if (os_variant_has_internal_diagnostics()
        && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
      {
        double v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25AFB8) + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v17 = 138412290;
          uint64_t v18 = v8;
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, ">>>> UITextView will begin undo group in %@ for Writing Tools replacements", (uint8_t *)&v17, 0xCu);
        }
      }
      [v8 beginUndoGrouping];
    }
  }
  id v13 = objc_loadWeakRetained((id *)p_inputController);
  [v13 setWritingToolsStreamingReplacements:v3];

  if (!(v11 | v3))
  {
    if (v8 != v10)
    {
      if (os_variant_has_internal_diagnostics()
        && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
      {
        double v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25AFC0) + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 138412290;
          uint64_t v18 = v8;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "<<<< UITextView will end undo group in %@ for Writing Tools replacements", (uint8_t *)&v17, 0xCu);
        }
      }
      [v8 endUndoGrouping];
    }
    if (*((unsigned char *)&self->_tvFlags + 4))
    {
      double v14 = [(UIScrollView *)self delegate];
      [v14 _textViewDidEndUndoCoalescingForWritingTools:self];
    }
  }
}

- (BOOL)_isWritingToolsStreamingReplacements
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained isWritingToolsStreamingReplacements];

  return v3;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained replaceRange:v7 withText:v6];
}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained replaceRange:v7 withAttributedText:v6];
}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained replaceRangeWithTextWithoutClosingTyping:v7 replacementText:v6];
}

- (id)_replaceRange:(id)a3 withAttributedText:(id)a4 updatingSelection:(BOOL)a5
{
  BOOL v5 = a5;
  p_inputController = &self->_inputController;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  int v11 = [WeakRetained replaceRange:v9 withAttributedText:v8 updatingSelection:v5];

  return v11;
}

- (void)setSelectedTextRange:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  if (WeakRetained)
  {
    BOOL v5 = objc_loadWeakRetained((id *)&self->_inputController);
    [v5 setSelectedTextRange:v6];
  }
  else
  {
    BOOL v5 = [(UITextView *)self interactionAssistant];
    [v5 selectionChanged];
  }
}

- (int64_t)selectionAffinity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  int64_t v3 = [WeakRetained selectionAffinity];

  return v3;
}

- (NSDictionary)markedTextStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  int64_t v3 = [WeakRetained markedTextStyle];

  return (NSDictionary *)v3;
}

- (void)setMarkedTextStyle:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained setMarkedTextStyle:v4];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  p_inputController = &self->_inputController;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "setMarkedText:selectedRange:", v7, location, length);
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  p_inputController = &self->_inputController;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "setAttributedMarkedText:selectedRange:", v7, location, length);
}

- (void)unmarkText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained unmarkText];
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  id v9 = [WeakRetained textRangeFromPosition:v7 toPosition:v6];

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  p_inputController = &self->_inputController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  id v8 = [WeakRetained positionFromPosition:v6 offset:a4];

  return v8;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  p_inputController = &self->_inputController;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  double v10 = [WeakRetained positionFromPosition:v8 inDirection:a4 offset:a5];

  return v10;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  int64_t v9 = [WeakRetained comparePosition:v7 toPosition:v6];

  return v9;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  p_inputController = &self->_inputController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  id v8 = [WeakRetained positionWithinRange:v6 farthestInDirection:a4];

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  p_inputController = &self->_inputController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  id v8 = [WeakRetained characterRangeByExtendingPosition:v6 inDirection:a4];

  return v8;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  return (id)-[_UITextLayoutController _visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:](self->_textLayoutController, "_visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:", a3, a5, a6, a4.x, a4.y);
}

- (id)undoManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  int64_t v3 = [WeakRetained undoManager];

  return v3;
}

- (void)setInputDelegate:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained setInputDelegate:v4];
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  p_inputController = &self->_inputController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  int64_t v8 = [WeakRetained baseWritingDirectionForPosition:v6 inDirection:a4];

  return v8;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained setBaseWritingDirection:a3 forRange:v6];
}

- (CGRect)firstRectForRange:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained firstRectForRange:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  p_inputController = &self->_inputController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  double v8 = [WeakRetained textStylingAtPosition:v6 inDirection:a4];

  return v8;
}

- (id)selectionRectsForRange:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  id v6 = [WeakRetained selectionRectsForRange:v4];

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v6 = objc_msgSend(WeakRetained, "closestPositionToPoint:", x, y);

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  p_inputController = &self->_inputController;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  double v9 = objc_msgSend(WeakRetained, "closestPositionToPoint:withinRange:", v7, x, y);

  return v9;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v6 = objc_msgSend(WeakRetained, "characterRangeAtPoint:", x, y);

  return v6;
}

- (BOOL)_showsEditMenu
{
  return (*((unsigned __int8 *)&self->_tvFlags + 1) >> 3) & 1;
}

- (void)_presentEditMenu
{
}

- (void)_dismissEditMenu
{
}

- (BOOL)_shouldSuppressSelectionCommands
{
  return 0;
}

- (BOOL)_isSystemAttachment:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  char v6 = [WeakRetained _isSystemAttachment:v4];

  return v6;
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v6 = objc_msgSend(WeakRetained, "insertTextPlaceholderWithSize:", width, height);

  return v6;
}

- (void)removeTextPlaceholder:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained removeTextPlaceholder:v4];
}

- (id)insertDictationResultPlaceholder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  int64_t v3 = [WeakRetained insertDictationResultPlaceholder];

  return v3;
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained frameForDictationResultPlaceholder:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  BOOL v4 = a4;
  p_inputController = &self->_inputController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained removeDictationResultPlaceholder:v6 willInsertResult:v4];
}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  double v8 = [WeakRetained rangeWithTextAlternatives:a3 atPosition:v6];

  return v8;
}

- (NSDictionary)typingAttributes
{
  [(UITextView *)self _syncTypingAttributesToTextContainerAttributesForExtraLineFragment];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  BOOL v4 = [WeakRetained typingAttributes];

  return (NSDictionary *)v4;
}

- (void)setTypingAttributes:(NSDictionary *)typingAttributes
{
  double v8 = typingAttributes;
  BOOL v4 = [(NSDictionary *)v8 objectForKeyedSubscript:@"_UITextInputDictationResultMetadata"];

  if (v4)
  {
    BOOL v5 = (void *)[(NSDictionary *)v8 mutableCopy];
    [v5 removeObjectForKey:@"_UITextInputDictationResultMetadata"];
    uint64_t v6 = [v5 copy];

    double v8 = (NSDictionary *)v6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained setTypingAttributes:v8];

  [(UITextView *)self _syncTypingAttributesToTextContainerAttributesForExtraLineFragment];
  if (![(UIView *)self->_placeholderLabel isHidden]) {
    [(UITextView *)self _setNeedsTextLayout];
  }
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained setContinuousSpellCheckingEnabled:v3];
}

- (BOOL)performFinalGrammarChecking
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained performFinalGrammarChecking];

  return v3;
}

- (void)applyGrammarCheckingIndication
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained applyGrammarCheckingIndication];
}

- (void)textInputDidChange:(id)a3
{
  id v13 = a3;
  if (self)
  {
    self->_textContainerInsetAdjustment.double top = -[UITextView _applicableContentOutsetsFromFonts](self);
    self->_textContainerInsetAdjustment.double left = v4;
    self->_textContainerInsetAdjustment.double bottom = v5;
    self->_textContainerInsetAdjustment.double right = v6;
  }
  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
  double v7 = [(_UITextContainerView *)self->_containerView canvasView];
  [v7 updateContentSizeIfNeeded];

  [(UITextView *)self _resyncContainerFrameForNonAutolayout];
  [(UITextDragDropSupport *)self->_textDragDropSupport notifyTextInteraction];
  double v8 = [(UIScrollView *)self delegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 textViewDidChange:self];
  }
  double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"UITextViewTextDidChangeNotification" object:self];

  [(UITextView *)self _updateTextFormattingController];
  [(UITextView *)self _scrollToSelectionIfNeeded];
  uint64_t v10 = [(UIView *)self->_textEmphasisBackgroundView window];
  if (v10)
  {
    double v11 = (void *)v10;
    BOOL v12 = [(UIView *)self->_textEmphasisBackgroundView isHidden];

    if (!v12) {
      [(UIView *)self->_textEmphasisBackgroundView setNeedsDisplay];
    }
  }
}

- (void)textInputDidChangeSelection:(id)a3
{
  id v4 = [(UIScrollView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 textViewDidChangeSelection:self];
  }
  [(UITextView *)self _updateTextFormattingController];
  [(UITextView *)self _scrollToCaretIfNeeded];
}

- (void)_customUndoManagerDidFinishUndoRedoChanges
{
}

- (void)_customUndoManagerUndoRedoDidApplyAttributedText:(id)a3 toCharacterRange:(_NSRange)a4
{
}

- (void)textInputDidFinishUndoRedoChanges:(id)a3
{
  if ([(UITextView *)self isWritingToolsActive])
  {
    id v4 = [(UITextView *)self _existingTextAssistantManager];
    [v4 finishUndoRedoChanges];
  }
}

- (void)textInput:(id)a3 undoRedoDidApplyAttributedText:(id)a4 toCharacterRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a4;
  if ([(UITextView *)self isWritingToolsActive])
  {
    double v8 = [(UITextView *)self _existingTextAssistantManager];
    objc_msgSend(v8, "updateForCharactersInRange:withReplacement:isUndoRedo:", location, length, v9, 1);
  }
}

- (void)textInput:(id)a3 didApplyAttributedText:(id)a4 toCharacterRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (self->_customRenderController
    && [(UITextView *)self _customRenderControllerPermitsSetTextDidEditRange])
  {
    double v11 = -[UITextView _NSTextRangeFromNSRange:](self, "_NSTextRangeFromNSRange:", location, length);
    -[NSCustomTextRendering textDidEditRange:replacementLength:](self->_customRenderController, "textDidEditRange:replacementLength:", v11, [v10 length]);
  }
  BOOL v12 = [(UITextView *)self _existingTextAssistantManager];
  if ([(UITextView *)self isWritingToolsActive]
    && ([v12 isReplacingTextByRequest] & 1) == 0
    && ![(UITextView *)self _isWritingToolsStreamingReplacements])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    int v14 = [WeakRetained _undoRedoInProgress];

    if (v14)
    {
      if (os_variant_has_internal_diagnostics()
        && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
      {
        double v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &textInput_didApplyAttributedText_toCharacterRange____s_category)+ 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = 136315138;
          double v17 = "-[UITextView textInput:didApplyAttributedText:toCharacterRange:]";
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "%s unexpectedly received during undo-redo", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    else
    {
      objc_msgSend(v12, "updateForCharactersInRange:withReplacement:isUndoRedo:", location, length, v10, 0);
    }
  }
}

- (BOOL)allowsAttachments
{
  return 1;
}

- (id)_currentDefaultAttributes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained typingAttributes];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *(void *)off_1E52D2048;
  CGFloat v6 = [v4 objectForKey:*(void *)off_1E52D2048];

  if (!v6)
  {
    double v7 = [(id)objc_opt_class() _defaultTextColor];
    [v4 setObject:v7 forKey:v5];
  }
  return v4;
}

- (void)setText:(NSString *)text
{
  double v7 = text;
  id v4 = [(UITextView *)self _currentDefaultAttributes];
  if (v7) {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v4];
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }
  CGFloat v6 = v5;
  [(UITextView *)self setAttributedText:v5];
}

+ (id)_defaultFont
{
  id v2 = +[_UITextAttributeDefaults _unspecifiedDefaults];
  char v3 = [v2 _textView];
  id v4 = [v3 _font];

  return v4;
}

- (UIColor)textColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained typingAttributes];
  id v4 = [v3 valueForKey:*(void *)off_1E52D2048];

  return (UIColor *)v4;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
  textStorage = self->_textStorage;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __31__UITextView_setTextAlignment___block_invoke;
  v15[3] = &__block_descriptor_40_e23_v16__0__NSTextStorage_8l;
  v15[4] = textAlignment;
  [(NSTextStorage *)textStorage coordinateEditing:v15];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  double v7 = [WeakRetained typingAttributes];
  uint64_t v8 = *(void *)off_1E52D21B8;
  id v9 = [v7 valueForKey:*(void *)off_1E52D21B8];
  id v10 = (void *)[v9 mutableCopy];
  double v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init((Class)off_1E52D2D48);
  }
  id v13 = v12;

  [v13 setAlignment:textAlignment];
  id v14 = objc_loadWeakRetained((id *)&self->_inputController);
  [v14 _addToTypingAttributes:v8 value:v13];

  [(UITextView *)self _syncTypingAttributesToTextContainerAttributesForExtraLineFragment];
}

void __31__UITextView_setTextAlignment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)off_1E52D21B8;
  uint64_t v5 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__UITextView_setTextAlignment___block_invoke_2;
  v8[3] = &unk_1E530B858;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v8);
}

void __31__UITextView_setTextAlignment___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (void *)[a2 mutableCopy];
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = objc_alloc_init((Class)off_1E52D2D48);
  }
  id v10 = v9;

  [v10 setAlignment:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(void *)off_1E52D21B8, v10, a3, a4);
}

- (NSTextAlignment)textAlignment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v3 = [WeakRetained typingAttributes];
  uint64_t v4 = [v3 valueForKey:*(void *)off_1E52D21B8];

  if (v4) {
    NSTextAlignment v5 = [v4 alignment];
  }
  else {
    NSTextAlignment v5 = NSTextAlignmentNatural;
  }

  return v5;
}

- (void)setSelectedRange:(NSRange)selectedRange
{
  NSUInteger length = selectedRange.length;
  NSUInteger location = selectedRange.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "setSelectedRange:", location, length);

  [(UITextView *)self updateSelection];
}

- (BOOL)_shouldBecomeEditableUponFocus
{
  return 0;
}

- (BOOL)_shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment
{
  return 0;
}

- (void)setClearsOnInsertion:(BOOL)clearsOnInsertion
{
  if (self->_clearsOnInsertion != clearsOnInsertion)
  {
    self->_clearsOnInsertion = clearsOnInsertion;
    if (clearsOnInsertion)
    {
      uint64_t v4 = [(UITextView *)self interactionAssistant];
      [v4 deactivateSelection];

      [(UITextView *)self selectAll:self];
    }
    else if (![(UITextView *)self isTextDragActive])
    {
      NSTextAlignment v5 = [(UITextView *)self interactionAssistant];
      [v5 activateSelection];

      uint64_t v6 = [(UITextView *)self interactionAssistant];
      [v6 setSelectionDisplayVisible:1];
    }
    [(UITextView *)self _updateSelectionGestures];
  }
}

- (BOOL)clearsOnInsertion
{
  return self->_clearsOnInsertion;
}

- (void)disableClearsOnInsertion
{
}

- (id)webView
{
  return 0;
}

- (void)setContentToHTMLString:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 dataUsingEncoding:4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v8 = *(void *)off_1E52D1FC0;
    v9[0] = *(void *)off_1E52D2078;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v7 = (id)[v5 initWithData:v4 options:v6 documentAttributes:0 error:0];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }
  [(UITextView *)self setAttributedText:v7];
}

- (BOOL)shouldAutoscrollAboveBottom
{
  return *(unsigned char *)&self->_tvFlags >> 7;
}

- (void)setShouldAutoscrollAboveBottom:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFFFF7FLL | v3);
  [(UITextView *)self updateAutoscrollAboveBottom];
}

- (void)updateAutoscrollAboveBottom
{
  if ([(UITextView *)self shouldAutoscrollAboveBottom]
    && [(UITextView *)self isEditing])
  {
    double v3 = 60.0;
  }
  else
  {
    double v3 = 0.0;
  }
  -[UIScrollView _setContentScrollInset:](self, "_setContentScrollInset:", 0.0, 0.0, v3, 0.0);
}

- (unint64_t)marginTop
{
  return (unint64_t)self->_unadjustedTextContainerInset.top;
}

- (void)_setHorizontalMargins:(unint64_t)a3
{
  self->_unadjustedTextContainerInset.double left = (double)a3;
  self->_unadjustedTextContainerInset.double right = (double)a3;
  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
}

- (CGPoint)textContainerOrigin
{
  [(_UITextContainerView *)self->_containerView textContainerOrigin];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLineHeight:(double)a3
{
  textStorage = self->_textStorage;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__UITextView_setLineHeight___block_invoke;
  v4[3] = &__block_descriptor_40_e23_v16__0__NSTextStorage_8l;
  *(double *)&v4[4] = a3;
  [(NSTextStorage *)textStorage coordinateEditing:v4];
}

void __28__UITextView_setLineHeight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)off_1E52D21B8;
  id v4 = a2;
  uint64_t v5 = [v4 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__UITextView_setLineHeight___block_invoke_2;
  v6[3] = &__block_descriptor_40_e27_v40__0_8__NSRange_QQ_16_B32l;
  v6[4] = *(void *)(a1 + 32);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v5, 0x100000, v6);
}

void __28__UITextView_setLineHeight___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    id v3 = (id)[a2 mutableCopy];
  }
  else {
    id v3 = objc_alloc_init((Class)off_1E52D2D48);
  }
  id v4 = v3;
  [v3 setMinimumLineHeight:*(double *)(a1 + 32)];
  [v4 setMaximumLineHeight:*(double *)(a1 + 32)];
}

- (double)lineHeight
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  textStorage = self->_textStorage;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__UITextView_lineHeight__block_invoke;
  v5[3] = &unk_1E52DF988;
  v5[4] = &v6;
  [(NSTextStorage *)textStorage coordinateReading:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __24__UITextView_lineHeight__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)off_1E52D21B8;
  id v4 = a2;
  uint64_t v5 = [v4 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__UITextView_lineHeight__block_invoke_2;
  v6[3] = &unk_1E52DE5D8;
  v6[4] = *(void *)(a1 + 32);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v5, 0x100000, v6);
}

uint64_t __24__UITextView_lineHeight__block_invoke_2(uint64_t result, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    uint64_t v6 = result;
    CGPoint result = [a2 minimumLineHeight];
    *(void *)(*(void *)(*(void *)(v6 + 32) + 8) + 24) = v7;
    *a5 = 1;
  }
  return result;
}

- (void)setTextHighlightAttributes:(id)a3
{
}

- (NSDictionary)textHighlightAttributes
{
  return [(_UITextContainerView *)self->_containerView textHighlightAttributes];
}

- (void)drawTextHighlightBackgroundForTextRange:(id)a3 origin:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  uint64_t v11 = [(UITextView *)self textLayoutManager];
  id v12 = (void *)v11;
  if (v10 && v11)
  {
    id v13 = [(UITextView *)self textStorage];
    unint64_t v14 = [v13 length];
    id v31 = v8;
    v39[0] = v8;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    unint64_t v16 = [(UITextView *)self _nsRangeForTextKitRanges:v15];
    uint64_t v18 = v17;

    if (v14 < v16 + v18)
    {
      double v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2 object:self file:@"UITextView.m" lineNumber:5996 description:@"Incorrect textRange"];
    }
    uint64_t v19 = 2;
    if (v14 - (v16 + v18) >= 2) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = v14 - (v16 + v18);
    }
    if (v14 <= v16 + v18) {
      uint64_t v20 = 0;
    }
    if (v16 < 2) {
      uint64_t v19 = v16;
    }
    unint64_t v21 = v16 - v19;
    uint64_t v22 = v19 + v18 + v20;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v25 = *(void *)off_1E52D2318;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __61__UITextView_drawTextHighlightBackgroundForTextRange_origin___block_invoke;
    v32[3] = &unk_1E52DEB90;
    unint64_t v37 = v16;
    uint64_t v38 = v18;
    id v33 = v13;
    double v34 = self;
    id v35 = v23;
    id v36 = v24;
    id v26 = v24;
    id v27 = v23;
    id v28 = v13;
    objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v25, v21, v22, 0, v32);
    double v29 = -[UITextView _NSTextRangeFromNSRange:](self, "_NSTextRangeFromNSRange:", v21, v22);
    objc_msgSend(v12, "drawTextHighlightBackgroundForRunTextRanges:attributes:documentRange:origin:context:", v27, v26, v29, v10, x, y);

    id v8 = v31;
  }
}

void __61__UITextView_drawTextHighlightBackgroundForTextRange_origin___block_invoke(uint64_t a1, uint64_t a2, NSRange a3)
{
  NSRange v5 = NSIntersectionRange(*(NSRange *)(a1 + 64), a3);
  if (a2)
  {
    if (v5.length)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__UITextView_drawTextHighlightBackgroundForTextRange_origin___block_invoke_2;
      v8[3] = &unk_1E530BEC0;
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 48);
      void v8[4] = *(void *)(a1 + 40);
      NSRange v11 = v5;
      id v9 = v7;
      id v10 = *(id *)(a1 + 56);
      objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", v5.location, v5.length, 0, v8);
    }
  }
}

void __61__UITextView_drawTextHighlightBackgroundForTextRange_origin___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  NSUInteger v8 = *(void *)(a1 + 56);
  NSUInteger v9 = *(void *)(a1 + 64);
  id v10 = a2;
  v14.NSUInteger location = a3;
  v14.NSUInteger length = a4;
  v15.NSUInteger location = v8;
  v15.NSUInteger length = v9;
  NSRange v11 = NSIntersectionRange(v14, v15);
  objc_msgSend(v7, "_NSTextRangeFromNSRange:", v11.location, v11.length);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v12];
  [*(id *)(a1 + 48) addObject:v10];
}

- (void)_applyHighlightStyle:(id)a3 toTextRange:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  uint64_t v7 = [(UITextView *)self attributedTextInRange:v11];
  NSUInteger v8 = (void *)[v7 mutableCopy];

  objc_msgSend(v8, "addAttribute:value:range:", *(void *)off_1E52D2318, v6, 0, objc_msgSend(v8, "length"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v10 = (id)[WeakRetained replaceRange:v11 withAttributedText:v8 updatingSelection:0];
}

- (void)_applyHighlightStyle:(id)a3 colorScheme:(id)a4 toTextRange:(id)a5
{
  id v14 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(UITextView *)self attributedTextInRange:v14];
  id v11 = (void *)[v10 mutableCopy];

  objc_msgSend(v11, "addAttribute:value:range:", *(void *)off_1E52D2318, v9, 0, objc_msgSend(v11, "length"));
  objc_msgSend(v11, "addAttribute:value:range:", *(void *)off_1E52D22D8, v8, 0, objc_msgSend(v11, "length"));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v13 = (id)[WeakRetained replaceRange:v14 withAttributedText:v11 updatingSelection:0];
}

- (void)_removeHighlightsFromTextRange:(id)a3
{
  id v8 = a3;
  id v4 = [(UITextView *)self attributedTextInRange:v8];
  NSRange v5 = (void *)[v4 mutableCopy];

  objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D2318, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D22D8, 0, objc_msgSend(v5, "length"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  id v7 = (id)[WeakRetained replaceRange:v8 withAttributedText:v5 updatingSelection:0];
}

- (id)_linkTextAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(UIScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3010000000;
    uint64_t v22 = &unk_186D7DBA7;
    unint64_t v23 = a4;
    uint64_t v24 = 1;
    textStorage = self->_textStorage;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke;
    v15[3] = &unk_1E52DFA28;
    uint64_t v17 = &v19;
    unint64_t v18 = a4;
    id v9 = v6;
    id v16 = v9;
    [(NSTextStorage *)textStorage coordinateReading:v15];
    id v10 = objc_msgSend(v7, "_textView:linkTextAttributesForLink:inRange:", self, v9, v20[4], v20[5]);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v10 = 0;
  }
  if (qword_1EB25AFC8 != -1) {
    dispatch_once(&qword_1EB25AFC8, &__block_literal_global_492);
  }
  if (qword_1EB25AFD0 && !v10)
  {
    id v11 = [(id)qword_1EB25AFD0 sharedController];
    id v10 = [v11 preferredTextAttributesForLinkAtCharacterIndex:a4 ofStorage:self->_textStorage];
  }
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(UITextView *)self linkTextAttributes];
  }
  id v13 = v12;

  return v13;
}

void __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)off_1E52D2110;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = a2;
  uint64_t v6 = [v5 length] - *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke_2;
  v9[3] = &unk_1E5309E50;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v8;
  long long v10 = v8;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v3, v4, v6, 0, v9);
}

void __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, char *a5)
{
  id v9 = a2;
  v15.NSUInteger location = a3;
  v15.NSUInteger length = a4;
  *(NSRange *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = NSUnionRange(v15, *(NSRange *)(*(void *)(*(void *)(a1 + 40) + 8)+ 32));
  long long v10 = *(void **)(a1 + 32);
  id v13 = v9;
  id v11 = v10;
  if (v11 == v13)
  {
    char v12 = 0;
  }
  else
  {
    char v12 = 1;
    if (v13 && v11) {
      char v12 = [v13 isEqual:v11] ^ 1;
    }
  }

  *a5 = v12;
}

Class __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke_3()
{
  Class result = NSClassFromString(&cfstr_Dddetectioncon.isa);
  qword_1EB25AFD0 = (uint64_t)result;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITextView;
  -[UIScrollView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (_UITextContainerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_containerView)
  {
    uint64_t v6 = self;

    id v5 = (_UITextContainerView *)v6;
  }
  return v5;
}

- (void)setContentMode:(int64_t)a3
{
  if (dyld_program_sdk_at_least()) {
    [(UIView *)self->_containerView setContentMode:a3];
  }
  v5.receiver = self;
  v5.super_class = (Class)UITextView;
  [(UIView *)&v5 setContentMode:a3];
}

- (BOOL)usesStandardTextScaling
{
  return [(_UITextContainerView *)self->_containerView usesStandardTextScaling];
}

- (void)setUsesStandardTextScaling:(BOOL)usesStandardTextScaling
{
}

- (void)_setCuiCatalog:(id)a3
{
  objc_super v5 = (CUICatalog *)a3;
  if (self->_cuiCatalog != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_cuiCatalog, a3);
    [(UITextView *)self setNeedsDisplay];
    objc_super v5 = v6;
  }
}

- (id)_cuiCatalog
{
  return self->_cuiCatalog;
}

- (void)_setCuiStyleEffectConfiguration:(id)a3
{
  id v10 = a3;
  id v4 = [(_UITextLayoutController *)self->_textLayoutController styleEffectConfiguration];

  objc_super v5 = v10;
  if (v4 != v10)
  {
    id v6 = (id)[v10 copy];
    if (!v6)
    {
      if (dyld_program_sdk_at_least()) {
        id v6 = objc_alloc_init(MEMORY[0x1E4F5E088]);
      }
      else {
        id v6 = 0;
      }
    }
    id v7 = [v6 appearanceName];

    if (!v7)
    {
      objc_super v8 = [(UIView *)self traitCollection];
      id v9 = -[UITraitCollection _styleEffectAppearanceName](v8);
      [v6 setAppearanceName:v9];
    }
    [(_UITextLayoutController *)self->_textLayoutController setStyleEffectConfiguration:v6];
    [(UITextView *)self setNeedsDisplay];

    objc_super v5 = v10;
  }
}

- (id)_cuiStyleEffectConfiguration
{
  return (id)[(_UITextLayoutController *)self->_textLayoutController styleEffectConfiguration];
}

- (void)_updateTextEffectsConfigurationIfNeeded
{
  uint64_t v3 = [(_UITextLayoutController *)self->_textLayoutController styleEffectConfiguration];
  if (v3)
  {
    id v12 = v3;
    id v4 = [(UIView *)self traitCollection];
    objc_super v5 = -[UITraitCollection _styleEffectAppearanceName](v4);

    id v6 = [v12 appearanceName];
    id v7 = v5;
    id v8 = v6;
    if (v7 == v8)
    {

      id v11 = v7;
    }
    else
    {
      id v9 = v8;
      if (v7 && v8)
      {
        char v10 = [v7 isEqual:v8];

        if (v10) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      id v11 = (void *)[v12 copy];
      [v11 setAppearanceName:v7];
      [(_UITextLayoutController *)self->_textLayoutController setStyleEffectConfiguration:v11];
      [(UITextView *)self setNeedsDisplay];
    }

LABEL_11:
    uint64_t v3 = v12;
  }
}

- (void)_setFreezeTextContainerSize:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITextView *)self _freezeTextContainerSize] != a3)
  {
    if (v3)
    {
      [(UITextView *)self textContainerInset];
      self->_beforeFreezingTextContainerInset.double top = v5;
      self->_beforeFreezingTextContainerInset.double left = v6;
      self->_beforeFreezingTextContainerInset.double bottom = v7;
      self->_beforeFreezingTextContainerInset.double right = v8;
      [(UIView *)self->_containerView frame];
      self->_beforeFreezingFrameSize.double width = v9;
      self->_beforeFreezingFrameSize.double height = v10;
      long long v11 = *(_OWORD *)&self->_beforeFreezingTextContainerInset.bottom;
      *(_OWORD *)&self->_duringFreezingTextContainerInset.double top = *(_OWORD *)&self->_beforeFreezingTextContainerInset.top;
      *(_OWORD *)&self->_duringFreezingTextContainerInset.double bottom = v11;
      containerView = self->_containerView;
      [(_UITextContainerView *)containerView _setFreezeTextContainerSize:1];
    }
    else
    {
      [(_UITextContainerView *)self->_containerView _setFreezeTextContainerSize:0];
      self->_unfreezingTextContainerSize = 1;
      [(UITextView *)self _setNeedsTextLayout];
      -[UITextView setTextContainerInset:](self, "setTextContainerInset:", self->_duringFreezingTextContainerInset.top, self->_duringFreezingTextContainerInset.left, self->_duringFreezingTextContainerInset.bottom, self->_duringFreezingTextContainerInset.right);
      [(UITextView *)self _updateTextContainerSizeAndSizeToFit];
    }
  }
}

- (BOOL)_allowAnimatedUpdateSelectionRectViews
{
  return !self->_unfreezingTextContainerSize;
}

- (id)textContainerView:(id)a3 linkTextAttributesForLink:(id)a4 forCharacterAtIndex:(unint64_t)a5
{
  return [(UITextView *)self _linkTextAttributesForLink:a4 forCharacterAtIndex:a5];
}

- (id)textContainerView:(id)a3 cuiCatalogForTextEffectName:(id)a4
{
  id v5 = a4;
  CGFloat v6 = [(UITextView *)self _cuiCatalog];
  int v7 = [v6 hasStylePresetWithName:v5];

  if (v7) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_autoscroll)
  {
    CGFloat v6 = objc_alloc_init(UIAutoscroll);
    autoscroll = self->_autoscroll;
    self->_autoscroll = v6;
  }
  long long v48 = self->_interactionAssistant;
  id v8 = self;
  CGFloat v9 = +[UIDevice currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v11 = 32.0;
  }
  else {
    double v11 = 8.0;
  }
  [(UIScrollView *)v8 visibleBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(UITextView *)v8 textContainerInset];
  double v21 = fmax(v20, v8->_textContainerInsetAdjustment.top);
  double horizontalTextContainerGeometryAdjustment = fmax(v22, v8->_textContainerInsetAdjustment.left);
  double v25 = fmax(v24, v8->_textContainerInsetAdjustment.bottom);
  double v27 = fmax(v26, v8->_textContainerInsetAdjustment.right);
  if (v8->_horizontalTextContainerGeometryAdjustment < 0.0) {
    double horizontalTextContainerGeometryAdjustment = v8->_horizontalTextContainerGeometryAdjustment;
  }
  double v28 = v13 + horizontalTextContainerGeometryAdjustment;
  double v29 = v15 + v21;
  double v30 = v17 - (v27 + horizontalTextContainerGeometryAdjustment);
  double v31 = v19 - (v21 + v25);
  [(UIScrollView *)v8 _effectiveContentInset];
  CGFloat v33 = v32 + v28;
  CGFloat v35 = v29 + v34;
  CGFloat v37 = v30 - (v32 + v36);
  CGFloat v39 = v31 - (v34 + v38);
  [(UIScrollView *)v8 contentSize];
  double v41 = v40;
  v50.origin.double x = v33;
  v50.origin.double y = v35;
  v50.size.CGFloat width = v37;
  v50.size.CGFloat height = v39;
  CGRect v51 = CGRectInset(v50, v11, v11);
  if (v39 < v41)
  {
    CGFloat v42 = v51.origin.x;
    CGFloat v43 = v51.origin.y;
    CGFloat width = v51.size.width;
    CGFloat height = v51.size.height;
    double MinY = CGRectGetMinY(v51);
    v52.origin.double x = v42;
    v52.origin.double y = v43;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    if (y > CGRectGetMaxY(v52))
    {
      if (y < MinY) {
        uint64_t v47 = 12;
      }
      else {
        uint64_t v47 = 8;
      }
      goto LABEL_18;
    }
    if (y < MinY)
    {
      uint64_t v47 = 4;
LABEL_18:
      -[UIAutoscroll startAutoscroll:scrollContainer:point:directions:repeatInterval:](self->_autoscroll, "startAutoscroll:scrollContainer:point:directions:repeatInterval:", v48, v8, v47, x, y, 0.075);
      goto LABEL_19;
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(UITextInteractionAssistant *)v48 autoscrollWillNotStart];
  }
  [(UITextView *)v8 cancelAutoscroll];
LABEL_19:
}

- (void)cancelAutoscroll
{
}

void __48__UITextView__adjustFontForAccessibilityTraits___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  int v7 = [v14 objectForKeyedSubscript:*(void *)off_1E52D21A0];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v14 objectForKeyedSubscript:*(void *)off_1E52D2040];
  }
  uint64_t v10 = v9;

  uint64_t v11 = [v10 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:*(void *)(a1 + 32)];
  double v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && ([v10 isEqual:v11] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D2040, v12, a3, a4);
  }
}

- (void)_setWantsContentAwareTypesettingLanguage:(BOOL)a3
{
  if (((((*(void *)&self->_tvFlags & 0x8000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v3 = 0x8000;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFFFFFFF7FFFLL | v3);
    [(UITextView *)self _adjustFontForTypesettingLanguage];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  int v8 = [WeakRetained _canHandleResponderAction:a3];

  if (!v8)
  {
    if (sel__showTextFormattingOptions_ == a3)
    {
      if ([(UITextView *)self _areDefaultTextFormattingAffordancesAvailable])
      {
        BOOL v11 = ![(UITextView *)self _isTextFormattingControllerPresented];
        goto LABEL_31;
      }
    }
    else
    {
      if (sel_find_ != a3
        && sel_findAndReplace_ != a3
        && sel_findNext_ != a3
        && sel_findPrevious_ != a3
        && sel_useSelectionForFind_ != a3
        && sel__findSelected_ != a3)
      {
        goto LABEL_26;
      }
      if (self->_findInteractionEnabled)
      {
        if (sel_findAndReplace_ == a3)
        {
          unsigned __int8 v17 = [(UITextView *)self supportsTextReplacement];
          goto LABEL_27;
        }
        if (sel_useSelectionForFind_ == a3 || sel__findSelected_ == a3)
        {
          id v9 = [(UITextView *)self selectedTextRange];
          char v10 = [v9 _isRanged];
          goto LABEL_3;
        }
LABEL_26:
        v19.receiver = self;
        v19.super_class = (Class)UITextView;
        unsigned __int8 v17 = [(UIView *)&v19 canPerformAction:a3 withSender:v6];
LABEL_27:
        LOBYTE(v11) = v17;
        goto LABEL_31;
      }
    }
    LOBYTE(v11) = 0;
    goto LABEL_31;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_inputController);
  char v10 = [v9 _shouldHandleResponderAction:a3 withSender:v6];
LABEL_3:
  LOBYTE(v11) = v10;

LABEL_31:
  return v11;
}

- (void)cut:(id)a3
{
  id v5 = a3;
  if ([(UITextView *)self keyboardInputShouldDelete:self])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    [WeakRetained cut:v5];
  }
}

- (void)copy:(id)a3
{
  p_inputController = &self->_inputController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained copy:v5];

  id v7 = [(UITextView *)self interactionAssistant];
  [v7 hideSelectionCommands];
}

- (void)_define:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _define:v4];
}

- (void)_translate:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _translate:v4];
}

- (BOOL)_isDisplayingReferenceLibraryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained _isDisplayingReferenceLibraryViewController];

  return v3;
}

- (void)_share:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _share:v4];
}

- (BOOL)_isDisplayingTextService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained _isDisplayingTextService];

  return v3;
}

- (BOOL)_isDisplayingShareViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained _isDisplayingShareViewController];

  return v3;
}

- (BOOL)_isDisplayingLookupViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained _isDisplayingLookupViewController];

  return v3;
}

- (void)_selectionMayChange:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _selectionMayChange:v4];
}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _insertAttributedTextWithoutClosingTyping:v4];
}

- (void)_addShortcut:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _addShortcut:v4];
}

- (BOOL)_isDisplayingShortcutViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained _isDisplayingShortcutViewController];

  return v3;
}

- (void)paste:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained paste:v4];
}

- (void)pasteAndMatchStyle:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained pasteAndMatchStyle:v4];
}

- (void)_pasteAttributedString:(id)a3 pasteAsRichText:(BOOL)a4
{
  BOOL v4 = a4;
  p_inputController = &self->_inputController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _pasteAttributedString:v6 pasteAsRichText:v4];
}

- (id)_attributedStringForInsertionOfAttributedString:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  id v6 = [WeakRetained _attributedStringForInsertionOfAttributedString:v4];

  return v6;
}

- (void)pasteItemProviders:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained pasteItemProviders:v4];
}

- (id)_effectivePasteConfiguration
{
  v8.receiver = self;
  v8.super_class = (Class)UITextView;
  char v3 = [(UIResponder *)&v8 _effectivePasteConfiguration];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(UITextView *)self _implicitPasteConfigurationClasses];
    id v5 = +[UIPasteConfiguration _pasteConfigurationForAcceptingClasses:v6];
  }
  return v5;
}

- (id)_implicitPasteConfigurationClasses
{
  v11[4] = *MEMORY[0x1E4F143B8];
  if ([(UITextView *)self isEditable])
  {
    BOOL v3 = [(UITextView *)self allowsEditingTextAttributes];
    uint64_t v4 = objc_opt_class();
    if (v3)
    {
      v11[0] = v4;
      v11[1] = objc_opt_class();
      v11[2] = objc_opt_class();
      void v11[3] = objc_opt_class();
      id v5 = (void *)MEMORY[0x1E4F1C978];
      id v6 = v11;
      uint64_t v7 = 4;
    }
    else
    {
      v10[0] = v4;
      v10[1] = objc_opt_class();
      id v5 = (void *)MEMORY[0x1E4F1C978];
      id v6 = v10;
      uint64_t v7 = 2;
    }
    objc_super v8 = [v5 arrayWithObjects:v6 count:v7];
  }
  else
  {
    objc_super v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (void)select:(id)a3
{
  id v3 = [(UITextView *)self interactionAssistant];
  [v3 selectWord];
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextView *)self interactionAssistant];
  [v5 selectAll:v4];
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained makeTextWritingDirectionNatural:v4];
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained makeTextWritingDirectionRightToLeft:v4];
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained makeTextWritingDirectionLeftToRight:v4];
}

- (void)toggleBoldface:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained toggleBoldface:v4];
}

- (void)toggleItalics:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained toggleItalics:v4];
}

- (void)toggleUnderline:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained toggleUnderline:v4];
}

- (void)increaseSize:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained increaseSize:self];
}

- (void)decreaseSize:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained decreaseSize:self];
}

- (void)updateTextAttributesWithConversionHandler:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained updateTextAttributesWithConversionHandler:v4];
}

- (void)replace:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained replace:v4];
}

- (void)_promptForReplace:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _promptForReplace:v4];
}

- (void)_transliterateChinese:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _transliterateChinese:v4];
}

- (void)alignLeft:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained alignLeft:v4];
}

- (void)alignCenter:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained alignCenter:v4];
}

- (void)alignJustified:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained alignJustified:v4];
}

- (void)alignRight:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained alignRight:v4];
}

- (void)captureTextFromCamera:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained captureTextFromCamera:v4];
}

- (void)validateCommand:(id)a3
{
  p_inputController = &self->_inputController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained validateCommand:v4];
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  [(UITextView *)self _hideTextFormattingOptions:0];
  id v9 = [(UIScrollView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v10 = objc_msgSend(v9, "textView:shouldChangeTextInRange:replacementText:", self, location, length, v8);
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  [(UITextView *)self _hideTextFormattingOptions:0];
  id v9 = [(UIScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [(UITextView *)self selectedRange];
    char v12 = -[UITextView textView:shouldChangeTextInRange:replacementText:](v9, "textView:shouldChangeTextInRange:replacementText:", self, v10, v11, v8);
LABEL_6:
    BOOL v13 = v12;
    goto LABEL_7;
  }
  BOOL v13 = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0 && v9 != self)
  {
    char v12 = [(UITextView *)v9 keyboardInput:v7 shouldInsertText:v8 isMarkedText:0];
    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4 = a3;
  [(UITextView *)self _hideTextFormattingOptions:0];
  id v5 = [(UIScrollView *)self delegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  uint64_t v7 = [WeakRetained _rangeForBackwardsDelete];
  uint64_t v9 = v8;

  if (objc_opt_respondsToSelector())
  {
    char v10 = -[UITextView textView:shouldChangeTextInRange:replacementText:](v5, "textView:shouldChangeTextInRange:replacementText:", self, v7, v9, &stru_1ED0E84C0);
LABEL_6:
    BOOL v11 = v10;
    goto LABEL_7;
  }
  BOOL v11 = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0 && v5 != self)
  {
    char v10 = [(UITextView *)v5 keyboardInputShouldDelete:v4];
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(UIScrollView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && v5 != self) {
    [(UITextView *)v5 keyboardInputChanged:v4];
  }

  return 1;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  id v5 = a3;
  id v4 = [(UIScrollView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && v4 != self) {
    [(UITextView *)v4 keyboardInputChangedSelection:v5];
  }
}

- (id)automaticallySelectedOverlay
{
  id v4 = [(UIView *)self _enclosingScrollableScrollerIncludingSelf];
  id v5 = v4;
  if (v4
    && ([v4 frame],
        double v7 = v6,
        [(UITextView *)self font],
        double v2 = objc_claimAutoreleasedReturnValue(),
        [v2 lineHeight],
        v7 > v8 * 3.0))
  {
    id v9 = v5;
  }
  else
  {
    char v10 = [(UIView *)self keyboardSceneDelegate];
    id v9 = [v10 containerView];

    if (!v5) {
      goto LABEL_6;
    }
  }

LABEL_6:
  return v9;
}

- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)&self->_tvFlags |= 0x400000000uLL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  [WeakRetained setSupportsAdaptiveImageGlyph:v3];
}

- (BOOL)supportsAdaptiveImageGlyph
{
  if ((*((unsigned char *)&self->_tvFlags + 4) & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    char v5 = [WeakRetained supportsAdaptiveImageGlyph];

    LOBYTE(v3) = v5;
  }
  else
  {
    int v3 = dyld_program_sdk_at_least();
    if (v3)
    {
      LOBYTE(v3) = [(UITextView *)self _supportsImagePasteCached];
    }
  }
  return v3;
}

- (BOOL)_supportsImagePasteCached
{
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = self->_tvFlags;
  if ((*(void *)&tvFlags & 0x800000000) == 0)
  {
    BOOL v4 = [(UIResponder *)self _supportsImagePaste];
    uint64_t v5 = 0x800000000;
    if (v4) {
      uint64_t v5 = 0x1800000000;
    }
    $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(void *)&self->_tvFlags & 0xFFFFFFE7FFFFFFFFLL | v5);
    self->_$CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = tvFlags;
  }
  return (*(unint64_t *)&tvFlags >> 36) & 1;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained insertAdaptiveImageGlyph:v7 replacementRange:v6];
}

- (BOOL)supportsEmojiImageTextAttachments
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained supportsEmojiImageTextAttachments];

  return v3;
}

- (void)insertEmojiImageTextAttachment:(id)a3 replacementRange:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained insertEmojiImageTextAttachment:v7 replacementRange:v6];
}

- (void)insertTextSuggestion:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(UIScrollView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIScrollView *)self delegate];
    [v6 _textView:self insertTextSuggestion:v7];
  }
}

- (BOOL)textInput:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector())
  {
    if (!objc_msgSend(WeakRetained, "textView:shouldChangeTextInRange:replacementText:", self, location, length, v8))
    {
      BOOL v10 = 0;
      goto LABEL_6;
    }
    [(UITextView *)self disableClearsOnInsertion];
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (void)textInputWillAnimatePaste:(id)a3
{
  *(void *)&self->_tvFlags |= 0x200uLL;
}

- (void)textInputDidAnimatePaste:(id)a3
{
  *(void *)&self->_tvFlags &= ~0x200uLL;
}

- (void)_textFormattingDidDisappear:(id)a3
{
  BOOL v4 = (UITextFormattingViewController *)a3;
  char v5 = v4;
  if (self->_textFormattingViewController == v4)
  {
    self->_textFormattingViewController = 0;
    id v7 = v4;

    [(UITextView *)self _stopSuppressingKeyboardForTextFormatting:v7];
    if (!self->_textFormattingShouldSkipRestoringFirstResponderWhenFinished) {
      [(UITextView *)self _restoreFirstResponder];
    }
    self->_textFormattingShouldSkipRestoringFirstResponderWhenFinished = 0;
    if (self->_didDisableAutomaticKeyboardBehaviorForTextFormatting)
    {
      [(UIResponder *)self reloadInputViews];
      self->_didDisableAutomaticKeyboardBehaviorForTextFormatting = 0;
    }
    [(UITextView *)self _adjustBottomContentInsetForTextFormattingController:0];
    self->_bottomContentInsetTextFormattingAdjustment = 0.0;
    self->_bottomContentInsetAfterTextFormattingAdjustment = 0.0;
    BOOL v6 = [(UIView *)self isFirstResponder];
    char v5 = v7;
    if (!v6 && self->_forceSelectionDisplayForTextFormatting)
    {
      [(UITextInteractionAssistant *)self->_interactionAssistant setSelectionDisplayVisible:0];
      [(UITextInteractionAssistant *)self->_interactionAssistant deactivateSelection];
      char v5 = v7;
      self->_forceSelectionDisplayForTextFormatting = 0;
    }
  }
}

- (void)_textFormattingRequestsFirstResponderRestoration:(id)a3
{
  self->_forceSelectionDisplayForTextFormatting = 0;
  [(UITextView *)self _restoreFirstResponder];
  [(UITextView *)self _updateTextFormattingControllerPresentationSource];
}

- (void)_textFormattingRequestsFirstResponderResignation:(id)a3
{
  self->_forceSelectionDisplayForTextFormatting = 1;
  self->_textFormattingShouldSkipHidingOnResignFirstResponder = 1;
  [(UITextView *)self resignFirstResponder];
}

- (void)_startSuppressingKeyboardForTextFormatting:(id)a3
{
  if ([(UITextView *)self _shouldHideInputViewsForTextFormatting])
  {
    id v6 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    BOOL v4 = [v6 vendKeyboardSuppressionAssertionForReason:@"Text Formatting" type:1];
    id textFormattingKeyboardSuppressionAssertion = self->_textFormattingKeyboardSuppressionAssertion;
    self->_id textFormattingKeyboardSuppressionAssertion = v4;
  }
}

- (void)_stopSuppressingKeyboardForTextFormatting:(id)a3
{
  id textFormattingKeyboardSuppressionAssertion = self->_textFormattingKeyboardSuppressionAssertion;
  self->_id textFormattingKeyboardSuppressionAssertion = 0;
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = [v8 dictationPhraseArray];
    [(UITextView *)self insertDictationResult:WeakRetained];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    [WeakRetained insertDictationResult:v8 withCorrectionIdentifier:v6];
  }
}

- (void)_setDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11 && [v11 count])
  {
    id v8 = +[UIDictationUtilities dictationPhrasesFromPhraseArray:v11];
    [v8 setFromKeyboard:0];
    [v8 setTransform:0];
    [v8 setUseServerCapitalization:0];
    if (!v7)
    {
      BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"UITextView.m", 6970, @"Only Siri calls -[UITextView _setDictationResult:withCorrectionIdentifier:], and it should always supply the correction identifier from the server." object file lineNumber description];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    objc_msgSend(WeakRetained, "_insertDictationResult:withCorrectionIdentifier:replacingRange:resultLength:", v8, v7, 0, -[NSTextStorage length](self->_textStorage, "length"), 0);
  }
}

- (void)_registerUndoOperationForReplacementWithActionName:(id)a3 replacementText:(id)a4
{
  p_inputController = &self->_inputController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  [WeakRetained _registerUndoOperationForReplacementWithActionName:v7 replacementText:v6];
}

- (id)metadataDictionariesForDictationResults
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  char v3 = [WeakRetained metadataDictionariesForDictationResults];

  return v3;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITextView *)self isSecureTextEntry] != a3)
  {
    char v5 = [(UITextView *)self _textInputTraits];
    [v5 setSecureTextEntry:v3];

    if ([(UITextView *)self _shouldObscureInput])
    {
      [(UITextView *)self selectedRange];
      if (v6) {
        [(UITextView *)self selectAll:self];
      }
    }
    id v7 = [(UITextView *)self interactionAssistant];
    [v7 updateDisplayedSelection];
  }
}

- (BOOL)_shouldObscureInput
{
  int v3 = [(UITextView *)self isSecureTextEntry];
  if (v3) {
    LOBYTE(v3) = [(UITextView *)self displaySecureTextUsingPlainText] ^ 1;
  }
  return v3;
}

- (void)setForceEnableDictation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITextView *)self _textInputTraits];
  [v4 setForceEnableDictation:v3];
}

- (BOOL)forceEnableDictation
{
  double v2 = [(UITextView *)self _textInputTraits];
  char v3 = [v2 forceEnableDictation];

  return v3;
}

- (void)setForceDisableDictation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITextView *)self _textInputTraits];
  [v4 setForceDisableDictation:v3];
}

- (BOOL)forceDisableDictation
{
  double v2 = [(UITextView *)self _textInputTraits];
  char v3 = [v2 forceDisableDictation];

  return v3;
}

- (UIColor)selectionHighlightColor
{
  char v3 = [(UITextView *)self textInputTraits];
  id v4 = [v3 selectionHighlightColor];

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled")&& (-[UIView traitCollection](self, "traitCollection"), v5 = objc_claimAutoreleasedReturnValue(), uint64_t v6 = [v5 userInterfaceStyle], v5, v6 == 2))
  {
    id v7 = [v4 colorWithAlphaComponent:0.35];
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;

  return (UIColor *)v8;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextView *)self textInputTraits];
  [v5 takeTraitsFrom:v4];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  return v4;
}

- (void)_cancelDataDetectors
{
  id v3 = [DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
  [v3 cancelURLificationForContainer:self];
}

- (void)_startDataDetectorsIfNeeded
{
  if ([(UITextView *)self _shouldStartDataDetectors])
  {
    [(UITextView *)self _startDataDetectors];
  }
}

- (void)_applyOptionsToGeometry
{
  uint64_t defaultTextPreviewOptions_low = LODWORD(self->_defaultTextPreviewOptions);
  if (defaultTextPreviewOptions_low == 0xFFFFFFFFLL) {
    LOBYTE(defaultTextPreviewOptions_low) = ![(UITextView *)self allowsEditingTextAttributes];
  }
  geometrdouble y = self->_geometry;
  [(_UITextStorageDraggableGeometry *)geometry setGeometryOptions:defaultTextPreviewOptions_low & 1];
}

- (id)_targetedPreviewForTextInteractableItem:(id)a3 dismissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6
    && ([(UITextView *)self _applyOptionsToGeometry],
        geometrdouble y = self->_geometry,
        [v6 range],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(_UITextStorageDraggableGeometry *)geometry targetedPreviewProviderForTextInRange:v8 dismissing:v4], id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(), v8, v9))
  {
    BOOL v10 = ((void (**)(void, UITextView *, uint64_t))v9)[2](v9, self, 1);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)_defaultTextPreviewOptions
{
  return self->_defaultTextPreviewOptions;
}

- (void)_setDefaultTextPreviewOptions:(unint64_t)a3
{
  self->_defaultTextPreviewOptions = a3;
}

- (BOOL)_delegatesAllowingTextItemInteractions
{
  double v2 = [(UIScrollView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = objc_opt_respondsToSelector();
  }

  return v3 & 1;
}

- (BOOL)_delegatesAllowingTextItemPrimaryActionInteraction
{
  double v2 = [(UIScrollView *)self delegate];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegatesAllowingTextItemMenuInteraction
{
  double v2 = [(UIScrollView *)self delegate];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegatesAllowingLinkInteraction
{
  if ([(UITextView *)self _delegatesAllowingTextItemPrimaryActionInteraction])
  {
    return 1;
  }
  return [(UITextView *)self _delegatesAllowingTextItemMenuInteraction];
}

- (BOOL)_allowInteraction:(int64_t)a3 forTextInteractableItem:(id)a4
{
  id v6 = a4;
  id v7 = [(UIScrollView *)self delegate];
  BOOL v8 = a3 != 0;
  if (a3)
  {
    if ([(UITextView *)self _delegatesAllowingTextItemMenuInteraction]) {
      goto LABEL_11;
    }
  }
  else if ([(UITextView *)self _delegatesAllowingTextItemPrimaryActionInteraction])
  {
    goto LABEL_11;
  }
  if ([v6 isLinkItem])
  {
    id v9 = v6;
    if (objc_opt_respondsToSelector())
    {
      textLayoutController = self->_textLayoutController;
      id v11 = [v9 range];
      uint64_t v12 = [(_UITextLayoutController *)textLayoutController characterRangeForTextRange:v11];
      uint64_t v14 = v13;

      double v15 = [v9 link];
      char v16 = objc_msgSend(v7, "textView:shouldInteractWithURL:inRange:interaction:", self, v15, v12, v14, v8);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        char v19 = 1;
        goto LABEL_19;
      }
      double v27 = self->_textLayoutController;
      double v28 = [v9 range];
      uint64_t v29 = [(_UITextLayoutController *)v27 characterRangeForTextRange:v28];
      uint64_t v31 = v30;

      double v15 = [v9 link];
      char v16 = objc_msgSend(v7, "textView:shouldInteractWithURL:inRange:", self, v15, v29, v31);
    }
    char v19 = v16;
    goto LABEL_18;
  }
  if ([v6 isAttachmentItem])
  {
    id v17 = v6;
    double v18 = [v17 attachment];
    char v19 = [off_1E52D2EB0 _attachmentHasImage:v18];

    char v20 = dyld_program_sdk_at_least();
    if (objc_opt_respondsToSelector())
    {
      double v21 = self->_textLayoutController;
      double v22 = [v17 range];
      uint64_t v23 = [(_UITextLayoutController *)v21 characterRangeForTextRange:v22];
      uint64_t v25 = v24;

      double v15 = [v17 attachment];
      char v26 = objc_msgSend(v7, "textView:shouldInteractWithTextAttachment:inRange:interaction:", self, v15, v23, v25, v8);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_19:

        goto LABEL_20;
      }
      double v32 = self->_textLayoutController;
      CGFloat v33 = [v17 range];
      uint64_t v34 = [(_UITextLayoutController *)v32 characterRangeForTextRange:v33];
      uint64_t v36 = v35;

      double v15 = [v17 attachment];
      char v26 = objc_msgSend(v7, "textView:shouldInteractWithTextAttachment:inRange:", self, v15, v34, v36);
    }
    char v19 = v26 & (v20 | v19);
LABEL_18:

    goto LABEL_19;
  }
LABEL_11:
  char v19 = 1;
LABEL_20:

  return v19;
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  char v3 = -[UITextView _textInteractableItemAtPoint:precision:](self, "_textInteractableItemAtPoint:precision:", 0, a3.x, a3.y);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)startInteractionWithLinkAtPoint:(CGPoint)a3
{
  -[UITextView _textInteractableItemAtPoint:precision:](self, "_textInteractableItemAtPoint:precision:", 0, a3.x, a3.y);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 invokeDefaultAction];
}

- (_UITextInteractableItemCache)_textInteractableItemCache
{
  textInteractableItemCache = self->_textInteractableItemCache;
  if (!textInteractableItemCache)
  {
    BOOL v4 = (_UITextInteractableItemCache *)objc_opt_new();
    id v5 = self->_textInteractableItemCache;
    self->_textInteractableItemCache = v4;

    textInteractableItemCache = self->_textInteractableItemCache;
  }
  return textInteractableItemCache;
}

- (id)_anyTextItemConstrainedToLineAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = -[_UITextLayoutController nearestPositionAtPoint:inContainer:](self->_textLayoutController, "nearestPositionAtPoint:inContainer:", self->_textContainer);
  textLayoutController = self->_textLayoutController;
  BOOL v8 = [(_UITextLayoutController *)textLayoutController beginningOfDocument];
  uint64_t v9 = [(_UITextLayoutController *)textLayoutController offsetFromPosition:v8 toPosition:v6];

  BOOL v10 = [(_UITextLayoutController *)self->_textLayoutController textRangeForLineEnclosingPosition:v6];
  uint64_t v11 = [(_UITextLayoutController *)self->_textLayoutController characterRangeForTextRange:v10];
  uint64_t v13 = v12;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__214;
  char v26 = __Block_byref_object_dispose__214;
  id v27 = 0;
  textStorage = self->_textStorage;
  uint64_t v15 = *(void *)off_1E52D2110;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__UITextView__anyTextItemConstrainedToLineAtPoint___block_invoke;
  v21[3] = &unk_1E530BF00;
  v21[5] = &v22;
  v21[6] = v9;
  v21[4] = self;
  *(CGFloat *)&v21[7] = x;
  *(CGFloat *)&v21[8] = y;
  -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v15, v11, v12, 0, v21);
  char v16 = (void *)v23[5];
  if (!v16)
  {
    id v17 = self->_textStorage;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__UITextView__anyTextItemConstrainedToLineAtPoint___block_invoke_2;
    v20[3] = &unk_1E530BF00;
    v20[4] = self;
    v20[5] = &v22;
    v20[6] = v9;
    *(CGFloat *)&v20[7] = x;
    *(CGFloat *)&v20[8] = y;
    [(NSTextStorage *)v17 enumerateAttribute:@"UITextItemTagAttribute", v11, v13, 0, v20 inRange options usingBlock];
    char v16 = (void *)v23[5];
  }
  id v18 = v16;
  _Block_object_dispose(&v22, 8);

  return v18;
}

void __51__UITextView__anyTextItemConstrainedToLineAtPoint___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  unint64_t v10 = *(void *)(a1 + 48);
  BOOL v12 = v10 >= a3;
  unint64_t v11 = v10 - a3;
  BOOL v12 = !v12 || v11 >= a4;
  if (!v12)
  {
    id v19 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v19;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_11:
        *a5 = 1;
        id v9 = v19;
        goto LABEL_12;
      }
      id v13 = [MEMORY[0x1E4F1CB10] URLWithString:v19 encodingInvalidCharacters:0];
    }
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2680), "textRangeForCharacterRange:", a3, a4);
      uint64_t v16 = +[_UITextInteractableItem itemForLink:range:textItemInteractingView:location:](_UITextInteractableItem, "itemForLink:range:textItemInteractingView:location:", v14, v15, *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    goto LABEL_11;
  }
LABEL_12:
}

void __51__UITextView__anyTextItemConstrainedToLineAtPoint___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, unsigned char *a5)
{
  id v16 = a2;
  unint64_t v9 = *(void *)(a1 + 48);
  BOOL v11 = v9 >= a3;
  unint64_t v10 = v9 - a3;
  BOOL v11 = !v11 || v10 >= a4;
  if (!v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2680), "textRangeForCharacterRange:", a3, a4);
      uint64_t v13 = +[_UITextInteractableItem customItemWithTag:range:textItemInteractingView:location:](_UITextInteractableItem, "customItemWithTag:range:textItemInteractingView:location:", v16, v12, *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a5 = 1;
    }
  }
}

- (id)_textInteractableItemAtPoint:(CGPoint)a3 precision:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4 == 2) {
    double v7 = 1.0;
  }
  else {
    double v7 = 5.0;
  }
  [(NSTextContainer *)self->_textContainer textContainerOrigin];
  v47.size.CGFloat width = 0.0;
  v47.size.CGFloat height = 0.0;
  v47.origin.double x = x - v10;
  CGFloat v8 = v47.origin.x;
  v47.origin.double y = y - v11;
  CGFloat v9 = v47.origin.y;
  CGRect v48 = CGRectInset(v47, -v7, -v7);
  uint64_t v25 = -[_UITextLayoutController textRangeForBounds:inTextContainer:layoutIfNeeded:](self->_textLayoutController, "textRangeForBounds:inTextContainer:layoutIfNeeded:", self->_textContainer, 1, v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
  uint64_t v12 = -[_UITextLayoutController characterRangeForTextRange:](self->_textLayoutController, "characterRangeForTextRange:");
  uint64_t v14 = v13;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  *(double *)&v45[3] = v7 * 1.41421356;
  uint64_t v39 = 0;
  double v40 = &v39;
  uint64_t v41 = 0x3010000000;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  CGFloat v42 = &unk_186D7DBA7;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__214;
  CGFloat v37 = __Block_byref_object_dispose__214;
  id v38 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UITextView__textInteractableItemAtPoint_precision___block_invoke;
  aBlock[3] = &unk_1E530BF50;
  CGFloat v31 = v8;
  CGFloat v32 = v9;
  double v28 = v45;
  uint64_t v29 = &v33;
  aBlock[4] = self;
  id v27 = 0;
  uint64_t v30 = &v39;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = (__CFString *)*(id *)off_1E52D2110;
  -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](self->_textStorage, "enumerateAttribute:inRange:options:usingBlock:", v16, v12, v14, 0, v15);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
  }
  ExtendAttributedRangeForAttribute(self->_textStorage, v40[4], v40[5], v16, (NSUInteger *)v40 + 4);
  uint64_t v17 = -[_UITextLayoutController textRangeForCharacterRange:](self->_textLayoutController, "textRangeForCharacterRange:", v40[4], v40[5]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [MEMORY[0x1E4F1CB10] URLWithString:v34[5] encodingInvalidCharacters:0];
    id v19 = (void *)v34[5];
    v34[5] = v18;
  }
  char v20 = +[_UITextInteractableItem itemForLink:range:textItemInteractingView:location:](_UITextInteractableItem, "itemForLink:range:textItemInteractingView:location:", v34[5], v17, self, x, y);

  if (!v20)
  {
LABEL_9:
    double v21 = (__CFString *)*(id *)off_1E52D1F50;

    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](self->_textStorage, "enumerateAttribute:inRange:options:usingBlock:", v21, v12, v14, 0, v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(UITextView *)self _interactionPossibleWithAttachment:v34[5]]
      && (-[_UITextLayoutController textRangeForCharacterRange:](self->_textLayoutController, "textRangeForCharacterRange:", v40[4], v40[5]), uint64_t v22 = objc_claimAutoreleasedReturnValue(), +[_UITextInteractableItem itemForAttachment:range:textItemInteractingView:location:](_UITextInteractableItem, "itemForAttachment:range:textItemInteractingView:location:", v34[5], v22, self, x, y), v20 = objc_claimAutoreleasedReturnValue(), v22, v20))
    {
      id v16 = v21;
    }
    else
    {
      id v16 = @"UITextItemTagAttribute";

      -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](self->_textStorage, "enumerateAttribute:inRange:options:usingBlock:", v16, v12, v14, 0, v15);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = -[_UITextLayoutController textRangeForCharacterRange:](self->_textLayoutController, "textRangeForCharacterRange:", v40[4], v40[5]);
        char v20 = +[_UITextInteractableItem customItemWithTag:range:textItemInteractingView:location:](_UITextInteractableItem, "customItemWithTag:range:textItemInteractingView:location:", v34[5], v23, self, x, y);
      }
      else
      {
        char v20 = 0;
      }
    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v45, 8);

  return v20;
}

void __53__UITextView__textInteractableItemAtPoint_precision___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    CGFloat v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2680), "textRangeForCharacterRange:", a3, a4);
    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = *(void **)(v9 + 2680);
    uint64_t v11 = *(void *)(v9 + 2080);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__UITextView__textInteractableItemAtPoint_precision___block_invoke_2;
    v17[3] = &unk_1E530BF28;
    long long v23 = *(_OWORD *)(a1 + 72);
    long long v21 = *(_OWORD *)(a1 + 48);
    id v12 = v7;
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(a1 + 40);
    id v18 = v12;
    uint64_t v19 = v13;
    id v15 = v14;
    uint64_t v24 = a3;
    uint64_t v25 = a4;
    uint64_t v16 = *(void *)(a1 + 64);
    id v20 = v15;
    uint64_t v22 = v16;
    [v10 enumerateTextSegmentsInRange:v8 inTextContainer:v11 usingBlock:v17];
  }
}

id __53__UITextView__textInteractableItemAtPoint_precision___block_invoke_2(uint64_t a1, unsigned char *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id result = (id)UIDistanceBetweenPointAndRect(*(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), a3, a4, a5, a6);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v9 < *(double *)(v10 + 24))
  {
    *(double *)(v10 + 24) = v9;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    id result = (id)[*(id *)(*(void *)(a1 + 40) + 2072) attribute:*(void *)(a1 + 48) atIndex:*(void *)(a1 + 96) effectiveRange:*(void *)(*(void *)(a1 + 72) + 8) + 32];
    if (*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0.0) {
      *a2 = 1;
    }
  }
  return result;
}

- (id)_textItemForItem:(id)a3
{
  textLayoutController = self->_textLayoutController;
  id v4 = a3;
  id v5 = [v4 range];
  uint64_t v6 = [(_UITextLayoutController *)textLayoutController characterRangeForTextRange:v5];
  uint64_t v8 = v7;

  double v9 = objc_msgSend(v4, "itemRepresentationWithRange:", v6, v8);

  return v9;
}

- (id)_textInteractableItemForTag:(id)a3
{
  id v4 = a3;
  uint64_t v34 = 0;
  uint64_t v35 = (double *)&v34;
  uint64_t v36 = 0x4010000000;
  CGFloat v37 = &unk_186D7DBA7;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v38 = *MEMORY[0x1E4F1DB28];
  long long v39 = v5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3010000000;
  CGFloat v32 = &unk_186D7DBA7;
  int64x2_t v33 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy__214;
  id v27 = __Block_byref_object_dispose__214;
  id v28 = 0;
  uint64_t v6 = [(NSTextStorage *)self->_textStorage length];
  textStorage = self->_textStorage;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__UITextView__textInteractableItemForTag___block_invoke;
  v17[3] = &unk_1E530BFA0;
  id v8 = v4;
  id v18 = v8;
  uint64_t v19 = self;
  id v20 = &v23;
  long long v21 = &v34;
  uint64_t v22 = &v29;
  [(NSTextStorage *)textStorage enumerateAttribute:@"UITextItemTagAttribute", 0, v6, 0, v17 inRange options usingBlock];
  if (v30[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = 0;
  }
  else
  {
    double v10 = v35[4];
    double v11 = v35[5];
    double v12 = v35[6];
    double v13 = v35[7];
    [(NSTextContainer *)self->_textContainer textContainerOrigin];
    double v9 = +[_UITextInteractableItem customItemWithTag:range:textItemInteractingView:location:](_UITextInteractableItem, "customItemWithTag:range:textItemInteractingView:location:", v8, v24[5], self, v10 + v12 * 0.5 + v14, v11 + v13 * 0.5 + v15);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v34, 8);

  return v9;
}

void __42__UITextView__textInteractableItemForTag___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 isEqualToString:a1[4]])
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1[5] + 2680), "textRangeForCharacterRange:", a3, a4);
    uint64_t v11 = *(void *)(a1[6] + 8);
    double v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = a1[5];
    double v14 = *(void **)(v13 + 2680);
    uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v16 = *(void *)(v13 + 2080);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__UITextView__textInteractableItemForTag___block_invoke_2;
    v18[3] = &unk_1E530BF78;
    v18[4] = a1[7];
    [v14 enumerateTextSegmentsInRange:v15 inTextContainer:v16 usingBlock:v18];
    uint64_t v17 = *(void *)(a1[8] + 8);
    *(void *)(v17 + 32) = a3;
    *(void *)(v17 + 40) = a4;
    *a5 = 1;
  }
}

uint64_t __42__UITextView__textInteractableItemForTag___block_invoke_2(uint64_t result, double a2, double a3, double a4, double a5)
{
  long long v5 = *(double **)(*(void *)(result + 32) + 8);
  v5[4] = a2;
  void v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return result;
}

- (id)_primaryActionForTextInteractableItem:(id)a3 defaultAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIScrollView *)self delegate];
  id v9 = v7;
  uint64_t v10 = v9;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [(UITextView *)self _textItemForItem:v6];
    uint64_t v10 = [v8 textView:self primaryActionForTextItem:v11 defaultAction:v9];
  }
  return v10;
}

- (id)_menuConfigurationForTextInteractableItem:(id)a3 defaultMenu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIScrollView *)self delegate];
  id v9 = +[UITextItemMenuConfiguration configurationWithMenu:v7];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [(UITextView *)self _textItemForItem:v6];
    uint64_t v11 = [v8 textView:self menuConfigurationForTextItem:v10 defaultMenu:v7];

    id v9 = (void *)v11;
  }

  return v9;
}

- (void)_textInteractableItem:(id)a3 willDisplayMenuWithAnimator:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(UIScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(UITextView *)self _textItemForItem:v9];
    [v7 textView:self textItemMenuWillDisplayForTextItem:v8 animator:v6];
  }
}

- (void)_textInteractableItem:(id)a3 willDismissMenuWithAnimator:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(UIScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(UITextView *)self _textItemForItem:v9];
    [v7 textView:self textItemMenuWillEndForTextItem:v8 animator:v6];
  }
}

- (BOOL)_interactionPossibleWithAttachment:(id)a3
{
  if ([off_1E52D2EB0 _attachmentHasImage:a3])
  {
    char v4 = 1;
  }
  else
  {
    long long v5 = [(UIScrollView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v4 = 1;
    }
    else {
      char v4 = objc_opt_respondsToSelector();
    }
  }
  return v4 & 1;
}

- (BOOL)_allowHighlightForTextInteractableItem:(id)a3
{
  id v4 = a3;
  long long v5 = [(UIScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    textLayoutController = self->_textLayoutController;
    id v7 = [v4 range];
    uint64_t v8 = [(_UITextLayoutController *)textLayoutController characterRangeForTextRange:v7];
    uint64_t v10 = v9;

    char v11 = objc_msgSend(v5, "_textView:shouldHighlightForInteractionInRange:", self, v8, v10);
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)_clearHighlightView
{
}

- (void)find:(id)a3
{
}

- (void)findAndReplace:(id)a3
{
}

- (void)findNext:(id)a3
{
}

- (void)findPrevious:(id)a3
{
}

- (void)useSelectionForFind:(id)a3
{
}

- (void)_findSelected:(id)a3
{
  id v4 = a3;
  [(UITextView *)self useSelectionForFind:v4];
  [(UITextView *)self find:v4];
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  id v4 = [[UITextSearchingFindSession alloc] initWithSearchableObject:self];
  return v4;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  [(UITextView *)self didBeginTextSearchOperation];
  searchableObject = self->_searchableObject;
  [(_UITextViewSearchableObject *)searchableObject didBeginFindSession];
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  [(UITextView *)self didEndTextSearchOperation];
  searchableObject = self->_searchableObject;
  [(_UITextViewSearchableObject *)searchableObject didEndFindSession];
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  return [(_UITextViewSearchableObject *)self->_searchableObject compareFoundRange:a3 toRange:a4 inDocument:a5];
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
}

- (void)clearAllDecoratedFoundText
{
}

- (BOOL)supportsTextReplacement
{
  return [(_UITextViewSearchableObject *)self->_searchableObject supportsTextReplacement];
}

- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  return [(_UITextViewSearchableObject *)self->_searchableObject shouldReplaceFoundTextInRange:a3 inDocument:a4 withText:a5];
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
}

- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5
{
}

- (void)willHighlightFoundTextRange:(id)a3 inDocument:(id)a4
{
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
}

- (id)_targetedPreviewForHighlightRange:(id)a3
{
  return [(_UITextViewSearchableObject *)self->_searchableObject targetedPreviewForHighlightRange:a3];
}

- (id)_textLineRectsForRange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(UITextView *)self selectionRectsForRange:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v11 rect];
        double v14 = fabs(v13);
        if (fabs(v12) >= 2.22044605e-16 && v14 >= 2.22044605e-16)
        {
          uint64_t v16 = (void *)MEMORY[0x1E4F29238];
          [v11 rect];
          uint64_t v17 = objc_msgSend(v16, "valueWithCGRect:");
          [v5 addObject:v17];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_targetedPreviewForRange:(id)a3 withRenderingAttributes:(id)a4
{
  return [(UITextView *)self _targetedPreviewForRange:a3 withRenderingAttributes:a4 includeFullDocument:0];
}

- (id)_targetedPreviewForRange:(id)a3 withRenderingAttributes:(id)a4 includeFullDocument:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        uint64_t v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &_targetedPreviewForRange_withRenderingAttributes_includeFullDocument____s_category)+ 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Creating targeted preview for range: %@, renderingAttributes: %@", buf, 0x16u);
        }
      }
    }
  }
  uint64_t v10 = [(UITextView *)self _previewRendererForRange:v8 unifyRects:1];
  [v10 addRenderingAttributes:v9];
  [v10 setExcludeBackground:1];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  CGFloat v42 = __Block_byref_object_copy__214;
  uint64_t v43 = __Block_byref_object_dispose__214;
  id v44 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy__214;
  long long v39 = __Block_byref_object_dispose__214;
  id v40 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__UITextView__targetedPreviewForRange_withRenderingAttributes_includeFullDocument___block_invoke;
  aBlock[3] = &unk_1E530BFC8;
  aBlock[4] = self;
  id v11 = v8;
  id v31 = v11;
  int64x2_t v33 = buf;
  id v12 = v10;
  id v32 = v12;
  uint64_t v34 = &v35;
  double v13 = _Block_copy(aBlock);
  double v14 = v13;
  if (v5)
  {
    uint64_t v15 = [(UITextView *)self textContainer];
    [v15 size];
    double v17 = v16;

    [(UITextView *)self _setFreezeTextContainerSize:1];
    if (-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager"))-[UITextView _performTextKit1LayoutCalculation:inSize:](self, "_performTextKit1LayoutCalculation:inSize:", v14, v17, 3.40282347e38); {
    else
    }
      -[UITextView _performTextKit2LayoutCalculation:inSize:](self, "_performTextKit2LayoutCalculation:inSize:", v14, v17, 3.40282347e38);
    [(UITextView *)self _setFreezeTextContainerSize:0];
  }
  else
  {
    (*((void (**)(void *, void, void))v13 + 2))(v13, 0, 0);
  }
  id v18 = [v9 allKeys];
  [v12 removeRenderingAttributes:v18];

  long long v19 = +[UITextHighlightView preferredPreviewParametersForTextLineRects:v36[5]];
  long long v20 = [UIPreviewTarget alloc];
  [(UIView *)self frame];
  uint64_t v25 = -[UIPreviewTarget initWithContainer:center:](v20, "initWithContainer:center:", self, v22 + v21 * 0.5, v24 + v23 * 0.5);
  char v26 = [UITargetedPreview alloc];
  id v27 = [(UITargetedPreview *)v26 initWithView:*(void *)(*(void *)&buf[8] + 40) parameters:v19 target:v25];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  return v27;
}

void __83__UITextView__targetedPreviewForRange_withRenderingAttributes_includeFullDocument___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 2680) ensureLayoutForRange:*(void *)(a1 + 40)];
  double v2 = [UIImageView alloc];
  id v3 = [*(id *)(a1 + 48) image];
  uint64_t v4 = [(UIImageView *)v2 initWithImage:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setContentMode:5];
  [*(id *)(a1 + 32) _boundingRectForRange:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setFrame:");
  uint64_t v7 = [*(id *)(a1 + 32) _textLineRectsForRange:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (BOOL)_delegateSuppliesWritingToolsIgnoredRanges
{
  return (*((unsigned __int8 *)&self->_tvFlags + 3) >> 6) & 1;
}

- (void)_setUniqueWritingToolsAnimatedLayoutInfo:(id)a3
{
}

- (_UIAnimatedTextLayoutInfo)_uniqueWritingToolsAnimatedLayoutInfo
{
  return [(_UITextContainerView *)self->_containerView uniqueWritingToolsAnimatedLayoutInfo];
}

- (BOOL)_textStorageOverridesReplaceCharactersInRangeWithAttributedString
{
  return (*((unsigned __int8 *)&self->_tvFlags + 4) >> 1) & 1;
}

- (void)setWritingToolsBehavior:(int64_t)a3
{
  id v4 = [(UITextView *)self writingToolsCoordinator];
  [v4 setPreferredBehavior:a3];
}

- (int64_t)writingToolsBehavior
{
  double v2 = [(UITextView *)self writingToolsCoordinator];
  int64_t v3 = [v2 preferredBehavior];

  return v3;
}

- (unint64_t)_defaultWritingToolsResultOptions
{
  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  return [(UIResponder *)&v3 _defaultWritingToolsResultOptions] & 0xFFFFFFFFFFFFFFF7;
}

- (uint64_t)_raiseIfNecessaryForWritingToolsResultOptions:(uint64_t)result
{
  if (result)
  {
    if ((a2 & 8) != 0)
    {
      double v2 = (void *)result;
      if (!_UIIsPrivateMainBundle()
        || (id result = [v2 isMemberOfClass:objc_opt_class()], result))
      {
        if _UIIsPrivateMainBundle() && (os_variant_has_internal_diagnostics()) {
          objc_super v3 = @"UITextView does not yet support UIWritingToolsResultTable. Troublesome SPI can make it possible for apps allowed to use SPI.";
        }
        else {
          objc_super v3 = @"UITextView does not yet support UIWritingToolsResultTable";
        }
        id v4 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v5 = *MEMORY[0x1E4F1C3C8];
        return [v4 raise:v5 format:v3];
      }
    }
  }
  return result;
}

- (unint64_t)allowedWritingToolsResultOptions
{
  objc_super v3 = [(UITextView *)self writingToolsCoordinator];
  uint64_t v4 = [v3 resultOptions];

  -[UITextView _raiseIfNecessaryForWritingToolsResultOptions:]((uint64_t)self, v4);
  return v4;
}

- (BOOL)isWritingToolsActive
{
  double v2 = [(UITextView *)self _existingWritingToolsCoordinator];
  uint64_t v3 = [v2 state];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)writingToolsCoordinator:(id)a3 requestsContextsForScope:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if ([v9 state] == 2)
  {
    $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags = self->_tvFlags;
    if ((*(_DWORD *)&tvFlags & 0x10000000) != 0)
    {
      id v11 = [(UIScrollView *)self delegate];
      [v11 textViewWritingToolsWillBegin:self];
    }
    else
    {
      if ((*(_DWORD *)&tvFlags & 0x4000000) == 0) {
        goto LABEL_7;
      }
      id v11 = [(UIScrollView *)self delegate];
      [v11 _textViewWillBeginTextAssistantSession:self];
    }
  }
LABEL_7:
  id v12 = [(UITextView *)self _textAssistantManager];
  [v12 writingToolsCoordinator:v9 requestsContextsForScope:a4 completion:v8];
}

- (void)writingToolsCoordinator:(id)a3 replaceRange:(_NSRange)a4 inContext:(id)a5 proposedText:(id)a6 reason:(int64_t)a7 animationParameters:(id)a8 completion:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v21, "writingToolsCoordinator:replaceRange:inContext:proposedText:reason:animationParameters:completion:", v20, location, length, v19, v18, a7, v17, v16);
}

- (void)writingToolsCoordinator:(id)a3 selectRanges:(id)a4 inContext:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(UITextView *)self _textAssistantManager];
  [v14 writingToolsCoordinator:v13 selectRanges:v12 inContext:v11 completion:v10];
}

- (void)writingToolsCoordinator:(id)a3 requestsRangeInContextWithIdentifierForPoint:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v11, "writingToolsCoordinator:requestsRangeInContextWithIdentifierForPoint:completion:", v10, v9, x, y);
}

- (void)writingToolsCoordinator:(id)a3 requestsBoundingBezierPathsForRange:(_NSRange)a4 inContext:(id)a5 completion:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v14, "writingToolsCoordinator:requestsBoundingBezierPathsForRange:inContext:completion:", v13, location, length, v12, v11);
}

- (void)writingToolsCoordinator:(id)a3 requestsUnderlinePathsForRange:(_NSRange)a4 inContext:(id)a5 completion:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v14, "writingToolsCoordinator:requestsUnderlinePathsForRange:inContext:completion:", v13, location, length, v12, v11);
}

- (void)writingToolsCoordinator:(id)a3 prepareForTextAnimation:(int64_t)a4 forRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v16, "writingToolsCoordinator:prepareForTextAnimation:forRange:inContext:completion:", v15, a4, location, length, v14, v13);
}

- (void)writingToolsCoordinator:(id)a3 adjustForUpdatedRange:(_NSRange)a4 forTextAnimation:(int64_t)a5 inContext:(id)a6 completion:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v16, "writingToolsCoordinator:adjustForUpdatedRange:forTextAnimation:inContext:completion:", v15, location, length, a5, v14, v13);
}

- (void)writingToolsCoordinator:(id)a3 requestsPreviewForTextAnimation:(int64_t)a4 ofRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v16, "writingToolsCoordinator:requestsPreviewForTextAnimation:ofRange:inContext:completion:", v15, a4, location, length, v14, v13);
}

- (void)writingToolsCoordinator:(id)a3 finishTextAnimation:(int64_t)a4 forRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v16, "writingToolsCoordinator:finishTextAnimation:forRange:inContext:completion:", v15, a4, location, length, v14, v13);
}

- (void)writingToolsCoordinator:(id)a3 willChangeToState:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int tvFlags = (int)self->_tvFlags;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UITextView_writingToolsCoordinator_willChangeToState_completion___block_invoke;
  aBlock[3] = &unk_1E530BFF0;
  id v18 = v9;
  int64_t v19 = a4;
  BOOL v20 = (tvFlags & 0x20000000) != 0;
  id v16 = v8;
  id v17 = self;
  BOOL v21 = (tvFlags & 0x8000000) != 0;
  id v11 = v9;
  id v12 = v8;
  id v13 = _Block_copy(aBlock);
  id v14 = [(UITextView *)self _textAssistantManager];
  [v14 writingToolsCoordinator:v12 willChangeToState:a4 completion:v13];
}

void __67__UITextView_writingToolsCoordinator_willChangeToState_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(void *)(a1 + 56)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = (v2 & 0xFFFFFFFFFFFFFFFELL) == 2;
  }
  if (v3)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v4 = [*(id *)(a1 + 40) delegate];
      [v4 textViewWritingToolsDidEnd:*(void *)(a1 + 40)];
    }
    else
    {
      if (!*(unsigned char *)(a1 + 65)) {
        return;
      }
      id v4 = [*(id *)(a1 + 40) delegate];
      [v4 _textViewDidEndTextAssistantSession:*(void *)(a1 + 40)];
    }
  }
}

- (void)_wtc_invalidateGrabberSuppression
{
  id v2 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v2, "_wtc_invalidateGrabberSuppression");
}

- (void)_wtc_invalidateSelectionUIHidden
{
  id v2 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v2, "_wtc_invalidateSelectionUIHidden");
}

- (void)_wtc_underlineTextInCharacterRange:(_NSRange)a3 proofreadingSuggestionID:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v8, "_wtc_underlineTextInCharacterRange:proofreadingSuggestionID:", location, length, v7);
}

- (void)_wtc_removeUnderlineForProofreadingSuggestionID:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v5, "_wtc_removeUnderlineForProofreadingSuggestionID:", v4);
}

- (void)_wtc_highlightProofreadingReviewingRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(UITextView *)self _textAssistantManager];
  objc_msgSend(v5, "_wtc_highlightProofreadingReviewingRange:", location, length);
}

- (BOOL)_performExternalEditsForWritingToolsSessionIdentifier:(id)a3 action:(int64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(UITextView *)self isWritingToolsActive])
  {
    id v10 = [(UITextView *)self _existingTextAssistantManager];
    char v11 = [v10 performExternalEditsForWritingToolsSessionIdentifier:v8 action:a4 usingBlock:v9];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)worksWithAnimatedTextSpacer
{
  return 1;
}

- (_UITextAssistantManager)_textAssistantManager
{
  textAssistantManager = self->_textAssistantManager;
  if (!textAssistantManager)
  {
    id v4 = [[_UITextAssistantManager alloc] initWithTextView:self];
    id v5 = self->_textAssistantManager;
    self->_textAssistantManager = v4;

    textAssistantManager = self->_textAssistantManager;
  }
  return textAssistantManager;
}

- (id)_existingTextAssistantManager
{
  return self->_textAssistantManager;
}

- (id)_writingToolsCoordinator
{
  if ([(UIView *)self _canHaveWritingToolsCoordinator])
  {
    BOOL v3 = [(UITextView *)self _existingWritingToolsCoordinator];
    if (!v3)
    {
      BOOL v3 = [[UIWritingToolsCoordinator alloc] initWithDelegate:self];
      id v4 = [(UITextView *)self _textInputTraits];
      uint64_t v5 = [v4 allowedWritingToolsResultOptions];
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 2;
      }
      [(UIWritingToolsCoordinator *)v3 setPreferredResultOptions:v6];
      id v7 = [(UITextView *)self textLayoutManager];

      if (!v7) {
        [(UIWritingToolsCoordinator *)v3 setPreferredBehavior:2];
      }
      id v8 = [(UITextView *)self selectionContainerView];
      [(UIWritingToolsCoordinator *)v3 setDecorationContainerView:v8];

      [(UIView *)self addInteraction:v3];
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)_existingWritingToolsCoordinator
{
  v4.receiver = self;
  v4.super_class = (Class)UITextView;
  id v2 = [(UIView *)&v4 _writingToolsCoordinator];
  return v2;
}

- (UIDragInteraction)textDragInteraction
{
  if (self->_textDragDropSupport)
  {
    BOOL v3 = [(UIView *)self interactions];
    objc_super v4 = [(UITextDragDropSupport *)self->_textDragDropSupport dragInteraction];
    if ([v3 indexOfObject:v4] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [(UITextDragDropSupport *)self->_textDragDropSupport dragInteraction];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (UIDragInteraction *)v5;
}

- (UIDropInteraction)textDropInteraction
{
  if (self->_textDragDropSupport)
  {
    BOOL v3 = [(UIView *)self interactions];
    objc_super v4 = [(UITextDragDropSupport *)self->_textDragDropSupport dropInteraction];
    if ([v3 indexOfObject:v4] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [(UITextDragDropSupport *)self->_textDragDropSupport dropInteraction];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (UIDropInteraction *)v5;
}

- (void)invalidateDropCaret
{
}

- (void)draggingFinished:(id)a3
{
  id v4 = a3;
  [(UITextView *)self _updateSelectionGestures];
  char v5 = [v4 dragTearoffOccured];

  if ((v5 & 1) == 0)
  {
    [(UITextView *)self selectedRange];
    if (v6)
    {
      id v7 = [(UITextView *)self interactionAssistant];
      [v7 showSelectionCommands];
    }
  }
}

- (BOOL)canBecomeDropResponder
{
  return 1;
}

- (BOOL)allowsDraggingAttachments
{
  return 1;
}

- (void)droppingStarted
{
  if (![(UIView *)self isFirstResponder])
  {
    [(UITextView *)self _notifyDidBeginEditing];
  }
}

- (void)droppingFinished
{
  if (![(UIView *)self isFirstResponder])
  {
    [(UITextView *)self _startDataDetectorsIfNeeded];
    [(UITextView *)self _notifyDidEndEditing];
  }
}

- (UITextPasteDelegate)pasteDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pasteDelegate);
  return (UITextPasteDelegate *)WeakRetained;
}

- (double)_multilineContextWidth
{
  return self->_multilineContextWidth;
}

- (void)_setMultilineContextWidth:(double)a3
{
  self->_multilineContextWidth = a3;
}

- (BOOL)allowsTextAnimations
{
  return self->_allowsTextAnimations;
}

- (void)set_textInteractableItemCache:(id)a3
{
}

- (BOOL)isFindInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (void)setSearchableObject:(id)a3
{
}

- (void)setTextDragOptions:(int64_t)a3
{
  self->_textDragOptions = a3;
}

- (UITextDragDelegate)textDragDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textDragDelegate);
  return (UITextDragDelegate *)WeakRetained;
}

- (UITextDropDelegate)textDropDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textDropDelegate);
  return (UITextDropDelegate *)WeakRetained;
}

- (UIView)inputView
{
  return (UIView *)objc_getProperty(self, a2, 2256, 1);
}

- (UITextViewBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(UITextViewBorderStyle)borderStyle
{
  self->_borderStyle = borderStyle;
}

- (BOOL)_isTextLayoutManagerEnabled
{
  return self->_textLayoutManagerEnabled;
}

- (_UITextViewVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
}

- (BOOL)_drawsDebugBaselines
{
  return [(_UITextLayoutController *)self->_textLayoutController drawsDebugBaselines];
}

- (void)encodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(UITextView *)self isEditable];
  uint64_t v8 = [(UITextView *)self selectedRange];
  uint64_t v10 = v9;
  BOOL v11 = v9 != 0;
  if (v7)
  {
    BOOL v12 = [(UIView *)self isFirstResponder];
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v12;
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)UITextView;
  [(UIScrollView *)&v18 encodeRestorableStateWithCoder:v6];
  if (v11)
  {
    [v6 encodeInt:v10 forKey:@"kTextSelectedTextLengthKey"];
    [v6 encodeInt:v8 forKey:@"kTextSelectedTextLocationKey"];
    if (v4)
    {
      id v13 = [(UITextView *)self selectedText];
      if ([v13 length]) {
        [v6 encodeObject:v13 forKey:@"kTextSelectedTextKey"];
      }
      if ([(UITextView *)self _isDisplayingShortcutViewController]) {
        [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
      }
      if ([(UITextView *)self _isDisplayingReferenceLibraryViewController])
      {
        id v14 = +[UIDevice currentDevice];
        uint64_t v15 = [v14 userInterfaceIdiom];

        if (!v15) {
          [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
        }
        [v6 encodeBool:1 forKey:@"kTextDisplayingReferenceLibraryViewControllerKey"];
      }
      if ([(UITextView *)self _isDisplayingShareViewController]) {
        [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
      }
    }
  }
  id v16 = [(UITextView *)self _restorableScrollPositionForStateRestoration];
  id v17 = [v16 dictionaryRepresentation];

  if (v17) {
    [v6 encodeObject:v17 forKey:@"kTextVisiblePosition"];
  }
  [v6 encodeBool:v7 forKey:@"kTextEditableKey"];
  objc_msgSend(v6, "encodeBool:forKey:", -[UIView isFirstResponder](self, "isFirstResponder"), @"kTextFirstResponderKey");
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
}

- (void)decodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 containsValueForKey:@"kTextEditableKey"]) {
    -[UITextView setEditable:](self, "setEditable:", [v6 decodeBoolForKey:@"kTextEditableKey"]);
  }
  if ([v6 containsValueForKey:@"kTextFirstResponderKey"]
    && [v6 decodeBoolForKey:@"kTextFirstResponderKey"])
  {
    [(UITextView *)self becomeFirstResponder];
  }
  if ([v6 containsValueForKey:@"kTextSelectedTextLengthKey"])
  {
    if ([v6 containsValueForKey:@"kTextSelectedTextLocationKey"])
    {
      int v7 = [v6 decodeIntForKey:@"kTextSelectedTextLengthKey"];
      int v8 = [v6 decodeIntForKey:@"kTextSelectedTextLocationKey"];
      if ([(UITextView *)self isEditable] || v7)
      {
        if ([(UIScrollView *)self isProgrammaticScrollEnabled])
        {
          [(UIScrollView *)self setProgrammaticScrollEnabled:0];
          [(UITextView *)self becomeFirstResponder];
          -[UITextView setSelectedRange:](self, "setSelectedRange:", v8, v7);
          [(UIScrollView *)self setProgrammaticScrollEnabled:1];
          if (!v4) {
            goto LABEL_21;
          }
        }
        else
        {
          [(UITextView *)self becomeFirstResponder];
          -[UITextView setSelectedRange:](self, "setSelectedRange:", v8, v7);
          if (!v4) {
            goto LABEL_21;
          }
        }
        uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"kTextSelectedTextKey"];
        if (v9)
        {
          char v10 = [v6 decodeBoolForKey:@"kTextDisplayingShortcutViewControllerKey"];
          int v11 = [v6 decodeBoolForKey:@"kTextDisplayingReferenceLibraryViewControllerKey"];
          [v6 decodeBoolForKey:@"kTextDisplayingShareViewControllerKey"];
          if ((v10 & 1) == 0)
          {
            if (v11)
            {
              BOOL v12 = +[UIDevice currentDevice];
              uint64_t v13 = [v12 userInterfaceIdiom];

              if (v13)
              {
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __112__UITextView_StateRestoration__decodeRestorableStateWithCoder_includingSelectedTextAndDisplayedViewControllers___block_invoke;
                block[3] = &unk_1E52D9F98;
                id v23 = v9;
                double v24 = self;
                dispatch_async(MEMORY[0x1E4F14428], block);
              }
              else
              {
                id v14 = [(UITextView *)self selectedText];
                [v9 isEqualToString:v14];
              }
            }
          }
        }
      }
    }
  }
LABEL_21:
  v21.receiver = self;
  v21.super_class = (Class)UITextView;
  [(UIScrollView *)&v21 decodeRestorableStateWithCoder:v6];
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  objc_super v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  int64_t v19 = [v6 decodeObjectOfClasses:v18 forKey:@"kTextVisiblePosition"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v20 = +[_UITextViewRestorableScrollPosition restorableScrollPositionWithDictionary:v19];
    if (v20) {
      [(UITextView *)self _restoreScrollPosition:v20 animated:0];
    }
  }
}

void __112__UITextView_StateRestoration__decodeRestorableStateWithCoder_includingSelectedTextAndDisplayedViewControllers___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) selectedText];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    BOOL v4 = *(void **)(a1 + 40);
    [v4 _define:v4];
  }
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
}

- (id)_interactionState
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(UITextView *)self encodeRestorableStateWithCoder:v3 includingSelectedTextAndDisplayedViewControllers:0];
  BOOL v4 = [v3 encodedData];

  return v4;
}

- (void)_setInteractionState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v10 = 0;
  id v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:&v10];

  id v7 = v10;
  if (v6)
  {
    [(UITextView *)self decodeRestorableStateWithCoder:v6 includingSelectedTextAndDisplayedViewControllers:0];
  }
  else
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Text", &_setInteractionState____s_category_0);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v12 = "-[UITextView(_UIInteractionStateRestorable) _setInteractionState:]";
        __int16 v13 = 2112;
        id v14 = v7;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%s: Error decoding interaction state (%@)", buf, 0x16u);
      }
    }
  }
}

- (id)_nonNullUITextRangeFromNSRange:(_NSRange)a3
{
  BOOL v3 = -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", a3.location, a3.length);
  if (!v3)
  {
    BOOL v3 = +[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", 0, 0);
  }
  return v3;
}

- (id)_internalTextLayoutController
{
  id v2 = [(UITextView *)self textLayoutController];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    id v2 = 0;
  }
  return v2;
}

- (id)_NSTextRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = [(UITextView *)self _internalTextLayoutController];
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    int v11 = [(UITextView *)self textLayoutController];
    [v10 handleFailureInMethod:a2, self, @"UITextView.m", 8553, @"Can't fetch NSTextRange from this textLayoutController: %@", v11 object file lineNumber description];
  }
  int v8 = objc_msgSend(v7, "_rangeForCharacterRange:", location, length);

  return v8;
}

- (_NSRange)_nsRangeForNonNullUITextRange:(id)a3
{
  if (a3)
  {
    NSUInteger v3 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:");
  }
  else
  {
    NSUInteger v3 = 0;
    NSUInteger v4 = 0;
  }
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (int64_t)_indexForNonNullUITextPosition:(id)a3
{
  if (a3) {
    return -[UIResponder _indexForTextPosition:](self, "_indexForTextPosition:");
  }
  else {
    return 0;
  }
}

- (id)_nonNullIntersectionOfUITextRange:(id)a3 withOtherUITextRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UIResponder *)self _intersectionOfRange:v6 andRange:v7];
  if (!v8)
  {
    uint64_t v9 = [v7 start];
    id v10 = [v6 start];
    int v11 = [v7 start];
    int64_t v12 = [(UITextView *)self comparePosition:v10 toPosition:v11];

    if (v12 == -1)
    {
      uint64_t v13 = [v6 start];

      uint64_t v9 = (void *)v13;
    }
    int v8 = [(UITextView *)self textRangeFromPosition:v9 toPosition:v9];
  }
  return v8;
}

- (BOOL)_supportsTextKit2TextLists
{
  if ([(_UITextLayoutController *)self->_textLayoutController includesTextListMarkers])
  {
    char v2 = 0;
  }
  else
  {
    if (qword_1EB25AFD8 != -1) {
      dispatch_once(&qword_1EB25AFD8, &__block_literal_global_2269);
    }
    char v2 = _MergedGlobals_61 ^ 1;
  }
  return v2 & 1;
}

void __51__UITextView_TextLists___supportsTextKit2TextLists__block_invoke()
{
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    _MergedGlobals_61 = 1;
  }
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  if ([v0 isEqualToString:@"com.apple.mobilenotes"]) {
    _MergedGlobals_61 = 1;
  }
}

- (BOOL)_hasFontInfoForVerticalBaselineSpacing
{
  return ![(UIScrollView *)self isScrollEnabled];
}

- (id)_fontInfoForBaselineSpacing
{
  id result = [(UITextView *)self font];
  if (!result)
  {
    return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  }
  return result;
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return (a3 - 11) < 2;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  if ((a3 - 5) > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextView;
    [(UIView *)&v8 _autolayoutSpacingAtEdge:*(void *)&a3 forAttribute:a4 inContainer:a5 isGuide:a6];
  }
  else
  {
    _UIViewBaselineToEdgeSpacing([(UITextView *)self _fontInfoForBaselineSpacing], a3);
    UICeilToViewScale(self);
  }
  return result;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v13 = *(void *)&a3;
  if ((a3 - 5) > 1) {
    goto LABEL_12;
  }
  unsigned int v15 = a4 - 11;
  if (os_variant_has_internal_diagnostics())
  {
    if (v15 < 2) {
      goto LABEL_4;
    }
    uint64_t v17 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
    }
LABEL_12:
    v19.receiver = self;
    v19.super_class = (Class)UITextView;
    [(UIView *)&v19 _autolayoutSpacingAtEdge:v13 forAttribute:a4 nextToNeighbor:a5 edge:v10 attribute:a7 multiplier:a8];
    return result;
  }
  if (v15 >= 2)
  {
    objc_super v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category_1022)+ 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
    }
    goto LABEL_12;
  }
LABEL_4:
  _UIViewBaselineSpacing(self, a5, v13);
  return result;
}

@end