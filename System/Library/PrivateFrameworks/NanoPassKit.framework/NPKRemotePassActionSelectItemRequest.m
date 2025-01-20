@interface NPKRemotePassActionSelectItemRequest
- (NPKCommutePlanField)commutePlanField;
- (NPKProtoRemotePassActionSelectItemRequest)protoRequest;
- (NPKRemotePassActionSelectItemRequest)initWithIdentifier:(id)a3 deviceIdentifier:(id)a4 cardType:(unint64_t)a5 passOrganizationName:(id)a6 passTypeIdentifier:(id)a7 passSerialNumber:(id)a8 commutePlanField:(id)a9 image:(id)a10 passLocalizedDesciption:(id)a11 caption:(id)a12 summaryText:(id)a13;
- (NPKRemotePassActionSelectItemRequest)initWithPass:(id)a3 image:(id)a4 commutePlanField:(id)a5;
- (NSString)deviceIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (id)action;
- (id)actionText;
- (id)description;
- (id)identifier;
- (void)setProtoRequest:(id)a3;
@end

@implementation NPKRemotePassActionSelectItemRequest

- (NPKRemotePassActionSelectItemRequest)initWithPass:(id)a3 image:(id)a4 commutePlanField:(id)a5
{
  id v7 = a3;
  id v51 = a4;
  id v8 = a5;
  v9 = NSString;
  v10 = [v7 uniqueID];
  v11 = [v8 action];
  [v11 type];
  v12 = PKPaymentPassActionTypeToString();
  v13 = [v8 action];
  v14 = [v13 identifier];
  uint64_t v50 = [v9 stringWithFormat:@"%@:%@:%@", v10, v12, v14];

  v15 = NSString;
  v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v17 = [v16 localizedStringForKey:@"REQUEST_REMOTE_PAYMENT_PASS_ACTION_RENEW_CAPTION" value:&stru_26CFEBA18 table:@"NanoPassKit-RemotePaymentPassAction"];
  v18 = [v7 localizedDescription];
  uint64_t v48 = objc_msgSend(v15, "stringWithFormat:", v17, v18);

  uint64_t v19 = [v7 localizedDescription];
  v20 = NSString;
  v21 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v22 = (void *)v19;
  v23 = [v21 localizedStringForKey:@"REQUEST_REMOTE_PAYMENT_PASS_ACTION_RENEW_SUMMARY_TEXT" value:&stru_26CFEBA18 table:@"NanoPassKit-RemotePaymentPassAction"];
  uint64_t v24 = objc_msgSend(v20, "localizedStringWithFormat:", v23, v22);

  v25 = [v8 action];
  v26 = [v25 remoteContentConfiguration];

  if (v26)
  {
    v46 = [MEMORY[0x263F5C128] sharedService];
    v45 = [v46 context];
    uint64_t v27 = [v45 deviceID];
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t v47 = NPKRemotePassActionCardTypeForPass(v7);
  v28 = [v7 organizationName];
  if (v26)
  {
    [v7 passTypeIdentifier];
    uint64_t v29 = v27;
    v44 = (void *)v27;
    v30 = v7;
    v32 = v31 = v22;
    [v30 serialNumber];
    v34 = id v33 = v8;
    uint64_t v41 = v24;
    v43 = (void *)v24;
    v35 = (void *)v48;
    v36 = v51;
    v37 = (void *)v50;
    v38 = [(NPKRemotePassActionSelectItemRequest *)self initWithIdentifier:v50 deviceIdentifier:v29 cardType:v47 passOrganizationName:v28 passTypeIdentifier:v32 passSerialNumber:v34 commutePlanField:v33 image:v51 passLocalizedDesciption:v31 caption:v48 summaryText:v41];

    id v8 = v33;
    v39 = v43;

    v22 = v31;
    id v7 = v30;

    v28 = v46;
  }
  else
  {
    uint64_t v42 = v24;
    v39 = (void *)v24;
    v35 = (void *)v48;
    v36 = v51;
    v37 = (void *)v50;
    v38 = [(NPKRemotePassActionSelectItemRequest *)self initWithIdentifier:v50 deviceIdentifier:v27 cardType:v47 passOrganizationName:v28 passTypeIdentifier:0 passSerialNumber:0 commutePlanField:v8 image:v51 passLocalizedDesciption:v22 caption:v48 summaryText:v42];
  }

  return v38;
}

- (NPKRemotePassActionSelectItemRequest)initWithIdentifier:(id)a3 deviceIdentifier:(id)a4 cardType:(unint64_t)a5 passOrganizationName:(id)a6 passTypeIdentifier:(id)a7 passSerialNumber:(id)a8 commutePlanField:(id)a9 image:(id)a10 passLocalizedDesciption:(id)a11 caption:(id)a12 summaryText:(id)a13
{
  id v17 = a13;
  id v18 = a12;
  id v19 = a11;
  id v44 = a10;
  id v20 = a9;
  id v43 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a4;
  id v24 = a3;
  v25 = objc_alloc_init(NPKProtoRemotePassActionEnvelope);
  [(NPKProtoRemotePassActionEnvelope *)v25 setVersion:2];
  [(NPKProtoRemotePassActionEnvelope *)v25 setIsResponse:0];
  [(NPKProtoRemotePassActionEnvelope *)v25 setMessageType:2];
  [(NPKProtoRemotePassActionEnvelope *)v25 setPassLocalizedDescription:v19];

  [(NPKProtoRemotePassActionEnvelope *)v25 setCaption:v18];
  [(NPKProtoRemotePassActionEnvelope *)v25 setSummaryText:v17];

  [(NPKProtoRemotePassActionEnvelope *)v25 setPassOrganizationName:v22];
  [(NPKProtoRemotePassActionEnvelope *)v25 setCardType:NPKProtoRemotePassActionCardTypeForNPKRemotePassActionCardType(a5)];
  v26 = objc_alloc_init(NPKProtoRemotePassActionSelectItemRequest);
  uint64_t v27 = [v20 action];
  v28 = NPKSecureArchiveObject(v27);
  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setPaymentPassActionData:v28];

  uint64_t v29 = [v20 identifier];
  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setPlanIdentifier:v29];

  v30 = [v20 label];
  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setPlanLabel:v30];

  v31 = [v20 detailLabel];
  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setPlanDetailLabel:v31];

  v32 = [v20 usageDateRange];
  id v33 = [v32 startDate];
  v34 = NPKSecureArchiveObject(v33);
  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setStartDateData:v34];

  v35 = [v20 usageDateRange];

  v36 = [v35 expiryDate];
  v37 = NPKSecureArchiveObject(v36);
  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setExpiryDateData:v37];

  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setRequestUniqueID:v24];
  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setDeviceIdentifier:v23];

  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setPassTypeIdentifier:v21];
  [(NPKProtoRemotePassActionSelectItemRequest *)v26 setPassSerialNumber:v43];

  v38 = [(NPKProtoRemotePassActionSelectItemRequest *)v26 data];
  [(NPKProtoRemotePassActionEnvelope *)v25 setMessageProtoData:v38];
  v46.receiver = self;
  v46.super_class = (Class)NPKRemotePassActionSelectItemRequest;
  v39 = [(NPKRemotePassAction *)&v46 initWithProtoEnvelope:v25 image:v44];

  return v39;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionSelectItemRequest;
  v3 = [(NPKRemotePassActionRequest *)&v7 description];
  v4 = [(NPKRemotePassActionSelectItemRequest *)self commutePlanField];
  v5 = [v3 stringByAppendingFormat:@" (commutePlanField:%@)", v4];

  return v5;
}

- (id)identifier
{
  v2 = [(NPKRemotePassActionSelectItemRequest *)self protoRequest];
  v3 = [v2 requestUniqueID];

  return v3;
}

- (id)action
{
  v2 = [(NPKRemotePassActionSelectItemRequest *)self commutePlanField];
  v3 = [v2 action];

  return v3;
}

- (id)actionText
{
  v3 = [(NPKRemotePassActionSelectItemRequest *)self action];
  v4 = [v3 confirmationTitle];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NPKRemotePassActionSelectItemRequest;
    id v6 = [(NPKRemotePassActionRequest *)&v9 actionText];
  }
  objc_super v7 = v6;

  return v7;
}

- (NPKProtoRemotePassActionSelectItemRequest)protoRequest
{
  protoRequest = self->_protoRequest;
  if (!protoRequest)
  {
    v4 = [NPKProtoRemotePassActionSelectItemRequest alloc];
    v5 = [(NPKRemotePassAction *)self protoEnvelope];
    id v6 = [v5 messageProtoData];
    objc_super v7 = [(NPKProtoRemotePassActionSelectItemRequest *)v4 initWithData:v6];
    id v8 = self->_protoRequest;
    self->_protoRequest = v7;

    protoRequest = self->_protoRequest;
  }
  return protoRequest;
}

- (NPKCommutePlanField)commutePlanField
{
  cachedCommutePlanField = self->_cachedCommutePlanField;
  if (!cachedCommutePlanField)
  {
    id v4 = [(NPKRemotePassActionSelectItemRequest *)self protoRequest];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 paymentPassActionData];
      if (v6)
      {
        objc_super v7 = objc_opt_class();
        uint64_t v8 = NPKSecureUnarchiveObject(v6, v7);
        if (v8)
        {
          objc_super v9 = v8;
          v10 = [v5 startDateData];
          v11 = objc_opt_class();
          v34 = NPKSecureUnarchiveObject(v10, v11);

          v12 = [v5 expiryDateData];
          v13 = objc_opt_class();
          id v33 = NPKSecureUnarchiveObject(v12, v13);

          v32 = v6;
          v14 = [[NPKDateRange alloc] initWithStartDate:v34 expirationDate:v33 formatterStyle:3];
          v15 = [NPKCommutePlanField alloc];
          v16 = [v5 planLabel];
          id v17 = [v5 planDetailLabel];
          id v18 = [v5 planIdentifier];
          id v19 = [v9 associatedPlan];
          LOBYTE(v31) = [v19 isDeviceBound];
          id v20 = [(NPKCommutePlanField *)v15 initWithLabel:v16 detailLabel:v17 formattedValue:0 rawCountValue:0 usageDateRange:v14 identifier:v18 details:0 action:v9 isDeviceBound:v31 pendingUpdateExpireDate:0];

          id v6 = v32;
LABEL_19:

LABEL_22:
          goto LABEL_23;
        }
        v25 = pk_RemotePassAction_log();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

        if (v26)
        {
          uint64_t v27 = pk_RemotePassAction_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v35 = 0;
            _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_ERROR, "Error: Missing Action", v35, 2u);
          }
        }
        objc_super v9 = 0;
LABEL_18:
        id v20 = 0;
        goto LABEL_19;
      }
      id v23 = pk_RemotePassAction_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        objc_super v9 = pk_RemotePassAction_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Missing action data", v36, 2u);
        }
        goto LABEL_18;
      }
      id v6 = 0;
    }
    else
    {
      id v21 = pk_RemotePassAction_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v22)
      {
        id v20 = 0;
LABEL_23:

        v28 = self->_cachedCommutePlanField;
        self->_cachedCommutePlanField = v20;

        cachedCommutePlanField = self->_cachedCommutePlanField;
        goto LABEL_24;
      }
      id v6 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Missing proto request", buf, 2u);
      }
    }
    id v20 = 0;
    goto LABEL_22;
  }
LABEL_24:
  uint64_t v29 = cachedCommutePlanField;
  return v29;
}

- (NSString)deviceIdentifier
{
  v2 = [(NPKRemotePassActionSelectItemRequest *)self protoRequest];
  v3 = [v2 deviceIdentifier];

  return (NSString *)v3;
}

- (NSString)passTypeIdentifier
{
  v2 = [(NPKRemotePassActionSelectItemRequest *)self protoRequest];
  v3 = [v2 passTypeIdentifier];

  return (NSString *)v3;
}

- (NSString)passSerialNumber
{
  v2 = [(NPKRemotePassActionSelectItemRequest *)self protoRequest];
  v3 = [v2 passSerialNumber];

  return (NSString *)v3;
}

- (void)setProtoRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoRequest, 0);
  objc_storeStrong((id *)&self->_cachedCommutePlanField, 0);
}

@end