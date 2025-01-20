@interface NETSchemaNETEstablishmentResolution
- (BOOL)hasDuration;
- (BOOL)hasEndpointCount;
- (BOOL)hasPreferredEndpoint;
- (BOOL)hasResolutionSource;
- (BOOL)hasSuccessfulEndpoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETEndpoint)preferredEndpoint;
- (NETSchemaNETEndpoint)successfulEndpoint;
- (NETSchemaNETEstablishmentResolution)initWithDictionary:(id)a3;
- (NETSchemaNETEstablishmentResolution)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)duration;
- (unint64_t)hash;
- (unsigned)endpointCount;
- (unsigned)resolutionSource;
- (void)deleteDuration;
- (void)deleteEndpointCount;
- (void)deletePreferredEndpoint;
- (void)deleteResolutionSource;
- (void)deleteSuccessfulEndpoint;
- (void)setDuration:(unint64_t)a3;
- (void)setEndpointCount:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEndpointCount:(BOOL)a3;
- (void)setHasPreferredEndpoint:(BOOL)a3;
- (void)setHasResolutionSource:(BOOL)a3;
- (void)setHasSuccessfulEndpoint:(BOOL)a3;
- (void)setPreferredEndpoint:(id)a3;
- (void)setResolutionSource:(unsigned int)a3;
- (void)setSuccessfulEndpoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETEstablishmentResolution

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETSchemaNETEstablishmentResolution;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETEstablishmentResolution *)self successfulEndpoint];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NETSchemaNETEstablishmentResolution *)self deleteSuccessfulEndpoint];
  }
  v9 = [(NETSchemaNETEstablishmentResolution *)self preferredEndpoint];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NETSchemaNETEstablishmentResolution *)self deletePreferredEndpoint];
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
  objc_storeStrong((id *)&self->_preferredEndpoint, 0);
  objc_storeStrong((id *)&self->_successfulEndpoint, 0);
}

- (void)setHasPreferredEndpoint:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSuccessfulEndpoint:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)endpointCount
{
  return self->_endpointCount;
}

- (void)setPreferredEndpoint:(id)a3
{
}

- (NETSchemaNETEndpoint)preferredEndpoint
{
  return self->_preferredEndpoint;
}

- (void)setSuccessfulEndpoint:(id)a3
{
}

- (NETSchemaNETEndpoint)successfulEndpoint
{
  return self->_successfulEndpoint;
}

- (unsigned)resolutionSource
{
  return self->_resolutionSource;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NETSchemaNETEstablishmentResolution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NETSchemaNETEstablishmentResolution;
  v5 = [(NETSchemaNETEstablishmentResolution *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"duration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETEstablishmentResolution setDuration:](v5, "setDuration:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"resolutionSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETEstablishmentResolution setResolutionSource:](v5, "setResolutionSource:", [v7 unsignedIntValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"successfulEndpoint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[NETSchemaNETEndpoint alloc] initWithDictionary:v8];
      [(NETSchemaNETEstablishmentResolution *)v5 setSuccessfulEndpoint:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"preferredEndpoint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NETSchemaNETEndpoint alloc] initWithDictionary:v10];
      [(NETSchemaNETEstablishmentResolution *)v5 setPreferredEndpoint:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"endpointCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETEstablishmentResolution setEndpointCount:](v5, "setEndpointCount:", [v12 unsignedIntValue]);
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (NETSchemaNETEstablishmentResolution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETEstablishmentResolution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETEstablishmentResolution *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETEstablishmentResolution duration](self, "duration"));
    [v3 setObject:v5 forKeyedSubscript:@"duration"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETEstablishmentResolution endpointCount](self, "endpointCount"));
    [v3 setObject:v6 forKeyedSubscript:@"endpointCount"];
  }
  if (self->_preferredEndpoint)
  {
    uint64_t v7 = [(NETSchemaNETEstablishmentResolution *)self preferredEndpoint];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"preferredEndpoint"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"preferredEndpoint"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETEstablishmentResolution resolutionSource](self, "resolutionSource"));
    [v3 setObject:v10 forKeyedSubscript:@"resolutionSource"];
  }
  if (self->_successfulEndpoint)
  {
    int v11 = [(NETSchemaNETEstablishmentResolution *)self successfulEndpoint];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"successfulEndpoint"];
    }
    else
    {
      objc_super v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"successfulEndpoint"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_duration;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_resolutionSource;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(NETSchemaNETEndpoint *)self->_successfulEndpoint hash];
  unint64_t v6 = [(NETSchemaNETEndpoint *)self->_preferredEndpoint hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_endpointCount;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  $774C9EF78E5B1D149F19EE7077FF2BC2 has = self->_has;
  unsigned int v6 = v4[44];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t duration = self->_duration;
    if (duration != [v4 duration]) {
      goto LABEL_19;
    }
    $774C9EF78E5B1D149F19EE7077FF2BC2 has = self->_has;
    unsigned int v6 = v4[44];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    unsigned int resolutionSource = self->_resolutionSource;
    if (resolutionSource != [v4 resolutionSource]) {
      goto LABEL_19;
    }
  }
  v10 = [(NETSchemaNETEstablishmentResolution *)self successfulEndpoint];
  int v11 = [v4 successfulEndpoint];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_18;
  }
  uint64_t v12 = [(NETSchemaNETEstablishmentResolution *)self successfulEndpoint];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(NETSchemaNETEstablishmentResolution *)self successfulEndpoint];
    objc_super v15 = [v4 successfulEndpoint];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  v10 = [(NETSchemaNETEstablishmentResolution *)self preferredEndpoint];
  int v11 = [v4 preferredEndpoint];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(NETSchemaNETEstablishmentResolution *)self preferredEndpoint];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(NETSchemaNETEstablishmentResolution *)self preferredEndpoint];
    v20 = [v4 preferredEndpoint];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int v24 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v24 == ((v4[44] >> 2) & 1))
  {
    if (!v24
      || (unsigned int endpointCount = self->_endpointCount, endpointCount == [v4 endpointCount]))
    {
      BOOL v22 = 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  unint64_t v5 = [(NETSchemaNETEstablishmentResolution *)self successfulEndpoint];

  if (v5)
  {
    unsigned int v6 = [(NETSchemaNETEstablishmentResolution *)self successfulEndpoint];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(NETSchemaNETEstablishmentResolution *)self preferredEndpoint];

  if (v7)
  {
    int v8 = [(NETSchemaNETEstablishmentResolution *)self preferredEndpoint];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETEstablishmentResolutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteEndpointCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasEndpointCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndpointCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEndpointCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int endpointCount = a3;
}

- (void)deletePreferredEndpoint
{
}

- (BOOL)hasPreferredEndpoint
{
  return self->_preferredEndpoint != 0;
}

- (void)deleteSuccessfulEndpoint
{
}

- (BOOL)hasSuccessfulEndpoint
{
  return self->_successfulEndpoint != 0;
}

- (void)deleteResolutionSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResolutionSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResolutionSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResolutionSource:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int resolutionSource = a3;
}

- (void)deleteDuration
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t duration = a3;
}

@end