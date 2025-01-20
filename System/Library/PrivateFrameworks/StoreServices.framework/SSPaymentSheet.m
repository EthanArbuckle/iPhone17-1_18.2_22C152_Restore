@interface SSPaymentSheet
+ (id)_attributedStringWithString:(id)a3 styles:(id)a4;
+ (id)_styleDictionaryWithName:(id)a3 styles:(id)a4;
+ (id)stringWithFormattedUsernameForString:(id)a3 username:(id)a4;
- (BOOL)isApplePayClassic;
- (BOOL)shouldShowCardPicker;
- (BOOL)shouldSuppressPrice;
- (BOOL)shouldUppercaseText;
- (NSArray)attributedList;
- (NSArray)flexList;
- (NSArray)inlineImages;
- (NSArray)priceSectionItems;
- (NSArray)salableInfo;
- (NSArray)styles;
- (NSAttributedString)displayPriceLabel;
- (NSAttributedString)salableInfoLabel;
- (NSDictionary)merchantSession;
- (NSNumber)designVersion;
- (NSNumber)price;
- (NSString)accountHeader;
- (NSString)accountName;
- (NSString)buyParams;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)dialogId;
- (NSString)displayPrice;
- (NSString)explanation;
- (NSString)message;
- (NSString)paymentSummary;
- (NSString)presentingSceneIdentifier;
- (NSString)ratingHeader;
- (NSString)ratingValue;
- (NSString)salableIconURLString;
- (NSString)storeName;
- (NSString)title;
- (NSURL)salableIconURL;
- (SSPaymentSheet)init;
- (SSPaymentSheet)initWithServerResponse:(id)a3;
- (SSPaymentSheet)initWithServerResponse:(id)a3 buyParams:(id)a4;
- (SSPaymentSheet)initWithXPCEncoding:(id)a3;
- (id)_attributedListForFlexList:(id)a3;
- (id)_attributedStringForAttributedArray:(id)a3;
- (id)_attributedStringForAttributedDictionary:(id)a3;
- (id)_attributedStringForSalableInfoStringArray:(id)a3;
- (id)_attributedStringForString:(id)a3;
- (id)_attributedStringForStringArray:(id)a3 useGrey:(BOOL)a4;
- (id)_displayPriceLabelForDisplayPrice:(id)a3;
- (id)_greyAttributedStringForAttributedString:(id)a3 range:(_NSRange)a4;
- (id)_replaceBreakingSpaceMarkupForMutableAttributedString:(id)a3;
- (id)_replaceMarkupForMutableAttributedString:(id)a3 markupType:(int64_t)a4;
- (id)authKitAuthenticationContextForAccount:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)defaultAuthKitAuthenticationContext;
- (int64_t)_confirmationTitleTypeForStringValue:(id)a3;
- (int64_t)_inferSalableIconTypeWithBuyParams:(id)a3;
- (int64_t)_payeeTypeForRequestorValue:(id)a3;
- (int64_t)_payeeTypeInferredFromEnumeratedTitle;
- (int64_t)_salableIconTypeForString:(id)a3;
- (int64_t)confirmationTitleType;
- (int64_t)payeeType;
- (int64_t)salableIconType;
- (int64_t)titleType;
- (void)_init;
- (void)_lock;
- (void)_parseResponse:(id)a3;
- (void)_salableInfoItemsToUppercase;
- (void)_stringValuesToUppercase;
- (void)_unlock;
- (void)setAccountHeader:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setApplePayClassic:(BOOL)a3;
- (void)setConfirmationTitleType:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDesignVersion:(id)a3;
- (void)setDialogId:(id)a3;
- (void)setDisplayPrice:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setMerchantSession:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPayeeType:(int64_t)a3;
- (void)setPaymentSummary:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setPrice:(id)a3;
- (void)setPriceSectionItems:(id)a3;
- (void)setRatingHeader:(id)a3;
- (void)setRatingValue:(id)a3;
- (void)setSalableIconType:(int64_t)a3;
- (void)setSalableIconURLString:(id)a3;
- (void)setSalableInfo:(id)a3;
- (void)setShouldShowCardPicker:(BOOL)a3;
- (void)setShouldSuppressPrice:(BOOL)a3;
- (void)setShouldUppercaseText:(BOOL)a3;
- (void)setStoreName:(id)a3;
- (void)setStyles:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleType:(int64_t)a3;
@end

@implementation SSPaymentSheet

- (id)defaultAuthKitAuthenticationContext
{
  v3 = +[SSAccountStore defaultStore];
  v4 = [v3 activeAccount];
  v5 = [(SSPaymentSheet *)self authKitAuthenticationContextForAccount:v4];

  return v5;
}

- (id)authKitAuthenticationContextForAccount:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 accountName];
  if (!v5)
  {
    v6 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v6)
    {
      v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      LODWORD(v40) = 138543362;
      *(void *)((char *)&v40 + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&v40 + 4);
      LODWORD(v39) = 12;
      v38 = &v40;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v40, v39, v40);
      free(v11);
      SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v9);
    }

    goto LABEL_13;
  }
LABEL_14:
  id v18 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  v19 = [v4 altDSID];
  [v18 setAltDSID:v19];

  v20 = [v4 uniqueIdentifier];

  v21 = [v20 stringValue];
  [v18 setDSID:v21];

  [v18 setIsUsernameEditable:v5 == 0];
  v22 = [(SSPaymentSheet *)self message];
  objc_msgSend(v18, "set_passwordPromptTitle:", v22);

  v23 = [(SSPaymentSheet *)self explanation];
  [v18 setReason:v23];

  [v18 setShouldAllowAppleIDCreation:0];
  [v18 setAuthenticationType:2];
  [v18 setShouldUpdatePersistentServiceTokens:1];
  [v18 setUsername:v5];
  if (v18) {
    goto LABEL_27;
  }
  v24 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v24)
  {
    v24 = +[SSLogConfig sharedConfig];
  }
  int v25 = objc_msgSend(v24, "shouldLog", v38);
  if ([v24 shouldLogToDisk]) {
    int v26 = v25 | 2;
  }
  else {
    int v26 = v25;
  }
  v27 = [v24 OSLogObject];
  if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    v26 &= 2u;
  }
  if (!v26) {
    goto LABEL_25;
  }
  v28 = objc_opt_class();
  LODWORD(v40) = 138543362;
  *(void *)((char *)&v40 + 4) = v28;
  id v29 = v28;
  LODWORD(v39) = 12;
  v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v40, v39);
    free(v30);
    SSFileLog(v24, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v27);
LABEL_25:
  }
LABEL_27:

  return v18;
}

- (SSPaymentSheet)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSPaymentSheet;
  v2 = [(SSPaymentSheet *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSPaymentSheet *)v2 _init];
  }
  return v3;
}

- (SSPaymentSheet)initWithServerResponse:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SSPaymentSheet;
  objc_super v5 = [(SSPaymentSheet *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SSPaymentSheet *)v5 _init];
    [(SSPaymentSheet *)v6 _parseResponse:v4];
  }

  return v6;
}

- (SSPaymentSheet)initWithServerResponse:(id)a3 buyParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSPaymentSheet;
  objc_super v8 = [(SSPaymentSheet *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(SSPaymentSheet *)v8 _init];
    [(SSPaymentSheet *)v9 _parseResponse:v6];
    uint64_t v10 = [v7 copy];
    buyParams = v9->_buyParams;
    v9->_buyParams = (NSString *)v10;

    uint64_t v12 = [(SSPaymentSheet *)v9 _inferSalableIconTypeWithBuyParams:v7];
    if (v12) {
      [(SSPaymentSheet *)v9 setSalableIconType:v12];
    }
  }

  return v9;
}

- (void)_init
{
  self->_applePayClassic = 0;
  v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  lock = self->_lock;
  self->_lock = v3;

  countryCode = self->_countryCode;
  self->_countryCode = (NSString *)@"US";

  currencyCode = self->_currencyCode;
  self->_currencyCode = (NSString *)@"USD";

  *(_WORD *)&self->_shouldShowCardPicker = 0;
  self->_shouldUppercaseText = 1;
}

+ (id)stringWithFormattedUsernameForString:(id)a3 username:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if ([v7 containsString:@"%%appleId%%"])
  {
    int v8 = 1;
  }
  else
  {
    v9 = [@"%%appleId%%" localizedUppercaseString];
    int v8 = [v7 containsString:v9];
  }
  if ([v7 containsString:@"%%APPLE_ID%%"])
  {
    int v10 = 1;
  }
  else
  {
    v11 = [@"%%APPLE_ID%%" localizedUppercaseString];
    int v10 = [v7 containsString:v11];

    uint64_t v12 = v7;
    if ((v8 | v10) != 1) {
      goto LABEL_29;
    }
  }
  if (v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F4F0E0] formattedUsernameFromUsername:v6];
    objc_super v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = (void *)v13;
    }
    else {
      uint64_t v15 = v6;
    }
    uint64_t v16 = v15;
    goto LABEL_24;
  }
  uint64_t v17 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v17)
  {
    uint64_t v17 = +[SSLogConfig sharedConfig];
  }
  int v18 = [v17 shouldLog];
  if ([v17 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  v20 = [v17 OSLogObject];
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    v19 &= 2u;
  }
  if (!v19) {
    goto LABEL_22;
  }
  LODWORD(v36) = 138412290;
  *(void *)((char *)&v36 + 4) = objc_opt_class();
  id v21 = *(id *)((char *)&v36 + 4);
  LODWORD(v35) = 12;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v36, v35, v36);
    free(v22);
    SSFileLog(v17, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v20);
LABEL_22:
  }
  objc_super v14 = 0;
  uint64_t v16 = &stru_1EF96DA90;
LABEL_24:
  uint64_t v12 = v7;
  if (v8)
  {
    id v29 = [v7 stringByReplacingOccurrencesOfString:@"%%appleId%%" withString:v16];

    v30 = [@"%%appleId%%" localizedUppercaseString];
    uint64_t v12 = [v29 stringByReplacingOccurrencesOfString:v30 withString:v16];
  }
  if (v10)
  {
    uint64_t v31 = [(__CFString *)v16 localizedUppercaseString];
    uint64_t v32 = [v12 stringByReplacingOccurrencesOfString:@"%%APPLE_ID%%" withString:v31];

    uint64_t v33 = [@"%%APPLE_ID%%" localizedUppercaseString];
    uint64_t v12 = [v32 stringByReplacingOccurrencesOfString:v33 withString:v31];
  }
LABEL_29:

  return v12;
}

- (NSString)accountHeader
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_accountHeader copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSString)buyParams
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_buyParams copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSString)displayPrice
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_displayPrice copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSAttributedString)displayPriceLabel
{
  [(SSPaymentSheet *)self _lock];
  displayPriceLabel = self->_displayPriceLabel;
  if (!displayPriceLabel)
  {
    id v4 = [(SSPaymentSheet *)self _displayPriceLabelForDisplayPrice:self->_displayPrice];
    id v5 = self->_displayPriceLabel;
    self->_displayPriceLabel = v4;

    displayPriceLabel = self->_displayPriceLabel;
  }
  id v6 = (void *)[(NSAttributedString *)displayPriceLabel copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSAttributedString *)v6;
}

- (NSString)explanation
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_explanation copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSString)paymentSummary
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_paymentSummary copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSString)presentingSceneIdentifier
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_presentingSceneIdentifier copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSString)ratingHeader
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_ratingHeader copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSString)ratingValue
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_ratingValue copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSURL)salableIconURL
{
  [(SSPaymentSheet *)self _lock];
  salableIconURL = self->_salableIconURL;
  if (!salableIconURL)
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:self->_salableIconURLString];
    id v5 = self->_salableIconURL;
    self->_salableIconURL = v4;

    salableIconURL = self->_salableIconURL;
  }
  id v6 = (void *)[(NSURL *)salableIconURL copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSURL *)v6;
}

- (NSString)salableIconURLString
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_salableIconURLString copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (NSArray)salableInfo
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSArray *)self->_salableInfo copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSArray *)v3;
}

- (NSAttributedString)salableInfoLabel
{
  [(SSPaymentSheet *)self _lock];
  salableInfoLabel = self->_salableInfoLabel;
  if (!salableInfoLabel)
  {
    if (self->_salableInfo)
    {
      -[SSPaymentSheet _attributedStringForSalableInfoStringArray:](self, "_attributedStringForSalableInfoStringArray:");
      id v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      id v5 = self->_salableInfoLabel;
      self->_salableInfoLabel = v4;

      salableInfoLabel = self->_salableInfoLabel;
    }
    else
    {
      salableInfoLabel = 0;
    }
  }
  id v6 = (void *)[(NSAttributedString *)salableInfoLabel copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSAttributedString *)v6;
}

- (void)setAccountHeader:(id)a3
{
  int v8 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_accountHeader != v8)
  {
    id v4 = (NSString *)[(NSString *)v8 copy];
    accountHeader = self->_accountHeader;
    self->_accountHeader = v4;

    if (self->_shouldUppercaseText)
    {
      id v6 = [(NSString *)self->_accountHeader localizedUppercaseString];
      id v7 = self->_accountHeader;
      self->_accountHeader = v6;
    }
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setDisplayPrice:(id)a3
{
  v9 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_displayPrice != v9)
  {
    id v4 = (NSString *)[(NSString *)v9 copy];
    displayPrice = self->_displayPrice;
    self->_displayPrice = v4;

    if (self->_shouldUppercaseText)
    {
      id v6 = [(NSString *)self->_displayPrice localizedUppercaseString];
      id v7 = self->_displayPrice;
      self->_displayPrice = v6;
    }
    displayPriceLabel = self->_displayPriceLabel;
    self->_displayPriceLabel = 0;
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setExplanation:(id)a3
{
  int v10 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_explanation != v10)
  {
    id v4 = (void *)[(NSString *)v10 copy];
    id v5 = [(SSPaymentSheet *)self accountName];
    if (!v5)
    {
      id v6 = +[SSAccountStore defaultStore];
      id v7 = [v6 activeAccount];
      id v5 = [v7 accountName];
    }
    int v8 = [(id)objc_opt_class() stringWithFormattedUsernameForString:v4 username:v5];
    explanation = self->_explanation;
    self->_explanation = v8;
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setPaymentSummary:(id)a3
{
  int v8 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_paymentSummary != v8)
  {
    id v4 = (NSString *)[(NSString *)v8 copy];
    paymentSummary = self->_paymentSummary;
    self->_paymentSummary = v4;

    if (self->_shouldUppercaseText)
    {
      id v6 = [(NSString *)self->_paymentSummary localizedUppercaseString];
      id v7 = self->_paymentSummary;
      self->_paymentSummary = v6;
    }
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  id v6 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_presentingSceneIdentifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    presentingSceneIdentifier = self->_presentingSceneIdentifier;
    self->_presentingSceneIdentifier = v4;
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setRatingHeader:(id)a3
{
  int v8 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_ratingHeader != v8)
  {
    id v4 = (NSString *)[(NSString *)v8 copy];
    ratingHeader = self->_ratingHeader;
    self->_ratingHeader = v4;

    if (self->_shouldUppercaseText)
    {
      id v6 = [(NSString *)self->_ratingHeader localizedUppercaseString];
      id v7 = self->_ratingHeader;
      self->_ratingHeader = v6;
    }
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setRatingValue:(id)a3
{
  int v8 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_ratingValue != v8)
  {
    id v4 = (NSString *)[(NSString *)v8 copy];
    ratingValue = self->_ratingValue;
    self->_ratingValue = v4;

    if (self->_shouldUppercaseText)
    {
      id v6 = [(NSString *)self->_ratingValue localizedUppercaseString];
      id v7 = self->_ratingValue;
      self->_ratingValue = v6;
    }
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setSalableIconURLString:(id)a3
{
  id v7 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_salableIconURLString != v7)
  {
    id v4 = (NSString *)[(NSString *)v7 copy];
    salableIconURLString = self->_salableIconURLString;
    self->_salableIconURLString = v4;

    salableIconURL = self->_salableIconURL;
    self->_salableIconURL = 0;
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setSalableInfo:(id)a3
{
  id v7 = (NSArray *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_salableInfo != v7)
  {
    id v4 = (NSArray *)[(NSArray *)v7 copy];
    salableInfo = self->_salableInfo;
    self->_salableInfo = v4;

    if (self->_shouldUppercaseText) {
      [(SSPaymentSheet *)self _salableInfoItemsToUppercase];
    }
    salableInfoLabel = self->_salableInfoLabel;
    self->_salableInfoLabel = 0;
  }
  [(SSPaymentSheet *)self _unlock];
}

- (void)setStoreName:(id)a3
{
  int v8 = (NSString *)a3;
  [(SSPaymentSheet *)self _lock];
  if (self->_storeName != v8)
  {
    id v4 = (NSString *)[(NSString *)v8 copy];
    storeName = self->_storeName;
    self->_storeName = v4;

    if (self->_shouldUppercaseText)
    {
      id v6 = [(NSString *)self->_storeName localizedUppercaseString];
      id v7 = self->_storeName;
      self->_storeName = v6;
    }
  }
  [(SSPaymentSheet *)self _unlock];
}

- (NSString)storeName
{
  [(SSPaymentSheet *)self _lock];
  v3 = (void *)[(NSString *)self->_storeName copy];
  [(SSPaymentSheet *)self _unlock];
  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSString *)self->_accountHeader copyWithZone:a3];
  id v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSArray *)self->_attributedList copyWithZone:a3];
  v9 = (void *)v5[19];
  v5[19] = v8;

  v5[20] = self->_confirmationTitleType;
  uint64_t v10 = [(NSString *)self->_countryCode copyWithZone:a3];
  v11 = (void *)v5[21];
  v5[21] = v10;

  uint64_t v12 = [(NSString *)self->_currencyCode copyWithZone:a3];
  uint64_t v13 = (void *)v5[22];
  v5[22] = v12;

  uint64_t v14 = [(NSNumber *)self->_designVersion copyWithZone:a3];
  uint64_t v15 = (void *)v5[23];
  v5[23] = v14;

  uint64_t v16 = [(NSString *)self->_dialogId copyWithZone:a3];
  uint64_t v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSString *)self->_displayPrice copyWithZone:a3];
  int v19 = (void *)v5[6];
  v5[6] = v18;

  uint64_t v20 = [(NSString *)self->_explanation copyWithZone:a3];
  id v21 = (void *)v5[8];
  v5[8] = v20;

  uint64_t v22 = [(NSArray *)self->_flexList copyWithZone:a3];
  uint64_t v23 = (void *)v5[24];
  v5[24] = v22;

  uint64_t v24 = [(NSArray *)self->_inlineImages copyWithZone:a3];
  uint64_t v25 = (void *)v5[25];
  v5[25] = v24;

  *((unsigned char *)v5 + 16) = self->_applePayClassic;
  uint64_t v26 = [(NSDictionary *)self->_merchantSession copyWithZone:a3];
  uint64_t v27 = (void *)v5[26];
  v5[26] = v26;

  uint64_t v28 = [(NSString *)self->_message copyWithZone:a3];
  id v29 = (void *)v5[27];
  v5[27] = v28;

  v5[28] = self->_payeeType;
  uint64_t v30 = [(NSString *)self->_paymentSummary copyWithZone:a3];
  uint64_t v31 = (void *)v5[9];
  v5[9] = v30;

  uint64_t v32 = [(NSString *)self->_presentingSceneIdentifier copyWithZone:a3];
  uint64_t v33 = (void *)v5[10];
  v5[10] = v32;

  uint64_t v34 = [(NSNumber *)self->_price copyWithZone:a3];
  uint64_t v35 = (void *)v5[29];
  v5[29] = v34;

  uint64_t v36 = [(NSArray *)self->_priceSectionItems copyWithZone:a3];
  uint64_t v37 = (void *)v5[30];
  v5[30] = v36;

  uint64_t v38 = [(NSString *)self->_ratingHeader copyWithZone:a3];
  uint64_t v39 = (void *)v5[11];
  v5[11] = v38;

  uint64_t v40 = [(NSString *)self->_ratingValue copyWithZone:a3];
  uint64_t v41 = (void *)v5[12];
  v5[12] = v40;

  v5[31] = self->_salableIconType;
  uint64_t v42 = [(NSString *)self->_salableIconURLString copyWithZone:a3];
  v43 = (void *)v5[14];
  v5[14] = v42;

  uint64_t v44 = [(NSArray *)self->_salableInfo copyWithZone:a3];
  v45 = (void *)v5[15];
  v5[15] = v44;

  *((unsigned char *)v5 + 17) = self->_shouldShowCardPicker;
  *((unsigned char *)v5 + 18) = self->_shouldSuppressPrice;
  *((unsigned char *)v5 + 19) = self->_shouldUppercaseText;
  uint64_t v46 = [(NSString *)self->_storeName copyWithZone:a3];
  v47 = (void *)v5[17];
  v5[17] = v46;

  uint64_t v48 = [(NSString *)self->_title copyWithZone:a3];
  v49 = (void *)v5[33];
  v5[33] = v48;

  v5[34] = self->_titleType;
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountHeader);
  xpc_dictionary_set_BOOL(v3, "25", self->_applePayClassic);
  SSXPCDictionarySetObject(v3, "28", self->_attributedList);
  SSXPCDictionarySetObject(v3, "20", self->_buyParams);
  xpc_dictionary_set_int64(v3, "1", self->_confirmationTitleType);
  SSXPCDictionarySetObject(v3, "2", self->_countryCode);
  SSXPCDictionarySetObject(v3, "3", self->_currencyCode);
  SSXPCDictionarySetObject(v3, "30", self->_designVersion);
  SSXPCDictionarySetObject(v3, "21", self->_dialogId);
  SSXPCDictionarySetObject(v3, "4", self->_displayPrice);
  SSXPCDictionarySetObject(v3, "5", self->_explanation);
  SSXPCDictionarySetObject(v3, "6", self->_flexList);
  SSXPCDictionarySetObject(v3, "22", self->_inlineImages);
  SSXPCDictionarySetObject(v3, "24", self->_merchantSession);
  SSXPCDictionarySetObject(v3, "7", self->_message);
  xpc_dictionary_set_int64(v3, "8", self->_payeeType);
  SSXPCDictionarySetObject(v3, "9", self->_paymentSummary);
  SSXPCDictionarySetObject(v3, "29", self->_presentingSceneIdentifier);
  SSXPCDictionarySetObject(v3, "10", self->_price);
  SSXPCDictionarySetObject(v3, "23", self->_priceSectionItems);
  SSXPCDictionarySetObject(v3, "11", self->_ratingHeader);
  SSXPCDictionarySetObject(v3, "12", self->_ratingValue);
  xpc_dictionary_set_int64(v3, "18", self->_salableIconType);
  SSXPCDictionarySetObject(v3, "13", self->_salableIconURLString);
  SSXPCDictionarySetObject(v3, "14", self->_salableInfo);
  xpc_dictionary_set_BOOL(v3, "26", self->_shouldShowCardPicker);
  xpc_dictionary_set_BOOL(v3, "27", self->_shouldSuppressPrice);
  xpc_dictionary_set_BOOL(v3, "19", self->_shouldUppercaseText);
  SSXPCDictionarySetObject(v3, "15", self->_storeName);
  SSXPCDictionarySetObject(v3, "16", self->_title);
  xpc_dictionary_set_int64(v3, "17", self->_titleType);
  return v3;
}

- (SSPaymentSheet)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v77.receiver = self;
    v77.super_class = (Class)SSPaymentSheet;
    uint64_t v6 = [(SSPaymentSheet *)&v77 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountHeader = v6->_accountHeader;
      v6->_accountHeader = (NSString *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "28", v11);
      attributedList = v6->_attributedList;
      v6->_attributedList = (NSArray *)v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "20", v14);
      buyParams = v6->_buyParams;
      v6->_buyParams = (NSString *)v15;

      v6->_confirmationTitleType = xpc_dictionary_get_int64(v5, "1");
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v17);
      countryCode = v6->_countryCode;
      v6->_countryCode = (NSString *)v18;

      uint64_t v20 = objc_opt_class();
      uint64_t v21 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v20);
      currencyCode = v6->_currencyCode;
      v6->_currencyCode = (NSString *)v21;

      uint64_t v23 = objc_opt_class();
      uint64_t v24 = SSXPCDictionaryCopyObjectWithClass(v5, "30", v23);
      designVersion = v6->_designVersion;
      v6->_designVersion = (NSNumber *)v24;

      uint64_t v26 = objc_opt_class();
      uint64_t v27 = SSXPCDictionaryCopyObjectWithClass(v5, "21", v26);
      dialogId = v6->_dialogId;
      v6->_dialogId = (NSString *)v27;

      uint64_t v29 = objc_opt_class();
      uint64_t v30 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v29);
      displayPrice = v6->_displayPrice;
      v6->_displayPrice = (NSString *)v30;

      uint64_t v32 = objc_opt_class();
      uint64_t v33 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v32);
      explanation = v6->_explanation;
      v6->_explanation = (NSString *)v33;

      uint64_t v35 = objc_opt_class();
      uint64_t v36 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v35);
      flexList = v6->_flexList;
      v6->_flexList = (NSArray *)v36;

      uint64_t v38 = objc_opt_class();
      uint64_t v39 = SSXPCDictionaryCopyObjectWithClass(v5, "22", v38);
      inlineImages = v6->_inlineImages;
      v6->_inlineImages = (NSArray *)v39;

      v6->_applePayClassic = xpc_dictionary_get_BOOL(v5, "25");
      uint64_t v41 = objc_opt_class();
      uint64_t v42 = SSXPCDictionaryCopyObjectWithClass(v5, "24", v41);
      merchantSession = v6->_merchantSession;
      v6->_merchantSession = (NSDictionary *)v42;

      uint64_t v44 = objc_opt_class();
      uint64_t v45 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v44);
      message = v6->_message;
      v6->_message = (NSString *)v45;

      uint64_t v47 = objc_opt_class();
      uint64_t v48 = SSXPCDictionaryCopyObjectWithClass(v5, "9", v47);
      paymentSummary = v6->_paymentSummary;
      v6->_paymentSummary = (NSString *)v48;

      v6->_payeeType = xpc_dictionary_get_int64(v5, "8");
      uint64_t v50 = objc_opt_class();
      uint64_t v51 = SSXPCDictionaryCopyObjectWithClass(v5, "29", v50);
      presentingSceneIdentifier = v6->_presentingSceneIdentifier;
      v6->_presentingSceneIdentifier = (NSString *)v51;

      uint64_t v53 = objc_opt_class();
      uint64_t v54 = SSXPCDictionaryCopyObjectWithClass(v5, "10", v53);
      price = v6->_price;
      v6->_price = (NSNumber *)v54;

      uint64_t v56 = objc_opt_class();
      uint64_t v57 = SSXPCDictionaryCopyObjectWithClass(v5, "23", v56);
      priceSectionItems = v6->_priceSectionItems;
      v6->_priceSectionItems = (NSArray *)v57;

      uint64_t v59 = objc_opt_class();
      uint64_t v60 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v59);
      ratingHeader = v6->_ratingHeader;
      v6->_ratingHeader = (NSString *)v60;

      uint64_t v62 = objc_opt_class();
      uint64_t v63 = SSXPCDictionaryCopyObjectWithClass(v5, "12", v62);
      ratingValue = v6->_ratingValue;
      v6->_ratingValue = (NSString *)v63;

      v6->_salableIconType = xpc_dictionary_get_int64(v5, "18");
      uint64_t v65 = objc_opt_class();
      uint64_t v66 = SSXPCDictionaryCopyObjectWithClass(v5, "13", v65);
      salableIconURLString = v6->_salableIconURLString;
      v6->_salableIconURLString = (NSString *)v66;

      uint64_t v68 = objc_opt_class();
      uint64_t v69 = SSXPCDictionaryCopyObjectWithClass(v5, "14", v68);
      salableInfo = v6->_salableInfo;
      v6->_salableInfo = (NSArray *)v69;

      v6->_shouldShowCardPicker = xpc_dictionary_get_BOOL(v5, "26");
      v6->_shouldSuppressPrice = xpc_dictionary_get_BOOL(v5, "27");
      v6->_shouldUppercaseText = xpc_dictionary_get_BOOL(v5, "19");
      uint64_t v71 = objc_opt_class();
      uint64_t v72 = SSXPCDictionaryCopyObjectWithClass(v5, "15", v71);
      storeName = v6->_storeName;
      v6->_storeName = (NSString *)v72;

      uint64_t v74 = objc_opt_class();
      uint64_t v75 = SSXPCDictionaryCopyObjectWithClass(v5, "16", v74);
      title = v6->_title;
      v6->_title = (NSString *)v75;

      v6->_titleType = xpc_dictionary_get_int64(v5, "17");
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_attributedStringForAttributedArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __54__SSPaymentSheet__attributedStringForAttributedArray___block_invoke;
  uint64_t v16 = &unk_1E5BAC568;
  uint64_t v17 = self;
  id v18 = v5;
  id v19 = v4;
  id v20 = v6;
  id v7 = v6;
  id v8 = v4;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:&v13];
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v11 = objc_msgSend(v10, "initWithAttributedString:", v9, v13, v14, v15, v16, v17);

  return v11;
}

void __54__SSPaymentSheet__attributedStringForAttributedArray___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [*(id *)(a1 + 32) _attributedStringForString:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v5 = [*(id *)(a1 + 32) _attributedStringForAttributedDictionary:v7];
  }
  uint64_t v6 = (void *)v5;
  [*(id *)(a1 + 40) appendAttributedString:v5];

LABEL_6:
  if ([*(id *)(a1 + 48) count] - 1 > a3) {
    [*(id *)(a1 + 40) appendAttributedString:*(void *)(a1 + 56)];
  }
}

- (id)_attributedStringForAttributedDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v7 = [(SSPaymentSheet *)self _attributedStringForString:v5];
    id v8 = (void *)[v6 initWithAttributedString:v7];

    id v9 = [v4 objectForKeyedSubscript:@"size"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 isEqualToString:@"large"])
    {
      uint64_t v10 = [v8 length];
      objc_msgSend(v8, "addAttribute:value:range:", @"useLargeSize", MEMORY[0x1E4F1CC38], 0, v10);
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v8];

  return v11;
}

- (id)_attributedStringForSalableInfoStringArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __61__SSPaymentSheet__attributedStringForSalableInfoStringArray___block_invoke;
  uint64_t v16 = &unk_1E5BAC590;
  uint64_t v17 = self;
  id v18 = v5;
  id v19 = v4;
  id v20 = v6;
  id v7 = v6;
  id v8 = v4;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:&v13];
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v11 = objc_msgSend(v10, "initWithAttributedString:", v9, v13, v14, v15, v16, v17);

  return v11;
}

void __61__SSPaymentSheet__attributedStringForSalableInfoStringArray___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) _attributedStringForString:a2];
  id v6 = v5;
  if (a3)
  {
    id v8 = v5;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_greyAttributedStringForAttributedString:range:", v5, 0, objc_msgSend(v5, "length"));

    id v6 = (void *)v7;
  }
  id v9 = v6;
  [*(id *)(a1 + 40) appendAttributedString:v6];
  if ([*(id *)(a1 + 48) count] - 1 > a3) {
    [*(id *)(a1 + 40) appendAttributedString:*(void *)(a1 + 56)];
  }
}

- (id)_attributedStringForString:(id)a3
{
  id v4 = a3;
  id v5 = [(SSPaymentSheet *)self accountName];
  if (!v5)
  {
    id v6 = +[SSAccountStore defaultStore];
    uint64_t v7 = [v6 activeAccount];
    id v5 = [v7 accountName];
  }
  id v8 = [(id)objc_opt_class() stringWithFormattedUsernameForString:v4 username:v5];

  if (self->_shouldUppercaseText)
  {
    uint64_t v9 = [v8 localizedUppercaseString];

    id v8 = (void *)v9;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
  uint64_t v11 = [(SSPaymentSheet *)self _replaceMarkupForMutableAttributedString:v10 markupType:0];

  uint64_t v12 = [(SSPaymentSheet *)self _replaceMarkupForMutableAttributedString:v11 markupType:1];

  uint64_t v13 = [(SSPaymentSheet *)self _replaceBreakingSpaceMarkupForMutableAttributedString:v12];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v13];
  return v14;
}

- (id)_attributedStringForStringArray:(id)a3 useGrey:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__SSPaymentSheet__attributedStringForStringArray_useGrey___block_invoke;
  v14[3] = &unk_1E5BAC5B8;
  BOOL v18 = a4;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v17 = v8;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [v10 enumerateObjectsUsingBlock:v14];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v11];

  return v12;
}

void __58__SSPaymentSheet__attributedStringForStringArray_useGrey___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) _attributedStringForString:a2];
  id v6 = v5;
  if (*(unsigned char *)(a1 + 64))
  {
    id v8 = v5;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_greyAttributedStringForAttributedString:range:", v5, 0, objc_msgSend(v5, "length"));

    id v6 = (void *)v7;
  }
  id v9 = v6;
  [*(id *)(a1 + 40) appendAttributedString:v6];
  if ([*(id *)(a1 + 48) count] - 1 > a3) {
    [*(id *)(a1 + 40) appendAttributedString:*(void *)(a1 + 56)];
  }
}

- (int64_t)_confirmationTitleTypeForStringValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"pay"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"confirm"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"get"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"install"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"rent"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"redeem"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_displayPriceLabelForDisplayPrice:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28B18];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithString:v4];

  return v5;
}

- (id)_greyAttributedStringForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  id v5 = a3;
  if (!_greyAttributedStringForAttributedString_range__kPKPaymentContentItemLightColorAttribute)
  {
    id v6 = (void *)SSVPassKitFramework();
    uint64_t v7 = SSVWeakLinkedStringConstantForString("PKPaymentContentItemLightColorAttribute", v6);
    id v8 = (void *)_greyAttributedStringForAttributedString_range__kPKPaymentContentItemLightColorAttribute;
    _greyAttributedStringForAttributedString_range__kPKPaymentContentItemLightColorAttribute = v7;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v5];
  id v10 = v9;
  if (_greyAttributedStringForAttributedString_range__kPKPaymentContentItemLightColorAttribute) {
    BOOL v11 = length == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    objc_msgSend(v9, "addAttribute:value:range:");
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v10];

  return v12;
}

- (int64_t)_inferSalableIconTypeWithBuyParams:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 rangeOfString:@"mtApp=com.apple.MobileSMS"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v4 rangeOfString:@"mtApp=com.apple.AppStore.BridgeStoreExtension"] == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v5 = 0;
      }
      else {
        int64_t v5 = 3;
      }
    }
    else
    {
      int64_t v5 = 2;
    }
  }
  else
  {
    int64_t v5 = 4;
  }

  return v5;
}

- (void)_lock
{
}

- (void)_parseResponse:(id)a3
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [v4 objectForKey:@"caseControl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 lowercaseString];
    if ([v6 isEqualToString:@"true"]) {
      self->_shouldUppercaseText = 0;
    }
  }
  uint64_t v7 = [v4 objectForKey:@"title"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [v8 objectForKey:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 isEqualToString:@"text"])
      {
        self->_titleType = 0;
      }
      else
      {
        if ([v9 isEqualToString:@"enum"]) {
          int64_t v12 = 1;
        }
        else {
          int64_t v12 = 2;
        }
        self->_titleType = v12;
      }
    }
    uint64_t v13 = [v8 objectForKey:@"value"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = (NSString *)[v13 copy];
      title = self->_title;
      self->_title = v14;
    }
    if (self->_titleType == 2)
    {
      id v16 = [v8 objectForKey:@"fallback"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = (NSString *)[v16 copy];
        BOOL v18 = self->_title;
        self->_title = v17;
      }
    }
    else
    {
      id v16 = v13;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (NSString *)[v7 copy];
      BOOL v11 = self->_title;
      self->_title = v10;

      self->_titleType = 0;
    }
  }
  id v19 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v19)
  {
    id v19 = +[SSLogConfig sharedConfig];
  }
  int v20 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  uint64_t v22 = [v19 OSLogObject];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
    v21 &= 2u;
  }
  if (v21)
  {
    id v23 = (id)objc_opt_class();
    uint64_t v24 = self->_title;
    uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_titleType];
    int v129 = 138543874;
    id v130 = v23;
    __int16 v131 = 2114;
    v132 = v24;
    __int16 v133 = 2114;
    v134 = v25;
    LODWORD(v118) = 32;
    v117 = &v129;
    uint64_t v26 = (void *)_os_log_send_and_compose_impl();

    if (!v26) {
      goto LABEL_33;
    }
    uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v129, v118);
    free(v26);
    SSFileLog(v19, @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v22);
  }

LABEL_33:
  uint64_t v33 = [v4 valueForKey:@"accountHeader"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v34 = (NSString *)[v33 copy];
    accountHeader = self->_accountHeader;
    self->_accountHeader = v34;
  }
  uint64_t v36 = objc_msgSend(v4, "valueForKey:", @"countryCode", v117);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v37 = (NSString *)[v36 copy];
    countryCode = self->_countryCode;
    self->_countryCode = v37;
  }
  uint64_t v39 = [v4 valueForKey:@"currency"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v40 = (NSString *)[v39 copy];
    currencyCode = self->_currencyCode;
    self->_currencyCode = v40;
  }
  uint64_t v42 = [v4 valueForKey:@"designVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v43 = (NSNumber *)[v42 copy];
    designVersion = self->_designVersion;
    self->_designVersion = v43;
  }
  uint64_t v45 = [v4 valueForKey:@"price"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v46 = (NSNumber *)[v45 copy];
    price = self->_price;
    self->_price = v46;
  }
  uint64_t v48 = [v4 valueForKey:@"displayPrice"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = (NSString *)[v48 copy];
    displayPrice = self->_displayPrice;
    self->_displayPrice = v49;

    displayPriceLabel = self->_displayPriceLabel;
    self->_displayPriceLabel = 0;
  }
  v52 = [v4 valueForKey:@"suppressPrice"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v53 = [v52 lowercaseString];
    int v54 = [v53 isEqualToString:@"true"];

    if (v54) {
      self->_shouldSuppressPrice = 1;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_shouldSuppressPrice = [v52 BOOLValue];
    }
  }
  v55 = [v4 valueForKey:@"priceSection"];

  if (!v55)
  {
    v55 = [v4 valueForKey:@"pricingSection"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v57 = v55;
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __33__SSPaymentSheet__parseResponse___block_invoke;
    v124[3] = &unk_1E5BAC5E0;
    v124[4] = self;
    id v58 = v56;
    id v125 = v58;
    [v57 enumerateObjectsUsingBlock:v124];
    uint64_t v59 = (NSArray *)[v58 copy];
    priceSectionItems = self->_priceSectionItems;
    self->_priceSectionItems = v59;
  }
  v61 = [v4 valueForKey:@"requestor"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v62 = [(SSPaymentSheet *)self _payeeTypeForRequestorValue:v61];
  }
  else {
    int64_t v62 = [(SSPaymentSheet *)self _payeeTypeInferredFromEnumeratedTitle];
  }
  self->_payeeType = v62;
  uint64_t v63 = [v4 valueForKey:@"salableIcon"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v64 = (NSString *)[v63 copy];
    salableIconURLString = self->_salableIconURLString;
    self->_salableIconURLString = v64;

    salableIconURL = self->_salableIconURL;
    self->_salableIconURL = 0;
  }
  v67 = [v4 valueForKey:@"salableIconType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v68 = [v67 lowercaseString];
    self->_salableIconType = [(SSPaymentSheet *)self _salableIconTypeForString:v68];
  }
  uint64_t v69 = [v4 valueForKey:@"storeName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v70 = (NSString *)[v69 copy];
    storeName = self->_storeName;
    self->_storeName = v70;
  }
  uint64_t v72 = [v4 valueForKey:@"rating"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v73 = v72;
    uint64_t v74 = [v73 valueForKey:@"header"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v75 = (NSString *)[v74 copy];
      ratingHeader = self->_ratingHeader;
      self->_ratingHeader = v75;
    }
    objc_super v77 = [v73 valueForKey:@"text"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v78 = (NSString *)[v77 copy];
      ratingValue = self->_ratingValue;
      self->_ratingValue = v78;
    }
  }
  v80 = [v4 valueForKey:@"confirmationTitle"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v81 = [v80 lowercaseString];
    self->_confirmationTitleType = [(SSPaymentSheet *)self _confirmationTitleTypeForStringValue:v81];
  }
  v82 = [v4 valueForKey:@"paymentSummary"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v83 = (NSString *)[v82 copy];
    paymentSummary = self->_paymentSummary;
    self->_paymentSummary = v83;
  }
  v85 = [v4 objectForKey:@"salableInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v86 = (NSArray *)[v85 copy];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_78;
    }
    v128 = v85;
    v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
  }
  salableInfo = self->_salableInfo;
  self->_salableInfo = v86;

  salableInfoLabel = self->_salableInfoLabel;
  self->_salableInfoLabel = 0;

LABEL_78:
  v89 = [v4 objectForKey:@"images"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v90 = v89;
    v91 = [[SSPaymentSheetRatingImage alloc] initWithURLString:v90];
    v127 = v91;
    v92 = (void *)MEMORY[0x1E4F1C978];
    v93 = &v127;
LABEL_82:
    v94 = [v92 arrayWithObjects:v93 count:1];
LABEL_83:
    inlineImages = self->_inlineImages;
    self->_inlineImages = v94;

    goto LABEL_84;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v90 = v89;
    v91 = [[SSPaymentSheetRatingImage alloc] initWithDictionary:v90];
    v126 = v91;
    v92 = (void *)MEMORY[0x1E4F1C978];
    v93 = &v126;
    goto LABEL_82;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v91 = v89;
    if (![(SSPaymentSheetRatingImage *)v91 count])
    {
LABEL_105:
      v94 = [MEMORY[0x1E4F1C978] arrayWithArray:v90];
      goto LABEL_83;
    }
    v111 = [(SSPaymentSheetRatingImage *)v91 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v112 = v91;
      v113 = v123;
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v114 = &unk_1E5BA9638;
      v115 = __33__SSPaymentSheet__parseResponse___block_invoke_2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_104:

        goto LABEL_105;
      }
      v116 = v91;
      v113 = v122;
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v114 = &unk_1E5BAC608;
      v115 = __33__SSPaymentSheet__parseResponse___block_invoke_3;
    }
    v113[2] = v115;
    v113[3] = v114;
    v113[4] = v90;
    [(SSPaymentSheetRatingImage *)v91 enumerateObjectsUsingBlock:v113];

    goto LABEL_104;
  }
LABEL_84:
  v96 = [v4 objectForKey:@"styles"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v97 = v96;
  }
  else {
    id v97 = 0;
  }
  id v98 = v97;

  if (v98) {
    [(SSPaymentSheet *)self setStyles:v98];
  }
  v99 = [v4 objectForKey:@"flexList"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v100 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v101 = v99;
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __33__SSPaymentSheet__parseResponse___block_invoke_4;
    v119[3] = &unk_1E5BAC680;
    v119[4] = self;
    id v120 = v98;
    id v102 = v100;
    id v121 = v102;
    [v101 enumerateObjectsUsingBlock:v119];
    v103 = (NSArray *)[v102 copy];
    flexList = self->_flexList;
    self->_flexList = v103;

    v105 = [(SSPaymentSheet *)self _attributedListForFlexList:v101];
    v106 = (NSArray *)[v105 copy];
    attributedList = self->_attributedList;
    self->_attributedList = v106;
  }
  v108 = [v4 objectForKey:@"isApplePay"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v109 = [v108 lowercaseString];
    int v110 = [v109 isEqualToString:@"true"];

    if (v110) {
      self->_applePayClassic = 1;
    }
  }
  if (self->_shouldUppercaseText)
  {
    [(SSPaymentSheet *)self _salableInfoItemsToUppercase];
    [(SSPaymentSheet *)self _stringValuesToUppercase];
  }
}

void __33__SSPaymentSheet__parseResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v7 = (id)[[v3 alloc] initWithDictionary:v4];

  int64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned char *)(*(void *)(a1 + 32) + 19) == 0];
  [v7 setObject:v5 forKeyedSubscript:@"caseControl"];

  id v6 = [[SSPaymentSheetPriceSectionItem alloc] initWithDictionary:v7];
  [*(id *)(a1 + 40) addObject:v6];
}

void __33__SSPaymentSheet__parseResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SSPaymentSheetRatingImage alloc] initWithURLString:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

void __33__SSPaymentSheet__parseResponse___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SSPaymentSheetRatingImage alloc] initWithDictionary:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

void __33__SSPaymentSheet__parseResponse___block_invoke_4(uint64_t a1, void *a2)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) designVersion];
  int v5 = [v4 isEqualToNumber:*MEMORY[0x1E4F4DB68]];

  if (!v5)
  {
    id v6 = [v3 objectForKey:@"header"];
    id v9 = [v3 objectForKey:@"headerIcon"];
    id v10 = [v3 objectForKey:@"value"];
    id v12 = [v3 objectForKey:@"valueStyle"];
    if ([v12 isEqualToString:@"gray"]) {
      int v13 = 1;
    }
    else {
      int v13 = [v12 isEqualToString:@"grey"];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_48;
      }
    }
    if (!v10) {
      goto LABEL_48;
    }
    unsigned int v38 = v13;
    if (v6)
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 19))
      {
        uint64_t v16 = [v6 localizedUppercaseString];

        id v6 = (void *)v16;
      }
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
      if (v9) {
        goto LABEL_20;
      }
    }
    else
    {
      id v17 = 0;
      if (v9)
      {
LABEL_20:
        BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
        goto LABEL_31;
      }
    }
    BOOL v18 = 0;
LABEL_31:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v37 = v9;
      uint64_t v26 = *(void **)(a1 + 32);
      id v49 = v10;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
      uint64_t v27 = v17;
      uint64_t v29 = v28 = v18;
      uint64_t v30 = [v26 _attributedStringForStringArray:v29 useGrey:v38];

      BOOL v18 = v28;
      id v17 = v27;
      if (!v27) {
        goto LABEL_38;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v30 = 0;
        goto LABEL_45;
      }
      uint64_t v37 = v9;
      uint64_t v30 = [*(id *)(a1 + 32) _attributedStringForStringArray:v10 useGrey:v38];
      if (!v17) {
        goto LABEL_38;
      }
    }
    if (v30)
    {
      v47[0] = @"header";
      v47[1] = @"value";
      v48[0] = v17;
      v48[1] = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
      id v9 = v37;
LABEL_41:
      [*(id *)(a1 + 48) addObject:v31];

LABEL_45:
LABEL_48:

      goto LABEL_49;
    }
LABEL_38:
    id v9 = v37;
    if (!v18 || !v30) {
      goto LABEL_45;
    }
    v45[0] = @"headerIcon";
    v45[1] = @"value";
    v46[0] = v18;
    v46[1] = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
    goto LABEL_41;
  }
  id v6 = [*(id *)(a1 + 32) accountName];
  if (!v6)
  {
    id v7 = +[SSAccountStore defaultStore];
    id v8 = [v7 activeAccount];
    id v6 = [v8 accountName];
  }
  id v9 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v11 = [v3 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    id v19 = [v3 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    int v21 = [(id)objc_opt_class() _styleDictionaryWithName:v20 styles:*(void *)(a1 + 40)];
    if (v21)
    {
      uint64_t v22 = [(id)objc_opt_class() stringWithFormattedUsernameForString:v12 username:v6];

      uint64_t v23 = [(id)objc_opt_class() _attributedStringWithString:v22 styles:v21];
      uint64_t v24 = (void *)v23;
      if (v23)
      {
        v52 = @"value";
        v53[0] = v23;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
        [v10 addEntriesFromDictionary:v25];
      }
      id v12 = (id)v22;
    }
    else
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __33__SSPaymentSheet__parseResponse___block_invoke_5;
      v42[3] = &unk_1E5BAC630;
      v42[4] = *(void *)(a1 + 32);
      id v43 = v6;
      id v44 = v10;
      [v3 enumerateKeysAndObjectsUsingBlock:v42];
    }
    uint64_t v32 = *(void **)(a1 + 48);
    uint64_t v33 = (void *)[v10 copy];
    [v32 addObject:v33];

    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    id v15 = [v3 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v15;
    }
    else {
      id v10 = 0;
    }

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __33__SSPaymentSheet__parseResponse___block_invoke_6;
    v39[3] = &unk_1E5BAC658;
    v39[4] = *(void *)(a1 + 32);
    id v40 = v14;
    id v41 = *(id *)(a1 + 48);
    id v12 = v14;
    [v10 enumerateObjectsUsingBlock:v39];
    uint64_t v34 = *(void **)(a1 + 48);
    uint64_t v50 = @"value";
    uint64_t v35 = (void *)[v12 copy];
    uint64_t v51 = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    [v34 addObject:v36];

    goto LABEL_48;
  }
LABEL_49:
}

void __33__SSPaymentSheet__parseResponse___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() stringWithFormattedUsernameForString:v5 username:*(void *)(a1 + 40)];

  int v7 = [v10 isEqualToString:@"value"];
  id v8 = *(void **)(a1 + 48);
  if (v7)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
    [v8 setObject:v9 forKey:v10];
  }
  else
  {
    [v8 setObject:v6 forKey:v10];
  }
}

void __33__SSPaymentSheet__parseResponse___block_invoke_6(id *a1, void *a2, unint64_t a3)
{
  id v19 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v19;
  if (isKindOfClass)
  {
    id v7 = v19;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    id v9 = [v8 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    BOOL v11 = [v8 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    int v13 = objc_opt_class();
    id v14 = [a1[4] styles];
    id v15 = [v13 _styleDictionaryWithName:v12 styles:v14];

    uint64_t v16 = [(id)objc_opt_class() _attributedStringWithString:v10 styles:v15];
    [a1[5] appendAttributedString:v16];
    if ([a1[6] count] - 1 > a3)
    {
      id v17 = a1[5];
      BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\u2028"];
      [v17 appendAttributedString:v18];
    }
    id v6 = v19;
  }
}

- (id)_attributedListForFlexList:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__SSPaymentSheet__attributedListForFlexList___block_invoke;
  v14[3] = &unk_1E5BAC608;
  id v8 = v7;
  id v15 = v8;
  [v5 enumerateObjectsUsingBlock:v14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__SSPaymentSheet__attributedListForFlexList___block_invoke_2;
  v12[3] = &unk_1E5BAC5E0;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  [v8 enumerateObjectsUsingBlock:v12];
  if ([v9 count]) {
    id v10 = (void *)[v9 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

void __45__SSPaymentSheet__attributedListForFlexList___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v6;
  if (isKindOfClass)
  {
    id v5 = [v6 objectForKeyedSubscript:@"attributedList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObject:v5];
    }

    id v4 = v6;
  }
}

void __45__SSPaymentSheet__attributedListForFlexList___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__SSPaymentSheet__attributedListForFlexList___block_invoke_3;
    v5[3] = &unk_1E5BAC6A8;
    id v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __45__SSPaymentSheet__attributedListForFlexList___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 isEqualToString:@"value"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v6;
        if (v8)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v11 = MEMORY[0x1E4F143A8];
          uint64_t v12 = 3221225472;
          id v13 = __45__SSPaymentSheet__attributedListForFlexList___block_invoke_4;
          id v14 = &unk_1E5BAC5E0;
          uint64_t v15 = *(void *)(a1 + 32);
          id v10 = v9;
          id v16 = v10;
          [v8 enumerateObjectsUsingBlock:&v11];
          if (objc_msgSend(v10, "count", v11, v12, v13, v14, v15)) {
            [v7 setObject:v10 forKeyedSubscript:@"value"];
          }
        }
      }
    }
  }
  if ([v7 count]) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void __45__SSPaymentSheet__attributedListForFlexList___block_invoke_4(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = [v9 objectForKeyedSubscript:@"header"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
      [v3 setObject:v5 forKeyedSubscript:@"header"];
    }
    id v6 = [v9 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [*(id *)(a1 + 32) _attributedStringForAttributedDictionary:v6];
      if (!v7) {
        goto LABEL_12;
      }
    }
    else
    {
      id v8 = [v9 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [*(id *)(a1 + 32) _attributedStringForAttributedArray:v8];
      }
      else
      {
        id v7 = 0;
      }

      if (!v7) {
        goto LABEL_12;
      }
    }
    [v3 setObject:v7 forKeyedSubscript:@"value"];
LABEL_12:
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (int64_t)_payeeTypeForRequestorValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AppStore"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"iTunes"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"AppleMusic"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"iBooks"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"AppleNews"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_payeeTypeInferredFromEnumeratedTitle
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    *(_DWORD *)uint64_t v35 = 138412290;
    *(void *)&v35[4] = objc_opt_class();
    id v7 = *(id *)&v35[4];
    LODWORD(v34) = 12;
    uint64_t v33 = v35;
    id v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8) {
      goto LABEL_12;
    }
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v35, v34, *(_OWORD *)v35);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
  }

LABEL_12:
  if (self->_titleType != 1)
  {
    id v16 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v16)
    {
      id v16 = +[SSLogConfig sharedConfig];
    }
    int v17 = objc_msgSend(v16, "shouldLog", v33);
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    id v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v18 &= 2u;
    }
    if (!v18) {
      goto LABEL_26;
    }
    id v20 = objc_opt_class();
    *(_DWORD *)uint64_t v35 = 138412290;
    *(void *)&v35[4] = v20;
    id v21 = v20;
    LODWORD(v34) = 12;
    goto LABEL_24;
  }
  if ([(NSString *)self->_title isEqualToString:@"AppStore"]) {
    return 3;
  }
  if ([(NSString *)self->_title isEqualToString:@"iTunes"]) {
    return 5;
  }
  if ([(NSString *)self->_title isEqualToString:@"AppleMusic"]) {
    return 1;
  }
  if ([(NSString *)self->_title isEqualToString:@"iBooks"]) {
    return 4;
  }
  if (![(NSString *)self->_title isEqualToString:@"AppleNews"])
  {
    id v16 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v16)
    {
      id v16 = +[SSLogConfig sharedConfig];
    }
    int v29 = objc_msgSend(v16, "shouldLog", v33);
    if ([v16 shouldLogToDisk]) {
      int v30 = v29 | 2;
    }
    else {
      int v30 = v29;
    }
    id v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v30 &= 2u;
    }
    if (!v30) {
      goto LABEL_26;
    }
    uint64_t v31 = objc_opt_class();
    title = self->_title;
    *(_DWORD *)uint64_t v35 = 138412546;
    *(void *)&v35[4] = v31;
    *(_WORD *)&v35[12] = 2112;
    *(void *)&v35[14] = title;
    id v21 = v31;
    LODWORD(v34) = 22;
LABEL_24:
    uint64_t v22 = (void *)_os_log_send_and_compose_impl();

    if (!v22)
    {
LABEL_27:

      return 0;
    }
    id v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, v35, v34);
    free(v22);
    SSFileLog(v16, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v19);
LABEL_26:

    goto LABEL_27;
  }
  return 2;
}

- (id)_replaceBreakingSpaceMarkupForMutableAttributedString:(id)a3
{
  id v3 = a3;
  int v4 = [v3 string];
  int v5 = [v4 lowercaseString];

  uint64_t v6 = [v5 rangeOfString:@"[br/]"];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = v5;
      objc_msgSend(v3, "replaceCharactersInRange:withString:", v8, v7, @"\n");
      uint64_t v11 = [v3 string];
      int v5 = [v11 lowercaseString];

      uint64_t v12 = [v5 rangeOfString:@"[br/]"];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v8 = v12;
    }
    while (v9++ < 9);
  }

  return v3;
}

- (id)_replaceMarkupForMutableAttributedString:(id)a3 markupType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = @"[b]";
  uint64_t v8 = @"[/b]";
  if (a4)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  if (a4 == 1) {
    unint64_t v9 = @"[/i]";
  }
  else {
    unint64_t v9 = v8;
  }
  if (a4 == 1) {
    uint64_t v10 = @"[i]";
  }
  else {
    uint64_t v10 = v7;
  }
  uint64_t v11 = [v5 string];
  uint64_t v12 = [v11 lowercaseString];

  if ([v12 rangeOfString:v10] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = (void *)SSVCoreText();
    uint64_t v14 = (uint64_t (*)(__CFString *, void, double))SSVWeakLinkedSymbolForString("CTFontCreateWithName", v13);
    if (a4)
    {
      if (a4 != 1) {
        goto LABEL_23;
      }
      uint64_t v15 = @"Helvetica-Italic";
    }
    else
    {
      uint64_t v15 = @"Helvetica-Bold";
    }
    uint64_t v16 = v14(v15, 0, 14.0);
    if (v16)
    {
      CFTypeRef cf = (CFTypeRef)v16;
      uint64_t v17 = [v12 rangeOfString:v10];
      uint64_t v19 = v18;
      uint64_t v20 = [v12 rangeOfString:v9];
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v22 = v20;
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v23 = 0;
          do
          {
            uint64_t v24 = v9;
            uint64_t v25 = v12;
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v22, v21, &stru_1EF96DA90);
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v17, v19, &stru_1EF96DA90);
            uint64_t v26 = [v6 string];
            uint64_t v12 = [v26 lowercaseString];

            unint64_t v9 = v24;
            uint64_t v17 = [v12 rangeOfString:v10];
            uint64_t v19 = v27;
            uint64_t v28 = [v12 rangeOfString:v24];
            if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            uint64_t v22 = v28;
            if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
          }
          while (v23++ < 9);
        }
      }
      CFRelease(cf);
    }
  }
LABEL_23:

  return v6;
}

- (int64_t)_salableIconTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"app"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"merchant"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"messages"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"watch"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_salableInfoItemsToUppercase
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  salableInfo = self->_salableInfo;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__SSPaymentSheet__salableInfoItemsToUppercase__block_invoke;
  v8[3] = &unk_1E5BA9638;
  id v9 = v3;
  id v5 = v3;
  [(NSArray *)salableInfo enumerateObjectsUsingBlock:v8];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  uint64_t v7 = self->_salableInfo;
  self->_salableInfo = v6;
}

void __46__SSPaymentSheet__salableInfoItemsToUppercase__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 localizedUppercaseString];
  [v2 addObject:v3];
}

- (void)_stringValuesToUppercase
{
  id v3 = [(NSString *)self->_accountHeader localizedUppercaseString];
  accountHeader = self->_accountHeader;
  self->_accountHeader = v3;

  id v5 = [(NSString *)self->_displayPrice localizedUppercaseString];
  displayPrice = self->_displayPrice;
  self->_displayPrice = v5;

  uint64_t v7 = [(NSString *)self->_paymentSummary localizedUppercaseString];
  paymentSummary = self->_paymentSummary;
  self->_paymentSummary = v7;

  id v9 = [(NSString *)self->_ratingHeader localizedUppercaseString];
  ratingHeader = self->_ratingHeader;
  self->_ratingHeader = v9;

  uint64_t v11 = [(NSString *)self->_ratingValue localizedUppercaseString];
  ratingValue = self->_ratingValue;
  self->_ratingValue = v11;

  uint64_t v13 = [(NSString *)self->_storeName localizedUppercaseString];
  storeName = self->_storeName;
  self->_storeName = v13;
}

- (void)_unlock
{
}

+ (id)_attributedStringWithString:(id)a3 styles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!_attributedStringWithString_styles__kPKPaymentContentItemLightColorAttribute)
  {
    uint64_t v7 = (void *)SSVPassKitFramework();
    uint64_t v8 = SSVWeakLinkedStringConstantForString("PKPaymentContentItemLightColorAttribute", v7);
    id v9 = (void *)_attributedStringWithString_styles__kPKPaymentContentItemLightColorAttribute;
    _attributedStringWithString_styles__kPKPaymentContentItemLightColorAttribute = v8;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5];
  uint64_t v11 = [v6 objectForKeyedSubscript:@"color"];
  if ([v11 isEqualToString:@"gray"])
  {
  }
  else
  {
    uint64_t v12 = [v6 objectForKeyedSubscript:@"color"];
    int v13 = [v12 isEqualToString:@"grey"];

    if (!v13) {
      goto LABEL_7;
    }
  }
  uint64_t v14 = _attributedStringWithString_styles__kPKPaymentContentItemLightColorAttribute;
  uint64_t v15 = [v5 length];
  objc_msgSend(v10, "addAttribute:value:range:", v14, MEMORY[0x1E4F1CC38], 0, v15);
LABEL_7:
  if (!_attributedStringWithString_styles__kPKPaymentContentItemBoldAttribute)
  {
    uint64_t v16 = (void *)SSVPassKitFramework();
    uint64_t v17 = SSVWeakLinkedStringConstantForString("PKPaymentContentItemBoldAttribute", v16);
    uint64_t v18 = (void *)_attributedStringWithString_styles__kPKPaymentContentItemBoldAttribute;
    _attributedStringWithString_styles__kPKPaymentContentItemBoldAttribute = v17;
  }
  uint64_t v19 = [v6 objectForKeyedSubscript:@"bold"];
  if (([v19 isEqualToString:@"true"] & 1) != 0 || objc_msgSend(v19, "BOOLValue"))
  {
    uint64_t v20 = _attributedStringWithString_styles__kPKPaymentContentItemBoldAttribute;
    uint64_t v21 = [v5 length];
    objc_msgSend(v10, "addAttribute:value:range:", v20, MEMORY[0x1E4F1CC38], 0, v21);
  }
  uint64_t v22 = [v6 objectForKeyedSubscript:@"size"];
  int v23 = [v22 isEqualToString:@"large"];

  if (v23) {
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4F4DB38], @"large", 0, objc_msgSend(v5, "length"));
  }
  uint64_t v24 = [v6 objectForKeyedSubscript:@"spacingAfter"];
  uint64_t v25 = v24;
  if (v24)
  {
    if ([v24 isEqualToString:@"large"])
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F4DB48];
    }
    else if ([v25 isEqualToString:@"small"])
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F4DB58];
    }
    else
    {
      if (![v25 isEqualToString:@"medium"]) {
        goto LABEL_22;
      }
      uint64_t v26 = (void *)MEMORY[0x1E4F4DB50];
    }
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4F4DB40], *v26, 0, objc_msgSend(v5, "length"));
  }
LABEL_22:
  uint64_t v27 = [v6 objectForKeyedSubscript:@"spacingBefore"];
  uint64_t v28 = v27;
  if (!v27) {
    goto LABEL_30;
  }
  if ([v27 isEqualToString:@"large"])
  {
    int v29 = (void *)MEMORY[0x1E4F4DB48];
  }
  else if ([v28 isEqualToString:@"small"])
  {
    int v29 = (void *)MEMORY[0x1E4F4DB58];
  }
  else
  {
    if (![v28 isEqualToString:@"medium"]) {
      goto LABEL_30;
    }
    int v29 = (void *)MEMORY[0x1E4F4DB50];
  }
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4F4DB60], *v29, 0, objc_msgSend(v5, "length"));
LABEL_30:
  int v30 = (void *)[v10 copy];

  return v30;
}

+ (id)_styleDictionaryWithName:(id)a3 styles:(id)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__SSPaymentSheet__styleDictionaryWithName_styles___block_invoke;
  v10[3] = &unk_1E5BAC6D0;
  id v11 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(a4, "ams_mapWithTransformIgnoresNil:", v10);
  uint64_t v8 = [v7 firstObject];

  return v8;
}

id __50__SSPaymentSheet__styleDictionaryWithName_styles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [v3 objectForKeyedSubscript:@"name"];
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isApplePayClassic
{
  return self->_applePayClassic;
}

- (void)setApplePayClassic:(BOOL)a3
{
  self->_applePayClassic = a3;
}

- (NSString)dialogId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDialogId:(id)a3
{
}

- (BOOL)shouldShowCardPicker
{
  return self->_shouldShowCardPicker;
}

- (void)setShouldShowCardPicker:(BOOL)a3
{
  self->_shouldShowCardPicker = a3;
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAccountName:(id)a3
{
}

- (NSArray)attributedList
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (int64_t)confirmationTitleType
{
  return self->_confirmationTitleType;
}

- (void)setConfirmationTitleType:(int64_t)a3
{
  self->_confirmationTitleType = a3;
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)currencyCode
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSNumber)designVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDesignVersion:(id)a3
{
}

- (NSArray)flexList
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (NSArray)inlineImages
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (NSDictionary)merchantSession
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMerchantSession:(id)a3
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMessage:(id)a3
{
}

- (int64_t)payeeType
{
  return self->_payeeType;
}

- (void)setPayeeType:(int64_t)a3
{
  self->_payeeType = a3;
}

- (NSNumber)price
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPrice:(id)a3
{
}

- (NSArray)priceSectionItems
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPriceSectionItems:(id)a3
{
}

- (int64_t)salableIconType
{
  return self->_salableIconType;
}

- (void)setSalableIconType:(int64_t)a3
{
  self->_salableIconType = a3;
}

- (BOOL)shouldSuppressPrice
{
  return self->_shouldSuppressPrice;
}

- (void)setShouldSuppressPrice:(BOOL)a3
{
  self->_shouldSuppressPrice = a3;
}

- (BOOL)shouldUppercaseText
{
  return self->_shouldUppercaseText;
}

- (void)setShouldUppercaseText:(BOOL)a3
{
  self->_shouldUppercaseText = a3;
}

- (NSArray)styles
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setStyles:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTitle:(id)a3
{
}

- (int64_t)titleType
{
  return self->_titleType;
}

- (void)setTitleType:(int64_t)a3
{
  self->_titleType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_priceSectionItems, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_inlineImages, 0);
  objc_storeStrong((id *)&self->_flexList, 0);
  objc_storeStrong((id *)&self->_designVersion, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_attributedList, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_salableInfoLabel, 0);
  objc_storeStrong((id *)&self->_salableInfo, 0);
  objc_storeStrong((id *)&self->_salableIconURLString, 0);
  objc_storeStrong((id *)&self->_salableIconURL, 0);
  objc_storeStrong((id *)&self->_ratingValue, 0);
  objc_storeStrong((id *)&self->_ratingHeader, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentSummary, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_displayPriceLabel, 0);
  objc_storeStrong((id *)&self->_displayPrice, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_accountHeader, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end