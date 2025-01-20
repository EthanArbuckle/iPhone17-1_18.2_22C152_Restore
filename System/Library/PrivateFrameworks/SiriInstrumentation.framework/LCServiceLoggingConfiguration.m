@interface LCServiceLoggingConfiguration
- (BOOL)hasConfigurationVersion;
- (BOOL)hasDefaultParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LCServiceLoggingConfiguration)initWithDictionary:(id)a3;
- (LCServiceLoggingConfiguration)initWithJSON:(id)a3;
- (LCServiceLoggingParameters)defaultParameters;
- (NSArray)applications;
- (NSArray)blacklistedBundleIdentifiers;
- (NSArray)denyListedCategories;
- (NSData)jsonData;
- (id)applicationsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)blacklistedBundleIdentifiersAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)configurationVersion;
- (int)denyListedCategoriesAtIndex:(unint64_t)a3;
- (unint64_t)applicationsCount;
- (unint64_t)blacklistedBundleIdentifiersCount;
- (unint64_t)denyListedCategoriesCount;
- (unint64_t)hash;
- (void)addApplications:(id)a3;
- (void)addBlacklistedBundleIdentifiers:(id)a3;
- (void)addDenyListedCategories:(int)a3;
- (void)clearApplications;
- (void)clearBlacklistedBundleIdentifiers;
- (void)clearDenyListedCategories;
- (void)deleteConfigurationVersion;
- (void)deleteDefaultParameters;
- (void)setApplications:(id)a3;
- (void)setBlacklistedBundleIdentifiers:(id)a3;
- (void)setConfigurationVersion:(int)a3;
- (void)setDefaultParameters:(id)a3;
- (void)setDenyListedCategories:(id)a3;
- (void)setHasConfigurationVersion:(BOOL)a3;
- (void)setHasDefaultParameters:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation LCServiceLoggingConfiguration

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LCServiceLoggingConfiguration;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(LCServiceLoggingConfiguration *)self defaultParameters];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(LCServiceLoggingConfiguration *)self deleteDefaultParameters];
  }
  v9 = [(LCServiceLoggingConfiguration *)self applications];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(LCServiceLoggingConfiguration *)self setApplications:v10];

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
  objc_storeStrong((id *)&self->_denyListedCategories, 0);
  objc_storeStrong((id *)&self->_blacklistedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_defaultParameters, 0);
}

- (void)setHasDefaultParameters:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDenyListedCategories:(id)a3
{
}

- (NSArray)denyListedCategories
{
  return self->_denyListedCategories;
}

- (void)setBlacklistedBundleIdentifiers:(id)a3
{
}

- (NSArray)blacklistedBundleIdentifiers
{
  return self->_blacklistedBundleIdentifiers;
}

- (void)setApplications:(id)a3
{
}

- (NSArray)applications
{
  return self->_applications;
}

- (int)configurationVersion
{
  return self->_configurationVersion;
}

- (void)setDefaultParameters:(id)a3
{
}

- (LCServiceLoggingParameters)defaultParameters
{
  return self->_defaultParameters;
}

- (LCServiceLoggingConfiguration)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)LCServiceLoggingConfiguration;
  v5 = [(LCServiceLoggingConfiguration *)&v48 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"defaultParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[LCServiceLoggingParameters alloc] initWithDictionary:v6];
      [(LCServiceLoggingConfiguration *)v5 setDefaultParameters:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"configurationVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LCServiceLoggingConfiguration setConfigurationVersion:](v5, "setConfigurationVersion:", [v8 intValue]);
    }
    v34 = v8;
    v9 = [v4 objectForKeyedSubscript:@"applications"];
    objc_opt_class();
    v35 = v9;
    if (objc_opt_isKindOfClass())
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[LCServiceApplicationConfiguration alloc] initWithDictionary:v15];
              [(LCServiceLoggingConfiguration *)v5 addApplications:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v51 count:16];
        }
        while (v12);
      }
    }
    v17 = [v4 objectForKeyedSubscript:@"blacklistedBundleIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v41 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v40 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = (void *)[v23 copy];
              [(LCServiceLoggingConfiguration *)v5 addBlacklistedBundleIdentifiers:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v50 count:16];
        }
        while (v20);
      }
    }
    v25 = [v4 objectForKeyedSubscript:@"denyListedCategories"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v49 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v37;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v37 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v36 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[LCServiceLoggingConfiguration addDenyListedCategories:](v5, "addDenyListedCategories:", [v31 intValue]);
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v49 count:16];
        }
        while (v28);
      }
    }
    v32 = v5;
  }
  return v5;
}

- (LCServiceLoggingConfiguration)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LCServiceLoggingConfiguration *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LCServiceLoggingConfiguration *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_applications count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v5 = self->_applications;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"applications"];
  }
  if (self->_blacklistedBundleIdentifiers)
  {
    uint64_t v12 = [(LCServiceLoggingConfiguration *)self blacklistedBundleIdentifiers];
    uint64_t v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"blacklistedBundleIdentifiers"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = objc_msgSend(NSNumber, "numberWithInt:", -[LCServiceLoggingConfiguration configurationVersion](self, "configurationVersion"));
    [v3 setObject:v14 forKeyedSubscript:@"configurationVersion"];
  }
  if (self->_defaultParameters)
  {
    uint64_t v15 = [(LCServiceLoggingConfiguration *)self defaultParameters];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"defaultParameters"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"defaultParameters"];
    }
  }
  if ([(NSArray *)self->_denyListedCategories count])
  {
    id v18 = [(LCServiceLoggingConfiguration *)self denyListedCategories];
    uint64_t v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"denyListedCategories"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(LCServiceLoggingParameters *)self->_defaultParameters hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_configurationVersion;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSArray *)self->_applications hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSArray *)self->_blacklistedBundleIdentifiers hash];
  return v7 ^ [(NSArray *)self->_denyListedCategories hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  unint64_t v5 = [(LCServiceLoggingConfiguration *)self defaultParameters];
  uint64_t v6 = [v4 defaultParameters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v7 = [(LCServiceLoggingConfiguration *)self defaultParameters];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(LCServiceLoggingConfiguration *)self defaultParameters];
    id v10 = [v4 defaultParameters];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    int configurationVersion = self->_configurationVersion;
    if (configurationVersion != [v4 configurationVersion]) {
      goto LABEL_25;
    }
  }
  unint64_t v5 = [(LCServiceLoggingConfiguration *)self applications];
  uint64_t v6 = [v4 applications];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v13 = [(LCServiceLoggingConfiguration *)self applications];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [(LCServiceLoggingConfiguration *)self applications];
    v16 = [v4 applications];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v5 = [(LCServiceLoggingConfiguration *)self blacklistedBundleIdentifiers];
  uint64_t v6 = [v4 blacklistedBundleIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v18 = [(LCServiceLoggingConfiguration *)self blacklistedBundleIdentifiers];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(LCServiceLoggingConfiguration *)self blacklistedBundleIdentifiers];
    long long v21 = [v4 blacklistedBundleIdentifiers];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v5 = [(LCServiceLoggingConfiguration *)self denyListedCategories];
  uint64_t v6 = [v4 denyListedCategories];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v23 = [(LCServiceLoggingConfiguration *)self denyListedCategories];
    if (!v23)
    {

LABEL_28:
      BOOL v28 = 1;
      goto LABEL_26;
    }
    long long v24 = (void *)v23;
    v25 = [(LCServiceLoggingConfiguration *)self denyListedCategories];
    uint64_t v26 = [v4 denyListedCategories];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(LCServiceLoggingConfiguration *)self defaultParameters];

  if (v5)
  {
    uint64_t v6 = [(LCServiceLoggingConfiguration *)self defaultParameters];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = self->_applications;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = self->_blacklistedBundleIdentifiers;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v17 = self->_denyListedCategories;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21), "intValue", (void)v22);
        PBDataWriterWriteInt32Field();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceLoggingConfigurationReadFrom(self, (uint64_t)a3);
}

- (int)denyListedCategoriesAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(NSArray *)self->_denyListedCategories objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)denyListedCategoriesCount
{
  return [(NSArray *)self->_denyListedCategories count];
}

- (void)addDenyListedCategories:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  denyListedCategories = self->_denyListedCategories;
  if (!denyListedCategories)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_denyListedCategories;
    self->_denyListedCategories = v6;

    denyListedCategories = self->_denyListedCategories;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)denyListedCategories addObject:v8];
}

- (void)clearDenyListedCategories
{
}

- (id)blacklistedBundleIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_blacklistedBundleIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)blacklistedBundleIdentifiersCount
{
  return [(NSArray *)self->_blacklistedBundleIdentifiers count];
}

- (void)addBlacklistedBundleIdentifiers:(id)a3
{
  id v4 = a3;
  blacklistedBundleIdentifiers = self->_blacklistedBundleIdentifiers;
  id v8 = v4;
  if (!blacklistedBundleIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_blacklistedBundleIdentifiers;
    self->_blacklistedBundleIdentifiers = v6;

    id v4 = v8;
    blacklistedBundleIdentifiers = self->_blacklistedBundleIdentifiers;
  }
  [(NSArray *)blacklistedBundleIdentifiers addObject:v4];
}

- (void)clearBlacklistedBundleIdentifiers
{
}

- (id)applicationsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_applications objectAtIndexedSubscript:a3];
}

- (unint64_t)applicationsCount
{
  return [(NSArray *)self->_applications count];
}

- (void)addApplications:(id)a3
{
  id v4 = a3;
  applications = self->_applications;
  id v8 = v4;
  if (!applications)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_applications;
    self->_applications = v6;

    id v4 = v8;
    applications = self->_applications;
  }
  [(NSArray *)applications addObject:v4];
}

- (void)clearApplications
{
}

- (void)deleteConfigurationVersion
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasConfigurationVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfigurationVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfigurationVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int configurationVersion = a3;
}

- (void)deleteDefaultParameters
{
}

- (BOOL)hasDefaultParameters
{
  return self->_defaultParameters != 0;
}

@end