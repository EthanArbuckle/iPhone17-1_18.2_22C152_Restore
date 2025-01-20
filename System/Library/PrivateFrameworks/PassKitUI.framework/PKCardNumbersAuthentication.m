@interface PKCardNumbersAuthentication
+ (id)genericDisplayableVirtualCardError;
+ (id)rateLimitDisplayableVirtualCardError;
+ (void)_reportAnalyticsAuthEnded:(id)a3 result:(id)a4 featureIdentifier:(unint64_t)a5;
+ (void)_reportAnalyticsAuthStartedForFeatureIdentifier:(unint64_t)a3;
+ (void)authenticationContextLocationBased:(BOOL)a3 featureIdentifier:(unint64_t)a4 completion:(id)a5;
+ (void)authenticationContextWithFeatureIdentifier:(unint64_t)a3 completion:(id)a4;
+ (void)locationBasedAuthenticationContextWithFeatureIdentifier:(unint64_t)a3 completion:(id)a4;
@end

@implementation PKCardNumbersAuthentication

+ (void)locationBasedAuthenticationContextWithFeatureIdentifier:(unint64_t)a3 completion:(id)a4
{
}

+ (void)authenticationContextWithFeatureIdentifier:(unint64_t)a3 completion:(id)a4
{
}

+ (void)authenticationContextLocationBased:(BOOL)a3 featureIdentifier:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    v22[0] = &unk_1EF2B89D0;
    v10 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_1.isa);
    v23[0] = v10;
    v22[1] = &unk_1EF2B89E8;
    v11 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_2.isa);
    v23[1] = v11;
    v22[2] = &unk_1EF2B8A00;
    v12 = PKDeviceName();
    v13 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_3.isa, &stru_1EF1B4C70.isa, v12);
    v23[2] = v13;
    v22[3] = &unk_1EF2B8A18;
    v23[3] = MEMORY[0x1E4F1CC38];
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

    if (v6) {
      uint64_t v15 = 1025;
    }
    else {
      uint64_t v15 = 2;
    }
    [a1 _reportAnalyticsAuthStartedForFeatureIdentifier:a4];
    objc_initWeak(&location, a1);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __95__PKCardNumbersAuthentication_authenticationContextLocationBased_featureIdentifier_completion___block_invoke;
    v17[3] = &unk_1E59CAD90;
    objc_copyWeak(v20, &location);
    v20[1] = (id)a4;
    id v19 = v8;
    id v16 = v9;
    id v18 = v16;
    [v16 evaluatePolicy:v15 options:v14 reply:v17];

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __95__PKCardNumbersAuthentication_authenticationContextLocationBased_featureIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _reportAnalyticsAuthEnded:v5 result:v10 featureIdentifier:*(void *)(a1 + 56)];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v10 || v5) {
    id v9 = *(void (**)(void))(v8 + 16);
  }
  else {
    id v9 = *(void (**)(void))(v8 + 16);
  }
  v9();
}

+ (id)genericDisplayableVirtualCardError
{
  v2 = PKLocalizedCardNumbersString(&cfstr_CardNumbersErr.isa);
  v3 = PKLocalizedCardNumbersString(&cfstr_CardNumbersErr_0.isa);
  v4 = PKDisplayableErrorCustom();

  return v4;
}

+ (id)rateLimitDisplayableVirtualCardError
{
  v2 = PKLocalizedCardNumbersString(&cfstr_CardNumbersErr_1.isa);
  v3 = PKDisplayableErrorCustom();

  return v3;
}

+ (void)_reportAnalyticsAuthStartedForFeatureIdentifier:(unint64_t)a3
{
  if (a3 == 1) {
    [MEMORY[0x1E4F843E0] reportDTOAuthEvent:*MEMORY[0x1E4F863F0] forSubject:*MEMORY[0x1E4F87000]];
  }
}

+ (void)_reportAnalyticsAuthEnded:(id)a3 result:(id)a4 featureIdentifier:(unint64_t)a5
{
  if (a5 == 1) {
    [MEMORY[0x1E4F843E0] reportDTOAuthEndedWithResult:a4 error:a3 forSubject:*MEMORY[0x1E4F87000]];
  }
}

@end