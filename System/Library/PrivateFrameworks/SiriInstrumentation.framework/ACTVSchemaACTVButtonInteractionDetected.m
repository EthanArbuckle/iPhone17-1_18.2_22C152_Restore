@interface ACTVSchemaACTVButtonInteractionDetected
- (ACTVSchemaACTVButtonInteractionDetected)initWithDictionary:(id)a3;
- (ACTVSchemaACTVButtonInteractionDetected)initWithJSON:(id)a3;
- (BOOL)hasButtonInteractionType;
- (BOOL)hasButtonName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)buttonName;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)buttonInteractionType;
- (unint64_t)hash;
- (void)deleteButtonInteractionType;
- (void)deleteButtonName;
- (void)setButtonInteractionType:(int)a3;
- (void)setButtonName:(id)a3;
- (void)setHasButtonInteractionType:(BOOL)a3;
- (void)setHasButtonName:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACTVSchemaACTVButtonInteractionDetected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasButtonName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setButtonName:(id)a3
{
}

- (NSString)buttonName
{
  return self->_buttonName;
}

- (int)buttonInteractionType
{
  return self->_buttonInteractionType;
}

- (ACTVSchemaACTVButtonInteractionDetected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTVSchemaACTVButtonInteractionDetected;
  v5 = [(ACTVSchemaACTVButtonInteractionDetected *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"buttonInteractionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ACTVSchemaACTVButtonInteractionDetected setButtonInteractionType:](v5, "setButtonInteractionType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"buttonName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(ACTVSchemaACTVButtonInteractionDetected *)v5 setButtonName:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (ACTVSchemaACTVButtonInteractionDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ACTVSchemaACTVButtonInteractionDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ACTVSchemaACTVButtonInteractionDetected *)self dictionaryRepresentation];
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
    unsigned int v4 = [(ACTVSchemaACTVButtonInteractionDetected *)self buttonInteractionType] - 1;
    if (v4 > 2) {
      v5 = @"BUTTONINTERACTIONTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBAD70[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"buttonInteractionType"];
  }
  if (self->_buttonName)
  {
    v6 = [(ACTVSchemaACTVButtonInteractionDetected *)self buttonName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"buttonName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_buttonInteractionType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_buttonName hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int buttonInteractionType = self->_buttonInteractionType,
            buttonInteractionType == [v4 buttonInteractionType]))
      {
        v6 = [(ACTVSchemaACTVButtonInteractionDetected *)self buttonName];
        uint64_t v7 = [v4 buttonName];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(ACTVSchemaACTVButtonInteractionDetected *)self buttonName];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(ACTVSchemaACTVButtonInteractionDetected *)self buttonName];
          v12 = [v4 buttonName];
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
  unsigned int v4 = [(ACTVSchemaACTVButtonInteractionDetected *)self buttonName];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ACTVSchemaACTVButtonInteractionDetectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteButtonName
{
}

- (BOOL)hasButtonName
{
  return self->_buttonName != 0;
}

- (void)deleteButtonInteractionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasButtonInteractionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasButtonInteractionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setButtonInteractionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int buttonInteractionType = a3;
}

@end