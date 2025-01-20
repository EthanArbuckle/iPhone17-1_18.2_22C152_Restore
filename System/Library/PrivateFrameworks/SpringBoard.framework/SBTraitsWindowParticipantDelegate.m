@interface SBTraitsWindowParticipantDelegate
+ (id)_activeOrientationDeterminingParticipantRoles;
- (BOOL)_isWindowContentVisible:(id)a3;
- (SBTraitsWindowParticipantDelegate)init;
- (id)_autorotationPreventionReasons:(id)a3;
- (id)_validationFailureReasonForWindow:(id)a3;
- (id)participantAssociatedSceneIdentityTokens:(id)a3;
- (id)participantAssociatedWindows:(id)a3;
- (unint64_t)_validatedSupportedInterfaceOrientations:(unint64_t)a3 forWindow:(id)a4;
- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)participantWillInvalidate:(id)a3;
- (void)setParticipant:(id)a3 ownedByWindow:(id)a4;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
- (void)validateSettingsForParticipant:(id)a3 validator:(id)a4;
- (void)windowDidUpdatePreferredWindowLevel:(double)a3 ownedParticipant:(id)a4;
- (void)windowDidUpdateSupportedOrientations:(unint64_t)a3 ownedParticipant:(id)a4;
- (void)windowWillBecomeHidden:(id)a3 ownedParticipant:(id)a4;
- (void)windowWillBecomeVisible:(id)a3 ownedParticipant:(id)a4;
@end

@implementation SBTraitsWindowParticipantDelegate

- (void)windowDidUpdateSupportedOrientations:(unint64_t)a3 ownedParticipant:(id)a4
{
  id v10 = a4;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 104, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];
  }
  tempLastSupportedOrientations = self->_tempLastSupportedOrientations;
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)tempLastSupportedOrientations setObject:v8 forKey:v10];
}

- (void)windowWillBecomeVisible:(id)a3 ownedParticipant:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 83, @"Invalid parameter not satisfying: %@", @"window != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 84, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

LABEL_3:
  [(NSHashTable *)self->_visibleWindows addObject:v10];
  [(NSMutableArray *)self->_tempOwningWindowHidden removeObject:v7];
  [(NSMutableArray *)self->_tempOwningWindowVisible addObject:v7];
}

- (void)validateSettingsForParticipant:(id)a3 validator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 145, @"Invalid parameter not satisfying: %@", @"validator != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 146, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__SBTraitsWindowParticipantDelegate_validateSettingsForParticipant_validator___block_invoke;
  v12[3] = &unk_1E6B09418;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  [v8 validateOrientationSettingsWithBlock:v12];
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 111, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 112, @"Invalid parameter not satisfying: %@", @"updater != nil" object file lineNumber description];

LABEL_3:
  id v10 = [(NSMutableDictionary *)self->_tempLastPreferredZOrder objectForKey:v7];
  v11 = [(NSMutableDictionary *)self->_tempLastSupportedOrientations objectForKey:v7];
  int v12 = [(NSMutableArray *)self->_tempOwningWindowVisible containsObject:v7];
  int v13 = [(NSMutableArray *)self->_tempOwningWindowHidden containsObject:v7];
  if (v10)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__SBTraitsWindowParticipantDelegate_updatePreferencesForParticipant_updater___block_invoke;
    v23[3] = &unk_1E6B093C8;
    id v24 = v10;
    [v9 updateZOrderLevelPreferencesWithBlock:v23];
  }
  if (v11 || v12 | v13)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__SBTraitsWindowParticipantDelegate_updatePreferencesForParticipant_updater___block_invoke_2;
    v16[3] = &unk_1E6B093F0;
    char v20 = v12 | v13;
    id v17 = v11;
    v18 = self;
    id v19 = v7;
    char v21 = v12;
    char v22 = v13;
    [v9 updateOrientationPreferencesWithBlock:v16];
  }
  [(NSMutableDictionary *)self->_tempLastPreferredZOrder removeObjectForKey:v7];
  [(NSMutableDictionary *)self->_tempLastSupportedOrientations removeObjectForKey:v7];
  [(NSMutableArray *)self->_tempOwningWindowVisible removeObject:v7];
  [(NSMutableArray *)self->_tempOwningWindowHidden removeObject:v7];
}

uint64_t __78__SBTraitsWindowParticipantDelegate_validateSettingsForParticipant_validator___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  if (([*(id *)(*(void *)(a1 + 32) + 8) containsObject:v5] & 1) != 0
    || ([*(id *)(a1 + 40) role],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"SBTraitsParticipantRoleBanner"],
        v6,
        v7))
  {
    *a3 = 0;
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) _validationFailureReasonForWindow:v5];
    *a3 = (uint64_t)v9;

    uint64_t v8 = 0;
  }
  id v10 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [*(id *)(a1 + 40) uniqueIdentifier];
    uint64_t v12 = *a3;
    int v14 = 134218754;
    v15 = v5;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Window(%p)(%{public}@) validates resolution: %{BOOL}u. %{public}@", (uint8_t *)&v14, 0x26u);
  }
  return v8;
}

- (id)_validationFailureReasonForWindow:(id)a3
{
  if ([(NSHashTable *)self->_visibleWindows containsObject:a3]) {
    return 0;
  }
  else {
    return @"isHidden";
  }
}

void __77__SBTraitsWindowParticipantDelegate_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v9 = v3;
  if (v4) {
    objc_msgSend(v3, "setSupportedOrientations:", objc_msgSend(v4, "unsignedIntValue"));
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v5 = [(id)objc_opt_class() _activeOrientationDeterminingParticipantRoles];
    v6 = [*(id *)(a1 + 48) role];
    int v7 = [v5 containsObject:v6];

    BOOL v8 = v7 && *(unsigned char *)(a1 + 57) && *(unsigned char *)(a1 + 58) == 0;
    [v9 setCanDetermineActiveOrientation:v8];
  }
}

+ (id)_activeOrientationDeterminingParticipantRoles
{
  if (_activeOrientationDeterminingParticipantRoles_onceToken != -1) {
    dispatch_once(&_activeOrientationDeterminingParticipantRoles_onceToken, &__block_literal_global_305);
  }
  v2 = (void *)_activeOrientationDeterminingParticipantRoles__activeOrientationDeterminingParticipantRoles;
  return v2;
}

- (SBTraitsWindowParticipantDelegate)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBTraitsWindowParticipantDelegate;
  v2 = [(SBTraitsWindowParticipantDelegate *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    tempOwningWindowHidden = v2->_tempOwningWindowHidden;
    v2->_tempOwningWindowHidden = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    tempOwningWindowVisible = v2->_tempOwningWindowVisible;
    v2->_tempOwningWindowVisible = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:15];
    tempLastPreferredZOrder = v2->_tempLastPreferredZOrder;
    v2->_tempLastPreferredZOrder = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:15];
    tempLastSupportedOrientations = v2->_tempLastSupportedOrientations;
    v2->_tempLastSupportedOrientations = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    visibleWindows = v2->_visibleWindows;
    v2->_visibleWindows = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:5];
    participantOwningWindowMapTable = v2->_participantOwningWindowMapTable;
    v2->_participantOwningWindowMapTable = (NSMapTable *)v13;
  }
  return v2;
}

void __82__SBTraitsWindowParticipantDelegate__activeOrientationDeterminingParticipantRoles__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"SBTraitsParticipantRoleHomeScreen";
  v2[1] = @"SBTraitsParticipantRoleTransientOverlay";
  v2[2] = @"SBTraitsParticipantRoleCoverSheet";
  v2[3] = @"SBTraitsParticipantRoleAssistant";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)_activeOrientationDeterminingParticipantRoles__activeOrientationDeterminingParticipantRoles;
  _activeOrientationDeterminingParticipantRoles__activeOrientationDeterminingParticipantRoles = v0;
}

- (void)setParticipant:(id)a3 ownedByWindow:(id)a4
{
  id v21 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 66, @"Invalid parameter not satisfying: %@", @"window != nil" object file lineNumber description];
  }
  id v8 = v21;
  if (!v21)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 67, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

    id v8 = 0;
  }
  uint64_t v9 = [(NSMapTable *)self->_participantOwningWindowMapTable objectForKey:v8];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 70, @"Participant(%@) cannot be owned by window(%@), since it's already owned by other window(%@)", v21, v9, v7 object file lineNumber description];
  }
  [(NSMapTable *)self->_participantOwningWindowMapTable setObject:v7 forKey:v21];
  unint64_t v11 = -[SBTraitsWindowParticipantDelegate _validatedSupportedInterfaceOrientations:forWindow:](self, "_validatedSupportedInterfaceOrientations:forWindow:", [v7 _supportedInterfaceOrientationsForRootViewController], v7);
  tempLastPreferredZOrder = self->_tempLastPreferredZOrder;
  uint64_t v13 = NSNumber;
  [v7 windowLevel];
  int v14 = objc_msgSend(v13, "numberWithDouble:");
  [(NSMutableDictionary *)tempLastPreferredZOrder setObject:v14 forKey:v21];

  tempLastSupportedOrientations = self->_tempLastSupportedOrientations;
  objc_super v16 = [NSNumber numberWithUnsignedInteger:v11];
  [(NSMutableDictionary *)tempLastSupportedOrientations setObject:v16 forKey:v21];

  int v17 = [v7 isHidden];
  uint64_t v18 = 32;
  if (v17) {
    uint64_t v18 = 24;
  }
  [*(id *)((char *)&self->super.isa + v18) addObject:v21];
}

- (void)windowWillBecomeHidden:(id)a3 ownedParticipant:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 91, @"Invalid parameter not satisfying: %@", @"window != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 92, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

LABEL_3:
  [(NSHashTable *)self->_visibleWindows removeObject:v10];
  [(NSMutableArray *)self->_tempOwningWindowHidden addObject:v7];
  [(NSMutableArray *)self->_tempOwningWindowVisible removeObject:v7];
}

- (void)windowDidUpdatePreferredWindowLevel:(double)a3 ownedParticipant:(id)a4
{
  id v10 = a4;
  if (!v10)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 99, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];
  }
  tempLastPreferredZOrder = self->_tempLastPreferredZOrder;
  id v8 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)tempLastPreferredZOrder setObject:v8 forKey:v10];
}

void __77__SBTraitsWindowParticipantDelegate_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 doubleValue];
  objc_msgSend(v3, "setPreferredZOrderLevel:");
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 159, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_22:
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 160, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_22;
  }
LABEL_3:
  uint64_t v9 = [v7 currentSettings];
  id v10 = [v9 orientationSettings];

  if (v10)
  {
    unint64_t v11 = [v7 role];
    int v12 = SBTraitsArbiterOrientationActuationEnabledForRole(v11);

    if (v12)
    {
      uint64_t v13 = [(NSMapTable *)self->_participantOwningWindowMapTable objectForKey:v7];
      uint64_t v14 = [v10 orientation];
      if ([v13 interfaceOrientation] != v14)
      {
        v15 = [v8 orientationActuationContext];
        objc_super v16 = [v15 animationSettings];
        [v16 duration];
        double v18 = v17;

        if ([(SBTraitsWindowParticipantDelegate *)self _isWindowContentVisible:v13]) {
          double v19 = v18;
        }
        else {
          double v19 = 0.0;
        }
        __int16 v20 = SBLogTraitsArbiter();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [v7 uniqueIdentifier];
          uint64_t v22 = SBFStringForBSInterfaceOrientation();
          *(_DWORD *)buf = 134219010;
          v38 = v13;
          __int16 v39 = 2114;
          v40 = v21;
          __int16 v41 = 2112;
          v42 = v22;
          __int16 v43 = 2048;
          double v44 = v18;
          __int16 v45 = 2048;
          double v46 = v19;
          _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Window(%p)(%{public}@) rotated(%@) with contextProvidedDuration(%.1f) resolvedDuration(%.1f)", buf, 0x34u);
        }
        [MEMORY[0x1E4F43058] _synchronizeDrawing];
        v23 = [v10 orientationMapResolver];
        [v13 _setInterfaceOrientationMapResolver:v23];

        [v13 _legacySetRotatableViewOrientation:v14 updateStatusBar:1 duration:0 force:v19];
      }
    }
  }
  [v7 currentAmbientPresentedFlag];
  int IsYes = BSSettingFlagIsYes();
  [v7 previousAmbientPresentedFlag];
  if (IsYes != BSSettingFlagIsYes())
  {
    [v7 currentAmbientPresentedFlag];
    int v25 = BSSettingFlagIsYes();
    v26 = [(NSMapTable *)self->_participantOwningWindowMapTable objectForKey:v7];
    v27 = [v26 traitOverrides];
    if (v25) {
      uint64_t v28 = 2;
    }
    else {
      uint64_t v28 = 1;
    }
    v29 = self;
    [v27 setNSIntegerValue:v28 forTrait:v29];
  }
  uint64_t v30 = [v7 currentAmbientDisplayStyle];
  if (v30 != [v7 previousAmbientDisplayStyle])
  {
    v31 = [(NSMapTable *)self->_participantOwningWindowMapTable objectForKey:v7];
    BOOL v32 = SBAmbientDisplayStyleForTraitsDisplayStyle([v7 currentAmbientDisplayStyle]);
    v33 = [v31 traitOverrides];
    v34 = self;
    [v33 setNSIntegerValue:v32 forTrait:v34];
  }
}

- (void)participantWillInvalidate:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 194, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMapTable *)self->_participantOwningWindowMapTable removeObjectForKey:v5];
  [(NSMutableDictionary *)self->_tempLastPreferredZOrder removeObjectForKey:v7];
  [(NSMutableDictionary *)self->_tempLastSupportedOrientations removeObjectForKey:v7];
  [(NSMutableArray *)self->_tempOwningWindowVisible removeObject:v7];
  [(NSMutableArray *)self->_tempOwningWindowHidden removeObject:v7];
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__SBTraitsWindowParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke;
  v12[3] = &unk_1E6AF4E00;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [v10 appendBodySectionWithName:@"Associated Windows" multilinePrefix:a5 block:v12];
}

void __97__SBTraitsWindowParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) participantAssociatedWindows:*(void *)(a1 + 40)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v17 + 1) + 8 * v3);
        id v5 = *(void **)(a1 + 48);
        v6 = NSString;
        id v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        id v9 = [v4 _debugName];
        if ([v4 isHidden]) {
          id v10 = @"NO";
        }
        else {
          id v10 = @"YES";
        }
        [v4 interfaceOrientation];
        id v11 = BSInterfaceOrientationDescription();
        int v12 = [v4 rootViewController];
        objc_msgSend(v6, "stringWithFormat:", @"<%@: %p; %@>; Visible:%@; Orientation:%@; Root VC: %@",
          v8,
          v4,
          v9,
          v10,
          v11,
        id v13 = v12);
        [v5 appendString:v13 withName:0];

        ++v3;
      }
      while (v2 != v3);
      uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v2);
  }
}

- (id)participantAssociatedWindows:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 212, @"Invalid parameter not satisfying: %@", @"participant != nil" object file lineNumber description];
  }
  uint64_t v6 = [(NSMapTable *)self->_participantOwningWindowMapTable objectForKey:v5];
  id v7 = (void *)v6;
  if (v6)
  {
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)participantAssociatedSceneIdentityTokens:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBTraitsWindowParticipantDelegate.m", 222, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  id v7 = [(NSMapTable *)self->_participantOwningWindowMapTable objectForKey:v5];
  uint64_t v8 = objc_opt_class();
  id v9 = SBSafeCast(v8, v7);
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 hostedSceneIdentityTokens];
    [v6 addObjectsFromArray:v11];
  }
  if (+[SBSpotlightMultiplexingViewController isShownWithinWindow:v7])
  {
    int v12 = +[SBSpotlightMultiplexingViewController spotlightSceneIdentityTokenIfActiveForeground];
    if (v12) {
      [v6 addObject:v12];
    }
  }
  if ([v6 count])
  {
    id v13 = [v6 allObjects];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (unint64_t)_validatedSupportedInterfaceOrientations:(unint64_t)a3 forWindow:(id)a4
{
  if (a3) {
    return a3;
  }
  objc_msgSend(a4, "interfaceOrientation", v4);
  return XBInterfaceOrientationMaskForInterfaceOrientation();
}

- (BOOL)_isWindowContentVisible:(id)a3
{
  id v3 = a3;
  uint64_t v4 = self;
  uint64_t v5 = SBSafeCast((uint64_t)v4, v3);

  if (v5) {
    int v6 = [v5 isContentHidden] ^ 1;
  }
  else {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)_autorotationPreventionReasons:(id)a3
{
  id v3 = a3;
  uint64_t v4 = self;
  uint64_t v5 = SBSafeCast((uint64_t)v4, v3);

  if (v5)
  {
    int v6 = [v5 autorotationPreventionReasons];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempLastSupportedOrientations, 0);
  objc_storeStrong((id *)&self->_tempLastPreferredZOrder, 0);
  objc_storeStrong((id *)&self->_tempOwningWindowVisible, 0);
  objc_storeStrong((id *)&self->_tempOwningWindowHidden, 0);
  objc_storeStrong((id *)&self->_participantOwningWindowMapTable, 0);
  objc_storeStrong((id *)&self->_visibleWindows, 0);
}

@end