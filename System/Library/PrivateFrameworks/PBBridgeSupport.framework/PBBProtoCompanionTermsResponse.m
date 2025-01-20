@interface PBBProtoCompanionTermsResponse
- (BOOL)hasIsExistingAccountTerms;
- (BOOL)hasResponseData;
- (BOOL)hasTermsAccepted;
- (BOOL)hasUserAgent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExistingAccountTerms;
- (BOOL)readFrom:(id)a3;
- (BOOL)termsAccepted;
- (NSString)responseData;
- (NSString)userAgent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsExistingAccountTerms:(BOOL)a3;
- (void)setHasTermsAccepted:(BOOL)a3;
- (void)setIsExistingAccountTerms:(BOOL)a3;
- (void)setResponseData:(id)a3;
- (void)setTermsAccepted:(BOOL)a3;
- (void)setUserAgent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoCompanionTermsResponse

- (void)setTermsAccepted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_termsAccepted = a3;
}

- (void)setHasTermsAccepted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTermsAccepted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (void)setIsExistingAccountTerms:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isExistingAccountTerms = a3;
}

- (void)setHasIsExistingAccountTerms:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsExistingAccountTerms
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasResponseData
{
  return self->_responseData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoCompanionTermsResponse;
  v4 = [(PBBProtoCompanionTermsResponse *)&v8 description];
  v5 = [(PBBProtoCompanionTermsResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_termsAccepted];
    [v3 setObject:v4 forKey:@"termsAccepted"];
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v3 setObject:userAgent forKey:@"userAgent"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_isExistingAccountTerms];
    [v3 setObject:v6 forKey:@"isExistingAccountTerms"];
  }
  responseData = self->_responseData;
  if (responseData) {
    [v3 setObject:responseData forKey:@"responseData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoCompanionTermsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_userAgent)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_responseData)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[25] = self->_termsAccepted;
    v4[28] |= 2u;
  }
  id v5 = v4;
  if (self->_userAgent)
  {
    objc_msgSend(v4, "setUserAgent:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_isExistingAccountTerms;
    v4[28] |= 1u;
  }
  if (self->_responseData)
  {
    objc_msgSend(v5, "setResponseData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 25) = self->_termsAccepted;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_userAgent copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v6 + 24) = self->_isExistingAccountTerms;
    *(unsigned char *)(v6 + 28) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_responseData copyWithZone:a3];
  v10 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_17;
    }
    if (self->_termsAccepted)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](userAgent, "isEqual:")) {
      goto LABEL_17;
    }
    char has = (char)self->_has;
  }
  if ((has & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_23;
    }
LABEL_17:
    char v7 = 0;
    goto LABEL_18;
  }
  if ((*((unsigned char *)v4 + 28) & 1) == 0) {
    goto LABEL_17;
  }
  if (!self->_isExistingAccountTerms)
  {
    if (!*((unsigned char *)v4 + 24)) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  if (!*((unsigned char *)v4 + 24)) {
    goto LABEL_17;
  }
LABEL_23:
  responseData = self->_responseData;
  if ((unint64_t)responseData | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](responseData, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_termsAccepted;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_userAgent hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isExistingAccountTerms;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_responseData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[28] & 2) != 0)
  {
    self->_termsAccepted = v4[25];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[PBBProtoCompanionTermsResponse setUserAgent:](self, "setUserAgent:");
    NSUInteger v4 = v5;
  }
  if (v4[28])
  {
    self->_isExistingAccountTerms = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[PBBProtoCompanionTermsResponse setResponseData:](self, "setResponseData:");
    NSUInteger v4 = v5;
  }
}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (BOOL)isExistingAccountTerms
{
  return self->_isExistingAccountTerms;
}

- (NSString)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

@end