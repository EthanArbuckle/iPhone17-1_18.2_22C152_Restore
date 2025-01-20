@interface PLUSSchemaPLUSSuggesterMediaSuggestionMetadata
- (BOOL)hasClientTreatment;
- (BOOL)hasLocality;
- (BOOL)hasServerTreatment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)clientTreatment;
- (int)locality;
- (int)serverTreatment;
- (unint64_t)hash;
- (void)deleteClientTreatment;
- (void)deleteLocality;
- (void)deleteServerTreatment;
- (void)setClientTreatment:(int)a3;
- (void)setHasClientTreatment:(BOOL)a3;
- (void)setHasLocality:(BOOL)a3;
- (void)setHasServerTreatment:(BOOL)a3;
- (void)setLocality:(int)a3;
- (void)setServerTreatment:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggesterMediaSuggestionMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)clientTreatment
{
  return self->_clientTreatment;
}

- (int)serverTreatment
{
  return self->_serverTreatment;
}

- (int)locality
{
  return self->_locality;
}

- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUSSchemaPLUSSuggesterMediaSuggestionMetadata;
  v5 = [(PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"locality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setLocality:](v5, "setLocality:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"serverTreatment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setServerTreatment:](v5, "setServerTreatment:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"clientTreatment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setClientTreatment:](v5, "setClientTreatment:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *)self dictionaryRepresentation];
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
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    unsigned int v7 = [(PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *)self locality] - 1;
    if (v7 > 2) {
      v8 = @"PLUSMEDIASUGGESTIONLOCALITY_UNKNOWN";
    }
    else {
      v8 = off_1E5EBBAD8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"locality"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  unsigned int v5 = [(PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *)self clientTreatment] - 1;
  if (v5 > 0xD) {
    v6 = @"PLUSMEDIASUGGESTIONCLIENTTREATMENT_UNKNOWN";
  }
  else {
    v6 = off_1E5EBBA68[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"clientTreatment"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_13:
    unsigned int v9 = [(PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *)self serverTreatment] - 1;
    if (v9 > 0xB) {
      v10 = @"PLUSMEDIASUGGESTIONSERVERTREATMENT_UNKNOWN";
    }
    else {
      v10 = off_1E5EBBAF0[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"serverTreatment"];
  }
LABEL_17:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_locality;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_serverTreatment;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_clientTreatment;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $C71143984B562F5DA6BBC15D783F3493 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int locality = self->_locality;
    if (locality != [v4 locality]) {
      goto LABEL_14;
    }
    $C71143984B562F5DA6BBC15D783F3493 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int serverTreatment = self->_serverTreatment;
    if (serverTreatment == [v4 serverTreatment])
    {
      $C71143984B562F5DA6BBC15D783F3493 has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int clientTreatment = self->_clientTreatment;
    if (clientTreatment != [v4 clientTreatment]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterMediaSuggestionMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteClientTreatment
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasClientTreatment:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasClientTreatment
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setClientTreatment:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int clientTreatment = a3;
}

- (void)deleteServerTreatment
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasServerTreatment:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerTreatment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServerTreatment:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int serverTreatment = a3;
}

- (void)deleteLocality
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLocality:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocality
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocality:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int locality = a3;
}

@end