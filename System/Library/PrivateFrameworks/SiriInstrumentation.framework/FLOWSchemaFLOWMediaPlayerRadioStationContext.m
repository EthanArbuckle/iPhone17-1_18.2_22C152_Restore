@interface FLOWSchemaFLOWMediaPlayerRadioStationContext
- (BOOL)hasLinkId;
- (BOOL)hasRadioStationSubtype;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWMediaPlayerRadioStationContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWMediaPlayerRadioStationContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)radioStationSubtype;
- (unint64_t)hash;
- (void)deleteLinkId;
- (void)deleteRadioStationSubtype;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasRadioStationSubtype:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setRadioStationSubtype:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWMediaPlayerRadioStationContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FLOWSchemaFLOWMediaPlayerRadioStationContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self deleteLinkId];
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

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)radioStationSubtype
{
  return self->_radioStationSubtype;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (FLOWSchemaFLOWMediaPlayerRadioStationContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLOWSchemaFLOWMediaPlayerRadioStationContext;
  v5 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)v5 setLinkId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"radioStationSubtype"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerRadioStationContext setRadioStationSubtype:](v5, "setRadioStationSubtype:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWMediaPlayerRadioStationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self dictionaryRepresentation];
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
  if (self->_linkId)
  {
    id v4 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self linkId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self radioStationSubtype] - 1;
    if (v7 > 7) {
      v8 = @"FLOWMEDIAPLAYERRADIOSTATIONSUBTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EAF838[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"radioStationSubtype"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_radioStationSubtype;
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
  v5 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self linkId];
  v6 = [v4 linkId];
  unsigned int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self linkId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self linkId];
    objc_super v11 = [v4 linkId];
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
    int radioStationSubtype = self->_radioStationSubtype;
    if (radioStationSubtype != [v4 radioStationSubtype]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self linkId];

  if (v4)
  {
    v5 = [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerRadioStationContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteRadioStationSubtype
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRadioStationSubtype:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRadioStationSubtype
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRadioStationSubtype:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int radioStationSubtype = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end