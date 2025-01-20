@interface NPKProtoAddSecureElementPassWithPropertiesResponse
+ (Class)credentialsBytesType;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSMutableArray)credentialsBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialsBytesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)credentialsBytesCount;
- (unint64_t)hash;
- (void)addCredentialsBytes:(id)a3;
- (void)clearCredentialsBytes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialsBytes:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAddSecureElementPassWithPropertiesResponse

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearCredentialsBytes
{
}

- (void)addCredentialsBytes:(id)a3
{
  id v4 = a3;
  credentialsBytes = self->_credentialsBytes;
  id v8 = v4;
  if (!credentialsBytes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_credentialsBytes;
    self->_credentialsBytes = v6;

    id v4 = v8;
    credentialsBytes = self->_credentialsBytes;
  }
  [(NSMutableArray *)credentialsBytes addObject:v4];
}

- (unint64_t)credentialsBytesCount
{
  return [(NSMutableArray *)self->_credentialsBytes count];
}

- (id)credentialsBytesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_credentialsBytes objectAtIndex:a3];
}

+ (Class)credentialsBytesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAddSecureElementPassWithPropertiesResponse;
  id v4 = [(NPKProtoAddSecureElementPassWithPropertiesResponse *)&v8 description];
  v5 = [(NPKProtoAddSecureElementPassWithPropertiesResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v4 forKey:@"success"];
  }
  credentialsBytes = self->_credentialsBytes;
  if (credentialsBytes) {
    [v3 setObject:credentialsBytes forKey:@"credentialsBytes"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAddSecureElementPassWithPropertiesResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_credentialsBytes;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_success;
    v4[20] |= 1u;
  }
  id v9 = v4;
  if ([(NPKProtoAddSecureElementPassWithPropertiesResponse *)self credentialsBytesCount])
  {
    [v9 clearCredentialsBytes];
    unint64_t v5 = [(NPKProtoAddSecureElementPassWithPropertiesResponse *)self credentialsBytesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NPKProtoAddSecureElementPassWithPropertiesResponse *)self credentialsBytesAtIndex:i];
        [v9 addCredentialsBytes:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_success;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_credentialsBytes;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addCredentialsBytes:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_success)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  credentialsBytes = self->_credentialsBytes;
  if ((unint64_t)credentialsBytes | *((void *)v4 + 1)) {
    char v5 = -[NSMutableArray isEqual:](credentialsBytes, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_success;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_credentialsBytes hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_success = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NPKProtoAddSecureElementPassWithPropertiesResponse addCredentialsBytes:](self, "addCredentialsBytes:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)success
{
  return self->_success;
}

- (NSMutableArray)credentialsBytes
{
  return self->_credentialsBytes;
}

- (void)setCredentialsBytes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end