@interface UITab
- (BOOL)_canBeReordered;
- (BOOL)_hasCustomizablePlacement;
- (BOOL)_hasParent;
- (BOOL)_isAction;
- (BOOL)_isAncestorOfTab:(id)a3;
- (BOOL)_isBridgedItem;
- (BOOL)_isCustomizable;
- (BOOL)_isElement;
- (BOOL)_isGroup;
- (BOOL)_isMoreTab;
- (BOOL)_isUniquelySPI;
- (BOOL)allowsHiding;
- (BOOL)hasVisiblePlacement;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isHiddenByDefault;
- (BOOL)isSpringLoaded;
- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4;
- (CGRect)_sourceRectForPresentationInWindow:(id)a3;
- (CGRect)frameInView:(id)a3;
- (NSArray)_displayedViewControllers;
- (NSString)_clusterIdentifier;
- (NSString)badgeValue;
- (NSString)description;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)image;
- (UITab)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 viewControllerProvider:(id)a6;
- (UITabBarController)tabBarController;
- (UITabBarItem)_linkedTabBarItem;
- (UITabGroup)managingTabGroup;
- (UITabGroup)parent;
- (UIViewController)viewController;
- (_UITabAlternateRepresentation)_compactRepresentation;
- (_UITabModel)_tabModel;
- (id)_descriptionWithRecursion:(BOOL)a3;
- (id)_existingDisplayedViewController;
- (id)_filledVariantImage;
- (id)_nearestViewController;
- (id)_parentGroup;
- (id)_recursiveDescription;
- (id)_resolvedSourceItem;
- (id)_sourceViewForPresentationInWindow:(id)a3;
- (id)accessibilityIdentifier;
- (id)userInfo;
- (int64_t)_tabPlacement;
- (int64_t)preferredPlacement;
- (unint64_t)hash;
- (void)_contentDidChange;
- (void)_customizabilityDidChange;
- (void)_didChangeTabModel:(id)a3;
- (void)_resetViewController;
- (void)_setClusterIdentifier:(id)a3;
- (void)_setCompactRepresentation:(id)a3;
- (void)_setDisplayedViewControllers:(id)a3;
- (void)_setParent:(id)a3;
- (void)_setTabModel:(id)a3;
- (void)_updateDescriptionWithBuilder:(id)a3 recursive:(BOOL)a4;
- (void)_updateLinkedTabBarItem;
- (void)_visibilityDidChange;
- (void)setAccessibilityAttributedHint:(id)a3;
- (void)setAccessibilityAttributedLabel:(id)a3;
- (void)setAccessibilityAttributedValue:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setAllowsHiding:(BOOL)a3;
- (void)setBadgeValue:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHiddenByDefault:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setPreferredPlacement:(int64_t)a3;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation UITab

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (void)_updateLinkedTabBarItem
{
  id v13 = [(UITab *)self _linkedTabBarItem];
  if (v13)
  {
    v3 = [(UITab *)self title];
    [v13 setTitle:v3];

    v4 = [(UITab *)self _filledVariantImage];
    [v13 setImage:v4];

    v5 = [(UITab *)self badgeValue];
    [v13 setBadgeValue:v5];

    v6 = [(UITab *)self accessibilityIdentifier];
    [v13 setAccessibilityIdentifier:v6];

    v7 = [self accessibilityLabel];
    [v13 setAccessibilityLabel:v7];

    v8 = [self accessibilityAttributedLabel];
    [v13 setAccessibilityAttributedLabel:v8];

    v9 = [self accessibilityValue];
    [v13 setAccessibilityValue:v9];

    v10 = [self accessibilityAttributedValue];
    [v13 setAccessibilityAttributedValue:v10];

    v11 = [self accessibilityHint];
    [v13 setAccessibilityHint:v11];

    v12 = [self accessibilityAttributedHint];
    [v13 setAccessibilityAttributedHint:v12];

    objc_msgSend(v13, "setSpringLoaded:", -[UITab isSpringLoaded](self, "isSpringLoaded"));
  }
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self->_accessibilityIdentifier;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v11 copy];
    accessibilityIdentifier = self->_accessibilityIdentifier;
    self->_accessibilityIdentifier = v8;

    v10 = [(UITab *)self _linkedTabBarItem];
    [v10 setAccessibilityIdentifier:v11];

    [(UITab *)self _contentDidChange];
  }
LABEL_9:
}

- (NSString)title
{
  return self->_title;
}

- (NSString)badgeValue
{
  return self->_badgeValue;
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (id)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (id)_filledVariantImage
{
  image = self->_image;
  v3 = +[_UIImageSymbolVariant filledVariant];
  id v4 = [(UIImage *)image _imageByApplyingSymbolVariant:v3];

  return v4;
}

- (void)_customizabilityDidChange
{
  id v3 = [(UITab *)self _tabModel];
  [v3 customizabilityDidChangeForTab:self];
}

- (void)_contentDidChange
{
  id v3 = [(UITab *)self _tabModel];
  [v3 tabContentDidChange:self];
}

- (_UITabModel)_tabModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabModel);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    v6 = [(UITab *)self _parentGroup];
    id v5 = [v6 _tabModel];
  }
  return (_UITabModel *)v5;
}

- (id)_parentGroup
{
  return self->_parent;
}

- (UITabBarItem)_linkedTabBarItem
{
  v2 = [(UITab *)self _existingDisplayedViewController];
  id v3 = [v2 tabBarItem];

  return (UITabBarItem *)v3;
}

- (id)_existingDisplayedViewController
{
  return self->_viewController;
}

- (BOOL)_isElement
{
  return 1;
}

- (id)_descriptionWithRecursion:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  [(UITab *)self _updateDescriptionWithBuilder:v5 recursive:v3];
  v6 = [v5 string];

  return v6;
}

- (void)_updateDescriptionWithBuilder:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v28 = a3;
  id v6 = (id)[v28 appendName:@"identifier" object:self->_identifier];
  char v7 = [(UITab *)self title];
  id v8 = (id)[v28 appendName:@"title" object:v7];

  v9 = [(UITab *)self subtitle];

  if (v9)
  {
    v10 = [(UITab *)self subtitle];
    id v11 = (id)[v28 appendName:@"subtitle" object:v10];
  }
  v12 = [(UITab *)self image];

  if (v12)
  {
    id v13 = [(UITab *)self image];
    id v14 = (id)[v28 appendName:@"image" object:v13 usingLightweightDescription:1];
  }
  v15 = [(UITab *)self badgeValue];

  if (v15)
  {
    v16 = [(UITab *)self badgeValue];
    id v17 = (id)[v28 appendName:@"badgeValue" object:v16];
  }
  unint64_t v18 = [(UITab *)self preferredPlacement];
  if (v18 > 6) {
    v19 = @"<unknown>";
  }
  else {
    v19 = off_1E52E5FC8[v18];
  }
  id v20 = (id)[v28 appendName:@"placement" object:v19];
  if (self->_hidden) {
    id v21 = (id)[v28 appendName:@"hidden" BOOLValue:1];
  }
  if (self->_disabled) {
    id v22 = (id)[v28 appendName:@"disabled" BOOLValue:1];
  }
  v23 = v28;
  if (self->_allowsHiding)
  {
    id v24 = (id)[v28 appendName:@"allowsHiding" BOOLValue:1];
    v23 = v28;
  }
  viewController = self->_viewController;
  if (viewController)
  {
    id v26 = (id)[v28 appendName:@"viewController" object:viewController usingLightweightDescription:1];
    v23 = v28;
  }
  if (self->_parent && v4)
  {
    id v27 = (id)objc_msgSend(v28, "appendName:object:usingLightweightDescription:", @"parent");
    v23 = v28;
  }
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (UITab *)a3;
  if (self == v4)
  {
    char v8 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [(UITab *)self preferredPlacement];
    if (v5 == [(UITab *)v4 preferredPlacement])
    {
      BOOL v6 = [(UITab *)self isHidden];
      if (v6 == [(UITab *)v4 isHidden])
      {
        BOOL v7 = [(UITab *)self allowsHiding];
        if (v7 == [(UITab *)v4 allowsHiding])
        {
          v10 = [(UITab *)self identifier];
          id v11 = [(UITab *)v4 identifier];
          id v12 = v10;
          id v13 = v11;
          if (v12 == v13)
          {
          }
          else
          {
            id v14 = v13;
            if (!v12 || !v13) {
              goto LABEL_20;
            }
            char v15 = [v12 isEqual:v13];

            if ((v15 & 1) == 0) {
              goto LABEL_6;
            }
          }
          v16 = [(UITab *)self title];
          id v17 = [(UITab *)v4 title];
          id v12 = v16;
          id v18 = v17;
          if (v12 == v18)
          {

LABEL_23:
            id v20 = [(UITab *)self image];
            id v21 = [(UITab *)v4 image];
            int v22 = UIEqual(v20, v21);

            if (!v22) {
              goto LABEL_6;
            }
            v23 = [(UITab *)self subtitle];
            id v24 = [(UITab *)v4 subtitle];
            int v25 = UIEqual(v23, v24);

            if (!v25) {
              goto LABEL_6;
            }
            id v12 = [(UITab *)self badgeValue];
            id v14 = [(UITab *)v4 badgeValue];
            char v8 = UIEqual(v12, v14);
LABEL_21:

            goto LABEL_8;
          }
          id v14 = v18;
          if (v12 && v18)
          {
            char v19 = [v12 isEqual:v18];

            if ((v19 & 1) == 0) {
              goto LABEL_6;
            }
            goto LABEL_23;
          }
LABEL_20:

          char v8 = 0;
          goto LABEL_21;
        }
      }
    }
  }
LABEL_6:
  char v8 = 0;
LABEL_8:

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)allowsHiding
{
  return self->_allowsHiding;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (int64_t)preferredPlacement
{
  return self->_preferredPlacement;
}

- (UITab)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 viewControllerProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)UITab;
  id v14 = [(UITab *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    title = v14->_title;
    v14->_title = (NSString *)v17;

    uint64_t v19 = [v11 copy];
    image = v14->_image;
    v14->_image = (UIImage *)v19;

    id v21 = _Block_copy(v13);
    id viewControllerProvider = v14->_viewControllerProvider;
    v14->_id viewControllerProvider = v21;

    v14->_springLoaded = 1;
    v14->_preferredPlacement = 0;
  }

  return v14;
}

- (BOOL)_isBridgedItem
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(UITab *)self _descriptionWithRecursion:0];
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    [(UITab *)self _visibilityDidChange];
  }
}

- (void)setAllowsHiding:(BOOL)a3
{
  if (self->_allowsHiding != a3)
  {
    self->_allowsHiding = a3;
    [(UITab *)self _customizabilityDidChange];
  }
}

- (UITabGroup)managingTabGroup
{
  v2 = [(UITab *)self parent];
  BOOL v3 = [v2 managingTabGroup];

  return (UITabGroup *)v3;
}

- (UITabGroup)parent
{
  return self->_parent;
}

- (void)setPreferredPlacement:(int64_t)a3
{
  if (self->_preferredPlacement != a3)
  {
    self->_preferredPlacement = a3;
    [(UITab *)self _customizabilityDidChange];
    [(UITab *)self _contentDidChange];
  }
}

- (void)_setTabModel:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabModel);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tabModel, obj);
    [(UITab *)self _didChangeTabModel:obj];
  }
}

- (void)_didChangeTabModel:(id)a3
{
  if (a3)
  {
    char v7 = 0;
    BOOL v4 = [a3 customizationStore];
    int64_t v5 = [(UITab *)self identifier];
    char v6 = [v4 isHiddenForTabIdentifier:v5 isCustomized:&v7];

    if (v7) {
      self->_hidden = v6;
    }
  }
}

- (BOOL)_isCustomizable
{
  if ([(UITab *)self allowsHiding]) {
    return 1;
  }
  return [(UITab *)self _hasCustomizablePlacement];
}

- (BOOL)_hasCustomizablePlacement
{
  return (unint64_t)([(UITab *)self _tabPlacement] - 1) < 3;
}

- (int64_t)_tabPlacement
{
  int64_t v3 = [(UITab *)self preferredPlacement];
  if (os_variant_has_internal_diagnostics()
    && ([(UITab *)self identifier],
        char v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = _UITabOverridesDefaultPlacement(v6),
        v6,
        (v7 & 1) != 0)
    || !v3)
  {
    BOOL v4 = [(UITab *)self _parentGroup];

    if (v4) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v3;
}

- (BOOL)_isUniquelySPI
{
  return 0;
}

- (UIViewController)viewController
{
  id viewControllerProvider = (void (**)(id, UITab *))self->_viewControllerProvider;
  if (viewControllerProvider && !self->_viewController)
  {
    viewControllerProvider[2](viewControllerProvider, self);
    int64_t v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    viewController = self->_viewController;
    self->_viewController = v5;

    char v7 = [(UIViewController *)self->_viewController tab];

    if (v7)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UITab.m" lineNumber:181 description:@"UIViewController cannot be shared between multiple UITab."];
    }
    -[UIViewController _attachTab:]((uint64_t)self->_viewController, self);
    [(UITab *)self _updateLinkedTabBarItem];
  }
  char v8 = self->_viewController;
  return v8;
}

- (BOOL)_isGroup
{
  return 0;
}

- (BOOL)_isMoreTab
{
  return 0;
}

- (void)setSpringLoaded:(BOOL)a3
{
  if (self->_springLoaded != a3)
  {
    BOOL v3 = a3;
    self->_springLoaded = a3;
    id v4 = [(UITab *)self _linkedTabBarItem];
    [v4 setSpringLoaded:v3];
  }
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4 = a3;
  id v5 = [self accessibilityLabel];
  id v6 = v4;
  char v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v6 && v5) {
      char v8 = [v5 isEqual:v6];
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  [&v10 setAccessibilityLabel:v7];
  v9 = [(UITab *)self _linkedTabBarItem];
  [v9 setAccessibilityLabel:v7];

  if ((v8 & 1) == 0) {
    [(UITab *)self _contentDidChange];
  }
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = self->_subtitle;
  id v6 = (NSString *)v4;
  objc_super v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    char v8 = (NSString *)[(NSString *)v10 copy];
    subtitle = self->_subtitle;
    self->_subtitle = v8;

    [(UITab *)self _contentDidChange];
  }
LABEL_9:
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = self->_title;
  id v6 = (NSString *)v4;
  id v11 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    char v8 = (NSString *)[(NSString *)v11 copy];
    title = self->_title;
    self->_title = v8;

    objc_super v10 = [(UITab *)self _linkedTabBarItem];
    [v10 setTitle:v11];

    [(UITab *)self _contentDidChange];
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__compactRepresentation, 0);
  objc_storeStrong((id *)&self->__clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_badgeValue, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_tabModel);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_displayedViewControllers, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_viewControllerProvider, 0);
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = self->_image;
  id v6 = (UIImage *)v4;
  id v12 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(UIImage *)v5 isEqual:v6];

  if (!v7)
  {
LABEL_8:
    char v8 = (UIImage *)[(UIImage *)v12 copy];
    image = self->_image;
    self->_image = v8;

    objc_super v10 = [(UITab *)self _linkedTabBarItem];
    id v11 = [(UITab *)self _filledVariantImage];
    [v10 setImage:v11];

    [(UITab *)self _contentDidChange];
  }
LABEL_9:
}

- (void)setBadgeValue:(id)a3
{
  id v4 = a3;
  id v5 = self->_badgeValue;
  id v6 = (NSString *)v4;
  id v11 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    char v8 = (NSString *)[(NSString *)v11 copy];
    badgeValue = self->_badgeValue;
    self->_badgeValue = v8;

    objc_super v10 = [(UITab *)self _linkedTabBarItem];
    [v10 setBadgeValue:v11];

    [(UITab *)self _contentDidChange];
  }
LABEL_9:
}

- (BOOL)hasVisiblePlacement
{
  if ([(UITab *)self isHidden]
    || ([(UITab *)self _tabModel], BOOL v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unint64_t v4 = [(UITab *)self _tabPlacement] - 3;
    if (v4 >= 4)
    {
      id v6 = [(UITab *)self _tabModel];
      char v7 = [v6 customizationStore];
      char v8 = [v7 favoriteOrderContainsTab:self];

      LOBYTE(v5) = v8;
    }
    else
    {
      return (7u >> (v4 & 0xF)) & 1;
    }
  }
  return v5;
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(UITab *)self _contentDidChange];
  }
}

- (UITabBarController)tabBarController
{
  v2 = [(UITab *)self _tabModel];
  BOOL v3 = [v2 tabBarController];

  return (UITabBarController *)v3;
}

- (NSArray)_displayedViewControllers
{
  BOOL v3 = self->_displayedViewControllers;
  if (![(NSArray *)v3 count])
  {
    unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    BOOL v5 = [(UITab *)self viewController];
    uint64_t v6 = objc_msgSend(v4, "arrayWithObjects:", v5, 0);

    BOOL v3 = (NSArray *)v6;
  }
  return v3;
}

- (void)_setDisplayedViewControllers:(id)a3
{
  id v4 = a3;
  if (![v4 count]
    || [v4 count] == 1
    && ([v4 objectAtIndexedSubscript:0],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [(UITab *)self viewController],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {

    id v4 = 0;
  }
  displayedViewControllers = self->_displayedViewControllers;
  id v14 = (NSArray *)v4;
  char v8 = displayedViewControllers;
  if (v14 == v8)
  {

    id v12 = v14;
LABEL_13:

    id v11 = v14;
    goto LABEL_14;
  }
  v9 = v8;
  if (!v14 || !v8)
  {

    id v11 = v14;
    goto LABEL_12;
  }
  char v10 = [(NSArray *)v14 isEqual:v8];

  id v11 = v14;
  if ((v10 & 1) == 0)
  {
LABEL_12:
    id v13 = v11;
    id v12 = self->_displayedViewControllers;
    self->_displayedViewControllers = v13;
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_resetViewController
{
  [(UITab *)self _setDisplayedViewControllers:0];
  viewController = self->_viewController;
  if (viewController)
  {
    -[UIViewController _attachTab:]((uint64_t)viewController, 0);
    id v4 = self->_viewController;
    self->_viewController = 0;
  }
}

- (void)_setCompactRepresentation:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self->__compactRepresentation;
  char v7 = (_UITabAlternateRepresentation *)v5;
  v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(_UITabAlternateRepresentation *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->__compactRepresentation, a3);
    [(UITab *)self _contentDidChange];
  }
LABEL_9:
}

- (void)setAccessibilityAttributedLabel:(id)a3
{
  id v4 = a3;
  id v5 = [self accessibilityAttributedLabel];
  id v6 = v4;
  char v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v6 && v5) {
      char v8 = [v5 isEqual:v6];
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  [&v10 setAccessibilityAttributedLabel:v7];
  v9 = [(UITab *)self _linkedTabBarItem];
  [v9 setAccessibilityAttributedLabel:v7];

  if ((v8 & 1) == 0) {
    [(UITab *)self _contentDidChange];
  }
}

- (void)setAccessibilityValue:(id)a3
{
  id v4 = a3;
  id v5 = [self accessibilityValue];
  id v6 = v4;
  char v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v6 && v5) {
      char v8 = [v5 isEqual:v6];
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  [&v10 setAccessibilityValue:v7];
  v9 = [(UITab *)self _linkedTabBarItem];
  [v9 setAccessibilityValue:v7];

  if ((v8 & 1) == 0) {
    [(UITab *)self _contentDidChange];
  }
}

- (void)setAccessibilityAttributedValue:(id)a3
{
  id v4 = a3;
  id v5 = [self accessibilityAttributedValue];
  id v6 = v4;
  char v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v6 && v5) {
      char v8 = [v5 isEqual:v6];
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  [&v10 setAccessibilityAttributedValue:v7];
  v9 = [(UITab *)self _linkedTabBarItem];
  [v9 setAccessibilityAttributedValue:v7];

  if ((v8 & 1) == 0) {
    [(UITab *)self _contentDidChange];
  }
}

- (void)setAccessibilityHint:(id)a3
{
  id v4 = a3;
  id v5 = [self accessibilityHint];
  id v6 = v4;
  char v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v6 && v5) {
      char v8 = [v5 isEqual:v6];
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  [&v10 setAccessibilityHint:v7];
  v9 = [(UITab *)self _linkedTabBarItem];
  [v9 setAccessibilityHint:v7];

  if ((v8 & 1) == 0) {
    [(UITab *)self _contentDidChange];
  }
}

- (void)setAccessibilityAttributedHint:(id)a3
{
  id v4 = a3;
  id v5 = [self accessibilityAttributedHint];
  id v6 = v4;
  char v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v6 && v5) {
      char v8 = [v5 isEqual:v6];
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  [&v10 setAccessibilityAttributedHint:v7];
  v9 = [(UITab *)self _linkedTabBarItem];
  [v9 setAccessibilityAttributedHint:v7];

  if ((v8 & 1) == 0) {
    [(UITab *)self _contentDidChange];
  }
}

- (id)_recursiveDescription
{
  return _UIRecursiveDescription(self, (uint64_t)&__block_literal_global_112, (uint64_t)&__block_literal_global_55);
}

id __30__UITab__recursiveDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _isGroup])
  {
    BOOL v3 = [v2 children];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t __30__UITab__recursiveDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _descriptionWithRecursion:1];
}

- (void)_setParent:(id)a3
{
  id v4 = (UITabGroup *)a3;
  id v7 = [(UITab *)self _tabModel];
  parent = self->_parent;
  self->_parent = v4;

  id v6 = [(UITab *)self _tabModel];
  if (v7 != v6) {
    [(UITab *)self _didChangeTabModel:v6];
  }
}

- (void)_visibilityDidChange
{
  id v3 = [(UITab *)self _tabModel];
  [v3 visibilityDidChangeForTab:self editing:0];
}

- (BOOL)_hasParent
{
  id v2 = [(UITab *)self _parentGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_isAction
{
  return 0;
}

- (BOOL)_isAncestorOfTab:(id)a3
{
  id v4 = (UITab *)a3;
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  do
  {
    id v6 = v5;
    id v5 = [(UITab *)v5 _parentGroup];

    BOOL v7 = v5 == self;
  }
  while (v5 && v5 != self);

  return v7;
}

- (BOOL)_canBeReordered
{
  id v2 = self;
  BOOL v3 = [(UITab *)self _parentGroup];
  LOBYTE(v2) = [v3 _canReorderChild:v2];

  return (char)v2;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)isHiddenByDefault
{
  return self->_hiddenByDefault;
}

- (void)setHiddenByDefault:(BOOL)a3
{
  self->_hiddenByDefault = a3;
}

- (NSString)_clusterIdentifier
{
  return self->__clusterIdentifier;
}

- (void)_setClusterIdentifier:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (_UITabAlternateRepresentation)_compactRepresentation
{
  return self->__compactRepresentation;
}

- (CGRect)frameInView:(id)a3
{
  id v4 = a3;
  id v5 = -[UITab _resolvedSourceItem](self);
  [v5 frameInView:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)_resolvedSourceItem
{
  id v1 = a1;
  if (a1)
  {
    id v2 = [a1 _tabModel];
    id v1 = [v2 resolvedPopoverPresentationControllerSourceItemForTab:v1];
  }
  return v1;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = -[UITab _resolvedSourceItem](self);
  [v8 _frameInCoordinateSpace:v7 window:v6];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_nearestViewController
{
  id v2 = -[UITab _resolvedSourceItem](self);
  BOOL v3 = [v2 _nearestViewController];

  return v3;
}

- (id)_sourceViewForPresentationInWindow:(id)a3
{
  id v4 = a3;
  id v5 = -[UITab _resolvedSourceItem](self);
  id v6 = [v5 _sourceViewForPresentationInWindow:v4];

  return v6;
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  id v4 = a3;
  id v5 = -[UITab _resolvedSourceItem](self);
  [v5 _sourceRectForPresentationInWindow:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

@end