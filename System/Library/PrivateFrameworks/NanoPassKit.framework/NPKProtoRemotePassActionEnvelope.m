@interface NPKProtoRemotePassActionEnvelope
- (BOOL)hasCaption;
- (BOOL)hasCardType;
- (BOOL)hasPassLocalizedDescription;
- (BOOL)hasPassOrganizationName;
- (BOOL)hasSummaryText;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResponse;
- (BOOL)readFrom:(id)a3;
- (NSData)messageProtoData;
- (NSString)caption;
- (NSString)passLocalizedDescription;
- (NSString)passOrganizationName;
- (NSString)summaryText;
- (id)cardTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageTypeAsString:(int)a3;
- (int)StringAsCardType:(id)a3;
- (int)StringAsMessageType:(id)a3;
- (int)cardType;
- (int)messageType;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCaption:(id)a3;
- (void)setCardType:(int)a3;
- (void)setHasCardType:(BOOL)a3;
- (void)setIsResponse:(BOOL)a3;
- (void)setMessageProtoData:(id)a3;
- (void)setMessageType:(int)a3;
- (void)setPassLocalizedDescription:(id)a3;
- (void)setPassOrganizationName:(id)a3;
- (void)setSummaryText:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemotePassActionEnvelope

- (id)messageTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D7048[a3];
  }
  return v3;
}

- (int)StringAsMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EnterValue"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SelectItem"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCaption
{
  return self->_caption != 0;
}

- (BOOL)hasPassLocalizedDescription
{
  return self->_passLocalizedDescription != 0;
}

- (BOOL)hasSummaryText
{
  return self->_summaryText != 0;
}

- (BOOL)hasPassOrganizationName
{
  return self->_passOrganizationName != 0;
}

- (int)cardType
{
  if (*(unsigned char *)&self->_has) {
    return self->_cardType;
  }
  else {
    return 0;
  }
}

- (void)setCardType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cardType = a3;
}

- (void)setHasCardType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCardType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)cardTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_2644D7060[a3];
  }
  return v3;
}

- (int)StringAsCardType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Transit"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EMoney"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassActionEnvelope;
  int v4 = [(NPKProtoRemotePassActionEnvelope *)&v8 description];
  v5 = [(NPKProtoRemotePassActionEnvelope *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  uint64_t messageType = self->_messageType;
  if (messageType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messageType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_2644D7048[messageType];
  }
  [v3 setObject:v6 forKey:@"messageType"];

  messageProtoData = self->_messageProtoData;
  if (messageProtoData) {
    [v3 setObject:messageProtoData forKey:@"messageProtoData"];
  }
  objc_super v8 = [NSNumber numberWithBool:self->_isResponse];
  [v3 setObject:v8 forKey:@"isResponse"];

  caption = self->_caption;
  if (caption) {
    [v3 setObject:caption forKey:@"caption"];
  }
  passLocalizedDescription = self->_passLocalizedDescription;
  if (passLocalizedDescription) {
    [v3 setObject:passLocalizedDescription forKey:@"passLocalizedDescription"];
  }
  summaryText = self->_summaryText;
  if (summaryText) {
    [v3 setObject:summaryText forKey:@"summaryText"];
  }
  passOrganizationName = self->_passOrganizationName;
  if (passOrganizationName) {
    [v3 setObject:passOrganizationName forKey:@"passOrganizationName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t cardType = self->_cardType;
    if (cardType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cardType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_2644D7060[cardType];
    }
    [v3 setObject:v14 forKey:@"cardType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionEnvelopeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteInt32Field();
  if (!self->_messageProtoData) {
    -[NPKProtoRemotePassActionEnvelope writeTo:]();
  }
  PBDataWriterWriteDataField();
  PBDataWriterWriteBOOLField();
  if (self->_caption) {
    PBDataWriterWriteStringField();
  }
  if (self->_passLocalizedDescription) {
    PBDataWriterWriteStringField();
  }
  int v4 = v5;
  if (self->_summaryText)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_passOrganizationName)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  v5[16] = self->_version;
  v5[8] = self->_messageType;
  [v5 setMessageProtoData:self->_messageProtoData];
  int v4 = v5;
  *((unsigned char *)v5 + 68) = self->_isResponse;
  if (self->_caption)
  {
    objc_msgSend(v5, "setCaption:");
    int v4 = v5;
  }
  if (self->_passLocalizedDescription)
  {
    objc_msgSend(v5, "setPassLocalizedDescription:");
    int v4 = v5;
  }
  if (self->_summaryText)
  {
    objc_msgSend(v5, "setSummaryText:");
    int v4 = v5;
  }
  if (self->_passOrganizationName)
  {
    objc_msgSend(v5, "setPassOrganizationName:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_cardType;
    *((unsigned char *)v4 + 72) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 64) = self->_version;
  *(_DWORD *)(v5 + 32) = self->_messageType;
  uint64_t v6 = [(NSData *)self->_messageProtoData copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(unsigned char *)(v5 + 68) = self->_isResponse;
  uint64_t v8 = [(NSString *)self->_caption copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_passLocalizedDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_summaryText copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_passOrganizationName copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_cardType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if (self->_version != *((_DWORD *)v4 + 16)) {
    goto LABEL_22;
  }
  if (self->_messageType != *((_DWORD *)v4 + 8)) {
    goto LABEL_22;
  }
  messageProtoData = self->_messageProtoData;
  if ((unint64_t)messageProtoData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](messageProtoData, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if (self->_isResponse)
  {
    if (!*((unsigned char *)v4 + 68)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_22:
    BOOL v10 = 0;
    goto LABEL_23;
  }
  caption = self->_caption;
  if ((unint64_t)caption | *((void *)v4 + 1) && !-[NSString isEqual:](caption, "isEqual:")) {
    goto LABEL_22;
  }
  passLocalizedDescription = self->_passLocalizedDescription;
  if ((unint64_t)passLocalizedDescription | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](passLocalizedDescription, "isEqual:")) {
      goto LABEL_22;
    }
  }
  summaryText = self->_summaryText;
  if ((unint64_t)summaryText | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](summaryText, "isEqual:")) {
      goto LABEL_22;
    }
  }
  passOrganizationName = self->_passOrganizationName;
  if ((unint64_t)passOrganizationName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](passOrganizationName, "isEqual:")) {
      goto LABEL_22;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 72) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_cardType != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
    BOOL v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  uint64_t messageType = self->_messageType;
  uint64_t v5 = [(NSData *)self->_messageProtoData hash];
  BOOL isResponse = self->_isResponse;
  NSUInteger v7 = [(NSString *)self->_caption hash];
  NSUInteger v8 = [(NSString *)self->_passLocalizedDescription hash];
  NSUInteger v9 = [(NSString *)self->_summaryText hash];
  NSUInteger v10 = [(NSString *)self->_passOrganizationName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_cardType;
  }
  else {
    uint64_t v11 = 0;
  }
  return (2654435761 * messageType) ^ (2654435761 * version) ^ v5 ^ (2654435761 * isResponse) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 16);
  self->_uint64_t messageType = *((_DWORD *)v4 + 8);
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NPKProtoRemotePassActionEnvelope setMessageProtoData:](self, "setMessageProtoData:");
    id v4 = v5;
  }
  self->_BOOL isResponse = *((unsigned char *)v4 + 68);
  if (*((void *)v4 + 1))
  {
    -[NPKProtoRemotePassActionEnvelope setCaption:](self, "setCaption:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NPKProtoRemotePassActionEnvelope setPassLocalizedDescription:](self, "setPassLocalizedDescription:");
    id v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[NPKProtoRemotePassActionEnvelope setSummaryText:](self, "setSummaryText:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[NPKProtoRemotePassActionEnvelope setPassOrganizationName:](self, "setPassOrganizationName:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 72))
  {
    self->_uint64_t cardType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_uint64_t messageType = a3;
}

- (NSData)messageProtoData
{
  return self->_messageProtoData;
}

- (void)setMessageProtoData:(id)a3
{
}

- (BOOL)isResponse
{
  return self->_isResponse;
}

- (void)setIsResponse:(BOOL)a3
{
  self->_BOOL isResponse = a3;
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
}

- (NSString)passLocalizedDescription
{
  return self->_passLocalizedDescription;
}

- (void)setPassLocalizedDescription:(id)a3
{
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (void)setSummaryText:(id)a3
{
}

- (NSString)passOrganizationName
{
  return self->_passOrganizationName;
}

- (void)setPassOrganizationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_passOrganizationName, 0);
  objc_storeStrong((id *)&self->_passLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_messageProtoData, 0);
  objc_storeStrong((id *)&self->_caption, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnvelope writeTo:]", "NPKProtoRemotePassActionEnvelope.m", 205, "nil != self->_messageProtoData");
}

@end