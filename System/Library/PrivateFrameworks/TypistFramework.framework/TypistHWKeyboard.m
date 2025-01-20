@interface TypistHWKeyboard
+ (id)_convertKeyboardLanguageToHIDCountryCode:(int64_t)a3;
+ (id)convertHIDCountryCodeToLanguage:(int64_t)a3;
+ (id)keyboardLanguageValueMap;
+ (id)keyboardLayoutValueMap;
+ (unsigned)_convertHIDKeyboardTypeToGSKeyboardType:(unsigned int)a3;
+ (unsigned)_convertKeyboardLanguageToHIDKeyboardType:(id)a3;
- (NSDictionary)modifierCharMap;
- (NSDictionary)propertyDictionary;
- (NSMutableDictionary)characterToKeycodeMap;
- (NSNumber)keyboardCountryCode;
- (NSNumber)keyboardLanguage;
- (NSString)keyboardLanguageString;
- (NSString)propertyDictionaryString;
- (TypistHWKeyboard)initWithLanguage:(id)a3;
- (__GSKeyboard)hardwareKeyboard;
- (double)pressDuration;
- (double)typeInterval;
- (id)_generateKeystrokeStream:(id)a3 appendTypeInterval:(BOOL)a4;
- (id)_getModifierMaskMap;
- (id)_subsequentKeyPressPairForCharacter:(id)a3;
- (id)generateKeystrokeStream:(id)a3;
- (id)getPropertyDictionaryString;
- (id)pressKeycodes:(id)a3;
- (id)usagePairsForText:(id)a3;
- (unsigned)getHIDKeyboardType;
- (unsigned)hidKeyboardType;
- (unsigned)usagePage;
- (void)_insertCharacterForKeyCode:(unsigned __int16)a3 logOutput:(id)a4;
- (void)_insertKey:(unsigned __int16)a3 logOutput:(id)a4;
- (void)_insertStaticKeys;
- (void)_setupCharacterToKeycodeMap;
- (void)dealloc;
- (void)detach;
- (void)pressAndHoldKeys:(id)a3 forDuration:(double)a4 withValidation:(id)a5 after:(double)a6;
- (void)pressKeycode:(unsigned __int16)a3;
- (void)setCharacterToKeycodeMap:(id)a3;
- (void)setHardwareKeyboard:(__GSKeyboard *)a3;
- (void)setHidKeyboardType:(unsigned int)a3;
- (void)setKeyboardCountryCode:(id)a3;
- (void)setKeyboardLanguage:(id)a3;
- (void)setKeyboardLanguageString:(id)a3;
- (void)setModifierCharMap;
- (void)setModifierCharMap:(id)a3;
- (void)setPressDuration:(double)a3;
- (void)setPropertyDictionary:(id)a3;
- (void)setPropertyDictionaryString:(id)a3;
- (void)setTypeInterval:(double)a3;
- (void)setUsagePage:(unsigned __int8)a3;
- (void)typeString:(id)a3;
@end

@implementation TypistHWKeyboard

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(TypistHWKeyboard *)self detach];
  v4.receiver = self;
  v4.super_class = (Class)TypistHWKeyboard;
  [(TypistHWKeyboard *)&v4 dealloc];
}

- (void)setKeyboardLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardLanguage, a3);
  id v5 = a3;
  v6 = +[TypistHWKeyboard keyboardLayoutValueMap];

  v7 = [(TypistHWKeyboard *)self keyboardLanguage];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"ABC";
  }
  [(TypistHWKeyboard *)self setKeyboardLanguageString:v10];

  id v19 = [(TypistHWKeyboard *)self keyboardLanguage];
  v18 = [(TypistHWKeyboard *)self keyboardLanguageString];
  TYLog(@"Keyboard language set to [%@ - %@]", v11, v12, v13, v14, v15, v16, v17, (char)v19);
}

- (void)setHidKeyboardType:(unsigned int)a3
{
  self->_hidKeyboardType = a3;
  char v3 = [(TypistHWKeyboard *)self hidKeyboardType];
  TYLog(@"Setting hidKeyboardType: [%u - %@]", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (TypistHWKeyboard)initWithLanguage:(id)a3
{
  v44[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)TypistHWKeyboard;
  uint64_t v5 = [(TypistHWKeyboard *)&v42 init];
  if (!v5) {
    goto LABEL_6;
  }
  GSInitialize();
  if (!v4)
  {
    v38 = @"[TypistHWKeyboard]: No keyboard language has been provided.";
LABEL_9:
    TYLogl(OS_LOG_TYPE_ERROR, v38, v6, v7, v8, v9, v10, v11, v40);
LABEL_10:
    v37 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = +[TypistHWKeyboard keyboardLayoutValueMap];
  uint64_t v13 = [v12 objectForKey:v4];

  if (!v13)
  {
    char v40 = (char)v4;
    v38 = @"[TypistHWKeyboard]: Unrecognized Keyboard Language Identifier (%@)";
    goto LABEL_9;
  }
  [(TypistHWKeyboard *)v5 setKeyboardLanguage:v4];
  [(TypistHWKeyboard *)v5 setUsagePage:7];
  [(TypistHWKeyboard *)v5 setHidKeyboardType:[(TypistHWKeyboard *)v5 getHIDKeyboardType]];
  uint64_t v14 = [(TypistHWKeyboard *)v5 keyboardLanguage];
  uint64_t v15 = +[TypistHWKeyboard _convertKeyboardLanguageToHIDCountryCode:](TypistHWKeyboard, "_convertKeyboardLanguageToHIDCountryCode:", [v14 integerValue]);
  [(TypistHWKeyboard *)v5 setKeyboardCountryCode:v15];

  v43[0] = @"PrimaryUsagePage";
  v43[1] = @"PrimaryUsage";
  v44[0] = &unk_270C6EAC0;
  v44[1] = &unk_270C6EAD8;
  v43[2] = @"KeyboardLanguage";
  uint64_t v16 = [(TypistHWKeyboard *)v5 keyboardLanguageString];
  v44[2] = v16;
  v43[3] = @"StandardType";
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TypistHWKeyboard hidKeyboardType](v5, "hidKeyboardType"));
  v44[3] = v17;
  v43[4] = @"CountryCode";
  v18 = [(TypistHWKeyboard *)v5 keyboardCountryCode];
  v44[4] = v18;
  id v19 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:5];
  [(TypistHWKeyboard *)v5 setPropertyDictionary:v19];

  id v20 = [NSString alloc];
  v21 = (void *)MEMORY[0x263F08900];
  v22 = [(TypistHWKeyboard *)v5 propertyDictionary];
  id v41 = 0;
  v23 = [v21 dataWithJSONObject:v22 options:0 error:&v41];
  id v24 = v41;
  v25 = (void *)[v20 initWithData:v23 encoding:4];
  [(TypistHWKeyboard *)v5 setPropertyDictionaryString:v25];

  +[TypistHWKeyboard _convertHIDKeyboardTypeToGSKeyboardType:[(TypistHWKeyboard *)v5 hidKeyboardType]];
  v26 = [(TypistHWKeyboard *)v5 keyboardCountryCode];
  [v26 unsignedIntValue];
  [(TypistHWKeyboard *)v5 hidKeyboardType];
  GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType();

  v27 = +[TypistHWKeyboard keyboardLayoutValueMap];
  char v28 = [v27 objectForKey:v4];

  [(TypistHWKeyboard *)v5 setHardwareKeyboard:GSKeyboardCreate()];
  if (![(TypistHWKeyboard *)v5 hardwareKeyboard])
  {
    TYLogl(OS_LOG_TYPE_FAULT, @"GSKeyboardCreate failed to allocate memory to layout [%@] for language [%@].", v29, v30, v31, v32, v33, v34, v28);

    goto LABEL_10;
  }
  [(TypistHWKeyboard *)v5 setModifierCharMap];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_setModifierCharMap, (CFStringRef)*MEMORY[0x263F8B1B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(TypistHWKeyboard *)v5 setCharacterToKeycodeMap:v36];

  [(TypistHWKeyboard *)v5 _setupCharacterToKeycodeMap];
LABEL_6:
  v37 = v5;
LABEL_11:

  return v37;
}

- (unsigned)getHIDKeyboardType
{
  v2 = [(TypistHWKeyboard *)self keyboardLanguage];
  unsigned int v3 = +[TypistHWKeyboard _convertKeyboardLanguageToHIDKeyboardType:v2];

  return v3;
}

- (void)setModifierCharMap
{
  v26[10] = *MEMORY[0x263EF8340];
  int v10 = _AXSFullKeyboardAccessEnabled();
  uint64_t v11 = @"YES - Tab key is treated as modifier";
  if (!v10) {
    uint64_t v11 = @"NO";
  }
  TYLog(@"TypistHWKeyboard: _AXSFullKeyboardAccessEnabled: %@", v3, v4, v5, v6, v7, v8, v9, (char)v11);
  if (v10)
  {
    v25[0] = @"⌥";
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 226);
    v26[0] = v22;
    v25[1] = @"⇧";
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 225);
    v26[1] = v21;
    v25[2] = @"⌘";
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 227);
    v26[2] = v12;
    v25[3] = @"⌃";
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 224);
    v26[3] = v13;
    v25[4] = @"⌨";
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 255, 3);
    v26[4] = v14;
    v25[5] = @"⇥";
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 43);
    v26[5] = v15;
    v25[6] = @"⇩";
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 229);
    v26[6] = v16;
    v25[7] = @"⎇";
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 230);
    v26[7] = v17;
    v25[8] = @"⊞";
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 231);
    v26[8] = v18;
    v25[9] = @"⌄";
    id v19 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 228);
    v26[9] = v19;
    id v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:10];
    [(TypistHWKeyboard *)self setModifierCharMap:v20];
  }
  else
  {
    v23[0] = @"⌥";
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 226);
    v24[0] = v22;
    v23[1] = @"⇧";
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 225);
    v24[1] = v21;
    v23[2] = @"⌘";
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 227);
    v24[2] = v12;
    v23[3] = @"⌃";
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 224);
    v24[3] = v13;
    v23[4] = @"⌨";
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 255, 3);
    v24[4] = v14;
    v23[5] = @"⇩";
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 229);
    v24[5] = v15;
    v23[6] = @"⎇";
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 230);
    v24[6] = v16;
    v23[7] = @"⊞";
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 231);
    v24[7] = v17;
    v23[8] = @"⌄";
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 228);
    v24[8] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:9];
    [(TypistHWKeyboard *)self setModifierCharMap:v19];
  }
}

- (void)_insertKey:(unsigned __int16)a3 logOutput:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(TypistHWKeyboard *)self hardwareKeyboard])
  {
    uint64_t v13 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
    unsigned __int16 v32 = 0;
    [(TypistHWKeyboard *)self hardwareKeyboard];
    GSKeyboardTranslateKeyExtended();
    [(TypistHWKeyboard *)self hardwareKeyboard];
    int ModifierState = GSKeyboardGetModifierState();
    uint64_t v15 = [NSString stringWithCharacters:v13 + 30 length:v13[29]];
    if (v15)
    {
      uint64_t v16 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      uint64_t v17 = [v16 objectForKeyedSubscript:v15];

      v18 = (ModifierState & 0x2000000) != 0 ? @"Yes - skipping" : @"No";
      id v19 = v17 ? @"Yes - skipping" : @"No";
      [v6 appendFormat:@"keyCode: %#x, unmodifiedCharacters: %@, dead key: %@, key exists: %@\n", v4, v15, v18, v19];
      if ((ModifierState & 0x2000000) == 0 && !v17)
      {
        id v20 = [(TypistHWKeyboard *)self characterToKeycodeMap];
        v21 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), v4);
        [v20 setObject:v21 forKey:v15];
      }
    }
    unsigned __int16 v32 = 0;
    v33[0] = 0;
    free(v13);
    v22 = (char *)malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
    [(TypistHWKeyboard *)self hardwareKeyboard];
    GSKeyboardTranslateKeyExtended();
    [(TypistHWKeyboard *)self hardwareKeyboard];
    GSKeyboardTranslateKeyExtended();
    [(TypistHWKeyboard *)self hardwareKeyboard];
    int v23 = GSKeyboardGetModifierState();
    id v24 = [NSString stringWithCharacters:v33 length:v32];

    if (v24)
    {
      v25 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      v26 = [v25 objectForKeyedSubscript:v24];

      v27 = @"No";
      if ((v23 & 0x2000000) != 0) {
        char v28 = @"Yes - skipping";
      }
      else {
        char v28 = @"No";
      }
      if (v26) {
        v27 = @"Yes - skipping";
      }
      [v6 appendFormat:@"keyCode: %#x, shiftModifiedCharacters: %@, dead key: %@, key exists: %@\n", v4, v24, v28, v27];
      if ((v23 & 0x2000000) == 0 && !v26)
      {
        uint64_t v29 = [(TypistHWKeyboard *)self characterToKeycodeMap];
        uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 225, -[TypistHWKeyboard usagePage](self, "usagePage"), v4);
        [v29 setObject:v30 forKey:v24];
      }
    }
    free(v22);
  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"No hardware keyboard reference is attached. It may have been detached.", v7, v8, v9, v10, v11, v12, v31);
  }
}

- (void)_insertCharacterForKeyCode:(unsigned __int16)a3 logOutput:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  switch((int)v4)
  {
    case '(':
      uint64_t v7 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 40);
      uint64_t v9 = @"⏎";
      goto LABEL_9;
    case ')':
      uint64_t v7 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 41);
      uint64_t v9 = @"␛";
      goto LABEL_9;
    case '*':
      uint64_t v7 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 42);
      uint64_t v9 = @"⌫";
      goto LABEL_9;
    case '+':
      uint64_t v7 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 43);
      uint64_t v9 = @"⇥";
      goto LABEL_9;
    case ',':
      uint64_t v7 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 44);
      uint64_t v9 = @" ";
      goto LABEL_9;
    default:
      if (v4 == 57)
      {
        uint64_t v7 = [(TypistHWKeyboard *)self characterToKeycodeMap];
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 57);
        uint64_t v9 = @"⇪";
LABEL_9:
        [v7 setObject:v8 forKey:v9];
      }
      else if ((v4 - 58) > 0x35)
      {
        [(TypistHWKeyboard *)self _insertKey:v4 logOutput:v6];
      }
      else
      {
        __int16 v13 = v4 - 2357;
        uint64_t v10 = [NSString stringWithCharacters:&v13 length:1];
        uint64_t v11 = [(TypistHWKeyboard *)self characterToKeycodeMap];
        uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), v4);
        [v11 setObject:v12 forKey:v10];
      }
      return;
  }
}

- (void)_insertStaticKeys
{
  uint64_t v3 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 76);
  [v3 setObject:v4 forKey:@"⌦"];

  uint64_t v5 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 75);
  [v5 setObject:v6 forKey:@"⇞"];

  uint64_t v7 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 78);
  [v7 setObject:v8 forKey:@"⇟"];

  uint64_t v9 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 74);
  [v9 setObject:v10 forKey:@"⇱"];

  uint64_t v11 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 77);
  [v11 setObject:v12 forKey:@"⇲"];

  __int16 v13 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 79);
  [v13 setObject:v14 forKey:@"→"];

  uint64_t v15 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 80);
  [v15 setObject:v16 forKey:@"←"];

  uint64_t v17 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 81);
  [v17 setObject:v18 forKey:@"↓"];

  id v19 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  id v20 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), 82);
  [v19 setObject:v20 forKey:@"↑"];

  v21 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 255, 3);
  [v21 setObject:v22 forKey:@"⌨"];

  int v23 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  id v24 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 12, 111);
  [v23 setObject:v24 forKey:@"🔆"];

  v25 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  v26 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 12, 112);
  [v25 setObject:v26 forKey:@"🔅"];

  v27 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  char v28 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 12, 121);
  [v27 setObject:v28 forKey:@"明"];

  uint64_t v29 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 12, 122);
  [v29 setObject:v30 forKey:@"暗"];

  char v31 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  unsigned __int16 v32 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 12, 233);
  [v31 setObject:v32 forKey:@"🔊"];

  uint64_t v33 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 12, 234);
  [v33 setObject:v34 forKey:@"🔉"];

  id v36 = [(TypistHWKeyboard *)self characterToKeycodeMap];
  v35 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", 12, 226);
  [v36 setObject:v35 forKey:@"🔇"];
}

- (void)_setupCharacterToKeycodeMap
{
  int v3 = 4;
  id v15 = (id)objc_opt_new();
  do
  {
    unsigned int v4 = (unsigned __int16)v3;
    [(TypistHWKeyboard *)self _insertCharacterForKeyCode:(unsigned __int16)v3++ logOutput:v15];
  }
  while (v4 < 0x45);
  int v5 = 104;
  do
  {
    unsigned int v6 = (unsigned __int16)v5;
    [(TypistHWKeyboard *)self _insertCharacterForKeyCode:(unsigned __int16)v5++ logOutput:v15];
  }
  while (v6 < 0x6F);
  [(TypistHWKeyboard *)self _insertStaticKeys];
  if ([(TypistHWKeyboard *)self hidKeyboardType] == 2)
  {
    [(TypistHWKeyboard *)self _insertKey:135 logOutput:v15];
    id v7 = v15;
    uint64_t v8 = 137;
  }
  else
  {
    if ([(TypistHWKeyboard *)self hidKeyboardType] != 1) {
      goto LABEL_10;
    }
    uint64_t v8 = 100;
    id v7 = v15;
  }
  [(TypistHWKeyboard *)self _insertKey:v8 logOutput:v7];
LABEL_10:
  TYLogl(OS_LOG_TYPE_DEBUG, @"### Translated Keys ###\n%@", v9, v10, v11, v12, v13, v14, (char)v15);
}

- (void)detach
{
  int v3 = [(TypistHWKeyboard *)self keyboardCountryCode];
  [v3 unsignedIntValue];
  GSEventSetHardwareKeyboardAttached();

  if ([(TypistHWKeyboard *)self hardwareKeyboard])
  {
    [(TypistHWKeyboard *)self hardwareKeyboard];
    GSKeyboardRelease();
    [(TypistHWKeyboard *)self setHardwareKeyboard:0];
  }
  TYLog(@"Detaching hardware keyboard. Tearing down recapInlineplayer.", v4, v5, v6, v7, v8, v9, v10, v11);
  +[TypistKeyboardUtilities tearDownRecapInlinePlayer];
}

- (id)generateKeystrokeStream:(id)a3
{
  id v4 = a3;
  [(TypistHWKeyboard *)self pressDuration];
  char v6 = v5;
  [(TypistHWKeyboard *)self typeInterval];
  TYLog(@"TypistHWKeyboard: Generated usage pairs with %fs pressDuration, %fs typeInterval", v7, v8, v9, v10, v11, v12, v13, v6);
  uint64_t v14 = (void *)MEMORY[0x263F62CF8];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__TypistHWKeyboard_generateKeystrokeStream___block_invoke;
  v18[3] = &unk_265559628;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  uint64_t v16 = [v14 eventStreamWithEventActions:v18];

  return v16;
}

void __44__TypistHWKeyboard_generateKeystrokeStream___block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  int v3 = (void *)MEMORY[0x263F62CC8];
  id v4 = [*(id *)(a1 + 32) propertyDictionary];
  char v5 = [v3 senderWithProperties:v4];
  [v26 setSenderProperties:v5];

  char v6 = [*(id *)(a1 + 32) usagePairsForText:*(void *)(a1 + 40)];
  uint64_t v7 = [v6 usages];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v6 usages];
      uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

      uint64_t v12 = [v6 usagePages];
      uint64_t v13 = [v12 objectAtIndexedSubscript:v9];

      if ([v11 count])
      {
        unint64_t v14 = 0;
        do
        {
          id v15 = [v13 objectAtIndexedSubscript:v14];
          uint64_t v16 = [v15 unsignedIntegerValue];

          uint64_t v17 = [v11 objectAtIndexedSubscript:v14];
          uint64_t v18 = [v17 unsignedIntegerValue];

          [v26 beginButtonPressWithPage:v16 usage:v18];
          [*(id *)(a1 + 32) pressDuration];
          objc_msgSend(v26, "advanceTime:");
          ++v14;
        }
        while (v14 < [v11 count]);
      }
      uint64_t v19 = [v11 count] - 1;
      if (v19 >= 0)
      {
        do
        {
          id v20 = [v13 objectAtIndexedSubscript:v19];
          uint64_t v21 = [v20 unsignedIntegerValue];

          v22 = [v11 objectAtIndexedSubscript:v19];
          uint64_t v23 = [v22 unsignedIntegerValue];

          [v26 endButtonPressWithPage:v21 usage:v23];
          [v26 advanceTime:0.01];
          --v19;
        }
        while (v19 != -1);
      }
      [*(id *)(a1 + 32) typeInterval];
      objc_msgSend(v26, "advanceTime:");

      ++v9;
      id v24 = [v6 usages];
      unint64_t v25 = [v24 count];
    }
    while (v9 < v25);
  }
}

- (id)_generateKeystrokeStream:(id)a3 appendTypeInterval:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(TypistHWKeyboard *)self hardwareKeyboard])
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"No hardware keyboard reference is attached. It may have been detached.", v7, v8, v9, v10, v11, v12, v55);
    id v21 = 0;
    goto LABEL_35;
  }
  id v13 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v13 setDecimalSeparator:@"."];
  [v13 setNumberStyle:1];
  [v13 setMaximumFractionDigits:5];
  unint64_t v14 = NSNumber;
  [(TypistHWKeyboard *)self pressDuration];
  id v15 = objc_msgSend(v14, "numberWithDouble:");
  v63 = [v13 stringFromNumber:v15];

  uint64_t v16 = NSNumber;
  [(TypistHWKeyboard *)self typeInterval];
  uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
  v62 = [v13 stringFromNumber:v17];

  uint64_t v18 = [v6 stringByReplacingOccurrencesOfString:@"\t" withString:@"⇥"];
  uint64_t v19 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@"⏎"];

  id v20 = [(TypistHWKeyboard *)self modifierCharMap];
  id v21 = objc_alloc_init(MEMORY[0x263F089D8]);
  TYLogl(OS_LOG_TYPE_DEBUG, @"Generating hardware keystroke stream for input: [%@]", v22, v23, v24, v25, v26, v27, (char)v6);
  if (![v19 graphemeCount])
  {
    id v36 = 0;
    goto LABEL_34;
  }
  id v57 = v13;
  id v58 = v6;
  unint64_t v35 = 0;
  id v36 = 0;
  BOOL v60 = v4;
  v59 = self;
  id v61 = v21;
  v64 = v20;
  do
  {
    v37 = [v19 graphemeAtIndex:v35];
    uint64_t v38 = [v20 objectForKey:v37];
    v39 = (void *)v38;
    if (!v38)
    {
      char v40 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      id v41 = [v40 objectForKey:v37];

      if (v41)
      {
        if (v36) {
          [v36 appendFormat:@"/%@", v41];
        }
        else {
          id v36 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"bx %@", v41];
        }
        goto LABEL_24;
      }
      [(TypistHWKeyboard *)self hardwareKeyboard];
      GSKeyboardHWKeyboardNormalizeInput();
      objc_super v42 = [(TypistHWKeyboard *)self characterToKeycodeMap];
      v43 = [v42 objectForKey:v37];

      if (!v43)
      {
        TYLogl(OS_LOG_TYPE_ERROR, @"The character \"%@\" is not in the character map and cannot be normalized to a known character.", v44, v45, v46, v47, v48, v49, (char)v37);
        id v21 = v61;
        id v20 = v64;
LABEL_27:

        goto LABEL_28;
      }
      v50 = [(TypistHWKeyboard *)self _getModifierMaskMap];
      v51 = [NSNumber numberWithUnsignedInt:0];
      v52 = [v50 objectForKey:v51];

      if ([v52 length])
      {
        BOOL v4 = v60;
        if (v36)
        {
          [v36 appendFormat:@"/%@/%@", v52, v43];
LABEL_23:
          self = v59;

          id v21 = v61;
LABEL_24:
          id v20 = v64;
          if (v4)
          {
            v56 = v62;
            [v36 appendFormat:@" %@ wait %@ ", v63];
          }
          [v21 appendString:v36];

          id v36 = 0;
          goto LABEL_27;
        }
        v56 = v43;
        uint64_t v53 = [objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"bx %@/%@", v52];
      }
      else
      {
        BOOL v4 = v60;
        if (v36)
        {
          [v36 appendFormat:@"/%@", v43, v56];
          goto LABEL_23;
        }
        uint64_t v53 = [objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"bx %@", v43];
      }
      id v36 = (void *)v53;
      goto LABEL_23;
    }
    if (v36) {
      [v36 appendFormat:@"/%@", v38];
    }
    else {
      id v36 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"bx %@", v38];
    }
LABEL_28:

    ++v35;
  }
  while ([v19 graphemeCount] > v35);
  if (v36)
  {
    [v36 appendString:@" "];
    [v21 appendString:v36];
  }
  id v13 = v57;
  id v6 = v58;
LABEL_34:
  TYLog(@"Hardware keystroke stream: %@", v28, v29, v30, v31, v32, v33, v34, (char)v21);

LABEL_35:
  return v21;
}

- (id)pressKeycodes:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = objc_opt_new();
  id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v6 setDecimalSeparator:@"."];
  [v6 setNumberStyle:1];
  [v6 setMaximumFractionDigits:5];
  uint64_t v7 = NSNumber;
  [(TypistHWKeyboard *)self pressDuration];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v44 = [v6 stringFromNumber:v8];

  uint64_t v9 = NSNumber;
  [(TypistHWKeyboard *)self typeInterval];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  v43 = [v6 stringFromNumber:v10];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v11 = v4;
  uint64_t v45 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v45)
  {
    uint64_t v41 = *(void *)v47;
    objc_super v42 = v5;
    id obj = v11;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v47 != v41) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        unint64_t v14 = objc_opt_new();
        if ([v13 count] != 1)
        {
          unint64_t v15 = 0;
          do
          {
            uint64_t v16 = [v13 objectAtIndexedSubscript:v15];
            unsigned int v17 = [v16 unsignedShortValue];

            uint64_t v18 = [v13 objectAtIndexedSubscript:v15 + 1];
            unsigned int v19 = [v18 unsignedShortValue];

            if ([v14 length]) {
              id v20 = @"/";
            }
            else {
              id v20 = &stru_270C5A038;
            }
            [v14 appendFormat:@"%@%02x,%02x", v20, v17, v19];
            v15 += 2;
          }
          while (v15 < [v13 count] - 1);
        }
        char v5 = v42;
        [v42 appendFormat:@"bx %@ %@ wait %@ ", v14, v44, v43];
      }
      id v11 = obj;
      uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v45);
  }

  if ([v5 length])
  {
    uint64_t v27 = NSString;
    uint64_t v28 = [(TypistHWKeyboard *)self propertyDictionaryString];
    uint64_t v29 = [v27 stringWithFormat:@"sender %@ %@", v28, v5];

    TYLog(@"TypistHWKeyboard - pressKeycodes: keystroke stream generated for input: [%@]\n%@", v30, v31, v32, v33, v34, v35, v36, (char)v11);
    v37 = [[TYRecapCommand alloc] initWithCommandType:1 commandString:v29 commandDescription:0];
    v50 = v37;
    uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
    +[TypistKeyboardUtilities launchRecap:v38];
  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"TypistHWKeyboard - pressKeycodes: No stream was generated for input: [%@]", v21, v22, v23, v24, v25, v26, (char)v11);
    uint64_t v29 = 0;
  }

  return v29;
}

- (void)pressKeycode:(unsigned __int16)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  char v4 = a3;
  char v5 = objc_msgSend(NSString, "stringWithFormat:", @"bx %x,%x", -[TypistHWKeyboard usagePage](self, "usagePage"), a3);
  id v6 = NSString;
  uint64_t v7 = [(TypistHWKeyboard *)self propertyDictionaryString];
  uint64_t v8 = [v6 stringWithFormat:@"sender %@ %@", v7, v5];

  TYLog(@"TypistHWKeyboard - pressKeycode: keystroke stream generated for input: [%ui]\n%@", v9, v10, v11, v12, v13, v14, v15, v4);
  uint64_t v16 = [[TYRecapCommand alloc] initWithCommandType:1 commandString:v8 commandDescription:0];
  v18[0] = v16;
  unsigned int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[TypistKeyboardUtilities launchRecap:v17];
}

- (void)typeString:(id)a3
{
  id v3 = [(TypistHWKeyboard *)self generateKeystrokeStream:a3];
  +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:v3];
}

- (id)_subsequentKeyPressPairForCharacter:(id)a3
{
  id v3 = [(TypistHWKeyboard *)self _generateKeystrokeStream:a3 appendTypeInterval:0];
  if ([v3 hasPrefix:@"bx"])
  {
    char v4 = [v3 substringFromIndex:objc_msgSend(@"bx", "length")];

    char v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v3 = [v4 stringByTrimmingCharactersInSet:v5];
  }
  return v3;
}

- (void)pressAndHoldKeys:(id)a3 forDuration:(double)a4 withValidation:(id)a5 after:(double)a6
{
  id v10 = a3;
  uint64_t v30 = (void (**)(void))a5;
  id v11 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v12 = [(TypistHWKeyboard *)self propertyDictionaryString];
  uint64_t v13 = (void *)[v11 initWithFormat:@"sender %@ ", v12];

  if ([v10 count])
  {
    unint64_t v14 = 0;
    do
    {
      if (v14)
      {
        uint64_t v15 = [v10 objectAtIndexedSubscript:v14];
        uint64_t v16 = [(TypistHWKeyboard *)self _subsequentKeyPressPairForCharacter:v15];

        [v13 appendFormat:@"/%@", v16];
      }
      else
      {
        uint64_t v16 = [v10 objectAtIndexedSubscript:0];
        unsigned int v17 = [(TypistHWKeyboard *)self _generateKeystrokeStream:v16 appendTypeInterval:0];
        uint64_t v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        unsigned int v19 = [v17 stringByTrimmingCharactersInSet:v18];
        [v13 appendString:v19];
      }
      ++v14;
    }
    while ([v10 count] > v14);
  }
  objc_msgSend(v13, "appendFormat:", @" %f", *(void *)&a4);
  id v20 = [[TYRecapCommand alloc] initWithCommandType:1 commandString:v13 commandDescription:0];
  TYLog(@"TypistHWKeyboard - pressAndHoldKeys: keystroke stream generated for input: [%@]\n%@", v21, v22, v23, v24, v25, v26, v27, (char)v10);
  uint64_t v28 = dispatch_queue_create("launchRecapQueue", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__TypistHWKeyboard_pressAndHoldKeys_forDuration_withValidation_after___block_invoke;
  block[3] = &unk_265559650;
  uint64_t v29 = v20;
  uint64_t v32 = v29;
  dispatch_async(v28, block);
  +[TypistKeyboardUtilities waitFor:a6];
  if (v30) {
    v30[2](v30);
  }
}

void __70__TypistHWKeyboard_pressAndHoldKeys_forDuration_withValidation_after___block_invoke(uint64_t a1)
{
  v2 = +[TypistKeyboardUtilities sharedRecapInlinePlayer];
  id v3 = [*(id *)(a1 + 32) eventStream];
  [v2 prewarmForEventStream:v3 completion:0];

  id v6 = +[TypistKeyboardUtilities sharedRecapInlinePlayer];
  char v4 = [*(id *)(a1 + 32) eventStream];
  char v5 = objc_opt_new();
  [v6 playEventStream:v4 options:v5 completion:0];
}

- (id)_getModifierMaskMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__TypistHWKeyboard__getModifierMaskMap__block_invoke;
  block[3] = &unk_265559650;
  void block[4] = self;
  if (_getModifierMaskMap_modifierMaskMapToken != -1) {
    dispatch_once(&_getModifierMaskMap_modifierMaskMapToken, block);
  }
  return (id)_getModifierMaskMap_modifierMaskMapDictionary;
}

void __39__TypistHWKeyboard__getModifierMaskMap__block_invoke(uint64_t a1)
{
  v36[16] = *MEMORY[0x263EF8340];
  uint64_t v34 = [NSNumber numberWithUnsignedInt:0];
  v35[0] = v34;
  v36[0] = &stru_270C5A038;
  uint64_t v33 = [NSNumber numberWithUnsignedInt:0x20000];
  v35[1] = v33;
  uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225);
  v36[1] = v32;
  uint64_t v31 = [NSNumber numberWithUnsignedInt:0x80000];
  v35[2] = v31;
  uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226);
  v36[2] = v30;
  uint64_t v29 = [NSNumber numberWithUnsignedInt:0x100000];
  v35[3] = v29;
  uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224);
  v36[3] = v28;
  uint64_t v27 = [NSNumber numberWithUnsignedInt:0x10000];
  v35[4] = v27;
  uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v36[4] = v26;
  uint64_t v25 = [NSNumber numberWithUnsignedInt:655360];
  v35[5] = v25;
  uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226);
  v36[5] = v24;
  uint64_t v23 = [NSNumber numberWithUnsignedInt:1179648];
  v35[6] = v23;
  uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224);
  v36[6] = v22;
  uint64_t v21 = [NSNumber numberWithUnsignedInt:196608];
  v35[7] = v21;
  id v20 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v36[7] = v20;
  unsigned int v19 = [NSNumber numberWithUnsignedInt:1572864];
  v35[8] = v19;
  uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224);
  v36[8] = v18;
  unsigned int v17 = [NSNumber numberWithUnsignedInt:589824];
  v35[9] = v17;
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v36[9] = v16;
  uint64_t v15 = [NSNumber numberWithUnsignedInt:1114112];
  v35[10] = v15;
  unint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v36[10] = v14;
  uint64_t v13 = [NSNumber numberWithUnsignedInt:1703936];
  v35[11] = v13;
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224);
  v36[11] = v12;
  id v11 = [NSNumber numberWithUnsignedInt:720896];
  v35[12] = v11;
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v36[12] = v10;
  uint64_t v9 = [NSNumber numberWithUnsignedInt:1245184];
  v35[13] = v9;
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v36[13] = v2;
  id v3 = [NSNumber numberWithUnsignedInt:1638400];
  v35[14] = v3;
  char v4 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v36[14] = v4;
  char v5 = [NSNumber numberWithUnsignedInt:1769472];
  v35[15] = v5;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%x,%x/%x,%x/%x,%x/%x,%x", objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v36[15] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:16];
  uint64_t v8 = (void *)_getModifierMaskMap_modifierMaskMapDictionary;
  _getModifierMaskMap_modifierMaskMapDictionary = v7;
}

+ (unsigned)_convertHIDKeyboardTypeToGSKeyboardType:(unsigned int)a3
{
  unsigned int v3 = 0xCFCBCAu >> (8 * a3);
  if (a3 >= 3) {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (unsigned)_convertKeyboardLanguageToHIDKeyboardType:(id)a3
{
  unint64_t v3 = [a3 integerValue];
  if (v3 > 0x21) {
    return 1;
  }
  if (((1 << v3) & 0x200048820) == 0)
  {
    if (v3 == 3) {
      return 2;
    }
    return 1;
  }
  return 0;
}

+ (id)keyboardLanguageValueMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TypistHWKeyboard_keyboardLanguageValueMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (keyboardLanguageValueMap_onceToken != -1) {
    dispatch_once(&keyboardLanguageValueMap_onceToken, block);
  }
  v2 = (void *)keyboardLanguageValueMap_layoutMap;
  return v2;
}

void __44__TypistHWKeyboard_keyboardLanguageValueMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  unint64_t v3 = (void *)keyboardLanguageValueMap_layoutMap;
  keyboardLanguageValueMap_layoutMap = v2;

  id v4 = [*(id *)(a1 + 32) keyboardLayoutValueMap];
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global];
}

uint64_t __44__TypistHWKeyboard_keyboardLanguageValueMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [(id)keyboardLanguageValueMap_layoutMap setObject:a2 forKeyedSubscript:a3];
}

+ (id)keyboardLayoutValueMap
{
  if (keyboardLayoutValueMap_onceToken != -1) {
    dispatch_once(&keyboardLayoutValueMap_onceToken, &__block_literal_global_343);
  }
  uint64_t v2 = (void *)keyboardLayoutValueMap_countryCodeMap;
  return v2;
}

void __42__TypistHWKeyboard_keyboardLayoutValueMap__block_invoke()
{
  v3[40] = *MEMORY[0x263EF8340];
  v2[0] = &unk_270C6EAF0;
  v2[1] = &unk_270C6EAC0;
  v3[0] = @"ABC";
  v3[1] = @"German";
  v2[2] = &unk_270C6EB08;
  v2[3] = &unk_270C6EB20;
  v3[2] = @"French";
  v3[3] = @"ABC";
  v2[4] = &unk_270C6EB38;
  v2[5] = &unk_270C6EB50;
  v3[4] = @"ABC";
  v3[5] = @"US";
  v2[6] = &unk_270C6EAD8;
  v2[7] = &unk_270C6EB68;
  v3[6] = @"British";
  v3[7] = @"Spanish";
  v2[8] = &unk_270C6EB80;
  v2[9] = &unk_270C6EB98;
  v3[8] = @"Swedish";
  v3[9] = @"Italian";
  v2[10] = &unk_270C6EBB0;
  v2[11] = &unk_270C6EBC8;
  v3[10] = @"Canadian";
  v3[11] = @"ABC";
  v2[12] = &unk_270C6EBE0;
  v2[13] = &unk_270C6EBF8;
  v3[12] = @"Danish";
  v3[13] = @"Belgian";
  v2[14] = &unk_270C6EC10;
  v2[15] = &unk_270C6EC28;
  v3[14] = @"Norwegian";
  v3[15] = @"ABC";
  v2[16] = &unk_270C6EC40;
  v2[17] = &unk_270C6EC58;
  v3[16] = @"Dutch";
  v3[17] = @"Swiss German";
  v2[18] = &unk_270C6EC70;
  v2[19] = &unk_270C6EC88;
  v3[18] = @"ABC";
  v3[19] = @"ABC";
  v2[20] = &unk_270C6ECA0;
  v2[21] = &unk_270C6ECB8;
  v3[20] = @"Bulgarian";
  v3[21] = @"Croatian";
  v2[22] = &unk_270C6ECD0;
  v2[23] = &unk_270C6ECE8;
  v3[22] = @"Croatian-Standard";
  v3[23] = @"Czech";
  v2[24] = &unk_270C6ED00;
  v2[25] = &unk_270C6ED18;
  v3[24] = @"ABC";
  v3[25] = @"ABC";
  v2[26] = &unk_270C6ED30;
  v2[27] = &unk_270C6ED48;
  v3[26] = @"Icelandic";
  v3[27] = @"Hungarian";
  v2[28] = &unk_270C6ED60;
  v2[29] = &unk_270C6ED78;
  v3[28] = @"Polish";
  v3[29] = @"Portuguese";
  v2[30] = &unk_270C6ED90;
  v2[31] = &unk_270C6EDA8;
  v3[30] = @"ABC";
  v3[31] = @"Romanian";
  v2[32] = &unk_270C6EDC0;
  v2[33] = &unk_270C6EDD8;
  v3[32] = @"Russian";
  v3[33] = @"Slovak";
  v2[34] = &unk_270C6EDF0;
  v2[35] = &unk_270C6EE08;
  v3[34] = @"ABC";
  v3[35] = @"Turkish-QWERTY-PC";
  v2[36] = &unk_270C6EE20;
  v2[37] = &unk_270C6EE38;
  v3[36] = @"Turkish-QWERTY";
  v3[37] = @"Ukrainian";
  v2[38] = &unk_270C6EE50;
  v2[39] = &unk_270C6EE68;
  v3[38] = @"Turkish-Standard";
  v3[39] = @"ABC";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:40];
  v1 = (void *)keyboardLayoutValueMap_countryCodeMap;
  keyboardLayoutValueMap_countryCodeMap = v0;
}

+ (id)_convertKeyboardLanguageToHIDCountryCode:(int64_t)a3
{
  if (_convertKeyboardLanguageToHIDCountryCode__onceToken != -1) {
    dispatch_once(&_convertKeyboardLanguageToHIDCountryCode__onceToken, &__block_literal_global_505);
  }
  id v4 = (void *)_convertKeyboardLanguageToHIDCountryCode__countryCodeMap;
  char v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

void __61__TypistHWKeyboard__convertKeyboardLanguageToHIDCountryCode___block_invoke()
{
  v3[40] = *MEMORY[0x263EF8340];
  v2[0] = &unk_270C6EAF0;
  v2[1] = &unk_270C6EAC0;
  v3[0] = &unk_270C6EAF0;
  v3[1] = &unk_270C6EB98;
  v2[2] = &unk_270C6EB08;
  v2[3] = &unk_270C6EB20;
  v3[2] = &unk_270C6EB80;
  v3[3] = &unk_270C6EC28;
  v2[4] = &unk_270C6EB38;
  v2[5] = &unk_270C6EB50;
  v3[4] = &unk_270C6EBF8;
  v3[5] = &unk_270C6EDF0;
  v2[6] = &unk_270C6EAD8;
  v2[7] = &unk_270C6EB68;
  v3[6] = &unk_270C6EDD8;
  v3[7] = &unk_270C6ED30;
  v2[8] = &unk_270C6EB80;
  v2[9] = &unk_270C6EB98;
  v3[8] = &unk_270C6ED48;
  v3[9] = &unk_270C6EC10;
  v2[10] = &unk_270C6EBB0;
  v2[11] = &unk_270C6EBC8;
  v3[10] = &unk_270C6EB38;
  v3[11] = &unk_270C6EE80;
  v2[12] = &unk_270C6EBE0;
  v2[13] = &unk_270C6EBF8;
  v3[12] = &unk_270C6EAD8;
  v3[13] = &unk_270C6EB08;
  v2[14] = &unk_270C6EC10;
  v2[15] = &unk_270C6EC28;
  v3[14] = &unk_270C6EC88;
  v3[15] = &unk_270C6EC40;
  v2[16] = &unk_270C6EC40;
  v2[17] = &unk_270C6EC58;
  v3[16] = &unk_270C6EC70;
  v3[17] = &unk_270C6ED78;
  v2[18] = &unk_270C6EC70;
  v2[19] = &unk_270C6EC88;
  v3[18] = &unk_270C6EDA8;
  v3[19] = &unk_270C6EAC0;
  v2[20] = &unk_270C6ECA0;
  v2[21] = &unk_270C6ECB8;
  v3[20] = &unk_270C6EE98;
  v3[21] = &unk_270C6EE08;
  v2[22] = &unk_270C6ECE8;
  v2[23] = &unk_270C6ED00;
  v3[22] = &unk_270C6EB50;
  v3[23] = &unk_270C6EBB0;
  v2[24] = &unk_270C6ED18;
  v2[25] = &unk_270C6ED30;
  v3[24] = &unk_270C6EBC8;
  v3[25] = &unk_270C6EEB0;
  v2[26] = &unk_270C6ED48;
  v2[27] = &unk_270C6ED60;
  v3[26] = &unk_270C6EBE0;
  v3[27] = &unk_270C6ECB8;
  v2[28] = &unk_270C6ED78;
  v2[29] = &unk_270C6ED90;
  v3[28] = &unk_270C6ECE8;
  v3[29] = &unk_270C6ECA0;
  v2[30] = &unk_270C6EDA8;
  v2[31] = &unk_270C6EDC0;
  v3[30] = &unk_270C6EEC8;
  v3[31] = &unk_270C6ED00;
  v2[32] = &unk_270C6EDD8;
  v2[33] = &unk_270C6EDF0;
  v3[32] = &unk_270C6ED18;
  v3[33] = &unk_270C6EEE0;
  v2[34] = &unk_270C6EE08;
  v2[35] = &unk_270C6EE20;
  v3[34] = &unk_270C6EDC0;
  v3[35] = &unk_270C6EE20;
  v2[36] = &unk_270C6EE38;
  v2[37] = &unk_270C6EE50;
  v3[36] = &unk_270C6EEF8;
  v3[37] = &unk_270C6EE20;
  v2[38] = &unk_270C6EE68;
  v2[39] = &unk_270C6ECD0;
  v3[38] = &unk_270C6EC58;
  v3[39] = &unk_270C6EE08;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:40];
  v1 = (void *)_convertKeyboardLanguageToHIDCountryCode__countryCodeMap;
  _convertKeyboardLanguageToHIDCountryCode__countryCodeMap = v0;
}

+ (id)convertHIDCountryCodeToLanguage:(int64_t)a3
{
  if (convertHIDCountryCodeToLanguage__onceToken != -1) {
    dispatch_once(&convertHIDCountryCodeToLanguage__onceToken, &__block_literal_global_519);
  }
  id v4 = (void *)convertHIDCountryCodeToLanguage__countryCodeMap;
  char v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

void __52__TypistHWKeyboard_convertHIDCountryCodeToLanguage___block_invoke()
{
  v3[36] = *MEMORY[0x263EF8340];
  v2[0] = &unk_270C6EAF0;
  v2[1] = &unk_270C6EB98;
  v3[0] = &unk_270C6EAF0;
  v3[1] = &unk_270C6EAC0;
  v2[2] = &unk_270C6EB80;
  v2[3] = &unk_270C6EC28;
  v3[2] = &unk_270C6EB08;
  v3[3] = &unk_270C6EB20;
  v2[4] = &unk_270C6EBF8;
  v2[5] = &unk_270C6EDF0;
  v3[4] = &unk_270C6EB38;
  v3[5] = &unk_270C6EB50;
  v2[6] = &unk_270C6EDD8;
  v2[7] = &unk_270C6ED30;
  v3[6] = &unk_270C6EAD8;
  v3[7] = &unk_270C6EB68;
  v2[8] = &unk_270C6ED48;
  v2[9] = &unk_270C6EC10;
  v3[8] = &unk_270C6EB80;
  v3[9] = &unk_270C6EB98;
  v2[10] = &unk_270C6EB38;
  v2[11] = &unk_270C6EAD8;
  v3[10] = &unk_270C6EBB0;
  v3[11] = &unk_270C6EBE0;
  v2[12] = &unk_270C6EB08;
  v2[13] = &unk_270C6EC88;
  v3[12] = &unk_270C6EBF8;
  v3[13] = &unk_270C6EC10;
  v2[14] = &unk_270C6EC40;
  v2[15] = &unk_270C6EC70;
  v3[14] = &unk_270C6EC28;
  v3[15] = &unk_270C6EC40;
  v2[16] = &unk_270C6ED78;
  v2[17] = &unk_270C6EDA8;
  v3[16] = &unk_270C6EC58;
  v3[17] = &unk_270C6EC70;
  v2[18] = &unk_270C6EAC0;
  v2[19] = &unk_270C6EE08;
  v3[18] = &unk_270C6EC88;
  v3[19] = &unk_270C6ECD0;
  v2[20] = &unk_270C6EB50;
  v2[21] = &unk_270C6EBB0;
  v3[20] = &unk_270C6ECE8;
  v3[21] = &unk_270C6ED00;
  v2[22] = &unk_270C6EBC8;
  v2[23] = &unk_270C6EBE0;
  v3[22] = &unk_270C6ED18;
  v3[23] = &unk_270C6ED48;
  v2[24] = &unk_270C6ECB8;
  v2[25] = &unk_270C6ECE8;
  v3[24] = &unk_270C6ED60;
  v3[25] = &unk_270C6ED78;
  v2[26] = &unk_270C6ECA0;
  v2[27] = &unk_270C6ED00;
  v3[26] = &unk_270C6ED90;
  v3[27] = &unk_270C6EDC0;
  v2[28] = &unk_270C6ED18;
  v2[29] = &unk_270C6EDC0;
  v3[28] = &unk_270C6EDD8;
  v3[29] = &unk_270C6EE08;
  v2[30] = &unk_270C6EE20;
  v2[31] = &unk_270C6EEF8;
  v3[30] = &unk_270C6EE50;
  v3[31] = &unk_270C6EE38;
  v2[32] = &unk_270C6EEE0;
  v2[33] = &unk_270C6EEC8;
  v3[32] = &unk_270C6EDF0;
  v3[33] = &unk_270C6EDA8;
  v2[34] = &unk_270C6EE98;
  v2[35] = &unk_270C6EE80;
  v3[34] = &unk_270C6ECA0;
  v3[35] = &unk_270C6EBC8;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:36];
  v1 = (void *)convertHIDCountryCodeToLanguage__countryCodeMap;
  convertHIDCountryCodeToLanguage__countryCodeMap = v0;
}

- (double)typeInterval
{
  return self->_typeInterval;
}

- (void)setTypeInterval:(double)a3
{
  self->_typeInterval = a3;
}

- (double)pressDuration
{
  return self->_pressDuration;
}

- (void)setPressDuration:(double)a3
{
  self->_pressDuration = a3;
}

- (__GSKeyboard)hardwareKeyboard
{
  return self->_hardwareKeyboard;
}

- (void)setHardwareKeyboard:(__GSKeyboard *)a3
{
  self->_hardwareKeyboard = a3;
}

- (NSMutableDictionary)characterToKeycodeMap
{
  return self->_characterToKeycodeMap;
}

- (void)setCharacterToKeycodeMap:(id)a3
{
}

- (unsigned)hidKeyboardType
{
  return self->_hidKeyboardType;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(unsigned __int8)a3
{
  self->_usagePage = a3;
}

- (NSNumber)keyboardCountryCode
{
  return self->_keyboardCountryCode;
}

- (void)setKeyboardCountryCode:(id)a3
{
}

- (NSNumber)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (NSString)keyboardLanguageString
{
  return self->_keyboardLanguageString;
}

- (void)setKeyboardLanguageString:(id)a3
{
}

- (NSDictionary)propertyDictionary
{
  return self->_propertyDictionary;
}

- (void)setPropertyDictionary:(id)a3
{
}

- (NSString)propertyDictionaryString
{
  return self->_propertyDictionaryString;
}

- (void)setPropertyDictionaryString:(id)a3
{
}

- (NSDictionary)modifierCharMap
{
  return self->_modifierCharMap;
}

- (void)setModifierCharMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifierCharMap, 0);
  objc_storeStrong((id *)&self->_propertyDictionaryString, 0);
  objc_storeStrong((id *)&self->_propertyDictionary, 0);
  objc_storeStrong((id *)&self->_keyboardLanguageString, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardCountryCode, 0);
  objc_storeStrong((id *)&self->_characterToKeycodeMap, 0);
}

- (id)getPropertyDictionaryString
{
  uint64_t v2 = [(TypistHWKeyboard *)self propertyDictionaryString];
  unint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (id)usagePairsForText:(id)a3
{
  unint64_t v3 = [(TypistHWKeyboard *)self _generateKeystrokeStream:a3 appendTypeInterval:0];
  id v4 = [v3 componentsSeparatedByString:@"bx "];
  char v5 = [v4 arrayByExcludingObjectsInArray:&unk_270C6F7F8];

  id v6 = objc_alloc_init(TYUsagePairs);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__TypistHWKeyboard_RecapSPIs__usagePairsForText___block_invoke;
  v9[3] = &unk_265559928;
  uint64_t v7 = v6;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __49__TypistHWKeyboard_RecapSPIs__usagePairsForText___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 componentsSeparatedByString:@"/"];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unsigned int v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = (id)objc_opt_new();
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  uint64_t v12 = __Block_byref_object_dispose__2;
  id v13 = (id)objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__TypistHWKeyboard_RecapSPIs__usagePairsForText___block_invoke_91;
  v7[3] = &unk_265559900;
  v7[4] = &v14;
  v7[5] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  char v5 = [*(id *)(a1 + 32) _usagePages];
  [v5 addObject:v15[5]];

  id v6 = [*(id *)(a1 + 32) _usages];
  [v6 addObject:v9[5]];

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

void __49__TypistHWKeyboard_RecapSPIs__usagePairsForText___block_invoke_91(uint64_t a1, void *a2)
{
  id v3 = [a2 componentsSeparatedByString:@","];
  id v4 = (void *)MEMORY[0x263F08B08];
  char v5 = [v3 objectAtIndexedSubscript:0];
  id v6 = [v4 scannerWithString:v5];

  uint64_t v14 = 0;
  [v6 scanHexInt:(char *)&v14 + 4];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v8 = [NSNumber numberWithUnsignedInt:HIDWORD(v14)];
  [v7 addObject:v8];

  uint64_t v9 = (void *)MEMORY[0x263F08B08];
  uint64_t v10 = [v3 objectAtIndexedSubscript:1];
  id v11 = [v9 scannerWithString:v10];

  [v11 scanHexInt:&v14];
  uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v13 = [NSNumber numberWithUnsignedInt:v14];
  [v12 addObject:v13];
}

void __79__TypistHWKeyboard_Deprecated_initWithCountryCode_andPropertyDictionaryAtPath___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x263F1C748] sharedInputModeController];
  uint64_t v2 = [v4 hardwareInputMode];
  id v3 = [v2 automaticHardwareLayout];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

uint64_t __79__TypistHWKeyboard_Deprecated_initWithCountryCode_andPropertyDictionaryAtPath___block_invoke_2()
{
  return [MEMORY[0x263F08B88] sleepForTimeInterval:0.02];
}

void __38__TypistHWKeyboard_Deprecated_detach___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) emulatedKeyboard];
  CFRunLoopGetMain();
  IOHIDUserDeviceUnscheduleFromRunLoop();
  uint64_t v2 = [*(id *)(a1 + 32) keyboardCountryCode];
  [v2 unsignedIntValue];
  GSEventSetHardwareKeyboardAttached();

  CFRelease((CFTypeRef)[*(id *)(a1 + 32) emulatedKeyboard]);
  [*(id *)(a1 + 32) hardwareKeyboard];
  GSKeyboardRelease();
  [*(id *)(a1 + 32) setKeyboardCountryCode:0];
  [*(id *)(a1 + 32) setCharacterToKeycodeMap:0];
  [*(id *)(a1 + 32) setTypistHWKeyboardQueue:0];
  [*(id *)(a1 + 32) setGroup:0];
  [*(id *)(a1 + 32) setEmulatedModel:0];
  dispatch_time_t v3 = dispatch_time(0, 200000000);
  if (*(void *)(a1 + 40)) {
    id v4 = *(void **)(a1 + 40);
  }
  else {
    id v4 = &__block_literal_global_88;
  }
  char v5 = MEMORY[0x263EF83A0];
  dispatch_after(v3, v5, v4);
}

void __38__TypistHWKeyboard_Deprecated_detach___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void __46__TypistHWKeyboard_Deprecated_modifierCharMap__block_invoke()
{
  v7[4] = *MEMORY[0x263EF8340];
  v6[0] = @"⌥";
  uint64_t v0 = [NSNumber numberWithUnsignedInt:4];
  v7[0] = v0;
  v6[1] = @"⇧";
  v1 = [NSNumber numberWithUnsignedInt:2];
  v7[1] = v1;
  v6[2] = @"⌘";
  uint64_t v2 = [NSNumber numberWithUnsignedInt:8];
  v7[2] = v2;
  v6[3] = @"⌃";
  dispatch_time_t v3 = [NSNumber numberWithUnsignedInt:1];
  v7[3] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  char v5 = (void *)modifierCharMap_modifierCharMap;
  modifierCharMap_modifierCharMap = v4;
}

void __53__TypistHWKeyboard_Deprecated_typeString_completion___block_invoke(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = (void *)a1[5];
    dispatch_time_t v3 = objc_msgSend(v2, "generateKeystrokeStream:");
    [v2 typeKeyStrokeStream:v3];
  }
  dispatch_time_t v4 = dispatch_time(0, 200000000);
  if (a1[6]) {
    char v5 = (void *)a1[6];
  }
  else {
    char v5 = &__block_literal_global_234;
  }
  id v6 = MEMORY[0x263EF83A0];
  dispatch_after(v4, v6, v5);
}

void __58__TypistHWKeyboard_Deprecated_pressAndHoldKey_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "generateKeystrokeStream:");
    dispatch_time_t v3 = objc_msgSend(v2, "subarrayWithRange:", 0, objc_msgSend(v2, "count") - 1);

    [*(id *)(a1 + 40) typeKeyStrokeStream:v3];
  }
  dispatch_time_t v4 = dispatch_time(0, 200000000);
  if (*(void *)(a1 + 48)) {
    char v5 = *(void **)(a1 + 48);
  }
  else {
    char v5 = &__block_literal_global_236;
  }
  id v6 = MEMORY[0x263EF83A0];
  dispatch_after(v4, v6, v5);
}

void __61__TypistHWKeyboard_Deprecated_releaseKeyPressWithCompletion___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  dispatch_time_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", 0, @"keyCode");
  v9[1] = @"modifier";
  v10[0] = v3;
  dispatch_time_t v4 = [NSNumber numberWithUnsignedShort:0];
  v10[1] = v4;
  char v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v2 typeKeyStrokeStream:v6];

  dispatch_time_t v7 = dispatch_time(0, 200000000);
  if (*(void *)(a1 + 40)) {
    uint64_t v8 = *(void **)(a1 + 40);
  }
  else {
    uint64_t v8 = &__block_literal_global_238;
  }
  dispatch_after(v7, MEMORY[0x263EF83A0], v8);
}

void __51__TypistHWKeyboard_Deprecated_keyboardCountryCodes__block_invoke()
{
  uint64_t v0 = (void *)keyboardCountryCodes_keyboardCountryCodes;
  keyboardCountryCodes_keyboardCountryCodes = (uint64_t)&unk_270C6FB70;
}

@end