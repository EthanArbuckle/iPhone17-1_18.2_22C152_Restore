@interface SBExternalDisplayDefaults
- (BOOL)displaySupportsExtendedDisplayMode:(id)a3;
- (NSString)description;
- (id)_constructDisplaySettingsMap;
- (id)displayModeSettingsForDisplay:(id)a3;
- (id)observeDisplayModeSettingsOnQueue:(id)a3 withBlock:(id)a4;
- (void)_bindAndRegisterDefaults;
- (void)_saveDisplaySettingsMapToStore:(id)a3;
- (void)resetPrototypeSettingAdjustableDefaults;
- (void)setDisplayModeSettings:(id)a3 forDisplaysMatchingPredicates:(id)a4;
@end

@implementation SBExternalDisplayDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"arrangementEdge"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBExternalDisplayArrangementEdge" toDefaultValue:&unk_1ED89E5D8 options:1];

  v4 = [NSString stringWithUTF8String:"arrangementOffset"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBExternalDisplayArrangementOffset" toDefaultValue:&unk_1ED89EEB8 options:1];

  v5 = [NSString stringWithUTF8String:"mirroringEnabled"];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBExternalDisplayMirroringEnabled" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v7 = [NSString stringWithUTF8String:"externalDisplayEducationReasons"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBExternalDisplayEducationReasons" toDefaultValue:&unk_1ED89E5F0 options:1];

  v8 = [NSString stringWithUTF8String:"allowWirelessDisplaysForExtendedDisplayMode"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBExtendedDisplayOverrideSupportForAirPlayAndDontFileRadars" toDefaultValue:v6 options:1];

  v9 = [NSString stringWithUTF8String:"contentsScale"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBExtendedDisplayContentsScaleAndDontFileRadars" toDefaultValue:&unk_1ED89EEC8 options:1];

  v10 = [NSString stringWithUTF8String:"displayModeSettingsMap"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBDisplayModeSettings" toDefaultValue:MEMORY[0x1E4F1CC08] options:2];

  id v12 = [NSString stringWithUTF8String:"chamois_97748869"];
  v11 = [NSNumber numberWithBool:1];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"CHAMOIS_97748869" toDefaultValue:v11 options:1];
}

- (void)resetPrototypeSettingAdjustableDefaults
{
  id v3 = [(BSAbstractDefaultDomain *)self _store];
  [v3 removeObjectForKey:@"SBExtendedDisplayOverrideSupportForAirPlayAndDontFileRadars"];
  [v3 removeObjectForKey:@"SBExtendedDisplayContentsScaleAndDontFileRadars"];
  [v3 removeObjectForKey:@"CHAMOIS_97748869"];
  [v3 removeObjectForKey:@"SBDisplayModeSettings"];
  [(BSAbstractDefaultDomain *)self synchronizeDefaults];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBExternalDisplayDefaults allowWirelessDisplaysForExtendedDisplayMode](self, "allowWirelessDisplaysForExtendedDisplayMode"), @"allowWirelessDisplays");
  [(SBExternalDisplayDefaults *)self contentsScale];
  id v5 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", @"contentsScale", 2);
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBExternalDisplayDefaults isMirroringEnabled](self, "isMirroringEnabled"), @"mirroringEnabled");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBExternalDisplayDefaults chamois](self, "chamois"), @"chamois_97748869");
  v8 = [v3 build];

  return (NSString *)v8;
}

- (BOOL)displaySupportsExtendedDisplayMode:(id)a3
{
  id v4 = a3;
  int v5 = [(SBExternalDisplayDefaults *)self allowWirelessDisplaysForExtendedDisplayMode];
  id v6 = [v4 identity];
  id v7 = [v6 rootIdentity];

  if ([v7 isExternal]
    && [v7 isAirPlayDisplay]
    && ([v7 isCarDisplay] & 1) == 0
    && ([v7 isCarInstrumentsDisplay] & 1) == 0
    && ([v7 connectionType] == 1 ? (int v8 = 1) : (int v8 = v5),
        v8 == 1
     && [v7 isRootIdentity]
     && ([v4 hardwareIdentifier], v9 = objc_claimAutoreleasedReturnValue(), v9, v9)))
  {
    v10 = +[SBDisplayScaleMapping withDisplay:v4 useNativeSize:[(SBExternalDisplayDefaults *)self chamois]];
    uint64_t v11 = [v10 supportedScales];

    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)displayModeSettingsForDisplay:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBExternalDisplayDefaults.m", 142, @"Invalid parameter not satisfying: %@", @"displayConfiguration != nil" object file lineNumber description];
  }
  if (![(SBExternalDisplayDefaults *)self displaySupportsExtendedDisplayMode:v5])
  {
    v9 = 0;
    goto LABEL_18;
  }
  id v6 = [(SBExternalDisplayDefaults *)self _constructDisplaySettingsMap];
  id v7 = +[SBDisplayModePredicate forDisplay:v5];
  uint64_t v8 = [v6 objectForKey:v7];
  v9 = (void *)v8;
  if (!v8)
  {
    v10 = +[SBDisplayModePredicate forDisplaysSimilarToDisplay:v5 useNativeSize:[(SBExternalDisplayDefaults *)self chamois]];
    v9 = [v6 objectForKey:v10];

    if (!v9)
    {
      uint64_t v11 = +[SBDisplayModePredicate allDisplays];
      v9 = [v6 objectForKey:v11];
    }
  }
  BOOL v12 = +[SBDisplayScaleMapping withDisplay:v5 useNativeSize:[(SBExternalDisplayDefaults *)self chamois]];
  v13 = v12;
  if (!v9)
  {
    v9 = [v12 createDefaultSettings];
  }
  uint64_t v14 = [v13 supportedScales];
  [v9 scale];
  if ((SBSDisplayScaleMaskFromScale() & ~v14) != 0)
  {
    v15 = (void *)[v9 mutableCopy];
    [v15 setScale:1];

    v9 = v15;
LABEL_14:
    [v6 setObject:v9 forKey:v7];
    [(SBExternalDisplayDefaults *)self _saveDisplaySettingsMapToStore:v6];
    goto LABEL_15;
  }
  if (!v8) {
    goto LABEL_14;
  }
LABEL_15:
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBExternalDisplayDefaults.m", 191, @"as long as the display is supported, we should have settings" object file lineNumber description];
  }
LABEL_18:

  return v9;
}

- (void)setDisplayModeSettings:(id)a3 forDisplaysMatchingPredicates:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBExternalDisplayDefaults.m", 197, @"Invalid parameter not satisfying: %@", @"settings != nil" object file lineNumber description];
  }
  if (![v8 count])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBExternalDisplayDefaults.m", 198, @"Invalid parameter not satisfying: %@", @"[predicates count] > 0" object file lineNumber description];
  }
  v9 = [(SBExternalDisplayDefaults *)self _constructDisplaySettingsMap];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v17 = [v9 objectForKey:v16];
        if (([v17 isEqual:v7] & 1) == 0)
        {
          [v9 setObject:v7 forKey:v16];
          char v13 = 1;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);

    if (v13) {
      [(SBExternalDisplayDefaults *)self _saveDisplaySettingsMapToStore:v9];
    }
  }
  else
  {
  }
}

- (id)observeDisplayModeSettingsOnQueue:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBExternalDisplayDefaults.m", 215, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"SBExternalDisplayDefaults.m", 216, @"Invalid parameter not satisfying: %@", @"observerBlock" object file lineNumber description];

LABEL_3:
  id v10 = [NSString stringWithUTF8String:"displayModeSettingsMap"];
  uint64_t v11 = [(BSAbstractDefaultDomain *)self observeDefault:v10 onQueue:v7 withBlock:v9];

  return v11;
}

- (void)_saveDisplaySettingsMapToStore:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKey:", v11, (void)v17);
        char v13 = [v11 defaultsKeyRepresentation];
        uint64_t v14 = [v12 defaultsRepresentation];
        [v5 setObject:v14 forKey:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = [(SBExternalDisplayDefaults *)self displayModeSettingsMap];
  char v16 = [v5 isEqual:v15];

  if ((v16 & 1) == 0) {
    [(SBExternalDisplayDefaults *)self setDisplayModeSettingsMap:v5];
  }
}

- (id)_constructDisplaySettingsMap
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(SBExternalDisplayDefaults *)self displayModeSettingsMap];
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  long long v17 = v2;
  id v3 = (void *)[v2 mutableCopy];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  long long v18 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v10 = +[SBDisplayModePredicate fromDefaultsKey:v9];
        uint64_t v11 = (void *)MEMORY[0x1E4FA6A70];
        uint64_t v12 = [v4 objectForKey:v9];
        char v13 = [v11 fromDefaultsRepresentation:v12];

        if (v10) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14) {
          [v18 addObject:v9];
        }
        else {
          [v19 setObject:v13 forKey:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  if ([v18 count])
  {
    [v4 removeObjectsForKeys:v18];
    [(SBExternalDisplayDefaults *)self setDisplayModeSettingsMap:v4];
  }

  return v19;
}

@end