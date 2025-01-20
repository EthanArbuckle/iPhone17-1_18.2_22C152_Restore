@interface PSESchemaPSEMapsUserFollowup
- (BOOL)hasFollowupType;
- (BOOL)hasMapsAction;
- (BOOL)hasMapsActionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)mapsActionType;
- (PSESchemaPSEMapsUserFollowup)initWithDictionary:(id)a3;
- (PSESchemaPSEMapsUserFollowup)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)followupType;
- (int)mapsAction;
- (unint64_t)hash;
- (void)deleteFollowupType;
- (void)deleteMapsAction;
- (void)deleteMapsActionType;
- (void)setFollowupType:(int)a3;
- (void)setHasFollowupType:(BOOL)a3;
- (void)setHasMapsAction:(BOOL)a3;
- (void)setHasMapsActionType:(BOOL)a3;
- (void)setMapsAction:(int)a3;
- (void)setMapsActionType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSEMapsUserFollowup

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasMapsActionType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setMapsActionType:(id)a3
{
}

- (NSString)mapsActionType
{
  return self->_mapsActionType;
}

- (int)mapsAction
{
  return self->_mapsAction;
}

- (int)followupType
{
  return self->_followupType;
}

- (PSESchemaPSEMapsUserFollowup)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSESchemaPSEMapsUserFollowup;
  v5 = [(PSESchemaPSEMapsUserFollowup *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"followupType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMapsUserFollowup setFollowupType:](v5, "setFollowupType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"mapsAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMapsUserFollowup setMapsAction:](v5, "setMapsAction:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"mapsActionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PSESchemaPSEMapsUserFollowup *)v5 setMapsActionType:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PSESchemaPSEMapsUserFollowup)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSEMapsUserFollowup *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSEMapsUserFollowup *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    int v5 = [(PSESchemaPSEMapsUserFollowup *)self followupType];
    v6 = @"PSEMAPSFOLLOWUP_UNKNOWN";
    if (v5 == 1) {
      v6 = @"PSEMAPSFOLLOWUP_SIRI_RESULT";
    }
    if (v5 == 2) {
      uint64_t v7 = @"PSEMAPSFOLLOWUP_USER_INITIATED_NEW_SEARCH";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"followupType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v8 = [(PSESchemaPSEMapsUserFollowup *)self mapsAction] - 1;
    if (v8 > 5) {
      v9 = @"PSEMAPSACTION_UNKNOWN";
    }
    else {
      v9 = off_1E5EBD468[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"mapsAction"];
  }
  if (self->_mapsActionType)
  {
    v10 = [(PSESchemaPSEMapsUserFollowup *)self mapsActionType];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"mapsActionType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_followupType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_mapsActionType hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_mapsAction;
  return v3 ^ v2 ^ [(NSString *)self->_mapsActionType hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $E2817F952441EE149CA469B42D9B5233 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int followupType = self->_followupType;
    if (followupType != [v4 followupType]) {
      goto LABEL_14;
    }
    $E2817F952441EE149CA469B42D9B5233 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (int mapsAction = self->_mapsAction, mapsAction == [v4 mapsAction]))
    {
      v10 = [(PSESchemaPSEMapsUserFollowup *)self mapsActionType];
      v11 = [v4 mapsActionType];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(PSESchemaPSEMapsUserFollowup *)self mapsActionType];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(PSESchemaPSEMapsUserFollowup *)self mapsActionType];
        v16 = [v4 mapsActionType];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(PSESchemaPSEMapsUserFollowup *)self mapsActionType];

  unsigned int v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    unsigned int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMapsUserFollowupReadFrom(self, (uint64_t)a3);
}

- (void)deleteMapsActionType
{
}

- (BOOL)hasMapsActionType
{
  return self->_mapsActionType != 0;
}

- (void)deleteMapsAction
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMapsAction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMapsAction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMapsAction:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int mapsAction = a3;
}

- (void)deleteFollowupType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFollowupType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFollowupType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFollowupType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int followupType = a3;
}

@end