@interface NPKRemotePassActionEnterValueResponse
- (NPKProtoRemotePassActionEnterValueResponse)protoResponse;
- (NPKRemotePassActionEnterValueResponse)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 result:(int)a6 incrementAmount:(int64_t)a7 currencyCode:(id)a8 image:(id)a9 passLocalizedDesciption:(id)a10 caption:(id)a11 summaryText:(id)a12 message:(id)a13;
- (NPKRemotePassActionEnterValueResponse)initWithTopUpAmount:(id)a3 fromRequest:(id)a4 withResult:(int)a5;
- (id)currencyAmount;
- (id)description;
- (id)identifier;
- (int)result;
- (void)setProtoResponse:(id)a3;
@end

@implementation NPKRemotePassActionEnterValueResponse

- (NPKRemotePassActionEnterValueResponse)initWithTopUpAmount:(id)a3 fromRequest:(id)a4 withResult:(int)a5
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 minimalFormattedStringValue];
  v26 = [v6 passLocalizedDescription];
  v9 = NSString;
  v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v11 = [v10 localizedStringForKey:@"RESPONSE_REMOTE_PAYMENT_PASS_ACTION_RELOAD_CAPTION" value:&stru_26CFEBA18 table:@"NanoPassKit-RemotePaymentPassAction"];
  v28 = (void *)v8;
  v27 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);

  v12 = NSString;
  v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v14 = [v13 localizedStringForKey:@"RESPONSE_REMOTE_PAYMENT_PASS_ACTION_RELOAD_SUMMARY_TEXT" value:&stru_26CFEBA18 table:@"NanoPassKit-RemotePaymentPassAction"];
  v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v8, v26);

  v16 = [v6 identifier];
  uint64_t v25 = [v6 cardType];
  v17 = [v6 passOrganizationName];
  v18 = [v7 amount];
  uint64_t v19 = PKCurrencyDecimalToStorageInteger();
  v20 = [v7 currency];

  v21 = [v6 image];
  v22 = [v6 underlyingMessage];

  v23 = [(NPKRemotePassActionEnterValueResponse *)self initWithIdentifier:v16 cardType:v25 passOrganizationName:v17 result:a5 incrementAmount:v19 currencyCode:v20 image:v21 passLocalizedDesciption:v26 caption:v27 summaryText:v15 message:v22];
  return v23;
}

- (NPKRemotePassActionEnterValueResponse)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 result:(int)a6 incrementAmount:(int64_t)a7 currencyCode:(id)a8 image:(id)a9 passLocalizedDesciption:(id)a10 caption:(id)a11 summaryText:(id)a12 message:(id)a13
{
  id v16 = a13;
  id v17 = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a5;
  id v23 = a3;
  v24 = objc_alloc_init(NPKProtoRemotePassActionEnvelope);
  [(NPKProtoRemotePassActionEnvelope *)v24 setVersion:2];
  [(NPKProtoRemotePassActionEnvelope *)v24 setIsResponse:1];
  [(NPKProtoRemotePassActionEnvelope *)v24 setMessageType:1];
  [(NPKProtoRemotePassActionEnvelope *)v24 setPassLocalizedDescription:v19];

  [(NPKProtoRemotePassActionEnvelope *)v24 setCaption:v18];
  [(NPKProtoRemotePassActionEnvelope *)v24 setSummaryText:v17];

  [(NPKProtoRemotePassActionEnvelope *)v24 setPassOrganizationName:v22];
  [(NPKProtoRemotePassActionEnvelope *)v24 setCardType:NPKProtoRemotePassActionCardTypeForNPKRemotePassActionCardType(a4)];
  uint64_t v25 = objc_alloc_init(NPKProtoRemotePassActionEnterValueResponse);
  [(NPKProtoRemotePassActionEnterValueResponse *)v25 setResult:NPKProtoRemotePassActionResultForNPKProtoRemotePassActionResponseResult(a6)];
  [(NPKProtoRemotePassActionEnterValueResponse *)v25 setRequestUniqueID:v23];

  [(NPKProtoRemotePassActionEnterValueResponse *)v25 setIncrementAmount:a7];
  [(NPKProtoRemotePassActionEnterValueResponse *)v25 setIncrementCurrency:v21];

  v26 = [(NPKProtoRemotePassActionEnterValueResponse *)v25 data];
  [(NPKProtoRemotePassActionEnvelope *)v24 setMessageProtoData:v26];
  v33.receiver = self;
  v33.super_class = (Class)NPKRemotePassActionEnterValueResponse;
  v27 = [(NPKRemotePassAction *)&v33 initWithMessage:v16 protoEnvelope:v24 image:v20];

  return v27;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionEnterValueResponse;
  v3 = [(NPKRemotePassActionResponse *)&v7 description];
  v4 = [(NPKRemotePassActionEnterValueResponse *)self currencyAmount];
  v5 = [v3 stringByAppendingFormat:@" (currencyAmount:%@)", v4];

  return v5;
}

- (id)identifier
{
  v2 = [(NPKRemotePassActionEnterValueResponse *)self protoResponse];
  v3 = [v2 requestUniqueID];

  return v3;
}

- (int)result
{
  v2 = [(NPKRemotePassActionEnterValueResponse *)self protoResponse];
  int v3 = NPKRemotePassActionResponseResultForNPKProtoRemotePassActionResult([v2 result]);

  return v3;
}

- (NPKProtoRemotePassActionEnterValueResponse)protoResponse
{
  protoResponse = self->_protoResponse;
  if (!protoResponse)
  {
    v4 = [(NPKRemotePassAction *)self protoEnvelope];
    v5 = [v4 messageProtoData];

    id v6 = [[NPKProtoRemotePassActionEnterValueResponse alloc] initWithData:v5];
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
    v5 = [(NPKRemotePassActionEnterValueResponse *)self protoResponse];
    [v5 incrementAmount];
    id v6 = PKCurrencyStorageIntegerToCurrencyDecimal();

    objc_super v7 = [(NPKRemotePassActionEnterValueResponse *)self protoResponse];
    uint64_t v8 = [v7 incrementCurrency];

    v9 = (PKCurrencyAmount *)[objc_alloc(MEMORY[0x263F5BE30]) initWithAmount:v6 currency:v8 exponent:1];
    v10 = self->_cachedCurrencyAmount;
    self->_cachedCurrencyAmount = v9;

    int v3 = self->_cachedCurrencyAmount;
  }
  return v3;
}

- (void)setProtoResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_cachedCurrencyAmount, 0);
}

@end