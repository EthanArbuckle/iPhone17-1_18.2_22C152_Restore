@interface NPKRemotePassActionEnterValueRequest
- (NPKBalanceField)balanceField;
- (NPKProtoRemotePassActionEnterValueRequest)protoRequest;
- (NPKRemotePassActionEnterValueRequest)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 balanceField:(id)a6 image:(id)a7 passLocalizedDesciption:(id)a8 caption:(id)a9 summaryText:(id)a10;
- (NPKRemotePassActionEnterValueRequest)initWithPass:(id)a3 image:(id)a4 balanceField:(id)a5;
- (id)action;
- (id)description;
- (id)identifier;
- (void)setProtoRequest:(id)a3;
@end

@implementation NPKRemotePassActionEnterValueRequest

- (NPKRemotePassActionEnterValueRequest)initWithPass:(id)a3 image:(id)a4 balanceField:(id)a5
{
  v7 = NSString;
  id v8 = a5;
  id v30 = a4;
  id v9 = a3;
  v10 = [v9 uniqueID];
  v11 = [v8 action];
  [v11 type];
  v12 = PKPaymentPassActionTypeToString();
  v13 = [v8 action];
  v14 = [v13 identifier];
  v29 = [v7 stringWithFormat:@"%@:%@:%@", v10, v12, v14];

  v15 = NSString;
  v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v17 = [v16 localizedStringForKey:@"REQUEST_REMOTE_PAYMENT_PASS_ACTION_RELOAD_CAPTION" value:&stru_26CFEBA18 table:@"NanoPassKit-RemotePaymentPassAction"];
  v18 = [v9 localizedDescription];
  v19 = objc_msgSend(v15, "stringWithFormat:", v17, v18);

  v20 = [v9 localizedDescription];
  v21 = NSString;
  v22 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v23 = [v22 localizedStringForKey:@"REQUEST_REMOTE_PAYMENT_PASS_ACTION_RELOAD_SUMMARY_TEXT" value:&stru_26CFEBA18 table:@"NanoPassKit-RemotePaymentPassAction"];
  v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v20);

  uint64_t v25 = NPKRemotePassActionCardTypeForPass(v9);
  v26 = [v9 organizationName];

  v27 = [(NPKRemotePassActionEnterValueRequest *)self initWithIdentifier:v29 cardType:v25 passOrganizationName:v26 balanceField:v8 image:v30 passLocalizedDesciption:v20 caption:v19 summaryText:v24];
  return v27;
}

- (NPKRemotePassActionEnterValueRequest)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 balanceField:(id)a6 image:(id)a7 passLocalizedDesciption:(id)a8 caption:(id)a9 summaryText:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v38 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  v22 = objc_alloc_init(NPKProtoRemotePassActionEnvelope);
  [(NPKProtoRemotePassActionEnvelope *)v22 setVersion:2];
  [(NPKProtoRemotePassActionEnvelope *)v22 setIsResponse:0];
  [(NPKProtoRemotePassActionEnvelope *)v22 setMessageType:1];
  [(NPKProtoRemotePassActionEnvelope *)v22 setPassLocalizedDescription:v18];

  [(NPKProtoRemotePassActionEnvelope *)v22 setCaption:v17];
  [(NPKProtoRemotePassActionEnvelope *)v22 setSummaryText:v16];

  [(NPKProtoRemotePassActionEnvelope *)v22 setPassOrganizationName:v20];
  [(NPKProtoRemotePassActionEnvelope *)v22 setCardType:NPKProtoRemotePassActionCardTypeForNPKRemotePassActionCardType(a4)];
  v23 = objc_alloc_init(NPKProtoRemotePassActionEnterValueRequest);
  v24 = [v19 action];
  uint64_t v25 = NPKSecureArchiveObject(v24);
  [(NPKProtoRemotePassActionEnterValueRequest *)v23 setPaymentPassActionData:v25];

  v26 = [v19 balance];
  v27 = [v26 identifiers];
  v28 = [v27 anyObject];
  [(NPKProtoRemotePassActionEnterValueRequest *)v23 setBalanceIdentifier:v28];

  v29 = [v19 label];
  [(NPKProtoRemotePassActionEnterValueRequest *)v23 setBalanceLabel:v29];

  id v30 = [v19 balance];
  v31 = [v30 currencyCode];
  [(NPKProtoRemotePassActionEnterValueRequest *)v23 setCurrentBalanceCurrency:v31];

  v32 = [v19 balance];

  v33 = [v32 currencyValue];
  v34 = [v33 amount];
  [(NPKProtoRemotePassActionEnterValueRequest *)v23 setCurrentBalanceAmount:PKCurrencyDecimalToStorageInteger()];

  [(NPKProtoRemotePassActionEnterValueRequest *)v23 setRequestUniqueID:v21];
  v35 = [(NPKProtoRemotePassActionEnterValueRequest *)v23 data];
  [(NPKProtoRemotePassActionEnvelope *)v22 setMessageProtoData:v35];
  v40.receiver = self;
  v40.super_class = (Class)NPKRemotePassActionEnterValueRequest;
  v36 = [(NPKRemotePassAction *)&v40 initWithProtoEnvelope:v22 image:v38];

  return v36;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionEnterValueRequest;
  v3 = [(NPKRemotePassActionRequest *)&v7 description];
  v4 = [(NPKRemotePassActionEnterValueRequest *)self balanceField];
  v5 = [v3 stringByAppendingFormat:@" (balanceField:%@)", v4];

  return v5;
}

- (id)identifier
{
  v2 = [(NPKRemotePassActionEnterValueRequest *)self protoRequest];
  v3 = [v2 requestUniqueID];

  return v3;
}

- (id)action
{
  v2 = [(NPKRemotePassActionEnterValueRequest *)self balanceField];
  v3 = [v2 action];

  return v3;
}

- (NPKProtoRemotePassActionEnterValueRequest)protoRequest
{
  protoRequest = self->_protoRequest;
  if (!protoRequest)
  {
    v4 = [NPKProtoRemotePassActionEnterValueRequest alloc];
    v5 = [(NPKRemotePassAction *)self protoEnvelope];
    v6 = [v5 messageProtoData];
    objc_super v7 = [(NPKProtoRemotePassActionEnterValueRequest *)v4 initWithData:v6];
    id v8 = self->_protoRequest;
    self->_protoRequest = v7;

    protoRequest = self->_protoRequest;
  }
  return protoRequest;
}

- (NPKBalanceField)balanceField
{
  cachedBalanceField = self->_cachedBalanceField;
  if (!cachedBalanceField)
  {
    id v4 = [(NPKRemotePassActionEnterValueRequest *)self protoRequest];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 paymentPassActionData];
      if (v6)
      {
        objc_super v7 = objc_opt_class();
        uint64_t v8 = NPKSecureUnarchiveObject(v6, v7);
        if (v8)
        {
          id v9 = v8;
          [v5 currentBalanceAmount];
          v10 = PKCurrencyStorageIntegerToCurrencyDecimal();
          v11 = [v5 currentBalanceCurrency];
          id v30 = PKCurrencyAmountMake();

          id v12 = objc_alloc(MEMORY[0x263F5BFB8]);
          v13 = [v5 balanceIdentifier];
          v14 = (void *)[v12 initWithIdentifier:v13 forCurrencyAmount:v30];

          v15 = [NPKBalanceField alloc];
          id v16 = [v5 balanceLabel];
          id v17 = [v14 formattedValue];
          id v18 = [v5 balanceIdentifier];
          id v19 = [(NPKBalanceField *)v15 initWithBalance:v14 label:v16 formattedValue:v17 identifier:v18 primaryBalance:1 action:v9 pendingUpdateExpireDate:0];

LABEL_19:
LABEL_22:

          goto LABEL_23;
        }
        v24 = pk_RemotePassAction_log();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

        if (v25)
        {
          v26 = pk_RemotePassAction_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v31 = 0;
            _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_ERROR, "Error: Missing Action", v31, 2u);
          }
        }
        id v9 = 0;
LABEL_18:
        id v19 = 0;
        goto LABEL_19;
      }
      v22 = pk_RemotePassAction_log();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        id v9 = pk_RemotePassAction_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Missing action data", v32, 2u);
        }
        goto LABEL_18;
      }
      v6 = 0;
    }
    else
    {
      id v20 = pk_RemotePassAction_log();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
        id v19 = 0;
LABEL_23:

        v27 = self->_cachedBalanceField;
        self->_cachedBalanceField = v19;

        cachedBalanceField = self->_cachedBalanceField;
        goto LABEL_24;
      }
      v6 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Missing proto request", buf, 2u);
      }
    }
    id v19 = 0;
    goto LABEL_22;
  }
LABEL_24:
  v28 = cachedBalanceField;
  return v28;
}

- (void)setProtoRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoRequest, 0);
  objc_storeStrong((id *)&self->_cachedBalanceField, 0);
}

@end