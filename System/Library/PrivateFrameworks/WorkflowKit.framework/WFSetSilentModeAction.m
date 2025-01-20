@interface WFSetSilentModeAction
+ (Class)settingsClientClass;
- (BOOL)skipExecutingInSiri;
- (id)defaultParameterStatesForStaccato;
- (id)displayableAppDescriptor;
- (id)hiddenParameterKeysForStaccato;
- (id)iconBackgroundColorName;
- (id)iconSymbolName;
- (id)localizedFocusFilterDescriptionWithContext:(id)a3;
- (id)reversibleSettingParameterKey;
- (id)staccatoNameOverride;
- (void)generateStandaloneShortcutRepresentation:(id)a3;
@end

@implementation WFSetSilentModeAction

- (id)staccatoNameOverride
{
  id v2 = WFLocalizedString(@"Silent Mode");
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  v7 = (void *)[v5 initWithKey:@"Silent Mode" table:@"Localizable" locale:v6 bundleURL:v4];

  v8 = [v7 localize];

  return v8;
}

- (id)hiddenParameterKeysForStaccato
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"operation";
  v6[1] = @"state";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)defaultParameterStatesForStaccato
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"operation";
  id v2 = [(WFVariableSubstitutableParameterState *)[WFLinkEnumerationSubstitutableState alloc] initWithValue:@"toggle"];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)reversibleSettingParameterKey
{
  return @"state";
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
}

- (id)displayableAppDescriptor
{
  return 0;
}

- (BOOL)skipExecutingInSiri
{
  return 1;
}

- (id)iconBackgroundColorName
{
  return @"Red";
}

- (id)iconSymbolName
{
  return @"bell.slash.fill";
}

- (id)localizedFocusFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Turn Silent Mode on or off while in this Focus.", @"Turn Silent Mode on or off while in this Focus.");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

@end