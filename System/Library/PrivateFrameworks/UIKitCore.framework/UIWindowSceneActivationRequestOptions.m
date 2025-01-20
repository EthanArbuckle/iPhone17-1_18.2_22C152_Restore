@interface UIWindowSceneActivationRequestOptions
- (BOOL)_effectivelyWantsBackground;
- (BOOL)_effectivelyWantsFullscreen;
- (BOOL)_effectivelyWantsPreservedLayout;
- (BOOL)_effectivelyWantsProminence;
- (BOOL)_preserveLayout;
- (NSString)_interactionIdentifier;
- (UISceneConfiguration)_quickLookSceneConfiguration;
- (UIWindowScenePlacement)placement;
- (UIWindowScenePresentationStyle)preferredPresentationStyle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (unint64_t)_preferredSizeCategory;
- (void)_setInteractionIdentifier:(id)a3;
- (void)_setPreferredSizeCategory:(unint64_t)a3;
- (void)_setPreserveLayout:(BOOL)a3;
- (void)_setQuickLookSceneConfiguration:(id)a3;
- (void)setPlacement:(UIWindowScenePlacement *)placement;
- (void)setPreferredPresentationStyle:(UIWindowScenePresentationStyle)preferredPresentationStyle;
@end

@implementation UIWindowSceneActivationRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_quickLookSceneConfiguration, 0);
}

- (void)setPlacement:(UIWindowScenePlacement *)placement
{
  v4 = placement;
  if (v4 && ![(id)objc_opt_class() _placementType])
  {
    v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("WindowScene", &setPlacement____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Custom scene placements are not supported. Please use one of the system provided ones.", v8, 2u);
    }

    v4 = 0;
  }
  v6 = (UIWindowScenePlacement *)[(UIWindowScenePlacement *)v4 copy];
  v7 = self->_placement;
  self->_placement = v6;
}

- (void)_setQuickLookSceneConfiguration:(id)a3
{
  v5 = (UISceneConfiguration *)a3;
  v6 = v5;
  if (v5)
  {
    v7 = [(UISceneConfiguration *)v5 role];
    char v8 = [v7 isEqualToString:@"UISceneSessionRoleQuickLook"];

    if ((v8 & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = [(UISceneConfiguration *)v6 role];
      [v10 handleFailureInMethod:a2, self, @"UIWindowSceneActivationRequestOptions.m", 42, @"BUG IN CLIENT OF UIKIT: Attempting to set an internal scene configuration with an incorrect role. Expected \"%@\", Received: \"%@\", @"UISceneSessionRoleQuickLook"", v11 object file lineNumber description];
    }
  }
  quickLookSceneConfiguration = self->_quickLookSceneConfiguration;
  self->_quickLookSceneConfiguration = v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIWindowSceneActivationRequestOptions;
  id v4 = [(UISceneActivationRequestOptions *)&v12 copyWithZone:a3];
  objc_msgSend(v4, "setPreferredPresentationStyle:", -[UIWindowSceneActivationRequestOptions preferredPresentationStyle](self, "preferredPresentationStyle"));
  objc_msgSend(v4, "_setPreferredSizeCategory:", -[UIWindowSceneActivationRequestOptions _preferredSizeCategory](self, "_preferredSizeCategory"));
  objc_msgSend(v4, "_setPreserveLayout:", -[UIWindowSceneActivationRequestOptions _preserveLayout](self, "_preserveLayout"));
  v5 = [(UIWindowSceneActivationRequestOptions *)self _quickLookSceneConfiguration];
  v6 = (void *)[v5 copy];
  [v4 _setQuickLookSceneConfiguration:v6];

  v7 = [(UIWindowSceneActivationRequestOptions *)self placement];
  char v8 = (void *)[v7 copy];
  [v4 setPlacement:v8];

  v9 = [(UIWindowSceneActivationRequestOptions *)self _interactionIdentifier];
  v10 = (void *)[v9 copy];
  [v4 _setInteractionIdentifier:v10];

  return v4;
}

- (BOOL)_effectivelyWantsProminence
{
  v3 = [(UIWindowSceneActivationRequestOptions *)self placement];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 _requestCenterSlot];
  }
  else {
    char v5 = [(UIWindowSceneActivationRequestOptions *)self preferredPresentationStyle] == UIWindowScenePresentationStyleProminent;
  }

  return v5;
}

- (BOOL)_effectivelyWantsFullscreen
{
  v3 = [(UIWindowSceneActivationRequestOptions *)self placement];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 _requestFullscreen];
  }
  else {
    char v5 = [(UIWindowSceneActivationRequestOptions *)self _preferredSizeCategory] == 1;
  }

  return v5;
}

- (BOOL)_effectivelyWantsPreservedLayout
{
  v3 = [(UIWindowSceneActivationRequestOptions *)self placement];
  id v4 = v3;
  if (!v3) {
    v3 = self;
  }
  char v5 = [v3 _preserveLayout];

  return v5;
}

- (BOOL)_effectivelyWantsBackground
{
  v2 = [(UIWindowSceneActivationRequestOptions *)self placement];
  v3 = v2;
  if (v2) {
    char v4 = [v2 _requestBackground];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIWindowSceneActivationRequestOptions;
  id v4 = a3;
  char v5 = [(UISceneActivationRequestOptions *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__UIWindowSceneActivationRequestOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:&stru_1ED0E84C0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

uint64_t __79__UIWindowSceneActivationRequestOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) placement];
  id v4 = (id)[v2 appendObject:v3 withName:@"UIWindowScene-Specific" skipIfNil:1];

  uint64_t result = [*(id *)(a1 + 40) preferredPresentationStyle];
  if (result)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) preferredPresentationStyle];
    char v8 = @"UIWindowScenePresentationStyleAutomatic";
    if (v7 == 1) {
      char v8 = @"UIWindowScenePresentationStyleStandard";
    }
    if (v7 == 2) {
      v9 = @"UIWindowScenePresentationStyleProminent";
    }
    else {
      v9 = v8;
    }
    return [v6 appendString:v9 withName:@"preferredPresentationStyle"];
  }
  return result;
}

- (UISceneConfiguration)_quickLookSceneConfiguration
{
  return self->_quickLookSceneConfiguration;
}

- (UIWindowScenePresentationStyle)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void)setPreferredPresentationStyle:(UIWindowScenePresentationStyle)preferredPresentationStyle
{
  self->_preferredPresentationStyle = preferredPresentationStyle;
}

- (UIWindowScenePlacement)placement
{
  return self->_placement;
}

- (NSString)_interactionIdentifier
{
  return self->__interactionIdentifier;
}

- (void)_setInteractionIdentifier:(id)a3
{
}

- (unint64_t)_preferredSizeCategory
{
  return self->__preferredSizeCategory;
}

- (void)_setPreferredSizeCategory:(unint64_t)a3
{
  self->__preferredSizeCategory = a3;
}

- (BOOL)_preserveLayout
{
  return self->__preserveLayout;
}

- (void)_setPreserveLayout:(BOOL)a3
{
  self->__preserveLayout = a3;
}

@end