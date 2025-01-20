@interface NTPBLanguageBucket
+ (Class)valuesType;
- (BOOL)hasGroupingFlags;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)values;
- (NSString)key;
- (NTPBGroupingFlags)groupingFlags;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valuesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)addValues:(id)a3;
- (void)clearValues;
- (void)mergeFrom:(id)a3;
- (void)setGroupingFlags:(id)a3;
- (void)setKey:(id)a3;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBLanguageBucket

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)clearValues
{
}

- (void)addValues:(id)a3
{
  id v4 = a3;
  values = self->_values;
  id v8 = v4;
  if (!values)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_values;
    self->_values = v6;

    id v4 = v8;
    values = self->_values;
  }
  [(NSMutableArray *)values addObject:v4];
}

- (unint64_t)valuesCount
{
  return [(NSMutableArray *)self->_values count];
}

- (id)valuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_values objectAtIndex:a3];
}

+ (Class)valuesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGroupingFlags
{
  return self->_groupingFlags != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBLanguageBucket;
  id v4 = [(NTPBLanguageBucket *)&v8 description];
  v5 = [(NTPBLanguageBucket *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  values = self->_values;
  if (values) {
    [v4 setObject:values forKey:@"values"];
  }
  groupingFlags = self->_groupingFlags;
  if (groupingFlags)
  {
    objc_super v8 = [(NTPBGroupingFlags *)groupingFlags dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"grouping_flags"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLanguageBucketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_key) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_values;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_groupingFlags) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_values;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [v5 addValues:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v14 = [(NTPBGroupingFlags *)self->_groupingFlags copyWithZone:a3];
  uint64_t v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:"))
    && ((values = self->_values, !((unint64_t)values | v4[3]))
     || -[NSMutableArray isEqual:](values, "isEqual:")))
  {
    groupingFlags = self->_groupingFlags;
    if ((unint64_t)groupingFlags | v4[1]) {
      char v8 = -[NTPBGroupingFlags isEqual:](groupingFlags, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  uint64_t v4 = [(NSMutableArray *)self->_values hash] ^ v3;
  return v4 ^ [(NTPBGroupingFlags *)self->_groupingFlags hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NTPBLanguageBucket setKey:](self, "setKey:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NTPBLanguageBucket addValues:](self, "addValues:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  groupingFlags = self->_groupingFlags;
  uint64_t v11 = *((void *)v4 + 1);
  if (groupingFlags)
  {
    if (v11) {
      -[NTPBGroupingFlags mergeFrom:](groupingFlags, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[NTPBLanguageBucket setGroupingFlags:](self, "setGroupingFlags:");
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (NTPBGroupingFlags)groupingFlags
{
  return self->_groupingFlags;
}

- (void)setGroupingFlags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_groupingFlags, 0);
}

@end