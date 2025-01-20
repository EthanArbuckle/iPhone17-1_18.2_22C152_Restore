@interface SIRINLUINTERNALOverrideCollection
+ (Class)componentOverridesType;
+ (Class)parseOverridesType;
- (BOOL)hasAssetId;
- (BOOL)hasCreationTimestampMsSinceUnixEpoch;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)componentOverrides;
- (NSMutableArray)parseOverrides;
- (NSString)assetId;
- (NSString)version;
- (id)componentOverridesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parseOverridesAtIndex:(unint64_t)a3;
- (unint64_t)componentOverridesCount;
- (unint64_t)creationTimestampMsSinceUnixEpoch;
- (unint64_t)hash;
- (unint64_t)parseOverridesCount;
- (void)addComponentOverrides:(id)a3;
- (void)addParseOverrides:(id)a3;
- (void)clearComponentOverrides;
- (void)clearParseOverrides;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetId:(id)a3;
- (void)setComponentOverrides:(id)a3;
- (void)setCreationTimestampMsSinceUnixEpoch:(unint64_t)a3;
- (void)setHasCreationTimestampMsSinceUnixEpoch:(BOOL)a3;
- (void)setParseOverrides:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALOverrideCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_parseOverrides, 0);
  objc_storeStrong((id *)&self->_componentOverrides, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
}

- (void)setComponentOverrides:(id)a3
{
}

- (NSMutableArray)componentOverrides
{
  return self->_componentOverrides;
}

- (void)setParseOverrides:(id)a3
{
}

- (NSMutableArray)parseOverrides
{
  return self->_parseOverrides;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setAssetId:(id)a3
{
}

- (NSString)assetId
{
  return self->_assetId;
}

- (unint64_t)creationTimestampMsSinceUnixEpoch
{
  return self->_creationTimestampMsSinceUnixEpoch;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if (v4[6])
  {
    self->_creationTimestampMsSinceUnixEpoch = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2]) {
    -[SIRINLUINTERNALOverrideCollection setAssetId:](self, "setAssetId:");
  }
  if (*((void *)v5 + 5)) {
    -[SIRINLUINTERNALOverrideCollection setVersion:](self, "setVersion:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v5 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SIRINLUINTERNALOverrideCollection *)self addParseOverrides:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 3);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SIRINLUINTERNALOverrideCollection addComponentOverrides:](self, "addComponentOverrides:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_creationTimestampMsSinceUnixEpoch;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_assetId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_version hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_parseOverrides hash];
  return v6 ^ [(NSMutableArray *)self->_componentOverrides hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_creationTimestampMsSinceUnixEpoch != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  assetId = self->_assetId;
  if ((unint64_t)assetId | *((void *)v4 + 2) && !-[NSString isEqual:](assetId, "isEqual:")) {
    goto LABEL_15;
  }
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](version, "isEqual:")) {
      goto LABEL_15;
    }
  }
  parseOverrides = self->_parseOverrides;
  if ((unint64_t)parseOverrides | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](parseOverrides, "isEqual:")) {
      goto LABEL_15;
    }
  }
  componentOverrides = self->_componentOverrides;
  if ((unint64_t)componentOverrides | *((void *)v4 + 3)) {
    char v9 = -[NSMutableArray isEqual:](componentOverrides, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_creationTimestampMsSinceUnixEpoch;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_assetId copyWithZone:a3];
  uint64_t v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_version copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = self->_parseOverrides;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v15) copyWithZone:a3];
        [v6 addParseOverrides:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v17 = self->_componentOverrides;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (void)v24);
        [v6 addComponentOverrides:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_creationTimestampMsSinceUnixEpoch;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v13 = v4;
  if (self->_assetId) {
    objc_msgSend(v4, "setAssetId:");
  }
  if (self->_version) {
    objc_msgSend(v13, "setVersion:");
  }
  if ([(SIRINLUINTERNALOverrideCollection *)self parseOverridesCount])
  {
    [v13 clearParseOverrides];
    unint64_t v5 = [(SIRINLUINTERNALOverrideCollection *)self parseOverridesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(SIRINLUINTERNALOverrideCollection *)self parseOverridesAtIndex:i];
        [v13 addParseOverrides:v8];
      }
    }
  }
  if ([(SIRINLUINTERNALOverrideCollection *)self componentOverridesCount])
  {
    [v13 clearComponentOverrides];
    unint64_t v9 = [(SIRINLUINTERNALOverrideCollection *)self componentOverridesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(SIRINLUINTERNALOverrideCollection *)self componentOverridesAtIndex:j];
        [v13 addComponentOverrides:v12];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_assetId) {
    PBDataWriterWriteStringField();
  }
  if (self->_version) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_parseOverrides;
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
        PBDataWriterWriteSubmessage();
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
  unint64_t v10 = self->_componentOverrides;
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALOverrideCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_creationTimestampMsSinceUnixEpoch];
    [v3 setObject:v4 forKey:@"creation_timestamp_ms_since_unix_epoch"];
  }
  assetId = self->_assetId;
  if (assetId) {
    [v3 setObject:assetId forKey:@"asset_id"];
  }
  version = self->_version;
  if (version) {
    [v3 setObject:version forKey:@"version"];
  }
  if ([(NSMutableArray *)self->_parseOverrides count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_parseOverrides, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = self->_parseOverrides;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"parse_overrides"];
  }
  if ([(NSMutableArray *)self->_componentOverrides count])
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_componentOverrides, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v15 = self->_componentOverrides;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"component_overrides"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALOverrideCollection;
  id v4 = [(SIRINLUINTERNALOverrideCollection *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALOverrideCollection *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)componentOverridesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_componentOverrides objectAtIndex:a3];
}

- (unint64_t)componentOverridesCount
{
  return [(NSMutableArray *)self->_componentOverrides count];
}

- (void)addComponentOverrides:(id)a3
{
  id v4 = a3;
  componentOverrides = self->_componentOverrides;
  id v8 = v4;
  if (!componentOverrides)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_componentOverrides;
    self->_componentOverrides = v6;

    id v4 = v8;
    componentOverrides = self->_componentOverrides;
  }
  [(NSMutableArray *)componentOverrides addObject:v4];
}

- (void)clearComponentOverrides
{
}

- (id)parseOverridesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_parseOverrides objectAtIndex:a3];
}

- (unint64_t)parseOverridesCount
{
  return [(NSMutableArray *)self->_parseOverrides count];
}

- (void)addParseOverrides:(id)a3
{
  id v4 = a3;
  parseOverrides = self->_parseOverrides;
  id v8 = v4;
  if (!parseOverrides)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_parseOverrides;
    self->_parseOverrides = v6;

    id v4 = v8;
    parseOverrides = self->_parseOverrides;
  }
  [(NSMutableArray *)parseOverrides addObject:v4];
}

- (void)clearParseOverrides
{
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasAssetId
{
  return self->_assetId != 0;
}

- (BOOL)hasCreationTimestampMsSinceUnixEpoch
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreationTimestampMsSinceUnixEpoch:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreationTimestampMsSinceUnixEpoch:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationTimestampMsSinceUnixEpoch = a3;
}

+ (Class)componentOverridesType
{
  return (Class)objc_opt_class();
}

+ (Class)parseOverridesType
{
  return (Class)objc_opt_class();
}

@end