@interface _UIKeyShortcutHUDUtilities
+ (__CFString)separatorElementKind;
+ (__CFString)sharedFocusGroupIdentifier;
+ (id)inputAttributedStringForShortcut:(unsigned char *)a3 outShouldStyleAsSingleCharacterOrSymbol:;
+ (id)modifiersAttributedStringForShortcut:(uint64_t)a1;
+ (id)searchIcon;
+ (id)searchIconAttributedString;
+ (void)_generateDiscoverabilityUIKeyCommandIfNeededForShortcut:(id)a3;
+ (void)setCurrentHUDCollectionViewManager:(uint64_t)a1;
@end

@implementation _UIKeyShortcutHUDUtilities

+ (void)setCurrentHUDCollectionViewManager:(uint64_t)a1
{
  id obj = a2;
  self;
  id WeakRetained = objc_loadWeakRetained(&_currentHUDCollectionViewManager);

  v3 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&_currentHUDCollectionViewManager, obj);
    v3 = obj;
  }
}

+ (id)searchIcon
{
  self;
  if (qword_1EB265478 != -1) {
    dispatch_once(&qword_1EB265478, &__block_literal_global_675);
  }
  v0 = (void *)_MergedGlobals_1336[0];
  return v0;
}

+ (id)searchIconAttributedString
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___UIKeyShortcutHUDUtilities_searchIconAttributedString__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB265488 != -1) {
    dispatch_once(&qword_1EB265488, block);
  }
  v1 = (void *)qword_1EB265480;
  return v1;
}

+ (id)modifiersAttributedStringForShortcut:(uint64_t)a1
{
  id v2 = a2;
  [self _generateDiscoverabilityUIKeyCommandIfNeededForShortcut:v2];
  v3 = objc_opt_new();
  if (qword_1EB2654C0 != -1) {
    dispatch_once(&qword_1EB2654C0, &__block_literal_global_9_5);
  }
  if (([v2 modifierFlags] & 0x40000) != 0) {
    [v3 appendAttributedString:qword_1EB265490];
  }
  if (([v2 modifierFlags] & 0x80000) != 0) {
    [v3 appendAttributedString:qword_1EB265498];
  }
  if (([v2 modifierFlags] & 0x20000) != 0) {
    [v3 appendAttributedString:qword_1EB2654A0];
  }
  if (([v2 modifierFlags] & 0x100000) != 0) {
    [v3 appendAttributedString:qword_1EB2654A8];
  }
  if (([v2 modifierFlags] & 0x800000) != 0)
  {
    v4 = +[UIKeyShortcutHUDMetrics currentMetrics];
    int v5 = [v4 shouldDisplayGlobeModiferAsGlobeSymbol];

    uint64_t v6 = 9;
    if (v5) {
      uint64_t v6 = 8;
    }
    [v3 appendAttributedString:_MergedGlobals_1336[v6]];
  }

  return v3;
}

+ (id)inputAttributedStringForShortcut:(unsigned char *)a3 outShouldStyleAsSingleCharacterOrSymbol:
{
  id v4 = a2;
  [self _generateDiscoverabilityUIKeyCommandIfNeededForShortcut:v4];
  if (qword_1EB2654E8 != -1) {
    dispatch_once(&qword_1EB2654E8, &__block_literal_global_30_4);
  }
  int v5 = (void *)qword_1EB2654D0;
  uint64_t v6 = [v4 input];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = +[UIKeyShortcutHUDMetrics currentMetrics];
    int v9 = [v8 shouldMirrorShortcutInputs];

    if (v9)
    {
      v10 = (void *)qword_1EB2654D8;
      v11 = [v4 input];
      v12 = [v10 objectForKeyedSubscript:v11];

      if (v12) {
        v13 = v12;
      }
      else {
        v13 = v7;
      }
      id v14 = v13;

      v7 = v14;
    }
    v15 = +[UIImage systemImageNamed:v7 withConfiguration:qword_1EB2654C8];
    v16 = [off_1E52D2EB0 textAttachmentWithImage:v15];
    v17 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v16];
    if (a3) {
      *a3 = 1;
    }
  }
  else
  {
    v18 = [v4 discoverabilityUIKeyCommand];
    v7 = [v18 _readableStringForInputUsingWords:0 forHUD:1 outIsSingleCharacterOrKeySymbol:a3];

    v19 = +[UIKeyShortcutHUDMetrics currentMetrics];
    LODWORD(v18) = [v19 shouldMirrorShortcutInputs];

    if (v18)
    {
      uint64_t v20 = [(id)qword_1EB2654E0 objectForKeyedSubscript:v7];
      v21 = (void *)v20;
      if (v20) {
        v22 = (void *)v20;
      }
      else {
        v22 = v7;
      }
      id v23 = v22;

      v7 = v23;
    }
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
  }

  return v17;
}

+ (void)_generateDiscoverabilityUIKeyCommandIfNeededForShortcut:(id)a3
{
  id v10 = a3;
  v3 = [v10 discoverabilityUIKeyCommand];

  id v4 = v10;
  if (!v3)
  {
    int v5 = +[UIKeyShortcutHUDMetrics currentMetrics];
    if ([v5 shouldDisplayEscShortcutAlternative])
    {
      uint64_t v6 = [v10 input];
      if ([v6 isEqualToString:@"UIKeyInputEscape"])
      {
        int v7 = [v10 modifierFlags];

        if ((v7 & 0x100000) == 0)
        {
          v8 = _UIKeyCommandGetLocalizedSymbol(@".");
          int v9 = +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", v8, [v10 modifierFlags] | 0x100000, sel__nop_);

          if (v9) {
            goto LABEL_10;
          }
        }
        goto LABEL_9;
      }
    }
LABEL_9:
    int v9 = [v10 uiKeyCommand];
LABEL_10:
    [v10 setDiscoverabilityUIKeyCommand:v9];

    id v4 = v10;
  }
}

+ (__CFString)sharedFocusGroupIdentifier
{
  return @"com.apple.uikit.key-shortcut-hud.focus-group-identifier";
}

+ (__CFString)separatorElementKind
{
  return @"com.apple.uikit.key-shortcut-hud.separator";
}

@end