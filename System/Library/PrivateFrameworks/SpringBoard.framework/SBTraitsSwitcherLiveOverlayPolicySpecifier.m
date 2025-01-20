@interface SBTraitsSwitcherLiveOverlayPolicySpecifier
- (NSString)primaryElementParticipantIdentifier;
- (SBTraitsSwitcherLiveOverlayPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4;
- (id)_specifierDescription;
- (int64_t)nonPrimaryResolutionPolicy;
- (int64_t)primaryElementResolutionPolicy;
- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4;
- (void)_updateParticipant:(id)a3 withPolicy:(int64_t)a4 context:(id)a5;
- (void)setNonPrimaryResolutionPolicy:(int64_t)a3;
- (void)setPrimaryElementParticipantIdentifier:(id)a3;
- (void)setPrimaryElementResolutionPolicy:(int64_t)a3;
@end

@implementation SBTraitsSwitcherLiveOverlayPolicySpecifier

- (void)_updateParticipant:(id)a3 withPolicy:(int64_t)a4 context:(id)a5
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 2:
      uint64_t v10 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoIsolation];
      goto LABEL_6;
    case 3:
      uint64_t v10 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoForAssociatedParticipantWithRole:@"SBTraitsParticipantRoleSwitcherRaw"];
      goto LABEL_6;
    case 4:
      uint64_t v10 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoDeviceOrientation];
      goto LABEL_6;
    case 5:
      uint64_t v10 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoForAssociatedParticipantWithUniqueID:self->_primaryElementParticipantIdentifier];
LABEL_6:
      v11 = (void *)v10;
      [v8 setOrientationResolutionPolicyInfo:v10];

      break;
    case 6:
      v12 = +[SBOrientationLockManager sharedInstance];
      int v13 = [v12 isUserLocked];

      if (v13)
      {
        v14 = +[SBOrientationLockManager sharedInstance];
        uint64_t v15 = [v14 userLockOrientation];

        if ((unint64_t)(v15 - 3) > 1)
        {
          v21[0] = &unk_1F334A760;
          v21[1] = &unk_1F334A778;
          v22[0] = &unk_1F3348120;
          v22[1] = &unk_1F3348120;
          v21[2] = &unk_1F334A790;
          v22[2] = &unk_1F3348120;
          v16 = (void *)MEMORY[0x1E4F1C9E8];
          v17 = v22;
          v18 = v21;
        }
        else
        {
          v23[0] = &unk_1F334A718;
          v23[1] = &unk_1F334A730;
          v24[0] = &unk_1F3348120;
          v24[1] = &unk_1F3348120;
          v23[2] = &unk_1F334A748;
          v24[2] = &unk_1F3348120;
          v16 = (void *)MEMORY[0x1E4F1C9E8];
          v17 = v24;
          v18 = v23;
        }
        v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:3];
        v19 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoDeviceOrientationWithStateTypesBySupportedOrientationMask:v20];
      }
      else
      {
        v19 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoDeviceOrientation];
      }
      [v8 setOrientationResolutionPolicyInfo:v19];

      break;
    default:
      break;
  }
}

- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v20 = a4;
  int64_t primaryElementResolutionPolicy = self->_primaryElementResolutionPolicy;
  if (!primaryElementResolutionPolicy)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBSwitcherTraitsPolicySpecifiers.m" lineNumber:145 description:@"primary element unique identifier missing"];

    int64_t primaryElementResolutionPolicy = self->_primaryElementResolutionPolicy;
  }
  if (primaryElementResolutionPolicy == 5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBSwitcherTraitsPolicySpecifiers.m" lineNumber:146 description:@"Primary element asked to follow itself"];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = [v13 role];
        uint64_t v15 = [v13 uniqueIdentifier];
        char v16 = [v15 isEqualToString:self->_primaryElementParticipantIdentifier];

        p_int64_t primaryElementResolutionPolicy = &self->_primaryElementResolutionPolicy;
        if ((v16 & 1) == 0)
        {
          if (![v14 isEqualToString:@"SBTraitsParticipantRoleSwitcherLiveOverlay"]) {
            goto LABEL_15;
          }
          p_int64_t primaryElementResolutionPolicy = &self->_nonPrimaryResolutionPolicy;
        }
        if (*p_primaryElementResolutionPolicy != 1) {
          [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)self _updateParticipant:v13 withPolicy:*p_primaryElementResolutionPolicy context:v20];
        }
LABEL_15:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (int64_t)primaryElementResolutionPolicy
{
  return self->_primaryElementResolutionPolicy;
}

- (void)setPrimaryElementResolutionPolicy:(int64_t)a3
{
  if (self->_primaryElementResolutionPolicy != a3)
  {
    self->_int64_t primaryElementResolutionPolicy = a3;
    id v5 = [(SBAbstractTraitsSwitcherPolicySpecifier *)self _blockBasedPolicySpecifier];
    v4 = [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)self _specifierDescription];
    [v5 setSpecifierDescription:v4];
  }
}

- (void)setPrimaryElementParticipantIdentifier:(id)a3
{
}

- (void)setNonPrimaryResolutionPolicy:(int64_t)a3
{
  if (self->_nonPrimaryResolutionPolicy != a3)
  {
    self->_nonPrimaryResolutionPolicy = a3;
    id v5 = [(SBAbstractTraitsSwitcherPolicySpecifier *)self _blockBasedPolicySpecifier];
    v4 = [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)self _specifierDescription];
    [v5 setSpecifierDescription:v4];
  }
}

- (id)_specifierDescription
{
  unint64_t v2 = self->_primaryElementResolutionPolicy - 2;
  if (v2 > 4) {
    v3 = @"None";
  }
  else {
    v3 = off_1E6B055B0[v2];
  }
  unint64_t v4 = self->_nonPrimaryResolutionPolicy - 2;
  if (v4 > 4) {
    id v5 = @"None";
  }
  else {
    id v5 = off_1E6B055B0[v4];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Switcher primary overlay: %@; non-primary overlays: %@;",
               v3,
               v5);
}

- (SBTraitsSwitcherLiveOverlayPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBTraitsSwitcherLiveOverlayPolicySpecifier;
  result = [(SBAbstractTraitsSwitcherPolicySpecifier *)&v5 initWithComponentOrder:a3 arbiter:a4];
  if (result)
  {
    result->_int64_t primaryElementResolutionPolicy = 1;
    result->_nonPrimaryResolutionPolicy = 1;
  }
  return result;
}

- (NSString)primaryElementParticipantIdentifier
{
  return self->_primaryElementParticipantIdentifier;
}

- (int64_t)nonPrimaryResolutionPolicy
{
  return self->_nonPrimaryResolutionPolicy;
}

- (void).cxx_destruct
{
}

@end