@interface SBInteractivePreferenceChangeDodgingModifier
- (BOOL)completesWhenChildrenComplete;
- (SBInteractivePreferenceChangeDodgingModifier)initWithIdentifier:(id)a3;
- (id)framesForIdentifiers;
- (id)handlePreferenceChangeEvent:(id)a3;
- (id)zOrderedIdentifiers;
- (int64_t)animationBehaviorModeForIdentifier:(id)a3;
@end

@implementation SBInteractivePreferenceChangeDodgingModifier

- (SBInteractivePreferenceChangeDodgingModifier)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
  v6 = [(SBChainableModifier *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = [[SBPreferenceChangeDodgingModifier alloc] initWithIdentifier:v7->_identifier animated:0];
    preferenceChangeModifier = v7->_preferenceChangeModifier;
    v7->_preferenceChangeModifier = v8;

    [(SBPreferenceChangeDodgingModifier *)v7->_preferenceChangeModifier setResignLifecycleManagement:1];
    [(SBPreferenceChangeDodgingModifier *)v7->_preferenceChangeModifier setBoostUpdatedIdentifier:1];
    [(SBChainableModifier *)v7 addChildModifier:v7->_preferenceChangeModifier];
  }

  return v7;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)handlePreferenceChangeEvent:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
  id v5 = [(SBDodgingModifier *)&v12 handlePreferenceChangeEvent:v4];
  v6 = [v4 identifier];
  if ([v6 isEqual:self->_identifier])
  {
    BOOL awaitingFinalAnimation = self->_awaitingFinalAnimation;

    if (!awaitingFinalAnimation)
    {
      unint64_t v8 = [v4 style];
      self->_style = v8;
      if (v8 != 1)
      {
        if ([v4 phase])
        {
          if (self->_style != 1 && [v4 phase] == 1) {
            self->_BOOL awaitingFinalAnimation = 1;
          }
        }
        else
        {
          [(SBChainableModifier *)self removeChildModifier:self->_preferenceChangeModifier];
          v9 = -[SBPreferenceChangeDodgingModifier initWithIdentifier:animated:]([SBPreferenceChangeDodgingModifier alloc], "initWithIdentifier:animated:", self->_identifier, [v4 style] == 2);
          preferenceChangeModifier = self->_preferenceChangeModifier;
          self->_preferenceChangeModifier = v9;

          [(SBPreferenceChangeDodgingModifier *)self->_preferenceChangeModifier setBoostUpdatedIdentifier:1];
          [(SBChainableModifier *)self addChildModifier:self->_preferenceChangeModifier];
        }
      }
      [v4 handleWithReason:@"Interactive preference change"];
    }
  }
  else
  {
  }
  return v5;
}

- (id)zOrderedIdentifiers
{
  v8.receiver = self;
  v8.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
  v3 = [(SBInteractivePreferenceChangeDodgingModifier *)&v8 zOrderedIdentifiers];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [v4 indexOfObject:self->_identifier];
  v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v5];
  [v4 moveObjectsAtIndexes:v6 toIndex:0];

  return v4;
}

- (id)framesForIdentifiers
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
  v3 = [(SBInteractivePreferenceChangeDodgingModifier *)&v33 framesForIdentifiers];
  if (self->_style == 1)
  {
    id v4 = [(SBInteractivePreferenceChangeDodgingModifier *)self preferenceForIdentifier:self->_identifier];
    uint64_t v5 = [v3 objectForKey:self->_identifier];
    [v5 CGRectValue];
    double v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    [v4 preferredSize];
    SBRectWithSize();
    [v4 preferredCenter];
    UIRectCenteredAboutPoint();
    double x = v37.origin.x;
    double y = v37.origin.y;
    v38.origin.double x = v7;
    v38.origin.double y = v9;
    v38.size.width = v11;
    v38.size.height = v13;
    if (!CGRectEqualToRect(v37, v38))
    {
      [v4 minimumSize];
      if (x <= v7)
      {
        memset(&v31[1], 0, 24);
        *(double *)v31 = v7;
        v16 = (double *)v31;
        double v7 = 1.79769313e308;
      }
      else
      {
        v32[0] = 0xFFEFFFFFFFFFFFFFLL;
        memset(&v32[1], 0, 24);
        v16 = (double *)v32;
      }
      v16[2] = v7;
      *((unsigned char *)v16 + 8) = 1;
      *((unsigned char *)v16 + 24) = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
      double v18 = v17;
      if (y <= v9)
      {
        *(double *)v29 = v9;
        v29[1] = 0;
        v29[2] = 0x7FEFFFFFFFFFFFFFLL;
        v29[3] = 0;
        v19 = v29;
      }
      else
      {
        v30[0] = 0u;
        v30[1] = *(unint64_t *)&v9;
        v19 = v30;
      }
      *((unsigned char *)v19 + 8) = 1;
      *((unsigned char *)v19 + 24) = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
      double v21 = v20;
      BSUIConstrainValueToIntervalWithRubberBand();
      double v23 = v22;
      BSUIConstrainValueToIntervalWithRubberBand();
      identifier = self->_identifier;
      v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v18, v21, v23, v24);
      v35[0] = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&identifier count:1];
      uint64_t v27 = objc_msgSend(v3, "bs_dictionaryByAddingEntriesFromDictionary:", v26);

      v3 = (void *)v27;
    }
  }
  return v3;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_identifier] && self->_style == 1)
  {
    int64_t v5 = 5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
    id v6 = [(SBInteractivePreferenceChangeDodgingModifier *)&v8 animationBehaviorModeForIdentifier:v4];
    if (v6 == (id)2) {
      int64_t v5 = 3;
    }
    else {
      int64_t v5 = (int64_t)v6;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceChangeModifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end