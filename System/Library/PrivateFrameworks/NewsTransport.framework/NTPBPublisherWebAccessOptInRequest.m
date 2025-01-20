@interface NTPBPublisherWebAccessOptInRequest
- (BOOL)hasChannelId;
- (BOOL)hasCountry;
- (BOOL)hasEmail;
- (BOOL)hasIapId;
- (BOOL)hasLanguage;
- (BOOL)hasPurchaseReceipt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)channelId;
- (NSString)country;
- (NSString)email;
- (NSString)iapId;
- (NSString)language;
- (NSString)purchaseReceipt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setCountry:(id)a3;
- (void)setEmail:(id)a3;
- (void)setIapId:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setPurchaseReceipt:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPublisherWebAccessOptInRequest

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (BOOL)hasEmail
{
  return self->_email != 0;
}

- (BOOL)hasPurchaseReceipt
{
  return self->_purchaseReceipt != 0;
}

- (BOOL)hasIapId
{
  return self->_iapId != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPublisherWebAccessOptInRequest;
  v4 = [(NTPBPublisherWebAccessOptInRequest *)&v8 description];
  v5 = [(NTPBPublisherWebAccessOptInRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  email = self->_email;
  if (email) {
    [v4 setObject:email forKey:@"email"];
  }
  purchaseReceipt = self->_purchaseReceipt;
  if (purchaseReceipt) {
    [v4 setObject:purchaseReceipt forKey:@"purchase_receipt"];
  }
  iapId = self->_iapId;
  if (iapId) {
    [v4 setObject:iapId forKey:@"iap_id"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  country = self->_country;
  if (country) {
    [v4 setObject:country forKey:@"country"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPublisherWebAccessOptInRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_channelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_email)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_purchaseReceipt)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_iapId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_channelId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_email copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_purchaseReceipt copyWithZone:a3];
  v11 = (void *)v5[6];
  v5[6] = v10;

  uint64_t v12 = [(NSString *)self->_iapId copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_language copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSString *)self->_country copyWithZone:a3];
  v17 = (void *)v5[2];
  v5[2] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((channelId = self->_channelId, !((unint64_t)channelId | v4[1]))
     || -[NSString isEqual:](channelId, "isEqual:"))
    && ((email = self->_email, !((unint64_t)email | v4[3]))
     || -[NSString isEqual:](email, "isEqual:"))
    && ((purchaseReceipt = self->_purchaseReceipt, !((unint64_t)purchaseReceipt | v4[6]))
     || -[NSString isEqual:](purchaseReceipt, "isEqual:"))
    && ((iapId = self->_iapId, !((unint64_t)iapId | v4[4]))
     || -[NSString isEqual:](iapId, "isEqual:"))
    && ((language = self->_language, !((unint64_t)language | v4[5]))
     || -[NSString isEqual:](language, "isEqual:")))
  {
    country = self->_country;
    if ((unint64_t)country | v4[2]) {
      char v11 = -[NSString isEqual:](country, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channelId hash];
  NSUInteger v4 = [(NSString *)self->_email hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_purchaseReceipt hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_iapId hash];
  NSUInteger v7 = [(NSString *)self->_language hash];
  return v6 ^ v7 ^ [(NSString *)self->_country hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[NTPBPublisherWebAccessOptInRequest setChannelId:](self, "setChannelId:");
  }
  if (v4[3]) {
    -[NTPBPublisherWebAccessOptInRequest setEmail:](self, "setEmail:");
  }
  if (v4[6]) {
    -[NTPBPublisherWebAccessOptInRequest setPurchaseReceipt:](self, "setPurchaseReceipt:");
  }
  if (v4[4]) {
    -[NTPBPublisherWebAccessOptInRequest setIapId:](self, "setIapId:");
  }
  if (v4[5]) {
    -[NTPBPublisherWebAccessOptInRequest setLanguage:](self, "setLanguage:");
  }
  if (v4[2]) {
    -[NTPBPublisherWebAccessOptInRequest setCountry:](self, "setCountry:");
  }
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)purchaseReceipt
{
  return self->_purchaseReceipt;
}

- (void)setPurchaseReceipt:(id)a3
{
}

- (NSString)iapId
{
  return self->_iapId;
}

- (void)setIapId:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseReceipt, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_iapId, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_country, 0);

  objc_storeStrong((id *)&self->_channelId, 0);
}

@end