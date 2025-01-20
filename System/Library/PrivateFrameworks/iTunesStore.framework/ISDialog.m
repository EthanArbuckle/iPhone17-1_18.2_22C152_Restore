@interface ISDialog
+ (__CFString)buttonTitleKeyForCFUserNotificationButtonTag:(unint64_t)a3;
+ (int64_t)displayCountForKey:(id)a3;
+ (unint64_t)buttonTagForCFUserNotificationButtonTitleKey:(__CFString *)a3;
+ (void)_initializeStaticButtonTitleKeyAndTagMapping;
- (BOOL)allowDuplicates;
- (BOOL)authorizationIsForced;
- (BOOL)dismissOnHomeButton;
- (BOOL)dismissOnLock;
- (BOOL)displaysOnLockscreen;
- (BOOL)expectsResponse;
- (BOOL)groupsTextFields;
- (BOOL)isDisplayable;
- (BOOL)isEqual:(id)a3;
- (BOOL)noDefaultButton;
- (BOOL)oneButtonPerLine;
- (BOOL)shouldDismissAfterUnlock;
- (BOOL)shouldDisplayAsTopMost;
- (BOOL)shouldPendInSetupIfNotAllowed;
- (ISDialog)init;
- (ISDialog)initWithAuthenticationChallege:(id)a3;
- (ISDialog)initWithDialogDictionary:(id)a3;
- (ISDialog)initWithDialogDictionary:(id)a3 authenticationContext:(id)a4;
- (ISDialog)initWithError:(id)a3;
- (ISDialog)initWithOfferDeviceError:(id)a3;
- (ISDialog)initWithTitle:(id)a3 message:(id)a4;
- (ISDialog)initWithXPCEncoding:(id)a3;
- (NSArray)buttons;
- (NSArray)textFields;
- (NSString)displayCountKey;
- (NSString)message;
- (NSString)title;
- (NSString)touchIDContinueToken;
- (SSAuthenticationContext)authenticationContext;
- (SSPaymentSheet)paymentSheet;
- (id)buyParams;
- (id)copyUserNotification;
- (id)copyXPCEncoding;
- (id)orderedButtonTitleKeysForCFUserNotification;
- (id)valueForUserInfoKey:(id)a3;
- (int64_t)_kindForString:(id)a3;
- (int64_t)defaultButtonIndex;
- (int64_t)kind;
- (int64_t)maximumDisplayCount;
- (int64_t)unlockActionButtonIndex;
- (void)copyValueForCFUserNotificationKey:(__CFString *)a3;
- (void)dealloc;
- (void)incrementDisplayCount;
- (void)setAllowDuplicates:(BOOL)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setAuthorizationIsForced:(BOOL)a3;
- (void)setButtons:(id)a3;
- (void)setButtonsWithTitles:(id)a3;
- (void)setDefaultButtonIndex:(int64_t)a3;
- (void)setDismissOnHomeButton:(BOOL)a3;
- (void)setDismissOnLock:(BOOL)a3;
- (void)setDisplayCountKey:(id)a3;
- (void)setDisplaysOnLockscreen:(BOOL)a3;
- (void)setExpectsResponse:(BOOL)a3;
- (void)setGroupsTextFields:(BOOL)a3;
- (void)setKind:(int64_t)a3;
- (void)setMaximumDisplayCount:(int64_t)a3;
- (void)setMessage:(id)a3;
- (void)setNoDefaultButton:(BOOL)a3;
- (void)setOneButtonPerLine:(BOOL)a3;
- (void)setShouldDismissAfterUnlock:(BOOL)a3;
- (void)setShouldDisplayAsTopMost:(BOOL)a3;
- (void)setShouldPendInSetupIfNotAllowed:(BOOL)a3;
- (void)setTextFields:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTouchIDContinueToken:(id)a3;
- (void)setUnlockActionButtonIndex:(int64_t)a3;
- (void)setValue:(id)a3 forUserInfoKey:(id)a4;
- (void)setValue:(void *)a3 forCFUserNotificationKey:(__CFString *)a4;
@end

@implementation ISDialog

- (ISDialog)initWithAuthenticationChallege:(id)a3
{
  v4 = [(ISDialog *)self init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CANCEL", &stru_26C6A2310, 0));
    -[ISDialog setButtons:](v4, "setButtons:", objc_msgSend(v5, "arrayWithObjects:", v6, +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OK", &stru_26C6A2310, 0)), 0));
    [(ISDialog *)v4 setDefaultButtonIndex:1];
    [(ISDialog *)v4 setExpectsResponse:1];
    [(ISDialog *)v4 setGroupsTextFields:1];
    -[ISDialog setTitle:](v4, "setTitle:", [a3 localizedTitle]);
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([a3 userNameIsEditable])
    {
      v8 = objc_alloc_init(ISDialogTextField);
      int v9 = [a3 userNameIsEmail];
      if (v9) {
        uint64_t v10 = 7;
      }
      else {
        uint64_t v10 = 0;
      }
      if (v9) {
        v11 = @"EMAIL";
      }
      else {
        v11 = @"USERNAME";
      }
      [(ISDialogTextField *)v8 setKeyboardType:v10];
      -[ISDialogTextField setTitle:](v8, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v11, &stru_26C6A2310, 0));
      -[ISDialogTextField setValue:](v8, "setValue:", [a3 user]);
      [v7 addObject:v8];
    }
    else
    {
      uint64_t v12 = [a3 user];
      if (v12)
      {
LABEL_12:
        [(ISDialog *)v4 setMessage:v12];
        v13 = objc_alloc_init(ISDialogTextField);
        [(ISDialogTextField *)v13 setKeyboardType:0];
        [(ISDialogTextField *)v13 setSecure:1];
        -[ISDialogTextField setTitle:](v13, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PASSWORD", &stru_26C6A2310, 0));
        [v7 addObject:v13];

        [(ISDialog *)v4 setTextFields:v7];
        return v4;
      }
    }
    uint64_t v12 = objc_msgSend(a3, "localizedMessage", v12);
    goto LABEL_12;
  }
  return v4;
}

- (ISDialog)init
{
  __ISRecordSPIClassUsage(self);
  v8.receiver = self;
  v8.super_class = (Class)ISDialog;
  v3 = [(ISDialog *)&v8 init];
  v4 = v3;
  if (v3)
  {
    v3->_authorizationIsForced = 1;
    v3->_defaultButtonIndex = -1;
    v3->_dismissOnHomeButton = 1;
    v3->_shouldDismissAfterUnlock = 1;
    v3->_unlockActionButtonIndex = -1;
    v3->_displaysOnLockscreen = 0;
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v4->_lock;
    v4->_lock = v5;
  }
  return v4;
}

- (ISDialog)initWithDialogDictionary:(id)a3 authenticationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(ISDialog *)self init];
  if (!v8)
  {
    v11 = v6;
    goto LABEL_66;
  }
  uint64_t v9 = [v7 copy];
  authenticationContext = v8->_authenticationContext;
  v8->_authenticationContext = (SSAuthenticationContext *)v9;

  v44 = (void *)[objc_alloc(MEMORY[0x263F7B2D0]) initWithDictionary:v6];
  v11 = [v44 dictionaryByEvaluatingConditions];

  uint64_t v12 = [v11 objectForKey:@"force-authentication"];
  if (objc_opt_respondsToSelector()) {
    -[ISDialog setAuthorizationIsForced:](v8, "setAuthorizationIsForced:", [v12 BOOLValue]);
  }
  v13 = [v11 objectForKey:@"explanation"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISDialog *)v8 setMessage:v13];
  }
  v14 = [v11 objectForKey:@"message"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISDialog *)v8 setTitle:v14];
  }
  v15 = [v11 objectForKey:@"kind"];

  [(ISDialog *)v8 setKind:[(ISDialog *)v8 _kindForString:v15]];
  v16 = [v11 objectForKey:@"display-count-key"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v8->_displayCountKey, v16);
  }
  v17 = [v11 objectForKey:@"max-display-count"];

  if (objc_opt_respondsToSelector()) {
    v8->_maxDisplayCount = (int)[v17 intValue];
  }
  v18 = [v11 objectForKey:@"noDefaultButton"];

  if (objc_opt_respondsToSelector()) {
    v8->_noDefaultButton = [v18 BOOLValue];
  }
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  v20 = [v11 objectForKey:@"cancelButtonString"];

  objc_opt_class();
  id v45 = v7;
  if (objc_opt_isKindOfClass())
  {
    int v21 = 1;
    v22 = @"cancelButtonAction";
  }
  else
  {
    v23 = [v11 objectForKey:@"cancelButton"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v21 = 1;
      v22 = @"cancelButtonAction";
      v20 = v23;
    }
    else
    {
      v20 = [v11 objectForKey:@"otherButtonString"];

      int v21 = 0;
      v22 = @"otherButtonAction";
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = objc_alloc_init(ISDialogButton);
    [(ISDialogButton *)v24 setTitle:v20];
    v25 = [v11 objectForKey:v22];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(ISDialogButton *)v24 loadFromDictionary:v25];
      BOOL v26 = [(ISDialogButton *)v24 actionType] == 3;
      BOOL v27 = [(ISDialogButton *)v24 actionType] != 0;
    }
    else
    {
      BOOL v27 = 0;
      BOOL v26 = 0;
    }
    [v19 addObject:v24];
  }
  else
  {
    BOOL v27 = 0;
    BOOL v26 = 0;
    v25 = v20;
  }
  v28 = [v11 objectForKey:@"okButtonString"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v29 = [v11 objectForKey:@"okButton"];

    v28 = (void *)v29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v31 = v28;
    if (!v21) {
      goto LABEL_43;
    }
    goto LABEL_38;
  }
  v30 = objc_alloc_init(ISDialogButton);
  [(ISDialogButton *)v30 setTitle:v28];
  id v31 = [v11 objectForKey:@"okButtonAction"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ISDialogButton *)v30 loadFromDictionary:v31];
    if (v26)
    {
      BOOL v26 = 1;
      if (!v27)
      {
LABEL_32:
        BOOL v27 = [(ISDialogButton *)v30 actionType] != 0;
        goto LABEL_37;
      }
    }
    else
    {
      BOOL v26 = [(ISDialogButton *)v30 actionType] == 3;
      if (!v27) {
        goto LABEL_32;
      }
    }
    BOOL v27 = 1;
  }
LABEL_37:
  [v19 addObject:v30];

  if (!v21)
  {
LABEL_43:
    v34 = v44;
    id v7 = v45;
    goto LABEL_50;
  }
LABEL_38:
  v32 = [v11 objectForKey:@"otherButtonString"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v31 = v32;
    goto LABEL_43;
  }
  v33 = objc_alloc_init(ISDialogButton);
  [(ISDialogButton *)v33 setTitle:v32];
  id v31 = [v11 objectForKey:@"otherButtonAction"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ISDialogButton *)v33 loadFromDictionary:v31];
    BOOL v26 = v26 || [(ISDialogButton *)v33 actionType] == 3;
    v34 = v44;
    id v7 = v45;
    BOOL v27 = v27 || [(ISDialogButton *)v33 actionType] != 0;
  }
  else
  {
    v34 = v44;
    id v7 = v45;
  }
  [v19 addObject:v33];

LABEL_50:
  if ([v19 count]) {
    [(ISDialog *)v8 setButtons:v19];
  }
  [(ISDialog *)v8 setExpectsResponse:v27];
  [(ISDialog *)v8 setAllowDuplicates:v26];
  if (SSDebugShouldUseFileBasedPaymentSheetProxy())
  {
    uint64_t v35 = +[ISBiometricStore diskBasedPaymentSheet];
    paymentSheet = v8->_paymentSheet;
    v8->_paymentSheet = (SSPaymentSheet *)v35;
  }
  else
  {
    v37 = [v11 objectForKey:@"paymentSheetInfo"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_61;
    }
    id v31 = v37;
    paymentSheet = [(ISDialog *)v8 buyParams];
    v38 = (void *)[objc_alloc(MEMORY[0x263F7B2A8]) initWithServerResponse:v31 buyParams:paymentSheet];

    v39 = [(SSAuthenticationContext *)v8->_authenticationContext accountName];
    [v38 setAccountName:v39];

    v40 = [(ISDialog *)v8 message];
    if (v40) {
      [v38 setExplanation:v40];
    }
    v41 = [(ISDialog *)v8 title];
    if (v41) {
      [v38 setMessage:v41];
    }
    v42 = v8->_paymentSheet;
    v8->_paymentSheet = (SSPaymentSheet *)v38;
  }
  v37 = v31;
LABEL_61:
  if (!v8->_title && !v8->_message && ![(NSArray *)v8->_buttons count])
  {

    objc_super v8 = 0;
  }

LABEL_66:
  return v8;
}

- (ISDialog)initWithDialogDictionary:(id)a3
{
  return [(ISDialog *)self initWithDialogDictionary:a3 authenticationContext:0];
}

- (ISDialog)initWithError:(id)a3
{
  id v4 = a3;
  if (ISErrorIsEqual(v4, @"SSErrorDomain", 16))
  {
    v5 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v5 = [(ISDialog *)self init];
  if (v5)
  {
    id v6 = [v4 localizedFailureReason];
    [(ISDialog *)v5 setMessage:v6];

    id v7 = [v4 localizedDescription];
    [(ISDialog *)v5 setTitle:v7];

    self = [v4 userInfo];
    objc_super v8 = [(ISDialog *)self objectForKey:*MEMORY[0x263F7B500]];
    uint64_t v9 = [(ISDialog *)self objectForKey:*MEMORY[0x263F7B4F0]];
    uint64_t v10 = [(ISDialog *)self objectForKey:*MEMORY[0x263F7B4F8]];
    if (v8 && v9)
    {
      id v11 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_26C6A2310 table:0];
      v14 = +[ISDialogButton buttonWithTitle:v13];
      v15 = objc_msgSend(v11, "initWithObjects:", v14, 0);

      v16 = objc_alloc_init(ISDialogButton);
      [(ISDialogButton *)v16 setActionTypeWithString:v9];
      [(ISDialogButton *)v16 setParameter:v10];
      [(ISDialogButton *)v16 setTitle:v8];
      [v15 addObject:v16];
      [(ISDialog *)v5 setButtons:v15];
    }
    else
    {
      v17 = (void *)MEMORY[0x263EFF8C0];
      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"OK" value:&stru_26C6A2310 table:0];
      v18 = +[ISDialogButton buttonWithTitle:v16];
      id v19 = objc_msgSend(v17, "arrayWithObjects:", v18, 0);
      [(ISDialog *)v5 setButtons:v19];
    }
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (ISDialog)initWithOfferDeviceError:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ISDialog;
  v5 = [(ISDialog *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 localizedMessage];
    uint64_t v7 = [v4 localizedTitle];
    objc_super v8 = (void *)v7;
    if (v6 && v7)
    {
      [(ISDialog *)v5 setMessage:v6];
      uint64_t v9 = v8;
    }
    else
    {
      if (v6) {
        uint64_t v9 = (void *)v6;
      }
      else {
        uint64_t v9 = (void *)v7;
      }
      if (!(v6 | v7))
      {
        uint64_t v10 = v5;
        v5 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    [(ISDialog *)v5 setTitle:v9];
    uint64_t v10 = (ISDialog *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v11 = [v4 localizedURLTitle];
    uint64_t v12 = [v4 URL];
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = v13;
    if (v11 && v12)
    {
      v15 = [(ISDialogButton *)v13 localizedStringForKey:@"CANCEL" value:&stru_26C6A2310 table:0];
      v16 = +[ISDialogButton buttonWithTitle:v15];
      [(ISDialog *)v10 addObject:v16];

      v14 = objc_alloc_init(ISDialogButton);
      [(ISDialogButton *)v14 setActionType:4];
      [(ISDialogButton *)v14 setParameter:v12];
      [(ISDialogButton *)v14 setTitle:v11];
      [(ISDialog *)v10 addObject:v14];
    }
    else
    {
      v17 = [(ISDialogButton *)v13 localizedStringForKey:@"OK" value:&stru_26C6A2310 table:0];
      v18 = +[ISDialogButton buttonWithTitle:v17];
      [(ISDialog *)v10 addObject:v18];
    }
    [(ISDialog *)v5 setButtons:v10];

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (ISDialog)initWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(ISDialog *)self init];
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"OK" value:&stru_26C6A2310 table:0];
    uint64_t v12 = +[ISDialogButton buttonWithTitle:v11];
    v13 = objc_msgSend(v9, "arrayWithObjects:", v12, 0);
    [(ISDialog *)v8 setButtons:v13];

    [(ISDialog *)v8 setMessage:v7];
    [(ISDialog *)v8 setTitle:v6];
  }

  return v8;
}

- (void)dealloc
{
  [(ISDialog *)self setButtons:0];
  [(ISDialog *)self setMessage:0];
  [(ISDialog *)self setTextFields:0];
  [(ISDialog *)self setTitle:0];
  userNotificationValues = self->_userNotificationValues;
  if (userNotificationValues) {
    CFRelease(userNotificationValues);
  }
  v4.receiver = self;
  v4.super_class = (Class)ISDialog;
  [(ISDialog *)&v4 dealloc];
}

+ (int64_t)displayCountForKey:(id)a3
{
  CFStringRef v3 = (const __CFString *)[NSString stringWithFormat:@"ISDialogDisplayCount-%@", a3];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE60];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263EFFE60]);

  return CFPreferencesGetAppIntegerValue(v3, v4, 0);
}

- (id)copyUserNotification
{
  v2 = self;
  [(NSLock *)self->_lock lock];
  CFDictionaryRef userNotificationValues = v2->_userNotificationValues;
  if (!userNotificationValues)
  {
    [(NSLock *)v2->_lock unlock];
    goto LABEL_5;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, userNotificationValues);
  [(NSLock *)v2->_lock unlock];
  if (!MutableCopy)
  {
LABEL_5:
    id result = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    MutableCopy = (__CFDictionary *)result;
    if (!result) {
      return result;
    }
  }
  id v6 = [(ISDialog *)v2 title];
  if ([v6 length]) {
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263EFFFC8], v6);
  }
  id v7 = [(ISDialog *)v2 message];

  if (v7) {
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263EFFFD8], v7);
  }
  objc_super v8 = [(ISDialog *)v2 buttons];
  uint64_t v9 = [v8 count];
  unint64_t v10 = 0x263F08000;
  v65 = v2;
  if (v9 == 1)
  {
    id v11 = [v8 objectAtIndex:0];
    uint64_t v12 = (const void *)*MEMORY[0x263F00000];
    v13 = [v11 title];
    CFDictionarySetValue(MutableCopy, v12, v13);
  }
  else
  {
    uint64_t v14 = v9;
    id v11 = [(ISDialog *)v2 orderedButtonTitleKeysForCFUserNotification];
    CFMutableArrayRef v69 = (CFMutableArrayRef)[v11 count];
    v15 = MutableCopy;
    if (v14 >= 1)
    {
      for (i = 0; i != (char *)v14; ++i)
      {
        v17 = [v8 objectAtIndex:i];
        if ((uint64_t)i >= (uint64_t)((char *)v69 - 1)) {
          v18 = (char *)v69 - 1;
        }
        else {
          v18 = i;
        }
        id v19 = (const void *)[v11 objectAtIndex:v18];
        [v17 title];
        int v21 = v20 = v8;
        CFDictionarySetValue(v15, v19, v21);

        objc_super v8 = v20;
      }
    }
    v2 = v65;
    uint64_t v22 = [(ISDialog *)v65 defaultButtonIndex];
    MutableCopy = v15;
    unint64_t v10 = 0x263F08000uLL;
    if ((v22 & 0x8000000000000000) == 0)
    {
      uint64_t v23 = v22;
      if (v22 < (uint64_t)v69)
      {
        uint64_t v24 = objc_msgSend((id)objc_opt_class(), "buttonTagForCFUserNotificationButtonTitleKey:", objc_msgSend(v11, "objectAtIndex:", v23));
        CFDictionarySetValue(v15, (const void *)*MEMORY[0x263F79600], (const void *)[NSNumber numberWithInt:v24]);
      }
    }
    uint64_t v25 = [(ISDialog *)v65 unlockActionButtonIndex];
    if ((v25 & 0x8000000000000000) == 0)
    {
      uint64_t v26 = v25;
      if (v25 < (uint64_t)v69)
      {
        uint64_t v27 = objc_msgSend((id)objc_opt_class(), "buttonTagForCFUserNotificationButtonTitleKey:", objc_msgSend(v11, "objectAtIndex:", v26));
        CFDictionarySetValue(v15, (const void *)*MEMORY[0x263F795F0], (const void *)[NSNumber numberWithInt:v27]);
      }
    }
  }

  v28 = [(ISDialog *)v2 textFields];
  uint64_t v29 = [v28 count];
  if (v29 < 1)
  {
    uint64_t v34 = 3;
  }
  else
  {
    uint64_t v30 = v29;
    v64 = v8;
    id v31 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    v70 = CFArrayCreateMutable(0, 0, v31);
    v68 = CFArrayCreateMutable(0, 0, v31);
    theArray = CFArrayCreateMutable(0, 0, v31);
    v66 = CFArrayCreateMutable(0, 0, v31);
    uint64_t v33 = 0;
    uint64_t v34 = 3;
    do
    {
      uint64_t v35 = [v28 objectAtIndex:v33];
      [v35 title];
      v36 = v28;
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v37) {
        v38 = v37;
      }
      else {
        v38 = &stru_26C6A2310;
      }
      CFArrayAppendValue(theArray, v38);
      id v7 = [v35 value];

      if (v7) {
        v39 = v7;
      }
      else {
        v39 = &stru_26C6A2310;
      }
      CFArrayAppendValue(v66, v39);
      CFArrayAppendValue(Mutable, (const void *)[*(id *)(v10 + 2584) numberWithInt:0]);
      CFArrayAppendValue(v70, (const void *)[*(id *)(v10 + 2584) numberWithInt:1]);
      v40 = *(void **)(v10 + 2584);
      uint64_t v41 = [v35 keyboardType];
      v42 = v40;
      v28 = v36;
      CFArrayAppendValue(v68, (const void *)[v42 numberWithInteger:v41]);
      int v43 = [v35 isSecure];
      uint64_t v44 = 0x10000 << v33;
      if (!v43) {
        uint64_t v44 = 0;
      }
      v34 |= v44;

      ++v33;
    }
    while (v30 != v33);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F79690], Mutable);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F79698], v70);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F00010], v68);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F00028], theArray);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F00030], v66);
    CFRelease(Mutable);
    CFRelease(v70);
    CFRelease(v68);
    CFRelease(theArray);
    CFRelease(v66);
    v2 = v65;
    objc_super v8 = v64;
  }
  id v45 = (const void *)*MEMORY[0x263F79618];
  BOOL v46 = [(ISDialog *)v2 displaysOnLockscreen];
  v47 = (const void *)*MEMORY[0x263EFFB40];
  v48 = (const void *)*MEMORY[0x263EFFB38];
  if (v46) {
    v49 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    v49 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(MutableCopy, v45, v49);
  v50 = (const void *)*MEMORY[0x263F79640];
  if ([(ISDialog *)v2 displaysOnLockscreen]) {
    v51 = v47;
  }
  else {
    v51 = v48;
  }
  CFDictionarySetValue(MutableCopy, v50, v51);
  v52 = (const void *)*MEMORY[0x263F795D0];
  if ([(ISDialog *)v2 dismissOnHomeButton]) {
    v53 = v47;
  }
  else {
    v53 = v48;
  }
  CFDictionarySetValue(MutableCopy, v52, v53);
  v54 = (const void *)*MEMORY[0x263F79610];
  if ([(ISDialog *)v2 dismissOnLock]) {
    v55 = v47;
  }
  else {
    v55 = v48;
  }
  CFDictionarySetValue(MutableCopy, v54, v55);
  v56 = (const void *)*MEMORY[0x263EFFFE0];
  if ([(ISDialog *)v2 shouldDisplayAsTopMost]) {
    v57 = v47;
  }
  else {
    v57 = v48;
  }
  CFDictionarySetValue(MutableCopy, v56, v57);
  v58 = (const void *)*MEMORY[0x263F79628];
  if ([(ISDialog *)v2 shouldDismissAfterUnlock]) {
    v59 = v48;
  }
  else {
    v59 = v47;
  }
  CFDictionarySetValue(MutableCopy, v58, v59);
  v60 = (const void *)*MEMORY[0x263F79660];
  if ([(ISDialog *)v2 shouldPendInSetupIfNotAllowed]) {
    v61 = v47;
  }
  else {
    v61 = v48;
  }
  CFDictionarySetValue(MutableCopy, v60, v61);
  if (v2->_noDefaultButton) {
    uint64_t v62 = v34 | 0x20;
  }
  else {
    uint64_t v62 = v34;
  }
  v63 = [[ISUserNotification alloc] initWithDictionary:MutableCopy options:v62];
  CFRelease(MutableCopy);

  return v63;
}

- (void)copyValueForCFUserNotificationKey:(__CFString *)a3
{
  [(NSLock *)self->_lock lock];
  CFDictionaryRef userNotificationValues = self->_userNotificationValues;
  if (userNotificationValues && (Value = CFDictionaryGetValue(userNotificationValues, a3)) != 0) {
    CFTypeRef v7 = CFRetain(Value);
  }
  else {
    CFTypeRef v7 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return (void *)v7;
}

- (NSString)displayCountKey
{
  [(NSLock *)self->_lock lock];
  CFStringRef v3 = self->_displayCountKey;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (void)incrementDisplayCount
{
  [(NSLock *)self->_lock lock];
  if (self->_displayCountKey)
  {
    CFStringRef v3 = (const __CFString *)[NSString stringWithFormat:@"ISDialogDisplayCount-%@", self->_displayCountKey];
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE60];
    CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263EFFE60]);
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", CFPreferencesGetAppIntegerValue(v3, v4, 0) + 1);
    CFPreferencesSetAppValue(v3, v5, v4);

    CFPreferencesAppSynchronize(v4);
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (BOOL)isDisplayable
{
  [(NSLock *)self->_lock lock];
  if (self->_displayCountKey && self->_maxDisplayCount >= 1)
  {
    CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE60];
    CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263EFFE60]);
    BOOL v4 = CFPreferencesGetAppIntegerValue((CFStringRef)[NSString stringWithFormat:@"ISDialogDisplayCount-%@", self->_displayCountKey], v3, 0) < self->_maxDisplayCount;
  }
  else
  {
    BOOL v4 = 1;
  }
  [(NSLock *)self->_lock unlock];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(ISDialog *)self message];
    id v6 = [v4 message];
    if (v5 == v6) {
      int v7 = 1;
    }
    else {
      int v7 = [v5 isEqual:v6];
    }
    uint64_t v9 = [(ISDialog *)self title];

    unint64_t v10 = [v4 title];

    if (v7)
    {
      if (v9 == v10) {
        char v11 = 1;
      }
      else {
        char v11 = [v9 isEqual:v10];
      }
    }
    else
    {
      char v11 = 0;
    }
    uint64_t v12 = [(ISDialog *)self buttons];

    v13 = [v4 buttons];

    if (v11)
    {
      if (v12 == v13)
      {
        int v8 = 1;
      }
      else
      {
        uint64_t v14 = [v12 count];
        int v8 = v14 == [v13 count];
      }
      uint64_t v16 = [v12 count];
      if (v16 >= 1 && v8)
      {
        uint64_t v17 = v16;
        uint64_t v18 = 1;
        do
        {
          id v19 = [v12 objectAtIndex:v18 - 1];
          objc_super v20 = [v13 objectAtIndex:v18 - 1];
          LOBYTE(v8) = [v19 isEqual:v20 superficial:0];

          if (v18 >= v17) {
            break;
          }
          ++v18;
        }
        while ((v8 & 1) != 0);
      }
    }
    else
    {
      [v12 count];
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (int64_t)maximumDisplayCount
{
  [(NSLock *)self->_lock lock];
  int64_t maxDisplayCount = self->_maxDisplayCount;
  [(NSLock *)self->_lock unlock];
  return maxDisplayCount;
}

- (void)setButtonsWithTitles:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v12 = objc_alloc_init(ISDialogButton);
          -[ISDialogButton setTitle:](v12, "setTitle:", v11, (void)v13);
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(ISDialog *)self setButtons:v5];
  }
  else
  {
    [(ISDialog *)self setButtons:0];
  }
}

- (void)setDisplayCountKey:(id)a3
{
  id v6 = (NSString *)a3;
  [(NSLock *)self->_lock lock];
  if (self->_displayCountKey != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    displayCountKey = self->_displayCountKey;
    self->_displayCountKey = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)setMaximumDisplayCount:(int64_t)a3
{
  [(NSLock *)self->_lock lock];
  self->_int64_t maxDisplayCount = a3;
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setValue:(id)a3 forUserInfoKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(NSLock *)self->_lock lock];
  if (!self->_userInfo)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    userInfo = self->_userInfo;
    self->_userInfo = v7;
  }
  uint64_t v9 = self->_userInfo;
  if (v10) {
    [(NSMutableDictionary *)v9 setObject:v10 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)v9 removeObjectForKey:v6];
  }
  [(NSLock *)self->_lock unlock];
}

- (void)setValue:(void *)a3 forCFUserNotificationKey:(__CFString *)a4
{
  [(NSLock *)self->_lock lock];
  CFDictionaryRef userNotificationValues = self->_userNotificationValues;
  if (a3)
  {
    if (!userNotificationValues)
    {
      CFDictionaryRef userNotificationValues = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      self->_CFDictionaryRef userNotificationValues = userNotificationValues;
    }
    CFDictionarySetValue(userNotificationValues, a4, a3);
  }
  else if (userNotificationValues)
  {
    CFDictionaryRemoveValue(userNotificationValues, a4);
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (id)valueForUserInfoKey:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  id v6 = [(NSMutableDictionary *)self->_userInfo objectForKey:v5];

  [(NSLock *)self->_lock unlock];

  return v6;
}

- (id)orderedButtonTitleKeysForCFUserNotification
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F00000];
  v12[0] = *MEMORY[0x263EFFFE8];
  v12[1] = v3;
  uint64_t v13 = *MEMORY[0x263F00020];
  v11[0] = v12[0];
  v11[1] = v13;
  v11[2] = v3;
  [(NSLock *)self->_lock lock];
  BOOL noDefaultButton = self->_noDefaultButton;
  NSUInteger v5 = [(NSArray *)self->_buttons count];
  [(NSLock *)self->_lock unlock];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFF8C0]);
    if (noDefaultButton) {
      uint64_t v7 = v11;
    }
    else {
      uint64_t v7 = v12;
    }
    if (v5 >= 3) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = v5;
    }
    uint64_t v9 = (void *)[v6 initWithObjects:v7 count:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (void)_initializeStaticButtonTitleKeyAndTagMapping
{
  if (_initializeStaticButtonTitleKeyAndTagMapping_sButtonTitleKeyAndTagMappingOnceToken != -1) {
    dispatch_once(&_initializeStaticButtonTitleKeyAndTagMapping_sButtonTitleKeyAndTagMappingOnceToken, &__block_literal_global_10);
  }
}

void *__56__ISDialog__initializeStaticButtonTitleKeyAndTagMapping__block_invoke()
{
  uint64_t v0 = *MEMORY[0x263F00000];
  uint64_t v1 = *MEMORY[0x263EFFFE8];
  uint64_t v2 = *MEMORY[0x263F00020];
  sButtonTitleKeyAndTagMappingCount = 1;
  id result = malloc_type_malloc(0x30uLL, 0xCA20526uLL);
  sButtonTitleKeyAndTagMapping = (uint64_t)result;
  *id result = v0;
  result[1] = 0;
  result[2] = v1;
  result[3] = 1;
  result[4] = v2;
  result[5] = 2;
  return result;
}

+ (unint64_t)buttonTagForCFUserNotificationButtonTitleKey:(__CFString *)a3
{
  [a1 _initializeStaticButtonTitleKeyAndTagMapping];
  if (!a3 || sButtonTitleKeyAndTagMappingCount != 1) {
    return 0;
  }
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  while (!CFEqual(a3, *(CFTypeRef *)(sButtonTitleKeyAndTagMapping + v4)))
  {
    BOOL v6 = sButtonTitleKeyAndTagMappingCount != 1 || v5++ >= 2;
    v4 += 16;
    if (v6) {
      return 0;
    }
  }
  return *(void *)(sButtonTitleKeyAndTagMapping + v4 + 8);
}

+ (__CFString)buttonTitleKeyForCFUserNotificationButtonTag:(unint64_t)a3
{
  [a1 _initializeStaticButtonTitleKeyAndTagMapping];
  if (sButtonTitleKeyAndTagMappingCount != 1) {
    return 0;
  }
  uint64_t v4 = (void *)(sButtonTitleKeyAndTagMapping + 8);
  uint64_t v5 = -1;
  while (*v4 != a3)
  {
    v4 += 2;
    if ((unint64_t)++v5 >= 2) {
      return 0;
    }
  }
  return (__CFString *)*(v4 - 1);
}

- (id)buyParams
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  uint64_t v2 = [(ISDialog *)self buttons];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__ISDialog_buyParams__block_invoke;
  v5[3] = &unk_264261498;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __21__ISDialog_buyParams__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id obj = [a2 parameter];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
    *a4 = 1;
  }
}

- (int64_t)_kindForString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = [v3 isEqualToString:@"authorization"];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (ISDialog)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x2166C7F80](v4) == MEMORY[0x263EF8708])
  {
    uint64_t v6 = [(ISDialog *)self init];
    if (!v6) {
      goto LABEL_5;
    }
    v6->_allowDuplicates = xpc_dictionary_get_BOOL(v5, "1");
    id v8 = objc_alloc(MEMORY[0x263F7B120]);
    uint64_t v9 = xpc_dictionary_get_value(v5, "2");
    uint64_t v10 = [v8 initWithXPCEncoding:v9];
    authenticationContext = v6->_authenticationContext;
    v6->_authenticationContext = (SSAuthenticationContext *)v10;

    v6->_authorizationIsForced = xpc_dictionary_get_BOOL(v5, "3");
    xpc_dictionary_get_value(v5, "4");
    uint64_t v12 = (ISDialog *)objc_claimAutoreleasedReturnValue();
    self = v12;
    uint64_t v13 = MEMORY[0x263EF86D8];
    if (v12 && MEMORY[0x2166C7F80](v12) == v13)
    {
      objc_opt_class();
      uint64_t v14 = SSXPCCreateNSArrayFromXPCEncodedArray();
      buttons = v6->_buttons;
      v6->_buttons = (NSArray *)v14;
    }
    v6->_defaultButtonIndex = xpc_dictionary_get_int64(v5, "5");
    v6->_dismissOnHomeButton = xpc_dictionary_get_BOOL(v5, "6");
    v6->_dismissOnLock = xpc_dictionary_get_BOOL(v5, "7");
    objc_opt_class();
    uint64_t v16 = SSXPCDictionaryCopyCFObjectWithClass();
    displayCountKey = v6->_displayCountKey;
    v6->_displayCountKey = (NSString *)v16;

    v6->_expectsResponse = xpc_dictionary_get_BOOL(v5, "9");
    v6->_groupsTextFields = xpc_dictionary_get_BOOL(v5, "A");
    v6->_kind = xpc_dictionary_get_int64(v5, "B");
    v6->_int64_t maxDisplayCount = xpc_dictionary_get_int64(v5, "C");
    objc_opt_class();
    uint64_t v18 = SSXPCDictionaryCopyCFObjectWithClass();
    message = v6->_message;
    v6->_message = (NSString *)v18;

    v6->_BOOL noDefaultButton = xpc_dictionary_get_BOOL(v5, "N");
    v6->_oneButtonPerLine = xpc_dictionary_get_BOOL(v5, "E");
    v6->_shouldDismissAfterUnlock = xpc_dictionary_get_BOOL(v5, "F");
    v6->_shouldDisplayAsTopMost = xpc_dictionary_get_BOOL(v5, "G");
    v6->_shouldPendInSetupIfNotAllowed = xpc_dictionary_get_BOOL(v5, "H");
    uint64_t v20 = xpc_dictionary_get_value(v5, "I");
    int v21 = (void *)v20;
    if (v20 && MEMORY[0x2166C7F80](v20) == v13)
    {
      objc_opt_class();
      uint64_t v22 = SSXPCCreateNSArrayFromXPCEncodedArray();
      textFields = v6->_textFields;
      v6->_textFields = (NSArray *)v22;
    }
    objc_opt_class();
    uint64_t v24 = SSXPCDictionaryCopyCFObjectWithClass();
    title = v6->_title;
    v6->_title = (NSString *)v24;

    v6->_unlockActionButtonIndex = xpc_dictionary_get_int64(v5, "K");
    objc_opt_class();
    uint64_t v26 = SSXPCDictionaryCopyCFObjectWithClass();
    userInfo = v6->_userInfo;
    v6->_userInfo = (NSMutableDictionary *)v26;

    objc_opt_class();
    CFDictionaryRef v28 = (const __CFDictionary *)SSXPCDictionaryCopyCFObjectWithClass();
    if (v28) {
      v6->_CFDictionaryRef userNotificationValues = CFDictionaryCreateMutableCopy(0, 0, v28);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  [(NSLock *)self->_lock lock];
  xpc_dictionary_set_BOOL(v3, "1", self->_allowDuplicates);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "3", self->_authorizationIsForced);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_int64(v3, "5", self->_defaultButtonIndex);
  xpc_dictionary_set_BOOL(v3, "6", self->_dismissOnHomeButton);
  xpc_dictionary_set_BOOL(v3, "7", self->_dismissOnLock);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "9", self->_expectsResponse);
  xpc_dictionary_set_BOOL(v3, "A", self->_groupsTextFields);
  xpc_dictionary_set_int64(v3, "B", self->_kind);
  xpc_dictionary_set_int64(v3, "C", self->_maxDisplayCount);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "N", self->_noDefaultButton);
  xpc_dictionary_set_BOOL(v3, "E", self->_oneButtonPerLine);
  xpc_dictionary_set_BOOL(v3, "F", self->_shouldDismissAfterUnlock);
  xpc_dictionary_set_BOOL(v3, "G", self->_shouldDisplayAsTopMost);
  xpc_dictionary_set_BOOL(v3, "H", self->_shouldPendInSetupIfNotAllowed);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_int64(v3, "K", self->_unlockActionButtonIndex);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)allowDuplicates
{
  return self->_allowDuplicates;
}

- (void)setAllowDuplicates:(BOOL)a3
{
  self->_allowDuplicates = a3;
}

- (SSAuthenticationContext)authenticationContext
{
  return (SSAuthenticationContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthenticationContext:(id)a3
{
}

- (BOOL)authorizationIsForced
{
  return self->_authorizationIsForced;
}

- (void)setAuthorizationIsForced:(BOOL)a3
{
  self->_authorizationIsForced = a3;
}

- (NSArray)buttons
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setButtons:(id)a3
{
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  self->_defaultButtonIndex = a3;
}

- (BOOL)dismissOnHomeButton
{
  return self->_dismissOnHomeButton;
}

- (void)setDismissOnHomeButton:(BOOL)a3
{
  self->_dismissOnHomeButton = a3;
}

- (BOOL)dismissOnLock
{
  return self->_dismissOnLock;
}

- (void)setDismissOnLock:(BOOL)a3
{
  self->_dismissOnLock = a3;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (BOOL)groupsTextFields
{
  return self->_groupsTextFields;
}

- (void)setGroupsTextFields:(BOOL)a3
{
  self->_groupsTextFields = a3;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMessage:(id)a3
{
}

- (BOOL)noDefaultButton
{
  return self->_noDefaultButton;
}

- (void)setNoDefaultButton:(BOOL)a3
{
  self->_BOOL noDefaultButton = a3;
}

- (BOOL)oneButtonPerLine
{
  return self->_oneButtonPerLine;
}

- (void)setOneButtonPerLine:(BOOL)a3
{
  self->_oneButtonPerLine = a3;
}

- (BOOL)shouldDismissAfterUnlock
{
  return self->_shouldDismissAfterUnlock;
}

- (void)setShouldDismissAfterUnlock:(BOOL)a3
{
  self->_shouldDismissAfterUnlock = a3;
}

- (BOOL)shouldDisplayAsTopMost
{
  return self->_shouldDisplayAsTopMost;
}

- (void)setShouldDisplayAsTopMost:(BOOL)a3
{
  self->_shouldDisplayAsTopMost = a3;
}

- (BOOL)shouldPendInSetupIfNotAllowed
{
  return self->_shouldPendInSetupIfNotAllowed;
}

- (void)setShouldPendInSetupIfNotAllowed:(BOOL)a3
{
  self->_shouldPendInSetupIfNotAllowed = a3;
}

- (NSArray)textFields
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTextFields:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTitle:(id)a3
{
}

- (int64_t)unlockActionButtonIndex
{
  return self->_unlockActionButtonIndex;
}

- (void)setUnlockActionButtonIndex:(int64_t)a3
{
  self->_unlockActionButtonIndex = a3;
}

- (BOOL)displaysOnLockscreen
{
  return self->_displaysOnLockscreen;
}

- (void)setDisplaysOnLockscreen:(BOOL)a3
{
  self->_displaysOnLockscreen = a3;
}

- (SSPaymentSheet)paymentSheet
{
  return (SSPaymentSheet *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)touchIDContinueToken
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTouchIDContinueToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDContinueToken, 0);
  objc_storeStrong((id *)&self->_paymentSheet, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_displayCountKey, 0);
  objc_storeStrong((id *)&self->_buttons, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end