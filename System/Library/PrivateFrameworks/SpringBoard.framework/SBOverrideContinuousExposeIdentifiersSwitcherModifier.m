@interface SBOverrideContinuousExposeIdentifiersSwitcherModifier
- (NSArray)overrideContinuousExposeIdentifiersInStrip;
- (NSArray)overrideContinuousExposeIdentifiersInSwitcher;
- (SBOverrideContinuousExposeIdentifiersSwitcherModifier)initWithContinuousExposeIdentifiersInSwitcher:(id)a3 continuousExposeIdentifiersInStrip:(id)a4;
- (id)continuousExposeIdentifiersInStrip;
- (id)continuousExposeIdentifiersInSwitcher;
- (void)didMoveToParentModifier:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SBOverrideContinuousExposeIdentifiersSwitcherModifier

- (SBOverrideContinuousExposeIdentifiersSwitcherModifier)initWithContinuousExposeIdentifiersInSwitcher:(id)a3 continuousExposeIdentifiersInStrip:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
  v8 = [(SBSwitcherModifier *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    overrideContinuousExposeIdentifiersInSwitcher = v8->_overrideContinuousExposeIdentifiersInSwitcher;
    v8->_overrideContinuousExposeIdentifiersInSwitcher = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    overrideContinuousExposeIdentifiersInStrip = v8->_overrideContinuousExposeIdentifiersInStrip;
    v8->_overrideContinuousExposeIdentifiersInStrip = (NSArray *)v11;
  }
  return v8;
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3) {
    [(SBOverrideContinuousExposeIdentifiersSwitcherModifier *)self newContinuousExposeIdentifiersGenerationCount];
  }
}

- (void)setState:(int64_t)a3
{
  int64_t v5 = [(SBChainableModifier *)self state];
  if (a3 == 1 && v5 != 1)
  {
    id v6 = [(SBChainableModifier *)self parentModifier];
    if (v6)
    {

LABEL_6:
      [(SBOverrideContinuousExposeIdentifiersSwitcherModifier *)self newContinuousExposeIdentifiersGenerationCount];
      goto LABEL_7;
    }
    id v7 = [(SBChainableModifier *)self delegate];

    if (v7) {
      goto LABEL_6;
    }
  }
LABEL_7:
  v8.receiver = self;
  v8.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
  [(SBChainableModifier *)&v8 setState:a3];
}

- (id)continuousExposeIdentifiersInSwitcher
{
  overrideContinuousExposeIdentifiersInSwitcher = self->_overrideContinuousExposeIdentifiersInSwitcher;
  if (overrideContinuousExposeIdentifiersInSwitcher)
  {
    v3 = overrideContinuousExposeIdentifiersInSwitcher;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
    v3 = [(SBOverrideContinuousExposeIdentifiersSwitcherModifier *)&v5 continuousExposeIdentifiersInSwitcher];
  }
  return v3;
}

- (id)continuousExposeIdentifiersInStrip
{
  overrideContinuousExposeIdentifiersInStrip = self->_overrideContinuousExposeIdentifiersInStrip;
  if (overrideContinuousExposeIdentifiersInStrip)
  {
    v3 = overrideContinuousExposeIdentifiersInStrip;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
    v3 = [(SBOverrideContinuousExposeIdentifiersSwitcherModifier *)&v5 continuousExposeIdentifiersInStrip];
  }
  return v3;
}

- (NSArray)overrideContinuousExposeIdentifiersInSwitcher
{
  return self->_overrideContinuousExposeIdentifiersInSwitcher;
}

- (NSArray)overrideContinuousExposeIdentifiersInStrip
{
  return self->_overrideContinuousExposeIdentifiersInStrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideContinuousExposeIdentifiersInStrip, 0);
  objc_storeStrong((id *)&self->_overrideContinuousExposeIdentifiersInSwitcher, 0);
}

@end