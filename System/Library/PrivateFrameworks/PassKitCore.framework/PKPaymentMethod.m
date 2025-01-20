@interface PKPaymentMethod
+ (BOOL)supportsSecureCoding;
+ (PKPaymentMethod)paymentMethodWithProtobuf:(id)a3;
+ (int64_t)version;
- (BOOL)usePeerPaymentBalance;
- (CNContact)billingAddress;
- (NSString)bindToken;
- (NSString)displayName;
- (NSString)peerPaymentQuoteIdentifier;
- (PKBankAccountInformation)bankAccount;
- (PKPaymentMethod)initWithBankAccount:(id)a3;
- (PKPaymentMethod)initWithBindToken:(id)a3;
- (PKPaymentMethod)initWithCoder:(id)a3;
- (PKPaymentMethod)initWithPayLaterAccount:(id)a3 primaryAccountNumberSuffix:(id)a4 obfuscateNetworks:(BOOL)a5;
- (PKPaymentMethod)initWithPaymentPass:(id)a3 obfuscateNetworks:(BOOL)a4;
- (PKPaymentMethod)initWithPaymentPass:(id)a3 paymentApplication:(id)a4 obfuscateNetworks:(BOOL)a5;
- (PKPaymentMethod)initWithPeerPaymentQuote:(id)a3;
- (PKPaymentMethod)initWithRemotePaymentInstrument:(id)a3;
- (PKPaymentMethod)initWithRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4;
- (PKPaymentMethodType)type;
- (PKPaymentNetwork)network;
- (PKPaymentPass)paymentPass;
- (PKRemotePaymentInstrument)remoteInstrument;
- (PKSecureElementPass)secureElementPass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)protobuf;
- (void)encodeWithCoder:(id)a3;
- (void)setBankAccount:(id)a3;
- (void)setBillingAddress:(id)a3;
- (void)setBindToken:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setPeerPaymentQuoteIdentifier:(id)a3;
- (void)setRemoteInstrument:(id)a3;
- (void)setSecureElementPass:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUsePeerPaymentBalance:(BOOL)a3;
@end

@implementation PKPaymentMethod

+ (PKPaymentMethod)paymentMethodWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentMethod);
  v5 = [v3 network];
  [(PKPaymentMethod *)v4 setNetwork:v5];

  v6 = [v3 displayName];
  [(PKPaymentMethod *)v4 setDisplayName:v6];

  LODWORD(v6) = [v3 type];
  [(PKPaymentMethod *)v4 setType:v6];
  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufPaymentMethod);
  v4 = [(PKPaymentMethod *)self displayName];
  [(PKProtobufPaymentMethod *)v3 setDisplayName:v4];

  v5 = [(PKPaymentMethod *)self network];
  [(PKProtobufPaymentMethod *)v3 setNetwork:v5];

  [(PKProtobufPaymentMethod *)v3 setType:[(PKPaymentMethod *)self type]];
  return v3;
}

+ (int64_t)version
{
  return 4;
}

- (PKPaymentMethod)initWithPaymentPass:(id)a3 obfuscateNetworks:(BOOL)a4
{
  return [(PKPaymentMethod *)self initWithPaymentPass:a3 paymentApplication:0 obfuscateNetworks:a4];
}

- (PKPaymentMethod)initWithPaymentPass:(id)a3 paymentApplication:(id)a4 obfuscateNetworks:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentMethod;
  v10 = [(PKPaymentMethod *)&v21 init];
  if (v10)
  {
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v8 devicePrimaryInAppPaymentApplication];
    }
    v12 = v11;
    v10->_type = [v11 paymentType];
    if (a5) {
      goto LABEL_12;
    }
    uint64_t v13 = PKPaymentNetworkNameForPaymentCredentialType([v12 paymentNetworkIdentifier]);
    network = v10->_network;
    v10->_network = (NSString *)v13;

    v15 = [v8 primaryAccountNumberSuffix];
    uint64_t v16 = [v9 dpanSuffix];
    v17 = (void *)v16;
    if (v15)
    {
      [NSString stringWithFormat:@"%@ %@", v10->_network, v15];
    }
    else
    {
      if (!v16)
      {
        v18 = v10->_network;
        goto LABEL_11;
      }
      [NSString stringWithFormat:@"%@ %@", v10->_network, v16];
    }
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    displayName = v10->_displayName;
    v10->_displayName = v18;

LABEL_12:
  }

  return v10;
}

- (PKPaymentMethod)initWithRemotePaymentInstrument:(id)a3
{
  id v4 = a3;
  v5 = [v4 primaryPaymentApplication];
  v6 = [(PKPaymentMethod *)self initWithRemotePaymentInstrument:v4 paymentApplication:v5];

  return v6;
}

- (PKPaymentMethod)initWithRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4
{
  id v5 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentMethod;
  v6 = [(PKPaymentMethod *)&v8 init];
  if (v6) {
    v6->_type = [v5 paymentType];
  }

  return v6;
}

- (PKPaymentMethod)initWithPeerPaymentQuote:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMethod;
  id v5 = [(PKPaymentMethod *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    peerPaymentQuoteIdentifier = v5->_peerPaymentQuoteIdentifier;
    v5->_peerPaymentQuoteIdentifier = (NSString *)v6;
  }
  return v5;
}

- (PKPaymentMethod)initWithBindToken:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMethod;
  id v5 = [(PKPaymentMethod *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bindToken = v5->_bindToken;
    v5->_bindToken = (NSString *)v6;
  }
  return v5;
}

- (PKPaymentMethod)initWithBankAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMethod;
  uint64_t v6 = [(PKPaymentMethod *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bankAccount, a3);
  }

  return v7;
}

- (PKPaymentMethod)initWithPayLaterAccount:(id)a3 primaryAccountNumberSuffix:(id)a4 obfuscateNetworks:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentMethod;
  v10 = [(PKPaymentMethod *)&v18 init];
  if (v10)
  {
    id v11 = [v8 payLaterDetails];
    v10->_type = [v11 paymentType];

    if (!a5)
    {
      v12 = [v8 payLaterDetails];
      uint64_t v13 = PKPaymentNetworkNameForPaymentCredentialType([v12 cardNetwork]);
      network = v10->_network;
      v10->_network = (NSString *)v13;

      if (v9) {
        v15 = (NSString *)[[NSString alloc] initWithFormat:@"%@ %@", v10->_network, v9];
      }
      else {
        v15 = v10->_network;
      }
      displayName = v10->_displayName;
      v10->_displayName = v15;
    }
  }

  return v10;
}

- (PKPaymentPass)paymentPass
{
  return [(PKPass *)self->_secureElementPass paymentPass];
}

- (void)setPaymentPass:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v14 = a3;
  id v5 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[PKPaymentMethod type](self, "type"));
  [v14 encodeObject:v5 forKey:@"type"];

  uint64_t v6 = [(PKPaymentMethod *)self displayName];
  [v14 encodeObject:v6 forKey:@"displayName"];

  v7 = [(PKPaymentMethod *)self network];
  [v14 encodeObject:v7 forKey:@"network"];

  id v8 = [(PKPaymentMethod *)self secureElementPass];
  [v14 encodeObject:v8 forKey:@"paymentPass"];

  id v9 = [(PKPaymentMethod *)self remoteInstrument];
  [v14 encodeObject:v9 forKey:@"remoteInstrument"];

  v10 = [(PKPaymentMethod *)self peerPaymentQuoteIdentifier];
  [v14 encodeObject:v10 forKey:@"peerPaymentQuoteIdentifier"];

  id v11 = [(PKPaymentMethod *)self billingAddress];
  [v14 encodeObject:v11 forKey:@"billingAddress"];

  v12 = [(PKPaymentMethod *)self bindToken];
  [v14 encodeObject:v12 forKey:@"installmentBindToken"];

  uint64_t v13 = [(PKPaymentMethod *)self bankAccount];
  [v14 encodeObject:v13 forKey:@"bankAccount"];

  objc_msgSend(v14, "encodeBool:forKey:", -[PKPaymentMethod usePeerPaymentBalance](self, "usePeerPaymentBalance"), @"usePeerPaymentBalance");
}

- (PKPaymentMethod)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentMethod;
  id v5 = [(PKPaymentMethod *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    -[PKPaymentMethod setType:](v5, "setType:", [v6 unsignedIntegerValue]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    [(PKPaymentMethod *)v5 setDisplayName:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"network"];
    [(PKPaymentMethod *)v5 setNetwork:v8];

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v11 = [v9 setWithArray:v10];
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"paymentPass"];
    [(PKPaymentMethod *)v5 setSecureElementPass:v12];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteInstrument"];
    [(PKPaymentMethod *)v5 setRemoteInstrument:v13];

    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentQuoteIdentifier"];
    [(PKPaymentMethod *)v5 setPeerPaymentQuoteIdentifier:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingAddress"];
    [(PKPaymentMethod *)v5 setBillingAddress:v15];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentBindToken"];
    [(PKPaymentMethod *)v5 setBindToken:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankAccount"];
    [(PKPaymentMethod *)v5 setBankAccount:v17];

    -[PKPaymentMethod setUsePeerPaymentBalance:](v5, "setUsePeerPaymentBalance:", [v4 decodeBoolForKey:@"usePeerPaymentBalance"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentMethod allocWithZone:](PKPaymentMethod, "allocWithZone:") init];
  v5->_type = self->_type;
  uint64_t v6 = [(NSString *)self->_network copyWithZone:a3];
  network = v5->_network;
  v5->_network = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v8;

  return v5;
}

- (id)dictionaryRepresentation
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  network = self->_network;
  if (network) {
    [v3 setObject:network forKeyedSubscript:@"network"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKeyedSubscript:@"displayName"];
  }
  secureElementPass = self->_secureElementPass;
  if (secureElementPass)
  {
    uint64_t v8 = [(PKSecureElementPass *)secureElementPass dictionaryWithValuesForKeys:&unk_1EE22B6A8];
    [v4 setObject:v8 forKeyedSubscript:@"paymentPass"];
LABEL_9:

    goto LABEL_10;
  }
  remoteInstrument = self->_remoteInstrument;
  if (remoteInstrument)
  {
    v19[0] = @"primaryAccountIdentifier";
    uint64_t v8 = [(PKRemotePaymentInstrument *)remoteInstrument primaryAccountIdentifier];
    v20[0] = v8;
    v19[1] = @"primaryAccountNumberSuffix";
    v10 = [(PKRemotePaymentInstrument *)self->_remoteInstrument primaryAccountNumberSuffix];
    v20[1] = v10;
    v19[2] = @"deviceAccountIdentifier";
    id v11 = [(PKRemotePaymentInstrument *)self->_remoteInstrument primaryPaymentApplication];
    v12 = [v11 dpanIdentifier];
    v20[2] = v12;
    v19[3] = @"deviceAccountNumberSuffix";
    uint64_t v13 = [(PKRemotePaymentInstrument *)self->_remoteInstrument primaryPaymentApplication];
    id v14 = [v13 dpanSuffix];
    void v20[3] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
    [v4 setObject:v15 forKeyedSubscript:@"paymentPass"];

    goto LABEL_9;
  }
  if (self->_peerPaymentQuoteIdentifier || self->_bankAccount) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:");
  }
LABEL_10:
  uint64_t v16 = @"Debit";
  switch(self->_type)
  {
    case 0uLL:
      goto LABEL_17;
    case 1uLL:
      goto LABEL_16;
    case 2uLL:
      uint64_t v16 = @"Credit";
      goto LABEL_16;
    case 3uLL:
      uint64_t v16 = @"Prepaid";
      goto LABEL_16;
    case 4uLL:
      uint64_t v16 = @"Store";
      goto LABEL_16;
    case 5uLL:
      uint64_t v16 = @"eMoney";
      goto LABEL_16;
    default:
      uint64_t v16 = @"Unknown";
LABEL_16:
      [v4 setObject:v16 forKeyedSubscript:@"type"];
LABEL_17:
      v17 = objc_msgSend(v4, "copy", v16);

      return v17;
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (PKPaymentNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (PKPaymentMethodType)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKSecureElementPass)secureElementPass
{
  return self->_secureElementPass;
}

- (void)setSecureElementPass:(id)a3
{
}

- (CNContact)billingAddress
{
  return self->_billingAddress;
}

- (void)setBillingAddress:(id)a3
{
}

- (PKRemotePaymentInstrument)remoteInstrument
{
  return self->_remoteInstrument;
}

- (void)setRemoteInstrument:(id)a3
{
}

- (NSString)peerPaymentQuoteIdentifier
{
  return self->_peerPaymentQuoteIdentifier;
}

- (void)setPeerPaymentQuoteIdentifier:(id)a3
{
}

- (BOOL)usePeerPaymentBalance
{
  return self->_usePeerPaymentBalance;
}

- (void)setUsePeerPaymentBalance:(BOOL)a3
{
  self->_usePeerPaymentBalance = a3;
}

- (PKBankAccountInformation)bankAccount
{
  return self->_bankAccount;
}

- (void)setBankAccount:(id)a3
{
}

- (NSString)bindToken
{
  return self->_bindToken;
}

- (void)setBindToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindToken, 0);
  objc_storeStrong((id *)&self->_bankAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentQuoteIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteInstrument, 0);
  objc_storeStrong((id *)&self->_billingAddress, 0);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end