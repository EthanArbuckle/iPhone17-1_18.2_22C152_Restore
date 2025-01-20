@interface SBTraitsSwitcherPolicySpecifier
- (NSString)primaryElementParticipantIdentifier;
- (SBTraitsSwitcherPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4;
- (id)_specifierDescription;
- (int64_t)resolutionPolicy;
- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4;
- (void)setPrimaryElementParticipantIdentifier:(id)a3;
- (void)setResolutionPolicy:(int64_t)a3;
@end

@implementation SBTraitsSwitcherPolicySpecifier

uint64_t __79__SBTraitsSwitcherPolicySpecifier__updateAcquiredParticipantsPolicies_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 role];
  uint64_t v3 = [v2 isEqual:@"SBTraitsParticipantRoleSwitcherRaw"];

  return v3;
}

- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4
{
  v6 = objc_msgSend(a3, "bs_firstObjectPassingTest:", &__block_literal_global_224, a4);
  id v10 = v6;
  switch(self->_resolutionPolicy)
  {
    case 2:
      uint64_t v7 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoOrientationBelow];
      goto LABEL_8;
    case 3:
      if (!self->_primaryElementParticipantIdentifier)
      {
        v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"SBSwitcherTraitsPolicySpecifiers.m" lineNumber:95 description:@"SBTraitsSwitcherPolicySpecifier set to be following primary element but its identifier is nil."];
      }
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4FAFFB0], "resolutionPolicyInfoForAssociatedParticipantWithUniqueID:");
      goto LABEL_8;
    case 4:
      uint64_t v7 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoDeviceOrientation];
      goto LABEL_8;
    case 5:
      uint64_t v7 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoIsolation];
LABEL_8:
      v8 = (void *)v7;
      [v10 setOrientationResolutionPolicyInfo:v7];

      v6 = v10;
      break;
    default:
      break;
  }
}

- (void)setPrimaryElementParticipantIdentifier:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_primaryElementParticipantIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)[v8 copy];
    primaryElementParticipantIdentifier = self->_primaryElementParticipantIdentifier;
    self->_primaryElementParticipantIdentifier = v4;

    v6 = [(SBAbstractTraitsSwitcherPolicySpecifier *)self _blockBasedPolicySpecifier];
    uint64_t v7 = [(SBTraitsSwitcherPolicySpecifier *)self _specifierDescription];
    [v6 setSpecifierDescription:v7];
  }
}

- (id)_specifierDescription
{
  unint64_t v2 = self->_resolutionPolicy - 2;
  if (v2 > 3) {
    uint64_t v3 = @"None";
  }
  else {
    uint64_t v3 = off_1E6B05590[v2];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Switcher policy: %@; primary element identifier: %@",
               v3,
               self->_primaryElementParticipantIdentifier);
}

- (void)setResolutionPolicy:(int64_t)a3
{
  if (self->_resolutionPolicy != a3)
  {
    self->_resolutionPolicy = a3;
    id v5 = [(SBAbstractTraitsSwitcherPolicySpecifier *)self _blockBasedPolicySpecifier];
    v4 = [(SBTraitsSwitcherPolicySpecifier *)self _specifierDescription];
    [v5 setSpecifierDescription:v4];
  }
}

- (int64_t)resolutionPolicy
{
  return self->_resolutionPolicy;
}

- (SBTraitsSwitcherPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBTraitsSwitcherPolicySpecifier;
  result = [(SBAbstractTraitsSwitcherPolicySpecifier *)&v5 initWithComponentOrder:a3 arbiter:a4];
  if (result) {
    result->_resolutionPolicy = 1;
  }
  return result;
}

- (NSString)primaryElementParticipantIdentifier
{
  return self->_primaryElementParticipantIdentifier;
}

- (void).cxx_destruct
{
}

@end