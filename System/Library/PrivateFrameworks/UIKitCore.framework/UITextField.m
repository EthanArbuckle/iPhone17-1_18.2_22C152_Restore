@interface UITextField
+ (BOOL)_isTextLayoutManagerEnabled;
+ (BOOL)_wantsFadedEdges;
+ (Class)_fieldEditorClass;
+ (Class)_textPasteItemClass;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_allowAssistanceInSubtree;
- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3;
- (BOOL)_blurEnabled;
- (BOOL)_canDrawContent;
- (BOOL)_contentCoverUnsecuresText;
- (BOOL)_delegateShouldBeginEditing;
- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5;
- (BOOL)_delegateShouldClear;
- (BOOL)_delegateShouldEndEditing;
- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder;
- (BOOL)_disableTextColorUpdateOnTraitCollectionChange;
- (BOOL)_fieldEditorAttached;
- (BOOL)_finishResignFirstResponder;
- (BOOL)_forceDisplayOverridePlaceholder;
- (BOOL)_forcesClearButtonHighContrastAppearance;
- (BOOL)_handwritingEnabled;
- (BOOL)_hasBaseline;
- (BOOL)_hasContent;
- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3;
- (BOOL)_hasCustomClearButtonImage;
- (BOOL)_hasFloatingFieldEditor;
- (BOOL)_hasFontInfoForVerticalBaselineSpacing;
- (BOOL)_hasSuffixField;
- (BOOL)_heightShouldBeMini;
- (BOOL)_implementsEditMenu;
- (BOOL)_inPopover;
- (BOOL)_inVibrantContentView;
- (BOOL)_isAccessoryViewAnimatable:(id)a3;
- (BOOL)_isDisplayingLookupViewController;
- (BOOL)_isDisplayingReferenceLibraryViewController;
- (BOOL)_isDisplayingShareViewController;
- (BOOL)_isDisplayingShortcutViewController;
- (BOOL)_isDisplayingTextService;
- (BOOL)_isExtremeSizingEnabled;
- (BOOL)_isPasscodeStyle;
- (BOOL)_isShowingPlaceholder;
- (BOOL)_isShowingPrefix;
- (BOOL)_isTextLayoutManagerEnabled;
- (BOOL)_overridePasscodeStyle;
- (BOOL)_ownsInputAccessoryView;
- (BOOL)_partsShouldBeMini;
- (BOOL)_requiresKeyboardResetOnReload;
- (BOOL)_restoreFirstResponder;
- (BOOL)_shouldAnimateTransitionForAccessoryView:(id)a3;
- (BOOL)_shouldCollectAsKeyView;
- (BOOL)_shouldDetermineInterfaceStyleTextColor;
- (BOOL)_shouldDisplayDictationPlaceholderMessage;
- (BOOL)_shouldEndEditing;
- (BOOL)_shouldEndEditingOnReturn;
- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3;
- (BOOL)_shouldIgnoreBaseWritingDirectionChanges;
- (BOOL)_shouldObscureInput;
- (BOOL)_shouldOverrideEditingFont;
- (BOOL)_shouldResignOnEditingDidEndOnExit;
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (BOOL)_shouldShrinkPlaceholderToFitForAccessibility;
- (BOOL)_shouldSuppressSelectionHandles;
- (BOOL)_shouldUnobscureTextWithContentCover;
- (BOOL)_shouldUpdatePlaceholderTextAlignmentWhenOverridden;
- (BOOL)_showsBackgroundCoverView;
- (BOOL)_showsClearButton:(BOOL)a3;
- (BOOL)_showsClearButtonWhenEmpty;
- (BOOL)_showsClearButtonWhenNonEmpty:(BOOL)a3;
- (BOOL)_showsContentCoverView;
- (BOOL)_showsLeftView;
- (BOOL)_showsRightView;
- (BOOL)_supportsImagePasteCached;
- (BOOL)_supportsKeyboardNavigationForSuggestions;
- (BOOL)_textNeedsSanitizing:(id)a3;
- (BOOL)_textShouldFillFieldEditorHeight;
- (BOOL)_textShouldUseVibrancy;
- (BOOL)_tvHasFloatingFieldEditor;
- (BOOL)_tvUseVibrancy;
- (BOOL)_uiktest_shouldDisableTextColorUpdateOnTraitCollectionChange;
- (BOOL)_uiktest_tvUseVibrancy;
- (BOOL)_useGesturesForEditableContent;
- (BOOL)_visualEffectViewEnabled;
- (BOOL)_visualizesDebugRects;
- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowsAttachments;
- (BOOL)allowsDraggingAttachments;
- (BOOL)allowsEditingTextAttributes;
- (BOOL)becomeFirstResponder;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBecomeDropResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)clearsOnBeginEditing;
- (BOOL)clearsOnInsertion;
- (BOOL)clearsPlaceholderOnBeginEditing;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)drawTextInRectIfNeeded:(CGRect)a3;
- (BOOL)fieldEditor:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5;
- (BOOL)fieldEditorShouldExtendCaretHeight:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasMarkedText;
- (BOOL)hasSelection;
- (BOOL)hasText;
- (BOOL)isAccessibilityElementByDefault;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isTextDragActive;
- (BOOL)isTextDropActive;
- (BOOL)isUndoEnabled;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)keyboardInputChanged:(id)a3;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)resignFirstResponder;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)supportsAdaptiveImageGlyph;
- (CGFloat)minimumFontSize;
- (CGPoint)_originForTextFieldLabel:(id)a3;
- (CGPoint)_scrollOffset;
- (CGPoint)constrainedPoint:(CGPoint)a3;
- (CGPoint)contentOffsetForSameViewDrops;
- (CGPoint)drawingScale;
- (CGPoint)textContainerOrigin;
- (CGRect)_availableTextRectExcludingButtonsForBounds:(CGRect)a3;
- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4;
- (CGRect)_backgroundBounds;
- (CGRect)_baselineLeftViewRectForBounds:(CGRect)a3;
- (CGRect)_boundingRectForRange:(id)a3;
- (CGRect)_clipRectForFadedEdges;
- (CGRect)_prefixFrame;
- (CGRect)_responderExternalTouchRectForWindow:(id)a3;
- (CGRect)_responderSelectionRectForWindow:(id)a3;
- (CGRect)_selectionClipRect;
- (CGRect)_suffixFrame;
- (CGRect)_textCanvasViewFrameIncludingContentInsetsFromFontsWhenNotContainedByFieldEditor;
- (CGRect)adjustedCaretRectForCaretRect:(CGRect)a3;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)clearButtonRect;
- (CGRect)clearButtonRectForBounds:(CGRect)bounds;
- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3;
- (CGRect)editRect;
- (CGRect)editingRectForBounds:(CGRect)bounds;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)frameForDictationResultPlaceholder:(id)a3;
- (CGRect)iconRect;
- (CGRect)placeholderRectForBounds:(CGRect)bounds;
- (CGRect)rightViewRectForBounds:(CGRect)bounds;
- (CGRect)textRectForBounds:(CGRect)bounds;
- (CGSize)_clearButtonSize:(CGRect)a3;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)_leftViewOffset;
- (CGSize)_rightViewOffset;
- (CGSize)_textSize;
- (CGSize)_textSizeUsingFullFontSize:(BOOL)a3;
- (CGSize)clearButtonOffset;
- (CGSize)shadowOffset;
- (CUICatalog)_cuiCatalog;
- (CUIStyleEffectConfiguration)_cuiStyleEffectConfiguration;
- (Class)_canvasViewClass;
- (Class)_intelligenceBaseClass;
- (Class)_placeholderLabelClass;
- (Class)_preferredBackgroundProviderClass;
- (NSAttributedString)attributedPlaceholder;
- (NSAttributedString)attributedText;
- (NSCustomTextRendering)customRenderController;
- (NSDictionary)defaultTextAttributes;
- (NSDictionary)linkTextAttributes;
- (NSDictionary)markedTextStyle;
- (NSDictionary)typingAttributes;
- (NSLayoutManager)layoutManager;
- (NSString)description;
- (NSString)placeholder;
- (NSString)searchText;
- (NSString)text;
- (NSTextAlignment)textAlignment;
- (NSTextContainer)textContainer;
- (NSTextStorage)textStorage;
- (UIColor)_tvCustomFocusedTextColor;
- (UIColor)_tvCustomTextColor;
- (UIColor)selectionHighlightColor;
- (UIColor)shadowColor;
- (UIColor)textColor;
- (UIDragInteraction)textDragInteraction;
- (UIDropInteraction)textDropInteraction;
- (UIEdgeInsets)_padding;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)textContainerInset;
- (UIFieldEditor)_fieldEditor;
- (UIFont)font;
- (UIImage)background;
- (UIImage)disabledBackground;
- (UILabel)_placeholderLabel;
- (UIScrollView)enclosingScrollView;
- (UITextBorderStyle)borderStyle;
- (UITextDragDelegate)textDragDelegate;
- (UITextDropDelegate)textDropDelegate;
- (UITextField)initWithCoder:(id)a3;
- (UITextField)initWithFrame:(CGRect)a3;
- (UITextFieldViewMode)clearButtonMode;
- (UITextFieldViewMode)leftViewMode;
- (UITextFieldViewMode)rightViewMode;
- (UITextInputAssistantItem)inputAssistantItem;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextPasteDelegate)pasteDelegate;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (UIView)_backgroundView;
- (UIView)inputAccessoryView;
- (UIView)inputView;
- (UIView)leftView;
- (UIView)recentsAccessoryView;
- (UIView)rightView;
- (UIView)textInputView;
- (_NSRange)_rangeForClearButton;
- (_NSRange)_rangeForSetText;
- (_NSRange)_textRangeForTextStorageRange:(_NSRange)a3;
- (_NSRange)_unobscuredSecureRange;
- (_NSRange)_visibleRangeWithLayout:(BOOL)a3;
- (_NSRange)fieldEditor:(id)a3 willChangeSelectionFromCharacterRange:(_NSRange)a4 toCharacterRange:(_NSRange)a5;
- (_NSRange)insertFilteredText:(id)a3;
- (_NSRange)selectionRange;
- (_UITextFieldVisualStyle)visualStyle;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8;
- (double)_backgroundStrokeWidth;
- (double)_baselineOffsetForLast:(BOOL)a3 autolayoutOnly:(BOOL)a4;
- (double)_baselineOffsetFromBottom;
- (double)_clearButtonMarginX;
- (double)_clearButtonPadX;
- (double)_fieldEditorHeight;
- (double)_firstBaselineOffsetFromTop;
- (double)_foregroundViewsAlpha;
- (double)_fullFontSize;
- (double)_internalFirstBaselineOffsetFromTop;
- (double)_internalLastBaselineOffsetFromBottom;
- (double)_maximumAlphaForLeadingView;
- (double)_passcodeStyleAlpha;
- (double)_preferredBackgroundCornerRadius;
- (double)_roundedRectBackgroundCornerRadius;
- (double)actualMinimumFontSize;
- (double)shadowBlur;
- (float)_marginTop;
- (float)_marginTopForBounds:(CGRect)a3;
- (float)_newFontSize:(float)a3 maxSize:(float)a4;
- (float)paddingBottom;
- (float)paddingLeft;
- (float)paddingRight;
- (float)paddingTop;
- (id)_activityItemsConfigurationAtLocation:(CGPoint)a3;
- (id)_attributedStringForInsertionOfAttributedString:(id)a3;
- (id)_attributedText;
- (id)_backgroundCoverView;
- (id)_backgroundFillColor;
- (id)_backgroundProvider;
- (id)_backgroundStrokeColor;
- (id)_baselineCalculatorSourceCoordinateSpace;
- (id)_clearButtonImageForState:(unint64_t)a3;
- (id)_contentBackdropView;
- (id)_contentCoverView;
- (id)_contentFloatingContainerView;
- (id)_contentSnapshot;
- (id)_copyFont:(id)a3 newSize:(float)a4 maxSize:(float)a5;
- (id)_currentTextColor;
- (id)_defaultFocusEffect;
- (id)_defaultFont;
- (id)_defaultPromptString;
- (id)_dictationInterpretations;
- (id)_editingProcessor;
- (id)_effectivePasteConfiguration;
- (id)_encodableSubviews;
- (id)_fieldEditorHost;
- (id)_fieldEditorHostAllowingCreation:(BOOL)a3;
- (id)_implicitPasteConfigurationClasses;
- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4;
- (id)_inputController;
- (id)_interactionState;
- (id)_metricsProvider;
- (id)_placeholderColor;
- (id)_placeholderView;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)_preferredMetricsProvider;
- (id)_previewRendererForRange:(id)a3 unifyRects:(BOOL)a4;
- (id)_proxyTextInput;
- (id)_rangeForTextKitRanges:(id)a3;
- (id)_systemBackgroundView;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_text;
- (id)_textCanvasView;
- (id)_textContainer;
- (id)_textGeometry;
- (id)_textLayoutController;
- (id)_textStorage;
- (id)_textStorageTextColor;
- (id)_tvTypingAttributes;
- (id)_uiktest_placeholderLabelColor;
- (id)_uiktest_tvCustomTextColor;
- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3;
- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6;
- (id)actualFont;
- (id)attributedTextInRange:(id)a3;
- (id)automaticallySelectedOverlay;
- (id)backgroundColor;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)clearButton;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)createPlaceholderLabelWithFont:(id)a3 andTextAlignment:(int64_t)a4;
- (id)createTextLabelWithTextColor:(id)a3;
- (id)customOverlayContainer;
- (id)defaultClearButtonImageForState:(unint64_t)a3;
- (id)delegate;
- (id)documentFragmentForPasteboardItemAtIndex:(int64_t)a3;
- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)insertDictationResultPlaceholder;
- (id)insertTextPlaceholderWithSize:(CGSize)a3;
- (id)largeContentTitle;
- (id)metadataDictionariesForDictationResults;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)obtainSelectionGrabberSuppressionAssertion;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4;
- (id)selectedAttributedText;
- (id)selectedText;
- (id)selectionContainerView;
- (id)selectionRectsForRange:(id)a3;
- (id)supportedPasteboardTypesForCurrentSelection;
- (id)textInRange:(id)a3;
- (id)textInputTraits;
- (id)textLabel;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)undoManager;
- (id)valueForKey:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (id)webView;
- (id)willGenerateCancelPreview;
- (int)controlSize;
- (int)textSelectionBehavior;
- (int64_t)_backgroundCoverViewMode;
- (int64_t)_blurEffectStyle;
- (int64_t)_blurEffectStyleForAppearance;
- (int64_t)_contentCoverViewMode;
- (int64_t)_currentTextAlignment;
- (int64_t)_keyboardAppearance;
- (int64_t)_lineBreakMode;
- (int64_t)_preferredRenderingModeForPlaceholder;
- (int64_t)_suffixLabelTextAlignment;
- (int64_t)_systemDefaultFocusGroupPriority;
- (int64_t)_userInterfaceStyle;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)clearingBehavior;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)nonEditingLinebreakMode;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)sizingRule;
- (int64_t)textDragOptions;
- (unint64_t)_controlEventsForActionTriggered;
- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete;
- (unint64_t)offsetInMarkedTextForSelection:(id)a3;
- (void)__resumeBecomeFirstResponder;
- (void)_activateSelectionView;
- (void)_addFieldEditorToView;
- (void)_addShortcut:(id)a3;
- (void)_addTextCanvasViewAdjustingFrame:(BOOL)a3;
- (void)_adjustFontForAccessibilityTraits:(BOOL)a3;
- (void)_animateNextHighlightChange;
- (void)_applicableContentOutsetsFromFontsOversize:(int)a3 extremeSizing:;
- (void)_applyHighlightedAnimated:(BOOL)a3;
- (void)_attachFieldEditor;
- (void)_becomeFirstResponder;
- (void)_clearButtonClicked:(id)a3;
- (void)_clearSelectionUI;
- (void)_contentCoverStateDidChange;
- (void)_createInteractionAssistant;
- (void)_define:(id)a3;
- (void)_deleteBackwardAndNotify:(BOOL)a3;
- (void)_detachFieldEditor;
- (void)_detachFieldEditorDiscardingEdits:(BOOL)a3 animated:(BOOL)a4;
- (void)_detectCustomDrawing;
- (void)_didAttachFieldEditor;
- (void)_didChangeSecureTextEntry;
- (void)_didDetachFieldEditor;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_didUpdateAfterDetachingFieldEditor;
- (void)_drawTextInRect:(CGRect)a3 forLabel:(id)a4;
- (void)_enabledDidChangeAnimated:(BOOL)a3;
- (void)_encodeBackgroundColorWithCoder:(id)a3;
- (void)_ensureSelectionContainerViewSubviewOrdering;
- (void)_forceObscureAllText;
- (void)_highlightedDidChangeAnimated:(BOOL)a3;
- (void)_increaseContrastSettingChanged:(id)a3;
- (void)_initIncreasedContrastNotifications;
- (void)_initTextCanvasView;
- (void)_initTextLayoutController;
- (void)_initTextStorage;
- (void)_initialScrollDidFinish:(id)a3;
- (void)_insertAttributedTextWithoutClosingTyping:(id)a3;
- (void)_installSelectGestureRecognizer;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_invalidateAfterUpdatingEditingAttributes;
- (void)_invalidateAllGlyphsAndTextLayout;
- (void)_invalidateBackgroundProvider;
- (void)_invalidateBackgroundProviderForced:(BOOL)a3;
- (void)_invalidateCachedDefaultClearButtonImages;
- (void)_invalidateDefaultFont;
- (void)_invalidateDefaultFullFontSize;
- (void)_invalidateMetricsProvider;
- (void)_invalidatePasscodeStyleFromStyle:(BOOL)a3;
- (void)_layoutContentAndExtras;
- (void)_layoutContentOnly;
- (void)_layoutFieldEditor;
- (void)_layoutLabels;
- (void)_logWarningForMenuControllerUsage;
- (void)_nonDestructivelyResignFirstResponder;
- (void)_noteThatKeyboardAppearanceHasChanged;
- (void)_notifyDidBeginEditing;
- (void)_notifyDidEndEditing;
- (void)_notifySystemKeyboardOfAppearanceChange;
- (void)_pasteSessionDidFinish:(id)a3;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_promptForReplace:(id)a3;
- (void)_propagateCuiProperties;
- (void)_removeFieldEditorAndHost;
- (void)_resetSelectionUI;
- (void)_resignFirstResponder;
- (void)_sanitizeText:(id)a3;
- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4;
- (void)_selectGestureChanged:(id)a3;
- (void)_selectionMayChange:(id)a3;
- (void)_setActualLeftView:(id)a3;
- (void)_setActualLeftViewMode:(int64_t)a3;
- (void)_setActualRightView:(id)a3;
- (void)_setActualRightViewMode:(int64_t)a3;
- (void)_setAttributedPlaceholder:(id)a3;
- (void)_setAttributedText:(id)a3 setCaretSelectionAfterText:(BOOL)a4;
- (void)_setAttributedTextOnFieldEditor:(id)a3 setCaretSelectionAfterText:(BOOL)a4;
- (void)_setBackgroundCoverView:(id)a3;
- (void)_setBackgroundCoverViewMode:(int64_t)a3;
- (void)_setBackgroundFillColor:(id)a3;
- (void)_setBackgroundProvider:(id)a3;
- (void)_setBackgroundStrokeColor:(id)a3;
- (void)_setBackgroundStrokeWidth:(double)a3;
- (void)_setBlurEnabled:(BOOL)a3;
- (void)_setContentCoverUnsecuresText:(BOOL)a3;
- (void)_setContentCoverView:(id)a3;
- (void)_setContentCoverViewMode:(int64_t)a3;
- (void)_setCuiCatalog:(id)a3;
- (void)_setCuiStyleEffectConfiguration:(id)a3;
- (void)_setCursorAccessories:(id)a3;
- (void)_setDisableFocus:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setExtremeSizingEnabled:(BOOL)a3;
- (void)_setForceDisplayOverridePlaceholder:(BOOL)a3;
- (void)_setForcesClearButtonHighContrastAppearance:(BOOL)a3;
- (void)_setForegroundViewsAlpha:(double)a3;
- (void)_setFullFontSize:(id)a3;
- (void)_setHandwritingEnabled:(BOOL)a3;
- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)_setInteractionState:(id)a3;
- (void)_setLeadingPadding:(double)a3;
- (void)_setLeftViewOffset:(CGSize)a3;
- (void)_setMetricsProvider:(id)a3;
- (void)_setOverridePasscodeStyle:(BOOL)a3;
- (void)_setOverridePlaceholder:(id)a3 alignment:(int64_t)a4;
- (void)_setPadding:(UIEdgeInsets)a3;
- (void)_setPasscodeStyleAlpha:(double)a3;
- (void)_setPlaceholder:(id)a3;
- (void)_setPrefix:(id)a3;
- (void)_setRightViewOffset:(CGSize)a3;
- (void)_setRoundedRectBackgroundCornerRadius:(double)a3;
- (void)_setShouldDisplayDictationPlaceholderMessage:(BOOL)a3;
- (void)_setShouldUpdatePlaceholderTextAlignmentWhenOverridden:(BOOL)a3;
- (void)_setSuffix:(id)a3 withColor:(id)a4;
- (void)_setSupportsKeyboardNavigationForSuggestions:(BOOL)a3;
- (void)_setTextColor:(id)a3;
- (void)_setTextInRange:(_NSRange)a3 replacementText:(id)a4;
- (void)_setTrailingPadding:(double)a3;
- (void)_setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4;
- (void)_setupDefaultStyleEffectConfiguration;
- (void)_share:(id)a3;
- (void)_showSymbolAnimatableLeftViewNowIfNeeded;
- (void)_showSymbolAnimatableRightViewNowIfNeeded;
- (void)_sizeChanged:(BOOL)a3;
- (void)_stopObservingFieldEditorScroll;
- (void)_syncTypingAttributesWithDefaultAttribute:(id)a3;
- (void)_transitionFromAccessoryView:(id)a3 toView:(id)a4 allowingAnimation:(BOOL)a5;
- (void)_translate:(id)a3;
- (void)_transliterateChinese:(id)a3;
- (void)_tvUpdateAppearanceForUserInterfaceStyle;
- (void)_tvUpdateTextColor;
- (void)_uninstallSelectGestureRecognizer;
- (void)_updateAutosizeStyleIfNeeded;
- (void)_updateBaselineInformationDependentOnBounds;
- (void)_updateBaselineInformationDependentOnBoundsAllowingInvalidation:(BOOL)a3;
- (void)_updateButtons;
- (void)_updateButtonsAllowingAnimation:(BOOL)a3;
- (void)_updateForTintColor;
- (void)_updateLabel;
- (void)_updateLabelAppearance;
- (void)_updatePlaceholderPosition;
- (void)_updateSelectionGestures;
- (void)_updateSuffix:(id)a3;
- (void)_updateTextEffectsConfigurationIfNeeded;
- (void)_willUpdateAfterDetachingFieldEditor;
- (void)_windowBecameKey;
- (void)_windowResignedKey;
- (void)addGhostedRange:(id)a3;
- (void)addInvisibleRange:(id)a3;
- (void)addTextAlternatives:(id)a3;
- (void)becomeDropResponder;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)beginSelectionChange;
- (void)cancelAutoscroll;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)captureTextFromCamera:(id)a3;
- (void)clearText;
- (void)copy:(id)a3;
- (void)createPlaceholderIfNecessary;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)decodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4;
- (void)decreaseSize:(id)a3;
- (void)deleteBackward;
- (void)didGenerateCancelPreview:(id)a3;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)disableClearsOnInsertion;
- (void)draggingFinished:(id)a3;
- (void)drawPlaceholderInRect:(CGRect)rect;
- (void)drawPrefixInRect:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)drawSuffixInRect:(CGRect)a3;
- (void)drawTextInRect:(CGRect)rect;
- (void)droppingFinished;
- (void)droppingStarted;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)endFloatingCursor;
- (void)endSelectionChange;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)fieldEditorDidChange:(id)a3;
- (void)fieldEditorDidChangeSelection:(id)a3;
- (void)finishedSettingPlaceholder;
- (void)finishedSettingTextOrAttributedText;
- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)increaseSize:(id)a3;
- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4;
- (void)insertAttributedText:(id)a3;
- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)insertText:(id)a3;
- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5;
- (void)insertText:(id)a3 style:(int64_t)a4 alternatives:(id)a5;
- (void)interactionTintColorDidChange;
- (void)invalidateDropCaret;
- (void)keyboardInputChangedSelection:(id)a3;
- (void)layoutSubviews;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)paste:(id)a3;
- (void)pasteAndMatchStyle:(id)a3;
- (void)pasteItemProviders:(id)a3;
- (void)performCancelAnimations;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)removeAllGhostedRanges;
- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
- (void)removeEmojiAlternatives;
- (void)removeFromSuperview;
- (void)removeInvisibleRange:(id)a3;
- (void)removeTextPlaceholder:(id)a3;
- (void)replace:(id)a3;
- (void)replaceRange:(id)a3 withAttributedText:(id)a4;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4;
- (void)resignDropResponderWithDropPerformed:(BOOL)a3;
- (void)sanitizeAttributedText:(id)a3;
- (void)scrollTextFieldToVisibleIfNecessary;
- (void)select:(id)a3;
- (void)selectAll;
- (void)selectAll:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;
- (void)setAllowsAttachments:(BOOL)a3;
- (void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder;
- (void)setAttributedText:(NSAttributedString *)attributedText;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setBackground:(UIImage *)background;
- (void)setBackgroundColor:(id)a3;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setBecomesFirstResponderOnClearButtonTap:(BOOL)a3;
- (void)setBorderStyle:(UITextBorderStyle)borderStyle;
- (void)setBounds:(CGRect)a3;
- (void)setClearButtonMode:(UITextFieldViewMode)clearButtonMode;
- (void)setClearButtonOffset:(CGSize)a3;
- (void)setClearButtonStyle:(int64_t)a3;
- (void)setClearingBehavior:(int64_t)a3;
- (void)setClearsOnBeginEditing:(BOOL)clearsOnBeginEditing;
- (void)setClearsOnInsertion:(BOOL)clearsOnInsertion;
- (void)setClearsPlaceholderOnBeginEditing:(BOOL)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setContentOffsetForSameViewDrops:(CGPoint)a3;
- (void)setContentVerticalAlignment:(int64_t)a3;
- (void)setContinuousSpellCheckingEnabled:(BOOL)a3;
- (void)setControlSize:(int)a3;
- (void)setDefaultTextAttributes:(NSDictionary *)defaultTextAttributes;
- (void)setDelegate:(id)delegate;
- (void)setDevicePasscodeEntry:(BOOL)a3;
- (void)setDisabledBackground:(UIImage *)disabledBackground;
- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3;
- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFont:(UIFont *)font;
- (void)setFont:(id)a3 fullFontSize:(id)a4;
- (void)setFont:(id)a3 fullFontSize:(id)a4 ambientOnly:(BOOL)a5;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setInputAccessoryView:(UIView *)inputAccessoryView;
- (void)setInputAssistantItem:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)setInputView:(UIView *)inputView;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLabelOffset:(float)a3;
- (void)setLeftView:(UIView *)leftView;
- (void)setLeftViewMode:(UITextFieldViewMode)leftViewMode;
- (void)setLinkTextAttributes:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedTextStyle:(id)a3;
- (void)setMinimumFontSize:(CGFloat)minimumFontSize;
- (void)setNeedsLayout;
- (void)setNonEditingLinebreakMode:(int64_t)a3;
- (void)setPaddingLeft:(float)a3;
- (void)setPaddingRight:(float)a3;
- (void)setPaddingTop:(float)a3 paddingLeft:(float)a4;
- (void)setPasswordRules:(id)a3;
- (void)setPasteDelegate:(id)a3;
- (void)setPlaceholder:(NSString *)placeholder;
- (void)setProgress:(float)a3;
- (void)setRecentsAccessoryView:(id)a3;
- (void)setRightView:(UIView *)rightView;
- (void)setRightViewMode:(UITextFieldViewMode)rightViewMode;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setSelectionRange:(_NSRange)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShadowBlur:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setSizingRule:(int64_t)a3;
- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3;
- (void)setText:(NSString *)text;
- (void)setTextAlignment:(NSTextAlignment)textAlignment;
- (void)setTextCentersHorizontally:(BOOL)a3;
- (void)setTextCentersVertically:(BOOL)a3;
- (void)setTextColor:(UIColor *)textColor;
- (void)setTextDragDelegate:(id)a3;
- (void)setTextDragOptions:(int64_t)a3;
- (void)setTextDropDelegate:(id)a3;
- (void)setTextSelectionBehavior:(int)a3;
- (void)setTypingAttributes:(NSDictionary *)typingAttributes;
- (void)setUndoEnabled:(BOOL)a3;
- (void)setVisualStyle:(id)a3;
- (void)set_disableTextColorUpdateOnTraitCollectionChange:(BOOL)a3;
- (void)set_tvCustomFocusedTextColor:(id)a3;
- (void)set_tvCustomTextColor:(id)a3;
- (void)set_tvUseVibrancy:(BOOL)a3;
- (void)startAutoscroll:(CGPoint)a3;
- (void)takeTraitsFrom:(id)a3;
- (void)textContainerUsageDidChangeToSize:(CGSize)a3;
- (void)tintColorDidChange;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)unmarkText;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)validateCommand:(id)a3;
- (void)willDismissEditMenuWithAnimator:(id)a3;
- (void)willMoveToWindow:(id)a3;
- (void)willPresentEditMenuWithAnimator:(id)a3;
@end

@implementation UITextField

- (BOOL)_hasBaseline
{
  return 1;
}

- (BOOL)_canDrawContent
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if ((*(_WORD *)&textFieldFlags & 0x4000) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextField;
    return [(UIView *)&v5 _canDrawContent];
  }
  else if ((*(void *)&textFieldFlags & 0x200000000) != 0)
  {
    backgroundProvider = self->_backgroundProvider;
    return [(_UITextFieldBackgroundProvider *)backgroundProvider drawsContent];
  }
  else
  {
    return 0;
  }
}

uint64_t __48__UITextField__addTextCanvasViewAdjustingFrame___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 952) removeFromSuperview];
    [*(id *)(a1 + 32) _textCanvasViewFrameIncludingContentInsetsFromFontsWhenNotContainedByFieldEditor];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 952), "setFrame:");
  }
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 952);
  return [v2 addSubview:v3];
}

- (void)didMoveToWindow
{
  uint64_t v3 = [(UIView *)self window];
  if (!v3)
  {
    uint64_t v4 = +[UIKeyboardImpl activeInstance];
    if (!v4) {
      return;
    }
    objc_super v5 = (void *)v4;
    BOOL v6 = [(UIView *)self isUserInteractionEnabled];

    if (!v6) {
      return;
    }
    v7 = +[UIKeyboardImpl activeInstance];
    [v7 removeASPVisualEffectsIfNecessary:self];
    uint64_t v3 = v7;
  }
}

- (UIFont)font
{
  return [(_UICascadingTextStorage *)self->_textStorage font];
}

- (id)textInRange:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UITextField *)self _fieldEditor];
  BOOL v6 = [v5 textInRange:v4];

  BOOL v7 = [(UITextField *)self _shouldObscureInput];
  id v8 = v6;
  v9 = v8;
  if (v8 && v7) {
    id v10 = (id)[NSString _newZStringWithString:v8];
  }
  else {
    id v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (BOOL)_shouldObscureInput
{
  int v3 = [(UITextField *)self isSecureTextEntry];
  if (v3)
  {
    if ([(UITextField *)self displaySecureTextUsingPlainText]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(UITextField *)self _shouldUnobscureTextWithContentCover];
    }
  }
  return v3;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextField *)self _fieldEditor];
  int64_t v9 = [v8 comparePosition:v7 toPosition:v6];

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UITextField *)self _fieldEditor];
  id v8 = [v7 positionFromPosition:v6 offset:a4];

  return v8;
}

- (UIFieldEditor)_fieldEditor
{
  fieldEditor = self->_fieldEditor;
  if (!fieldEditor)
  {
    id v4 = (UIFieldEditor *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_fieldEditorClass")), "initWithTextField:", self);
    objc_super v5 = self->_fieldEditor;
    self->_fieldEditor = v4;

    fieldEditor = self->_fieldEditor;
  }
  return fieldEditor;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextField *)self _fieldEditor];
  int64_t v9 = [v8 textRangeFromPosition:v7 toPosition:v6];

  return v9;
}

- (UITextPosition)beginningOfDocument
{
  v2 = [(UITextField *)self _fieldEditor];
  int v3 = [v2 beginningOfDocument];

  return (UITextPosition *)v3;
}

+ (Class)_fieldEditorClass
{
  return (Class)objc_opt_class();
}

- (void)_adjustFontForAccessibilityTraits:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory || a3)
  {
    objc_super v5 = [(UIView *)self traitCollection];
    id v6 = [(UITextField *)self font];
    id v7 = [v6 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v5];

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    id v8 = [(UITextField *)self font];
    char v9 = 0;
    if (v8 && v7)
    {
      id v10 = [(UITextField *)self font];
      char v9 = [v10 isEqual:v7] ^ 1;
    }
    char v23 = v9;
    if (*((unsigned char *)v21 + 24))
    {
      [v7 pointSize];
      v11 = +[_UIFullFontSize valued:](_UIFullFontSize, "valued:");
      [(UITextField *)self setFont:v7 fullFontSize:v11 ambientOnly:1];
    }
    v12 = self->_textStorage;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __49__UITextField__adjustFontForAccessibilityTraits___block_invoke;
    v17 = &unk_1E530B430;
    id v13 = v5;
    id v18 = v13;
    v19 = &v20;
    [(_UICascadingTextStorage *)v12 coordinateEditing:&v14];
    if (*((unsigned char *)v21 + 24))
    {
      [(UIView *)self invalidateIntrinsicContentSize];
      [(UITextField *)self _didSetFont:v7];
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (NSTextStorage)textStorage
{
  int v3 = [(UITextField *)self _fieldEditor];
  id v4 = (id)[v3 _textLayoutController];

  textStorage = self->_textStorage;
  return (NSTextStorage *)textStorage;
}

- (void)_setSupportsKeyboardNavigationForSuggestions:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  int v9 = *((_DWORD *)&self->super.super._viewFlags + 4);
  double x = a3.origin.x;
  -[UITextField _availableTextRectExcludingButtonsForBounds:](self, "_availableTextRectExcludingButtonsForBounds:");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(UITextField *)self shadowBlur];
  if (v18 != 0.0)
  {
    double v19 = v18;
    [(UITextField *)self shadowOffset];
    CGFloat v21 = -(fabs(v19) + fabs(v20));
    v69.origin.double x = v11;
    v69.origin.double y = v13;
    v69.size.double width = v15;
    v69.size.double height = v17;
    CGRect v70 = CGRectInset(v69, 0.0, v21);
    double v11 = v70.origin.x;
    double v13 = v70.origin.y;
    double v15 = v70.size.width;
    double v17 = v70.size.height;
  }
  if (self->_iconView)
  {
    [(UITextField *)self iconRect];
    float v23 = v22;
    double v24 = v23;
    double v11 = v11 + v24;
    double v15 = v15 - v24;
  }
  label = self->_label;
  if (label)
  {
    [(UIView *)label frame];
    if ((v9 & 0x80000) != 0)
    {
      float v31 = v26;
      [(UIView *)self bounds];
      float v33 = v32 - v31;
      double v15 = v15 - v33;
      double v11 = v31 - v15;
    }
    else
    {
      float v28 = v27;
      [(UIView *)self->_label frame];
      *(float *)&double v29 = v29 + v28;
      double v30 = *(float *)&v29;
      double v11 = v11 + v30;
      double v15 = v15 - v30;
    }
  }
  if ([(UITextField *)self _showsLeftView])
  {
    -[UITextField leftViewRectForBounds:](self, "leftViewRectForBounds:", x, y, width, height);
    double v65 = v34;
    double v66 = v17;
    double v35 = v13;
    double v37 = v36;
    -[UITextField _baselineLeftViewRectForBounds:](self, "_baselineLeftViewRectForBounds:", x, y, width, height);
    double v38 = v37 + v65;
    double v13 = v35;
    double v17 = v66;
    double v40 = fmin(v15, v38 - v39);
    double v11 = v11 + v40;
    double v15 = v15 - v40;
  }
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    v42 = [(UILabel *)suffixLabel text];
    v43 = [(UILabel *)self->_suffixLabel font];
    objc_msgSend(v42, "_legacy_sizeWithFont:", v43);
    double v45 = fmin(v15, v44);

    double v15 = v15 - v45;
  }
  prefixLabel = self->_prefixLabel;
  if (prefixLabel)
  {
    v47 = [(UILabel *)prefixLabel text];
    v48 = [(UILabel *)self->_prefixLabel font];
    objc_msgSend(v47, "_legacy_sizeWithFont:", v48);
    double v50 = fmin(v15, v49);

    double v11 = v11 + v50;
    double v15 = v15 - v50;
  }
  [(UITextField *)self clearButtonRect];
  double v52 = v51;
  [(UITextField *)self _clearButtonMarginX];
  float v54 = v53 + v52;
  if ((v9 & 0x80000) == 0)
  {
    if (((UIKeyboardIsRightToLeftInputModeActive() & 1) != 0
       || [(_UICascadingTextStorage *)self->_textStorage _ui_resolvedTextAlignment] == 2
       || [(UITextField *)self _hasContent])
      && [(UITextField *)self _showsClearButtonWhenNonEmpty:v4]
      || ![(UITextField *)self _hasContent]
      && [(UITextField *)self _showsClearButtonWhenEmpty])
    {
      double v55 = v54;
    }
    else
    {
      if (![(UITextField *)self _showsRightView]) {
        goto LABEL_33;
      }
      -[UITextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
      double v55 = fmin(v15, v58);
    }
    goto LABEL_32;
  }
  if ([(UITextField *)self _hasContent]
    && [(UITextField *)self _showsClearButtonWhenNonEmpty:v4]
    || ![(UITextField *)self _hasContent]
    && [(UITextField *)self _showsClearButtonWhenEmpty])
  {
    double v15 = v15 - v54;
    double v11 = v11 + v54;
  }
  if ([(UITextField *)self _showsRightView])
  {
    [(UIView *)self bounds];
    double MaxX = CGRectGetMaxX(v71);
    -[UITextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
    double v55 = fmin(v15, MaxX - v57);
LABEL_32:
    double v15 = v15 - v55;
  }
LABEL_33:
  if (v15 >= 0.0) {
    double v59 = v15;
  }
  else {
    double v59 = 0.0;
  }
  [(UIView *)self _currentScreenScale];
  double v61 = UIRectIntegralWithScale(v11, v13, v59, v17, v60);
  result.size.double height = v64;
  result.size.double width = v63;
  result.origin.double y = v62;
  result.origin.double x = v61;
  return result;
}

- (BOOL)_hasContent
{
  v2 = [(UITextField *)self _text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_text
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    BOOL v3 = [(UITextField *)self _fieldEditor];
    v2 = [v3 text];
  }
  else
  {
    v2 = [(NSConcreteTextStorage *)self->_textStorage string];
  }
  return v2;
}

- (BOOL)_showsRightView
{
  uint64_t rightView = (uint64_t)self->_rightView;
  if (rightView)
  {
    $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    BOOL v5 = [(UITextField *)self _hasContent];
    int64_t rightViewMode = self->_rightViewMode;
    switch(rightViewMode)
    {
      case 3:
        LOBYTE(rightView) = 1;
        break;
      case 2:
        LOBYTE(rightView) = !v5;
        if (v5 && (*(_WORD *)&textFieldFlags & 0x100) == 0)
        {
          objc_opt_class();
          LOBYTE(rightView) = objc_opt_isKindOfClass() ^ 1;
        }
        break;
      case 1:
        uint64_t rightView = (*(unint64_t *)&textFieldFlags >> 8) & 1;
        break;
      default:
        LOBYTE(rightView) = 0;
        break;
    }
  }
  return rightView & 1;
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
  CGFloat height = bounds.size.height;
  CGFloat width = bounds.size.width;
  CGFloat y = bounds.origin.y;
  CGFloat x = bounds.origin.x;
  id v8 = (CGFloat *)MEMORY[0x1E4F1DB28];
  CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(UITextField *)self _clearButtonSize:bounds.origin.x];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v34);
    [(UITextField *)self _clearButtonMarginX];
    UIRoundToViewScale(self);
    double v22 = round(MinX + v21);
    [(UITextField *)self clearButtonOffset];
    double v19 = v22 - v23;
  }
  else
  {
    CGFloat v13 = *v8;
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v32);
    v33.origin.CGFloat x = v13;
    v33.origin.CGFloat y = rect;
    v33.size.CGFloat width = v10;
    v33.size.CGFloat height = v12;
    double v15 = MaxX - CGRectGetWidth(v33);
    [(UITextField *)self _clearButtonMarginX];
    UIRoundToViewScale(self);
    double v17 = round(v15 - v16);
    [(UITextField *)self clearButtonOffset];
    double v19 = v17 + v18;
  }
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v35);
  v36.origin.CGFloat x = v19;
  v36.origin.CGFloat y = rect;
  v36.size.CGFloat width = v10;
  v36.size.CGFloat height = v12;
  double v25 = round(MidY - (CGRectGetHeight(v36) * 0.5 + 1.0));
  [(UITextField *)self clearButtonOffset];
  double v27 = v26 + v25;
  double v28 = v19;
  double v29 = v10;
  double v30 = v12;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v28;
  return result;
}

- (CGSize)clearButtonOffset
{
  double width = self->_clearButtonOffset.width;
  double height = self->_clearButtonOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)_clearButtonMarginX
{
  v2 = [(UIView *)self traitCollection];
  [v2 userInterfaceIdiom];

  return 8.0;
}

- (CGSize)_clearButtonSize:(CGRect)a3
{
  BOOL v4 = [(UIView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  double v6 = 0.0;
  double v7 = 0.0;
  if (v5 != 6)
  {
    double v6 = 19.0;
    if (_TextFieldScalesClearButton())
    {
      clearButton = self->_clearButton;
      double v7 = 19.0;
      if (clearButton)
      {
        double v9 = [(UIButton *)clearButton imageForState:0];
        [v9 size];
        double v7 = v10;
        double v6 = v11;
      }
    }
    else
    {
      double v7 = 19.0;
    }
  }
  double v12 = v7;
  double v13 = v6;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (BOOL)_showsLeftView
{
  if (!self->_leftView) {
    goto LABEL_6;
  }
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  BOOL v4 = [(UITextField *)self _hasContent];
  int64_t leftViewMode = self->_leftViewMode;
  if (leftViewMode == 3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (leftViewMode != 2)
  {
    if (leftViewMode == 1) {
      return (*(unint64_t *)&textFieldFlags >> 8) & 1;
    }
LABEL_6:
    LOBYTE(v6) = 0;
    return v6;
  }
  LOBYTE(v6) = (*(_WORD *)&textFieldFlags & 0x100) == 0 || !v4;
  return v6;
}

- (CGRect)clearButtonRect
{
  [(UIView *)self bounds];
  -[UITextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (double)shadowBlur
{
  [(_UICascadingTextStorage *)self->_textStorage shadowBlur];
  return result;
}

- (CGRect)_availableTextRectExcludingButtonsForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(UITextField *)self _metricsProvider];
  objc_msgSend(v7, "contentFrameForBounds:", x, y, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (id)_metricsProvider
{
  return self->_metricsProvider;
}

- (BOOL)_showsClearButtonWhenEmpty
{
  return 0;
}

- (void)interactionTintColorDidChange
{
  double v3 = (void *)_clearButtonImages;
  _clearButtonImages = 0;

  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  [(UIView *)&v4 interactionTintColorDidChange];
}

- (float)paddingLeft
{
  return self->_padding.left;
}

- (BOOL)_fieldEditorAttached
{
  return *((unsigned char *)&self->_textFieldFlags + 1) & 1;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  CGFloat y = bounds.origin.y;
  CGFloat x = bounds.origin.x;
  if (ShouldSizeLeftOrRightViewToFit(self->_rightView))
  {
    -[UIView systemLayoutSizeFittingSize:](self->_rightView, "systemLayoutSizeFittingSize:", width, height);
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    [(UIView *)self->_rightView frame];
    double v9 = v12;
    double v11 = v13;
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  CGRectGetMaxX(v21);
  UIRoundToViewScale(self);
  double v15 = v14 + self->_rightViewOffset.width;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  CGRectGetMidY(v22);
  UIRoundToViewScale(self);
  double v17 = v16 + self->_rightViewOffset.height;
  double v18 = v15;
  double v19 = v9;
  double v20 = v11;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_baselineLeftViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (ShouldSizeLeftOrRightViewToFit(self->_leftView))
  {
    -[UIView systemLayoutSizeFittingSize:](self->_leftView, "systemLayoutSizeFittingSize:", width, height);
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    [(UIView *)self->_leftView frame];
    double v9 = v12;
    double v11 = v13;
  }
  CGFloat v14 = self->_leftViewOffset.width;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  CGRectGetMidY(v20);
  UIRoundToViewScale(self);
  double v16 = v15 + self->_leftViewOffset.height;
  double v17 = v14;
  double v18 = v9;
  double v19 = v11;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v17;
  return result;
}

- (float)_marginTopForBounds:(CGRect)a3
{
  if ((*(unsigned char *)&self->_textFieldFlags & 1) != 0
    || [(UIControl *)self contentVerticalAlignment] == UIControlContentVerticalAlignmentCenter
    || [(UIControl *)self contentVerticalAlignment] == UIControlContentVerticalAlignmentBottom)
  {
    objc_super v4 = [(UITextField *)self font];
    [v4 lineHeight];

    -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, 100.0, 100.0);
    [(UIControl *)self contentVerticalAlignment];
  }
  else
  {
    double v5 = self->_textStorage;
    double v6 = [(_UICascadingTextStorage *)v5 font];
    [v6 pointSize];
    float v8 = v7;

    [(UITextField *)self _fullFontSize];
    float v10 = v9;
    if (v10 > v8)
    {
      double v11 = [(_UICascadingTextStorage *)v5 font];
      *(float *)&double v12 = v10;
      *(float *)&double v13 = v10;
      id v14 = [(UITextField *)self _copyFont:v11 newSize:v12 maxSize:v13];

      [v14 ascender];
      double v15 = [(_UICascadingTextStorage *)v5 font];
      [v15 ascender];
    }
  }
  UIRoundToViewScale(self);
  return v16;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", 0, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)_hasSuffixField
{
  return self->_suffixLabel != 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UITextField;
  if (-[UITextField respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    double v5 = [(UITextField *)self textInputTraits];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (id)textInputTraits
{
  traits = self->_traits;
  if (!traits)
  {
    char v4 = objc_alloc_init(UITextInputTraits);
    double v5 = self->_traits;
    self->_traits = v4;

    traits = self->_traits;
  }
  [(UITextInputTraits *)traits setIsSingleLineDocument:1];
  nonAtomTraits = self->_nonAtomTraits;
  if (nonAtomTraits)
  {
    [(UITextInputTraits *)self->_traits setTextSelectionBehavior:[(UITextInputTraits *)nonAtomTraits textSelectionBehavior]];
    objc_super v7 = self->_traits;
    float v8 = [(UITextInputTraits *)self->_nonAtomTraits insertionPointColor];
    [(UITextInputTraits *)v7 setInsertionPointColor:v8];

    double v9 = self->_traits;
    float v10 = [(UITextInputTraits *)self->_nonAtomTraits selectionHighlightColor];
    [(UITextInputTraits *)v9 setSelectionHighlightColor:v10];

    double v11 = self->_traits;
    double v12 = [(UITextInputTraits *)self->_nonAtomTraits selectionDragDotImage];
    [(UITextInputTraits *)v11 setSelectionDragDotImage:v12];

    [(UITextInputTraits *)self->_traits setTextLoupeVisibility:[(UITextInputTraits *)self->_nonAtomTraits textLoupeVisibility]];
  }
  double v13 = self->_traits;
  return v13;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ([(id)objc_opt_class() instancesRespondToSelector:a3])
  {
    double v5 = [(UITextField *)self textInputTraits];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextField;
    double v5 = [(UITextField *)&v7 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (BOOL)_isPasscodeStyle
{
  double v3 = [(UITextField *)self textInputTraits];
  BOOL v4 = [v3 keyboardAppearance] == 127 && (*((unsigned char *)&self->_textFieldFlags + 2) & 0x10) == 0;

  return v4;
}

- (int)textSelectionBehavior
{
  if ([(UITextField *)self clearsOnInsertion]) {
    return 3;
  }
  traits = self->_traits;
  return [(UITextInputTraits *)traits textSelectionBehavior];
}

- (BOOL)clearsOnInsertion
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 2) >> 3) & 1;
}

- (void)_invalidateAllGlyphsAndTextLayout
{
  double v3 = [(UITextField *)self textLayoutController];
  BOOL v4 = [v3 documentRange];
  if (([v4 isEmpty] & 1) == 0)
  {
    [v3 invalidateLayoutForRange:v4];
    [(UIView *)self setNeedsDisplay];
  }
  [(UIView *)self _invalidateBaselineConstraints];
  if ([(UIView *)self _shouldNotifyGeometryObserversForBaselineChanges])
  {
    uint64_t v23 = 0;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    long long v10 = 0u;
    long long v9 = 0u;
    uint64_t v8 = 2048;
    -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v8);
  }
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0)
  {
    uint64_t v5 = [(UIView *)self superview];
    double v6 = (void *)v5;
    if (v5 && (*(void *)(v5 + 96) & 0x8000000000000000) == 0)
    {
      objc_super v7 = [(UIView *)self superview];
      [v7 setNeedsLayout];
    }
  }
}

uint64_t __35__UITextField__detectCustomDrawing__block_invoke()
{
  uint64_t result = +[UITextField instanceMethodForSelector:sel_drawRect_];
  qword_1EB25E5E0 = result;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  if ((*((unsigned char *)&self->_textFieldFlags + 4) & 0x40) != 0)
  {
    -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, 100.0, 100.0);
    if (v5 == 0.0 && 100.0 - (v5 + v6) == 0.0 && self->_padding.left == 0.0)
    {
      double v3 = 0.0;
      if (self->_padding.right == 0.0)
      {
        -[UITextField _applicableContentOutsetsFromFontsOversize:extremeSizing:]((uint64_t)self, 1, 0);
        double v3 = v7 + 0.0;
        double v2 = v8 + 0.0;
      }
    }
    else
    {
      double v3 = 0.0;
    }
  }
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v2;
  result.right = v11;
  result.bottom = v10;
  result.left = v3;
  result.top = v9;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  BOOL v4 = [(UIView *)self superview];
  kdebug_trace();

  if (self)
  {
    -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, 100.0, 100.0);
    double v6 = v5;
    double v8 = v7;
    double v10 = 100.0 - (v7 + v9);
    double v12 = 100.0 - (v5 + v11);
  }
  else
  {
    double v12 = 0.0;
    double v10 = 0.0;
    double v6 = 0.0;
    double v8 = 0.0;
  }
  long long v13 = [(UIView *)self traitCollection];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (v14 == 6)
  {
    -[UITextField _visionOverrideHorizontalInsets:](self, "_visionOverrideHorizontalInsets:", v8, v6, v10, v12);
    double v8 = v15;
    double v6 = v16;
    double v10 = v17;
    double v12 = v18;
  }
  [(UITextField *)self _textSizeUsingFullFontSize:1];
  double v20 = v19;
  double v22 = v21;
  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel)
  {
    -[UILabel _intrinsicSizeWithinSize:](placeholderLabel, "_intrinsicSizeWithinSize:", 3.40282347e38, 3.40282347e38);
    if (v20 < v24) {
      double v20 = v24;
    }
    if (v22 < v25) {
      double v22 = v25;
    }
  }
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  double v30 = v12 + v6 + v20 + left + right;
  double v31 = v10 + v8 + v22 + top + bottom;
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if ((*(void *)&textFieldFlags & 0x6000000000) != 0)
  {
    BOOL v33 = bottom == 0.0;
    if (v8 != 0.0) {
      BOOL v33 = 0;
    }
    if (v10 != 0.0) {
      BOOL v33 = 0;
    }
    BOOL v34 = top == 0.0 && v33;
    BOOL v35 = right == 0.0;
    if (v6 != 0.0) {
      BOOL v35 = 0;
    }
    if (v12 != 0.0) {
      BOOL v35 = 0;
    }
    BOOL v36 = left == 0.0 && v35;
    if ((v34 | (*(unint64_t *)&textFieldFlags >> 38) & v36) == 1)
    {
      -[UITextField _applicableContentOutsetsFromFontsOversize:extremeSizing:]((uint64_t)self, (*(unint64_t *)&textFieldFlags >> 38) & 1, (*(unint64_t *)&textFieldFlags >> 37) & 1);
      double v41 = v39 + v40;
      if (!v34) {
        double v41 = -0.0;
      }
      double v31 = v31 + v41;
      double v42 = v37 + v38;
      if (!v36) {
        double v42 = -0.0;
      }
      double v30 = v30 + v42;
    }
  }
  v43 = [(UITextField *)self _metricsProvider];
  objc_msgSend(v43, "intrinsicSizeForContentSize:", v30, v31);
  double v45 = v44;
  double v47 = v46;

  v48 = [(UIView *)self traitCollection];
  uint64_t v49 = [v48 userInterfaceIdiom];

  if (v49 == 6) {
    -[UITextField _visionOverrideNaturalHeight:](self, "_visionOverrideNaturalHeight:", v45, v47);
  }
  if (kdebug_is_enabled())
  {
    id v50 = [(UITextField *)self description];
    [v50 UTF8String];
    kdebug_trace_string();

    double v51 = [(UIView *)self superview];
    kdebug_trace();
  }
  UICeilToViewScale(self);
  double v53 = v52;
  UICeilToViewScale(self);
  double v55 = v54;
  double v56 = v53;
  result.double height = v55;
  result.double width = v56;
  return result;
}

- (CGSize)_textSizeUsingFullFontSize:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIResponder *)self _caretRect];
  double v6 = v5;
  double v7 = self->_textStorage;
  double v8 = v7;
  if ((*((unsigned char *)&self->_textFieldFlags + 2) & 2) != 0)
  {
    double v9 = [(_UICascadingTextStorage *)v7 _UIKBStringWideAttributeValueForKey:*(void *)off_1E52D2040];
    if (v9 && [(NSConcreteTextStorage *)v8 length])
    {
      [(_UICascadingTextStorage *)v8 size];
      double v11 = v10;
      double v13 = v12;
      goto LABEL_13;
    }
  }
  double v9 = [(_UICascadingTextStorage *)v8 font];
  if (v3)
  {
    [(UITextField *)self _fullFontSize];
    uint64_t v14 = objc_msgSend(v9, "fontWithSize:");

    double v9 = (void *)v14;
  }
  if (!v9)
  {
    [off_1E52D39B8 defaultFontSize];
    double v9 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  }
  double v15 = [(UITextField *)self text];
  uint64_t v16 = [(__CFString *)v15 length];
  double v17 = @" ";
  if (v16) {
    double v17 = v15;
  }
  double v18 = v17;

  [(__CFString *)v18 _legacy_sizeWithFont:v9];
  double v11 = v19;
  double v13 = v20;

LABEL_13:
  if (v13 >= v6) {
    double v6 = v13;
  }

  double v21 = v11;
  double v22 = v6;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (NSString)text
{
  BOOL v3 = [(UITextField *)self _text];
  BOOL v4 = [(UITextField *)self textInputTraits];
  uint64_t v5 = [v4 textTrimmingSet];

  if (v5)
  {
    uint64_t v6 = [v3 _stringByTrimmingCharactersInCFCharacterSet:v5];

    BOOL v3 = (void *)v6;
  }
  BOOL v7 = [(UITextField *)self _shouldObscureInput];
  double v8 = (void *)[v3 copy];
  double v9 = v8;
  if (v7 && v8) {
    uint64_t v10 = [NSString _newZStringWithString:v8];
  }
  else {
    uint64_t v10 = [v8 copy];
  }
  double v11 = (void *)v10;

  return (NSString *)v11;
}

- (double)_fullFontSize
{
  fullFontSize = self->_fullFontSize;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__UITextField__fullFontSize__block_invoke;
  v4[3] = &unk_1E52DCFA8;
  v4[4] = self;
  [(_UIFullFontSize *)fullFontSize valueWithEvaluationIfNeeded:v4];
  return result;
}

double __28__UITextField__fullFontSize__block_invoke(uint64_t a1)
{
  [off_1E52D39B8 defaultFontSize];
  double v3 = v2;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 890) & 2) != 0 && dyld_program_sdk_at_least())
  {
    uint64_t v14 = 0;
    double v15 = (double *)&v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    BOOL v4 = [*(id *)(a1 + 32) attributedText];
    uint64_t v5 = [v4 length];

    uint64_t v6 = [*(id *)(a1 + 32) attributedText];
    uint64_t v7 = *(void *)off_1E52D2040;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __28__UITextField__fullFontSize__block_invoke_2;
    v9[3] = &unk_1E530B368;
    *(double *)&v9[6] = v3;
    v9[7] = v5;
    v9[4] = &v14;
    v9[5] = &v10;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v5, 0, v9);

    if (*((unsigned char *)v11 + 24)) {
      double v3 = v15[3];
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  return v3;
}

- (id)_textLayoutController
{
  return self->_textLayoutController;
}

- (void)textContainerUsageDidChangeToSize:(CGSize)a3
{
}

- (NSCustomTextRendering)customRenderController
{
  return 0;
}

- (id)_textContainer
{
  return self->_textContainer;
}

- (NSTextContainer)textContainer
{
  double v3 = [(UITextField *)self _fieldEditor];
  id v4 = (id)[v3 _textLayoutController];

  return (NSTextContainer *)[(UITextField *)self _textContainer];
}

- (CGPoint)_originForTextFieldLabel:(id)a3
{
  id v4 = (UITextFieldLabel *)a3;
  uint64_t v5 = [(UITextField *)self _fieldEditor];
  uint64_t v6 = [v5 superview];
  uint64_t v7 = v6;
  if (!v6) {
    uint64_t v6 = self;
  }
  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[UITextField _marginTopForBounds:](self, "_marginTopForBounds:", v9, v11, v13, v15);
  float v17 = v16;
  double left = self->_padding.left;
  if ((*((unsigned char *)&self->_textFieldFlags + 4) & 0x40) != 0 && left == 0.0)
  {
    -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", [(UITextField *)self isEditing], v9, v11, v13, v15);
    -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    double left = left + CGRectGetMinX(v25);
  }
  double v19 = v17;
  if (self->_placeholderLabel == v4 || v4 == 0) {
    double v21 = left;
  }
  else {
    double v21 = 0.0;
  }

  double v22 = v21;
  double v23 = v19;
  result.CGFloat y = v23;
  result.CGFloat x = v22;
  return result;
}

- (CGRect)_clipRectForFadedEdges
{
  if ([(id)objc_opt_class() _wantsFadedEdges]
    && ![(UITextField *)self _fieldEditorAttached])
  {
    [(_UITextCanvas *)self->_textCanvasView bounds];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)_textCanvasView
{
  return self->_textCanvasView;
}

- (CGPoint)textContainerOrigin
{
  [(UIFieldEditor *)self->_fieldEditor textContainerOrigin];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (UIScrollView)enclosingScrollView
{
  return 0;
}

+ (BOOL)_wantsFadedEdges
{
  return 0;
}

- (id)defaultClearButtonImageForState:(unint64_t)a3
{
  cachedDefaultClearButtonImages = self->_cachedDefaultClearButtonImages;
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)cachedDefaultClearButtonImages objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v7 = [(UITextField *)self _clearButtonImageForState:a3];
    if (v7)
    {
      double v8 = self->_cachedDefaultClearButtonImages;
      if (!v8)
      {
        double v9 = [MEMORY[0x1E4F1CA60] dictionary];
        double v10 = self->_cachedDefaultClearButtonImages;
        self->_cachedDefaultClearButtonImages = v9;

        double v8 = self->_cachedDefaultClearButtonImages;
      }
      double v11 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v11];
    }
  }
  return v7;
}

- (BOOL)_partsShouldBeMini
{
  UITextBorderStyle v3 = [(UITextField *)self borderStyle];
  if (v3)
  {
    LOBYTE(v3) = [(UITextField *)self _heightShouldBeMini];
  }
  return v3;
}

- (UITextBorderStyle)borderStyle
{
  UITextBorderStyle result = [(_UITextFieldBackgroundProvider *)self->_backgroundProvider associatedBorderStyle];
  if (result == -1) {
    return self->_preferredBorderStyle;
  }
  return result;
}

- (BOOL)_heightShouldBeMini
{
  [(UIView *)self frame];
  return v2 <= 26.0;
}

- (UILabel)_placeholderLabel
{
  return (UILabel *)self->_placeholderLabel;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  if ([(UITextField *)self isEditing]) {
    -[UITextField editingRectForBounds:](self, "editingRectForBounds:", x, y, width, height);
  }
  else {
    -[UITextField textRectForBounds:](self, "textRectForBounds:", x, y, width, height);
  }
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  -[UILabel textRectForBounds:](self->_placeholderLabel, "textRectForBounds:", x, y, width, height);
  double v17 = v16;
  UIControlContentVerticalAlignment v18 = [(UIControl *)self contentVerticalAlignment];
  if (v18 != UIControlContentVerticalAlignmentTop)
  {
    double v19 = v15 - v17;
    if (v18 != UIControlContentVerticalAlignmentBottom) {
      UIRoundToViewScale(self);
    }
    double v13 = v13 + v19;
  }
  double v20 = v12;
  double v21 = v13;
  double v22 = v14;
  double v23 = v17;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (float)paddingRight
{
  return self->_padding.right;
}

- (void)setFont:(UIFont *)font
{
  double v11 = font;
  double v4 = self->_textStorage;
  double v5 = [(_UICascadingTextStorage *)v4 font];
  double v6 = v11;
  if (v5 != v11)
  {
    uint64_t v7 = [(_UICascadingTextStorage *)v4 font];
    char v8 = [v7 isEqual:v11];

    if (v8) {
      goto LABEL_8;
    }
    if (v11)
    {
      [(UIFont *)v11 pointSize];
      double v6 = +[_UIFullFontSize valued:](_UIFullFontSize, "valued:");
      double v9 = self;
      double v10 = v11;
    }
    else
    {
      double v6 = +[_UIFullFontSize defaultValue];
      double v9 = self;
      double v10 = 0;
    }
    [(UITextField *)v9 setFont:v10 fullFontSize:v6];
  }

LABEL_8:
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategordouble y = a3;
    [(UITextField *)self _adjustFontForAccessibilityTraits:0];
  }
}

- (void)setFont:(id)a3 fullFontSize:(id)a4 ambientOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v22 = a3;
  id v8 = a4;
  double v9 = self->_textStorage;
  double v10 = v9;
  if (v5)
  {
    if (v22)
    {
      double v11 = [(_UICascadingTextStorage *)v9 defaultAttributes];
      double v12 = (void *)[v11 mutableCopy];
      double v13 = v12;
      if (v12) {
        id v14 = v12;
      }
      else {
        id v14 = (id)objc_opt_new();
      }
      double v15 = v14;

      [v15 setObject:v22 forKeyedSubscript:*(void *)off_1E52D2040];
      [(_UICascadingTextStorage *)v10 setDefaultAttributes:v15];
    }
  }
  else
  {
    [(_UICascadingTextStorage *)v9 setFont:v22];
  }
  if (!self->_overriddenPlaceholder) {
    [(UILabel *)self->_placeholderLabel setFont:v22];
  }
  [(UILabel *)self->_label setFont:v22];
  [(UILabel *)self->_suffixLabel setFont:v22];
  [(UILabel *)self->_prefixLabel setFont:v22];
  [(UITextField *)self _setFullFontSize:v8];
  if (v5)
  {
    if (v22)
    {
      double v16 = [(_UICascadingTextStorage *)v10 defaultAttributes];
      double v17 = (void *)[v16 mutableCopy];
      UIControlContentVerticalAlignment v18 = v17;
      if (v17) {
        id v19 = v17;
      }
      else {
        id v19 = (id)objc_opt_new();
      }
      double v20 = v19;

      [v20 setObject:v22 forKeyedSubscript:*(void *)off_1E52D2040];
      [(_UICascadingTextStorage *)v10 setDefaultAttributes:v20];
    }
  }
  else
  {
    [(_UICascadingTextStorage *)v10 setFont:v22];
  }
  if ([(UITextField *)self _shouldObscureInput]) {
    [(UITextField *)self _forceObscureAllText];
  }
  [(UITextField *)self _syncTypingAttributesWithDefaultAttribute:*(void *)off_1E52D2040];
  double v21 = [(UITextField *)self _inputController];
  [v21 _updateEmptyStringAttributes];
  [v21 _selectionGeometryChanged];
  [(UITextField *)self setNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
  if (!v5) {
    [(UITextField *)self _didSetFont:v22];
  }
  [(UITextField *)self _invalidateAllGlyphsAndTextLayout];
}

- (void)setFont:(id)a3 fullFontSize:(id)a4
{
}

- (void)setDefaultTextAttributes:(NSDictionary *)defaultTextAttributes
{
  BOOL v5 = self->_textStorage;
  double v6 = defaultTextAttributes;
  [(_UICascadingTextStorage *)v5 setDefaultAttributes:0];
  uint64_t v7 = [(_UICascadingTextStorage *)v5 defaultAttributes];
  id v8 = (void *)[v7 mutableCopy];

  [v8 removeObjectForKey:*(void *)off_1E52D2238];
  [v8 addEntriesFromDictionary:v6];
  double v9 = [v8 objectForKey:*(void *)off_1E52D2040];
  [(UITextField *)self setFont:v9];

  double v10 = [(NSDictionary *)v6 objectForKey:*(void *)off_1E52D21B8];

  -[UITextField setTextAlignment:](self, "setTextAlignment:", [v10 alignment]);
  [(_UICascadingTextStorage *)v5 setDefaultAttributes:v8];
  uint64_t v11 = [(NSConcreteTextStorage *)v5 length];
  -[NSConcreteTextStorage setAttributes:range:](v5, "setAttributes:range:", MEMORY[0x1E4F1CC08], 0, v11);
  [(UITextField *)self _invalidateAllGlyphsAndTextLayout];
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__UITextField_setDefaultTextAttributes___block_invoke;
    v13[3] = &unk_1E52DDE90;
    v13[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v13];
    double v12 = [(UITextField *)self _inputController];
    [v12 _selectionGeometryChanged];
  }
  [(UITextField *)self setNeedsLayout];
}

- (double)_foregroundViewsAlpha
{
  return self->_foregroundViewsAlpha;
}

- (void)_setRoundedRectBackgroundCornerRadius:(double)a3
{
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  else {
    double v3 = 0.0;
  }
  if (self->_preferredBackgroundCornerRadius != v3)
  {
    self->_preferredBackgroundCornerRadius = v3;
    id v4 = [(UITextField *)self _systemBackgroundView];
    [v4 setCornerRadius:v3];
  }
}

- (void)setBorderStyle:(UITextBorderStyle)borderStyle
{
  if (self->_preferredBorderStyle != borderStyle)
  {
    self->_preferredBorderStyle = borderStyle;
    [(UITextField *)self _invalidateBackgroundProvider];
    backgroundProvider = self->_backgroundProvider;
    [(_UITextFieldBackgroundProvider *)backgroundProvider borderStyleDidChange:0];
  }
}

- (void)setClearButtonMode:(UITextFieldViewMode)clearButtonMode
{
  if (self->_clearButtonMode != clearButtonMode)
  {
    self->_clearButtonMode = clearButtonMode;
    [(UITextField *)self setNeedsLayout];
  }
}

- (void)setLeftViewMode:(UITextFieldViewMode)leftViewMode
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    [(UITextField *)self _setActualRightViewMode:leftViewMode];
  }
  else {
    [(UITextField *)self _setActualLeftViewMode:leftViewMode];
  }
}

- (void)_setActualLeftViewMode:(int64_t)a3
{
  if (self->_leftViewMode != a3)
  {
    self->_int64_t leftViewMode = a3;
    [(UITextField *)self _showSymbolAnimatableLeftViewNowIfNeeded];
    [(UITextField *)self setNeedsLayout];
  }
}

- (void)_invalidateBackgroundProvider
{
}

- (void)setControlSize:(int)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    [(UITextField *)self _invalidateBackgroundProvider];
    [(UITextField *)self _invalidateDefaultFont];
    backgroundProvider = self->_backgroundProvider;
    [(_UITextFieldBackgroundProvider *)backgroundProvider controlSizeDidChange:0];
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  p_viewFlags = &self->super.super._viewFlags;
  int v5 = *((_DWORD *)&self->super.super._viewFlags + 4);
  v12.receiver = self;
  v12.super_class = (Class)UITextField;
  [(UIView *)&v12 setSemanticContentAttribute:a3];
  if (((*((_DWORD *)p_viewFlags + 4) ^ v5) & 0x80000) != 0)
  {
    uint64_t rightView = self->_rightView;
    uint64_t v7 = self->_leftView;
    [(UITextField *)self _setActualLeftView:rightView];
    [(UITextField *)self _setActualRightView:v7];
    int64_t leftViewMode = self->_leftViewMode;
    [(UITextField *)self _setActualLeftViewMode:self->_rightViewMode];
    [(UITextField *)self _setActualRightViewMode:leftViewMode];
    double width = self->_leftViewOffset.width;
    CGFloat height = self->_leftViewOffset.height;
    CGFloat v11 = self->_rightViewOffset.height;
    self->_leftViewOffset.double width = -self->_rightViewOffset.width;
    self->_leftViewOffset.CGFloat height = v11;
    self->_rightViewOffset.double width = -width;
    self->_rightViewOffset.CGFloat height = height;
  }
}

- (void)setLeftView:(UIView *)leftView
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    [(UITextField *)self _setActualRightView:leftView];
  }
  else {
    [(UITextField *)self _setActualLeftView:leftView];
  }
}

- (void)_setActualLeftView:(id)a3
{
  int v5 = (UIView *)a3;
  p_leftView = &self->_leftView;
  if (self->_leftView != v5)
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIView *)*p_leftView _setProxyPointerInteraction:0];
    }
    [(UIView *)*p_leftView _setOverrideUserInterfaceRenderingMode:-1];
    [(UITextField *)self _transitionFromAccessoryView:*p_leftView toView:0 allowingAnimation:0];
    objc_storeStrong((id *)&self->_leftView, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(UIControl *)self pointerInteraction];
      [(UIView *)*p_leftView _setProxyPointerInteraction:v7];
    }
    [(UIView *)*p_leftView _setOverrideUserInterfaceRenderingMode:1];
    [(UITextField *)self _showSymbolAnimatableLeftViewNowIfNeeded];
    [(UITextField *)self setNeedsLayout];
    int v5 = v8;
  }
}

- (void)_invalidateDefaultFont
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__UITextField__invalidateDefaultFont__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:v2];
}

- (void)_showSymbolAnimatableLeftViewNowIfNeeded
{
  if ([(UITextField *)self _showsLeftView]
    && [(UITextField *)self _isAccessoryViewAnimatable:self->_leftView])
  {
    leftView = self->_leftView;
    [(UITextField *)self _transitionFromAccessoryView:0 toView:leftView allowingAnimation:0];
  }
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
  int v5 = self->_textStorage;
  *(void *)&self->_textFieldFlags |= 0x2000uLL;
  uint64_t v7 = v5;
  if ([(_UICascadingTextStorage *)v5 textAlignment] != textAlignment)
  {
    [(UILabel *)self->_placeholderLabel setTextAlignment:textAlignment];
    [(_UICascadingTextStorage *)v7 setTextAlignment:textAlignment];
    [(UITextField *)self _syncTypingAttributesWithDefaultAttribute:*(void *)off_1E52D21B8];
    double v6 = [(UITextField *)self _inputController];
    [v6 _selectionGeometryChanged];
  }
}

- (void)_layoutLabels
{
  double v3 = [(UITextField *)self _fieldEditor];
  int v4 = [v3 _hasDictationPlaceholder];

  int v5 = [(UITextField *)self _hasContent] | v4;
  double v6 = [(UILabel *)self->_placeholderLabel text];
  if (![v6 length] || (v5 & 1) != 0 || (*((unsigned char *)&self->_textFieldFlags + 3) & 8) != 0)
  {

LABEL_7:
    [(UIView *)self->_placeholderLabel removeFromSuperview];
    goto LABEL_8;
  }

  [(UIView *)self bounds];
  -[UITextField placeholderRectForBounds:](self, "placeholderRectForBounds:");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if ([(UITextField *)self _shouldShrinkPlaceholderToFitForAccessibility])
  {
    uint64_t v15 = 1;
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v15 = *(unsigned char *)&self->_textFieldFlags >> 7;
  }
  [(UILabel *)self->_placeholderLabel setAdjustsFontSizeToFitWidth:v15];
  [(UILabel *)self->_placeholderLabel setBaselineAdjustment:v16];
  double v23 = [(UILabel *)self->_placeholderLabel font];
  [v23 pointSize];
  double v25 = v24;

  if (v25 <= 0.0)
  {
    double v26 = [(id)objc_opt_class() defaultFont];
    [v26 pointSize];
    double v25 = v27;
  }
  if (v25 == 0.0) {
    double v28 = 0.0;
  }
  else {
    double v28 = self->_minimumFontSize / v25;
  }
  [(UILabel *)self->_placeholderLabel setMinimumScaleFactor:v28];
  -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v8, v10, v12, v14);
  if ([(UITextField *)self isEditing]
    && [(UITextField *)self clearsPlaceholderOnBeginEditing])
  {
    goto LABEL_7;
  }
  double v29 = [(UITextField *)self _fieldEditorHost];
  double v30 = v29;
  if (v29)
  {
    [v29 addPlaceholderLabel:self->_placeholderLabel];
  }
  else
  {
    double v31 = [(UITextField *)self _contentView];
    [v31 addSubview:self->_placeholderLabel];
  }
  CGRect v32 = [(UITextField *)self _inputController];
  [v32 _selectionGeometryChanged];

LABEL_8:
  prefixLabel = self->_prefixLabel;
  if (prefixLabel)
  {
    [(UITextField *)self _prefixFrame];
    -[UILabel setFrame:](prefixLabel, "setFrame:");
    UIControlContentVerticalAlignment v18 = [(UITextField *)self _contentView];
    [v18 addSubview:self->_prefixLabel];

    if (([(UITextField *)self isEditing] | v5)) {
      [(_UICascadingTextStorage *)self->_textStorage textColor];
    }
    else {
    id v19 = [(UILabel *)self->_placeholderLabel color];
    }
    [(UILabel *)self->_prefixLabel setColor:v19];
    [(UIView *)self->_placeholderLabel frame];
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:");
    [(UILabel *)self->_prefixLabel setNeedsDisplay];
  }
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    [(UITextField *)self _suffixFrame];
    -[UILabel setFrame:](suffixLabel, "setFrame:");
    double v21 = [(UITextField *)self _contentView];
    [v21 addSubview:self->_suffixLabel];

    id v22 = self->_suffixLabel;
    [(UILabel *)v22 setNeedsDisplay];
  }
}

- (id)_inputController
{
  double v2 = [(UITextField *)self _fieldEditor];
  double v3 = [v2 _inputController];

  return v3;
}

- (void)_layoutFieldEditor
{
  double v3 = [(UITextField *)self _fieldEditor];
  id v19 = v3;
  if (v3)
  {
    BOOL v4 = [(UIView *)self isFirstResponder];
    BOOL v5 = v4;
    $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    if ((*(unsigned char *)&textFieldFlags & 0x1E) != 0 && !v4)
    {
      double v9 = *MEMORY[0x1E4F1DB28];
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [(UIView *)self bounds];
      -[UITextField editingRectForBounds:](self, "editingRectForBounds:");
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    }
    if ((*(unsigned char *)&textFieldFlags & 0x1E) == 0)
    {
      [v19 frame];
      if (![(UITextField *)self _tvHasFloatingFieldEditor]) {
        objc_msgSend(v19, "setFrame:", v9, v11, v13, v15);
      }
    }
    double v3 = v19;
    if (v5)
    {
      if ([(UITextField *)self adjustsFontSizeToFitWidth])
      {
        uint64_t v16 = [(UITextField *)self textInputTraits];
        double v17 = v13 - (double)(unint64_t)[v16 insertionPointWidth];

        [v19 contentSize];
        if (v18 <= v17) {
          objc_msgSend(v19, "setScrollXOffset:scrollYOffset:", 0, objc_msgSend(v19, "scrollYOffset"));
        }
      }
      [v19 scrollSelectionToVisible:0];
      double v3 = v19;
    }
  }
  [v3 _applyCorrectTextContainerSize];
}

- (BOOL)_tvHasFloatingFieldEditor
{
  return 0;
}

- (BOOL)_shouldShrinkPlaceholderToFitForAccessibility
{
  if (!dyld_program_sdk_at_least()
    || (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_TextFieldShrinksPlaceholderToFitForAXSizes, @"TextFieldShrinksPlaceholderToFitForAXSizes") & 1) == 0&& !byte_1EB25797C)
  {
    return 0;
  }
  BOOL v4 = [(UIView *)self traitCollection];
  BOOL v5 = [v4 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v5);

  return IsAccessibilityCategory;
}

- (id)_fieldEditorHost
{
  return [(UITextField *)self _fieldEditorHostAllowingCreation:0];
}

- (id)_fieldEditorHostAllowingCreation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = objc_getAssociatedObject(self, &FieldEditorHostKey);
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    BOOL v5 = +[_UIFieldEditorHost fieldEditorHostForTextField:self];
    objc_setAssociatedObject(self, &FieldEditorHostKey, v5, (void *)1);
  }
  return v5;
}

- (void)_syncTypingAttributesWithDefaultAttribute:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v15 = v4;
    if (![v4 isEqualToString:*(void *)off_1E52D2040]
      || (v6 = [(UITextField *)self _tvHasFloatingFieldEditor], BOOL v5 = v15, !v6))
    {
      id v7 = [(UITextField *)self _fieldEditor];
      double v8 = [v7 _textStorage];
      double v9 = [v8 defaultAttributes];

      double v10 = [(UITextField *)self _inputController];
      double v11 = [v9 objectForKey:v15];
      [v10 _addToTypingAttributes:v15 value:v11];

      double v12 = [v7 _textContainer];
      double v13 = [(UITextField *)self _inputController];
      double v14 = [v13 typingAttributes];
      [v12 setAttributesForExtraLineFragment:v14];

      BOOL v5 = v15;
    }
  }
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  [(UIView *)&v3 setNeedsLayout];
  if (*((unsigned char *)&self->_textFieldFlags + 1)) {
    [(UIScrollView *)self->_fieldEditor setNeedsLayout];
  }
}

- (void)setRightViewMode:(UITextFieldViewMode)rightViewMode
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    [(UITextField *)self _setActualLeftViewMode:rightViewMode];
  }
  else {
    [(UITextField *)self _setActualRightViewMode:rightViewMode];
  }
}

- (void)_setActualRightViewMode:(int64_t)a3
{
  if (self->_rightViewMode != a3)
  {
    self->_int64_t rightViewMode = a3;
    [(UITextField *)self _showSymbolAnimatableRightViewNowIfNeeded];
    [(UITextField *)self setNeedsLayout];
  }
}

- (void)_showSymbolAnimatableRightViewNowIfNeeded
{
  if ([(UITextField *)self _showsRightView]
    && [(UITextField *)self _isAccessoryViewAnimatable:self->_rightView])
  {
    uint64_t rightView = self->_rightView;
    [(UITextField *)self _transitionFromAccessoryView:0 toView:rightView allowingAnimation:0];
  }
}

- (BOOL)_isAccessoryViewAnimatable:(id)a3
{
  id v4 = a3;
  if ([(UIControl *)self _allowsSymbolAnimations])
  {
    BOOL v5 = self;
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [v4 _imageViewIfNeeded];
      id v7 = [v6 image];
      char v8 = [v7 isSymbolImage];
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

- (void)setRightView:(UIView *)rightView
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    [(UITextField *)self _setActualLeftView:rightView];
  }
  else {
    [(UITextField *)self _setActualRightView:rightView];
  }
}

- (void)_setActualRightView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_uint64_t rightView = &self->_rightView;
  if (self->_rightView != v5)
  {
    char v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIView *)*p_rightView _setProxyPointerInteraction:0];
    }
    [(UIView *)*p_rightView _setOverrideUserInterfaceRenderingMode:-1];
    [(UITextField *)self _transitionFromAccessoryView:*p_rightView toView:0 allowingAnimation:0];
    objc_storeStrong((id *)&self->_rightView, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(UIControl *)self pointerInteraction];
      [(UIView *)*p_rightView _setProxyPointerInteraction:v7];
    }
    [(UIView *)*p_rightView _setOverrideUserInterfaceRenderingMode:1];
    [(UITextField *)self _showSymbolAnimatableRightViewNowIfNeeded];
    [(UITextField *)self setNeedsLayout];
    BOOL v5 = v8;
  }
}

- (void)_layoutContentOnly
{
  double v21 = self->_selectionContainerView;
  objc_super v3 = [(UITextField *)self visualStyle];
  id v4 = [v3 parentViewForTextContentView];

  if ([(UITextField *)self _showsContentCoverView])
  {
    if (*((unsigned char *)&self->_textFieldFlags + 1)) {
      [(UIScrollView *)self->_fieldEditor removeFromSuperview];
    }
    if (v21)
    {
      BOOL v5 = [(UIView *)self->_selectionContainerView superview];

      if (v4 != v5) {
        [v4 addSubview:v21];
      }
    }
    BOOL v6 = [(_UITextCanvas *)self->_textCanvasView superview];

    if (v4 != v6) {
      [v4 addSubview:self->_textCanvasView];
    }
    contentCoverView = self->_contentCoverView;
    if (contentCoverView)
    {
      char v8 = [(UIView *)contentCoverView superview];

      if (v4 != v8) {
        [v4 addSubview:self->_contentCoverView];
      }
      [v4 bringSubviewToFront:self->_contentCoverView];
      [(UITextField *)self editRect];
      -[UIView setFrame:](self->_contentCoverView, "setFrame:");
    }
  }
  else
  {
    [(UIView *)self->_contentCoverView removeFromSuperview];
    $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    if ((*(_WORD *)&textFieldFlags & 0x100) != 0)
    {
      double v10 = [(UIView *)self->_fieldEditor superview];

      if (!v10)
      {
        [(UITextField *)self _addFieldEditorToView];
        goto LABEL_24;
      }
      $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    }
    if ((*(_WORD *)&textFieldFlags & 0x100) == 0)
    {
      if (v21)
      {
        double v11 = [(UIView *)self->_selectionContainerView superview];

        if (v4 != v11) {
          [v4 addSubview:v21];
        }
      }
      double v12 = [(_UITextCanvas *)self->_textCanvasView superview];

      if (v4 != v12) {
        [v4 addSubview:self->_textCanvasView];
      }
      [v4 bringSubviewToFront:self->_textCanvasView];
    }
  }
LABEL_24:
  double v13 = [(UITextField *)self textInputView];
  [v13 bounds];
  -[UIView setFrame:](v21, "setFrame:");

  double v14 = [(UITextField *)self interactionAssistant];
  id v15 = [v14 _legacySelectionView];
  [v15 deferredUpdateSelectionRects];

  if ([(UITextField *)self _showsBackgroundCoverView])
  {
    [v4 insertSubview:self->_backgroundCoverView below:self->_textCanvasView];
    [(UIView *)self bounds];
    -[UITextField borderRectForBounds:](self, "borderRectForBounds:");
    -[UIView setFrame:](self->_backgroundCoverView, "setFrame:");
    if ([(UITextField *)self borderStyle] == UITextBorderStyleRoundedRect)
    {
      double preferredBackgroundCornerRadius = self->_preferredBackgroundCornerRadius;
      double v17 = [(UIView *)self->_backgroundCoverView layer];
      double v18 = v17;
      double v19 = preferredBackgroundCornerRadius;
    }
    else
    {
      double v17 = [(UIView *)self->_backgroundCoverView layer];
      double v18 = v17;
      double v19 = 0.0;
    }
    [v17 setCornerRadius:v19];
  }
  else
  {
    [(UIView *)self->_backgroundCoverView removeFromSuperview];
  }
  double v20 = [(_UITextCanvas *)self->_textCanvasView superview];

  if (v4 == v20)
  {
    [(UITextField *)self _textCanvasViewFrameIncludingContentInsetsFromFontsWhenNotContainedByFieldEditor];
    -[_UITextCanvas setFrame:](self->_textCanvasView, "setFrame:");
    [(_UITextCanvas *)self->_textCanvasView setNeedsDisplay];
  }
  [(UITextField *)self _layoutFieldEditor];
  [(_UITextFieldBackgroundProvider *)self->_backgroundProvider layoutIfNeeded];
}

- (UITextInteractionAssistant)interactionAssistant
{
  return self->_interactionAssistant;
}

- (_UITextFieldVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)_updateButtonsAllowingAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(UITextField *)self _contentView];
  id v5 = [(UIView *)self->_clearButton superview];

  if ([(UITextField *)self _showsClearButton:[(UITextField *)self isEditing]])
  {
    id v6 = [(UITextField *)self clearButton];
    BOOL v7 = +[UIView areAnimationsEnabled];
    BOOL v8 = v5 == v10 && v7;
    +[UIView setAnimationsEnabled:v8];
    [(UITextField *)self clearButtonRect];
    -[UIButton setFrame:](self->_clearButton, "setFrame:");
    [(UIView *)self->_clearButton setUserInteractionEnabled:1];
    [(_UITextFieldClearButton *)self->_clearButton setPointerInteractionEnabled:[(UITextField *)self _hasCustomClearButtonImage] ^ 1];
    [(UITextField *)self _transitionFromAccessoryView:0 toView:self->_clearButton allowingAnimation:v3];
    +[UIView setAnimationsEnabled:v7];
  }
  else
  {
    [(UITextField *)self _transitionFromAccessoryView:self->_clearButton toView:0 allowingAnimation:v3];
  }
  double v9 = v10;
  if (self->_leftView)
  {
    if ([(UITextField *)self _showsLeftView])
    {
      [(UITextField *)self _transitionFromAccessoryView:0 toView:self->_leftView allowingAnimation:v3];
      [(UIView *)self bounds];
      -[UITextField leftViewRectForBounds:](self, "leftViewRectForBounds:");
      -[UIView setFrame:](self->_leftView, "setFrame:");
    }
    else
    {
      [(UITextField *)self _transitionFromAccessoryView:self->_leftView toView:0 allowingAnimation:v3];
    }
    double v9 = v10;
  }
  if (self->_rightView)
  {
    if ([(UITextField *)self _showsRightView])
    {
      [(UITextField *)self _transitionFromAccessoryView:0 toView:self->_rightView allowingAnimation:v3];
      [(UIView *)self bounds];
      -[UITextField rightViewRectForBounds:](self, "rightViewRectForBounds:");
      -[UIView setFrame:](self->_rightView, "setFrame:");
    }
    else
    {
      [(UITextField *)self _transitionFromAccessoryView:self->_rightView toView:0 allowingAnimation:v3];
    }
    double v9 = v10;
  }
}

- (void)_transitionFromAccessoryView:(id)a3 toView:(id)a4 allowingAnimation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(UITextField *)self _contentView];
  if (v8)
  {
    double v11 = [v8 superview];

    if (v11 == v10)
    {
      if (v5
        && [(UITextField *)self _shouldAnimateTransitionForAccessoryView:v8])
      {
        id v12 = v8;
        double v13 = [v12 _imageViewIfNeeded];
        double v14 = [MEMORY[0x1E4F41A40] disappearDownEffect];
        id v15 = [MEMORY[0x1E4F41A50] options];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __69__UITextField__transitionFromAccessoryView_toView_allowingAnimation___block_invoke;
        v24[3] = &unk_1E530B390;
        id v25 = v12;
        id v16 = v12;
        [v13 addSymbolEffect:v14 options:v15 animated:1 completion:v24];
      }
      else
      {
        [v8 removeFromSuperview];
      }
    }
  }
  if (v9)
  {
    double v17 = [v9 superview];

    if (v17 != v10)
    {
      if (v5
        && [(UITextField *)self _shouldAnimateTransitionForAccessoryView:v9])
      {
        id v18 = v9;
        double v19 = [v18 _imageViewIfNeeded];
        double v20 = [MEMORY[0x1E4F41A40] disappearDownEffect];
        double v21 = [MEMORY[0x1E4F41A50] options];
        [v19 addSymbolEffect:v20 options:v21 animated:0];

        [v10 addSubview:v18];
        id v22 = [v18 _imageViewIfNeeded];

        double v23 = [MEMORY[0x1E4F41A20] appearUpEffect];
        [v22 addSymbolEffect:v23];
      }
      else
      {
        [v10 addSubview:v9];
      }
    }
  }
}

- (BOOL)isEditing
{
  if (!self->_deferringBecomeFirstResponder && (*((unsigned char *)&self->_textFieldFlags + 1) & 1) == 0
    || ![(UIView *)self isFirstResponder])
  {
    return 0;
  }
  return [(UITextField *)self isEditable];
}

- (BOOL)_showsClearButtonWhenNonEmpty:(BOOL)a3
{
  if ([(UITextField *)self clearButtonMode] == UITextFieldViewModeNever)
  {
    int v5 = 1;
    goto LABEL_16;
  }
  if ([(UITextField *)self clearButtonMode] == UITextFieldViewModeAlways)
  {
    int v5 = 0;
    goto LABEL_16;
  }
  if ([(UIView *)self isFirstResponder])
  {
    int v6 = 1;
    if (!a3)
    {
LABEL_7:
      BOOL v7 = [(UITextField *)self _hasContent];
      goto LABEL_10;
    }
  }
  else
  {
    int v6 = *((unsigned char *)&self->_textFieldFlags + 1) & 1;
    if (!a3) {
      goto LABEL_7;
    }
  }
  BOOL v7 = 1;
LABEL_10:
  if ([(UITextField *)self clearButtonMode] == UITextFieldViewModeWhileEditing)
  {
    int v5 = v6 & v7 ^ 1;
  }
  else
  {
    if ([(UITextField *)self clearButtonMode] == UITextFieldViewModeUnlessEditing) {
      int v8 = v6;
    }
    else {
      int v8 = 0;
    }
    int v5 = v8 & v7;
  }
LABEL_16:
  int v9 = *((_DWORD *)&self->super.super._viewFlags + 4);
  if ((v9 & 0x80000) != 0) {
    BOOL v10 = [(UITextField *)self _showsLeftView];
  }
  else {
    BOOL v10 = [(UITextField *)self _showsRightView];
  }
  if ((v5 | v10)) {
    return 0;
  }
  if ([(UITextField *)self _currentTextAlignment] == (((*(void *)&v9 & 0x80000uLL) >> 18) ^ 2)
    && ![(UITextField *)self _hasContent])
  {
    return [(UITextField *)self clearButtonMode] == UITextFieldViewModeAlways;
  }
  return 1;
}

- (UITextFieldViewMode)clearButtonMode
{
  return self->_clearButtonMode;
}

- (CGRect)_textCanvasViewFrameIncludingContentInsetsFromFontsWhenNotContainedByFieldEditor
{
  BOOL v3 = [(UITextField *)self _fieldEditor];
  [v3 _contentInsetsFromFonts];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(UIView *)self bounds];
  -[UITextField textRectForBounds:](self, "textRectForBounds:");
  double v13 = v7 + v12;
  double v15 = v5 + v14;
  double v17 = v16 - (v7 + v11);
  double v19 = v18 - (v5 + v9);
  result.size.CGFloat height = v19;
  result.size.double width = v17;
  result.origin.double y = v15;
  result.origin.double x = v13;
  return result;
}

- (BOOL)_showsContentCoverView
{
  if (!self->_contentCoverView) {
    return 0;
  }
  BOOL result = [(UIView *)self isFirstResponder];
  int64_t contentCoverViewMode = self->_contentCoverViewMode;
  if (contentCoverViewMode == 3) {
    return 1;
  }
  if (contentCoverViewMode != 2)
  {
    if (contentCoverViewMode == 1) {
      return result;
    }
    return 0;
  }
  return !result;
}

- (BOOL)_showsClearButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 3)
  {
    double v7 = [(UIView *)self traitCollection];
    BOOL v8 = [v7 interactionModel] & 1;

    return v8;
  }
  else if ([(UITextField *)self _hasContent])
  {
    return [(UITextField *)self _showsClearButtonWhenNonEmpty:v3];
  }
  else
  {
    return [(UITextField *)self _showsClearButtonWhenEmpty];
  }
}

- (BOOL)_showsBackgroundCoverView
{
  if (!self->_backgroundCoverView) {
    return 0;
  }
  BOOL result = [(UIView *)self isFirstResponder];
  int64_t backgroundCoverViewMode = self->_backgroundCoverViewMode;
  if (backgroundCoverViewMode == 3) {
    return 1;
  }
  if (backgroundCoverViewMode != 2)
  {
    if (backgroundCoverViewMode == 1) {
      return result;
    }
    return 0;
  }
  return !result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  [(UIView *)&v6 layoutSubviews];
  BOOL v3 = [(UITextField *)self _contentFloatingContainerView];
  [(UIView *)self bounds];
  objc_msgSend(v3, "setFrame:");
  [v3 setNeedsLayout];
  [v3 layoutIfNeeded];
  [(UITextField *)self _tvUpdateContentBackdropView];
  fieldEditor = self->_fieldEditor;
  if (fieldEditor)
  {
    double v5 = [(UIView *)fieldEditor superview];

    if (!v5) {
      [(UIView *)self->_fieldEditor layoutIfNeeded];
    }
  }
  [(UITextField *)self _layoutContentAndExtras];
}

- (void)_layoutContentAndExtras
{
  [(UITextField *)self _updateLabel];
  [(UITextField *)self _updatePlaceholderPosition];
  [(UITextField *)self _updateAutosizeStyleIfNeeded];
  [(UITextField *)self _updateButtons];
  [(_UITextFieldBackgroundProvider *)self->_backgroundProvider layoutIfNeeded];
  [(UITextField *)self _layoutLabels];
  [(UITextField *)self _layoutContentOnly];
}

- (void)_updatePlaceholderPosition
{
  BOOL v3 = [(UILabel *)self->_placeholderLabel text];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    if ([(UILabel *)self->_placeholderLabel textAlignment] != NSTextAlignmentCenter)
    {
      int64_t v5 = [(UITextField *)self _currentTextAlignment];
      if (v5 != [(UILabel *)self->_placeholderLabel textAlignment])
      {
        placeholderLabel = self->_placeholderLabel;
        [(UILabel *)placeholderLabel setTextAlignment:v5];
      }
    }
  }
}

- (void)_updateLabel
{
  label = self->_label;
  if (!label) {
    return;
  }
  [(UIView *)label sizeToFit];
  [(UIView *)self->_label frame];
  double v5 = v4;
  iconView = self->_iconView;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    if (!iconView)
    {
      [(UIView *)self bounds];
      double v7 = v10 - v5 + -6.0 - self->_labelOffset;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (iconView)
  {
LABEL_7:
    [(UITextField *)self iconRect];
    double v7 = self->_labelOffset + v8 + v9 + 3.0;
    goto LABEL_9;
  }
  double v7 = self->_labelOffset + 6.0;
LABEL_9:
  [(UIView *)self bounds];
  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", 0);
  double v11 = self->_label;
  [(UILabel *)v11 setFrame:v7];
}

- (void)_updateButtons
{
}

- (id)_contentFloatingContainerView
{
  return self->_floatingContainerView;
}

- (id)_systemBackgroundView
{
  double v2 = self;
  BOOL v3 = v2;
  if (v2 && (*((unsigned char *)&v2->_textFieldFlags + 4) & 4) != 0) {
    backgroundProvider = v2->_backgroundProvider;
  }
  else {
    backgroundProvider = 0;
  }
  double v5 = backgroundProvider;

  objc_super v6 = [(_UITextFieldBackgroundProvider *)v5 backgroundView];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_backgroundCoverView
{
  return self->_backgroundCoverView;
}

- (CGRect)_backgroundBounds
{
  [(UIView *)self bounds];
  -[UITextField borderRectForBounds:](self, "borderRectForBounds:");
  result.size.CGFloat height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (int64_t)_currentTextAlignment
{
  double v2 = [(UITextField *)self _textStorage];
  int64_t v3 = objc_msgSend(v2, "_ui_resolvedTextAlignment");

  return v3;
}

- (id)_textStorage
{
  return self->_textStorage;
}

- (void)_setFullFontSize:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[_UIFullFontSize defaultValue];
  }
  id obj = v4;
  if (![(_UIFullFontSize *)self->_fullFontSize isEqual:v4])
  {
    objc_storeStrong((id *)&self->_fullFontSize, obj);
    if ([(UITextField *)self adjustsFontSizeToFitWidth])
    {
      if ([(_UIFullFontSize *)self->_fullFontSize needsEvaluation]) {
        [(UITextField *)self setNeedsLayout];
      }
    }
  }
}

- (void)_updateAutosizeStyleIfNeeded
{
  if ([(UITextField *)self adjustsFontSizeToFitWidth]
    && ((*((unsigned char *)&self->_textFieldFlags + 1) & 1) == 0
     || ![(UITextField *)self _tvHasFloatingFieldEditor]))
  {
    BOOL v3 = [(UITextField *)self _shouldObscureInput];
    if ((*((unsigned char *)&self->_textFieldFlags + 2) & 2) != 0)
    {
      double v5 = [(UITextField *)self attributedText];
      id v4 = [v5 string];
    }
    else
    {
      id v4 = [(UITextField *)self text];
    }
    double v6 = self->_textStorage;
    id v7 = [(_UICascadingTextStorage *)v6 font];
    uint64_t v8 = [v4 length];
    BOOL v9 = v8 == 0;
    if (v8)
    {
      if (v3)
      {
        v83[0] = 0;
        double v10 = objc_msgSend(v7, "_ui_bulletStringWithFont:", v83);
        id v59 = v83[0];
        uint64_t v68 = 0;
        CGRect v69 = &v68;
        uint64_t v70 = 0x2020000000;
        CGRect v71 = 0;
        uint64_t v11 = [v4 length];
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke;
        v82[3] = &unk_1E52E3F28;
        v82[4] = &v68;
        objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 2, v82);
        double v12 = [&stru_1ED0E84C0 stringByPaddingToLength:v69[3] withString:v10 startingAtIndex:0];

        BOOL v9 = (*((unsigned char *)&self->_textFieldFlags + 1) & 1) != 0 && [v12 length] == 0;
        _Block_object_dispose(&v68, 8);

        uint64_t v14 = 0;
        double v13 = v59;
LABEL_19:
        uint64_t v78 = 0;
        v79 = (float *)&v78;
        uint64_t v80 = 0x2020000000;
        float v81 = 0.0;
        double v15 = [(_UICascadingTextStorage *)v6 font];
        [v15 pointSize];
        float v17 = v16;

        float v81 = v17;
        [(UITextField *)self _fullFontSize];
        float v19 = v18;
        if (v9)
        {
          if (v79[6] != v19)
          {
            double v20 = [(_UICascadingTextStorage *)v6 font];
            *(float *)&double v21 = v19;
            *(float *)&double v22 = v19;
            id v23 = [(UITextField *)self _copyFont:v20 newSize:v21 maxSize:v22];

            double v24 = [(_UIFullFontSize *)self->_fullFontSize overrideUnlessDefault:v19];
            [(UITextField *)self setFont:v23 fullFontSize:v24 ambientOnly:v14];
          }
LABEL_54:
          _Block_object_dispose(&v78, 8);

          return;
        }
        [(UITextField *)self editRect];
        double v26 = v25;
        double v27 = [(UITextField *)self textInputTraits];
        unsigned int v28 = [v27 insertionPointWidth];

        float v29 = v26 - (double)v28 + -10.0;
        uint64_t v74 = 0;
        v75 = &v74;
        uint64_t v76 = 0x2020000000;
        int v77 = 0;
        uint64_t v68 = 0;
        CGRect v69 = &v68;
        uint64_t v70 = 0x3032000000;
        CGRect v71 = __Block_byref_object_copy__210;
        v72 = __Block_byref_object_dispose__210;
        id v73 = 0;
        if (v14)
        {
          int v30 = *((_DWORD *)v79 + 6);
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_2;
          v60[3] = &unk_1E530B3E0;
          float v65 = v19;
          float v66 = v26 - (double)v28 + -10.0;
          double v62 = &v78;
          double v63 = &v74;
          v60[4] = self;
          int v67 = v30;
          double v64 = &v68;
          id v61 = v7;
          [(_UICascadingTextStorage *)v6 coordinateAccess:v60];

LABEL_48:
          double v55 = (void *)v69[5];
          if (v55 && ([v55 isEqual:v7] & 1) == 0)
          {
            uint64_t v56 = v69[5];
            double v57 = [(_UIFullFontSize *)self->_fullFontSize overrideUnlessDefault:v19];
            [(UITextField *)self setFont:v56 fullFontSize:v57 ambientOnly:0];
          }
          if (*((_DWORD *)v75 + 6))
          {
            double v58 = [(UITextField *)self interactionAssistant];
            [v58 setNeedsSelectionDisplayUpdate];
          }
          _Block_object_dispose(&v68, 8);

          _Block_object_dispose(&v74, 8);
          goto LABEL_54;
        }
        if (v3)
        {
          [v7 pointSize];
          double v31 = objc_msgSend(v13, "fontWithSize:");
          if (v31 != v7) {
            goto LABEL_28;
          }
        }
        double v31 = 0;
LABEL_28:
        if (v31) {
          CGRect v32 = v31;
        }
        else {
          CGRect v32 = v7;
        }
        objc_msgSend(v12, "_legacy_sizeWithFont:", v32);
        double v34 = v33;
        double v35 = v29;
        while (1)
        {
          BOOL v36 = v79;
          float v37 = v79[6];
          if (v37 >= v19 || v34 >= v35) {
            break;
          }
          ++*((_DWORD *)v75 + 6);
          v36[6] = v37 + 1.0;
          id v39 = -[UITextField _copyFont:newSize:maxSize:](self, "_copyFont:newSize:maxSize:", v7);
          double v40 = (void *)v69[5];
          v69[5] = (uint64_t)v39;

          *(float *)&double v41 = v79[6];
          *(float *)&double v42 = v19;
          id v43 = [(UITextField *)self _copyFont:v31 newSize:v41 maxSize:v42];

          id v44 = v43;
          if (!v43) {
            id v44 = (id)v69[5];
          }
          objc_msgSend(v12, "_legacy_sizeWithFont:", v44);
          double v34 = v45;
          double v31 = v43;
        }
        while (1)
        {
          [(UITextField *)self actualMinimumFontSize];
          if (v46 >= v37 || v34 <= v35) {
            break;
          }
          --*((_DWORD *)v75 + 6);
          v79[6] = v79[6] + -1.0;
          id v48 = -[UITextField _copyFont:newSize:maxSize:](self, "_copyFont:newSize:maxSize:", v7);
          uint64_t v49 = (void *)v69[5];
          v69[5] = (uint64_t)v48;

          *(float *)&double v50 = v79[6];
          *(float *)&double v51 = v19;
          id v52 = [(UITextField *)self _copyFont:v31 newSize:v50 maxSize:v51];

          id v53 = v52;
          if (!v52) {
            id v53 = (id)v69[5];
          }
          objc_msgSend(v12, "_legacy_sizeWithFont:", v53);
          double v34 = v54;
          float v37 = v79[6];
          double v31 = v52;
        }

        goto LABEL_48;
      }
      double v12 = v4;
    }
    else
    {
      double v12 = [(UITextField *)self placeholder];

      if (v3)
      {
        double v13 = 0;
        uint64_t v14 = 0;
        BOOL v9 = 1;
        goto LABEL_19;
      }
    }
    if ((*((unsigned char *)&self->_textFieldFlags + 2) & 2) != 0)
    {
      uint64_t v14 = dyld_program_sdk_at_least();
      double v13 = 0;
    }
    else
    {
      double v13 = 0;
      uint64_t v14 = 0;
    }
    goto LABEL_19;
  }
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return (*(unsigned char *)&self->_textFieldFlags & 0x80) != 0 && !self->_suffixLabel && self->_prefixLabel == 0;
}

- (CGRect)editRect
{
  [(UIView *)self bounds];
  -[UITextField editingRectForBounds:](self, "editingRectForBounds:");
  result.size.CGFloat height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)actualMinimumFontSize
{
  char v3 = dyld_program_sdk_at_least();
  double minimumFontSize = self->_minimumFontSize;
  if ((v3 & 1) == 0)
  {
    [off_1E52D39B8 systemMinimumFontSize];
    if (minimumFontSize < v5) {
      return v5;
    }
  }
  return minimumFontSize;
}

- (BOOL)_shouldAnimateTransitionForAccessoryView:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self window];
  if (v5 && [(UITextField *)self _isAccessoryViewAnimatable:v4])
  {
    double v6 = [(UIView *)self traitCollection];
    BOOL v7 = [v6 userInterfaceIdiom] != 6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_setAttributedText:(id)a3 setCaretSelectionAfterText:(BOOL)a4
{
  BOOL v4 = a4;
  *(void *)&self->_textFieldFlags |= 0x20000uLL;
  double v6 = (void *)[a3 mutableCopy];
  BOOL v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1ED0E84C0];
  }
  id v13 = v8;

  BOOL v9 = [v13 mutableString];
  [(UITextField *)self sanitizeAttributedText:v13];
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    [(UITextField *)self _setAttributedTextOnFieldEditor:v13 setCaretSelectionAfterText:v4];
  }
  else
  {
    double v10 = self->_textStorage;
    uint64_t v11 = [(UITextField *)self _rangeForSetText];
    -[NSConcreteTextStorage replaceCharactersInRange:withAttributedString:](v10, "replaceCharactersInRange:withAttributedString:", v11, v12, v13);
    [(_UICascadingTextStorage *)v10 _restoreOriginalFontAttribute];
    [(_UICascadingTextStorage *)v10 setLineBreakMode:[(UITextField *)self nonEditingLinebreakMode]];
  }
  [(UITextField *)self finishedSettingTextOrAttributedText];
}

- (void)_setTextInRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v7 = (__CFString *)a4;
  *(void *)&self->_textFieldFlags &= ~0x20000uLL;
  double v16 = v7;
  if (v7)
  {
    BOOL v8 = [(UITextField *)self _textNeedsSanitizing:v7];
    BOOL v9 = v16;
    if (!v8)
    {
      double v10 = v16;
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v9 = &stru_1ED0E84C0;
  }
  double v10 = (__CFString *)[(__CFString *)v9 mutableCopy];
  [(UITextField *)self _sanitizeText:v10];
LABEL_6:
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if ((*(_WORD *)&textFieldFlags & 0x100) != 0)
  {
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(unint64_t *)&textFieldFlags | 0x8000);
    double v15 = [(UITextField *)self _fieldEditor];
    objc_msgSend(v15, "setTextInRange:replacementText:", location, length, v10);

    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFF7FFFLL | (((*(unint64_t *)&textFieldFlags >> 15) & 1) << 15));
  }
  else if ([(__CFString *)v10 length] | length)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v13 = [(_UICascadingTextStorage *)self->_textStorage defaultAttributes];
    uint64_t v14 = (void *)[v12 initWithString:v10 attributes:v13];

    -[NSConcreteTextStorage replaceCharactersInRange:withAttributedString:](self->_textStorage, "replaceCharactersInRange:withAttributedString:", location, length, v14);
  }
  [(UITextField *)self finishedSettingTextOrAttributedText];
}

- (void)finishedSettingTextOrAttributedText
{
  [(UITextField *)self setNeedsLayout];
  [(UITextField *)self _invalidateDefaultFullFontSize];
  [(UIView *)self invalidateIntrinsicContentSize];
  if ([(UITextField *)self _shouldObscureInput])
  {
    [(UITextField *)self _forceObscureAllText];
  }
  else
  {
    id v3 = [(UITextField *)self _fieldEditor];
    [v3 _unobscureAllText];
  }
}

- (void)_invalidateDefaultFullFontSize
{
  if ([(UITextField *)self adjustsFontSizeToFitWidth]
    && [(_UIFullFontSize *)self->_fullFontSize setNeedsEvaluation])
  {
    [(UITextField *)self setNeedsLayout];
    [(UIView *)self _invalidateBaselineConstraints];
  }
}

- (void)setText:(NSString *)text
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  BOOL v7 = text;
  if ((*(void *)&textFieldFlags & 0x800000000) != 0) {
    uint64_t v5 = [(UITextField *)self _rangeForClearButton];
  }
  else {
    uint64_t v5 = [(UITextField *)self _rangeForSetText];
  }
  -[UITextField _setTextInRange:replacementText:](self, "_setTextInRange:replacementText:", v5, v6, v7);
}

- (BOOL)_textNeedsSanitizing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextField *)self textInputTraits];
  uint64_t v6 = [v5 textTrimmingSet];

  if (v6 && [v4 rangeOfCharacterFromSet:v6] != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\r\n\uFFFC"];
    BOOL v8 = [v4 rangeOfCharacterFromSet:v7] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (_NSRange)_rangeForSetText
{
  NSUInteger v2 = [(NSConcreteTextStorage *)self->_textStorage length];
  NSUInteger v3 = 0;
  result.NSUInteger length = v2;
  result.NSUInteger location = v3;
  return result;
}

void __37__UITextField__invalidateDefaultFont__block_invoke(uint64_t a1)
{
  NSUInteger v2 = [*(id *)(a1 + 32) defaultTextAttributes];
  id v4 = (id)[v2 mutableCopy];

  NSUInteger v3 = [*(id *)(a1 + 32) _defaultFont];
  [v4 setObject:v3 forKeyedSubscript:*(void *)off_1E52D2040];

  [*(id *)(a1 + 32) setDefaultTextAttributes:v4];
}

void __55__UITextField__initWithFrame_textLayoutManagerEnabled___block_invoke(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  NSUInteger v2 = [*(id *)(*(void *)(a1 + 32) + 816) textColor];
  [v4 setObject:v2 forKeyedSubscript:*(void *)off_1E52D2048];

  NSUInteger v3 = [*(id *)(a1 + 32) _defaultFont];
  [v4 setObject:v3 forKeyedSubscript:*(void *)off_1E52D2040];

  [*(id *)(a1 + 32) setDefaultTextAttributes:v4];
  if ([(id)objc_opt_class() _wantsFadedEdges]) {
    [*(id *)(a1 + 32) setNonEditingLinebreakMode:2];
  }
}

- (id)_defaultFont
{
  NSUInteger v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 5)
  {
    if ([(UITextField *)self controlSize] == 1) {
      [off_1E52D39B8 smallSystemFontSize];
    }
    else {
      [off_1E52D39B8 defaultFontSize];
    }
    uint64_t v5 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)setNonEditingLinebreakMode:(int64_t)a3
{
}

- (NSDictionary)defaultTextAttributes
{
  return [(_UICascadingTextStorage *)self->_textStorage defaultAttributes];
}

- (void)sanitizeAttributedText:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 mutableString];
  [(UITextField *)self _sanitizeText:v4];

  +[_NSAttributedStringIntentResolver resolveAttributedString:inRange:](_UIAttributedStringIntentResolver, "resolveAttributedString:inRange:", v5, 0, [v5 length]);
}

- (void)_sanitizeText:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(UITextField *)self textInputTraits];
  objc_msgSend(v6, "_removeCharactersFromSet:", objc_msgSend(v4, "textTrimmingSet"));

  if (![(UITextField *)self allowsAttachments])
  {
    id v5 = [NSString _stringWithUnichar:65532];
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", v5, &stru_1ED0E84C0, 2, 0, objc_msgSend(v6, "length"));
  }
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"\r\n", @"\n", 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"\r", @"\n", 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"\n", @" ", 2, 0, objc_msgSend(v6, "length"));
}

- (BOOL)allowsAttachments
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 3) >> 2) & 1;
}

- (int64_t)nonEditingLinebreakMode
{
  return [(_UICascadingTextStorage *)self->_textStorage lineBreakMode];
}

- (BOOL)_implementsEditMenu
{
  NSUInteger v2 = [(UITextField *)self delegate];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)_initTextLayoutController
{
  if ((*((unsigned char *)&self->_textFieldFlags + 4) & 0x10) != 0)
  {
    id v13 = [[_UIObscurableTextContentStorage alloc] initWithTextStorage:self->_textStorage];
    id v6 = objc_opt_new();
    BOOL v7 = [[_UITextKit2LayoutController alloc] initWithTextView:0 textContentStorage:v13 textContainer:v6];
    textLayoutController = self->_textLayoutController;
    self->_textLayoutController = (_UITextLayoutController *)v7;

    BOOL v9 = [(_UITextLayoutController *)self->_textLayoutController firstTextContainer];
    textContainer = self->_textContainer;
    self->_textContainer = v9;

    uint64_t v11 = [(NSTextContainer *)self->_textContainer textLayoutManager];
    [v11 setUsesFontLeading:0];

    id v12 = [(NSTextContainer *)self->_textContainer textLayoutManager];
    [v12 setLimitsLayoutForSuspiciousContents:1];
  }
  else
  {
    char v3 = (NSTextContainer *)objc_alloc_init((Class)off_1E52D2EB8);
    uint64_t v4 = self->_textContainer;
    self->_textContainer = v3;

    id v13 = objc_alloc_init(_UIFieldEditorLayoutManager);
    [(_UIObscurableTextContentStorage *)v13 setUsesFontLeading:0];
    if (dyld_program_sdk_at_least()) {
      [(_UIObscurableTextContentStorage *)v13 setLimitsLayoutForSuspiciousContents:1];
    }
    [(_UICascadingTextStorage *)self->_textStorage addLayoutManager:v13];
    [(_UIObscurableTextContentStorage *)v13 addTextContainer:self->_textContainer];
    id v5 = -[_UITextKit1LayoutController initWithTextView:textContainer:]((id *)[_UITextKit1LayoutController alloc], 0, self->_textContainer);
    id v6 = self->_textLayoutController;
    self->_textLayoutController = (_UITextLayoutController *)v5;
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITextField;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11) {
    [(UITextField *)self _sizeChanged:height != v11];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)UITextField;
  -[UIView setFrame:](&v14, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UITextField *)self _sizeChanged:height != v11];
    objc_super v13 = +[UIKeyboardImpl activeInstance];
    [v13 textFrameChanged:self];
  }
}

- (void)_setForegroundViewsAlpha:(double)a3
{
  self->_foregroundViewsAlpha = a3;
  -[UIView setAlpha:](self->_iconView, "setAlpha:");
  id v5 = [(UITextField *)self leftView];
  [(UITextField *)self _maximumAlphaForLeadingView];
  [v5 setAlpha:v6 * a3];

  BOOL v7 = [(UITextField *)self rightView];
  [v7 setAlpha:a3];

  double v8 = [(UITextField *)self _clearButton];
  [v8 setAlpha:a3];

  [(_UITextCanvas *)self->_textCanvasView setAlpha:a3];
  placeholderLabel = self->_placeholderLabel;
  [(UITextField *)self _placeholderLabelAlphaForForegroundViewsAlpha:a3];
  -[UIView setAlpha:](placeholderLabel, "setAlpha:");
}

- (id)clearButton
{
  clearButton = self->_clearButton;
  if (!clearButton)
  {
    [(UITextField *)self clearButtonRect];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(UIView *)self traitCollection];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (v13 != 6)
    {
      float v19 = -[UIButton initWithFrame:]([_UITextFieldClearButton alloc], "initWithFrame:", v5, v7, v9, v11);
      double v20 = self->_clearButton;
      self->_clearButton = v19;

      [(_UITextFieldClearButton *)self->_clearButton setImageProvider:self];
LABEL_10:
      [(UIControl *)self->_clearButton addTarget:self action:sel__clearButtonClicked_ forControlEvents:64];
      [(UIView *)self->_clearButton setOpaque:0];
      [(UIView *)self->_clearButton setBackgroundColor:0];
      if (v9 + -44.0 <= 0.0) {
        double v24 = (v9 + -44.0) * 0.5;
      }
      else {
        double v24 = 0.0;
      }
      if (v11 + -44.0 <= 0.0) {
        double v25 = (v11 + -44.0) * 0.5;
      }
      else {
        double v25 = 0.0;
      }
      -[UIView _setTouchInsets:](self->_clearButton, "_setTouchInsets:", v25, v24, v25, v24);
      clearButton = self->_clearButton;
      goto LABEL_17;
    }
    objc_super v14 = +[UIButtonConfiguration filledButtonConfiguration];
    [v14 setButtonSize:1];
    double v15 = [(UITextField *)self _clearButtonImageForState:0];
    [v14 setImage:v15];

    double v16 = [(UIView *)self traitCollection];
    float v17 = [v16 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v17))
    {
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v17, &cfstr_Uictcontentsiz_11.isa) != NSOrderedAscending)
      {
        uint64_t v18 = 1;
LABEL_9:

        double v21 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleFootnote" scale:v18];
        [v14 setPreferredSymbolConfigurationForImage:v21];

        double v22 = +[UIButton buttonWithConfiguration:v14 primaryAction:0];
        id v23 = self->_clearButton;
        self->_clearButton = v22;

        goto LABEL_10;
      }
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v17, &cfstr_Uictcontentsiz_9.isa);
    }
    uint64_t v18 = 2;
    goto LABEL_9;
  }
LABEL_17:
  return clearButton;
}

- (UIView)rightView
{
  uint64_t v2 = 7;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0) {
    uint64_t v2 = 8;
  }
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR___UITextField__fieldEditor[v2]));
}

- (UIView)leftView
{
  uint64_t v2 = 8;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0) {
    uint64_t v2 = 7;
  }
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR___UITextField__fieldEditor[v2]));
}

- (double)_maximumAlphaForLeadingView
{
  return 1.0;
}

- (void)_sizeChanged:(BOOL)a3
{
  if (a3)
  {
    self->_firstBaselineOffsetFromTop = 0.0;
    self->_lastBaselineOffsetFromBottom = 0.0;
    if ((*(void *)&self->super.super._viewFlags & 0x400000000000000) != 0)
    {
      if (!self->_didInvalidateBaselineConstraintsOnHeightChange
        || ([(UIView *)self bounds],
            double Height = CGRectGetHeight(v10),
            [(UIView *)self _calculatedIntrinsicHeight],
            Height == v5))
      {
        self->_didInvalidateBaselineConstraintsOnHeightChange = 1;
        [(UIView *)self _invalidateBaselineConstraints];
      }
    }
    if ((*(unsigned char *)&self->_textFieldFlags & 1) != 0
      || [(UIControl *)self contentVerticalAlignment] == UIControlContentVerticalAlignmentCenter
      || [(UIControl *)self contentVerticalAlignment] == UIControlContentVerticalAlignmentBottom)
    {
      [(UITextField *)self _setNeedsStyleRecalc];
    }
  }
  double v6 = [(UITextField *)self interactionAssistant];
  double v7 = [v6 _selectionView];
  [v7 updateSelectionRects];

  [(UILabel *)self->_placeholderLabel setNeedsDisplay];
  [(_UITextCanvas *)self->_textCanvasView setNeedsDisplay];
  backgroundProvider = self->_backgroundProvider;
  [(_UITextFieldBackgroundProvider *)backgroundProvider setNeedsDisplay];
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder
{
  double v5 = attributedPlaceholder;
  if (self->_overriddenPlaceholder) {
    objc_storeStrong((id *)&self->_overriddenPlaceholder, attributedPlaceholder);
  }
  else {
    -[UITextField _setAttributedPlaceholder:](self, "_setAttributedPlaceholder:");
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    if (!self->_textDragDropSupport)
    {
      double v5 = +[UITextDragDropSupport installTextDragDropOnView:self];
      textDragDropSupport = self->_textDragDropSupport;
      self->_textDragDropSupport = v5;
    }
    [(UITextField *)self _createInteractionAssistant];
    double v7 = [v8 _focusSystem];

    if (v7) {
      [(UITextField *)self _installSelectGestureRecognizer];
    }
    else {
      [(UITextField *)self _uninstallSelectGestureRecognizer];
    }
    id v4 = v8;
  }
}

- (void)_createInteractionAssistant
{
  if (!self->_interactionAssistant)
  {
    char v3 = [[UITextInteractionAssistant alloc] initWithView:self];
    interactionAssistant = self->_interactionAssistant;
    self->_interactionAssistant = v3;
  }
}

- (void)_setAttributedPlaceholder:(id)a3
{
  id v8 = a3;
  if ([v8 length]) {
    [(UITextField *)self createPlaceholderIfNecessary];
  }
  if ([v8 length]
    || ([(UILabel *)self->_placeholderLabel attributedText],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5))
  {
    double v6 = [(UILabel *)self->_placeholderLabel attributedText];
    char v7 = [v8 isEqualToAttributedString:v6];

    if ((v7 & 1) == 0)
    {
      [(UILabel *)self->_placeholderLabel setAttributedText:v8];
      [(UITextField *)self finishedSettingPlaceholder];
    }
  }
}

- (void)setPlaceholder:(NSString *)placeholder
{
  if (self->_overriddenPlaceholder)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28B18];
    uint64_t v5 = placeholder;
    id v6 = [v4 alloc];
    if (v5) {
      char v7 = (__CFString *)v5;
    }
    else {
      char v7 = &stru_1ED0E84C0;
    }
    id v8 = (NSAttributedString *)[v6 initWithString:v7];

    overriddenPlaceholder = self->_overriddenPlaceholder;
    self->_overriddenPlaceholder = v8;
  }
  else
  {
    CGRect v10 = placeholder;
    [(UITextField *)self _setPlaceholder:v10];
    overriddenPlaceholder = (NSAttributedString *)v10;
  }
}

- (void)_setPlaceholder:(id)a3
{
  id v8 = a3;
  if ([v8 length]) {
    [(UITextField *)self createPlaceholderIfNecessary];
  }
  if ([v8 length]
    || ([(UILabel *)self->_placeholderLabel text],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5))
  {
    id v6 = [(UILabel *)self->_placeholderLabel text];
    char v7 = [v8 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      [(UILabel *)self->_placeholderLabel setText:v8];
      [(UITextField *)self finishedSettingPlaceholder];
    }
  }
}

- (void)createPlaceholderIfNecessary
{
  if (!self->_placeholderLabel)
  {
    char v3 = self->_textStorage;
    id v6 = [(_UICascadingTextStorage *)v3 font];
    id v4 = [(UITextField *)self createPlaceholderLabelWithFont:v6 andTextAlignment:[(_UICascadingTextStorage *)v3 textAlignment]];
    placeholderLabel = self->_placeholderLabel;
    self->_placeholderLabel = v4;
  }
}

- (void)finishedSettingPlaceholder
{
  [(UITextField *)self setNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITextField;
  [(UIControl *)&v13 _didMoveFromWindow:v6 toWindow:v7];
  if (v7 && dyld_program_sdk_at_least())
  {
    id v8 = [v7 traitCollection];
    uint64_t v9 = [v8 userInterfaceIdiom];
    CGRect v10 = [v6 traitCollection];
    if (v9 == [v10 userInterfaceIdiom])
    {
    }
    else
    {
      double v11 = [v7 traitCollection];
      uint64_t v12 = [v11 userInterfaceIdiom];

      if (v12 == 3) {
        [(UITextField *)self _adjustFontForAccessibilityTraits:1];
      }
    }
  }
}

- (void)_propagateCuiProperties
{
  fieldEditor = self->_fieldEditor;
  if (fieldEditor) {
    [(UIFieldEditor *)fieldEditor _updateLayoutManagerStyleEffectConfiguration];
  }
  if (self->_placeholderLabel)
  {
    id v4 = [(UITextField *)self _cuiCatalog];
    [(UILabel *)self->_placeholderLabel _setCuiCatalog:v4];

    uint64_t v5 = [(UITextField *)self _cuiStyleEffectConfiguration];
    [(UILabel *)self->_placeholderLabel _setCuiStyleEffectConfiguration:v5];
  }
  if (self->_suffixLabel)
  {
    id v6 = [(UITextField *)self _cuiCatalog];
    [(UILabel *)self->_suffixLabel _setCuiCatalog:v6];

    id v7 = [(UITextField *)self _cuiStyleEffectConfiguration];
    [(UILabel *)self->_suffixLabel _setCuiStyleEffectConfiguration:v7];
  }
  if (self->_prefixLabel)
  {
    id v8 = [(UITextField *)self _cuiCatalog];
    [(UILabel *)self->_prefixLabel _setCuiCatalog:v8];

    uint64_t v9 = [(UITextField *)self _cuiStyleEffectConfiguration];
    [(UILabel *)self->_prefixLabel _setCuiStyleEffectConfiguration:v9];
  }
  if (self->_label)
  {
    CGRect v10 = [(UITextField *)self _cuiCatalog];
    [(UILabel *)self->_label _setCuiCatalog:v10];

    id v11 = [(UITextField *)self _cuiStyleEffectConfiguration];
    [(UILabel *)self->_label _setCuiStyleEffectConfiguration:v11];
  }
}

- (id)createPlaceholderLabelWithFont:(id)a3 andTextAlignment:(int64_t)a4
{
  id v5 = objc_alloc([(UITextField *)self _placeholderLabelClass]);
  id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v7 = [(UITextField *)self _placeholderColor];
  [v6 setTextColor:v7];

  [v6 setOpaque:0];
  [v6 setBackgroundColor:0];
  id v8 = [(_UICascadingTextStorage *)self->_textStorage font];
  [v6 setFont:v8];

  objc_msgSend(v6, "setTextAlignment:", -[_UICascadingTextStorage textAlignment](self->_textStorage, "textAlignment"));
  objc_msgSend(v6, "_setOverrideUserInterfaceRenderingMode:", -[UITextField _preferredRenderingModeForPlaceholder](self, "_preferredRenderingModeForPlaceholder"));
  uint64_t v9 = [(UITextField *)self _cuiCatalog];
  [v6 _setCuiCatalog:v9];

  CGRect v10 = [(UITextField *)self _cuiStyleEffectConfiguration];
  [v6 _setCuiStyleEffectConfiguration:v10];

  return v6;
}

- (CUIStyleEffectConfiguration)_cuiStyleEffectConfiguration
{
  return self->_cuiStyleEffectConfiguration;
}

- (CUICatalog)_cuiCatalog
{
  return self->_cuiCatalog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_textDropDelegate);
  objc_destroyWeak((id *)&self->_textDragDelegate);
  objc_storeStrong((id *)&self->_tvCustomFocusedTextColor, 0);
  objc_storeStrong((id *)&self->_tvCustomTextColor, 0);
  objc_destroyWeak((id *)&self->_pasteDelegate);
  objc_storeStrong((id *)&self->_selectionContainerView, 0);
  objc_storeStrong((id *)&self->_cuiStyleEffectConfiguration, 0);
  objc_storeStrong((id *)&self->_cuiCatalog, 0);
  objc_storeStrong((id *)&self->_textCanvasView, 0);
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_backgroundProvider, 0);
  objc_storeStrong((id *)&self->_draggableGeometry, 0);
  objc_storeStrong((id *)&self->_textDragDropSupport, 0);
  objc_storeStrong((id *)&self->_inputAssistantItem, 0);
  objc_storeStrong((id *)&self->_recentsAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_linkTextAttributes, 0);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_fieldEditor, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactionAssistant, 0);
  objc_storeStrong((id *)&self->_overriddenPlaceholder, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_prefixLabel, 0);
  objc_storeStrong((id *)&self->_suffixLabel, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_contentBackdropView, 0);
  objc_storeStrong((id *)&self->_floatingContainerView, 0);
  objc_storeStrong((id *)&self->_cachedDefaultClearButtonImages, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_fullFontSize, 0);
  objc_storeStrong((id *)&self->_nonAtomTraits, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_backgroundCoverView, 0);
  objc_storeStrong((id *)&self->_contentCoverView, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_disabledBackground, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_destroyWeak(&self->_delegate);
}

- (void)dealloc
{
  v7[3] = *MEMORY[0x1E4F143B8];
  [(UITextField *)self _stopObservingFieldEditorScroll];
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v7[0] = @"UIKeyboardDidShowNotification";
  v7[1] = @"UIAccessibilityReduceTransparencyStatusDidChangeNotification";
  v7[2] = @"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  interactionAssistant = self->_interactionAssistant;
  self->_interactionAssistant = 0;

  [(UITextField *)self setInputView:0];
  [(UITextField *)self setInputAccessoryView:0];
  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  [(UIView *)&v6 dealloc];
}

- (void)setInputView:(UIView *)inputView
{
}

- (void)setInputAccessoryView:(UIView *)inputAccessoryView
{
  id v5 = inputAccessoryView;
  if (self->_inputAccessoryView != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_inputAccessoryView, inputAccessoryView);
    id v5 = v6;
  }
}

- (void)_stopObservingFieldEditorScroll
{
  fieldEditor = self->_fieldEditor;
  if (fieldEditor)
  {
    id v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = fieldEditor;
    id v6 = [v4 defaultCenter];
    [v6 removeObserver:self name:@"UITextSelectionDidScroll" object:v5];
  }
}

- (int64_t)textDragOptions
{
  return self->_textDragOptions;
}

- (id)_textGeometry
{
  draggableGeometrdouble y = self->_draggableGeometry;
  if (!draggableGeometry)
  {
    id v4 = [[_UITextStorageDraggableGeometry alloc] initWithView:self textStorage:self->_textStorage];
    id v5 = self->_draggableGeometry;
    self->_draggableGeometrdouble y = v4;

    draggableGeometrdouble y = self->_draggableGeometry;
  }
  return draggableGeometry;
}

- (CGRect)_selectionClipRect
{
  if ((*((unsigned char *)&self->_textFieldFlags + 1) & 1) != 0
    && [(UITextField *)self _tvHasFloatingFieldEditor])
  {
    char v3 = [(UITextField *)self _fieldEditor];
    [v3 _selectionClipRect];
  }
  else
  {
    [(UIView *)self bounds];
    -[UITextField editingRectForBounds:](self, "editingRectForBounds:");
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    char v3 = [(UITextField *)self textInputView];
    objc_msgSend(v3, "convertRect:fromView:", self, v9, v11, v13, v15);
  }
  double v16 = v4;
  double v17 = v5;
  double v18 = v6;
  double v19 = v7;

  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", 1, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)selectionContainerView
{
  selectionContainerView = self->_selectionContainerView;
  if (!selectionContainerView)
  {
    double v4 = [_UITouchPassthroughView alloc];
    double v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_selectionContainerView;
    self->_selectionContainerView = v5;

    [(UITextField *)self _ensureSelectionContainerViewSubviewOrdering];
    selectionContainerView = self->_selectionContainerView;
  }
  return selectionContainerView;
}

- (UIView)textInputView
{
  textCanvasView = [(UIFieldEditor *)self->_fieldEditor textInputView];
  double v4 = textCanvasView;
  if (!textCanvasView) {
    textCanvasView = self->_textCanvasView;
  }
  double v5 = textCanvasView;

  return v5;
}

- (UITextRange)selectedTextRange
{
  uint64_t v2 = [(UITextField *)self _fieldEditor];
  double v3 = [v2 selectedTextRange];

  return (UITextRange *)v3;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextField *)self _fieldEditor];
  [v5 caretRectForPosition:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[UITextField adjustedCaretRectForCaretRect:](self, "adjustedCaretRectForCaretRect:", v7, v9, v11, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)adjustedCaretRectForCaretRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UILabel *)self->_placeholderLabel textAlignment] == NSTextAlignmentCenter
    && ![(UITextField *)self _hasContent])
  {
    double v8 = [(UILabel *)self->_placeholderLabel text];
    if (![v8 length])
    {
LABEL_8:

      goto LABEL_9;
    }
    double v9 = [(UIView *)self->_placeholderLabel superview];

    if (v9)
    {
      placeholderLabel = self->_placeholderLabel;
      double v11 = [(UITextField *)self textInputView];
      -[UIView convertRect:fromView:](placeholderLabel, "convertRect:fromView:", v11, x, y, width, height);
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      [(UIView *)self->_placeholderLabel bounds];
      double v19 = v18;
      double v21 = v20;
      -[UILabel textRectForBounds:](self->_placeholderLabel, "textRectForBounds:");
      double v23 = v22;
      double v24 = round(v19 + (v21 - v22) * 0.5);
      double v25 = [(UILabel *)self->_placeholderLabel text];
      LODWORD(v11) = [v25 _isNaturallyRTL];

      double v26 = -v15;
      if (v11) {
        double v26 = v23;
      }
      double v27 = v26 + v24;
      unsigned int v28 = self->_placeholderLabel;
      double v8 = [(UITextField *)self textInputView];
      -[UIView convertRect:toView:](v28, "convertRect:toView:", v8, v27, v13, v15, v17);
      double x = v29;
      double y = v30;
      double width = v31;
      double height = v32;
      goto LABEL_8;
    }
  }
LABEL_9:
  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (BOOL)fieldEditorShouldExtendCaretHeight:(id)a3
{
  double v3 = [(UITextField *)self _metricsProvider];
  char v4 = [v3 shouldExtendCaretHeight];

  return v4;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextField *)self _fieldEditor];
  double v6 = [v5 selectionRectsForRange:v4];

  return v6;
}

- (BOOL)_shouldSuppressSelectionHandles
{
  return 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  [(UIView *)&v3 tintColorDidChange];
  [(UITextField *)self _updateForTintColor];
}

- (void)_updateForTintColor
{
  objc_super v3 = [(UITextField *)self textInputTraits];
  id v4 = [(UIView *)self _inheritedInteractionTintColor];
  [v3 _setColorsToMatchTintColor:v4];

  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    double v5 = [(UITextField *)self interactionAssistant];
    [v5 deactivateSelection];

    fieldEditor = self->_fieldEditor;
    double v7 = [(UIView *)self _inheritedInteractionTintColor];
    [(UIFieldEditor *)fieldEditor _setColorsToMatchTintColor:v7];

    double v8 = [(UITextField *)self interactionAssistant];
    [v8 activateSelection];
  }
  [(UITextField *)self _invalidateCachedDefaultClearButtonImages];
  if ([(UITextField *)self isEditing])
  {
    BOOL v9 = +[UIKeyboard usesInputSystemUI];
    double v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v11 = v10;
    if (v9) {
      [v10 traitCollectionDidChange];
    }
    else {
      [v10 updateRenderConfigForCurrentResponder];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self traitCollection];
  if ([v5 _focusSystemState] == 2) {
    [(UITextField *)self _installSelectGestureRecognizer];
  }
  else {
    [(UITextField *)self _uninstallSelectGestureRecognizer];
  }
  uint64_t v6 = [v4 userInterfaceIdiom];
  if (v6 == [v5 userInterfaceIdiom]) {
    [(_UITextFieldBackgroundProvider *)self->_backgroundProvider traitCollectionDidChange:v4];
  }
  else {
    [(UITextField *)self _invalidateBackgroundProvider];
  }
  if (v5 && (!v4 || v5[13] != v4[13] || v5[15] != v4[15])) {
    -[UITextField _adjustFontForAccessibilityTraits:](self, "_adjustFontForAccessibilityTraits:", [v5 legibilityWeight] != objc_msgSend(v4, "legibilityWeight"));
  }
  uint64_t v7 = [v5 userInterfaceStyle];
  if (v7 != [v4 userInterfaceStyle])
  {
    [(UITextField *)self _updateTextEffectsConfigurationIfNeeded];
    BOOL v8 = +[UIKeyboard usesInputSystemUI];
    BOOL v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v10 = v9;
    if (v8) {
      [v9 traitCollectionDidChange];
    }
    else {
      [v9 updateRenderConfigForCurrentResponder];
    }
  }
  if (_TextFieldScalesClearButton()) {
    [(UITextField *)self _invalidateCachedDefaultClearButtonImages];
  }
  [(UITextField *)self setNeedsLayout];
  v11.receiver = self;
  v11.super_class = (Class)UITextField;
  [(UIView *)&v11 traitCollectionDidChange:v4];
}

- (void)_invalidateCachedDefaultClearButtonImages
{
  [(NSMutableDictionary *)self->_cachedDefaultClearButtonImages removeAllObjects];
  objc_super v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6)
  {
    double v5 = [(UITextField *)self _clearButtonImageForState:0];
    uint64_t v6 = [(UIButton *)self->_clearButton configuration];
    [v6 setImage:v5];

    id v7 = [(UIButton *)self->_clearButton _visualProvider];
    [v7 applyConfiguration];
  }
  else
  {
    id v7 = [(UIButton *)self->_clearButton _visualProvider];
    [v7 _updateImageView];
  }
}

- (void)_uninstallSelectGestureRecognizer
{
  if (self->_selectGestureRecognizer)
  {
    -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = 0;
  }
}

- (void)_ensureSelectionContainerViewSubviewOrdering
{
  if (!self->_selectionContainerView) {
    return;
  }
  objc_super v3 = [(UITextField *)self visualStyle];
  id v9 = [v3 parentViewForTextContentView];

  uint64_t v4 = [(UITextField *)self _backgroundView];
  id v5 = [v4 superview];

  if (v5 == v9)
  {
    selectionContainerView = self->_selectionContainerView;
    BOOL v8 = [(UITextField *)self _backgroundView];
    [v9 insertSubview:selectionContainerView above:v8];
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v6 = self->_selectionContainerView;
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    BOOL v8 = [(UITextField *)self _fieldEditor];
    [v9 insertSubview:v6 below:v8];
    goto LABEL_8;
  }
  [v9 insertSubview:self->_selectionContainerView atIndex:0];
LABEL_9:
}

- (UIView)_backgroundView
{
  uint64_t v2 = self;
  objc_super v3 = v2;
  if (v2 && (*((unsigned char *)&v2->_textFieldFlags + 4) & 4) != 0) {
    backgroundProvider = v2->_backgroundProvider;
  }
  else {
    backgroundProvider = 0;
  }
  id v5 = backgroundProvider;

  uint64_t v6 = [(_UITextFieldBackgroundProvider *)v5 backgroundView];

  return (UIView *)v6;
}

- (void)_updateTextEffectsConfigurationIfNeeded
{
  if (!self->_cuiStyleEffectConfiguration) {
    return;
  }
  objc_super v3 = [(UIView *)self traitCollection];
  uint64_t v4 = -[UITraitCollection _styleEffectAppearanceName](v3);

  id v5 = [(CUIStyleEffectConfiguration *)self->_cuiStyleEffectConfiguration appearanceName];
  id v10 = v4;
  id v6 = v5;
  if (v10 == v6)
  {
  }
  else
  {
    if (v10 && v6)
    {
      char v7 = [v10 isEqual:v6];

      if (v7) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    BOOL v8 = (void *)[(CUIStyleEffectConfiguration *)self->_cuiStyleEffectConfiguration copy];
    [v8 setAppearanceName:v10];
    cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
    self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v8;

    [(UITextField *)self _propagateCuiProperties];
  }
LABEL_11:
}

- (void)setTextColor:(UIColor *)textColor
{
  self->_disableTextColorUpdateOnTraitCollectionChange = textColor != 0;
  -[UITextField _setTextColor:](self, "_setTextColor:");
}

- (void)_updateLabelAppearance
{
  if (*((unsigned char *)&self->_textFieldFlags + 1)) {
    [(UITextField *)self _syncTypingAttributesWithDefaultAttribute:*(void *)off_1E52D2048];
  }
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  id v6 = [(UITextField *)self textInputTraits];
  BOOL v5 = [(UITextField *)self _isPasscodeStyle];
  if ([v6 keyboardAppearance] != a3)
  {
    [v6 setKeyboardAppearance:a3];
    [(UITextField *)self _noteThatKeyboardAppearanceHasChanged];
    [(UITextField *)self _invalidatePasscodeStyleFromStyle:v5];
  }
}

- (void)_noteThatKeyboardAppearanceHasChanged
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__notifySystemKeyboardOfAppearanceChange object:0];
  [(UITextField *)self performSelector:sel__notifySystemKeyboardOfAppearanceChange withObject:0 afterDelay:0.0];
}

- (void)_invalidatePasscodeStyleFromStyle:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UITextField *)self _isPasscodeStyle];
  if (v3 || !v5)
  {
    if (!v3 || v5) {
      return;
    }
    double v13 = [(_UICascadingTextStorage *)self->_textStorage defaultAttributes];
    id v14 = (id)[v13 mutableCopy];

    [v14 removeObjectForKey:*(void *)off_1E52D20C8];
    [(_UICascadingTextStorage *)self->_textStorage setDefaultAttributes:v14];
    [(UITextField *)self setTextColor:0];
    [(UITextField *)self _invalidateBackgroundProvider];
    [(UITextField *)self setNeedsLayout];
  }
  else
  {
    id v6 = +[UIDevice currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    double v8 = 16.0;
    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      double v8 = 18.0;
      id v9 = &unk_1ED3F2808;
    }
    else
    {
      id v9 = &unk_1ED3F2818;
    }
    id v14 = [off_1E52D39B8 systemFontOfSize:v8];
    id v10 = [(_UICascadingTextStorage *)self->_textStorage defaultAttributes];
    objc_super v11 = (void *)[v10 mutableCopy];

    [v11 setObject:v9 forKey:*(void *)off_1E52D20C8];
    [(_UICascadingTextStorage *)self->_textStorage setDefaultAttributes:v11];
    [(_UICascadingTextStorage *)self->_textStorage setFont:v14];
    [(UITextField *)self setContentVerticalAlignment:0];
    double v12 = +[UIColor whiteColor];
    [(UITextField *)self setTextColor:v12];

    [(UITextField *)self _invalidateBackgroundProvider];
    [(UITextField *)self setNeedsLayout];
  }
}

- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UITextField;
  BOOL v5 = -[UIControl initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    uint64_t v6 = +[_UITextFieldVisualStyle inferredVisualStyleWithStyleSubject:v5];
    visualStyle = v5->_visualStyle;
    v5->_visualStyle = (_UITextFieldVisualStyle *)v6;

    [(UITextField *)v5 _setupDefaultStyleEffectConfiguration];
    v5->_preferredBorderStyle = 0;
    v5->_double preferredBackgroundCornerRadius = 5.0;
    [(UITextField *)v5 _invalidateBackgroundProviderForced:1];
    v5->_tvUseVibrancdouble y = 1;
    [(UIView *)v5 setOpaque:0];
    [(UITextField *)v5 _clearButtonPadX];
    v5->_clearButtonOffset.double width = v8;
    v5->_clearButtonOffset.double height = 1.0;
    uint64_t v9 = 32;
    if (v4) {
      uint64_t v9 = 0x1000000020;
    }
    v5->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&v5->_textFieldFlags & 0xFFFFFFEFFFFFFFFFLL | v9);
    [(UIControl *)v5 setContentHorizontalAlignment:1];
    [(UITextField *)v5 setContentVerticalAlignment:0];
    *(void *)&v5->_textFieldFlags |= 0x100000000000uLL;
    id v10 = +[_UIFullFontSize defaultValue];
    [(UITextField *)v5 _setFullFontSize:v10];

    [(UITextField *)v5 _initTextStorage];
    [(UITextField *)v5 _initTextLayoutController];
    [(UITextField *)v5 _initTextCanvasView];
    v5->_foregroundViewsAlpha = 1.0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__UITextField__initWithFrame_textLayoutManagerEnabled___block_invoke;
    v15[3] = &unk_1E52D9F70;
    objc_super v11 = v5;
    double v16 = v11;
    +[UIView _performSystemAppearanceModifications:v15];

    LODWORD(v10) = dyld_program_sdk_at_least();
    double v12 = [(UITextField *)v11 _contentView];
    [v12 setClipsToBounds:v10 ^ 1];

    [off_1E52D39B8 systemMinimumFontSize];
    v11->_double minimumFontSize = v13;
    *(void *)&v5->_textFieldFlags |= 0x10000000uLL;
    [(UITextField *)v11 _detectCustomDrawing];
    [(UITextField *)v11 _initIncreasedContrastNotifications];
    [(UIControl *)v11 setSymbolAnimationEnabled:1];
  }
  return v5;
}

- (void)_invalidateBackgroundProviderForced:(BOOL)a3
{
  BOOL v5 = [(UITextField *)self _preferredBackgroundProviderClass];
  if (a3
    || ([(UITextField *)self _backgroundProvider],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        v6,
        v5 != (objc_class *)v7))
  {
    CGFloat v8 = objc_opt_new();
    if (v8)
    {
      [(UITextField *)self _setBackgroundProvider:v8];
    }
    else
    {
      uint64_t v9 = objc_opt_new();
      [(UITextField *)self _setBackgroundProvider:v9];
    }
  }
  [(UITextField *)self _invalidateMetricsProvider];
}

- (Class)_preferredBackgroundProviderClass
{
  BOOL v4 = [(UIView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 5) {
    goto LABEL_5;
  }
  uint64_t v6 = [(UIView *)self traitCollection];
  if ([v6 userInterfaceIdiom] == 2)
  {

LABEL_5:
    uint64_t v9 = objc_opt_class();
    goto LABEL_6;
  }
  uint64_t v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 8 || [(UITextField *)self _isPasscodeStyle]) {
    goto LABEL_5;
  }
  switch(self->_preferredBorderStyle)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      goto LABEL_5;
    default:
      objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
      double v12 = v11;
      unint64_t preferredBorderStyle = self->_preferredBorderStyle;
      if (preferredBorderStyle > 3) {
        id v14 = 0;
      }
      else {
        id v14 = off_1E530B4D0[preferredBorderStyle];
      }
      [v11 handleFailureInMethod:a2, self, @"UITextField.m", 5157, @"No background provider for border style %@.", v14 object file lineNumber description];

      uint64_t v9 = 0;
      break;
  }
LABEL_6:
  if (self->_background && ([v9 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
    uint64_t v9 = objc_opt_class();
  }
  return (Class)v9;
}

- (void)_setBackgroundProvider:(id)a3
{
  id v4 = a3;
  backgroundProvider = self->_backgroundProvider;
  uint64_t v6 = (_UITextFieldBackgroundProvider *)v4;
  uint64_t v7 = backgroundProvider;
  if (v7 == v6)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6 && v7)
    {
      BOOL v9 = [(_UITextFieldBackgroundProvider *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    objc_super v17 = __38__UITextField__setBackgroundProvider___block_invoke;
    double v18 = &unk_1E52D9F98;
    double v19 = self;
    double v20 = v6;
    id v10 = (void (**)(void))_Block_copy(&v15);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      +[UIView transitionWithView:self duration:5242880 options:v10 animations:0 completion:0.35];
    }
    else
    {
      v10[2](v10);
    }
    char v11 = objc_opt_respondsToSelector();
    uint64_t v12 = 0x200000000;
    if ((v11 & 1) == 0) {
      uint64_t v12 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFDFFFFFFFFLL | v12);
    char v13 = objc_opt_respondsToSelector();
    uint64_t v14 = 0x400000000;
    if ((v13 & 1) == 0) {
      uint64_t v14 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFBFFFFFFFFLL | v14);
    [(_UITextFieldBackgroundProvider *)self->_backgroundProvider setNeedsDisplay];
  }
LABEL_16:
}

void __38__UITextField__setBackgroundProvider___block_invoke(uint64_t a1)
{
  id v5 = *(id *)(*(void *)(a1 + 32) + 936);
  int v2 = [v5 drawsContent];
  int v3 = v2 ^ [*(id *)(a1 + 40) drawsContent];
  if (v3 == 1)
  {
    id v4 = [*(id *)(a1 + 32) _backgroundColor];
  }
  else
  {
    id v4 = 0;
  }
  [*(id *)(a1 + 32) _backgroundProviderWillChange:*(void *)(a1 + 40)];
  [v5 removeFromTextField];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 936), *(id *)(a1 + 40));
  if (v3) {
    [*(id *)(a1 + 32) _setBackgroundColor:v4];
  }
  [*(id *)(a1 + 40) addToTextField:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) _backgroundProviderDidChange];
}

- (void)_invalidateMetricsProvider
{
  uint64_t v3 = [(UITextField *)self _preferredMetricsProvider];
  id v5 = (id)v3;
  if (v3)
  {
    [(UITextField *)self _setMetricsProvider:v3];
  }
  else
  {
    id v4 = objc_opt_new();
    [(UITextField *)self _setMetricsProvider:v4];
  }
}

- (void)_setMetricsProvider:(id)a3
{
  id v5 = (_UITextFieldBackgroundProvider *)a3;
  backgroundProvider = self->_backgroundProvider;
  metricsProvider = self->_metricsProvider;
  id v10 = v5;
  uint64_t v8 = metricsProvider;
  if (v8 == (_UITextFieldMetricsProvider *)v10)
  {

    goto LABEL_7;
  }
  if (v10 && v8)
  {
    BOOL v9 = [(_UITextFieldBackgroundProvider *)v10 isEqual:v8];

    if (!v9) {
      goto LABEL_10;
    }
LABEL_7:
    if (backgroundProvider != v5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

LABEL_10:
  [(UITextField *)self _metricsProviderWillChange:v10];
  objc_storeStrong((id *)&self->_metricsProvider, a3);
  [(UITextField *)self _metricsProviderDidChange];
LABEL_11:
  [(UITextField *)self _setNeedsStyleRecalc];
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self _invalidateBaselineConstraints];
LABEL_12:
}

- (id)_preferredMetricsProvider
{
  id v4 = [(UITextField *)self _backgroundProvider];
  id v5 = [v4 preferredMetricsProvider];

  if (!v5)
  {
    switch(self->_preferredBorderStyle)
    {
      case 0:
        uint64_t v6 = objc_opt_new();
        goto LABEL_7;
      case 1:
        uint64_t v6 = +[_UITextFieldLineBackgroundProvider lineStyleMetricsProvider];
        goto LABEL_7;
      case 2:
        uint64_t v6 = +[_UITextFieldBezelBackgroundProvider bezelStyleMetricsProvider];
        goto LABEL_7;
      case 3:
        uint64_t v6 = +[_UITextFieldSystemBackgroundProvider systemStyleMetricsProvider];
LABEL_7:
        id v5 = (void *)v6;
        break;
      default:
        uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
        BOOL v9 = v8;
        unint64_t preferredBorderStyle = self->_preferredBorderStyle;
        if (preferredBorderStyle > 3) {
          char v11 = 0;
        }
        else {
          char v11 = off_1E530B4D0[preferredBorderStyle];
        }
        [v8 handleFailureInMethod:a2, self, @"UITextField.m", 5179, @"No metrics provider for border style %@.", v11 object file lineNumber description];

        id v5 = 0;
        break;
    }
  }
  return v5;
}

- (id)_backgroundProvider
{
  return self->_backgroundProvider;
}

- (void)setClipsToBounds:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  [(UIView *)&v4 setClipsToBounds:a3];
  [(UIScrollView *)self->_fieldEditor setNeedsLayout];
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  if ([(UIControl *)self contentVerticalAlignment] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextField;
    [(UIControl *)&v5 setContentVerticalAlignment:a3];
    [(UITextField *)self _setNeedsStyleRecalc];
    [(UIView *)self _invalidateBaselineConstraints];
  }
}

- (void)_setupDefaultStyleEffectConfiguration
{
  if (dyld_program_sdk_at_least())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F5E088]);
    objc_super v4 = [(UIView *)self traitCollection];
    objc_super v5 = -[UITraitCollection _styleEffectAppearanceName](v4);
    [v3 setAppearanceName:v5];

    cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
    self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v3;
  }
}

- (void)_initTextStorage
{
  id v3 = (_UICascadingTextStorage *)objc_opt_new();
  objc_super v4 = [(_UITextFieldVisualStyle *)self->_visualStyle defaultTextColor];
  [(_UICascadingTextStorage *)v3 setTextColor:v4];

  [(_UICascadingTextStorage *)v3 setTextAlignment:4];
  objc_super v5 = self;
  [(_UICascadingTextStorage *)self->_textStorage _setIntentResolver:v5];

  textStorage = self->_textStorage;
  self->_textStorage = v3;
}

- (void)_setTextColor:(id)a3
{
  [(_UICascadingTextStorage *)self->_textStorage setTextColor:a3];
  [(UITextField *)self _updateLabelAppearance];
}

- (void)_initTextCanvasView
{
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)self->_textLayoutController, [(UITextField *)self _canvasViewClass]);
  id v3 = [(_UITextLayoutController *)self->_textLayoutController dequeueCanvasViewForTextContainer:self->_textContainer];
  textCanvasView = self->_textCanvasView;
  self->_textCanvasView = v3;

  [(_UITextCanvas *)self->_textCanvasView setContext:self];
  [(UITextField *)self _addTextCanvasViewAdjustingFrame:0];
}

- (void)_initIncreasedContrastNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__increaseContrastSettingChanged_ name:@"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__increaseContrastSettingChanged_ name:@"UIAccessibilityReduceTransparencyStatusDidChangeNotification" object:0];
}

- (void)_detectCustomDrawing
{
  if (qword_1EB25E5E8 != -1) {
    dispatch_once(&qword_1EB25E5E8, &__block_literal_global_577);
  }
  uint64_t v3 = [(UITextField *)self methodForSelector:sel_drawRect_];
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)(v3 != qword_1EB25E5E0) << 14));
}

- (double)_clearButtonPadX
{
  int v2 = [(UIView *)self traitCollection];
  [v2 userInterfaceIdiom];

  return 3.0;
}

- (void)_addTextCanvasViewAdjustingFrame:(BOOL)a3
{
  objc_super v5 = [(UITextField *)self visualStyle];
  uint64_t v6 = [v5 parentViewForTextContentView];

  uint64_t v7 = [(_UITextCanvas *)self->_textCanvasView superview];

  if (v7 != v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__UITextField__addTextCanvasViewAdjustingFrame___block_invoke;
    v8[3] = &unk_1E52DC3D0;
    BOOL v10 = a3;
    v8[4] = self;
    id v9 = v6;
    +[UIView performWithoutAnimation:v8];
    [(UIView *)self _invalidateBaselineConstraints];
  }
}

- (id)backgroundColor
{
  uint64_t v3 = [(_UITextFieldBackgroundProvider *)self->_backgroundProvider overridingGetBackgroundColor];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_3:
    uint64_t v6 = v5;
    goto LABEL_6;
  }
  uint64_t v7 = [(UITextField *)self _contentView];

  if (v7 == self)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextField;
    id v5 = [(UIView *)&v10 backgroundColor];
    goto LABEL_3;
  }
  uint64_t v8 = [(UITextField *)self _contentView];
  uint64_t v6 = [v8 backgroundColor];

LABEL_6:
  return v6;
}

- (double)_roundedRectBackgroundCornerRadius
{
  uint64_t v3 = [(UITextField *)self _backgroundView];
  id v4 = v3;
  if (v3)
  {
    [v3 _continuousCornerRadius];
    double preferredBackgroundCornerRadius = v5;
  }
  else
  {
    double preferredBackgroundCornerRadius = self->_preferredBackgroundCornerRadius;
  }

  return preferredBackgroundCornerRadius;
}

- (Class)_canvasViewClass
{
  return (Class)objc_opt_class();
}

- (UIEdgeInsets)_padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)selectionHighlightColor
{
  uint64_t v3 = [(UITextField *)self textInputTraits];
  id v4 = [v3 selectionHighlightColor];

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled")&& (-[UIView traitCollection](self, "traitCollection"), double v5 = objc_claimAutoreleasedReturnValue(), v6 = [v5 userInterfaceStyle], v5, v6 == 2))
  {
    id v7 = [v4 colorWithAlphaComponent:0.35];
  }
  else
  {
    id v7 = v4;
  }
  uint64_t v8 = v7;

  return (UIColor *)v8;
}

- (BOOL)isEditable
{
  return 1;
}

- (UITextRange)markedTextRange
{
  return [(UIFieldEditor *)self->_fieldEditor markedTextRange];
}

- (BOOL)_useGesturesForEditableContent
{
  return 1;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(UITextField *)self _fieldEditor];
  int64_t v9 = [v8 offsetFromPosition:v7 toPosition:v6];

  return v9;
}

- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass
{
  if ((*(void *)&self->super.super._viewFlags & 0x400000000000000) != 0
    && (*((unsigned char *)&self->_textFieldFlags + 3) & 0x80) != 0)
  {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  return [(UIView *)&v3 _wantsBaselineUpdatingFollowingConstraintsPass];
}

- (NSString)placeholder
{
  objc_super v3 = [(NSAttributedString *)self->_overriddenPlaceholder string];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UILabel *)self->_placeholderLabel text];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (UITextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(id)objc_opt_class() _isTextLayoutManagerEnabled];
  return (UITextField *)-[UITextField _initWithFrame:textLayoutManagerEnabled:](self, "_initWithFrame:textLayoutManagerEnabled:", v8, x, y, width, height);
}

+ (BOOL)_isTextLayoutManagerEnabled
{
  return _os_feature_enabled_impl();
}

- (_NSRange)_visibleRangeWithLayout:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  char v13 = [(UITextField *)self textInputView];
  objc_msgSend(v13, "convertRect:fromView:", self, v6, v8, v10, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  double v22 = [(UITextField *)self textInputView];
  [v22 bounds];
  v52.origin.CGFloat x = v23;
  v52.origin.CGFloat y = v24;
  v52.size.CGFloat width = v25;
  v52.size.CGFloat height = v26;
  v48.origin.CGFloat x = v15;
  v48.origin.CGFloat y = v17;
  v48.size.CGFloat width = v19;
  v48.size.CGFloat height = v21;
  CGRect v49 = CGRectIntersection(v48, v52);
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat height = v49.size.height;

  [(UITextField *)self textContainerOrigin];
  CGFloat v32 = -v31;
  CGFloat v34 = -v33;
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  CGRect v51 = CGRectOffset(v50, v32, v34);
  double v35 = v51.origin.x;
  double v36 = v51.origin.y;
  double v37 = v51.size.width;
  double v38 = v51.size.height;
  textLayoutController = self->_textLayoutController;
  double v40 = [(UITextField *)self textContainer];
  double v41 = -[_UITextLayoutController textRangeForBounds:inTextContainer:layoutIfNeeded:](textLayoutController, "textRangeForBounds:inTextContainer:layoutIfNeeded:", v40, v3, v35, v36, v37, v38);

  uint64_t v42 = [(_UITextLayoutController *)self->_textLayoutController characterRangeForTextRange:v41];
  NSUInteger v44 = v43;

  NSUInteger v45 = v42;
  NSUInteger v46 = v44;
  result.NSUInteger length = v46;
  result.NSUInteger location = v45;
  return result;
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
}

- (void)_drawTextInRect:(CGRect)a3 forLabel:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = (UITextFieldLabel *)a4;
  if (self->_placeholderLabel == v9)
  {
    double v10 = v9;
    -[UITextField drawPlaceholderInRect:](self, "drawPlaceholderInRect:", x, y, width, height);
  }
  else if (self->_suffixLabel == v9)
  {
    double v10 = v9;
    -[UITextField drawSuffixInRect:](self, "drawSuffixInRect:", x, y, width, height);
  }
  else
  {
    if (self->_prefixLabel != v9) {
      goto LABEL_8;
    }
    double v10 = v9;
    -[UITextField drawPrefixInRect:](self, "drawPrefixInRect:", x, y, width, height);
  }
  double v9 = v10;
LABEL_8:
}

- (void)drawPlaceholderInRect:(CGRect)rect
{
}

void __49__UITextField__adjustFontForAccessibilityTraits___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__UITextField__adjustFontForAccessibilityTraits___block_invoke_2;
  v8[3] = &unk_1E52D9A58;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  id v9 = v5;
  id v7 = v3;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0x100000, v8);
}

- (void)setMinimumFontSize:(CGFloat)minimumFontSize
{
  if (minimumFontSize < 0.0) {
    double minimumFontSize = 0.0;
  }
  self->_double minimumFontSize = minimumFontSize;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth
{
  if (((((*(void *)&self->_textFieldFlags & 0x80) == 0) ^ adjustsFontSizeToFitWidth) & 1) == 0)
  {
    uint64_t v3 = 128;
    if (!adjustsFontSizeToFitWidth) {
      uint64_t v3 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFF7FLL | v3);
    [(UITextField *)self _setNeedsStyleRecalc];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)UITextField;
  -[UIControl hitTest:withEvent:](&v46, sel_hitTest_withEvent_, v8, x, y);
  id v9 = (UITextField *)objc_claimAutoreleasedReturnValue();
  id v10 = [(UIView *)self->_clearButton superview];
  if (v10 == self)
  {
    int v13 = 0;
  }
  else
  {
    uint64_t v11 = [(UIView *)self->_leftView superview];
    if (v11 == self)
    {
      int v13 = 0;
      uint64_t v4 = self;
    }
    else
    {
      uint64_t v4 = v11;
      double v12 = [(UIView *)self->_rightView superview];
      if (v12 != self)
      {

LABEL_45:
        goto LABEL_46;
      }
      int v13 = 1;
    }
  }
  BOOL v14 = v9 == self;
  if (v9 == self || (*((unsigned char *)&self->_textFieldFlags + 1) & 1) == 0)
  {
    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CGFloat v26 = [(UITextField *)self _fieldEditor];
  BOOL v14 = v9 == v26;

  if (v13) {
LABEL_11:
  }

LABEL_12:
  if (v10 == self)
  {

    if (!v14) {
      goto LABEL_46;
    }
  }
  else
  {

    if (!v14) {
      goto LABEL_46;
    }
  }
  [(UITextField *)self editRect];
  double v16 = v15;
  double v18 = v17;
  [(UITextField *)self _textSize];
  double v20 = v19;
  CGFloat v21 = [(UITextField *)self _textStorage];
  uint64_t v22 = objc_msgSend(v21, "_ui_resolvedTextAlignment");

  if (v22)
  {
    double v23 = v16 + v18;
    double v24 = v16 + v18 - v20 + -20.0;
    if (v16 >= v24) {
      double v24 = v16;
    }
    float v25 = v24;
    if (v22 == 2) {
      goto LABEL_26;
    }
  }
  else
  {
    float v25 = v16;
    double v23 = v16 + v18;
  }
  if (v23 >= v16 + v20 + 20.0) {
    double v23 = v16 + v20 + 20.0;
  }
LABEL_26:
  float v27 = v23;
  [(UIView *)self bounds];
  double v30 = fmin(v29 * 0.15, 48.0);
  if (v28 + v30 <= v25) {
    float v31 = v28 + v30;
  }
  else {
    float v31 = v25;
  }
  double v32 = v28 + v29 - v30;
  if (v32 > v27) {
    float v27 = v32;
  }
  if (x <= v31)
  {
    uint64_t v33 = 496;
    CGFloat v34 = [(UIView *)self->_leftView superview];
    if (v34 == self)
    {
      char v35 = UIViewIgnoresTouchEvents(self->_leftView);

      if ((v35 & 1) == 0) {
        goto LABEL_42;
      }
    }
    else
    {
    }
  }
  if (x >= v27)
  {
    double v36 = [(UIView *)self->_clearButton superview];
    if (v36 == self)
    {
      char v37 = UIViewIgnoresTouchEvents(self->_clearButton);

      if ((v37 & 1) == 0)
      {
        clearButton = self->_clearButton;
        goto LABEL_44;
      }
    }
    else
    {
    }
    uint64_t v33 = 512;
    double v38 = [(UIView *)self->_rightView superview];
    if (v38 != self)
    {
      id v10 = v38;
      goto LABEL_45;
    }
    char v39 = UIViewIgnoresTouchEvents(self->_rightView);

    if ((v39 & 1) == 0)
    {
LABEL_42:
      clearButton = *(_UITextFieldClearButton **)((char *)&self->super.super.super.super.isa + v33);
LABEL_44:
      id v10 = v9;
      id v9 = clearButton;
      goto LABEL_45;
    }
  }
LABEL_46:
  double v41 = v9;
  if (v9 != (UITextField *)self->_leftView)
  {
    double v41 = v9;
    if (v9 != (UITextField *)self->_rightView)
    {
      double v41 = v9;
      if (v9 != (UITextField *)self->_clearButton)
      {
        if ([(_UITextFieldBackgroundProvider *)self->_backgroundProvider hitTestView:v9])
        {
          double v41 = self;
          goto LABEL_56;
        }
        if (*((unsigned char *)&self->_textFieldFlags + 1))
        {
          uint64_t v42 = [(UITextField *)self _fieldEditor];
          if (v9 == v42)
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            double v41 = self;
            if ((isKindOfClass & 1) == 0) {
              goto LABEL_56;
            }
          }
          else
          {
          }
        }
        double v41 = v9;
      }
    }
  }
LABEL_56:
  NSUInteger v44 = v41;

  return v44;
}

- (void)setTextDropDelegate:(id)a3
{
}

- (void)setPasteDelegate:(id)a3
{
}

- (void)_notifySystemKeyboardOfAppearanceChange
{
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v3 = [v4 responder];

  if (v3 == self) {
    [v4 traitCollectionDidChange];
  }
}

- (void)setBecomesFirstResponderOnClearButtonTap:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = NSStringFromSelector(sel_textInputTraits);
    [(UITextField *)self willChangeValueForKey:v5];

    objc_storeWeak(&self->_delegate, obj);
    uint64_t v6 = NSStringFromSelector(sel_textInputTraits);
    [(UITextField *)self didChangeValueForKey:v6];
  }
}

- (void)removeFromSuperview
{
  uint64_t v3 = +[UIKeyboardImpl activeInstance];
  [v3 removeASPVisualEffectsIfNecessary:self];

  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  [(UIView *)&v4 removeFromSuperview];
}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(UIControl *)self isEnabled] != a3)
  {
    if (!v5
      && (*((unsigned char *)&self->_textFieldFlags + 1) & 1) != 0
      && [(UITextField *)self canResignFirstResponder])
    {
      BOOL v7 = [(UITextField *)self resignFirstResponder];
      if (v5) {
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v7 = (*((unsigned char *)&self->_textFieldFlags + 1) & 1) == 0;
      if (v5)
      {
LABEL_9:
        v8.receiver = self;
        v8.super_class = (Class)UITextField;
        [(UIControl *)&v8 setEnabled:v5];
        [(UITextField *)self _enabledDidChangeAnimated:v4];
        return;
      }
    }
    if (!v7) {
      return;
    }
    goto LABEL_9;
  }
}

- (Class)_intelligenceBaseClass
{
  sub_1853B985C(0, &qword_1E8FB5028);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  _sSo11UITextFieldC5UIKitE27_intelligenceCollectContent2in9collectorySo6CGRectV_21UIIntelligenceSupport0J16ElementCollectorCtF_0((uint64_t)v5);
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
  uint64_t v3 = [(UIView *)self _largeContentStoredProperties];
  int v4 = [v3 didSetLargeContentTitle];

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)UITextField;
    id v5 = [(UIView *)&v9 largeContentTitle];
  }
  else
  {
    uint64_t v6 = [(UITextField *)self attributedText];
    id v5 = [v6 string];

    if (![v5 length])
    {
      uint64_t v7 = [(UITextField *)self placeholder];

      id v5 = (void *)v7;
    }
  }
  return v5;
}

- (CGPoint)drawingScale
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)_setCuiCatalog:(id)a3
{
  id v5 = (CUICatalog *)a3;
  if (self->_cuiCatalog != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_cuiCatalog, a3);
    [(UITextField *)self _propagateCuiProperties];
    id v5 = v6;
  }
}

- (void)_setCuiStyleEffectConfiguration:(id)a3
{
  if (self->_cuiStyleEffectConfiguration != a3)
  {
    id v4 = (id)[a3 copy];
    if (!v4)
    {
      if (dyld_program_sdk_at_least()) {
        id v4 = objc_alloc_init(MEMORY[0x1E4F5E088]);
      }
      else {
        id v4 = 0;
      }
    }
    id v5 = [v4 appearanceName];

    if (!v5)
    {
      uint64_t v6 = [(UIView *)self traitCollection];
      uint64_t v7 = -[UITraitCollection _styleEffectAppearanceName](v6);
      [v4 setAppearanceName:v7];
    }
    cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
    self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v4;

    [(UITextField *)self _propagateCuiProperties];
  }
}

- (UITextField)initWithCoder:(id)a3
{
  v72[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)UITextField;
  id v5 = [(UIControl *)&v71 initWithCoder:v4];

  if (!v5) {
    goto LABEL_101;
  }
  uint64_t v6 = +[_UITextFieldVisualStyle inferredVisualStyleWithStyleSubject:v5];
  visualStyle = v5->_visualStyle;
  v5->_visualStyle = (_UITextFieldVisualStyle *)v6;

  int v8 = [(id)objc_opt_class() _isTextLayoutManagerEnabled];
  uint64_t v9 = 0x1000000000;
  if (!v8) {
    uint64_t v9 = 0;
  }
  v5->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&v5->_textFieldFlags & 0xFFFFFFEFFFFFFFFFLL | v9);
  [(UITextField *)v5 _setupDefaultStyleEffectConfiguration];
  int v10 = [v4 containsValueForKey:@"UIRoundedRectBackgroundCornerRadius"];
  double v11 = 5.0;
  if (v10) {
    objc_msgSend(v4, "decodeDoubleForKey:", @"UIRoundedRectBackgroundCornerRadius", 5.0);
  }
  v5->_double preferredBackgroundCornerRadius = v11;
  [(UITextField *)v5 _invalidateBackgroundProviderForced:1];
  if ([v4 containsValueForKey:@"UIAllowsEditingTextAttributes"])
  {
    int v12 = [v4 decodeBoolForKey:@"UIAllowsEditingTextAttributes"];
    uint64_t v13 = 0x10000;
    if (!v12) {
      uint64_t v13 = 0;
    }
    v5->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&v5->_textFieldFlags & 0xFFFFFFFFFFFEFFFFLL | v13);
  }
  uint64_t v14 = [v4 decodeObjectForKey:@"UIText"];
  if (v14) {
    double v15 = (__CFString *)v14;
  }
  else {
    double v15 = &stru_1ED0E84C0;
  }
  double v16 = [v4 decodeObjectForKey:@"UIAttributedText"];
  double v17 = (void *)[v16 mutableCopy];

  if (!v17) {
    double v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v15];
  }
  [(UITextField *)v5 sanitizeAttributedText:v17];
  if (![v17 length])
  {
    if ([v4 containsValueForKey:@"UITextAlignment"]) {
      uint64_t v21 = [v4 decodeIntegerForKey:@"UITextAlignment"];
    }
    else {
      uint64_t v21 = 4;
    }
    goto LABEL_27;
  }
  double v18 = [v17 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0];
  double v19 = v18;
  if (v18 && [v18 alignment] != 4)
  {
    uint64_t v20 = [v19 alignment];
    goto LABEL_24;
  }
  if ([v4 containsValueForKey:@"UITextAlignment"])
  {
    uint64_t v20 = [v4 decodeIntegerForKey:@"UITextAlignment"];
LABEL_24:
    uint64_t v21 = v20;
    goto LABEL_25;
  }
  uint64_t v21 = 4;
LABEL_25:

LABEL_27:
  [(UITextField *)v5 _initTextStorage];
  uint64_t v22 = [v4 decodeObjectForKey:@"UIFont"];
  double v23 = v22;
  if (v22)
  {
    [v22 pointSize];
    double v24 = +[_UIFullFontSize valued:](_UIFullFontSize, "valued:");
    [(UITextField *)v5 _setFullFontSize:v24];

    [(_UICascadingTextStorage *)v5->_textStorage setFont:v23];
  }
  else
  {
    float v25 = +[_UIFullFontSize defaultValue];
    [(UITextField *)v5 _setFullFontSize:v25];
  }
  CGFloat v26 = [v4 decodeObjectForKey:@"UITextColor"];
  if (v26) {
    [(_UICascadingTextStorage *)v5->_textStorage setTextColor:v26];
  }
  if (v21 != 4) {
    [(_UICascadingTextStorage *)v5->_textStorage setTextAlignment:v21];
  }
  *(void *)&v5->_textFieldFlags |= 0x20000uLL;
  [(_UICascadingTextStorage *)v5->_textStorage setAttributedString:v17];
  if ([v4 containsValueForKey:@"UIAdjustsFontForContentSizeCategory"]) {
    -[UITextField setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", [v4 decodeBoolForKey:@"UIAdjustsFontForContentSizeCategory"]);
  }
  float v27 = [v4 decodeObjectForKey:@"UIDelegate"];
  objc_storeWeak(&v5->_delegate, v27);

  if ([v4 decodeBoolForKey:@"UIClearsOnBeginEditing"]) {
    v5->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&v5->_textFieldFlags & 0xFFFFFFFFFFF3FFFFLL | 0x40000);
  }
  int v28 = [v4 decodeBoolForKey:@"UIAdjustsFontSizeToFit"];
  uint64_t v29 = 128;
  if (!v28) {
    uint64_t v29 = 0;
  }
  v5->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&v5->_textFieldFlags & 0xFFFFFFFFFFFFFF7FLL | v29);
  if ([v4 containsValueForKey:@"UIMinimumFontSize"])
  {
    [v4 decodeFloatForKey:@"UIMinimumFontSize"];
    double v31 = v30;
    if (v31 < 0.0) {
      double v31 = 0.0;
    }
  }
  else
  {
    [off_1E52D39B8 systemMinimumFontSize];
  }
  v5->_double minimumFontSize = v31;
  if (objc_msgSend(v4, "containsValueForKey:", @"UIBorderStyle", v23)) {
    uint64_t v32 = [v4 decodeIntegerForKey:@"UIBorderStyle"];
  }
  else {
    uint64_t v32 = 0;
  }
  v5->_clearButtonMode = 0;
  if ([v4 containsValueForKey:@"UIClearButtonMode"]) {
    v5->_clearButtonMode = [v4 decodeIntegerForKey:@"UIClearButtonMode"];
  }
  [(UITextField *)v5 _initTextLayoutController];
  [(UITextField *)v5 _initTextCanvasView];
  v5->_foregroundViewsAlpha = 1.0;
  uint64_t v33 = [v4 decodeObjectForKey:@"UIPlaceholder"];
  if (v33)
  {
    [(UITextField *)v5 createPlaceholderIfNecessary];
    [(UILabel *)v5->_placeholderLabel setText:v33];
  }
  uint64_t v34 = [v4 decodeObjectForKey:@"UILeftView"];
  leftView = v5->_leftView;
  v5->_leftView = (UIView *)v34;

  uint64_t v36 = [v4 decodeObjectForKey:@"UIRightView"];
  uint64_t rightView = v5->_rightView;
  v5->_uint64_t rightView = (UIView *)v36;

  uint64_t v38 = [v4 decodeObjectForKey:@"UITextFieldBackground"];
  background = v5->_background;
  v5->_background = (UIImage *)v38;

  uint64_t v40 = [v4 decodeObjectForKey:@"UITextFieldDisabledBackground"];
  disabledBackground = v5->_disabledBackground;
  v5->_disabledBackground = (UIImage *)v40;

  *(void *)&v5->_textFieldFlags |= 0x20uLL;
  if ([v4 containsValueForKey:@"UIBecomesFirstResponderOnClearButtonTap"]) {
    v5->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&v5->_textFieldFlags & 0xFFFFFFFFFFFFFFDFLL | (32 * ([v4 decodeIntegerForKey:@"UIBecomesFirstResponderOnClearButtonTap"] & 1)));
  }
  [v4 decodeCGSizeForKey:@"UIClearButtonOffset"];
  v5->_clearButtonOffset.double width = v42;
  v5->_clearButtonOffset.double height = v43;
  [v4 decodeUIEdgeInsetsForKey:@"UIPadding"];
  v5->_padding.double top = v44;
  v5->_padding.double left = v45;
  v5->_padding.double bottom = v46;
  v5->_padding.double right = v47;
  if ([v4 containsValueForKey:@"UIAutocapitalizationType"]) {
    uint64_t v48 = [v4 decodeIntegerForKey:@"UIAutocapitalizationType"];
  }
  else {
    uint64_t v48 = 0;
  }
  [(UITextField *)v5 setAutocapitalizationType:v48];
  if ([v4 containsValueForKey:@"UIAutocorrectionType"]) {
    uint64_t v49 = [v4 decodeIntegerForKey:@"UIAutocorrectionType"];
  }
  else {
    uint64_t v49 = 0;
  }
  [(UITextField *)v5 setAutocorrectionType:v49];
  if ([v4 containsValueForKey:@"UISpellCheckingType"]) {
    uint64_t v50 = [v4 decodeIntegerForKey:@"UISpellCheckingType"];
  }
  else {
    uint64_t v50 = 0;
  }
  [(UITextField *)v5 setSpellCheckingType:v50];
  if ([v4 containsValueForKey:@"UIDisableTextColorUpdateOnTraitCollectionChange"])
  {
    int v51 = [v4 decodeBoolForKey:@"UIDisableTextColorUpdateOnTraitCollectionChange"];
    v5->_disableTextColorUpdateOnTraitCollectionChange = v51;
    if (!v51) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
  if (v5->_disableTextColorUpdateOnTraitCollectionChange) {
LABEL_67:
  }
    objc_storeStrong((id *)&v5->_tvCustomTextColor, v26);
LABEL_68:
  if ([v4 containsValueForKey:@"UIKeyboardAppearance"]) {
    uint64_t v52 = [v4 decodeIntegerForKey:@"UIKeyboardAppearance"];
  }
  else {
    uint64_t v52 = 0;
  }
  [(UITextField *)v5 setKeyboardAppearance:v52];
  if ([v4 containsValueForKey:@"UIKeyboardType"]) {
    uint64_t v53 = [v4 decodeIntegerForKey:@"UIKeyboardType"];
  }
  else {
    uint64_t v53 = 0;
  }
  [(UITextField *)v5 setKeyboardType:v53];
  if ([v4 containsValueForKey:@"UIReturnKeyType"]) {
    uint64_t v54 = [v4 decodeIntegerForKey:@"UIReturnKeyType"];
  }
  else {
    uint64_t v54 = 0;
  }
  [(UITextField *)v5 setReturnKeyType:v54];
  -[UITextField setEnablesReturnKeyAutomatically:](v5, "setEnablesReturnKeyAutomatically:", [v4 decodeBoolForKey:@"UIEnablesReturnKeyAutomatically"]);
  double v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UITextContentType"];
  [(UITextField *)v5 setTextContentType:v55];

  if ([v4 containsValueForKey:@"UITextSmartInsertDeleteType"]) {
    uint64_t v56 = [v4 decodeIntegerForKey:@"UITextSmartInsertDeleteType"];
  }
  else {
    uint64_t v56 = 0;
  }
  [(UITextField *)v5 setSmartInsertDeleteType:v56];
  if ([v4 containsValueForKey:@"UITextSmartQuotesType"]) {
    uint64_t v57 = [v4 decodeIntegerForKey:@"UITextSmartQuotesType"];
  }
  else {
    uint64_t v57 = 0;
  }
  [(UITextField *)v5 setSmartQuotesType:v57];
  if ([v4 containsValueForKey:@"UITextSmartDashesType"]) {
    uint64_t v58 = [v4 decodeIntegerForKey:@"UITextSmartDashesType"];
  }
  else {
    uint64_t v58 = 0;
  }
  [(UITextField *)v5 setSmartDashesType:v58];
  if ([v4 containsValueForKey:@"UITextInlinePredictionType"]) {
    uint64_t v59 = [v4 decodeIntegerForKey:@"UITextInlinePredictionType"];
  }
  else {
    uint64_t v59 = 0;
  }
  [(UITextField *)v5 setInlinePredictionType:v59];
  if ([v4 containsValueForKey:@"UILetterformAwareSizingRule"]) {
    v5->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&v5->_textFieldFlags & 0xFFFFFFBFFFFFFFFFLL | (([v4 decodeIntegerForKey:@"UILetterformAwareSizingRule"] & 1) << 38));
  }
  -[UITextField setSecureTextEntry:](v5, "setSecureTextEntry:", [v4 decodeBoolForKey:@"UISecureTextEntry"]);
  double v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UITextInputPasswordRules"];
  [(UITextField *)v5 setPasswordRules:v60];

  id v61 = [v4 decodeObjectForKey:@"UIIcon"];
  [(UITextField *)v5 setIcon:v61];

  [(UITextField *)v5 setBorderStyle:v32];
  double v62 = [(UIView *)v5 tintColor];

  if (v62) {
    [(UITextField *)v5 _updateForTintColor];
  }
  *(void *)&v5->_textFieldFlags |= 0x10000000uLL;
  double v63 = [(UITextField *)v5 _contentFloatingContainerView];

  if (v63)
  {
    v72[0] = v5->_iconView;
    v72[1] = v5->_placeholderLabel;
    v72[2] = v5->_label;
    v72[3] = v5->_clearButton;
    uint64_t v64 = 0;
    v72[4] = v5->_contentBackdropView;
    do
    {
      uint64_t v65 = v72[v64];
      if (v65)
      {
        float v66 = [(UITextField *)v5 _contentView];
        [v66 addSubview:v65];
      }
      ++v64;
    }
    while (v64 != 5);
    for (uint64_t i = 4; i != -1; --i)
  }
  v5->_tvUseVibrancdouble y = !v5->_disableTextColorUpdateOnTraitCollectionChange;
  [(UITextField *)v5 _detectCustomDrawing];
  [(UITextField *)v5 _initIncreasedContrastNotifications];
  [(UIControl *)v5 setSymbolAnimationEnabled:1];

LABEL_101:
  uint64_t v68 = v5;

  return v68;
}

- (id)_encodableSubviews
{
  double v2 = [(UITextField *)self _contentView];
  double v3 = [v2 subviews];

  return v3;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  [(UIView *)&v6 _populateArchivedSubviews:v4];
  [(_UITextFieldBackgroundProvider *)self->_backgroundProvider populateArchivedSubviews:v4];
  if (self->_iconView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_placeholderLabel) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_label) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_clearButton) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_contentBackdropView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_textCanvasView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_fieldEditor) {
    objc_msgSend(v4, "removeObject:");
  }
  id v5 = [(UITextInteractionAssistant *)self->_interactionAssistant _selectionViewManager];
  [v5 _filterArchivedSubviews:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)UITextField;
  [(UIControl *)&v38 encodeWithCoder:v4];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained];
  }
  if ([(UITextField *)self adjustsFontForContentSizeCategory]) {
    [v4 encodeBool:1 forKey:@"UIAdjustsFontForContentSizeCategory"];
  }
  objc_super v6 = self->_textStorage;
  uint64_t v7 = [(_UICascadingTextStorage *)self->_textStorage font];

  if (v7)
  {
    int v8 = [(_UICascadingTextStorage *)v6 font];
    [v4 encodeObject:v8 forKey:@"UIFont"];
  }
  uint64_t v9 = [(UITextField *)self placeholder];

  if (v9)
  {
    int v10 = [(UITextField *)self placeholder];
    [v4 encodeObject:v10 forKey:@"UIPlaceholder"];
  }
  if ((*((unsigned char *)&self->_textFieldFlags + 1) & 0x20) != 0) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[_UICascadingTextStorage textAlignment](v6, "textAlignment"), @"UITextAlignment");
  }
  if ([(NSConcreteTextStorage *)v6 length])
  {
    if ((*((unsigned char *)&self->_textFieldFlags + 2) & 2) != 0)
    {
      double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v6];
      [v4 encodeObject:v11 forKey:@"UIAttributedText"];
    }
    int v12 = [(NSConcreteTextStorage *)v6 string];
    [v4 encodeObject:v12 forKey:@"UIText"];
  }
  uint64_t v13 = [(UIImageView *)self->_iconView image];

  if (v13)
  {
    uint64_t v14 = [(UIImageView *)self->_iconView image];
    [v4 encodeObject:v14 forKey:@"UIIcon"];
  }
  double v15 = [(_UICascadingTextStorage *)v6 textColor];

  if (v15)
  {
    double v16 = [(_UICascadingTextStorage *)v6 textColor];
    [v4 encodeObject:v16 forKey:@"UITextColor"];
  }
  leftView = self->_leftView;
  if (leftView) {
    [v4 encodeObject:leftView forKey:@"UILeftView"];
  }
  uint64_t rightView = self->_rightView;
  if (rightView) {
    [v4 encodeObject:rightView forKey:@"UIRightView"];
  }
  background = self->_background;
  if (background) {
    [v4 encodeObject:background forKey:@"UITextFieldBackground"];
  }
  disabledBackground = self->_disabledBackground;
  if (disabledBackground) {
    [v4 encodeObject:disabledBackground forKey:@"UITextFieldDisabledBackground"];
  }
  UITextBorderStyle v21 = [(UITextField *)self borderStyle];
  if (v21) {
    [v4 encodeInteger:v21 forKey:@"UIBorderStyle"];
  }
  if ([(UITextField *)self clearsOnBeginEditing]) {
    [v4 encodeBool:1 forKey:@"UIClearsOnBeginEditing"];
  }
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if ((*(unsigned char *)&textFieldFlags & 0x80) != 0)
  {
    [v4 encodeBool:1 forKey:@"UIAdjustsFontSizeToFit"];
    $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    if ((*(unsigned char *)&textFieldFlags & 0x20) != 0)
    {
LABEL_33:
      if ((*(_DWORD *)&textFieldFlags & 0x10000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&textFieldFlags & 0x20) != 0)
  {
    goto LABEL_33;
  }
  [v4 encodeBool:0 forKey:@"UIBecomesFirstResponderOnClearButtonTap"];
  if ((*(void *)&self->_textFieldFlags & 0x10000) != 0) {
LABEL_34:
  }
    [v4 encodeBool:1 forKey:@"UIAllowsEditingTextAttributes"];
LABEL_35:
  double minimumFontSize = self->_minimumFontSize;
  if (minimumFontSize != 0.0)
  {
    *(float *)&double minimumFontSize = minimumFontSize;
    [v4 encodeFloat:@"UIMinimumFontSize" forKey:minimumFontSize];
  }
  int64_t clearButtonMode = self->_clearButtonMode;
  if (clearButtonMode) {
    [v4 encodeInteger:clearButtonMode forKey:@"UIClearButtonMode"];
  }
  if (self->_clearButtonOffset.width != 0.0 || self->_clearButtonOffset.height != 0.0) {
    objc_msgSend(v4, "encodeCGSize:forKey:", @"UIClearButtonOffset");
  }
  if (self->_padding.top != 0.0
    || self->_padding.bottom != 0.0
    || self->_padding.left != 0.0
    || self->_padding.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"UIPadding");
  }
  uint64_t v25 = [(UITextField *)self autocapitalizationType];
  if (v25) {
    [v4 encodeInteger:v25 forKey:@"UIAutocapitalizationType"];
  }
  uint64_t v26 = [(UITextField *)self autocorrectionType];
  if (v26) {
    [v4 encodeInteger:v26 forKey:@"UIAutocorrectionType"];
  }
  uint64_t v27 = [(UITextField *)self spellCheckingType];
  if (v27) {
    [v4 encodeInteger:v27 forKey:@"UISpellCheckingType"];
  }
  uint64_t v28 = [(UITextField *)self keyboardAppearance];
  if (v28) {
    [v4 encodeInteger:v28 forKey:@"UIKeyboardAppearance"];
  }
  uint64_t v29 = [(UITextField *)self keyboardType];
  if (v29) {
    [v4 encodeInteger:v29 forKey:@"UIKeyboardType"];
  }
  uint64_t v30 = [(UITextField *)self returnKeyType];
  if (v30) {
    [v4 encodeInteger:v30 forKey:@"UIReturnKeyType"];
  }
  if ([(UITextField *)self enablesReturnKeyAutomatically]) {
    [v4 encodeBool:1 forKey:@"UIEnablesReturnKeyAutomatically"];
  }
  if ([(UITextField *)self isSecureTextEntry]) {
    [v4 encodeBool:1 forKey:@"UISecureTextEntry"];
  }
  double v31 = [(UITextField *)self passwordRules];
  if (v31) {
    [v4 encodeObject:v31 forKey:@"UITextInputPasswordRules"];
  }
  uint64_t v32 = [(UITextField *)self textContentType];
  if (v32) {
    [v4 encodeObject:v32 forKey:@"UITextContentType"];
  }
  uint64_t v33 = [(UITextField *)self smartInsertDeleteType];
  if (v33) {
    [v4 encodeInteger:v33 forKey:@"UITextSmartInsertDeleteType"];
  }
  uint64_t v34 = [(UITextField *)self smartQuotesType];
  if (v34) {
    [v4 encodeInteger:v34 forKey:@"UITextSmartQuotesType"];
  }
  uint64_t v35 = [(UITextField *)self smartDashesType];
  if (v35) {
    [v4 encodeInteger:v35 forKey:@"UITextSmartDashesType"];
  }
  uint64_t v36 = [(UITextField *)self inlinePredictionType];
  if (v36) {
    [v4 encodeInteger:v36 forKey:@"UITextInlinePredictionType"];
  }
  [v4 encodeBool:self->_disableTextColorUpdateOnTraitCollectionChange forKey:@"UIDisableTextColorUpdateOnTraitCollectionChange"];
  [(UITextField *)self _roundedRectBackgroundCornerRadius];
  if (fabs(v37 + -5.0) > 0.00000011920929) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIRoundedRectBackgroundCornerRadius");
  }
  if ((*((unsigned char *)&self->_textFieldFlags + 4) & 0x40) != 0) {
    [v4 encodeInteger:1 forKey:@"UILetterformAwareSizingRule"];
  }
}

- (void)_encodeBackgroundColorWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(UITextField *)self backgroundColor];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"UIBackgroundColor"];
  }
}

- (NSString)description
{
  v15.receiver = self;
  v15.super_class = (Class)UITextField;
  double v3 = [(UIView *)&v15 description];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = NSString;
  UITextBorderStyle v6 = [(UITextField *)self borderStyle];
  if ((unint64_t)v6 > UITextBorderStyleRoundedRect) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = off_1E530B4D0[v6];
  }
  backgroundProvider = self->_backgroundProvider;
  if (!backgroundProvider) {
    backgroundProvider = (_UITextFieldBackgroundProvider *)@"(nil)";
  }
  uint64_t v9 = [v5 stringWithFormat:@" borderStyle = %@; background = %@", v7, backgroundProvider];;
  uint64_t v10 = [v4 rangeOfString:@"; layer ="];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v10 = [v4 length] - 1;
  }
  [v4 insertString:v9 atIndex:v10];
  double v11 = [(UITextField *)self placeholder];
  if (v11)
  {
    int v12 = [NSString stringWithFormat:@" placeholder = %@", v11];;
    [v4 insertString:v12 atIndex:v10];
  }
  uint64_t v13 = (void *)[v4 copy];

  return (NSString *)v13;
}

- (CGRect)_responderSelectionRectForWindow:(id)a3
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextField;
    [(UIView *)&v7 _responderSelectionRectForWindow:a3];
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_responderExternalTouchRectForWindow:(id)a3
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v13 = a3;
    uint64_t v14 = [(UITextField *)self _fieldEditor];
    [v14 _responderExternalTouchRectForWindow:v13];
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)UITextField;
    id v4 = a3;
    [(UIView *)&v23 _responderExternalTouchRectForWindow:v4];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGSize)_textSize
{
  [(UITextField *)self _textSizeUsingFullFontSize:0];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  [(UITextField *)self alignmentRectInsets];
  BOOL v10 = v9 == 0.0;
  if (v11 != 0.0) {
    BOOL v10 = 0;
  }
  if (v8 != 0.0) {
    BOOL v10 = 0;
  }
  if (v7 != 0.0) {
    BOOL v10 = 0;
  }
  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      double v31 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v31, OS_LOG_TYPE_FAULT, "Text Field not expected to have alignmentRectInsets.", buf, 2u);
      }
    }
  }
  else if (!v10)
  {
    uint64_t v32 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_baselineOffsetsAtSize____s_category) + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Text Field not expected to have alignmentRectInsets.", buf, 2u);
    }
  }
  double v12 = self->_textStorage;
  *(void *)buf = 0;
  uint64_t v36 = buf;
  uint64_t v37 = 0x3032000000;
  objc_super v38 = __Block_byref_object_copy__210;
  char v39 = __Block_byref_object_dispose__210;
  id v40 = 0;
  if ((*((unsigned char *)&self->_textFieldFlags + 2) & 2) == 0) {
    goto LABEL_11;
  }
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  id v13 = [(UITextField *)self attributedText];
  uint64_t v14 = [(UITextField *)self attributedText];
  uint64_t v15 = [v14 length];
  uint64_t v16 = *(void *)off_1E52D2040;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __38__UITextField__baselineOffsetsAtSize___block_invoke;
  v33[3] = &unk_1E530B328;
  v33[4] = v34;
  v33[5] = buf;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v15, 0, v33);

  _Block_object_dispose(v34, 8);
  if (!*((void *)v36 + 5))
  {
LABEL_11:
    double v17 = [(_UICascadingTextStorage *)v12 font];
    [(UITextField *)self _fullFontSize];
    uint64_t v18 = objc_msgSend(v17, "fontWithSize:");
    double v19 = (void *)*((void *)v36 + 5);
    *((void *)v36 + 5) = v18;

    if (!*((void *)v36 + 5))
    {
      [off_1E52D39B8 defaultFontSize];
      uint64_t v20 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
      double v21 = (void *)*((void *)v36 + 5);
      *((void *)v36 + 5) = v20;
    }
  }
  -[UITextField _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", width, height);
  double v23 = v22;
  double v25 = v24;
  -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, v22, v24);
  -[UITextField _marginTopForBounds:](self, "_marginTopForBounds:", 0.0, 0.0, v23, v25);
  [*((id *)v36 + 5) lineHeight];
  [*((id *)v36 + 5) descender];
  UIRoundToViewScale(self);
  double v27 = v26;
  double v28 = v25 - v26;
  _Block_object_dispose(buf, 8);

  double v29 = v27;
  double v30 = v28;
  result.var1 = v30;
  result.var0 = v29;
  return result;
}

void __38__UITextField__baselineOffsetsAtSize___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 lineHeight];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)_applicableContentOutsetsFromFontsOversize:(int)a3 extremeSizing:
{
  if (a1 && a2 | a3)
  {
    if (*(unsigned char *)(a1 + 889))
    {
      double v4 = objc_msgSend((id)a1, "_fieldEditor", 0.0, 0.0, 0.0, 0.0);
      [v4 _fullContentInsetsFromFonts];
    }
    else
    {
      double v4 = objc_msgSend((id)a1, "text", 0.0, 0.0, 0.0, 0.0);
      uint64_t v5 = +[UILabel _tooBigChars]();
      uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];

      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((*(unsigned char *)(a1 + 890) & 2) != 0)
        {
          double v8 = *(void **)(a1 + 816);
          double v7 = [v8 font];
          +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v8, v7, (void *)a1);
        }
        else
        {
          double v7 = [(id)a1 font];
          +[UILabel _insetsForString:withFont:inView:]((uint64_t)UILabel, (uint64_t)v4, v7, (void *)a1);
        }
      }
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  LODWORD(v3) = [(UIView *)self isUserInteractionEnabled];
  if (v3)
  {
    BOOL v4 = [(UIView *)self _containedInAbsoluteResponderChain];
    BOOL v5 = v4;
    if (v4 && (*((unsigned char *)&self->_textFieldFlags + 1) & 4) != 0)
    {
      uint64_t v9 = 0;
    }
    else
    {
      if ([(UIControl *)self isEnabled])
      {
        BOOL v6 = [(UITextField *)self _delegateShouldBeginEditing];
        uint64_t v7 = 512;
        if (!v6) {
          uint64_t v7 = 0;
        }
        unint64_t v8 = *(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFDFFLL | v7;
      }
      else
      {
        unint64_t v8 = *(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFDFFLL;
      }
      self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)v8;
      uint64_t v9 = (2 * (int)v8) & 0x400;
      if (v5) {
        uint64_t v9 = 0;
      }
    }
    $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&textFieldFlags & 0xFFFFFFFFFFFFFBFFLL | v9);
    return (*(unint64_t *)&textFieldFlags >> 9) & 1;
  }
  return v3;
}

- (BOOL)_shouldCollectAsKeyView
{
  if (![(UIView *)self isUserInteractionEnabled]
    || ![(UIControl *)self isEnabled])
  {
    return 0;
  }
  return [(UITextField *)self isEditable];
}

- (BOOL)_requiresKeyboardResetOnReload
{
  return 1;
}

- (void)scrollTextFieldToVisibleIfNecessary
{
  if ([(UIResponder *)self _textInputSource] != 3)
  {
    BOOL v3 = [(UIView *)self _scroller];
    if (v3)
    {
      while (1)
      {
        id v18 = v3;
        if ([v3 isScrollEnabled]) {
          break;
        }
        uint64_t v4 = [v18 _scroller];

        BOOL v3 = (void *)v4;
        if (!v4) {
          goto LABEL_5;
        }
      }
    }
    else
    {
LABEL_5:
      id v18 = 0;
    }
    BOOL v5 = [(UIView *)self superview];
    [(UIView *)self frame];
    objc_msgSend(v5, "convertRect:toView:", v18);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    if (![v18 isDecelerating]) {
      goto LABEL_15;
    }
    [v18 _animatedTargetOffset];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v18 bounds];
    v20.origin.double x = v15;
    v20.origin.double y = v17;
    v21.origin.double x = v7;
    v21.origin.double y = v9;
    v21.size.double width = v11;
    v21.size.double height = v13;
    if (!CGRectContainsRect(v20, v21))
    {
LABEL_15:
      if ([(UITextField *)self _delegateShouldScrollToVisibleWhenBecomingFirstResponder])
      {
        objc_msgSend(v18, "scrollRectToVisible:animated:", 1, v7, v9, v11, v13);
      }
    }
  }
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(UIView *)self keyboardSceneDelegate];
  if ([(UITextField *)self keyboardAppearance] == 127
    || [(UIView *)self isFirstResponder]
    && ([v3 responder],
        uint64_t v4 = (UITextField *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 != self))
  {
    [v3 _beginIgnoringReloadInputViews];
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
  }
  BOOL v6 = [(UIView *)self isFirstResponder];
  v12.receiver = self;
  v12.super_class = (Class)UITextField;
  BOOL v7 = [(UIView *)&v12 becomeFirstResponder];
  if (v7)
  {
    [(UITextField *)self scrollTextFieldToVisibleIfNecessary];
    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel__receivedKeyboardDidShowNotification_ name:@"UIKeyboardDidShowNotification" object:0];

    if ([(NSConcreteTextStorage *)self->_textStorage length])
    {
      if (v6 && [(UITextField *)self textSelectionBehavior] == 3) {
        [(UIFieldEditor *)self->_fieldEditor _updateTextSelectionFromBehavior];
      }
    }
    else
    {
      [(UITextField *)self setClearsOnInsertion:0];
    }
    if ((*((unsigned char *)&self->_textFieldFlags + 1) & 1) != 0
      && [(UIScrollView *)self->_fieldEditor isScrollAnimating])
    {
      double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v10 = [(UITextField *)self _fieldEditor];
      [v9 addObserver:self selector:sel__initialScrollDidFinish_ name:@"UITextSelectionDidScroll" object:v10];

      if ((v5 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    if ([(UITextField *)self _showsContentCoverView])
    {
      [(UITextField *)self setNeedsLayout];
      if ((v5 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    [(UITextField *)self _activateSelectionView];
    if (v5)
    {
LABEL_23:
      [v3 _endIgnoringReloadInputViews];
      [(UIResponder *)self reloadInputViews];
    }
  }
  else if ((v5 & 1) != 0 && [v3 _endIgnoringReloadInputViews])
  {
    [v3 forceReloadInputViews];
  }
LABEL_24:

  return v7;
}

- (void)_installSelectGestureRecognizer
{
  if (!self->_selectGestureRecognizer)
  {
    BOOL v3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__selectGestureChanged_];
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->_selectGestureRecognizer setAllowedPressTypes:&unk_1ED3F14F8];
    [(UIGestureRecognizer *)self->_selectGestureRecognizer setDelegate:self];
    char v5 = self->_selectGestureRecognizer;
    [(UIView *)self addGestureRecognizer:v5];
  }
}

- (void)_selectGestureChanged:(id)a3
{
  if ([a3 state] == 3)
  {
    [(UITextField *)self _setHighlighted:0 animated:1];
    [(UITextField *)self becomeFirstResponder];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_selectGestureRecognizer != a3 || [(UIControl *)self isEnabled];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[UIDictationController takesPressesBegan:v6 forTextView:self])
  {
    double v8 = +[UIKeyboard activeKeyboard];
    int v9 = [v8 canHandlePresses:v6 withEvent:v7];

    if (!v9)
    {
      double v11 = [v7 _lastPreparedPress];
      if ([v11 type] == 4)
      {
        BOOL v12 = [(UIControl *)self isEnabled];

        if (v12)
        {
          [(UITextField *)self _setHighlighted:1 animated:1];
          goto LABEL_9;
        }
      }
      else
      {
      }
      v13.receiver = self;
      v13.super_class = (Class)UITextField;
      [(UIResponder *)&v13 pressesBegan:v6 withEvent:v7];
      goto LABEL_9;
    }
    double v10 = +[UIKeyboard activeKeyboard];
    [v10 pressesBegan:v6 withEvent:v7];
  }
LABEL_9:
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[UIDictationController takesPressesChanged:v6 forTextView:self])
  {
    double v8 = +[UIKeyboard activeKeyboard];
    int v9 = [v8 canHandlePresses:v6 withEvent:v7];

    if (v9)
    {
      double v10 = +[UIKeyboard activeKeyboard];
      [v10 pressesChanged:v6 withEvent:v7];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UITextField;
      [(UIResponder *)&v11 pressesChanged:v6 withEvent:v7];
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[UIDictationController takesPressesEnded:v6 forTextView:self])
  {
    double v8 = +[UIKeyboard activeKeyboard];
    int v9 = [v8 canHandlePresses:v6 withEvent:v7];

    if (!v9)
    {
      objc_super v11 = [v7 _lastPreparedPress];
      if ([v11 type] == 4)
      {
        BOOL v12 = [(UIControl *)self isHighlighted];

        if (v12)
        {
          [(UITextField *)self _setHighlighted:0 animated:1];
          goto LABEL_9;
        }
      }
      else
      {
      }
      v13.receiver = self;
      v13.super_class = (Class)UITextField;
      [(UIResponder *)&v13 pressesEnded:v6 withEvent:v7];
      goto LABEL_9;
    }
    double v10 = +[UIKeyboard activeKeyboard];
    [v10 pressesEnded:v6 withEvent:v7];
  }
LABEL_9:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[UIKeyboard activeKeyboard];
  int v9 = [v8 canHandlePresses:v6 withEvent:v7];

  if (!v9)
  {
    objc_super v11 = [v7 _lastPreparedPress];
    if ([v11 type] == 4)
    {
      BOOL v12 = [(UIControl *)self isHighlighted];

      if (v12)
      {
        [(UITextField *)self _setHighlighted:0 animated:1];
        goto LABEL_8;
      }
    }
    else
    {
    }
    v13.receiver = self;
    v13.super_class = (Class)UITextField;
    [(UIResponder *)&v13 pressesCancelled:v6 withEvent:v7];
    goto LABEL_8;
  }
  double v10 = +[UIKeyboard activeKeyboard];
  [v10 pressesCancelled:v6 withEvent:v7];

LABEL_8:
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UITextField *)self _animateNextHighlightChange];
  v9.receiver = self;
  v9.super_class = (Class)UITextField;
  LOBYTE(self) = [(UIControl *)&v9 beginTrackingWithTouch:v7 withEvent:v6];

  return (char)self;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UITextField *)self _animateNextHighlightChange];
  v9.receiver = self;
  v9.super_class = (Class)UITextField;
  LOBYTE(self) = [(UIControl *)&v9 continueTrackingWithTouch:v7 withEvent:v6];

  return (char)self;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UITextField *)self _animateNextHighlightChange];
  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  [(UIControl *)&v8 endTrackingWithTouch:v7 withEvent:v6];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  [(UITextField *)self _animateNextHighlightChange];
  v5.receiver = self;
  v5.super_class = (Class)UITextField;
  [(UIControl *)&v5 cancelTrackingWithEvent:v4];
}

- (void)_setDisableFocus:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)canBecomeFocused
{
  if (*((unsigned char *)&self->_textFieldFlags + 3)) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  return [(UIControl *)&v3 canBecomeFocused];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  [(UIView *)&v4 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
}

- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3
{
  id v4 = a3;
  if ([(UITextField *)self _supportsKeyboardNavigationForSuggestions]
    && [(UIView *)self isFirstResponder]
    && ([v4 nextFocusedItem], objc_super v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [[_UIDynamicFocusGroupMap alloc] initWithCoordinateSpace:self];
    id v7 = [(_UIDynamicFocusGroupMap *)v6 focusGroupIdentifierForItem:self];
    self = [v4 nextFocusedItem];
    objc_super v8 = [(_UIDynamicFocusGroupMap *)v6 focusGroupIdentifierForItem:self];

    LODWORD(self) = [v7 isEqualToString:v8] ^ 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextField;
    LOBYTE(self) = [(UIResponder *)&v10 _allowsChangingFirstResponderForFocusUpdateWithContext:v4];
  }

  return (char)self;
}

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  BOOL v5 = [(UITextField *)self _supportsKeyboardNavigationForSuggestions];
  if (a3 == 2 && v5) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)UITextField;
  return [(UIResponder *)&v7 _shouldForwardMovementToFocusEngine:a3];
}

- (int64_t)_systemDefaultFocusGroupPriority
{
  if ([(UITextField *)self _supportsKeyboardNavigationForSuggestions]) {
    return 2000;
  }
  v4.receiver = self;
  v4.super_class = (Class)UITextField;
  return [(UIView *)&v4 _systemDefaultFocusGroupPriority];
}

- (id)_systemDefaultFocusGroupIdentifier
{
  objc_super v3 = [(UIView *)self _focusBehavior];
  __int16 v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x200) != 0)
  {
    BOOL v5 = _UIFocusGroupIdentifierForInstance(self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextField;
    BOOL v5 = [(UIControl *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(UITextField *)self _contentFloatingContainerView];

  if (v7)
  {
    objc_super v8 = [(UITextField *)self _contentFloatingContainerView];
    objc_super v9 = [v8 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UITextField;
    objc_super v9 = [(UIView *)&v11 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }

  return v9;
}

- (BOOL)_supportsKeyboardNavigationForSuggestions
{
  return *((unsigned char *)&self->_textFieldFlags + 5) & 1;
}

- (void)_activateSelectionView
{
  objc_super v3 = [(UITextField *)self inputDelegate];

  if (v3)
  {
    __int16 v4 = [(UITextField *)self interactionAssistant];
    [v4 setSelectionDisplayVisible:1];

    id v5 = [(UITextField *)self interactionAssistant];
    [v5 activateSelection];
  }
}

- (void)_initialScrollDidFinish:(id)a3
{
  [(UITextField *)self _activateSelectionView];
  [(UITextField *)self _stopObservingFieldEditorScroll];
}

- (void)__resumeBecomeFirstResponder
{
  [(UITextField *)self _becomeFirstResponder];
  [(UIResponder *)self reloadInputViews];
}

- (void)_becomeFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  [(UIResponder *)&v6 _becomeFirstResponder];
  objc_super v3 = [(UITextField *)self textInputTraits];
  if ([v3 deferBecomingResponder])
  {
    BOOL deferringBecomeFirstResponder = self->_deferringBecomeFirstResponder;

    if (!deferringBecomeFirstResponder)
    {
      self->_BOOL deferringBecomeFirstResponder = 1;
      return;
    }
  }
  else
  {
  }
  self->_BOOL deferringBecomeFirstResponder = 0;
  [(UITextField *)self _attachFieldEditor];
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 setScrollEnabled:0];

  [(_UITextFieldBackgroundProvider *)self->_backgroundProvider didChangeFirstResponder];
  [(UITextField *)self _updateSelectionGestures];
  [(UITextField *)self _notifyDidBeginEditing];
}

- (void)_nonDestructivelyResignFirstResponder
{
  *(void *)&self->_textFieldFlags |= 0x200000uLL;
  [(UITextField *)self resignFirstResponder];
  *(void *)&self->_textFieldFlags &= ~0x200000uLL;
}

- (BOOL)resignFirstResponder
{
  if ((*((unsigned char *)&self->_textFieldFlags + 1) & 8) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    BOOL v3 = [(UITextField *)self _showsContentCoverView];
    *(void *)&self->_textFieldFlags |= 0x800uLL;
    v11.receiver = self;
    v11.super_class = (Class)UITextField;
    BOOL v4 = [(UIResponder *)&v11 resignFirstResponder];
    *(void *)&self->_textFieldFlags &= ~0x800uLL;
    if (v4)
    {
      id v5 = [(UITextField *)self interactionAssistant];
      [v5 setSelectionDisplayVisible:0];

      objc_super v6 = [(UITextField *)self interactionAssistant];
      [v6 deactivateSelection];

      objc_super v7 = [(UITextField *)self _inputController];
      [v7 didEndEditing];
    }
    objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self name:@"UIKeyboardDidShowNotification" object:0];

    if (v3 && [(UITextField *)self _shouldObscureInput])
    {
      objc_super v9 = [(UITextField *)self _fieldEditor];
      [v9 _obscureAllText];
    }
  }
  return v4;
}

- (BOOL)_finishResignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  BOOL v3 = [(UIResponder *)&v6 _finishResignFirstResponder];
  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UIKeyboardDidShowNotification" object:0];

  return v3;
}

- (void)_notifyDidBeginEditing
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained textFieldDidBecomeFirstResponder:self];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained textFieldDidBeginEditing:self];
  }
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UITextFieldTextDidBeginEditingNotification" object:self];
}

- (void)_notifyDidEndEditing
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained textFieldDidResignFirstResponder:self];
  }
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained textFieldDidEndEditing:self reason:0];
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained textFieldDidEndEditing:self];
  }
  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v7 = @"UITextFieldEndEditingReasonKey";
  id v5 = [NSNumber numberWithInteger:0];
  v8[0] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postNotificationName:@"UITextFieldTextDidEndEditingNotification" object:self userInfo:v6];
}

- (void)_windowBecameKey
{
  if ((*((unsigned char *)&self->_textFieldFlags + 1) & 1) == 0) {
    [(UITextField *)self _becomeFirstResponder];
  }
  v3.receiver = self;
  v3.super_class = (Class)UITextField;
  [(UIResponder *)&v3 _windowBecameKey];
}

- (void)_windowResignedKey
{
  v2.receiver = self;
  v2.super_class = (Class)UITextField;
  [(UIResponder *)&v2 _windowResignedKey];
}

- (void)_resignFirstResponder
{
  if (self->_deferringBecomeFirstResponder)
  {
    v4.receiver = self;
    v4.super_class = (Class)UITextField;
    [(UIResponder *)&v4 _resignFirstResponder];
  }
  else
  {
    if (![(UITextField *)self isTextDragActive]) {
      [(UITextField *)self _detachFieldEditor];
    }
    v3.receiver = self;
    v3.super_class = (Class)UITextField;
    [(UIResponder *)&v3 _resignFirstResponder];
    [(_UITextFieldBackgroundProvider *)self->_backgroundProvider didChangeFirstResponder];
    [(UIControl *)self _sendActionsForEvents:0x40000 withEvent:0];
    [(UITextField *)self _updateSelectionGestures];
    [(UITextField *)self _notifyDidEndEditing];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB25E5F0 != -1) {
    dispatch_once(&qword_1EB25E5F0, &__block_literal_global_2251);
  }
  if (_MergedGlobals_55_1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextField;
    [(UIControl *)&v8 touchesCancelled:v6 withEvent:v7];
  }
  else
  {
    [(UITextField *)self touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB25E5F0 != -1) {
    dispatch_once(&qword_1EB25E5F0, &__block_literal_global_2251);
  }
  if (_MergedGlobals_55_1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextField;
    [(UIControl *)&v8 touchesEnded:v6 withEvent:v7];
  }
}

- (void)_tvUpdateAppearanceForUserInterfaceStyle
{
  if (!self->_disableTextColorUpdateOnTraitCollectionChange) {
    [(UITextField *)self _tvUpdateTextColor];
  }
  [(UITextField *)self _tvUpdateContentBackdropView];
}

- (id)automaticallySelectedOverlay
{
  objc_super v3 = [(UITextField *)self customOverlayContainer];
  if (v3)
  {
    id v4 = v3;
    id v5 = v4;
    goto LABEL_16;
  }
  id v6 = [(UIView *)self _scroller];
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = [(UIView *)self superview];
  if (v7)
  {
    id v4 = (id)v7;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_14;
      }
      uint64_t v8 = [v4 superview];

      id v4 = (id)v8;
    }
    while (v8);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || ([v6 _flipsHorizontalAxis]) {
    goto LABEL_15;
  }
  id v4 = v6;
  if (![v4 isScrollEnabled]) {
    goto LABEL_14;
  }
  if ([v4 _canScrollY])
  {
    id v5 = v4;
    goto LABEL_16;
  }
  id v5 = v4;
  if (([v4 _canScrollX] & 1) == 0)
  {
LABEL_14:

LABEL_15:
    objc_super v9 = [(UIView *)self keyboardSceneDelegate];
    id v5 = [v9 containerView];

    id v4 = v6;
  }
LABEL_16:

  return v5;
}

double __28__UITextField__fullFontSize__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (a2) {
    [a2 pointSize];
  }
  else {
    double v6 = *(double *)(a1 + 48);
  }
  float v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v8 + 24) + (float)((float)((float)a4 * v7) / (float)*(uint64_t *)(a1 + 56));
  *(double *)(v8 + 24) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (float)_newFontSize:(float)a3 maxSize:(float)a4
{
  if (a3 <= a4) {
    float v5 = a3;
  }
  else {
    float v5 = a4;
  }
  [(UITextField *)self actualMinimumFontSize];
  if (v6 > v5)
  {
    [(UITextField *)self actualMinimumFontSize];
    return v7;
  }
  return v5;
}

- (id)_copyFont:(id)a3 newSize:(float)a4 maxSize:(float)a5
{
  if (!a3) {
    return 0;
  }
  id v8 = a3;
  *(float *)&double v9 = a4;
  *(float *)&double v10 = a5;
  [(UITextField *)self _newFontSize:v9 maxSize:v10];
  BOOL v12 = [v8 fontWithSize:v11];

  return v12;
}

- (float)_marginTop
{
  [(UIView *)self bounds];
  -[UITextField _marginTopForBounds:](self, "_marginTopForBounds:");
  return result;
}

- (id)_clearButtonImageForState:(unint64_t)a3
{
  if (a3)
  {
    objc_super v3 = 0;
    goto LABEL_15;
  }
  float v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 3)
  {
    double v7 = +[UIColor whiteColor];
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = [(UITextField *)self _partsShouldBeMini];
    double v7 = 0;
  }
  double v9 = [(UIView *)self tintColor];
  double v10 = [(UIView *)self traitCollection];
  objc_super v3 = _GetTextFieldClearButtonWithCustomColorContrastSettings(0, v8, v7, v9, v10, [(UIView *)self _accessibilityResolvedInterfaceStyle] == 1, [(UITextField *)self _forcesClearButtonHighContrastAppearance]);

  if (_TextFieldScalesClearButton())
  {
    float v11 = [(UIView *)self traitCollection];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 != 6)
    {
      objc_super v13 = [(UITextField *)self font];
      double v14 = [(UIView *)self traitCollection];
      CGFloat v15 = [v14 preferredContentSizeCategory];
      if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v15))
      {
        if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v15, &cfstr_Uictcontentsiz_11.isa) != NSOrderedAscending)
        {
          uint64_t v16 = 1;
LABEL_13:

          CGFloat v17 = +[UIImageSymbolConfiguration configurationWithFont:v13 scale:v16];
          uint64_t v18 = [v3 imageWithConfiguration:v17];

          objc_super v3 = (void *)v18;
          goto LABEL_14;
        }
        UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v15, &cfstr_Uictcontentsiz_9.isa);
      }
      uint64_t v16 = 2;
      goto LABEL_13;
    }
  }
LABEL_14:

LABEL_15:
  return v3;
}

- (BOOL)_hasCustomClearButtonImage
{
  return 0;
}

void __69__UITextField__transitionFromAccessoryView_toView_allowingAnimation___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isFinished])
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    id v5 = [*(id *)(a1 + 32) _imageViewIfNeeded];
    objc_super v3 = [MEMORY[0x1E4F41A20] appearUpEffect];
    id v4 = [MEMORY[0x1E4F41A50] options];
    [v5 addSymbolEffect:v3 options:v4 animated:0];
  }
}

uint64_t __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke(uint64_t result)
{
  return result;
}

void __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 size];
  double v5 = v4;
  uint64_t v6 = [v3 length];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  float v8 = *(float *)(v7 + 24);
  if (v8 >= *(float *)(a1 + 72) || v5 >= *(float *)(a1 + 76))
  {
    float v15 = *(float *)(v7 + 24);
  }
  else
  {
    uint64_t v9 = *(void *)off_1E52D2040;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    do
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24)
                                                                 + 1.0;
      float v11 = *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) / v8;
      v32[0] = v10;
      v32[1] = 3221225472;
      v32[2] = __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_3;
      v32[3] = &unk_1E530B3B8;
      v32[4] = *(void *)(a1 + 32);
      int v12 = *(_DWORD *)(a1 + 72);
      float v34 = v11;
      int v35 = v12;
      id v13 = v3;
      id v33 = v13;
      objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v6, 0, v32);
      [v13 size];
      double v5 = v14;
      float v8 = *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      float v15 = *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    while (v15 < *(float *)(a1 + 72) && v5 < *(float *)(a1 + 76));
  }
  double v16 = v15;
  [*(id *)(a1 + 32) actualMinimumFontSize];
  if (v17 < v16)
  {
    uint64_t v19 = *(void *)off_1E52D2040;
    do
    {
      double v17 = *(float *)(a1 + 76);
      if (v5 <= v17) {
        break;
      }
      --*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24)
                                                                 + -1.0;
      float v20 = *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) / v8;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_4;
      v28[3] = &unk_1E530B3B8;
      v28[4] = *(void *)(a1 + 32);
      int v21 = *(_DWORD *)(a1 + 72);
      float v30 = v20;
      int v31 = v21;
      id v22 = v3;
      id v29 = v22;
      objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, v6, 0, v28);
      [v22 size];
      double v5 = v23;
      float v8 = *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      double v24 = *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      [*(id *)(a1 + 32) actualMinimumFontSize];
    }
    while (v17 < v24);
  }
  LODWORD(v17) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (*(float *)&v17 != *(float *)(a1 + 80))
  {
    LODWORD(v18) = *(_DWORD *)(a1 + 72);
    uint64_t v25 = [*(id *)(a1 + 32) _copyFont:*(void *)(a1 + 40) newSize:v17 maxSize:v18];
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    double v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
}

void __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v8 pointSize];
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  double v11 = v10 * *(float *)(a1 + 48);
  *(float *)&double v11 = v11;
  id v12 = (id)[v7 _copyFont:v8 newSize:v11 maxSize:v9];

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D2040, v12, a3, a4);
}

void __43__UITextField__updateAutosizeStyleIfNeeded__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v8 pointSize];
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  double v11 = v10 * *(float *)(a1 + 48);
  *(float *)&double v11 = v11;
  id v12 = (id)[v7 _copyFont:v8 newSize:v11 maxSize:v9];

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D2040, v12, a3, a4);
}

- (BOOL)_shouldUnobscureTextWithContentCover
{
  BOOL v3 = [(UITextField *)self _showsContentCoverView];
  if (v3)
  {
    LOBYTE(v3) = [(UITextField *)self _contentCoverUnsecuresText];
  }
  return v3;
}

- (BOOL)_isShowingPlaceholder
{
  objc_super v2 = [(UIView *)self->_placeholderLabel superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_isShowingPrefix
{
  objc_super v2 = [(UIView *)self->_prefixLabel superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  BOOL v4 = *(_DWORD *)&textFieldFlags >= 0 && (a3 - 11) >= 2;
  uint64_t v5 = 0x80000000;
  if (v4) {
    uint64_t v5 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(v5 | *(void *)&textFieldFlags & 0xFFFFFFFF7FFFFFFFLL);
  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  uint64_t v6 = [(UIView *)&v8 _viewForLoweringBaselineLayoutAttribute:sel__viewForLoweringBaselineLayoutAttribute_];
  return v6;
}

- (double)_baselineOffsetForLast:(BOOL)a3 autolayoutOnly:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4 && (*(void *)&self->super.super._viewFlags & 0x400000000000000) == 0)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = v9;
    double v11 = @"_firstBaselineOffsetFromTop";
    if (v4) {
      double v11 = @"_baselineOffsetFromBottom";
    }
    [v9 handleFailureInMethod:a2, self, @"UITextField.m", 3155, @"-[UITextField %@] only valid when using auto layout", v11 object file lineNumber description];
  }
  p_firstBaselineOffsetFromTop = &self->_firstBaselineOffsetFromTop;
  if (self->_firstBaselineOffsetFromTop == 0.0 && self->_lastBaselineOffsetFromBottom == 0.0) {
    [(UITextField *)self _updateBaselineInformationDependentOnBoundsAllowingInvalidation:0];
  }
  if (v4) {
    p_firstBaselineOffsetFromTop = &self->_lastBaselineOffsetFromBottom;
  }
  return *p_firstBaselineOffsetFromTop;
}

- (double)_internalFirstBaselineOffsetFromTop
{
  [(UITextField *)self _baselineOffsetForLast:0 autolayoutOnly:0];
  return result;
}

- (double)_firstBaselineOffsetFromTop
{
  [(UITextField *)self _baselineOffsetForLast:0 autolayoutOnly:1];
  return result;
}

- (double)_internalLastBaselineOffsetFromBottom
{
  [(UITextField *)self _baselineOffsetForLast:1 autolayoutOnly:0];
  return result;
}

- (double)_baselineOffsetFromBottom
{
  [(UITextField *)self _baselineOffsetForLast:1 autolayoutOnly:1];
  return result;
}

- (void)_updateBaselineInformationDependentOnBounds
{
}

- (UIEdgeInsets)textContainerInset
{
  [(UIFieldEditor *)self->_fieldEditor textContainerInset];
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (id)_baselineCalculatorSourceCoordinateSpace
{
  [(_UITextCanvas *)self->_textCanvasView frame];
  double v3 = 0;
  if (fabs(v4) != INFINITY) {
    double v3 = self->_textCanvasView;
  }
  return v3;
}

- (void)_updateBaselineInformationDependentOnBoundsAllowingInvalidation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v6 = [(UIView *)self _wantsAutolayout];
  BOOL v7 = v6;
  if (v3 && !v6)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UITextField.m" lineNumber:3209 description:@"invalidation is only applicable to auto layout"];

    if (v7) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v11 = *MEMORY[0x1E4F1DAD8];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
    [(UIView *)self bounds];
    -[UITextField sizeThatFits:](self, "sizeThatFits:", v15, v16);
    uint64_t v8 = v17;
    uint64_t v9 = v18;
    goto LABEL_7;
  }
  if (!v6) {
    goto LABEL_6;
  }
LABEL_4:
  [(UIView *)self bounds];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
LABEL_7:
  uint64_t v19 = v11;
  uint64_t v20 = v13;
  if (CGRectGetHeight(*(CGRect *)(&v8 - 2)) > 0.0) {
    goto LABEL_10;
  }
  double v21 = 0.0;
  if (!v7)
  {
    double v22 = 0.0;
    goto LABEL_12;
  }
  [(UIView *)self _calculatedIntrinsicHeight];
  double v22 = 0.0;
  if (v23 > 0.0)
  {
LABEL_10:
    [(UITextField *)self _layoutContentOnly];
    double v24 = [(UITextField *)self _inputController];
    uint64_t v25 = [(UITextField *)self textLayoutController];
    uint64_t v26 = [v24 typingAttributes];
    [(UITextField *)self textContainerOrigin];
    double v27 = -[_UITextLayoutControllerBase baselineCalculatorForView:typingAttributes:usesLineFragmentOrigin:fallbackTextContainerOrigin:]((uint64_t)v25, self, v26, 0);

    [v27 firstBaselineOffsetFromTop];
    double v22 = v28;
    [v27 lastBaselineOffsetFromBottom];
    double v21 = v29;
  }
LABEL_12:
  if (self->_firstBaselineOffsetFromTop == v22 && self->_lastBaselineOffsetFromBottom == v21) {
    return;
  }
  if (!v7)
  {
    float v30 = 0;
LABEL_18:
    self->_firstBaselineOffsetFromTop = v22;
    self->_lastBaselineOffsetFromBottom = v21;
    if (v3)
    {
      id v31 = v30;
      [(UIView *)self _invalidateBaselineConstraints];
      float v30 = v31;
    }
    goto LABEL_20;
  }
  float v30 = [(UIView *)self _layoutEngineCreateIfNecessary];
  if (v30) {
    goto LABEL_18;
  }
LABEL_20:
}

- (void)setSizingRule:(int64_t)a3
{
  if (((*(void *)&self->_textFieldFlags >> 38) & 1) != a3)
  {
    if ((*(void *)&self->super.super._viewFlags & 0x400000000000000) != 0)
    {
      double v5 = 0;
    }
    else
    {
      double v5 = [(UIView *)self superview];
      if (v5)
      {
        double v14 = v5;
        [(UIView *)self bounds];
        double v7 = v6;
        double v9 = v8;
        -[UITextField sizeThatFits:](self, "sizeThatFits:", v6, v8);
        BOOL v13 = vabdd_f64(v7, v10) > 2.22044605e-16;
        double v12 = vabdd_f64(v9, v11);
        BOOL v13 = v13 || v12 > 2.22044605e-16;
        if (v13) {
          objc_msgSend(v14, "setNeedsLayout", v12);
        }
        double v5 = v14;
      }
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(a3 == 1) << 38));
  }
}

- (int64_t)sizingRule
{
  return (*(void *)&self->_textFieldFlags >> 38) & 1;
}

- (void)_setExtremeSizingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITextField *)self _isExtremeSizingEnabled] != a3)
  {
    if ((*(void *)&self->super.super._viewFlags & 0x400000000000000) != 0)
    {
      double v5 = 0;
    }
    else
    {
      double v5 = [(UIView *)self superview];
      if (v5)
      {
        double v11 = v5;
        [(UIView *)self bounds];
        double width = v13.size.width;
        double height = v13.size.height;
        double v8 = CGRectGetHeight(v13);
        -[UITextField sizeThatFits:](self, "sizeThatFits:", width, height);
        if (v8 == v9) {
          [v11 setNeedsLayout];
        }
        double v5 = v11;
      }
    }
    uint64_t v10 = 0x2000000000;
    if (!v3) {
      uint64_t v10 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFDFFFFFFFFFLL | v10);
  }
}

- (BOOL)_isExtremeSizingEnabled
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 4) >> 5) & 1;
}

- (CGRect)_suffixFrame
{
  BOOL v3 = [(UITextField *)self _isShowingPlaceholder];
  placeholderLabel = self;
  if (v3) {
    placeholderLabel = self->_placeholderLabel;
  }
  double v5 = [placeholderLabel text];
  double v6 = [(UITextField *)self font];
  objc_msgSend(v5, "_legacy_sizeWithFont:", v6);
  double v8 = v7;

  [(UIView *)self bounds];
  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", [(UITextField *)self isEditing], v9, v10, v11, v12);
  double v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  CGFloat v20 = v19;
  [(UIView *)self bounds];
  -[UITextField placeholderRectForBounds:](self, "placeholderRectForBounds:");
  double v22 = v21;
  double v46 = v23;
  double v24 = [(UILabel *)self->_suffixLabel text];
  uint64_t v25 = [(UILabel *)self->_suffixLabel font];
  objc_msgSend(v24, "_legacy_sizeWithFont:", v25);
  double v27 = v26;

  v47.origin.double x = v14;
  v47.origin.double y = v16;
  v47.size.double width = v18;
  v47.size.double height = v20;
  double MaxX = CGRectGetMaxX(v47);
  double left = self->_padding.left;
  double v30 = left + self->_padding.right;
  BOOL v31 = v8 < v18 - v30;
  if (v8 >= v18 - v30) {
    double left = -0.0;
  }
  else {
    double v18 = v18 - v30;
  }
  double v32 = v14 + left;
  if (v31) {
    double v33 = -0.0;
  }
  else {
    double v33 = v30;
  }
  double v34 = v8 + v33;
  int64_t v35 = [(_UICascadingTextStorage *)self->_textStorage _ui_resolvedTextAlignment];
  double v36 = v32;
  CGFloat v37 = v16;
  double v38 = v18;
  CGFloat v39 = v20;
  if (v35 == 1)
  {
    double v40 = v34 * 0.5 + CGRectGetMidX(*(CGRect *)&v36) + -1.0;
  }
  else if (v35 == 2)
  {
    double v40 = CGRectGetMaxX(*(CGRect *)&v36);
  }
  else
  {
    double v40 = v34 + CGRectGetMinX(*(CGRect *)&v36);
  }
  if (v40 >= MaxX) {
    double v41 = MaxX;
  }
  else {
    double v41 = v40;
  }

  double v42 = v41;
  double v43 = v22;
  double v44 = v27;
  double v45 = v46;
  result.size.double height = v45;
  result.size.double width = v44;
  result.origin.double y = v43;
  result.origin.double x = v42;
  return result;
}

- (CGRect)_prefixFrame
{
  BOOL v3 = [(UITextField *)self _isShowingPlaceholder];
  placeholderLabel = self;
  if (v3) {
    placeholderLabel = self->_placeholderLabel;
  }
  double v5 = [placeholderLabel text];
  double v6 = [(UITextField *)self font];
  objc_msgSend(v5, "_legacy_sizeWithFont:", v6);
  double v8 = v7;

  [(UIView *)self bounds];
  -[UITextField _availableTextRectForBounds:forEditing:](self, "_availableTextRectForBounds:forEditing:", [(UITextField *)self isEditing], v9, v10, v11, v12);
  double v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  CGFloat v20 = v19;
  double v21 = [(UILabel *)self->_prefixLabel text];
  double v22 = [(UILabel *)self->_prefixLabel font];
  objc_msgSend(v21, "_legacy_sizeWithFont:", v22);
  double v24 = v23;

  [(UIView *)self bounds];
  -[UITextField placeholderRectForBounds:](self, "placeholderRectForBounds:");
  double v26 = v25;
  double v47 = v27;
  v48.origin.double x = v14;
  v48.origin.double y = v16;
  v48.size.double width = v18;
  v48.size.double height = v20;
  double MinX = CGRectGetMinX(v48);
  double left = self->_padding.left;
  double v30 = left + self->_padding.right;
  BOOL v31 = v8 < v18 - v30;
  if (v8 >= v18 - v30) {
    double left = -0.0;
  }
  else {
    double v18 = v18 - v30;
  }
  double v32 = v14 + left;
  if (v31) {
    double v33 = -0.0;
  }
  else {
    double v33 = v30;
  }
  double v34 = v8 + v33;
  int64_t v35 = [(_UICascadingTextStorage *)self->_textStorage _ui_resolvedTextAlignment];
  double v36 = v32;
  CGFloat v37 = v16;
  double v38 = v18;
  CGFloat v39 = v20;
  if (v35 == 1)
  {
    double v41 = CGRectGetMidX(*(CGRect *)&v36) + v34 * -0.5 - v24 + -1.0;
  }
  else
  {
    if (v35 == 2) {
      double v40 = CGRectGetMaxX(*(CGRect *)&v36) - v34;
    }
    else {
      double v40 = CGRectGetMinX(*(CGRect *)&v36);
    }
    double v41 = v40 - v24;
  }
  if (v41 >= MinX - v24) {
    double v42 = v41;
  }
  else {
    double v42 = MinX - v24;
  }

  double v43 = v42;
  double v44 = v26;
  double v45 = v24;
  double v46 = v47;
  result.size.double height = v46;
  result.size.double width = v45;
  result.origin.double y = v44;
  result.origin.double x = v43;
  return result;
}

- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  [(UITextField *)self _tvUpdateContentBackdropView];
  [(UITextField *)self _tvUpdateTextColor];
  [(UITextField *)self _layoutContentAndExtras];
}

- (BOOL)_isTextLayoutManagerEnabled
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 4) >> 4) & 1;
}

- (NSLayoutManager)layoutManager
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if (has_internal_diagnostics)
  {
    if ((*(void *)&textFieldFlags & 0x1000000000) != 0)
    {
      double v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v9 = 138412290;
        double v10 = self;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "TextKit1 layout manager requested from field (%@) configured to use TextKit2", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else if ((*(void *)&textFieldFlags & 0x1000000000) != 0)
  {
    double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &layoutManager___s_category_0) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      double v10 = self;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "TextKit1 layout manager requested from field (%@) configured to use TextKit2", (uint8_t *)&v9, 0xCu);
    }
  }
  double v5 = [(_UITextLayoutController *)self->_textLayoutController layoutManager];
  return (NSLayoutManager *)v5;
}

- (BOOL)_visualizesDebugRects
{
  return 0;
}

- (BOOL)_shouldEndEditing
{
  return (*((unsigned char *)&self->_textFieldFlags + 1) & 1) == 0
      || [(UITextField *)self _delegateShouldEndEditing];
}

- (id)actualFont
{
  return [(_UICascadingTextStorage *)self->_textStorage font];
}

- (CGPoint)_scrollOffset
{
  double v2 = [(UITextField *)self _fieldEditor];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGSize)_leftViewOffset
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    p_double height = &self->_rightViewOffset.height;
    double width = -self->_rightViewOffset.width;
  }
  else
  {
    p_double height = &self->_leftViewOffset.height;
    double width = self->_leftViewOffset.width;
  }
  double v4 = *p_height;
  result.double height = v4;
  result.double width = width;
  return result;
}

- (void)_setLeftViewOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UITextField *)self _leftViewOffset];
  if (v7 != width || v6 != height)
  {
    if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    {
      uint64_t v9 = 680;
      self->_rightViewOffset.double width = -width;
    }
    else
    {
      uint64_t v9 = 664;
      self->_leftViewOffset.double width = width;
    }
    *(double *)((char *)&self->super.super.super._responderFlags + v9) = height;
    [(UITextField *)self setNeedsLayout];
  }
}

- (CGSize)_rightViewOffset
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    p_double height = &self->_leftViewOffset.height;
    double width = -self->_leftViewOffset.width;
  }
  else
  {
    p_double height = &self->_rightViewOffset.height;
    double width = self->_rightViewOffset.width;
  }
  double v4 = *p_height;
  result.double height = v4;
  result.double width = width;
  return result;
}

- (void)_setRightViewOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UITextField *)self _rightViewOffset];
  if (v7 != width || v6 != height)
  {
    if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    {
      uint64_t v9 = 664;
      self->_leftViewOffset.double width = -width;
    }
    else
    {
      uint64_t v9 = 680;
      self->_rightViewOffset.double width = width;
    }
    *(double *)((char *)&self->super.super.super._responderFlags + v9) = height;
    [(UITextField *)self setNeedsLayout];
  }
}

- (id)_placeholderColor
{
  double v2 = [(UITextField *)self visualStyle];
  double v3 = [v2 placeholderColor];

  return v3;
}

- (id)_placeholderView
{
  return self->_placeholderLabel;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if ((valueForKey__checkedPlaceholderLabel & 1) == 0
    && [v4 isEqualToString:@"_placeholderLabel"])
  {
    UIKVCAccessProhibited((uint64_t)v5, @"UITextField");
    valueForKey__checkedPlaceholderLabel = 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  double v6 = [(UITextField *)&v8 valueForKey:v5];

  return v6;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextField *)self textInputTraits];
  double v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self textInputTraits];
  [v5 takeTraitsFrom:v4];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  double v7 = v6;

  return v7;
}

- (void)_increaseContrastSettingChanged:(id)a3
{
  [(UITextField *)self _invalidateCachedDefaultClearButtonImages];
  [(UITextField *)self setNeedsLayout];
}

- (BOOL)_forcesClearButtonHighContrastAppearance
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 3) >> 5) & 1;
}

- (void)_setForcesClearButtonHighContrastAppearance:(BOOL)a3
{
  if (((((*(void *)&self->_textFieldFlags & 0x20000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x20000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFDFFFFFFFLL | v4);
    [(UITextField *)self _invalidateCachedDefaultClearButtonImages];
    [(UITextField *)self setNeedsLayout];
  }
}

- (void)setDevicePasscodeEntry:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UITextField *)self textInputTraits];
  if ([v5 isDevicePasscodeEntry] != v3)
  {
    [v5 setDevicePasscodeEntry:v3];
    [(UITextField *)self _didChangeSecureTextEntry];
  }
}

- (void)setSecureTextEntry:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UITextField *)self textInputTraits];
  if ([v5 isSecureTextEntry] != v3)
  {
    [v5 setSecureTextEntry:v3];
    [(UITextField *)self _didChangeSecureTextEntry];
  }
}

- (void)_didChangeSecureTextEntry
{
  [(UITextField *)self _setNeedsStyleRecalc];
  BOOL v3 = [(UITextField *)self _shouldObscureInput];
  [(_UITextLayoutController *)self->_textLayoutController setDocumentObscured:v3];
  uint64_t v4 = [(UITextField *)self _fieldEditor];
  objc_msgSend(v4, "setSecureTextEntry:", -[UITextField isSecureTextEntry](self, "isSecureTextEntry"));

  if (v3) {
    uint64_t v5 = 18;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [(_UITextCanvas *)self->_textCanvasView layer];
  [v6 setDisableUpdateMask:v5];

  double v7 = +[UIKeyboardImpl activeInstance];
  objc_super v8 = [v7 inputDelegateManager];
  uint64_t v9 = [v8 keyInputDelegate];

  if (v9 == self)
  {
    double v10 = +[UIKeyboardImpl activeInstance];
    [v10 setDelegate:self];
  }
  if (+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(UIView *)self semanticContentAttribute]] == UIUserInterfaceLayoutDirectionRightToLeft&& [(UITextField *)self textAlignment] == NSTextAlignmentNatural)
  {
    [(UITextField *)self setTextAlignment:2];
  }
  if (v3)
  {
    [(UITextField *)self selectionRange];
    if (v11) {
      [(UITextField *)self selectAll];
    }
  }
  id v12 = [(UITextField *)self interactionAssistant];
  [v12 updateDisplayedSelection];
}

- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(UITextField *)self textInputTraits];
  if ([v6 displaySecureTextUsingPlainText] != v3)
  {
    [v6 setDisplaySecureTextUsingPlainText:v3];
    [(_UITextLayoutController *)self->_textLayoutController setDocumentObscured:[(UITextField *)self _shouldObscureInput]];
    uint64_t v5 = [(UITextField *)self _fieldEditor];
    [v5 setDisplaySecureTextUsingPlainText:v3];
  }
}

- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(UITextField *)self textInputTraits];
  if ([v6 displaySecureEditsUsingPlainText] != v3)
  {
    [v6 setDisplaySecureEditsUsingPlainText:v3];
    uint64_t v5 = [(UITextField *)self _fieldEditor];
    [v5 setDisplaySecureEditsUsingPlainText:v3];
  }
}

- (void)setPasswordRules:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(UITextField *)self textInputTraits];
  uint64_t v5 = [v4 passwordRules];
  char v6 = [v7 isEqual:v5];

  if ((v6 & 1) == 0) {
    [v4 setPasswordRules:v7];
  }
}

- (void)setLinkTextAttributes:(id)a3
{
  uint64_t v4 = (NSDictionary *)[a3 copy];
  linkTextAttributes = self->_linkTextAttributes;
  self->_linkTextAttributes = v4;

  id v6 = [(_UITextLayoutController *)self->_textLayoutController documentRange];
  if (([v6 isEmpty] & 1) == 0)
  {
    [(_UITextLayoutController *)self->_textLayoutController invalidateLayoutForRange:v6];
    [(_UITextCanvas *)self->_textCanvasView setNeedsDisplay];
  }
}

- (NSDictionary)linkTextAttributes
{
  v13[1] = *MEMORY[0x1E4F143B8];
  linkTextAttributes = self->_linkTextAttributes;
  if (linkTextAttributes)
  {
    BOOL v3 = linkTextAttributes;
  }
  else
  {
    id v6 = [(UIView *)self tintColor];
    if (!v6)
    {
      id v6 = [(UIView *)self _normalInheritedTintColor];
      if ([(UIView *)self tintAdjustmentMode] == UIViewTintAdjustmentModeDimmed)
      {
        double v10 = 0.0;
        double v11 = 0.0;
        [v6 getWhite:&v11 alpha:&v10];
        uint64_t v7 = +[UIColor colorWithWhite:v11 alpha:v10 * 0.8];

        id v6 = (void *)v7;
      }
      if (!v6)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"UITextField.m" lineNumber:4381 description:@"Unable to derive tintColor!"];

        id v6 = 0;
      }
    }
    uint64_t v12 = *(void *)off_1E52D2048;
    v13[0] = v6;
    BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  return v3;
}

- (void)setAllowsAttachments:(BOOL)a3
{
  if (((((*(void *)&self->_textFieldFlags & 0x4000000) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    uint64_t v5 = 0x4000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFBFFFFFFLL | v5);
    id v6 = [(UITextField *)self _fieldEditor];
    [v6 setAllowsAttachments:v3];

    if (!v3)
    {
      textStorage = self->_textStorage;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __36__UITextField_setAllowsAttachments___block_invoke;
      v8[3] = &unk_1E530B408;
      void v8[4] = self;
      [(_UICascadingTextStorage *)textStorage coordinateAccess:v8];
    }
  }
}

void __36__UITextField_setAllowsAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)off_1E52D1F50;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 816) length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__UITextField_setAllowsAttachments___block_invoke_2;
  v7[3] = &unk_1E52D9A30;
  id v8 = v3;
  id v6 = v3;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 2, v7);
}

uint64_t __36__UITextField_setAllowsAttachments___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, &stru_1ED0E84C0);
}

- (id)_attributedText
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v3 = [(UITextField *)self _fieldEditor];
    double v2 = [v3 attributedText];
  }
  else
  {
    double v2 = self->_textStorage;
  }
  return v2;
}

- (NSAttributedString)attributedText
{
  if ((*((unsigned char *)&self->_textFieldFlags + 2) & 2) == 0)
  {
    id v3 = [(UITextField *)self text];
    if (v3)
    {
      uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v3];
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = [(UITextField *)self font];

      if (v6)
      {
        uint64_t v7 = [(UITextField *)self font];
        [v5 setObject:v7 forKey:*(void *)off_1E52D2040];
      }
      id v8 = [(UITextField *)self textColor];

      if (v8)
      {
        uint64_t v9 = [(UITextField *)self textColor];
        [v5 setObject:v9 forKey:*(void *)off_1E52D2048];
      }
      objc_msgSend(v4, "setAttributes:range:", v5, 0, objc_msgSend(v4, "length"));
    }
    else
    {
      uint64_t v4 = 0;
    }

    if (!v4) {
      goto LABEL_12;
    }
LABEL_9:
    double v10 = (void *)[v4 mutableCopy];
    double v11 = [v10 mutableString];
    uint64_t v12 = [(UITextField *)self textInputTraits];
    objc_msgSend(v11, "_removeCharactersFromSet:", objc_msgSend(v12, "textTrimmingSet"));

    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v10];
    goto LABEL_13;
  }
  uint64_t v4 = [(UITextField *)self _attributedText];
  if (v4) {
    goto LABEL_9;
  }
LABEL_12:
  double v13 = 0;
LABEL_13:

  return (NSAttributedString *)v13;
}

- (NSString)searchText
{
  if ([(UITextField *)self hasMarkedText])
  {
    id v3 = [(UITextField *)self _fieldEditor];
    uint64_t v4 = [v3 text];
    id v5 = [v3 markedTextRange];
    if (v5)
    {
      id v6 = +[UIKeyboardImpl activeInstance];
      uint64_t v7 = [v6 searchStringForMarkedText];
      id v8 = (void *)v7;
      uint64_t v9 = &stru_1ED0E84C0;
      if (v7) {
        uint64_t v9 = (__CFString *)v7;
      }
      double v10 = v9;

      uint64_t v11 = [(_UITextLayoutController *)self->_textLayoutController characterRangeForTextRange:v5];
      uint64_t v13 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v11, v12, v10);

      uint64_t v4 = (void *)v13;
    }
    double v14 = [(UITextField *)self textInputTraits];
    uint64_t v15 = [v14 textTrimmingSet];

    if (v15)
    {
      uint64_t v16 = [v4 _stringByTrimmingCharactersInCFCharacterSet:v15];

      uint64_t v4 = (void *)v16;
    }
  }
  else
  {
    uint64_t v4 = [(UITextField *)self text];
  }
  if (dyld_program_sdk_at_least())
  {
    uint64_t v17 = [v4 mutableCopy];
    [(UITextField *)self _sanitizeText:v17];

    uint64_t v4 = (void *)v17;
  }
  BOOL v18 = [(UITextField *)self _shouldObscureInput];
  id v19 = v4;
  CGFloat v20 = v19;
  if (v19 && v18) {
    id v21 = (id)[NSString _newZStringWithString:v19];
  }
  else {
    id v21 = v19;
  }
  double v22 = v21;

  return (NSString *)v22;
}

- (void)_setAttributedTextOnFieldEditor:(id)a3 setCaretSelectionAfterText:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v11;
  }
  else {
    id v6 = (id)[v11 mutableCopy];
  }
  uint64_t v7 = v6;
  *(void *)&self->_textFieldFlags |= 0x20000uLL;
  id v8 = [(UITextField *)self _fieldEditor];
  uint64_t v9 = [(UITextField *)self _rangeForSetText];
  objc_msgSend(v8, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", v9, v10, v7, v4);
}

- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4
{
  if (*((unsigned char *)&self->_textFieldFlags + 1)) {
    -[UIFieldEditor _scrollRangeToVisible:animated:](self->_fieldEditor, "_scrollRangeToVisible:animated:", a3.location, a3.length, a4);
  }
}

- (UIColor)textColor
{
  return [(_UICascadingTextStorage *)self->_textStorage textColor];
}

- (void)setShadowColor:(id)a3
{
  [(_UICascadingTextStorage *)self->_textStorage setShadowColor:a3];
  uint64_t v4 = *(void *)off_1E52D2238;
  [(UITextField *)self _syncTypingAttributesWithDefaultAttribute:v4];
}

- (UIColor)shadowColor
{
  return [(_UICascadingTextStorage *)self->_textStorage shadowColor];
}

- (void)setShadowOffset:(CGSize)a3
{
  -[_UICascadingTextStorage setShadowOffset:](self->_textStorage, "setShadowOffset:", a3.width, a3.height);
  uint64_t v4 = *(void *)off_1E52D2238;
  [(UITextField *)self _syncTypingAttributesWithDefaultAttribute:v4];
}

- (CGSize)shadowOffset
{
  [(_UICascadingTextStorage *)self->_textStorage shadowOffset];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setShadowBlur:(double)a3
{
  [(_UICascadingTextStorage *)self->_textStorage setShadowBlur:a3];
  uint64_t v4 = *(void *)off_1E52D2238;
  [(UITextField *)self _syncTypingAttributesWithDefaultAttribute:v4];
}

- (void)setClearsOnInsertion:(BOOL)clearsOnInsertion
{
  BOOL v3 = clearsOnInsertion;
  if ([(UITextField *)self clearsOnInsertion] != clearsOnInsertion)
  {
    uint64_t v5 = 0x80000;
    if (!v3) {
      uint64_t v5 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFF3FFFFLL | v5);
    [(UITextInputTraits *)self->_traits setTextSelectionBehavior:[(UITextField *)self textSelectionBehavior]];
    if ([(UITextField *)self isEditing])
    {
      id v6 = [(UITextField *)self interactionAssistant];
      uint64_t v7 = v6;
      if (v3)
      {
        [v6 deactivateSelection];

        id v8 = [(UITextField *)self _text];
        -[UITextField setSelectionRange:](self, "setSelectionRange:", 0, [v8 length]);
      }
      else
      {
        [v6 activateSelection];

        uint64_t v9 = [(UITextField *)self interactionAssistant];
        [v9 setSelectionDisplayVisible:1];

        id v8 = [(UITextField *)self _fieldEditor];
        objc_msgSend(v8, "setTextSelectionBehavior:", -[UITextInputTraits textSelectionBehavior](self->_traits, "textSelectionBehavior"));
      }

      [(UITextField *)self _updateSelectionGestures];
    }
  }
}

- (void)setClearingBehavior:(int64_t)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if (((*(unint64_t *)&textFieldFlags >> 18) & 3) == a3) {
    return;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&textFieldFlags & 0xFFFFFFFFFFF3FFFFLL | ((unint64_t)(a3 & 3) << 18));
  [(UITextInputTraits *)self->_traits setTextSelectionBehavior:[(UITextField *)self textSelectionBehavior]];
  if (![(UITextField *)self isEditing]) {
    return;
  }
  switch(a3)
  {
    case 0:
      uint64_t v7 = [(UITextField *)self interactionAssistant];
      [v7 activateSelection];

      id v8 = [(UITextField *)self interactionAssistant];
      [v8 setSelectionDisplayVisible:1];

      uint64_t v9 = [(UITextField *)self interactionAssistant];
      [v9 setSelectionHighlightMode:0];

      uint64_t v10 = [(UITextField *)self _fieldEditor];
      objc_msgSend(v10, "setTextSelectionBehavior:", -[UITextInputTraits textSelectionBehavior](self->_traits, "textSelectionBehavior"));
LABEL_11:

      break;
    case 3:
      id v6 = [(UITextField *)self interactionAssistant];
      [v6 setSelectionHighlightMode:1];
      goto LABEL_10;
    case 2:
      id v6 = [(UITextField *)self interactionAssistant];
      [v6 deactivateSelection];
LABEL_10:

      uint64_t v10 = [(UITextField *)self _text];
      -[UITextField setSelectionRange:](self, "setSelectionRange:", 0, [v10 length]);
      goto LABEL_11;
  }
  [(UITextField *)self _updateSelectionGestures];
}

- (int64_t)clearingBehavior
{
  return (*(void *)&self->_textFieldFlags >> 18) & 3;
}

- (void)disableClearsOnInsertion
{
}

void __49__UITextField__adjustFontForAccessibilityTraits___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  uint64_t v7 = [v14 objectForKeyedSubscript:*(void *)off_1E52D21A0];
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
  uint64_t v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && ([v10 isEqual:v11] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D2040, v12, a3, a4);
  }
}

- (NSTextAlignment)textAlignment
{
  return [(_UICascadingTextStorage *)self->_textStorage textAlignment];
}

void __40__UITextField_setDefaultTextAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 _inputController];
  [v7 _addToTypingAttributes:v6 value:v5];
}

- (BOOL)_shouldUpdatePlaceholderTextAlignmentWhenOverridden
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 5) >> 4) & 1;
}

- (void)_setShouldUpdatePlaceholderTextAlignmentWhenOverridden:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (int)controlSize
{
  return self->_controlSize;
}

- (Class)_placeholderLabelClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_preferredRenderingModeForPlaceholder
{
  return 0;
}

- (id)createTextLabelWithTextColor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [UITextFieldLabel alloc];
  id v5 = -[UILabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [off_1E52D39B8 defaultFontSize];
  id v6 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  [(UILabel *)v5 setFont:v6];

  [(UIView *)v5 setOpaque:0];
  [(UIView *)v5 setBackgroundColor:0];
  [(UIView *)v5 setContentMode:3];
  if (v3) {
    [(UILabel *)v5 setTextColor:v3];
  }

  return v5;
}

- (NSAttributedString)attributedPlaceholder
{
  overriddenPlaceholder = self->_overriddenPlaceholder;
  if (overriddenPlaceholder)
  {
    id v3 = overriddenPlaceholder;
  }
  else
  {
    id v3 = [(UILabel *)self->_placeholderLabel attributedText];
  }
  return v3;
}

- (int64_t)_suffixLabelTextAlignment
{
  return 0;
}

- (void)_setSuffix:(id)a3 withColor:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    [(UIView *)suffixLabel removeFromSuperview];
    id v8 = self->_suffixLabel;
    self->_suffixLabel = 0;

    [(UITextField *)self setNeedsLayout];
  }
  if ([v15 length])
  {
    id v9 = v6;
    if (!v6)
    {
      id v9 = +[UIColor placeholderTextColor];
    }
    uint64_t v10 = [(UITextField *)self createTextLabelWithTextColor:v9];
    uint64_t v11 = self->_suffixLabel;
    self->_suffixLabel = v10;

    if (!v6) {
    [(UILabel *)self->_suffixLabel setText:v15];
    }
    uint64_t v12 = [(UITextField *)self font];
    [(UILabel *)self->_suffixLabel setFont:v12];

    [(UILabel *)self->_suffixLabel setTextAlignment:[(UITextField *)self _suffixLabelTextAlignment]];
    BOOL v13 = [(UITextField *)self _cuiCatalog];
    [(UILabel *)self->_suffixLabel _setCuiCatalog:v13];

    id v14 = [(UITextField *)self _cuiStyleEffectConfiguration];
    [(UILabel *)self->_suffixLabel _setCuiStyleEffectConfiguration:v14];

    [(UITextField *)self setNeedsLayout];
  }
}

- (void)_updateSuffix:(id)a3
{
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    [(UILabel *)suffixLabel setText:a3];
    [(UITextField *)self setNeedsLayout];
  }
  else
  {
    [(UITextField *)self _setSuffix:a3 withColor:0];
  }
}

- (void)_setPrefix:(id)a3
{
  id v4 = a3;
  prefixLabel = self->_prefixLabel;
  id v15 = v4;
  if (prefixLabel)
  {
    [(UIView *)prefixLabel removeFromSuperview];
    id v6 = self->_prefixLabel;
    self->_prefixLabel = 0;

    id v4 = v15;
  }
  if ([v4 length])
  {
    id v7 = +[UIColor placeholderTextColor];
    placeholderLabel = self->_placeholderLabel;
    if (placeholderLabel)
    {
      uint64_t v9 = [(UILabel *)placeholderLabel textColor];

      id v7 = (void *)v9;
    }
    uint64_t v10 = [(UITextField *)self createTextLabelWithTextColor:v7];
    uint64_t v11 = self->_prefixLabel;
    self->_prefixLabel = v10;

    [(UILabel *)self->_prefixLabel setText:v15];
    uint64_t v12 = [(UITextField *)self font];
    [(UILabel *)self->_prefixLabel setFont:v12];

    BOOL v13 = [(UITextField *)self _cuiCatalog];
    [(UILabel *)self->_prefixLabel _setCuiCatalog:v13];

    id v14 = [(UITextField *)self _cuiStyleEffectConfiguration];
    [(UILabel *)self->_prefixLabel _setCuiStyleEffectConfiguration:v14];

    [(UITextField *)self setNeedsLayout];
  }
}

- (BOOL)clearsOnBeginEditing
{
  return (*(void *)&self->_textFieldFlags & 0xC0000) == 0x40000;
}

- (void)setClearsOnBeginEditing:(BOOL)clearsOnBeginEditing
{
}

- (BOOL)clearsPlaceholderOnBeginEditing
{
  return (*(unsigned char *)&self->_textFieldFlags >> 6) & 1;
}

- (void)setClearsPlaceholderOnBeginEditing:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setBackground:(UIImage *)background
{
  id v5 = background;
  if (self->_background != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_background, background);
    [(UITextField *)self _invalidateBackgroundProvider];
    id v6 = [(UITextField *)self _backgroundProvider];
    [v6 setNeedsDisplay];

    id v5 = v7;
  }
}

- (void)setDisabledBackground:(UIImage *)disabledBackground
{
  id v5 = disabledBackground;
  if (self->_disabledBackground != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_disabledBackground, disabledBackground);
    [(UITextField *)self setNeedsLayout];
    id v5 = v6;
  }
}

- (BOOL)allowsEditingTextAttributes
{
  return *((unsigned char *)&self->_textFieldFlags + 2) & 1;
}

- (void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes
{
  BOOL v3 = allowsEditingTextAttributes;
  if (([(UITextField *)self isSecureTextEntry] & 1) == 0)
  {
    uint64_t v5 = 0x10000;
    if (!v3) {
      uint64_t v5 = 0;
    }
    unint64_t v6 = *(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFEFFFFLL | v5;
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)v6;
    if (v3) {
      self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(v6 | 0x20000);
    }
  }
}

- (id)_attributedStringForInsertionOfAttributedString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextField *)self _fieldEditor];
  unint64_t v6 = [v5 _inputController];
  id v7 = [v6 _attributedStringForInsertionOfAttributedString:v4];

  return v7;
}

- (NSDictionary)typingAttributes
{
  double v2 = [(UITextField *)self _fieldEditor];
  BOOL v3 = [v2 typingAttributes];

  return (NSDictionary *)v3;
}

- (void)setTypingAttributes:(NSDictionary *)typingAttributes
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if ((*(_WORD *)&textFieldFlags & 0x100) != 0)
  {
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(unint64_t *)&textFieldFlags | 0x20000);
    uint64_t v5 = typingAttributes;
    id v6 = [(UITextField *)self _fieldEditor];
    [v6 setTypingAttributes:v5];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  backgroundProvider = self->_backgroundProvider;
  if (backgroundProvider)
  {
    uint64_t v6 = [(_UITextFieldBackgroundProvider *)backgroundProvider overridingSetBackgroundColor:v4];

    id v4 = (id)v6;
  }
  id v7 = [(UITextField *)self _contentView];

  if (v7 != self)
  {
    id v8 = [(UITextField *)self _contentView];
    [v8 setBackgroundColor:v4];

    id v4 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)UITextField;
  [(UIView *)&v9 setBackgroundColor:v4];
}

- (UITextFieldViewMode)leftViewMode
{
  uint64_t v2 = 10;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0) {
    uint64_t v2 = 9;
  }
  return *(UITextFieldViewMode *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UITextField__fieldEditor[v2]);
}

- (UITextFieldViewMode)rightViewMode
{
  uint64_t v2 = 9;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0) {
    uint64_t v2 = 10;
  }
  return *(UITextFieldViewMode *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UITextField__fieldEditor[v2]);
}

- (id)_contentCoverView
{
  return self->_contentCoverView;
}

- (void)_setContentCoverView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  contentCoverView = self->_contentCoverView;
  if (contentCoverView != v5)
  {
    id v7 = v5;
    [(UIView *)contentCoverView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentCoverView, a3);
    [(UIView *)self->_contentCoverView setUserInteractionEnabled:0];
    [(UITextField *)self _contentCoverStateDidChange];
    uint64_t v5 = v7;
  }
}

- (int64_t)_contentCoverViewMode
{
  return self->_contentCoverViewMode;
}

- (void)_setContentCoverViewMode:(int64_t)a3
{
  if (self->_contentCoverViewMode != a3)
  {
    self->_int64_t contentCoverViewMode = a3;
    [(UITextField *)self _contentCoverStateDidChange];
  }
}

- (BOOL)_contentCoverUnsecuresText
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 3) >> 4) & 1;
}

- (void)_setContentCoverUnsecuresText:(BOOL)a3
{
  if (((((*(void *)&self->_textFieldFlags & 0x10000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x10000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFEFFFFFFFLL | v4);
    if ([(UITextField *)self _showsContentCoverView])
    {
      [(UITextField *)self _contentCoverStateDidChange];
    }
  }
}

- (void)_contentCoverStateDidChange
{
  [(UITextField *)self setNeedsLayout];
  if ([(UIView *)self isFirstResponder])
  {
    if ([(UITextField *)self _showsContentCoverView]) {
      [(UITextField *)self _detachFieldEditor];
    }
    else {
      [(UITextField *)self _attachFieldEditor];
    }
  }
  BOOL v3 = [(UITextField *)self _shouldObscureInput];
  [(_UITextLayoutController *)self->_textLayoutController setDocumentObscured:v3];
  if (v3) {
    [(UIFieldEditor *)self->_fieldEditor _obscureAllText];
  }
  else {
    [(UITextField *)self _invalidateAllGlyphsAndTextLayout];
  }
  [(UITextField *)self _updateSelectionGestures];
}

- (void)_setBackgroundCoverView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  backgroundCoverView = self->_backgroundCoverView;
  if (backgroundCoverView != v5)
  {
    id v7 = v5;
    [(UIView *)backgroundCoverView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundCoverView, a3);
    [(UIView *)self->_backgroundCoverView setUserInteractionEnabled:0];
    [(UITextField *)self _backgroundCoverStateDidChange];
    uint64_t v5 = v7;
  }
}

- (int64_t)_backgroundCoverViewMode
{
  return self->_backgroundCoverViewMode;
}

- (void)_setBackgroundCoverViewMode:(int64_t)a3
{
  if (self->_backgroundCoverViewMode != a3)
  {
    self->_int64_t backgroundCoverViewMode = a3;
    [(UITextField *)self _backgroundCoverStateDidChange];
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
    v5.super_class = (Class)UITextField;
    BOOL v3 = [(UIResponder *)&v5 inputAccessoryView];
  }
  return v3;
}

- (void)setRecentsAccessoryView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  if (self->_recentsAccessoryView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_recentsAccessoryView, a3);
    objc_super v5 = v6;
  }
}

- (UIView)recentsAccessoryView
{
  recentsAccessoryView = self->_recentsAccessoryView;
  if (recentsAccessoryView)
  {
    BOOL v3 = recentsAccessoryView;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextField;
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
  v3.super_class = (Class)UITextField;
  return [(UIResponder *)&v3 _ownsInputAccessoryView];
}

- (void)setInputAssistantItem:(id)a3
{
  objc_super v5 = (UITextInputAssistantItem *)a3;
  if (self->_inputAssistantItem != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_inputAssistantItem, a3);
    objc_super v5 = v6;
  }
}

- (UITextInputAssistantItem)inputAssistantItem
{
  inputAssistantItem = self->_inputAssistantItem;
  if (inputAssistantItem)
  {
    objc_super v3 = inputAssistantItem;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextField;
    objc_super v3 = [(UIResponder *)&v5 inputAssistantItem];
  }
  return v3;
}

- (void)drawTextInRect:(CGRect)rect
{
}

- (void)drawSuffixInRect:(CGRect)a3
{
}

- (void)drawPrefixInRect:(CGRect)a3
{
}

- (void)setTextSelectionBehavior:(int)a3
{
  [(UITextInputTraits *)self->_traits setTextSelectionBehavior:*(void *)&a3];
  uint64_t v4 = [(UITextField *)self textSelectionBehavior];
  traits = self->_traits;
  [(UITextInputTraits *)traits setTextSelectionBehavior:v4];
}

- (void)_removeFieldEditorAndHost
{
  objc_super v3 = objc_getAssociatedObject(self, &FieldEditorHostKey);
  if (v3)
  {
    id v4 = v3;
    [v3 removeFieldEditor];
    objc_setAssociatedObject(self, &FieldEditorHostKey, 0, (void *)1);
    objc_super v3 = v4;
  }
}

- (void)_attachFieldEditor
{
  if ([(UITextField *)self _showsContentCoverView])
  {
    [(UITextField *)self _invalidateAllGlyphsAndTextLayout];
  }
  else
  {
    objc_super v3 = [(UITextField *)self _fieldEditor];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __33__UITextField__attachFieldEditor__block_invoke;
    BOOL v13 = &unk_1E52D9F98;
    id v4 = v3;
    id v14 = v4;
    id v15 = self;
    +[UIView performWithoutAnimation:&v10];
    $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    if ((*(_WORD *)&textFieldFlags & 0x100) == 0)
    {
      self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(unint64_t *)&textFieldFlags | 0x100);
      [(UITextField *)self _willAttachFieldEditor];
      [(UITextField *)self _addFieldEditorToView];
      [v4 activateEditor];
    }
    if ([(UIView *)self isFirstResponder])
    {
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      if ([(UITextField *)self clearsOnBeginEditing]
        && [(UITextField *)self _delegateShouldClear])
      {
        id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1ED0E84C0];
        [v4 setAttributedText:v7];
      }
      id v8 = [(UITextField *)self _inputController];
      [v8 setAllowsEditingTextAttributes:(*(void *)&self->_textFieldFlags >> 16) & 1];

      if ((*(_WORD *)&textFieldFlags & 0x100) == 0)
      {
        [(UIControl *)self _sendActionsForEvents:0x10000 withEvent:0];
        objc_super v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v9 addObserver:self selector:sel__applicationResuming_ name:@"UIApplicationResumedNotification" object:UIApp];
      }
      [(UITextField *)self _activateSelectionView];
    }
    if ((*(_WORD *)&textFieldFlags & 0x100) == 0) {
      [(UITextField *)self _didAttachFieldEditor];
    }
    [(UITextField *)self setNeedsLayout];
  }
}

uint64_t __33__UITextField__attachFieldEditor__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) editRect];
  return objc_msgSend(v1, "setFrame:");
}

- (void)_detachFieldEditor
{
}

- (void)_detachFieldEditorDiscardingEdits:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  fieldEditor = self->_fieldEditor;
  if (fieldEditor)
  {
    BOOL v6 = a4;
    BOOL v7 = a3;
    id v8 = [(UIFieldEditor *)fieldEditor _scrollAnimationEndedAction];

    if (v8)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Text", &qword_1EB25E5C8);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v10 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Detaching field editor while detaching was already in progress. Bailing.", buf, 2u);
        }
      }
    }
    else
    {
      [(UITextField *)self _stopObservingFieldEditorScroll];
      if (v6 && ([(UIScrollView *)self->_fieldEditor contentOffset], v13 > 0.0))
      {
        objc_initWeak((id *)buf, self);
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        double v25 = __58__UITextField__detachFieldEditorDiscardingEdits_animated___block_invoke;
        double v26 = &unk_1E530B458;
        objc_copyWeak(&v27, (id *)buf);
        BOOL v28 = v7;
        [(UIFieldEditor *)self->_fieldEditor _setScrollAnimationEndedAction:&v23];
        -[UIFieldEditor setContentOffset:animated:](self->_fieldEditor, "setContentOffset:animated:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v23, v24, v25, v26);
        objc_destroyWeak(&v27);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (!v7) {
          [(UITextField *)self _willUpdateAfterDetachingFieldEditor];
        }
        [(UIFieldEditor *)self->_fieldEditor deactivateEditorDiscardingEdits:v7];
        *(void *)&self->_textFieldFlags &= ~0x100uLL;
        if (!v7) {
          [(UITextField *)self _didUpdateAfterDetachingFieldEditor];
        }
        [(UITextField *)self _didDetachFieldEditor];
        if ([(UIView *)self isFirstResponder])
        {
          if ((*((unsigned char *)&self->_textFieldFlags + 1) & 8) == 0) {
            [(UIControl *)self _sendActionsForEvents:0x40000 withEvent:0];
          }
          id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v14 removeObserver:self name:@"UIApplicationResumedNotification" object:0];

          [(UITextField *)self _removeFieldEditorAndHost];
          if ((*((unsigned char *)&self->_textFieldFlags + 2) & 2) != 0)
          {
            id v15 = [(UIFieldEditor *)self->_fieldEditor _inputController];
            uint64_t v16 = [v15 typingAttributes];

            if (!v16 || [v16 count]) {
              [(_UICascadingTextStorage *)self->_textStorage setDefaultAttributes:v16];
            }
          }
          uint64_t v17 = [(UITextField *)self interactionAssistant];
          [v17 deactivateSelection];
        }
        else
        {
          [(UITextField *)self _removeFieldEditorAndHost];
        }
        [(UITextField *)self _addTextCanvasViewAdjustingFrame:1];
        [(UITextField *)self setNeedsLayout];
      }
    }
  }
  else
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v12 = [(UITextField *)self _fieldEditorHost];

    if (has_internal_diagnostics)
    {
      if (v12)
      {
        BOOL v18 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          double v22 = [(UITextField *)self _fieldEditorHost];
          *(_DWORD *)buf = 138412290;
          double v30 = v22;
          _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Detaching non-existing fieldeditor, but have a host (%@)", buf, 0xCu);
        }
      }
    }
    else if (v12)
    {
      id v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E5C0) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        CGFloat v20 = v19;
        id v21 = [(UITextField *)self _fieldEditorHost];
        *(_DWORD *)buf = 138412290;
        double v30 = v21;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Detaching non-existing fieldeditor, but have a host (%@)", buf, 0xCu);
      }
    }
    [(UITextField *)self _removeFieldEditorAndHost];
  }
}

void __58__UITextField__detachFieldEditorDiscardingEdits_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _detachFieldEditorDiscardingEdits:*(unsigned __int8 *)(a1 + 40) animated:0];
  [WeakRetained layoutIfNeeded];
}

- (id)_defaultPromptString
{
  overriddenPlaceholder = self->_overriddenPlaceholder;
  if (overriddenPlaceholder)
  {
    id v4 = [(NSAttributedString *)overriddenPlaceholder string];
  }
  else
  {
    objc_super v5 = [(UITextField *)self attributedPlaceholder];
    BOOL v6 = [v5 string];
    BOOL v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(UITextField *)self placeholder];
    }
    id v4 = v8;
  }
  return v4;
}

- (void)_addFieldEditorToView
{
  objc_super v3 = [(UITextField *)self _fieldEditorHostAllowingCreation:1];
  id v4 = [(UITextField *)self _fieldEditor];
  [v3 addFieldEditor:v4];

  [(UITextField *)self _invalidateAllGlyphsAndTextLayout];
}

- (id)_editingProcessor
{
  objc_super v3 = objc_getAssociatedObject(self, &EditingProcessorKey);
  if (!v3)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_super v3 = objc_opt_new();
      [v3 setDelegate:self->_visualStyle];
      objc_setAssociatedObject(self, &EditingProcessorKey, v3, (void *)1);
    }
    else
    {
      objc_super v3 = 0;
    }
  }
  return v3;
}

- (void)_didAttachFieldEditor
{
  id v4 = objc_getAssociatedObject(self, &EditingTokenKey);
  if (v4)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UITextField.m" lineNumber:6269 description:@"The textfield is already editing?!"];
  }
  objc_super v5 = [(UITextField *)self _editingProcessor];
  id value = [v5 beginEditingWithTextStorage:self->_textStorage];

  if (value)
  {
    objc_setAssociatedObject(self, &EditingTokenKey, value, (void *)0x301);
    [(UITextField *)self _invalidateAfterUpdatingEditingAttributes];
  }
  BOOL v6 = [(UITextField *)self _inputController];
  [v6 _updateEmptyStringAttributes];

  [(UITextField *)self _ensureSelectionContainerViewSubviewOrdering];
}

- (void)_willUpdateAfterDetachingFieldEditor
{
  [(UITextField *)self willChangeValueForKey:@"text"];
  [(UITextField *)self willChangeValueForKey:@"attributedText"];
}

- (void)_didUpdateAfterDetachingFieldEditor
{
  [(UITextField *)self didChangeValueForKey:@"text"];
  objc_super v3 = objc_getAssociatedObject(self, &EditingTokenKey);
  id v4 = v3;
  if (v3)
  {
    BOOL v6 = v3;
    int v5 = [v3 endEditing];
    id v4 = v6;
    if (v5)
    {
      [(UIView *)self invalidateIntrinsicContentSize];
      id v4 = v6;
    }
  }
}

- (void)_didDetachFieldEditor
{
  objc_setAssociatedObject(self, &EditingTokenKey, 0, (void *)1);
  id v3 = [(UITextField *)self _inputController];
  [v3 _updateEmptyStringAttributes];
}

- (void)_invalidateAfterUpdatingEditingAttributes
{
  [(UITextField *)self setTypingAttributes:0];
  [(UITextField *)self _invalidateAllGlyphsAndTextLayout];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 0x80000;
}

- (BOOL)_shouldEndEditingOnReturn
{
  return 0;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(UITextField *)self isEditing]
    || [(UITextField *)self _showsContentCoverView]
    && [v9 isEqualToString:@"\n"])
  {
    id WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
    if ([v9 isEqualToString:@"\n"])
    {
      if (objc_opt_respondsToSelector())
      {
        char v11 = [(UITextField *)WeakRetained textFieldShouldReturn:self];
LABEL_14:
        BOOL v12 = v11;
        goto LABEL_15;
      }
      if ([(UITextField *)self _shouldEndEditingOnReturn])
      {
        [(UIView *)self endEditing:0];
        BOOL v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    double v13 = [(UITextField *)self _fieldEditor];
    uint64_t v14 = [v13 selectionRange];
    uint64_t v16 = v15;

    char v18 = 0;
    BOOL v12 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", v14, v16, v9, &v18);
    if (v18 || (objc_opt_respondsToSelector() & 1) == 0 || WeakRetained == self) {
      goto LABEL_15;
    }
    char v11 = [(UITextField *)WeakRetained keyboardInput:v8 shouldInsertText:v9 isMarkedText:v5];
    goto LABEL_14;
  }
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  if ([(UITextField *)self isEditing]) {
    BOOL v9 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", location, length, v8, 0);
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4 = a3;
  if ([(UITextField *)self isEditing])
  {
    BOOL v5 = [(UITextField *)self _inputController];
    uint64_t v6 = [v5 _rangeForBackwardsDelete];
    uint64_t v8 = v7;

    char v13 = 0;
    if (v8
      && (BOOL v9 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", v6, v8, &stru_1ED0E84C0, &v13), v13))
    {
      char v10 = v9;
    }
    else
    {
      id WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
      char v10 = 1;
      if ((objc_opt_respondsToSelector() & 1) != 0 && WeakRetained != self) {
        char v10 = [(UITextField *)WeakRetained keyboardInputShouldDelete:v4];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id v4 = a3;
  if ([(UITextField *)self isEditing])
  {
    id WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0 || WeakRetained == self)
    {
      [(UITextField *)self setNeedsLayout];
      char v6 = 1;
    }
    else
    {
      char v6 = [(UITextField *)WeakRetained keyboardInputChanged:v4];
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  id v5 = a3;
  if ([(UITextField *)self isEditing])
  {
    id WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0 && WeakRetained != self) {
      [(UITextField *)WeakRetained keyboardInputChangedSelection:v5];
    }
  }
}

- (id)customOverlayContainer
{
  id WeakRetained = (UITextField *)objc_loadWeakRetained(&self->_delegate);
  id v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0 && WeakRetained != self)
  {
    id v4 = [(UITextField *)WeakRetained customOverlayContainer];
  }

  return v4;
}

- (void)fieldEditorDidChange:(id)a3
{
  if ([(UITextField *)self adjustsFontSizeToFitWidth]) {
    [(UITextField *)self _setNeedsStyleRecalc];
  }
  BOOL v4 = [(UITextField *)self _hasContent];
  if (self->_clearButtonMode || v4 == [(UITextField *)self _isShowingPlaceholder]) {
    [(UITextField *)self setNeedsLayout];
  }
  if (([(UITextField *)self _shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged]|| ![(UITextField *)self hasMarkedText])&& (*((unsigned char *)&self->_textFieldFlags + 1) & 0x80) == 0)
  {
    [(UIControl *)self _sendActionsForEvents:0x20000 withEvent:0];
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"UITextFieldTextDidChangeNotification" object:self];
  }
  if (v4)
  {
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UITextField *)self setNeedsLayout];
  }
  else
  {
    [(UITextField *)self _invalidateAllGlyphsAndTextLayout];
  }
  suffixLabel = self->_suffixLabel;
  if (suffixLabel)
  {
    [(UITextField *)self _suffixFrame];
    -[UILabel setFrame:](suffixLabel, "setFrame:");
  }
  prefixLabel = self->_prefixLabel;
  if (prefixLabel)
  {
    [(UITextField *)self _prefixFrame];
    -[UILabel setFrame:](prefixLabel, "setFrame:");
  }
  id v8 = [(UITextField *)self _fieldEditorHost];
  [v8 layoutIfNeeded];
}

- (_NSRange)fieldEditor:(id)a3 willChangeSelectionFromCharacterRange:(_NSRange)a4 toCharacterRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    NSUInteger location = objc_msgSend(WeakRetained, "textField:willChangeSelectionFromCharacterRange:toCharacterRange:", self, v8, v7, location, length);
    NSUInteger length = v11;
  }

  NSUInteger v12 = location;
  NSUInteger v13 = length;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (void)fieldEditorDidChangeSelection:(id)a3
{
  id v8 = a3;
  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    id v5 = +[UITextDragDropSupport installTextDragDropOnView:self];
    char v6 = self->_textDragDropSupport;
    self->_textDragDropSupport = v5;

    textDragDropSupport = self->_textDragDropSupport;
  }
  [(UITextDragDropSupport *)textDragDropSupport notifyTextInteraction];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained textFieldDidChangeSelection:self];
  }
}

- (BOOL)fieldEditor:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a4;
  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    char v10 = +[UITextDragDropSupport installTextDragDropOnView:self];
    NSUInteger v11 = self->_textDragDropSupport;
    self->_textDragDropSupport = v10;

    textDragDropSupport = self->_textDragDropSupport;
  }
  [(UITextDragDropSupport *)textDragDropSupport notifyTextInteraction];
  BOOL v12 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", location, length, v8, 0);
  [(UITextField *)self disableClearsOnInsertion];

  return v12;
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  uint64_t v3 = qword_1EB25E5D0;
  if (!qword_1EB25E5D0)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = (void *)qword_1EB25E5D0;
    qword_1EB25E5D0 = (uint64_t)v4;

    char v6 = (void *)qword_1EB25E5D0;
    NSUInteger v7 = [(id)*MEMORY[0x1E4F444F8] identifier];
    [v6 addObject:v7];

    [(id)qword_1EB25E5D0 addObjectsFromArray:UIPasteboardTypeListString];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v9 = (void *)qword_1EB25E5D8;
    qword_1EB25E5D8 = (uint64_t)v8;

    [(id)qword_1EB25E5D8 addObject:*MEMORY[0x1E4FB6E28]];
    char v10 = (void *)qword_1EB25E5D8;
    NSUInteger v11 = [(id)*MEMORY[0x1E4F444A0] identifier];
    [v10 addObject:v11];

    BOOL v12 = (void *)qword_1EB25E5D8;
    NSUInteger v13 = [(id)*MEMORY[0x1E4F444A8] identifier];
    [v12 addObject:v13];

    [(id)qword_1EB25E5D8 addObjectsFromArray:qword_1EB25E5D0];
    uint64_t v3 = qword_1EB25E5D0;
  }
  if ((*(void *)&self->_textFieldFlags & 0x10000) != 0) {
    uint64_t v14 = (void *)qword_1EB25E5D8;
  }
  else {
    uint64_t v14 = (void *)v3;
  }
  return v14;
}

- (id)_dictationInterpretations
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = [(UITextField *)self text];
  id v5 = [v3 arrayWithObject:v4];

  return v5;
}

- (id)documentFragmentForPasteboardItemAtIndex:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v6 = [WeakRetained documentFragmentForPasteboardItemAtIndex:a3 inTextField:self];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setClearButtonStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    [(UITextField *)self setClearButtonMode:qword_186B9D8D8[a3]];
  }
}

- (void)drawRect:(CGRect)a3
{
  if ((*((unsigned char *)&self->_textFieldFlags + 4) & 2) != 0)
  {
    [(UIView *)self bounds];
    -[UITextField borderRectForBounds:](self, "borderRectForBounds:");
    backgroundProvider = self->_backgroundProvider;
    -[_UITextFieldBackgroundProvider drawInBounds:](backgroundProvider, "drawInBounds:");
  }
}

- (id)_defaultFocusEffect
{
  return 0;
}

- (void)_setPadding:(UIEdgeInsets)a3
{
  p_padding = &self->_padding;
  double top = self->_padding.top;
  double bottom = self->_padding.bottom;
  if (a3.left == self->_padding.left && a3.top == top && a3.right == self->_padding.right && a3.bottom == bottom) {
    return;
  }
  if (a3.bottom != bottom)
  {
    p_padding->double top = a3.top;
    self->_padding.double left = a3.left;
    self->_padding.double bottom = a3.bottom;
    self->_padding.double right = a3.right;
LABEL_15:
    [(UIView *)self _invalidateBaselineConstraints];
    goto LABEL_16;
  }
  p_padding->double top = a3.top;
  self->_padding.double left = a3.left;
  self->_padding.double bottom = a3.bottom;
  self->_padding.double right = a3.right;
  if (a3.top != top) {
    goto LABEL_15;
  }
LABEL_16:
  [(UITextField *)self _setNeedsStyleRecalc];
}

- (void)_setLeadingPadding:(double)a3
{
  double left = a3;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    double right = a3;
    double left = self->_padding.left;
  }
  else
  {
    double right = self->_padding.right;
  }
  -[UITextField _setPadding:](self, "_setPadding:", self->_padding.top, left, self->_padding.bottom, right);
}

- (void)_setTrailingPadding:(double)a3
{
  double left = a3;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    double right = self->_padding.right;
  }
  else
  {
    double right = a3;
    double left = self->_padding.left;
  }
  -[UITextField _setPadding:](self, "_setPadding:", self->_padding.top, left, self->_padding.bottom, right);
}

- (void)setPaddingTop:(float)a3 paddingLeft:(float)a4
{
}

- (void)setPaddingLeft:(float)a3
{
}

- (void)setPaddingRight:(float)a3
{
}

- (float)paddingTop
{
  return self->_padding.top;
}

- (float)paddingBottom
{
  return self->_padding.bottom;
}

- (void)_enabledDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITextField *)self _backgroundProvider];
  [v4 enabledDidChangeAnimated:v3];
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(UIControl *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  [(UIControl *)&v8 setHighlighted:v5];
  if (v7 != [(UIControl *)self isHighlighted]) {
    [(UITextField *)self _highlightedDidChangeAnimated:v4];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&textFieldFlags & 0xFFFFFFFEFFFFFFFFLL);
  [(UITextField *)self _setHighlighted:a3 animated:HIDWORD(*(unint64_t *)&textFieldFlags) & 1];
}

- (void)_highlightedDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITextField *)self _backgroundProvider];
  [v4 highlightedDidChangeAnimated:v3];
}

- (void)_animateNextHighlightChange
{
  *(void *)&self->_textFieldFlags |= 0x100000000uLL;
}

- (void)selectAll
{
  id v3 = [(UITextField *)self _text];
  -[UITextField setSelectionRange:](self, "setSelectionRange:", 0, [v3 length]);
}

- (void)_clearSelectionUI
{
  id v3 = [(UITextField *)self interactionAssistant];
  id v4 = [v3 activeSelection];
  [v4 clearSelection];

  id v5 = [(UITextField *)self interactionAssistant];
  [v5 updateDisplayedSelection];
}

- (void)_resetSelectionUI
{
  id v3 = [(UITextField *)self interactionAssistant];
  id v4 = [v3 activeSelection];
  [v4 selectionChanged];

  id v5 = [(UITextField *)self interactionAssistant];
  [v5 updateDisplayedSelection];
}

- (void)clearText
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v5 = [(UITextField *)self _fieldEditor];
    uint64_t v3 = [(UITextField *)self _rangeForSetText];
    objc_msgSend(v5, "setTextInRange:replacementText:", v3, v4, &stru_1ED0E84C0);
  }
}

- (id)_tvTypingAttributes
{
  uint64_t v3 = [(UITextField *)self typingAttributes];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [(UITextField *)self _fieldEditorHeight];
  double v6 = v5;
  BOOL v7 = [(UITextField *)self font];
  objc_super v8 = [v7 fontWithSize:v6];

  if (v8) {
    [v4 setObject:v8 forKey:*(void *)off_1E52D2040];
  }

  return v4;
}

- (void)_forceObscureAllText
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v2 = [(UITextField *)self _fieldEditor];
    [v2 _obscureAllText];
  }
}

- (BOOL)_blurEnabled
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 2) >> 6) & 1;
}

- (void)_setBlurEnabled:(BOOL)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if (((((*(void *)&textFieldFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x400000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&textFieldFlags & 0xFFFFFFFFFFBFFFFFLL | v4);
  }
}

- (BOOL)_visualEffectViewEnabled
{
  return *((unsigned __int8 *)&self->_textFieldFlags + 2) >> 7;
}

- (void)_setVisualEffectViewEnabled:(BOOL)a3 backgroundColor:(id)a4
{
  uint64_t v4 = 0x800000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFF7FFFFFLL | v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v6.receiver = self;
  v6.super_class = (Class)UITextField;
  [(UITextField *)&v6 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
}

- (_NSRange)selectionRange
{
  id v2 = [(UITextField *)self _fieldEditor];
  uint64_t v3 = [v2 selectionRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (void)setSelectionRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(UITextField *)self _fieldEditor];
  objc_msgSend(v5, "setSelection:", location, length);
}

- (void)setIcon:(id)a3
{
  id v13 = a3;
  id v4 = [(UIImageView *)self->_iconView image];

  id v5 = v13;
  if (v4 != v13)
  {
    iconView = self->_iconView;
    if (v13)
    {
      if (iconView)
      {
        -[UIImageView setImage:](iconView, "setImage:");
        [(UIView *)self->_iconView sizeToFit];
      }
      else
      {
        objc_super v8 = [[UIImageView alloc] initWithImage:v13];
        BOOL v9 = self->_iconView;
        self->_iconView = v8;

        char v10 = [(UITextField *)self _contentView];
        [v10 addSubview:self->_iconView];

        NSUInteger v11 = [(UITextField *)self _contentView];
        [v11 bringSubviewToFront:self->_iconView];
      }
      BOOL v12 = self->_iconView;
      [(UITextField *)self iconRect];
      -[UIImageView setFrame:](v12, "setFrame:");
    }
    else
    {
      [(UIView *)iconView removeFromSuperview];
      NSUInteger v7 = self->_iconView;
      self->_iconView = 0;
    }
    [(UITextField *)self setNeedsLayout];
    id v5 = v13;
  }
}

- (CGRect)iconRect
{
  iconView = self->_iconView;
  if (iconView)
  {
    [(UIView *)iconView size];
    double v4 = v3;
    double v6 = v5;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v4;
  result.origin.double y = v7;
  result.origin.double x = v8;
  return result;
}

- (void)setProgress:(float)a3
{
  if (objc_opt_respondsToSelector())
  {
    backgroundProvider = self->_backgroundProvider;
    [(_UITextFieldBackgroundProvider *)backgroundProvider setProgress:a3];
  }
}

- (BOOL)hasMarkedText
{
  id v2 = [(UITextField *)self _fieldEditor];
  double v3 = [v2 markedTextRange];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setLabelOffset:(float)a3
{
  label = self->_label;
  if (label)
  {
    [(UIView *)label frame];
    double v7 = v6 - self->_labelOffset;
    self->_labelOffset = a3;
    double v8 = self->_label;
    double v9 = v7 + a3;
    [(UILabel *)v8 setFrame:v9];
  }
  else
  {
    self->_labelOffset = a3;
  }
}

- (id)textLabel
{
  [(UIView *)self->_label sizeToFit];
  label = self->_label;
  return label;
}

- (void)setLabel:(id)a3
{
  id v20 = a3;
  BOOL v4 = [(UILabel *)self->_label text];
  if ([v4 length] || objc_msgSend(v20, "length"))
  {
    double v5 = [(UILabel *)self->_label text];
    char v6 = [v5 isEqualToString:v20];

    double v7 = v20;
    if (v6) {
      goto LABEL_15;
    }
    uint64_t v8 = [v20 length];
    label = self->_label;
    if (v8)
    {
      if (!label)
      {
        char v10 = objc_alloc_init(UILabel);
        NSUInteger v11 = self->_label;
        self->_label = v10;

        BOOL v12 = [(UITextField *)self _contentView];
        [v12 addSubview:self->_label];

        [(UILabel *)self->_label setEnabled:0];
        [(UIView *)self->_label setOpaque:0];
        [(UIView *)self->_label setBackgroundColor:0];
        id v13 = [(UITextField *)self _cuiCatalog];
        [(UILabel *)self->_label _setCuiCatalog:v13];

        uint64_t v14 = [(UITextField *)self _cuiStyleEffectConfiguration];
        [(UILabel *)self->_label _setCuiStyleEffectConfiguration:v14];

        uint64_t v15 = self->_textStorage;
        uint64_t v16 = [(_UICascadingTextStorage *)v15 font];

        if (v16)
        {
          uint64_t v17 = self->_label;
          char v18 = [(_UICascadingTextStorage *)v15 font];
          [(UILabel *)v17 setFont:v18];
        }
        label = self->_label;
      }
      [(UILabel *)label setText:v20];
      [(UIView *)self->_label sizeToFit];
    }
    else if (label)
    {
      [(UIView *)label removeFromSuperview];
      id v19 = self->_label;
      self->_label = 0;
    }
    [(UITextField *)self setNeedsLayout];
  }
  else
  {
  }
  double v7 = v20;
LABEL_15:
}

- (void)setTextCentersHorizontally:(BOOL)a3
{
}

- (void)setTextCentersVertically:(BOOL)a3
{
  if (((((*(void *)&self->_textFieldFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFFFFFELL | a3);
    [(UITextField *)self _setNeedsStyleRecalc];
  }
}

- (void)setUndoEnabled:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (a3) {
    uint64_t v3 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)isUndoEnabled
{
  return (*((unsigned char *)&self->_textFieldFlags + 1) & 0x10) == 0 && [(UITextField *)self isEditing];
}

- (void)_clearButtonClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ([(UITextField *)self _delegateShouldClear])
  {
    $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
    if ((*(_WORD *)&textFieldFlags & 0x100) != 0)
    {
      id v6 = [(UITextField *)self _fieldEditor];
      [v6 selectionRange];
      if (v7) {
        objc_msgSend(v6, "setSelection:", 0, 0);
      }
      [v6 clearText];
      $53C8F00389CE9BE12F0B2EE980283837 v8 = self->_textFieldFlags;
      self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(unint64_t *)&v8 | 0x8000);
      [(UITextField *)self fieldEditorDidChange:v6];
      self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFFFFFFFF7FFFLL | (((*(unint64_t *)&v8 >> 15) & 1) << 15));
    }
    else
    {
      self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&textFieldFlags | 0x800000000);
      [(UITextField *)self setText:&stru_1ED0E84C0];
      *(void *)&self->_textFieldFlags &= ~0x800000000uLL;
      [(UIControl *)self _sendActionsForEvents:0x20000 withEvent:0];
      double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"UITextFieldTextDidChangeNotification" object:self];
    }
    double v9 = +[UIKeyboardImpl activeInstance];
    [v9 textChanged:0];

    char v10 = +[UIKeyboardImpl activeInstance];
    [v10 didClearText];

    if (+[UIDictationController isRunning])
    {
      NSUInteger v11 = +[UIDictationController sharedInstance];
      [v11 resetDictation];
    }
    [(UITextField *)self setClearsOnInsertion:0];
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained textFieldDidClear:self];
    }
    else if (objc_opt_respondsToSelector())
    {
      [WeakRetained textFieldClearButtonPressed:self];
    }
    if ((*(void *)&self->_textFieldFlags & 0x120) == 0x20) {
      [(UITextField *)self becomeFirstResponder];
    }
  }
}

- (void)setClearButtonOffset:(CGSize)a3
{
  if (self->_clearButtonOffset.width != a3.width || self->_clearButtonOffset.height != a3.height)
  {
    self->_clearButtonOffset = a3;
    [(UITextField *)self setNeedsLayout];
  }
}

- (id)undoManager
{
  if ([(UITextField *)self isUndoEnabled])
  {
    uint64_t v3 = [(UITextField *)self _fieldEditor];
    BOOL v4 = [v3 undoManager];
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (BOOL)_textShouldUseVibrancy
{
  return self->_tvUseVibrancy;
}

- (id)_currentTextColor
{
  return [(_UICascadingTextStorage *)self->_textStorage textColor];
}

- (int64_t)_lineBreakMode
{
  return [(_UICascadingTextStorage *)self->_textStorage lineBreakMode];
}

- (BOOL)_hasFloatingFieldEditor
{
  id v2 = self;
  uint64_t v3 = [(UITextField *)self _fieldEditor];
  LOBYTE(v2) = [v3 isDescendantOfView:v2] ^ 1;

  return (char)v2;
}

- (BOOL)_inVibrantContentView
{
  uint64_t v3 = [(UITextField *)self _fieldEditor];
  BOOL v4 = [(UIVisualEffectView *)self->_contentBackdropView contentView];
  char v5 = [v3 isDescendantOfView:v4];

  return v5;
}

- (double)_fieldEditorHeight
{
  id v2 = [(UITextField *)self _fieldEditor];
  [v2 frame];
  double v4 = round(v3 * 0.6857);

  return v4;
}

- (BOOL)_textShouldFillFieldEditorHeight
{
  return 1;
}

- (BOOL)_shouldOverrideEditingFont
{
  return 1;
}

- (id)_textStorageTextColor
{
  return [(_UICascadingTextStorage *)self->_textStorage textColor];
}

- (BOOL)_uiktest_shouldDisableTextColorUpdateOnTraitCollectionChange
{
  return self->_disableTextColorUpdateOnTraitCollectionChange;
}

- (BOOL)_uiktest_tvUseVibrancy
{
  return self->_tvUseVibrancy;
}

- (id)_uiktest_placeholderLabelColor
{
  id v2 = [(UITextField *)self _placeholderLabel];
  double v3 = [v2 textColor];

  return v3;
}

- (id)_uiktest_tvCustomTextColor
{
  return self->_tvCustomTextColor;
}

- (void)beginSelectionChange
{
  id v2 = [(UITextField *)self _fieldEditor];
  [v2 beginSelectionChange];
}

- (void)endSelectionChange
{
  id v2 = [(UITextField *)self _fieldEditor];
  [v2 endSelectionChange];
}

- (BOOL)hasSelection
{
  id v2 = [(UITextField *)self _fieldEditor];
  [v2 selectionRange];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(UITextField *)self _fieldEditor];
  uint64_t v7 = [(UITextField *)self textInputView];
  objc_msgSend(v6, "convertPoint:fromView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  id v12 = [(UITextField *)self _fieldEditor];
  objc_msgSend(v12, "startAutoscroll:", v9, v11);
}

- (void)cancelAutoscroll
{
  id v2 = [(UITextField *)self _fieldEditor];
  [v2 cancelAutoscroll];
}

- (BOOL)_restoreFirstResponder
{
  if ((*((unsigned char *)&self->_textFieldFlags + 1) & 8) != 0) {
    return 0;
  }
  uint64_t v3 = [(UITextField *)self interactionAssistant];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 checkEditabilityAndSetFirstResponderIfNecessary];
    unsigned __int8 v5 = [(UIView *)self isFirstResponder];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextField;
    unsigned __int8 v5 = [(UIResponder *)&v8 _restoreFirstResponder];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UITextField *)self interactionAssistant];
  objc_msgSend(v5, "beginFloatingCursorAtPoint:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UITextField *)self interactionAssistant];
  objc_msgSend(v5, "updateFloatingCursorAtPoint:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v7 = [(UITextField *)self interactionAssistant];
  objc_msgSend(v7, "updateFloatingCursorAtPoint:animated:", v4, x, y);
}

- (void)endFloatingCursor
{
  id v2 = [(UITextField *)self interactionAssistant];
  [v2 endFloatingCursor];
}

- (id)selectedText
{
  uint64_t v3 = [(UITextField *)self _fieldEditor];
  BOOL v4 = [(UITextField *)self _fieldEditor];
  id v5 = [v4 selectedTextRange];
  BOOL v6 = [v3 textInRange:v5];

  BOOL v7 = [(UITextField *)self _shouldObscureInput];
  id v8 = v6;
  double v9 = v8;
  if (v8 && v7) {
    id v10 = (id)[NSString _newZStringWithString:v8];
  }
  else {
    id v10 = v8;
  }
  double v11 = v10;

  return v11;
}

- (id)selectedAttributedText
{
  uint64_t v3 = [(UITextField *)self attributedText];
  uint64_t v4 = [(UITextField *)self selectionRange];
  BOOL v6 = objc_msgSend(v3, "attributedSubstringFromRange:", v4, v5);

  return v6;
}

- (id)_activityItemsConfigurationAtLocation:(CGPoint)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [UIActivityItemsConfiguration alloc];
  uint64_t v5 = [(UITextField *)self selectedText];
  v9[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  BOOL v7 = [(UIActivityItemsConfiguration *)v4 initWithObjects:v6];

  return v7;
}

- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (unint64_t)offsetInMarkedTextForSelection:(id)a3
{
  return 0;
}

- (CGPoint)constrainedPoint:(CGPoint)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (id)webView
{
  return 0;
}

- (id)_proxyTextInput
{
  if (self->_fieldEditor) {
    self = (UITextField *)self->_fieldEditor;
  }
  return self;
}

- (void)cut:(id)a3
{
  id v5 = a3;
  if ([(UITextField *)self keyboardInputShouldDelete:self])
  {
    double v4 = [(UITextField *)self _inputController];
    [v4 cut:v5];
  }
}

- (void)copy:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 copy:v4];

  id v6 = [(UITextField *)self interactionAssistant];
  [v6 hideSelectionCommands];
}

- (void)_define:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 _define:v4];
}

- (void)_translate:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 _translate:v4];
}

- (void)_share:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 _share:v4];
}

- (BOOL)_isDisplayingTextService
{
  id v2 = [(UITextField *)self _inputController];
  char v3 = [v2 _isDisplayingTextService];

  return v3;
}

- (BOOL)_isDisplayingShortcutViewController
{
  id v2 = [(UITextField *)self _inputController];
  char v3 = [v2 _isDisplayingShortcutViewController];

  return v3;
}

- (BOOL)_isDisplayingReferenceLibraryViewController
{
  id v2 = [(UITextField *)self _inputController];
  char v3 = [v2 _isDisplayingReferenceLibraryViewController];

  return v3;
}

- (BOOL)_isDisplayingShareViewController
{
  id v2 = [(UITextField *)self _inputController];
  char v3 = [v2 _isDisplayingShareViewController];

  return v3;
}

- (BOOL)_isDisplayingLookupViewController
{
  id v2 = [(UITextField *)self _inputController];
  char v3 = [v2 _isDisplayingLookupViewController];

  return v3;
}

- (void)_selectionMayChange:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 _selectionMayChange:v4];
}

- (void)_setBackgroundStrokeColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _systemBackgroundView];
  [v5 setStrokeColor:v4];
}

- (id)_backgroundStrokeColor
{
  id v2 = [(UITextField *)self _systemBackgroundView];
  char v3 = [v2 strokeColor];

  return v3;
}

- (void)_setBackgroundFillColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _systemBackgroundView];
  [v5 setFillColor:v4];
}

- (id)_backgroundFillColor
{
  id v2 = [(UITextField *)self _systemBackgroundView];
  char v3 = [v2 fillColor];

  return v3;
}

- (void)_setBackgroundStrokeWidth:(double)a3
{
  id v4 = [(UITextField *)self _systemBackgroundView];
  [v4 setLineWidth:a3];
}

- (double)_backgroundStrokeWidth
{
  id v2 = [(UITextField *)self _systemBackgroundView];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v8 = a3;
    id v9 = [(UITextField *)self _inputController];
    objc_msgSend(v9, "setAttributes:range:", v8, location, length);
  }
  else
  {
    textStorage = self->_textStorage;
    id v9 = a3;
    -[NSConcreteTextStorage setAttributes:range:](textStorage, "setAttributes:range:");
  }
}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 _insertAttributedTextWithoutClosingTyping:v4];
}

- (void)_addShortcut:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 _addShortcut:v4];
}

- (void)paste:(id)a3
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v4 = a3;
    id v5 = [(UITextField *)self _fieldEditor];
    [v5 _clearOnEditIfNeeded];

    id v6 = [(UITextField *)self _inputController];
    [v6 paste:v4];
  }
}

- (void)pasteAndMatchStyle:(id)a3
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v4 = a3;
    id v5 = [(UITextField *)self _fieldEditor];
    [v5 _clearOnEditIfNeeded];

    id v6 = [(UITextField *)self _inputController];
    [v6 pasteAndMatchStyle:v4];
  }
}

- (id)_effectivePasteConfiguration
{
  v8.receiver = self;
  v8.super_class = (Class)UITextField;
  double v3 = [(UIResponder *)&v8 _effectivePasteConfiguration];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(UITextField *)self _implicitPasteConfigurationClasses];
    id v5 = +[UIPasteConfiguration _pasteConfigurationForAcceptingClasses:v6];
  }
  return v5;
}

- (id)_implicitPasteConfigurationClasses
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(UITextField *)self isEditable])
  {
    BOOL v3 = [(UITextField *)self allowsEditingTextAttributes];
    uint64_t v4 = objc_opt_class();
    if (v3)
    {
      uint64_t v12 = v4;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      id v5 = (void *)MEMORY[0x1E4F1C978];
      id v6 = &v12;
      uint64_t v7 = 3;
    }
    else
    {
      uint64_t v10 = v4;
      uint64_t v11 = objc_opt_class();
      id v5 = (void *)MEMORY[0x1E4F1C978];
      id v6 = &v10;
      uint64_t v7 = 2;
    }
    objc_super v8 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v10, v11, v12, v13, v14);
  }
  else
  {
    objc_super v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (void)pasteItemProviders:(id)a3
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v4 = a3;
    id v5 = [(UITextField *)self _fieldEditor];
    [v5 _clearOnEditIfNeeded];

    id v6 = [(UITextField *)self _inputController];
    [v6 pasteItemProviders:v4];
  }
}

+ (Class)_textPasteItemClass
{
  return (Class)objc_opt_class();
}

- (void)_pasteSessionDidFinish:(id)a3
{
  if ([(UITextField *)self _shouldObscureInput])
  {
    [(UITextField *)self _forceObscureAllText];
    [(UITextField *)self setNeedsLayout];
  }
}

- (void)select:(id)a3
{
  id v3 = [(UITextField *)self interactionAssistant];
  [v3 selectWord];
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self interactionAssistant];
  [v5 selectAll:v4];
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 makeTextWritingDirectionRightToLeft:v4];
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 makeTextWritingDirectionNatural:v4];
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 makeTextWritingDirectionLeftToRight:v4];
}

- (void)toggleBoldface:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 toggleBoldface:v4];
}

- (void)toggleItalics:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 toggleItalics:v4];
}

- (void)toggleUnderline:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 toggleUnderline:v4];
}

- (void)increaseSize:(id)a3
{
  id v4 = [(UITextField *)self _inputController];
  [v4 increaseSize:self];
}

- (void)decreaseSize:(id)a3
{
  id v4 = [(UITextField *)self _inputController];
  [v4 decreaseSize:self];
}

- (void)replace:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 replace:v4];
}

- (void)_promptForReplace:(id)a3
{
  id v3 = [(UITextField *)self interactionAssistant];
  [v3 scheduleReplacements];
}

- (void)_transliterateChinese:(id)a3
{
  id v3 = [(UITextField *)self interactionAssistant];
  [v3 scheduleChineseTransliteration];
}

- (void)captureTextFromCamera:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 captureTextFromCamera:v4];
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 validateCommand:v4];
}

- (BOOL)_inPopover
{
  uint64_t v2 = [(UIView *)self superview];
  if (v2)
  {
    id v3 = (void *)v2;
    do
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        break;
      }
      uint64_t v5 = [v3 superview];

      id v3 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  BOOL v8 = sel_paste_ == a3 || sel_select_ == a3 || sel_selectAll_ == a3;
  if (v8 && [(UITextField *)self _isPasscodeStyle])
  {
    unsigned __int8 v9 = 0;
  }
  else
  {
    uint64_t v10 = [(UITextField *)self _inputController];
    int v11 = [v10 _canHandleResponderAction:a3];

    if (v11)
    {
      uint64_t v12 = [(UITextField *)self _inputController];
      unsigned __int8 v9 = [v12 _shouldHandleResponderAction:a3 withSender:v6];
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)UITextField;
      unsigned __int8 v9 = [(UIView *)&v14 canPerformAction:a3 withSender:v6];
    }
  }

  return v9;
}

- (void)insertAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 insertAttributedText:v4];
}

- (id)attributedTextInRange:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  id v6 = [v5 attributedTextInRange:v4];

  return v6;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextField *)self _fieldEditor];
  [v8 replaceRange:v7 withText:v6];
}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextField *)self _fieldEditor];
  [v8 replaceRange:v7 withAttributedText:v6];
}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextField *)self _fieldEditor];
  [v8 replaceRangeWithTextWithoutClosingTyping:v7 replacementText:v6];
}

- (void)setSelectedTextRange:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 setSelectedTextRange:v4];
}

- (id)_rangeForTextKitRanges:(id)a3
{
  return (id)[(_UITextLayoutController *)self->_textLayoutController textRangeForTextKit2Ranges:a3];
}

- (NSDictionary)markedTextStyle
{
  return [(UIFieldEditor *)self->_fieldEditor markedTextStyle];
}

- (void)setMarkedTextStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 setMarkedTextStyle:v4];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = [(UITextField *)self _fieldEditor];
  objc_msgSend(v8, "setMarkedText:selectedRange:", v7, location, length);
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = [(UITextField *)self _fieldEditor];
  objc_msgSend(v8, "setAttributedMarkedText:selectedRange:", v7, location, length);
}

- (void)unmarkText
{
}

- (UITextPosition)endOfDocument
{
  uint64_t v2 = [(UITextField *)self _fieldEditor];
  id v3 = [v2 endOfDocument];

  return (UITextPosition *)v3;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8 = a3;
  unsigned __int8 v9 = [(UITextField *)self _fieldEditor];
  uint64_t v10 = [v9 positionFromPosition:v8 inDirection:a4 offset:a5];

  return v10;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UITextField *)self _fieldEditor];
  id v8 = [v7 positionWithinRange:v6 farthestInDirection:a4];

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UITextField *)self _fieldEditor];
  id v8 = [v7 characterRangeByExtendingPosition:v6 inDirection:a4];

  return v8;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [(UITextField *)self _fieldEditor];
  objc_super v14 = objc_msgSend(v13, "_visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:", v12, v11, a6, x, y);

  return v14;
}

- (void)setInputDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 setInputDelegate:v4];
}

- (UITextInputDelegate)inputDelegate
{
  uint64_t v2 = [(UITextField *)self _fieldEditor];
  id v3 = [v2 inputDelegate];

  return (UITextInputDelegate *)v3;
}

- (UITextInputTokenizer)tokenizer
{
  uint64_t v2 = [(UITextField *)self _fieldEditor];
  id v3 = [v2 tokenizer];

  return (UITextInputTokenizer *)v3;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UITextField *)self _fieldEditor];
  int64_t v8 = [v7 baseWritingDirectionForPosition:v6 inDirection:a4];

  return v8;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v6 = a4;
  id v7 = [(UITextField *)self _fieldEditor];
  [v7 setBaseWritingDirection:a3 forRange:v6];
}

- (CGRect)firstRectForRange:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 firstRectForRange:v4];
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
  id v6 = a3;
  double v7 = [(UITextField *)self _inputController];
  double v8 = [v7 textStylingAtPosition:v6 inDirection:a4];

  return v8;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double x = a3.x;
  id v5 = [(_UITextLayoutController *)self->_textLayoutController beginningOfDocument];
  [(UITextField *)self caretRectForPosition:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v19.origin.double x = v7;
  v19.origin.double y = v9;
  v19.size.double width = v11;
  v19.size.double height = v13;
  double MidY = CGRectGetMidY(v19);
  double v15 = [(UITextField *)self _fieldEditor];
  double v16 = objc_msgSend(v15, "closestPositionToPoint:", x, MidY);

  return v16;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double x = a3.x;
  textLayoutController = self->_textLayoutController;
  id v7 = a4;
  double v8 = [(_UITextLayoutController *)textLayoutController beginningOfDocument];
  [(UITextField *)self caretRectForPosition:v8];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v22.origin.double x = v10;
  v22.origin.double y = v12;
  v22.size.double width = v14;
  v22.size.double height = v16;
  double MidY = CGRectGetMidY(v22);
  char v18 = [(UITextField *)self _fieldEditor];
  CGRect v19 = objc_msgSend(v18, "closestPositionToPoint:withinRange:", v7, x, MidY);

  return v19;
}

- (void)_setCursorAccessories:(id)a3
{
  interactionAssistant = self->_interactionAssistant;
  id v4 = a3;
  id v6 = [(UITextInteractionAssistant *)interactionAssistant _selectionViewManager];
  id v5 = [v6 _cursorAccessoryViewController];
  [v5 setAccessories:v4];
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UITextField *)self _fieldEditor];
  id v6 = objc_msgSend(v5, "characterRangeAtPoint:", x, y);

  return v6;
}

- (id)metadataDictionariesForDictationResults
{
  if (*((unsigned char *)&self->_textFieldFlags + 1))
  {
    id v3 = [(UITextField *)self _fieldEditor];
    uint64_t v2 = [v3 metadataDictionariesForDictationResults];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6 = a4;
  id v10 = [a3 singleLineResult];
  id v7 = [v10 phrases];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      double v9 = [v10 dictationPhraseArray];
      [(UITextField *)self insertDictationResult:v9];
    }
    else
    {
      double v9 = [(UITextField *)self _fieldEditor];
      [v9 insertDictationResult:v10 withCorrectionIdentifier:v6];
    }
  }
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(UITextField *)self _fieldEditor];
  id v6 = objc_msgSend(v5, "insertTextPlaceholderWithSize:", width, height);

  return v6;
}

- (void)removeTextPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 removeTextPlaceholder:v4];
}

- (id)insertDictationResultPlaceholder
{
  uint64_t v2 = [(UITextField *)self _fieldEditor];
  id v3 = [v2 insertDictationResultPlaceholder];

  return v3;
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 frameForDictationResultPlaceholder:v4];
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
  id v6 = a3;
  id v7 = [(UITextField *)self _fieldEditor];
  [v7 removeDictationResultPlaceholder:v6 willInsertResult:v4];
}

- (void)_setForceDisplayOverridePlaceholder:(BOOL)a3
{
  self->_forceDisplayOverridePlaceholder = a3;
  [(UITextField *)self setNeedsLayout];
}

- (BOOL)_forceDisplayOverridePlaceholder
{
  return self->_forceDisplayOverridePlaceholder;
}

- (void)_setOverridePlaceholder:(id)a3 alignment:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!self->_overriddenPlaceholder)
  {
    if (!v6) {
      goto LABEL_14;
    }
    id v22 = v6;
    double v9 = [(UITextField *)self attributedPlaceholder];
    double v10 = v9;
    double v11 = v9
        ? (NSAttributedString *)v9
        : (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
    overriddenPlaceholder = self->_overriddenPlaceholder;
    self->_overriddenPlaceholder = v11;

    CGRect v19 = [(UITextField *)self _placeholderLabel];
    self->_int64_t overriddenPlaceholderAlignment = [v19 textAlignment];

    [(UITextField *)self _setAttributedPlaceholder:v22];
    id v20 = [(UITextField *)self _placeholderLabel];
    [v20 setTextAlignment:a4];

    char v21 = objc_opt_respondsToSelector();
    id v7 = v22;
    if ((v21 & 1) == 0) {
      goto LABEL_14;
    }
    placeholderLabel = self->_placeholderLabel;
    uint64_t v17 = 1;
LABEL_12:
    [(UITextFieldLabel *)placeholderLabel setShouldRenderWithoutTextField:v17];
    goto LABEL_13;
  }
  id v22 = v6;
  if (!v6)
  {
    -[UITextField _setAttributedPlaceholder:](self, "_setAttributedPlaceholder:");
    int64_t overriddenPlaceholderAlignment = self->_overriddenPlaceholderAlignment;
    double v13 = [(UITextField *)self _placeholderLabel];
    [v13 setTextAlignment:overriddenPlaceholderAlignment];

    double v14 = self->_overriddenPlaceholder;
    self->_overriddenPlaceholder = 0;

    char v15 = objc_opt_respondsToSelector();
    id v7 = 0;
    if ((v15 & 1) == 0) {
      goto LABEL_14;
    }
    placeholderLabel = self->_placeholderLabel;
    uint64_t v17 = 0;
    goto LABEL_12;
  }
  [(UITextField *)self _setAttributedPlaceholder:v6];
  double v8 = [(UITextField *)self _placeholderLabel];
  [v8 setTextAlignment:a4];

LABEL_13:
  id v7 = v22;
LABEL_14:
}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  id v6 = a4;
  id v7 = [(UITextField *)self _fieldEditor];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(UITextField *)self _fieldEditor];
    double v10 = [v9 rangeWithTextAlternatives:a3 atPosition:v6];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldResignOnEditingDidEndOnExit
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [(UIControl *)self _hasActionForEventMask:0x80000];
}

- (BOOL)_shouldIgnoreBaseWritingDirectionChanges
{
  return 0;
}

- (BOOL)_shouldDisplayDictationPlaceholderMessage
{
  return *((unsigned __int8 *)&self->_textFieldFlags + 4) >> 7;
}

- (void)_setShouldDisplayDictationPlaceholderMessage:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)_delegateShouldBeginEditing
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [WeakRetained textFieldShouldBeginEditing:self];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
    char v4 = [WeakRetained textFieldShouldStartEditing:self];
  }
  BOOL v5 = v4;
LABEL_7:

  return v5;
}

- (_NSRange)_rangeForClearButton
{
  NSUInteger v2 = [(NSConcreteTextStorage *)self->_textStorage length];
  NSUInteger v3 = 0;
  result.NSUInteger length = v2;
  result.NSUInteger location = v3;
  return result;
}

- (_NSRange)_textRangeForTextStorageRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)_delegateShouldEndEditing
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained textFieldShouldEndEditing:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained _textFieldShouldScrollToVisibleWhenBecomingFirstResponder:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_delegateShouldClear
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained textFieldShouldClear:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  uint64_t v11 = -[UITextField _textRangeForTextStorageRange:](self, "_textRangeForTextStorageRange:", location, length);
  uint64_t v13 = v12;
  char v14 = objc_opt_respondsToSelector();
  if (v14)
  {
    char v15 = objc_msgSend(WeakRetained, "textField:shouldChangeCharactersInRange:replacementString:", self, v11, v13, v9);
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v15 = 1;
  if (a5) {
LABEL_5:
  }
    *a5 = v14 & 1;
LABEL_6:

  return v15;
}

- (BOOL)hasText
{
  if ((*((unsigned char *)&self->_textFieldFlags + 1) & 1) == 0) {
    return [(NSConcreteTextStorage *)self->_textStorage length] != 0;
  }
  NSUInteger v3 = [(UITextField *)self _fieldEditor];
  char v4 = [v3 hasText];

  return v4;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  [v5 insertText:v4];
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  id v6 = [off_1E52D2EA8 attributedText:a3 withAlternativeTexts:a4 style:a5];
  [(UITextField *)self insertAttributedText:v6];
}

- (void)insertText:(id)a3 style:(int64_t)a4 alternatives:(id)a5
{
}

- (void)addTextAlternatives:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _inputController];
  [v5 addTextAlternatives:v4];
}

- (void)removeEmojiAlternatives
{
  id v2 = [(UITextField *)self _inputController];
  [v2 removeEmojiAlternatives];
}

- (_NSRange)insertFilteredText:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 insertFilteredText:v4];
    uint64_t v8 = v7;
  }
  else
  {
    [v5 insertText:v4];
    uint64_t v8 = [v4 length];
    uint64_t v6 = 0;
  }

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (void)deleteBackward
{
  id v2 = [(UITextField *)self _fieldEditor];
  [v2 deleteBackward];
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  if (a3)
  {
    [(UITextField *)self deleteBackward];
  }
  else
  {
    id v4 = [(UITextField *)self _fieldEditor];
    [v4 _deleteBackwardAndNotify:0];
  }
}

- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete
{
  id v2 = [(UITextField *)self _inputController];
  unint64_t v3 = [v2 textLengthToDeleteBeforeSelectedRangeForSmartDelete];

  return v3;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITextField *)self _inputController];
  [v4 setContinuousSpellCheckingEnabled:v3];
}

- (double)_preferredBackgroundCornerRadius
{
  return self->_preferredBackgroundCornerRadius;
}

- (int64_t)_blurEffectStyleForAppearance
{
  id v2 = +[UISystemInputViewController _canonicalTraitsForResponder:self];
  uint64_t v3 = [v2 keyboardAppearance];
  uint64_t v4 = 4016;
  uint64_t v5 = 4012;
  if (v3 == 1) {
    uint64_t v5 = 4013;
  }
  if (v3 != 9) {
    uint64_t v4 = v5;
  }
  if (v3 == 10) {
    int64_t v6 = 5006;
  }
  else {
    int64_t v6 = v4;
  }

  return v6;
}

- (BOOL)_shouldDetermineInterfaceStyleTextColor
{
  return 1;
}

- (void)_tvUpdateTextColor
{
  if ([(UITextField *)self _fieldEditorAttached])
  {
    id v8 = [(_UITextFieldVisualStyle *)self->_visualStyle defaultTextColorForKeyboardAppearance];
    [(UITextField *)self _setTextColor:v8];
  }
  else
  {
    if ([(UIView *)self isFocused])
    {
      tvCustomFocusedTextColor = self->_tvCustomFocusedTextColor;
      if (tvCustomFocusedTextColor)
      {
        uint64_t v4 = tvCustomFocusedTextColor;
      }
      else
      {
        uint64_t v4 = [(_UITextFieldVisualStyle *)self->_visualStyle defaultFocusedTextColor];
      }
      uint64_t v7 = v4;
      [(_UICascadingTextStorage *)self->_textStorage setTextColor:v4];
      self->_tvUseVibrancdouble y = 0;
    }
    else
    {
      tvCustomTextColor = self->_tvCustomTextColor;
      if (tvCustomTextColor)
      {
        int64_t v6 = tvCustomTextColor;
      }
      else
      {
        int64_t v6 = [(_UITextFieldVisualStyle *)self->_visualStyle defaultTextColor];
      }
      uint64_t v7 = v6;
      [(_UICascadingTextStorage *)self->_textStorage setTextColor:v6];
      self->_tvUseVibrancdouble y = self->_tvCustomTextColor == 0;
    }

    [(UITextField *)self _updateLabelAppearance];
  }
}

- (id)_contentBackdropView
{
  return self->_contentBackdropView;
}

- (int64_t)_blurEffectStyle
{
  if (dyld_program_sdk_at_least()) {
    return 5006;
  }
  return [(UITextField *)self _blurEffectStyleForAppearance];
}

- (void)_updateSelectionGestures
{
  id v6 = [(UITextField *)self interactionAssistant];
  if ([(UITextField *)self isTextDragActive]
    || [(UITextField *)self isTextDropActive])
  {
    if ([(UIView *)self isFirstResponder]) {
      [v6 deactivateSelection];
    }
    goto LABEL_5;
  }
  BOOL v3 = [(UITextField *)self _showsContentCoverView];
  BOOL v4 = [(UIView *)self isFirstResponder];
  if (v3)
  {
    uint64_t v5 = v6;
    if (v4)
    {
      [v6 deactivateSelection];
      [v6 hideSelectionCommands];
LABEL_5:
      [v6 clearGestureRecognizers:1];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = v6;
    if (v4)
    {
      [v6 activateSelection];
      uint64_t v5 = v6;
    }
  }
  [v5 setGestureRecognizers];
LABEL_6:
}

- (id)obtainSelectionGrabberSuppressionAssertion
{
  id v2 = [(UITextField *)self interactionAssistant];
  BOOL v3 = [v2 obtainSelectionGrabberSuppressionAssertion];

  return v3;
}

- (BOOL)_allowAssistanceInSubtree
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  CGRect v19 = __65__UITextField_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
  id v20 = &unk_1E530B488;
  id v11 = v9;
  id v21 = v11;
  id v22 = self;
  uint64_t v12 = (unsigned int (**)(void *, UIView *))_Block_copy(&v17);
  if ([(UITextField *)self _showsLeftView] && v12[2](v12, self->_leftView))
  {
    [(UIView *)self->_leftView frame];
    uint64_t v13 = @"_UITextFieldLeftViewRegion";
LABEL_7:
    char v14 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v13);
    goto LABEL_9;
  }
  if ([(UITextField *)self _showsRightView] && v12[2](v12, self->_rightView))
  {
    [(UIView *)self->_rightView frame];
    uint64_t v13 = @"_UITextFieldRightViewRegion";
    goto LABEL_7;
  }
  char v15 = [(UITextField *)self interactionAssistant];
  char v14 = [v15 pointerInteraction:v8 regionForRequest:v11 defaultRegion:v10];

LABEL_9:
  return v14;
}

uint64_t __65__UITextField_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [*(id *)(a1 + 32) location];
  v22.double x = v12;
  v22.double y = v13;
  v23.origin.double x = v5;
  v23.origin.double y = v7;
  v23.size.double width = v9;
  v23.size.double height = v11;
  if (CGRectContainsPoint(v23, v22)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v3 alpha], v14 + 0.0001 >= 0.0)
    && ([v3 isHidden] & 1) == 0)
  {
    uint64_t v17 = [v3 superview];
    uint64_t v18 = *(void **)(a1 + 40);
    id v19 = v17;
    id v20 = v18;
    id v21 = v20;
    if (v19 == v20)
    {
      uint64_t v15 = 1;
    }
    else
    {
      uint64_t v15 = 0;
      if (v19 && v20) {
        uint64_t v15 = [v19 isEqual:v20];
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 identifier];
  char v9 = [v8 isEqual:@"_UITextFieldLeftViewRegion"];

  if (v9)
  {
    double v10 = &OBJC_IVAR___UITextField__leftView;
  }
  else
  {
    CGFloat v11 = [v7 identifier];
    int v12 = [v11 isEqual:@"_UITextFieldRightViewRegion"];

    if (!v12)
    {
LABEL_8:
      double v14 = [(UITextField *)self interactionAssistant];
      uint64_t v17 = [v14 pointerInteraction:v6 styleForRegion:v7];
      goto LABEL_14;
    }
    double v10 = &OBJC_IVAR___UITextField__rightView;
  }
  id v13 = *(id *)((char *)&self->super.super.super.super.isa + *v10);
  if (!v13) {
    goto LABEL_8;
  }
  double v14 = v13;
  uint64_t v15 = [v13 _pointerEffect];
  if ([v15 isMemberOfClass:objc_opt_class()])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __49__UITextField_pointerInteraction_styleForRegion___block_invoke;
    v21[3] = &unk_1E530B4B0;
    v21[4] = self;
    id v22 = v14;
    char v23 = v9 ^ 1;
    double v16 = [v22 _shapeInContainer:self proposal:v21];
  }
  else
  {
    double v16 = [v14 _shapeInContainer:self];
  }
  uint64_t v18 = [v14 pointerStyleProvider];
  id v19 = (void *)v18;
  if (!v18
    || ((*(void (**)(uint64_t, void *, void *, void *))(v18 + 16))(v18, v14, v15, v16),
        (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v17 = +[UIPointerStyle styleWithEffect:v15 shape:v16];
  }

LABEL_14:
  return v17;
}

id __49__UITextField_pointerInteraction_styleForRegion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  CGRect v24 = CGRectInset(v23, 2.0, 2.0);
  CGFloat x = v24.origin.x;
  double y = v24.origin.y;
  CGFloat width = v24.size.width;
  double height = v24.size.height;
  id v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _visualBounds];
  objc_msgSend(v6, "convertRect:fromView:", *(void *)(a1 + 40));
  double MidX = CGRectGetMidX(v25);
  CGFloat v8 = x;
  double v9 = y;
  CGFloat v10 = width;
  double v11 = height;
  if (*(unsigned char *)(a1 + 48))
  {
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v8);
    double v13 = MaxX - MidX + MaxX - MidX;
    v26.origin.CGFloat x = x;
    v26.origin.double y = y;
    v26.size.CGFloat width = width;
    v26.size.double height = height;
    double v14 = CGRectGetMaxX(v26);
    v27.origin.CGFloat x = x;
    v27.origin.double y = y;
    v27.size.CGFloat width = v13;
    v27.size.double height = height;
    double v15 = v14 - CGRectGetWidth(v27);
  }
  else
  {
    CGFloat MinX = CGRectGetMinX(*(CGRect *)&v8);
    double v13 = MidX - MinX + MidX - MinX;
    v28.origin.CGFloat x = x;
    v28.origin.double y = y;
    v28.size.CGFloat width = width;
    v28.size.double height = height;
    double v15 = CGRectGetMinX(v28);
  }
  if ([*(id *)(a1 + 32) borderStyle] == 3)
  {
    double v17 = *(double *)(*(void *)(a1 + 32) + 928) + -2.0;
LABEL_8:
    id v20 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v15, y, v13, height, v17);
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) _cornerRadius];
  if (v18 > 0.0)
  {
    [*(id *)(a1 + 32) _cornerRadius];
    double v17 = v19 + -2.0;
    goto LABEL_8;
  }
  id v20 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v15, y, v13, height);
LABEL_10:
  return v20;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(UITextField *)self interactionAssistant];
  [v11 pointerInteraction:v10 willEnterRegion:v9 animator:v8];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(UITextField *)self interactionAssistant];
  [v11 pointerInteraction:v10 willExitRegion:v9 animator:v8];
}

- (void)addGhostedRange:(id)a3
{
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

- (UIDragInteraction)textDragInteraction
{
  textDragDropSupport = self->_textDragDropSupport;
  if (textDragDropSupport)
  {
    double v4 = textDragDropSupport;
LABEL_4:
    id v7 = [(UIView *)self interactions];
    id v8 = [(UITextDragDropSupport *)v4 dragInteraction];
    if ([v7 indexOfObject:v8] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [(UITextDragDropSupport *)v4 dragInteraction];
    }

    goto LABEL_8;
  }
  CGFloat v5 = +[UITextDragDropSupport installTextDragDropOnView:self];
  id v6 = self->_textDragDropSupport;
  self->_textDragDropSupport = v5;

  double v4 = self->_textDragDropSupport;
  if (v4) {
    goto LABEL_4;
  }
  id v9 = 0;
LABEL_8:
  return (UIDragInteraction *)v9;
}

- (UIDropInteraction)textDropInteraction
{
  textDragDropSupport = self->_textDragDropSupport;
  if (textDragDropSupport)
  {
    double v4 = textDragDropSupport;
LABEL_4:
    id v7 = [(UIView *)self interactions];
    id v8 = [(UITextDragDropSupport *)v4 dropInteraction];
    if ([v7 indexOfObject:v8] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [(UITextDragDropSupport *)v4 dropInteraction];
    }

    goto LABEL_8;
  }
  CGFloat v5 = +[UITextDragDropSupport installTextDragDropOnView:self];
  id v6 = self->_textDragDropSupport;
  self->_textDragDropSupport = v5;

  double v4 = self->_textDragDropSupport;
  if (v4) {
    goto LABEL_4;
  }
  id v9 = 0;
LABEL_8:
  return (UIDropInteraction *)v9;
}

- (void)invalidateDropCaret
{
  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    double v4 = +[UITextDragDropSupport installTextDragDropOnView:self];
    CGFloat v5 = self->_textDragDropSupport;
    self->_textDragDropSupport = v4;

    textDragDropSupport = self->_textDragDropSupport;
  }
  [(UITextDragDropSupport *)textDragDropSupport invalidateDropCaret];
}

- (BOOL)isTextDragActive
{
  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    double v4 = +[UITextDragDropSupport installTextDragDropOnView:self];
    CGFloat v5 = self->_textDragDropSupport;
    self->_textDragDropSupport = v4;

    textDragDropSupport = self->_textDragDropSupport;
  }
  return [(UITextDragDropSupport *)textDragDropSupport isDragActive];
}

- (BOOL)isTextDropActive
{
  textDragDropSupport = self->_textDragDropSupport;
  if (!textDragDropSupport)
  {
    double v4 = +[UITextDragDropSupport installTextDragDropOnView:self];
    CGFloat v5 = self->_textDragDropSupport;
    self->_textDragDropSupport = v4;

    textDragDropSupport = self->_textDragDropSupport;
  }
  return [(UITextDragDropSupport *)textDragDropSupport isDropActive];
}

- (void)draggingFinished:(id)a3
{
  id v6 = a3;
  [(UITextField *)self _updateSelectionGestures];
  if (![(UIView *)self isFirstResponder]) {
    [(UITextField *)self _detachFieldEditor];
  }
  if (([v6 dragTearoffOccured] & 1) == 0)
  {
    [(UITextField *)self selectionRange];
    if (v4)
    {
      CGFloat v5 = [(UITextField *)self interactionAssistant];
      [v5 showSelectionCommands];
    }
  }
}

- (id)willGenerateCancelPreview
{
  id v3 = (void *)MEMORY[0x1E4F29238];
  uint64_t v4 = [(UITextField *)self _fieldEditor];
  [v4 contentOffset];
  CGFloat v5 = objc_msgSend(v3, "valueWithPoint:");

  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v8 = [(UITextField *)self _fieldEditor];
  objc_msgSend(v8, "setContentOffset:", v6, v7);

  return v5;
}

- (void)didGenerateCancelPreview:(id)a3
{
  [a3 CGPointValue];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(UITextField *)self _fieldEditor];
  objc_msgSend(v8, "setContentOffset:", v5, v7);
}

- (void)performCancelAnimations
{
  if (![(UIView *)self isFirstResponder]
    && [(UITextField *)self _fieldEditorAttached])
  {
    fieldEditor = self->_fieldEditor;
    id v4 = [(UITextField *)self beginningOfDocument];
    [(UITextField *)self caretRectForPosition:v4];
    -[UIScrollView scrollRectToVisible:animated:](fieldEditor, "scrollRectToVisible:animated:", 1);
  }
}

- (BOOL)allowsDraggingAttachments
{
  return 0;
}

- (BOOL)canBecomeDropResponder
{
  return ![(UITextField *)self _showsContentCoverView];
}

- (void)becomeDropResponder
{
  if (![(UIView *)self isFirstResponder] && (*((unsigned char *)&self->_textFieldFlags + 1) & 1) == 0)
  {
    [(UITextField *)self _attachFieldEditor];
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v5 = [(UITextField *)self _fieldEditor];
    objc_msgSend(v5, "setContentOffset:", v3, v4);

    id v6 = [(UITextField *)self _fieldEditor];
    [v6 setScrollEnabled:1];
  }
}

- (void)resignDropResponderWithDropPerformed:(BOOL)a3
{
  if (![(UIView *)self isFirstResponder] && (*((unsigned char *)&self->_textFieldFlags + 1) & 1) != 0)
  {
    double v5 = [(UITextField *)self _fieldEditor];
    [v5 setScrollEnabled:0];

    char v6 = 0;
    if (!a3) {
      char v6 = ![(UITextField *)self isTextDragActive];
    }
    double v7 = [(UITextField *)self _fieldEditor];
    [v7 _contentOffsetAnimationDuration];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__UITextField_resignDropResponderWithDropPerformed___block_invoke;
    v10[3] = &unk_1E52D9FC0;
    v10[4] = self;
    char v11 = v6;
    dispatch_after(v9, MEMORY[0x1E4F14428], v10);
  }
  [(UITextField *)self _updateSelectionGestures];
}

uint64_t __52__UITextField_resignDropResponderWithDropPerformed___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFirstResponder];
  if ((result & 1) == 0)
  {
    double v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
    return [v3 _detachFieldEditorDiscardingEdits:v4 animated:1];
  }
  return result;
}

- (CGPoint)contentOffsetForSameViewDrops
{
  id v2 = [(UITextField *)self _fieldEditor];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.CGFloat x = v7;
  return result;
}

- (void)setContentOffsetForSameViewDrops:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UITextField *)self _fieldEditor];
  objc_msgSend(v5, "setContentOffset:", x, y);
}

- (void)droppingStarted
{
  *(void *)&self->_textFieldFlags |= 0x8000000uLL;
  [(UITextField *)self setNeedsLayout];
  if (![(UIView *)self isFirstResponder])
  {
    [(UITextField *)self _notifyDidBeginEditing];
  }
}

- (void)droppingFinished
{
  *(void *)&self->_textFieldFlags &= ~0x8000000uLL;
  [(UITextField *)self setNeedsLayout];
  if (![(UIView *)self isFirstResponder])
  {
    [(UITextField *)self _notifyDidEndEditing];
  }
}

- (id)_previewRendererForRange:(id)a3 unifyRects:(BOOL)a4
{
  return (id)[(_UITextLayoutController *)self->_textLayoutController previewRendererForRange:a3 unifyRects:a4];
}

- (CGRect)_boundingRectForRange:(id)a3
{
  [(_UITextLayoutController *)self->_textLayoutController boundingRectForRange:a3];
  result.size.double height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (int64_t)_keyboardAppearance
{
  id v2 = +[UISystemInputViewController _canonicalTraitsForResponder:self];
  int64_t v3 = [v2 keyboardAppearance];

  return v3;
}

- (int64_t)_userInterfaceStyle
{
  id v2 = [(UIView *)self traitCollection];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (BOOL)drawTextInRectIfNeeded:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || (BOOL v8 = [(UITextField *)self _fieldEditorAttached]))
  {
    -[UITextField drawTextInRect:](self, "drawTextInRect:", x, y, width, height);
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (_NSRange)_unobscuredSecureRange
{
  NSUInteger v2 = [(UIFieldEditor *)self->_fieldEditor _unobscuredSecureRange];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UITextField *)self _implementsEditMenu])
  {
    uint64_t v8 = [(_UITextLayoutController *)self->_textLayoutController characterRangeForTextRange:v6];
    uint64_t v10 = v9;
    char v11 = [(UITextField *)self delegate];
    int v12 = objc_msgSend(v11, "textField:editMenuForCharactersInRange:suggestedActions:", self, v8, v10, v7);
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (void)willPresentEditMenuWithAnimator:(id)a3
{
  id v7 = a3;
  double v4 = [(UITextField *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UITextField *)self delegate];
    [v6 textField:self willPresentEditMenuWithAnimator:v7];
  }
}

- (void)willDismissEditMenuWithAnimator:(id)a3
{
  id v8 = a3;
  double v4 = [(UITextField *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UITextField *)self delegate];
    [v6 textField:self willDismissEditMenuWithAnimator:v8];
  }
  id v7 = +[UIKeyboardImpl activeInstance];
  [v7 willDismissEditMenu];
}

- (void)_logWarningForMenuControllerUsage
{
  NSUInteger v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Text", &_logWarningForMenuControllerUsage___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)NSUInteger v3 = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Using UIMenuController to add items into text menus is deprecated. Please implement the UITextFieldDelegate API textField:editMenuForCharactersInRange:suggestedActions: instead.", v3, 2u);
  }
}

- (void)_setOverridePasscodeStyle:(BOOL)a3
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if (((((*(void *)&textFieldFlags & 0x100000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x100000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&textFieldFlags & 0xFFFFFFFFFFEFFFFFLL | v4);
    [(UITextField *)self setNeedsLayout];
  }
}

- (BOOL)_overridePasscodeStyle
{
  return (*((unsigned __int8 *)&self->_textFieldFlags + 2) >> 4) & 1;
}

- (double)_passcodeStyleAlpha
{
  NSUInteger v2 = objc_getAssociatedObject(self, &_UITextFieldPasscodeStyleAlphaKey);
  NSUInteger v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.25;
  }

  return v5;
}

- (void)_setPasscodeStyleAlpha:(double)a3
{
  float v4 = [NSNumber numberWithDouble:a3];
  objc_setAssociatedObject(self, &_UITextFieldPasscodeStyleAlphaKey, v4, (void *)1);

  textCanvasView = self->_textCanvasView;
  [(_UITextCanvas *)textCanvasView setNeedsDisplay];
}

- (id)_contentSnapshot
{
  [(UIView *)self bounds];
  -[UIView convertRect:toView:](self, "convertRect:toView:", self->_textCanvasView);
  double v4 = v3;
  double v6 = v5;
  [(_UITextCanvas *)self->_textCanvasView bounds];
  double v8 = v7;
  uint64_t v9 = -[UIGraphicsImageRenderer initWithBounds:]([UIGraphicsImageRenderer alloc], "initWithBounds:", 0.0, v4, v7, v6);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __31__UITextField__contentSnapshot__block_invoke;
  v13[3] = &unk_1E52DD848;
  v13[4] = self;
  void v13[5] = 0;
  *(double *)&v13[6] = v4;
  *(double *)&v13[7] = v8;
  *(double *)&v13[8] = v6;
  uint64_t v10 = [(UIGraphicsImageRenderer *)v9 imageWithActions:v13];
  char v11 = [[UIImageView alloc] initWithImage:v10];

  return v11;
}

uint64_t __31__UITextField__contentSnapshot__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 952);
  objc_msgSend(v1, "convertRect:fromView:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(v1, "drawRect:");
}

- (void)_applyHighlightedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UITextField *)self _contentFloatingContainerView];
  objc_msgSend(v5, "setControlState:animated:", -[UIControl state](self, "state"), v3);
}

- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)&self->_textFieldFlags |= 0x20000000000uLL;
  id v4 = [(UITextField *)self _inputController];
  [v4 setSupportsAdaptiveImageGlyph:v3];
}

- (BOOL)supportsAdaptiveImageGlyph
{
  if ((*((unsigned char *)&self->_textFieldFlags + 5) & 2) != 0)
  {
    id v4 = [(UITextField *)self _inputController];
    char v5 = [v4 supportsAdaptiveImageGlyph];

    LOBYTE(v3) = v5;
  }
  else
  {
    int v3 = dyld_program_sdk_at_least();
    if (v3)
    {
      LOBYTE(v3) = [(UITextField *)self _supportsImagePasteCached];
    }
  }
  return v3;
}

- (BOOL)_supportsImagePasteCached
{
  $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = self->_textFieldFlags;
  if ((*(void *)&textFieldFlags & 0x40000000000) == 0)
  {
    BOOL v4 = [(UIResponder *)self _supportsImagePaste];
    uint64_t v5 = 0x40000000000;
    if (v4) {
      uint64_t v5 = 0xC0000000000;
    }
    $53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = ($53C8F00389CE9BE12F0B2EE980283837)(*(void *)&self->_textFieldFlags & 0xFFFFF3FFFFFFFFFFLL | v5);
    self->_$53C8F00389CE9BE12F0B2EE980283837 textFieldFlags = textFieldFlags;
  }
  return (*(unint64_t *)&textFieldFlags >> 43) & 1;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextField *)self _inputController];
  [v8 insertAdaptiveImageGlyph:v7 replacementRange:v6];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (UITextPasteDelegate)pasteDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pasteDelegate);
  return (UITextPasteDelegate *)WeakRetained;
}

- (BOOL)_tvUseVibrancy
{
  return self->_tvUseVibrancy;
}

- (void)set_tvUseVibrancy:(BOOL)a3
{
  self->_tvUseVibrancdouble y = a3;
}

- (UIColor)_tvCustomTextColor
{
  return self->_tvCustomTextColor;
}

- (void)set_tvCustomTextColor:(id)a3
{
}

- (UIColor)_tvCustomFocusedTextColor
{
  return self->_tvCustomFocusedTextColor;
}

- (void)set_tvCustomFocusedTextColor:(id)a3
{
}

- (BOOL)_disableTextColorUpdateOnTraitCollectionChange
{
  return self->_disableTextColorUpdateOnTraitCollectionChange;
}

- (void)set_disableTextColorUpdateOnTraitCollectionChange:(BOOL)a3
{
  self->_disableTextColorUpdateOnTraitCollectionChange = a3;
}

- (CGFloat)minimumFontSize
{
  return self->_minimumFontSize;
}

- (UIImage)background
{
  return self->_background;
}

- (UIImage)disabledBackground
{
  return self->_disabledBackground;
}

- (UIView)inputView
{
  return (UIView *)objc_getProperty(self, a2, 840, 1);
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

- (void)setTextDragDelegate:(id)a3
{
}

- (UITextDropDelegate)textDropDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textDropDelegate);
  return (UITextDropDelegate *)WeakRetained;
}

- (void)setVisualStyle:(id)a3
{
}

- (BOOL)_handwritingEnabled
{
  return self->__handwritingEnabled;
}

- (void)_setHandwritingEnabled:(BOOL)a3
{
  self->__handwritingEnabled = a3;
}

- (void)encodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(UITextField *)self selectionRange];
  uint64_t v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)UITextField;
  [(UIResponder *)&v13 encodeRestorableStateWithCoder:v6];
  if ([(UIView *)self isFirstResponder])
  {
    [v6 encodeBool:1 forKey:@"kTextFirstResponderKey"];
    [v6 encodeInt:v9 forKey:@"kTextSelectedTextLengthKey"];
    [v6 encodeInt:v7 forKey:@"kTextSelectedTextLocationKey"];
  }
  if (v4)
  {
    uint64_t v10 = [(UITextField *)self selectedText];
    if ([v10 length]) {
      [v6 encodeObject:v10 forKey:@"kTextSelectedTextKey"];
    }
    if ([(UITextField *)self _isDisplayingShortcutViewController]) {
      [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
    }
    if ([(UITextField *)self _isDisplayingReferenceLibraryViewController])
    {
      char v11 = +[UIDevice currentDevice];
      uint64_t v12 = [v11 userInterfaceIdiom];

      if (!v12) {
        [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
      }
      [v6 encodeBool:1 forKey:@"kTextDisplayingReferenceLibraryViewControllerKey"];
    }
    if ([(UITextField *)self _isDisplayingShareViewController]) {
      [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
    }
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
}

- (void)decodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextField;
  [(UIResponder *)&v10 decodeRestorableStateWithCoder:v6];
  if ([v6 containsValueForKey:@"kTextFirstResponderKey"]
    && [v6 decodeBoolForKey:@"kTextFirstResponderKey"])
  {
    [(UITextField *)self becomeFirstResponder];
  }
  if ([v6 containsValueForKey:@"kTextSelectedTextLengthKey"])
  {
    if ([v6 containsValueForKey:@"kTextSelectedTextLocationKey"])
    {
      uint64_t v7 = (int)[v6 decodeIntForKey:@"kTextSelectedTextLengthKey"];
      uint64_t v8 = (int)[v6 decodeIntForKey:@"kTextSelectedTextLocationKey"];
      [(UITextField *)self becomeFirstResponder];
      -[UITextField setSelectionRange:](self, "setSelectionRange:", v8, v7);
      if (v4)
      {
        uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"kTextSelectedTextKey"];
        if (v9)
        {
          [v6 decodeBoolForKey:@"kTextDisplayingShortcutViewControllerKey"];
          [v6 decodeBoolForKey:@"kTextDisplayingReferenceLibraryViewControllerKey"];
          [v6 decodeBoolForKey:@"kTextDisplayingShareViewControllerKey"];
        }
      }
    }
  }
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
}

- (id)_interactionState
{
  int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(UITextField *)self encodeRestorableStateWithCoder:v3 includingSelectedTextAndDisplayedViewControllers:0];
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
    [(UITextField *)self decodeRestorableStateWithCoder:v6 includingSelectedTextAndDisplayedViewControllers:0];
  }
  else
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Text", &_setInteractionState____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v12 = "-[UITextField(_UIInteractionStateRestorable) _setInteractionState:]";
        __int16 v13 = 2112;
        id v14 = v7;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%s: Error decoding interaction state (%@)", buf, 0x16u);
      }
    }
  }
}

- (BOOL)_hasFontInfoForVerticalBaselineSpacing
{
  return 1;
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
    v8.super_class = (Class)UITextField;
    [(UIView *)&v8 _autolayoutSpacingAtEdge:*(void *)&a3 forAttribute:a4 inContainer:a5 isGuide:a6];
  }
  else
  {
    _UIViewBaselineToEdgeSpacing([(UITextField *)self _fontInfoForBaselineSpacing], a3);
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
    double v17 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
    }
LABEL_12:
    v19.receiver = self;
    v19.super_class = (Class)UITextField;
    [(UIView *)&v19 _autolayoutSpacingAtEdge:v13 forAttribute:a4 nextToNeighbor:a5 edge:v10 attribute:a7 multiplier:a8];
    return result;
  }
  if (v15 >= 2)
  {
    double v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category_1019)+ 8);
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