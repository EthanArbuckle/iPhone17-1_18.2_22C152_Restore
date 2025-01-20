@interface VOSCommandProfile
+ (BOOL)_overlay:(id)a3 shouldIncludeItem:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_parseProfileProperties:(id)a3 overlayProperties:(id)a4;
+ (id)_profileKeyChordsFromDictionaryValue:(id)a3;
+ (void)_addGesturesToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5;
+ (void)_addKeyboardShortcutsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5;
+ (void)_addQuickNavShortcutsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5;
+ (void)_addSecondaryCommandsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5;
- (BOOL)commandHasAnyBindings:(id)a3 withResolver:(id)a4;
- (BOOL)commandHasModifiedBindingsWhenZoomEnabled:(id)a3 withResolver:(id)a4;
- (VOSCommandProfile)initWithCoder:(id)a3;
- (VOSCommandProfile)initWithProfileProperties:(id)a3 overlayProperties:(id)a4;
- (VOSCommandProfileDelegate)delegate;
- (id)_initWithModes:(id)a3;
- (id)_modifiedGestureRespectingHandednessSetting:(id)a3;
- (id)_profileCommandForCommand:(id)a3 inMode:(id)a4;
- (id)_profileModeForResolver:(id)a3;
- (id)_profileModeForScreenreaderMode:(id)a3;
- (id)_resolvedSecondaryCommandForProfileCommand:(id)a3 resolver:(id)a4;
- (id)addGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5;
- (id)addKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5;
- (id)allCommandsWithResolver:(id)a3;
- (id)allShortcutBindingsWithResolver:(id)a3;
- (id)allSiriShortcutCommandsWithResolver:(id)a3;
- (id)commandForKeyChord:(id)a3 withResolver:(id)a4;
- (id)commandForTouchGesture:(id)a3 withResolver:(id)a4;
- (id)debugDescription;
- (id)gestureBindingsForCommand:(id)a3 withResolver:(id)a4;
- (id)removeGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5;
- (id)removeKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5;
- (id)shortcutBindingsForCommand:(id)a3 withResolver:(id)a4;
- (id)userPresentableAllShortcutBindingsWithResolver:(id)a3;
- (id)validateCanAddGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5;
- (id)validateCanAddKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5;
- (id)validateCanRemoveGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5;
- (id)validateCanRemoveKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5;
- (unint64_t)availabilityForCommand:(id)a3 withResolver:(id)a4;
- (unint64_t)availabilityForGesture:(id)a3 withResolver:(id)a4;
- (unint64_t)availabilityForShortcut:(id)a3 withResolver:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation VOSCommandProfile

- (VOSCommandProfile)initWithProfileProperties:(id)a3 overlayProperties:(id)a4
{
  v5 = +[VOSCommandProfile _parseProfileProperties:a3 overlayProperties:a4];
  v6 = [(VOSCommandProfile *)self _initWithModes:v5];

  return v6;
}

- (id)_initWithModes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOSCommandProfile;
  v6 = [(VOSCommandProfile *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modes, a3);
  }

  return v7;
}

- (id)debugDescription
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"VOSCommandProfile:<%p>\n", self);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = self->_modes;
  uint64_t v35 = [(NSMutableSet *)obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v55;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v4;
        id v5 = *(void **)(*((void *)&v54 + 1) + 8 * v4);
        [v3 appendFormat:@" %@\n", v5];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v37 = [v5 commands];
        uint64_t v6 = [v37 countByEnumeratingWithState:&v50 objects:v61 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v51 != v8) {
                objc_enumerationMutation(v37);
              }
              v10 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              [v3 appendFormat:@"  %@\n", v10];
              v11 = [v10 gestures];
              uint64_t v12 = [v11 count];

              if (v12)
              {
                [v3 appendString:@"   Gestures:\n"];
                long long v48 = 0u;
                long long v49 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                v13 = [v10 gestures];
                uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v60 count:16];
                if (v14)
                {
                  uint64_t v15 = v14;
                  uint64_t v16 = *(void *)v47;
                  do
                  {
                    for (uint64_t j = 0; j != v15; ++j)
                    {
                      if (*(void *)v47 != v16) {
                        objc_enumerationMutation(v13);
                      }
                      [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v46 + 1) + 8 * j)];
                    }
                    uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v60 count:16];
                  }
                  while (v15);
                }
              }
              v18 = [v10 keyboardShortcuts];
              uint64_t v19 = [v18 count];

              if (v19)
              {
                [v3 appendString:@"   Keyboard Shortcuts:\n"];
                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                v20 = [v10 keyboardShortcuts];
                uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v59 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  uint64_t v23 = *(void *)v43;
                  do
                  {
                    for (uint64_t k = 0; k != v22; ++k)
                    {
                      if (*(void *)v43 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v42 + 1) + 8 * k)];
                    }
                    uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v59 count:16];
                  }
                  while (v22);
                }
              }
              v25 = [v10 quickNavShortcuts];
              uint64_t v26 = [v25 count];

              if (v26)
              {
                [v3 appendString:@"   QuickNav Shortcuts:\n"];
                long long v40 = 0u;
                long long v41 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                v27 = [v10 quickNavShortcuts];
                uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v58 count:16];
                if (v28)
                {
                  uint64_t v29 = v28;
                  uint64_t v30 = *(void *)v39;
                  do
                  {
                    for (uint64_t m = 0; m != v29; ++m)
                    {
                      if (*(void *)v39 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v38 + 1) + 8 * m)];
                    }
                    uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v58 count:16];
                  }
                  while (v29);
                }
              }
            }
            uint64_t v7 = [v37 countByEnumeratingWithState:&v50 objects:v61 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v36 + 1;
      }
      while (v36 + 1 != v35);
      uint64_t v35 = [(NSMutableSet *)obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v35);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VOSCommandProfile)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  objc_super v9 = [v5 decodeObjectOfClasses:v8 forKey:@"modes"];

  v10 = (void *)[v9 mutableCopy];
  v11 = [(VOSCommandProfile *)self _initWithModes:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)commandForTouchGesture:(id)a3 withResolver:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(VOSCommandProfile *)self _modifiedGestureRespectingHandednessSetting:a3];
  uint64_t v8 = [(VOSCommandProfile *)self _profileModeForResolver:v6];
  id v9 = [v6 screenreaderMode];
  id v10 = +[VOSScreenreaderMode BrailleScreenInput];
  if (v9 != v10) {
    goto LABEL_2;
  }
  uint64_t v28 = [v6 bsiTypingMode];

  if (v28 == 1)
  {
    uint64_t v29 = +[VOSGesture horizontalMirrorGestureForGesture:v7];
    id v9 = v29;
    if (!v29) {
      goto LABEL_3;
    }
    id v9 = v29;
    id v10 = v7;
    uint64_t v7 = v9;
LABEL_2:

LABEL_3:
  }
  id v11 = [v6 screenreaderMode];
  id v12 = +[VOSScreenreaderMode Default];
  if (v11 != v12) {
    goto LABEL_5;
  }
  int v30 = [v6 shouldApplyRTL];

  if (v30)
  {
    v31 = +[VOSGesture rtlGestureForGesture:v7];
    id v11 = v31;
    if (!v31) {
      goto LABEL_6;
    }
    id v11 = v31;
    id v12 = v7;
    uint64_t v7 = v11;
LABEL_5:

LABEL_6:
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v13 = [v8 commands];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v43;
    uint64_t v35 = v8;
    id v36 = v6;
    id v37 = v13;
    v33 = self;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v19 = [v18 gestures];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v39;
          while (2)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v39 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = [*(id *)(*((void *)&v38 + 1) + 8 * j) gesture];
              int v25 = [v24 isEqual:v7];

              if (v25)
              {
                uint64_t v26 = [v18 command];
                if (v26)
                {
                  id v6 = v36;
                  v13 = v37;
                  if ([(VOSCommandProfile *)v33 availabilityForCommand:v26 withResolver:v36] == 1)
                  {
                    v27 = VOTLogCommon();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                      -[VOSCommandProfile commandForTouchGesture:withResolver:]();
                    }

                    uint64_t v26 = 0;
                    id v6 = v36;
                  }
                  uint64_t v8 = v35;
                }
                else
                {
                  uint64_t v8 = v35;
                  id v6 = v36;
                  v13 = v37;
                }

                goto LABEL_38;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        v13 = v37;
        uint64_t v16 = v34;
      }
      uint64_t v15 = [v37 countByEnumeratingWithState:&v42 objects:v47 count:16];
      uint64_t v26 = 0;
      uint64_t v8 = v35;
      id v6 = v36;
    }
    while (v15);
  }
  else
  {
    uint64_t v26 = 0;
  }
LABEL_38:

  return v26;
}

- (id)commandForKeyChord:(id)a3 withResolver:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VOSCommandProfile *)self _profileModeForResolver:v7];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = [v8 commands];
  uint64_t v29 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v29)
  {
    uint64_t v21 = 0;
    goto LABEL_33;
  }
  uint64_t v10 = *(void *)v37;
  int v30 = v8;
  v31 = v9;
  uint64_t v27 = *(void *)v37;
  uint64_t v28 = self;
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v37 != v10) {
        objc_enumerationMutation(v9);
      }
      id v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      if ([v7 isQuickNavKeyboardMode]) {
        [v12 quickNavShortcuts];
      }
      else {
      v13 = [v12 keyboardShortcuts];
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (!v15) {
        goto LABEL_17;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v32 + 1) + 8 * j) keyChord];
          int v20 = [v19 isEqual:v6];

          if (v20)
          {
            if ([v12 hasSecondaryCommands])
            {
              uint64_t v22 = v28;
              uint64_t v21 = [(VOSCommandProfile *)v28 _resolvedSecondaryCommandForProfileCommand:v12 resolver:v7];
              uint64_t v8 = v30;
              if (!v21) {
                goto LABEL_26;
              }
              goto LABEL_27;
            }
            uint64_t v23 = [v7 resolvingEventOccurredBlock];

            uint64_t v8 = v30;
            uint64_t v22 = v28;
            if (v23)
            {
              v24 = [v7 resolvingEventOccurredBlock];
              ((void (**)(void, void, id))v24)[2](v24, 0, v7);
            }
LABEL_26:
            uint64_t v21 = [v12 command];
            if (v21)
            {
LABEL_27:
              if ([(VOSCommandProfile *)v22 availabilityForCommand:v21 withResolver:v7] == 1)
              {
                int v25 = VOTLogCommon();
                id v9 = v31;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                  -[VOSCommandProfile commandForTouchGesture:withResolver:]();
                }

                uint64_t v21 = 0;
                uint64_t v8 = v30;
                goto LABEL_32;
              }
            }
            id v9 = v31;
LABEL_32:

            goto LABEL_33;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_17:

      id v9 = v31;
      uint64_t v10 = v27;
    }
    uint64_t v21 = 0;
    uint64_t v8 = v30;
    uint64_t v29 = [v31 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v29);
LABEL_33:

  return v21;
}

- (id)_resolvedSecondaryCommandForProfileCommand:(id)a3 resolver:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 pressCount];
  uint64_t v8 = [v5 secondaryCommandsForPressCount:v7];
  uint64_t v9 = [v8 count];
  if (v7 >= 2 && !v9)
  {
    uint64_t v10 = [v6 resolvingEventOccurredBlock];

    if (v10)
    {
      id v11 = [v6 resolvingEventOccurredBlock];
      ((void (**)(void, uint64_t, id))v11)[2](v11, 1, v6);
    }
    uint64_t v12 = [v5 secondaryCommandsForPressCount:1];

    uint64_t v8 = (void *)v12;
  }
  if ([v8 count])
  {
    uint64_t v13 = [v6 context];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v17 = 0;
      uint64_t v18 = *(void *)v25;
LABEL_9:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v14);
        }
        int v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
        if (objc_msgSend(v20, "context", (void)v24) == v13) {
          break;
        }
        if (![v20 context])
        {
          uint64_t v21 = [v20 command];

          id v17 = (id)v21;
        }
        if (v16 == ++v19)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16) {
            goto LABEL_9;
          }
          goto LABEL_22;
        }
      }
      uint64_t v22 = [v20 command];

      if (v22) {
        goto LABEL_24;
      }
    }
    else
    {
      id v17 = 0;
LABEL_22:
    }
    id v17 = v17;
    uint64_t v22 = v17;
LABEL_24:
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)allCommandsWithResolver:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(VOSCommandProfile *)self _profileModeForResolver:v4];
  id v6 = [MEMORY[0x263EFF9C0] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v5 commands];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v23 + 1) + 8 * i) command];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  uint64_t v13 = (void *)MEMORY[0x263F08A98];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __45__VOSCommandProfile_allCommandsWithResolver___block_invoke;
  int v20 = &unk_2643FDB90;
  uint64_t v21 = self;
  id v22 = v4;
  id v14 = v4;
  uint64_t v15 = [v13 predicateWithBlock:&v17];
  objc_msgSend(v6, "filterUsingPredicate:", v15, v17, v18, v19, v20, v21);

  return v6;
}

BOOL __45__VOSCommandProfile_allCommandsWithResolver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) availabilityForCommand:a2 withResolver:*(void *)(a1 + 40)] == 0;
}

- (id)allSiriShortcutCommandsWithResolver:(id)a3
{
  id v4 = [(VOSCommandProfile *)self delegate];
  id v5 = [v4 availableSiriShortcuts:self];
  id v6 = objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_13);

  return v6;
}

VOSCommand *__57__VOSCommandProfile_allSiriShortcutCommandsWithResolver___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VOSCommand commandWithSiriShortcut:a2];
}

- (id)allShortcutBindingsWithResolver:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = [v4 set];
  uint64_t v7 = (void *)[v5 copy];

  uint64_t v8 = +[VOSScreenreaderMode Default];
  [v7 setScreenreaderMode:v8];

  [(VOSCommandProfile *)self _profileModeForResolver:v7];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = v31 = 0u;
  obuint64_t j = [v22 commands];
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v7 isQuickNavKeyboardMode]) {
          [v13 quickNavShortcuts];
        }
        else {
        id v14 = [v13 keyboardShortcuts];
        }
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v15);
              }
              int v20 = [*(id *)(*((void *)&v24 + 1) + 8 * j) keyChord];
              [v6 addObject:v20];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v17);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  return v6;
}

- (id)userPresentableAllShortcutBindingsWithResolver:(id)a3
{
  v3 = [(VOSCommandProfile *)self allShortcutBindingsWithResolver:a3];
  id v4 = [v3 allObjects];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_302_0];

  return v5;
}

uint64_t __68__VOSCommandProfile_userPresentableAllShortcutBindingsWithResolver___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isFunctionKeyChord];
  int v7 = [v5 isFunctionKeyChord];
  if (!v6 || v7)
  {
    if ((v6 | v7 ^ 1) == 1)
    {
      uint64_t v9 = [v4 keys];
      uint64_t v10 = [v9 reverseObjectEnumerator];
      uint64_t v11 = [v10 allObjects];
      uint64_t v12 = [v11 componentsJoinedByString:&stru_26CC86DC0];

      uint64_t v13 = [v5 keys];
      id v14 = [v13 reverseObjectEnumerator];
      id v15 = [v14 allObjects];
      uint64_t v16 = [v15 componentsJoinedByString:&stru_26CC86DC0];

      uint64_t v17 = [v4 keys];
      uint64_t v18 = [v17 lastObject];
      uint64_t v19 = [v18 lowercaseString];

      int v20 = [v5 keys];
      uint64_t v21 = [v20 lastObject];
      id v22 = [v21 lowercaseString];

      uint64_t v8 = objc_msgSend(v12, "compare:options:", v16, objc_msgSend(v19, "isEqualToString:", v22) ^ 1);
    }
    else
    {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (id)gestureBindingsForCommand:(id)a3 withResolver:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  long long v25 = v7;
  uint64_t v9 = [(VOSCommandProfile *)self _profileModeForResolver:v7];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = [v9 commands];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v16 = [v15 command];
        int v17 = [v16 isEqual:v6];

        if (v17)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v18 = [v15 gestures];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v27 != v21) {
                  objc_enumerationMutation(v18);
                }
                long long v23 = [*(id *)(*((void *)&v26 + 1) + 8 * j) gesture];
                [v8 addObject:v23];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v20);
          }

          goto LABEL_18;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v8;
}

- (id)shortcutBindingsForCommand:(id)a3 withResolver:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  [(VOSCommandProfile *)self _profileModeForResolver:v7];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v24 = long long v32 = 0u;
  uint64_t v9 = [v24 commands];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v15 = [v14 command];
        int v16 = [v15 isEqual:v6];

        if (v16)
        {
          if ([v7 isQuickNavKeyboardMode]) {
            [v14 quickNavShortcuts];
          }
          else {
            [v14 keyboardShortcuts];
          }
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = [*(id *)(*((void *)&v25 + 1) + 8 * j) keyChord];
                [v8 addObject:v22];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v19);
          }

          goto LABEL_21;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  return v8;
}

- (BOOL)commandHasAnyBindings:(id)a3 withResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VOSCommandProfile *)self gestureBindingsForCommand:v6 withResolver:v7];
  uint64_t v9 = [v8 count];

  if (v9
    || (-[VOSCommandProfile shortcutBindingsForCommand:withResolver:](self, "shortcutBindingsForCommand:withResolver:", v6, v7), uint64_t v10 = objc_claimAutoreleasedReturnValue(), v11 = [v10 count], v10, v11))
  {
    BOOL v12 = 1;
  }
  else
  {
    id v14 = (void *)[v7 copy];
    [v14 setKeyboardMode:1];
    id v15 = [(VOSCommandProfile *)self shortcutBindingsForCommand:v6 withResolver:v14];
    BOOL v12 = [v15 count] != 0;
  }
  return v12;
}

- (unint64_t)availabilityForGesture:(id)a3 withResolver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 screenreaderMode];
  uint64_t v8 = +[VOSScreenreaderMode Default];

  if (v7 == v8)
  {
    uint64_t v12 = +[VOSGesture OneFingerSingleTap];
    if ((id)v12 == v5) {
      goto LABEL_35;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = +[VOSGesture OneFingerDoubleTap];
    if ((id)v14 == v5)
    {
    }
    else
    {
      id v15 = (void *)v14;
      uint64_t v16 = +[VOSGesture OneFingerFlickLeft];
      if ((id)v16 != v5)
      {
        id v17 = (void *)v16;
        id v18 = +[VOSGesture OneFingerFlickRight];

        if (v18 == v5) {
          goto LABEL_40;
        }
        id v19 = +[VOSGesture TwoFingerSingleTapAndHold];

        if (v19 == v5) {
          goto LABEL_40;
        }
        uint64_t v20 = +[VOSGesture OneFingerSingleTapAndHold];
        if ((id)v20 == v5)
        {
LABEL_60:

          goto LABEL_68;
        }
        uint64_t v21 = (void *)v20;
        uint64_t v22 = +[VOSGesture OneFingerDoubleTapAndHold];
        if ((id)v22 == v5)
        {
        }
        else
        {
          long long v23 = (void *)v22;
          uint64_t v24 = +[VOSGesture TwoFingerDoubleTapAndHold];
          if ((id)v24 == v5)
          {
          }
          else
          {
            long long v25 = (void *)v24;
            uint64_t v26 = +[VOSGesture ThreeFingerSingleTapAndHold];
            if ((id)v26 != v5)
            {
              long long v27 = (void *)v26;
              id v28 = +[VOSGesture ThreeFingerDoubleTapAndHold];

              if (v28 == v5)
              {
LABEL_68:
                unint64_t v11 = 2;
LABEL_41:
                if (([v6 isIPad] & 1) == 0)
                {
                  uint64_t v48 = +[VOSGesture fiveFingerGestures];
                  int v49 = [v48 containsObject:v5];

                  if (v49) {
                    unint64_t v11 = 2;
                  }
                }
                long long v50 = +[VOSGesture oneFingerSplitGestures];
                if ([v50 containsObject:v5]) {
                  goto LABEL_50;
                }
                long long v51 = +[VOSGesture twoFingerSplitGestures];
                char v52 = [v51 containsObject:v5];

                if (v52) {
                  goto LABEL_51;
                }
LABEL_58:
                if (v11 != -1) {
                  goto LABEL_52;
                }
                goto LABEL_4;
              }
              uint64_t v29 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];
              if ((id)v29 != v5)
              {
                long long v30 = (void *)v29;
                id v31 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight];

                if (v31 != v5)
                {
                  uint64_t v32 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp];
                  if ((id)v32 != v5)
                  {
                    long long v33 = (void *)v32;
                    id v34 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown];

                    if (v34 != v5)
                    {
                      id v35 = +[VOSGesture TwoFingerPinch];

                      if (v35 == v5) {
                        unint64_t v11 = 2;
                      }
                      else {
                        unint64_t v11 = -1;
                      }
                      goto LABEL_41;
                    }
                    goto LABEL_68;
                  }
                  goto LABEL_60;
                }
LABEL_40:
                unint64_t v11 = 1;
                goto LABEL_41;
              }
LABEL_35:

              goto LABEL_40;
            }
          }
        }

        goto LABEL_68;
      }
    }
    goto LABEL_40;
  }
  uint64_t v9 = +[VOSScreenreaderMode Handwriting];

  if (v7 != v9)
  {
    uint64_t v10 = +[VOSScreenreaderMode BrailleScreenInput];

    if (v7 != v10)
    {
LABEL_4:
      unint64_t v11 = 0;
      goto LABEL_52;
    }
    uint64_t v43 = +[VOSGesture TwoFingerRotateCounterclockwise];
    if ((id)v43 != v5)
    {
      long long v44 = (void *)v43;
      id v45 = +[VOSGesture TwoFingerRotateClockwise];

      if (v45 == v5) {
        goto LABEL_51;
      }
      id v46 = +[VOSGesture TwoFingerScrub];

      if (v46 == v5)
      {
LABEL_64:
        unint64_t v11 = 1;
        goto LABEL_52;
      }
      if (+[VOSGestureCategory isTapGesture:v5]
        || +[VOSGestureCategory isTapAndHoldGesture:v5])
      {
LABEL_51:
        unint64_t v11 = 2;
        goto LABEL_52;
      }
      long long v47 = +[VOSGesture oneFingerSplitGestures];
      if ([v47 containsObject:v5])
      {

        goto LABEL_64;
      }
      v60 = +[VOSGesture twoFingerSplitGestures];
      char v61 = [v60 containsObject:v5];

      if (v61) {
        goto LABEL_64;
      }
      uint64_t v62 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];
      if ((id)v62 != v5)
      {
        uint64_t v63 = (void *)v62;
        uint64_t v64 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight];
        if ((id)v64 == v5)
        {
        }
        else
        {
          v65 = (void *)v64;
          uint64_t v66 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp];
          if ((id)v66 != v5)
          {
            v67 = (void *)v66;
            id v68 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown];

            if (v68 != v5) {
              goto LABEL_4;
            }
            goto LABEL_51;
          }
        }
        goto LABEL_51;
      }
    }

    goto LABEL_51;
  }
  uint64_t v36 = +[VOSGesture TwoFingerRotateCounterclockwise];
  if ((id)v36 == v5)
  {

    goto LABEL_48;
  }
  long long v37 = (void *)v36;
  uint64_t v38 = +[VOSGesture TwoFingerRotateClockwise];
  if ((id)v38 == v5)
  {

    goto LABEL_48;
  }
  long long v39 = (void *)v38;
  id v40 = +[VOSGesture TwoFingerScrub];

  if (v40 == v5)
  {
LABEL_48:
    uint64_t v42 = 1;
    goto LABEL_49;
  }
  id v41 = +[VOSGesture TwoFingerPinch];

  if (v41 == v5) {
    uint64_t v42 = 2;
  }
  else {
    uint64_t v42 = -1;
  }
LABEL_49:
  long long v53 = +[VOSGesture oneFingerGestures];
  int v54 = [v53 containsObject:v5];

  long long v50 = +[VOSGesture oneFingerSplitGestures];
  if ([v50 containsObject:v5])
  {
LABEL_50:

    goto LABEL_51;
  }
  BOOL v56 = v54 == 0;
  unint64_t v11 = 2;
  if (v56) {
    uint64_t v57 = v42;
  }
  else {
    uint64_t v57 = 2;
  }
  v58 = +[VOSGesture twoFingerSplitGestures];
  char v59 = [v58 containsObject:v5];

  if ((v59 & 1) == 0)
  {
    unint64_t v11 = v57;
    goto LABEL_58;
  }
LABEL_52:

  return v11;
}

- (unint64_t)availabilityForShortcut:(id)a3 withResolver:(id)a4
{
  id v4 = a4;
  id v5 = [v4 screenreaderMode];
  char v6 = [v4 isQuickNavKeyboardMode];

  if (v6)
  {
    unint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = +[VOSScreenreaderMode Default];

    if (v5 != v8)
    {
      uint64_t v9 = +[VOSScreenreaderMode Handwriting];

      if (v5 != v9)
      {
        +[VOSScreenreaderMode BrailleScreenInput];
      }
    }
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)availabilityForCommand:(id)a3 withResolver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((AXIsInternalInstall() & 1) != 0
    || (+[VOSCommandCategory internalOnly],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 containsCommand:v5],
        v7,
        (v8 & 1) == 0))
  {
    uint64_t v10 = [v6 screenreaderMode];
    unint64_t v11 = +[VOSScreenreaderMode Default];

    if (v10 == v11)
    {
      if ([v6 isIPad] & 1) != 0 || (objc_msgSend(v6, "isWatch"))
      {
        unint64_t v9 = -1;
      }
      else
      {
        id v17 = +[VOSCommand ToggleDock];

        if (v17 == v5) {
          unint64_t v9 = 1;
        }
        else {
          unint64_t v9 = -1;
        }
      }
      if (([v6 isIPhone] & 1) == 0)
      {
        id v18 = +[VOSCommand ToggleReachability];

        if (v18 == v5)
        {
          unint64_t v9 = 1;
          goto LABEL_22;
        }
      }
      if (v9 != -1)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v12 = +[VOSScreenreaderMode Handwriting];
      if (v10 == (void *)v12)
      {

LABEL_12:
        id v15 = +[VOSCommand GesturedTextInputLaunchApp];

        if (v15 != v5)
        {
          uint64_t v16 = +[VOSScreenreaderMode Handwriting];

          if (v10 != v16)
          {
            +[VOSScreenreaderMode BrailleScreenInput];
          }
        }
        goto LABEL_21;
      }
      uint64_t v13 = (void *)v12;
      uint64_t v14 = +[VOSScreenreaderMode BrailleScreenInput];

      if (v10 == v14) {
        goto LABEL_12;
      }
    }
LABEL_21:
    unint64_t v9 = 0;
    goto LABEL_22;
  }
  unint64_t v9 = 1;
LABEL_23:

  return v9;
}

- (BOOL)commandHasModifiedBindingsWhenZoomEnabled:(id)a3 withResolver:(id)a4
{
  id v4 = [(VOSCommandProfile *)self gestureBindingsForCommand:a3 withResolver:a4];
  id v5 = +[VOSGesture conflictingZoomGestures];
  char v6 = [v4 intersectsSet:v5];

  return v6;
}

- (id)_modifiedGestureRespectingHandednessSetting:(id)a3
{
  return a3;
}

- (id)addGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(VOSCommandProfile *)self _modifiedGestureRespectingHandednessSetting:a3];
  unint64_t v11 = [(VOSCommandProfile *)self _profileModeForResolver:v9];

  uint64_t v12 = [(VOSCommandProfile *)self _profileCommandForCommand:v8 inMode:v11];
  if (!v12)
  {
    uint64_t v12 = +[_VOSProfileCommand profileCommandWithCommand:v8];
  }
  uint64_t v13 = +[VOSCommand None];
  uint64_t v14 = [(VOSCommandProfile *)self _profileCommandForCommand:v13 inMode:v11];

  id v15 = +[_VOSProfileGesture profileGestureWithGesture:v10];
  uint64_t v16 = [v14 gestures];
  int v17 = [v16 containsObject:v15];

  if (v17) {
    [v14 removeGesture:v15];
  }
  [v12 addGesture:v15];
  [v11 addCommand:v12];

  return 0;
}

- (id)removeGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(VOSCommandProfile *)self _modifiedGestureRespectingHandednessSetting:a3];
  unint64_t v11 = [(VOSCommandProfile *)self _profileModeForResolver:v9];
  uint64_t v12 = [(VOSCommandProfile *)self _profileCommandForCommand:v8 inMode:v11];
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 profileGestureForGesture:v10];
    if (v14)
    {
      [v13 removeGesture:v14];
      id v15 = [v13 gestures];
      uint64_t v16 = [v15 count];

      if (!v16)
      {
        int v17 = +[VOSCommand None];
        id v18 = [(VOSCommandProfile *)self addGesture:v10 toCommand:v17 withResolver:v9];
      }
      id v19 = 0;
    }
    else
    {
      id v19 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"VoiceOverCommands", @"Cannot remove gesture '%@' from command '%@' with resolver '%@'. profileGesture was nil.", v10, v8, v9);
    }
  }
  else
  {
    id v19 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"VoiceOverCommands", @"Cannot remove gesture '%@' from command '%@' with resolver '%@'. profileCommand was nil.", v10, v8, v9);
  }

  return v19;
}

- (id)addKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  unint64_t v11 = [(VOSCommandProfile *)self _profileModeForResolver:v9];
  uint64_t v12 = [(VOSCommandProfile *)self _profileCommandForCommand:v8 inMode:v11];
  if (v12)
  {
    uint64_t v13 = +[_VOSProfileKeyChord profileKeyChordWithKeyChord:v10];

    if ([v9 isQuickNavKeyboardMode]) {
      [v12 addQuickNavShortcut:v13];
    }
    else {
      [v12 addKeyboardShortcut:v13];
    }
    uint64_t v14 = 0;
    id v10 = (id)v13;
  }
  else
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"VoiceOverCommands", @"Cannot add keychord '%@' to command '%@' with resolver '%@'. ProfileCommand was nil.", v10, v8, v9);
  }

  return v14;
}

- (id)removeKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(VOSCommandProfile *)self _profileModeForResolver:v10];
  uint64_t v12 = [(VOSCommandProfile *)self _profileCommandForCommand:v9 inMode:v11];
  if (v12)
  {
    if ([v10 isQuickNavKeyboardMode]) {
      [v12 profileQuickNavShortcutForKeyChord:v8];
    }
    else {
    uint64_t v14 = [v12 profileKeyboardShortcutForKeyChord:v8];
    }
    if (v14)
    {
      if ([v10 isQuickNavKeyboardMode]) {
        [v12 removeQuickNavShortcut:v14];
      }
      else {
        [v12 removeKeyboardShortcut:v14];
      }
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"VoiceOverCommands", @"Cannot remove keychord '%@' from command '%@' with resolver '%@'. profileKeyChord was nil.", v8, v9, v10);
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"VoiceOverCommands", @"Cannot remove keychord '%@' from command '%@' with resolver '%@'. profileCommand was nil.", v8, v9, v10);
  }

  return v13;
}

- (id)validateCanAddGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a4;
  id v9 = [(VOSCommandProfile *)self commandForTouchGesture:a3 withResolver:a5];
  LODWORD(a3) = [v9 isEqual:v8];

  if (a3)
  {
    id v10 = [[VOSCommandProfileValidation alloc] initWithType:1];
  }
  else if (v9 {
         && (+[VOSCommand None],
  }
             unint64_t v11 = objc_claimAutoreleasedReturnValue(),
             char v12 = [v9 isEqual:v11],
             v11,
             (v12 & 1) == 0))
  {
    id v10 = +[VOSCommandProfileValidation gestureAssignedToOtherCommandValidation:v9];
  }
  else
  {
    id v10 = +[VOSCommandProfileValidation successfulValidation];
  }
  uint64_t v13 = v10;

  return v13;
}

- (id)validateCanRemoveGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  return +[VOSCommandProfileValidation successfulValidation];
}

- (id)validateCanAddKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a4;
  id v9 = [(VOSCommandProfile *)self commandForKeyChord:a3 withResolver:a5];
  LODWORD(a3) = [v9 isEqual:v8];

  if (a3)
  {
    id v10 = [[VOSCommandProfileValidation alloc] initWithType:3];
  }
  else
  {
    if (v9) {
      +[VOSCommandProfileValidation keyboardShortcutAssignedToOtherCommandValidation:v9];
    }
    else {
    id v10 = +[VOSCommandProfileValidation successfulValidation];
    }
  }
  unint64_t v11 = v10;

  return v11;
}

- (id)validateCanRemoveKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  return +[VOSCommandProfileValidation successfulValidation];
}

- (id)_profileModeForResolver:(id)a3
{
  id v4 = [a3 screenreaderMode];
  id v5 = [(VOSCommandProfile *)self _profileModeForScreenreaderMode:v4];

  return v5;
}

- (id)_profileModeForScreenreaderMode:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_modes;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "mode", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_profileCommandForCommand:(id)a3 inMode:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v7 = objc_msgSend(v6, "commands", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v13 = [v12 command];
        char v14 = [v13 isEqual:v5];

        if (v14)
        {
          id v18 = v12;

          goto LABEL_28;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = [v5 commandType];
  if (v15 == 1) {
    goto LABEL_22;
  }
  if (v15)
  {
LABEL_27:
    id v18 = 0;
    goto LABEL_28;
  }
  long long v16 = [v6 mode];
  int v17 = +[VOSScreenreaderMode Handwriting];
  if (v16 == v17)
  {
    id v19 = +[VOSCommandCategory handwriting];
    char v20 = [v19 containsCommand:v5];

    if (v20) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v21 = [v6 mode];
  uint64_t v22 = +[VOSScreenreaderMode BrailleScreenInput];
  if (v21 == v22)
  {
    long long v23 = +[VOSCommandCategory brailleScreenInput];
    char v24 = [v23 containsCommand:v5];

    if (v24) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  long long v25 = [v6 mode];
  uint64_t v26 = +[VOSScreenreaderMode Default];
  if (v25 == v26)
  {
    long long v27 = +[VOSCommandCategory allCategories];
    BOOL v28 = +[VOSCommandCategory categories:v27 containsCommand:v5];

    if (v28) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v29 = +[VOSCommand None];
  char v30 = [v5 isEqual:v29];

  if ((v30 & 1) == 0)
  {
    id v31 = VOTLogCommon();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[VOSCommandProfile _profileCommandForCommand:inMode:]();
    }

    goto LABEL_27;
  }
LABEL_22:
  id v18 = +[_VOSProfileCommand profileCommandWithCommand:v5];
  if (v18) {
    [v6 addCommand:v18];
  }
LABEL_28:

  return v18;
}

+ (BOOL)_overlay:(id)a3 shouldIncludeItem:(id)a4
{
  char v4 = 1;
  if (a3 && a4)
  {
    id v5 = [a3 objectForKeyedSubscript:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v4 = [v5 BOOLValue];
    }
  }
  return v4;
}

+ (id)_parseProfileProperties:(id)a3 overlayProperties:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 set];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"ScreenReaderModes"];

  char v11 = [v7 objectForKeyedSubscript:@"ScreenReaderModes"];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_2;
  v17[3] = &unk_2643FDC68;
  id v21 = a1;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  char v20 = &__block_literal_global_333;
  id v13 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v17];
  char v14 = v20;
  id v15 = v12;

  return v15;
}

void __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v11 = a2;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[_VOSProfileCommand profileCommandWithStringValue:a3];
  if (v10)
  {
    [v11 addCommand:v10];
    +[VOSCommandProfile _addGesturesToCommand:v10 fromCommandProperties:v8 overlayProperties:v9];
    +[VOSCommandProfile _addKeyboardShortcutsToCommand:v10 fromCommandProperties:v8 overlayProperties:v9];
    +[VOSCommandProfile _addQuickNavShortcutsToCommand:v10 fromCommandProperties:v8 overlayProperties:v9];
    +[VOSCommandProfile _addSecondaryCommandsToCommand:v10 fromCommandProperties:v8 overlayProperties:v9];
  }
}

void __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[7] _overlay:a1[4] shouldIncludeItem:v5])
  {
    id v7 = +[_VOSProfileMode profileModeWithStringValue:v5];
    if (v7)
    {
      [a1[5] addObject:v7];
      id v8 = [a1[4] objectForKeyedSubscript:v5];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_3;
      v19[3] = &unk_2643FDC18;
      id v20 = v8;
      long long v14 = *((_OWORD *)a1 + 3);
      id v9 = (id)v14;
      long long v22 = v14;
      id v10 = v7;
      id v21 = v10;
      id v11 = v8;
      [v6 enumerateKeysAndObjectsUsingBlock:v19];
      id v12 = [v6 allKeys];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_4;
      v15[3] = &unk_2643FDC40;
      id v16 = v12;
      id v18 = a1[6];
      id v17 = v10;
      id v13 = v12;
      [v11 enumerateKeysAndObjectsUsingBlock:v15];
    }
  }
}

void __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 56) _overlay:*(void *)(a1 + 32) shouldIncludeItem:v9])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    (*(void (**)(uint64_t, uint64_t, id, id, void *))(v6 + 16))(v6, v7, v9, v5, v8);
  }
}

void __63__VOSCommandProfile__parseProfileProperties_overlayProperties___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (void)_addGesturesToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 _overlay:v10 shouldIncludeItem:@"TouchGesture"])
  {
    id v11 = [v10 objectForKeyedSubscript:@"TouchGesture"];
    if (!v11)
    {
      id v11 = [v9 objectForKeyedSubscript:@"TouchGesture"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24[0] = v11;
        id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      }
      else
      {
        id v12 = 0;
      }
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = +[_VOSProfileGesture profileGestureWithStringValue:](_VOSProfileGesture, "profileGestureWithStringValue:", *(void *)(*((void *)&v19 + 1) + 8 * v17), (void)v19);
          if (v18) {
            [v8 addGesture:v18];
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

+ (void)_addKeyboardShortcutsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 _overlay:v10 shouldIncludeItem:@"KeyChord"])
  {
    id v11 = [v10 objectForKeyedSubscript:@"KeyChord"];
    if (!v11)
    {
      id v11 = [v9 objectForKeyedSubscript:@"KeyChord"];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = objc_msgSend(a1, "_profileKeyChordsFromDictionaryValue:", v11, 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [v8 addKeyboardShortcut:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

+ (void)_addQuickNavShortcutsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 _overlay:v10 shouldIncludeItem:@"QuickNav"])
  {
    id v11 = [v10 objectForKeyedSubscript:@"QuickNav"];
    if (!v11)
    {
      id v11 = [v9 objectForKeyedSubscript:@"QuickNav"];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = objc_msgSend(a1, "_profileKeyChordsFromDictionaryValue:", v11, 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [v8 addQuickNavShortcut:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

+ (void)_addSecondaryCommandsToCommand:(id)a3 fromCommandProperties:(id)a4 overlayProperties:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [a4 objectForKeyedSubscript:@"SecondaryCommands"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke;
    v9[3] = &unk_2643FDC90;
    id v10 = v6;
    [v7 enumerateKeysAndObjectsUsingBlock:v9];
    id v8 = v10;
LABEL_6:

    goto LABEL_7;
  }
  if (v7)
  {
    id v8 = VOTLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[VOSCommandProfile _addSecondaryCommandsToCommand:fromCommandProperties:overlayProperties:]();
    }
    goto LABEL_6;
  }
LABEL_7:
}

void __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"Context"];
  id v8 = v7;
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"TextEntry"])
  {
    uint64_t v9 = 1;
LABEL_7:
    uint64_t v10 = [v6 objectForKeyedSubscript:@"PressCount"];
    if (v10) {
      id v11 = v10;
    }
    else {
      id v11 = &unk_26CC938B8;
    }
    id v12 = +[_VOSProfileSecondaryCommand profileSecondaryCommandWithStringValue:v5 context:v9 pressCount:[v11 unsignedIntegerValue]];
    if (v12)
    {
      [*(id *)(a1 + 32) addSecondaryCommand:v12];
    }
    else
    {
      uint64_t v13 = VOTLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke_cold_1();
      }
    }
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"TableNavigation"])
  {
    uint64_t v9 = 2;
    goto LABEL_7;
  }
  id v11 = VOTLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke_cold_2();
  }
LABEL_16:
}

+ (id)_profileKeyChordsFromDictionaryValue:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19[0] = v3;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:
  if ([v5 count])
  {
    id v6 = [MEMORY[0x263EFF980] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = +[_VOSProfileKeyChord profileKeyChordWithStringValue:](_VOSProfileKeyChord, "profileKeyChordWithStringValue:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (VOSCommandProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOSCommandProfileDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_modes, 0);
}

- (void)commandForTouchGesture:withResolver:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C3F9000, v0, v1, "commandForGesture resolved to unsupported command for this host: %@", v2, v3, v4, v5, v6);
}

- (void)_profileCommandForCommand:inMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C3F9000, v0, v1, "built-in command was unexpectedly unmapped: %@", v2, v3, v4, v5, v6);
}

+ (void)_addSecondaryCommandsToCommand:fromCommandProperties:overlayProperties:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C3F9000, v0, v1, "command secondaryInfo is of unexpected type: %@", v2, v3, v4, v5, v6);
}

void __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C3F9000, v0, v1, "unknown secondary command: %@", v2, v3, v4, v5, v6);
}

void __92__VOSCommandProfile__addSecondaryCommandsToCommand_fromCommandProperties_overlayProperties___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C3F9000, v0, v1, "command:secondaryInfo:context is of unexpected type: %@", v2, v3, v4, v5, v6);
}

@end