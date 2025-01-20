@interface PKSharingCarKeyMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)configureWithContent:(id)a3;
- (NSData)underlyingPayload;
- (NSDictionary)carKeySharingDict;
- (NSString)friendKeyIdentifier;
- (NSString)shareIdentifier;
- (NSString)shareSessionIdentifier;
- (PKSharingCarKeyMessage)initWithRawMessage:(id)a3 type:(unint64_t)a4 shareIdentifier:(id)a5 friendKeyIdentifier:(id)a6 carKeySharingDict:(id)a7;
- (PKSharingCarKeyMessage)messageWithBindingAttestation:(id)a3;
@end

@implementation PKSharingCarKeyMessage

- (PKSharingCarKeyMessage)initWithRawMessage:(id)a3 type:(unint64_t)a4 shareIdentifier:(id)a5 friendKeyIdentifier:(id)a6 carKeySharingDict:(id)a7
{
  v8 = 0;
  v25[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a5)
  {
    v13 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v14 = a7;
    id v15 = a6;
    id v16 = a5;
    id v17 = a3;
    id v18 = objc_alloc_init(v13);
    v19 = [v17 hexEncoding];

    [v18 setObject:v19 forKeyedSubscript:@"sharingData"];
    [v18 setObject:v16 forKeyedSubscript:@"sharingId"];

    [v18 setObject:v15 forKeyedSubscript:@"friendKeyId"];
    v24 = @"carKey";
    v25[0] = v14;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v23.receiver = self;
    v23.super_class = (Class)PKSharingCarKeyMessage;
    v21 = [(PKSharingGenericMessage *)&v23 initWithFormat:2 type:a4 genericSharingDict:v18 appleSharingDict:v20 displayInformation:0];

    self = v21;
    v8 = self;
  }

  return v8;
}

- (BOOL)configureWithContent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKSharingCarKeyMessage;
  BOOL v4 = [(PKSharingGenericMessage *)&v9 configureWithContent:a3];
  if (v4)
  {
    v5 = [(PKSharingCarKeyMessage *)self underlyingPayload];

    if (v5)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(0x21uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: car key message missing underlying sharing data", v8, 2u);
      }

      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (NSDictionary)carKeySharingDict
{
  v2 = [(PKSharingGenericMessage *)self appleSharingDict];
  v3 = [v2 PKDictionaryForKey:@"carKey"];

  return (NSDictionary *)v3;
}

- (NSString)shareSessionIdentifier
{
  v2 = [(PKSharingCarKeyMessage *)self carKeySharingDict];
  v3 = [v2 PKStringForKey:@"sharingSessionUUID"];

  return (NSString *)v3;
}

- (NSString)shareIdentifier
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(PKSharingGenericMessage *)self genericSharingDict];
  BOOL v4 = [v3 PKStringForKey:@"sharingId"];
  v5 = v4;
  if (!v4)
  {
    BOOL v4 = [v3 PKStringForKey:@"sharingIdentifier"];
    v5 = v4;
    if (!v4)
    {
      v6 = PKLogFacilityTypeGetObject(0x21uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: Unable to find credential share identifier for %@", (uint8_t *)&v9, 0xCu);
      }

      v5 = 0;
      BOOL v4 = &stru_1EE0F5368;
    }
  }
  v7 = v4;

  return v7;
}

- (NSString)friendKeyIdentifier
{
  v2 = [(PKSharingGenericMessage *)self genericSharingDict];
  v3 = [v2 PKStringForKey:@"friendKeyId"];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 PKStringForKey:@"friendKeyIdentifier"];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSData)underlyingPayload
{
  v2 = [(PKSharingGenericMessage *)self genericSharingDict];
  v3 = [v2 PKStringForKey:@"sharingData"];
  if (v3
    || ([v2 PKStringForKey:@"message"], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v4 = objc_msgSend(v3, "pk_decodeHexadecimal");
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NSData *)v4;
}

- (PKSharingCarKeyMessage)messageWithBindingAttestation:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharingCarKeyMessage *)self carKeySharingDict];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  int v9 = v8;

  v10 = [v4 hexEncoding];

  [v9 setObject:v10 forKeyedSubscript:@"bindingAttestation"];
  uint64_t v11 = [PKSharingCarKeyMessage alloc];
  v12 = [(PKSharingCarKeyMessage *)self underlyingPayload];
  unint64_t v13 = [(PKSharingMessage *)self type];
  id v14 = [(PKSharingCarKeyMessage *)self shareIdentifier];
  id v15 = [(PKSharingCarKeyMessage *)self friendKeyIdentifier];
  id v16 = [(PKSharingCarKeyMessage *)v11 initWithRawMessage:v12 type:v13 shareIdentifier:v14 friendKeyIdentifier:v15 carKeySharingDict:v9];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end