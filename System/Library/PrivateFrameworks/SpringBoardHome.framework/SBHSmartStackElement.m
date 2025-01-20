@interface SBHSmartStackElement
+ (id)elementIdentifier;
+ (id)elementKind;
- (id)displayName;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (id)supportedGridSizeClassesForIcon:(id)a3;
@end

@implementation SBHSmartStackElement

+ (id)elementIdentifier
{
  return @"com.apple.proactive.stack.widget";
}

+ (id)elementKind
{
  return @"SBHSpecialAvocadoDescriptorKindSmartStack";
}

- (id)displayName
{
  v2 = SBHBundle();
  v3 = [v2 localizedStringForKey:@"SMART_STACK_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  return v3;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  double v9 = v8;
  double v10 = v7;
  double v11 = v6;
  v12 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", a4);
  v13 = v12;
  if (v12) {
    uint64_t v14 = APUIIconAppearanceForSBHIconImageAppearanceType([v12 appearanceType]);
  }
  else {
    uint64_t v14 = 0;
  }
  v15 = [v13 tintColor];
  v16 = objc_msgSend(getAPUISuggestionsWidgetViewControllerClass(), "smartStackImageForIconSize:scale:appearance:tintColor:", v14, v15, v11, v10, v9);
  if (!v16)
  {
    v16 = objc_msgSend(getAPUISuggestionsWidgetViewControllerClass(), "smartStackImageForIconSize:scale:", v11, v10, v9);
  }

  return v16;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  v3 = [SBHIconGridSizeClassSet alloc];
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", 0);
  v5 = [(SBHIconGridSizeClassSet *)v3 initWithGridSizeClasses:v4];

  return v5;
}

@end