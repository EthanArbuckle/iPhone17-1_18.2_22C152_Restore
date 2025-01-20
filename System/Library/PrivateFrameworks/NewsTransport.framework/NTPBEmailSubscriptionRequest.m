@interface NTPBEmailSubscriptionRequest
- (BOOL)hasDsId;
- (BOOL)hasLanguageCode;
- (BOOL)hasUserStorefrontId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)languageCode;
- (NSString)userStorefrontId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)dsId;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDsId:(int64_t)a3;
- (void)setHasDsId:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setUserStorefrontId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBEmailSubscriptionRequest

- (void)setDsId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dsId = a3;
}

- (void)setHasDsId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDsId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBEmailSubscriptionRequest;
  v4 = [(NTPBEmailSubscriptionRequest *)&v8 description];
  v5 = [(NTPBEmailSubscriptionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_dsId];
    [v3 setObject:v4 forKey:@"ds_id"];
  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId) {
    [v3 setObject:userStorefrontId forKey:@"user_storefront_id"];
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    [v3 setObject:languageCode forKey:@"language_code"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEmailSubscriptionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_userStorefrontId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_languageCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_dsId;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_userStorefrontId copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_languageCode copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_dsId != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((void *)v4 + 3)
    && !-[NSString isEqual:](userStorefrontId, "isEqual:"))
  {
    goto LABEL_11;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](languageCode, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_dsId;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_userStorefrontId hash] ^ v3;
  return v4 ^ [(NSString *)self->_languageCode hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[4])
  {
    self->_dsId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (v4[3])
  {
    -[NTPBEmailSubscriptionRequest setUserStorefrontId:](self, "setUserStorefrontId:");
    NSUInteger v4 = v5;
  }
  if (v4[2])
  {
    -[NTPBEmailSubscriptionRequest setLanguageCode:](self, "setLanguageCode:");
    NSUInteger v4 = v5;
  }
}

- (int64_t)dsId
{
  return self->_dsId;
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);

  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end