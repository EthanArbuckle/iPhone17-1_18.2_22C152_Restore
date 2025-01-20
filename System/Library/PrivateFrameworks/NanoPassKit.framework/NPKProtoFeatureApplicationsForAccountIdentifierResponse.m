@interface NPKProtoFeatureApplicationsForAccountIdentifierResponse
+ (Class)deprecatedFeatureApplicationsType;
+ (Class)featureApplicationsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)deprecatedFeatureApplications;
- (NSMutableArray)featureApplications;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deprecatedFeatureApplicationsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureApplicationsAtIndex:(unint64_t)a3;
- (unint64_t)deprecatedFeatureApplicationsCount;
- (unint64_t)featureApplicationsCount;
- (unint64_t)hash;
- (void)addDeprecatedFeatureApplications:(id)a3;
- (void)addFeatureApplications:(id)a3;
- (void)clearDeprecatedFeatureApplications;
- (void)clearFeatureApplications;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeprecatedFeatureApplications:(id)a3;
- (void)setFeatureApplications:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoFeatureApplicationsForAccountIdentifierResponse

- (void)clearDeprecatedFeatureApplications
{
}

- (void)addDeprecatedFeatureApplications:(id)a3
{
  id v4 = a3;
  deprecatedFeatureApplications = self->_deprecatedFeatureApplications;
  id v8 = v4;
  if (!deprecatedFeatureApplications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_deprecatedFeatureApplications;
    self->_deprecatedFeatureApplications = v6;

    id v4 = v8;
    deprecatedFeatureApplications = self->_deprecatedFeatureApplications;
  }
  [(NSMutableArray *)deprecatedFeatureApplications addObject:v4];
}

- (unint64_t)deprecatedFeatureApplicationsCount
{
  return [(NSMutableArray *)self->_deprecatedFeatureApplications count];
}

- (id)deprecatedFeatureApplicationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_deprecatedFeatureApplications objectAtIndex:a3];
}

+ (Class)deprecatedFeatureApplicationsType
{
  return (Class)objc_opt_class();
}

- (void)clearFeatureApplications
{
}

- (void)addFeatureApplications:(id)a3
{
  id v4 = a3;
  featureApplications = self->_featureApplications;
  id v8 = v4;
  if (!featureApplications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_featureApplications;
    self->_featureApplications = v6;

    id v4 = v8;
    featureApplications = self->_featureApplications;
  }
  [(NSMutableArray *)featureApplications addObject:v4];
}

- (unint64_t)featureApplicationsCount
{
  return [(NSMutableArray *)self->_featureApplications count];
}

- (id)featureApplicationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_featureApplications objectAtIndex:a3];
}

+ (Class)featureApplicationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoFeatureApplicationsForAccountIdentifierResponse;
  id v4 = [(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)&v8 description];
  v5 = [(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  deprecatedFeatureApplications = self->_deprecatedFeatureApplications;
  if (deprecatedFeatureApplications) {
    [v3 setObject:deprecatedFeatureApplications forKey:@"deprecatedFeatureApplications"];
  }
  featureApplications = self->_featureApplications;
  if (featureApplications) {
    [v4 setObject:featureApplications forKey:@"featureApplications"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoFeatureApplicationsForAccountIdentifierResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_deprecatedFeatureApplications;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_featureApplications;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)self deprecatedFeatureApplicationsCount])
  {
    [v12 clearDeprecatedFeatureApplications];
    unint64_t v4 = [(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)self deprecatedFeatureApplicationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)self deprecatedFeatureApplicationsAtIndex:i];
        [v12 addDeprecatedFeatureApplications:v7];
      }
    }
  }
  if ([(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)self featureApplicationsCount])
  {
    [v12 clearFeatureApplications];
    unint64_t v8 = [(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)self featureApplicationsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)self featureApplicationsAtIndex:j];
        [v12 addFeatureApplications:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_deprecatedFeatureApplications;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addDeprecatedFeatureApplications:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_featureApplications;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addFeatureApplications:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((deprecatedFeatureApplications = self->_deprecatedFeatureApplications,
         !((unint64_t)deprecatedFeatureApplications | v4[1]))
     || -[NSMutableArray isEqual:](deprecatedFeatureApplications, "isEqual:")))
  {
    featureApplications = self->_featureApplications;
    if ((unint64_t)featureApplications | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](featureApplications, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_deprecatedFeatureApplications hash];
  return [(NSMutableArray *)self->_featureApplications hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPKProtoFeatureApplicationsForAccountIdentifierResponse *)self addDeprecatedFeatureApplications:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NPKProtoFeatureApplicationsForAccountIdentifierResponse addFeatureApplications:](self, "addFeatureApplications:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)deprecatedFeatureApplications
{
  return self->_deprecatedFeatureApplications;
}

- (void)setDeprecatedFeatureApplications:(id)a3
{
}

- (NSMutableArray)featureApplications
{
  return self->_featureApplications;
}

- (void)setFeatureApplications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureApplications, 0);
  objc_storeStrong((id *)&self->_deprecatedFeatureApplications, 0);
}

@end