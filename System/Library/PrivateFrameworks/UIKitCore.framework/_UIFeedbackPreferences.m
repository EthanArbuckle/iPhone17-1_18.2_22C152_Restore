@interface _UIFeedbackPreferences
+ (id)sharedPreferences;
- (NSDictionary)defaultFeedbackTypes;
- (NSUserDefaults)userDefaults;
- (_UIFeedbackPreferences)init;
- (id)_categoryForNullableCategory:(id)a3;
- (id)_categoryKeyForCategory:(id)a3 type:(unint64_t)a4;
- (id)_defaultKeyForCategoryKey:(id)a3 type:(unint64_t)a4;
- (unint64_t)_defaultFeedbackTypesForCategory:(id)a3;
- (unint64_t)_enabledFeedbackTypesForCategory:(id)a3;
- (unint64_t)enabledFeedbackTypesForCategory:(id)a3;
- (void)_invalidate;
- (void)_setEnabledFeedbackTypes:(unint64_t)a3 forCategory:(id)a4;
- (void)_setEnabledFeedbackTypes:(unint64_t)a3 forCategory:(id)a4 postNotification:(BOOL)a5;
- (void)_startObservingDefaults;
- (void)_updateEnabledFeedbackTypes:(unint64_t *)a3 forKey:(id)a4 type:(unint64_t)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setUserDefaults:(id)a3;
@end

@implementation _UIFeedbackPreferences

+ (id)sharedPreferences
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___UIFeedbackPreferences_sharedPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1035 != -1) {
    dispatch_once(&_MergedGlobals_1035, block);
  }
  v2 = (void *)qword_1EB2604A8;
  return v2;
}

- (unint64_t)enabledFeedbackTypesForCategory:(id)a3
{
  v4 = [(_UIFeedbackPreferences *)self _categoryForNullableCategory:a3];
  v5 = [(NSMutableDictionary *)self->_enabledFeedbackTypes objectForKeyedSubscript:v4];

  if (!v5) {
    [(_UIFeedbackPreferences *)self _setEnabledFeedbackTypes:[(_UIFeedbackPreferences *)self _enabledFeedbackTypesForCategory:v4] forCategory:v4 postNotification:0];
  }
  v6 = [(NSMutableDictionary *)self->_enabledFeedbackTypes objectForKeyedSubscript:v4];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (id)_categoryForNullableCategory:(id)a3
{
  if (a3) {
    return a3;
  }
  else {
    return @"effects";
  }
}

- (void)_setEnabledFeedbackTypes:(unint64_t)a3 forCategory:(id)a4 postNotification:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = NSNumber;
  id v9 = a4;
  v10 = [v8 numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_enabledFeedbackTypes setObject:v10 forKeyedSubscript:v9];

  if (v5)
  {
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"_UIFeedbackPreferencesDidChangeNotification" object:self];
  }
}

- (unint64_t)_enabledFeedbackTypesForCategory:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIFeedbackPreferences *)self _categoryKeyForCategory:v4 type:1];
  v6 = [(_UIFeedbackPreferences *)self _categoryKeyForCategory:v4 type:2];
  unint64_t v7 = [(_UIFeedbackPreferences *)self _categoryKeyForCategory:v4 type:4];
  v8 = [(_UIFeedbackPreferences *)self _categoryKeyForCategory:v4 type:8];
  unint64_t v20 = [(_UIFeedbackPreferences *)self _defaultFeedbackTypesForCategory:v4];
  [(NSUserDefaults *)self->_userDefaults synchronize];
  [(_UIFeedbackPreferences *)self _updateEnabledFeedbackTypes:&v20 forKey:v5 type:1];
  [(_UIFeedbackPreferences *)self _updateEnabledFeedbackTypes:&v20 forKey:v6 type:2];
  [(_UIFeedbackPreferences *)self _updateEnabledFeedbackTypes:&v20 forKey:v7 type:4];
  [(_UIFeedbackPreferences *)self _updateEnabledFeedbackTypes:&v20 forKey:v8 type:8];
  id v9 = +[UIDevice currentDevice];
  uint64_t v10 = [v9 _feedbackSupportLevel];
  char v11 = v20;

  if (v10 <= 1 && (v11 & 1) == 0) {
    unint64_t v20 = 0;
  }
  v12 = (__CFString *)v4;
  v13 = v12;
  if (v12 == @"3DTouch") {
    goto LABEL_17;
  }
  if (!v12) {
    goto LABEL_13;
  }
  int v14 = [(__CFString *)v12 isEqual:@"3DTouch"];

  if (v14)
  {
LABEL_17:
    if (_AXSForceTouchEnabled()) {
      v20 |= 2uLL;
    }
  }
  v15 = v13;
  if (v15 == @"effects-keyboardclicks")
  {
LABEL_12:
    [(_UIFeedbackPreferences *)self _updateEnabledFeedbackTypes:&v20 forKey:@"effects" type:2];
    [(_UIFeedbackPreferences *)self _updateEnabledFeedbackTypes:&v20 forKey:@"keyboard" type:1];
    goto LABEL_14;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_13:

    goto LABEL_14;
  }
  int v17 = [(__CFString *)v15 isEqual:@"effects-keyboardclicks"];

  if (v17) {
    goto LABEL_12;
  }
LABEL_14:
  unint64_t v18 = v20;

  return v18;
}

- (void)_updateEnabledFeedbackTypes:(unint64_t *)a3 forKey:(id)a4 type:(unint64_t)a5
{
  id v8 = a4;
  id v15 = v8;
  if (a5 != 1
    || (id v9 = (__CFString *)v8, v8 = v15, v9 != @"effects")
    && ((uint64_t v10 = v9) == 0
     || (char v11 = [(__CFString *)v9 isEqual:@"effects"], v10, v8 = v15, (v11 & 1) == 0)))
  {
    v12 = [(_UIFeedbackPreferences *)self _defaultKeyForCategoryKey:v8 type:a5];
    v13 = [(NSUserDefaults *)self->_userDefaults objectForKey:v12];

    if (v13)
    {
      if ([(NSUserDefaults *)self->_userDefaults BOOLForKey:v12]) {
        unint64_t v14 = *a3 | a5;
      }
      else {
        unint64_t v14 = *a3 & ~a5;
      }
      *a3 = v14;
    }

    id v8 = v15;
  }
}

- (unint64_t)_defaultFeedbackTypesForCategory:(id)a3
{
  id v4 = [(_UIFeedbackPreferences *)self _categoryForNullableCategory:a3];
  int v17 = [(_UIFeedbackPreferences *)self _categoryKeyForCategory:v4 type:1];
  BOOL v5 = [(_UIFeedbackPreferences *)self _categoryKeyForCategory:v4 type:2];
  v6 = [(_UIFeedbackPreferences *)self _categoryKeyForCategory:v4 type:4];
  unint64_t v7 = [(_UIFeedbackPreferences *)self _categoryKeyForCategory:v4 type:8];
  id v8 = [(NSDictionary *)self->_defaultFeedbackTypes objectForKeyedSubscript:v17];
  char v9 = [v8 unsignedIntegerValue];
  uint64_t v10 = [(NSDictionary *)self->_defaultFeedbackTypes objectForKeyedSubscript:v6];
  uint64_t v11 = [v10 unsignedIntegerValue] & 4 | v9 & 1;
  v12 = [(NSDictionary *)self->_defaultFeedbackTypes objectForKeyedSubscript:v7];
  uint64_t v13 = [v12 unsignedIntegerValue] & 8;
  unint64_t v14 = [(NSDictionary *)self->_defaultFeedbackTypes objectForKeyedSubscript:v5];
  unint64_t v15 = v11 | v13 | [v14 unsignedIntegerValue] & 2;

  return v15;
}

- (id)_categoryKeyForCategory:(id)a3 type:(unint64_t)a4
{
  BOOL v5 = (__CFString *)a3;
  v6 = v5;
  if (v5 == @"3DTouch")
  {
    id v8 = @"effects";
  }
  else
  {
    if (!v5) {
      goto LABEL_10;
    }
    char v7 = [(__CFString *)v5 isEqual:@"3DTouch"];

    id v8 = @"effects";
    if (v7) {
      goto LABEL_11;
    }
    char v9 = v6;
    if (v9 == @"effects-keyboardclicks"
      || (v10 = v9, int v11 = [(__CFString *)v9 isEqual:@"effects-keyboardclicks"],
                    v10,
                    v11))
    {
      if (a4 == 1) {
        id v8 = @"keyboard";
      }
    }
    else
    {
LABEL_10:
      id v8 = v6;
    }
  }
LABEL_11:

  return v8;
}

- (_UIFeedbackPreferences)init
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackPreferences;
  v2 = [(_UIFeedbackPreferences *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(_UIFeedbackPreferences *)v2 setUserDefaults:0];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    enabledFeedbackTypes = v3->_enabledFeedbackTypes;
    v3->_enabledFeedbackTypes = (NSMutableDictionary *)v4;

    v11[0] = @"effects";
    v11[1] = @"keyboard";
    v12[0] = &unk_1ED3F3FD8;
    v12[1] = &unk_1ED3F3FD8;
    v11[2] = @"lock";
    v11[3] = @"effects-keyboardclicks";
    v12[2] = &unk_1ED3F3FD8;
    v12[3] = &unk_1ED3F3FD8;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
    defaultFeedbackTypes = v3->_defaultFeedbackTypes;
    v3->_defaultFeedbackTypes = (NSDictionary *)v6;

    [(_UIFeedbackPreferences *)v3 _startObservingDefaults];
    id v8 = v3;
  }

  return v3;
}

- (void)setUserDefaults:(id)a3
{
  uint64_t v4 = (NSUserDefaults *)a3;
  if (!v4) {
    uint64_t v4 = (NSUserDefaults *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.preferences.sounds"];
  }
  userDefaults = self->_userDefaults;
  self->_userDefaults = v4;
}

- (void)_startObservingDefaults
{
  v17[3] = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___UIFeedbackPreferences__startObservingDefaults__block_invoke;
  aBlock[3] = &unk_1E52EDAE8;
  aBlock[4] = self;
  v3 = (void (**)(void *, void, uint64_t))_Block_copy(aBlock);
  v17[0] = @"effects";
  v17[1] = @"keyboard";
  v17[2] = @"lock";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v3[2](v3, v9, 1);
        v3[2](v3, v9, 2);
        v3[2](v3, v9, 4);
        v3[2](v3, v9, 8);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  objc_super v10 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", (void)v11);
  [v10 addObserver:self selector:sel__accessibilityForceTouchChanged_ name:@"UIAccessibilityForceTouchStatusChangedNotification" object:0];
}

- (id)_defaultKeyForCategoryKey:(id)a3 type:(unint64_t)a4
{
  id v4 = @"pencil-haptic";
  uint64_t v5 = @"haptic";
  if (a4 == 8) {
    uint64_t v5 = @"trackpad-haptic";
  }
  if (a4 != 4) {
    id v4 = v5;
  }
  if (a4 == 1) {
    id v4 = @"audio";
  }
  return (id)[NSString stringWithFormat:@"%@-%@", a3, v4];
}

- (void)_setEnabledFeedbackTypes:(unint64_t)a3 forCategory:(id)a4
{
}

- (void)_invalidate
{
  [(NSMutableDictionary *)self->_enabledFeedbackTypes removeAllObjects];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIFeedbackPreferencesDidChangeNotification" object:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_userDefaults == a4)
  {
    [(_UIFeedbackPreferences *)self _invalidate];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFeedbackPreferences;
    -[_UIFeedbackPreferences observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3);
  }
}

- (NSDictionary)defaultFeedbackTypes
{
  return self->_defaultFeedbackTypes;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_defaultFeedbackTypes, 0);
  objc_storeStrong((id *)&self->_enabledFeedbackTypes, 0);
}

@end