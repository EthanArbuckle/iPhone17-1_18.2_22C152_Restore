@interface BackupStatusMessage
+ (Class)keysAndValuesType;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)keysAndValues;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keysAndValuesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keysAndValuesCount;
- (void)addKeysAndValues:(id)a3;
- (void)clearKeysAndValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setKeysAndValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BackupStatusMessage

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)clearKeysAndValues
{
}

- (void)addKeysAndValues:(id)a3
{
  id v4 = a3;
  keysAndValues = self->_keysAndValues;
  id v8 = v4;
  if (!keysAndValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_keysAndValues;
    self->_keysAndValues = v6;

    id v4 = v8;
    keysAndValues = self->_keysAndValues;
  }
  [(NSMutableArray *)keysAndValues addObject:v4];
}

- (unint64_t)keysAndValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_keysAndValues count];
}

- (id)keysAndValuesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_keysAndValues objectAtIndex:a3];
}

+ (Class)keysAndValuesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BackupStatusMessage;
  v3 = [(BackupStatusMessage *)&v7 description];
  id v4 = [(BackupStatusMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if ([(NSMutableArray *)self->_keysAndValues count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_keysAndValues, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v7 = self->_keysAndValues;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"keysAndValues"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BackupStatusMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_key) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_keysAndValues;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_key) {
    objc_msgSend(v8, "setKey:");
  }
  if ([(BackupStatusMessage *)self keysAndValuesCount])
  {
    [v8 clearKeysAndValues];
    unint64_t v4 = [(BackupStatusMessage *)self keysAndValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(BackupStatusMessage *)self keysAndValuesAtIndex:i];
        [v8 addKeysAndValues:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_keysAndValues;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "copyWithZone:", a3, (void)v15);
        [v5 addKeysAndValues:v13];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    keysAndValues = self->_keysAndValues;
    if ((unint64_t)keysAndValues | v4[2]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](keysAndValues, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  return (unint64_t)[(NSMutableArray *)self->_keysAndValues hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[BackupStatusMessage setKey:](self, "setKey:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[BackupStatusMessage addKeysAndValues:](self, "addKeysAndValues:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSMutableArray)keysAndValues
{
  return self->_keysAndValues;
}

- (void)setKeysAndValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysAndValues, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end