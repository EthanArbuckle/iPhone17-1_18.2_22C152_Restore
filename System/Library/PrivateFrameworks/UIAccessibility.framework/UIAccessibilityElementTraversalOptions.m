@interface UIAccessibilityElementTraversalOptions
+ (id)defaultContinuityDisplayOptions;
+ (id)defaultFullKeyboardAccessOptions;
+ (id)defaultSpeakScreenOptions;
+ (id)defaultSwitchControlOptions;
+ (id)defaultVoiceOverOptions;
+ (id)defaultVoiceOverOptionsHonoringGroups;
+ (id)options;
+ (id)voiceOverOptionsIncludingElementsFromOpaqueProviders:(BOOL)a3 honorsGroups:(BOOL)a4;
+ (void)defaultSpeakScreenOptions;
- (BOOL)forSpeakScreen;
- (BOOL)honorsElementGrouping;
- (BOOL)includeAncestorsOfSelfInSiblingMatch;
- (BOOL)includeHiddenViews;
- (BOOL)includeWindowlessViews;
- (BOOL)shouldExcludeSupplementaryViews;
- (BOOL)shouldIncludeKeyboardObscuredElements;
- (BOOL)shouldIncludeStatusBarWindow;
- (BOOL)shouldOnlyIncludeElementsWithVisibleFrame;
- (BOOL)shouldReturnScannerGroups;
- (BOOL)shouldUseAllSubviews;
- (BOOL)sorted;
- (NSArray)allowedElementsForTraversal;
- (UIAccessibilityElementTraversalOptions)init;
- (id)alternateViewChildrenHandler;
- (id)description;
- (id)leafNodePredicate;
- (int64_t)direction;
- (void)setAllowedElementsForTraversal:(id)a3;
- (void)setAlternateViewChildrenHandler:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setForSpeakScreen:(BOOL)a3;
- (void)setHonorsElementGrouping:(BOOL)a3;
- (void)setIncludeAncestorsOfSelfInSiblingMatch:(BOOL)a3;
- (void)setIncludeHiddenViews:(BOOL)a3;
- (void)setIncludeWindowlessViews:(BOOL)a3;
- (void)setLeafNodePredicate:(id)a3;
- (void)setShouldExcludeSupplementaryViews:(BOOL)a3;
- (void)setShouldIncludeKeyboardObscuredElements:(BOOL)a3;
- (void)setShouldIncludeStatusBarWindow:(BOOL)a3;
- (void)setShouldOnlyIncludeElementsWithVisibleFrame:(BOOL)a3;
- (void)setShouldReturnScannerGroups:(BOOL)a3;
- (void)setShouldUseAllSubviews:(BOOL)a3;
- (void)setSorted:(BOOL)a3;
@end

@implementation UIAccessibilityElementTraversalOptions

+ (id)options
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)defaultVoiceOverOptions
{
  return (id)[a1 voiceOverOptionsIncludingElementsFromOpaqueProviders:0 honorsGroups:0];
}

+ (id)defaultVoiceOverOptionsHonoringGroups
{
  return (id)[a1 voiceOverOptionsIncludingElementsFromOpaqueProviders:0 honorsGroups:1];
}

+ (id)voiceOverOptionsIncludingElementsFromOpaqueProviders:(BOOL)a3 honorsGroups:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [a1 options];
  [v7 setHonorsElementGrouping:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __108__UIAccessibilityElementTraversalOptions_voiceOverOptionsIncludingElementsFromOpaqueProviders_honorsGroups___block_invoke;
  v9[3] = &__block_descriptor_42_e8_B16__0_8l;
  v9[4] = a1;
  BOOL v10 = a3;
  BOOL v11 = v4;
  [v7 setLeafNodePredicate:v9];

  return v7;
}

uint64_t __108__UIAccessibilityElementTraversalOptions_voiceOverOptionsIncludingElementsFromOpaqueProviders_honorsGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAccessibilityElement]
    && (uint64_t v4 = [*(id *)(a1 + 32) accessibilityTraits], (UIAccessibilityTraitSpacer & ~v4) != 0)
    || !*(unsigned char *)(a1 + 40) && ([v3 isAccessibilityOpaqueElementProvider] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else if (*(unsigned char *)(a1 + 41))
  {
    uint64_t v5 = [v3 _accessibilityIsGroupedParent];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)defaultSwitchControlOptions
{
  id v2 = [a1 options];
  [v2 setShouldReturnScannerGroups:1];
  [v2 setShouldOnlyIncludeElementsWithVisibleFrame:1];
  [v2 setShouldIncludeStatusBarWindow:1];
  [v2 setLeafNodePredicate:&__block_literal_global_3];

  return v2;
}

uint64_t __69__UIAccessibilityElementTraversalOptions_defaultSwitchControlOptions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAccessibilityElement]) {
    uint64_t v3 = [v2 accessibilityRespondsToUserInteraction];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)defaultSpeakScreenOptions
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[UIAccessibilityElementTraversalOptions options];
  [v2 setLeafNodePredicate:&__block_literal_global_267];
  [v2 setForSpeakScreen:1];
  uint64_t v3 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v4 = [v3 _accessibilitySpeakThisRootElement];

  uint64_t v5 = AXLogSpeakScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions]();
  }

  v6 = [MEMORY[0x1E4F42738] sharedApplication];
  v7 = [v6 _accessibilitySpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession];

  v8 = AXLogSpeakScreen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions]();
  }

  if (v4)
  {
    v13[0] = v4;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v2 setAllowedElementsForTraversal:v9];
LABEL_7:

    goto LABEL_10;
  }
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F42738] sharedApplication];
    BOOL v11 = [v9 _accessibilitySpeakThisViewController];
    v12 = [v11 _accessibilitySpeakThisViews];
    [v2 setAllowedElementsForTraversal:v12];

    goto LABEL_7;
  }
  [v2 setAllowedElementsForTraversal:v7];
LABEL_10:

  return v2;
}

uint64_t __67__UIAccessibilityElementTraversalOptions_defaultSpeakScreenOptions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 _accessibilitySpeakThisIgnoresAccessibilityElementStatus] & 1) != 0
    || [v2 _accessibilityIsSpeakThisElement]
    && ([v2 isAccessibilityElement] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 isAccessibilityOpaqueElementProvider];
  }

  return v3;
}

+ (id)defaultFullKeyboardAccessOptions
{
  id v2 = [a1 options];
  [v2 setShouldIncludeStatusBarWindow:1];
  [v2 setLeafNodePredicate:&__block_literal_global_271];

  return v2;
}

uint64_t __74__UIAccessibilityElementTraversalOptions_defaultFullKeyboardAccessOptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityCanBecomeNativeFocused];
}

+ (id)defaultContinuityDisplayOptions
{
  id v2 = [a1 voiceOverOptionsIncludingElementsFromOpaqueProviders:1 honorsGroups:0];
  [v2 setShouldOnlyIncludeElementsWithVisibleFrame:1];

  return v2;
}

- (UIAccessibilityElementTraversalOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElementTraversalOptions;
  id v2 = [(UIAccessibilityElementTraversalOptions *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(UIAccessibilityElementTraversalOptions *)v2 setDirection:1];
    [(UIAccessibilityElementTraversalOptions *)v3 setSorted:1];
  }
  return v3;
}

- (id)description
{
  int64_t v3 = [(UIAccessibilityElementTraversalOptions *)self direction];
  uint64_t v4 = @"previous";
  if (v3 == 1) {
    uint64_t v4 = @"next";
  }
  objc_super v5 = v4;
  if ([(UIAccessibilityElementTraversalOptions *)self shouldOnlyIncludeElementsWithVisibleFrame])
  {
    v16 = @"only include elements with visible frame";
    v21 = @"__AXStringForVariablesSentinel";
    uint64_t v6 = __UIAXStringForVariables();

    objc_super v5 = (__CFString *)v6;
  }
  if ([(UIAccessibilityElementTraversalOptions *)self shouldReturnScannerGroups])
  {
    v17 = @"scanner groups";
    v22 = @"__AXStringForVariablesSentinel";
    uint64_t v7 = __UIAXStringForVariables();

    objc_super v5 = (__CFString *)v7;
  }
  v8 = [(UIAccessibilityElementTraversalOptions *)self leafNodePredicate];

  if (v8)
  {
    v18 = @"has predicate";
    v23 = @"__AXStringForVariablesSentinel";
    uint64_t v9 = __UIAXStringForVariables();

    objc_super v5 = (__CFString *)v9;
  }
  if ([(UIAccessibilityElementTraversalOptions *)self forSpeakScreen])
  {
    v19 = @"for Speak Screen";
    v24 = @"__AXStringForVariablesSentinel";
    uint64_t v10 = __UIAXStringForVariables();

    objc_super v5 = (__CFString *)v10;
  }
  if ([(UIAccessibilityElementTraversalOptions *)self shouldUseAllSubviews])
  {
    v20 = @"use all subviews";
    v25 = @"__AXStringForVariablesSentinel";
    uint64_t v11 = __UIAXStringForVariables();

    objc_super v5 = (__CFString *)v11;
  }
  v12 = NSString;
  v26.receiver = self;
  v26.super_class = (Class)UIAccessibilityElementTraversalOptions;
  v13 = [(UIAccessibilityElementTraversalOptions *)&v26 description];
  v14 = [v12 stringWithFormat:@"%@ - %@", v13, v5];

  return v14;
}

- (void)setAllowedElementsForTraversal:(id)a3
{
  objc_super v5 = (NSArray *)a3;
  allowedElementsForTraversal = self->_allowedElementsForTraversal;
  p_allowedElementsForTraversal = &self->_allowedElementsForTraversal;
  if (allowedElementsForTraversal != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_allowedElementsForTraversal, a3);
    objc_super v5 = v8;
  }
}

- (BOOL)shouldReturnScannerGroups
{
  return self->_shouldReturnScannerGroups;
}

- (void)setShouldReturnScannerGroups:(BOOL)a3
{
  self->_shouldReturnScannerGroups = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (id)leafNodePredicate
{
  return self->_leafNodePredicate;
}

- (void)setLeafNodePredicate:(id)a3
{
}

- (BOOL)shouldOnlyIncludeElementsWithVisibleFrame
{
  return self->_shouldOnlyIncludeElementsWithVisibleFrame;
}

- (void)setShouldOnlyIncludeElementsWithVisibleFrame:(BOOL)a3
{
  self->_shouldOnlyIncludeElementsWithVisibleFrame = a3;
}

- (BOOL)shouldIncludeKeyboardObscuredElements
{
  return self->_shouldIncludeKeyboardObscuredElements;
}

- (void)setShouldIncludeKeyboardObscuredElements:(BOOL)a3
{
  self->_shouldIncludeKeyboardObscuredElements = a3;
}

- (BOOL)shouldUseAllSubviews
{
  return self->_shouldUseAllSubviews;
}

- (void)setShouldUseAllSubviews:(BOOL)a3
{
  self->_shouldUseAllSubviews = a3;
}

- (BOOL)includeHiddenViews
{
  return self->_includeHiddenViews;
}

- (void)setIncludeHiddenViews:(BOOL)a3
{
  self->_includeHiddenViews = a3;
}

- (BOOL)includeWindowlessViews
{
  return self->_includeWindowlessViews;
}

- (void)setIncludeWindowlessViews:(BOOL)a3
{
  self->_includeWindowlessViews = a3;
}

- (BOOL)sorted
{
  return self->_sorted;
}

- (void)setSorted:(BOOL)a3
{
  self->_sorted = a3;
}

- (BOOL)includeAncestorsOfSelfInSiblingMatch
{
  return self->_includeAncestorsOfSelfInSiblingMatch;
}

- (void)setIncludeAncestorsOfSelfInSiblingMatch:(BOOL)a3
{
  self->_includeAncestorsOfSelfInSiblingMatch = a3;
}

- (BOOL)honorsElementGrouping
{
  return self->_honorsElementGrouping;
}

- (void)setHonorsElementGrouping:(BOOL)a3
{
  self->_honorsElementGrouping = a3;
}

- (NSArray)allowedElementsForTraversal
{
  return self->_allowedElementsForTraversal;
}

- (BOOL)shouldExcludeSupplementaryViews
{
  return self->_shouldExcludeSupplementaryViews;
}

- (void)setShouldExcludeSupplementaryViews:(BOOL)a3
{
  self->_shouldExcludeSupplementaryViews = a3;
}

- (BOOL)forSpeakScreen
{
  return self->_forSpeakScreen;
}

- (void)setForSpeakScreen:(BOOL)a3
{
  self->_forSpeakScreen = a3;
}

- (BOOL)shouldIncludeStatusBarWindow
{
  return self->_shouldIncludeStatusBarWindow;
}

- (void)setShouldIncludeStatusBarWindow:(BOOL)a3
{
  self->_shouldIncludeStatusBarWindow = a3;
}

- (id)alternateViewChildrenHandler
{
  return self->_alternateViewChildrenHandler;
}

- (void)setAlternateViewChildrenHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alternateViewChildrenHandler, 0);
  objc_storeStrong((id *)&self->_allowedElementsForTraversal, 0);

  objc_storeStrong(&self->_leafNodePredicate, 0);
}

+ (void)defaultSpeakScreenOptions
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "SpeakScreen root element is %{public}@", v2, v3, v4, v5, v6);
}

@end