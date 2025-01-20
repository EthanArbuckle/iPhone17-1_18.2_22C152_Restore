@interface NARPBLocalizationInfo
+ (Class)keyType;
+ (Class)localizedValueType;
- (BOOL)hasLocalization;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)keys;
- (NSMutableArray)localizedValues;
- (NSString)localization;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyAtIndex:(unint64_t)a3;
- (id)localizedValueAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keysCount;
- (unint64_t)localizedValuesCount;
- (void)addKey:(id)a3;
- (void)addLocalizedValue:(id)a3;
- (void)clearKeys;
- (void)clearLocalizedValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKeys:(id)a3;
- (void)setLocalization:(id)a3;
- (void)setLocalizedValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NARPBLocalizationInfo

- (BOOL)hasLocalization
{
  return self->_localization != 0;
}

- (void)clearKeys
{
}

- (void)addKey:(id)a3
{
  id v4 = a3;
  keys = self->_keys;
  id v8 = v4;
  if (!keys)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_keys;
    self->_keys = v6;

    id v4 = v8;
    keys = self->_keys;
  }
  [(NSMutableArray *)keys addObject:v4];
}

- (unint64_t)keysCount
{
  return (unint64_t)[(NSMutableArray *)self->_keys count];
}

- (id)keyAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_keys objectAtIndex:a3];
}

+ (Class)keyType
{
  return (Class)objc_opt_class();
}

- (void)clearLocalizedValues
{
}

- (void)addLocalizedValue:(id)a3
{
  id v4 = a3;
  localizedValues = self->_localizedValues;
  id v8 = v4;
  if (!localizedValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_localizedValues;
    self->_localizedValues = v6;

    id v4 = v8;
    localizedValues = self->_localizedValues;
  }
  [(NSMutableArray *)localizedValues addObject:v4];
}

- (unint64_t)localizedValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_localizedValues count];
}

- (id)localizedValueAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_localizedValues objectAtIndex:a3];
}

+ (Class)localizedValueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NARPBLocalizationInfo;
  v3 = [(NARPBLocalizationInfo *)&v7 description];
  id v4 = [(NARPBLocalizationInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  localization = self->_localization;
  if (localization) {
    [v3 setObject:localization forKey:@"localization"];
  }
  keys = self->_keys;
  if (keys) {
    [v4 setObject:keys forKey:@"key"];
  }
  localizedValues = self->_localizedValues;
  if (localizedValues) {
    [v4 setObject:localizedValues forKey:@"localizedValue"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000B7FC(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_localization) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_keys;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_localizedValues;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_localization) {
    objc_msgSend(v12, "setLocalization:");
  }
  if ([(NARPBLocalizationInfo *)self keysCount])
  {
    [v12 clearKeys];
    unint64_t v4 = [(NARPBLocalizationInfo *)self keysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(NARPBLocalizationInfo *)self keyAtIndex:i];
        [v12 addKey:v7];
      }
    }
  }
  if ([(NARPBLocalizationInfo *)self localizedValuesCount])
  {
    [v12 clearLocalizedValues];
    unint64_t v8 = [(NARPBLocalizationInfo *)self localizedValuesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(NARPBLocalizationInfo *)self localizedValueAtIndex:j];
        [v12 addLocalizedValue:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_localization copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_keys;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addKey:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_localizedValues;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      long long v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v18), "copyWithZone:", a3, (void)v21);
        [v5 addLocalizedValue:v19];

        long long v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((localization = self->_localization, !((unint64_t)localization | v4[2]))
     || -[NSString isEqual:](localization, "isEqual:"))
    && ((keys = self->_keys, !((unint64_t)keys | v4[1]))
     || -[NSMutableArray isEqual:](keys, "isEqual:")))
  {
    localizedValues = self->_localizedValues;
    if ((unint64_t)localizedValues | v4[3]) {
      unsigned __int8 v8 = -[NSMutableArray isEqual:](localizedValues, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_localization hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_keys hash] ^ v3;
  return v4 ^ (unint64_t)[(NSMutableArray *)self->_localizedValues hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NARPBLocalizationInfo setLocalization:](self, "setLocalization:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NARPBLocalizationInfo *)self addKey:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NARPBLocalizationInfo addLocalizedValue:](self, "addLocalizedValue:", *(void *)(*((void *)&v15 + 1) + 8 * (void)j), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)localization
{
  return self->_localization;
}

- (void)setLocalization:(id)a3
{
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (NSMutableArray)localizedValues
{
  return self->_localizedValues;
}

- (void)setLocalizedValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedValues, 0);
  objc_storeStrong((id *)&self->_localization, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

@end