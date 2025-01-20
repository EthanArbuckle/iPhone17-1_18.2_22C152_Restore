@interface UIBarButtonItem
+ (Class)classForNavigationButton;
+ (Class)classForToolbarButton;
+ (UIBarButtonItem)fixedSpaceItemOfWidth:(CGFloat)width;
+ (UIBarButtonItem)flexibleSpaceItem;
+ (id)_appearanceBlindViewClasses;
+ (void)_getSystemItemStyle:(int64_t *)a3 title:(id *)a4 image:(id *)a5 selectedImage:(id *)a6 action:(SEL *)a7 forBarStyle:(int64_t)a8 landscape:(BOOL)a9 alwaysBordered:(BOOL)a10 usingSystemItem:(int64_t)a11 usingItemStyle:(int64_t)a12;
- (BOOL)_actsAsFakeBackButton;
- (BOOL)_canProduceNSToolbarItem;
- (BOOL)_changesSelectionAsPrimaryAction;
- (BOOL)_flexible;
- (BOOL)_hasAction;
- (BOOL)_imageHasEffects;
- (BOOL)_isFloatable;
- (BOOL)_isFloating;
- (BOOL)_isImageBarButtonItem;
- (BOOL)_isPopUpMenuButtonWithMenu:(id)a3;
- (BOOL)_menuIsPrimary;
- (BOOL)_resizesBackgroundImage;
- (BOOL)_showsBackButtonIndicator;
- (BOOL)_showsChevron;
- (BOOL)_updateMenuInPlace;
- (BOOL)_wantsThreeUp;
- (BOOL)changesSelectionAsPrimaryAction;
- (BOOL)groupRepresentative;
- (BOOL)hasImage;
- (BOOL)hasTitle;
- (BOOL)isCustomViewItem;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isKeyboardItem;
- (BOOL)isMinibarView;
- (BOOL)isSelected;
- (BOOL)isSpaceItem;
- (BOOL)isSpringLoaded;
- (BOOL)isSymbolAnimationEnabled;
- (BOOL)isSystemItem;
- (CGFloat)backButtonBackgroundVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics;
- (CGFloat)backgroundVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics;
- (CGFloat)width;
- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4;
- (CGRect)_rectForPresenting;
- (CGRect)_sourceRectForPresentationInWindow:(id)a3;
- (CGRect)frameInView:(id)a3;
- (NSArray)_backButtonAlternateTitles;
- (NSArray)_gestureRecognizers;
- (NSArray)_interactions;
- (NSDictionary)_stylesForSizingTitles;
- (NSSet)_possibleItemVariations;
- (NSSet)_possibleSystemItems;
- (NSSet)possibleTitles;
- (NSString)_largeContentSizeTitle;
- (NSString)_resolvedLargeContentSizeTitle;
- (NSString)description;
- (SEL)action;
- (UIAction)primaryAction;
- (UIBarButtonItem)_itemForPresenting;
- (UIBarButtonItem)_itemVariation;
- (UIBarButtonItem)init;
- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem menu:(UIMenu *)menu;
- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem primaryAction:(UIAction *)primaryAction;
- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem primaryAction:(UIAction *)primaryAction menu:(UIMenu *)menu;
- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action;
- (UIBarButtonItem)initWithCoder:(NSCoder *)coder;
- (UIBarButtonItem)initWithCustomView:(UIView *)customView;
- (UIBarButtonItem)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;
- (UIBarButtonItem)initWithImage:(UIImage *)image menu:(UIMenu *)menu;
- (UIBarButtonItem)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;
- (UIBarButtonItem)initWithPrimaryAction:(UIAction *)primaryAction;
- (UIBarButtonItem)initWithPrimaryAction:(UIAction *)primaryAction menu:(UIMenu *)menu;
- (UIBarButtonItem)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action menu:(UIMenu *)menu;
- (UIBarButtonItem)initWithTitle:(NSString *)title menu:(UIMenu *)menu;
- (UIBarButtonItem)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;
- (UIBarButtonItemGroup)_owningButtonGroup;
- (UIBarButtonItemGroup)buttonGroup;
- (UIBarButtonItemGroup)creatingFixedGroup;
- (UIBarButtonItemGroup)creatingMovableGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier;
- (UIBarButtonItemGroup)creatingOptionalGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier inDefaultCustomization:(BOOL)inDefaultCustomization;
- (UIBarButtonItemStyle)style;
- (UIColor)tintColor;
- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder;
- (UIEdgeInsets)_additionalSelectionInsets;
- (UIEdgeInsets)imageInsets;
- (UIEdgeInsets)landscapeImagePhoneInsets;
- (UIEdgeInsets)largeContentSizeImageInsets;
- (UIImage)backButtonBackgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
- (UIImage)backgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
- (UIImage)backgroundImageForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics;
- (UIMenu)menu;
- (UIMenuElement)_effectiveMenuRepresentation;
- (UIMenuElement)menuRepresentation;
- (UINavigationItem)_owningNavigationItem;
- (UIOffset)backButtonTitlePositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics;
- (UIOffset)titlePositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics;
- (UIToolbarButton)_toolbarButton;
- (UIView)_configuredFloatableView;
- (UIView)_referenceView;
- (UIView)_viewForPresenting;
- (UIView)customView;
- (UIView)view;
- (_UIBarButtonItemViewOwner)_viewOwner;
- (double)_leftImagePaddingForEdgeMarginInNavBar;
- (double)_maximumWidth;
- (double)_minimumWidth;
- (double)_rightImagePaddingForEdgeMarginInNavBar;
- (double)_toolbarCharge;
- (double)_width;
- (id)_NSToolbarSourceItem;
- (id)_appearanceStorage;
- (id)_autoValidationHandler;
- (id)_backgroundImageForState:(unint64_t)a3 compact:(BOOL)a4 type:(int64_t)a5;
- (id)_dci_creatingGroupWithCustomizationIdentifier:(id)a3;
- (id)_dci_creatingOptionalGroupWithCustomizationIdentifier:(id)a3;
- (id)_deferredEffectsCreateIfNecessary:(BOOL)a3;
- (id)_imageForState:(unint64_t)a3 compact:(BOOL)a4 type:(int64_t)a5;
- (id)_nearestViewController;
- (id)_primaryNSToolbarItemForIdentifier:(id)a3;
- (id)_resolvedImage;
- (id)_secondaryActionsProvider;
- (id)_secondaryNSToolbarItemForIdentifier:(id)a3;
- (id)_sourceViewForPresentationInWindow:(id)a3;
- (id)createViewForNavigationItem:(id)a3;
- (id)createViewForToolbar:(id)a3;
- (id)image;
- (id)itemVariation;
- (id)landscapeImagePhone;
- (id)largeContentSizeImage;
- (id)nextResponder;
- (id)resolvedTitle;
- (id)target;
- (id)title;
- (id)titleTextAttributesForState:(unint64_t)a3;
- (id)window;
- (int64_t)systemItem;
- (unint64_t)hash;
- (void)_applyDeferredSymbolEffects:(id)a3;
- (void)_applyPositionAdjustmentToSegmentedControl:(id)a3;
- (void)_connectInterfaceBuilderEventConnection:(id)a3;
- (void)_deferSymbolEffectOperation:(int64_t)a3 effect:(id)a4 options:(id)a5 animated:(BOOL)a6;
- (void)_executeValidationHandler;
- (void)_getMenuTitle:(id *)a3 image:(id *)a4;
- (void)_getNavBarEdgeSizeAdjust:(CGSize *)a3 imageInsets:(UIEdgeInsets *)a4 landscape:(BOOL)a5;
- (void)_getSystemItemStyle:(int64_t *)a3 title:(id *)a4 image:(id *)a5 selectedImage:(id *)a6 action:(SEL *)a7 forBarStyle:(int64_t)a8 landscape:(BOOL)a9 alwaysBordered:(BOOL)a10;
- (void)_getToolbarSystemItemEdgeInsetsWithImageInsets:(UIEdgeInsets *)a3 forBarStyle:(int64_t)a4 landscape:(BOOL)a5 alwaysBordered:(BOOL)a6;
- (void)_relinquishOwnership:(id)a3;
- (void)_sendAction:(id)a3 withEvent:(id)a4;
- (void)_setActsAsFakeBackButton:(BOOL)a3;
- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3;
- (void)_setAutoValidationHandler:(id)a3;
- (void)_setBackButtonAlternateTitles:(id)a3;
- (void)_setButtonGroup:(id)a3 isRepresentative:(BOOL)a4;
- (void)_setChangesSelectionAsPrimaryAction:(BOOL)a3;
- (void)_setEnclosingBar:(id)a3 onItem:(id)a4;
- (void)_setFlexible:(BOOL)a3;
- (void)_setGestureRecognizers:(id)a3;
- (void)_setImageHasEffects:(BOOL)a3;
- (void)_setInteractions:(id)a3;
- (void)_setItemVariation:(id)a3;
- (void)_setLargeContentSizeTitle:(id)a3;
- (void)_setMaximumWidth:(double)a3;
- (void)_setMinimumWidth:(double)a3;
- (void)_setOwningNavigationItem:(id)a3;
- (void)_setPossibleItemVariations:(id)a3;
- (void)_setPossibleSystemItems:(id)a3;
- (void)_setSecondaryActionsProvider:(id)a3;
- (void)_setShowsBackButtonIndicator:(BOOL)a3;
- (void)_setShowsChevron:(BOOL)a3;
- (void)_setStylesForSizingTitles:(id)a3;
- (void)_setSystemItem:(int64_t)a3;
- (void)_setToolbarCharge:(double)a3;
- (void)_setViewOwner:(id)a3;
- (void)_setWantsThreeUp:(BOOL)a3;
- (void)_setWidth:(double)a3;
- (void)_triggerAction:(id)a3;
- (void)_triggerActionForEvent:(id)a3;
- (void)_triggerActionForEvent:(id)a3 fallbackSender:(id)a4;
- (void)_updateForAutomaticSelection;
- (void)_updateView;
- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect;
- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options;
- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4;
- (void)removeAllSymbolEffects;
- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options;
- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options animated:(BOOL)animated;
- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect;
- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options;
- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated;
- (void)setAction:(SEL)action;
- (void)setBackButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
- (void)setBackButtonBackgroundVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics;
- (void)setBackButtonTitlePositionAdjustment:(UIOffset)adjustment forBarMetrics:(UIBarMetrics)barMetrics;
- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics;
- (void)setBackgroundVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics;
- (void)setChangesSelectionAsPrimaryAction:(BOOL)changesSelectionAsPrimaryAction;
- (void)setCustomView:(UIView *)customView;
- (void)setEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)hidden;
- (void)setImage:(id)a3;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setIsKeyboardItem:(BOOL)a3;
- (void)setIsMinibarView:(BOOL)a3;
- (void)setLandscapeImagePhone:(id)a3;
- (void)setLandscapeImagePhoneInsets:(UIEdgeInsets)a3;
- (void)setLargeContentSizeImage:(id)a3;
- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)a3;
- (void)setMenu:(UIMenu *)menu;
- (void)setMenuRepresentation:(UIMenuElement *)menuRepresentation;
- (void)setPossibleTitles:(NSSet *)possibleTitles;
- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder;
- (void)setPrimaryAction:(UIAction *)primaryAction;
- (void)setSecondaryActionsArePrimary:(BOOL)a3;
- (void)setSelected:(BOOL)selected;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setStyle:(UIBarButtonItemStyle)style;
- (void)setSymbolAnimationEnabled:(BOOL)symbolAnimationEnabled;
- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition;
- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options;
- (void)setTarget:(id)target;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTitle:(id)a3;
- (void)setTitlePositionAdjustment:(UIOffset)adjustment forBarMetrics:(UIBarMetrics)barMetrics;
- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)setView:(id)a3;
- (void)setWidth:(CGFloat)width;
- (void)set_owningButtonGroup:(id)a3;
@end

@implementation UIBarButtonItem

- (BOOL)_wantsThreeUp
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 6) & 1;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)_setViewOwner:(id)a3
{
}

- (BOOL)_updateMenuInPlace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained _itemDidUpdateMenu:self fromMenu:self->_menu];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (double)_width
{
  return self->_width;
}

- (BOOL)isCustomViewItem
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 1) >> 4) & 1;
}

- (UIView)customView
{
  if ((*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x10) != 0) {
    return self->_view;
  }
  else {
    return (UIView *)0;
  }
}

- (void)_connectInterfaceBuilderEventConnection:(id)a3
{
  id v4 = a3;
  v5 = [v4 target];
  [(UIBarButtonItem *)self setTarget:v5];

  uint64_t v6 = [v4 action];
  [(UIBarButtonItem *)self setAction:v6];
}

- (UIMenu)menu
{
  return self->_menu;
}

- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  return self->_preferredMenuElementOrder;
}

- (id)_secondaryActionsProvider
{
  return self->_secondaryActionsProvider;
}

- (UIBarButtonItemGroup)_owningButtonGroup
{
  if (self->_groupRepresentative) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonGroup);
  }
  else {
    id WeakRetained = 0;
  }
  return (UIBarButtonItemGroup *)WeakRetained;
}

- (NSArray)_gestureRecognizers
{
  if (self->_gestureRecognizers) {
    return self->_gestureRecognizers;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (id)_backgroundImageForState:(unint64_t)a3 compact:(BOOL)a4 type:(int64_t)a5
{
  v5 = 0;
  v8 = 0;
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    BarButtonItemResolveSystemBackgroundImage([(UIBarButtonItem *)self systemItem], &v8, a4);
    v5 = v8;
  }
  id v6 = v5;

  return v6;
}

- (UIImage)backgroundImageForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (state > 8 || ((1 << state) & 0x107) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v14 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        UIControlState v16 = state;
        _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
      }
    }
    else
    {
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D2E8) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        UIControlState v16 = state;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
      }
    }
  }
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    if ((state & 0xFFFFFFFFFFFFFFFDLL) == 0 || state == 8) {
      UIControlState v11 = state;
    }
    else {
      UIControlState v11 = 1;
    }
    v9 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundImageForState:v11 style:style isMini:barMetrics == UIBarMetricsCompact];
  }
  else
  {
    if ((byte_1EB25D2D9 & 1) == 0)
    {
      byte_1EB25D2D9 = 1;
      NSLog(&cfstr_SCustomization.isa, "UIBarButtonItem", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    v9 = 0;
  }
  return (UIImage *)v9;
}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  unint64_t v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 > 8 || ((1 << a3) & 0x107) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        int v18 = 134217984;
        unint64_t v19 = v3;
        _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &titleTextAttributesForState____s_category) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 134217984;
        unint64_t v19 = v3;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  if ((v3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && v3 != 8) {
    unint64_t v3 = 1;
  }
  id v6 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:v3];
  if (!v6)
  {
    v7 = [(UIBarButtonItem *)self view];
    char v8 = objc_opt_respondsToSelector();

    v9 = [(UIBarButtonItem *)self view];
    if (v8) {
      goto LABEL_22;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v6 = 0;
      goto LABEL_24;
    }
    UIControlState v11 = [(UIBarButtonItem *)self view];
    v12 = [v11 superview];

    uint64_t v13 = -3;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      v9 = [v12 superview];

      v12 = v9;
      if (__CFADD__(v13++, 1)) {
        goto LABEL_21;
      }
    }
    v9 = v12;
LABEL_21:
    if (objc_opt_respondsToSelector())
    {
LABEL_22:
      id v6 = [v9 _titleTextAttributesForState:v3];
    }
    else
    {
      id v6 = 0;
    }
  }
LABEL_24:
  return v6;
}

- (UIView)view
{
  return self->_view;
}

- (UIBarButtonItemStyle)style
{
  unsigned int v2 = (*(_DWORD *)&self->_barButtonItemFlags >> 1) & 7;
  if (v2 == 1) {
    return 0;
  }
  else {
    return (unint64_t)v2;
  }
}

- (UIColor)tintColor
{
  return [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage tintColor];
}

- (BOOL)isSpringLoaded
{
  $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = self->_barButtonItemFlags;
  if ((*(_WORD *)&barButtonItemFlags & 0x1000) != 0
    || (*(unsigned char *)&barButtonItemFlags & 0x10) != 0 && ((*(unsigned int *)&barButtonItemFlags >> 5) & 0x7F) - 5 < 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    return (*(unsigned int *)&barButtonItemFlags >> 20) & 1;
  }
  return v3;
}

- (NSArray)_interactions
{
  if (self->_interactions) {
    return self->_interactions;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)isSystemItem
{
  return (*(unsigned char *)&self->_barButtonItemFlags >> 4) & 1;
}

- (BOOL)isEnabled
{
  return *(_DWORD *)&self->_barButtonItemFlags & 1;
}

- (SEL)action
{
  if (self->_primaryAction || !self->_action) {
    return 0;
  }
  else {
    return self->_action;
  }
}

- (BOOL)isSelected
{
  return *((unsigned __int8 *)&self->_barButtonItemFlags + 1) >> 7;
}

- (void)_applyDeferredSymbolEffects:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, void *, uint64_t))a3;
  v5 = [(UIBarButtonItem *)self _deferredEffectsCreateIfNecessary:0];
  id v6 = v5;
  if (v4) {
    v7 = (void *)[v5 copy];
  }
  else {
    v7 = 0;
  }
  objc_msgSend(v6, "removeAllObjects", v6);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v12 objectForKeyedSubscript:@"operation"];
        uint64_t v14 = [v13 integerValue];
        v15 = [v12 objectForKeyedSubscript:@"symbolEffect"];
        UIControlState v16 = [v12 objectForKeyedSubscript:@"options"];
        uint64_t v17 = [v12 objectForKeyedSubscript:@"animated"];
        v4[2](v4, v14, v15, v16, [v17 BOOLValue]);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

- (id)_deferredEffectsCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_getAssociatedObject(self, &_deferredEffectsCreateIfNecessary___UIBarButtonItemDeferredSymbolEffectKey);
  id v6 = (void *)v5;
  if (v3 && !v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    objc_setAssociatedObject(self, &_deferredEffectsCreateIfNecessary___UIBarButtonItemDeferredSymbolEffectKey, v6, (void *)1);
  }
  return v6;
}

- (BOOL)_showsChevron
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 5) & 1;
}

- (UIImage)backButtonBackgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    if (state > 8 || ((1 << state) & 0x107) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v12 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          UIControlState v14 = state;
          _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "back button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
      else
      {
        UIControlState v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D2F8) + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          UIControlState v14 = state;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "back button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
    }
    if ((state & 0xFFFFFFFFFFFFFFFDLL) == 0 || state == 8) {
      UIControlState v9 = state;
    }
    else {
      UIControlState v9 = 1;
    }
    id v4 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:v9 isMini:barMetrics == UIBarMetricsCompact];
  }
  else
  {
    if ((byte_1EB25D2DB & 1) == 0)
    {
      byte_1EB25D2DB = 1;
      NSLog(&cfstr_SCustomization.isa, a2, state, "UIBarButtonItem", @"back button background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    id v4 = 0;
  }
  return (UIImage *)v4;
}

- (id)_imageForState:(unint64_t)a3 compact:(BOOL)a4 type:(int64_t)a5
{
  id v9 = 0;
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    BarButtonItemResolveSystemImage([(UIBarButtonItem *)self systemItem], &v9, a4, a5);
    id v6 = v9;
  }
  else if (!a4 {
         || ([(UIBarButtonItem *)self landscapeImagePhone],
  }
             id v6 = objc_claimAutoreleasedReturnValue(),
             (id v9 = v6) == 0))
  {
    id v6 = [(UIBarButtonItem *)self image];
    id v9 = v6;
  }
  id v7 = v6;

  return v7;
}

- (id)image
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = self->_image;
  }
  return v2;
}

- (id)resolvedTitle
{
  unint64_t barButtonItemFlags = self->_barButtonItemFlags;
  if ((barButtonItemFlags & 0x10) != 0)
  {
    BOOL v3 = BarButtonItemTitleForSystemItem((barButtonItemFlags >> 5) & 0x7F);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIBarButtonItem;
    BOOL v3 = [(UIBarItem *)&v5 resolvedTitle];
  }
  return v3;
}

- (id)title
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = self->_title;
  }
  return v2;
}

- (BOOL)isSymbolAnimationEnabled
{
  return *((unsigned char *)&self->_barButtonItemFlags + 3) & 1;
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double top = self->_additionalSelectionInsets.top;
  double left = self->_additionalSelectionInsets.left;
  double bottom = self->_additionalSelectionInsets.bottom;
  double right = self->_additionalSelectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIBarButtonItem)initWithImage:(UIImage *)image menu:(UIMenu *)menu
{
  return [(UIBarButtonItem *)self initWithTitle:0 image:image target:0 action:0 menu:menu];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (_UIUseModernBars())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (!-[UIBarButtonItem isSpaceItem](self, "isSpaceItem") || ![v5 isSpaceItem]) {
        goto LABEL_11;
      }
      int64_t v6 = [(UIBarButtonItem *)self systemItem];
      if (v6 != [v5 systemItem])
      {
        BOOL v10 = 0;
        goto LABEL_12;
      }
      if ([(UIBarButtonItem *)self systemItem] == 5
        || (-[UIBarButtonItem width](self, "width"), double v8 = v7, [v5 width], v8 == v9))
      {
        BOOL v10 = 1;
      }
      else
      {
LABEL_11:
        v12.receiver = self;
        v12.super_class = (Class)UIBarButtonItem;
        BOOL v10 = [(UIBarButtonItem *)&v12 isEqual:v5];
      }
LABEL_12:

      goto LABEL_13;
    }
    BOOL v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIBarButtonItem;
    BOOL v10 = [(UIBarButtonItem *)&v13 isEqual:v4];
  }
LABEL_13:

  return v10;
}

- (int64_t)systemItem
{
  return ((unint64_t)self->_barButtonItemFlags >> 5) & 0x7F;
}

- (unint64_t)hash
{
  if (_UIUseModernBars() && [(UIBarButtonItem *)self isSpaceItem]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIBarButtonItem;
  return [(UIBarButtonItem *)&v4 hash];
}

- (BOOL)isSpaceItem
{
  return (((*(_DWORD *)&self->_barButtonItemFlags >> 5) & 0x7Fu) - 5 < 2) & (*(_DWORD *)&self->_barButtonItemFlags >> 4);
}

- (CGFloat)width
{
  if ((*(_DWORD *)&self->_barButtonItemFlags & 0x10) == 0) {
    return self->_width;
  }
  CGFloat result = 0.0;
  if ((*(_DWORD *)&self->_barButtonItemFlags & 0xFE0) == 0xC0) {
    return self->_width;
  }
  return result;
}

- (void)_setWidth:(double)a3
{
  if (self->_width != a3)
  {
    self->_width = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    id v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _itemDidChangeWidth:self];
    }
    else {
      [(UIBarButtonItem *)self _updateView];
    }
  }
}

- (void)setWidth:(CGFloat)width
{
  if ((*(_DWORD *)&self->_barButtonItemFlags & 0x10) == 0 || (*(_DWORD *)&self->_barButtonItemFlags & 0xFE0) == 0xC0) {
    [(UIBarButtonItem *)self _setWidth:width];
  }
}

- (_UIBarButtonItemViewOwner)_viewOwner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
  return (_UIBarButtonItemViewOwner *)WeakRetained;
}

- (UIBarButtonItem)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
  v19[1] = *MEMORY[0x1E4F143B8];
  BOOL v10 = title;
  id v11 = target;
  objc_super v12 = [(UIBarButtonItem *)self init];
  objc_super v13 = v12;
  if (v12)
  {
    [(UIBarButtonItem *)v12 setTitle:v10];
    [(UIBarButtonItem *)v13 setStyle:style];
    [(UIBarButtonItem *)v13 setTarget:v11];
    [(UIBarButtonItem *)v13 setAction:action];
    if (v10)
    {
      if (style == UIBarButtonItemStyleDone)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v19[0] = v10;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        uint64_t v16 = [v14 initWithObjects:v15 forKeys:&unk_1ED3EF1D0];
        stylesForSizingTitles = v13->_stylesForSizingTitles;
        v13->_stylesForSizingTitles = (NSDictionary *)v16;
      }
    }
  }

  return v13;
}

- (UIBarButtonItem)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
  BOOL v10 = image;
  id v11 = target;
  objc_super v12 = [(UIBarButtonItem *)self init];
  objc_super v13 = v12;
  if (v12)
  {
    [(UIBarButtonItem *)v12 setImage:v10];
    [(UIBarButtonItem *)v13 setStyle:style];
    [(UIBarButtonItem *)v13 setTarget:v11];
    [(UIBarButtonItem *)v13 setAction:action];
  }

  return v13;
}

- (void)setStyle:(UIBarButtonItemStyle)style
{
  unint64_t barButtonItemFlags = self->_barButtonItemFlags;
  if (((barButtonItemFlags >> 1) & 7) != style)
  {
    self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(barButtonItemFlags & 0xFFFFFFF1 | (2 * (style & 7)));
    [(UIBarButtonItem *)self _updateView];
  }
}

- (UIBarButtonItem)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action menu:(UIMenu *)menu
{
  objc_super v12 = title;
  objc_super v13 = image;
  id v14 = target;
  uint64_t v15 = menu;
  uint64_t v16 = [(UIBarButtonItem *)self init];
  uint64_t v17 = v16;
  if (v16)
  {
    [(UIBarButtonItem *)v16 setTitle:v12];
    [(UIBarButtonItem *)v17 setImage:v13];
    [(UIBarButtonItem *)v17 setTarget:v14];
    [(UIBarButtonItem *)v17 setAction:action];
    [(UIBarButtonItem *)v17 setMenu:v15];
  }

  return v17;
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0 && self->_image != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(UIBarButtonItem *)self _updateView];
    id v5 = v6;
  }
}

- (void)setTitle:(id)a3
{
  objc_super v4 = (NSString *)a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0 && self->_title != v4)
  {
    double v9 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    id v5 = v9;
    if (!v6)
    {
      double v7 = (NSString *)[(NSString *)v9 copy];
      title = self->_title;
      self->_title = v7;

      [(UIBarButtonItem *)self _updateView];
      id v5 = v9;
    }
  }
}

- (void)_updateView
{
  if ((*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x10) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    objc_super v4 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained _itemStandardViewNeedsUpdate:self];
LABEL_21:

      return;
    }
    view = self->_view;
    if (!view) {
      goto LABEL_21;
    }
    BOOL v6 = [(UIView *)view superview];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v6;
          [(UIView *)self->_view removeFromSuperview];
          uint64_t v16 = self->_view;
          self->_view = 0;

          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __30__UIBarButtonItem__updateView__block_invoke;
          v22[3] = &unk_1E52D9F98;
          v22[4] = self;
          id v23 = v15;
          id v17 = v15;
          +[UIView performWithoutAnimation:v22];
        }
      }
      else
      {
        int v18 = self->_view;
        self->_view = 0;
      }
      goto LABEL_20;
    }
    id v7 = objc_loadWeakRetained((id *)&self->__owningNavigationItem);
    double v8 = [v7 _navigationBar];

    if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0)
    {
LABEL_17:
      [(UIView *)self->_view setStyle:2 * ([(UIBarButtonItem *)self style] == UIBarButtonItemStyleDone)];
      long long v24 = 0u;
      long long v25 = 0u;
      -[UIBarButtonItem _getNavBarEdgeSizeAdjust:imageInsets:landscape:](self, "_getNavBarEdgeSizeAdjust:imageInsets:landscape:", 0, &v24, [v8 isMinibar]);
      -[UIView setImageEdgeInsets:](self->_view, "setImageEdgeInsets:", v24, v25);
      unint64_t v19 = self->_view;
      appearanceStorage = self->_appearanceStorage;
      long long v21 = objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
      [(UIView *)v19 _applyBarButtonAppearanceStorage:appearanceStorage withTaggedSelectors:v21];

      if (self->__showsBackButtonIndicator) {
        [v8 _updateBackIndicatorImage];
      }

LABEL_20:
      goto LABEL_21;
    }
    double v9 = self->_view;
    BOOL v10 = [(UIBarButtonItem *)self title];
    [(UIView *)v9 setTitle:v10];

    id v11 = self->_view;
    if ([v8 isMinibar])
    {
      uint64_t v12 = [(UIBarButtonItem *)self landscapeImagePhone];
      if (!v12)
      {
        objc_super v13 = [(UIBarButtonItem *)self image];
        [(UIView *)v11 setImage:v13];

        id v14 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v12 = [(UIBarButtonItem *)self image];
    }
    id v14 = (void *)v12;
    [(UIView *)v11 setImage:v12];
    goto LABEL_16;
  }
}

- (void)_setBackButtonAlternateTitles:(id)a3
{
}

- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action
{
  id v8 = target;
  double v9 = [(UIBarButtonItem *)self init];
  BOOL v10 = v9;
  if (v9)
  {
    v9->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v9->_barButtonItemFlags & 0xFFFFF00F | (32 * (systemItem & 0x7F)) | 0x10);
    if (systemItem == UIBarButtonSystemItemDone) {
      [(UIBarButtonItem *)v9 setStyle:2];
    }
    [(UIBarButtonItem *)v10 setTarget:v8];
    [(UIBarButtonItem *)v10 setAction:action];
    [(UIBarButtonItem *)v10 setHidden:BarButtonItemSystemItemIsHidden(systemItem)];
  }

  return v10;
}

- (void)setTarget:(id)target
{
  id v4 = target;
  if (!v4)
  {
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  char v5 = dyld_program_sdk_at_least();
  BOOL v6 = v4;
  if ((v5 & 1) == 0)
  {
    unsigned __int8 v7 = objc_msgSend(v4, sel_allowsWeakReference);
    BOOL v6 = v4;
    if ((v7 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __29__UIBarButtonItem_setTarget___block_invoke;
      v9[3] = &unk_1E52D9F98;
      id v10 = v4;
      id v11 = self;
      if (setTarget__once != -1) {
        dispatch_once(&setTarget__once, v9);
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  id v8 = v6;

  objc_storeWeak(&self->_target, v8);
}

- (void)setHidden:(BOOL)hidden
{
  if (self->_hidden != hidden)
  {
    self->_hidden = hidden;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    [WeakRetained _itemDidChangeHiddenState:self];
  }
}

- (void)setPrimaryAction:(UIAction *)primaryAction
{
  id v4 = primaryAction;
  BOOL v5 = [(UIBarButtonItem *)self _menuIsPrimary];
  BOOL v6 = [(UIAction *)v4 _immutableCopy];

  unsigned __int8 v7 = self->_primaryAction;
  self->_primaryAction = v6;

  if (v5 != [(UIBarButtonItem *)self _menuIsPrimary])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    [WeakRetained _itemStandardViewNeedsUpdate:self];

    [(UIBarButtonItem *)self _updateForAutomaticSelection];
  }
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    double v9 = self->_primaryAction;
    if (v9)
    {
      id v10 = [(UIMenuElement *)v9 title];
      [(UIBarButtonItem *)self setTitle:v10];

      id v11 = [(UIMenuElement *)self->_primaryAction image];
      [(UIBarButtonItem *)self setImage:v11];
    }
  }
}

- (void)setAction:(SEL)action
{
  BOOL v5 = [(UIBarButtonItem *)self _menuIsPrimary];
  if (action) {
    BOOL v6 = action;
  }
  else {
    BOOL v6 = 0;
  }
  self->_action = v6;
  if (v5 != [(UIBarButtonItem *)self _menuIsPrimary])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    [WeakRetained _itemStandardViewNeedsUpdate:self];

    [(UIBarButtonItem *)self _updateForAutomaticSelection];
  }
}

- (BOOL)_menuIsPrimary
{
  if ((*((_WORD *)&self->_barButtonItemFlags + 1) & 3) != 0) {
    return (*((_WORD *)&self->_barButtonItemFlags + 1) & 3) != 1;
  }
  if ((self->_menu || self->_secondaryActionsProvider) && !self->_action) {
    return self->_primaryAction == 0;
  }
  return 0;
}

- (UIBarButtonItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIBarButtonItem;
  unsigned int v2 = [(UIBarItem *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(UIBarButtonItem *)v2 setEnabled:1];
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_barButtonItemFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFFFFFE | a3);
    if (objc_opt_respondsToSelector()) {
      [(UIView *)self->_view setEnabled:*(_DWORD *)&self->_barButtonItemFlags & 1];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained _itemDidChangeEnabledState:self];
      id WeakRetained = v5;
    }
  }
}

- (void)setMenu:(UIMenu *)menu
{
  BOOL v3 = self->_menu;
  if (v3 != menu)
  {
    double v9 = v3;
    BOOL v6 = (UIMenu *)[(UIMenu *)menu copy];
    unsigned __int8 v7 = self->_menu;
    self->_menu = v6;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([WeakRetained _itemDidUpdateMenu:self fromMenu:v9] & 1) == 0)
    {
      [WeakRetained _itemStandardViewNeedsUpdate:self];
    }
    [(UIBarButtonItem *)self _updateForAutomaticSelection];
  }
}

- (void)_updateForAutomaticSelection
{
  BOOL v3 = [(UIBarButtonItem *)self _isPopUpMenuButtonWithMenu:self->_menu];
  menu = self->_menu;
  if (v3)
  {
    [(UIMenu *)menu setForceAutomaticSelection:1];
    [(UIMenu *)self->_menu setForcedAutomaticSelectionDelegate:self];
    id v5 = [(UIMenu *)self->_menu selectedElements];
    BOOL v6 = [v5 firstObject];
    unsigned __int8 v7 = [v6 title];
    [(UIBarButtonItem *)self setTitle:v7];

    id v11 = [(UIMenu *)self->_menu selectedElements];
    id v8 = [v11 firstObject];
    double v9 = [v8 image];
    [(UIBarButtonItem *)self setImage:v9];
  }
  else
  {
    [(UIMenu *)menu setForcedAutomaticSelectionDelegate:0];
    id v10 = self->_menu;
    [(UIMenu *)v10 setForceAutomaticSelection:0];
  }
}

- (BOOL)_isPopUpMenuButtonWithMenu:(id)a3
{
  return a3
      && (*((unsigned char *)&self->_barButtonItemFlags + 2) & 0x80) != 0
      && [(UIBarButtonItem *)self _menuIsPrimary];
}

- (UIEdgeInsets)imageInsets
{
  double top = self->_imageInsets.top;
  double left = self->_imageInsets.left;
  double bottom = self->_imageInsets.bottom;
  double right = self->_imageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGFloat)backgroundVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundVerticalAdjustmentForBarMetrics:barMetrics];
  return result;
}

- (void)setView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_view != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_view, a3);
    id v5 = v6;
  }
}

- (void)_setShowsChevron:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFDFFFFF | v3);
}

- (BOOL)_actsAsFakeBackButton
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 3) & 1;
}

- (BOOL)_showsBackButtonIndicator
{
  return self->__showsBackButtonIndicator;
}

- (void)setSpringLoaded:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFEFFFFF | v3);
}

- (void)_setShowsBackButtonIndicator:(BOOL)a3
{
  if (self->__showsBackButtonIndicator != a3)
  {
    self->__showsBackButtonIndicator = a3;
    int v4 = a3 ? 0x200000 : 0;
    self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFDFFFFF | v4);
    if (dyld_program_sdk_at_least())
    {
      id v5 = [(UIBarButtonItem *)self _owningNavigationItem];
      objc_msgSend(v5, "updateNavigationBarButtonsAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
    }
  }
}

- (void)_setLargeContentSizeTitle:(id)a3
{
}

- (void)_setActsAsFakeBackButton:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFF7FFFF | v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__itemVariation, 0);
  objc_storeStrong((id *)&self->__backButtonAlternateTitles, 0);
  objc_storeStrong(&self->__autoValidationHandler, 0);
  objc_destroyWeak((id *)&self->__viewOwner);
  objc_destroyWeak((id *)&self->__owningButtonGroup);
  objc_destroyWeak((id *)&self->__owningNavigationItem);
  objc_destroyWeak((id *)&self->_buttonGroup);
  objc_storeStrong((id *)&self->_menuRepresentation, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong(&self->_secondaryActionsProvider, 0);
  objc_storeStrong((id *)&self->_stylesForSizingTitles, 0);
  objc_storeStrong((id *)&self->_possibleSystemItems, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_landscapeImagePhone, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (UIOffset)titlePositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (barMetrics == UIBarMetricsCompact) {
      [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniTitlePositionOffset];
    }
    else {
    BOOL v6 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage titlePositionOffset];
    }
    unsigned __int8 v7 = v6;
    if (v6)
    {
      [v6 UIOffsetValue];
      double v3 = v8;
      double v4 = v9;
    }
    else
    {
      double v3 = 0.0;
      double v4 = 0.0;
    }
  }
  else
  {
    double v3 = 0.0;
    if ((titlePositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      titlePositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, "UIBarButtonItem", @"title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    double v4 = 0.0;
  }
  double v10 = v3;
  double v11 = v4;
  result.vertical = v11;
  result.horizontal = v10;
  return result;
}

- (UIMenuElement)menuRepresentation
{
  return self->_menuRepresentation;
}

- (void)dealloc
{
  if (![(UIBarButtonItem *)self isCustomViewItem] && (objc_opt_respondsToSelector() & 1) != 0) {
    [(UIView *)self->_view removeTarget:self action:sel__sendAction_withEvent_ forControlEvents:0x2000];
  }
  v3.receiver = self;
  v3.super_class = (Class)UIBarButtonItem;
  [(UIBarButtonItem *)&v3 dealloc];
}

- (NSArray)_backButtonAlternateTitles
{
  return self->__backButtonAlternateTitles;
}

- (id)largeContentSizeImage
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    unsigned int v2 = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIBarButtonItem;
    unsigned int v2 = [(UIBarItem *)&v4 largeContentSizeImage];
  }
  return v2;
}

- (UIEdgeInsets)largeContentSizeImageInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIBarButtonItem;
    [(UIBarItem *)&v6 largeContentSizeImageInsets];
  }
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v2;
  result.double top = v3;
  return result;
}

- (UIBarButtonItemGroup)buttonGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonGroup);
  return (UIBarButtonItemGroup *)WeakRetained;
}

- (void)_setButtonGroup:(id)a3 isRepresentative:(BOOL)a4
{
  objc_storeWeak((id *)&self->_buttonGroup, a3);
  if (a3) {
    BOOL v7 = a4;
  }
  else {
    BOOL v7 = 0;
  }
  self->_groupRepresentative = v7;
}

- (void)_setWantsThreeUp:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFBFFFFF | v3);
}

- (BOOL)_flexible
{
  return self->_flexible;
}

- (BOOL)hasImage
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    uint64_t v5 = [(UIBarButtonItem *)self systemItem];
    return BarButtonItemResolveSystemImage(v5, 0, 0, 0);
  }
  else
  {
    double v2 = [(UIBarButtonItem *)self image];
    BOOL v3 = v2 != 0;

    return v3;
  }
}

- (void)setIsMinibarView:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFFDFFF | v3);
}

- (id)landscapeImagePhone
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0) {
    double v2 = 0;
  }
  else {
    double v2 = self->_landscapeImagePhone;
  }
  return v2;
}

- (id)createViewForNavigationItem:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 navigationBar];
  int v6 = [v5 _hasLegacyProvider];

  if (v6)
  {
    if ((*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x10) != 0)
    {
      id v14 = [(UIBarButtonItem *)self customView];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(UIBarButtonItem *)self _applyPositionAdjustmentToSegmentedControl:v14];
      }
      _clampWidthOfView(v14, self->_minimumWidth, self->_maximumWidth);
    }
    else
    {
      uint64_t v47 = 0;
      UIBarButtonItemStyle v46 = UIBarButtonItemStylePlain;
      long long v7 = *MEMORY[0x1E4F1DB30];
      long long v44 = 0u;
      long long v45 = v7;
      long long v43 = 0u;
      double v8 = [v4 navigationBar];
      uint64_t v9 = [v8 barStyle];
      if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0)
      {
        id v41 = 0;
        id v42 = 0;
        id v40 = 0;
        LOWORD(v33) = [v8 isMinibar];
        -[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:](self, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:", &v46, &v42, &v41, &v40, &v47, v9, v33);
        id v10 = v42;
        uint64_t v12 = (UIImage *)v41;
        id v35 = v40;
        -[UIBarButtonItem _getNavBarEdgeSizeAdjust:imageInsets:landscape:](self, "_getNavBarEdgeSizeAdjust:imageInsets:landscape:", &v45, &v43, [v8 isMinibar]);
        if (![(UIBarButtonItem *)self action] && v47) {
          -[UIBarButtonItem setAction:](self, "setAction:");
        }
      }
      else
      {
        id v10 = [(UIBarButtonItem *)self title];
        if (![v8 isMinibar] || (image = self->_landscapeImagePhone) == 0) {
          image = self->_image;
        }
        uint64_t v12 = image;
        id v35 = 0;
        UIBarButtonItemStyle v46 = [(UIBarButtonItem *)self style];
        long long v13 = *(_OWORD *)&self->_imageInsets.bottom;
        long long v43 = *(_OWORD *)&self->_imageInsets.top;
        long long v44 = v13;
      }
      if (v46 == (UIBarButtonItemStyleDone|UIBarButtonItemStyleBordered|0x4)) {
        unsigned int v15 = 5;
      }
      else {
        unsigned int v15 = 0;
      }
      if (v46 == UIBarButtonItemStyleDone) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = v15;
      }
      if (v9 == 1 && ([v8 isTranslucent] & 1) != 0) {
        uint64_t v9 = 2;
      }
      if (v12)
      {
        id v17 = objc_alloc((Class)[(id)objc_opt_class() classForNavigationButton]);
        if ((*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x40) != 0) {
          double width = self->_width;
        }
        else {
          [(UIBarButtonItem *)self width];
        }
        LOBYTE(v33) = 0;
        id v14 = (void *)[v17 initWithValue:v12 width:v16 style:v9 barStyle:0 possibleTitles:self->_possibleSystemItems possibleSystemItems:0 tintColor:width applyBezel:v33 forButtonItemStyle:v46];
      }
      else if (v10)
      {
        id v19 = objc_alloc((Class)[(id)objc_opt_class() classForNavigationButton]);
        long long v20 = [(UIBarButtonItem *)self possibleTitles];
        id v14 = (void *)[v19 initWithTitle:v10 possibleTitles:v20 style:v16];
      }
      else
      {
        id v14 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        [v14 _setCreatedByBarButtonItem:1];
      }
      [(UIBarButtonItem *)self _setEnclosingBar:v8 onItem:v14];
      if (v14)
      {
        [v14 setOriginatingButtonItem:self];
        [v14 setOriginatingNavigationItem:v4];
        [v14 _setStylesForSizingTitles:self->_stylesForSizingTitles];
        objc_msgSend(v14, "setEnabled:", -[UIBarButtonItem isEnabled](self, "isEnabled"));
        [v14 setAutosizesToFit:(*(_DWORD *)&self->_barButtonItemFlags & 0x4000) == 0];
        [v14 addTarget:self action:sel__sendAction_withEvent_ forControlEvents:0x2000];
        objc_msgSend(v14, "setImageEdgeInsets:", v43, v44);
        if (self->_width <= 0.0)
        {
          _clampWidthOfView(v14, self->_minimumWidth, self->_maximumWidth);
          [v14 setMinimumWidth:self->_minimumWidth];
          [v14 setMaximumWidth:self->_maximumWidth];
        }
        [v14 _setBoundsAdjustment:v45];
        long long v21 = [v8 _appearanceStorage];
        long long v22 = [v21 _barButtonAppearanceStorage];
        [v14 _applyBarButtonAppearanceStorage:v22 withTaggedSelectors:0];

        appearanceStorage = self->_appearanceStorage;
        long long v24 = objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
        [v14 _applyBarButtonAppearanceStorage:appearanceStorage withTaggedSelectors:v24];

        if (+[_UIAppearance _hasCustomizationsForClass:objc_opt_class() guideClass:0])
        {
          [v14 _setAppearanceIsInvalid:1];
        }
        [v14 _setAppearanceGuideClass:objc_opt_class()];
        gestureRecognizers = self->_gestureRecognizers;
        if (gestureRecognizers)
        {
          v34 = v12;
          id v26 = v10;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v27 = gestureRecognizers;
          uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v37 != v30) {
                  objc_enumerationMutation(v27);
                }
                [v14 addGestureRecognizer:*(void *)(*((void *)&v36 + 1) + 8 * i)];
              }
              uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
            }
            while (v29);
          }

          id v10 = v26;
          uint64_t v12 = v34;
        }
      }
      [v14 setSelected:(*(_DWORD *)&self->_barButtonItemFlags >> 15) & 1];
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)_setOwningNavigationItem:(id)a3
{
}

- (void)_relinquishOwnership:(id)a3
{
  p_viewOwner = &self->__viewOwner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewOwner);

  uint64_t v5 = WeakRetained;
  if (WeakRetained == v4)
  {
    objc_storeWeak((id *)p_viewOwner, 0);
    uint64_t v5 = WeakRetained;
  }
}

- (UIBarButtonItem)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v35.receiver = self;
  v35.super_class = (Class)UIBarButtonItem;
  uint64_t v5 = [(UIBarItem *)&v35 initWithCoder:v4];
  if (v5)
  {
    v5->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFFFFE | [(NSCoder *)v4 decodeBoolForKey:@"UIEnabled"]);
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIIsSystemItem"]) {
      int v6 = 16;
    }
    else {
      int v6 = 0;
    }
    v5->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFFFEF | v6);
    v5->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFF01F | (32 * ([(NSCoder *)v4 decodeIntegerForKey:@"UISystemItem"] & 0x7F)));
    long long v7 = [(NSCoder *)v4 decodeObjectForKey:@"UIAction"];
    SEL v8 = NSSelectorFromString(v7);
    if (v8) {
      SEL v9 = v8;
    }
    else {
      SEL v9 = 0;
    }
    v5->_action = v9;

    id v10 = [(NSCoder *)v4 decodeObjectForKey:@"UITarget"];
    objc_storeWeak(&v5->_target, v10);

    uint64_t v11 = [(NSCoder *)v4 decodeObjectForKey:@"UITitle"];
    title = v5->_title;
    v5->_title = (NSString *)v11;

    uint64_t v13 = [(NSCoder *)v4 decodeObjectForKey:@"UIImage"];
    image = v5->_image;
    v5->_image = (UIImage *)v13;

    uint64_t v15 = [(NSCoder *)v4 decodeObjectForKey:@"UILandscapeImagePhone"];
    landscapeImagePhone = v5->_landscapeImagePhone;
    v5->_landscapeImagePhone = (UIImage *)v15;

    [(NSCoder *)v4 decodeFloatForKey:@"UIWidth"];
    v5->_double width = v17;
    [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"UIImageInsets"];
    v5->_imageInsets.double top = v18;
    v5->_imageInsets.double left = v19;
    v5->_imageInsets.double bottom = v20;
    v5->_imageInsets.double right = v21;
    [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"UILandscapeImagePhoneInsets"];
    v5->_landscapeImagePhoneInsets.double top = v22;
    v5->_landscapeImagePhoneInsets.double left = v23;
    v5->_landscapeImagePhoneInsets.double bottom = v24;
    v5->_landscapeImagePhoneInsets.double right = v25;
    *(_DWORD *)&v5->_barButtonItemFlags &= 0xFFFFFFF1;
    [(UIBarItem *)v5 setTag:[(NSCoder *)v4 decodeIntegerForKey:@"UITag"]];
    uint64_t v26 = [(NSCoder *)v4 decodeObjectForKey:@"UICustomView"];
    view = v5->_view;
    v5->_view = (UIView *)v26;

    v5->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFEFFF | ((v5->_view != 0) << 12));
    if ([(NSCoder *)v4 containsValueForKey:@"UIStyle"]) {
      v5->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFFFFFFF1 | (2 * ([(NSCoder *)v4 decodeIntegerForKey:@"UIStyle"] & 7)));
    }
    v5->_hidden = [(NSCoder *)v4 decodeBoolForKey:@"UIItemHidden"];
    uint64_t v28 = [(NSCoder *)v4 decodeObjectForKey:@"UITintColor"];
    if (v28) {
      [(UIBarButtonItem *)v5 setTintColor:v28];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISpringLoaded"]) {
      [(UIBarButtonItem *)v5 setSpringLoaded:[(NSCoder *)v4 decodeBoolForKey:@"UISpringLoaded"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIBarButtonMenu"])
    {
      uint64_t v29 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIBarButtonMenu"];
      menu = v5->_menu;
      v5->_menu = (UIMenu *)v29;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIBarButtonSelectionAsPrimary"])
    {
      if ([(NSCoder *)v4 decodeBoolForKey:@"UIBarButtonSelectionAsPrimary"]) {
        int v31 = 0x800000;
      }
      else {
        int v31 = 0;
      }
      v5->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v5->_barButtonItemFlags & 0xFF7FFFFF | v31);
    }
    [(UIBarButtonItem *)v5 _updateForAutomaticSelection];
    uint64_t v32 = [(NSCoder *)v4 decodeObjectForKey:@"UIMenuRepresentation"];
    menuRepresentation = v5->_menuRepresentation;
    v5->_menuRepresentation = (UIMenuElement *)v32;
  }
  return v5;
}

- (UIBarButtonItem)initWithPrimaryAction:(UIAction *)primaryAction menu:(UIMenu *)menu
{
  int v6 = primaryAction;
  long long v7 = menu;
  SEL v8 = [(UIBarButtonItem *)self init];
  SEL v9 = v8;
  if (v8)
  {
    [(UIBarButtonItem *)v8 setPrimaryAction:v6];
    [(UIBarButtonItem *)v9 setMenu:v7];
  }

  return v9;
}

+ (UIBarButtonItem)fixedSpaceItemOfWidth:(CGFloat)width
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBarButtonSystemItem:6 primaryAction:0];
  [v4 setWidth:width];
  return (UIBarButtonItem *)v4;
}

- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem primaryAction:(UIAction *)primaryAction menu:(UIMenu *)menu
{
  SEL v8 = primaryAction;
  SEL v9 = menu;
  id v10 = [(UIBarButtonItem *)self init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&v10->_barButtonItemFlags & 0xFFFFF00F | (32 * (systemItem & 0x7F)) | 0x10);
    if (systemItem == UIBarButtonSystemItemDone) {
      [(UIBarButtonItem *)v10 setStyle:2];
    }
    [(UIBarButtonItem *)v11 setPrimaryAction:v8];
    [(UIBarButtonItem *)v11 setMenu:v9];
    [(UIBarButtonItem *)v11 setHidden:BarButtonItemSystemItemIsHidden(systemItem)];
  }

  return v11;
}

- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem primaryAction:(UIAction *)primaryAction
{
  return [(UIBarButtonItem *)self initWithBarButtonSystemItem:systemItem primaryAction:primaryAction menu:0];
}

- (id)target
{
  if (self->_primaryAction) {
    id WeakRetained = 0;
  }
  else {
    id WeakRetained = objc_loadWeakRetained(&self->_target);
  }
  return WeakRetained;
}

- (void)setTintColor:(UIColor *)tintColor
{
  SEL v8 = tintColor;
  if (!self->_appearanceStorage)
  {
    uint64_t v5 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v5;
  }
  _UIAppearanceTagObjectForSelector(self, a2, 0);
  uint64_t v7 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage tintColor];
  if ((unint64_t)v8 | v7 && ![(UIColor *)v8 isEqual:v7])
  {
    [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setTintColor:v8];
    [(UIBarButtonItem *)self _updateView];
  }
}

- (UIBarButtonItem)initWithCustomView:(UIView *)customView
{
  id v4 = customView;
  uint64_t v5 = [(UIBarButtonItem *)self init];
  int v6 = v5;
  if (v5) {
    [(UIBarButtonItem *)v5 setCustomView:v4];
  }

  return v6;
}

- (void)setCustomView:(UIView *)customView
{
  uint64_t v5 = customView;
  if (v5 || (*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x10) != 0)
  {
    p_view = &self->_view;
    view = self->_view;
    if (view != v5)
    {
      uint64_t v16 = v5;
      SEL v8 = [(UIView *)view superview];
      SEL v9 = *p_view;
      objc_storeStrong((id *)&self->_view, customView);
      self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFFEFFF | ((*p_view != 0) << 12));
      if (*p_view
        && +[_UIAppearance _hasCustomizationsForClass:objc_opt_class() guideClass:0])
      {
        [(UIView *)*p_view _setAppearanceIsInvalid:1];
      }
      if (objc_opt_respondsToSelector()) {
        [(UIView *)*p_view setEnabled:*(_DWORD *)&self->_barButtonItemFlags & 1];
      }
      [(UIBarButtonItem *)self _updateView];
      id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
      uint64_t v11 = WeakRetained;
      if (WeakRetained)
      {
        [WeakRetained _itemCustomViewDidChange:self fromView:v9];
      }
      else if (v8)
      {
        id v12 = objc_loadWeakRetained((id *)&self->__owningNavigationItem);
        uint64_t v13 = v12;
        if (v12)
        {
          id v14 = [v12 _navigationBar];
        }
        else
        {
          id v14 = v8;
        }
        uint64_t v15 = v14;
        if (objc_opt_respondsToSelector()) {
          [v15 _customViewChangedForButtonItem:self];
        }
      }
      [(UIView *)v9 removeFromSuperview];

      uint64_t v5 = v16;
    }
  }
}

- (void)_setPossibleItemVariations:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    if ([v4 count])
    {
      int v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      CGFloat v18 = v5;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            id v14 = [v13 title];
            uint64_t v15 = [v13 style];
            if (v14)
            {
              unint64_t v16 = v15;
              [v6 addObject:v14];
              if (v16 >= 2)
              {
                float v17 = [NSNumber numberWithInteger:v16];
                [v7 setObject:v17 forKey:v14];
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }

      [(UIBarButtonItem *)self _setStylesForSizingTitles:v7];
      [(UIBarButtonItem *)self setPossibleTitles:v6];

      uint64_t v5 = v18;
    }
    else
    {
      [(UIBarButtonItem *)self _setStylesForSizingTitles:0];
      [(UIBarButtonItem *)self setPossibleTitles:0];
    }
  }
}

- (void)setPossibleTitles:(NSSet *)possibleTitles
{
  id v4 = possibleTitles;
  uint64_t v5 = v4;
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    uint64_t v9 = v4;
    BOOL v6 = [(NSSet *)v4 isEqualToSet:self->_possibleTitles];
    uint64_t v5 = v9;
    if (!v6)
    {
      id v7 = (NSSet *)[(NSSet *)v9 copy];
      id v8 = self->_possibleTitles;
      self->_possibleTitles = v7;

      [(UIBarButtonItem *)self _updateView];
      uint64_t v5 = v9;
    }
  }
}

- (void)_setStylesForSizingTitles:(id)a3
{
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!self->_appearanceStorage)
  {
    id v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;
  }
  if (a4 > 8 || ((1 << a4) & 0x107) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      long long v19 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        int v20 = 134217984;
        unint64_t v21 = a4;
        _os_log_fault_impl(&dword_1853B0000, v19, OS_LOG_TYPE_FAULT, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      CGFloat v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setTitleTextAttributes_forState____s_category) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134217984;
        unint64_t v21 = a4;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 || a4 == 8) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = 1;
  }
  uint64_t v12 = objc_msgSend(v7, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");

  uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
  id v14 = [NSNumber numberWithInteger:v11];
  uint64_t v15 = [v13 arrayWithObject:v14];
  _UIAppearanceTagObjectForSelector(self, a2, v15);

  uint64_t v16 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:v11];
  float v17 = (void *)v16;
  if (v16 | v12 && ([(id)v16 isEqual:v12] & 1) == 0)
  {
    [(_UIBarItemAppearanceStorage *)self->_appearanceStorage setTextAttributes:v12 forState:v11];
    [(UIBarButtonItem *)self _updateView];
  }
}

- (UIBarButtonItem)initWithPrimaryAction:(UIAction *)primaryAction
{
  return [(UIBarButtonItem *)self initWithPrimaryAction:primaryAction menu:0];
}

- (void)_setGestureRecognizers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_gestureRecognizers;
  BOOL v6 = (NSArray *)v4;
  uint64_t v12 = v6;
  if (v5 == v6)
  {

    id WeakRetained = v12;
LABEL_9:

    id v8 = v12;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    id v8 = v12;
    goto LABEL_8;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  id v8 = v12;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    uint64_t v10 = (NSArray *)[(NSArray *)v8 copy];
    gestureRecognizers = self->_gestureRecognizers;
    self->_gestureRecognizers = v10;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    [WeakRetained _itemStandardViewNeedsUpdate:self];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3
{
  if (self->_additionalSelectionInsets.left != a3.left
    || self->_additionalSelectionInsets.top != a3.top
    || self->_additionalSelectionInsets.right != a3.right
    || self->_additionalSelectionInsets.bottom != a3.bottom)
  {
    self->_additionalSelectionInsets = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    [WeakRetained _itemStandardViewNeedsUpdate:self];
  }
}

- (void)setMenuRepresentation:(UIMenuElement *)menuRepresentation
{
  if (self->_menuRepresentation != menuRepresentation)
  {
    id v4 = (UIMenuElement *)[(UIMenuElement *)menuRepresentation copy];
    uint64_t v5 = self->_menuRepresentation;
    self->_menuRepresentation = v4;

    [(UIBarButtonItem *)self _sendNeedsToolbarUpdate];
  }
}

- (UIBarButtonItem)initWithTitle:(NSString *)title menu:(UIMenu *)menu
{
  return [(UIBarButtonItem *)self initWithTitle:title image:0 target:0 action:0 menu:menu];
}

- (void)setSelected:(BOOL)selected
{
  if ((((*(_DWORD *)&self->_barButtonItemFlags & 0x8000) == 0) ^ selected)) {
    return;
  }
  if (selected) {
    int v4 = 0x8000;
  }
  else {
    int v4 = 0;
  }
  self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFF7FFF | v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _itemDidChangeSelectionState:self];
LABEL_11:
    char v7 = v8;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIView *)self->_view setUseSelectedImage:(*(_DWORD *)&self->_barButtonItemFlags >> 15) & 1];
    goto LABEL_11;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = 0;
  if (isKindOfClass)
  {
    [(UIView *)self->_view setSelected:(*(_DWORD *)&self->_barButtonItemFlags >> 15) & 1];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_setSecondaryActionsProvider:(id)a3
{
  if (self->_secondaryActionsProvider != a3)
  {
    int v4 = (void *)[a3 copy];
    id secondaryActionsProvider = self->_secondaryActionsProvider;
    self->_id secondaryActionsProvider = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    [WeakRetained _itemStandardViewNeedsUpdate:self];
  }
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_imageInsets.left
    || a3.top != self->_imageInsets.top
    || a3.right != self->_imageInsets.right
    || a3.bottom != self->_imageInsets.bottom)
  {
    self->_imageInsets = a3;
    [(UIBarButtonItem *)self _updateView];
  }
}

- (void)setSecondaryActionsArePrimary:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIBarButtonItem *)self _menuIsPrimary] != a3)
  {
    if (v3) {
      int v5 = 0x20000;
    }
    else {
      int v5 = 0x10000;
    }
    self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFCFFFF | v5);
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    [WeakRetained _itemStandardViewNeedsUpdate:self];
  }
}

+ (UIBarButtonItem)flexibleSpaceItem
{
  double v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBarButtonSystemItem:5 primaryAction:0];
  return (UIBarButtonItem *)v2;
}

- (UIBarButtonItem)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
  uint64_t v12 = image;
  uint64_t v13 = landscapeImagePhone;
  id v14 = target;
  uint64_t v15 = [(UIBarButtonItem *)self init];
  uint64_t v16 = v15;
  if (v15)
  {
    [(UIBarButtonItem *)v15 setImage:v12];
    [(UIBarButtonItem *)v16 setLandscapeImagePhone:v13];
    [(UIBarButtonItem *)v16 setStyle:style];
    [(UIBarButtonItem *)v16 setTarget:v14];
    [(UIBarButtonItem *)v16 setAction:action];
  }

  return v16;
}

- (UIBarButtonItem)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem menu:(UIMenu *)menu
{
  return [(UIBarButtonItem *)self initWithBarButtonSystemItem:systemItem primaryAction:0 menu:menu];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIBarButtonItem;
  [(UIBarItem *)&v20 encodeWithCoder:v4];
  int v5 = [(UIBarButtonItem *)self customView];

  if (v5)
  {
    BOOL v6 = [(UIBarButtonItem *)self customView];
    [v4 encodeObject:v6 forKey:@"UICustomView"];
  }
  $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = self->_barButtonItemFlags;
  if (*(unsigned char *)&barButtonItemFlags)
  {
    [v4 encodeBool:1 forKey:@"UIEnabled"];
    $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = self->_barButtonItemFlags;
  }
  if ((*(unsigned char *)&barButtonItemFlags & 0x10) != 0)
  {
    [v4 encodeBool:1 forKey:@"UIIsSystemItem"];
    [v4 encodeInteger:((unint64_t)self->_barButtonItemFlags >> 5) & 0x7F forKey:@"UISystemItem"];
    $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = self->_barButtonItemFlags;
  }
  uint64_t v8 = (*(unsigned int *)&barButtonItemFlags >> 1) & 7;
  if (v8) {
    [v4 encodeInteger:v8 forKey:@"UIStyle"];
  }
  if (self->_hidden) {
    [v4 encodeBool:1 forKey:@"UIItemHidden"];
  }
  if ([(UIBarItem *)self tag]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIBarItem tag](self, "tag"), @"UITag");
  }
  action = self->_action;
  if (action)
  {
    uint64_t v10 = NSStringFromSelector(action);
    [v4 encodeObject:v10 forKey:@"UIAction"];
  }
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained forKey:@"UITarget"];
  }
  title = self->_title;
  if (title) {
    [v4 encodeObject:title forKey:@"UITitle"];
  }
  double width = self->_width;
  if (width != 0.0)
  {
    *(float *)&double width = width;
    [v4 encodeFloat:@"UIWidth" forKey:width];
  }
  image = self->_image;
  if (image) {
    [v4 encodeObject:image forKey:@"UIImage"];
  }
  if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_imageInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_imageInsets.bottom))))))
  {
    [(UIBarButtonItem *)self imageInsets];
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"UIImageInsets");
  }
  landscapeImagePhone = self->_landscapeImagePhone;
  if (landscapeImagePhone) {
    [v4 encodeObject:landscapeImagePhone forKey:@"UILandscapeImagePhone"];
  }
  if (self->_landscapeImagePhoneInsets.top != 0.0
    || self->_landscapeImagePhoneInsets.bottom != 0.0
    || self->_landscapeImagePhoneInsets.left != 0.0
    || self->_landscapeImagePhoneInsets.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"UILandscapeImagePhoneInsets");
  }
  uint64_t v16 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage tintColor];

  if (v16)
  {
    float v17 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage tintColor];
    [v4 encodeObject:v17 forKey:@"UITintColor"];
  }
  if ([(UIBarButtonItem *)self isSpringLoaded]) {
    [v4 encodeBool:1 forKey:@"UISpringLoaded"];
  }
  menu = self->_menu;
  if (menu) {
    [v4 encodeObject:menu forKey:@"UIBarButtonMenu"];
  }
  if ((*((unsigned char *)&self->_barButtonItemFlags + 2) & 0x80) != 0) {
    [v4 encodeBool:1 forKey:@"UIBarButtonSelectionAsPrimary"];
  }
  menuRepresentation = self->_menuRepresentation;
  if (menuRepresentation) {
    [v4 encodeObject:menuRepresentation forKey:@"UIMenuRepresentation"];
  }
}

- (void)setLandscapeImagePhone:(id)a3
{
  int v5 = (UIImage *)a3;
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0 && self->_landscapeImagePhone != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_landscapeImagePhone, a3);
    [(UIBarButtonItem *)self _updateView];
    int v5 = v6;
  }
}

- (void)setLandscapeImagePhoneInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_landscapeImagePhoneInsets.left
    || a3.top != self->_landscapeImagePhoneInsets.top
    || a3.right != self->_landscapeImagePhoneInsets.right
    || a3.bottom != self->_landscapeImagePhoneInsets.bottom)
  {
    self->_landscapeImagePhoneInsets = a3;
    [(UIBarButtonItem *)self _updateView];
  }
}

- (UIEdgeInsets)landscapeImagePhoneInsets
{
  double top = self->_landscapeImagePhoneInsets.top;
  double left = self->_landscapeImagePhoneInsets.left;
  double bottom = self->_landscapeImagePhoneInsets.bottom;
  double right = self->_landscapeImagePhoneInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLargeContentSizeImage:(id)a3
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIBarButtonItem;
    [(UIBarItem *)&v3 setLargeContentSizeImage:a3];
  }
}

- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)a3
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIBarButtonItem;
    -[UIBarItem setLargeContentSizeImageInsets:](&v3, sel_setLargeContentSizeImageInsets_, a3.top, a3.left, a3.bottom, a3.right);
  }
}

- (BOOL)_hasAction
{
  return self->_primaryAction || self->_action != 0;
}

- (void)_triggerAction:(id)a3
{
}

- (void)_triggerActionForEvent:(id)a3
{
}

- (void)_triggerActionForEvent:(id)a3 fallbackSender:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  primaryAction = self->_primaryAction;
  if (primaryAction)
  {
    [(UIAction *)primaryAction performWithSender:self target:0];
  }
  else
  {
    p_action = &self->_action;
    if (self->_action)
    {
      id WeakRetained = objc_loadWeakRetained(&self->_target);
      if (!WeakRetained)
      {
        uint64_t v10 = [(UIBarButtonItem *)self window];

        if (v6)
        {
          if (!v10)
          {
            if (*p_action) {
              SEL v11 = *p_action;
            }
            else {
              SEL v11 = 0;
            }
            id WeakRetained = [(id)UIApp _unswizzledTargetInChainForAction:v11 sender:v6];
          }
        }
      }
      if (*p_action) {
        SEL v12 = *p_action;
      }
      else {
        SEL v12 = 0;
      }
      [(id)UIApp sendAction:v12 to:WeakRetained from:self forEvent:v13];
    }
  }
}

- (void)_executeValidationHandler
{
  autoValidationHandler = (void (**)(id, UIBarButtonItem *))self->__autoValidationHandler;
  if (autoValidationHandler) {
    autoValidationHandler[2](autoValidationHandler, self);
  }
}

- (void)_getMenuTitle:(id *)a3 image:(id *)a4
{
  id v13 = [(UIBarButtonItem *)self resolvedTitle];
  if ([v13 length]) {
    char v7 = (__CFString *)v13;
  }
  else {
    char v7 = &stru_1ED0E84C0;
  }
  id v8 = *a3;
  *a3 = v7;

  uint64_t v9 = [(UIBarButtonItem *)self _imageForState:0 compact:0 type:1];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  id v12 = *a4;
  *a4 = v10;
}

- (UIMenuElement)_effectiveMenuRepresentation
{
  v14[1] = *MEMORY[0x1E4F143B8];
  menuRepresentation = self->_menuRepresentation;
  if (menuRepresentation)
  {
    objc_super v3 = menuRepresentation;
    goto LABEL_15;
  }
  if ([(UIBarButtonItem *)self isCustomViewItem]
    || [(UIBarButtonItem *)self isSpaceItem])
  {
    objc_super v3 = 0;
    goto LABEL_15;
  }
  id v12 = 0;
  id v13 = 0;
  [(UIBarButtonItem *)self _getMenuTitle:&v13 image:&v12];
  if (self->_menu)
  {
    if ([(UIBarButtonItem *)self isEnabled])
    {
      int v5 = [(UIMenu *)self->_menu children];
      if (![(UIBarButtonItem *)self _menuIsPrimary])
      {
        id v6 = _proxyAction(self, (uint64_t)v13, (uint64_t)v12);
        v14[0] = v6;
        char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        uint64_t v8 = [v7 arrayByAddingObjectsFromArray:v5];

        int v5 = (void *)v8;
      }
      objc_super v3 = +[UIMenu menuWithTitle:v13 image:v12 identifier:0 options:0 children:v5];

      goto LABEL_14;
    }
    _proxyAction(self, (uint64_t)v13, (uint64_t)v12);
    uint64_t v10 = (UIMenuElement *)objc_claimAutoreleasedReturnValue();
    objc_super v3 = v10;
    uint64_t v9 = 1;
  }
  else
  {
    _proxyAction(self, (uint64_t)v13, (uint64_t)v12);
    objc_super v3 = (UIMenuElement *)objc_claimAutoreleasedReturnValue();
    [(UIMenuElement *)v3 setState:[(UIBarButtonItem *)self isSelected]];
    uint64_t v9 = [(UIBarButtonItem *)self isEnabled] ^ 1;
    uint64_t v10 = v3;
  }
  [(UIMenuElement *)v10 setAttributes:v9];
LABEL_14:

LABEL_15:
  return v3;
}

- (BOOL)_canProduceNSToolbarItem
{
  if (self->_hidden) {
    return 0;
  }
  else {
    return ![(UIBarButtonItem *)self isSpaceItem];
  }
}

- (id)_primaryNSToolbarItemForIdentifier:(id)a3
{
  if (![a3 length])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIBarButtonItem.m" lineNumber:936 description:@"Must provide an identifier"];
  }
  return 0;
}

- (id)_secondaryNSToolbarItemForIdentifier:(id)a3
{
  if (![a3 length])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIBarButtonItem.m" lineNumber:963 description:@"Must provide an identifier"];
  }
  return 0;
}

- (id)_NSToolbarSourceItem
{
  return 0;
}

- (UIBarButtonItemGroup)creatingFixedGroup
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = self;
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  objc_super v3 = +[UIBarButtonItemGroup fixedGroupWithRepresentativeItem:0 items:v2];

  return (UIBarButtonItemGroup *)v3;
}

- (UIBarButtonItemGroup)creatingMovableGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = self;
  objc_super v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = customizationIdentifier;
  int v5 = [v3 arrayWithObjects:&v8 count:1];
  id v6 = +[UIBarButtonItemGroup movableGroupWithCustomizationIdentifier:representativeItem:items:](UIBarButtonItemGroup, "movableGroupWithCustomizationIdentifier:representativeItem:items:", v4, 0, v5, v8, v9);

  return (UIBarButtonItemGroup *)v6;
}

- (UIBarButtonItemGroup)creatingOptionalGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier inDefaultCustomization:(BOOL)inDefaultCustomization
{
  BOOL v4 = inDefaultCustomization;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = self;
  int v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = customizationIdentifier;
  char v7 = [v5 arrayWithObjects:&v10 count:1];
  uint64_t v8 = +[UIBarButtonItemGroup optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:](UIBarButtonItemGroup, "optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:", v6, v4, 0, v7, v10, v11);

  return (UIBarButtonItemGroup *)v8;
}

- (id)_dci_creatingGroupWithCustomizationIdentifier:(id)a3
{
  return [(UIBarButtonItem *)self creatingOptionalGroupWithCustomizationIdentifier:a3 inDefaultCustomization:1];
}

- (id)_dci_creatingOptionalGroupWithCustomizationIdentifier:(id)a3
{
  return [(UIBarButtonItem *)self creatingOptionalGroupWithCustomizationIdentifier:a3 inDefaultCustomization:0];
}

- (UIBarButtonItem)_itemForPresenting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonGroup);
  BOOL v4 = [(UIBarButtonItem *)self view];
  int v5 = [v4 window];

  if (v5)
  {
LABEL_10:
    id v6 = self;
    goto LABEL_11;
  }
  if (self->_groupRepresentative || ![WeakRetained isDisplayingRepresentativeItem])
  {
    id v7 = objc_loadWeakRetained((id *)&self->__viewOwner);
    if (v7)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = [v7 _overflowFallbackItem];
        if (v8)
        {
          uint64_t v9 = (void *)v8;

          goto LABEL_12;
        }
      }
    }

    goto LABEL_10;
  }
  id v6 = [WeakRetained representativeItem];
LABEL_11:
  uint64_t v9 = v6;
LABEL_12:

  return (UIBarButtonItem *)v9;
}

- (UIView)_viewForPresenting
{
  double v2 = [(UIBarButtonItem *)self _itemForPresenting];
  objc_super v3 = (UIView *)v2[23];

  return v3;
}

- (CGRect)_rectForPresenting
{
  objc_super v3 = [(UIBarButtonItem *)self _itemForPresenting];
  BOOL v4 = [(UIBarButtonItem *)self _viewForPresenting];
  int v5 = [v3 view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v3 view];
    uint64_t v8 = [v7 visualProvider];
    uint64_t v9 = [v8 contentView];

    [v9 bounds];
    objc_msgSend(v9, "convertRect:toView:", v4);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    [v4 bounds];
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
    double v17 = v21;
  }

  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  double v25 = v17;
  result.size.height = v25;
  result.size.double width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (NSSet)_possibleItemVariations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0 || ![(NSSet *)self->_possibleTitles count])
  {
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSSet count](self->_possibleTitles, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = self->_possibleTitles;
    uint64_t v4 = [(NSSet *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v9 = [(NSDictionary *)self->_stylesForSizingTitles objectForKey:v8];
          double v10 = [UIBarButtonItem alloc];
          if (v9) {
            uint64_t v11 = [v9 integerValue];
          }
          else {
            uint64_t v11 = 0;
          }
          double v12 = [(UIBarButtonItem *)v10 initWithTitle:v8 style:v11 target:0 action:0];
          [v3 addObject:v12];
        }
        uint64_t v5 = [(NSSet *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
  }
  return (NSSet *)v3;
}

- (void)_setItemVariation:(id)a3
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0)
  {
    id v4 = a3;
    uint64_t v5 = [v4 title];
    [(UIBarButtonItem *)self setTitle:v5];

    uint64_t v6 = [v4 style];
    [(UIBarButtonItem *)self setStyle:v6];
  }
}

- (id)itemVariation
{
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    objc_super v3 = [UIBarButtonItem alloc];
    id v4 = [(UIBarButtonItem *)self title];
    uint64_t v5 = [(UIBarButtonItem *)v3 initWithTitle:v4 style:[(UIBarButtonItem *)self style] target:0 action:0];
  }
  return v5;
}

- (NSSet)possibleTitles
{
  return self->_possibleTitles;
}

void __29__UIBarButtonItem_setTarget___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_0)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a delegate. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_setSystemItem:(int64_t)a3
{
  unint64_t barButtonItemFlags = self->_barButtonItemFlags;
  if ((barButtonItemFlags & 0x10) == 0 || ((barButtonItemFlags >> 5) & 0x7F) != a3)
  {
    possibleSystemItems = self->_possibleSystemItems;
    __int16 v7 = [NSNumber numberWithInteger:a3];
    LOBYTE(possibleSystemItems) = [(NSSet *)possibleSystemItems containsObject:v7];

    if ((possibleSystemItems & 1) == 0) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"System item (%ld) is not listed in possible system items", a3);
    }
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    char CanBeSet = BarButtonItemSystemItemCanBeSet(v8);

    if ((CanBeSet & 1) == 0) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"System item (%ld) is not a supported system item", a3);
    }
    self->_unint64_t barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFFF00F | (32 * (a3 & 0x7F)) | 0x10);
    long long v24 = 0u;
    long long v25 = 0u;
    double v10 = [(UIView *)self->_view superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->__owningNavigationItem);
      id v12 = [WeakRetained _navigationBar];

      uint64_t v13 = [v12 barStyle];
      id v23 = 0;
      LOWORD(v20) = [v12 isMinibar];
      -[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:](self, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:", 0, 0, &v23, 0, 0, v13, v20);
      id v14 = v23;
      -[UIBarButtonItem _getNavBarEdgeSizeAdjust:imageInsets:landscape:](self, "_getNavBarEdgeSizeAdjust:imageInsets:landscape:", 0, &v24, [v12 isMinibar]);
      if ([v12 isMinibar])
      {
        if ((*(_DWORD *)&self->_barButtonItemFlags & 0xFE0) == 0x1A0) {
          *(double *)&long long v24 = *(double *)&v24 + 2.0;
        }
      }
      id v15 = [(UIBarButtonItem *)self view];
      objc_msgSend(v15, "setImageEdgeInsets:", v24, v25);
      [v15 setImage:v14 forStates:0];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:

        return;
      }
      id v12 = v10;
      uint64_t v16 = [v12 barStyle];
      id v21 = 0;
      id v22 = 0;
      LOWORD(v20) = [v12 isMinibar];
      -[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:](self, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:", 0, 0, &v22, &v21, 0, v16, v20);
      id v14 = v22;
      id v15 = v21;
      -[UIBarButtonItem _getToolbarSystemItemEdgeInsetsWithImageInsets:forBarStyle:landscape:alwaysBordered:](self, "_getToolbarSystemItemEdgeInsetsWithImageInsets:forBarStyle:landscape:alwaysBordered:", &v24, v16, [v12 isMinibar], 0);
      if (v14)
      {
        long long v17 = [(UIBarButtonItem *)self view];
        long long v18 = [v17 _info];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v18;
          [v19 setImage:v14 forState:0];
          if (v15) {
            [v19 setImage:v15 forState:1];
          }
        }
        else
        {
          [v18 setImage:v14];
        }
      }
    }

    goto LABEL_21;
  }
}

- (void)_setPossibleSystemItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = self->_barButtonItemFlags;
  uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1C3A8];
  if ((*(unsigned char *)&barButtonItemFlags & 0x10) == 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Button item is not a system item"];
    $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = self->_barButtonItemFlags;
  }
  __int16 v7 = [NSNumber numberWithInteger:(*(unsigned int *)&barButtonItemFlags >> 5) & 0x7F];
  char v8 = [v4 containsObject:v7];

  if ((v8 & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v6, @"Current system item (%ld) is not listed as a possible system item", ((unint64_t)self->_barButtonItemFlags >> 5) & 0x7F);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    uint64_t v13 = *v6;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((BarButtonItemSystemItemCanBeSet(v15) & 1) == 0) {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v13, @"System item (%ld) is unsupported as a settable system item", objc_msgSend(v15, "integerValue"));
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  if (![(NSSet *)self->_possibleSystemItems isEqualToSet:v9])
  {
    uint64_t v16 = (NSSet *)[v9 copy];
    possibleSystemItems = self->_possibleSystemItems;
    self->_possibleSystemItems = v16;

    [(UIBarButtonItem *)self _updateView];
  }
}

- (NSSet)_possibleSystemItems
{
  return self->_possibleSystemItems;
}

+ (id)_appearanceBlindViewClasses
{
  v6[6] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)_appearanceBlindViewClasses_classList;
  if (!_appearanceBlindViewClasses_classList)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    v6[2] = objc_opt_class();
    v6[3] = objc_opt_class();
    v6[4] = objc_opt_class();
    v6[5] = objc_opt_class();
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
    id v4 = (void *)_appearanceBlindViewClasses_classList;
    _appearanceBlindViewClasses_classList = v3;

    double v2 = (void *)_appearanceBlindViewClasses_classList;
  }
  return v2;
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = backgroundImage;
  if (style != 8 && [(UIBarButtonItem *)self style] != style)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"UIBarButtonItem.m" lineNumber:1458 description:@"attempt to set background image for style not matching the UIBarButtonItem's style"];
  }
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    if (!self->_appearanceStorage)
    {
      uint64_t v12 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      appearanceStorage = self->_appearanceStorage;
      self->_appearanceStorage = v12;
    }
    if (state > 8 || ((1 << state) & 0x107) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v27 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          UIControlState v29 = state;
          _os_log_fault_impl(&dword_1853B0000, v27, OS_LOG_TYPE_FAULT, "button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
      else
      {
        long long v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D2E0) + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          UIControlState v29 = state;
          _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
    }
    if ((state & 0xFFFFFFFFFFFFFFFDLL) != 0 && state != 8) {
      state = 1;
    }
    id v15 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v16 = [NSNumber numberWithInteger:state];
    long long v17 = [NSNumber numberWithInteger:barMetrics];
    long long v18 = objc_msgSend(v15, "arrayWithObjects:", v16, v17, 0);
    _UIAppearanceTagObjectForSelector(self, sel_setBackgroundImage_forState_barMetrics_, v18);

    long long v19 = (void *)MEMORY[0x1E4F1C978];
    long long v20 = [NSNumber numberWithInteger:state];
    long long v21 = [NSNumber numberWithInteger:style];
    id v22 = [NSNumber numberWithInteger:barMetrics];
    uint64_t v23 = objc_msgSend(v19, "arrayWithObjects:", v20, v21, v22, 0);
    _UIAppearanceTagObjectForSelector(self, a2, v23);

    uint64_t v24 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundImageForState:state style:style isMini:barMetrics == UIBarMetricsCompact];
    if ((unint64_t)v11 | v24 && ![(UIImage *)v11 isEqual:v24])
    {
      [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackgroundImage:v11 forState:state style:style isMini:barMetrics == UIBarMetricsCompact];
      [(UIBarButtonItem *)self _updateView];
    }
  }
  else if ((_MergedGlobals_11_4 & 1) == 0)
  {
    _MergedGlobals_11_4 = 1;
    NSLog(&cfstr_SCustomization.isa, "UIBarButtonItem", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
}

- (UIImage)backgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  return [(UIBarButtonItem *)self backgroundImageForState:state style:8 barMetrics:barMetrics];
}

- (void)setBackButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = backgroundImage;
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    if (!self->_appearanceStorage)
    {
      uint64_t v10 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      appearanceStorage = self->_appearanceStorage;
      self->_appearanceStorage = v10;
    }
    if (state > 8 || ((1 << state) & 0x107) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        long long v18 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          UIControlState v20 = state;
          _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "back button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
      else
      {
        long long v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D2F0) + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          UIControlState v20 = state;
          _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "back button background image only respected for UIControlStateNormal, UIControlStateHighlighted, UIControlStateDisabled and UIControlStateFocused. state = %lu is interpreted as UIControlStateHighlighted.", buf, 0xCu);
        }
      }
    }
    if ((state & 0xFFFFFFFFFFFFFFFDLL) != 0 && state != 8) {
      state = 1;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = [NSNumber numberWithInteger:state];
    id v15 = [NSNumber numberWithInteger:barMetrics];
    uint64_t v16 = objc_msgSend(v13, "arrayWithObjects:", v14, v15, 0);
    _UIAppearanceTagObjectForSelector(self, a2, v16);

    [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackButtonBackgroundImage:v9 forState:state isMini:barMetrics == UIBarMetricsCompact];
  }
  else if ((byte_1EB25D2DA & 1) == 0)
  {
    byte_1EB25D2DA = 1;
    NSLog(&cfstr_SCustomization.isa, "UIBarButtonItem", @"back button background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (void)setBackgroundVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  if (!self->_appearanceStorage)
  {
    char v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v11 = [NSNumber numberWithInteger:barMetrics];
  uint64_t v12 = [v10 arrayWithObject:v11];
  _UIAppearanceTagObjectForSelector(self, a2, v12);

  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundVerticalAdjustmentForBarMetrics:barMetrics];
  if (v13 != adjustment)
  {
    [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackgroundVerticalAdjustment:barMetrics forBarMetrics:adjustment];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIBarButtonItem *)self _applyPositionAdjustmentToSegmentedControl:self->_view];
    }
    [(UIBarButtonItem *)self _updateView];
  }
}

- (void)setTitlePositionAdjustment:(UIOffset)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    double vertical = adjustment.vertical;
    double horizontal = adjustment.horizontal;
    if (!self->_appearanceStorage)
    {
      id v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      appearanceStorage = self->_appearanceStorage;
      self->_appearanceStorage = v9;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = [NSNumber numberWithInteger:barMetrics];
    double v13 = [v11 arrayWithObject:v12];
    _UIAppearanceTagObjectForSelector(self, a2, v13);

    id v14 = self->_appearanceStorage;
    if (barMetrics == UIBarMetricsCompact) {
      [(_UIBarButtonItemAppearanceStorage *)v14 miniTitlePositionOffset];
    }
    else {
    id v15 = [(_UIBarButtonItemAppearanceStorage *)v14 titlePositionOffset];
    }
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 UIOffsetValue];
    }
    else
    {
      double v17 = 0.0;
      double v18 = 0.0;
    }
    if (horizontal != v17 || vertical != v18)
    {
      long long v19 = self->_appearanceStorage;
      if (barMetrics == UIBarMetricsCompact)
      {
        *(double *)id v22 = horizontal;
        *(double *)&v22[1] = vertical;
        UIControlState v20 = [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{UIOffset=dd}"];
        [(_UIBarButtonItemAppearanceStorage *)v19 setMiniTitlePositionOffset:v20];
      }
      else
      {
        *(double *)uint64_t v21 = horizontal;
        *(double *)&v21[1] = vertical;
        UIControlState v20 = [MEMORY[0x1E4F29238] valueWithBytes:v21 objCType:"{UIOffset=dd}"];
        [(_UIBarButtonItemAppearanceStorage *)v19 setTitlePositionOffset:v20];
      }

      [(UIBarButtonItem *)self _updateView];
    }
  }
  else if ((setTitlePositionAdjustment_forBarMetrics__didWarn & 1) == 0)
  {
    setTitlePositionAdjustment_forBarMetrics__didWarn = 1;
    NSLog(&cfstr_SCustomization.isa, a2, adjustment.horizontal, adjustment.vertical, "UIBarButtonItem", @"title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (void)setBackButtonBackgroundVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  if (!self->_appearanceStorage)
  {
    char v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v11 = [NSNumber numberWithInteger:barMetrics];
  uint64_t v12 = [v10 arrayWithObject:v11];
  _UIAppearanceTagObjectForSelector(self, a2, v12);

  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:barMetrics];
  if (v13 != adjustment)
  {
    id v14 = self->_appearanceStorage;
    [(_UIBarButtonItemAppearanceStorage *)v14 setBackButtonBackgroundVerticalAdjustment:barMetrics forBarMetrics:adjustment];
  }
}

- (CGFloat)backButtonBackgroundVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:barMetrics];
  return result;
}

- (void)setBackButtonTitlePositionAdjustment:(UIOffset)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    double vertical = adjustment.vertical;
    double horizontal = adjustment.horizontal;
    if (!self->_appearanceStorage)
    {
      id v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      appearanceStorage = self->_appearanceStorage;
      self->_appearanceStorage = v9;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = [NSNumber numberWithInteger:barMetrics];
    double v13 = [v11 arrayWithObject:v12];
    _UIAppearanceTagObjectForSelector(self, a2, v13);

    id v14 = self->_appearanceStorage;
    if (barMetrics == UIBarMetricsCompact) {
      [(_UIBarButtonItemAppearanceStorage *)v14 miniTitlePositionOffset];
    }
    else {
    id v15 = [(_UIBarButtonItemAppearanceStorage *)v14 titlePositionOffset];
    }
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 UIOffsetValue];
    }
    else
    {
      double v17 = 0.0;
      double v18 = 0.0;
    }
    if (horizontal != v17 || vertical != v18)
    {
      long long v19 = self->_appearanceStorage;
      if (barMetrics == UIBarMetricsCompact)
      {
        *(double *)id v22 = horizontal;
        *(double *)&v22[1] = vertical;
        UIControlState v20 = [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{UIOffset=dd}"];
        [(_UIBarButtonItemAppearanceStorage *)v19 setMiniBackButtonTitlePositionOffset:v20];
      }
      else
      {
        *(double *)uint64_t v21 = horizontal;
        *(double *)&v21[1] = vertical;
        UIControlState v20 = [MEMORY[0x1E4F29238] valueWithBytes:v21 objCType:"{UIOffset=dd}"];
        [(_UIBarButtonItemAppearanceStorage *)v19 setBackButtonTitlePositionOffset:v20];
      }
    }
  }
  else if ((setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn & 1) == 0)
  {
    setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn = 1;
    NSLog(&cfstr_SCustomization.isa, a2, adjustment.horizontal, adjustment.vertical, "UIBarButtonItem", @"back button title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (UIOffset)backButtonTitlePositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (barMetrics == UIBarMetricsCompact) {
      [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniBackButtonTitlePositionOffset];
    }
    else {
    uint64_t v6 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backButtonTitlePositionOffset];
    }
    __int16 v7 = v6;
    if (v6)
    {
      [v6 UIOffsetValue];
      double v3 = v8;
      double v4 = v9;
    }
    else
    {
      double v3 = 0.0;
      double v4 = 0.0;
    }
  }
  else
  {
    double v3 = 0.0;
    if ((backButtonTitlePositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      backButtonTitlePositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, "UIBarButtonItem", @"back button title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    double v4 = 0.0;
  }
  double v10 = v3;
  double v11 = v4;
  result.double vertical = v11;
  result.double horizontal = v10;
  return result;
}

- (void)_applyPositionAdjustmentToSegmentedControl:(id)a3
{
  appearanceStorage = self->_appearanceStorage;
  id v5 = a3;
  [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backgroundVerticalAdjustmentForBarMetrics:0];
  objc_msgSend(v5, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 0);
  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundVerticalAdjustmentForBarMetrics:1];
  objc_msgSend(v5, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 1);
  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundVerticalAdjustmentForBarMetrics:101];
  objc_msgSend(v5, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 101);
  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundVerticalAdjustmentForBarMetrics:102];
  objc_msgSend(v5, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 102);
}

- (double)_toolbarCharge
{
  return -0.15;
}

- (UIToolbarButton)_toolbarButton
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    view = self->_view;
  }
  else {
    view = 0;
  }
  return (UIToolbarButton *)view;
}

- (void)_setImageHasEffects:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFFFBFFFF | v3);
}

- (BOOL)_imageHasEffects
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 2) & 1;
}

- (void)_setEnclosingBar:(id)a3 onItem:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [v5 _setEnclosingBar:v6];
  }
}

- (id)createViewForToolbar:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 barStyle];
  if (v5 == 1 && ([v4 isTranslucent] & 1) != 0) {
    uint64_t v61 = 2;
  }
  else {
    uint64_t v61 = v5;
  }
  if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0)
  {
    uint64_t v72 = 0;
    long long v70 = 0u;
    long long v71 = 0u;
    id v68 = 0;
    uint64_t v69 = 0;
    id v66 = 0;
    id v67 = 0;
    LOWORD(v57) = [v4 isMinibar];
    -[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:](self, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:", &v69, &v68, &v67, &v66, &v72, v5, v57);
    id v7 = v68;
    id v8 = v67;
    id v9 = v66;
    -[UIBarButtonItem _getToolbarSystemItemEdgeInsetsWithImageInsets:forBarStyle:landscape:alwaysBordered:](self, "_getToolbarSystemItemEdgeInsetsWithImageInsets:forBarStyle:landscape:alwaysBordered:", &v70, v5, [v4 isMinibar], 0);
    if (v8)
    {
      id v10 = objc_alloc((Class)[(id)objc_opt_class() classForToolbarButton]);
      uint64_t v11 = v69;
      possibleSystemItems = self->_possibleSystemItems;
      double v13 = [v4 tintColor];
      LOBYTE(v59) = [v4 isMinibar];
      LOBYTE(v58) = 0;
      id v6 = (UIToolbarTextButton *)objc_msgSend(v10, "initWithImage:pressedImage:label:labelHeight:withBarStyle:withStyle:withInsets:possibleTitles:possibleSystemItems:withToolbarTintColor:bezel:imageInsets:glowInsets:landscape:", v8, v9, v7, v61, v11, 0, 0.0, 0.0, 0.0, 0.0, 0.0, possibleSystemItems, v13, v58, v70, v71,
                                    0,
                                    0,
                                    0,
                                    0,
                                    v59);

      [(UIToolbarButton *)v6 _setCreatedByBarButtonItem:1];
    }
    else if (v7)
    {
      id v14 = [UIToolbarTextButton alloc];
      uint64_t v15 = v69;
      uint64_t v16 = [v4 tintColor];
      id v6 = [(UIToolbarTextButton *)v14 initWithTitle:v7 pressedTitle:0 withFont:0 withBarStyle:v61 withStyle:v15 withTitleWidth:0 possibleTitles:0.0 withToolbarTintColor:v16];

      [(UIToolbarButton *)v6 _setCreatedByBarButtonItem:1];
      double v17 = [(UIToolbarButton *)v6 _info];
      [v17 _setStylesForSizingTitles:self->_stylesForSizingTitles];
    }
    else
    {
      id v6 = 0;
    }
    if (![(UIBarButtonItem *)self action] && v72) {
      -[UIBarButtonItem setAction:](self, "setAction:");
    }
  }
  else
  {
    id v6 = 0;
  }
  double v18 = [v4 delegate];
  if (!v6)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v19 = [v18 toolbar:v4 viewForItem:self];
      if (v19)
      {
        id v6 = (UIToolbarTextButton *)v19;
        *(_DWORD *)&self->_barButtonItemFlags |= 0x1000u;
        goto LABEL_33;
      }
    }
    UIControlState v20 = [(UIBarButtonItem *)self image];

    if (v20)
    {
      if ([v4 isMinibar])
      {
        landscapeImagePhone = self->_landscapeImagePhone;
        if (landscapeImagePhone)
        {
          id v22 = landscapeImagePhone;
        }
        else
        {
          uint64_t v30 = [(UIBarButtonItem *)self image];
          id v22 = [v30 _imageScaledToProportion:3 interpolationQuality:0.75];
        }
        if (self->_landscapeImagePhone)
        {
          int v31 = &OBJC_IVAR___UIBarButtonItem__landscapeImagePhoneInsets;
LABEL_32:
          uint64_t v32 = (char *)self + *v31;
          uint64_t v33 = *((void *)v32 + 3);
          long long v60 = *(_OWORD *)(v32 + 8);
          uint64_t v34 = *(void *)v32;
          objc_super v35 = [UIToolbarButton alloc];
          long long v36 = [(UIBarButtonItem *)self title];
          UIBarButtonItemStyle v37 = [(UIBarButtonItem *)self style];
          long long v38 = [(UIBarButtonItem *)self possibleTitles];
          long long v39 = [v4 tintColor];
          char v40 = ![(UIBarButtonItem *)self _imageHasEffects];
          LOBYTE(v59) = [v4 isMinibar];
          LOBYTE(v58) = v40;
          id v6 = -[UIToolbarButton initWithImage:pressedImage:label:labelHeight:withBarStyle:withStyle:withInsets:possibleTitles:possibleSystemItems:withToolbarTintColor:bezel:imageInsets:glowInsets:landscape:](v35, "initWithImage:pressedImage:label:labelHeight:withBarStyle:withStyle:withInsets:possibleTitles:possibleSystemItems:withToolbarTintColor:bezel:imageInsets:glowInsets:landscape:", v22, 0, v36, v61, v37, v38, 0.0, 0.0, 0.0, 0.0, 0.0, 0, v39, v58, v34, v60,
                 v33,
                 0,
                 0,
                 0,
                 0,
                 v59);

          [(UIToolbarButton *)v6 _setCreatedByBarButtonItem:1];
          goto LABEL_33;
        }
      }
      else
      {
        id v22 = [(UIBarButtonItem *)self image];
      }
      int v31 = &OBJC_IVAR___UIBarButtonItem__imageInsets;
      goto LABEL_32;
    }
    uint64_t v23 = [UIToolbarTextButton alloc];
    uint64_t v24 = [(UIBarButtonItem *)self title];
    UIBarButtonItemStyle v25 = [(UIBarButtonItem *)self style];
    uint64_t v26 = [(UIBarButtonItem *)self possibleTitles];
    v27 = [v4 tintColor];
    id v6 = [(UIToolbarTextButton *)v23 initWithTitle:v24 pressedTitle:0 withFont:0 withBarStyle:v61 withStyle:v25 withTitleWidth:v26 possibleTitles:0.0 withToolbarTintColor:v27];

    [(UIToolbarButton *)v6 _setCreatedByBarButtonItem:1];
    uint64_t v28 = [(UIBarButtonItem *)self title];

    if (v28)
    {
      UIControlState v29 = [(UIToolbarButton *)v6 _info];
      [v29 _setStylesForSizingTitles:self->_stylesForSizingTitles];
    }
  }
LABEL_33:
  if ((*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x10) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIBarButtonItem *)self _applyPositionAdjustmentToSegmentedControl:v6];
    }
  }
  else
  {
    [(UIToolbarButton *)v6 _setAppearanceGuideClass:objc_opt_class()];
    double width = self->_width;
    if (width != 0.0)
    {
      *(float *)&double width = width;
      [(UIToolbarButton *)v6 _setInfoWidth:width];
    }
    [v4 bounds];
    *(float *)&double v43 = v42;
    [(UIToolbarButton *)v6 _setBarHeight:v43];
    if ((*(unsigned char *)&self->_barButtonItemFlags & 0x10) == 0)
    {
      appearanceStorage = self->_appearanceStorage;
      long long v45 = objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
      [(UIToolbarButton *)v6 _applyBarButtonAppearanceStorage:appearanceStorage withTaggedSelectors:v45];
    }
    UIBarButtonItemStyle v46 = [(UIToolbarButton *)v6 _info];
    [(UIBarButtonItem *)self _setEnclosingBar:v4 onItem:v46];
  }
  if (self->_width <= 0.0)
  {
    double minimumWidth = self->_minimumWidth;
    double maximumWidth = minimumWidth;
    if (minimumWidth > 0.0 || (double maximumWidth = self->_maximumWidth, maximumWidth > 0.0))
    {
      BOOL v49 = minimumWidth > 0.0;
      *(float *)&double minimumWidth = maximumWidth;
      [(UIToolbarButton *)v6 _setInfoExtremityWidth:v49 isMin:minimumWidth];
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(UIControl *)v6 addTarget:self action:sel__sendAction_withEvent_ forEvents:0x2000];
  }
  if (objc_opt_respondsToSelector()) {
    [(UIToolbarButton *)v6 setEnabled:[(UIBarButtonItem *)self isEnabled]];
  }
  if (self->_flexible && (*(_DWORD *)&self->_barButtonItemFlags & 0x100E) == 2) {
    [(UIToolbarButton *)v6 _setInfoFlexibleWidth:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIToolbarButton *)v6 setUseSelectedImage:(*(_DWORD *)&self->_barButtonItemFlags >> 15) & 1];
  }
  gestureRecognizers = self->_gestureRecognizers;
  if (gestureRecognizers)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v51 = gestureRecognizers;
    uint64_t v52 = [(NSArray *)v51 countByEnumeratingWithState:&v62 objects:v73 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v63 != v54) {
            objc_enumerationMutation(v51);
          }
          [(UIView *)v6 addGestureRecognizer:*(void *)(*((void *)&v62 + 1) + 8 * i)];
        }
        uint64_t v53 = [(NSArray *)v51 countByEnumeratingWithState:&v62 objects:v73 count:16];
      }
      while (v53);
    }
  }
  return v6;
}

- (void)_setInteractions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_interactions;
  id v6 = (NSArray *)v4;
  uint64_t v12 = v6;
  if (v5 == v6)
  {

    id WeakRetained = v12;
LABEL_9:

    id v8 = v12;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    id v8 = v12;
    goto LABEL_8;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  id v8 = v12;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    id v10 = (NSArray *)[(NSArray *)v8 copy];
    interactions = self->_interactions;
    self->_interactions = v10;

    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    [WeakRetained _itemStandardViewNeedsUpdate:self];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  if (self->_preferredMenuElementOrder != preferredMenuElementOrder)
  {
    self->_preferredMenuElementOrder = preferredMenuElementOrder;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    if (objc_opt_respondsToSelector())
    {
      id v4 = [(UIBarButtonItem *)self menu];
      [WeakRetained _itemDidUpdateMenu:self fromMenu:v4];
    }
  }
}

- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4
{
  id v5 = a4;
  id v6 = [v5 title];
  [(UIBarButtonItem *)self setTitle:v6];

  id v7 = [v5 image];

  [(UIBarButtonItem *)self setImage:v7];
}

- (void)setChangesSelectionAsPrimaryAction:(BOOL)changesSelectionAsPrimaryAction
{
  $3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = self->_barButtonItemFlags;
  if (((((*(_DWORD *)&barButtonItemFlags & 0x800000) == 0) ^ changesSelectionAsPrimaryAction) & 1) == 0)
  {
    if (changesSelectionAsPrimaryAction) {
      int v4 = 0x800000;
    }
    else {
      int v4 = 0;
    }
    self->_$3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&barButtonItemFlags & 0xFF7FFFFF | v4);
    [(UIBarButtonItem *)self _updateForAutomaticSelection];
  }
}

- (BOOL)changesSelectionAsPrimaryAction
{
  return *((unsigned __int8 *)&self->_barButtonItemFlags + 2) >> 7;
}

- (id)window
{
  return [(UIView *)self->_view window];
}

- (id)nextResponder
{
  return [(UIView *)self->_view nextResponder];
}

- (BOOL)isMinibarView
{
  return (*((unsigned __int8 *)&self->_barButtonItemFlags + 1) >> 5) & 1;
}

- (void)_sendAction:(id)a3 withEvent:(id)a4
{
  id v8 = a4;
  if ([(UIBarButtonItem *)self action])
  {
    id v5 = (void *)UIApp;
    id v6 = [(UIBarButtonItem *)self action];
    id v7 = [(UIBarButtonItem *)self target];
    [v5 sendAction:v6 to:v7 from:self forEvent:v8];
  }
}

- (BOOL)hasTitle
{
  double v2 = [(UIBarButtonItem *)self resolvedTitle];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_resolvedImage
{
  return [(UIBarButtonItem *)self _imageForState:0 compact:0 type:0];
}

- (BOOL)_resizesBackgroundImage
{
  return (*(unsigned char *)&self->_barButtonItemFlags & 0x10) != 0 && [(UIBarButtonItem *)self systemItem] != 24;
}

- (void)_deferSymbolEffectOperation:(int64_t)a3 effect:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v15 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = [NSNumber numberWithInteger:a3];
  double v13 = [v11 dictionaryWithObject:v12 forKey:@"operation"];

  if (v15) {
    [v13 setObject:v15 forKeyedSubscript:@"symbolEffect"];
  }
  if (v10) {
    [v13 setObject:v10 forKeyedSubscript:@"options"];
  }
  if (v6) {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"animated"];
  }
  id v14 = [(UIBarButtonItem *)self _deferredEffectsCreateIfNecessary:1];
  [v14 addObject:v13];
}

- (void)setSymbolAnimationEnabled:(BOOL)symbolAnimationEnabled
{
  if (symbolAnimationEnabled) {
    int v4 = 0x1000000;
  }
  else {
    int v4 = 0;
  }
  self->_$3665B5265F98EA8C853F20A3FDC87915 barButtonItemFlags = ($3665B5265F98EA8C853F20A3FDC87915)(*(_DWORD *)&self->_barButtonItemFlags & 0xFEFFFFFF | v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
  [WeakRetained _itemStandardViewNeedsUpdate:self];
}

- (BOOL)_isFloatable
{
  return 0;
}

- (BOOL)_isFloating
{
  return 0;
}

- (UIView)_configuredFloatableView
{
  return 0;
}

- (UIView)_referenceView
{
  return 0;
}

- (NSString)_largeContentSizeTitle
{
  return (NSString *)objc_getAssociatedObject(self, &_largeContentSizeTitleKey);
}

- (NSString)_resolvedLargeContentSizeTitle
{
  BOOL v3 = [(UIBarButtonItem *)self _largeContentSizeTitle];
  if (![v3 length])
  {
    uint64_t v4 = [(UIBarButtonItem *)self resolvedTitle];

    BOOL v3 = (void *)v4;
  }
  id v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  BOOL v6 = [v3 stringByTrimmingCharactersInSet:v5];
  uint64_t v7 = [v6 length];

  if (!v7)
  {

    BOOL v3 = 0;
  }
  return (NSString *)v3;
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect
{
  uint64_t v4 = (void *)MEMORY[0x1E4F41A50];
  id v5 = symbolEffect;
  id v6 = [v4 options];
  [(UIBarButtonItem *)self addSymbolEffect:v5 options:v6];
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options
{
}

- (void)addSymbolEffect:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  BOOL v5 = animated;
  uint64_t v16 = symbolEffect;
  id v9 = options;
  if ((*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x10) == 0)
  {
    if (![(NSSymbolEffect *)v16 ui_isSupportedByBarButtonItem])
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UIBarButtonItem.m" lineNumber:2409 description:@"Unsupported symbol effect added to UIBarButtonItem."];
    }
    if (v16)
    {
      id WeakRetained = self;
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [(UIBarButtonItem *)self image];
        if (v12)
        {
          double v13 = (void *)v12;
          id v14 = [(UIBarButtonItem *)self image];
          int v15 = [v14 isSymbolImage];

          if (!v15) {
            goto LABEL_12;
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
          if ((objc_opt_respondsToSelector() & 1) == 0
            || [WeakRetained _item:self addSymbolEffect:v16 options:v9 animated:v5])
          {
            [(UIBarButtonItem *)self _deferSymbolEffectOperation:0 effect:v16 options:v9 animated:v5];
          }
        }
      }
    }
  }
LABEL_12:
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect
{
  uint64_t v4 = (void *)MEMORY[0x1E4F41A50];
  BOOL v5 = symbolEffect;
  id v6 = [v4 options];
  [(UIBarButtonItem *)self removeSymbolEffectOfType:v5 options:v6];
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options
{
}

- (void)removeSymbolEffectOfType:(NSSymbolEffect *)symbolEffect options:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  BOOL v5 = animated;
  id v14 = symbolEffect;
  id v9 = options;
  if ((*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x10) == 0)
  {
    if (![(NSSymbolEffect *)v14 ui_isSupportedByBarButtonItem])
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UIBarButtonItem.m" lineNumber:2445 description:@"Unsupported symbol effect removed from UIBarButtonItem."];
    }
    if (v14)
    {
      uint64_t v11 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || [WeakRetained _item:self removeSymbolEffectOfType:v14 options:v9 animated:v5])
        {
          [(UIBarButtonItem *)self _deferSymbolEffectOperation:1 effect:v14 options:v9 animated:v5];
        }
      }
    }
  }
}

- (void)removeAllSymbolEffects
{
  id v3 = [MEMORY[0x1E4F41A50] options];
  [(UIBarButtonItem *)self removeAllSymbolEffectsWithOptions:v3];
}

- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options
{
}

- (void)removeAllSymbolEffectsWithOptions:(NSSymbolEffectOptions *)options animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v6 = options;
  if ((*((unsigned char *)&self->_barButtonItemFlags + 1) & 0x10) == 0)
  {
    id v8 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [WeakRetained _item:self removeAllSymbolEffectsWithOptions:v8 animated:v4])
    {
      [(UIBarButtonItem *)self _deferSymbolEffectOperation:2 effect:0 options:v8 animated:v4];
    }

    id v6 = v8;
  }
}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition
{
  id v6 = (void *)MEMORY[0x1E4F41A50];
  uint64_t v7 = transition;
  id v8 = symbolImage;
  id v9 = [v6 options];
  [(UIBarButtonItem *)self setSymbolImage:v8 withContentTransition:v7 options:v9];
}

- (void)setSymbolImage:(UIImage *)symbolImage withContentTransition:(NSSymbolContentTransition *)transition options:(NSSymbolEffectOptions *)options
{
  uint64_t v23 = symbolImage;
  id v10 = transition;
  uint64_t v11 = options;
  if ((*(_WORD *)&self->_barButtonItemFlags & 0x1010) == 0)
  {
    if (![(NSSymbolContentTransition *)v10 ui_isSupportedByBarButtonItem])
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"UIBarButtonItem.m" lineNumber:2501 description:@"Unsupported symbol content transition added to UIBarButtonItem."];
    }
    if (v10)
    {
      double v13 = self;
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [(UIBarButtonItem *)self image];
        if (v14)
        {
          int v15 = (void *)v14;
          uint64_t v16 = [(UIBarButtonItem *)self image];
          int v17 = [v16 isSymbolImage];
          if (v23 && v17 && [(UIImage *)v23 isSymbolImage])
          {
            double v18 = [(UIBarButtonItem *)self image];
            uint64_t v19 = v23;
            UIControlState v20 = v19;
            if (v18 != v19)
            {
              if (!v18)
              {

LABEL_22:
                id WeakRetained = objc_loadWeakRetained((id *)&self->__viewOwner);
                if (objc_opt_respondsToSelector())
                {
                  objc_storeStrong((id *)&self->_image, symbolImage);
                  [WeakRetained _item:self applyContentTransition:v10 options:v11];
                }
                else
                {
                  [(UIBarButtonItem *)self setImage:v20];
                }

                goto LABEL_18;
              }
              BOOL v21 = [(UIImage *)v18 isEqual:v19];

              if (!v21) {
                goto LABEL_22;
              }
              goto LABEL_17;
            }
          }
        }
      }
    }
LABEL_17:
    [(UIBarButtonItem *)self setImage:v23];
  }
LABEL_18:
}

+ (void)_getSystemItemStyle:(int64_t *)a3 title:(id *)a4 image:(id *)a5 selectedImage:(id *)a6 action:(SEL *)a7 forBarStyle:(int64_t)a8 landscape:(BOOL)a9 alwaysBordered:(BOOL)a10 usingSystemItem:(int64_t)a11 usingItemStyle:(int64_t)a12
{
}

- (void)_getSystemItemStyle:(int64_t *)a3 title:(id *)a4 image:(id *)a5 selectedImage:(id *)a6 action:(SEL *)a7 forBarStyle:(int64_t)a8 landscape:(BOOL)a9 alwaysBordered:(BOOL)a10
{
  if (a10) {
    UIBarButtonItemStyle v17 = UIBarButtonItemStyleBordered;
  }
  else {
    UIBarButtonItemStyle v17 = [(UIBarButtonItem *)self style];
  }
  BarButtonItemGetSystemItemStyle_KitAsset(a3, a4, a5, a6, (char **)a7, a8, a9, 0, ((unint64_t)self->_barButtonItemFlags >> 5) & 0x7F, v17);
}

- (void)_getNavBarEdgeSizeAdjust:(CGSize *)a3 imageInsets:(UIEdgeInsets *)a4 landscape:(BOOL)a5
{
  if (a3) {
    *a3 = *(CGSize *)MEMORY[0x1E4F1DB30];
  }
  if (a4)
  {
    if (a5) {
      [(UIBarButtonItem *)self landscapeImagePhoneInsets];
    }
    else {
      [(UIBarButtonItem *)self imageInsets];
    }
    a4->double top = v6;
    a4->double left = v7;
    a4->double bottom = v8;
    a4->double right = v9;
  }
}

- (BOOL)_isImageBarButtonItem
{
  if (!self->_view) {
    return 0;
  }
  if ([(UIBarButtonItem *)self isCustomViewItem]) {
    return 1;
  }
  BOOL v4 = [(UIView *)self->_view imageForState:0];
  BOOL v3 = v4 != 0;

  return v3;
}

- (double)_leftImagePaddingForEdgeMarginInNavBar
{
  double v3 = 0.0;
  if (![(UIBarButtonItem *)self isCustomViewItem])
  {
    BOOL v4 = _ImageViewInNavigationButton(self->_view);
    if (v4)
    {
      BOOL v5 = v4;
      [v4 frame];
      objc_msgSend(v5, "alignmentRectForFrame:");
      double left = self->_imageInsets.left;
      double v3 = left - CGRectGetMinX(v8);
    }
  }
  return v3;
}

- (double)_rightImagePaddingForEdgeMarginInNavBar
{
  double v3 = 0.0;
  if (![(UIBarButtonItem *)self isCustomViewItem])
  {
    BOOL v4 = _ImageViewInNavigationButton(self->_view);
    if (v4)
    {
      BOOL v5 = v4;
      [v4 frame];
      objc_msgSend(v5, "alignmentRectForFrame:");
      double MaxX = CGRectGetMaxX(v8);
      [(UIView *)self->_view bounds];
      double v3 = MaxX - CGRectGetMaxX(v9) - self->_imageInsets.right;
    }
  }
  return v3;
}

- (void)_getToolbarSystemItemEdgeInsetsWithImageInsets:(UIEdgeInsets *)a3 forBarStyle:(int64_t)a4 landscape:(BOOL)a5 alwaysBordered:(BOOL)a6
{
  if (a3)
  {
    if (a5) {
      [(UIBarButtonItem *)self landscapeImagePhoneInsets];
    }
    else {
      [(UIBarButtonItem *)self imageInsets];
    }
    a3->double top = v7;
    a3->double left = v8;
    a3->double bottom = v9;
    a3->double right = v10;
  }
}

+ (Class)classForNavigationButton
{
  return (Class)objc_opt_class();
}

+ (Class)classForToolbarButton
{
  return (Class)objc_opt_class();
}

uint64_t __30__UIBarButtonItem__updateView__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) createViewForToolbar:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setView:v2];

  double v3 = *(void **)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 32) view];
  [v3 addSubview:v4];

  BOOL v5 = *(void **)(a1 + 40);
  return [v5 _positionToolbarButtonsAndResetFontScaleAdjustment:1];
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)UIBarButtonItem;
  double v3 = [(UIBarButtonItem *)&v16 description];
  BOOL v4 = (void *)[v3 mutableCopy];

  if ([(UIBarButtonItem *)self isCustomViewItem]) {
    objc_msgSend(v4, "appendFormat:", @" view=%p", self->_view);
  }
  if (self->_primaryAction)
  {
    [v4 appendFormat:@" primaryAction=%@", self->_primaryAction];
  }
  else
  {
    p_action = &self->_action;
    if (self->_action)
    {
      id WeakRetained = objc_loadWeakRetained(&self->_target);
      if (*p_action) {
        CGFloat v10 = *p_action;
      }
      else {
        CGFloat v10 = 0;
      }
      double v13 = NSStringFromSelector(v10);
      [v4 appendFormat:@" target=%p action=%@", WeakRetained, v13];
    }
  }
  menu = self->_menu;
  if (menu)
  {
    int v6 = *((_WORD *)&self->_barButtonItemFlags + 1) & 3;
    if (v6 == 2)
    {
      CGFloat v7 = @" menuForcedOnTouchDown";
    }
    else if (v6 == 1)
    {
      CGFloat v7 = @" menuForcedOnLongPress";
    }
    else
    {
      if ((*((_WORD *)&self->_barButtonItemFlags + 1) & 3) != 0)
      {
LABEL_18:
        objc_msgSend(v4, "appendFormat:", @" menu=%p", menu);
        goto LABEL_19;
      }
      if ([(UIBarButtonItem *)self _menuIsPrimary]) {
        CGFloat v7 = @" menuOnTouchDown";
      }
      else {
        CGFloat v7 = @" menuOnLongPress";
      }
    }
    [v4 appendString:v7];
    menu = self->_menu;
    goto LABEL_18;
  }
LABEL_19:
  if ([(UIBarButtonItem *)self isSystemItem])
  {
    switch([(UIBarButtonItem *)self systemItem])
    {
      case 0:
        uint64_t v11 = @" systemItem=Done";
        goto LABEL_58;
      case 1:
        uint64_t v11 = @" systemItem=Cancel";
        goto LABEL_58;
      case 2:
        uint64_t v11 = @" systemItem=Edit";
        goto LABEL_58;
      case 3:
        uint64_t v11 = @" systemItem=Save";
        goto LABEL_58;
      case 4:
        uint64_t v11 = @" systemItem=Add";
        goto LABEL_58;
      case 5:
        uint64_t v11 = @" systemItem=FlexibleSpace";
        goto LABEL_58;
      case 6:
        objc_msgSend(v4, "appendFormat:", @" systemItem=FixedSpace width=%f", *(void *)&self->_width);
        break;
      case 7:
        uint64_t v11 = @" systemItem=Compose";
        goto LABEL_58;
      case 8:
        uint64_t v11 = @" systemItem=Reply";
        goto LABEL_58;
      case 9:
        uint64_t v11 = @" systemItem=Action";
        goto LABEL_58;
      case 10:
        uint64_t v11 = @" systemItem=Organize";
        goto LABEL_58;
      case 11:
        uint64_t v11 = @" systemItem=Bookmarks";
        goto LABEL_58;
      case 12:
        uint64_t v11 = @" systemItem=Search";
        goto LABEL_58;
      case 13:
        uint64_t v11 = @" systemItem=Refresh";
        goto LABEL_58;
      case 14:
        uint64_t v11 = @" systemItem=Stop";
        goto LABEL_58;
      case 15:
        uint64_t v11 = @" systemItem=Camera";
        goto LABEL_58;
      case 16:
        uint64_t v11 = @" systemItem=Trash";
        goto LABEL_58;
      case 17:
        uint64_t v11 = @" systemItem=Play";
        goto LABEL_58;
      case 18:
        uint64_t v11 = @" systemItem=Pause";
        goto LABEL_58;
      case 19:
        uint64_t v11 = @" systemItem=Rewind";
        goto LABEL_58;
      case 20:
        uint64_t v11 = @" systemItem=Forward";
        goto LABEL_58;
      case 21:
        uint64_t v11 = @" systemItem=Undo";
        goto LABEL_58;
      case 22:
        uint64_t v11 = @" systemItem=Redo";
        goto LABEL_58;
      case 24:
        uint64_t v11 = @" systemItem=Close";
LABEL_58:
        [v4 appendString:v11];
        break;
      case 25:
        uint64_t v12 = @" systemItem=WritingTools";
        goto LABEL_30;
      default:
        objc_msgSend(v4, "appendFormat:", @" systemItem=%li", -[UIBarButtonItem systemItem](self, "systemItem"));
        break;
    }
  }
  else if (![(UIBarButtonItem *)self isCustomViewItem])
  {
    if (self->_image)
    {
      [v4 appendFormat:@" image=%@", self->_image];
      if (self->_landscapeImagePhone) {
        [v4 appendFormat:@" landscapeImagePhone=%@", self->_landscapeImagePhone];
      }
    }
    else if (self->_title)
    {
      [v4 appendFormat:@" title='%@'", self->_title];
    }
    if (self->_width != 0.0)
    {
      double width = self->_width;
      uint64_t v12 = @" width=%f";
LABEL_30:
      objc_msgSend(v4, "appendFormat:", v12, *(void *)&width);
    }
  }
  return (NSString *)v4;
}

- (double)_minimumWidth
{
  return self->_minimumWidth;
}

- (void)_setMinimumWidth:(double)a3
{
  self->_double minimumWidth = a3;
}

- (double)_maximumWidth
{
  return self->_maximumWidth;
}

- (void)_setMaximumWidth:(double)a3
{
  self->_double maximumWidth = a3;
}

- (void)_setFlexible:(BOOL)a3
{
  self->_flexible = a3;
}

- (NSDictionary)_stylesForSizingTitles
{
  return self->_stylesForSizingTitles;
}

- (UIAction)primaryAction
{
  return self->_primaryAction;
}

- (UINavigationItem)_owningNavigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__owningNavigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (void)set_owningButtonGroup:(id)a3
{
}

- (BOOL)groupRepresentative
{
  return self->_groupRepresentative;
}

- (id)_autoValidationHandler
{
  return self->__autoValidationHandler;
}

- (void)_setAutoValidationHandler:(id)a3
{
}

- (void)_setToolbarCharge:(double)a3
{
  self->__toolbarCharge = a3;
}

- (BOOL)isKeyboardItem
{
  return self->_isKeyboardItem;
}

- (void)setIsKeyboardItem:(BOOL)a3
{
  self->_isKeyboardItem = a3;
}

- (UIBarButtonItem)_itemVariation
{
  return self->__itemVariation;
}

- (BOOL)_changesSelectionAsPrimaryAction
{
  return self->__changesSelectionAsPrimaryAction;
}

- (void)_setChangesSelectionAsPrimaryAction:(BOOL)a3
{
  self->__changesSelectionAsPrimaryAction = a3;
}

- (CGRect)frameInView:(id)a3
{
  [(UIBarButtonItem *)self _frameInCoordinateSpace:a3 window:0];
  result.size.height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [(UIBarButtonItem *)self _NSToolbarSourceItem];
  CGFloat v9 = v8;
  if (v8)
  {
    [v8 _frameInCoordinateSpace:v6 window:v7];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v18 = [(UIBarButtonItem *)self _viewForPresenting];
    [v18 bounds];
    objc_msgSend(v18, "convertRect:toCoordinateSpace:", v6);
    double v11 = v19;
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
  }
  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  result.size.height = v26;
  result.size.double width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)_nearestViewController
{
  double v3 = [(UIBarButtonItem *)self _NSToolbarSourceItem];
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 _nearestViewController];
  }
  else
  {
    id v6 = [(UIBarButtonItem *)self _viewForPresenting];
    double v5 = [v6 _viewControllerForAncestor];
  }
  return v5;
}

- (id)_sourceViewForPresentationInWindow:(id)a3
{
  id v4 = a3;
  double v5 = [(UIBarButtonItem *)self _NSToolbarSourceItem];
  id v6 = v5;
  if (v5) {
    [v5 _sourceViewForPresentationInWindow:v4];
  }
  else {
  id v7 = [(UIBarButtonItem *)self _viewForPresenting];
  }

  return v7;
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  id v4 = a3;
  double v5 = [(UIBarButtonItem *)self _NSToolbarSourceItem];
  id v6 = v5;
  if (v5) {
    [v5 _sourceRectForPresentationInWindow:v4];
  }
  else {
    [(UIBarButtonItem *)self _rectForPresenting];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

@end