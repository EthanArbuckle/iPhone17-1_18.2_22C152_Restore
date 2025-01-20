@interface TypistHWKeyboard_Deprecated
+ (id)_determineAppropriatePropertyDictionaryForHWModelStr:(id)a3;
+ (id)_getModifierMaskMap;
+ (id)keyboardCountryCodes;
+ (id)modifierCharMap;
+ (unsigned)GSEventMaskToKeyboardMask:(unsigned int)a3;
+ (unsigned)_convertCountryCodeToHIDKeyboardType:(unsigned __int8)a3;
+ (unsigned)_convertGSKeyboardTypeToIOHIDKeyboardType:(unsigned __int8)a3;
+ (unsigned)_convertHIDKeyboardTypeToGSKeyboardType:(unsigned int)a3;
- (NSMutableDictionary)characterToKeycodeMap;
- (NSNumber)keyboardCountryCode;
- (NSString)emulatedModel;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)TypistHWKeyboardQueue;
- (TypistHWKeyboard_Deprecated)initWithCountryCode:(id)a3;
- (TypistHWKeyboard_Deprecated)initWithCountryCode:(id)a3 andPropertyDictionaryAtPath:(id)a4;
- (__GSKeyboard)hardwareKeyboard;
- (__IOHIDUserDevice)emulatedKeyboard;
- (double)typeInterval;
- (id)generateKeystrokeStream:(id)a3;
- (id)generateKeystrokeStream:(id)a3 position:(int *)a4;
- (unsigned)hidKeyboardType;
- (void)_insertKey:(unsigned __int16)a3 gsKeyInfo:(id *)a4;
- (void)_setupCharacterToKeycodeMap;
- (void)detach:(id)a3;
- (void)pressAndHoldKey:(id)a3 completion:(id)a4;
- (void)releaseKeyPressWithCompletion:(id)a3;
- (void)setCharacterToKeycodeMap:(id)a3;
- (void)setEmulatedKeyboard:(__IOHIDUserDevice *)a3;
- (void)setEmulatedModel:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHardwareKeyboard:(__GSKeyboard *)a3;
- (void)setHidKeyboardType:(unsigned int)a3;
- (void)setKeyboardCountryCode:(id)a3;
- (void)setTypeInterval:(double)a3;
- (void)setTypistHWKeyboardQueue:(id)a3;
- (void)typeKeyStrokeStream:(id)a3;
- (void)typeString:(id)a3 completion:(id)a4;
@end

@implementation TypistHWKeyboard_Deprecated

- (TypistHWKeyboard_Deprecated)initWithCountryCode:(id)a3 andPropertyDictionaryAtPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [(TypistHWKeyboard_Deprecated *)self setEmulatedModel:v7];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 pathForResource:v7 ofType:@"plist"];

    v10 = (void *)MEMORY[0x263EFF9A0];
    v11 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v9];
    v12 = [v10 dictionaryWithDictionary:v11];

    [v12 setValue:v6 forKey:@"CountryCode"];
    uint64_t v13 = IOHIDUserDeviceCreate();
    uint64_t v14 = +[TypistHWKeyboard_Deprecated _convertCountryCodeToHIDKeyboardType:](TypistHWKeyboard_Deprecated, "_convertCountryCodeToHIDKeyboardType:", [v6 unsignedIntValue]);
    +[TypistHWKeyboard_Deprecated _convertHIDKeyboardTypeToGSKeyboardType:v14];
    [(TypistHWKeyboard_Deprecated *)self setHidKeyboardType:v14];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __79__TypistHWKeyboard_Deprecated_initWithCountryCode_andPropertyDictionaryAtPath___block_invoke;
    v28[3] = &unk_265559710;
    v28[4] = &v29;
    +[TypistKeyboardUtilities runOnMainThread:v28];
    TYLog(@"HWKeyboardEumlator: Layout: %@, keyboardType: %u", v15, v16, v17, v18, v19, v20, v21, v30[3]);
    [(TypistHWKeyboard_Deprecated *)self setEmulatedKeyboard:v13];
    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(TypistHWKeyboard_Deprecated *)self setCharacterToKeycodeMap:v22];

    [(TypistHWKeyboard_Deprecated *)self setHardwareKeyboard:GSKeyboardCreate()];
    [(TypistHWKeyboard_Deprecated *)self setKeyboardCountryCode:v6];
    dispatch_group_t v23 = dispatch_group_create();
    [(TypistHWKeyboard_Deprecated *)self setGroup:v23];

    v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v25 = dispatch_queue_create("TypistHWKeyboard.queue", v24);
    dispatch_async(v25, &__block_literal_global_7);

    [(TypistHWKeyboard_Deprecated *)self setTypistHWKeyboardQueue:v25];
    [(TypistHWKeyboard_Deprecated *)self _setupCharacterToKeycodeMap];
    [v6 unsignedIntValue];
    GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType();
    [(TypistHWKeyboard_Deprecated *)self emulatedKeyboard];
    CFRunLoopGetMain();
    IOHIDUserDeviceScheduleWithRunLoop();
    [(TypistHWKeyboard_Deprecated *)self setTypeInterval:0.02];
    v26 = self;
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (TypistHWKeyboard_Deprecated)initWithCountryCode:(id)a3
{
  id v4 = a3;
  v5 = +[TypistKeyboardUtilities getMobileGestalt:@"HWModelStr"];
  id v6 = +[TypistHWKeyboard_Deprecated _determineAppropriatePropertyDictionaryForHWModelStr:v5];

  id v7 = [(TypistHWKeyboard_Deprecated *)self initWithCountryCode:v4 andPropertyDictionaryAtPath:v6];
  return v7;
}

- (void)detach:(id)a3
{
  id v4 = a3;
  v5 = [(TypistHWKeyboard_Deprecated *)self group];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__TypistHWKeyboard_Deprecated_detach___block_invoke;
  v7[3] = &unk_265559B20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(v5, MEMORY[0x263EF83A0], v7);
}

+ (id)_determineAppropriatePropertyDictionaryForHWModelStr:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"J207"]
    && [v3 caseInsensitiveCompare:@"J208"]
    && [v3 caseInsensitiveCompare:@"J217"]
    && [v3 caseInsensitiveCompare:@"J218"])
  {
    if ([v3 caseInsensitiveCompare:@"J98A"]
      && [v3 caseInsensitiveCompare:@"J99A"]
      && [v3 caseInsensitiveCompare:@"J120"]
      && [v3 caseInsensitiveCompare:@"J121"])
    {
      if ([v3 caseInsensitiveCompare:@"J127"]
        && [v3 caseInsensitiveCompare:@"J128"]
        && [v3 caseInsensitiveCompare:@"J210"]
        && [v3 caseInsensitiveCompare:@"J211"]
        && [v3 caseInsensitiveCompare:@"J96"]
        && [v3 caseInsensitiveCompare:@"J97"])
      {
        if ([v3 caseInsensitiveCompare:@"J317"]
          && [v3 caseInsensitiveCompare:@"J318"]
          && [v3 caseInsensitiveCompare:@"J317x"]
          && [v3 caseInsensitiveCompare:@"J318x"])
        {
          if ([v3 caseInsensitiveCompare:@"J320"]
            && [v3 caseInsensitiveCompare:@"J321"])
          {
            id v4 = 0;
          }
          else
          {
            id v4 = @"R98";
          }
        }
        else
        {
          id v4 = @"R88";
        }
      }
      else
      {
        id v4 = @"B259";
      }
    }
    else
    {
      id v4 = @"B249";
    }
  }
  else
  {
    id v4 = @"R119";
  }

  return v4;
}

+ (unsigned)_convertGSKeyboardTypeToIOHIDKeyboardType:(unsigned __int8)a3
{
  if (a3 == 202) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  if (a3 == 203) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = v3;
  }
  if (a3 == 207) {
    return 2;
  }
  else {
    return v4;
  }
}

+ (unsigned)_convertHIDKeyboardTypeToGSKeyboardType:(unsigned int)a3
{
  unsigned int v3 = 0xCFCBCAu >> (8 * a3);
  if (a3 >= 3) {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (id)modifierCharMap
{
  if (modifierCharMap_onceToken != -1) {
    dispatch_once(&modifierCharMap_onceToken, &__block_literal_global_165);
  }
  v2 = (void *)modifierCharMap_modifierCharMap;
  return v2;
}

- (void)_insertKey:(unsigned __int16)a3 gsKeyInfo:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  __int16 v33 = 0;
  [(TypistHWKeyboard_Deprecated *)self hardwareKeyboard];
  var5 = a4->var5;
  var7 = a4->var7;
  p_var8 = &a4->var8;
  a4 = ($1F3A801B121D84C13238675D2BD4CA58 *)((char *)a4 + 110);
  GSKeyboardTranslateKeyExtended();
  [(TypistHWKeyboard_Deprecated *)self hardwareKeyboard];
  GSKeyboardTranslateKeyExtended();
  v10 = objc_msgSend(NSString, "stringWithUTF8String:", var5, &v33, v38, p_var8, a4);
  v11 = [NSString stringWithUTF8String:var7];
  v12 = [NSString stringWithUTF8String:v38];
  uint64_t v32 = [NSString stringWithUTF8String:a4];
  TYLog(@"keyCode: %#x, characters: %@, unmodifiedCharacters: %@, shiftModifiedCharacters: %@, markedCharacters: %@ \n", v13, v14, v15, v16, v17, v18, v19, v5);

  uint64_t v20 = [NSString stringWithUTF8String:var7];

  if (v20)
  {
    uint64_t v21 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
    v36[0] = @"keyCode";
    id v22 = [NSNumber numberWithUnsignedShort:v5];
    v36[1] = @"modifier";
    v37[0] = v22;
    dispatch_group_t v23 = [NSNumber numberWithUnsignedShort:0];
    v37[1] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    v25 = [NSString stringWithUTF8String:var7];
    [v21 setObject:v24 forKey:v25];
  }
  v26 = [NSString stringWithUTF8String:v38];

  if (v26)
  {
    v27 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
    v34[0] = @"keyCode";
    v28 = [NSNumber numberWithUnsignedShort:v5];
    v34[1] = @"modifier";
    v35[0] = v28;
    uint64_t v29 = [NSNumber numberWithUnsignedShort:2];
    v35[1] = v29;
    v30 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v31 = [NSString stringWithUTF8String:v38];
    [v27 setObject:v30 forKey:v31];
  }
}

- (void)_setupCharacterToKeycodeMap
{
  v65[2] = *MEMORY[0x263EF8340];
  v43 = malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
  unsigned __int16 v3 = 4;
  while (2)
  {
    switch(v3)
    {
      case '(':
        unsigned __int8 v4 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v60[0] = @"keyCode";
        uint64_t v5 = [NSNumber numberWithUnsignedShort:40];
        v60[1] = @"modifier";
        v61[0] = v5;
        id v6 = [NSNumber numberWithUnsignedShort:0];
        v61[1] = v6;
        id v7 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
        id v8 = v4;
        v9 = v7;
        v10 = @"⏎";
        goto LABEL_10;
      case ')':
        v11 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v64[0] = @"keyCode";
        v12 = [NSNumber numberWithUnsignedShort:41];
        v64[1] = @"modifier";
        v65[0] = v12;
        uint64_t v13 = [NSNumber numberWithUnsignedShort:0];
        v65[1] = v13;
        uint64_t v14 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
        [v11 setObject:v14 forKey:@"␛"];

        goto LABEL_11;
      case '*':
        unsigned __int8 v4 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v62[0] = @"keyCode";
        uint64_t v5 = [NSNumber numberWithUnsignedShort:42];
        v62[1] = @"modifier";
        v63[0] = v5;
        id v6 = [NSNumber numberWithUnsignedShort:0];
        v63[1] = v6;
        id v7 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
        id v8 = v4;
        v9 = v7;
        v10 = @"⌫";
        goto LABEL_10;
      case '+':
        unsigned __int8 v4 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v58[0] = @"keyCode";
        uint64_t v5 = [NSNumber numberWithUnsignedShort:43];
        v58[1] = @"modifier";
        v59[0] = v5;
        id v6 = [NSNumber numberWithUnsignedShort:0];
        v59[1] = v6;
        id v7 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
        id v8 = v4;
        v9 = v7;
        v10 = @"⇥";
        goto LABEL_10;
      case ',':
        unsigned __int8 v4 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v54[0] = @"keyCode";
        uint64_t v5 = [NSNumber numberWithUnsignedShort:44];
        v54[1] = @"modifier";
        v55[0] = v5;
        id v6 = [NSNumber numberWithUnsignedShort:0];
        v55[1] = v6;
        id v7 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
        id v8 = v4;
        v9 = v7;
        v10 = @" ";
LABEL_10:
        [v8 setObject:v9 forKey:v10];

        goto LABEL_11;
      default:
        if (v3 != 57)
        {
          [(TypistHWKeyboard_Deprecated *)self _insertKey:v3 gsKeyInfo:v43];
LABEL_11:
          unsigned int v15 = v3++;
          if (v15 >= 0x39) {
            goto LABEL_12;
          }
          continue;
        }
        uint64_t v39 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v56[0] = @"keyCode";
        v40 = [NSNumber numberWithUnsignedShort:57];
        v56[1] = @"modifier";
        v57[0] = v40;
        v41 = [NSNumber numberWithUnsignedShort:0];
        v57[1] = v41;
        v42 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
        [v39 setObject:v42 forKey:@"⇪"];

LABEL_12:
        if ([(TypistHWKeyboard_Deprecated *)self hidKeyboardType] == 2)
        {
          uint64_t v16 = v43;
          [(TypistHWKeyboard_Deprecated *)self _insertKey:135 gsKeyInfo:v43];
          uint64_t v17 = 137;
          goto LABEL_16;
        }
        uint64_t v16 = v43;
        if ([(TypistHWKeyboard_Deprecated *)self hidKeyboardType] == 1)
        {
          uint64_t v17 = 100;
LABEL_16:
          [(TypistHWKeyboard_Deprecated *)self _insertKey:v17 gsKeyInfo:v16];
        }
        uint64_t v18 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v52[0] = @"keyCode";
        uint64_t v19 = [NSNumber numberWithUnsignedShort:79];
        v52[1] = @"modifier";
        v53[0] = v19;
        uint64_t v20 = [NSNumber numberWithUnsignedShort:0];
        v53[1] = v20;
        uint64_t v21 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
        [v18 setObject:v21 forKey:@"→"];

        id v22 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v50[0] = @"keyCode";
        dispatch_group_t v23 = [NSNumber numberWithUnsignedShort:80];
        v50[1] = @"modifier";
        v51[0] = v23;
        v24 = [NSNumber numberWithUnsignedShort:0];
        v51[1] = v24;
        v25 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
        [v22 setObject:v25 forKey:@"←"];

        v26 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v48[0] = @"keyCode";
        v27 = [NSNumber numberWithUnsignedShort:81];
        v48[1] = @"modifier";
        v49[0] = v27;
        v28 = [NSNumber numberWithUnsignedShort:0];
        v49[1] = v28;
        uint64_t v29 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
        [v26 setObject:v29 forKey:@"↓"];

        v30 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v46[0] = @"keyCode";
        uint64_t v31 = [NSNumber numberWithUnsignedShort:82];
        v46[1] = @"modifier";
        v47[0] = v31;
        uint64_t v32 = [NSNumber numberWithUnsignedShort:0];
        v47[1] = v32;
        __int16 v33 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
        [v30 setObject:v33 forKey:@"↑"];

        v34 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v44[0] = @"keyCode";
        v35 = [NSNumber numberWithUnsignedShort:0];
        v45[0] = v35;
        v44[1] = @"modifier";
        v36 = [NSNumber numberWithUnsignedShort:0];
        v45[1] = v36;
        v44[2] = @"globeKey";
        v37 = [NSNumber numberWithUnsignedShort:2];
        v45[2] = v37;
        v38 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
        [v34 setObject:v38 forKey:@"⌨"];

        free(v16);
        return;
    }
  }
}

+ (unsigned)GSEventMaskToKeyboardMask:(unsigned int)a3
{
  return HIWORD(a3);
}

- (id)generateKeystrokeStream:(id)a3 position:(int *)a4
{
  v58[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = *a4;
  if ([v6 length] <= v7)
  {
    v56[0] = @"keyCode";
    id v8 = [NSNumber numberWithUnsignedShort:0];
    v56[1] = @"modifier";
    v57[0] = v8;
    v11 = [NSNumber numberWithUnsignedShort:0];
    v57[1] = v11;
    id v14 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
    v58[0] = v14;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:1];
  }
  else
  {
    id v8 = +[TypistHWKeyboard_Deprecated modifierCharMap];
    __int16 v48 = [v6 characterAtIndex:*a4];
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    v10 = [NSString stringWithCharacters:&v48 length:1];
    v11 = [v8 objectForKey:v10];

    if (v11)
    {
      id v40 = v9;
      ++*a4;
      v12 = [(TypistHWKeyboard_Deprecated *)self generateKeystrokeStream:v6 position:a4];
      int v13 = [v11 unsignedShortValue];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        v42 = v11;
        v37 = v8;
        id v38 = v6;
        int v17 = 0;
        uint64_t v18 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v45 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            uint64_t v21 = objc_msgSend(v20, "objectForKey:", @"keyCode", v37);
            v17 |= [v21 unsignedShortValue];

            id v22 = [v20 objectForKey:@"modifier"];
            v13 |= [v22 unsignedShortValue];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v55 count:16];
        }
        while (v16);
        id v8 = v37;
        id v6 = v38;
        v11 = v42;
      }
      else
      {
        LOWORD(v17) = 0;
      }

      v53[0] = @"keyCode";
      v25 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v17];
      v53[1] = @"modifier";
      v54[0] = v25;
      v26 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v13];
      v54[1] = v26;
      v27 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
      id v9 = v40;
    }
    else
    {
      dispatch_group_t v23 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
      v24 = [NSString stringWithCharacters:&v48 length:1];
      id v14 = [v23 objectForKey:v24];

      if (v14)
      {
        [v9 addObject:v14];
      }
      else
      {
        uint64_t v43 = [NSString stringWithCharacters:&v48 length:1];
        [(TypistHWKeyboard_Deprecated *)self hardwareKeyboard];
        GSKeyboardHWKeyboardNormalizeInput();
        v28 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v41 = [v28 objectForKey:v43];

        v51[0] = @"keyCode";
        uint64_t v39 = objc_msgSend(v41, "objectForKey:");
        v51[1] = @"modifier";
        v52[0] = v39;
        uint64_t v29 = +[TypistHWKeyboard_Deprecated _getModifierMaskMap];
        v30 = [NSNumber numberWithUnsignedInt:0];
        [v29 objectForKey:v30];
        v32 = uint64_t v31 = v8;
        v52[1] = v32;
        __int16 v33 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];

        id v8 = v31;
        v34 = [(TypistHWKeyboard_Deprecated *)self characterToKeycodeMap];
        v35 = [NSString stringWithCharacters:&v48 length:1];
        [v34 setObject:v33 forKey:v35];

        [v9 addObject:v33];
      }
      v49[0] = @"keyCode";
      v25 = [NSNumber numberWithUnsignedShort:0];
      v49[1] = @"modifier";
      v50[0] = v25;
      v26 = [NSNumber numberWithUnsignedShort:0];
      v50[1] = v26;
      v27 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
      v11 = 0;
    }
    [v9 addObject:v27];
  }
  return v9;
}

- (id)generateKeystrokeStream:(id)a3
{
  unsigned __int8 v4 = [a3 stringByReplacingOccurrencesOfString:@"\t" withString:@"⇥"];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"⏎"];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v11 = 0;
  if ([v5 length])
  {
    do
    {
      unint64_t v7 = [(TypistHWKeyboard_Deprecated *)self generateKeystrokeStream:v5 position:&v11];
      [v6 addObjectsFromArray:v7];
      int v8 = [v7 count];
      int v11 = v8 + v11 - 1;

      unint64_t v9 = v11;
    }
    while ([v5 length] > v9);
  }

  return v6;
}

- (void)typeKeyStrokeStream:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v9 = [v8 objectForKey:@"modifier"];
        char v10 = [v9 unsignedShortValue];

        int v11 = [v8 objectForKey:@"keyCode"];
        char v12 = [v11 unsignedShortValue];

        int v13 = [v8 objectForKey:@"globeKey"];
        if (v13)
        {
          id v14 = [v8 objectForKey:@"globeKey"];
          char v15 = [v14 unsignedShortValue];
        }
        else
        {
          char v15 = 0;
        }

        uint64_t v16 = (void *)MEMORY[0x263F08B88];
        [(TypistHWKeyboard_Deprecated *)self typeInterval];
        objc_msgSend(v16, "sleepForTimeInterval:");
        char v23 = 1;
        char v24 = v10;
        char v25 = 0;
        char v26 = v12;
        int v27 = 0;
        char v28 = 0;
        char v29 = v15;
        [(TypistHWKeyboard_Deprecated *)self emulatedKeyboard];
        IOHIDUserDeviceHandleReport();
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v5);
  }
  int v17 = (void *)MEMORY[0x263F08B88];
  [(TypistHWKeyboard_Deprecated *)self typeInterval];
  objc_msgSend(v17, "sleepForTimeInterval:");
}

- (void)typeString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TypistHWKeyboard_Deprecated *)self group];
  unint64_t v9 = [(TypistHWKeyboard_Deprecated *)self TypistHWKeyboardQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TypistHWKeyboard_Deprecated_typeString_completion___block_invoke;
  block[3] = &unk_265559B48;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_async(v8, v9, block);
}

- (void)pressAndHoldKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TypistHWKeyboard_Deprecated *)self group];
  unint64_t v9 = [(TypistHWKeyboard_Deprecated *)self TypistHWKeyboardQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TypistHWKeyboard_Deprecated_pressAndHoldKey_completion___block_invoke;
  block[3] = &unk_265559B48;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_async(v8, v9, block);
}

- (void)releaseKeyPressWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TypistHWKeyboard_Deprecated *)self group];
  id v6 = [(TypistHWKeyboard_Deprecated *)self TypistHWKeyboardQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__TypistHWKeyboard_Deprecated_releaseKeyPressWithCompletion___block_invoke;
  v8[3] = &unk_265559B20;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async(v5, v6, v8);
}

+ (id)_getModifierMaskMap
{
  v39[16] = *MEMORY[0x263EF8340];
  id v26 = (id)MEMORY[0x263EFF9A0];
  v37 = [NSNumber numberWithUnsignedInt:0];
  v38[0] = v37;
  v36 = [NSNumber numberWithUnsignedShort:0];
  v39[0] = v36;
  v35 = [NSNumber numberWithUnsignedInt:0x20000];
  v38[1] = v35;
  v34 = [NSNumber numberWithUnsignedShort:2];
  v39[1] = v34;
  __int16 v33 = [NSNumber numberWithUnsignedInt:0x80000];
  v38[2] = v33;
  uint64_t v32 = [NSNumber numberWithUnsignedShort:4];
  v39[2] = v32;
  uint64_t v31 = [NSNumber numberWithUnsignedInt:0x100000];
  v38[3] = v31;
  v30 = [NSNumber numberWithUnsignedShort:1];
  v39[3] = v30;
  char v29 = [NSNumber numberWithUnsignedInt:0x10000];
  v38[4] = v29;
  char v28 = [NSNumber numberWithUnsignedShort:8];
  v39[4] = v28;
  char v25 = [NSNumber numberWithUnsignedInt:655360];
  v38[5] = v25;
  char v24 = [NSNumber numberWithUnsignedShort:6];
  v39[5] = v24;
  char v23 = [NSNumber numberWithUnsignedInt:1179648];
  v38[6] = v23;
  long long v22 = [NSNumber numberWithUnsignedShort:3];
  v39[6] = v22;
  long long v21 = [NSNumber numberWithUnsignedInt:196608];
  v38[7] = v21;
  long long v20 = [NSNumber numberWithUnsignedShort:10];
  v39[7] = v20;
  long long v19 = [NSNumber numberWithUnsignedInt:1572864];
  v38[8] = v19;
  uint64_t v18 = [NSNumber numberWithUnsignedShort:5];
  v39[8] = v18;
  int v17 = [NSNumber numberWithUnsignedInt:589824];
  v38[9] = v17;
  uint64_t v16 = [NSNumber numberWithUnsignedShort:12];
  v39[9] = v16;
  id v15 = [NSNumber numberWithUnsignedInt:1114112];
  v38[10] = v15;
  id v14 = [NSNumber numberWithUnsignedShort:9];
  v39[10] = v14;
  id v13 = [NSNumber numberWithUnsignedInt:1703936];
  v38[11] = v13;
  v2 = [NSNumber numberWithUnsignedShort:7];
  v39[11] = v2;
  unsigned __int16 v3 = [NSNumber numberWithUnsignedInt:720896];
  v38[12] = v3;
  id v4 = [NSNumber numberWithUnsignedShort:14];
  v39[12] = v4;
  uint64_t v5 = [NSNumber numberWithUnsignedInt:1245184];
  v38[13] = v5;
  id v6 = [NSNumber numberWithUnsignedShort:11];
  v39[13] = v6;
  id v7 = [NSNumber numberWithUnsignedInt:1638400];
  v38[14] = v7;
  int v8 = [NSNumber numberWithUnsignedShort:13];
  v39[14] = v8;
  id v9 = [NSNumber numberWithUnsignedInt:1769472];
  v38[15] = v9;
  id v10 = [NSNumber numberWithUnsignedShort:15];
  v39[15] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:16];
  id v27 = [v26 dictionaryWithDictionary:v11];

  return v27;
}

+ (id)keyboardCountryCodes
{
  if (keyboardCountryCodes_onceToken != -1) {
    dispatch_once(&keyboardCountryCodes_onceToken, &__block_literal_global_240);
  }
  v2 = (void *)keyboardCountryCodes_keyboardCountryCodes;
  return v2;
}

+ (unsigned)_convertCountryCodeToHIDKeyboardType:(unsigned __int8)a3
{
  if ((int)a3 > 29) {
    return a3 != 30 && a3 != 33;
  }
  if (a3 != 15) {
    return a3 != 16;
  }
  return 2;
}

- (double)typeInterval
{
  return self->_typeInterval;
}

- (void)setTypeInterval:(double)a3
{
  self->_typeInterval = a3;
}

- (__IOHIDUserDevice)emulatedKeyboard
{
  return self->_emulatedKeyboard;
}

- (void)setEmulatedKeyboard:(__IOHIDUserDevice *)a3
{
  self->_emulatedKeyboard = a3;
}

- (__GSKeyboard)hardwareKeyboard
{
  return self->_hardwareKeyboard;
}

- (void)setHardwareKeyboard:(__GSKeyboard *)a3
{
  self->_hardwareKeyboard = a3;
}

- (NSNumber)keyboardCountryCode
{
  return self->_keyboardCountryCode;
}

- (void)setKeyboardCountryCode:(id)a3
{
}

- (NSMutableDictionary)characterToKeycodeMap
{
  return self->_characterToKeycodeMap;
}

- (void)setCharacterToKeycodeMap:(id)a3
{
}

- (NSString)emulatedModel
{
  return self->_emulatedModel;
}

- (void)setEmulatedModel:(id)a3
{
}

- (unsigned)hidKeyboardType
{
  return self->_hidKeyboardType;
}

- (void)setHidKeyboardType:(unsigned int)a3
{
  self->_hidKeyboardType = a3;
}

- (OS_dispatch_queue)TypistHWKeyboardQueue
{
  return self->_TypistHWKeyboardQueue;
}

- (void)setTypistHWKeyboardQueue:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_TypistHWKeyboardQueue, 0);
  objc_storeStrong((id *)&self->_emulatedModel, 0);
  objc_storeStrong((id *)&self->_characterToKeycodeMap, 0);
  objc_storeStrong((id *)&self->_keyboardCountryCode, 0);
}

@end