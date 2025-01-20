@interface INFERENCESchemaINFERENCEResolutionRequestStarted
- (BOOL)hasResolverConfig;
- (BOOL)hasSlotType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEResolutionRequestStarted)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEResolutionRequestStarted)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEResolverConfig)resolverConfig;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)slotType;
- (unint64_t)hash;
- (void)deleteResolverConfig;
- (void)deleteSlotType;
- (void)setHasResolverConfig:(BOOL)a3;
- (void)setHasSlotType:(BOOL)a3;
- (void)setResolverConfig:(id)a3;
- (void)setSlotType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEResolutionRequestStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEResolutionRequestStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self resolverConfig];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self deleteResolverConfig];
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
}

- (void)setHasResolverConfig:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setResolverConfig:(id)a3
{
}

- (INFERENCESchemaINFERENCEResolverConfig)resolverConfig
{
  return self->_resolverConfig;
}

- (int)slotType
{
  return self->_slotType;
}

- (INFERENCESchemaINFERENCEResolutionRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INFERENCESchemaINFERENCEResolutionRequestStarted;
  v5 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"slotType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEResolutionRequestStarted setSlotType:](v5, "setSlotType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"resolverConfig"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[INFERENCESchemaINFERENCEResolverConfig alloc] initWithDictionary:v7];
      [(INFERENCESchemaINFERENCEResolutionRequestStarted *)v5 setResolverConfig:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEResolutionRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self dictionaryRepresentation];
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
  if (self->_resolverConfig)
  {
    id v4 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self resolverConfig];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"resolverConfig"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"resolverConfig"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self slotType] - 1;
    if (v7 > 3) {
      v8 = @"INFERENCESLOTTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EB0F78[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"slotType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_slotType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(INFERENCESchemaINFERENCEResolverConfig *)self->_resolverConfig hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int slotType = self->_slotType, slotType == [v4 slotType]))
      {
        v6 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self resolverConfig];
        unsigned int v7 = [v4 resolverConfig];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self resolverConfig];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self resolverConfig];
          v12 = [v4 resolverConfig];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self resolverConfig];

  v5 = v7;
  if (v4)
  {
    v6 = [(INFERENCESchemaINFERENCEResolutionRequestStarted *)self resolverConfig];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEResolutionRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteResolverConfig
{
}

- (BOOL)hasResolverConfig
{
  return self->_resolverConfig != 0;
}

- (void)deleteSlotType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSlotType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSlotType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSlotType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int slotType = a3;
}

@end