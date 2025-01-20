@interface _TIInputModePreferenceProvider
- (id)defaultEnabledInputModesForCurrentLocale;
- (id)enabledInputModeIdentifiers;
@end

@implementation _TIInputModePreferenceProvider

- (id)defaultEnabledInputModesForCurrentLocale
{
  v2 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  v3 = [v2 defaultEnabledInputModesForCurrentLocale];

  v4 = (void *)[v3 copy];

  return v4;
}

- (id)enabledInputModeIdentifiers
{
  v2 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  v3 = [v2 enabledInputModeIdentifiers];

  v4 = (void *)[v3 copy];

  return v4;
}

@end