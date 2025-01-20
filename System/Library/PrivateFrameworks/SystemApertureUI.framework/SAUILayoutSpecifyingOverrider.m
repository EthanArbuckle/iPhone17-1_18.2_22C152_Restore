@interface SAUILayoutSpecifyingOverrider
- (BOOL)isInteractiveDismissalEnabled;
- (BOOL)isInteractiveDismissalEnabledForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (BOOL)isMinimalPresentationPossible;
- (BOOL)isMinimalPresentationPossibleForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4;
- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4 forTargetWithOverrider:(id)a5 isDefaultValue:(BOOL *)a6;
- (BOOL)isRequestingMenuPresentation;
- (BOOL)isRequestingMenuPresentationForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5;
- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7;
- (NSArray)preferredLayoutModeAssertions;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7;
- (NSString)description;
- (SAUILayoutModePreferring)layoutModePreference;
- (SAUILayoutSpecifying)layoutSpecifyingOverridingTarget;
- (SAUILayoutSpecifyingOverrider)initWithTarget:(id)a3;
- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion;
- (id)_behaviorOverridingParticipantSubordinate:(BOOL)a3 toParticipant:(id)a4 passingTest:(id)a5;
- (id)_firstParticipantThatRespondsToSelector:(SEL)a3;
- (id)behaviorOverridingParticipantSubordinateToParticipant:(id)a3;
- (id)behaviorOverridingParticipantSuperiorToParticipant:(id)a3;
- (id)behaviorOverridingTarget;
- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (id)layoutSpecifyingOverridingParticipantSubordinateToParticipant:(id)a3 thatRespondsToSelector:(SEL)a4;
- (id)layoutSpecifyingOverridingParticipantSuperiorToParticipant:(id)a3 thatRespondsToSelector:(SEL)a4;
- (id)preferredLayoutModeAssertionForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (int64_t)behaviorOverridingRole;
- (int64_t)layoutMode;
- (int64_t)layoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (int64_t)preferredLayoutMode;
- (int64_t)preferredLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (void)addBehaviorOverridingParticipant:(id)a3;
- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3;
- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3 forTargetWithOverrider:(id)a4;
- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3;
- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3 forTargetWithOverrider:(id)a4;
- (void)removeBehaviorOverridingParticipant:(id)a3;
- (void)removeBehaviorOverridingParticipantWithRole:(int64_t)a3;
- (void)setLayoutMode:(int64_t)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5;
- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5;
@end

@implementation SAUILayoutSpecifyingOverrider

- (void)addBehaviorOverridingParticipant:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    v4 = self;
    objc_sync_enter(v4);
    orderedBehaviorOverridingParticipants = v4->_orderedBehaviorOverridingParticipants;
    if (!orderedBehaviorOverridingParticipants)
    {
      uint64_t v6 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
      v7 = v4->_orderedBehaviorOverridingParticipants;
      v4->_orderedBehaviorOverridingParticipants = (NSPointerArray *)v6;

      orderedBehaviorOverridingParticipants = v4->_orderedBehaviorOverridingParticipants;
    }
    [(NSPointerArray *)orderedBehaviorOverridingParticipants sa_compact];
    if ([(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants count])
    {
      uint64_t v8 = [v12 behaviorOverridingRole];
      for (unint64_t i = 0; ; ++i)
      {
        if (i >= [(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants count]) {
          goto LABEL_14;
        }
        v10 = [(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants pointerAtIndex:i];
        uint64_t v11 = [v10 behaviorOverridingRole];
        if (v11 == v8) {
          break;
        }
        if (v11 < v8)
        {
          [(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants insertPointer:v12 atIndex:i];
          goto LABEL_13;
        }
      }
      [(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants replacePointerAtIndex:i withPointer:v12];
LABEL_13:

      goto LABEL_14;
    }
    [(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants addPointer:v12];
LABEL_14:
    objc_sync_exit(v4);
  }
}

- (int64_t)layoutMode
{
  char v6 = 0;
  v3 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_layoutModeForTargetWithOverrider_isDefaultValue_];
  int64_t v4 = [v3 layoutModeForTargetWithOverrider:self isDefaultValue:&v6];

  return v4;
}

- (int64_t)layoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [WeakRetained layoutMode];
  }
  else
  {
    int64_t v6 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v6;
}

- (id)_firstParticipantThatRespondsToSelector:(SEL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = self;
  objc_sync_enter(v3);
  [(NSPointerArray *)v3->_orderedBehaviorOverridingParticipants sa_compact];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v4 = v3->_orderedBehaviorOverridingParticipants;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  objc_sync_exit(v3);
  return v9;
}

- (SAUILayoutSpecifyingOverrider)initWithTarget:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SAUILayoutSpecifyingOverrider;
  uint64_t v5 = [(SAUILayoutSpecifyingOverrider *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_behaviorOverridingTarget, v4);
    [(SAUILayoutSpecifyingOverrider *)v6 addBehaviorOverridingParticipant:v6];
  }

  return v6;
}

- (id)_behaviorOverridingParticipantSubordinate:(BOOL)a3 toParticipant:(id)a4 passingTest:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  if (v8)
  {
    v10 = self;
    objc_sync_enter(v10);
    [(NSPointerArray *)v10->_orderedBehaviorOverridingParticipants sa_compact];
    uint64_t v11 = [(NSPointerArray *)v10->_orderedBehaviorOverridingParticipants count];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    long long v12 = [(NSPointerArray *)v10->_orderedBehaviorOverridingParticipants allObjects];
    if (v6) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 2;
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __101__SAUILayoutSpecifyingOverrider__behaviorOverridingParticipantSubordinate_toParticipant_passingTest___block_invoke;
    v17[3] = &unk_26552BF08;
    v21 = v25;
    BOOL v24 = v6;
    uint64_t v23 = v11;
    id v18 = v8;
    v19 = v10;
    id v20 = v9;
    v22 = &v27;
    [v12 enumerateObjectsWithOptions:v13 usingBlock:v17];

    _Block_object_dispose(v25, 8);
    objc_sync_exit(v10);

    long long v14 = (void *)v28[5];
  }
  else
  {
    long long v14 = 0;
  }
  id v15 = v14;
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __101__SAUILayoutSpecifyingOverrider__behaviorOverridingParticipantSubordinate_toParticipant_passingTest___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24)
    || (*(unsigned char *)(v8 + 24) = *(void *)(a1 + 32) == (void)v7,
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)))
  {
    if (*(unsigned char *)(a1 + 80))
    {
      if (*(void *)(a1 + 72) - 1 <= a3) {
        goto LABEL_13;
      }
      unint64_t v9 = a3 + 1;
    }
    else
    {
      if (!a3) {
        goto LABEL_13;
      }
      unint64_t v9 = a3 - 1;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = v7;
      v10 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "pointerAtIndex:");
      uint64_t v11 = *(void *)(a1 + 48);
      if (!v11 || (*(unsigned int (**)(uint64_t, void *))(v11 + 16))(v11, v10))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v10);
        *a4 = 1;
      }

      id v7 = v12;
    }
  }
LABEL_13:
}

- (id)behaviorOverridingParticipantSubordinateToParticipant:(id)a3
{
  return [(SAUILayoutSpecifyingOverrider *)self _behaviorOverridingParticipantSubordinate:1 toParticipant:a3 passingTest:0];
}

- (id)behaviorOverridingParticipantSuperiorToParticipant:(id)a3
{
  return [(SAUILayoutSpecifyingOverrider *)self _behaviorOverridingParticipantSubordinate:0 toParticipant:a3 passingTest:0];
}

- (void)removeBehaviorOverridingParticipant:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = self;
    objc_sync_enter(v4);
    for (unint64_t i = 0; i < [(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants count]; ++i)
    {
      if ([(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants pointerAtIndex:i] == v6)
      {
        [(NSPointerArray *)v4->_orderedBehaviorOverridingParticipants removePointerAtIndex:i];
        break;
      }
    }
    objc_sync_exit(v4);
  }
}

- (void)removeBehaviorOverridingParticipantWithRole:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  for (unint64_t i = 0; i < [(NSPointerArray *)obj->_orderedBehaviorOverridingParticipants count]; ++i)
  {
    uint64_t v5 = [(NSPointerArray *)obj->_orderedBehaviorOverridingParticipants pointerAtIndex:i];
    if ([v5 behaviorOverridingRole] == a3)
    {
      [(NSPointerArray *)obj->_orderedBehaviorOverridingParticipants removePointerAtIndex:i];

      break;
    }
  }
  objc_sync_exit(obj);
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  id v7 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_setLayoutMode_reason_forTargetWithOverrider_];
  [v7 setLayoutMode:a3 reason:a4 forTargetWithOverrider:self];
}

- (void)setLayoutMode:(int64_t)a3
{
}

- (int64_t)minimumSupportedLayoutMode
{
  char v6 = 0;
  v3 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_minimumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_];
  int64_t v4 = [v3 minimumSupportedLayoutModeForTargetWithOverrider:self isDefaultValue:&v6];

  return v4;
}

- (int64_t)maximumSupportedLayoutMode
{
  char v6 = 0;
  v3 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_maximumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_];
  int64_t v4 = [v3 maximumSupportedLayoutModeForTargetWithOverrider:self isDefaultValue:&v6];

  return v4;
}

- (int64_t)preferredLayoutMode
{
  v2 = [(SAUILayoutSpecifyingOverrider *)self layoutModePreference];
  int64_t v3 = [v2 preferredLayoutMode];

  return v3;
}

- (BOOL)isInteractiveDismissalEnabled
{
  v2 = self;
  char v5 = 0;
  int64_t v3 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_isInteractiveDismissalEnabledForTargetWithOverrider_isDefaultValue_];
  LOBYTE(v2) = [v3 isInteractiveDismissalEnabledForTargetWithOverrider:v2 isDefaultValue:&v5];

  return (char)v2;
}

- (BOOL)isMinimalPresentationPossible
{
  v2 = self;
  char v5 = 0;
  int64_t v3 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_isMinimalPresentationPossibleForTargetWithOverrider_isDefaultValue_];
  LOBYTE(v2) = [v3 isMinimalPresentationPossibleForTargetWithOverrider:v2 isDefaultValue:&v5];

  return (char)v2;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  double v9 = a4.trailing;
  double v10 = a4.bottom;
  double v11 = a4.leading;
  double v12 = a4.top;
  char v28 = 0;
  id v15 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_forTargetWithOverrider_isDefaultValue_];
  objc_msgSend(v15, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:forTargetWithOverrider:isDefaultValue:", a3, self, &v28, v12, v11, v10, v9, top, leading, bottom, trailing);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.double trailing = v27;
  result.double bottom = v26;
  result.double leading = v25;
  result.double top = v24;
  return result;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  char v17 = 0;
  id v9 = a4;
  double v10 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_sizeThatFitsSize_forProvidedView_inLayoutMode_forTargetWithOverrider_isDefaultValue_];
  objc_msgSend(v10, "sizeThatFitsSize:forProvidedView:inLayoutMode:forTargetWithOverrider:isDefaultValue:", v9, a5, self, &v17, width, height);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  char v9 = 0;
  id v6 = a3;
  id v7 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_isProvidedViewConcentric_inLayoutMode_forTargetWithOverrider_isDefaultValue_];
  LOBYTE(a4) = [v7 isProvidedViewConcentric:v6 inLayoutMode:a4 forTargetWithOverrider:self isDefaultValue:&v9];

  return a4;
}

- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3
{
  id v4 = a3;
  id v5 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_layoutHostContainerViewWillLayoutSubviews_forTargetWithOverrider_];
  [v5 layoutHostContainerViewWillLayoutSubviews:v4 forTargetWithOverrider:self];
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  id v4 = a3;
  id v5 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_layoutHostContainerViewDidLayoutSubviews_forTargetWithOverrider_];
  [v5 layoutHostContainerViewDidLayoutSubviews:v4 forTargetWithOverrider:self];
}

- (BOOL)isRequestingMenuPresentation
{
  v2 = self;
  char v5 = 0;
  int64_t v3 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_isRequestingMenuPresentationForTargetWithOverrider_isDefaultValue_];
  LOBYTE(v2) = [v3 isRequestingMenuPresentationForTargetWithOverrider:v2 isDefaultValue:&v5];

  return (char)v2;
}

- (SAUILayoutModePreferring)layoutModePreference
{
  char v6 = 0;
  int64_t v3 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_layoutModePreferenceForTargetWithOverrider_isDefaultValue_];
  id v4 = [v3 layoutModePreferenceForTargetWithOverrider:self isDefaultValue:&v6];

  return (SAUILayoutModePreferring *)v4;
}

- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion
{
  char v6 = 0;
  int64_t v3 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_preferredLayoutModeAssertionForTargetWithOverrider_isDefaultValue_];
  id v4 = [v3 preferredLayoutModeAssertionForTargetWithOverrider:self isDefaultValue:&v6];

  return (SAUIPreferredLayoutModeAssertion *)v4;
}

- (NSArray)preferredLayoutModeAssertions
{
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v4 = [(SAUILayoutSpecifyingOverrider *)self preferredLayoutModeAssertion];
  char v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

  return (NSArray *)v5;
}

- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  id v7 = [(SAUILayoutSpecifyingOverrider *)self _firstParticipantThatRespondsToSelector:sel_setPreferredLayoutMode_reason_forTargetWithOverrider_];
  [v7 setPreferredLayoutMode:a3 reason:a4 forTargetWithOverrider:self];
}

- (int64_t)behaviorOverridingRole
{
  return 0;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setLayoutMode:a3 reason:a4];
  }
}

- (int64_t)minimumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [WeakRetained minimumSupportedLayoutMode];
  }
  else
  {
    int64_t v6 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v6;
}

- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [WeakRetained maximumSupportedLayoutMode];
  }
  else
  {
    int64_t v6 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v6;
}

- (int64_t)preferredLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v4 = [(SAUILayoutSpecifyingOverrider *)self layoutModePreferenceForTargetWithOverrider:a3 isDefaultValue:a4];
  int64_t v5 = [v4 preferredLayoutMode];

  return v5;
}

- (BOOL)isInteractiveDismissalEnabledForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    char v6 = [WeakRetained isInteractiveDismissalEnabled];
  }
  else
  {
    char v6 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v6;
}

- (BOOL)isMinimalPresentationPossibleForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    char v6 = [WeakRetained isMinimalPresentationPossible];
  }
  else
  {
    char v6 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v6;
}

- (id)preferredLayoutModeAssertionForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    char v6 = [WeakRetained preferredLayoutModeAssertion];
  }
  else
  {
    char v6 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v6;
}

- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [WeakRetained layoutModePreference];
LABEL_5:
    char v9 = (SAUILayoutModePreference *)v6;
    goto LABEL_6;
  }
  char v7 = objc_opt_respondsToSelector();
  uint64_t v8 = [SAUILayoutModePreference alloc];
  if (v7)
  {
    uint64_t v6 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:](v8, "initWithPreferredLayoutMode:reason:", [WeakRetained preferredLayoutMode], 1);
    goto LABEL_5;
  }
  char v9 = [(SAUILayoutModePreference *)v8 initWithPreferredLayoutMode:2 reason:0];
  if (a4) {
    *a4 = 1;
  }
LABEL_6:

  return v9;
}

- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setPreferredLayoutMode:a3 reason:a4];
  }
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  double v12 = a4.trailing;
  double v13 = a4.bottom;
  double v14 = a4.leading;
  double v15 = a4.top;
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:", a3, v15, v14, v13, v12, top, leading, bottom, trailing);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    double v19 = *MEMORY[0x263F1C228];
    double v21 = *(double *)(MEMORY[0x263F1C228] + 8);
    double v23 = *(double *)(MEMORY[0x263F1C228] + 16);
    double v25 = *(double *)(MEMORY[0x263F1C228] + 24);
    if (a7) {
      *a7 = 1;
    }
  }

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.double trailing = v29;
  result.double bottom = v28;
  result.double leading = v27;
  result.double top = v26;
  return result;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double height = a3.height;
  double width = a3.width;
  id v12 = a4;
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(WeakRetained, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v12, a5, width, height);
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v15 = *MEMORY[0x263F001B0];
    double v17 = *(double *)(MEMORY[0x263F001B0] + 8);
    if (a7) {
      *a7 = 1;
    }
  }

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4 forTargetWithOverrider:(id)a5 isDefaultValue:(BOOL *)a6
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    char v11 = [WeakRetained isProvidedViewConcentric:v9 inLayoutMode:a4];
  }
  else
  {
    char v11 = 1;
    if (a6) {
      *a6 = 1;
    }
  }

  return v11;
}

- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3 forTargetWithOverrider:(id)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained layoutHostContainerViewWillLayoutSubviews:v6];
  }
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3 forTargetWithOverrider:(id)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained layoutHostContainerViewDidLayoutSubviews:v6];
  }
}

- (BOOL)isRequestingMenuPresentationForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector())
  {
    char v6 = [WeakRetained isRequestingMenuPresentation];
  }
  else
  {
    char v6 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v6;
}

- (SAUILayoutSpecifying)layoutSpecifyingOverridingTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if (objc_opt_respondsToSelector()) {
    id v3 = WeakRetained;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)layoutSpecifyingOverridingParticipantSubordinateToParticipant:(id)a3 thatRespondsToSelector:(SEL)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __118__SAUILayoutSpecifyingOverrider_layoutSpecifyingOverridingParticipantSubordinateToParticipant_thatRespondsToSelector___block_invoke;
  v6[3] = &__block_descriptor_40_e43_B16__0___SABehaviorOverridingParticipant__8l;
  v6[4] = a4;
  id v4 = [(SAUILayoutSpecifyingOverrider *)self _behaviorOverridingParticipantSubordinate:1 toParticipant:a3 passingTest:v6];
  return v4;
}

uint64_t __118__SAUILayoutSpecifyingOverrider_layoutSpecifyingOverridingParticipantSubordinateToParticipant_thatRespondsToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)layoutSpecifyingOverridingParticipantSuperiorToParticipant:(id)a3 thatRespondsToSelector:(SEL)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __115__SAUILayoutSpecifyingOverrider_layoutSpecifyingOverridingParticipantSuperiorToParticipant_thatRespondsToSelector___block_invoke;
  v6[3] = &__block_descriptor_40_e43_B16__0___SABehaviorOverridingParticipant__8l;
  v6[4] = a4;
  id v4 = [(SAUILayoutSpecifyingOverrider *)self _behaviorOverridingParticipantSubordinate:0 toParticipant:a3 passingTest:v6];
  return v4;
}

uint64_t __115__SAUILayoutSpecifyingOverrider_layoutSpecifyingOverridingParticipantSuperiorToParticipant_thatRespondsToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (NSString)description
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  char v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  char v7 = self;
  objc_sync_enter(v7);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = (id *)&v7->super.isa;
  uint64_t v8 = v7->_orderedBehaviorOverridingParticipants;
  uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v13 = [v12 behaviorOverridingRole];
        double v14 = @"[UNKNOWN]";
        if (v13 <= 3) {
          double v14 = off_26552BF48[v13];
        }
        double v15 = (objc_class *)objc_opt_class();
        double v16 = NSStringFromClass(v15);
        [v6 appendFormat:@"; '%@': <%@: %p>", v14, v16, v12];
      }
      uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  objc_sync_exit(obj);
  id WeakRetained = objc_loadWeakRetained(obj + 2);
  double v18 = (objc_class *)objc_opt_class();
  double v19 = NSStringFromClass(v18);
  [v6 appendFormat:@"; 'behaviorOverridingTarget': <%@: %p>", v19, WeakRetained];

  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (id)behaviorOverridingTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_behaviorOverridingTarget);
  objc_storeStrong((id *)&self->_orderedBehaviorOverridingParticipants, 0);
}

@end