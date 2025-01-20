@interface UITextInputAssistantItem
+ (id)_keyboardDeleteItem;
- (BOOL)_hasItemsToDisplay;
- (BOOL)_independentGroupSizes;
- (BOOL)_isSystemItem;
- (BOOL)_isVisibleWhenMinimized;
- (BOOL)_requiresPredictionDisabled;
- (BOOL)_showsBarButtonItemsInline;
- (BOOL)allowsHidingShortcuts;
- (NSArray)_centerBarButtonGroups;
- (NSArray)leadingBarButtonGroups;
- (NSArray)trailingBarButtonGroups;
- (NSString)description;
- (UIAction)_dictationReplacementAction;
- (UIBarButtonItem)keyboardActionButtonItem;
- (UIBlurEffect)_detachedBackgroundEffect;
- (UIColor)_detachedBackgroundColor;
- (UIColor)_detachedTintColor;
- (UITextInputAssistantItem)init;
- (double)_marginOverride;
- (void)_itemDidChangeEnabledState:(id)a3;
- (void)_itemStandardViewNeedsUpdate:(id)a3;
- (void)_setCenterBarButtonGroups:(id)a3;
- (void)_setDetachedBackgroundColor:(id)a3;
- (void)_setDetachedBackgroundEffect:(id)a3;
- (void)_setDetachedTintColor:(id)a3;
- (void)_setDictationReplacementAction:(id)a3;
- (void)_setIndependentGroupSizes:(BOOL)a3;
- (void)_setMarginOverride:(double)a3;
- (void)_setShowsBarButtonItemsInline:(BOOL)a3;
- (void)_setVisibleWhenMinimized:(BOOL)a3;
- (void)setAllowsHidingShortcuts:(BOOL)allowsHidingShortcuts;
- (void)setKeyboardActionButtonItem:(id)a3;
- (void)setLeadingBarButtonGroups:(NSArray *)leadingBarButtonGroups;
- (void)setTrailingBarButtonGroups:(NSArray *)trailingBarButtonGroups;
@end

@implementation UITextInputAssistantItem

- (UITextInputAssistantItem)init
{
  v9.receiver = self;
  v9.super_class = (Class)UITextInputAssistantItem;
  v2 = [(UITextInputAssistantItem *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_allowsHidingShortcuts = 1;
    v2->_marginOverride = -1.0;
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    leadingBarButtonGroups = v3->_leadingBarButtonGroups;
    v3->_leadingBarButtonGroups = v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    trailingBarButtonGroups = v3->_trailingBarButtonGroups;
    v3->_trailingBarButtonGroups = v6;
  }
  return v3;
}

- (BOOL)_isSystemItem
{
  return 0;
}

- (BOOL)_hasItemsToDisplay
{
  NSUInteger v3 = [(NSArray *)self->_leadingBarButtonGroups count];
  NSUInteger v4 = [(NSArray *)self->_centerBarButtonGroups count] + v3;
  return v4 + [(NSArray *)self->_trailingBarButtonGroups count] != 0;
}

- (BOOL)_requiresPredictionDisabled
{
  return [(NSArray *)self->_centerBarButtonGroups count] != 0;
}

- (void)setLeadingBarButtonGroups:(NSArray *)leadingBarButtonGroups
{
  if (self->_leadingBarButtonGroups != leadingBarButtonGroups)
  {
    if (leadingBarButtonGroups) {
      NSUInteger v4 = leadingBarButtonGroups;
    }
    else {
      NSUInteger v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v5 = (NSArray *)[(NSArray *)v4 copy];
    v6 = self->_leadingBarButtonGroups;
    self->_leadingBarButtonGroups = v5;
  }
}

- (void)setTrailingBarButtonGroups:(NSArray *)trailingBarButtonGroups
{
  if (self->_trailingBarButtonGroups != trailingBarButtonGroups)
  {
    if (trailingBarButtonGroups) {
      NSUInteger v4 = trailingBarButtonGroups;
    }
    else {
      NSUInteger v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v5 = (NSArray *)[(NSArray *)v4 copy];
    v6 = self->_trailingBarButtonGroups;
    self->_trailingBarButtonGroups = v5;
  }
}

- (void)_setCenterBarButtonGroups:(id)a3
{
  if (self->_centerBarButtonGroups != a3)
  {
    if (a3) {
      id v4 = a3;
    }
    else {
      id v4 = (id)MEMORY[0x1E4F1CBF0];
    }
    v5 = (NSArray *)[v4 copy];
    centerBarButtonGroups = self->_centerBarButtonGroups;
    self->_centerBarButtonGroups = v5;
  }
}

- (void)_setIndependentGroupSizes:(BOOL)a3
{
  if (self->_independentGroupSizes != a3) {
    self->_independentGroupSizes = a3;
  }
}

- (void)_setDictationReplacementAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = (UIAction *)a3;
  dictationReplacementAction = self->_dictationReplacementAction;
  p_dictationReplacementAction = &self->_dictationReplacementAction;
  if (dictationReplacementAction != v5)
  {
    objc_storeStrong((id *)p_dictationReplacementAction, a3);
    v8 = [(UIMenuElement *)v5 image];

    if (v8)
    {
      objc_super v9 = [(UIMenuElement *)v5 image];
      char v10 = [v9 isSymbolImage];

      if ((v10 & 1) == 0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v12 = __UIFaultDebugAssertLog();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_9;
          }
          v13 = [(UIMenuElement *)v5 image];
          int v14 = 138412290;
          v15 = v13;
          _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "The dictationReplacementAction's image must be a symbol image %@", (uint8_t *)&v14, 0xCu);
        }
        else
        {
          v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setDictationReplacementAction____s_category) + 8);
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_4;
          }
          v12 = v11;
          v13 = [(UIMenuElement *)v5 image];
          int v14 = 138412290;
          v15 = v13;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "The dictationReplacementAction's image must be a symbol image %@", (uint8_t *)&v14, 0xCu);
        }

LABEL_9:
      }
    }
  }
LABEL_4:
}

- (void)_setMarginOverride:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (self->_marginOverride != a3) {
    self->_marginOverride = a3;
  }
}

- (void)_itemStandardViewNeedsUpdate:(id)a3
{
  id v4 = +[UIKeyboardImpl activeInstance];
  NSUInteger v3 = [v4 remoteTextInputPartner];
  [v3 documentTraitsChanged];
}

- (void)_itemDidChangeEnabledState:(id)a3
{
  id v4 = +[UIKeyboardImpl activeInstance];
  NSUInteger v3 = [v4 remoteTextInputPartner];
  [v3 documentTraitsChanged];
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)UITextInputAssistantItem;
  NSUInteger v3 = [(UITextInputAssistantItem *)&v9 description];
  id v4 = (void *)[v3 mutableCopy];

  if (!self->_allowsHidingShortcuts) {
    [v4 appendString:@" requiresShortcuts"];
  }
  if ([(NSArray *)self->_leadingBarButtonGroups count])
  {
    v5 = [(NSArray *)self->_leadingBarButtonGroups componentsJoinedByString:@"\n\t"];
    [v4 appendFormat:@"\nleadingBarButtonGroups={\n\t%@\n}", v5];
  }
  if ([(NSArray *)self->_trailingBarButtonGroups count])
  {
    v6 = [(NSArray *)self->_trailingBarButtonGroups componentsJoinedByString:@"\n\t"];
    [v4 appendFormat:@"\ntrailingBarButtonGroups={\n\t%@\n}", v6];
  }
  if ([(NSArray *)self->_centerBarButtonGroups count])
  {
    v7 = [(NSArray *)self->_centerBarButtonGroups componentsJoinedByString:@"\n\t"];
    [v4 appendFormat:@"\ncenterBarButtonGroups={\n\t%@\n}", v7];
  }
  return (NSString *)v4;
}

- (BOOL)allowsHidingShortcuts
{
  return self->_allowsHidingShortcuts;
}

- (void)setAllowsHidingShortcuts:(BOOL)allowsHidingShortcuts
{
  self->_allowsHidingShortcuts = allowsHidingShortcuts;
}

- (NSArray)leadingBarButtonGroups
{
  return self->_leadingBarButtonGroups;
}

- (NSArray)trailingBarButtonGroups
{
  return self->_trailingBarButtonGroups;
}

- (UIBarButtonItem)keyboardActionButtonItem
{
  return self->_keyboardActionButtonItem;
}

- (void)setKeyboardActionButtonItem:(id)a3
{
}

- (BOOL)_showsBarButtonItemsInline
{
  return self->_showsBarButtonItemsInline;
}

- (void)_setShowsBarButtonItemsInline:(BOOL)a3
{
  self->_showsBarButtonItemsInline = a3;
}

- (BOOL)_isVisibleWhenMinimized
{
  return self->_visibleWhenMinimized;
}

- (void)_setVisibleWhenMinimized:(BOOL)a3
{
  self->_visibleWhenMinimized = a3;
}

- (NSArray)_centerBarButtonGroups
{
  return self->_centerBarButtonGroups;
}

- (BOOL)_independentGroupSizes
{
  return self->_independentGroupSizes;
}

- (double)_marginOverride
{
  return self->_marginOverride;
}

- (UIColor)_detachedBackgroundColor
{
  return self->_detachedBackgroundColor;
}

- (void)_setDetachedBackgroundColor:(id)a3
{
}

- (UIBlurEffect)_detachedBackgroundEffect
{
  return self->_detachedBackgroundEffect;
}

- (void)_setDetachedBackgroundEffect:(id)a3
{
}

- (UIColor)_detachedTintColor
{
  return self->_detachedTintColor;
}

- (void)_setDetachedTintColor:(id)a3
{
}

- (UIAction)_dictationReplacementAction
{
  return self->_dictationReplacementAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationReplacementAction, 0);
  objc_storeStrong((id *)&self->_detachedTintColor, 0);
  objc_storeStrong((id *)&self->_detachedBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_detachedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_centerBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_keyboardActionButtonItem, 0);
  objc_storeStrong((id *)&self->_trailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonGroups, 0);
}

+ (id)_keyboardDeleteItem
{
  return +[UIAssistantBarButtonItemProvider barButtonItemForAssistantItemStyle:19 target:0];
}

@end