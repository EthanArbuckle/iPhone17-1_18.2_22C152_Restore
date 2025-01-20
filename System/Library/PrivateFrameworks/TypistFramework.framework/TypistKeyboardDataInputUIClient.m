@interface TypistKeyboardDataInputUIClient
+ (BOOL)connectToRemoteKeyboard:(double)a3;
+ (BOOL)dismissKeyboard;
+ (BOOL)hasMarkedText;
+ (BOOL)isExtendedCandidateViewMode;
+ (BOOL)switchToKeyboard:(id)a3;
+ (BOOL)switchToPlane:(id)a3;
+ (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4;
+ (CGPoint)floatingKeyboardDraggablePoint;
+ (CGPoint)getCandidateCenter:(id)a3;
+ (CGPoint)getCandidateCenterAtIndex:(int64_t)a3;
+ (CGPoint)getExtendedCandidateViewToggleButtonCenter;
+ (CGRect)findKeyBoundsInKeyboard:(id)a3;
+ (CGRect)getCandidateBarRect;
+ (__n128)getKeyboardScaleTransform;
+ (double)getKeyboardPPM;
+ (id)addKeyboardPopupKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6 keyplaneKeycaps:(id)a7;
+ (id)addKeyboards:(id)a3;
+ (id)dismissOneTimeTIActions:(id)a3;
+ (id)generateKeyplaneSwitchTable:(id)a3;
+ (id)generateKeyplaneSwitchTableFor10Key:(id)a3;
+ (id)getAllCandidates;
+ (id)getKeyboardLayout:(id)a3;
+ (id)getKeyboardUISettings;
+ (id)getKeyplaneDescription:(id)a3;
+ (id)getRepresentedStringFromKey:(id)a3;
+ (id)getSentenceBoundaryStrings;
+ (id)getTIPreferences;
+ (id)getVisibleCandidateList:(id)a3;
+ (id)getVisibleKeyplaneName;
+ (id)markedText;
+ (id)removeKeyboards:(id)a3;
+ (id)setKeyboardUISettings:(id)a3;
+ (id)setKeyboards:(id)a3;
+ (id)setTIPreferences:(id)a3;
+ (void)disconnectFromRemoteKeyboard;
+ (void)showCandidateAtIndex:(int64_t)a3;
+ (void)tryConnection;
@end

@implementation TypistKeyboardDataInputUIClient

+ (BOOL)connectToRemoteKeyboard:(double)a3
{
  if (_inputTeletypeIsLinked_onceToken != -1) {
    dispatch_once(&_inputTeletypeIsLinked_onceToken, &__block_literal_global_2);
  }
  int v4 = _activeConnectionPtr_activeConnectionPtr;
  if (_inputTeletypeIsLinked_linked) {
    BOOL v5 = _activeConnectionPtr_activeConnectionPtr == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    int v4 = [getITTKeyboardProxyClass() connectToRemoteKeyboard:a3];
    _activeConnectionPtr_activeConnectionPtr = v4;
  }
  return v4 != 0;
}

+ (void)disconnectFromRemoteKeyboard
{
  if (_inputTeletypeIsLinked_onceToken != -1) {
    dispatch_once(&_inputTeletypeIsLinked_onceToken, &__block_literal_global_2);
  }
  if (_inputTeletypeIsLinked_linked) {
    BOOL v2 = _activeConnectionPtr_activeConnectionPtr == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    [getITTKeyboardProxyClass() disconnectFromRemoteKeyboard];
    _activeConnectionPtr_activeConnectionPtr = 0;
  }
}

+ (void)tryConnection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__TypistKeyboardDataInputUIClient_tryConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tryConnection_onceToken != -1) {
    dispatch_once(&tryConnection_onceToken, block);
  }
}

uint64_t __48__TypistKeyboardDataInputUIClient_tryConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectToRemoteKeyboard:5.0];
}

+ (id)getKeyboardLayout:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  id v5 = (id)MEMORY[0x263EFFA78];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v27 = [@"ITT" stringByAppendingString:v7];
    v28 = (void *)v7;
    if (objc_opt_respondsToSelector())
    {
      v26 = [v4 performSelector:sel_flickTable];
    }
    else
    {
      v26 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      v25 = [v4 performSelector:sel__flickGestureDirection];
    }
    else
    {
      v25 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      v8 = [v4 performSelector:sel_whiteSpaceRegex];
    }
    else
    {
      v8 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      v9 = [v4 performSelector:sel_multiTapOrbit];
    }
    else
    {
      v9 = 0;
    }
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v10 = (void *)getITTKeyboardConfigurationClass_softClass;
    uint64_t v33 = getITTKeyboardConfigurationClass_softClass;
    if (!getITTKeyboardConfigurationClass_softClass)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __getITTKeyboardConfigurationClass_block_invoke;
      v29[3] = &unk_265559710;
      v29[4] = &v30;
      __getITTKeyboardConfigurationClass_block_invoke((uint64_t)v29);
      v10 = (void *)v31[3];
    }
    v11 = v10;
    _Block_object_dispose(&v30, 8);
    id v12 = [v11 alloc];
    uint64_t v13 = [v4 isTenKey];
    uint64_t v14 = [v4 isKanaKeyboard];
    uint64_t v15 = [v4 flickTyping];
    uint64_t v16 = [v4 shouldShowDictationKey];
    uint64_t v17 = [v4 shouldShowGlobeKey];
    LOBYTE(v24) = [v4 usePopupKeys];
    v18 = (void *)[v12 initWithClassKey:v27 isTenKey:v13 isKana:v14 flickTyping:v15 showDictationKey:v16 showGlobeKey:v17 usePopupKeys:v24 flickTable:v26 flickGestureDirection:v25 whiteSpaceRegex:v8 multiTapOrbit:v9];
    v19 = [getITTKeyboardProxyClass() getKeyboardLayoutWithConfiguration:v18];
    uint64_t v20 = [v19 asPropertyList];
    v21 = (void *)v20;
    v22 = (void *)MEMORY[0x263EFFA78];
    if (v20) {
      v22 = (void *)v20;
    }
    id v5 = v22;
  }
  return v5;
}

+ (id)getTIPreferences
{
  [a1 tryConnection];
  id v2 = (id)MEMORY[0x263EFFA78];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v3 = [getITTKeyboardProxyClass() getTIPreferences];
    id v4 = (void *)v3;
    if (v3) {
      id v5 = (void *)v3;
    }
    else {
      id v5 = v2;
    }
    id v2 = v5;
  }
  return v2;
}

+ (id)getKeyboardUISettings
{
  [a1 tryConnection];
  id v2 = (id)MEMORY[0x263EFFA78];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v3 = [getITTKeyboardProxyClass() getKeyboardUISettings];
    id v4 = (void *)v3;
    if (v3) {
      id v5 = (void *)v3;
    }
    else {
      id v5 = v2;
    }
    id v2 = v5;
  }
  return v2;
}

+ (id)getSentenceBoundaryStrings
{
  [a1 tryConnection];
  id v2 = (id)MEMORY[0x263EFFA78];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v3 = [getITTKeyboardProxyClass() getSentenceBoundaryStrings];
    id v4 = (void *)v3;
    if (v3) {
      id v5 = (void *)v3;
    }
    else {
      id v5 = v2;
    }
    id v2 = v5;
  }
  return v2;
}

+ (id)setTIPreferences:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  id v5 = (id)MEMORY[0x263EFFA78];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__TypistKeyboardDataInputUIClient_setTIPreferences___block_invoke;
    v12[3] = &unk_265559A68;
    id v13 = v6;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v12];
    uint64_t v8 = [getITTKeyboardProxyClass() setTIPreferences:v7];
    v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = v5;
    }
    id v5 = v10;
  }
  return v5;
}

void __52__TypistKeyboardDataInputUIClient_setTIPreferences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [*(id *)(a1 + 32) setObject:v5 forKey:v17];
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v8);
    TYLog(@"WARNING: Unsupported key or value class in -setTIPreferences: key=%@, class(key)=%@, class(obj)=%@", v9, v10, v11, v12, v13, v14, v15, (char)v17);
  }
}

+ (id)setKeyboardUISettings:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  id v5 = (id)MEMORY[0x263EFFA78];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__TypistKeyboardDataInputUIClient_setKeyboardUISettings___block_invoke;
    v12[3] = &unk_265559A68;
    id v13 = v6;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v12];
    uint64_t v8 = [getITTKeyboardProxyClass() setKeyboardUISettings:v7];
    uint64_t v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    else {
      uint64_t v10 = v5;
    }
    id v5 = v10;
  }
  return v5;
}

void __57__TypistKeyboardDataInputUIClient_setKeyboardUISettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [*(id *)(a1 + 32) setObject:v5 forKey:v17];
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v8);
    TYLog(@"WARNING: Unsupported key or value class in -setKeyboardUISettings: key=%@, class(key)=%@, class(obj)=%@", v9, v10, v11, v12, v13, v14, v15, (char)v17);
  }
}

+ (id)setKeyboards:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  id v5 = (id)MEMORY[0x263EFFA68];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v6 = [getITTKeyboardProxyClass() setKeyboards:v4];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = v5;
    }
    id v5 = v8;
  }
  return v5;
}

+ (id)addKeyboards:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  id v5 = (id)MEMORY[0x263EFFA68];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v6 = [getITTKeyboardProxyClass() addKeyboards:v4];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = v5;
    }
    id v5 = v8;
  }
  return v5;
}

+ (id)removeKeyboards:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  id v5 = (id)MEMORY[0x263EFFA68];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v6 = [getITTKeyboardProxyClass() removeKeyboards:v4];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = v5;
    }
    id v5 = v8;
  }
  return v5;
}

+ (id)dismissOneTimeTIActions:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  id v5 = (id)MEMORY[0x263EFFA78];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v6 = [getITTKeyboardProxyClass() dismissOneTimeTIActions:v4];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = v5;
    }
    id v5 = v8;
  }
  return v5;
}

+ (BOOL)switchToKeyboard:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  if (_activeConnectionPtr_activeConnectionPtr) {
    char v5 = [getITTKeyboardProxyClass() switchToKeyboard:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)dismissKeyboard
{
  [a1 tryConnection];
  if (!_activeConnectionPtr_activeConnectionPtr) {
    return 0;
  }
  id ITTKeyboardProxyClass = getITTKeyboardProxyClass();
  return [ITTKeyboardProxyClass dismissKeyboard];
}

+ (BOOL)switchToPlane:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  if (_activeConnectionPtr_activeConnectionPtr) {
    char v5 = [getITTKeyboardProxyClass() switchToPlane:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)getVisibleKeyplaneName
{
  [a1 tryConnection];
  id v2 = &stru_270C5A038;
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v3 = [getITTKeyboardProxyClass() getVisibleKeyplaneName];
    id v4 = (void *)v3;
    if (v3) {
      char v5 = (__CFString *)v3;
    }
    else {
      char v5 = &stru_270C5A038;
    }
    id v2 = v5;
  }
  return v2;
}

+ (id)getKeyplaneDescription:(id)a3
{
  id v4 = a3;
  [a1 tryConnection];
  if (_activeConnectionPtr_activeConnectionPtr
    && ([getITTKeyboardProxyClass() getDescriptionOfKeyplane:v4],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = (void *)v5;
    id v7 = objc_alloc_init(TypistKeyplane);
    uint64_t v8 = [v6 name];
    [(TypistKeyplane *)v7 setName:v8];

    -[TypistKeyplane setIsLetters:](v7, "setIsLetters:", [v6 isLetters]);
    -[TypistKeyplane setIsAlphabeticPlane:](v7, "setIsAlphabeticPlane:", [v6 isAlphabeticPlane]);
    -[TypistKeyplane setIsShiftKeyplane:](v7, "setIsShiftKeyplane:", [v6 isShiftKeyplane]);
    -[TypistKeyplane setUsesAutoShift:](v7, "setUsesAutoShift:", [v6 usesAutoShift]);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)getAllCandidates
{
  id v2 = (id)MEMORY[0x263EFFA68];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v3 = [getITTKeyboardProxyClass() getAllCandidates];
    id v4 = (void *)v3;
    if (v3) {
      uint64_t v5 = (void *)v3;
    }
    else {
      uint64_t v5 = v2;
    }
    id v2 = v5;
  }
  return v2;
}

+ (id)getVisibleCandidateList:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"typistCandidateBarTypeMecabra"])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    if (![v4 isEqualToString:@"typistCandidateBarTypeFavonious"]) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = [getITTKeyboardProxyClass() getVisibleCandidates:v5];
LABEL_7:
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v8 = v7;

  return v8;
}

+ (CGPoint)getCandidateCenter:(id)a3
{
  id v3 = a3;
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    getITTKeyboardProxyClass();
    if (objc_opt_respondsToSelector())
    {
      getITTKeyboardProxyClass();
      objc_msgSend((id)objc_opt_class(), sel_getCandidateRectWithString_, v3);
    }
    UIRectGetCenter();
    double v4 = v6;
    double v5 = v7;
  }
  else
  {
    double v4 = *MEMORY[0x263F00148];
    double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  }

  double v8 = v4;
  double v9 = v5;
  result.y = v9;
  result.x = v8;
  return result;
}

+ (CGRect)getCandidateBarRect
{
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    [getITTKeyboardProxyClass() getCandidateBarRect];
  }
  else
  {
    double v2 = *MEMORY[0x263F001A8];
    double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (__n128)getKeyboardScaleTransform
{
  if (_activeConnectionPtr_activeConnectionPtr) {
    [getITTKeyboardProxyClass() getKeyboardScaleTransform];
  }
  else {
    return *(__n128 *)MEMORY[0x263EF89A8];
  }
  return result;
}

+ (double)getKeyboardPPM
{
  if (!_activeConnectionPtr_activeConnectionPtr) {
    return 0.0;
  }
  id ITTKeyboardProxyClass = getITTKeyboardProxyClass();
  [ITTKeyboardProxyClass getKeyboardPPM];
  return result;
}

+ (BOOL)isExtendedCandidateViewMode
{
  if (!_activeConnectionPtr_activeConnectionPtr) {
    return 0;
  }
  id ITTKeyboardProxyClass = getITTKeyboardProxyClass();
  return [ITTKeyboardProxyClass isExtendedCandidateViewMode];
}

+ (CGPoint)getExtendedCandidateViewToggleButtonCenter
{
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    [getITTKeyboardProxyClass() getExtendedCandidateViewToggleButtonCenter];
  }
  else
  {
    double v2 = *MEMORY[0x263F00148];
    double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.y = v3;
  result.x = v2;
  return result;
}

+ (BOOL)hasMarkedText
{
  if (!_activeConnectionPtr_activeConnectionPtr) {
    return 0;
  }
  id ITTKeyboardProxyClass = getITTKeyboardProxyClass();
  return [ITTKeyboardProxyClass hasMarkedText];
}

+ (id)markedText
{
  double v2 = &stru_270C5A038;
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    uint64_t v3 = [getITTKeyboardProxyClass() markedText];
    double v4 = (void *)v3;
    if (v3) {
      double v5 = (__CFString *)v3;
    }
    else {
      double v5 = &stru_270C5A038;
    }
    double v2 = v5;
  }
  return v2;
}

+ (void)showCandidateAtIndex:(int64_t)a3
{
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    id ITTKeyboardProxyClass = getITTKeyboardProxyClass();
    [ITTKeyboardProxyClass showCandidateAtIndex:a3];
  }
}

+ (CGRect)findKeyBoundsInKeyboard:(id)a3
{
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    id v3 = a3;
    [getITTKeyboardProxyClass() findKeyBoundsInKeyboard:v3];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x263F001A0];
    double v7 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)addKeyboardPopupKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6 keyplaneKeycaps:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  __assert_rtn("+[TypistKeyboardDataInputUIClient addKeyboardPopupKeys:keys:inPlane:addTo:keyplaneKeycaps:]", "TypistKeyboardDataInputUIClient.m", 448, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient addKeyboardPopupKeys:keys:inPlane:addTo:keyplaneCaps:]\"");
}

+ (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4
{
  double v4 = a3.x + a4.x;
  double v5 = a3.y + a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)floatingKeyboardDraggablePoint
{
}

+ (id)generateKeyplaneSwitchTable:(id)a3
{
  id v3 = a3;
  __assert_rtn("+[TypistKeyboardDataInputUIClient generateKeyplaneSwitchTable:]", "TypistKeyboardDataInputUIClient.m", 467, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient generateKeyplaneSwitchTable:]\"");
}

+ (id)generateKeyplaneSwitchTableFor10Key:(id)a3
{
  id v3 = a3;
  __assert_rtn("+[TypistKeyboardDataInputUIClient generateKeyplaneSwitchTableFor10Key:]", "TypistKeyboardDataInputUIClient.m", 474, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient generateKeyplaneSwitchTableFor10Key:]\"");
}

+ (CGPoint)getCandidateCenterAtIndex:(int64_t)a3
{
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    [getITTKeyboardProxyClass() getCandidateCenterWithIndex:a3];
  }
  else
  {
    double v3 = *MEMORY[0x263F00148];
    double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

+ (id)getRepresentedStringFromKey:(id)a3
{
  id v3 = a3;
  __assert_rtn("+[TypistKeyboardDataInputUIClient getRepresentedStringFromKey:]", "TypistKeyboardDataInputUIClient.m", 489, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient getRepresentedStringFromKey:]\"");
}

@end