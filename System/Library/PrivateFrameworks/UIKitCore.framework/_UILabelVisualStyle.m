@interface _UILabelVisualStyle
+ (id)inferredVisualStyle;
- (BOOL)shouldDelayStartMarquee;
- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4;
- (BOOL)updatesTextColorOnUserInterfaceStyleChanges;
- (id)defaultFont;
- (void)actionsForDeallocationOfLabel:(id)a3;
- (void)actionsForInitializationOfLabel:(id)a3;
@end

@implementation _UILabelVisualStyle

+ (id)inferredVisualStyle
{
  if (_MergedGlobals_1318 != -1) {
    dispatch_once(&_MergedGlobals_1318, &__block_literal_global_643);
  }
  v2 = (void *)qword_1EB264F68;
  return v2;
}

- (id)defaultFont
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UILabelVisualStyle.m", 47, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (void)actionsForInitializationOfLabel:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"_UILabelVisualStyle.m", 53, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];
}

- (void)actionsForDeallocationOfLabel:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"_UILabelVisualStyle.m", 58, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];
}

- (BOOL)updatesTextColorOnUserInterfaceStyleChanges
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UILabelVisualStyle.m", 63, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (BOOL)shouldDelayStartMarquee
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UILabelVisualStyle.m", 69, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"_UILabelVisualStyle.m", 75, @"%@ should provide an implementation for %@", v8, v9 object file lineNumber description];

  return 0;
}

@end