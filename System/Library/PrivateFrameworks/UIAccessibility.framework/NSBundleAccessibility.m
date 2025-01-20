@interface NSBundleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)loadAndReturnError:(id *)a3;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
@end

@implementation NSBundleAccessibility

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (__CFString *)a5;
  v36.receiver = self;
  v36.super_class = (Class)NSBundleAccessibility;
  v12 = [(NSBundleAccessibility *)&v36 localizedStringForKey:v9 value:v10 table:v11];
  if ((localizedStringForKey_value_table__RecursiveCall & 1) == 0)
  {
    int v13 = _AXSAutomationLocalizedStringLookupInfoEnabled();
    uint64_t v14 = _AXSAutomationPreferredLocalization();
    v15 = (void *)v14;
    if (!v13 && !v14)
    {
LABEL_24:

      goto LABEL_25;
    }
    v34 = (void *)v14;
    if (v14)
    {
      v16 = self;
      InstanceMethod = class_getInstanceMethod((Class)+[NSBundleAccessibility superclass], a2);
      IMP Implementation = method_getImplementation(InstanceMethod);
      v19 = ((void (*)(NSBundleAccessibility *, SEL, id, id, __CFString *))Implementation)(v16, a2, v9, v10, v11);
      if (v19)
      {
        v20 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v19];

        [v20 setAttribute:v12 forKey:@"UIAccessibilityTokenLocalizedStringTranslation"];
      }
      else
      {
        v31 = v34;
        v32 = v12;
        v29 = @"%@: Failed to lookup alternate localization '%@' of localized string '%@'.";
        v30 = v16;
        LOBYTE(v28) = 1;
        _AXLogWithFacility();

        v20 = 0;
      }

      v15 = v34;
      if (v13) {
        goto LABEL_11;
      }
    }
    else
    {
      v20 = 0;
      if (v13)
      {
LABEL_11:
        BOOL v21 = 1;
        localizedStringForKey_value_table__RecursiveCall = 1;
        if (!v11)
        {
          v35.receiver = self;
          v35.super_class = (Class)NSBundleAccessibility;
          v11 = @"Localizable";
          v22 = [(NSBundleAccessibility *)&v35 localizedStringForKey:v9 value:0 table:@"Localizable"];
          BOOL v21 = v22 != 0;
        }
        BOOL v33 = v21;
        v23 = AXNSLocalizedStringForLocale();
        localizedStringForKey_value_table__RecursiveCall = 0;
        if (!v20)
        {
          v20 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v12];
        }
        v24 = [(NSBundleAccessibility *)self bundleIdentifier];
        v25 = [(NSBundleAccessibility *)self bundlePath];
        [v20 setAttribute:v24 forKey:@"UIAccessibilityTokenLocalizedStringBundleID"];
        [v20 setAttribute:v25 forKey:@"UIAccessibilityTokenLocalizationBundlePath"];
        [v20 setAttribute:v9 forKey:@"UIAccessibilityTokenLocalizedStringKey"];
        if (v33) {
          [v20 setAttribute:v11 forKey:@"UIAccessibilityTokenLocalizedStringTableName"];
        }
        if (v23) {
          [v20 setAttribute:v23 forKey:@"UIAccessibilityTokenLocalizedStringEnglishVersion"];
        }

        v15 = v34;
      }
    }
    if (v20)
    {
      v26 = (void *)[v20 copy];
      v15 = v34;
      [v12 performSelector:sel__setAccessibilityAttributedLocalizedString_ withObject:v26];
    }
    else
    {
      _AXLogWithFacility();
    }

    goto LABEL_24;
  }
LABEL_25:

  return v12;
}

+ (id)safeCategoryTargetClassName
{
  return @"NSBundle";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)loadAndReturnError:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSBundleAccessibility;
  BOOL v4 = [(NSBundleAccessibility *)&v9 loadAndReturnError:a3];
  v5 = [MEMORY[0x1E4F49458] sharedInstance];
  char v6 = [v5 useNewAXBundleLoader];

  if ((v6 & 1) == 0)
  {
    if (loadAndReturnError__registerOnce != -1) {
      dispatch_once(&loadAndReturnError__registerOnce, &__block_literal_global_12);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__NSBundleAccessibility_loadAndReturnError___block_invoke_2;
    block[3] = &unk_1E59B9300;
    block[4] = self;
    dispatch_async((dispatch_queue_t)loadAndReturnError__DifferentQueue, block);
  }
  return v4;
}

uint64_t __44__NSBundleAccessibility_loadAndReturnError___block_invoke()
{
  loadAndReturnError__DifferentQueue = (uint64_t)dispatch_queue_create("ax-load-bundle-queue", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t __44__NSBundleAccessibility_loadAndReturnError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAXBundleForBundleOffMainThread];
}

@end