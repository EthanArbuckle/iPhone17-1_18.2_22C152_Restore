@interface PKPayLaterMerchandisingUtilities
+ (id)sharedInstance;
- (BOOL)_evaluateLocalChecksForConfiguration:(id)a3 outError:(id *)a4 invalidProperties:(id *)a5;
- (BOOL)_formValidationError:(id *)a3 underlyingError:(id)a4;
- (PKPayLaterMerchandisingUtilities)init;
- (id)_baseURLComponents;
- (id)_dynamicMerchandisingURLWithRegionCode:(id)a3;
- (id)_fragmentForModalConfiguration:(id)a3;
- (id)_localeString;
- (id)_urlWithBaseURL:(id)a3 pathComponents:(id)a4 queryParameters:(id)a5 fragment:(id)a6;
- (id)generateJavaScriptQueryForUpdatedProperty:(id)a3 newValue:(id)a4;
- (id)merchandisingBaseURLForEnviornmentType:(unint64_t)a3;
- (id)merchandisingEligibilityURLWithConfiguration:(id)a3;
- (id)merchandisingModalURLWithConfiguration:(id)a3;
- (void)_performWebRequestForURL:(id)a3 completion:(id)a4;
- (void)_validateRemoteChecksForConfiguration:(id)a3 completion:(id)a4;
- (void)clearWebRequestCache;
- (void)evaluateEligibilityForConfiguration:(id)a3 completion:(id)a4;
- (void)merchandisingWidgetHTMLWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation PKPayLaterMerchandisingUtilities

- (PKPayLaterMerchandisingUtilities)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterMerchandisingUtilities;
  v2 = [(PKPayLaterMerchandisingUtilities *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F18DC0] sharedSession];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PKPayLaterMerchandisingUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_270 != -1) {
    dispatch_once(&_MergedGlobals_270, block);
  }
  v2 = (void *)qword_1EB4033F0;
  return v2;
}

void __50__PKPayLaterMerchandisingUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB4033F0;
  qword_1EB4033F0 = (uint64_t)v1;
}

- (void)merchandisingWidgetHTMLWithConfiguration:(id)a3 completion:(id)a4
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_super v8 = -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self, "merchandisingBaseURLForEnviornmentType:", [v6 environmentType]);
    v15[0] = @"jsapi";
    v15[1] = @"v1.1.0";
    v15[2] = @"apple-pay-sdk.merchandising.js";
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    v10 = [(PKPayLaterMerchandisingUtilities *)self _urlWithBaseURL:v8 pathComponents:v9 queryParameters:0 fragment:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__PKPayLaterMerchandisingUtilities_merchandisingWidgetHTMLWithConfiguration_completion___block_invoke;
    v11[3] = &unk_1E56F1110;
    id v14 = v7;
    id v12 = v6;
    v13 = self;
    [(PKPayLaterMerchandisingUtilities *)self _performWebRequestForURL:v10 completion:v11];
  }
}

void __88__PKPayLaterMerchandisingUtilities_merchandisingWidgetHTMLWithConfiguration_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  uint64_t v5 = [v20 length];
  if (a3 || !v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v19 = (void *)[[NSString alloc] initWithData:v20 encoding:4];
    v18 = [*(id *)(a1 + 32) amountString];
    id v6 = PKPayLaterDisplayStyleToString((__CFString *)[*(id *)(a1 + 32) displayStyle]);
    id v7 = PKPayLaterActionToString((__CFString *)[*(id *)(a1 + 32) action]);
    objc_super v8 = [*(id *)(a1 + 40) _localeString];
    v9 = [*(id *)(a1 + 32) region];
    v10 = [*(id *)(a1 + 32) currency];
    v11 = PKPayLaterThemeToString((__CFString *)[*(id *)(a1 + 32) theme]);
    id v12 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v13 = [v12 bundleIdentifier];
    id v14 = (void *)v13;
    v15 = &stru_1EE0F5368;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    v16 = v15;

    objc_msgSend(NSString, "stringWithFormat:", @"    <html>      <head>        <meta name=\"viewport\"        content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\">        <meta name=\"color-scheme\" content=\"dark light\">        <style>  :root { color-scheme: light dark; background: transparent; }                 * { -webkit-touch-callout: none; -webkit-user-select: none; }                 html, body { margin: 0; }        </style>        <script>%@</script>      </head>      <body>        <apple-pay-merchandising            amount=\"%@\"            type=\"%@\"            modal-type=\"%@\"            locale=\"%@\"            country-code=\"%@\"            currency-code=\"%@\"            theme=\"%@\"            merchant-identifier=\"%@\"        >        </apple-pay-merchandising>      </body>    </html>",
      v19,
      v18,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
    v17 = v16);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)merchandisingModalURLWithConfiguration:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self, "merchandisingBaseURLForEnviornmentType:", [v4 environmentType]);
  id v6 = [(PKPayLaterMerchandisingUtilities *)self _fragmentForModalConfiguration:v4];
  uint64_t v7 = [v4 action];

  objc_super v8 = @"calculator.html";
  if (v7 != 1) {
    objc_super v8 = 0;
  }
  if (!v7) {
    objc_super v8 = @"learn-more.html";
  }
  v12[0] = @"jsapi";
  v12[1] = @"v1.1.0";
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  v10 = [(PKPayLaterMerchandisingUtilities *)self _urlWithBaseURL:v5 pathComponents:v9 queryParameters:0 fragment:v6];

  return v10;
}

- (id)merchandisingEligibilityURLWithConfiguration:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self, "merchandisingBaseURLForEnviornmentType:", [v4 environmentType]);
  id v6 = objc_msgSend(v4, "region", @"jsapi", @"v1.1.0");

  uint64_t v7 = [(PKPayLaterMerchandisingUtilities *)self _dynamicMerchandisingURLWithRegionCode:v6];
  v11[2] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  v9 = [(PKPayLaterMerchandisingUtilities *)self _urlWithBaseURL:v5 pathComponents:v8 queryParameters:0 fragment:0];

  return v9;
}

- (id)merchandisingBaseURLForEnviornmentType:(unint64_t)a3
{
  id v4 = [(PKPayLaterMerchandisingUtilities *)self _baseURLComponents];
  uint64_t v5 = v4;
  if (a3 > 3) {
    id v6 = 0;
  }
  else {
    id v6 = off_1E56F1180[a3];
  }
  [v4 setHost:v6];
  uint64_t v7 = [v5 URL];

  return v7;
}

- (id)generateJavaScriptQueryForUpdatedProperty:(id)a3 newValue:(id)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"document.querySelector('apple-pay-merchandising').setAttributeNS(null, '%@', '%@');",
               a3,
               a4);
}

- (void)evaluateEligibilityForConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_super v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Evaluating eligiblity for configuration: %@", buf, 0xCu);
    }

    id v16 = 0;
    id v17 = 0;
    BOOL v9 = [(PKPayLaterMerchandisingUtilities *)self _evaluateLocalChecksForConfiguration:v6 outError:&v17 invalidProperties:&v16];
    id v10 = v17;
    id v11 = v16;
    if (v9)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __83__PKPayLaterMerchandisingUtilities_evaluateEligibilityForConfiguration_completion___block_invoke;
      v12[3] = &unk_1E56F1138;
      id v13 = v6;
      id v14 = v11;
      id v15 = v7;
      [(PKPayLaterMerchandisingUtilities *)self _validateRemoteChecksForConfiguration:v13 completion:v12];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v10;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Pay later widget did not pass local checks: %@. Invalid properties %@", buf, 0x16u);
      }

      (*((void (**)(id, id, id))v7 + 2))(v7, v10, v11);
    }
  }
}

void __83__PKPayLaterMerchandisingUtilities_evaluateEligibilityForConfiguration_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      int v15 = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      BOOL v9 = "Pay later widget did not pass remote checks: %@. Invalid properties %@";
      id v10 = v7;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
    }
  }
  else if (v8)
  {
    id v12 = (void *)a1[4];
    int v15 = 138412290;
    id v16 = v12;
    BOOL v9 = "Pay later widget is eligble for configuration: %@.";
    id v10 = v7;
    uint32_t v11 = 12;
    goto LABEL_6;
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v13 unionSet:a1[5]];
  [v13 unionSet:v6];
  (*(void (**)(void, id, id, uint64_t))(a1[6] + 16))(a1[6], v5, v13, v14);
}

- (void)clearWebRequestCache
{
  id v3 = [(NSURLSession *)self->_urlSession configuration];
  v2 = [v3 URLCache];
  [v2 removeAllCachedResponses];
}

- (void)_performWebRequestForURL:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    BOOL v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingUtilities requesting contents of URL %@", buf, 0xCu);
    }

    urlSession = self->_urlSession;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PKPayLaterMerchandisingUtilities__performWebRequestForURL_completion___block_invoke;
    v11[3] = &unk_1E56DF250;
    id v12 = v7;
    id v10 = [(NSURLSession *)urlSession dataTaskWithURL:v6 completionHandler:v11];
    [v10 resume];
  }
}

void __72__PKPayLaterMerchandisingUtilities__performWebRequestForURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218498;
    uint64_t v13 = [v7 length];
    __int16 v14 = 2048;
    uint64_t v15 = [v9 code];
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingUtilities received response data %ld bytes, error code %ld, and error %@", (uint8_t *)&v12, 0x20u);
  }

  if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if ([v8 statusCode] == 200) {
      id v11 = v7;
    }
    else {
      id v11 = 0;
    }
    (*(void (**)(void, id, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v11, 0);
  }
}

- (BOOL)_evaluateLocalChecksForConfiguration:(id)a3 outError:(id *)a4 invalidProperties:(id *)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0) {
    [(PKPayLaterMerchandisingUtilities *)self _formValidationError:a4 underlyingError:0];
  }
  id v10 = [v7 amount];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if (objc_msgSend(v11, "pk_isNotANumber"))
    {
      int v12 = @"amount must be a number";
    }
    else if (objc_msgSend(v11, "pk_isNegativeNumber") & 1) != 0 || (objc_msgSend(v11, "pk_isZeroNumber"))
    {
      int v12 = @"amount must be greater than zero";
    }
    else if (PKIsCurrencyDecimalTooLarge(v11))
    {
      int v12 = @"amount too large";
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = [NSString stringWithFormat:@"\"%@\" is not a supported value for amount", v10];
  }
  char v38 = isKindOfClass;
  if (a4 && v12)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    v43[0] = v12;
    __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    *a4 = [v13 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v14];
  }
  else
  {

    if (!v12) {
      goto LABEL_19;
    }
  }
  [v8 addObject:&unk_1EE22C350];
  [(PKPayLaterMerchandisingUtilities *)self _formValidationError:a4 underlyingError:0];
LABEL_19:
  uint64_t v15 = [v7 currency];
  __int16 v16 = [MEMORY[0x1E4F1CA20] ISOCurrencyCodes];
  id v17 = v15;
  id v18 = v16;
  uint64_t v19 = v18;
  id v40 = v8;
  id v39 = v7;
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = 0;
      char v21 = 1;
      goto LABEL_24;
    }
  }
  else
  {
    [v18 containsObject:0];
  }
  uint64_t v22 = [NSString stringWithFormat:@"\"%@\" is not a supported value for %@", v17, @"currency"];
  v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v42 = *MEMORY[0x1E4F28568];
  v43[0] = v22;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
  id v20 = [v23 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v24];

  id v8 = v40;
  char v21 = 0;
LABEL_24:

  id v25 = v20;
  if ((v21 & 1) == 0)
  {
    [v8 addObject:&unk_1EE22C368];
    [(PKPayLaterMerchandisingUtilities *)self _formValidationError:a4 underlyingError:v25];
  }
  v26 = self->_locale;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [NSString stringWithFormat:@"\"%@\" is not a supported value for locale", v26];
    if (a4) {
      goto LABEL_33;
    }
LABEL_35:

    v34 = v39;
    if (!v31) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  v27 = v26;
  v28 = [MEMORY[0x1E4F1CA20] availableLocaleIdentifiers];
  v29 = [(NSLocale *)v27 localeIdentifier];
  char v30 = [v28 containsObject:v29];

  if (v30)
  {
    v31 = 0;
  }
  else
  {
    v31 = [NSString stringWithFormat:@"%@ is not a valid locale", v27];
  }

  id v8 = v40;
  if (!a4) {
    goto LABEL_35;
  }
LABEL_33:
  if (!v31) {
    goto LABEL_35;
  }
  v32 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v42 = *MEMORY[0x1E4F28568];
  v43[0] = v31;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
  *a4 = [v32 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v33];

  id v8 = v40;
  v34 = v39;
LABEL_36:
  [v8 addObject:&unk_1EE22C380];
  [(PKPayLaterMerchandisingUtilities *)self _formValidationError:a4 underlyingError:v25];
LABEL_37:
  if (a5) {
    *a5 = v8;
  }
  if (v31) {
    char v35 = 0;
  }
  else {
    char v35 = v21;
  }
  if (v12) {
    char v36 = 0;
  }
  else {
    char v36 = v35;
  }

  return v38 & v36;
}

- (void)_validateRemoteChecksForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v9 = [(PKPayLaterMerchandisingUtilities *)self merchandisingEligibilityURLWithConfiguration:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__PKPayLaterMerchandisingUtilities__validateRemoteChecksForConfiguration_completion___block_invoke;
    v11[3] = &unk_1E56F1160;
    void v11[4] = self;
    id v14 = v7;
    id v12 = v6;
    id v13 = v8;
    id v10 = v8;
    [(PKPayLaterMerchandisingUtilities *)self _performWebRequestForURL:v9 completion:v11];
  }
}

void __85__PKPayLaterMerchandisingUtilities__validateRemoteChecksForConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v44 = v5;
  uint64_t v7 = [v5 length];
  if (v6 || !v7)
  {
    id v14 = *(void **)(a1 + 32);
    id v46 = 0;
    [v14 _formValidationError:&v46 underlyingError:v6];
    id v8 = v46;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_33;
  }
  id v45 = 0;
  id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v45];
  id v6 = v45;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  v37 = [v8 PKDictionaryForKey:@"method"];
  id v9 = [v37 PKDictionaryForKey:@"bnpl"];
  uint64_t v40 = [v9 PKDecimalNumberForKey:@"minAmount"];
  char v36 = v9;
  v43 = [v9 PKDecimalNumberForKey:@"maxAmount"];
  id v10 = [v8 PKStringForKey:@"currencyCode"];
  id v11 = [v8 objectForKey:@"nativeContent"];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v8 objectForKey:@"text"];
  }
  uint64_t v15 = v13;

  __int16 v16 = [v15 allKeys];
  id v39 = v15;
  if ([v16 count])
  {
    uint64_t v42 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
  }
  else
  {
    uint64_t v42 = 0;
  }
  id v17 = [*(id *)(a1 + 40) currency];
  id v18 = v10;
  id v19 = v17;
  v41 = v18;
  char v38 = v16;
  if (v18 == v19)
  {
  }
  else
  {
    id v20 = v19;
    if (!v18 || !v19)
    {

      id v21 = v18;
LABEL_20:
      [*(id *)(a1 + 48) addObject:&unk_1EE22C368];
      v23 = [NSString stringWithFormat:@"\"%@\" is not a supported value for currency", v21];
      goto LABEL_21;
    }
    id v21 = v18;
    char v22 = [v18 isEqualToString:v19];

    if ((v22 & 1) == 0) {
      goto LABEL_20;
    }
  }
  v23 = 0;
LABEL_21:
  v24 = [*(id *)(*(void *)(a1 + 32) + 16) languageCode];
  if (([v42 containsObject:v24] & 1) == 0)
  {
    [*(id *)(a1 + 48) addObject:&unk_1EE22C380];
    uint64_t v25 = [NSString stringWithFormat:@"\"%@\" is not a supported language code", v24];

    v23 = (void *)v25;
  }
  v26 = (void *)v40;
  v27 = [*(id *)(a1 + 40) amount];
  v28 = v27;
  if (v40 && [v27 compare:v40] == -1)
  {
    [*(id *)(a1 + 48) addObject:&unk_1EE22C350];
    uint64_t v29 = [NSString stringWithFormat:@"\"%@\" is not a supported amount", v28];

    v23 = (void *)v29;
  }
  if (v43 && objc_msgSend(v28, "compare:") == 1)
  {
    [*(id *)(a1 + 48) addObject:&unk_1EE22C350];
    uint64_t v30 = [NSString stringWithFormat:@"\"%@\" is not a supported amount", v28];

    v23 = (void *)v30;
  }
  if (v23)
  {
    v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48[0] = v23;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    v32 = v23;
    v34 = v33 = v24;
    v26 = (void *)v40;
    char v35 = [v31 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v34];

    v24 = v33;
    v23 = v32;
  }
  else
  {
    char v35 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_33:
}

- (BOOL)_formValidationError:(id *)a3 underlyingError:(id)a4
{
  if (a3)
  {
    id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v6 = a4;
    id v7 = objc_alloc_init(v5);
    [v7 safelySetObject:@"Invalid pay later merchandising configuration" forKey:*MEMORY[0x1E4F28568]];
    [v7 safelySetObject:v6 forKey:*MEMORY[0x1E4F28A50]];

    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v7];
  }
  return 0;
}

- (id)_baseURLComponents
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v2 setScheme:@"https"];
  return v2;
}

- (id)_fragmentForModalConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((unint64_t)[v4 action] <= 1)
  {
    id v6 = [v4 amountString];
    [v5 safelySetObject:v6 forKey:@"amount"];

    [v5 safelySetObject:@"4" forKey:@"frequency"];
    id v7 = PKPayLaterThemeToString((__CFString *)[v4 theme]);
    [v5 safelySetObject:v7 forKey:@"theme"];

    id v8 = [(PKPayLaterMerchandisingUtilities *)self _localeString];
    [v5 safelySetObject:v8 forKey:@"locale"];

    id v9 = -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self, "merchandisingBaseURLForEnviornmentType:", [v4 environmentType]);
    id v10 = [v9 host];

    [v5 safelySetObject:v10 forKey:@"referralUrl"];
  }
  if (![v5 count])
  {
    id v14 = 0;
    goto LABEL_14;
  }
  id v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Using fragment dictionary for pay later merchandising modal: %@", buf, 0xCu);
  }

  id v16 = 0;
  id v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:4 error:&v16];
  id v13 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Pay Later Merchandising - failed to serialize data: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  id v11 = [v12 base64EncodedStringWithOptions:16];
  if (![v11 length])
  {
LABEL_12:
    id v14 = 0;
    goto LABEL_13;
  }
  id v14 = [NSString stringWithFormat:@"data=%@", v11];
LABEL_13:

LABEL_14:
  return v14;
}

- (id)_dynamicMerchandisingURLWithRegionCode:(id)a3
{
  id v3 = NSString;
  id v4 = [a3 lowercaseString];
  id v5 = [v3 stringWithFormat:@"merchandising-%@.json", v4];

  return v5;
}

- (id)_urlWithBaseURL:(id)a3 pathComponents:(id)a4 queryParameters:(id)a5 fragment:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v36 = a6;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v45;
    do
    {
      uint64_t v15 = 0;
      id v16 = v9;
      do
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(void **)(*((void *)&v44 + 1) + 8 * v15);
        id v18 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
        uint64_t v19 = [v17 stringByAddingPercentEncodingWithAllowedCharacters:v18];
        id v9 = [v16 URLByAppendingPathComponent:v19];

        ++v15;
        id v16 = v9;
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v13);
  }
  v37 = v10;
  id v39 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v20 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v11;
  uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v41;
    v24 = @"?";
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v27 = [v26 name];
        v28 = [v26 value];
        uint64_t v29 = [v27 stringByAddingPercentEncodingWithAllowedCharacters:v20];
        uint64_t v30 = [v28 stringByAddingPercentEncodingWithAllowedCharacters:v20];
        [v39 appendFormat:@"%@%@=%@", v24, v29, v30];

        v24 = @"&";
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v22);
  }

  if ([v36 length]) {
    [v39 appendFormat:@"#%@", v36];
  }
  v31 = (void *)MEMORY[0x1E4F1CB10];
  v32 = [v9 absoluteString];
  v33 = [v32 stringByAppendingString:v39];
  v34 = [v31 URLWithString:v33];

  return v34;
}

- (id)_localeString
{
  id v2 = [(NSLocale *)self->_locale localeIdentifier];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end