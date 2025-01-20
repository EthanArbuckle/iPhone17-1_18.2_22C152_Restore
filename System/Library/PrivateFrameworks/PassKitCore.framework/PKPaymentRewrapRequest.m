@interface PKPaymentRewrapRequest
- (NSString)hostApplicationIdentifier;
- (NSString)merchantDisplayName;
- (NSString)merchantIdentifier;
- (id)bodyDictionary;
- (id)endpointComponents;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setMerchantDisplayName:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
@end

@implementation PKPaymentRewrapRequest

- (id)endpointComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v4 = [(PKPaymentRewrapRequestBase *)self type];
  v5 = @"rewrap";
  switch(v4)
  {
    case 0:
      goto LABEL_7;
    case 1:
      [v3 addObject:@"rewrap"];
      v5 = @"payLater";
      goto LABEL_7;
    case 2:
      v5 = @"issueVirtualCardNumber";
      goto LABEL_7;
    case 3:
      v5 = @"secureVirtualCardRefresh";
      goto LABEL_7;
    case 4:
      [v3 addObject:@"rewrap"];
      v5 = @"issuerInstallment";
      goto LABEL_7;
    case 5:
      [v3 addObject:@"rewrap"];
      v5 = @"rewards";
LABEL_7:
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
  int64_t v4 = [(NSString *)self->_merchantIdentifier dataUsingEncoding:4];
  v5 = [v4 SHA256Hash];
  v6 = [v5 hexEncoding];

  [v3 setValue:v6 forKey:@"merchantId"];
  hostApplicationIdentifier = self->_hostApplicationIdentifier;
  if (hostApplicationIdentifier) {
    [v3 setObject:hostApplicationIdentifier forKey:@"applicationId"];
  }
  merchantDisplayName = self->_merchantDisplayName;
  if (merchantDisplayName) {
    [v3 setObject:merchantDisplayName forKey:@"displayName"];
  }
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRewrapRequest;
  v9 = [(PKPaymentRewrapRequestBase *)&v12 bodyDictionary];
  [v3 addEntriesFromDictionary:v9];

  v10 = (void *)[v3 copy];
  return v10;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (NSString)merchantDisplayName
{
  return self->_merchantDisplayName;
}

- (void)setMerchantDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantDisplayName, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end