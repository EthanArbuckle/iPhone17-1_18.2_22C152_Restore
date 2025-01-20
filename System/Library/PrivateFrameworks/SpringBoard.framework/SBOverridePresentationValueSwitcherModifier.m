@interface SBOverridePresentationValueSwitcherModifier
- (SBOverridePresentationValueSwitcherModifier)initWithAnimatablePropertyKeys:(id)a3 presentationValue:(double)a4;
- (double)presentationValueForAnimatableProperty:(id)a3;
@end

@implementation SBOverridePresentationValueSwitcherModifier

- (SBOverridePresentationValueSwitcherModifier)initWithAnimatablePropertyKeys:(id)a3 presentationValue:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBOverridePresentationValueSwitcherModifier;
  v7 = [(SBSwitcherModifier *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    keys = v7->_keys;
    v7->_keys = (NSSet *)v8;

    v7->_presentationValue = a4;
  }

  return v7;
}

- (double)presentationValueForAnimatableProperty:(id)a3
{
  id v4 = a3;
  if ([(NSSet *)self->_keys containsObject:v4])
  {
    double presentationValue = self->_presentationValue;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBOverridePresentationValueSwitcherModifier;
    [(SBOverridePresentationValueSwitcherModifier *)&v8 presentationValueForAnimatableProperty:v4];
    double presentationValue = v6;
  }

  return presentationValue;
}

- (void).cxx_destruct
{
}

@end