@interface NPKRemotePassActionSelectItemResponse
- (NPKProtoRemotePassActionSelectItemResponse)protoResponse;
- (NPKRemotePassActionSelectItemResponse)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 result:(int)a6 incrementAmount:(int64_t)a7 currencyCode:(id)a8 serviceProviderDataData:(id)a9 image:(id)a10 passLocalizedDesciption:(id)a11 caption:(id)a12 summaryText:(id)a13 message:(id)a14;
- (NPKRemotePassActionSelectItemResponse)initWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 fromRequest:(id)a5 withResult:(int)a6;
- (id)currencyAmount;
- (id)description;
- (id)identifier;
- (id)serviceProviderData;
- (int)result;
- (void)setProtoResponse:(id)a3;
@end

@implementation NPKRemotePassActionSelectItemResponse

- (NPKRemotePassActionSelectItemResponse)initWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 fromRequest:(id)a5 withResult:(int)a6
{
  id v8 = a5;
  id v32 = a4;
  id v9 = a3;
  v10 = [v8 commutePlanField];
  uint64_t v11 = [v10 detailLabel];

  v29 = [v8 passLocalizedDescription];
  v12 = NSString;
  v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v14 = [v13 localizedStringForKey:@"RESPONSE_REMOTE_PAYMENT_PASS_ACTION_RENEW_CAPTION" value:&stru_26CFEBA18 table:@"NanoPassKit-RemotePaymentPassAction"];
  v31 = (void *)v11;
  v30 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v11);

  v15 = NSString;
  v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v17 = [v16 localizedStringForKey:@"RESPONSE_REMOTE_PAYMENT_PASS_ACTION_RENEW_SUMMARY_TEXT" value:&stru_26CFEBA18 table:@"NanoPassKit-RemotePaymentPassAction"];
  v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v11, v29);

  v19 = [v8 identifier];
  uint64_t v20 = [v8 cardType];
  v28 = [v8 passOrganizationName];
  v21 = [v9 amount];
  uint64_t v27 = PKCurrencyDecimalToStorageInteger();
  v22 = [v9 currency];

  v23 = NPKSecureArchiveObject(v32);

  v24 = [v8 image];
  v25 = [v8 underlyingMessage];

  v35 = [(NPKRemotePassActionSelectItemResponse *)self initWithIdentifier:v19 cardType:v20 passOrganizationName:v28 result:a6 incrementAmount:v27 currencyCode:v22 serviceProviderDataData:v23 image:v24 passLocalizedDesciption:v29 caption:v30 summaryText:v18 message:v25];
  return v35;
}

- (NPKRemotePassActionSelectItemResponse)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 result:(int)a6 incrementAmount:(int64_t)a7 currencyCode:(id)a8 serviceProviderDataData:(id)a9 image:(id)a10 passLocalizedDesciption:(id)a11 caption:(id)a12 summaryText:(id)a13 message:(id)a14
{
  id v33 = a14;
  id v17 = a13;
  id v18 = a12;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a5;
  id v24 = a3;
  v25 = objc_alloc_init(NPKProtoRemotePassActionEnvelope);
  [(NPKProtoRemotePassActionEnvelope *)v25 setVersion:2];
  [(NPKProtoRemotePassActionEnvelope *)v25 setIsResponse:1];
  [(NPKProtoRemotePassActionEnvelope *)v25 setMessageType:2];
  [(NPKProtoRemotePassActionEnvelope *)v25 setPassLocalizedDescription:v19];

  [(NPKProtoRemotePassActionEnvelope *)v25 setCaption:v18];
  [(NPKProtoRemotePassActionEnvelope *)v25 setSummaryText:v17];

  [(NPKProtoRemotePassActionEnvelope *)v25 setPassOrganizationName:v23];
  [(NPKProtoRemotePassActionEnvelope *)v25 setCardType:NPKProtoRemotePassActionCardTypeForNPKRemotePassActionCardType(a4)];
  v26 = objc_alloc_init(NPKProtoRemotePassActionSelectItemResponse);
  [(NPKProtoRemotePassActionSelectItemResponse *)v26 setResult:NPKProtoRemotePassActionResultForNPKProtoRemotePassActionResponseResult(a6)];
  [(NPKProtoRemotePassActionSelectItemResponse *)v26 setRequestUniqueID:v24];

  [(NPKProtoRemotePassActionSelectItemResponse *)v26 setIncrementAmount:a7];
  [(NPKProtoRemotePassActionSelectItemResponse *)v26 setIncrementCurrency:v22];

  [(NPKProtoRemotePassActionSelectItemResponse *)v26 setServiceProviderDataData:v21];
  uint64_t v27 = [(NPKProtoRemotePassActionSelectItemResponse *)v26 data];
  [(NPKProtoRemotePassActionEnvelope *)v25 setMessageProtoData:v27];
  v35.receiver = self;
  v35.super_class = (Class)NPKRemotePassActionSelectItemResponse;
  v28 = [(NPKRemotePassAction *)&v35 initWithMessage:v33 protoEnvelope:v25 image:v20];

  return v28;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionSelectItemResponse;
  v3 = [(NPKRemotePassActionResponse *)&v7 description];
  v4 = [(NPKRemotePassActionSelectItemResponse *)self serviceProviderData];
  v5 = [v3 stringByAppendingFormat:@" (serviceProviderData:%@)", v4];

  return v5;
}

- (id)identifier
{
  v2 = [(NPKRemotePassActionSelectItemResponse *)self protoResponse];
  v3 = [v2 requestUniqueID];

  return v3;
}

- (int)result
{
  v2 = [(NPKRemotePassActionSelectItemResponse *)self protoResponse];
  int v3 = NPKRemotePassActionResponseResultForNPKProtoRemotePassActionResult([v2 result]);

  return v3;
}

- (NPKProtoRemotePassActionSelectItemResponse)protoResponse
{
  protoResponse = self->_protoResponse;
  if (!protoResponse)
  {
    v4 = [(NPKRemotePassAction *)self protoEnvelope];
    v5 = [v4 messageProtoData];

    v6 = [[NPKProtoRemotePassActionSelectItemResponse alloc] initWithData:v5];
    objc_super v7 = self->_protoResponse;
    self->_protoResponse = v6;

    protoResponse = self->_protoResponse;
  }
  return protoResponse;
}

- (id)currencyAmount
{
  cachedCurrencyAmount = self->_cachedCurrencyAmount;
  if (cachedCurrencyAmount)
  {
    int v3 = cachedCurrencyAmount;
  }
  else
  {
    v5 = [(NPKRemotePassActionSelectItemResponse *)self protoResponse];
    [v5 incrementAmount];
    v6 = PKCurrencyStorageIntegerToCurrencyDecimal();

    objc_super v7 = [(NPKRemotePassActionSelectItemResponse *)self protoResponse];
    id v8 = [v7 incrementCurrency];

    id v9 = (PKCurrencyAmount *)[objc_alloc(MEMORY[0x263F5BE30]) initWithAmount:v6 currency:v8 exponent:1];
    v10 = self->_cachedCurrencyAmount;
    self->_cachedCurrencyAmount = v9;

    int v3 = self->_cachedCurrencyAmount;
  }
  return v3;
}

- (id)serviceProviderData
{
  cachedServiceProviderData = self->_cachedServiceProviderData;
  if (cachedServiceProviderData)
  {
    int v3 = cachedServiceProviderData;
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [(NPKRemotePassActionSelectItemResponse *)self protoResponse];
    v12 = [v11 serviceProviderDataData];
    NPKSecureUnarchiveObjectOfClasses(v12, v10);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = self->_cachedServiceProviderData;
    self->_cachedServiceProviderData = v13;

    int v3 = self->_cachedServiceProviderData;
  }
  return v3;
}

- (void)setProtoResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_cachedServiceProviderData, 0);
  objc_storeStrong((id *)&self->_cachedCurrencyAmount, 0);
}

@end