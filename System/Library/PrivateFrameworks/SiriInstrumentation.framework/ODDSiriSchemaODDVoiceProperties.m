@interface ODDSiriSchemaODDVoiceProperties
- (BOOL)hasAccent;
- (BOOL)hasGender;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)installedVoices;
- (NSData)jsonData;
- (ODDSiriSchemaODDVoiceProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDVoiceProperties)initWithJSON:(id)a3;
- (SISchemaISOLocale)accent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)gender;
- (int)installedVoicesAtIndex:(unint64_t)a3;
- (int)name;
- (unint64_t)hash;
- (unint64_t)installedVoicesCount;
- (void)addInstalledVoices:(int)a3;
- (void)clearInstalledVoices;
- (void)deleteAccent;
- (void)deleteGender;
- (void)deleteName;
- (void)setAccent:(id)a3;
- (void)setGender:(int)a3;
- (void)setHasAccent:(BOOL)a3;
- (void)setHasGender:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setInstalledVoices:(id)a3;
- (void)setName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDVoiceProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDVoiceProperties;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDVoiceProperties *)self accent];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDVoiceProperties *)self deleteAccent];
  }
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
  objc_storeStrong((id *)&self->_installedVoices, 0);
  objc_storeStrong((id *)&self->_accent, 0);
}

- (void)setHasAccent:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setInstalledVoices:(id)a3
{
}

- (NSArray)installedVoices
{
  return self->_installedVoices;
}

- (int)name
{
  return self->_name;
}

- (void)setAccent:(id)a3
{
}

- (SISchemaISOLocale)accent
{
  return self->_accent;
}

- (int)gender
{
  return self->_gender;
}

- (ODDSiriSchemaODDVoiceProperties)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ODDSiriSchemaODDVoiceProperties;
  v5 = [(ODDSiriSchemaODDVoiceProperties *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"gender"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDVoiceProperties setGender:](v5, "setGender:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"accent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaISOLocale alloc] initWithDictionary:v7];
      [(ODDSiriSchemaODDVoiceProperties *)v5 setAccent:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDVoiceProperties setName:](v5, "setName:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"installedVoices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v7;
      v20 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ODDSiriSchemaODDVoiceProperties addInstalledVoices:](v5, "addInstalledVoices:", [v16 intValue]);
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v13);
      }

      v7 = v19;
      v6 = v20;
    }
    v17 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDVoiceProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDVoiceProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDVoiceProperties *)self dictionaryRepresentation];
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
  if (self->_accent)
  {
    id v4 = [(ODDSiriSchemaODDVoiceProperties *)self accent];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"accent"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"accent"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(ODDSiriSchemaODDVoiceProperties *)self gender] - 1;
    if (v7 > 2) {
      v8 = @"VOICEGENDER_UNKNOWN_VOICE_GENDER";
    }
    else {
      v8 = off_1E5EBD7E8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"gender"];
  }
  if ([(NSArray *)self->_installedVoices count])
  {
    objc_super v9 = [(ODDSiriSchemaODDVoiceProperties *)self installedVoices];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"installedVoices"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v11 = [(ODDSiriSchemaODDVoiceProperties *)self name] - 1;
    if (v11 > 0x5C) {
      uint64_t v12 = @"VOICENAME_UNKNOWN";
    }
    else {
      uint64_t v12 = off_1E5EBD800[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"name"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_gender;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaISOLocale *)self->_accent hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_name;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_installedVoices hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    int gender = self->_gender;
    if (gender != [v4 gender]) {
      goto LABEL_18;
    }
  }
  v6 = [(ODDSiriSchemaODDVoiceProperties *)self accent];
  unsigned int v7 = [v4 accent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(ODDSiriSchemaODDVoiceProperties *)self accent];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(ODDSiriSchemaODDVoiceProperties *)self accent];
    unsigned int v11 = [v4 accent];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v13 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v13 != ((v4[40] >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int name = self->_name;
    if (name != [v4 name]) {
      goto LABEL_18;
    }
  }
  v6 = [(ODDSiriSchemaODDVoiceProperties *)self installedVoices];
  unsigned int v7 = [v4 installedVoices];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v15 = [(ODDSiriSchemaODDVoiceProperties *)self installedVoices];
    if (!v15)
    {

LABEL_21:
      BOOL v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    v17 = [(ODDSiriSchemaODDVoiceProperties *)self installedVoices];
    v18 = [v4 installedVoices];
    char v19 = [v17 isEqual:v18];

    if (v19) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v5 = [(ODDSiriSchemaODDVoiceProperties *)self accent];

  if (v5)
  {
    v6 = [(ODDSiriSchemaODDVoiceProperties *)self accent];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v7 = self->_installedVoices;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "intValue", (void)v12);
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDVoicePropertiesReadFrom(self, (uint64_t)a3);
}

- (int)installedVoicesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_installedVoices objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)installedVoicesCount
{
  return [(NSArray *)self->_installedVoices count];
}

- (void)addInstalledVoices:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  installedVoices = self->_installedVoices;
  if (!installedVoices)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v7 = self->_installedVoices;
    self->_installedVoices = v6;

    installedVoices = self->_installedVoices;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)installedVoices addObject:v8];
}

- (void)clearInstalledVoices
{
}

- (void)deleteName
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasName:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasName
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setName:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int name = a3;
}

- (void)deleteAccent
{
}

- (BOOL)hasAccent
{
  return self->_accent != 0;
}

- (void)deleteGender
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasGender:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGender
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGender:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int gender = a3;
}

@end