@interface UIBarButtonItemGroup
+ (UIBarButtonItemGroup)fixedGroupWithRepresentativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items;
+ (UIBarButtonItemGroup)movableGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier representativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items;
+ (UIBarButtonItemGroup)optionalGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier inDefaultCustomization:(BOOL)inDefaultCustomization representativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items;
- (BOOL)_canCollapse;
- (BOOL)_dci_isInDefaultCustomization;
- (BOOL)_disabledExpansion;
- (BOOL)_isCritical;
- (BOOL)_isSystemGroup;
- (BOOL)_shouldAlwaysCollapse;
- (BOOL)alwaysAvailable;
- (BOOL)enumerateVisibleItems:(uint64_t)a1;
- (BOOL)isDisplayingRepresentativeItem;
- (BOOL)isHidden;
- (BOOL)reverseEnumerateVisibleItems:(uint64_t)a1;
- (NSArray)barButtonItems;
- (NSString)_dci_customizationIdentifier;
- (UIBarButtonItem)representativeItem;
- (UIBarButtonItemGroup)init;
- (UIBarButtonItemGroup)initWithBarButtonItems:(NSArray *)barButtonItems representativeItem:(UIBarButtonItem *)representativeItem;
- (UIBarButtonItemGroup)initWithCoder:(NSCoder *)coder;
- (UIBarButtonItemGroup)initWithCustomizationIdentifier_dci:(id)a3 inDefaultCustomization:(BOOL)a4 representativeItem:(id)a5 items:(id)a6;
- (UIBarButtonItemGroup)initWithCustomizationIdentifier_dci:(id)a3 representativeItem:(id)a4 items:(id)a5;
- (UIMenuElement)menuRepresentation;
- (_UIBarButtonItemGroupOwner)_owner;
- (double)_contextualExpandedPadding;
- (double)_minimumLeadingSpace;
- (double)_minimumTrailingSpace;
- (id)_customizationIdentifier;
- (id)_effectiveMenuRepresentation;
- (id)_items;
- (id)_notifyPrepareForLayout;
- (id)_notifyWillRequestMenuRepresentation;
- (id)_representativeItemMenu;
- (id)_synthesizedMenuElements;
- (id)description;
- (unint64_t)_expandStyle;
- (void)_ib_setCustomizationDisposition:(int64_t)a3;
- (void)_ib_setCustomizationIdentifier:(id)a3;
- (void)_relinquishOwnership:(uint64_t)a1;
- (void)_removeBarButtonItem:(id)a3;
- (void)_removeRepresentative:(id)a3;
- (void)_setExpandStyle:(unint64_t)a3;
- (void)_setOwner:(id)a3;
- (void)_setShouldAlwaysCollapse:(BOOL)a3;
- (void)_validateAllItems;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysAvailable:(BOOL)alwaysAvailable;
- (void)setBarButtonItems:(NSArray *)barButtonItems;
- (void)setHidden:(BOOL)hidden;
- (void)setMenuRepresentation:(UIMenuElement *)menuRepresentation;
- (void)setRepresentativeItem:(UIBarButtonItem *)representativeItem;
- (void)set_notifyPrepareForLayout:(id)a3;
- (void)set_notifyWillRequestMenuRepresentation:(id)a3;
@end

@implementation UIBarButtonItemGroup

- (id)_items
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setHidden:(BOOL)hidden
{
  char groupFlags = (char)self->_groupFlags;
  if (((((groupFlags & 1) == 0) ^ hidden) & 1) == 0)
  {
    *(unsigned char *)&self->_char groupFlags = groupFlags & 0xFE | hidden;
    id v5 = [(UIBarButtonItemGroup *)self _owner];
    [v5 _groupDidUpdateVisibility:self];
  }
}

- (_UIBarButtonItemGroupOwner)_owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (_UIBarButtonItemGroupOwner *)WeakRetained;
}

- (UIBarButtonItemGroup)init
{
  return [(UIBarButtonItemGroup *)self initWithBarButtonItems:MEMORY[0x1E4F1CBF0] representativeItem:0];
}

- (BOOL)_isCritical
{
  return 0;
}

- (BOOL)_disabledExpansion
{
  return 0;
}

- (double)_contextualExpandedPadding
{
  return 0.0;
}

- (BOOL)_shouldAlwaysCollapse
{
  return self->_shouldAlwaysCollapse;
}

void __46__UIBarButtonItemGroup_enumerateVisibleItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([v6 isHidden] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 0;
  }
}

void __53__UIBarButtonItemGroup_reverseEnumerateVisibleItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([v6 isHidden] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 0;
  }
}

- (BOOL)_canCollapse
{
  if (result)
  {
    uint64_t v1 = result;
    return *(void *)(result + 32)
        && (!dyld_program_sdk_at_least() || ([*(id *)(v1 + 32) isSpaceItem] & 1) == 0);
  }
  return result;
}

- (BOOL)isHidden
{
  return *(unsigned char *)&self->_groupFlags & 1;
}

- (UIBarButtonItem)representativeItem
{
  return self->_representativeItem;
}

- (void)_setOwner:(id)a3
{
}

- (BOOL)reverseEnumerateVisibleItems:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  BOOL v5 = 0;
  if (a1)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    if ((*(unsigned char *)(a1 + 24) & 1) == 0)
    {
      id v6 = *(void **)(a1 + 8);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __53__UIBarButtonItemGroup_reverseEnumerateVisibleItems___block_invoke;
      v8[3] = &unk_1E52DDCE0;
      id v9 = v3;
      v10 = &v11;
      [v6 enumerateObjectsWithOptions:2 usingBlock:v8];

      BOOL v5 = *((unsigned char *)v12 + 24) != 0;
    }
    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (NSArray)barButtonItems
{
  v2 = (void *)[(NSMutableArray *)self->_barButtonItems copy];
  return (NSArray *)v2;
}

- (BOOL)enumerateVisibleItems:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  BOOL v5 = 0;
  if (a1)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    if ((*(unsigned char *)(a1 + 24) & 1) == 0)
    {
      id v6 = *(void **)(a1 + 8);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __46__UIBarButtonItemGroup_enumerateVisibleItems___block_invoke;
      v8[3] = &unk_1E52DDCE0;
      id v9 = v3;
      v10 = &v11;
      [v6 enumerateObjectsUsingBlock:v8];

      BOOL v5 = *((unsigned char *)v12 + 24) != 0;
    }
    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (id)_customizationIdentifier
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBarButtonItems:(NSArray *)barButtonItems
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v5 = barButtonItems;
  if ((*(unsigned char *)&self->_groupFlags & 2) != 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"UIBarButtonItemGroup.m" lineNumber:161 description:@"You cannot change the barButtonItems of system owned UIBarButtonItemGroups"];
  }
  if (![(NSArray *)v5 isEqualToArray:self->_barButtonItems])
  {
    id v6 = [MEMORY[0x1E4F1CA80] setWithArray:self->_barButtonItems];
    if ([(NSArray *)v5 count])
    {
      v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
      [v6 minusSet:v7];
    }
    _UIBarButtonGroupCheckArguments(v5, self->_representativeItem);
    if (v5) {
      v8 = v5;
    }
    else {
      v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    id v9 = (NSMutableArray *)[(NSArray *)v8 mutableCopy];
    v10 = self->_barButtonItems;
    self->_barButtonItems = v9;

    _UIBarButtonGroupAssign(self->_barButtonItems, self);
    if ([v6 count])
    {
      [v6 allObjects];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15++), "_setButtonGroup:isRepresentative:", 0, 0, (void)v18);
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }
    }
    else
    {
      id v11 = 0;
    }
    v16 = [(UIBarButtonItemGroup *)self _owner];
    [v16 _groupDidUpdateItems:self removedItems:v11];
  }
}

- (UIBarButtonItemGroup)initWithBarButtonItems:(NSArray *)barButtonItems representativeItem:(UIBarButtonItem *)representativeItem
{
  id v6 = barButtonItems;
  v7 = representativeItem;
  v13.receiver = self;
  v13.super_class = (Class)UIBarButtonItemGroup;
  v8 = [(UIBarButtonItemGroup *)&v13 init];
  if (v8)
  {
    _UIBarButtonGroupCheckArguments(v6, v7);
    if (v6) {
      id v9 = v6;
    }
    else {
      id v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v10 = [(NSArray *)v9 mutableCopy];
    id v11 = v8->_barButtonItems;
    v8->_barButtonItems = (NSMutableArray *)v10;

    _UIBarButtonGroupAssign(v8->_barButtonItems, v8);
    objc_storeStrong((id *)&v8->_representativeItem, representativeItem);
    _UIBarButtonGroupAssignRepresentative(v8->_representativeItem, v8);
  }

  return v8;
}

- (void)_relinquishOwnership:(uint64_t)a1
{
  if (a1)
  {
    v2 = (id *)(a1 + 56);
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2);

    v4 = WeakRetained;
    if (WeakRetained == v3)
    {
      objc_storeWeak(v2, 0);
      v4 = WeakRetained;
    }
  }
}

+ (UIBarButtonItemGroup)fixedGroupWithRepresentativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items
{
  BOOL v5 = items;
  id v6 = representativeItem;
  uint64_t v7 = [objc_alloc((Class)objc_opt_class()) initWithBarButtonItems:v5 representativeItem:v6];

  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;

  *(unsigned char *)(v7 + 24) &= 0xCFu;
  return (UIBarButtonItemGroup *)(id)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__notifyWillRequestMenuRepresentation, 0);
  objc_storeStrong(&self->__notifyPrepareForLayout, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_menuRepresentation, 0);
  objc_storeStrong((id *)&self->_representativeItem, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);
}

- (void)setRepresentativeItem:(UIBarButtonItem *)representativeItem
{
  BOOL v5 = representativeItem;
  if ((*(unsigned char *)&self->_groupFlags & 2) != 0)
  {
    objc_super v13 = v5;
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UIBarButtonItemGroup.m" lineNumber:218 description:@"You cannot change the representativeItem of system owned UIBarButtonItemGroups"];

    BOOL v5 = v13;
  }
  if (self->_representativeItem != v5)
  {
    uint64_t v12 = v5;
    _UIBarButtonGroupCheckArguments(self->_barButtonItems, v5);
    _UIBarButtonGroupAssignRepresentative(self->_representativeItem, 0);
    id v6 = self->_representativeItem;
    uint64_t v7 = v12;
    v8 = self->_representativeItem;
    self->_representativeItem = v7;
    id v9 = v6;

    _UIBarButtonGroupAssignRepresentative(self->_representativeItem, self);
    uint64_t v10 = [(UIBarButtonItemGroup *)self _owner];
    [v10 _groupDidUpdateRepresentative:self fromRepresentative:v9];

    BOOL v5 = v12;
  }
}

- (void)_removeBarButtonItem:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (dyld_program_sdk_at_least())
  {
    if ((*(unsigned char *)&self->_groupFlags & 2) != 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"UIBarButtonItemGroup.m" lineNumber:50 description:@"Taking barButtonItems from a system owned UIBarButtonItemGroup is not expected and may result in unexpected behavior."];
    }
  }
  else if ((*(unsigned char *)&self->_groupFlags & 2) != 0)
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_removeBarButtonItem____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Taking barButtonItems from a system owned UIBarButtonItemGroup is not expected and may result in unexpected behavior.", v11, 2u);
    }
  }
  if ([(NSMutableArray *)self->_barButtonItems count])
  {
    uint64_t v7 = [(NSMutableArray *)self->_barButtonItems indexOfObjectIdenticalTo:v5];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_barButtonItems removeObjectAtIndex:v7];
      v8 = [(UIBarButtonItemGroup *)self _owner];
      v12[0] = v5;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v8 _groupDidUpdateItems:self removedItems:v9];
    }
  }
}

- (void)_removeRepresentative:(id)a3
{
  id v5 = (UIBarButtonItem *)a3;
  if (dyld_program_sdk_at_least())
  {
    if ((*(unsigned char *)&self->_groupFlags & 2) != 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"UIBarButtonItemGroup.m" lineNumber:63 description:@"Taking barButtonItems from a system owned UIBarButtonItemGroup is not expected and may result in unexpected behavior."];
    }
  }
  else if ((*(unsigned char *)&self->_groupFlags & 2) != 0)
  {
    id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_removeRepresentative____s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Taking barButtonItems from a system owned UIBarButtonItemGroup is not expected and may result in unexpected behavior.", v10, 2u);
    }
  }
  if (self->_representativeItem == v5)
  {
    self->_representativeItem = 0;
    uint64_t v7 = v5;

    v8 = [(UIBarButtonItemGroup *)self _owner];
    [v8 _groupDidUpdateRepresentative:self fromRepresentative:v7];
  }
}

- (UIBarButtonItemGroup)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v18.receiver = self;
  v18.super_class = (Class)UIBarButtonItemGroup;
  id v5 = [(UIBarButtonItemGroup *)&v18 init];
  if (v5)
  {
    id v6 = [(NSCoder *)v4 decodeObjectForKey:@"UIBarButtonItems"];
    uint64_t v7 = v6;
    if (!v6) {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v8 = [v6 mutableCopy];
    barButtonItems = v5->_barButtonItems;
    v5->_barButtonItems = (NSMutableArray *)v8;

    _UIBarButtonGroupAssign(v5->_barButtonItems, v5);
    uint64_t v10 = [(NSCoder *)v4 decodeObjectForKey:@"UIRepresentativeItem"];
    representativeItem = v5->_representativeItem;
    v5->_representativeItem = (UIBarButtonItem *)v10;

    uint64_t v12 = [(NSCoder *)v4 decodeObjectForKey:@"UIMenuRepresentation"];
    menuRepresentation = v5->_menuRepresentation;
    v5->_menuRepresentation = (UIMenuElement *)v12;

    *(unsigned char *)&v5->_char groupFlags = *(unsigned char *)&v5->_groupFlags & 0xFE | [(NSCoder *)v4 decodeBoolForKey:@"UIGroupHidden"];
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIShowInOverflow"]) {
      char v14 = 8;
    }
    else {
      char v14 = 0;
    }
    *(unsigned char *)&v5->_char groupFlags = *(unsigned char *)&v5->_groupFlags & 0xF7 | v14;
    uint64_t v15 = [(NSCoder *)v4 decodeObjectForKey:@"UICustomizationIdentifier"];
    customizationIdentifier = v5->_customizationIdentifier;
    v5->_customizationIdentifier = (NSString *)v15;

    if (v5->_customizationIdentifier) {
      *(unsigned char *)&v5->_char groupFlags = (16
    }
                                  * ([(NSCoder *)v4 decodeIntegerForKey:@"UICustomizationDisposition"] & 3)) | *(unsigned char *)&v5->_groupFlags & 0xCF;
    _UIBarButtonGroupAssignRepresentative(v5->_representativeItem, v5);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  barButtonItems = self->_barButtonItems;
  id v10 = v4;
  if (barButtonItems)
  {
    [v4 encodeObject:barButtonItems forKey:@"UIBarButtonItems"];
    id v4 = v10;
  }
  representativeItem = self->_representativeItem;
  if (representativeItem)
  {
    [v10 encodeObject:representativeItem forKey:@"UIRepresentativeItem"];
    id v4 = v10;
  }
  menuRepresentation = self->_menuRepresentation;
  if (menuRepresentation)
  {
    [v10 encodeObject:menuRepresentation forKey:@"UIMenuRepresentation"];
    id v4 = v10;
  }
  char groupFlags = (char)self->_groupFlags;
  if (groupFlags)
  {
    [v10 encodeBool:1 forKey:@"UIGroupHidden"];
    id v4 = v10;
    char groupFlags = (char)self->_groupFlags;
  }
  if ((groupFlags & 8) != 0)
  {
    [v10 encodeBool:1 forKey:@"UIShowInOverflow"];
    id v4 = v10;
  }
  customizationIdentifier = self->_customizationIdentifier;
  if (customizationIdentifier)
  {
    [v10 encodeObject:customizationIdentifier forKey:@"UICustomizationIdentifier"];
    [v10 encodeInteger:((unint64_t)*(unsigned char *)&self->_groupFlags >> 4) & 3 forKey:@"UICustomizationDisposition"];
    id v4 = v10;
  }
}

- (BOOL)isDisplayingRepresentativeItem
{
  v2 = [(UIBarButtonItem *)self->_representativeItem view];
  id v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)alwaysAvailable
{
  return (*(unsigned char *)&self->_groupFlags >> 3) & 1;
}

- (void)setAlwaysAvailable:(BOOL)alwaysAvailable
{
  if (alwaysAvailable) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char groupFlags = *(unsigned char *)&self->_groupFlags & 0xF7 | v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UIBarButtonItemGroup;
  char v3 = [(UIBarButtonItemGroup *)&v7 description];
  BOOL v4 = (void *)[v3 mutableCopy];

  if (*(unsigned char *)&self->_groupFlags) {
    [v4 appendString:@" hidden"];
  }
  if (self->_customizationIdentifier)
  {
    [v4 appendFormat:@" customizationIdentifier='%@'", self->_customizationIdentifier];
    [v4 appendString:off_1E52DDD00[((unint64_t)*(unsigned char *)&self->_groupFlags >> 4) & 3]];
  }
  if ((*(unsigned char *)&self->_groupFlags & 8) != 0) {
    [v4 appendString:@" alwaysAvailable"];
  }
  if (self->_representativeItem) {
    [v4 appendFormat:@" representativeItem=%@", self->_representativeItem];
  }
  if ([(NSMutableArray *)self->_barButtonItems count])
  {
    id v5 = [(NSMutableArray *)self->_barButtonItems componentsJoinedByString:@"\n\t"];
    [v4 appendFormat:@" barButtonItems={\n\t%@\n}", v5];
  }
  if (self->_menuRepresentation) {
    [v4 appendFormat:@" menuRepresentation=%@", self->_menuRepresentation];
  }
  return v4;
}

+ (UIBarButtonItemGroup)movableGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier representativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items
{
  objc_super v7 = items;
  uint64_t v8 = representativeItem;
  id v9 = customizationIdentifier;
  uint64_t v10 = [objc_alloc((Class)objc_opt_class()) initWithBarButtonItems:v7 representativeItem:v8];

  uint64_t v11 = [(NSString *)v9 copy];
  uint64_t v12 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v11;

  *(unsigned char *)(v10 + 24) = *(unsigned char *)(v10 + 24) & 0xCF | 0x10;
  return (UIBarButtonItemGroup *)(id)v10;
}

+ (UIBarButtonItemGroup)optionalGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier inDefaultCustomization:(BOOL)inDefaultCustomization representativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items
{
  BOOL v7 = inDefaultCustomization;
  id v9 = items;
  uint64_t v10 = representativeItem;
  uint64_t v11 = customizationIdentifier;
  uint64_t v12 = [objc_alloc((Class)objc_opt_class()) initWithBarButtonItems:v9 representativeItem:v10];

  uint64_t v13 = [(NSString *)v11 copy];
  char v14 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v13;

  if (v7) {
    char v15 = 32;
  }
  else {
    char v15 = 48;
  }
  *(unsigned char *)(v12 + 24) = *(unsigned char *)(v12 + 24) & 0xCF | v15;
  return (UIBarButtonItemGroup *)(id)v12;
}

- (void)setMenuRepresentation:(UIMenuElement *)menuRepresentation
{
  if (self->_menuRepresentation != menuRepresentation)
  {
    BOOL v4 = (UIMenuElement *)[(UIMenuElement *)menuRepresentation copy];
    id v5 = self->_menuRepresentation;
    self->_menuRepresentation = v4;

    [(UIBarButtonItemGroup *)self _sendNeedsToolbarUpdate];
  }
}

- (UIBarButtonItemGroup)initWithCustomizationIdentifier_dci:(id)a3 representativeItem:(id)a4 items:(id)a5
{
  return [(UIBarButtonItemGroup *)self initWithCustomizationIdentifier_dci:a3 inDefaultCustomization:1 representativeItem:a4 items:a5];
}

- (UIBarButtonItemGroup)initWithCustomizationIdentifier_dci:(id)a3 inDefaultCustomization:(BOOL)a4 representativeItem:(id)a5 items:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  uint64_t v12 = [(UIBarButtonItemGroup *)self initWithBarButtonItems:a6 representativeItem:a5];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    customizationIdentifier = v12->_customizationIdentifier;
    v12->_customizationIdentifier = (NSString *)v13;

    char groupFlags = (char)v12->_groupFlags;
    if (v12->_customizationIdentifier)
    {
      if (v8) {
        char v16 = groupFlags & 0xCF | 0x20;
      }
      else {
        char v16 = groupFlags | 0x30;
      }
      *(unsigned char *)&v12->_char groupFlags = v16;
    }
    else
    {
      *(unsigned char *)&v12->_char groupFlags = groupFlags & 0xCF;
      if (!v8)
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2 object:v12 file:@"UIBarButtonItemGroup.m" lineNumber:358 description:@"Cannot create a group with inDefaultCustomization=NO and customizationIdentifier==nil"];
      }
    }
  }

  return v12;
}

- (NSString)_dci_customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (BOOL)_dci_isInDefaultCustomization
{
  if (self) {
    LOBYTE(self) = (~*(unsigned char *)&self->_groupFlags & 0x30) != 0;
  }
  return (char)self;
}

- (BOOL)_isSystemGroup
{
  if (self) {
    LODWORD(self) = (*(unsigned char *)&self->_groupFlags >> 1) & 1;
  }
  return (char)self;
}

- (double)_minimumLeadingSpace
{
  return 0.0;
}

- (double)_minimumTrailingSpace
{
  return 0.0;
}

- (id)_synthesizedMenuElements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = self->_barButtonItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isHidden", (void)v13) & 1) == 0)
        {
          uint64_t v10 = [v9 _effectiveMenuRepresentation];
          if (v10) {
            [v3 addObject:v10];
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 array];

  return v11;
}

- (id)_representativeItemMenu
{
  if (a1)
  {
    uint64_t v1 = [a1 _synthesizedMenuElements];
    v2 = +[UIMenu menuWithChildren:v1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_effectiveMenuRepresentation
{
  if (a1)
  {
    uint64_t v2 = a1[9];
    if (v2) {
      (*(void (**)(uint64_t, void *))(v2 + 16))(v2, a1);
    }
    char v3 = (void *)a1[5];
    if (v3)
    {
      id v4 = v3;
    }
    else
    {
      uint64_t v5 = [a1 _synthesizedMenuElements];
      if ([v5 count] == 1) {
        [v5 firstObject];
      }
      else {
      id v4 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:0 options:1 children:v5];
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_validateAllItems
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v3 = self->_barButtonItems;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "_executeValidationHandler", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(UIBarButtonItem *)self->_representativeItem _executeValidationHandler];
}

- (void)_ib_setCustomizationIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  customizationIdentifier = self->_customizationIdentifier;
  self->_customizationIdentifier = v4;

  if (!self->_customizationIdentifier) {
    *(unsigned char *)&self->_groupFlags &= 0xCFu;
  }
}

- (void)_ib_setCustomizationDisposition:(int64_t)a3
{
  *(unsigned char *)&self->_char groupFlags = *(unsigned char *)&self->_groupFlags & 0xCF | (16 * (a3 & 3));
}

- (UIMenuElement)menuRepresentation
{
  return self->_menuRepresentation;
}

- (id)_notifyPrepareForLayout
{
  return self->__notifyPrepareForLayout;
}

- (void)set_notifyPrepareForLayout:(id)a3
{
}

- (id)_notifyWillRequestMenuRepresentation
{
  return self->__notifyWillRequestMenuRepresentation;
}

- (void)set_notifyWillRequestMenuRepresentation:(id)a3
{
}

- (unint64_t)_expandStyle
{
  return self->_expandStyle;
}

- (void)_setExpandStyle:(unint64_t)a3
{
  self->_expandStyle = a3;
}

- (void)_setShouldAlwaysCollapse:(BOOL)a3
{
  self->_shouldAlwaysCollapse = a3;
}

@end