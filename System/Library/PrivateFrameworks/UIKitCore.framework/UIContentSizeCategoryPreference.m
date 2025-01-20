@interface UIContentSizeCategoryPreference
+ (id)system;
+ (void)_overrideSystemPreferenceToContentSizeCategory:(id)a3;
+ (void)_overrideSystemPreferenceToContentSizeCategory:(id)a3 forBlock:(id)a4;
+ (void)_populateUserDefaultsContentSizeCategory:(id *)a3 carPlay:(id *)a4;
+ (void)_resetSystemPreferenceOverride;
+ (void)asyncOverrideSystemWithPreference:(id)a3;
+ (void)asyncResetSystemPreferenceOverride;
+ (void)overrideSystemWithPreference:(id)a3;
+ (void)overrideSystemWithPreference:(id)a3 forBlock:(id)a4;
+ (void)resetSystemPreferenceOverride;
- (BOOL)isEqual:(id)a3;
- (NSString)preferredContentSizeCategory;
- (NSString)preferredContentSizeCategoryCarPlay;
- (UIContentSizeCategoryPreference)init;
- (UIContentSizeCategoryPreference)initWithContentSizeCategory:(id)a3;
- (UIContentSizeCategoryPreference)initWithContentSizeCategory:(id)a3 carPlay:(id)a4;
- (UIContentSizeCategoryPreference)initWithRawUserDefaults;
- (id)description;
- (unint64_t)hash;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setPreferredContentSizeCategoryCarPlay:(id)a3;
@end

@implementation UIContentSizeCategoryPreference

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

+ (id)system
{
  v2 = (void *)__preferences;
  if (!__preferences)
  {
    id v3 = [[_UIContentSizeCategoryPreferenceSystem alloc] initAsSystem];
    v4 = (void *)__preferences;
    __preferences = (uint64_t)v3;

    [(id)__preferences _readAndObservePreferences];
    v2 = (void *)__preferences;
  }
  return v2;
}

- (UIContentSizeCategoryPreference)initWithContentSizeCategory:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIContentSizeCategoryPreference;
  v5 = [(UIContentSizeCategoryPreference *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    preferredContentSizeCategory = v5->_preferredContentSizeCategory;
    v5->_preferredContentSizeCategory = (NSString *)v6;

    objc_storeStrong((id *)&v5->_preferredContentSizeCategoryCarPlay, @"_UICTContentSizeCategoryUnspecified");
  }

  return v5;
}

- (void)setPreferredContentSizeCategoryCarPlay:(id)a3
{
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NSString)preferredContentSizeCategoryCarPlay
{
  return self->_preferredContentSizeCategoryCarPlay;
}

+ (void)_populateUserDefaultsContentSizeCategory:(id *)a3 carPlay:(id *)a4
{
  _UIKitUserDefaults();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 synchronize];
  if (a3)
  {
    v7 = id v6 = (id)_AXSCopyPreferredContentSizeCategoryName();
    id v8 = *a3;
    *a3 = v7;
  }
  objc_super v9 = v13;
  if (a4)
  {
    uint64_t v10 = [v13 objectForKey:@"UICarPlayPreferredContentSizeCategoryName"];
    v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = @"UICTContentSizeCategoryL";
    }
    objc_storeStrong(a4, v12);

    objc_super v9 = v13;
  }
}

+ (void)overrideSystemWithPreference:(id)a3 forBlock:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = (id)[a1 system];
  if (v9)
  {
    id v8 = [(id)__preferences overridePreferences];
    [(id)__preferences setOverridePreferences:v9];
    if (v6) {
      v6[2](v6);
    }
    [(id)__preferences setOverridePreferences:v8];
  }
}

+ (void)overrideSystemWithPreference:(id)a3
{
  id v6 = a3;
  id v4 = (id)[a1 system];
  v5 = v6;
  if (v6)
  {
    [(id)__preferences setOverridePreferences:v6];
    v5 = v6;
  }
}

+ (void)resetSystemPreferenceOverride
{
  id v2 = (id)[a1 system];
  id v3 = (void *)__preferences;
  [v3 setOverridePreferences:0];
}

+ (void)asyncOverrideSystemWithPreference:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__UIContentSizeCategoryPreference_asyncOverrideSystemWithPreference___block_invoke;
  v6[3] = &unk_1E52D9CD0;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __69__UIContentSizeCategoryPreference_asyncOverrideSystemWithPreference___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) overrideSystemWithPreference:*(void *)(a1 + 32)];
}

+ (void)asyncResetSystemPreferenceOverride
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__UIContentSizeCategoryPreference_asyncResetSystemPreferenceOverride__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__UIContentSizeCategoryPreference_asyncResetSystemPreferenceOverride__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetSystemPreferenceOverride];
}

+ (void)_resetSystemPreferenceOverride
{
  id v2 = (void *)__preferences;
  __preferences = 0;
}

+ (void)_overrideSystemPreferenceToContentSizeCategory:(id)a3
{
  id v4 = a3;
  id v5 = [[UIContentSizeCategoryPreference alloc] initWithContentSizeCategory:v4];

  [a1 overrideSystemWithPreference:v5];
}

+ (void)_overrideSystemPreferenceToContentSizeCategory:(id)a3 forBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[UIContentSizeCategoryPreference alloc] initWithContentSizeCategory:v7 carPlay:@"_UICTContentSizeCategoryUnspecified"];

  [a1 overrideSystemWithPreference:v8 forBlock:v6];
}

- (UIContentSizeCategoryPreference)initWithContentSizeCategory:(id)a3 carPlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIContentSizeCategoryPreference;
  id v8 = [(UIContentSizeCategoryPreference *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    preferredContentSizeCategory = v8->_preferredContentSizeCategory;
    v8->_preferredContentSizeCategory = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    preferredContentSizeCategoryCarPlay = v8->_preferredContentSizeCategoryCarPlay;
    v8->_preferredContentSizeCategoryCarPlay = (NSString *)v11;
  }
  return v8;
}

- (UIContentSizeCategoryPreference)initWithRawUserDefaults
{
  id v2 = self;
  if (self)
  {
    id v4 = 0;
    id v5 = 0;
    [(id)objc_opt_class() _populateUserDefaultsContentSizeCategory:&v5 carPlay:&v4];
    id v2 = [(UIContentSizeCategoryPreference *)v2 initWithContentSizeCategory:v5 carPlay:v4];
  }
  return v2;
}

- (UIContentSizeCategoryPreference)init
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    uint64_t v9 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];
    uint64_t v10 = [v6 preferredContentSizeCategory];
    if (v9 == v10
      || ([(UIContentSizeCategoryPreference *)self preferredContentSizeCategory],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v6 preferredContentSizeCategory],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:v4]))
    {
      uint64_t v11 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategoryCarPlay];
      v12 = [v6 preferredContentSizeCategoryCarPlay];
      if (v11 == v12)
      {
        char v8 = 1;
      }
      else
      {
        id v13 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategoryCarPlay];
        objc_super v14 = [v6 preferredContentSizeCategoryCarPlay];
        char v8 = [v13 isEqualToString:v14];
      }
      if (v9 == v10) {
        goto LABEL_11;
      }
    }
    else
    {
      char v8 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  char v8 = 0;
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  id v3 = NSString;
  id v4 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];
  id v5 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategoryCarPlay];
  id v6 = [v3 stringWithFormat:@"%@%@", v4, v5];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategory];
  id v6 = [(UIContentSizeCategoryPreference *)self preferredContentSizeCategoryCarPlay];
  unint64_t v7 = [v3 stringWithFormat:@"<%@:%p %@ carplay=%@>", v4, self, v5, v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategoryCarPlay, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
}

@end