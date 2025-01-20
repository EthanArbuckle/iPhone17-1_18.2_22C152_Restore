@interface _SFPBCoreSpotlightButtonItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)actionItemTypes;
- (NSData)jsonData;
- (NSString)applicationBundleIdentifier;
- (NSString)coreSpotlightIdentifier;
- (_SFPBCoreSpotlightButtonItem)initWithDictionary:(id)a3;
- (_SFPBCoreSpotlightButtonItem)initWithFacade:(id)a3;
- (_SFPBCoreSpotlightButtonItem)initWithJSON:(id)a3;
- (id)actionItemTypesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)actionItemTypesCount;
- (unint64_t)hash;
- (unint64_t)uniqueId;
- (void)addActionItemTypes:(id)a3;
- (void)clearActionItemTypes;
- (void)setActionItemTypes:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setUniqueId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCoreSpotlightButtonItem

- (_SFPBCoreSpotlightButtonItem)initWithFacade:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBCoreSpotlightButtonItem *)self init];
  if (v5)
  {
    v6 = [v4 actionItemTypes];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = objc_msgSend(v4, "actionItemTypes", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v19 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [(_SFPBCoreSpotlightButtonItem *)v5 setActionItemTypes:v7];
    v13 = [v4 applicationBundleIdentifier];

    if (v13)
    {
      v14 = [v4 applicationBundleIdentifier];
      [(_SFPBCoreSpotlightButtonItem *)v5 setApplicationBundleIdentifier:v14];
    }
    v15 = [v4 coreSpotlightIdentifier];

    if (v15)
    {
      v16 = [v4 coreSpotlightIdentifier];
      [(_SFPBCoreSpotlightButtonItem *)v5 setCoreSpotlightIdentifier:v16];
    }
    if ([v4 hasUniqueId]) {
      -[_SFPBCoreSpotlightButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v17 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionItemTypes, 0);
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSArray)actionItemTypes
{
  return self->_actionItemTypes;
}

- (_SFPBCoreSpotlightButtonItem)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_SFPBCoreSpotlightButtonItem;
  v5 = [(_SFPBCoreSpotlightButtonItem *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionItemTypes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v21);
              [(_SFPBCoreSpotlightButtonItem *)v5 addActionItemTypes:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"applicationBundleIdentifier", (void)v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBCoreSpotlightButtonItem *)v5 setApplicationBundleIdentifier:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"coreSpotlightIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBCoreSpotlightButtonItem *)v5 setCoreSpotlightIdentifier:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"uniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCoreSpotlightButtonItem setUniqueId:](v5, "setUniqueId:", [v18 unsignedLongLongValue]);
    }
    long long v19 = v5;
  }
  return v5;
}

- (_SFPBCoreSpotlightButtonItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCoreSpotlightButtonItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCoreSpotlightButtonItem *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_actionItemTypes)
  {
    id v4 = [(_SFPBCoreSpotlightButtonItem *)self actionItemTypes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"actionItemTypes"];
  }
  if (self->_applicationBundleIdentifier)
  {
    v6 = [(_SFPBCoreSpotlightButtonItem *)self applicationBundleIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  if (self->_coreSpotlightIdentifier)
  {
    uint64_t v8 = [(_SFPBCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"coreSpotlightIdentifier"];
  }
  if (self->_uniqueId)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBCoreSpotlightButtonItem uniqueId](self, "uniqueId"));
    [v3 setObject:v10 forKeyedSubscript:@"uniqueId"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_actionItemTypes hash];
  NSUInteger v4 = [(NSString *)self->_applicationBundleIdentifier hash];
  return v4 ^ v3 ^ [(NSString *)self->_coreSpotlightIdentifier hash] ^ (2654435761u * self->_uniqueId);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBCoreSpotlightButtonItem *)self actionItemTypes];
  v6 = [v4 actionItemTypes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBCoreSpotlightButtonItem *)self actionItemTypes];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBCoreSpotlightButtonItem *)self actionItemTypes];
    uint64_t v10 = [v4 actionItemTypes];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBCoreSpotlightButtonItem *)self applicationBundleIdentifier];
  v6 = [v4 applicationBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBCoreSpotlightButtonItem *)self applicationBundleIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBCoreSpotlightButtonItem *)self applicationBundleIdentifier];
    v15 = [v4 applicationBundleIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
  v6 = [v4 coreSpotlightIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
    if (!v17)
    {

LABEL_20:
      unint64_t uniqueId = self->_uniqueId;
      BOOL v22 = uniqueId == [v4 uniqueId];
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(_SFPBCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
    long long v20 = [v4 coreSpotlightIdentifier];
    int v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBCoreSpotlightButtonItem *)self actionItemTypes];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_SFPBCoreSpotlightButtonItem *)self applicationBundleIdentifier];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCoreSpotlightButtonItem *)self uniqueId]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCoreSpotlightButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_unint64_t uniqueId = a3;
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  self->_coreSpotlightIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  self->_applicationBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)actionItemTypesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_actionItemTypes objectAtIndexedSubscript:a3];
}

- (unint64_t)actionItemTypesCount
{
  return [(NSArray *)self->_actionItemTypes count];
}

- (void)addActionItemTypes:(id)a3
{
  id v4 = a3;
  actionItemTypes = self->_actionItemTypes;
  id v8 = v4;
  if (!actionItemTypes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_actionItemTypes;
    self->_actionItemTypes = v6;

    id v4 = v8;
    actionItemTypes = self->_actionItemTypes;
  }
  [(NSArray *)actionItemTypes addObject:v4];
}

- (void)clearActionItemTypes
{
}

- (void)setActionItemTypes:(id)a3
{
  self->_actionItemTypes = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end