@interface SBMainDisplayLayoutState
+ (id)_elementIdentifiersToLayoutAttributesForElements:(id)a3 spaceConfiguration:(int64_t)a4;
- (BOOL)effectivelyRepresentsHomeScreen;
- (BOOL)isCenterEntityModal;
- (BOOL)isDisplayExternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloatingSwitcherVisible;
- (BOOL)isFullScreen;
- (BOOL)isSplitView;
- (NSDictionary)displayItemLayoutAttributesMap;
- (NSDictionary)elementIdentifiersToLayoutAttributes;
- (NSString)bundleIDShowingAppExpose;
- (NSString)continuousExposeIdentifier;
- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5;
- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5 spaceConfiguration:(int64_t)a6 elementIdentifiersToLayoutAttributes:(id)a7 floatingConfiguration:(int64_t)a8 unlockedEnvironmentMode:(int64_t)a9 floatingSwitcherVisible:(BOOL)a10 centerConfiguration:(int64_t)a11 centerEntityModal:(BOOL)a12 peekConfiguration:(int64_t)a13 bundleIDShowingAppExpose:(id)a14 windowPickerRole:(int64_t)a15 displayOrdinal:(int64_t)a16 isDisplayExternal:(BOOL)a17;
- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5 spaceConfiguration:(int64_t)a6 floatingConfiguration:(int64_t)a7 unlockedEnvironmentMode:(int64_t)a8 floatingSwitcherVisible:(BOOL)a9 centerConfiguration:(int64_t)a10 centerEntityModal:(BOOL)a11 peekConfiguration:(int64_t)a12 bundleIDShowingAppExpose:(id)a13 windowPickerRole:(int64_t)a14 displayOrdinal:(int64_t)a15 isDisplayExternal:(BOOL)a16;
- (id)_initWithLayoutElements:(id)a3 spaceConfiguration:(int64_t)a4 elementIdentifiersToLayoutAttributes:(id)a5 floatingConfiguration:(int64_t)a6 unlockedEnvironmentMode:(int64_t)a7 floatingSwitcherVisible:(BOOL)a8 centerConfiguration:(int64_t)a9 centerEntityModal:(BOOL)a10 peekConfiguration:(int64_t)a11 bundleIDShowingAppExpose:(id)a12 windowPickerRole:(int64_t)a13 displayOrdinal:(int64_t)a14 isDisplayExternal:(BOOL)a15;
- (id)_initWithLayoutElements:(id)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 unlockedEnvironmentMode:(int64_t)a6 floatingSwitcherVisible:(BOOL)a7 centerConfiguration:(int64_t)a8 centerEntityModal:(BOOL)a9 peekConfiguration:(int64_t)a10 bundleIDShowingAppExpose:(id)a11 windowPickerRole:(int64_t)a12 displayOrdinal:(int64_t)a13 isDisplayExternal:(BOOL)a14;
- (id)_initWithLayoutState:(id)a3;
- (id)_layoutAttributesForElementWithIdentifier:(id)a3;
- (id)appLayout;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)floatingAppLayout;
- (id)layoutAttributesForElement:(id)a3;
- (int64_t)_defaultInterfaceOrientation;
- (int64_t)centerConfiguration;
- (int64_t)displayOrdinal;
- (int64_t)floatingConfiguration;
- (int64_t)peekConfiguration;
- (int64_t)spaceConfiguration;
- (int64_t)unlockedEnvironmentMode;
- (int64_t)windowPickerRole;
- (unint64_t)hash;
- (void)_applyElementInterfaceOrientationsToLayoutAttributes;
- (void)_setLayoutAttributes:(id)a3 forLayoutElement:(id)a4;
- (void)_updateSizingPoliciesForLayoutElements:(id)a3;
- (void)invalidateAppLayout;
- (void)invalidateFloatingAppLayout;
- (void)setInterfaceOrientationByLayoutElementIdentifier:(id)a3;
@end

@implementation SBMainDisplayLayoutState

void __76__SBMainDisplayLayoutState_SwitcherSupport__effectivelyRepresentsHomeScreen__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 4)
  {
    v3 = [*(id *)(a1 + 32) elementWithRole:a2];

    if (v3) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (int64_t)unlockedEnvironmentMode
{
  return self->_unlockedEnvironmentMode;
}

- (id)appLayout
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  cachedAppLayoutIfAny = self->_cachedAppLayoutIfAny;
  if (!cachedAppLayoutIfAny)
  {
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v38 = self;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v4 = [(SBLayoutState *)self elements];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      v36 = 0;
      uint64_t v7 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v10 = [v9 layoutRole];
          if (SBLayoutRoleIsValid(v10) && v10 != 3)
          {
            v12 = +[SBDisplayItem displayItemForLayoutElement:v9];
            v13 = [NSNumber numberWithInteger:v10];
            [v37 setObject:v12 forKeyedSubscript:v13];

            if (v10 == 4)
            {
              id v14 = v9;

              v36 = v14;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v6);
    }
    else
    {
      v36 = 0;
    }

    if (![v37 count])
    {
      v19 = v38;
LABEL_37:

      cachedAppLayoutIfAny = v19->_cachedAppLayoutIfAny;
      goto LABEL_38;
    }
    if (v36)
    {
      uint64_t v15 = SBAppLayoutCenterConfigurationFromMainDisplayLayoutStateCenterConfiguration([(SBMainDisplayLayoutState *)v38 centerConfiguration]);
      if (v15)
      {
        uint64_t v16 = v15;
        BOOL v17 = [(SBMainDisplayLayoutState *)v38 isCenterEntityModal];
        uint64_t v18 = 3;
        if (!v17) {
          uint64_t v18 = 1;
        }
        goto LABEL_26;
      }

      v20 = [NSNumber numberWithInteger:4];
      [v37 removeObjectForKey:v20];
    }
    uint64_t v16 = 0;
    v36 = 0;
    uint64_t v18 = 1;
LABEL_26:
    uint64_t v35 = v18;
    unint64_t v21 = SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration([(SBMainDisplayLayoutState *)v38 spaceConfiguration]);
    if (v21 >= 2 && [v37 count] == 1) {
      unint64_t v21 = 1;
    }
    v22 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v23 = v37;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          v29 = -[SBLayoutState elementWithRole:](v38, "elementWithRole:", [v28 integerValue]);
          v30 = [v23 objectForKey:v28];
          v31 = [(SBMainDisplayLayoutState *)v38 layoutAttributesForElement:v29];
          [v22 setObject:v31 forKey:v30];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v25);
    }

    v19 = v38;
    v32 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v23 configuration:v21 itemsToLayoutAttributes:v22 centerConfiguration:v16 environment:v35 hidden:0 preferredDisplayOrdinal:v38->_displayOrdinal];
    v33 = v38->_cachedAppLayoutIfAny;
    v38->_cachedAppLayoutIfAny = v32;

    goto LABEL_37;
  }
LABEL_38:
  return cachedAppLayoutIfAny;
}

- (int64_t)peekConfiguration
{
  return self->_peekConfiguration;
}

- (BOOL)isFloatingSwitcherVisible
{
  return self->_floatingSwitcherVisible;
}

- (id)floatingAppLayout
{
  v16[1] = *MEMORY[0x1E4F143B8];
  cachedFloatingAppLayoutIfAny = self->_cachedFloatingAppLayoutIfAny;
  if (!cachedFloatingAppLayoutIfAny)
  {
    v4 = [(SBLayoutState *)self elementWithRole:3];
    if (v4)
    {
      uint64_t v5 = +[SBDisplayItem displayItemForLayoutElement:v4];
      uint64_t v6 = [(SBMainDisplayLayoutState *)self layoutAttributesForElement:v4];
      uint64_t v7 = [SBAppLayout alloc];
      v16[0] = v5;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      id v14 = v5;
      uint64_t v15 = v6;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      LOBYTE(v13) = 0;
      uint64_t v10 = [(SBAppLayout *)v7 initWithItems:v8 centerItem:0 floatingItem:0 configuration:1 itemsToLayoutAttributes:v9 centerConfiguration:0 environment:2 hidden:v13 preferredDisplayOrdinal:self->_displayOrdinal];
      v11 = self->_cachedFloatingAppLayoutIfAny;
      self->_cachedFloatingAppLayoutIfAny = v10;
    }
    cachedFloatingAppLayoutIfAny = self->_cachedFloatingAppLayoutIfAny;
  }
  return cachedFloatingAppLayoutIfAny;
}

- (int64_t)spaceConfiguration
{
  return self->_spaceConfiguration;
}

- (NSString)bundleIDShowingAppExpose
{
  return self->_bundleIDShowingAppExpose;
}

- (int64_t)floatingConfiguration
{
  return self->_floatingConfiguration;
}

- (int64_t)windowPickerRole
{
  return self->_windowPickerRole;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (unsigned __int8 *)v4;
    v20.receiver = self;
    v20.super_class = (Class)SBMainDisplayLayoutState;
    if ([(SBLayoutState *)&v20 isEqual:v5]
      && (int64_t v6 = [(SBMainDisplayLayoutState *)self spaceConfiguration],
          v6 == [v5 spaceConfiguration])
      && (int64_t v7 = [(SBMainDisplayLayoutState *)self floatingConfiguration],
          v7 == [v5 floatingConfiguration])
      && (int64_t v8 = [(SBMainDisplayLayoutState *)self unlockedEnvironmentMode],
          v8 == [v5 unlockedEnvironmentMode])
      && (int64_t v9 = [(SBMainDisplayLayoutState *)self centerConfiguration],
          v9 == [v5 centerConfiguration])
      && (int v10 = [(SBMainDisplayLayoutState *)self isCenterEntityModal],
          v10 == [v5 isCenterEntityModal])
      && (int64_t v11 = [(SBMainDisplayLayoutState *)self peekConfiguration],
          v11 == [v5 peekConfiguration]))
    {
      v12 = [(SBMainDisplayLayoutState *)self bundleIDShowingAppExpose];
      uint64_t v13 = [v5 bundleIDShowingAppExpose];
      if (BSEqualObjects()
        && (int64_t v14 = [(SBMainDisplayLayoutState *)self windowPickerRole],
            v14 == [v5 windowPickerRole])
        && (int64_t v15 = [(SBMainDisplayLayoutState *)self displayOrdinal],
            v15 == [v5 displayOrdinal])
        && self->_isDisplayExternal == v5[58])
      {
        uint64_t v16 = [(SBLayoutState *)self interfaceOrientationByLayoutElementIdentifier];
        BOOL v17 = [v5 interfaceOrientationByLayoutElementIdentifier];
        char v18 = BSEqualObjects();
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (int64_t)displayOrdinal
{
  return self->_displayOrdinal;
}

- (int64_t)centerConfiguration
{
  return self->_centerConfiguration;
}

- (BOOL)isCenterEntityModal
{
  return self->_centerEntityModal;
}

- (void)invalidateFloatingAppLayout
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplayLayoutState;
  [(SBLayoutState *)&v4 invalidateFloatingAppLayout];
  cachedFloatingAppLayoutIfAny = self->_cachedFloatingAppLayoutIfAny;
  self->_cachedFloatingAppLayoutIfAny = 0;
}

- (void)invalidateAppLayout
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplayLayoutState;
  [(SBLayoutState *)&v4 invalidateAppLayout];
  cachedAppLayoutIfAny = self->_cachedAppLayoutIfAny;
  self->_cachedAppLayoutIfAny = 0;
}

- (id)layoutAttributesForElement:(id)a3
{
  objc_super v4 = [a3 uniqueIdentifier];
  uint64_t v5 = [(SBMainDisplayLayoutState *)self _layoutAttributesForElementWithIdentifier:v4];

  return v5;
}

- (id)_layoutAttributesForElementWithIdentifier:(id)a3
{
  v3 = [(NSDictionary *)self->_elementIdentifiersToLayoutAttributes objectForKey:a3];
  if (!v3) {
    v3 = objc_alloc_init(SBDisplayItemLayoutAttributes);
  }
  return v3;
}

- (int64_t)_defaultInterfaceOrientation
{
  if ([(SBMainDisplayLayoutState *)self isDisplayExternal]) {
    return 1;
  }
  v3 = (void *)SBApp;
  return [v3 activeInterfaceOrientation];
}

- (BOOL)isDisplayExternal
{
  return self->_isDisplayExternal;
}

- (BOOL)isFullScreen
{
  v3 = [(SBLayoutState *)self elementWithRole:1];
  if (v3)
  {
    objc_super v4 = [(SBLayoutState *)self elementWithRole:2];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)effectivelyRepresentsHomeScreen
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SBMainDisplayLayoutState_SwitcherSupport__effectivelyRepresentsHomeScreen__block_invoke;
  v5[3] = &unk_1E6AFBD78;
  v5[4] = self;
  v5[5] = &v6;
  SBLayoutRoleEnumerateAppLayoutRoles(v5);
  if (*((unsigned char *)v7 + 24)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [(SBMainDisplayLayoutState *)self unlockedEnvironmentMode] != 2;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousExposeIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIDShowingAppExpose, 0);
  objc_storeStrong((id *)&self->_elementIdentifiersToLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_cachedFloatingAppLayoutIfAny, 0);
  objc_storeStrong((id *)&self->_cachedAppLayoutIfAny, 0);
}

- (id)_initWithLayoutElements:(id)a3 spaceConfiguration:(int64_t)a4 elementIdentifiersToLayoutAttributes:(id)a5 floatingConfiguration:(int64_t)a6 unlockedEnvironmentMode:(int64_t)a7 floatingSwitcherVisible:(BOOL)a8 centerConfiguration:(int64_t)a9 centerEntityModal:(BOOL)a10 peekConfiguration:(int64_t)a11 bundleIDShowingAppExpose:(id)a12 windowPickerRole:(int64_t)a13 displayOrdinal:(int64_t)a14 isDisplayExternal:(BOOL)a15
{
  LOBYTE(v18) = a15;
  LOBYTE(v17) = a10;
  LOBYTE(v16) = a8;
  return [(SBMainDisplayLayoutState *)self _initWithLayoutElements:a3 interfaceOrientation:0 interfaceOrientationByLayoutElement:0 spaceConfiguration:a4 elementIdentifiersToLayoutAttributes:a5 floatingConfiguration:a6 unlockedEnvironmentMode:a7 floatingSwitcherVisible:v16 centerConfiguration:a9 centerEntityModal:v17 peekConfiguration:a11 bundleIDShowingAppExpose:a12 windowPickerRole:a13 displayOrdinal:a14 isDisplayExternal:v18];
}

- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5 spaceConfiguration:(int64_t)a6 elementIdentifiersToLayoutAttributes:(id)a7 floatingConfiguration:(int64_t)a8 unlockedEnvironmentMode:(int64_t)a9 floatingSwitcherVisible:(BOOL)a10 centerConfiguration:(int64_t)a11 centerEntityModal:(BOOL)a12 peekConfiguration:(int64_t)a13 bundleIDShowingAppExpose:(id)a14 windowPickerRole:(int64_t)a15 displayOrdinal:(int64_t)a16 isDisplayExternal:(BOOL)a17
{
  id v23 = a7;
  id v24 = a14;
  v32.receiver = self;
  v32.super_class = (Class)SBMainDisplayLayoutState;
  uint64_t v25 = [(SBLayoutState *)&v32 _initWithLayoutElements:a3 interfaceOrientation:a4 interfaceOrientationByLayoutElement:a5];
  uint64_t v26 = v25;
  if (v25)
  {
    v25[8] = a6;
    uint64_t v27 = [v23 copy];
    v28 = (void *)v26[6];
    v26[6] = v27;

    v26[9] = a8;
    v26[12] = a9;
    *((unsigned char *)v26 + 56) = a10;
    v26[10] = a11;
    *((unsigned char *)v26 + 57) = a12;
    v26[11] = a13;
    uint64_t v29 = [v24 copy];
    v30 = (void *)v26[13];
    v26[13] = v29;

    v26[14] = a15;
    v26[15] = a16;
    *((unsigned char *)v26 + 58) = a17;
  }

  return v26;
}

void __67__SBMainDisplayLayoutState__updateSizingPoliciesForLayoutElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 integerValue];
  int64_t v7 = [*(id *)(a1 + 32) _layoutAttributesForElementWithIdentifier:v5];
  id v8 = [v7 attributesByModifyingSizingPolicy:v6];

  [*(id *)(a1 + 40) setValue:v8 forKey:v5];
}

- (void)setInterfaceOrientationByLayoutElementIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplayLayoutState;
  [(SBLayoutState *)&v4 setInterfaceOrientationByLayoutElementIdentifier:a3];
  [(SBMainDisplayLayoutState *)self _applyElementInterfaceOrientationsToLayoutAttributes];
  [(SBMainDisplayLayoutState *)self invalidateAppLayout];
  [(SBMainDisplayLayoutState *)self invalidateFloatingAppLayout];
}

- (void)_applyElementInterfaceOrientationsToLayoutAttributes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_elementIdentifiersToLayoutAttributes)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CA60];
    objc_super v4 = [(SBLayoutState *)self elements];
    id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [(SBLayoutState *)self elements];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          int64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * v10) uniqueIdentifier];
          v12 = [(SBMainDisplayLayoutState *)self _layoutAttributesForElementWithIdentifier:v11];
          uint64_t v13 = objc_msgSend(v12, "attributesByModifyingContentOrientation:", -[SBLayoutState interfaceOrientationForElementIdentifier:](self, "interfaceOrientationForElementIdentifier:", v11));

          [v5 setValue:v13 forKey:v11];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    int64_t v14 = (NSDictionary *)[v5 copy];
    elementIdentifiersToLayoutAttributes = self->_elementIdentifiersToLayoutAttributes;
    self->_elementIdentifiersToLayoutAttributes = v14;
  }
}

- (NSDictionary)elementIdentifiersToLayoutAttributes
{
  return self->_elementIdentifiersToLayoutAttributes;
}

- (void)_updateSizingPoliciesForLayoutElements:(id)a3
{
  if (a3)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1CA60];
    id v5 = a3;
    uint64_t v6 = [(SBLayoutState *)self elements];
    uint64_t v7 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));

    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __67__SBMainDisplayLayoutState__updateSizingPoliciesForLayoutElements___block_invoke;
    int64_t v14 = &unk_1E6B051D8;
    int64_t v15 = self;
    id v16 = v7;
    id v8 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:&v11];

    uint64_t v9 = (NSDictionary *)objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);
    elementIdentifiersToLayoutAttributes = self->_elementIdentifiersToLayoutAttributes;
    self->_elementIdentifiersToLayoutAttributes = v9;

    [(SBMainDisplayLayoutState *)self invalidateAppLayout];
    [(SBMainDisplayLayoutState *)self invalidateFloatingAppLayout];
  }
}

- (id)_initWithLayoutElements:(id)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 unlockedEnvironmentMode:(int64_t)a6 floatingSwitcherVisible:(BOOL)a7 centerConfiguration:(int64_t)a8 centerEntityModal:(BOOL)a9 peekConfiguration:(int64_t)a10 bundleIDShowingAppExpose:(id)a11 windowPickerRole:(int64_t)a12 displayOrdinal:(int64_t)a13 isDisplayExternal:(BOOL)a14
{
  id v17 = a11;
  id v18 = a3;
  long long v19 = [(id)objc_opt_class() _elementIdentifiersToLayoutAttributesForElements:v18 spaceConfiguration:a4];
  LOBYTE(v24) = a14;
  LOBYTE(v23) = a9;
  LOBYTE(v22) = a7;
  id v20 = [(SBMainDisplayLayoutState *)self _initWithLayoutElements:v18 interfaceOrientation:0 interfaceOrientationByLayoutElement:0 spaceConfiguration:a4 elementIdentifiersToLayoutAttributes:v19 floatingConfiguration:a5 unlockedEnvironmentMode:a6 floatingSwitcherVisible:v22 centerConfiguration:a8 centerEntityModal:v23 peekConfiguration:a10 bundleIDShowingAppExpose:v17 windowPickerRole:a12 displayOrdinal:a13 isDisplayExternal:v24];

  return v20;
}

- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5 spaceConfiguration:(int64_t)a6 floatingConfiguration:(int64_t)a7 unlockedEnvironmentMode:(int64_t)a8 floatingSwitcherVisible:(BOOL)a9 centerConfiguration:(int64_t)a10 centerEntityModal:(BOOL)a11 peekConfiguration:(int64_t)a12 bundleIDShowingAppExpose:(id)a13 windowPickerRole:(int64_t)a14 displayOrdinal:(int64_t)a15 isDisplayExternal:(BOOL)a16
{
  id v20 = a13;
  id v21 = a5;
  id v22 = a3;
  uint64_t v23 = [(id)objc_opt_class() _elementIdentifiersToLayoutAttributesForElements:v22 spaceConfiguration:a6];
  LOBYTE(v28) = a16;
  LOBYTE(v27) = a11;
  LOBYTE(v26) = a9;
  id v24 = [(SBMainDisplayLayoutState *)self _initWithLayoutElements:v22 interfaceOrientation:a4 interfaceOrientationByLayoutElement:v21 spaceConfiguration:a6 elementIdentifiersToLayoutAttributes:v23 floatingConfiguration:a7 unlockedEnvironmentMode:a8 floatingSwitcherVisible:v26 centerConfiguration:a10 centerEntityModal:v27 peekConfiguration:a12 bundleIDShowingAppExpose:v20 windowPickerRole:a14 displayOrdinal:a15 isDisplayExternal:v28];

  return v24;
}

- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5
{
  LOBYTE(v10) = 0;
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  id v5 = [(SBMainDisplayLayoutState *)self _initWithLayoutElements:a3 interfaceOrientation:a4 interfaceOrientationByLayoutElement:a5 spaceConfiguration:0 elementIdentifiersToLayoutAttributes:MEMORY[0x1E4F1CC08] floatingConfiguration:0 unlockedEnvironmentMode:1 floatingSwitcherVisible:v8 centerConfiguration:0 centerEntityModal:v9 peekConfiguration:0 bundleIDShowingAppExpose:0 windowPickerRole:0 displayOrdinal:0 isDisplayExternal:v10];
  uint64_t v6 = v5;
  if (v5) {
    [v5 _applyElementInterfaceOrientationsToLayoutAttributes];
  }
  return v6;
}

- (id)_initWithLayoutState:(id)a3
{
  id v3 = a3;
  uint64_t v23 = [v3 elements];
  uint64_t v22 = [v3 interfaceOrientation];
  uint64_t v25 = [v3 interfaceOrientationByLayoutElementIdentifier];
  id v21 = (void *)[v25 copy];
  uint64_t v20 = [v3 spaceConfiguration];
  objc_super v4 = [v3 elementIdentifiersToLayoutAttributes];
  uint64_t v19 = [v3 floatingConfiguration];
  uint64_t v18 = [v3 unlockedEnvironmentMode];
  char v5 = [v3 isFloatingSwitcherVisible];
  uint64_t v6 = [v3 centerConfiguration];
  char v7 = [v3 isCenterEntityModal];
  uint64_t v8 = [v3 peekConfiguration];
  uint64_t v9 = [v3 bundleIDShowingAppExpose];
  uint64_t v10 = [v3 windowPickerRole];
  uint64_t v11 = [v3 displayOrdinal];
  char v12 = [v3 isDisplayExternal];

  LOBYTE(v17) = v12;
  LOBYTE(v16) = v7;
  LOBYTE(v15) = v5;
  id v13 = [(SBMainDisplayLayoutState *)self _initWithLayoutElements:v23 interfaceOrientation:v22 interfaceOrientationByLayoutElement:v21 spaceConfiguration:v20 elementIdentifiersToLayoutAttributes:v4 floatingConfiguration:v19 unlockedEnvironmentMode:v18 floatingSwitcherVisible:v15 centerConfiguration:v6 centerEntityModal:v16 peekConfiguration:v8 bundleIDShowingAppExpose:v9 windowPickerRole:v10 displayOrdinal:v11 isDisplayExternal:v17];

  if (v13) {
    [v13 _applyElementInterfaceOrientationsToLayoutAttributes];
  }
  return v13;
}

+ (id)_elementIdentifiersToLayoutAttributesForElements:(id)a3 spaceConfiguration:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v12 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        id v13 = objc_msgSend(v11, "uniqueIdentifier", (void)v15);
        [v5 setObject:v12 forKey:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)description
{
  return [(SBLayoutState *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char v5 = [(SBLayoutState *)self succinctDescriptionBuilder];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [(SBLayoutState *)self interfaceOrientationByLayoutElementIdentifier];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v18[3] = &unk_1E6B02D80;
  id v8 = v6;
  id v19 = v8;
  objc_msgSend(v7, "bs_each:", v18);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v14[3] = &unk_1E6AF4E00;
  id v9 = v5;
  id v15 = v9;
  long long v16 = self;
  id v17 = v8;
  id v10 = v8;
  [v9 appendBodySectionWithName:0 multilinePrefix:v4 block:v14];

  uint64_t v11 = v17;
  id v12 = v9;

  return v12;
}

void __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [a3 integerValue];
  SBFStringForBSInterfaceOrientation();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKey:v5];
}

void __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) elements];
  id v4 = [v3 allObjects];
  id v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_216);
  [v2 appendArraySection:v5 withName:@"elements" skipIfEmpty:1];

  id v6 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) interfaceOrientation] == 1)
  {
    uint64_t v7 = @"UIInterfaceOrientationPortrait";
  }
  else if ([*(id *)(a1 + 40) interfaceOrientation] == 4)
  {
    uint64_t v7 = @"UIInterfaceOrientationLandscapeLeft";
  }
  else if ([*(id *)(a1 + 40) interfaceOrientation] == 3)
  {
    uint64_t v7 = @"UIInterfaceOrientationLandscapeRight";
  }
  else if ([*(id *)(a1 + 40) interfaceOrientation] == 2)
  {
    uint64_t v7 = @"UIInterfaceOrientationPortraitUpsideDown";
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = (id)[v6 appendObject:v7 withName:@"interfaceOrientation"];
  id v9 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) interfaceOrientationForLayoutRole:1] == 1)
  {
    id v10 = @"UIInterfaceOrientationPortrait";
  }
  else if ([*(id *)(a1 + 40) interfaceOrientationForLayoutRole:1] == 4)
  {
    id v10 = @"UIInterfaceOrientationLandscapeLeft";
  }
  else if ([*(id *)(a1 + 40) interfaceOrientationForLayoutRole:1] == 3)
  {
    id v10 = @"UIInterfaceOrientationLandscapeRight";
  }
  else if ([*(id *)(a1 + 40) interfaceOrientationForLayoutRole:1] == 2)
  {
    id v10 = @"UIInterfaceOrientationPortraitUpsideDown";
  }
  else
  {
    id v10 = 0;
  }
  id v11 = (id)[v9 appendObject:v10 withName:@"primaryElementInterfaceOrientation"];
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(a1 + 48) withName:@"interfaceOrientationByLayoutElement" skipIfEmpty:0];
  id v12 = *(void **)(a1 + 32);
  unint64_t v13 = [*(id *)(a1 + 40) spaceConfiguration];
  if (v13 > 4) {
    int64_t v14 = 0;
  }
  else {
    int64_t v14 = off_1E6B051F8[v13];
  }
  id v15 = (id)[v12 appendObject:v14 withName:@"spaceConfiguration"];
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 48) withName:@"layoutAttributes" skipIfEmpty:1];
  long long v16 = *(void **)(a1 + 32);
  unint64_t v17 = [*(id *)(a1 + 40) floatingConfiguration];
  if (v17 > 4) {
    long long v18 = 0;
  }
  else {
    long long v18 = off_1E6B05220[v17];
  }
  id v19 = (id)[v16 appendObject:v18 withName:@"floatingConfiguration"];
  uint64_t v20 = *(void **)(a1 + 32);
  unint64_t v21 = [*(id *)(a1 + 40) centerConfiguration];
  if (v21 > 2) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = off_1E6B05248[v21];
  }
  id v23 = (id)[v20 appendObject:v22 withName:@"centerConfiguration"];
  id v24 = *(void **)(a1 + 32);
  unint64_t v25 = [*(id *)(a1 + 40) peekConfiguration];
  if (v25 > 3) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = off_1E6B05260[v25];
  }
  id v27 = (id)[v24 appendObject:v26 withName:@"peekConfiguration"];
  uint64_t v28 = *(void **)(a1 + 32);
  unint64_t v29 = [*(id *)(a1 + 40) unlockedEnvironmentMode];
  if (v29 > 3) {
    v30 = 0;
  }
  else {
    v30 = off_1E6B05280[v29];
  }
  id v31 = (id)[v28 appendObject:v30 withName:@"unlockedEnvironmentMode"];
  objc_super v32 = *(void **)(a1 + 32);
  v33 = [*(id *)(a1 + 40) bundleIDShowingAppExpose];
  [v32 appendString:v33 withName:@"bundleIDShowingAppExpose"];

  v34 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) isFloatingSwitcherVisible];
  uint64_t v35 = BSSettingFlagDescription();
  id v36 = (id)[v34 appendObject:v35 withName:@"floatingSwitcherVisible"];

  id v37 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isCenterEntityModal"), @"centerEntityModal", 1);
  v38 = *(void **)(a1 + 32);
  long long v39 = SBLayoutRoleDescription(*(void *)(*(void *)(a1 + 40) + 112));
  id v40 = (id)[v38 appendObject:v39 withName:@"windowPickerRole"];

  id v41 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "displayOrdinal"), @"displayOrdinal");
  id v42 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDisplayExternal"), @"isDisplayExternal");
  long long v43 = *(void **)(a1 + 32);
  id v45 = [*(id *)(a1 + 40) appLayout];
  long long v44 = [v45 continuousExposeIdentifier];
  [v43 appendString:v44 withName:@"continuousExposeIdentifier" skipIfEmpty:1];
}

uint64_t __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 succinctDescription];
}

- (unint64_t)hash
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  v30.receiver = self;
  v30.super_class = (Class)SBMainDisplayLayoutState;
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBLayoutState hash](&v30, sel_hash));
  id v5 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState spaceConfiguration](self, "spaceConfiguration"));
  id v6 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState floatingConfiguration](self, "floatingConfiguration"));
  id v7 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState centerConfiguration](self, "centerConfiguration"));
  id v8 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState peekConfiguration](self, "peekConfiguration"));
  id v9 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState unlockedEnvironmentMode](self, "unlockedEnvironmentMode"));
  id v10 = [(SBMainDisplayLayoutState *)self bundleIDShowingAppExpose];
  id v11 = (id)[v3 appendString:v10];

  id v12 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState windowPickerRole](self, "windowPickerRole"));
  id v13 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState displayOrdinal](self, "displayOrdinal"));
  id v14 = (id)objc_msgSend(v3, "appendBool:", -[SBMainDisplayLayoutState isDisplayExternal](self, "isDisplayExternal"));
  id v15 = [(SBLayoutState *)self interfaceOrientationByLayoutElementIdentifier];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v21 = (id)[v3 appendString:v20];
        uint64_t v22 = [v15 objectForKey:v20];
        id v23 = (id)objc_msgSend(v3, "appendUnsignedInteger:", objc_msgSend(v22, "unsignedIntegerValue"));
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v17);
  }
  unint64_t v24 = [v3 hash];

  return v24;
}

- (BOOL)isSplitView
{
  id v3 = [(SBLayoutState *)self elementWithRole:1];
  if (v3)
  {
    id v4 = [(SBLayoutState *)self elementWithRole:2];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setLayoutAttributes:(id)a3 forLayoutElement:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_elementIdentifiersToLayoutAttributes)
  {
    id v7 = [a4 uniqueIdentifier];
    if (v7)
    {
      id v8 = (NSDictionary *)[(NSDictionary *)self->_elementIdentifiersToLayoutAttributes mutableCopy];
      id v9 = v8;
      if (v6)
      {
        id v12 = v7;
        v13[0] = v6;
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        [(NSDictionary *)v9 addEntriesFromDictionary:v10];
      }
      else
      {
        [(NSDictionary *)v8 removeObjectForKey:v7];
      }
      elementIdentifiersToLayoutAttributes = self->_elementIdentifiersToLayoutAttributes;
      self->_elementIdentifiersToLayoutAttributes = v9;

      [(SBMainDisplayLayoutState *)self invalidateAppLayout];
      [(SBMainDisplayLayoutState *)self invalidateFloatingAppLayout];
    }
  }
}

- (NSString)continuousExposeIdentifier
{
  return self->_continuousExposeIdentifier;
}

- (NSDictionary)displayItemLayoutAttributesMap
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(SBLayoutState *)self elements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 layoutRole];
        if (SBLayoutRoleIsValid(v10) && v10 != 3)
        {
          id v12 = +[SBDisplayItem displayItemForLayoutElement:v9];
          id v13 = [(SBMainDisplayLayoutState *)self layoutAttributesForElement:v9];
          [v3 setObject:v13 forKey:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

@end