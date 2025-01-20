@interface APPBMerchant
- (BOOL)hasPaymentProcessingCertificate;
- (BOOL)hasShippingUpdateCertificate;
- (BOOL)hasShippingUpdateURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)paymentProcessingCertificate;
- (NSData)shippingUpdateCertificate;
- (NSString)countryCode;
- (NSString)identifier;
- (NSString)paymentProcessingURL;
- (NSString)shippingUpdateURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)paymentCapabilitiesAsString:(int)a3;
- (id)supportedPaymentNetworksAsString:(int)a3;
- (int)StringAsPaymentCapabilities:(id)a3;
- (int)StringAsSupportedPaymentNetworks:(id)a3;
- (int)paymentCapabilities;
- (int)paymentCapabilitiesAtIndex:(unint64_t)a3;
- (int)supportedPaymentNetworks;
- (int)supportedPaymentNetworksAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)paymentCapabilitiesCount;
- (unint64_t)supportedPaymentNetworksCount;
- (void)addPaymentCapabilities:(int)a3;
- (void)addSupportedPaymentNetworks:(int)a3;
- (void)clearPaymentCapabilities;
- (void)clearSupportedPaymentNetworks;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPaymentCapabilities:(int *)a3 count:(unint64_t)a4;
- (void)setPaymentProcessingCertificate:(id)a3;
- (void)setPaymentProcessingURL:(id)a3;
- (void)setShippingUpdateCertificate:(id)a3;
- (void)setShippingUpdateURL:(id)a3;
- (void)setSupportedPaymentNetworks:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation APPBMerchant

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)APPBMerchant;
  [(APPBMerchant *)&v3 dealloc];
}

- (unint64_t)supportedPaymentNetworksCount
{
  return self->_supportedPaymentNetworks.count;
}

- (int)supportedPaymentNetworks
{
  return self->_supportedPaymentNetworks.list;
}

- (void)clearSupportedPaymentNetworks
{
}

- (void)addSupportedPaymentNetworks:(int)a3
{
}

- (int)supportedPaymentNetworksAtIndex:(unint64_t)a3
{
  p_supportedPaymentNetworks = &self->_supportedPaymentNetworks;
  unint64_t count = self->_supportedPaymentNetworks.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_supportedPaymentNetworks->list[a3];
}

- (void)setSupportedPaymentNetworks:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedPaymentNetworksAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_super v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    objc_super v3 = *(&off_100235F00 + a3);
  }

  return v3;
}

- (int)StringAsSupportedPaymentNetworks:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AmericanExpress"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MasterCard"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Visa"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ChinaUnionPay"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)paymentCapabilitiesCount
{
  return self->_paymentCapabilities.count;
}

- (int)paymentCapabilities
{
  return self->_paymentCapabilities.list;
}

- (void)clearPaymentCapabilities
{
}

- (void)addPaymentCapabilities:(int)a3
{
}

- (int)paymentCapabilitiesAtIndex:(unint64_t)a3
{
  p_paymentCapabilities = &self->_paymentCapabilities;
  unint64_t count = self->_paymentCapabilities.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_paymentCapabilities->list[a3];
}

- (void)setPaymentCapabilities:(int *)a3 count:(unint64_t)a4
{
}

- (id)paymentCapabilitiesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"EMV";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"ThreeDS";
  }
  return v4;
}

- (int)StringAsPaymentCapabilities:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ThreeDS"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"EMV"];
  }

  return v4;
}

- (BOOL)hasPaymentProcessingCertificate
{
  return self->_paymentProcessingCertificate != 0;
}

- (BOOL)hasShippingUpdateURL
{
  return self->_shippingUpdateURL != 0;
}

- (BOOL)hasShippingUpdateCertificate
{
  return self->_shippingUpdateCertificate != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBMerchant;
  id v3 = [(APPBMerchant *)&v7 description];
  int v4 = [(APPBMerchant *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v4 setObject:countryCode forKey:@"countryCode"];
  }
  p_supportedPaymentNetworks = &self->_supportedPaymentNetworks;
  if (self->_supportedPaymentNetworks.count)
  {
    v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_supportedPaymentNetworks.count)
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = p_supportedPaymentNetworks->list[v9];
        if (v10 >= 4)
        {
          v11 = +[NSString stringWithFormat:@"(unknown: %i)", p_supportedPaymentNetworks->list[v9]];
        }
        else
        {
          v11 = *(&off_100235F00 + v10);
        }
        [v8 addObject:v11];

        ++v9;
      }
      while (v9 < self->_supportedPaymentNetworks.count);
    }
    [v4 setObject:v8 forKey:@"supportedPaymentNetworks"];
  }
  p_paymentCapabilities = &self->_paymentCapabilities;
  if (self->_paymentCapabilities.count)
  {
    v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_paymentCapabilities.count)
    {
      unint64_t v14 = 0;
      do
      {
        int v15 = p_paymentCapabilities->list[v14];
        if (v15)
        {
          if (v15 == 1)
          {
            v16 = @"EMV";
          }
          else
          {
            v16 = +[NSString stringWithFormat:@"(unknown: %i)", p_paymentCapabilities->list[v14]];
          }
        }
        else
        {
          v16 = @"ThreeDS";
        }
        [v13 addObject:v16];

        ++v14;
      }
      while (v14 < self->_paymentCapabilities.count);
    }
    [v4 setObject:v13 forKey:@"paymentCapabilities"];
  }
  paymentProcessingURL = self->_paymentProcessingURL;
  if (paymentProcessingURL) {
    [v4 setObject:paymentProcessingURL forKey:@"paymentProcessingURL"];
  }
  paymentProcessingCertificate = self->_paymentProcessingCertificate;
  if (paymentProcessingCertificate) {
    [v4 setObject:paymentProcessingCertificate forKey:@"paymentProcessingCertificate"];
  }
  shippingUpdateURL = self->_shippingUpdateURL;
  if (shippingUpdateURL) {
    [v4 setObject:shippingUpdateURL forKey:@"shippingUpdateURL"];
  }
  shippingUpdateCertificate = self->_shippingUpdateCertificate;
  if (shippingUpdateCertificate) {
    [v4 setObject:shippingUpdateCertificate forKey:@"shippingUpdateCertificate"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMerchantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_identifier) {
    sub_10019A734();
  }
  id v8 = v4;
  PBDataWriterWriteStringField();
  if (!self->_countryCode) {
    sub_10019A760();
  }
  PBDataWriterWriteStringField();
  if (self->_supportedPaymentNetworks.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_supportedPaymentNetworks.count);
  }
  if (self->_paymentCapabilities.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_paymentCapabilities.count);
  }
  if (!self->_paymentProcessingURL) {
    sub_10019A78C();
  }
  PBDataWriterWriteStringField();
  if (self->_paymentProcessingCertificate) {
    PBDataWriterWriteDataField();
  }
  if (self->_shippingUpdateURL) {
    PBDataWriterWriteStringField();
  }
  objc_super v7 = v8;
  if (self->_shippingUpdateCertificate)
  {
    PBDataWriterWriteDataField();
    objc_super v7 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v11 = a3;
  [v11 setIdentifier:self->_identifier];
  [v11 setCountryCode:self->_countryCode];
  if ([(APPBMerchant *)self supportedPaymentNetworksCount])
  {
    [v11 clearSupportedPaymentNetworks];
    unint64_t v4 = [(APPBMerchant *)self supportedPaymentNetworksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        [v11 addSupportedPaymentNetworks:-[APPBMerchant supportedPaymentNetworksAtIndex:](self, "supportedPaymentNetworksAtIndex:", i)];
    }
  }
  if ([(APPBMerchant *)self paymentCapabilitiesCount])
  {
    [v11 clearPaymentCapabilities];
    unint64_t v7 = [(APPBMerchant *)self paymentCapabilitiesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        [v11 addPaymentCapabilities:-[APPBMerchant paymentCapabilitiesAtIndex:](self, "paymentCapabilitiesAtIndex:", j)];
    }
  }
  [v11 setPaymentProcessingURL:self->_paymentProcessingURL];
  if (self->_paymentProcessingCertificate) {
    [v11 setPaymentProcessingCertificate:];
  }
  if (self->_shippingUpdateURL) {
    [v11 setShippingUpdateURL:];
  }
  uint64_t v10 = v11;
  if (self->_shippingUpdateCertificate)
  {
    [v11 setShippingUpdateCertificate:];
    uint64_t v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  id v8 = [(NSString *)self->_countryCode copyWithZone:a3];
  unint64_t v9 = (void *)v5[7];
  v5[7] = v8;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  id v10 = [(NSString *)self->_paymentProcessingURL copyWithZone:a3];
  id v11 = (void *)v5[10];
  v5[10] = v10;

  id v12 = [(NSData *)self->_paymentProcessingCertificate copyWithZone:a3];
  v13 = (void *)v5[9];
  v5[9] = v12;

  id v14 = [(NSString *)self->_shippingUpdateURL copyWithZone:a3];
  int v15 = (void *)v5[12];
  v5[12] = v14;

  id v16 = [(NSData *)self->_shippingUpdateCertificate copyWithZone:a3];
  v17 = (void *)v5[11];
  v5[11] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[8]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((countryCode = self->_countryCode, !((unint64_t)countryCode | v4[7]))
     || -[NSString isEqual:](countryCode, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && ((paymentProcessingURL = self->_paymentProcessingURL, !((unint64_t)paymentProcessingURL | v4[10]))
     || -[NSString isEqual:](paymentProcessingURL, "isEqual:"))
    && ((paymentProcessingCertificate = self->_paymentProcessingCertificate,
         !((unint64_t)paymentProcessingCertificate | v4[9]))
     || -[NSData isEqual:](paymentProcessingCertificate, "isEqual:"))
    && ((shippingUpdateURL = self->_shippingUpdateURL, !((unint64_t)shippingUpdateURL | v4[12]))
     || -[NSString isEqual:](shippingUpdateURL, "isEqual:")))
  {
    shippingUpdateCertificate = self->_shippingUpdateCertificate;
    if ((unint64_t)shippingUpdateCertificate | v4[11]) {
      unsigned __int8 v11 = -[NSData isEqual:](shippingUpdateCertificate, "isEqual:");
    }
    else {
      unsigned __int8 v11 = 1;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(NSString *)self->_countryCode hash] ^ v3;
  uint64_t v5 = PBRepeatedInt32Hash();
  uint64_t v6 = v5 ^ PBRepeatedInt32Hash();
  unint64_t v7 = v4 ^ v6 ^ [(NSString *)self->_paymentProcessingURL hash];
  unint64_t v8 = (unint64_t)[(NSData *)self->_paymentProcessingCertificate hash];
  unint64_t v9 = v8 ^ [(NSString *)self->_shippingUpdateURL hash];
  return v7 ^ v9 ^ (unint64_t)[(NSData *)self->_shippingUpdateCertificate hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v12 = v4;
  if (v4[8])
  {
    -[APPBMerchant setIdentifier:](self, "setIdentifier:");
    unint64_t v4 = v12;
  }
  if (v4[7])
  {
    -[APPBMerchant setCountryCode:](self, "setCountryCode:");
    unint64_t v4 = v12;
  }
  uint64_t v5 = (char *)[v4 supportedPaymentNetworksCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[APPBMerchant addSupportedPaymentNetworks:](self, "addSupportedPaymentNetworks:", [v12 supportedPaymentNetworksAtIndex:i]);
  }
  unint64_t v8 = (char *)[v12 paymentCapabilitiesCount];
  if (v8)
  {
    unint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[APPBMerchant addPaymentCapabilities:](self, "addPaymentCapabilities:", [v12 paymentCapabilitiesAtIndex:j]);
  }
  unsigned __int8 v11 = v12;
  if (v12[10])
  {
    -[APPBMerchant setPaymentProcessingURL:](self, "setPaymentProcessingURL:");
    unsigned __int8 v11 = v12;
  }
  if (v11[9])
  {
    -[APPBMerchant setPaymentProcessingCertificate:](self, "setPaymentProcessingCertificate:");
    unsigned __int8 v11 = v12;
  }
  if (v11[12])
  {
    -[APPBMerchant setShippingUpdateURL:](self, "setShippingUpdateURL:");
    unsigned __int8 v11 = v12;
  }
  if (v11[11])
  {
    -[APPBMerchant setShippingUpdateCertificate:](self, "setShippingUpdateCertificate:");
    unsigned __int8 v11 = v12;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)paymentProcessingURL
{
  return self->_paymentProcessingURL;
}

- (void)setPaymentProcessingURL:(id)a3
{
}

- (NSData)paymentProcessingCertificate
{
  return self->_paymentProcessingCertificate;
}

- (void)setPaymentProcessingCertificate:(id)a3
{
}

- (NSString)shippingUpdateURL
{
  return self->_shippingUpdateURL;
}

- (void)setShippingUpdateURL:(id)a3
{
}

- (NSData)shippingUpdateCertificate
{
  return self->_shippingUpdateCertificate;
}

- (void)setShippingUpdateCertificate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingUpdateURL, 0);
  objc_storeStrong((id *)&self->_shippingUpdateCertificate, 0);
  objc_storeStrong((id *)&self->_paymentProcessingURL, 0);
  objc_storeStrong((id *)&self->_paymentProcessingCertificate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end