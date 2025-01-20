@interface SBSAElementContentProvider
+ (id)appearanceTransitionElementContentProviderWithParentProvider:(id)a3 staticLayoutTransition:(id)a4;
+ (id)disappearanceTransitionElementContentProviderWithParentProvider:(id)a3 staticLayoutTransition:(id)a4;
- (SBSAElementContentProvider)initWithParentProvider:(id)a3;
- (SBSAElementLayoutTransition)staticLayoutTransition;
- (double)_sensorObscuringShadowApexMilestone;
- (id)_initWithParentProvider:(id)a3 transitionDirection:(int64_t)a4 staticLayoutTransition:(id)a5;
- (id)_updatedElementDescriptionFromDescription:(id)a3 layoutTransition:(id)a4 transitionDescriptions:(id)a5 context:(id)a6;
- (id)defaultTransitionSettings;
- (id)description;
- (id)preferencesFromContext:(id)a3;
- (int64_t)transitionDirection;
@end

@implementation SBSAElementContentProvider

- (id)preferencesFromContext:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;

    if (!v8)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v47 = NSClassFromString(&cfstr_Sbsacontext.isa);
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      [v46 handleFailureInMethod:a2, self, @"SBSAElementContentProvider.m", 96, @"Unexpected class – expected '%@', got '%@'", v47, v49 object file lineNumber description];
    }
  }
  else
  {
    id v8 = 0;
  }
  id v58 = v8;

  v9 = [v8 preferences];
  v54 = v4;
  if (v9)
  {
    v10 = self;
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    if (!v13)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v51 = NSClassFromString(&cfstr_Sbsapreference.isa);
      v52 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v52);
      [v50 handleFailureInMethod:a2, self, @"SBSAElementContentProvider.m", 97, @"Unexpected class – expected '%@', got '%@'", v51, v53, v54 object file lineNumber description];
    }
  }
  else
  {
    id v13 = 0;
  }

  v56 = v13;
  if (self->_pendingSensorObscuringShadowProperty)
  {
    [(SBSAElementContentProvider *)self _sensorObscuringShadowApexMilestone];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v14 = [v8 animatedTransitionResults];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v72 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          v20 = [v19 associatedInterfaceElementPropertyIdentity];
          if (BSEqualObjects())
          {
            [v19 targetedMilestone];
            int v21 = BSFloatApproximatelyEqualToFloat();

            if (v21) {
              self->_sensorObscuringShadowDisappearingIfTransitioning = 1;
            }
          }
          else
          {
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v71 objects:v76 count:16];
      }
      while (v16);
    }

    id v13 = v56;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v23 = [v13 elementDescriptions];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (!v24)
  {
    BOOL v26 = 0;
    goto LABEL_48;
  }
  uint64_t v25 = v24;
  BOOL v26 = 0;
  uint64_t v27 = *(void *)v68;
  do
  {
    for (uint64_t j = 0; j != v25; ++j)
    {
      if (*(void *)v68 != v27) {
        objc_enumerationMutation(v23);
      }
      uint64_t v29 = *(void *)(*((void *)&v67 + 1) + 8 * j);
      staticLayoutTransition = self->_staticLayoutTransition;
      if (staticLayoutTransition)
      {
        v31 = [(SBSAElementContentProvider *)self _updatedElementDescriptionFromDescription:*(void *)(*((void *)&v67 + 1) + 8 * j) layoutTransition:staticLayoutTransition transitionDescriptions:v22 context:v8];
        if (!v31) {
          goto LABEL_44;
        }
      }
      else
      {
        v32 = [v56 elementLayoutTransition];
        v31 = [(SBSAElementContentProvider *)self _updatedElementDescriptionFromDescription:v29 layoutTransition:v32 transitionDescriptions:v22 context:v58];

        id v8 = v58;
        if (!v31) {
          goto LABEL_44;
        }
      }
      [v57 addObject:v31];
      if (v26)
      {
        BOOL v26 = 1;
      }
      else
      {
        [v31 sensorObscuringShadowProgress];
        BOOL v26 = v33 > 0.0;
      }
LABEL_44:
    }
    uint64_t v25 = [v23 countByEnumeratingWithState:&v67 objects:v75 count:16];
  }
  while (v25);
LABEL_48:

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __53__SBSAElementContentProvider_preferencesFromContext___block_invoke;
  v63[3] = &unk_1E6AF93C8;
  SEL v66 = a2;
  v63[4] = self;
  id v34 = v57;
  id v64 = v34;
  id v35 = v22;
  id v65 = v35;
  v36 = (void *)MEMORY[0x1D948C7A0](v63);
  if (v56)
  {
    v37 = (void *)[v56 copyWithBlock:v36];
  }
  else
  {
    v37 = +[SBSAPreferences instanceWithBlock:v36];
  }
  v38 = (void *)[v8 copyByUpdatingPreferences:v37];

  v62.receiver = self;
  v62.super_class = (Class)SBSAElementContentProvider;
  v39 = [(SBSABasePreferencesProvider *)&v62 preferencesFromContext:v38];
  uint64_t v40 = objc_opt_class();
  id v41 = v39;
  if (v40)
  {
    if (objc_opt_isKindOfClass()) {
      v42 = v41;
    }
    else {
      v42 = 0;
    }
  }
  else
  {
    v42 = 0;
  }
  id v43 = v42;

  if (v26)
  {
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __53__SBSAElementContentProvider_preferencesFromContext___block_invoke_2;
    v59[3] = &unk_1E6AF9DA0;
    id v60 = v43;
    SEL v61 = a2;
    v59[4] = self;
    id v43 = (id)[v43 copyWithBlock:v59];
  }
  id v44 = v43;

  return v44;
}

- (double)_sensorObscuringShadowApexMilestone
{
  v2 = [(id)objc_opt_class() settings];
  [v2 sensorObscuringShadowApexProgress];
  double v4 = v3;

  return v4;
}

void __53__SBSAElementContentProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  double v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAElementContentProvider.m", 118, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }
  uint64_t v25 = v3;

  [v7 setElementDescriptions:*(void *)(a1 + 40)];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v20 = [*(id *)(a1 + 48) objectForKey:v19];
        uint64_t v21 = objc_opt_class();
        id v22 = v20;
        if (v21)
        {
          if (objc_opt_isKindOfClass()) {
            v23 = v22;
          }
          else {
            v23 = 0;
          }
        }
        else
        {
          v23 = 0;
        }
        id v24 = v23;

        if (v24) {
          [v7 associateAnimatedTransitionDescriptionOfProperty:v24 withProperty:v19 withMilestones:0];
        }
        else {
          [v7 setAnimatedTransitionDescription:v22 forProperty:v19 withMilestones:0];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }
}

- (id)_initWithParentProvider:(id)a3 transitionDirection:(int64_t)a4 staticLayoutTransition:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSAElementContentProvider;
  uint64_t v9 = [(SBSABasePreferencesProvider *)&v14 initWithParentProvider:a3];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_transitionDirection = a4;
    uint64_t v11 = [v8 copy];
    staticLayoutTransition = v10->_staticLayoutTransition;
    v10->_staticLayoutTransition = (SBSAElementLayoutTransition *)v11;
  }
  return v10;
}

+ (id)disappearanceTransitionElementContentProviderWithParentProvider:(id)a3 staticLayoutTransition:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithParentProvider:v6 transitionDirection:-1 staticLayoutTransition:v5];

  return v7;
}

+ (id)appearanceTransitionElementContentProviderWithParentProvider:(id)a3 staticLayoutTransition:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithParentProvider:v6 transitionDirection:1 staticLayoutTransition:v5];

  return v7;
}

- (SBSAElementContentProvider)initWithParentProvider:(id)a3
{
  return (SBSAElementContentProvider *)[(SBSAElementContentProvider *)self _initWithParentProvider:a3 transitionDirection:0 staticLayoutTransition:0];
}

- (id)defaultTransitionSettings
{
  v2 = [(id)objc_opt_class() settings];
  id v3 = [v2 elementContentTransitionSettings];

  return v3;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_transitionDirection + 1;
  if (v5 > 2) {
    id v6 = @"[invalid]";
  }
  else {
    id v6 = off_1E6AFE060[v5];
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; transitionDirection: %@; staticLayoutTransition: %@>",
               v4,
               self,
               v6,
               self->_staticLayoutTransition);
}

void __53__SBSAElementContentProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v24 = a2;
  if (v24)
  {
    id v3 = self;
    id v4 = v24;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v5 = v4;
      }
      else {
        unint64_t v5 = 0;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAElementContentProvider.m", 135, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  id v13 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_super v14 = [*(id *)(a1 + 40) containerViewDescriptions];
  uint64_t v15 = [v14 firstObject];
  uint64_t v16 = [v15 interfaceElementIdentifier];
  uint64_t v17 = [(SBSAInterfaceElementPropertyIdentity *)v13 initWithAssociatedInterfaceElementIdentifier:v16 andProperty:@"bounds"];
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = NSNumber;
  [*(id *)(a1 + 32) _sensorObscuringShadowApexMilestone];
  id v22 = objc_msgSend(v21, "numberWithDouble:");
  v23 = [v20 setWithObject:v22];
  [v6 addMilestones:v23 forPropertyIdentity:*(void *)(*(void *)(a1 + 32) + 40)];
}

- (id)_updatedElementDescriptionFromDescription:(id)a3 layoutTransition:(id)a4 transitionDescriptions:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (v11)
  {
    uint64_t v16 = [v14 preferences];
    uint64_t v17 = [v11 associatedSystemApertureElementIdentity];
    uint64_t v18 = [v15 elementContexts];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke;
    v38[3] = &unk_1E6AF9378;
    id v19 = v17;
    id v39 = v19;
    v20 = objc_msgSend(v18, "bs_firstObjectPassingTest:", v38);

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_2;
    v36[3] = &unk_1E6AF93F0;
    v36[4] = self;
    id v37 = v13;
    uint64_t v21 = (void *)MEMORY[0x1D948C7A0](v36);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_3;
    v27[3] = &unk_1E6AFE040;
    SEL v35 = a2;
    v27[4] = self;
    id v28 = v12;
    id v29 = v19;
    id v30 = v16;
    id v31 = v11;
    id v32 = v15;
    id v33 = v20;
    id v34 = v21;
    id v22 = v21;
    id v23 = v20;
    id v24 = v16;
    id v25 = v19;
    id v11 = (id)[v11 copyWithBlock:v27];
  }
  return v11;
}

uint64_t __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke()
{
  return SAElementIdentityEqualToIdentity();
}

void __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a2 && a3)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = a3;
    id v9 = a2;
    id v12 = (id)[v7 newAnimatedTransitionDescriptionForProperty:v8 animated:a4];
    Class v10 = *(void **)(a1 + 40);
    id v11 = [[SBSAInterfaceElementPropertyIdentity alloc] initWithAssociatedInterfaceElementIdentifier:v9 andProperty:v8];

    [v10 setObject:v12 forKey:v11];
  }
}

void __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = self;
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7) {
      goto LABEL_10;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 96);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsaelementdes.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAElementContentProvider.m", 178, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v7 = 0;
LABEL_10:

  id v14 = [*(id *)(a1 + 40) initialElementContexts];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_4;
  v65[3] = &unk_1E6AF9378;
  id v66 = *(id *)(a1 + 48);
  id v57 = objc_msgSend(v14, "bs_firstObjectPassingTest:", v65);
  int v15 = [*(id *)(a1 + 56) isCollisionImminent];
  uint64_t v16 = [*(id *)(a1 + 64) associatedSystemApertureElementIdentity];
  uint64_t v17 = [*(id *)(a1 + 72) containerViewDescriptions];
  uint64_t v18 = SBSAObjectInCollectionAssociatedWithElementIdentity(v16, v17, 0);

  [v18 bounds];
  [v18 center];
  SBUnintegralizedRectCenteredAboutPoint();
  [*(id *)(a1 + 72) inertContainerFrame];
  int v19 = SBSARectApproximatelyEqualToRect();
  if (*(void *)(a1 + 80)) {
    int v20 = v19;
  }
  else {
    int v20 = 1;
  }
  uint64_t v21 = objc_msgSend(*(id *)(a1 + 56), "lastChangingElementLayoutTransition", 0x3F847AE147AE147BLL);
  int v58 = [v21 elementWithIdentityWasOrIsSensorAttached:*(void *)(a1 + 48)];

  if (v14) {
    unsigned int v22 = 2;
  }
  else {
    unsigned int v22 = 1;
  }
  if (v14) {
    unsigned int v23 = 3;
  }
  else {
    unsigned int v23 = 0;
  }
  if (v20) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = v22;
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 48);
  if (!v25) {
    goto LABEL_30;
  }
  if (v25 == -1) {
    char v26 = v15;
  }
  else {
    char v26 = 0;
  }
  uint64_t v27 = 1;
  if ((v24 - 1) >= 2) {
    uint64_t v27 = -1;
  }
  if ((v26 & 1) != 0 || v25 == v27)
  {
LABEL_30:
    uint64_t v28 = [*(id *)(a1 + 72) layoutDirection];
    id v29 = *(void **)(a1 + 80);
    if (v29) {
      uint64_t v30 = [v29 layoutMode];
    }
    else {
      uint64_t v30 = 0;
    }
    v55 = v14;
    if (v57) {
      uint64_t v31 = [v57 layoutMode];
    }
    else {
      uint64_t v31 = 0;
    }
    id v56 = v3;
    id v32 = [v7 interfaceElementIdentifier];
    [v7 setAppearState:v24];
    double v33 = 0.0;
    double v34 = 0.0;
    if (v58 && (!v30 || v31 != v30) && !*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
      double v34 = 1.0;
    }
    [v7 setSensorObscuringShadowProgress:v34];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    BOOL v35 = v30 == 2;
    if (v30 == 3) {
      int v36 = v15;
    }
    else {
      int v36 = 1;
    }
    if (v30 < 3) {
      int v37 = 1;
    }
    else {
      int v37 = v15;
    }
    if (v37) {
      double v38 = 1.0;
    }
    else {
      double v38 = 0.0;
    }
    int v39 = v35 & ~v15;
    if (v39) {
      double v40 = 0.0;
    }
    else {
      double v40 = 1.0;
    }
    if ((v35 & ~v15) != 0) {
      double v41 = 1.0;
    }
    else {
      double v41 = 0.0;
    }
    if ((v35 & ~v15) == 0) {
      double v33 = v38;
    }
    objc_msgSend(v7, "setLeadingViewBlurProgress:", v40, 1.0, v38);
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    [v7 setLeadingViewAlpha:v41];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    if (v7) {
      [v7 leadingViewTransform];
    }
    else {
      memset(v63, 0, sizeof(v63));
    }
    [*(id *)(a1 + 80) preferredLeadingBounds];
    double Width = CGRectGetWidth(v67);
    SBSASquishedTransform(v63, 1, v28 == 1, &v64, v33, Width);
    [v7 setLeadingViewTransform:&v64];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    BOOL v43 = ([*(id *)(a1 + 80) systemApertureLayoutCustomizingOptions] & 2) == 0;
    if ((v39 & v43) != 0) {
      double v44 = 0.0;
    }
    else {
      double v44 = 1.0;
    }
    if ((v39 & v43) != 0) {
      double v45 = 1.0;
    }
    else {
      double v45 = 0.0;
    }
    [v7 setTrailingViewBlurProgress:v44];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    [v7 setTrailingViewAlpha:v45];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    if (v7) {
      [v7 trailingViewTransform];
    }
    else {
      memset(v61, 0, sizeof(v61));
    }
    id v3 = v56;
    [*(id *)(a1 + 80) preferredTrailingBounds];
    double v46 = CGRectGetWidth(v68);
    SBSASquishedTransform(v61, 0, v28 == 1, &v62, v33, v46);
    [v7 setTrailingViewTransform:&v62];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    if (v30 == 1) {
      int v47 = v15;
    }
    else {
      int v47 = 1;
    }
    if (v47) {
      double v48 = 1.0;
    }
    else {
      double v48 = 0.0;
    }
    if (v47) {
      double v49 = 0.0;
    }
    else {
      double v49 = 1.0;
    }
    [v7 setMinimalViewBlurProgress:v48];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    [v7 setMinimalViewAlpha:v49];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    if (v30 < 2) {
      int v50 = 1;
    }
    else {
      int v50 = v15;
    }
    if ((v47 & v58 & v50) != 0) {
      double v51 = 1.0;
    }
    else {
      double v51 = 0.0;
    }
    if (v7) {
      [v7 minimalViewTransform];
    }
    else {
      memset(v59, 0, sizeof(v59));
    }
    [*(id *)(a1 + 80) preferredMinimalBounds];
    double v52 = CGRectGetWidth(v69);
    SBSASquishedTransform(v59, 1, v28 == 1, &v60, v51, v52);
    [v7 setMinimalViewTransform:&v60];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    if (v36) {
      double v53 = 1.0;
    }
    else {
      double v53 = 0.0;
    }
    if (v36) {
      double v54 = 0.0;
    }
    else {
      double v54 = 1.0;
    }
    [v7 setCustomContentBlurProgress:v53];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    [v7 setCustomContentAlpha:v54];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();

    id v14 = v55;
  }
}

uint64_t __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_4()
{
  return SAElementIdentityEqualToIdentity();
}

- (int64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (SBSAElementLayoutTransition)staticLayoutTransition
{
  return self->_staticLayoutTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticLayoutTransition, 0);
  objc_storeStrong((id *)&self->_pendingSensorObscuringShadowProperty, 0);
}

@end