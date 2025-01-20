@interface _UIContentSizeCategoryPreferenceSystem
- (UIContentSizeCategoryPreference)overridePreferences;
- (id)description;
- (id)initAsSystem;
- (void)_beginObservingPreferredContentSizeChangedNotification;
- (void)_endObservingPreferredContentSizeChangedNotification;
- (void)_postContentSizeCategoryDidChangeNotification;
- (void)_readAndObservePreferences;
- (void)_updateContentSizeCategoriesFromUserDefaultsPostingNotification:(BOOL)a3;
- (void)_updateContentSizeCategory:(id)a3 carPlay:(id)a4 postingNotification:(BOOL)a5;
- (void)checkForChanges;
- (void)dealloc;
- (void)setOverridePreferences:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation _UIContentSizeCategoryPreferenceSystem

- (id)initAsSystem
{
  v3.receiver = self;
  v3.super_class = (Class)_UIContentSizeCategoryPreferenceSystem;
  id result = [(UIContentSizeCategoryPreference *)&v3 initWithContentSizeCategory:@"_UICTContentSizeCategoryUnspecified"];
  if (result)
  {
    *((unsigned char *)result + 24) = 0;
    *((unsigned char *)result + 25) = 0;
    *((unsigned char *)result + 26) = 0;
  }
  return result;
}

- (void)_beginObservingPreferredContentSizeChangedNotification
{
  if (!self->_observingNotification)
  {
    self->_observingNotification = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_preferredContentSizeChangedCallback, @"ApplePreferredContentSizeCategoryChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_preferredContentSizeChangedCallback, @"AppleCarPlayPreferredContentSizeCategoryChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__postContentSizeCategoryDidChangeNotification name:*MEMORY[0x1E4FB9128] object:0];
  }
}

- (void)_readAndObservePreferences
{
  [(_UIContentSizeCategoryPreferenceSystem *)self _updateContentSizeCategoriesFromUserDefaultsPostingNotification:0];
  [(_UIContentSizeCategoryPreferenceSystem *)self _beginObservingPreferredContentSizeChangedNotification];
}

- (void)_updateContentSizeCategoriesFromUserDefaultsPostingNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = 0;
  id v6 = 0;
  [(id)objc_opt_class() _populateUserDefaultsContentSizeCategory:&v6 carPlay:&v5];
  [(_UIContentSizeCategoryPreferenceSystem *)self _updateContentSizeCategory:v6 carPlay:v5 postingNotification:v3];
}

- (void)_updateContentSizeCategory:(id)a3 carPlay:(id)a4 postingNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  _UIContentSizeCategoryPreferenceSafeContentSizeCategory(a3);
  UIContentSizeCategory lhs = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue();
  if (_UIApplicationIsApplicationWidgetExtension()
    && UIContentSizeCategoryCompareToCategory(lhs, &cfstr_Uictcontentsiz_10.isa) != NSOrderedAscending)
  {
    v9 = @"UICTContentSizeCategoryAccessibilityL";

    UIContentSizeCategory lhs = &v9->isa;
  }
  v10 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];
  char v11 = [v10 isEqualToString:lhs];

  if ((v11 & 1) == 0)
  {
    [(_UIContentSizeCategoryPreferenceSystem *)self setPreferredContentSizeCategory:lhs];
    if (_UIScreenHasScreens()) {
      +[UIScreen _enumerateScreensWithBlock:&__block_literal_global_547];
    }
    if (v5) {
      [(_UIContentSizeCategoryPreferenceSystem *)self _postContentSizeCategoryDidChangeNotification];
    }
  }
  v12 = _UIContentSizeCategoryPreferenceSafeContentSizeCategory(v8);

  v13 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategoryCarPlay];
  char v14 = [v13 isEqualToString:v12];

  if ((v14 & 1) == 0)
  {
    [(UIContentSizeCategoryPreference *)self setPreferredContentSizeCategoryCarPlay:v12];
    if (_UIScreenHasScreens()) {
      +[UIScreen _enumerateScreensWithBlock:&__block_literal_global_65_3];
    }
  }
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  id v4 = a3;
  if (!self->_didCheckForPreferredContentSizeCategoryOverride)
  {
    if (_UIApplicationIsExtension())
    {
      self->_didCheckForPreferredContentSizeCategoryOverride = 1;
      self->_applicationOverridesPreferredContentSizeCategory = 0;
    }
    else if (UIApp)
    {
      uint64_t v5 = +[UIApplication instanceMethodForSelector:sel_preferredContentSizeCategory];
      if (v5)
      {
        if (v5 != [(id)UIApp methodForSelector:sel_preferredContentSizeCategory]) {
          self->_applicationOverridesPreferredContentSizeCategory = 1;
        }
        self->_didCheckForPreferredContentSizeCategoryOverride = 1;
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIContentSizeCategoryPreferenceSystem;
  [(UIContentSizeCategoryPreference *)&v10 setPreferredContentSizeCategory:v4];
  if (self->_applicationOverridesPreferredContentSizeCategory)
  {
    id v6 = [(id)UIApp preferredContentSizeCategory];

    v7 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];
    char v8 = [v7 isEqualToString:v6];

    if ((v8 & 1) == 0)
    {
      v9.receiver = self;
      v9.super_class = (Class)_UIContentSizeCategoryPreferenceSystem;
      [(UIContentSizeCategoryPreference *)&v9 setPreferredContentSizeCategory:v6];
    }
  }
  else
  {
    id v6 = v4;
  }
}

- (void)checkForChanges
{
  if (!self->_overridePreferences) {
    [(_UIContentSizeCategoryPreferenceSystem *)self _updateContentSizeCategoriesFromUserDefaultsPostingNotification:1];
  }
}

- (void)dealloc
{
  [(_UIContentSizeCategoryPreferenceSystem *)self _endObservingPreferredContentSizeChangedNotification];
  v3.receiver = self;
  v3.super_class = (Class)_UIContentSizeCategoryPreferenceSystem;
  [(_UIContentSizeCategoryPreferenceSystem *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_overridePreferences) {
    uint64_t v5 = @"(overriding) ";
  }
  else {
    uint64_t v5 = &stru_1ED0E84C0;
  }
  id v6 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];
  v7 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategoryCarPlay];
  char v8 = [v3 stringWithFormat:@"<%@:%p %@%@ carplay=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (void)setOverridePreferences:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  id v10 = 0;
  id v11 = 0;
  overridePreferences = self->_overridePreferences;
  if (v5)
  {
    if ([v5 isEqual:overridePreferences])
    {
      id v8 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];
      id v11 = v8;
      id v9 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategoryCarPlay];
      id v10 = v9;
    }
    else
    {
      objc_storeStrong((id *)&self->_overridePreferences, a3);
      id v8 = [v6 preferredContentSizeCategory];
      id v11 = v8;
      id v9 = [v6 preferredContentSizeCategoryCarPlay];
      id v10 = v9;
      if (v8
        && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, &cfstr_Uictcontentsiz_1.isa) == NSOrderedSame)
      {
        id v11 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];

        id v8 = v11;
      }
      if (v9
        && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v9, &cfstr_Uictcontentsiz_1.isa) == NSOrderedSame)
      {
        id v10 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategoryCarPlay];

        id v9 = v10;
      }
    }
  }
  else
  {
    self->_overridePreferences = 0;

    [(id)objc_opt_class() _populateUserDefaultsContentSizeCategory:&v11 carPlay:&v10];
    id v9 = v10;
    id v8 = v11;
  }
  -[_UIContentSizeCategoryPreferenceSystem _updateContentSizeCategory:carPlay:postingNotification:](self, "_updateContentSizeCategory:carPlay:postingNotification:", v8, v9, 1, v10);
}

- (void)_postContentSizeCategoryDidChangeNotification
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (!dyld_program_sdk_at_least())
  {
    id v3 = (id)UIApp;
    goto LABEL_5;
  }
  if (_UIScreenHasScreens())
  {
    id v3 = +[UIScreen mainScreen];
LABEL_5:
    uint64_t v4 = v3;
    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_7:
  id v5 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v10[0] = @"UIContentSizeCategoryNewValueKey";
    v7 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];
    v11[0] = v7;
    v10[1] = @"UIContentSizeCategoryTextLegibilityEnabledKey";
    id v8 = [NSNumber numberWithBool:_AXSEnhanceTextLegibilityEnabled() != 0];
    v11[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    [v6 postNotificationName:@"UIContentSizeCategoryDidChangeNotification" object:v4 userInfo:v9];
  }
}

- (void)_endObservingPreferredContentSizeChangedNotification
{
  if (self->_observingNotification)
  {
    self->_observingNotification = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"ApplePreferredContentSizeCategoryChangedNotification", 0);
    uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, @"AppleCarPlayPreferredContentSizeCategoryChangedNotification", 0);
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x1E4FB9128] object:0];
  }
}

- (UIContentSizeCategoryPreference)overridePreferences
{
  return self->_overridePreferences;
}

- (void).cxx_destruct
{
}

@end