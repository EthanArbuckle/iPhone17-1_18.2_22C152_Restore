@interface NSPPrivacyProxyTransparencyTokenEntry
+ (Class)tokenKeysType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tokenKeys;
- (NSString)issuerName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tokenKeysAtIndex:(unint64_t)a3;
- (unint64_t)configurationDeliveryEnd;
- (unint64_t)configurationDeliveryStart;
- (unint64_t)hash;
- (unint64_t)tokenKeysCount;
- (void)addTokenKeys:(id)a3;
- (void)clearTokenKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfigurationDeliveryEnd:(unint64_t)a3;
- (void)setConfigurationDeliveryStart:(unint64_t)a3;
- (void)setIssuerName:(id)a3;
- (void)setTokenKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyTransparencyTokenEntry

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

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTransparencyTokenEntry;
  id v4 = [(NSPPrivacyProxyTransparencyTokenEntry *)&v8 description];
  v5 = [(NSPPrivacyProxyTransparencyTokenEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_configurationDeliveryStart];
  [v3 setObject:v4 forKey:@"configurationDeliveryStart"];

  v5 = [NSNumber numberWithUnsignedLongLong:self->_configurationDeliveryEnd];
  [v3 setObject:v5 forKey:@"configurationDeliveryEnd"];

  issuerName = self->_issuerName;
  if (issuerName) {
    [v3 setObject:issuerName forKey:@"issuerName"];
  }
  if ([(NSMutableArray *)self->_tokenKeys count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_tokenKeys, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_tokenKeys;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"tokenKeys"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTransparencyTokenEntryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  if (!self->_issuerName) {
    __assert_rtn("-[NSPPrivacyProxyTransparencyTokenEntry writeTo:]", "NSPPrivacyProxyTransparencyTokenEntry.m", 163, "nil != self->_issuerName");
  }
  PBDataWriterWriteStringField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_tokenKeys;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[2] = self->_configurationDeliveryStart;
  v4[1] = self->_configurationDeliveryEnd;
  id v9 = v4;
  [v4 setIssuerName:self->_issuerName];
  if ([(NSPPrivacyProxyTransparencyTokenEntry *)self tokenKeysCount])
  {
    [v9 clearTokenKeys];
    unint64_t v5 = [(NSPPrivacyProxyTransparencyTokenEntry *)self tokenKeysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSPPrivacyProxyTransparencyTokenEntry *)self tokenKeysAtIndex:i];
        [v9 addTokenKeys:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_configurationDeliveryStart;
  v5[1] = self->_configurationDeliveryEnd;
  uint64_t v6 = [(NSString *)self->_issuerName copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_tokenKeys;
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
        [v5 addTokenKeys:v13];

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
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_configurationDeliveryStart == v4[2]
    && self->_configurationDeliveryEnd == v4[1]
    && ((issuerName = self->_issuerName, !((unint64_t)issuerName | v4[3]))
     || -[NSString isEqual:](issuerName, "isEqual:")))
  {
    tokenKeys = self->_tokenKeys;
    if ((unint64_t)tokenKeys | v4[4]) {
      char v7 = -[NSMutableArray isEqual:](tokenKeys, "isEqual:");
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
  unint64_t v3 = (2654435761u * self->_configurationDeliveryEnd) ^ (2654435761u * self->_configurationDeliveryStart);
  NSUInteger v4 = [(NSString *)self->_issuerName hash];
  return v3 ^ v4 ^ [(NSMutableArray *)self->_tokenKeys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_configurationDeliveryStart = *((void *)v4 + 2);
  self->_configurationDeliveryEnd = *((void *)v4 + 1);
  if (*((void *)v4 + 3)) {
    -[NSPPrivacyProxyTransparencyTokenEntry setIssuerName:](self, "setIssuerName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 4);
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
        -[NSPPrivacyProxyTransparencyTokenEntry addTokenKeys:](self, "addTokenKeys:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)configurationDeliveryStart
{
  return self->_configurationDeliveryStart;
}

- (void)setConfigurationDeliveryStart:(unint64_t)a3
{
  self->_configurationDeliveryStart = a3;
}

- (unint64_t)configurationDeliveryEnd
{
  return self->_configurationDeliveryEnd;
}

- (void)setConfigurationDeliveryEnd:(unint64_t)a3
{
  self->_configurationDeliveryEnd = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenKeys, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end