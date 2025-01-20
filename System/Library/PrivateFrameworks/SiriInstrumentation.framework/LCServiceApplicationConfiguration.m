@interface LCServiceApplicationConfiguration
- (BOOL)hasApplicationParameters;
- (BOOL)hasBundleIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LCServiceApplicationConfiguration)initWithDictionary:(id)a3;
- (LCServiceApplicationConfiguration)initWithJSON:(id)a3;
- (LCServiceLoggingParameters)applicationParameters;
- (NSArray)blacklistedCategories;
- (NSArray)categories;
- (NSData)jsonData;
- (NSString)bundleIdentifier;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)categoriesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)blacklistedCategoriesAtIndex:(unint64_t)a3;
- (unint64_t)blacklistedCategoriesCount;
- (unint64_t)categoriesCount;
- (unint64_t)hash;
- (void)addBlacklistedCategories:(int)a3;
- (void)addCategories:(id)a3;
- (void)clearBlacklistedCategories;
- (void)clearCategories;
- (void)deleteApplicationParameters;
- (void)deleteBundleIdentifier;
- (void)setApplicationParameters:(id)a3;
- (void)setBlacklistedCategories:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategories:(id)a3;
- (void)setHasApplicationParameters:(BOOL)a3;
- (void)setHasBundleIdentifier:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation LCServiceApplicationConfiguration

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LCServiceApplicationConfiguration;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(LCServiceApplicationConfiguration *)self applicationParameters];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(LCServiceApplicationConfiguration *)self deleteApplicationParameters];
  }
  v9 = [(LCServiceApplicationConfiguration *)self categories];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(LCServiceApplicationConfiguration *)self setCategories:v10];

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedCategories, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_applicationParameters, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setHasApplicationParameters:(BOOL)a3
{
  self->_hasApplicationParameters = a3;
}

- (void)setHasBundleIdentifier:(BOOL)a3
{
  self->_hasBundleIdentifier = a3;
}

- (void)setBlacklistedCategories:(id)a3
{
}

- (NSArray)blacklistedCategories
{
  return self->_blacklistedCategories;
}

- (void)setCategories:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setApplicationParameters:(id)a3
{
}

- (LCServiceLoggingParameters)applicationParameters
{
  return self->_applicationParameters;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (LCServiceApplicationConfiguration)initWithDictionary:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)LCServiceApplicationConfiguration;
  v5 = [(LCServiceApplicationConfiguration *)&v39 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LCServiceApplicationConfiguration *)v5 setBundleIdentifier:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"applicationParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[LCServiceLoggingParameters alloc] initWithDictionary:v8];
      [(LCServiceApplicationConfiguration *)v5 setApplicationParameters:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"categories"];
    objc_opt_class();
    v27 = v8;
    v29 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v36;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[LCServiceCategoryConfiguration alloc] initWithDictionary:v16];
              [(LCServiceApplicationConfiguration *)v5 addCategories:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v13);
      }

      int v8 = v27;
      v6 = v29;
    }
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"blacklistedCategories", v27, v29);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v31 + 1) + 8 * v23);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[LCServiceApplicationConfiguration addBlacklistedCategories:](v5, "addBlacklistedCategories:", [v24 intValue]);
            }
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v21);
      }

      int v8 = v28;
      v6 = v30;
    }
    v25 = v5;
  }
  return v5;
}

- (LCServiceApplicationConfiguration)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LCServiceApplicationConfiguration *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LCServiceApplicationConfiguration *)self dictionaryRepresentation];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_applicationParameters)
  {
    id v4 = [(LCServiceApplicationConfiguration *)self applicationParameters];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"applicationParameters"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"applicationParameters"];
    }
  }
  if ([(NSArray *)self->_blacklistedCategories count])
  {
    uint64_t v7 = [(LCServiceApplicationConfiguration *)self blacklistedCategories];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"blacklistedCategories"];
  }
  if (self->_bundleIdentifier)
  {
    v9 = [(LCServiceApplicationConfiguration *)self bundleIdentifier];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"bundleIdentifier"];
  }
  if ([(NSArray *)self->_categories count])
  {
    id v11 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v12 = self->_categories;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"categories"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v20);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  unint64_t v4 = [(LCServiceLoggingParameters *)self->_applicationParameters hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_categories hash];
  return v4 ^ v5 ^ [(NSArray *)self->_blacklistedCategories hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(LCServiceApplicationConfiguration *)self bundleIdentifier];
  v6 = [v4 bundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(LCServiceApplicationConfiguration *)self bundleIdentifier];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(LCServiceApplicationConfiguration *)self bundleIdentifier];
    v10 = [v4 bundleIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(LCServiceApplicationConfiguration *)self applicationParameters];
  v6 = [v4 applicationParameters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(LCServiceApplicationConfiguration *)self applicationParameters];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(LCServiceApplicationConfiguration *)self applicationParameters];
    uint64_t v15 = [v4 applicationParameters];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(LCServiceApplicationConfiguration *)self categories];
  v6 = [v4 categories];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(LCServiceApplicationConfiguration *)self categories];
  if (v17)
  {
    v18 = (void *)v17;
    id v19 = [(LCServiceApplicationConfiguration *)self categories];
    long long v20 = [v4 categories];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(LCServiceApplicationConfiguration *)self blacklistedCategories];
  v6 = [v4 blacklistedCategories];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(LCServiceApplicationConfiguration *)self blacklistedCategories];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    long long v23 = (void *)v22;
    v24 = [(LCServiceApplicationConfiguration *)self blacklistedCategories];
    uint64_t v25 = [v4 blacklistedCategories];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(LCServiceApplicationConfiguration *)self bundleIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(LCServiceApplicationConfiguration *)self applicationParameters];

  if (v6)
  {
    uint64_t v7 = [(LCServiceApplicationConfiguration *)self applicationParameters];
    PBDataWriterWriteSubmessage();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v8 = self->_categories;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v13 = self->_blacklistedCategories;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17), "intValue", (void)v18);
        PBDataWriterWriteInt32Field();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceApplicationConfigurationReadFrom(self, (uint64_t)a3);
}

- (int)blacklistedCategoriesAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSArray *)self->_blacklistedCategories objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)blacklistedCategoriesCount
{
  return [(NSArray *)self->_blacklistedCategories count];
}

- (void)addBlacklistedCategories:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  blacklistedCategories = self->_blacklistedCategories;
  if (!blacklistedCategories)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_blacklistedCategories;
    self->_blacklistedCategories = v6;

    blacklistedCategories = self->_blacklistedCategories;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)blacklistedCategories addObject:v8];
}

- (void)clearBlacklistedCategories
{
}

- (id)categoriesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_categories objectAtIndexedSubscript:a3];
}

- (unint64_t)categoriesCount
{
  return [(NSArray *)self->_categories count];
}

- (void)addCategories:(id)a3
{
  id v4 = a3;
  categories = self->_categories;
  id v8 = v4;
  if (!categories)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_categories;
    self->_categories = v6;

    id v4 = v8;
    categories = self->_categories;
  }
  [(NSArray *)categories addObject:v4];
}

- (void)clearCategories
{
}

- (void)deleteApplicationParameters
{
}

- (BOOL)hasApplicationParameters
{
  return self->_applicationParameters != 0;
}

- (void)deleteBundleIdentifier
{
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

@end