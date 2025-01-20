@interface FLOWSchemaFLOWBriefingContext
- (BOOL)hasBriefingAttribute;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWBriefingContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWBriefingContext)initWithJSON:(id)a3;
- (NSArray)enabledFeatures;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)briefingAttribute;
- (int)enabledFeaturesAtIndex:(unint64_t)a3;
- (unint64_t)enabledFeaturesCount;
- (unint64_t)hash;
- (void)addEnabledFeatures:(int)a3;
- (void)clearEnabledFeatures;
- (void)deleteBriefingAttribute;
- (void)setBriefingAttribute:(int)a3;
- (void)setEnabledFeatures:(id)a3;
- (void)setHasBriefingAttribute:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWBriefingContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (int)briefingAttribute
{
  return self->_briefingAttribute;
}

- (void)setEnabledFeatures:(id)a3
{
}

- (NSArray)enabledFeatures
{
  return self->_enabledFeatures;
}

- (FLOWSchemaFLOWBriefingContext)initWithDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FLOWSchemaFLOWBriefingContext;
  v5 = [(FLOWSchemaFLOWBriefingContext *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"enabledFeatures"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWBriefingContext addEnabledFeatures:](v5, "addEnabledFeatures:", objc_msgSend(v12, "intValue", (void)v16));
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v9);
      }
    }
    v13 = objc_msgSend(v4, "objectForKeyedSubscript:", @"briefingAttribute", (void)v16);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWBriefingContext setBriefingAttribute:](v5, "setBriefingAttribute:", [v13 intValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWBriefingContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWBriefingContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWBriefingContext *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(FLOWSchemaFLOWBriefingContext *)self briefingAttribute] - 1;
    if (v4 > 0xB) {
      v5 = @"FLOWBRIEFINGTASKATTRIBUTE_UNKNOWN";
    }
    else {
      v5 = off_1E5EAEB10[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"briefingAttribute"];
  }
  if ([(NSArray *)self->_enabledFeatures count])
  {
    v6 = [(FLOWSchemaFLOWBriefingContext *)self enabledFeatures];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"enabledFeatures"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_enabledFeatures hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_briefingAttribute;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(FLOWSchemaFLOWBriefingContext *)self enabledFeatures];
  v6 = [v4 enabledFeatures];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(FLOWSchemaFLOWBriefingContext *)self enabledFeatures];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(FLOWSchemaFLOWBriefingContext *)self enabledFeatures];
    uint64_t v11 = [v4 enabledFeatures];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int briefingAttribute = self->_briefingAttribute;
    if (briefingAttribute != [v4 briefingAttribute]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_enabledFeatures;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "intValue", (void)v10);
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWBriefingContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteBriefingAttribute
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBriefingAttribute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBriefingAttribute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBriefingAttribute:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int briefingAttribute = a3;
}

- (int)enabledFeaturesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_enabledFeatures objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)enabledFeaturesCount
{
  return [(NSArray *)self->_enabledFeatures count];
}

- (void)addEnabledFeatures:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  enabledFeatures = self->_enabledFeatures;
  if (!enabledFeatures)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_enabledFeatures;
    self->_enabledFeatures = v6;

    enabledFeatures = self->_enabledFeatures;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)enabledFeatures addObject:v8];
}

- (void)clearEnabledFeatures
{
}

@end