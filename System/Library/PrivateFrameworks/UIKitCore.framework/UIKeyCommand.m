@interface UIKeyCommand
+ (BOOL)supportsSecureCoding;
+ (UIKeyCommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action input:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags propertyList:(id)propertyList;
+ (UIKeyCommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action input:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags propertyList:(id)propertyList alternates:(NSArray *)alternates;
+ (UIKeyCommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5 input:(id)a6 modifierFlags:(int64_t)a7;
+ (UIKeyCommand)keyCommandWithCompactInput:(id)a3 action:(SEL)a4 upAction:(SEL)a5;
+ (UIKeyCommand)keyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags action:(SEL)action;
+ (UIKeyCommand)keyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags action:(SEL)action discoverabilityTitle:(NSString *)discoverabilityTitle;
+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 upAction:(SEL)a6;
+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 upAction:(SEL)a6 discoverabilityTitle:(id)a7;
+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 buttonType:(int64_t)a5;
+ (UIKeyCommand)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4 action:(SEL)a5;
+ (UIKeyCommand)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 discoverabilityTitle:(id)a6;
+ (UIKeyCommand)keyCommandWithKeyCodes:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5;
+ (UIKeyCommand)keyCommandWithKeyCodes:(id)a3 modifierFlags:(int64_t)a4 buttonType:(int64_t)a5;
- (BKSHIDEventDeferringEnvironment)_eventDeferringEnvironment;
- (BOOL)_allowsCommandKeyModifierElision;
- (BOOL)_handleAfterKeyEvent;
- (BOOL)_isDirectlyReachableWithTranslator:(id)a3;
- (BOOL)_isKeyCommandLikelyMirrored;
- (BOOL)_isKeyCommandLocalized;
- (BOOL)_isLikelyToConflictWithTextInputForResponder:(id)a3;
- (BOOL)allowGlobeModifier;
- (BOOL)allowsAutomaticLocalization;
- (BOOL)allowsAutomaticMirroring;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)repeatable;
- (BOOL)wantsPriorityOverSystemBehavior;
- (NSIndexSet)_keyCodes;
- (NSIndexSet)_layoutAwareKeyCodes;
- (NSString)_layoutAwareDisplayInputOverride;
- (NSString)_layoutAwareInput;
- (NSString)discoverabilityInput;
- (NSString)input;
- (SEL)upAction;
- (UIEvent)_triggeringEvent;
- (UIKeyCommand)init;
- (UIKeyCommand)initWithCoder:(NSCoder *)coder;
- (UIKeyCommand)initWithCommand:(id)a3;
- (UIKeyCommand)initWithKeyCommand:(id)a3;
- (UIKeyCommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 input:(id)a7 modifierFlags:(int64_t)a8 propertyList:(id)a9 alternates:(id)a10 discoverabilityTitle:(id)a11 attributes:(unint64_t)a12 state:(int64_t)a13;
- (UIKeyCommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 propertyList:(id)a7 alternates:(id)a8 discoverabilityTitle:(id)a9 attributes:(unint64_t)a10 state:(int64_t)a11;
- (UIKeyModifierFlags)modifierFlags;
- (UIResponder)_originatingResponder;
- (__GSKeyboard)_currentGSKeyboard;
- (id)_allowGlobeModifierKeyCommand;
- (id)_immutableCopy;
- (id)_initWithInput:(id)a3 modifierFlags:(int64_t)a4 keyCodes:(id)a5 action:(SEL)a6 upAction:(SEL)a7 discoverabilityTitle:(id)a8 buttonType:(int64_t)a9;
- (id)_keyCommandUsingAlternate:(id)a3;
- (id)_leafKeyInput;
- (id)_nonRepeatableKeyCommand;
- (id)_placeholderKeyCommand;
- (id)_readableStringForInputUsingWords:(BOOL)a3 forHUD:(BOOL)a4 outIsSingleCharacterOrKeySymbol:(BOOL *)a5;
- (id)_readableStringForModifierFlagsUsingWords:(BOOL)a3 forHUD:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nextResponder;
- (int64_t)_buttonType;
- (int64_t)_defaultEnumerationPriority;
- (int64_t)_enumerationPriority;
- (int64_t)_layoutAwareModifierFlags;
- (int64_t)_leafKeyModifierFlags;
- (unint64_t)hash;
- (void)_localizeWithGSKeyboard:(__GSKeyboard *)a3 automatically:(BOOL)a4 force:(BOOL)a5;
- (void)_markHandleAfterKeyEvent;
- (void)_setEnumerationPriority:(int64_t)a3;
- (void)_setEventDeferringEnvironment:(id)a3;
- (void)_setOriginatingResponder:(id)a3;
- (void)_setTriggeringEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsAutomaticLocalization:(BOOL)allowsAutomaticLocalization;
- (void)setAllowsAutomaticMirroring:(BOOL)allowsAutomaticMirroring;
- (void)setWantsPriorityOverSystemBehavior:(BOOL)wantsPriorityOverSystemBehavior;
- (void)set_layoutAwareDisplayInputOverride:(id)a3;
@end

@implementation UIKeyCommand

- (unint64_t)hash
{
  uint64_t v3 = *((int *)self + 52);
  NSUInteger v4 = [(NSString *)self->_input hash] ^ v3;
  return v4 ^ [(NSIndexSet *)self->_keyCodes hash] ^ *((int *)self + 54);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = *((int *)self + 52);
    if ([v5 modifierFlags] == v6)
    {
      v7 = [v5 input];
      input = self->_input;
      if (input == v7 || [(NSString *)input isEqual:v7])
      {
        v9 = [v5 _keyCodes];
        keyCodes = self->_keyCodes;
        if (keyCodes == v9 || [(NSIndexSet *)keyCodes isEqual:v9])
        {
          uint64_t v11 = *((int *)self + 54);
          BOOL v12 = [v5 _buttonType] == v11;
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (UIKeyModifierFlags)modifierFlags
{
  return *((int *)self + 52);
}

- (NSString)input
{
  return self->_input;
}

- (NSIndexSet)_keyCodes
{
  return self->_keyCodes;
}

- (int64_t)_buttonType
{
  return *((int *)self + 54);
}

+ (UIKeyCommand)keyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags action:(SEL)action
{
  v8 = input;
  v9 = (void *)[objc_alloc((Class)a1) _initWithInput:v8 modifierFlags:modifierFlags keyCodes:0 action:action upAction:0 discoverabilityTitle:0 buttonType:-1];

  return (UIKeyCommand *)v9;
}

- (UIKeyCommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 input:(id)a7 modifierFlags:(int64_t)a8 propertyList:(id)a9 alternates:(id)a10 discoverabilityTitle:(id)a11 attributes:(unint64_t)a12 state:(int64_t)a13
{
  int v13 = a8;
  id v19 = a7;
  v39.receiver = self;
  v39.super_class = (Class)UIKeyCommand;
  v20 = [(UICommand *)&v39 initWithTitle:a3 image:a4 imageName:a5 action:a6 propertyList:a9 alternates:a10 discoverabilityTitle:a11 attributes:a12 state:a13];
  if (v20)
  {
    uint64_t v21 = [v19 copy];
    input = v20->_input;
    v20->_input = (NSString *)v21;

    *((_DWORD *)v20 + 52) = v13;
    uint64_t v23 = [(NSString *)v20->_input copy];
    layoutAwareInput = v20->_layoutAwareInput;
    v20->_layoutAwareInput = (NSString *)v23;

    *((_DWORD *)v20 + 53) = *((_DWORD *)v20 + 52);
    uint64_t v25 = _UIHIDUsageFromSpecialKeyInput((uint64_t)v19);
    if (v25)
    {
      v26 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v25];
    }
    else
    {
      v26 = 0;
    }
    p_keyCodes = (id *)&v20->_keyCodes;
    objc_storeStrong((id *)&v20->_keyCodes, v26);
    if (v25) {

    }
    uint64_t v28 = [*p_keyCodes copy];
    layoutAwareKeyCodes = v20->_layoutAwareKeyCodes;
    v20->_layoutAwareKeyCodes = (NSIndexSet *)v28;

    v20->_upAction = 0;
    v20->_repeatable = 1;
    *((_DWORD *)v20 + 54) = -1;
    uint64_t v30 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    eventDeferringEnvironment = v20->__eventDeferringEnvironment;
    v20->__eventDeferringEnvironment = (BKSHIDEventDeferringEnvironment *)v30;

    v20->__enumerationPriority = [(UIKeyCommand *)v20 _defaultEnumerationPriority];
    *((unsigned char *)v20 + 221) &= ~2u;
    uint64_t v32 = (uint64_t)v20->_input;
    if (v32)
    {
      if (!*p_keyCodes) {
        *((unsigned char *)v20 + 221) = *((unsigned char *)v20 + 221) & 0xBF | ((_UIHIDUsageFromSpecialKeyInput(v32) != 0) << 6);
      }
    }
    else if ([*p_keyCodes count] == 1)
    {
      v33 = _UISpecialKeyInputFromHIDUsage([*p_keyCodes firstIndex]);
      *((unsigned char *)v20 + 221) = *((unsigned char *)v20 + 221) & 0xBF | ((v33 != 0) << 6);
    }
    if (dyld_program_sdk_at_least()) {
      char v34 = 0;
    }
    else {
      char v34 = 8;
    }
    *((unsigned char *)v20 + 221) = *((unsigned char *)v20 + 221) & 0xF7 | v34;
    if (dyld_program_sdk_at_least()) {
      char v35 = 16;
    }
    else {
      char v35 = 0;
    }
    *((unsigned char *)v20 + 221) = *((unsigned char *)v20 + 221) & 0xEF | v35;
    if (dyld_program_sdk_at_least()) {
      char v36 = 32;
    }
    else {
      char v36 = 0;
    }
    *((unsigned char *)v20 + 221) = *((unsigned char *)v20 + 221) & 0xDF | v36;
    layoutAwareDisplayInputOverride = v20->_layoutAwareDisplayInputOverride;
    v20->_layoutAwareDisplayInputOverride = 0;
  }
  return v20;
}

- (id)_initWithInput:(id)a3 modifierFlags:(int64_t)a4 keyCodes:(id)a5 action:(SEL)a6 upAction:(SEL)a7 discoverabilityTitle:(id)a8 buttonType:(int64_t)a9
{
  int v13 = a4;
  id v15 = a3;
  id v16 = a5;
  if (a8) {
    v17 = (__CFString *)a8;
  }
  else {
    v17 = &stru_1ED0E84C0;
  }
  v18 = (void *)MEMORY[0x1E4F1C978];
  id v19 = a8;
  v20 = [v18 array];
  v39.receiver = self;
  v39.super_class = (Class)UIKeyCommand;
  uint64_t v21 = [(UICommand *)&v39 initWithTitle:v17 image:0 imageName:0 action:a6 propertyList:0 alternates:v20 discoverabilityTitle:v19 attributes:0 state:0];

  if (!v21) {
    goto LABEL_27;
  }
  if (v15 && !v16)
  {
    uint64_t v22 = _UIHIDUsageFromSpecialKeyInput((uint64_t)v15);
    if (v22)
    {
      uint64_t v22 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v22];
      id v16 = (id)v22;
    }
    else
    {
      id v16 = 0;
    }
LABEL_13:
    *((unsigned char *)v21 + 221) = *((unsigned char *)v21 + 221) & 0xBF | ((v22 != 0) << 6);
    goto LABEL_14;
  }
  if (!v15)
  {
    if ([v16 count] != 1)
    {
      id v15 = 0;
      goto LABEL_14;
    }
    uint64_t v22 = _UISpecialKeyInputFromHIDUsage([v16 firstIndex]);
    id v15 = (id)v22;
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v23 = [v15 copy];
  input = v21->_input;
  v21->_input = (NSString *)v23;

  *((_DWORD *)v21 + 52) = v13;
  uint64_t v25 = [(NSString *)v21->_input copy];
  layoutAwareInput = v21->_layoutAwareInput;
  v21->_layoutAwareInput = (NSString *)v25;

  *((_DWORD *)v21 + 53) = *((_DWORD *)v21 + 52);
  uint64_t v27 = [v16 copy];
  keyCodes = v21->_keyCodes;
  v21->_keyCodes = (NSIndexSet *)v27;

  uint64_t v29 = [(NSIndexSet *)v21->_keyCodes copy];
  layoutAwareKeyCodes = v21->_layoutAwareKeyCodes;
  v21->_layoutAwareKeyCodes = (NSIndexSet *)v29;

  if (a7) {
    SEL v31 = a7;
  }
  else {
    SEL v31 = 0;
  }
  v21->_upAction = v31;
  v21->_repeatable = 1;
  *((_DWORD *)v21 + 54) = a9;
  uint64_t v32 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
  eventDeferringEnvironment = v21->__eventDeferringEnvironment;
  v21->__eventDeferringEnvironment = (BKSHIDEventDeferringEnvironment *)v32;

  v21->__enumerationPriority = [(UIKeyCommand *)v21 _defaultEnumerationPriority];
  *((unsigned char *)v21 + 221) &= ~2u;
  if (dyld_program_sdk_at_least()) {
    char v34 = 0;
  }
  else {
    char v34 = 8;
  }
  *((unsigned char *)v21 + 221) = *((unsigned char *)v21 + 221) & 0xF7 | v34;
  if (dyld_program_sdk_at_least()) {
    char v35 = 16;
  }
  else {
    char v35 = 0;
  }
  *((unsigned char *)v21 + 221) = *((unsigned char *)v21 + 221) & 0xEF | v35;
  if (dyld_program_sdk_at_least()) {
    char v36 = 32;
  }
  else {
    char v36 = 0;
  }
  *((unsigned char *)v21 + 221) = *((unsigned char *)v21 + 221) & 0xDF | v36;
  layoutAwareDisplayInputOverride = v21->_layoutAwareDisplayInputOverride;
  v21->_layoutAwareDisplayInputOverride = 0;

LABEL_27:
  return v21;
}

- (int64_t)_defaultEnumerationPriority
{
  input = self->_input;
  id v4 = _UIKeyCommandGetLocalizedSymbol(@"+");
  if ([(NSString *)input isEqualToString:v4] && *((_DWORD *)self + 52) == 0x100000)
  {

    return -1;
  }
  if ([(NSString *)self->_input isEqualToString:@"UIKeyInputEscape"])
  {
    int v5 = *((_DWORD *)self + 52);

    if (!v5) {
      return -1;
    }
  }
  else
  {
  }
  return 0;
}

- (void)_setEnumerationPriority:(int64_t)a3
{
  self->__enumerationPriority = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__originatingResponder);
  objc_storeStrong((id *)&self->__eventDeferringEnvironment, 0);
  objc_storeStrong((id *)&self->_layoutAwareDisplayInputOverride, 0);
  objc_storeStrong((id *)&self->_layoutAwareInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_triggeringEvent, 0);
  objc_storeStrong((id *)&self->_layoutAwareKeyCodes, 0);
  objc_storeStrong((id *)&self->_keyCodes, 0);
  objc_storeStrong((id *)&self->_lastLayout, 0);
}

- (id)_immutableCopy
{
  v2 = [(UIKeyCommand *)[_UIImmutableKeyCommand alloc] initWithKeyCommand:self];
  return v2;
}

+ (UIKeyCommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5 input:(id)a6 modifierFlags:(int64_t)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc((Class)a1);
  id v16 = (void *)[v15 initWithTitle:v14 image:0 imageName:v13 action:a5 input:v12 modifierFlags:a7 propertyList:0 alternates:MEMORY[0x1E4F1CBF0] discoverabilityTitle:0 attributes:0 state:0];

  return (UIKeyCommand *)v16;
}

- (id)_nonRepeatableKeyCommand
{
  v2 = (unsigned char *)[objc_alloc((Class)objc_opt_class()) initWithKeyCommand:self];
  v2[220] = 0;
  return v2;
}

- (UIKeyCommand)initWithKeyCommand:(id)a3
{
  id v4 = (id *)a3;
  v17.receiver = self;
  v17.super_class = (Class)UIKeyCommand;
  int v5 = [(UICommand *)&v17 initWithCommand:v4];
  if (v5)
  {
    uint64_t v6 = [v4[28] copy];
    input = v5->_input;
    v5->_input = (NSString *)v6;

    *((_DWORD *)v5 + 52) = *((_DWORD *)v4 + 52);
    uint64_t v8 = [v4[29] copy];
    layoutAwareInput = v5->_layoutAwareInput;
    v5->_layoutAwareInput = (NSString *)v8;

    *((_DWORD *)v5 + 53) = *((_DWORD *)v4 + 53);
    uint64_t v10 = [v4[21] copy];
    keyCodes = v5->_keyCodes;
    v5->_keyCodes = (NSIndexSet *)v10;

    uint64_t v12 = [v4[22] copy];
    layoutAwareKeyCodes = v5->_layoutAwareKeyCodes;
    v5->_layoutAwareKeyCodes = (NSIndexSet *)v12;

    v5->_upAction = (SEL)v4[23];
    v5->_repeatable = *((unsigned char *)v4 + 220);
    *((unsigned char *)v5 + 221) = *((unsigned char *)v5 + 221) & 0xFE | *((unsigned char *)v4 + 221) & 1;
    *((_DWORD *)v5 + 54) = *((_DWORD *)v4 + 54);
    objc_storeStrong((id *)&v5->__eventDeferringEnvironment, v4[31]);
    v5->__enumerationPriority = (int64_t)v4[33];
    *((unsigned char *)v5 + 221) = *((unsigned char *)v5 + 221) & 0xFD | *((unsigned char *)v4 + 221) & 2;
    *((unsigned char *)v5 + 221) = *((unsigned char *)v5 + 221) & 0xFB | *((unsigned char *)v4 + 221) & 4;
    *((unsigned char *)v5 + 221) = *((unsigned char *)v5 + 221) & 0xF7 | *((unsigned char *)v4 + 221) & 8;
    *((unsigned char *)v5 + 221) = *((unsigned char *)v5 + 221) & 0xEF | *((unsigned char *)v4 + 221) & 0x10;
    *((unsigned char *)v5 + 221) = *((unsigned char *)v5 + 221) & 0xDF | *((unsigned char *)v4 + 221) & 0x20;
    uint64_t v14 = [v4[30] copy];
    layoutAwareDisplayInputOverride = v5->_layoutAwareDisplayInputOverride;
    v5->_layoutAwareDisplayInputOverride = (NSString *)v14;

    *((unsigned char *)v5 + 221) = *((unsigned char *)v5 + 221) & 0xBF | *((unsigned char *)v4 + 221) & 0x40;
  }

  return v5;
}

+ (UIKeyCommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action input:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags propertyList:(id)propertyList
{
  id v14 = propertyList;
  id v15 = input;
  id v16 = image;
  objc_super v17 = title;
  id v18 = objc_alloc((Class)a1);
  id v19 = [MEMORY[0x1E4F1C978] array];
  v20 = (void *)[v18 initWithTitle:v17 image:v16 imageName:0 action:action input:v15 modifierFlags:modifierFlags propertyList:v14 alternates:v19 discoverabilityTitle:0 attributes:0 state:0];

  return (UIKeyCommand *)v20;
}

- (id)_allowGlobeModifierKeyCommand
{
  v2 = (unsigned char *)[objc_alloc((Class)objc_opt_class()) initWithKeyCommand:self];
  v2[221] |= 2u;
  return v2;
}

- (void)setWantsPriorityOverSystemBehavior:(BOOL)wantsPriorityOverSystemBehavior
{
  if (wantsPriorityOverSystemBehavior) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 221) = *((unsigned char *)self + 221) & 0xF7 | v3;
}

+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 upAction:(SEL)a6 discoverabilityTitle:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) _initWithInput:v13 modifierFlags:a4 keyCodes:0 action:a5 upAction:a6 discoverabilityTitle:v12 buttonType:-1];

  return (UIKeyCommand *)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyCommand;
  [(UICommand *)&v8 encodeWithCoder:v4];
  int v5 = [(UIKeyCommand *)self input];
  [v4 encodeObject:v5 forKey:@"input"];

  uint64_t v6 = [(UIKeyCommand *)self _keyCodes];

  if (v6)
  {
    v7 = [(UIKeyCommand *)self _keyCodes];
    [v4 encodeObject:v7 forKey:@"keyCodes"];
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIKeyCommand modifierFlags](self, "modifierFlags"), @"modifierFlags");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIKeyCommand wantsPriorityOverSystemBehavior](self, "wantsPriorityOverSystemBehavior"), @"wantsPriorityOverSystemBehavior");
  [v4 encodeObject:self->__eventDeferringEnvironment forKey:@"eventDeferringEnvironment"];
  [v4 encodeBool:(*((unsigned __int8 *)self + 221) >> 4) & 1 forKey:@"allowsAutomaticLocalization"];
  [v4 encodeBool:(*((unsigned __int8 *)self + 221) >> 5) & 1 forKey:@"allowsAutomaticMirroring"];
  [v4 encodeInt32:LODWORD(self->__enumerationPriority) forKey:@"enumerationPriority"];
}

- (UIKeyCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIKeyCommand;
  return [(UICommand *)&v3 initWithTitle:&stru_1ED0E84C0 image:0 imageName:0 action:sel__nop propertyList:0 alternates:MEMORY[0x1E4F1CBF0] discoverabilityTitle:0 attributes:0 state:0];
}

- (UIKeyCommand)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v22.receiver = self;
  v22.super_class = (Class)UIKeyCommand;
  int v5 = [(UICommand *)&v22 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    *((_DWORD *)v5 + 54) = -1;
    v5->_repeatable = 1;
    *((unsigned char *)v5 + 221) &= ~2u;
    uint64_t v7 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    input = v6->_input;
    v6->_input = (NSString *)v7;

    uint64_t v9 = [(NSString *)v6->_input copy];
    layoutAwareInput = v6->_layoutAwareInput;
    v6->_layoutAwareInput = (NSString *)v9;

    if ([(NSCoder *)v4 containsValueForKey:@"keyCodes"])
    {
      uint64_t v11 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyCodes"];
      keyCodes = v6->_keyCodes;
      v6->_keyCodes = (NSIndexSet *)v11;
    }
    int v13 = [(NSCoder *)v4 decodeIntegerForKey:@"modifierFlags"];
    *((_DWORD *)v6 + 52) = v13;
    *((_DWORD *)v6 + 53) = v13;
    if ([(NSCoder *)v4 _ui_decodeBoolForKey:@"wantsPriorityOverSystemBehavior" defaultValue:dyld_program_sdk_at_least() ^ 1])
    {
      char v14 = 8;
    }
    else
    {
      char v14 = 0;
    }
    *((unsigned char *)v6 + 221) = *((unsigned char *)v6 + 221) & 0xF7 | v14;
    if ([(NSCoder *)v4 _ui_decodeBoolForKey:@"allowsAutomaticLocalization" defaultValue:dyld_program_sdk_at_least()])
    {
      char v15 = 16;
    }
    else
    {
      char v15 = 0;
    }
    *((unsigned char *)v6 + 221) = *((unsigned char *)v6 + 221) & 0xEF | v15;
    if ([(NSCoder *)v4 _ui_decodeBoolForKey:@"allowsAutomaticMirroring" defaultValue:dyld_program_sdk_at_least()])
    {
      char v16 = 32;
    }
    else
    {
      char v16 = 0;
    }
    *((unsigned char *)v6 + 221) = *((unsigned char *)v6 + 221) & 0xDF | v16;
    objc_super v17 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDeferringEnvironment"];
    id v18 = v17;
    if (!v17)
    {
      id v18 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    }
    objc_storeStrong((id *)&v6->__eventDeferringEnvironment, v18);
    if (!v17) {

    }
    v6->__enumerationPriority = [(NSCoder *)v4 decodeInt32ForKey:@"enumerationPriority"];
    uint64_t v19 = (uint64_t)v6->_input;
    if (v19)
    {
      if (!v6->_keyCodes) {
        *((unsigned char *)v6 + 221) = *((unsigned char *)v6 + 221) & 0xBF | ((_UIHIDUsageFromSpecialKeyInput(v19) != 0) << 6);
      }
    }
    else if ([(NSIndexSet *)v6->_keyCodes count] == 1)
    {
      v20 = _UISpecialKeyInputFromHIDUsage([(NSIndexSet *)v6->_keyCodes firstIndex]);
      *((unsigned char *)v6 + 221) = *((unsigned char *)v6 + 221) & 0xBF | ((v20 != 0) << 6);
    }
  }

  return v6;
}

- (UIKeyCommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 propertyList:(id)a7 alternates:(id)a8 discoverabilityTitle:(id)a9 attributes:(unint64_t)a10 state:(int64_t)a11
{
  int v13 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7, a8);
  [v13 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:151 description:@"Initializer is unavailable"];

  return 0;
}

- (UIKeyCommand)initWithCommand:(id)a3
{
  int v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:156 description:@"Initializer is unavailable"];

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UIKeyCommand alloc];
  return [(UIKeyCommand *)v4 initWithKeyCommand:self];
}

+ (UIKeyCommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action input:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags propertyList:(id)propertyList alternates:(NSArray *)alternates
{
  char v16 = alternates;
  id v17 = propertyList;
  id v18 = input;
  uint64_t v19 = image;
  v20 = title;
  uint64_t v21 = (void *)[objc_alloc((Class)a1) initWithTitle:v20 image:v19 imageName:0 action:action input:v18 modifierFlags:modifierFlags propertyList:v17 alternates:v16 discoverabilityTitle:0 attributes:0 state:0];

  return (UIKeyCommand *)v21;
}

+ (UIKeyCommand)keyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags action:(SEL)action discoverabilityTitle:(NSString *)discoverabilityTitle
{
  uint64_t v10 = discoverabilityTitle;
  uint64_t v11 = input;
  id v12 = (void *)[objc_alloc((Class)a1) _initWithInput:v11 modifierFlags:modifierFlags keyCodes:0 action:action upAction:0 discoverabilityTitle:v10 buttonType:-1];

  return (UIKeyCommand *)v12;
}

+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 upAction:(SEL)a6
{
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) _initWithInput:v10 modifierFlags:a4 keyCodes:0 action:a5 upAction:a6 discoverabilityTitle:0 buttonType:-1];

  return (UIKeyCommand *)v11;
}

+ (UIKeyCommand)keyCommandWithCompactInput:(id)a3 action:(SEL)a4 upAction:(SEL)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)[v8 mutableCopy];
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"⌘", &stru_1ED0E84C0, 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"⌥", &stru_1ED0E84C0, 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"⌃", &stru_1ED0E84C0, 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"⇧", &stru_1ED0E84C0, 0, 0, objc_msgSend(v9, "length"));
  id v10 = v8;
  if ([v10 containsString:@"⌘"]) {
    uint64_t v11 = 0x100000;
  }
  else {
    uint64_t v11 = 0;
  }
  if ([v10 containsString:@"⌥"]) {
    v11 |= 0x80000uLL;
  }
  if ([v10 containsString:@"⌃"]) {
    uint64_t v12 = v11 | 0x40000;
  }
  else {
    uint64_t v12 = v11;
  }
  int v13 = [v10 containsString:@"⇧"];

  if (v13) {
    uint64_t v14 = v12 | 0x20000;
  }
  else {
    uint64_t v14 = v12;
  }
  char v15 = [a1 keyCommandWithInput:v9 modifierFlags:v14 action:a4 upAction:a5];

  return (UIKeyCommand *)v15;
}

+ (UIKeyCommand)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4 action:(SEL)a5
{
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  id v10 = (void *)[v8 _initWithInput:0 modifierFlags:a4 keyCodes:v9 action:a5 upAction:0 discoverabilityTitle:0 buttonType:-1];

  return (UIKeyCommand *)v10;
}

+ (UIKeyCommand)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 discoverabilityTitle:(id)a6
{
  id v10 = a6;
  id v11 = objc_alloc((Class)a1);
  uint64_t v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  int v13 = (void *)[v11 _initWithInput:0 modifierFlags:a4 keyCodes:v12 action:a5 upAction:0 discoverabilityTitle:v10 buttonType:-1];

  return (UIKeyCommand *)v13;
}

+ (UIKeyCommand)keyCommandWithKeyCodes:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)[objc_alloc((Class)a1) _initWithInput:0 modifierFlags:a4 keyCodes:v8 action:a5 upAction:0 discoverabilityTitle:0 buttonType:-1];

  return (UIKeyCommand *)v9;
}

+ (UIKeyCommand)keyCommandWithKeyCodes:(id)a3 modifierFlags:(int64_t)a4 buttonType:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)[objc_alloc((Class)a1) _initWithInput:0 modifierFlags:a4 keyCodes:v8 action:0 upAction:0 discoverabilityTitle:0 buttonType:a5];

  return (UIKeyCommand *)v9;
}

+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 buttonType:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)[objc_alloc((Class)a1) _initWithInput:v8 modifierFlags:a4 keyCodes:0 action:0 upAction:0 discoverabilityTitle:0 buttonType:a5];

  return (UIKeyCommand *)v9;
}

- (void)_localizeWithGSKeyboard:(__GSKeyboard *)a3 automatically:(BOOL)a4 force:(BOOL)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3 || (*((unsigned char *)self + 221) & 1) != 0) {
    return;
  }
  BOOL v7 = a4;
  Layout = (void *)GSKeyboardGetLayout();
  unsigned int v9 = GSKeyboardGetHWKeyboardType() - 202;
  unsigned int v10 = v9 > 5 ? -1 : dword_186B99468[v9];
  if ([(NSString *)self->_lastLayout isEqualToString:Layout]
    && !a5
    && self->_lastKeyboardType == v10
    || ![(NSString *)self->_input length]
    || !sAllowLocalizationOfApplicationShortcuts && ![(UICommand *)self _isDefaultCommand]
    || ![(UIKeyCommand *)self allowsAutomaticLocalization])
  {
    return;
  }
  id v11 = (NSString *)[Layout copy];
  lastLayout = self->_lastLayout;
  self->_lastLayout = v11;

  self->_lastKeyboardType = v10;
  int v13 = (NSString *)[(NSString *)self->_input copy];
  layoutAwareInput = self->_layoutAwareInput;
  self->_layoutAwareInput = v13;

  *((_DWORD *)self + 53) = *((_DWORD *)self + 52);
  layoutAwareDisplayInputOverride = self->_layoutAwareDisplayInputOverride;
  self->_layoutAwareDisplayInputOverride = 0;

  if (!v7)
  {
    char v16 = [MEMORY[0x1E4FAE398] shortcutWithKeyEquivalent:self->_input modifierFlags:*((int *)self + 52)];
    if ([(UICommand *)self action])
    {
      NSStringFromSelector([(UICommand *)self action]);
      id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = &stru_1ED0E84C0;
    }
    BOOL v21 = [(id)UIApp userInterfaceLayoutDirection] == 1
       && [(UIKeyCommand *)self allowsAutomaticMirroring];
    v35[0] = @"isRTL";
    objc_super v22 = [NSNumber numberWithBool:v21];
    v36[0] = v22;
    v36[1] = v17;
    v35[1] = @"sel";
    v35[2] = @"keyboardType";
    uint64_t v23 = [NSNumber numberWithUnsignedInt:self->_lastKeyboardType];
    v36[2] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

    uint64_t v25 = [MEMORY[0x1E4FAE398] localizedKeyboardShortcut:v16 forKeyboardLayout:self->_lastLayout withAttributes:v24];
    if (([v16 isEqual:v25] & 1) == 0)
    {
      v26 = [v25 keyEquivalent];
      uint64_t v27 = (NSString *)[v26 copy];
      uint64_t v28 = self->_layoutAwareInput;
      self->_layoutAwareInput = v27;

      *((_DWORD *)self + 53) = [v25 modifierFlags];
      if (self->_keyCodes)
      {
        uint64_t v29 = _UIHIDUsageFromSpecialKeyInput((uint64_t)self->_layoutAwareInput);
        if (v29)
        {
          uint64_t v30 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v29];
        }
        else
        {
          uint64_t v30 = self->_layoutAwareKeyCodes;
        }
        layoutAwareKeyCodes = self->_layoutAwareKeyCodes;
        self->_layoutAwareKeyCodes = v30;
      }
      uint64_t v32 = [v25 displayStringOverride];
      v33 = (NSString *)[v32 copy];
      char v34 = self->_layoutAwareDisplayInputOverride;
      self->_layoutAwareDisplayInputOverride = v33;
    }
    return;
  }
  [(NSString *)self->_input characterAtIndex:0];
  if (GSKeyboardGetKeyCodeForChar() == -1)
  {
    int v18 = *((_DWORD *)self + 52);
    if ((v18 & 0x20000) == 0)
    {
      if (GSKeyboardGetKeyCodeForChar() != -1) {
        goto LABEL_15;
      }
      int v18 = *((_DWORD *)self + 52);
    }
    if ((v18 & 0xFFFDFFFF) == 0 || GSKeyboardGetKeyCodeForChar() == -1)
    {
      GSKeyboardGetHWKeyboardType();
      if (!GSKeyboardCreate()) {
        return;
      }
      goto LABEL_27;
    }
  }
LABEL_15:
  if (([@"US" isEqualToString:Layout] & 1) == 0)
  {
    GSKeyboardGetHWKeyboardType();
    if (GSKeyboardCreate())
    {
      if (GSKeyboardGetKeyCodeForChar() == -1) {
        goto LABEL_31;
      }
LABEL_27:
      if (GSKeyboardGetKeyCodeForChar() == -1)
      {
        if (GSKeyboardGetKeyCodeForChar() == -1)
        {
LABEL_31:
          GSKeyboardRelease();
          return;
        }
        *((_DWORD *)self + 53) |= 0x20000u;
      }
      GSKeyboardTranslateKeyWithModifiers();
      uint64_t v19 = [NSString stringWithCharacters:v37 length:0];
      v20 = self->_layoutAwareInput;
      self->_layoutAwareInput = v19;

      goto LABEL_31;
    }
  }
}

- (NSString)discoverabilityInput
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  layoutAwareInput = self->_layoutAwareInput;
  if (layoutAwareInput || (layoutAwareInput = self->_input) != 0)
  {
    id v4 = layoutAwareInput;
  }
  else
  {
    id v4 = (NSString *)[(id)UIApp _hardwareKeyboard];
    if (v4)
    {
      HIWORD(v6) = 0;
      [(NSIndexSet *)self->_layoutAwareKeyCodes firstIndex];
      GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
      [(NSIndexSet *)self->_layoutAwareKeyCodes firstIndex];
      GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
      id v4 = 0;
    }
  }
  return v4;
}

- (id)_placeholderKeyCommand
{
  v2 = (unsigned char *)[objc_alloc((Class)objc_opt_class()) initWithKeyCommand:self];
  v2[221] |= 1u;
  return v2;
}

- (id)_keyCommandUsingAlternate:(id)a3
{
  id v4 = a3;
  uint64_t v19 = [(UIMenuElement *)self _imageOrName];
  int v5 = [UIKeyCommand alloc];
  int v6 = [v4 title];
  uint64_t v7 = [v19 _asMenuElementImage];
  id v8 = [v19 _asMenuElementImageName];
  uint64_t v9 = [v4 action];
  unsigned int v10 = [(UIKeyCommand *)self input];
  UIKeyModifierFlags v11 = [(UIKeyCommand *)self modifierFlags];
  uint64_t v12 = [v4 modifierFlags];

  uint64_t v13 = v12 | v11;
  uint64_t v14 = [(UICommand *)self propertyList];
  UIMenuElementAttributes v15 = [(UICommand *)self attributes];
  UIMenuElementState v16 = [(UICommand *)self state];
  uint64_t v17 = [(UIKeyCommand *)v5 initWithTitle:v6 image:v7 imageName:v8 action:v9 input:v10 modifierFlags:v13 propertyList:v14 alternates:MEMORY[0x1E4F1CBF0] discoverabilityTitle:0 attributes:v15 state:v16];

  *(unsigned char *)(v17 + 221) = *(unsigned char *)(v17 + 221) & 0xFE | *((unsigned char *)self + 221) & 1;
  *(_DWORD *)(v17 + 216) = *((_DWORD *)self + 54);
  objc_storeStrong((id *)(v17 + 248), self->__eventDeferringEnvironment);
  *(void *)(v17 + 264) = self->__enumerationPriority;
  *(unsigned char *)(v17 + 221) = *(unsigned char *)(v17 + 221) & 0xFD | *((unsigned char *)self + 221) & 2;
  *(unsigned char *)(v17 + 221) = *(unsigned char *)(v17 + 221) & 0xFB | *((unsigned char *)self + 221) & 4;
  *(unsigned char *)(v17 + 221) = *(unsigned char *)(v17 + 221) & 0xF7 | *((unsigned char *)self + 221) & 8;
  *(unsigned char *)(v17 + 221) = *(unsigned char *)(v17 + 221) & 0xEF | *((unsigned char *)self + 221) & 0x10;
  *(unsigned char *)(v17 + 221) = *(unsigned char *)(v17 + 221) & 0xDF | *((unsigned char *)self + 221) & 0x20;
  *(unsigned char *)(v17 + 221) = *(unsigned char *)(v17 + 221) & 0xBF | *((unsigned char *)self + 221) & 0x40;

  return (id)v17;
}

- (SEL)upAction
{
  if (self->_upAction) {
    return self->_upAction;
  }
  else {
    return 0;
  }
}

- (BOOL)repeatable
{
  return self->_repeatable;
}

- (BOOL)isPlaceholder
{
  return *((unsigned char *)self + 221) & 1;
}

- (NSIndexSet)_layoutAwareKeyCodes
{
  return self->_layoutAwareKeyCodes;
}

- (UIEvent)_triggeringEvent
{
  return self->_triggeringEvent;
}

- (void)_setTriggeringEvent:(id)a3
{
}

- (BOOL)_isKeyCommandLocalized
{
  layoutAwareInput = self->_layoutAwareInput;
  if (layoutAwareInput)
  {
    if ([(NSString *)layoutAwareInput isEqualToString:self->_input]) {
      LOBYTE(layoutAwareInput) = *((_DWORD *)self + 53) != *((_DWORD *)self + 52);
    }
    else {
      LOBYTE(layoutAwareInput) = 1;
    }
  }
  return (char)layoutAwareInput;
}

- (BOOL)_isKeyCommandLikelyMirrored
{
  if ([(id)UIApp userInterfaceLayoutDirection] != 1) {
    return 0;
  }
  if ((*((unsigned char *)self + 210) & 0x10) == 0) {
    return 0;
  }
  if (![(UIKeyCommand *)self _isKeyCommandLocalized]) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  objc_super v3 = (void *)MEMORY[0x1E4FAE398];
  layoutAwareInput = self->_layoutAwareInput;
  return [v3 isMirroringCandidate:layoutAwareInput];
}

- (__GSKeyboard)_currentGSKeyboard
{
  v2 = +[UIDevice currentDevice];
  int v3 = [v2 _isHardwareKeyboardAvailable];

  if (!v3) {
    return 0;
  }
  id v4 = (void *)UIApp;
  return (__GSKeyboard *)[v4 _hardwareKeyboard:0];
}

- (BOOL)allowsAutomaticLocalization
{
  return (*((unsigned __int8 *)self + 221) >> 4) & 1;
}

- (void)setAllowsAutomaticLocalization:(BOOL)allowsAutomaticLocalization
{
  char v3 = *((unsigned char *)self + 221);
  if (((((v3 & 0x10) == 0) ^ allowsAutomaticLocalization) & 1) == 0)
  {
    if (allowsAutomaticLocalization) {
      char v5 = 16;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 221) = v3 & 0xEF | v5;
    if (allowsAutomaticLocalization)
    {
      int v6 = [(UIKeyCommand *)self _currentGSKeyboard];
      [(UIKeyCommand *)self _localizeWithGSKeyboard:v6 automatically:0 force:1];
    }
    else if ([(UIKeyCommand *)self _isKeyCommandLocalized])
    {
      uint64_t v7 = (NSString *)[(NSString *)self->_input copy];
      layoutAwareInput = self->_layoutAwareInput;
      self->_layoutAwareInput = v7;

      *((_DWORD *)self + 53) = *((_DWORD *)self + 52);
    }
  }
}

- (BOOL)allowsAutomaticMirroring
{
  return (*((unsigned __int8 *)self + 221) >> 5) & 1;
}

- (void)setAllowsAutomaticMirroring:(BOOL)allowsAutomaticMirroring
{
  char v3 = *((unsigned char *)self + 221);
  if (((((v3 & 0x20) == 0) ^ allowsAutomaticMirroring) & 1) == 0)
  {
    if (allowsAutomaticMirroring) {
      char v5 = 32;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 221) = v3 & 0xDF | v5;
    if (allowsAutomaticMirroring)
    {
      int v6 = [(UIKeyCommand *)self _currentGSKeyboard];
      [(UIKeyCommand *)self _localizeWithGSKeyboard:v6 automatically:0 force:1];
    }
    else if ([(UIKeyCommand *)self _isKeyCommandLikelyMirrored])
    {
      uint64_t v7 = (NSString *)[(NSString *)self->_input copy];
      layoutAwareInput = self->_layoutAwareInput;
      self->_layoutAwareInput = v7;

      *((_DWORD *)self + 53) = *((_DWORD *)self + 52);
    }
  }
}

- (id)nextResponder
{
  if (dyld_program_sdk_at_least())
  {
    char v3 = 0;
  }
  else
  {
    char v3 = [(UIKeyCommand *)self _originatingResponder];
  }
  return v3;
}

- (BOOL)_allowsCommandKeyModifierElision
{
  char v3 = _UIKeyCommandGetLocalizedSymbol(@"+");
  id v4 = [(UIKeyCommand *)self _layoutAwareInput];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_markHandleAfterKeyEvent
{
  *((unsigned char *)self + 221) |= 4u;
}

- (BOOL)_handleAfterKeyEvent
{
  return (*((unsigned __int8 *)self + 221) >> 2) & 1;
}

- (id)_leafKeyInput
{
  return self->_input;
}

- (int64_t)_leafKeyModifierFlags
{
  return *((int *)self + 52);
}

- (BOOL)allowGlobeModifier
{
  return (*((unsigned __int8 *)self + 221) >> 1) & 1;
}

- (BOOL)_isLikelyToConflictWithTextInputForResponder:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(UIKeyCommand *)self _originatingResponder],
        char v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 _nextResponderChainContainsResponder:v4],
        v5,
        (v6 & 1) != 0)
    || (*((unsigned char *)self + 210) & 0x94) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    BOOL v7 = ![(NSString *)self->_input isEqualToString:@"UIKeyInputEscape"];
  }

  return v7;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)UIKeyCommand;
  char v3 = [(UICommand *)&v15 description];
  id v4 = (void *)[v3 mutableCopy];

  upAction = self->_upAction;
  if (upAction)
  {
    char v6 = NSStringFromSelector(upAction);
    [v4 appendFormat:@"  UpAction: %@", v6];
  }
  BOOL v7 = objc_opt_new();
  id v8 = v7;
  int v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x10000) != 0)
  {
    [v7 addObject:@"UIKeyModifierAlphaShift"];
    int v9 = *((_DWORD *)self + 52);
    if ((v9 & 0x20000) == 0)
    {
LABEL_5:
      if ((v9 & 0x40000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((v9 & 0x20000) == 0)
  {
    goto LABEL_5;
  }
  [v8 addObject:@"UIKeyModifierShift"];
  int v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x40000) == 0)
  {
LABEL_6:
    if ((v9 & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v8 addObject:@"UIKeyModifierControl"];
  int v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x80000) == 0)
  {
LABEL_7:
    if ((v9 & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v8 addObject:@"UIKeyModifierAlternate"];
  int v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x100000) == 0)
  {
LABEL_8:
    if ((v9 & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_18:
  [v8 addObject:@"UIKeyModifierCommand"];
  if ((*((_DWORD *)self + 52) & 0x200000) != 0) {
LABEL_9:
  }
    [v8 addObject:@"UIKeyModifierNumericPad"];
LABEL_10:
  input = (__CFString *)self->_input;
  if (!input) {
    input = @"<none>";
  }
  UIKeyModifierFlags v11 = input;
  if ([(__CFString *)v11 isEqualToString:@" "])
  {
    uint64_t v12 = @"<space>";
  }
  else
  {
    if (![(__CFString *)v11 isEqualToString:@"\t"]) {
      goto LABEL_23;
    }
    uint64_t v12 = @"<tab>";
  }

  UIKeyModifierFlags v11 = v12;
LABEL_23:
  if ([v8 count])
  {
    uint64_t v13 = [v8 componentsJoinedByString:@"|"];
    [v4 appendFormat:@"  Input: %@ + (%@)", v11, v13];
  }
  else
  {
    [v4 appendFormat:@"  Input: %@", v11];
  }

  return v4;
}

- (id)_readableStringForModifierFlagsUsingWords:(BOOL)a3 forHUD:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v8 = v7;
  int v9 = *((_DWORD *)self + 52);
  if (a3)
  {
    if ((v9 & 0x100000) != 0)
    {
      if (v4) {
        unsigned int v10 = @"⌘  ";
      }
      else {
        unsigned int v10 = @"command ";
      }
      [v7 appendString:v10];
      int v9 = *((_DWORD *)self + 52);
      if ((v9 & 0x40000) == 0)
      {
LABEL_4:
        if ((v9 & 0x80000) == 0) {
          goto LABEL_5;
        }
        goto LABEL_19;
      }
    }
    else if ((v9 & 0x40000) == 0)
    {
      goto LABEL_4;
    }
    [v8 appendString:@"control "];
    int v9 = *((_DWORD *)self + 52);
    if ((v9 & 0x80000) == 0)
    {
LABEL_5:
      if ((v9 & 0x20000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
LABEL_19:
    [v8 appendString:@"option "];
    int v9 = *((_DWORD *)self + 52);
    if ((v9 & 0x20000) == 0)
    {
LABEL_6:
      if ((v9 & 0x800000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_21;
    }
LABEL_20:
    [v8 appendString:@"shift "];
    if ((*((_DWORD *)self + 52) & 0x800000) == 0) {
      goto LABEL_28;
    }
LABEL_21:
    UIKeyModifierFlags v11 = @"globe ";
LABEL_27:
    [v8 appendString:v11];
    goto LABEL_28;
  }
  if ((v9 & 0x40000) != 0)
  {
    [v7 appendString:@"⌃ "];
    int v9 = *((_DWORD *)self + 52);
    if ((v9 & 0x80000) == 0)
    {
LABEL_10:
      if ((v9 & 0x20000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
  }
  else if ((v9 & 0x80000) == 0)
  {
    goto LABEL_10;
  }
  [v8 appendString:@"⌥ "];
  int v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x20000) == 0)
  {
LABEL_11:
    if ((v9 & 0x100000) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    [v8 appendString:@"⌘ "];
    if ((*((_DWORD *)self + 52) & 0x800000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
LABEL_24:
  [v8 appendString:@"⇧ "];
  int v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x100000) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((v9 & 0x800000) != 0)
  {
LABEL_26:
    [v8 appendString:@"globe "];
    UIKeyModifierFlags v11 = @" ";
    goto LABEL_27;
  }
LABEL_28:
  if ((unint64_t)[v8 length] >= 2) {
    objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);
  }
  return v8;
}

- (id)_readableStringForInputUsingWords:(BOOL)a3 forHUD:(BOOL)a4 outIsSingleCharacterOrKeySymbol:(BOOL *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unsigned int v10 = [(UIKeyCommand *)self discoverabilityInput];
  if ([v10 length] == 1)
  {
    [(UIKeyCommand *)self _currentGSKeyboard];
    UIKeyModifierFlags v11 = GSKeyboardGetLocale();
    uint64_t v12 = [v10 uppercaseStringWithLocale:v11];

    uint64_t v13 = [(UIKeyCommand *)self _layoutAwareDisplayInputOverride];

    if (v13)
    {
      uint64_t v14 = [(UIKeyCommand *)self _layoutAwareDisplayInputOverride];

      uint64_t v12 = (void *)v14;
    }

    unsigned int v10 = v12;
  }
  objc_super v15 = v10;
  if ([(__CFString *)v15 isEqualToString:@"UIKeyInputUpArrow"])
  {
    UIMenuElementState v16 = @"↑";
  }
  else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputDownArrow"])
  {
    UIMenuElementState v16 = @"↓";
  }
  else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputLeftArrow"])
  {
    UIMenuElementState v16 = @"←";
  }
  else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputRightArrow"])
  {
    UIMenuElementState v16 = @"→";
  }
  else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputEscape"])
  {
    UIMenuElementState v16 = @"esc";
  }
  else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputPageUp"])
  {
    UIMenuElementState v16 = @"page up";
  }
  else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputPageDown"])
  {
    UIMenuElementState v16 = @"page down";
  }
  else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputHome"])
  {
    UIMenuElementState v16 = @"home";
  }
  else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputEnd"])
  {
    UIMenuElementState v16 = @"end";
  }
  else if ([(__CFString *)v15 isEqualToString:@" "])
  {
    if (v6)
    {
      uint64_t v17 = _UINSLocalizedStringWithDefaultValue(@"space", @"space");
      [v9 appendString:v17];

      goto LABEL_38;
    }
    UIMenuElementState v16 = @"space";
  }
  else if ([(__CFString *)v15 isEqualToString:@"\t"])
  {
    if (v7) {
      UIMenuElementState v16 = @"tab";
    }
    else {
      UIMenuElementState v16 = @"⇥";
    }
  }
  else if (([(__CFString *)v15 isEqualToString:@"\n"] & 1) != 0 {
         || [(__CFString *)v15 isEqualToString:@"\r"])
  }
  {
    if (v7) {
      UIMenuElementState v16 = @"return";
    }
    else {
      UIMenuElementState v16 = @"⏎";
    }
  }
  else
  {
    if (![(__CFString *)v15 isEqualToString:@"\b"])
    {
      if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF1"])
      {
        objc_super v22 = @"f1";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF2"])
      {
        objc_super v22 = @"f2";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF3"])
      {
        objc_super v22 = @"f3";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF4"])
      {
        objc_super v22 = @"f4";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF5"])
      {
        objc_super v22 = @"f5";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF6"])
      {
        objc_super v22 = @"f6";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF7"])
      {
        objc_super v22 = @"f7";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF8"])
      {
        objc_super v22 = @"f8";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF9"])
      {
        objc_super v22 = @"f9";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF10"])
      {
        objc_super v22 = @"f10";
      }
      else if ([(__CFString *)v15 isEqualToString:@"UIKeyInputF11"])
      {
        objc_super v22 = @"f11";
      }
      else
      {
        if (![(__CFString *)v15 isEqualToString:@"UIKeyInputF12"])
        {
          int v18 = v9;
          UIMenuElementState v16 = v15;
          goto LABEL_37;
        }
        objc_super v22 = @"f12";
      }
      [v9 appendString:v22];
      char v19 = 1;
      if (a5) {
        goto LABEL_39;
      }
      goto LABEL_43;
    }
    if (v7) {
      UIMenuElementState v16 = @"delete";
    }
    else {
      UIMenuElementState v16 = @"⌫";
    }
  }
  int v18 = v9;
LABEL_37:
  [v18 appendString:v16];
LABEL_38:
  char v19 = 0;
  if (a5)
  {
LABEL_39:
    BOOL v20 = (v19 & 1) != 0 || [v9 length] == 1;
    *a5 = v20;
  }
LABEL_43:

  return v9;
}

- (BOOL)wantsPriorityOverSystemBehavior
{
  return (*((unsigned __int8 *)self + 221) >> 3) & 1;
}

- (NSString)_layoutAwareInput
{
  return self->_layoutAwareInput;
}

- (int64_t)_layoutAwareModifierFlags
{
  return *((int *)self + 53);
}

- (NSString)_layoutAwareDisplayInputOverride
{
  return self->_layoutAwareDisplayInputOverride;
}

- (void)set_layoutAwareDisplayInputOverride:(id)a3
{
}

- (BKSHIDEventDeferringEnvironment)_eventDeferringEnvironment
{
  return self->__eventDeferringEnvironment;
}

- (void)_setEventDeferringEnvironment:(id)a3
{
}

- (UIResponder)_originatingResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__originatingResponder);
  return (UIResponder *)WeakRetained;
}

- (void)_setOriginatingResponder:(id)a3
{
}

- (int64_t)_enumerationPriority
{
  return self->__enumerationPriority;
}

- (BOOL)_isDirectlyReachableWithTranslator:(id)a3
{
  id v4 = a3;
  char v5 = [v4 layoutName];
  BOOL v6 = +[_UIKeyCommandMatchingCache keyCommandMatchingCacheForLayout:]((uint64_t)_UIKeyCommandMatchingCache, v5);

  BOOL v7 = [(UIKeyCommand *)self _layoutAwareInput];
  unsigned int v8 = -[_UIKeyCommandMatchingCache directReachabilityStateForInput:modifiers:](v6, v7, [(UIKeyCommand *)self modifierFlags]);

  if (v8
    || ([(UIKeyCommand *)self _layoutAwareInput],
        unsigned int v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 length],
        v10,
        !v11))
  {
    BOOL v9 = v8 == 1;
  }
  else
  {
    uint64_t v12 = [(UIKeyCommand *)self _layoutAwareInput];
    uint64_t v13 = [v12 lowercaseString];
    int v14 = objc_msgSend(v4, "HIDUsageCodeForCharacter:modifiers:", objc_msgSend(v13, "characterAtIndex:", 0), -[UIKeyCommand modifierFlags](self, "modifierFlags"));

    BOOL v9 = v14 != -1;
    objc_super v15 = [(UIKeyCommand *)self _layoutAwareInput];
    -[_UIKeyCommandMatchingCache setDirectlyReachable:input:modifiers:](v6, v14 != -1, v15, [(UIKeyCommand *)self modifierFlags]);
  }
  return v9;
}

@end