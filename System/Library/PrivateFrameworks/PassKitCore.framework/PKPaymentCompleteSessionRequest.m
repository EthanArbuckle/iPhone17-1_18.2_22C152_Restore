@interface PKPaymentCompleteSessionRequest
- (PKPaymentMerchantSession)merchantSession;
- (id)bodyDictionary;
- (id)endpointComponents;
- (void)setMerchantSession:(id)a3;
@end

@implementation PKPaymentCompleteSessionRequest

- (id)endpointComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v4 = [(PKPaymentRewrapRequestBase *)self type];
  v5 = @"completeSession";
  switch(v4)
  {
    case 0:
      goto LABEL_6;
    case 1:
      [v3 addObject:@"completeSession"];
      v5 = @"payLater";
      goto LABEL_6;
    case 2:
      v5 = @"issueVirtualCardNumber";
      goto LABEL_6;
    case 4:
      [v3 addObject:@"completeSession"];
      v5 = @"issuerInstallment";
      goto LABEL_6;
    case 5:
      [v3 addObject:@"completeSession"];
      v5 = @"rewards";
LABEL_6:
      [v3 addObject:v5];
      break;
    default:
      break;
  }
  v6 = objc_msgSend(v3, "copy", v5);

  return v6;
}

- (id)bodyDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v4 = [(PKPaymentMerchantSession *)self->_merchantSession merchantSessionIdentifier];
  [v3 setObject:v4 forKey:@"merchantSessionId"];

  v5 = [(PKPaymentMerchantSession *)self->_merchantSession merchantIdentifier];
  [v3 setObject:v5 forKey:@"merchantId"];

  v6 = [(PKPaymentMerchantSession *)self->_merchantSession initiative];

  merchantSession = self->_merchantSession;
  if (v6)
  {
    v8 = [(PKPaymentMerchantSession *)merchantSession initiative];
    [v3 setObject:v8 forKey:@"initiative"];

    v9 = [(PKPaymentMerchantSession *)self->_merchantSession initiativeContext];

    if (!v9) {
      goto LABEL_6;
    }
    v10 = [(PKPaymentMerchantSession *)self->_merchantSession initiativeContext];
    v11 = @"initiativeContext";
  }
  else
  {
    v10 = [(PKPaymentMerchantSession *)merchantSession domain];
    v11 = @"domainName";
  }
  [v3 setObject:v10 forKey:v11];

LABEL_6:
  v12 = [(PKPaymentRewrapRequestBase *)self wrappedPayment];
  v13 = [v12 enrollmentSignature];

  if (v13)
  {
    v14 = [v13 hexEncoding];
    [v3 setObject:v14 forKey:@"enrollmentSignature"];
  }
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentCompleteSessionRequest;
  v15 = [(PKPaymentRewrapRequestBase *)&v18 bodyDictionary];
  [v3 addEntriesFromDictionary:v15];

  v16 = (void *)[v3 copy];
  return v16;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end