@interface PSESchemaPSEMaps
- (BOOL)hasFollowup;
- (BOOL)hasIsSiriResultUseful;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSiriResultUseful;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PSESchemaPSEMaps)initWithDictionary:(id)a3;
- (PSESchemaPSEMaps)initWithJSON:(id)a3;
- (PSESchemaPSEMapsUserFollowup)followup;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteFollowup;
- (void)deleteIsSiriResultUseful;
- (void)setFollowup:(id)a3;
- (void)setHasFollowup:(BOOL)a3;
- (void)setHasIsSiriResultUseful:(BOOL)a3;
- (void)setIsSiriResultUseful:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSEMaps

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSESchemaPSEMaps;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PSESchemaPSEMaps *)self followup];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PSESchemaPSEMaps *)self deleteFollowup];
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

- (void)setHasFollowup:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFollowup:(id)a3
{
}

- (PSESchemaPSEMapsUserFollowup)followup
{
  return self->_followup;
}

- (BOOL)isSiriResultUseful
{
  return self->_isSiriResultUseful;
}

- (PSESchemaPSEMaps)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSESchemaPSEMaps;
  v5 = [(PSESchemaPSEMaps *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isSiriResultUseful"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMaps setIsSiriResultUseful:](v5, "setIsSiriResultUseful:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"followup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[PSESchemaPSEMapsUserFollowup alloc] initWithDictionary:v7];
      [(PSESchemaPSEMaps *)v5 setFollowup:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (PSESchemaPSEMaps)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSEMaps *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSEMaps *)self dictionaryRepresentation];
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
  if (self->_followup)
  {
    id v4 = [(PSESchemaPSEMaps *)self followup];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"followup"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"followup"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEMaps isSiriResultUseful](self, "isSiriResultUseful"));
    [v3 setObject:v7 forKeyedSubscript:@"isSiriResultUseful"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_isSiriResultUseful;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(PSESchemaPSEMapsUserFollowup *)self->_followup hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int isSiriResultUseful = self->_isSiriResultUseful,
            isSiriResultUseful == [v4 isSiriResultUseful]))
      {
        v6 = [(PSESchemaPSEMaps *)self followup];
        uint64_t v7 = [v4 followup];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(PSESchemaPSEMaps *)self followup];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(PSESchemaPSEMaps *)self followup];
          v12 = [v4 followup];
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
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(PSESchemaPSEMaps *)self followup];

  v5 = v7;
  if (v4)
  {
    v6 = [(PSESchemaPSEMaps *)self followup];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMapsReadFrom(self, (uint64_t)a3);
}

- (void)deleteFollowup
{
}

- (BOOL)hasFollowup
{
  return self->_followup != 0;
}

- (void)deleteIsSiriResultUseful
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsSiriResultUseful:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSiriResultUseful
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSiriResultUseful:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isSiriResultUseful = a3;
}

@end