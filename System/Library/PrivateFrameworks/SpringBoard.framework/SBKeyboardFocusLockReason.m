@interface SBKeyboardFocusLockReason
+ (id)accessibility:(id)a3;
+ (id)activeTransientOverlay;
+ (id)addWidgetSheet;
+ (id)appSwitcher;
+ (id)commandTab;
+ (id)controlCenter;
+ (id)coverSheet;
+ (id)coverSheetHostingApp;
+ (id)floatingDock;
+ (id)keyShortcutHUD;
+ (id)modalAppLibrary;
+ (id)modalBannerInLongLook;
+ (id)mostRecentReasonInSet:(id)a3 strength:(int64_t)a4;
+ (id)screenIsDim;
+ (id)systemModalAlert;
+ (id)universalControl;
+ (int64_t)maximumStrengthInSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMoreRecentThanReason:(id)a3;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)name;
- (int64_t)strength;
- (unint64_t)hash;
- (void)_initReasonWithName:(uint64_t)a3 strength:;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation SBKeyboardFocusLockReason

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

+ (id)coverSheet
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"coverSheet", 2);
  return v2;
}

+ (id)controlCenter
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"controlCenter", 2);
  return v2;
}

- (void)_initReasonWithName:(uint64_t)a3 strength:
{
  id v6 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)SBKeyboardFocusLockReason;
    id v7 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 3, a2);
      a1[1] = a3;
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      v9 = (void *)a1[2];
      a1[2] = v8;
    }
  }

  return a1;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSString *)self->_name isEqual:v4[3]]
    && self->_strength == v4[1];

  return v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

+ (id)appSwitcher
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"appSwitcher", 2);
  return v2;
}

+ (id)commandTab
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"commandTab", 2);
  return v2;
}

+ (id)coverSheetHostingApp
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"coverSheetHostingApp", 2);
  return v2;
}

+ (id)keyShortcutHUD
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"keyShortcutHUD", 2);
  return v2;
}

+ (id)modalBannerInLongLook
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"modalBannerInLongLook", 2);
  return v2;
}

+ (id)screenIsDim
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"screenIsDim", 2);
  return v2;
}

+ (id)systemModalAlert
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"systemModalAlert", 2);
  return v2;
}

+ (id)universalControl
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"universalControl", 2);
  return v2;
}

+ (id)accessibility:(id)a3
{
  id v4 = a3;
  BOOL v5 = NSString;
  objc_opt_class();
  id v6 = (objc_class *)objc_opt_class();
  if (!v4)
  {
    objc_super v11 = NSStringFromClass(v6);
    v12 = [v5 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"subreason", v11];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBKeyboardFocusLockReason accessibility:](a2);
    }
LABEL_13:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8B4524CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = NSString;
    v14 = (objc_class *)[v4 classForCoder];
    if (!v14) {
      v14 = (objc_class *)objc_opt_class();
    }
    v15 = NSStringFromClass(v14);
    objc_opt_class();
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v12 = [v13 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"subreason", v15, v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBKeyboardFocusLockReason accessibility:](a2);
    }
    goto LABEL_13;
  }

  id v7 = [SBKeyboardFocusLockReason alloc];
  uint64_t v8 = [@"accessibility-" stringByAppendingString:v4];
  v9 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:](v7, v8, 2);

  return v9;
}

+ (id)activeTransientOverlay
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"activeTransientOverlay", 1);
  return v2;
}

+ (id)addWidgetSheet
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"addWidgetSheet", 1);
  return v2;
}

+ (id)floatingDock
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"floatingDock", 1);
  return v2;
}

+ (id)modalAppLibrary
{
  v2 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], @"modalAppLibrary", 1);
  return v2;
}

+ (int64_t)maximumStrengthInSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "strength", (void)v11);
      if (v9 > v6)
      {
        int64_t v6 = v9;
        if (v9 == 2) {
          break;
        }
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isMoreRecentThanReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBKeyboardFocusLockReason *)self timestamp];
  int64_t v6 = [v4 timestamp];

  LOBYTE(v4) = [v5 compare:v6] == 1;
  return (char)v4;
}

+ (id)mostRecentReasonInSet:(id)a3 strength:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 strength] == a4)
        {
          if (v8)
          {
            if ([v11 isMoreRecentThanReason:v8])
            {
              id v12 = v11;

              id v8 = v12;
            }
          }
          else
          {
            id v8 = v11;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SBKeyboardFocusLockReason_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __55__SBKeyboardFocusLockReason_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:0];
  id v3 = *(void **)(a1 + 32);
  id v4 = NSStringFromSBKeyboardFocusLockReasonStrength(*(void *)(*(void *)(a1 + 40) + 8));
  [v3 appendString:v4 withName:0];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"date"];
}

- (int64_t)strength
{
  return self->_strength;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)name
{
  return self->_name;
}

+ (void)accessibility:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_20();
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end