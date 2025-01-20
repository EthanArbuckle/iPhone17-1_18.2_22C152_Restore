@interface _VOSProfileCommand
+ (BOOL)supportsSecureCoding;
+ (_VOSProfileCommand)profileCommandWithCommand:(id)a3;
+ (_VOSProfileCommand)profileCommandWithStringValue:(id)a3;
- (BOOL)hasSecondaryCommands;
- (NSMutableSet)gestures;
- (NSMutableSet)keyboardShortcuts;
- (NSMutableSet)quickNavShortcuts;
- (NSMutableSet)secondaryCommands;
- (VOSCommand)command;
- (_VOSProfileCommand)initWithCoder:(id)a3;
- (_VOSProfileMode)mode;
- (id)_initWithCommand:(id)a3 gestures:(id)a4 keyboardShortcuts:(id)a5 quickNavShortcuts:(id)a6 secondaryCommands:(id)a7;
- (id)description;
- (id)profileGestureForGesture:(id)a3;
- (id)profileKeyboardShortcutForKeyChord:(id)a3;
- (id)profileQuickNavShortcutForKeyChord:(id)a3;
- (id)secondaryCommandsForPressCount:(int64_t)a3;
- (void)addGesture:(id)a3;
- (void)addKeyboardShortcut:(id)a3;
- (void)addQuickNavShortcut:(id)a3;
- (void)addSecondaryCommand:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeGesture:(id)a3;
- (void)removeKeyboardShortcut:(id)a3;
- (void)removeQuickNavShortcut:(id)a3;
- (void)removeSecondaryCommand:(id)a3;
- (void)setCommand:(id)a3;
- (void)setGestures:(id)a3;
- (void)setKeyboardShortcuts:(id)a3;
- (void)setMode:(id)a3;
- (void)setQuickNavShortcuts:(id)a3;
- (void)setSecondaryCommands:(id)a3;
@end

@implementation _VOSProfileCommand

+ (_VOSProfileCommand)profileCommandWithCommand:(id)a3
{
  id v3 = a3;
  id v4 = [[_VOSProfileCommand alloc] _initWithCommand:v3 gestures:0 keyboardShortcuts:0 quickNavShortcuts:0 secondaryCommands:0];

  return (_VOSProfileCommand *)v4;
}

+ (_VOSProfileCommand)profileCommandWithStringValue:(id)a3
{
  id v4 = +[VOSCommand builtInCommandWithStringValue:a3];
  if (v4)
  {
    v5 = [a1 profileCommandWithCommand:v4];
  }
  else
  {
    v5 = 0;
  }

  return (_VOSProfileCommand *)v5;
}

- (id)_initWithCommand:(id)a3 gestures:(id)a4 keyboardShortcuts:(id)a5 quickNavShortcuts:(id)a6 secondaryCommands:(id)a7
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v68.receiver = self;
  v68.super_class = (Class)_VOSProfileCommand;
  v18 = [(_VOSProfileCommand *)&v68 init];
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_command, a3);
    if (v14)
    {
      id v20 = v14;
    }
    else
    {
      id v20 = [MEMORY[0x263EFF9C0] set];
    }
    id v21 = p_isa[2];
    p_isa[2] = v20;
    id v51 = v13;

    if (v15)
    {
      id v22 = v15;
    }
    else
    {
      id v22 = [MEMORY[0x263EFF9C0] set];
    }
    id v23 = p_isa[3];
    p_isa[3] = v22;

    if (v16)
    {
      id v24 = v16;
    }
    else
    {
      id v24 = [MEMORY[0x263EFF9C0] set];
    }
    id v25 = p_isa[4];
    p_isa[4] = v24;

    id v50 = v14;
    id v26 = v15;
    if (v17)
    {
      id v27 = v17;
    }
    else
    {
      id v27 = [MEMORY[0x263EFF9C0] set];
    }
    id v28 = p_isa[5];
    p_isa[5] = v27;

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v29 = p_isa[2];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v65 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v64 + 1) + 8 * i) setCommand:p_isa];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v31);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v34 = p_isa[3];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v71 count:16];
    id v15 = v26;
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v61 != v37) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v60 + 1) + 8 * j) setCommand:p_isa];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v36);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v39 = p_isa[4];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(v39);
          }
          [*(id *)(*((void *)&v56 + 1) + 8 * k) setCommand:p_isa];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v70 count:16];
      }
      while (v41);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v44 = p_isa[5];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v52 objects:v69 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v53;
      do
      {
        for (uint64_t m = 0; m != v46; ++m)
        {
          if (*(void *)v53 != v47) {
            objc_enumerationMutation(v44);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * m) setPrimaryProfileCommand:p_isa];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v52 objects:v69 count:16];
      }
      while (v46);
    }

    id v14 = v50;
    id v13 = v51;
  }

  return p_isa;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_VOSProfileCommand *)self command];
  v7 = [v3 stringWithFormat:@"%@<%p>: cmd '%@'", v5, self, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VOSProfileCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"commandType"];
  if (v5 == 1)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriShortcut"];
    uint64_t v7 = +[VOSCommand commandWithSiriShortcut:v6];
  }
  else
  {
    if (v5)
    {
LABEL_6:
      v8 = +[VOSCommand Invalid];
      goto LABEL_7;
    }
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
    uint64_t v7 = +[VOSCommand builtInCommandWithStringValue:v6];
  }
  v8 = (void *)v7;

  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"gestures"];

  id v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"keyboardShortcuts"];

  id v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  id v20 = [v4 decodeObjectOfClasses:v19 forKey:@"quickNavShortcuts"];

  id v21 = (void *)MEMORY[0x263EFFA08];
  uint64_t v22 = objc_opt_class();
  id v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  id v24 = [v4 decodeObjectOfClasses:v23 forKey:@"secondaryCommands"];

  id v25 = [(_VOSProfileCommand *)self _initWithCommand:v8 gestures:v12 keyboardShortcuts:v16 quickNavShortcuts:v20 secondaryCommands:v24];
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[VOSCommand commandType](self->_command, "commandType"), @"commandType");
  int64_t v4 = [(VOSCommand *)self->_command commandType];
  if (v4 == 1)
  {
    uint64_t v5 = [(VOSCommand *)self->_command siriShortcut];
    v6 = @"siriShortcut";
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    uint64_t v5 = [(VOSCommand *)self->_command rawValue];
    v6 = @"command";
  }
  [v7 encodeObject:v5 forKey:v6];

LABEL_6:
  [v7 encodeObject:self->_gestures forKey:@"gestures"];
  [v7 encodeObject:self->_keyboardShortcuts forKey:@"keyboardShortcuts"];
  [v7 encodeObject:self->_quickNavShortcuts forKey:@"quickNavShortcuts"];
  [v7 encodeObject:self->_secondaryCommands forKey:@"secondaryCommands"];
}

- (void)addGesture:(id)a3
{
  gestures = self->_gestures;
  id v5 = a3;
  [(NSMutableSet *)gestures addObject:v5];
  [v5 setCommand:self];
}

- (void)removeGesture:(id)a3
{
  id v4 = a3;
  [v4 setCommand:0];
  [(NSMutableSet *)self->_gestures removeObject:v4];
}

- (id)profileGestureForGesture:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_gestures;
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
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "gesture", (void)v13);
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

- (void)addKeyboardShortcut:(id)a3
{
  keyboardShortcuts = self->_keyboardShortcuts;
  id v5 = a3;
  [(NSMutableSet *)keyboardShortcuts addObject:v5];
  [v5 setCommand:self];
}

- (void)removeKeyboardShortcut:(id)a3
{
  id v4 = a3;
  [v4 setCommand:0];
  [(NSMutableSet *)self->_keyboardShortcuts removeObject:v4];
}

- (id)profileKeyboardShortcutForKeyChord:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_keyboardShortcuts;
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
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "keyChord", (void)v13);
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

- (void)addQuickNavShortcut:(id)a3
{
  quickNavShortcuts = self->_quickNavShortcuts;
  id v5 = a3;
  [(NSMutableSet *)quickNavShortcuts addObject:v5];
  [v5 setCommand:self];
}

- (void)removeQuickNavShortcut:(id)a3
{
  id v4 = a3;
  [v4 setCommand:0];
  [(NSMutableSet *)self->_quickNavShortcuts removeObject:v4];
}

- (id)profileQuickNavShortcutForKeyChord:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_quickNavShortcuts;
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
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "keyChord", (void)v13);
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

- (void)addSecondaryCommand:(id)a3
{
  secondaryCommands = self->_secondaryCommands;
  id v5 = a3;
  [(NSMutableSet *)secondaryCommands addObject:v5];
  [v5 setPrimaryProfileCommand:self];
}

- (void)removeSecondaryCommand:(id)a3
{
  id v4 = a3;
  [v4 setPrimaryProfileCommand:0];
  [(NSMutableSet *)self->_secondaryCommands removeObject:v4];
}

- (BOOL)hasSecondaryCommands
{
  return [(NSMutableSet *)self->_secondaryCommands count] != 0;
}

- (id)secondaryCommandsForPressCount:(int64_t)a3
{
  secondaryCommands = self->_secondaryCommands;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53___VOSProfileCommand_secondaryCommandsForPressCount___block_invoke;
  v6[3] = &__block_descriptor_40_e41_B24__0___VOSProfileSecondaryCommand_8_B16l;
  v6[4] = a3;
  id v4 = [(NSMutableSet *)secondaryCommands ax_filteredSetUsingBlock:v6];

  return v4;
}

- (VOSCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (NSMutableSet)gestures
{
  return self->_gestures;
}

- (void)setGestures:(id)a3
{
}

- (NSMutableSet)keyboardShortcuts
{
  return self->_keyboardShortcuts;
}

- (void)setKeyboardShortcuts:(id)a3
{
}

- (NSMutableSet)quickNavShortcuts
{
  return self->_quickNavShortcuts;
}

- (void)setQuickNavShortcuts:(id)a3
{
}

- (NSMutableSet)secondaryCommands
{
  return self->_secondaryCommands;
}

- (void)setSecondaryCommands:(id)a3
{
}

- (_VOSProfileMode)mode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mode);

  return (_VOSProfileMode *)WeakRetained;
}

- (void)setMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mode);
  objc_storeStrong((id *)&self->_secondaryCommands, 0);
  objc_storeStrong((id *)&self->_quickNavShortcuts, 0);
  objc_storeStrong((id *)&self->_keyboardShortcuts, 0);
  objc_storeStrong((id *)&self->_gestures, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

@end