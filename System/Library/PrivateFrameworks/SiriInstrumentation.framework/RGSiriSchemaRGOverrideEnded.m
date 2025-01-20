@interface RGSiriSchemaRGOverrideEnded
- (BOOL)hasOverrideId;
- (BOOL)hasOverrideType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)overrideId;
- (RGSiriSchemaRGOverrideEnded)initWithDictionary:(id)a3;
- (RGSiriSchemaRGOverrideEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)overrideType;
- (unint64_t)hash;
- (void)deleteOverrideId;
- (void)deleteOverrideType;
- (void)setHasOverrideId:(BOOL)a3;
- (void)setHasOverrideType:(BOOL)a3;
- (void)setOverrideId:(id)a3;
- (void)setOverrideType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RGSiriSchemaRGOverrideEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasOverrideId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setOverrideId:(id)a3
{
}

- (NSString)overrideId
{
  return self->_overrideId;
}

- (int)overrideType
{
  return self->_overrideType;
}

- (RGSiriSchemaRGOverrideEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RGSiriSchemaRGOverrideEnded;
  v5 = [(RGSiriSchemaRGOverrideEnded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"overrideType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RGSiriSchemaRGOverrideEnded setOverrideType:](v5, "setOverrideType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"overrideId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(RGSiriSchemaRGOverrideEnded *)v5 setOverrideId:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (RGSiriSchemaRGOverrideEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RGSiriSchemaRGOverrideEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RGSiriSchemaRGOverrideEnded *)self dictionaryRepresentation];
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
  if (self->_overrideId)
  {
    id v4 = [(RGSiriSchemaRGOverrideEnded *)self overrideId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"overrideId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(RGSiriSchemaRGOverrideEnded *)self overrideType] - 1;
    if (v6 > 2) {
      uint64_t v7 = @"RGOVERRIDETYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBF0D0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"overrideType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_overrideType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_overrideId hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int overrideType = self->_overrideType, overrideType == [v4 overrideType]))
      {
        unsigned int v6 = [(RGSiriSchemaRGOverrideEnded *)self overrideId];
        uint64_t v7 = [v4 overrideId];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(RGSiriSchemaRGOverrideEnded *)self overrideId];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(RGSiriSchemaRGOverrideEnded *)self overrideId];
          v12 = [v4 overrideId];
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
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(RGSiriSchemaRGOverrideEnded *)self overrideId];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGOverrideEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteOverrideId
{
}

- (BOOL)hasOverrideId
{
  return self->_overrideId != 0;
}

- (void)deleteOverrideType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOverrideType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOverrideType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOverrideType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int overrideType = a3;
}

@end