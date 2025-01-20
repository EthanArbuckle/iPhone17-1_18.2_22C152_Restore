@interface CNContact(_TTY_)
+ (id)contactForPhoneNumber:()_TTY_;
- (uint64_t)ttyIsMe;
@end

@implementation CNContact(_TTY_)

- (uint64_t)ttyIsMe
{
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v3 = [v2 ttyMeContact];
  v4 = [v3 identifier];
  v5 = [a1 identifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

+ (id)contactForPhoneNumber:()_TTY_
{
  v17[5] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFEA20];
  id v4 = a3;
  v5 = [v3 descriptorForRequiredKeysForStyle:0];
  uint64_t v6 = *MEMORY[0x263EFDF80];
  v17[0] = v5;
  v17[1] = v6;
  uint64_t v7 = *MEMORY[0x263EFDFF0];
  v17[2] = *MEMORY[0x263EFE070];
  v17[3] = v7;
  v17[4] = *MEMORY[0x263EFE140];
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:5];

  v9 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v10 = [v9 contactStore];
  v11 = (void *)MEMORY[0x263EFE9F8];
  v12 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v4];

  v13 = [v11 predicateForContactsMatchingPhoneNumber:v12];
  v14 = [v10 unifiedContactsMatchingPredicate:v13 keysToFetch:v8 error:0];

  v15 = [v14 firstObject];

  return v15;
}

@end