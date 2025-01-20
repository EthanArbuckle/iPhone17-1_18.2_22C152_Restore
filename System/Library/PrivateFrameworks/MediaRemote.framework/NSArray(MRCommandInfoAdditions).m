@interface NSArray(MRCommandInfoAdditions)
- (uint64_t)mr_ifDisabledWhyDisabled:()MRCommandInfoAdditions;
- (uint64_t)mr_isCommandSupported:()MRCommandInfoAdditions;
- (uint64_t)mr_isCommandSupportedAndEnabled:()MRCommandInfoAdditions;
@end

@implementation NSArray(MRCommandInfoAdditions)

- (uint64_t)mr_isCommandSupported:()MRCommandInfoAdditions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__NSArray_MRCommandInfoAdditions__mr_isCommandSupported___block_invoke;
  v4[3] = &__block_descriptor_36_e23_B16__0__MRCommandInfo_8l;
  int v5 = a3;
  return objc_msgSend(a1, "mr_any:", v4);
}

- (uint64_t)mr_isCommandSupportedAndEnabled:()MRCommandInfoAdditions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__NSArray_MRCommandInfoAdditions__mr_isCommandSupportedAndEnabled___block_invoke;
  v4[3] = &__block_descriptor_36_e23_B16__0__MRCommandInfo_8l;
  int v5 = a3;
  return objc_msgSend(a1, "mr_any:", v4);
}

- (uint64_t)mr_ifDisabledWhyDisabled:()MRCommandInfoAdditions
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__NSArray_MRCommandInfoAdditions__mr_ifDisabledWhyDisabled___block_invoke;
  v8[3] = &__block_descriptor_36_e23_B16__0__MRCommandInfo_8l;
  int v9 = a3;
  v3 = objc_msgSend(a1, "mr_first:", v8);
  v4 = [v3 options];
  int v5 = [v4 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoDisabledReason"];

  uint64_t v6 = [v5 intValue];
  return v6;
}

@end