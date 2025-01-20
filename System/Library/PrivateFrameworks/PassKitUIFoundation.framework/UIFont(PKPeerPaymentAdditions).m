@interface UIFont(PKPeerPaymentAdditions)
+ (BOOL)pk_loadFontWithFileName:()PKPeerPaymentAdditions extension:;
+ (id)pk_fdicSignageFont;
+ (id)pk_peerPaymentCashFontOfSize:()PKPeerPaymentAdditions;
+ (id)pk_peerPaymentChiseledCashFontOfSize:()PKPeerPaymentAdditions;
+ (id)pk_textCondensedMediumCashFontOfSize:()PKPeerPaymentAdditions;
+ (id)pk_textCondensedRegularCashFontOfSize:()PKPeerPaymentAdditions;
+ (id)pk_textCondensedSemiboldCashFontOfSize:()PKPeerPaymentAdditions;
+ (uint64_t)pk_loadFDICSignageFont;
+ (uint64_t)pk_loadPeerPaymentCashFont;
+ (uint64_t)pk_loadTextCondensedMediumCashFont;
+ (uint64_t)pk_loadTextCondensedRegularCashFont;
+ (uint64_t)pk_loadTextCondensedSemiboldCashFont;
- (id)pk_fixedWidthFont;
@end

@implementation UIFont(PKPeerPaymentAdditions)

+ (BOOL)pk_loadFontWithFileName:()PKPeerPaymentAdditions extension:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v5;
    _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "Registering peer payment font: %{public}@.", buf, 0xCu);
  }

  v8 = PKPassKitUIFoundationBundle();
  CFURLRef v9 = [v8 URLForResource:v5 withExtension:v6];

  if (v9)
  {
    CFErrorRef error = 0;
    BOOL v10 = CTFontManagerRegisterFontsForURL(v9, kCTFontManagerScopeProcess, &error);
    if (!v10)
    {
      v11 = (__CFString *)CFErrorCopyDescription(error);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v15 = v5;
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "Failed to register font %{public}@ with error %@.", buf, 0x16u);
      }

      if (error) {
        CFRelease(error);
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (uint64_t)pk_loadFDICSignageFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__UIFont_PKPeerPaymentAdditions__pk_loadFDICSignageFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadFDICSignageFont_onceToken != -1) {
    dispatch_once(&pk_loadFDICSignageFont_onceToken, block);
  }
  return pk_loadFDICSignageFont_result;
}

+ (id)pk_fdicSignageFont
{
  if (objc_msgSend(a1, "pk_loadFDICSignageFont"))
  {
    v1 = [(id)objc_opt_class() fontWithName:@"Source Sans 3" size:12.8];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (uint64_t)pk_loadPeerPaymentCashFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__UIFont_PKPeerPaymentAdditions__pk_loadPeerPaymentCashFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadPeerPaymentCashFont_onceToken != -1) {
    dispatch_once(&pk_loadPeerPaymentCashFont_onceToken, block);
  }
  return pk_loadPeerPaymentCashFont_result;
}

+ (id)pk_peerPaymentCashFontOfSize:()PKPeerPaymentAdditions
{
  if (objc_msgSend(a1, "pk_loadPeerPaymentCashFont"))
  {
    v3 = [(id)objc_opt_class() fontWithName:@"SFCash-Plain" size:a2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)pk_peerPaymentChiseledCashFontOfSize:()PKPeerPaymentAdditions
{
  v2 = +[PKPeerPaymentFontHelper chiseledCashFontDescriptor];
  if (v2)
  {
    v3 = [(id)objc_opt_class() fontWithDescriptor:v2 size:a1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (uint64_t)pk_loadTextCondensedRegularCashFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedRegularCashFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadTextCondensedRegularCashFont_onceToken != -1) {
    dispatch_once(&pk_loadTextCondensedRegularCashFont_onceToken, block);
  }
  return pk_loadTextCondensedRegularCashFont_result;
}

+ (id)pk_textCondensedRegularCashFontOfSize:()PKPeerPaymentAdditions
{
  v16[2] = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, "pk_loadTextCondensedRegularCashFont"))
  {
    uint64_t v3 = *MEMORY[0x263F1D1F0];
    v16[0] = @"SFCashTextCondensed-Regular";
    uint64_t v4 = *MEMORY[0x263F1D1E8];
    v15[0] = v3;
    v15[1] = v4;
    uint64_t v5 = *MEMORY[0x263F1D218];
    v12[0] = *MEMORY[0x263F1D220];
    v12[1] = v5;
    v13[0] = &unk_26D086830;
    v13[1] = &unk_26D086848;
    id v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v14 = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    v16[1] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    CFURLRef v9 = [MEMORY[0x263F1C660] fontDescriptorWithFontAttributes:v8];
    BOOL v10 = [(id)objc_opt_class() fontWithDescriptor:v9 size:a2];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (uint64_t)pk_loadTextCondensedSemiboldCashFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedSemiboldCashFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadTextCondensedSemiboldCashFont_onceToken != -1) {
    dispatch_once(&pk_loadTextCondensedSemiboldCashFont_onceToken, block);
  }
  return pk_loadTextCondensedSemiboldCashFont_result;
}

+ (id)pk_textCondensedSemiboldCashFontOfSize:()PKPeerPaymentAdditions
{
  v16[2] = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, "pk_loadTextCondensedSemiboldCashFont"))
  {
    uint64_t v3 = *MEMORY[0x263F1D1F0];
    v16[0] = @"SFCashTextCondensed-Semibold";
    uint64_t v4 = *MEMORY[0x263F1D1E8];
    v15[0] = v3;
    v15[1] = v4;
    uint64_t v5 = *MEMORY[0x263F1D218];
    v12[0] = *MEMORY[0x263F1D220];
    v12[1] = v5;
    v13[0] = &unk_26D086830;
    v13[1] = &unk_26D086848;
    id v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v14 = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    v16[1] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    CFURLRef v9 = [MEMORY[0x263F1C660] fontDescriptorWithFontAttributes:v8];
    BOOL v10 = [(id)objc_opt_class() fontWithDescriptor:v9 size:a2];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (uint64_t)pk_loadTextCondensedMediumCashFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedMediumCashFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadTextCondensedMediumCashFont_onceToken != -1) {
    dispatch_once(&pk_loadTextCondensedMediumCashFont_onceToken, block);
  }
  return pk_loadTextCondensedMediumCashFont_result;
}

+ (id)pk_textCondensedMediumCashFontOfSize:()PKPeerPaymentAdditions
{
  v16[2] = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, "pk_loadTextCondensedMediumCashFont"))
  {
    uint64_t v3 = *MEMORY[0x263F1D1F0];
    v16[0] = @"SFCashTextCondensed-Medium";
    uint64_t v4 = *MEMORY[0x263F1D1E8];
    v15[0] = v3;
    v15[1] = v4;
    uint64_t v5 = *MEMORY[0x263F1D218];
    v12[0] = *MEMORY[0x263F1D220];
    v12[1] = v5;
    v13[0] = &unk_26D086830;
    v13[1] = &unk_26D086848;
    id v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v14 = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    v16[1] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    CFURLRef v9 = [MEMORY[0x263F1C660] fontDescriptorWithFontAttributes:v8];
    BOOL v10 = [(id)objc_opt_class() fontWithDescriptor:v9 size:a2];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)pk_fixedWidthFont
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F1D218];
  v15[0] = *MEMORY[0x263F1D220];
  v15[1] = v2;
  v16[0] = &unk_26D086860;
  v16[1] = &unk_26D086848;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v4 = *MEMORY[0x263F1D1E8];
  v12 = v3;
  uint64_t v13 = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  v14 = v5;
  id v6 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  v7 = [a1 fontDescriptor];
  v8 = [v7 fontDescriptorByAddingAttributes:v6];

  CFURLRef v9 = (void *)MEMORY[0x263F1C658];
  [v8 pointSize];
  BOOL v10 = objc_msgSend(v9, "fontWithDescriptor:size:", v8);

  return v10;
}

@end