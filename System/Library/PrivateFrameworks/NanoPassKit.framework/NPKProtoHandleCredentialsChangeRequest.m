@interface NPKProtoHandleCredentialsChangeRequest
+ (Class)credentialsBytesType;
- (BOOL)hasPassID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)credentialsBytes;
- (NSString)passID;
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
- (void)setPassID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoHandleCredentialsChangeRequest

- (BOOL)hasPassID
{
  return self->_passID != 0;
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
  v8.super_class = (Class)NPKProtoHandleCredentialsChangeRequest;
  id v4 = [(NPKProtoHandleCredentialsChangeRequest *)&v8 description];
  v5 = [(NPKProtoHandleCredentialsChangeRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  passID = self->_passID;
  if (passID) {
    [v3 setObject:passID forKey:@"passID"];
  }
  credentialsBytes = self->_credentialsBytes;
  if (credentialsBytes) {
    [v4 setObject:credentialsBytes forKey:@"credentialsBytes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoHandleCredentialsChangeRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_passID) {
    PBDataWriterWriteStringField();
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
  id v8 = a3;
  if (self->_passID) {
    objc_msgSend(v8, "setPassID:");
  }
  if ([(NPKProtoHandleCredentialsChangeRequest *)self credentialsBytesCount])
  {
    [v8 clearCredentialsBytes];
    unint64_t v4 = [(NPKProtoHandleCredentialsChangeRequest *)self credentialsBytesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoHandleCredentialsChangeRequest *)self credentialsBytesAtIndex:i];
        [v8 addCredentialsBytes:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passID copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_credentialsBytes;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addCredentialsBytes:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((passID = self->_passID, !((unint64_t)passID | v4[2]))
     || -[NSString isEqual:](passID, "isEqual:")))
  {
    credentialsBytes = self->_credentialsBytes;
    if ((unint64_t)credentialsBytes | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](credentialsBytes, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passID hash];
  return [(NSMutableArray *)self->_credentialsBytes hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKProtoHandleCredentialsChangeRequest setPassID:](self, "setPassID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[NPKProtoHandleCredentialsChangeRequest addCredentialsBytes:](self, "addCredentialsBytes:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
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
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_credentialsBytes, 0);
}

@end