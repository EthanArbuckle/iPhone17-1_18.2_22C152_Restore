@interface UIPhysicalKeyboardEvent
+ (BOOL)supportsSecureCoding;
+ (id)_eventWithInput:(id)a3 inputFlags:(int)a4;
- (BOOL)_isARepeat;
- (BOOL)_isDeleteKey;
- (BOOL)_isEjectKey;
- (BOOL)_isExternalEvent;
- (BOOL)_isGlobeKey;
- (BOOL)_isKeyDown;
- (BOOL)_isModifierKey;
- (BOOL)_isPhysicalKeyEvent;
- (BOOL)_shouldAttemptSecurePasteAuthentication;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyCommandHandlingBeforePublic;
- (BOOL)keyEventForwardedFromInputUIHost;
- (BOOL)shiftDown;
- (NSString)_commandModifiedInput;
- (NSString)_hint;
- (NSString)_markedInput;
- (NSString)_modifiedInput;
- (NSString)_privateInput;
- (NSString)_shiftModifiedInput;
- (NSString)_unmodifiedInput;
- (UIPhysicalKeyboardEvent)initWithCoder:(id)a3;
- (id)_cloneEvent;
- (int)_inputFlags;
- (int64_t)_gsModifierFlags;
- (int64_t)_keyCode;
- (int64_t)_matchFidelityForKeyCommand:(id)a3;
- (int64_t)_matchFidelityForKeyCommand:(id)a3 translationMap:(id)a4;
- (int64_t)_matchFidelityForKeyCommand:(id)a3 translationMap:(id)a4 additionalModifiers:(int64_t)a5;
- (int64_t)_matchFidelityFromKeyMapForKeyCommand:(id)a3 translationMap:(id)a4 translator:(id)a5 addingModifiers:(int64_t)a6 ignoringModifiers:(int64_t)a7;
- (int64_t)_modifierFlags;
- (int64_t)_privateModifierFlags;
- (int64_t)source;
- (int64_t)type;
- (unsigned)keyCommandCode;
- (void)_prepareKeyTranslationMapIfNeeded;
- (void)_privatize;
- (void)_setHIDEvent:(__IOHIDEvent *)a3 keyboard:(__GSKeyboard *)a4;
- (void)_setModifierFlags:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyCommandCode:(unsigned int)a3;
- (void)setKeyCommandHandlingBeforePublic:(BOOL)a3;
- (void)setKeyEventForwardedFromInputUIHost:(BOOL)a3;
- (void)setShiftDown:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)set_commandModifiedInput:(id)a3;
- (void)set_externalEvent:(BOOL)a3;
- (void)set_hint:(id)a3;
- (void)set_inputFlags:(int)a3;
- (void)set_keyCode:(int64_t)a3;
- (void)set_markedInput:(id)a3;
- (void)set_modifiedInput:(id)a3;
- (void)set_privateInput:(id)a3;
- (void)set_privateModifierFlags:(int64_t)a3;
- (void)set_shiftModifiedInput:(id)a3;
- (void)set_unmodifiedInput:(id)a3;
@end

@implementation UIPhysicalKeyboardEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  v4 = [(UIPhysicalKeyboardEvent *)self _modifiedInput];

  if (v4)
  {
    v5 = [(UIPhysicalKeyboardEvent *)self _modifiedInput];
    [v19 encodeObject:v5 forKey:@"modifiedInput"];
  }
  v6 = [(UIPhysicalKeyboardEvent *)self _unmodifiedInput];

  if (v6)
  {
    v7 = [(UIPhysicalKeyboardEvent *)self _unmodifiedInput];
    [v19 encodeObject:v7 forKey:@"unmodifiedInput"];
  }
  v8 = [(UIPhysicalKeyboardEvent *)self _shiftModifiedInput];

  if (v8)
  {
    v9 = [(UIPhysicalKeyboardEvent *)self _shiftModifiedInput];
    [v19 encodeObject:v9 forKey:@"shiftModifiedInput"];
  }
  v10 = [(UIPhysicalKeyboardEvent *)self _commandModifiedInput];

  if (v10)
  {
    v11 = [(UIPhysicalKeyboardEvent *)self _commandModifiedInput];
    [v19 encodeObject:v11 forKey:@"commandModifiedInput"];
  }
  v12 = [(UIPhysicalKeyboardEvent *)self _markedInput];

  if (v12)
  {
    v13 = [(UIPhysicalKeyboardEvent *)self _markedInput];
    [v19 encodeObject:v13 forKey:@"markedInput"];
  }
  v14 = [(UIPhysicalKeyboardEvent *)self _privateInput];

  if (v14)
  {
    v15 = [(UIPhysicalKeyboardEvent *)self _privateInput];
    [v19 encodeObject:v15 forKey:@"privateInput"];
  }
  v16 = [(UIPhysicalKeyboardEvent *)self _hint];

  if (v16)
  {
    v17 = [(UIPhysicalKeyboardEvent *)self _hint];
    [v19 encodeObject:v17 forKey:@"hint"];
  }
  objc_msgSend(v19, "encodeInteger:forKey:", -[UIPhysicalKeyboardEvent _modifierFlags](self, "_modifierFlags"), @"modifiedFlags");
  objc_msgSend(v19, "encodeInteger:forKey:", -[UIPhysicalKeyboardEvent _privateModifierFlags](self, "_privateModifierFlags"), @"privateModifierFlags");
  objc_msgSend(v19, "encodeInt32:forKey:", -[UIPhysicalKeyboardEvent _keyCode](self, "_keyCode"), @"keyCode");
  objc_msgSend(v19, "encodeInt:forKey:", -[UIPhysicalKeyboardEvent _inputFlags](self, "_inputFlags"), @"inputFlags");
  objc_msgSend(v19, "encodeInteger:forKey:", -[UIPhysicalKeyboardEvent source](self, "source"), @"source");
  objc_msgSend(v19, "encodeBool:forKey:", -[UIPhysicalKeyboardEvent _isExternalEvent](self, "_isExternalEvent"), @"externalEvent");
  [(UIEvent *)self _hidEvent];
  Data = (void *)IOHIDEventCreateData();
  [v19 encodeObject:Data forKey:@"hidEvent"];
  objc_msgSend(v19, "encodeInt:forKey:", -[UIPhysicalKeyboardEvent keyCommandCode](self, "keyCommandCode"), @"keyCommandCode");
  objc_msgSend(v19, "encodeBool:forKey:", -[UIPhysicalKeyboardEvent keyCommandHandlingBeforePublic](self, "keyCommandHandlingBeforePublic"), @"keyCommandHandlingBeforePublic");
  objc_msgSend(v19, "encodeBool:forKey:", -[UIPhysicalKeyboardEvent shiftDown](self, "shiftDown"), @"shiftDown");
  objc_msgSend(v19, "encodeBool:forKey:", -[UIPhysicalKeyboardEvent keyEventForwardedFromInputUIHost](self, "keyEventForwardedFromInputUIHost"), @"keyEventForwardedFromInputUIHost");
  [v19 encodeObject:self->_keyTranslationMap forKey:@"keyTranslationMap"];
}

- (UIPhysicalKeyboardEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UIPhysicalKeyboardEvent;
  v5 = [(UIPhysicalKeyboardEvent *)&v26 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedInput"];
    [(UIPhysicalKeyboardEvent *)v5 set_modifiedInput:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unmodifiedInput"];
    [(UIPhysicalKeyboardEvent *)v5 set_unmodifiedInput:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shiftModifiedInput"];
    [(UIPhysicalKeyboardEvent *)v5 set_shiftModifiedInput:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commandModifiedInput"];
    [(UIPhysicalKeyboardEvent *)v5 set_commandModifiedInput:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"markedInput"];
    [(UIPhysicalKeyboardEvent *)v5 set_markedInput:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateInput"];
    [(UIPhysicalKeyboardEvent *)v5 set_privateInput:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hint"];
    [(UIPhysicalKeyboardEvent *)v5 set_hint:v12];

    -[UIPhysicalKeyboardEvent _setModifierFlags:](v5, "_setModifierFlags:", [v4 decodeIntegerForKey:@"modifiedFlags"]);
    -[UIPhysicalKeyboardEvent set_privateModifierFlags:](v5, "set_privateModifierFlags:", [v4 decodeIntegerForKey:@"privateModifierFlags"]);
    -[UIPhysicalKeyboardEvent set_keyCode:](v5, "set_keyCode:", (int)[v4 decodeInt32ForKey:@"keyCode"]);
    -[UIPhysicalKeyboardEvent set_inputFlags:](v5, "set_inputFlags:", [v4 decodeIntForKey:@"inputFlags"]);
    -[UIPhysicalKeyboardEvent setSource:](v5, "setSource:", [v4 decodeIntegerForKey:@"source"]);
    -[UIPhysicalKeyboardEvent set_externalEvent:](v5, "set_externalEvent:", [v4 decodeBoolForKey:@"externalEvent"]);
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hidEvent"];
    uint64_t v14 = MEMORY[0x18C105F40](*MEMORY[0x1E4F1CF80], v13);
    if (v14)
    {
      v15 = (const void *)v14;
      v25.receiver = v5;
      v25.super_class = (Class)UIPhysicalKeyboardEvent;
      [(UIEvent *)&v25 _setHIDEvent:v14];
      CFRelease(v15);
    }
    -[UIPhysicalKeyboardEvent setKeyCommandCode:](v5, "setKeyCommandCode:", [v4 decodeIntForKey:@"keyCommandCode"]);
    -[UIPhysicalKeyboardEvent setKeyCommandHandlingBeforePublic:](v5, "setKeyCommandHandlingBeforePublic:", [v4 decodeBoolForKey:@"keyCommandHandlingBeforePublic"]);
    -[UIPhysicalKeyboardEvent setShiftDown:](v5, "setShiftDown:", [v4 decodeBoolForKey:@"shiftDown"]);
    -[UIPhysicalKeyboardEvent setKeyEventForwardedFromInputUIHost:](v5, "setKeyEventForwardedFromInputUIHost:", [v4 decodeBoolForKey:@"keyEventForwardedFromInputUIHost"]);
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyTranslationMap"];
    keyTranslationMap = v5->_keyTranslationMap;
    v5->_keyTranslationMap = (_UIPhysicalKeyTranslationMap *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalEscapeKeyTranslationMap"];
    originalEscapeKeyTranslationMap = v5->_originalEscapeKeyTranslationMap;
    v5->_originalEscapeKeyTranslationMap = (_UIPhysicalKeyTranslationMap *)v18;

    v20 = [(UIPhysicalKeyboardEvent *)v5 _shiftModifiedInput];

    if (v20)
    {
      v21 = v5->_keyTranslationMap;
      v22 = [(UIPhysicalKeyboardEvent *)v5 _shiftModifiedInput];
      [(_UIPhysicalKeyTranslationMap *)v21 setKeyTranslation:v22 modifiers:0x20000];
    }
    if ([(UIEvent *)v5 _hidEvent]) {
      BOOL v23 = v5->_keyTranslationMap != 0;
    }
    else {
      BOOL v23 = 0;
    }
    v5->_needToPrepareKeyTranslationMap = v23;
  }
  return v5;
}

- (void)_prepareKeyTranslationMapIfNeeded
{
  if (self->_needToPrepareKeyTranslationMap && [(UIEvent *)self _hidEvent] && self->_keyTranslationMap)
  {
    v3 = -[_UIPhysicalKeyTranslator initWithGSKeyboard:]([_UIPhysicalKeyTranslator alloc], "initWithGSKeyboard:", [(id)UIApp _hardwareKeyboardForPhysicalKeyboardEvent:self createIfNeeded:0]);
    [(_UIPhysicalKeyTranslationMap *)self->_keyTranslationMap populateAllCombinationsOfModifiers:1966080 translator:v3];
  }
  self->_needToPrepareKeyTranslationMap = 0;
}

- (int64_t)type
{
  return 4;
}

- (BOOL)_isKeyDown
{
  if (![(UIEvent *)self _hidEvent]) {
    return 1;
  }
  [(UIEvent *)self _hidEvent];
  return IOHIDEventGetIntegerValue() != 0;
}

- (BOOL)_isEjectKey
{
  v3 = [(UIEvent *)self _hidEvent];
  if (v3)
  {
    [(UIEvent *)self _hidEvent];
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    [(UIEvent *)self _hidEvent];
    uint64_t v5 = IOHIDEventGetIntegerValue();
    BOOL v7 = v5 == 430 || v5 == 184;
    LOBYTE(v3) = IntegerValue == 12 && v7;
  }
  return (char)v3;
}

- (BOOL)_isGlobeKey
{
  v3 = [(UIEvent *)self _hidEvent];
  if (v3)
  {
    [(UIEvent *)self _hidEvent];
    IOHIDEventGetIntegerValue();
    [(UIEvent *)self _hidEvent];
    IOHIDEventGetIntegerValue();
    LOBYTE(v3) = GSKeyboardIsGlobeKeyUsagePair() != 0;
  }
  return (char)v3;
}

- (int64_t)_keyCode
{
  int64_t result = [(UIEvent *)self _hidEvent];
  if (result)
  {
    [(UIEvent *)self _hidEvent];
    return IOHIDEventGetIntegerValue();
  }
  return result;
}

- (BOOL)_isPhysicalKeyEvent
{
  return 1;
}

- (void)_setModifierFlags:(int64_t)a3
{
  keyTranslationMap = self->_keyTranslationMap;
  if (keyTranslationMap
    && [(_UIPhysicalKeyTranslationMap *)keyTranslationMap originalModifiers] != a3)
  {
    v6 = [[_UIPhysicalKeyTranslationMap alloc] initWithKeyCode:(unsigned __int16)[(UIPhysicalKeyboardEvent *)self _keyCode] action:[(UIPhysicalKeyboardEvent *)self _isKeyDown] ^ 1 modifiers:a3];
    BOOL v7 = self->_keyTranslationMap;
    self->_keyTranslationMap = v6;

    self->_needToPrepareKeyTranslationMap = 0;
  }
  self->_modifierFlags = a3;
}

- (BOOL)_isModifierKey
{
  v3 = [(UIEvent *)self _hidEvent];
  if (v3)
  {
    uint64_t v4 = [(UIPhysicalKeyboardEvent *)self _keyCode];
    LOBYTE(v3) = isModifierFlag(v4);
  }
  return (char)v3;
}

- (BOOL)_isARepeat
{
  BOOL v3 = [(UIPhysicalKeyboardEvent *)self _isKeyDown];
  if (v3) {
    LOBYTE(v3) = [(UIPhysicalKeyboardEvent *)self _inputFlags] & 1;
  }
  return v3;
}

- (BOOL)_isDeleteKey
{
  BOOL v3 = [(UIEvent *)self _hidEvent];
  if (v3)
  {
    [(UIEvent *)self _hidEvent];
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    [(UIEvent *)self _hidEvent];
    uint64_t v5 = IOHIDEventGetIntegerValue();
    LOBYTE(v3) = IntegerValue == 7 && v5 == 42;
  }
  return (char)v3;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3 keyboard:(__GSKeyboard *)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v81.receiver = self;
  v81.super_class = (Class)UIPhysicalKeyboardEvent;
  -[UIEvent _setHIDEvent:](&v81, sel__setHIDEvent_);
  unint64_t TimeStamp = IOHIDEventGetTimeStamp();
  [(UIEvent *)self _setTimestamp:_UIMediaTimeForMachTime(TimeStamp)];
  if (!a4) {
    return;
  }
  if (IOHIDEventGetType() != 3) {
    return;
  }
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  if (IntegerValue != 7 && IntegerValue != 255)
  {
    if (IntegerValue != 12) {
      return;
    }
    uint64_t v9 = IOHIDEventGetIntegerValue();
    if (v9 != 184 && v9 != 669 && v9 != 430) {
      return;
    }
  }
  originalEscapeKeyTranslationMap = self->_originalEscapeKeyTranslationMap;
  uint64_t v69 = 152;
  self->_originalEscapeKeyTranslationMap = 0;

  uint64_t v11 = IOHIDEventGetIntegerValue();
  uint64_t v12 = IOHIDEventGetIntegerValue();
  uint64_t v13 = IOHIDEventGetIntegerValue();
  v77 = &v69;
  MEMORY[0x1F4188790](v13);
  uint64_t v76 = v12;
  BOOL v15 = v12 == 0;
  *(void *)((char *)&v68[30] + 2) = 0;
  *(_OWORD *)((char *)&v68[28] + 4) = 0u;
  *(_OWORD *)((char *)&v68[26] + 4) = 0u;
  *(_OWORD *)((char *)&v68[24] + 4) = 0u;
  *(_OWORD *)((char *)&v68[22] + 4) = 0u;
  *(_OWORD *)((char *)&v68[20] + 4) = 0u;
  *(_OWORD *)((char *)&v68[18] + 4) = 0u;
  *(_OWORD *)((char *)&v68[16] + 4) = 0u;
  *(_OWORD *)((char *)&v68[14] + 4) = 0u;
  *(_OWORD *)((char *)&v68[12] + 4) = 0u;
  *(_OWORD *)((char *)&v68[10] + 4) = 0u;
  *(_OWORD *)((char *)&v68[8] + 4) = 0u;
  *(_OWORD *)((char *)&v68[6] + 4) = 0u;
  if (v12) {
    int v16 = 10;
  }
  else {
    int v16 = 11;
  }
  *(_OWORD *)((char *)&v68[4] + 4) = 0uLL;
  LODWORD(v68[0]) = v16;
  BOOL v17 = v11 == 103 || v11 == 133;
  *(_OWORD *)((char *)&v68[2] + 4) = 0uLL;
  *(_OWORD *)((char *)v68 + 4) = 0uLL;
  uint64_t v18 = 0x200000;
  if (!v17) {
    uint64_t v18 = 0;
  }
  if ((unint64_t)(v11 - 83) < 0x11) {
    uint64_t v18 = 0x200000;
  }
  if (v14 != 7) {
    uint64_t v18 = 0;
  }
  uint64_t v73 = v18;
  int v80 = 0;
  int ModifierState = GSKeyboardGetModifierState();
  if (!isModifierFlag(v11))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", v68[0], v68[1], v68[2], 0, v68[4], 0, v68[6], 0, v68[8], 0, v68[10], v68[11], v68[12], v68[13], v68[14], v68[15], v68[16],
      v68[17],
      v68[18],
      v68[19],
      v68[20],
      v68[21],
      v68[22],
      v68[23],
      v68[24],
      v68[25],
      v68[26],
      v68[27],
      v68[28],
      v68[29],
      v68[30],
    v20 = v68[31]);
    char v21 = [v20 isCapsLockSwitchEnabled];

    if ((v21 & 1) == 0)
    {
      LODWORD(v79) = v15;
      v22 = BKSHIDEventGetKeyboardAttributes();
      unsigned int v23 = [v22 GSModifierState];

      int v24 = ModifierState & 0x40000;
      if (((v23 >> 18) & 1) != (ModifierState & 0x40000u) >> 18)
      {
        objc_super v25 = +[UIKeyboardImpl activeInstance];
        [v25 _setCapsLockIfNeeded:a4 event:a3];

        int ModifierState = GSKeyboardGetModifierState();
        int v24 = ModifierState & 0x40000;
      }
      int v26 = v24 != 0;
      v27 = +[UIKeyboardImpl activeInstance];
      int v28 = [v27 isCapsLockSignOn];

      if (v26 != v28)
      {
        v29 = +[UIKeyboardImpl activeInstance];
        [v29 _setCapsLockIfNeeded:a4 event:a3];
      }
    }
  }
  Liveint ModifierState = GSKeyboardGetLiveModifierState();
  if (dyld_program_sdk_at_least()) {
    int v31 = ModifierState & 0x40000;
  }
  else {
    int v31 = 0;
  }
  v74 = (char *)&v68[24] + 6;
  v78 = (unsigned __int16 *)&v68[24] + 2;
  v79 = (unsigned __int16 *)&v68[12];
  v75 = (char *)&v68[12] + 2;
  v70 = (unsigned __int16 *)&v68[18] + 1;
  v71 = (char *)&v68[18] + 4;
  GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
  int v32 = GSKeyboardGetModifierState();
  int v33 = GSKeyboardGetLiveModifierState();
  int v34 = dyld_program_sdk_at_least();
  int v35 = v32 & 0x40000;
  if (!v34) {
    int v35 = 0;
  }
  int v36 = v35 | v33;
  LODWORD(v68[8]) = v35 | v33;
  if (v13 == 7)
  {
    uint64_t v37 = 54;
    if (v11 != 133) {
      uint64_t v37 = v11;
    }
    if (v11 == 88) {
      uint64_t v11 = 40;
    }
    else {
      uint64_t v11 = v37;
    }
    LOWORD(v68[31]) = 1;
    if (isModifierFlag(v11))
    {
      v38 = 0;
      int v39 = 0;
      BOOL v41 = v11 == 57 && (v31 | LiveModifierState) == v36;
      if (!*v79 && !*v78 && !v41)
      {
        LODWORD(v68[0]) = 12;
        if (dyld_program_sdk_at_least()) {
          v38 = &stru_1ED0E84C0;
        }
        else {
          v38 = 0;
        }
        int v39 = 32;
      }
    }
    else
    {
      int v39 = 0;
      v38 = 0;
    }
  }
  else
  {
    int v39 = 0;
    v38 = 0;
    LOWORD(v68[31]) = 1;
  }
  v42 = (const void *)GSEventCreateWithEventRecord();
  gsEvent = self->super.super._gsEvent;
  if (gsEvent)
  {
    CFRelease(gsEvent);
    self->super.super._gsEvent = 0;
  }
  if (v42)
  {
    self->super.super._gsEvent = (__GSEvent *)CFRetain(v42);
    CFRelease(v42);
  }
  unsigned int v72 = (LODWORD(v68[8]) >> 21) & 0x10 | v39;
  if ((v68[8] & 0x480000) != 0) {
    unint64_t v44 = ((unint64_t)((v68[8] & 0x1010000) != 0) << 20) | 0x80000;
  }
  else {
    unint64_t v44 = (unint64_t)((v68[8] & 0x1010000) != 0) << 20;
  }
  if ((v68[8] & 0x900000) != 0) {
    v44 |= 0x40000uLL;
  }
  if ((v68[8] & 0x220000) != 0) {
    v44 |= 0x20000uLL;
  }
  unint64_t v45 = v73 | (LODWORD(v68[8]) >> 3) & 0x800000 | (LODWORD(v68[8]) >> 2) & 0x10000 | v44;
  v46 = [[_UIPhysicalKeyTranslator alloc] initWithGSKeyboard:a4];
  if ((_WORD)v80)
  {
    v47 = objc_msgSend(NSString, "stringWithCharacters:length:", v82);
    v48 = _UIKeyCommandGetLocalizedSymbol(@".");
    int v49 = [v47 isEqualToString:v48];

    if (v49)
    {
      uint64_t v50 = v76;
      v51 = [[_UIPhysicalKeyTranslationMap alloc] initWithKeyCode:(unsigned __int16)v11 action:v76 == 0 modifiers:v45];
      uint64_t v52 = v69;
      v53 = *(Class *)((char *)&self->super.super.super.isa + v69);
      *(Class *)((char *)&self->super.super.super.isa + v69) = (Class)v51;

      [*(id *)((char *)&self->super.super.super.isa + v52) populateAllCombinationsOfModifiers:1966080 translator:v46];
      unint64_t v54 = v45 & 0xFFFFFFFFFFEFFFFFLL;
      uint64_t v11 = 41;
    }
    else
    {
      [(UIPhysicalKeyboardEvent *)self set_commandModifiedInput:v47];
      unint64_t v54 = v45;
      uint64_t v50 = v76;
    }
  }
  else
  {
    [(UIPhysicalKeyboardEvent *)self set_commandModifiedInput:0];
    unint64_t v54 = v45;
    uint64_t v50 = v76;
  }
  if (v13 != 7 || v38)
  {
    v55 = v38;
    v56 = v55;
    if (v13 != 7) {
      goto LABEL_76;
    }
  }
  else
  {
    _UISpecialKeyInputFromHIDUsage(v11 + v54);
    v55 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
  v56 = _UISpecialKeyInputFromHIDUsage(v11);

LABEL_76:
  v57 = [[_UIPhysicalKeyTranslationMap alloc] initWithKeyCode:(unsigned __int16)v11 action:v50 == 0 modifiers:v54];
  keyTranslationMap = self->_keyTranslationMap;
  self->_keyTranslationMap = v57;

  [(UIPhysicalKeyboardEvent *)self _setModifierFlags:v54];
  [(UIPhysicalKeyboardEvent *)self set_privateModifierFlags:v45];
  [(UIPhysicalKeyboardEvent *)self set_inputFlags:v72];
  if (!v55)
  {
    v59 = [NSString stringWithCharacters:v75 length:*v79];
    [(UIPhysicalKeyboardEvent *)self set_modifiedInput:v59];

    if (v56) {
      goto LABEL_78;
    }
LABEL_80:
    v60 = objc_msgSend(NSString, "stringWithCharacters:length:", v71, *v70, v68[0]);
    [(UIPhysicalKeyboardEvent *)self set_unmodifiedInput:v60];

    goto LABEL_81;
  }
  [(UIPhysicalKeyboardEvent *)self set_modifiedInput:v55];
  if (!v56) {
    goto LABEL_80;
  }
LABEL_78:
  -[UIPhysicalKeyboardEvent set_unmodifiedInput:](self, "set_unmodifiedInput:", v56, v68[0]);
LABEL_81:
  v61 = [NSString stringWithCharacters:v74 length:*v78];
  [(UIPhysicalKeyboardEvent *)self set_markedInput:v61];

  if (HIWORD(v80))
  {
    v62 = objc_msgSend(NSString, "stringWithCharacters:length:", v83);
    [(UIPhysicalKeyboardEvent *)self set_shiftModifiedInput:v62];

    v63 = self->_keyTranslationMap;
    v64 = [(UIPhysicalKeyboardEvent *)self _shiftModifiedInput];
    [(_UIPhysicalKeyTranslationMap *)v63 setKeyTranslation:v64 modifiers:0x20000];
  }
  else
  {
    [(UIPhysicalKeyboardEvent *)self set_shiftModifiedInput:0];
  }
  [(_UIPhysicalKeyTranslationMap *)self->_keyTranslationMap populateAllCombinationsOfModifiers:1966080 translator:v46];
  self->_needToPrepareKeyTranslationMap = 0;
  if (v55)
  {
    v65 = [NSString stringWithCharacters:v75 length:*v79];
    [(UIPhysicalKeyboardEvent *)self set_privateInput:v65];

    BOOL v66 = 1;
  }
  else
  {
    [(UIPhysicalKeyboardEvent *)self set_privateInput:self->_modifiedInput];
    int64_t v67 = [(UIPhysicalKeyboardEvent *)self _modifierFlags];
    BOOL v66 = v67 != [(UIPhysicalKeyboardEvent *)self _privateModifierFlags];
  }
  self->_canPrivatize = v66;
}

- (int64_t)_matchFidelityForKeyCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if (self->_keyTranslationMap)
    {
      [(UIPhysicalKeyboardEvent *)self _prepareKeyTranslationMapIfNeeded];
      int64_t v6 = [(UIPhysicalKeyboardEvent *)self _matchFidelityForKeyCommand:v5 translationMap:self->_keyTranslationMap];
      if (v6 == 3) {
        goto LABEL_11;
      }
    }
    else
    {
      if ([v4 _layoutAwareModifierFlags] == self->_modifierFlags)
      {
        v8 = [v5 _layoutAwareInput];
        char v9 = [v8 isEqualToString:self->_modifiedInput];

        if (v9) {
          goto LABEL_11;
        }
      }
      int64_t v6 = 0;
    }
    if (self->_originalEscapeKeyTranslationMap)
    {
      int64_t v10 = -[UIPhysicalKeyboardEvent _matchFidelityForKeyCommand:translationMap:](self, "_matchFidelityForKeyCommand:translationMap:", v5);
      if (v10 == 3)
      {
LABEL_11:
        int64_t v7 = 3;
        goto LABEL_16;
      }
    }
    else
    {
      int64_t v10 = 0;
    }
    if (v6 <= v10) {
      int64_t v7 = v10;
    }
    else {
      int64_t v7 = v6;
    }
  }
  else
  {
    int64_t v7 = 0;
  }
LABEL_16:

  return v7;
}

- (int64_t)_matchFidelityForKeyCommand:(id)a3 translationMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(UIPhysicalKeyboardEvent *)self _matchFidelityForKeyCommand:v6 translationMap:v7 additionalModifiers:0];
  if (!v8)
  {
    if ([v6 _allowsCommandKeyModifierElision]
      && [v7 originalModifiers] == 0x100000)
    {
      int64_t v8 = [(UIPhysicalKeyboardEvent *)self _matchFidelityForKeyCommand:v6 translationMap:v7 additionalModifiers:0x20000];
    }
    else
    {
      int64_t v8 = 0;
    }
  }

  return v8;
}

- (int64_t)_matchFidelityForKeyCommand:(id)a3 translationMap:(id)a4 additionalModifiers:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 _layoutAwareModifierFlags] & 0x800000) != 0
    && ![v8 allowGlobeModifier])
  {
    goto LABEL_17;
  }
  uint64_t v10 = [v9 originalModifiers] | a5;
  uint64_t v11 = v10 & [v8 _layoutAwareModifierFlags];
  if (v11 != [v8 _layoutAwareModifierFlags]) {
    goto LABEL_17;
  }
  if (dyld_program_sdk_at_least())
  {
    v10 &= [v8 _layoutAwareModifierFlags] | 0xFFFFFFFFFFDEFFFFLL;
    uint64_t v12 = 2162688;
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (v10 == [v8 _layoutAwareModifierFlags])
  {
    uint64_t v13 = [v8 _layoutAwareKeyCodes];
    char v14 = objc_msgSend(v13, "containsIndex:", objc_msgSend(v9, "keyCode"));

    if (v14)
    {
      int64_t v15 = 3;
      goto LABEL_18;
    }
  }
  int v16 = [v8 input];

  if (!v16)
  {
LABEL_17:
    int64_t v15 = 0;
    goto LABEL_18;
  }
  BOOL v17 = -[_UIPhysicalKeyTranslator initWithGSKeyboard:]([_UIPhysicalKeyTranslator alloc], "initWithGSKeyboard:", [(id)UIApp _hardwareKeyboardForPhysicalKeyboardEvent:self createIfNeeded:1]);
  uint64_t v18 = [v8 _layoutAwareInput];
  id v19 = [v18 lowercaseString];

  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int64_t v38 = 0;
  int64_t v38 = [(UIPhysicalKeyboardEvent *)self _matchFidelityFromKeyMapForKeyCommand:v8 translationMap:v9 translator:v17 addingModifiers:a5 ignoringModifiers:v12];
  BOOL v20 = v36[3] == 2;
  char v21 = [(_UIPhysicalKeyTranslator *)v17 layoutName];
  v22 = +[_UIKeyCommandMatchingCache keyCommandMatchingCacheForLayout:]((uint64_t)_UIKeyCommandMatchingCache, v21);

  unsigned int v23 = -[_UIKeyCommandMatchingCache conflictStateForCommandKeyPlaneSwitchForInput:modifiers:](v22, v19, 917504);
  if (!v36[3])
  {
    uint64_t v26 = [v8 _layoutAwareModifierFlags];
    if ((v26 & v10) == [v8 _layoutAwareModifierFlags] && v23 != 1)
    {
      char v34 = 0;
      if ((v10 & 0x100000) == 0)
      {
        int v27 = objc_msgSend(v9, "areModifiers:minimalExcessOfMask:matching:translator:matchedModifierSubset:betterMatchFound:", v10 | 0x100000, objc_msgSend(v8, "_layoutAwareModifierFlags"), v19, v17, 0, &v34);
        int v28 = v34 ? 0 : v27;
        if (v28 == 1) {
          v36[3] = 1;
        }
      }
    }
  }
  if ((unint64_t)(v36[3] - 1) <= 1)
  {
    if (v23 == 1)
    {
      v36[3] = 0;
    }
    else if (!v23 && [v19 length] == 1)
    {
      __int16 v24 = [v19 characterAtIndex:0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __90__UIPhysicalKeyboardEvent__matchFidelityForKeyCommand_translationMap_additionalModifiers___block_invoke;
      v29[3] = &unk_1E53041B8;
      v30 = v17;
      __int16 v33 = v24;
      id v31 = v9;
      int v32 = &v35;
      +[_UIPhysicalKeyTranslationMap enumerateAllCombinationsOfModifiers:917504 staticModifiers:(unint64_t)v20 << 20 usingBlock:v29];
      -[_UIKeyCommandMatchingCache setCommandKeyPlaneHasSwitchingConflict:input:modifiers:](v22, v36[3] == 0, v19, 917504);
    }
  }
  int64_t v15 = v36[3];

  _Block_object_dispose(&v35, 8);
LABEL_18:

  return v15;
}

uint64_t __90__UIPhysicalKeyboardEvent__matchFidelityForKeyCommand_translationMap_additionalModifiers___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) HIDUsageCodeForCharacter:*(unsigned __int16 *)(a1 + 56) modifiers:a2];
  if (result != -1)
  {
    int v6 = result;
    uint64_t result = [*(id *)(a1 + 40) keyCode];
    if (v6 != result)
    {
      *a3 = 1;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  return result;
}

- (int64_t)_matchFidelityFromKeyMapForKeyCommand:(id)a3 translationMap:(id)a4 translator:(id)a5 addingModifiers:(int64_t)a6 ignoringModifiers:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [v11 _layoutAwareModifierFlags];
  uint64_t v15 = ([v12 originalModifiers] | a6) & ~a7;
  int v16 = [v11 _layoutAwareInput];
  BOOL v17 = [v16 lowercaseString];

  uint64_t v18 = objc_msgSend(v12, "keyTranslationWithModifiers:translator:", objc_msgSend(v12, "originalModifiers"), v13);
  id v19 = [v18 lowercaseString];

  int v20 = [v17 isEqualToString:v19] & (v14 == (v15 & 0xBF0000));
  if (v20) {
    int64_t v21 = 3;
  }
  else {
    int64_t v21 = 0;
  }
  if ((v20 & 1) == 0 && v15)
  {
    if (([v11 _isDirectlyReachableWithTranslator:v13] & 1) != 0
      || (char v24 = 0,
          uint64_t v23 = 0,
          ![v12 areModifiers:v15 & 0xBF0000 minimalExcessOfMask:v14 matching:v17 translator:v13 matchedModifierSubset:&v23 betterMatchFound:&v24]))
    {
      int64_t v21 = 0;
    }
    else if ((v15 & 0x100000) == 0 || (v23 & 0x100000) != 0)
    {
      int64_t v21 = 3;
    }
    else
    {
      int64_t v21 = 2;
    }
  }

  return v21;
}

- (BOOL)_shouldAttemptSecurePasteAuthentication
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(UIPhysicalKeyboardEvent *)self _isKeyDown]) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB3418], "allVariants", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int64_t v9 = [(UIPhysicalKeyboardEvent *)self _modifierFlags];
        if (v9 == [v8 keyModifierFlags])
        {
          uint64_t v10 = [(UIPhysicalKeyboardEvent *)self _commandModifiedInput];
          id v11 = [v8 keyInput];
          id v12 = v10;
          id v13 = v11;
          if (v12 == v13)
          {

LABEL_19:
            BOOL v16 = 1;
            goto LABEL_20;
          }
          uint64_t v14 = v13;
          if (v12 && v13)
          {
            char v15 = [v12 isEqual:v13];

            if (v15) {
              goto LABEL_19;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_20:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(UIPhysicalKeyboardEvent *)self _isKeyDown];
    if (v6 == [v5 _isKeyDown]
      && (int64_t v7 = [(UIPhysicalKeyboardEvent *)self _modifierFlags],
          v7 == [v5 _modifierFlags]))
    {
      id v8 = [(UIPhysicalKeyboardEvent *)self _modifiedInput];
      int64_t v9 = [v5 _modifiedInput];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_cloneEvent
{
  uint64_t v3 = [objc_alloc((Class)objc_opt_class()) _init];
  if ([(UIEvent *)self _hidEvent]) {
    objc_msgSend((id)v3, "_setHIDEvent:keyboard:", -[UIEvent _hidEvent](self, "_hidEvent"), 0);
  }
  id v4 = [(UIPhysicalKeyboardEvent *)self _modifiedInput];
  id v5 = (void *)[v4 copy];
  objc_msgSend((id)v3, "set_modifiedInput:", v5);

  int v6 = [(UIPhysicalKeyboardEvent *)self _unmodifiedInput];
  int64_t v7 = (void *)[v6 copy];
  objc_msgSend((id)v3, "set_unmodifiedInput:", v7);

  id v8 = [(UIPhysicalKeyboardEvent *)self _privateInput];
  int64_t v9 = (void *)[v8 copy];
  objc_msgSend((id)v3, "set_privateInput:", v9);

  *(void *)(v3 + 240) = self->_privateModifierFlags;
  char v10 = [(UIPhysicalKeyboardEvent *)self _shiftModifiedInput];
  id v11 = (void *)[v10 copy];
  objc_msgSend((id)v3, "set_shiftModifiedInput:", v11);

  id v12 = [(UIPhysicalKeyboardEvent *)self _commandModifiedInput];
  id v13 = (void *)[v12 copy];
  objc_msgSend((id)v3, "set_commandModifiedInput:", v13);

  uint64_t v14 = [(UIPhysicalKeyboardEvent *)self _markedInput];
  char v15 = (void *)[v14 copy];
  objc_msgSend((id)v3, "set_markedInput:", v15);

  BOOL v16 = [(UIPhysicalKeyboardEvent *)self _hint];
  BOOL v17 = (void *)[v16 copy];
  objc_msgSend((id)v3, "set_hint:", v17);

  objc_msgSend((id)v3, "_setModifierFlags:", -[UIPhysicalKeyboardEvent _modifierFlags](self, "_modifierFlags"));
  objc_msgSend((id)v3, "set_inputFlags:", -[UIPhysicalKeyboardEvent _inputFlags](self, "_inputFlags"));
  objc_msgSend((id)v3, "setSource:", -[UIPhysicalKeyboardEvent source](self, "source"));
  objc_msgSend((id)v3, "set_externalEvent:", -[UIPhysicalKeyboardEvent _isExternalEvent](self, "_isExternalEvent"));
  [(UIEvent *)self timestamp];
  objc_msgSend((id)v3, "_setTimestamp:");
  *(unsigned char *)(v3 + 144) = self->_canPrivatize;
  uint64_t v18 = [(_UIPhysicalKeyTranslationMap *)self->_keyTranslationMap copy];
  long long v19 = *(void **)(v3 + 160);
  *(void *)(v3 + 160) = v18;

  *(unsigned char *)(v3 + 168) = self->_needToPrepareKeyTranslationMap;
  uint64_t v20 = [(_UIPhysicalKeyTranslationMap *)self->_originalEscapeKeyTranslationMap copy];
  long long v21 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v20;

  *(unsigned char *)(v3 + 170) = [(UIPhysicalKeyboardEvent *)self keyEventForwardedFromInputUIHost];
  *(unsigned char *)(v3 + 168) = self->_needToPrepareKeyTranslationMap;
  return (id)v3;
}

+ (id)_eventWithInput:(id)a3 inputFlags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [(UIPressesEvent *)[UIPhysicalKeyboardEvent alloc] _init];
  objc_msgSend(v6, "set_modifiedInput:", v5);
  objc_msgSend(v6, "set_unmodifiedInput:", v5);

  objc_msgSend(v6, "set_inputFlags:", v4);
  [v6 _setTimestamp:(double)(unint64_t)GSCurrentEventTimestamp() / 1000000000.0];
  return v6;
}

- (void)_privatize
{
  if (self->_canPrivatize)
  {
    self->_canPrivatize = 0;
    privateInput = self->_privateInput;
    if (privateInput)
    {
      p_modifiedInput = &self->_modifiedInput;
      if (privateInput != self->_modifiedInput)
      {
        objc_storeStrong((id *)p_modifiedInput, privateInput);
        objc_storeStrong((id *)&self->_unmodifiedInput, self->_privateInput);
      }
    }
    int64_t privateModifierFlags = self->_privateModifierFlags;
    if (privateModifierFlags != self->_modifierFlags) {
      self->_modifierFlags = privateModifierFlags;
    }
  }
}

- (int64_t)_gsModifierFlags
{
  unint64_t v2 = [(UIPhysicalKeyboardEvent *)self _modifierFlags];
  return v2 & 0xA0000 | (((v2 >> 16) & 1) << 18) & 0xFFFFFFFFFBEFFFFFLL | (v2 >> 4) & 0x10000 | (((v2 >> 18) & 1) << 20) & 0xFFFFFFFFFBFFFFFFLL | (((v2 >> 23) & 1) << 26);
}

- (NSString)_modifiedInput
{
  return self->_modifiedInput;
}

- (void)set_modifiedInput:(id)a3
{
}

- (NSString)_unmodifiedInput
{
  return self->_unmodifiedInput;
}

- (void)set_unmodifiedInput:(id)a3
{
}

- (NSString)_shiftModifiedInput
{
  return self->_shiftModifiedInput;
}

- (void)set_shiftModifiedInput:(id)a3
{
}

- (NSString)_commandModifiedInput
{
  return self->_commandModifiedInput;
}

- (void)set_commandModifiedInput:(id)a3
{
}

- (NSString)_markedInput
{
  return self->_markedInput;
}

- (void)set_markedInput:(id)a3
{
}

- (int64_t)_modifierFlags
{
  return self->_modifierFlags;
}

- (int)_inputFlags
{
  return self->_inputFlags;
}

- (void)set_inputFlags:(int)a3
{
  self->_inputFlags = a3;
}

- (NSString)_privateInput
{
  return self->_privateInput;
}

- (void)set_privateInput:(id)a3
{
}

- (int64_t)_privateModifierFlags
{
  return self->_privateModifierFlags;
}

- (void)set_privateModifierFlags:(int64_t)a3
{
  self->_int64_t privateModifierFlags = a3;
}

- (NSString)_hint
{
  return self->_hint;
}

- (void)set_hint:(id)a3
{
}

- (void)set_keyCode:(int64_t)a3
{
  self->__keyCode = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unsigned)keyCommandCode
{
  return self->_keyCommandCode;
}

- (void)setKeyCommandCode:(unsigned int)a3
{
  self->_keyCommandCode = a3;
}

- (BOOL)keyCommandHandlingBeforePublic
{
  return self->_keyCommandHandlingBeforePublic;
}

- (void)setKeyCommandHandlingBeforePublic:(BOOL)a3
{
  self->_keyCommandHandlingBeforePublic = a3;
}

- (BOOL)keyEventForwardedFromInputUIHost
{
  return self->_keyEventForwardedFromInputUIHost;
}

- (void)setKeyEventForwardedFromInputUIHost:(BOOL)a3
{
  self->_keyEventForwardedFromInputUIHost = a3;
}

- (BOOL)shiftDown
{
  return self->_shiftDown;
}

- (void)setShiftDown:(BOOL)a3
{
  self->_shiftDown = a3;
}

- (BOOL)_isExternalEvent
{
  return self->__externalEvent;
}

- (void)set_externalEvent:(BOOL)a3
{
  self->__externalEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_privateInput, 0);
  objc_storeStrong((id *)&self->_markedInput, 0);
  objc_storeStrong((id *)&self->_commandModifiedInput, 0);
  objc_storeStrong((id *)&self->_shiftModifiedInput, 0);
  objc_storeStrong((id *)&self->_unmodifiedInput, 0);
  objc_storeStrong((id *)&self->_modifiedInput, 0);
  objc_storeStrong((id *)&self->_keyTranslationMap, 0);
  objc_storeStrong((id *)&self->_originalEscapeKeyTranslationMap, 0);
}

@end