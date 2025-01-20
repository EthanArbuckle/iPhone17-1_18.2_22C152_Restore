@interface NSPPrivacyProxyTransparencyOHTTPEntry
+ (Class)targetInformationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)keyConfiguration;
- (NSMutableArray)targetInformations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)targetInformationAtIndex:(unint64_t)a3;
- (unint64_t)configurationDeliveryEnd;
- (unint64_t)configurationDeliveryStart;
- (unint64_t)hash;
- (unint64_t)targetInformationsCount;
- (void)addTargetInformation:(id)a3;
- (void)clearTargetInformations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfigurationDeliveryEnd:(unint64_t)a3;
- (void)setConfigurationDeliveryStart:(unint64_t)a3;
- (void)setKeyConfiguration:(id)a3;
- (void)setTargetInformations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyTransparencyOHTTPEntry

- (void)clearTargetInformations
{
}

- (void)addTargetInformation:(id)a3
{
  id v4 = a3;
  targetInformations = self->_targetInformations;
  id v8 = v4;
  if (!targetInformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_targetInformations;
    self->_targetInformations = v6;

    id v4 = v8;
    targetInformations = self->_targetInformations;
  }
  [(NSMutableArray *)targetInformations addObject:v4];
}

- (unint64_t)targetInformationsCount
{
  return [(NSMutableArray *)self->_targetInformations count];
}

- (id)targetInformationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_targetInformations objectAtIndex:a3];
}

+ (Class)targetInformationType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTransparencyOHTTPEntry;
  id v4 = [(NSPPrivacyProxyTransparencyOHTTPEntry *)&v8 description];
  v5 = [(NSPPrivacyProxyTransparencyOHTTPEntry *)self dictionaryRepresentation];
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

  if ([(NSMutableArray *)self->_targetInformations count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_targetInformations, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = self->_targetInformations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"targetInformation"];
  }
  keyConfiguration = self->_keyConfiguration;
  if (keyConfiguration) {
    [v3 setObject:keyConfiguration forKey:@"keyConfiguration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTransparencyOHTTPEntryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_targetInformations;
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

  if (!self->_keyConfiguration) {
    __assert_rtn("-[NSPPrivacyProxyTransparencyOHTTPEntry writeTo:]", "NSPPrivacyProxyTransparencyOHTTPEntry.m", 170, "nil != self->_keyConfiguration");
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[2] = self->_configurationDeliveryStart;
  id v9 = v4;
  v4[1] = self->_configurationDeliveryEnd;
  if ([(NSPPrivacyProxyTransparencyOHTTPEntry *)self targetInformationsCount])
  {
    [v9 clearTargetInformations];
    unint64_t v5 = [(NSPPrivacyProxyTransparencyOHTTPEntry *)self targetInformationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSPPrivacyProxyTransparencyOHTTPEntry *)self targetInformationAtIndex:i];
        [v9 addTargetInformation:v8];
      }
    }
  }
  [v9 setKeyConfiguration:self->_keyConfiguration];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_configurationDeliveryStart;
  v5[1] = self->_configurationDeliveryEnd;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v6 = self->_targetInformations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addTargetInformation:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_keyConfiguration copyWithZone:a3];
  long long v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_configurationDeliveryStart == v4[2]
    && self->_configurationDeliveryEnd == v4[1]
    && ((targetInformations = self->_targetInformations, !((unint64_t)targetInformations | v4[4]))
     || -[NSMutableArray isEqual:](targetInformations, "isEqual:")))
  {
    keyConfiguration = self->_keyConfiguration;
    if ((unint64_t)keyConfiguration | v4[3]) {
      char v7 = -[NSData isEqual:](keyConfiguration, "isEqual:");
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
  uint64_t v4 = [(NSMutableArray *)self->_targetInformations hash];
  return v3 ^ v4 ^ [(NSData *)self->_keyConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_configurationDeliveryStart = *((void *)v4 + 2);
  self->_configurationDeliveryEnd = *((void *)v4 + 1);
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
        -[NSPPrivacyProxyTransparencyOHTTPEntry addTargetInformation:](self, "addTargetInformation:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[NSPPrivacyProxyTransparencyOHTTPEntry setKeyConfiguration:](self, "setKeyConfiguration:");
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

- (NSMutableArray)targetInformations
{
  return self->_targetInformations;
}

- (void)setTargetInformations:(id)a3
{
}

- (NSData)keyConfiguration
{
  return self->_keyConfiguration;
}

- (void)setKeyConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetInformations, 0);
  objc_storeStrong((id *)&self->_keyConfiguration, 0);
}

@end