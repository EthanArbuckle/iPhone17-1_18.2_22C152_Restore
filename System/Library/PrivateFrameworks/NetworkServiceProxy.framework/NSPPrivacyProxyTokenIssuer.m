@interface NSPPrivacyProxyTokenIssuer
+ (Class)tokenKeysType;
- (BOOL)hasTransparencyInternalProof;
- (BOOL)hasTransparencyKeyBundle;
- (BOOL)hasTransparencyProof;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)transparencyInternalProof;
- (NSData)transparencyKeyBundle;
- (NSData)transparencyProof;
- (NSMutableArray)tokenKeys;
- (NSString)issuerName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tokenKeysAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tokenKeysCount;
- (void)addTokenKeys:(id)a3;
- (void)clearTokenKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIssuerName:(id)a3;
- (void)setTokenKeys:(id)a3;
- (void)setTransparencyInternalProof:(id)a3;
- (void)setTransparencyKeyBundle:(id)a3;
- (void)setTransparencyProof:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyTokenIssuer

- (void)clearTokenKeys
{
}

- (void)addTokenKeys:(id)a3
{
  id v4 = a3;
  tokenKeys = self->_tokenKeys;
  id v8 = v4;
  if (!tokenKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_tokenKeys;
    self->_tokenKeys = v6;

    id v4 = v8;
    tokenKeys = self->_tokenKeys;
  }
  [(NSMutableArray *)tokenKeys addObject:v4];
}

- (unint64_t)tokenKeysCount
{
  return [(NSMutableArray *)self->_tokenKeys count];
}

- (id)tokenKeysAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tokenKeys objectAtIndex:a3];
}

+ (Class)tokenKeysType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTransparencyKeyBundle
{
  return self->_transparencyKeyBundle != 0;
}

- (BOOL)hasTransparencyProof
{
  return self->_transparencyProof != 0;
}

- (BOOL)hasTransparencyInternalProof
{
  return self->_transparencyInternalProof != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTokenIssuer;
  id v4 = [(NSPPrivacyProxyTokenIssuer *)&v8 description];
  v5 = [(NSPPrivacyProxyTokenIssuer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  issuerName = self->_issuerName;
  if (issuerName) {
    [v3 setObject:issuerName forKey:@"issuerName"];
  }
  if ([(NSMutableArray *)self->_tokenKeys count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_tokenKeys, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = self->_tokenKeys;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"tokenKeys"];
  }
  transparencyKeyBundle = self->_transparencyKeyBundle;
  if (transparencyKeyBundle) {
    [v4 setObject:transparencyKeyBundle forKey:@"transparencyKeyBundle"];
  }
  transparencyProof = self->_transparencyProof;
  if (transparencyProof) {
    [v4 setObject:transparencyProof forKey:@"transparencyProof"];
  }
  transparencyInternalProof = self->_transparencyInternalProof;
  if (transparencyInternalProof) {
    [v4 setObject:transparencyInternalProof forKey:@"transparencyInternalProof"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenIssuerReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_issuerName) {
    __assert_rtn("-[NSPPrivacyProxyTokenIssuer writeTo:]", "NSPPrivacyProxyTokenIssuer.m", 186, "nil != self->_issuerName");
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_tokenKeys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_transparencyKeyBundle) {
    PBDataWriterWriteDataField();
  }
  if (self->_transparencyProof) {
    PBDataWriterWriteDataField();
  }
  if (self->_transparencyInternalProof) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [v9 setIssuerName:self->_issuerName];
  if ([(NSPPrivacyProxyTokenIssuer *)self tokenKeysCount])
  {
    [v9 clearTokenKeys];
    unint64_t v4 = [(NSPPrivacyProxyTokenIssuer *)self tokenKeysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSPPrivacyProxyTokenIssuer *)self tokenKeysAtIndex:i];
        [v9 addTokenKeys:v7];
      }
    }
  }
  if (self->_transparencyKeyBundle) {
    objc_msgSend(v9, "setTransparencyKeyBundle:");
  }
  uint64_t v8 = v9;
  if (self->_transparencyProof)
  {
    objc_msgSend(v9, "setTransparencyProof:");
    uint64_t v8 = v9;
  }
  if (self->_transparencyInternalProof)
  {
    objc_msgSend(v9, "setTransparencyInternalProof:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_issuerName copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_tokenKeys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v12), "copyWithZone:", a3, (void)v21);
        [v5 addTokenKeys:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_transparencyKeyBundle copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  uint64_t v16 = [(NSData *)self->_transparencyProof copyWithZone:a3];
  long long v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSData *)self->_transparencyInternalProof copyWithZone:a3];
  long long v19 = (void *)v5[3];
  v5[3] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((issuerName = self->_issuerName, !((unint64_t)issuerName | v4[1]))
     || -[NSString isEqual:](issuerName, "isEqual:"))
    && ((tokenKeys = self->_tokenKeys, !((unint64_t)tokenKeys | v4[2]))
     || -[NSMutableArray isEqual:](tokenKeys, "isEqual:"))
    && ((transparencyKeyBundle = self->_transparencyKeyBundle, !((unint64_t)transparencyKeyBundle | v4[4]))
     || -[NSData isEqual:](transparencyKeyBundle, "isEqual:"))
    && ((transparencyProof = self->_transparencyProof, !((unint64_t)transparencyProof | v4[5]))
     || -[NSData isEqual:](transparencyProof, "isEqual:")))
  {
    transparencyInternalProof = self->_transparencyInternalProof;
    if ((unint64_t)transparencyInternalProof | v4[3]) {
      char v10 = -[NSData isEqual:](transparencyInternalProof, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_issuerName hash];
  uint64_t v4 = [(NSMutableArray *)self->_tokenKeys hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_transparencyKeyBundle hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_transparencyProof hash];
  return v6 ^ [(NSData *)self->_transparencyInternalProof hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NSPPrivacyProxyTokenIssuer setIssuerName:](self, "setIssuerName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[NSPPrivacyProxyTokenIssuer addTokenKeys:](self, "addTokenKeys:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 4)) {
    -[NSPPrivacyProxyTokenIssuer setTransparencyKeyBundle:](self, "setTransparencyKeyBundle:");
  }
  if (*((void *)v4 + 5)) {
    -[NSPPrivacyProxyTokenIssuer setTransparencyProof:](self, "setTransparencyProof:");
  }
  if (*((void *)v4 + 3)) {
    -[NSPPrivacyProxyTokenIssuer setTransparencyInternalProof:](self, "setTransparencyInternalProof:");
  }
}

- (NSString)issuerName
{
  return self->_issuerName;
}

- (void)setIssuerName:(id)a3
{
}

- (NSMutableArray)tokenKeys
{
  return self->_tokenKeys;
}

- (void)setTokenKeys:(id)a3
{
}

- (NSData)transparencyKeyBundle
{
  return self->_transparencyKeyBundle;
}

- (void)setTransparencyKeyBundle:(id)a3
{
}

- (NSData)transparencyProof
{
  return self->_transparencyProof;
}

- (void)setTransparencyProof:(id)a3
{
}

- (NSData)transparencyInternalProof
{
  return self->_transparencyInternalProof;
}

- (void)setTransparencyInternalProof:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyProof, 0);
  objc_storeStrong((id *)&self->_transparencyKeyBundle, 0);
  objc_storeStrong((id *)&self->_transparencyInternalProof, 0);
  objc_storeStrong((id *)&self->_tokenKeys, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end