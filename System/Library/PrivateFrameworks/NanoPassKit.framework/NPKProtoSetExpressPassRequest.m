@interface NPKProtoSetExpressPassRequest
- (BOOL)cancelOutstandingRequests;
- (BOOL)hasApplicationIdentifier;
- (BOOL)hasCancelOutstandingRequests;
- (BOOL)hasExpressPassConfiguration;
- (BOOL)hasExpressPassInformation;
- (BOOL)hasRequestAuthorization;
- (BOOL)hasUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestAuthorization;
- (NSData)expressPassConfiguration;
- (NSData)expressPassInformation;
- (NSString)applicationIdentifier;
- (NSString)uniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCancelOutstandingRequests:(BOOL)a3;
- (void)setExpressPassConfiguration:(id)a3;
- (void)setExpressPassInformation:(id)a3;
- (void)setHasCancelOutstandingRequests:(BOOL)a3;
- (void)setHasRequestAuthorization:(BOOL)a3;
- (void)setRequestAuthorization:(BOOL)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSetExpressPassRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)setCancelOutstandingRequests:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cancelOutstandingRequests = a3;
}

- (void)setHasCancelOutstandingRequests:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCancelOutstandingRequests
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (void)setRequestAuthorization:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requestAuthorization = a3;
}

- (void)setHasRequestAuthorization:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestAuthorization
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasExpressPassInformation
{
  return self->_expressPassInformation != 0;
}

- (BOOL)hasExpressPassConfiguration
{
  return self->_expressPassConfiguration != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSetExpressPassRequest;
  v4 = [(NPKProtoSetExpressPassRequest *)&v8 description];
  v5 = [(NPKProtoSetExpressPassRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v3 setObject:uniqueID forKey:@"uniqueID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_cancelOutstandingRequests];
    [v4 setObject:v6 forKey:@"cancelOutstandingRequests"];
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier) {
    [v4 setObject:applicationIdentifier forKey:@"applicationIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_requestAuthorization];
    [v4 setObject:v8 forKey:@"requestAuthorization"];
  }
  expressPassInformation = self->_expressPassInformation;
  if (expressPassInformation) {
    [v4 setObject:expressPassInformation forKey:@"expressPassInformation"];
  }
  expressPassConfiguration = self->_expressPassConfiguration;
  if (expressPassConfiguration) {
    [v4 setObject:expressPassConfiguration forKey:@"expressPassConfiguration"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetExpressPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_applicationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_expressPassInformation)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_expressPassConfiguration)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueID)
  {
    objc_msgSend(v4, "setUniqueID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_cancelOutstandingRequests;
    v4[44] |= 1u;
  }
  if (self->_applicationIdentifier)
  {
    objc_msgSend(v5, "setApplicationIdentifier:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[41] = self->_requestAuthorization;
    v4[44] |= 2u;
  }
  if (self->_expressPassInformation)
  {
    objc_msgSend(v5, "setExpressPassInformation:");
    id v4 = v5;
  }
  if (self->_expressPassConfiguration)
  {
    objc_msgSend(v5, "setExpressPassConfiguration:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_cancelOutstandingRequests;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_applicationIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 41) = self->_requestAuthorization;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v10 = [(NSData *)self->_expressPassInformation copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSData *)self->_expressPassConfiguration copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:")) {
      goto LABEL_27;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0) {
      goto LABEL_27;
    }
    if (self->_cancelOutstandingRequests)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_27;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if ((unint64_t)applicationIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](applicationIdentifier, "isEqual:")) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_requestAuthorization)
      {
        if (!*((unsigned char *)v4 + 41)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    char v10 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  expressPassInformation = self->_expressPassInformation;
  if ((unint64_t)expressPassInformation | *((void *)v4 + 3)
    && !-[NSData isEqual:](expressPassInformation, "isEqual:"))
  {
    goto LABEL_27;
  }
  expressPassConfiguration = self->_expressPassConfiguration;
  if ((unint64_t)expressPassConfiguration | *((void *)v4 + 2)) {
    char v10 = -[NSData isEqual:](expressPassConfiguration, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_28:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_cancelOutstandingRequests;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_applicationIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_requestAuthorization;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v8 = [(NSData *)self->_expressPassInformation hash];
  return v7 ^ v8 ^ [(NSData *)self->_expressPassConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[NPKProtoSetExpressPassRequest setUniqueID:](self, "setUniqueID:");
    uint64_t v4 = v5;
  }
  if (v4[44])
  {
    self->_cancelOutstandingRequests = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoSetExpressPassRequest setApplicationIdentifier:](self, "setApplicationIdentifier:");
    uint64_t v4 = v5;
  }
  if ((v4[44] & 2) != 0)
  {
    self->_requestAuthorization = v4[41];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoSetExpressPassRequest setExpressPassInformation:](self, "setExpressPassInformation:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoSetExpressPassRequest setExpressPassConfiguration:](self, "setExpressPassConfiguration:");
    uint64_t v4 = v5;
  }
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (BOOL)cancelOutstandingRequests
{
  return self->_cancelOutstandingRequests;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (BOOL)requestAuthorization
{
  return self->_requestAuthorization;
}

- (NSData)expressPassInformation
{
  return self->_expressPassInformation;
}

- (void)setExpressPassInformation:(id)a3
{
}

- (NSData)expressPassConfiguration
{
  return self->_expressPassConfiguration;
}

- (void)setExpressPassConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_expressPassInformation, 0);
  objc_storeStrong((id *)&self->_expressPassConfiguration, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end