@interface PKProtobufShareableCredentialMessage
+ (Class)shareableCredentialsType;
- (BOOL)hasDataString;
- (BOOL)hasIsPassInLibrary;
- (BOOL)hasMessageCaption;
- (BOOL)hasPassThumbnailImage;
- (BOOL)hasPolicyIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPassInLibrary;
- (BOOL)readFrom:(id)a3;
- (NSData)passThumbnailImage;
- (NSMutableArray)shareableCredentials;
- (NSString)dataString;
- (NSString)messageCaption;
- (NSString)policyIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)shareableCredentialsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)shareableCredentialsCount;
- (unsigned)version;
- (void)addShareableCredentials:(id)a3;
- (void)clearShareableCredentials;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataString:(id)a3;
- (void)setHasIsPassInLibrary:(BOOL)a3;
- (void)setIsPassInLibrary:(BOOL)a3;
- (void)setMessageCaption:(id)a3;
- (void)setPassThumbnailImage:(id)a3;
- (void)setPolicyIdentifier:(id)a3;
- (void)setShareableCredentials:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufShareableCredentialMessage

- (void)clearShareableCredentials
{
}

- (void)addShareableCredentials:(id)a3
{
  id v4 = a3;
  shareableCredentials = self->_shareableCredentials;
  id v8 = v4;
  if (!shareableCredentials)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_shareableCredentials;
    self->_shareableCredentials = v6;

    id v4 = v8;
    shareableCredentials = self->_shareableCredentials;
  }
  [(NSMutableArray *)shareableCredentials addObject:v4];
}

- (unint64_t)shareableCredentialsCount
{
  return [(NSMutableArray *)self->_shareableCredentials count];
}

- (id)shareableCredentialsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_shareableCredentials objectAtIndex:a3];
}

+ (Class)shareableCredentialsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMessageCaption
{
  return self->_messageCaption != 0;
}

- (BOOL)hasDataString
{
  return self->_dataString != 0;
}

- (BOOL)hasPolicyIdentifier
{
  return self->_policyIdentifier != 0;
}

- (BOOL)hasPassThumbnailImage
{
  return self->_passThumbnailImage != 0;
}

- (void)setIsPassInLibrary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isPassInLibrary = a3;
}

- (void)setHasIsPassInLibrary:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPassInLibrary
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufShareableCredentialMessage;
  id v4 = [(PKProtobufShareableCredentialMessage *)&v8 description];
  v5 = [(PKProtobufShareableCredentialMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  if ([(NSMutableArray *)self->_shareableCredentials count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_shareableCredentials, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = self->_shareableCredentials;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"shareableCredentials"];
  }
  messageCaption = self->_messageCaption;
  if (messageCaption) {
    [v3 setObject:messageCaption forKey:@"messageCaption"];
  }
  dataString = self->_dataString;
  if (dataString) {
    [v3 setObject:dataString forKey:@"dataString"];
  }
  policyIdentifier = self->_policyIdentifier;
  if (policyIdentifier) {
    [v3 setObject:policyIdentifier forKey:@"policyIdentifier"];
  }
  passThumbnailImage = self->_passThumbnailImage;
  if (passThumbnailImage) {
    [v3 setObject:passThumbnailImage forKey:@"passThumbnailImage"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v16 = [NSNumber numberWithBool:self->_isPassInLibrary];
    [v3 setObject:v16 forKey:@"isPassInLibrary"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufShareableCredentialMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_shareableCredentials;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_messageCaption) {
    PBDataWriterWriteStringField();
  }
  if (self->_dataString) {
    PBDataWriterWriteStringField();
  }
  if (self->_policyIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_passThumbnailImage) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  v9[12] = self->_version;
  if ([(PKProtobufShareableCredentialMessage *)self shareableCredentialsCount])
  {
    [v9 clearShareableCredentials];
    unint64_t v4 = [(PKProtobufShareableCredentialMessage *)self shareableCredentialsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PKProtobufShareableCredentialMessage *)self shareableCredentialsAtIndex:i];
        [v9 addShareableCredentials:v7];
      }
    }
  }
  if (self->_messageCaption) {
    objc_msgSend(v9, "setMessageCaption:");
  }
  uint64_t v8 = v9;
  if (self->_dataString)
  {
    objc_msgSend(v9, "setDataString:");
    uint64_t v8 = v9;
  }
  if (self->_policyIdentifier)
  {
    objc_msgSend(v9, "setPolicyIdentifier:");
    uint64_t v8 = v9;
  }
  if (self->_passThumbnailImage)
  {
    objc_msgSend(v9, "setPassThumbnailImage:");
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[52] = self->_isPassInLibrary;
    v8[56] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 48) = self->_version;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = self->_shareableCredentials;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [(id)v5 addShareableCredentials:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_messageCaption copyWithZone:a3];
  long long v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_dataString copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  uint64_t v16 = [(NSString *)self->_policyIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  uint64_t v18 = [(NSData *)self->_passThumbnailImage copyWithZone:a3];
  long long v19 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 52) = self->_isPassInLibrary;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (self->_version != *((_DWORD *)v4 + 12)) {
    goto LABEL_15;
  }
  shareableCredentials = self->_shareableCredentials;
  if ((unint64_t)shareableCredentials | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](shareableCredentials, "isEqual:")) {
      goto LABEL_15;
    }
  }
  messageCaption = self->_messageCaption;
  if ((unint64_t)messageCaption | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](messageCaption, "isEqual:")) {
      goto LABEL_15;
    }
  }
  dataString = self->_dataString;
  if ((unint64_t)dataString | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](dataString, "isEqual:")) {
      goto LABEL_15;
    }
  }
  policyIdentifier = self->_policyIdentifier;
  if ((unint64_t)policyIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](policyIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  passThumbnailImage = self->_passThumbnailImage;
  if ((unint64_t)passThumbnailImage | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](passThumbnailImage, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0)
    {
LABEL_15:
      BOOL v10 = 0;
      goto LABEL_16;
    }
    if (self->_isPassInLibrary)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_15;
    }
    BOOL v10 = 1;
  }
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  uint64_t v4 = [(NSMutableArray *)self->_shareableCredentials hash];
  NSUInteger v5 = [(NSString *)self->_messageCaption hash];
  NSUInteger v6 = [(NSString *)self->_dataString hash];
  NSUInteger v7 = [(NSString *)self->_policyIdentifier hash];
  uint64_t v8 = [(NSData *)self->_passThumbnailImage hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_isPassInLibrary;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v5 ^ v6 ^ v7 ^ (2654435761 * version) ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 12);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PKProtobufShareableCredentialMessage addShareableCredentials:](self, "addShareableCredentials:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[PKProtobufShareableCredentialMessage setMessageCaption:](self, "setMessageCaption:");
  }
  if (*((void *)v4 + 1)) {
    -[PKProtobufShareableCredentialMessage setDataString:](self, "setDataString:");
  }
  if (*((void *)v4 + 4)) {
    -[PKProtobufShareableCredentialMessage setPolicyIdentifier:](self, "setPolicyIdentifier:");
  }
  if (*((void *)v4 + 3)) {
    -[PKProtobufShareableCredentialMessage setPassThumbnailImage:](self, "setPassThumbnailImage:");
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_isPassInLibrary = *((unsigned char *)v4 + 52);
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

- (NSMutableArray)shareableCredentials
{
  return self->_shareableCredentials;
}

- (void)setShareableCredentials:(id)a3
{
}

- (NSString)messageCaption
{
  return self->_messageCaption;
}

- (void)setMessageCaption:(id)a3
{
}

- (NSString)dataString
{
  return self->_dataString;
}

- (void)setDataString:(id)a3
{
}

- (NSString)policyIdentifier
{
  return self->_policyIdentifier;
}

- (void)setPolicyIdentifier:(id)a3
{
}

- (NSData)passThumbnailImage
{
  return self->_passThumbnailImage;
}

- (void)setPassThumbnailImage:(id)a3
{
}

- (BOOL)isPassInLibrary
{
  return self->_isPassInLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareableCredentials, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_messageCaption, 0);
  objc_storeStrong((id *)&self->_dataString, 0);
}

@end