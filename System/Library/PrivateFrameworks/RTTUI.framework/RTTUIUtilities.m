@interface RTTUIUtilities
+ (BOOL)contactIsTTYContact:(id)a3;
+ (BOOL)hardwareTTYIsSupported;
+ (BOOL)isOnlyRTTSupported;
+ (BOOL)isRTTSupported;
+ (BOOL)relayIsSupported;
+ (BOOL)shouldUseRTT;
+ (BOOL)softwareTTYIsSupported;
+ (BOOL)ttyShouldBeRealtimeForCall:(id)a3;
+ (id)ASCIINumericStringFromString:(__CFString *)a3;
+ (id)phoneNumberStringFromString:(id)a3;
+ (id)relayPhoneNumber;
+ (id)rttDisplayName:(int64_t)a3 forSubscriptionContextUUID:(id)a4;
+ (id)sharedUtilityProvider;
+ (void)cancelCallPromptDisplay;
+ (void)contactIsTTYContact:(id)a3 resultBlock:(id)a4;
+ (void)displayCallPromptForContact:(id)a3 withCompletion:(id)a4;
- (BOOL)contactIsTTYContact:(id)a3;
- (BOOL)deleteConversationWithCallUID:(id)a3;
- (BOOL)headphoneJackSupportsTTY;
- (BOOL)inUnitTestMode;
- (NSNumber)overrideLTR;
- (OS_dispatch_queue)callCenterQueue;
- (RTTUIUtilities)init;
- (UIEdgeInsets)bubbleInsetForMe:(BOOL)a3;
- (UIEdgeInsets)textInsetForMe:(BOOL)a3;
- (id)bubbleColorForMe:(BOOL)a3;
- (id)bubbleFillForMe:(BOOL)a3;
- (id)conversationForCallUID:(id)a3;
- (id)largeTTYIconWithTint:(id)a3;
- (id)myPhoneNumber;
- (id)tintedTTYIcon;
- (id)transcriptStringForConversation:(id)a3;
- (id)ttyIconWithTint:(id)a3;
- (id)ttyMeContact;
- (int64_t)textAlignmentForMe:(BOOL)a3;
- (unint64_t)currentPreferredTransportMethod;
- (void)setCallCenterQueue:(id)a3;
- (void)setHeadphoneJackSupportsTTY:(BOOL)a3;
- (void)setInUnitTestMode:(BOOL)a3;
- (void)setOverrideLTR:(id)a3;
@end

@implementation RTTUIUtilities

+ (id)sharedUtilityProvider
{
  if (sharedUtilityProvider_onceToken != -1) {
    dispatch_once(&sharedUtilityProvider_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedUtilityProvider_UtilityProvider;
  return v2;
}

uint64_t __39__RTTUIUtilities_sharedUtilityProvider__block_invoke()
{
  sharedUtilityProvider_UtilityProvider = objc_alloc_init(RTTUIUtilities);
  return MEMORY[0x270F9A758]();
}

+ (id)rttDisplayName:(int64_t)a3 forSubscriptionContextUUID:(id)a4
{
  id v4 = a4;
  v5 = [MEMORY[0x263F62B00] sharedUtilityProvider];
  v6 = [v5 subscriptionContexts];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__RTTUIUtilities_rttDisplayName_forSubscriptionContextUUID___block_invoke;
  v14[3] = &unk_264638AC0;
  id v7 = v4;
  id v15 = v7;
  v8 = objc_msgSend(v6, "ax_filteredArrayUsingBlock:", v14);

  v9 = [MEMORY[0x263F62B00] sharedUtilityProvider];
  v10 = [v8 firstObject];
  v11 = [v9 getCarrierValueForKey:@"showRTTForEmergency" andContext:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 BOOLValue];
  }
  v12 = ttyLocString();

  return v12;
}

uint64_t __60__RTTUIUtilities_rttDisplayName_forSubscriptionContextUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)contactIsTTYContact:(id)a3
{
  v3 = (void *)MEMORY[0x263F62B00];
  id v4 = a3;
  v5 = [v3 sharedUtilityProvider];
  char v6 = [v5 contactIsTTYContact:v4];

  return v6;
}

+ (void)contactIsTTYContact:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (contactIsTTYContact_resultBlock__onceToken != -1) {
    dispatch_once(&contactIsTTYContact_resultBlock__onceToken, &__block_literal_global_18);
  }
  v8 = contactIsTTYContact_resultBlock__Queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke_2;
  block[3] = &unk_264638B10;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke()
{
  contactIsTTYContact_resultBlock__Queue = (uint64_t)dispatch_queue_create("TTY-retrieval", 0);
  return MEMORY[0x270F9A758]();
}

void __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 48) contactIsTTYContact:*(void *)(a1 + 32)];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke_3;
  v3[3] = &unk_264638AE8;
  id v4 = *(id *)(a1 + 40);
  char v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (BOOL)hardwareTTYIsSupported
{
  return [MEMORY[0x263F62B00] hardwareTTYIsSupported];
}

+ (BOOL)isRTTSupported
{
  return [MEMORY[0x263F62B00] isRTTSupported];
}

+ (BOOL)isOnlyRTTSupported
{
  return [MEMORY[0x263F62B00] isOnlyRTTSupported];
}

+ (BOOL)shouldUseRTT
{
  return [MEMORY[0x263F62B00] shouldUseRTT];
}

+ (BOOL)softwareTTYIsSupported
{
  return [MEMORY[0x263F62B00] softwareTTYIsSupported];
}

+ (BOOL)relayIsSupported
{
  return [MEMORY[0x263F62B00] relayIsSupported];
}

+ (id)relayPhoneNumber
{
  return (id)[MEMORY[0x263F62B00] relayPhoneNumber];
}

+ (id)ASCIINumericStringFromString:(__CFString *)a3
{
  if (a3)
  {
    CFIndex Length = CFStringGetLength(a3);
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (Length >= 1)
    {
      CFIndex v6 = 0;
      UniChar chars = 0;
      do
      {
        UChar32 CharacterAtIndex = CFStringGetCharacterAtIndex(a3, v6);
        UniChar chars = CharacterAtIndex;
        double NumericValue = u_getNumericValue(CharacterAtIndex);
        if (NumericValue <= 9.0)
        {
          double v9 = ceil(NumericValue);
          if (NumericValue >= 0.0 && NumericValue == v9) {
            UniChar chars = (int)NumericValue + 48;
          }
        }
        CFStringAppendCharacters(Mutable, &chars, 1);
        ++v6;
      }
      while (Length != v6);
    }
  }
  else
  {
    Mutable = 0;
  }
  return Mutable;
}

+ (id)phoneNumberStringFromString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  if ([v3 length])
  {
    char v5 = +[RTTUIUtilities ASCIINumericStringFromString:v3];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v29 = 0u;
    uint64_t v6 = [(__CFString *)v5 length];
    CFStringRef theString = v5;
    uint64_t v39 = 0;
    int64_t v40 = v6;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v37 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    }
    int64_t v41 = 0;
    int64_t v42 = 0;
    v38 = CStringPtr;
    if (v6 >= 1)
    {
      uint64_t v9 = 0;
      int64_t v10 = 0;
      uint64_t v11 = 64;
      while (1)
      {
        if ((unint64_t)v10 >= 4) {
          uint64_t v12 = 4;
        }
        else {
          uint64_t v12 = v10;
        }
        int64_t v13 = v40;
        if (v40 <= v10) {
          goto LABEL_41;
        }
        if (v37)
        {
          UniChar v14 = v37[v10 + v39];
        }
        else if (v38)
        {
          UniChar v14 = v38[v39 + v10];
        }
        else
        {
          int64_t v15 = v41;
          if (v42 <= v10 || v41 > v10)
          {
            uint64_t v17 = -v12;
            uint64_t v18 = v12 + v9;
            uint64_t v19 = v11 - v12;
            int64_t v20 = v10 + v17;
            int64_t v21 = v20 + 64;
            if (v20 + 64 >= v40) {
              int64_t v21 = v40;
            }
            int64_t v41 = v20;
            int64_t v42 = v21;
            if (v40 >= v19) {
              int64_t v13 = v19;
            }
            v44.length = v13 + v18;
            v44.location = v20 + v39;
            CFStringGetCharacters(theString, v44, buffer);
            int64_t v15 = v41;
          }
          UniChar v14 = buffer[v10 - v15];
        }
        int v22 = v14;
        if ((unsigned __int16)(v14 - 65) <= 0x19u) {
          break;
        }
        if ((unsigned __int16)(v14 - 97) <= 0x19u)
        {
          unsigned int v23 = v14 - 97;
          goto LABEL_33;
        }
        if ((unsigned __int16)(v14 + 223) <= 0x19u)
        {
          int v24 = -65313;
          goto LABEL_32;
        }
        if ((unsigned __int16)(v14 + 191) <= 0x19u)
        {
          int v24 = -65345;
LABEL_32:
          unsigned int v23 = v22 + v24;
LABEL_33:
          UniChar v14 = _LetterNumberMap[v23] + 48;
          goto LABEL_34;
        }
        if ((unsigned __int16)(v14 + 240) > 9u)
        {
          unsigned __int16 v25 = 44;
          switch(v14)
          {
            case 0xFF03u:
              unsigned __int16 v25 = 35;
              goto LABEL_40;
            case 0xFF04u:
            case 0xFF05u:
            case 0xFF06u:
            case 0xFF07u:
            case 0xFF08u:
            case 0xFF09u:
              goto LABEL_34;
            case 0xFF0Au:
              unsigned __int16 v25 = 42;
              goto LABEL_40;
            case 0xFF0Bu:
              unsigned __int16 v25 = 43;
              goto LABEL_40;
            case 0xFF0Cu:
              goto LABEL_40;
            default:
              if (v14 != 65307) {
                goto LABEL_34;
              }
              unsigned __int16 v25 = 59;
              break;
          }
          goto LABEL_40;
        }
        v14 += 288;
LABEL_34:
        if ((unsigned __int16)(v14 - 48) >= 0xAu)
        {
          BOOL v26 = v14 > 0x3Bu || ((1 << v14) & 0x8001C0800000000) == 0;
          unsigned __int16 v25 = v14;
          if (v26) {
            goto LABEL_41;
          }
        }
        else
        {
          unsigned __int16 v25 = v14;
        }
LABEL_40:
        objc_msgSend(v4, "appendFormat:", @"%c", v25);
LABEL_41:
        ++v10;
        --v9;
        ++v11;
        if (v6 == v10) {
          goto LABEL_51;
        }
      }
      unsigned int v23 = v14 - 65;
      goto LABEL_33;
    }
LABEL_51:
  }
  return v4;
}

+ (BOOL)ttyShouldBeRealtimeForCall:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F62AF8] sharedInstance];
  if ([v4 ttyShouldBeRealtime]) {
    char v5 = 1;
  }
  else {
    char v5 = [v3 isEmergency];
  }

  return v5;
}

- (unint64_t)currentPreferredTransportMethod
{
  char v2 = [MEMORY[0x263F62B00] sharedUtilityProvider];
  unint64_t v3 = [v2 currentPreferredTransportMethod];

  return v3;
}

- (RTTUIUtilities)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTTUIUtilities;
  char v2 = [(RTTUIUtilities *)&v5 init];
  unint64_t v3 = v2;
  if (v2) {
    [(RTTUIUtilities *)v2 setCallCenterQueue:MEMORY[0x263EF83A0]];
  }
  return v3;
}

- (id)myPhoneNumber
{
  char v2 = [MEMORY[0x263F62B00] sharedUtilityProvider];
  unint64_t v3 = [v2 myPhoneNumber];

  if (![v3 length])
  {
    uint64_t v4 = ttyLocString();

    unint64_t v3 = (void *)v4;
  }
  return v3;
}

- (id)ttyMeContact
{
  v11[3] = *MEMORY[0x263EF8340];
  if ([(RTTUIUtilities *)self inUnitTestMode])
  {
    if (ttyMeContact_onceToken != -1) {
      dispatch_once(&ttyMeContact_onceToken, &__block_literal_global_29);
    }
    id v2 = (id)ttyMeContact_unitTestMe;
  }
  else
  {
    unint64_t v3 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
    uint64_t v4 = *MEMORY[0x263EFDF80];
    v11[0] = v3;
    v11[1] = v4;
    v11[2] = *MEMORY[0x263EFE070];
    objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];

    uint64_t v6 = [MEMORY[0x263F62B00] sharedUtilityProvider];
    id v7 = [v6 contactStore];
    uint64_t v10 = 0;
    v8 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v5, &v10);

    id v2 = v8;
  }
  return v2;
}

uint64_t __30__RTTUIUtilities_ttyMeContact__block_invoke()
{
  ttyMeContact_unitTestMe = (uint64_t)objc_alloc_init(MEMORY[0x263EFE9F8]);
  return MEMORY[0x270F9A758]();
}

- (int64_t)textAlignmentForMe:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = 0;
  }
  uint64_t v6 = [(RTTUIUtilities *)self overrideLTR];

  if (v6)
  {
    id v7 = [(RTTUIUtilities *)self overrideLTR];
    int v8 = [v7 BOOLValue];
    uint64_t v9 = 2;
    if (v3) {
      uint64_t v9 = 0;
    }
    if (v8) {
      int64_t v10 = v9;
    }
    else {
      int64_t v10 = v5;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263EFF960];
    uint64_t v12 = [MEMORY[0x263EFF960] currentLocale];
    int64_t v13 = [v12 objectForKey:*MEMORY[0x263EFF508]];
    uint64_t v14 = [v11 characterDirectionForLanguage:v13];

    int64_t v15 = 2;
    if (v3) {
      int64_t v15 = 0;
    }
    if (v14 == 2) {
      return v15;
    }
    else {
      return v5;
    }
  }
  return v10;
}

- (UIEdgeInsets)textInsetForMe:(BOOL)a3
{
  int64_t v3 = [(RTTUIUtilities *)self textAlignmentForMe:a3];
  if (v3 == 2) {
    double v4 = 75.0;
  }
  else {
    double v4 = 20.0;
  }
  if (v3 == 2) {
    double v5 = 20.0;
  }
  else {
    double v5 = 75.0;
  }
  double v6 = 10.0;
  double v7 = 10.0;
  result.right = v5;
  result.bottom = v7;
  result.left = v4;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)bubbleInsetForMe:(BOOL)a3
{
  int64_t v3 = [(RTTUIUtilities *)self textAlignmentForMe:a3];
  double v4 = -5.0;
  if (v3 == 2) {
    double v5 = -5.0;
  }
  else {
    double v5 = -15.0;
  }
  if (v3 == 2) {
    double v6 = -15.0;
  }
  else {
    double v6 = -5.0;
  }
  double v7 = -5.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v7;
  return result;
}

- (id)bubbleColorForMe:(BOOL)a3
{
  double v4 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.4784 blue:1.0 alpha:1.0];
  if (!a3)
  {
    uint64_t v5 = [MEMORY[0x263F1C550] lightGrayColor];

    double v4 = (void *)v5;
  }
  return v4;
}

- (id)largeTTYIconWithTint:(id)a3
{
  id v3 = a3;
  double v4 = ttyImageNamed(@"tty_icon");
  uint64_t v5 = v4;
  if (v3)
  {
    double v6 = (void *)MEMORY[0x263F1C6B0];
    [v4 size];
    uint64_t v7 = objc_msgSend(v6, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v3, 0, v5, 0);

    uint64_t v5 = (void *)v7;
  }

  return v5;
}

- (id)ttyIconWithTint:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x263F62B00] currentSupportedTextingType] - 1;
  if (v4 > 2)
  {
    uint64_t v5 = 0;
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v5 = ttyImageNamed(off_264638B80[v4]);
  if (v3)
  {
LABEL_5:
    double v6 = (void *)MEMORY[0x263F1C6B0];
    [v5 size];
    uint64_t v7 = objc_msgSend(v6, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v3, 0, v5, 0);

    uint64_t v5 = (void *)v7;
  }
LABEL_6:

  return v5;
}

- (id)tintedTTYIcon
{
  id v3 = _UIGetTintedCircularButtonDefaultBlueColor();
  unint64_t v4 = [(RTTUIUtilities *)self ttyIconWithTint:v3];

  return v4;
}

- (id)bubbleFillForMe:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v127 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F08B88] currentThread];
  char v6 = [v5 isMainThread];

  if (v6)
  {
    if (_AXSInUnitTestMode())
    {
      uint64_t v7 = (void *)bubbleFillForMe__LeftBubbleImage;
      bubbleFillForMe__LeftBubbleImage = 0;

      int v8 = (void *)bubbleFillForMe__RightBubbleImage;
      bubbleFillForMe__RightBubbleImage = 0;
    }
    id v9 = (id)bubbleFillForMe__RightBubbleImage;
    if ([(RTTUIUtilities *)self textAlignmentForMe:v3])
    {
      if (v9) {
        goto LABEL_36;
      }
    }
    else
    {
      id v11 = (id)bubbleFillForMe__LeftBubbleImage;

      id v9 = v11;
      if (v11) {
        goto LABEL_36;
      }
    }
    uint64_t v12 = ttyImageNamed(@"bubble");
    int64_t v13 = ttyImageNamed(@"bubble-stroked");
    uint64_t v14 = [MEMORY[0x263F1C920] mainScreen];
    [v14 scale];
    CGFloat scale = v15;

    v16 = AXLogRTT();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(CGFloat *)&buf[4] = scale;
      _os_log_impl(&dword_222978000, v16, OS_LOG_TYPE_INFO, "Drawing new bubble images for screen scale: %f", buf, 0xCu);
    }

    uint64_t v17 = 4 * ([(RTTUIUtilities *)self textAlignmentForMe:v3] != 2);
    if ([v12 imageOrientation] != v17)
    {
      uint64_t v18 = AXLogRTT();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        [v12 scale];
        uint64_t v20 = v19;
        [v13 scale];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v17;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = v20;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v21;
        _os_log_impl(&dword_222978000, v18, OS_LOG_TYPE_INFO, "Flipping image to orientation %i with bubble scale %f and bubble stroked scale %f", buf, 0x1Cu);
      }

      id v22 = objc_alloc(MEMORY[0x263F1C6B0]);
      id v23 = v12;
      uint64_t v24 = [v23 CGImage];
      [v23 scale];
      uint64_t v12 = objc_msgSend(v22, "initWithCGImage:scale:orientation:", v24, v17);

      id v25 = objc_alloc(MEMORY[0x263F1C6B0]);
      id v26 = v13;
      uint64_t v27 = [v26 CGImage];
      [v26 scale];
      int64_t v13 = objc_msgSend(v25, "initWithCGImage:scale:orientation:", v27, v17);
    }
    v28 = [MEMORY[0x263F1C920] mainScreen];
    [v28 scale];
    double v30 = v29;

    long long v31 = [MEMORY[0x263F1C920] mainScreen];
    [v31 scale];
    double v33 = v32;

    long long v34 = [MEMORY[0x263F1C920] mainScreen];
    [v34 scale];
    double v36 = v35;

    v37 = [MEMORY[0x263F1C920] mainScreen];
    [v37 scale];
    double v39 = v38;

    int64_t v40 = [MEMORY[0x263F1C920] mainScreen];
    [v40 scale];
    double v42 = v41;

    v43 = [MEMORY[0x263F1C920] mainScreen];
    [v43 scale];
    double v45 = v44;

    v46 = [MEMORY[0x263F1C920] mainScreen];
    [v46 scale];
    double v48 = v47;

    v49 = [MEMORY[0x263F1C920] mainScreen];
    [v49 scale];
    double v51 = v50;

    v52 = AXLogRTT();
    double v53 = floor(v30 * 17.5) / v30;
    double v54 = floor(v33 * 28.5) / v33;
    double v55 = floor(v36 * 17.0) / v36;
    double v56 = floor(v39 * 27.0) / v39;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v134.top = v53;
      v134.left = v54;
      v134.bottom = v55;
      v134.right = v56;
      v57 = NSStringFromUIEdgeInsets(v134);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v57;
      _os_log_impl(&dword_222978000, v52, OS_LOG_TYPE_INFO, "Balloon mask cap insets: %@", buf, 0xCu);
    }
    v58 = AXLogRTT();
    double v59 = ceil(v42 * 11.0) / v42;
    double v60 = ceil(v45 * 12.0) / v45;
    double v61 = ceil(v48 * 12.0) / v48;
    double v62 = ceil(v51 * 18.0) / v51;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v135.top = v59;
      v135.left = v60;
      v135.bottom = v61;
      v135.right = v62;
      v63 = NSStringFromUIEdgeInsets(v135);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v63;
      _os_log_impl(&dword_222978000, v58, OS_LOG_TYPE_INFO, "Balloon mask alignment insets: %@", buf, 0xCu);
    }
    v64 = objc_msgSend(v12, "resizableImageWithCapInsets:", v53, v54, v55, v56);

    v65 = objc_msgSend(v64, "imageWithAlignmentRectInsets:", v59, v60, v61, v62);

    v66 = objc_msgSend(v13, "resizableImageWithCapInsets:", v53, v54, v55, v56);

    v67 = objc_msgSend(v66, "imageWithAlignmentRectInsets:", v59, v60, v61, v62);

    v68 = AXLogRTT();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v65;
      _os_log_impl(&dword_222978000, v68, OS_LOG_TYPE_INFO, "Bubble: %@", buf, 0xCu);
    }

    v69 = AXLogRTT();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v67;
      _os_log_impl(&dword_222978000, v69, OS_LOG_TYPE_INFO, "Bubble stroked: %@", buf, 0xCu);
    }

    [v65 size];
    UIGraphicsBeginImageContextWithOptions(v129, 0, scale);
    [v65 size];
    double v71 = v70;
    [v65 size];
    objc_msgSend(v65, "drawInRect:", 0.0, 0.0, v71, v72);
    v73 = +[RTTUIUtilities sharedUtilityProvider];
    v74 = [v73 bubbleColorForMe:v3];
    [v74 set];

    v75 = (void *)MEMORY[0x263F1C478];
    [v65 size];
    double v77 = v76;
    [v65 size];
    v79 = objc_msgSend(v75, "bezierPathWithRect:", 0.0, 0.0, v77, v78);
    [v79 fillWithBlendMode:18 alpha:0.4];

    v80 = UIGraphicsGetImageFromCurrentImageContext();
    [v65 capInsets];
    v81 = objc_msgSend(v80, "resizableImageWithCapInsets:");

    UIGraphicsEndImageContext();
    id v82 = v81;

    v83 = AXLogRTT();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      [v67 size];
      v84 = NSStringFromCGSize(v130);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v84;
      _os_log_impl(&dword_222978000, v83, OS_LOG_TYPE_INFO, "Create overlay image with size: %@", buf, 0xCu);
    }
    [v82 size];
    CGFloat v86 = v85;
    CGFloat v88 = v87;

    v131.width = v86;
    v131.height = v88;
    UIGraphicsBeginImageContextWithOptions(v131, 0, scale);
    [v67 size];
    double v90 = v89;
    [v67 size];
    objc_msgSend(v67, "drawInRect:", 0.0, 0.0, v90, v91);
    v92 = +[RTTUIUtilities sharedUtilityProvider];
    v93 = [v92 bubbleColorForMe:v3];
    [v93 set];

    v94 = (void *)MEMORY[0x263F1C478];
    [v67 size];
    double v96 = v95;
    [v67 size];
    v98 = objc_msgSend(v94, "bezierPathWithRect:", 0.0, 0.0, v96, v97);
    [v98 fillWithBlendMode:18 alpha:0.9];

    v99 = UIGraphicsGetImageFromCurrentImageContext();
    [v67 capInsets];
    v100 = objc_msgSend(v99, "resizableImageWithCapInsets:");

    v101 = AXLogRTT();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      [v67 capInsets];
      v102 = NSStringFromUIEdgeInsets(v136);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v102;
      _os_log_impl(&dword_222978000, v101, OS_LOG_TYPE_INFO, "Created overlay image with cap insets: %@", buf, 0xCu);
    }
    UIGraphicsEndImageContext();
    id v103 = v100;

    v104 = AXLogRTT();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      [v103 size];
      v105 = NSStringFromCGSize(v132);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v105;
      _os_log_impl(&dword_222978000, v104, OS_LOG_TYPE_INFO, "Create final image with size: %@", buf, 0xCu);
    }
    [v82 size];
    UIGraphicsBeginImageContextWithOptions(v133, 0, scale);
    [v82 size];
    double v107 = v106;
    [v82 size];
    objc_msgSend(v82, "drawInRect:", 0.0, 0.0, v107, v108);
    [v103 size];
    double v110 = v109;
    [v103 size];
    objc_msgSend(v103, "drawInRect:", 0.0, 0.0, v110, v111);
    v112 = UIGraphicsGetImageFromCurrentImageContext();
    [v103 capInsets];
    v113 = objc_msgSend(v112, "resizableImageWithCapInsets:");

    v114 = AXLogRTT();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      [v103 capInsets];
      v115 = NSStringFromUIEdgeInsets(v137);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v115;
      _os_log_impl(&dword_222978000, v114, OS_LOG_TYPE_INFO, "Created final image with cap insets: %@", buf, 0xCu);
    }
    UIGraphicsEndImageContext();
    id v9 = v113;
    int64_t v116 = [(RTTUIUtilities *)self textAlignmentForMe:v3];
    v117 = &bubbleFillForMe__RightBubbleImage;
    if (!v116) {
      v117 = &bubbleFillForMe__LeftBubbleImage;
    }
    v118 = (void *)*v117;
    uint64_t *v117 = (uint64_t)v9;
  }
  else
  {
    int64_t v10 = AXLogRTT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[RTTUIUtilities bubbleFillForMe:](v10);
    }

    objc_initWeak(&location, self);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__1;
    v125 = __Block_byref_object_dispose__1;
    id v126 = 0;
    objc_copyWeak(&v121, &location);
    BOOL v122 = v3;
    AXPerformBlockSynchronouslyOnMainThread();
    id v9 = *(id *)(*(void *)&buf[8] + 40);
    objc_destroyWeak(&v121);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&location);
  }
LABEL_36:
  return v9;
}

void __34__RTTUIUtilities_bubbleFillForMe___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained bubbleFillForMe:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (void)displayCallPromptForContact:(id)a3 withCompletion:(id)a4
{
  if (a4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F62AE8];
    id v6 = a4;
    id v7 = a3;
    id v8 = [v5 sharedInstance];
    [v8 displayCallPromptForContact:v7 withCompletion:v6];
  }
}

+ (void)cancelCallPromptDisplay
{
  id v2 = [MEMORY[0x263F62AE8] sharedInstance];
  [v2 cancelCallPromptDisplay];
}

- (id)conversationForCallUID:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  uint64_t v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = [MEMORY[0x263F62AE8] sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__RTTUIUtilities_conversationForCallUID___block_invoke;
  v10[3] = &unk_264638B60;
  uint64_t v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  [v5 findConversationForCallUID:v3 andResult:v10];

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v6, v7);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __41__RTTUIUtilities_conversationForCallUID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)deleteConversationWithCallUID:(id)a3
{
  id v3 = (void *)MEMORY[0x263F62AE8];
  id v4 = a3;
  uint64_t v5 = [v3 sharedInstance];
  char v6 = [v5 deleteConversationWithCallUID:v4];

  return v6;
}

- (BOOL)contactIsTTYContact:(id)a3
{
  id v3 = (void *)MEMORY[0x263F62AE8];
  id v4 = a3;
  uint64_t v5 = [v3 sharedInstance];
  char v6 = [v5 contactIsTTYContact:v4];

  return v6;
}

- (id)transcriptStringForConversation:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v36 = objc_alloc_init(MEMORY[0x263F089B8]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v31 = v3;
  id obj = [v3 utterances];
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v34 = *MEMORY[0x263F1D298];
    uint64_t v35 = *(void *)v38;
    uint64_t v33 = *MEMORY[0x263F1D350];
    double v6 = *MEMORY[0x263F1D318];
    uint64_t v7 = *MEMORY[0x263F1C238];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int64_t v10 = (void *)MEMORY[0x263EFEA20];
        id v11 = (void *)MEMORY[0x263EFE9F8];
        uint64_t v12 = [v9 contactPath];
        uint64_t v13 = [v11 contactForPhoneNumber:v12];
        uint64_t v14 = [v10 stringFromContact:v13 style:0];

        if (![v14 length])
        {
          if ([v9 isMe]) {
            ttyLocString();
          }
          else {
          uint64_t v15 = [v9 contactPath];
          }

          uint64_t v14 = (void *)v15;
        }
        if (![v14 length])
        {
          uint64_t v16 = ttyLocString();

          uint64_t v14 = (void *)v16;
        }
        uint64_t v17 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:v34 addingSymbolicTraits:0x8000 options:0];
        uint64_t v43 = v33;
        id v18 = [NSNumber numberWithDouble:v6];
        double v44 = v18;
        uint64_t v19 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        uint64_t v20 = [v17 fontDescriptorByAddingAttributes:v19];

        uint64_t v21 = (void *)MEMORY[0x263F1C658];
        [v20 pointSize];
        id v22 = objc_msgSend(v21, "fontWithDescriptor:size:", v20);
        id v23 = NSString;
        uint64_t v24 = [v9 text];
        id v25 = [v23 stringWithFormat:@"%@: %@\n", v14, v24];

        id v26 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v25];
        uint64_t v41 = v7;
        double v42 = v22;
        uint64_t v27 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        uint64_t v28 = [v25 rangeOfString:v14];
        objc_msgSend(v26, "setAttributes:range:", v27, v28, v29);

        [v36 appendAttributedString:v26];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v5);
  }

  return v36;
}

- (BOOL)inUnitTestMode
{
  return self->_inUnitTestMode;
}

- (void)setInUnitTestMode:(BOOL)a3
{
  self->_inUnitTestMode = a3;
}

- (NSNumber)overrideLTR
{
  return self->_overrideLTR;
}

- (void)setOverrideLTR:(id)a3
{
}

- (BOOL)headphoneJackSupportsTTY
{
  return self->_headphoneJackSupportsTTY;
}

- (void)setHeadphoneJackSupportsTTY:(BOOL)a3
{
  self->_headphoneJackSupportsTTY = a3;
}

- (OS_dispatch_queue)callCenterQueue
{
  return self->_callCenterQueue;
}

- (void)setCallCenterQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenterQueue, 0);
  objc_storeStrong((id *)&self->_overrideLTR, 0);
}

- (void)bubbleFillForMe:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_222978000, log, OS_LOG_TYPE_FAULT, "Expected to be called on the main thread", v1, 2u);
}

@end