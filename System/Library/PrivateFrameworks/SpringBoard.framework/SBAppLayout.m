@interface SBAppLayout
+ (SBAppLayout)appLayoutWithProtobufRepresentation:(id)a3;
+ (id)homeScreenAppLayout;
- (BOOL)containsAllItemsFromAppLayout:(id)a3;
- (BOOL)containsAllItemsFromSet:(id)a3;
- (BOOL)containsAnyItemFromAppLayout:(id)a3;
- (BOOL)containsAnyItemFromSet:(id)a3;
- (BOOL)containsItem:(id)a3;
- (BOOL)containsItemWithBundleIdentifier:(id)a3;
- (BOOL)containsItemWithUniqueIdentifier:(id)a3;
- (BOOL)hasSameItemsInLayoutRoles:(unint64_t)a3 asAppLayout:(id)a4;
- (BOOL)isAdditiveModelEnabled;
- (BOOL)isCenterOverFull;
- (BOOL)isCenterOverSplit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullScreen;
- (BOOL)isHidden;
- (BOOL)isOrContainsAppLayout:(id)a3;
- (BOOL)isSplitConfiguration;
- (NSDictionary)cachedDisplayItemLayoutAttributesForNonPreferredDisplay;
- (NSDictionary)itemsToLayoutAttributesMap;
- (NSString)continuousExposeIdentifier;
- (NSString)description;
- (SBAppLayout)appLayoutWithItemsPassingTest:(id)a3;
- (SBAppLayout)init;
- (SBAppLayout)initWithItems:(id)a3 centerItem:(id)a4 floatingItem:(id)a5 configuration:(int64_t)a6 itemsToLayoutAttributes:(id)a7 centerConfiguration:(int64_t)a8 environment:(int64_t)a9 hidden:(BOOL)a10 preferredDisplayOrdinal:(int64_t)a11;
- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 centerConfiguration:(int64_t)a5 environment:(int64_t)a6 hidden:(BOOL)a7 preferredDisplayOrdinal:(int64_t)a8;
- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 environment:(int64_t)a5 hidden:(BOOL)a6 preferredDisplayOrdinal:(int64_t)a7;
- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 environment:(int64_t)a5 preferredDisplayOrdinal:(int64_t)a6;
- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 itemsToLayoutAttributes:(id)a5 centerConfiguration:(int64_t)a6 environment:(int64_t)a7 hidden:(BOOL)a8 preferredDisplayOrdinal:(int64_t)a9;
- (SBAppLayout)initWithPlistRepresentation:(id)a3;
- (SBAppLayoutAutoLayoutSpaceCacheKey)cachedLastOverlappingModelKey;
- (SBContinuousExposeAutoLayoutSpace)cachedLastAutoLayoutSpace;
- (SBDisplayItem)centerItem;
- (SBDisplayItem)floatingItem;
- (id)_leafAppLayoutForItem:(id)a3 role:(int64_t)a4;
- (id)_preferredWindowScene;
- (id)allItems;
- (id)anyLeafAppLayout;
- (id)appLayoutByAdjustingCenterWindowItemsForChamois;
- (id)appLayoutByAdjustingFloatingItemsForChamois;
- (id)appLayoutByInsertingItem:(id)a3 withLayoutAttributes:(id)a4 inLayoutRole:(int64_t)a5;
- (id)appLayoutByInsertingLeafAppLayout:(id)a3 inRole:(int64_t)a4;
- (id)appLayoutByModifyingConfiguration:(int64_t)a3;
- (id)appLayoutByModifyingEnvironment:(int64_t)a3;
- (id)appLayoutByModifyingHiddenState:(BOOL)a3;
- (id)appLayoutByModifyingLayoutAttributes:(id)a3 forItem:(id)a4;
- (id)appLayoutByModifyingLayoutAttributes:(id)a3 forItemInRole:(int64_t)a4;
- (id)appLayoutByModifyingLayoutAttributesForItems:(id)a3;
- (id)appLayoutByModifyingPreferredDisplayOrdinal:(int64_t)a3;
- (id)appLayoutByRemovingItemInLayoutRole:(int64_t)a3;
- (id)appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:(id)a3 multitaskingSupported:(BOOL)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)flippedAppLayout;
- (id)itemForLayoutRole:(int64_t)a3;
- (id)latestItemPassingTest:(id)a3;
- (id)layoutAttributesForItem:(id)a3;
- (id)layoutAttributesForItemInRole:(int64_t)a3;
- (id)leafAppLayoutForItem:(id)a3;
- (id)leafAppLayoutForRole:(int64_t)a3;
- (id)leafAppLayouts;
- (id)plistRepresentation;
- (id)preferredDisplayIdentity;
- (id)protobufRepresentation;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)zOrderedItems;
- (id)zOrderedLeafAppLayouts;
- (int64_t)centerConfiguration;
- (int64_t)compare:(id)a3;
- (int64_t)configuration;
- (int64_t)environment;
- (int64_t)layoutRoleForItem:(id)a3;
- (int64_t)preferredDisplayOrdinal;
- (int64_t)type;
- (uint64_t)setConfiguration:(uint64_t)result;
- (unint64_t)hash;
- (unint64_t)switcherLayoutElementType;
- (void)enumerate:(id)a3;
- (void)setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:(id)a3;
- (void)setCachedLastAutoLayoutSpace:(id)a3;
- (void)setCachedLastOverlappingModelKey:(id)a3;
- (void)setItems:(void *)a1;
- (void)setItemsToLayoutAttributesMap:(void *)a1;
- (void)setItemsWithoutCenterOrFloatingItems:(void *)a1;
@end

@implementation SBAppLayout

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (int64_t)layoutRoleForItem:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_itemsWithoutCenterOrFloatingItems indexOfObject:v4];
  switch(v5)
  {
    case 0uLL:
      v6 = &SBLayoutRolePrimary;
      goto LABEL_13;
    case 1uLL:
      v6 = &SBLayoutRoleSide;
      goto LABEL_13;
    case 0x7FFFFFFFFFFFFFFFuLL:
      if (v4)
      {
        if (BSEqualObjects())
        {
          v6 = &SBLayoutRoleCenter;
LABEL_13:
          int64_t v7 = *v6;
          goto LABEL_14;
        }
        if (BSEqualObjects())
        {
          v6 = &SBLayoutRoleFloating;
          goto LABEL_13;
        }
      }
      v6 = &SBLayoutRoleUndefined;
      goto LABEL_13;
  }
  int64_t v7 = v5 + 3;
LABEL_14:

  return v7;
}

void __144__SBAppLayout_initWithItemsForLayoutRoles_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithInteger:a2];
  id v6 = [v3 objectForKey:v4];

  NSUInteger v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
    NSUInteger v5 = v6;
  }
}

- (id)itemForLayoutRole:(int64_t)a3
{
  unint64_t v5 = [(NSArray *)self->_itemsWithoutCenterOrFloatingItems count];
  int64_t v6 = SBLayoutRoleMax();
  if (a3 < 1 || v6 < a3) {
    goto LABEL_6;
  }
  if (a3 != 1)
  {
    switch(a3)
    {
      case 2:
        if (v5 >= 2)
        {
          itemsWithoutCenterOrFloatingItems = self->_itemsWithoutCenterOrFloatingItems;
          int64_t v10 = 1;
          goto LABEL_20;
        }
LABEL_6:
        v8 = 0;
        goto LABEL_21;
      case 3:
        floatingItem = self->_floatingItem;
        break;
      case 4:
        floatingItem = self->_centerItem;
        break;
      default:
        int64_t v10 = a3 - 3;
        if (v5 >= a3 - 2)
        {
          itemsWithoutCenterOrFloatingItems = self->_itemsWithoutCenterOrFloatingItems;
          goto LABEL_20;
        }
        goto LABEL_6;
    }
    v8 = floatingItem;
    goto LABEL_21;
  }
  if (!v5) {
    goto LABEL_6;
  }
  itemsWithoutCenterOrFloatingItems = self->_itemsWithoutCenterOrFloatingItems;
  int64_t v10 = 0;
LABEL_20:
  v8 = [(NSArray *)itemsWithoutCenterOrFloatingItems objectAtIndex:v10];
LABEL_21:
  return v8;
}

- (BOOL)isOrContainsAppLayout:(id)a3
{
  id v4 = (SBAppLayout *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (unint64_t v6 = -[NSArray count](self->_items, "count"), v6 > [p_isa[14] count]))
  {
    uint64_t v7 = [p_isa environment];
    int64_t environment = self->_environment;
    if (environment == v7 || (BOOL v9 = 0, v7 == 3) && environment == 1)
    {
      int64_t v10 = [p_isa itemForLayoutRole:1];
      BOOL v9 = [(SBAppLayout *)self containsItem:v10];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)allItems
{
  return self->_items;
}

- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 itemsToLayoutAttributes:(id)a5 centerConfiguration:(int64_t)a6 environment:(int64_t)a7 hidden:(BOOL)a8 preferredDisplayOrdinal:(int64_t)a9
{
  id v13 = a3;
  id v14 = a5;
  v15 = objc_opt_new();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __144__SBAppLayout_initWithItemsForLayoutRoles_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke;
  v27[3] = &unk_1E6B002B8;
  id v28 = v13;
  id v29 = v15;
  id v16 = v15;
  id v17 = v13;
  SBLayoutRoleEnumerateValidRoles(v27);
  v18 = [NSNumber numberWithInteger:4];
  v19 = [v17 objectForKey:v18];

  v20 = [NSNumber numberWithInteger:3];
  v21 = [v17 objectForKey:v20];

  LOBYTE(v24) = a8;
  v22 = [(SBAppLayout *)self initWithItems:v16 centerItem:v19 floatingItem:v21 configuration:a4 itemsToLayoutAttributes:v14 centerConfiguration:a6 environment:a7 hidden:v24 preferredDisplayOrdinal:a9];

  return v22;
}

- (BOOL)containsItem:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__SBAppLayout_containsItem___block_invoke;
  v7[3] = &unk_1E6AFD168;
  id v5 = v4;
  id v8 = v5;
  BOOL v9 = &v10;
  [(SBAppLayout *)self enumerate:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (int64_t)type
{
  int64_t result = self->_cachedAppLayoutType;
  if (result == -1)
  {
    id v4 = [(SBAppLayout *)self itemForLayoutRole:1];
    unint64_t v5 = [v4 type];

    unint64_t v6 = +[SBAppLayout homeScreenAppLayout];
    BOOL v7 = [(SBAppLayout *)self isEqual:v6];

    int64_t result = 1;
    if (!v7 && v5 != 1)
    {
      if (v5 > 6) {
        int64_t result = -1;
      }
      else {
        int64_t result = qword_1D8FD1E10[v5];
      }
    }
    self->_cachedAppLayoutType = result;
  }
  return result;
}

- (id)leafAppLayouts
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_items count] == 1)
  {
    v10[0] = self;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v4 = objc_opt_new();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__SBAppLayout_leafAppLayouts__block_invoke;
    v8[3] = &unk_1E6AF4F20;
    v8[4] = self;
    id v5 = v4;
    id v9 = v5;
    [(SBAppLayout *)self enumerate:v8];
    unint64_t v6 = v9;
    id v3 = v5;
  }
  return v3;
}

- (unint64_t)switcherLayoutElementType
{
  return 0;
}

- (id)zOrderedItems
{
  items = self->_items;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__SBAppLayout_zOrderedItems__block_invoke;
  v5[3] = &unk_1E6B00710;
  v5[4] = self;
  id v3 = [(NSArray *)items sortedArrayUsingComparator:v5];
  return v3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (int64_t)preferredDisplayOrdinal
{
  return self->_preferredDisplayOrdinal;
}

- (SBDisplayItem)floatingItem
{
  return self->_floatingItem;
}

- (SBDisplayItem)centerItem
{
  return self->_centerItem;
}

- (int64_t)centerConfiguration
{
  return self->_centerConfiguration;
}

- (int64_t)environment
{
  return self->_environment;
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (id)leafAppLayoutForRole:(int64_t)a3
{
  id v4 = [(SBAppLayout *)self itemForLayoutRole:a3];
  id v5 = [(SBAppLayout *)self leafAppLayoutForItem:v4];

  return v5;
}

- (id)leafAppLayoutForItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBAppLayout *)self layoutRoleForItem:v4];
  if (v5 == 1)
  {
    NSUInteger v6 = [(NSArray *)self->_items count];
    if (v4)
    {
      if (v6 == 1)
      {
        BOOL v7 = self;
LABEL_7:
        id v8 = v7;
        goto LABEL_9;
      }
    }
  }
  if (v4)
  {
    BOOL v7 = [(SBAppLayout *)self _leafAppLayoutForItem:v4 role:v5];
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (void)enumerate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, int64_t, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, -[SBAppLayout layoutRoleForItem:](self, "layoutRoleForItem:", *(void *)(*((void *)&v10 + 1) + 8 * v9), (void)v10), *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __38__SBAppLayout_containsAnyItemFromSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __41__SBAppLayout_succinctDescriptionBuilder__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v16 = [v5 uniqueIdentifier];
  uint64_t v6 = [v16 componentsSeparatedByString:@"-"];
  uint64_t v7 = [v6 lastObject];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = &stru_1F3084718;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  long long v10 = v9;

  long long v11 = NSString;
  long long v12 = [v5 bundleIdentifier];

  long long v13 = [v11 stringWithFormat:@"%@:%@", v12, v10];

  char v14 = *(void **)(a1 + 32);
  v15 = SBLayoutRoleDescription(a2);
  [v14 appendString:v13 withName:v15];
}

void __48__SBAppLayout_containsItemWithUniqueIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = [a3 uniqueIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __45__SBAppLayout_appLayoutWithItemsPassingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v4)
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      int v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v4 addObject:v8];
  }
}

uint64_t __28__SBAppLayout_containsItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __41__SBAppLayout_continuousExposeIdentifier__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 25)) {
    [v4 uniqueIdentifier];
  }
  else {
  uint64_t v5 = [v4 bundleIdentifier];
  }
  if (v5 && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v5] & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

void __48__SBAppLayout_containsItemWithBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 bundleIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (SBAppLayout)initWithItems:(id)a3 centerItem:(id)a4 floatingItem:(id)a5 configuration:(int64_t)a6 itemsToLayoutAttributes:(id)a7 centerConfiguration:(int64_t)a8 environment:(int64_t)a9 hidden:(BOOL)a10 preferredDisplayOrdinal:(int64_t)a11
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v18 = a4;
  id v66 = a5;
  id v70 = a7;
  uint64_t v19 = objc_opt_class();
  id v64 = v18;
  if (v19 == objc_opt_class())
  {
    if (!v18) {
      goto LABEL_5;
    }
  }
  else
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2 object:self file:@"SBAppLayout.m" lineNumber:335 description:@"This might not work for subclasses"];

    if (!v18) {
      goto LABEL_5;
    }
  }
  if ((objc_msgSend(v67, "containsObject:", v18, v18) & 1) == 0)
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
  }
LABEL_5:
  if (v66 && (objc_msgSend(v67, "containsObject:") & 1) == 0)
  {
    v63 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  if (!v70)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2 object:self file:@"SBAppLayout.m" lineNumber:338 description:@"itemsToLayoutAttributesMap cannot be nil"];
  }
  if (__allAppLayoutsOnceToken != -1) {
    dispatch_once(&__allAppLayoutsOnceToken, &__block_literal_global_217);
  }
  v81.receiver = self;
  v81.super_class = (Class)SBAppLayout;
  v20 = [(SBAppLayout *)&v81 init];
  v68 = v20;
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_centerItem, a4);
    objc_storeStrong((id *)&v68->_floatingItem, a5);
    v68->_configuration = a6;
    v68->_int64_t environment = a9;
    v68->_centerConfiguration = a8;
    v68->_cachedAppLayoutType = -1;
    v68->_hidden = a10;
    v68->_preferredDisplayOrdinal = a11;
    uint64_t v22 = [v67 copy];
    items = v68->_items;
    v68->_items = (NSArray *)v22;

    v68->_isAdditiveModelEnabled = _os_feature_enabled_impl();
    uint64_t v24 = v68->_items;
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __154__SBAppLayout_initWithItems_centerItem_floatingItem_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke_2;
    v79[3] = &unk_1E6AF4B38;
    v69 = v68;
    v80 = v69;
    uint64_t v25 = [(NSArray *)v24 bs_filter:v79];
    itemsWithoutCenterOrFloatingItems = v69->_itemsWithoutCenterOrFloatingItems;
    v69->_itemsWithoutCenterOrFloatingItems = (NSArray *)v25;

    itemsToLayoutAttributesMap = v69->_itemsToLayoutAttributesMap;
    v69->_itemsToLayoutAttributesMap = (NSDictionary *)MEMORY[0x1E4F1CC08];

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v28 = v68->_items;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v75 objects:v85 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v76 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void *)(*((void *)&v75 + 1) + 8 * i);
          v33 = [v70 objectForKey:v32];
          v34 = v33;
          if (v33) {
            v35 = v33;
          }
          else {
            v35 = objc_alloc_init(SBDisplayItemLayoutAttributes);
          }
          v36 = v35;

          v37 = v69->_itemsToLayoutAttributesMap;
          uint64_t v83 = v32;
          v84 = v36;
          v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          uint64_t v39 = [(NSDictionary *)v37 bs_dictionaryByAddingEntriesFromDictionary:v38];
          v40 = v69->_itemsToLayoutAttributesMap;
          v69->_itemsToLayoutAttributesMap = (NSDictionary *)v39;
        }
        uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v75 objects:v85 count:16];
      }
      while (v29);
    }

    v41 = [MEMORY[0x1E4F4F758] builder];
    id v42 = (id)[v41 appendInteger:v68->_environment];
    id v43 = (id)[v41 appendInteger:v68->_configuration];
    id v44 = (id)[v41 appendInteger:v68->_centerConfiguration];
    id v45 = (id)[v41 appendBool:v68->_hidden];
    id v46 = (id)[v41 appendInteger:v68->_preferredDisplayOrdinal];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v47 = v68->_items;
    uint64_t v48 = [(NSArray *)v47 countByEnumeratingWithState:&v71 objects:v82 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v72 != v49) {
            objc_enumerationMutation(v47);
          }
          id v51 = (id)[v41 appendObject:*(void *)(*((void *)&v71 + 1) + 8 * j)];
        }
        uint64_t v48 = [(NSArray *)v47 countByEnumeratingWithState:&v71 objects:v82 count:16];
      }
      while (v48);
    }

    v69->_cachedHash = [v41 hash];
    v21 = v68;
  }
  v52 = v21;
  id v53 = v52[10];
  id v54 = (id)__allAppLayouts;
  objc_sync_enter(v54);
  v55 = [(id)__allAppLayouts member:v52];

  if (!v55)
  {
    [(id)__allAppLayouts addObject:v52];
    v55 = v52;
  }
  objc_sync_exit(v54);

  uint64_t v56 = [v53 copy];
  id v57 = v55[10];
  v55[10] = (id)v56;

  v58 = v55;
  return v58;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBAppLayout *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBAppLayout *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __53__SBAppLayout_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  int v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)succinctDescription
{
  v2 = [(SBAppLayout *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(id)objc_opt_class() homeScreenAppLayout];

  if (v4 == self)
  {
    [v3 appendString:@"HomeScreenAppLayout" withName:0];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__SBAppLayout_succinctDescriptionBuilder__block_invoke;
    v12[3] = &unk_1E6AF9EF0;
    id v13 = v3;
    [(SBAppLayout *)self enumerate:v12];
  }
  int64_t centerConfiguration = self->_centerConfiguration;
  if (centerConfiguration)
  {
    id v6 = @"page";
    if (centerConfiguration != 1) {
      id v6 = 0;
    }
    if (centerConfiguration == 2) {
      int v7 = @"fullScreen";
    }
    else {
      int v7 = v6;
    }
    [v3 appendString:v7 withName:@"centerConfig"];
  }
  id v8 = (id)[v3 appendBool:self->_hidden withName:@"hidden" ifEqualTo:1];
  unint64_t environment = self->_environment;
  if (environment > 3) {
    long long v10 = 0;
  }
  else {
    long long v10 = off_1E6B05388[environment];
  }
  [v3 appendString:v10 withName:@"environment"];
  return v3;
}

- (BOOL)containsAnyItemFromSet:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SBAppLayout_containsAnyItemFromSet___block_invoke;
  v7[3] = &unk_1E6AFD168;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(SBAppLayout *)self enumerate:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

+ (id)homeScreenAppLayout
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBAppLayout_homeScreenAppLayout__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (homeScreenAppLayout_onceToken != -1) {
    dispatch_once(&homeScreenAppLayout_onceToken, block);
  }
  v2 = (void *)homeScreenAppLayout___homeScreenAppLayout;
  return v2;
}

void __53__SBAppLayout_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) configuration];
  if (v2 - 1 >= 4) {
    unint64_t v2 = 0;
  }
  id v3 = *(void **)(a1 + 40);
  id v4 = SBStringForSpaceConfiguration(v2);
  [v3 appendString:v4 withName:@"configuration"];

  id v5 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v12 = [v11 uniqueIdentifier];
        char v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [v11 bundleIdentifier];
        }
        v15 = v14;

        id v16 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v11];
        [v5 setObject:v16 forKey:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v8);
  }

  id v17 = *(void **)(a1 + 40);
  id v18 = [v17 activeMultilinePrefix];
  [v17 appendDictionarySection:v5 withName:@"itemsToLayoutAttributes" multilinePrefix:v18 skipIfEmpty:0];

  unint64_t v19 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v19 > 3) {
    v20 = 0;
  }
  else {
    v20 = off_1E6B05388[v19];
  }
  [*(id *)(a1 + 40) appendString:v20 withName:@"environment"];
  id v21 = (id)[*(id *)(a1 + 40) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 24) withName:@"hidden" ifEqualTo:1];
  unint64_t v22 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v22 > 2) {
    v23 = 0;
  }
  else {
    v23 = off_1E6B053A8[v22];
  }
  [*(id *)(a1 + 40) appendString:v23 withName:@"centerConfiguration"];
  id v24 = (id)[*(id *)(a1 + 40) appendInteger:*(void *)(*(void *)(a1 + 32) + 72) withName:@"preferredDisplayOrdinal"];
  uint64_t v25 = *(void **)(a1 + 40);
  v26 = [*(id *)(a1 + 32) continuousExposeIdentifier];
  [v25 appendString:v26 withName:@"continuousExposeIdentifier"];

  v27 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v28 = *(id *)(*(void *)(a1 + 32) + 112);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        v34 = SBLayoutRoleDescription(objc_msgSend(*(id *)(a1 + 32), "layoutRoleForItem:", v33, (void)v37));
        [v27 setObject:v33 forKey:v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v30);
  }

  v35 = *(void **)(a1 + 40);
  v36 = [v35 activeMultilinePrefix];
  [v35 appendDictionarySection:v27 withName:@"layoutItems" multilinePrefix:v36 skipIfEmpty:0];
}

- (NSString)continuousExposeIdentifier
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__73;
  id v11 = __Block_byref_object_dispose__73;
  id v12 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SBAppLayout_continuousExposeIdentifier__block_invoke;
  v6[3] = &unk_1E6AFD168;
  v6[4] = self;
  v6[5] = &v7;
  [(SBAppLayout *)self enumerate:v6];
  id v3 = [(id)v8[5] allObjects];
  id v4 = [v3 componentsJoinedByString:@"&"];

  _Block_object_dispose(&v7, 8);
  return (NSString *)v4;
}

uint64_t __154__SBAppLayout_initWithItems_centerItem_floatingItem_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (BSEqualObjects()) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = BSEqualObjects() ^ 1;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsWithoutCenterOrFloatingItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay, 0);
  objc_storeStrong((id *)&self->_cachedLastOverlappingModelKey, 0);
  objc_storeStrong((id *)&self->_cachedLastAutoLayoutSpace, 0);
  objc_storeStrong((id *)&self->_itemsToLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_floatingItem, 0);
  objc_storeStrong((id *)&self->_centerItem, 0);
}

- (id)anyLeafAppLayout
{
  return [(SBAppLayout *)self leafAppLayoutForRole:1];
}

- (BOOL)isSplitConfiguration
{
  uint64_t v3 = [(SBAppLayout *)self itemForLayoutRole:1];
  if (v3)
  {
    id v4 = [(SBAppLayout *)self itemForLayoutRole:2];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)containsItemWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBAppLayout_containsItemWithUniqueIdentifier___block_invoke;
  v7[3] = &unk_1E6AFD168;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(SBAppLayout *)self enumerate:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (id)layoutAttributesForItem:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKey:](self->_itemsToLayoutAttributesMap, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t __36__SBAppLayout__preferredWindowScene__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isExternalDisplayWindowScene];
}

uint64_t __36__SBAppLayout__preferredWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene];
}

- (BOOL)containsItemWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBAppLayout_containsItemWithBundleIdentifier___block_invoke;
  v7[3] = &unk_1E6AFD168;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(SBAppLayout *)self enumerate:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (SBAppLayout)appLayoutWithItemsPassingTest:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy__73;
  long long v39 = __Block_byref_object_dispose__73;
  id v40 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __45__SBAppLayout_appLayoutWithItemsPassingTest___block_invoke;
  v32[3] = &unk_1E6B05348;
  id v5 = v4;
  id v33 = v5;
  v34 = &v35;
  [(SBAppLayout *)self enumerate:v32];
  if (BSEqualArrays())
  {
    id v6 = self;
    goto LABEL_45;
  }
  if (![(id)v36[5] count])
  {
    id v6 = 0;
    goto LABEL_45;
  }
  uint64_t v7 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = (id)v36[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        char v13 = [(NSDictionary *)self->_itemsToLayoutAttributesMap objectForKey:v12];
        [v7 setObject:v13 forKey:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v9);
  }

  if (self->_centerItem) {
    uint64_t v14 = objc_msgSend((id)v36[5], "containsObject:");
  }
  else {
    uint64_t v14 = 0;
  }
  if (self->_floatingItem) {
    unsigned int v15 = objc_msgSend((id)v36[5], "containsObject:");
  }
  else {
    unsigned int v15 = 0;
  }
  uint64_t v16 = [(id)v36[5] count];
  int64_t configuration = self->_configuration;
  if ((unint64_t)(configuration - 2) < 3 && (v14 << 63 >> 63) - (unint64_t)v15 + v16 <= 1) {
    int64_t configuration = 1;
  }
  int64_t environment = self->_environment;
  if (v14) {
    int64_t centerConfiguration = self->_centerConfiguration;
  }
  else {
    int64_t centerConfiguration = 0;
  }
  if (self->_centerConfiguration) {
    int64_t v20 = centerConfiguration;
  }
  else {
    int64_t v20 = 0;
  }
  if (environment == 3) {
    int v21 = 0;
  }
  else {
    int v21 = v14;
  }
  if (v21 == 1)
  {
    if ([(id)v36[5] count] == 1)
    {
      LODWORD(v14) = 0;
      int64_t environment = 3;
      int64_t configuration = 1;
    }
    else
    {
      LODWORD(v14) = 1;
    }
  }
  if ([(id)v36[5] count] == 1) {
    unsigned int v22 = v15;
  }
  else {
    unsigned int v22 = 0;
  }
  if (v22 == 1)
  {
    unsigned int v15 = 0;
    int64_t environment = 2;
    int64_t configuration = 1;
  }
  id v23 = objc_alloc((Class)objc_opt_class());
  if (!v14)
  {
    centerItem = 0;
    if (!v15) {
      goto LABEL_41;
    }
LABEL_43:
    floatingItem = self->_floatingItem;
    goto LABEL_44;
  }
  centerItem = self->_centerItem;
  if (v15) {
    goto LABEL_43;
  }
LABEL_41:
  floatingItem = 0;
LABEL_44:
  LOBYTE(v27) = self->_hidden;
  id v6 = (SBAppLayout *)[v23 initWithItems:v36[5] centerItem:centerItem floatingItem:floatingItem configuration:configuration itemsToLayoutAttributes:v7 centerConfiguration:v20 environment:environment hidden:v27 preferredDisplayOrdinal:self->_preferredDisplayOrdinal];

LABEL_45:
  _Block_object_dispose(&v35, 8);

  return v6;
}

- (NSDictionary)itemsToLayoutAttributesMap
{
  return self->_itemsToLayoutAttributesMap;
}

- (void)setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:(id)a3
{
}

- (id)preferredDisplayIdentity
{
  id v2 = [(SBAppLayout *)self _preferredWindowScene];
  uint64_t v3 = [v2 _sbDisplayConfiguration];
  id v4 = [v3 identity];

  return v4;
}

- (id)_preferredWindowScene
{
  int64_t v2 = [(SBAppLayout *)self preferredDisplayOrdinal];
  uint64_t v3 = [(id)SBApp windowSceneManager];
  id v4 = [v3 connectedWindowScenes];
  id v5 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_106);

  id v6 = [(id)SBApp windowSceneManager];
  uint64_t v7 = [v6 connectedWindowScenes];
  id v8 = objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_108_0);

  if (v8) {
    BOOL v9 = v2 == 1;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v5;
  }
  id v11 = v10;

  return v11;
}

- (SBAppLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBAppLayout.m" lineNumber:263 description:@"use -initWithItemsForLayoutRoles:configuration:environment:"];

  return 0;
}

- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 environment:(int64_t)a5 preferredDisplayOrdinal:(int64_t)a6
{
  return [(SBAppLayout *)self initWithItemsForLayoutRoles:a3 configuration:a4 environment:a5 hidden:0 preferredDisplayOrdinal:a6];
}

- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 environment:(int64_t)a5 hidden:(BOOL)a6 preferredDisplayOrdinal:(int64_t)a7
{
  return [(SBAppLayout *)self initWithItemsForLayoutRoles:a3 configuration:a4 centerConfiguration:0 environment:a5 hidden:a6 preferredDisplayOrdinal:a7];
}

- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 centerConfiguration:(int64_t)a5 environment:(int64_t)a6 hidden:(BOOL)a7 preferredDisplayOrdinal:(int64_t)a8
{
  return [(SBAppLayout *)self initWithItemsForLayoutRoles:a3 configuration:a4 itemsToLayoutAttributes:MEMORY[0x1E4F1CC08] centerConfiguration:a5 environment:a6 hidden:a7 preferredDisplayOrdinal:a8];
}

void __154__SBAppLayout_initWithItems_centerItem_floatingItem_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F28F58]) initWithOptions:5];
  [v2 setIsEqualFunction:_SBAppLayoutContentInspectingPointerFunctionIsEqual];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithPointerFunctions:v2 capacity:100];
  v1 = (void *)__allAppLayouts;
  __allAppLayouts = v0;
}

- (SBAppLayout)initWithPlistRepresentation:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = objc_opt_class();
  id v6 = v3;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    BOOL v9 = [v8 objectForKey:@"RolesAndItems"];
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v16 = v12;

    id v17 = [v8 objectForKey:@"Config"];
    uint64_t v18 = objc_opt_class();
    id v19 = v17;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        int64_t v20 = v19;
      }
      else {
        int64_t v20 = 0;
      }
    }
    else
    {
      int64_t v20 = 0;
    }
    id v21 = v20;

    uint64_t v73 = [v21 integerValue];
    unsigned int v22 = [v8 objectForKey:@"CenterConfig"];
    uint64_t v23 = objc_opt_class();
    id v24 = v22;
    if (v23)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = 0;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    id v14 = v25;

    if (v14) {
      uint64_t v72 = [v14 integerValue];
    }
    else {
      uint64_t v72 = 0;
    }
    v26 = [v8 objectForKey:@"Environment"];
    uint64_t v27 = objc_opt_class();
    id v28 = v26;
    if (v27)
    {
      if (objc_opt_isKindOfClass()) {
        long long v29 = v28;
      }
      else {
        long long v29 = 0;
      }
    }
    else
    {
      long long v29 = 0;
    }
    id v30 = v29;

    if (v30) {
      uint64_t v71 = [v30 integerValue];
    }
    else {
      uint64_t v71 = 1;
    }
    long long v31 = [v8 objectForKey:@"Hidden"];
    uint64_t v32 = objc_opt_class();
    id v33 = v31;
    if (v32)
    {
      if (objc_opt_isKindOfClass()) {
        v34 = v33;
      }
      else {
        v34 = 0;
      }
    }
    else
    {
      v34 = 0;
    }
    id v35 = v34;

    unsigned int v70 = [v35 BOOLValue];
    v36 = [v8 objectForKey:@"PreferredDisplayOrdinal"];
    uint64_t v37 = objc_opt_class();
    id v38 = v36;
    if (v37)
    {
      if (objc_opt_isKindOfClass()) {
        long long v39 = v38;
      }
      else {
        long long v39 = 0;
      }
    }
    else
    {
      long long v39 = 0;
    }
    id v40 = v39;

    uint64_t v69 = [v40 integerValue];
  }
  else
  {
    uint64_t v13 = objc_opt_class();
    id v14 = v6;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = 0;
      }
    }
    else
    {
      unsigned int v15 = 0;
    }
    id v16 = v15;
    uint64_t v69 = 0;
    unsigned int v70 = 0;
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    uint64_t v71 = 1;
  }
  long long v74 = v8;
  long long v76 = v6;
  long long v77 = v4;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v41 = v16;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    char v44 = 0;
    uint64_t v45 = *(void *)v80;
LABEL_52:
    uint64_t v46 = 0;
    while (1)
    {
      if (*(void *)v80 != v45) {
        objc_enumerationMutation(v41);
      }
      uint64_t v47 = *(void **)(*((void *)&v79 + 1) + 8 * v46);
      uint64_t v48 = objc_opt_class();
      id v49 = v47;
      if (v48) {
        id v50 = (objc_opt_isKindOfClass() & 1) != 0 ? v49 : 0;
      }
      else {
        id v50 = 0;
      }
      id v51 = v50;

      if (v51 && (unint64_t)[v51 count] >= 2)
      {
        v52 = [v51 objectAtIndexedSubscript:0];
        uint64_t v53 = objc_opt_class();
        id v54 = v52;
        if (v53) {
          id v55 = (objc_opt_isKindOfClass() & 1) != 0 ? v54 : 0;
        }
        else {
          id v55 = 0;
        }
        id v56 = v55;

        v58 = [SBDisplayItem alloc];
        v59 = [v51 objectAtIndexedSubscript:1];
        id v57 = [(SBDisplayItem *)v58 initWithPlistRepresentation:v59];
      }
      else
      {
        id v56 = 0;
        id v57 = 0;
      }
      if ((unint64_t)[v51 count] < 3)
      {
        v62 = 0;
      }
      else
      {
        v60 = [SBDisplayItemLayoutAttributes alloc];
        v61 = [v51 objectAtIndex:2];
        v62 = [(SBDisplayItemLayoutAttributes *)v60 initWithPlistRepresentation:v61];
      }
      BOOL v63 = !v56 || v57 == 0;
      BOOL v64 = !v63;
      if (v63)
      {
        char v44 = 1;
      }
      else
      {
        [v78 setObject:v57 forKeyedSubscript:v56];
        if (v62) {
          [v77 setObject:v62 forKey:v57];
        }
      }

      if (!v64) {
        break;
      }
      if (v43 == ++v46)
      {
        uint64_t v43 = [v41 countByEnumeratingWithState:&v79 objects:v83 count:16];
        if (v43) {
          goto LABEL_52;
        }
        break;
      }
    }
  }
  else
  {
    char v44 = 0;
  }

  if (!v41 || (v44 & 1) != 0)
  {

    id v67 = 0;
    id v66 = v77;
    v65 = v78;
  }
  else
  {
    id v66 = v77;
    v65 = v78;
    id v67 = [(SBAppLayout *)self initWithItemsForLayoutRoles:v78 configuration:v73 itemsToLayoutAttributes:v77 centerConfiguration:v72 environment:v71 hidden:v70 preferredDisplayOrdinal:v69];
  }

  return v67;
}

- (id)plistRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __34__SBAppLayout_plistRepresentation__block_invoke;
  unsigned int v15 = &unk_1E6AF4F20;
  id v16 = self;
  id v17 = v3;
  id v4 = v3;
  [(SBAppLayout *)self enumerate:&v12];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", self->_configuration, v12, v13, v14, v15, v16);
  [v5 setObject:v6 forKey:@"Config"];

  uint64_t v7 = [NSNumber numberWithInteger:self->_centerConfiguration];
  [v5 setObject:v7 forKey:@"CenterConfig"];

  id v8 = [NSNumber numberWithInteger:self->_environment];
  [v5 setObject:v8 forKey:@"Environment"];

  [v5 setObject:v4 forKey:@"RolesAndItems"];
  BOOL v9 = [NSNumber numberWithBool:self->_hidden];
  [v5 setObject:v9 forKey:@"Hidden"];

  uint64_t v10 = [NSNumber numberWithInteger:self->_preferredDisplayOrdinal];
  [v5 setObject:v10 forKey:@"PreferredDisplayOrdinal"];

  return v5;
}

void __34__SBAppLayout_plistRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v10 = (id)objc_opt_new();
  id v6 = [NSNumber numberWithInteger:a2];
  [v10 addObject:v6];

  uint64_t v7 = [v5 plistRepresentation];
  [v10 addObject:v7];

  id v8 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v5];

  BOOL v9 = [v8 plistRepresentation];
  [v10 addObject:v9];

  [*(id *)(a1 + 40) addObject:v10];
}

+ (SBAppLayout)appLayoutWithProtobufRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = objc_opt_new();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = -[SBPBAppLayout layoutConfiguration]((uint64_t)v3) - 1;
  if (v7 < 4) {
    uint64_t v8 = v7 + 1;
  }
  else {
    uint64_t v8 = 0;
  }
  BOOL v9 = -[SBPBAppLayout displayItems]((uint64_t)v3);
  v59 = v4;
  v60 = v9;
  if (![v9 count])
  {
    uint64_t v13 = v8;
    id v14 = -[SBPBAppLayout primaryDisplayItem]((uint64_t)v3);
    id v11 = +[SBDisplayItem displayItemWithProtobufRepresentation:v14];

    if (!v11)
    {
      uint64_t v12 = 0;
LABEL_70:
      BOOL v9 = v60;
      goto LABEL_71;
    }
    unsigned int v15 = [NSNumber numberWithInteger:1];
    [v4 setObject:v11 forKey:v15];

    if (-[SBPBAppLayout hasPrimaryLayoutAttributes]((BOOL)v3))
    {
      -[SBPBAppLayout primaryLayoutAttributes]((uint64_t)v3);
      id v16 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
      id v17 = +[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:v16];
      [v5 setObject:v17 forKey:v11];
    }
    else
    {
      id v16 = objc_alloc_init(SBDisplayItemLayoutAttributes);
      [v5 setObject:v16 forKey:v11];
    }

    if (-[SBPBAppLayout hasSecondaryDisplayItem]((BOOL)v3))
    {
      uint64_t v32 = -[SBPBAppLayout secondaryDisplayItem]((uint64_t)v3);
      id v33 = +[SBDisplayItem displayItemWithProtobufRepresentation:v32];

      if (v33)
      {
        unsigned int v34 = -[SBPBAppLayout secondaryDisplayItemRole]((uint64_t)v3) - 1;
        if (v34 > 3) {
          id v35 = &SBLayoutRoleUndefined;
        }
        else {
          id v35 = off_1E6B05368[v34];
        }
        v36 = [NSNumber numberWithInteger:*v35];
        [v4 setObject:v33 forKey:v36];
      }
      uint64_t v37 = v11;
      if (-[SBPBAppLayout hasSecondaryLayoutAttributes]((BOOL)v3))
      {
        -[SBPBAppLayout secondaryLayoutAttributes]((uint64_t)v3);
        id v38 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
        long long v39 = +[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:v38];
        [v5 setObject:v39 forKey:v33];
      }
      else
      {
        id v38 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        [v5 setObject:v38 forKey:v33];
      }
      id v11 = v37;
    }
    if (!-[SBPBAppLayout hasCenterDisplayItem]((BOOL)v3))
    {
      id v4 = v59;
LABEL_63:

      unsigned int v48 = -[SBPBAppLayout environment]((uint64_t)v3) - 1;
      if (v48 > 2) {
        uint64_t v49 = 1;
      }
      else {
        uint64_t v49 = qword_1D8FD1DF8[v48];
      }
      int v50 = -[SBPBAppLayout centerConfiguration]((uint64_t)v3);
      if (v50 == 2) {
        uint64_t v51 = 2;
      }
      else {
        uint64_t v51 = v50 == 1;
      }
      BOOL v52 = -[SBPBAppLayout hidden]((BOOL)v3);
      uint64_t v12 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v4, v8, v5, v51, v49, v52, -[SBPBAppLayout preferredDisplayOrdinal]((uint64_t)v3));
      [(SBAppLayout *)v12 setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:v6];
      goto LABEL_70;
    }
    id v57 = v6;
    id v40 = -[SBPBAppLayout centerDisplayItem]((uint64_t)v3);
    uint64_t v18 = +[SBDisplayItem displayItemWithProtobufRepresentation:v40];

    if (v18)
    {
      unsigned int v41 = -[SBPBAppLayout centerDisplayItemRole]((uint64_t)v3) - 1;
      if (v41 > 3) {
        uint64_t v42 = &SBLayoutRoleUndefined;
      }
      else {
        uint64_t v42 = off_1E6B05368[v41];
      }
      uint64_t v43 = [NSNumber numberWithInteger:*v42];
      [v59 setObject:v18 forKey:v43];
    }
    v58 = v5;
    if (-[SBPBAppLayout hasCenterLayoutAttributes]((BOOL)v3))
    {
      -[SBPBAppLayout centerLayoutAttributes]((uint64_t)v3);
      char v44 = v5;
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v45 = +[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:v19];
      [v44 setObject:v45 forKey:v18];
    }
    else
    {
      uint64_t v46 = objc_alloc_init(SBDisplayItemLayoutAttributes);
      uint64_t v47 = v5;
      id v19 = v46;
      [v47 setObject:v46 forKey:v18];
    }
    id v4 = v59;
    uint64_t v8 = v13;
LABEL_62:

    id v6 = v57;
    id v5 = v58;
    goto LABEL_63;
  }
  id v10 = -[SBPBAppLayout centerDisplayItem]((uint64_t)v3);
  if (v10)
  {
    id v11 = +[SBDisplayItem displayItemWithProtobufRepresentation:v10];
    if (!v11)
    {

      uint64_t v12 = 0;
      goto LABEL_71;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v57 = v6;
  v58 = v5;

  uint64_t v18 = -[SBPBAppLayout displayItemLayoutAttributes]((uint64_t)v3);
  -[SBPBAppLayout displayItemLayoutAttributesForNonPreferredDisplays]((uint64_t)v3);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (![v9 count]) {
    goto LABEL_62;
  }
  id v56 = v11;
  uint64_t v54 = v8;
  id v55 = v3;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  while (1)
  {
    unsigned int v22 = [v9 objectAtIndex:v21];
    uint64_t v23 = +[SBDisplayItem displayItemWithProtobufRepresentation:v22];
    if (!v23) {
      break;
    }
    id v24 = (void *)v23;
    if (v21 >= [v18 count]
      || ([v18 objectAtIndex:v21], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v27 = objc_alloc_init(SBDisplayItemLayoutAttributes);
      if (!v27) {
        goto LABEL_34;
      }
LABEL_20:
      if (v56 && ([v56 isEqual:v24] & 1) != 0)
      {
        uint64_t v28 = 4;
      }
      else
      {
        if (v20 <= 1) {
          uint64_t v28 = v20 + 1;
        }
        else {
          uint64_t v28 = v20 + 3;
        }
        ++v20;
      }
      long long v29 = [NSNumber numberWithInteger:v28];
      [v4 setObject:v24 forKey:v29];

      [v58 setObject:v27 forKey:v24];
      if (v21 < [v19 count])
      {
        id v30 = [v19 objectAtIndex:v21];
        if (!v30
          || (+[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:v30], (long long v31 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue()) == 0))
        {
LABEL_32:
          long long v31 = v27;
        }
        [v57 setObject:v31 forKey:v24];

        id v4 = v59;
        goto LABEL_34;
      }
      id v30 = 0;
      goto LABEL_32;
    }
    v26 = (void *)v25;
    uint64_t v27 = +[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:v25];

    if (v27) {
      goto LABEL_20;
    }
LABEL_34:
    BOOL v9 = v60;

    if (!v27) {
      goto LABEL_44;
    }
    if (++v21 >= [v60 count])
    {
      uint64_t v8 = v54;
      id v3 = v55;
      id v11 = v56;
      goto LABEL_62;
    }
  }

LABEL_44:
  uint64_t v12 = 0;
  id v3 = v55;
  id v6 = v57;
  id v5 = v58;
LABEL_71:

  return v12;
}

- (id)protobufRepresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(SBPBAppLayout);
  int64_t v4 = [(SBAppLayout *)self configuration];
  if ((unint64_t)(v4 - 1) < 4) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  -[SBPBAppLayout setLayoutConfiguration:]((uint64_t)v3, v5);
  int64_t v6 = [(SBAppLayout *)self environment];
  if (v6 == 3) {
    int v7 = 3;
  }
  else {
    int v7 = v6 == 2;
  }
  -[SBPBAppLayout setEnvironment:]((uint64_t)v3, v7);
  int64_t v8 = [(SBAppLayout *)self centerConfiguration];
  if (v8 == 2) {
    int v9 = 2;
  }
  else {
    int v9 = v8 == 1;
  }
  -[SBPBAppLayout setCenterConfiguration:]((uint64_t)v3, v9);
  id v10 = [(SBAppLayout *)self itemForLayoutRole:1];
  id v11 = [v10 protobufRepresentation];
  -[SBPBAppLayout setPrimaryDisplayItem:]((uint64_t)v3, v11);

  [(SBPBAppLayout *)(uint64_t)v3 setHidden:[(SBAppLayout *)self isHidden]];
  [(SBPBAppLayout *)(uint64_t)v3 setPreferredDisplayOrdinal:[(SBAppLayout *)self preferredDisplayOrdinal]];
  uint64_t v12 = [(SBAppLayout *)self itemForLayoutRole:2];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = [v12 protobufRepresentation];
    -[SBPBAppLayout setSecondaryDisplayItem:]((uint64_t)v3, v14);

    -[SBPBAppLayout setSecondaryDisplayItemRole:]((uint64_t)v3, 2);
  }
  unsigned int v15 = [(SBAppLayout *)self itemForLayoutRole:4];
  id v16 = v15;
  if (v15)
  {
    id v17 = [v15 protobufRepresentation];
    -[SBPBAppLayout setCenterDisplayItem:]((uint64_t)v3, v17);

    -[SBPBAppLayout setCenterDisplayItemRole:]((uint64_t)v3, 4);
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __37__SBAppLayout_protobufRepresentation__block_invoke;
  v33[3] = &unk_1E6AF4F20;
  uint64_t v18 = v3;
  unsigned int v34 = v18;
  id v35 = self;
  [(SBAppLayout *)self enumerate:v33];
  cachedDisplayItemLayoutAttributesForNonPreferredDisplay = self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay;
  if (cachedDisplayItemLayoutAttributesForNonPreferredDisplay)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v20 = [(NSDictionary *)cachedDisplayItemLayoutAttributesForNonPreferredDisplay allKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = [(NSDictionary *)self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          v26 = [v25 protobufRepresentation];
          -[SBPBAppLayout addDisplayItemLayoutAttributesForNonPreferredDisplay:]((uint64_t)v18, v26);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v22);
    }
  }
  uint64_t v27 = v18;

  return v27;
}

void __37__SBAppLayout_protobufRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = [v5 protobufRepresentation];
  -[SBPBAppLayout addDisplayItems:](*(void *)(a1 + 32), v8);
  int64_t v6 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKey:v5];

  if (v6)
  {
    int v7 = [v6 protobufRepresentation];
    -[SBPBAppLayout addDisplayItemLayoutAttributes:](*(void *)(a1 + 32), v7);
    switch(a2)
    {
      case 1:
        -[SBPBAppLayout setPrimaryLayoutAttributes:](*(void *)(a1 + 32), v7);
        break;
      case 2:
        -[SBPBAppLayout setSecondaryLayoutAttributes:](*(void *)(a1 + 32), v7);
        break;
      case 4:
        -[SBPBAppLayout setCenterLayoutAttributes:](*(void *)(a1 + 32), v7);
        break;
    }
  }
}

void __34__SBAppLayout_homeScreenAppLayout__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v2 = [v1 initWithItemsForLayoutRoles:MEMORY[0x1E4F1CC08] configuration:0 environment:1 preferredDisplayOrdinal:0];
  id v3 = (void *)homeScreenAppLayout___homeScreenAppLayout;
  homeScreenAppLayout___homeScreenAppLayout = v2;
}

- (id)latestItemPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__73;
  unint64_t v20 = __Block_byref_object_dispose__73;
  id v21 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = -1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __37__SBAppLayout_latestItemPassingTest___block_invoke;
  v10[3] = &unk_1E6B052A8;
  int64_t v6 = v5;
  id v11 = v6;
  uint64_t v13 = &v16;
  id v14 = v15;
  id v7 = v4;
  id v12 = v7;
  [(SBAppLayout *)v6 enumerate:v10];
  id v8 = (id)v17[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __37__SBAppLayout_latestItemPassingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForItem:");
  uint64_t v6 = [v5 lastInteractionTime];

  if ((!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
     || v6 > *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    && (*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
  }
}

- (BOOL)containsAnyItemFromAppLayout:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [a3 allItems];
  uint64_t v6 = [v4 setWithArray:v5];
  LOBYTE(self) = [(SBAppLayout *)self containsAnyItemFromSet:v6];

  return (char)self;
}

- (BOOL)containsAllItemsFromSet:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = [(SBAppLayout *)self allItems];
  id v7 = [v4 setWithArray:v6];
  char v8 = [v5 isSubsetOfSet:v7];

  return v8;
}

- (BOOL)containsAllItemsFromAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__SBAppLayout_containsAllItemsFromAppLayout___block_invoke;
  v6[3] = &unk_1E6AFD168;
  v6[4] = self;
  v6[5] = &v7;
  [v4 enumerate:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

uint64_t __45__SBAppLayout_containsAllItemsFromAppLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "containsItem:");
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __28__SBAppLayout_zOrderedItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 80);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  uint64_t v8 = [v7 lastInteractionTime];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v6];

  uint64_t v10 = [v9 lastInteractionTime];
  if (v8 > v10) {
    return -1;
  }
  else {
    return v8 < v10;
  }
}

- (id)zOrderedLeafAppLayouts
{
  id v3 = [(SBAppLayout *)self zOrderedItems];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SBAppLayout_zOrderedLeafAppLayouts__block_invoke;
  v6[3] = &unk_1E6B052D0;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "bs_compactMap:", v6);

  return v4;
}

uint64_t __37__SBAppLayout_zOrderedLeafAppLayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) leafAppLayoutForItem:a2];
}

- (BOOL)isFullScreen
{
  id v3 = [(SBAppLayout *)self itemForLayoutRole:1];
  if (v3)
  {
    id v4 = [(SBAppLayout *)self itemForLayoutRole:2];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isCenterOverFull
{
  if ([(SBAppLayout *)self isSplitConfiguration]) {
    return 0;
  }
  id v4 = [(SBAppLayout *)self itemForLayoutRole:4];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)isCenterOverSplit
{
  if (![(SBAppLayout *)self isSplitConfiguration]) {
    return 0;
  }
  BOOL v3 = [(SBAppLayout *)self itemForLayoutRole:4];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_leafAppLayoutForItem:(id)a3 role:(int64_t)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4 == 3)
    {
      int64_t centerConfiguration = 0;
      int64_t environment = 2;
    }
    else if (a4 == 4 || (int64_t environment = self->_environment, environment == 3))
    {
      int64_t centerConfiguration = self->_centerConfiguration;
      int64_t environment = 3;
    }
    else
    {
      int64_t centerConfiguration = 0;
    }
    itemsToLayoutAttributesMap = self->_itemsToLayoutAttributesMap;
    id v9 = a3;
    uint64_t v10 = [(NSDictionary *)itemsToLayoutAttributesMap objectForKey:v9];
    id v11 = (void *)[v10 copy];

    id v12 = [SBAppLayout alloc];
    uint64_t v13 = [NSNumber numberWithInteger:1];
    id v19 = v13;
    v20[0] = v9;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v17 = v9;
    uint64_t v18 = v11;
    unsigned int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    uint64_t v7 = [(SBAppLayout *)v12 initWithItemsForLayoutRoles:v14 configuration:1 itemsToLayoutAttributes:v15 centerConfiguration:centerConfiguration environment:environment hidden:self->_hidden preferredDisplayOrdinal:self->_preferredDisplayOrdinal];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)appLayoutByInsertingLeafAppLayout:(id)a3 inRole:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 itemForLayoutRole:1];
  uint64_t v8 = [v6 layoutAttributesForItem:v7];

  id v9 = [(SBAppLayout *)self appLayoutByInsertingItem:v7 withLayoutAttributes:v8 inLayoutRole:a4];

  return v9;
}

void __29__SBAppLayout_leafAppLayouts__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "leafAppLayoutForItem:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v2];
}

- (id)appLayoutByModifyingHiddenState:(BOOL)a3
{
  BOOL hidden = self->_hidden;
  if (hidden == a3)
  {
    BOOL v4 = self;
  }
  else
  {
    if ((!hidden ^ a3))
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v5 = !self->_hidden && a3;
      LOBYTE(v7) = v5;
      BOOL v4 = [[SBAppLayout alloc] initWithItems:self->_items centerItem:self->_centerItem floatingItem:self->_floatingItem configuration:self->_configuration itemsToLayoutAttributes:self->_itemsToLayoutAttributesMap centerConfiguration:self->_centerConfiguration environment:self->_environment hidden:v7 preferredDisplayOrdinal:self->_preferredDisplayOrdinal];
    }
    [(SBAppLayout *)v4 setCachedLastAutoLayoutSpace:0];
    [(SBAppLayout *)v4 setCachedLastOverlappingModelKey:0];
  }
  return v4;
}

- (id)appLayoutByModifyingEnvironment:(int64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_environment == a3)
  {
    BOOL v4 = self;
  }
  else
  {
    id v6 = [(SBAppLayout *)self itemForLayoutRole:1];
    uint64_t v7 = [SBAppLayout alloc];
    uint64_t v8 = [NSNumber numberWithInteger:1];
    id v11 = v8;
    v12[0] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    BOOL v4 = [(SBAppLayout *)v7 initWithItemsForLayoutRoles:v9 configuration:1 itemsToLayoutAttributes:self->_itemsToLayoutAttributesMap centerConfiguration:0 environment:a3 hidden:0 preferredDisplayOrdinal:self->_preferredDisplayOrdinal];
  }
  return v4;
}

- (id)appLayoutByModifyingConfiguration:(int64_t)a3
{
  if (self->_configuration == a3)
  {
    BOOL v4 = self;
  }
  else
  {
    id v6 = objc_opt_new();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__SBAppLayout_appLayoutByModifyingConfiguration___block_invoke;
    v9[3] = &unk_1E6B002B8;
    v9[4] = self;
    id v10 = v6;
    id v7 = v6;
    SBLayoutRoleEnumerateValidRoles(v9);
    BOOL v4 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v7 configuration:a3 itemsToLayoutAttributes:self->_itemsToLayoutAttributesMap centerConfiguration:self->_centerConfiguration environment:self->_environment hidden:self->_hidden preferredDisplayOrdinal:self->_preferredDisplayOrdinal];
  }
  return v4;
}

void __49__SBAppLayout_appLayoutByModifyingConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
  if (v6)
  {
    BOOL v4 = *(void **)(a1 + 40);
    BOOL v5 = [NSNumber numberWithInteger:a2];
    [v4 setObject:v6 forKey:v5];
  }
}

- (id)appLayoutByModifyingPreferredDisplayOrdinal:(int64_t)a3
{
  if (self->_preferredDisplayOrdinal == a3)
  {
    BOOL v4 = self;
  }
  else
  {
    id v6 = [SBAppLayout alloc];
    LOBYTE(v8) = self->_hidden;
    BOOL v4 = [(SBAppLayout *)v6 initWithItems:self->_items centerItem:self->_centerItem floatingItem:self->_floatingItem configuration:self->_configuration itemsToLayoutAttributes:self->_itemsToLayoutAttributesMap centerConfiguration:self->_centerConfiguration environment:self->_environment hidden:v8 preferredDisplayOrdinal:a3];
  }
  return v4;
}

- (id)appLayoutByInsertingItem:(id)a3 withLayoutAttributes:(id)a4 inLayoutRole:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(SBAppLayout *)self itemForLayoutRole:a5];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    uint64_t v13 = self;
    goto LABEL_51;
  }
  id v14 = (void *)[(NSArray *)self->_itemsWithoutCenterOrFloatingItems mutableCopy];
  unsigned int v15 = self->_centerItem;
  uint64_t v16 = self->_floatingItem;
  id v17 = (void *)[(NSDictionary *)self->_itemsToLayoutAttributesMap mutableCopy];
  if ([v14 containsObject:v9])
  {
    [v14 removeObject:v9];
    if ([v14 count]) {
      goto LABEL_11;
    }
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = SBLayoutRoleDescription(a5);
    [v18 handleFailureInMethod:a2, self, @"SBAppLayout.m", 1002, @"Moving %@ to %@ would result in an app layout without a primary item", v9, v36 object file lineNumber description];
  }
  else if ([v9 isEqual:v15])
  {
    uint64_t v18 = v15;
    unsigned int v15 = 0;
  }
  else
  {
    if (![v9 isEqual:v16]) {
      goto LABEL_11;
    }
    uint64_t v18 = v16;
    uint64_t v16 = 0;
  }

LABEL_11:
  [v17 removeObjectForKey:v9];
  if (SBLayoutRoleIsValidForSplitView(a5))
  {
    if (a5 == 1)
    {
      unint64_t v19 = 0;
    }
    else if (a5 == 2)
    {
      unint64_t v19 = 1;
    }
    else
    {
      unint64_t v22 = [v14 count];
      if (v22 >= a5 - 3) {
        unint64_t v19 = a5 - 3;
      }
      else {
        unint64_t v19 = v22;
      }
    }
    if ([v14 count] == 1 && !v19)
    {
      uint64_t v23 = v14;
      id v24 = v9;
      unint64_t v25 = 0;
      goto LABEL_33;
    }
    if ([v14 count] <= v19)
    {
      uint64_t v23 = v14;
      id v24 = v9;
      unint64_t v25 = v19;
LABEL_33:
      [v23 insertObject:v24 atIndex:v25];
      if (!v10) {
        goto LABEL_34;
      }
LABEL_31:
      [v17 setObject:v10 forKey:v9];
      goto LABEL_35;
    }
    [v14 replaceObjectAtIndex:v19 withObject:v9];
  }
  else
  {
    if (a5 == 4)
    {
      unint64_t v20 = (SBDisplayItem *)v9;

      unsigned int v15 = v20;
      if (!v10) {
        goto LABEL_34;
      }
      goto LABEL_31;
    }
    if (a5 == 3)
    {
      id v21 = (SBDisplayItem *)v9;

      uint64_t v16 = v21;
      if (!v10) {
        goto LABEL_34;
      }
      goto LABEL_31;
    }
  }
  if (v10) {
    goto LABEL_31;
  }
LABEL_34:
  v26 = objc_alloc_init(SBDisplayItemLayoutAttributes);
  [v17 setObject:v26 forKey:v9];

LABEL_35:
  uint64_t v27 = (void *)[v14 mutableCopy];
  objc_msgSend(v27, "bs_safeAddObject:", v15);
  objc_msgSend(v27, "bs_safeAddObject:", v16);
  int64_t configuration = self->_configuration;
  if ((unint64_t)[v14 count] < 2 || configuration >= 2)
  {
    uint64_t v29 = [v14 count];
    if (configuration > 1 && v29 == 1) {
      int64_t configuration = 1;
    }
  }
  else
  {
    int64_t configuration = 3;
  }
  if (self->_centerConfiguration) {
    BOOL v31 = 1;
  }
  else {
    BOOL v31 = v15 == 0;
  }
  if (v31) {
    int64_t centerConfiguration = self->_centerConfiguration;
  }
  else {
    int64_t centerConfiguration = 1;
  }
  id v33 = [SBAppLayout alloc];
  LOBYTE(v35) = self->_hidden;
  uint64_t v13 = [(SBAppLayout *)v33 initWithItems:v27 centerItem:v15 floatingItem:v16 configuration:configuration itemsToLayoutAttributes:v17 centerConfiguration:centerConfiguration environment:self->_environment hidden:v35 preferredDisplayOrdinal:self->_preferredDisplayOrdinal];

LABEL_51:
  return v13;
}

- (id)appLayoutByRemovingItemInLayoutRole:(int64_t)a3
{
  BOOL v5 = [(SBAppLayout *)self itemForLayoutRole:"itemForLayoutRole:"];
  if (v5)
  {
    id v6 = (void *)[(NSArray *)self->_itemsWithoutCenterOrFloatingItems mutableCopy];
    id v7 = self->_centerItem;
    uint64_t v8 = self->_floatingItem;
    id v9 = (void *)[(NSDictionary *)self->_itemsToLayoutAttributesMap mutableCopy];
    if (SBLayoutRoleIsValidForSplitView(a3))
    {
      if (a3 == 1)
      {
        unint64_t v10 = 0;
      }
      else if (a3 == 2)
      {
        unint64_t v10 = 1;
      }
      else
      {
        unint64_t v12 = [v6 count];
        if (v12 >= a3 - 3) {
          unint64_t v10 = a3 - 3;
        }
        else {
          unint64_t v10 = v12;
        }
      }
      if ([v6 count] > v10) {
        [v6 removeObjectAtIndex:v10];
      }
    }
    else if (a3 == 4)
    {

      id v7 = 0;
    }
    else if (a3 == 3)
    {

      uint64_t v8 = 0;
    }
    [v9 removeObjectForKey:v5];
    uint64_t v13 = (void *)[v6 mutableCopy];
    objc_msgSend(v13, "bs_safeAddObject:", v7);
    objc_msgSend(v13, "bs_safeAddObject:", v8);
    int64_t configuration = self->_configuration;
    if ([v6 count] == 1 && configuration > 1)
    {
      int64_t configuration = 1;
    }
    else
    {
      uint64_t v15 = [v6 count];
      if (configuration > 0 && v15 == 0) {
        int64_t configuration = 0;
      }
    }
    if (self->_centerConfiguration == 1 && v7 == 0) {
      int64_t centerConfiguration = 0;
    }
    else {
      int64_t centerConfiguration = self->_centerConfiguration;
    }
    unint64_t v19 = [SBAppLayout alloc];
    LOBYTE(v21) = self->_hidden;
    id v11 = [(SBAppLayout *)v19 initWithItems:v13 centerItem:v7 floatingItem:v8 configuration:configuration itemsToLayoutAttributes:v9 centerConfiguration:centerConfiguration environment:self->_environment hidden:v21 preferredDisplayOrdinal:self->_preferredDisplayOrdinal];
  }
  else
  {
    id v11 = self;
  }

  return v11;
}

- (id)flippedAppLayout
{
  BOOL v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __31__SBAppLayout_flippedAppLayout__block_invoke;
  uint64_t v16 = &unk_1E6B00330;
  id v17 = self;
  id v18 = v3;
  id v19 = v4;
  id v5 = v4;
  id v6 = v3;
  SBLayoutRoleEnumerateValidRoles(&v13);
  int64_t v7 = [(SBAppLayout *)self configuration];
  uint64_t v8 = 4;
  if (v7 != 2) {
    uint64_t v8 = v7;
  }
  if (v7 == 4) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v8;
  }
  unint64_t v10 = [SBAppLayout alloc];
  id v11 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v10, "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v6, v9, v5, self->_centerConfiguration, 1, self->_hidden, self->_preferredDisplayOrdinal, v13, v14, v15, v16, v17);

  return v11;
}

void __31__SBAppLayout_flippedAppLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
  if (v4)
  {
    unint64_t v10 = v4;
    id v5 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v4];
    if (a2 == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = a2;
    }
    if (a2 == 1) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [NSNumber numberWithInteger:v7];
    [v8 setObject:v10 forKey:v9];

    if (v5) {
      [*(id *)(a1 + 48) setObject:v5 forKey:v10];
    }

    BOOL v4 = v10;
  }
}

- (id)appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:(id)a3 multitaskingSupported:(BOOL)a4
{
  BOOL v4 = a4;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(SBAppLayout *)self environment] == 2 && !v4)
  {
    uint64_t v7 = [(SBAppLayout *)self appLayoutByModifyingEnvironment:1];
    v26[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

    goto LABEL_13;
  }
  if ([(SBAppLayout *)self isFullScreen])
  {
    id v8 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = [(SBAppLayout *)self itemForLayoutRole:1];
  unint64_t v10 = [v9 bundleIdentifier];
  id v11 = [v6 applicationWithBundleIdentifier:v10];
  int v12 = [v11 isMedusaCapable];

  uint64_t v13 = [(SBAppLayout *)self itemForLayoutRole:2];
  uint64_t v14 = [v13 bundleIdentifier];
  uint64_t v15 = [v6 applicationWithBundleIdentifier:v14];
  int v16 = [v15 isMedusaCapable];

  int v17 = v12 & v16 & v4;
  if (v17 == 1)
  {
    id v8 = [(SBAppLayout *)self itemForLayoutRole:5];

    if (!v8) {
      goto LABEL_13;
    }
    char v18 = 0;
  }
  else
  {
    char v18 = 1;
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v17)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __107__SBAppLayout_appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController_multitaskingSupported___block_invoke;
    v25[3] = &unk_1E6AF4B38;
    v25[4] = self;
    unint64_t v20 = [(SBAppLayout *)self appLayoutWithItemsPassingTest:v25];
    [v19 addObject:v20];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__SBAppLayout_appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController_multitaskingSupported___block_invoke_2;
  v22[3] = &unk_1E6B052F8;
  char v24 = v18;
  v22[4] = self;
  id v8 = v19;
  id v23 = v8;
  [(SBAppLayout *)self enumerate:v22];

LABEL_13:
  return v8;
}

BOOL __107__SBAppLayout_appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController_multitaskingSupported___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) layoutRoleForItem:a2] < 5;
}

void __107__SBAppLayout_appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController_multitaskingSupported___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = a2 >= 5;
  }
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "leafAppLayoutForItem:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (id)appLayoutByAdjustingFloatingItemsForChamois
{
  BOOL v3 = [(SBAppLayout *)self itemForLayoutRole:3];

  if (v3)
  {
    id v4 = [SBAppLayout alloc];
    id v5 = [(SBAppLayout *)self allItems];
    id v6 = [(SBAppLayout *)self itemForLayoutRole:4];
    int64_t v7 = [(SBAppLayout *)self configuration];
    id v8 = [(SBAppLayout *)self itemsToLayoutAttributesMap];
    int64_t v9 = [(SBAppLayout *)self environment];
    LOBYTE(v15) = [(SBAppLayout *)self isHidden];
    uint64_t v10 = [(SBAppLayout *)v4 initWithItems:v5 centerItem:v6 floatingItem:0 configuration:v7 itemsToLayoutAttributes:v8 centerConfiguration:0 environment:v9 hidden:v15 preferredDisplayOrdinal:[(SBAppLayout *)self preferredDisplayOrdinal]];
LABEL_5:
    uint64_t v13 = (SBAppLayout *)v10;

    goto LABEL_7;
  }
  if ([(SBAppLayout *)self environment] == 2)
  {
    id v11 = [SBAppLayout alloc];
    id v5 = [(SBAppLayout *)self allItems];
    id v6 = [(SBAppLayout *)self itemForLayoutRole:4];
    int64_t v12 = [(SBAppLayout *)self configuration];
    id v8 = [(SBAppLayout *)self itemsToLayoutAttributesMap];
    LOBYTE(v15) = [(SBAppLayout *)self isHidden];
    uint64_t v10 = [(SBAppLayout *)v11 initWithItems:v5 centerItem:v6 floatingItem:0 configuration:v12 itemsToLayoutAttributes:v8 centerConfiguration:0 environment:1 hidden:v15 preferredDisplayOrdinal:[(SBAppLayout *)self preferredDisplayOrdinal]];
    goto LABEL_5;
  }
  uint64_t v13 = self;
LABEL_7:
  return v13;
}

- (id)appLayoutByAdjustingCenterWindowItemsForChamois
{
  BOOL v3 = [(SBAppLayout *)self itemForLayoutRole:4];

  if (v3)
  {
    int64_t v4 = [(SBAppLayout *)self configuration];
    if (v4 == 1) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = v4;
    }
    id v6 = [SBAppLayout alloc];
    int64_t v7 = [(SBAppLayout *)self allItems];
    id v8 = [(SBAppLayout *)self itemForLayoutRole:3];
    int64_t v9 = [(SBAppLayout *)self itemsToLayoutAttributesMap];
    int64_t v10 = [(SBAppLayout *)self environment];
    LOBYTE(v17) = [(SBAppLayout *)self isHidden];
    id v11 = [(SBAppLayout *)v6 initWithItems:v7 centerItem:0 floatingItem:v8 configuration:v5 itemsToLayoutAttributes:v9 centerConfiguration:0 environment:v10 hidden:v17 preferredDisplayOrdinal:[(SBAppLayout *)self preferredDisplayOrdinal]];

    goto LABEL_8;
  }
  if ([(SBAppLayout *)self environment] == 3)
  {
    int64_t v12 = [SBAppLayout alloc];
    int64_t v7 = [(SBAppLayout *)self allItems];
    uint64_t v13 = [(SBAppLayout *)self itemForLayoutRole:3];
    int64_t v14 = [(SBAppLayout *)self configuration];
    uint64_t v15 = [(SBAppLayout *)self itemsToLayoutAttributesMap];
    LOBYTE(v17) = [(SBAppLayout *)self isHidden];
    id v11 = [(SBAppLayout *)v12 initWithItems:v7 centerItem:0 floatingItem:v13 configuration:v14 itemsToLayoutAttributes:v15 centerConfiguration:0 environment:1 hidden:v17 preferredDisplayOrdinal:[(SBAppLayout *)self preferredDisplayOrdinal]];

LABEL_8:
    goto LABEL_10;
  }
  id v11 = self;
LABEL_10:
  return v11;
}

- (id)layoutAttributesForItemInRole:(int64_t)a3
{
  int64_t v4 = [(SBAppLayout *)self itemForLayoutRole:a3];
  uint64_t v5 = [(SBAppLayout *)self layoutAttributesForItem:v4];

  return v5;
}

- (id)appLayoutByModifyingLayoutAttributes:(id)a3 forItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBAppLayout.m", 1239, @"Invalid parameter not satisfying: %@", @"layoutAttributes" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBAppLayout.m", 1240, @"Invalid parameter not satisfying: %@", @"displayItem" object file lineNumber description];

LABEL_3:
  int64_t v10 = [(NSDictionary *)self->_itemsToLayoutAttributesMap objectForKey:v9];
  int v11 = [v7 isEqual:v10];

  if (v11)
  {
    int64_t v12 = self;
  }
  else
  {
    uint64_t v13 = (void *)[(NSDictionary *)self->_itemsToLayoutAttributesMap mutableCopy];
    [v13 setObject:v7 forKey:v9];
    int64_t v14 = [SBAppLayout alloc];
    LOBYTE(v18) = self->_hidden;
    int64_t v12 = [(SBAppLayout *)v14 initWithItems:self->_items centerItem:self->_centerItem floatingItem:self->_floatingItem configuration:self->_configuration itemsToLayoutAttributes:v13 centerConfiguration:self->_centerConfiguration environment:self->_environment hidden:v18 preferredDisplayOrdinal:self->_preferredDisplayOrdinal];
  }
  return v12;
}

- (id)appLayoutByModifyingLayoutAttributesForItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBAppLayout.m", 1250, @"Invalid parameter not satisfying: %@", @"newLayoutAttributesForItems" object file lineNumber description];
  }
  id v6 = (void *)[(NSDictionary *)self->_itemsToLayoutAttributesMap mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = self->_items;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v5 objectForKey:v12];
        if (v13) {
          [v6 setObject:v13 forKey:v12];
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  if ([v6 isEqual:self->_itemsToLayoutAttributesMap])
  {
    int64_t v14 = self;
  }
  else
  {
    uint64_t v15 = [SBAppLayout alloc];
    LOBYTE(v19) = self->_hidden;
    int64_t v14 = [(SBAppLayout *)v15 initWithItems:self->_items centerItem:self->_centerItem floatingItem:self->_floatingItem configuration:self->_configuration itemsToLayoutAttributes:v6 centerConfiguration:self->_centerConfiguration environment:self->_environment hidden:v19 preferredDisplayOrdinal:self->_preferredDisplayOrdinal];
  }
  int v16 = v14;

  return v16;
}

- (id)appLayoutByModifyingLayoutAttributes:(id)a3 forItemInRole:(int64_t)a4
{
  id v7 = a3;
  uint64_t v8 = [(SBAppLayout *)self itemForLayoutRole:a4];
  if (!v8)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = SBLayoutRoleDescription(a4);
    [v11 handleFailureInMethod:a2, self, @"SBAppLayout.m", 1268, @"No item in role %@", v12 object file lineNumber description];
  }
  uint64_t v9 = [(SBAppLayout *)self appLayoutByModifyingLayoutAttributes:v7 forItem:v8];

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  id v5 = self;
  id v6 = SBSafeCast((uint64_t)v5, v4);

  if (v6)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBAppLayout configuration](self, "configuration"));
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "configuration"));
    uint64_t v9 = [v7 compare:v8];
    v16[3] = v9;

    if (!v16[3])
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __23__SBAppLayout_compare___block_invoke;
      v12[3] = &unk_1E6B05320;
      int64_t v14 = &v15;
      id v13 = v6;
      [(SBAppLayout *)self enumerate:v12];
    }
  }
  int64_t v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __23__SBAppLayout_compare___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  uint64_t v9 = [v7 itemForLayoutRole:a2];
  uint64_t v10 = [v8 compare:v9];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)hasSameItemsInLayoutRoles:(unint64_t)a3 asAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  int64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SBAppLayout_hasSameItemsInLayoutRoles_asAppLayout___block_invoke;
  v9[3] = &unk_1E6B04CC8;
  unint64_t v12 = a3;
  v9[4] = self;
  id v7 = v6;
  id v10 = v7;
  int v11 = &v13;
  SBLayoutRoleEnumerateAppLayoutRoles(v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

void __53__SBAppLayout_hasSameItemsInLayoutRoles_asAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  if (SBLayoutRoleMaskContainsRole(*(void *)(a1 + 56), a2))
  {
    id v4 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
    id v5 = [*(id *)(a1 + 40) itemForLayoutRole:a2];
    char v6 = BSEqualObjects();

    if ((v6 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
}

- (NSString)description
{
  return (NSString *)[(SBAppLayout *)self descriptionWithMultilinePrefix:0];
}

- (uint64_t)setConfiguration:(uint64_t)result
{
  if (result) {
    *(void *)(result + 32) = a2;
  }
  return result;
}

- (void)setItemsToLayoutAttributesMap:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 80);
  }
}

- (SBContinuousExposeAutoLayoutSpace)cachedLastAutoLayoutSpace
{
  return self->_cachedLastAutoLayoutSpace;
}

- (void)setCachedLastAutoLayoutSpace:(id)a3
{
}

- (SBAppLayoutAutoLayoutSpaceCacheKey)cachedLastOverlappingModelKey
{
  return self->_cachedLastOverlappingModelKey;
}

- (void)setCachedLastOverlappingModelKey:(id)a3
{
}

- (NSDictionary)cachedDisplayItemLayoutAttributesForNonPreferredDisplay
{
  return self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay;
}

- (void)setItems:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 112);
  }
}

- (void)setItemsWithoutCenterOrFloatingItems:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 120);
  }
}

- (BOOL)isAdditiveModelEnabled
{
  if (result) {
    return *(unsigned char *)(result + 25) != 0;
  }
  return result;
}

@end