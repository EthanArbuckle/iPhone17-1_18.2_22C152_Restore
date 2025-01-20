@interface ODDSiriSchemaODDRequestsWithoutAssetsCounts
- (BOOL)hasRequestsMissingAssetsCount;
- (BOOL)hasRequestsRequiringAssetsCount;
- (BOOL)hasRequestsWithFailuresCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDRequestsWithoutAssetsCounts)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDRequestsWithoutAssetsCounts)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)requestsMissingAssetsCount;
- (unsigned)requestsRequiringAssetsCount;
- (unsigned)requestsWithFailuresCount;
- (void)deleteRequestsMissingAssetsCount;
- (void)deleteRequestsRequiringAssetsCount;
- (void)deleteRequestsWithFailuresCount;
- (void)setHasRequestsMissingAssetsCount:(BOOL)a3;
- (void)setHasRequestsRequiringAssetsCount:(BOOL)a3;
- (void)setHasRequestsWithFailuresCount:(BOOL)a3;
- (void)setRequestsMissingAssetsCount:(unsigned int)a3;
- (void)setRequestsRequiringAssetsCount:(unsigned int)a3;
- (void)setRequestsWithFailuresCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDRequestsWithoutAssetsCounts

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)requestsWithFailuresCount
{
  return self->_requestsWithFailuresCount;
}

- (unsigned)requestsMissingAssetsCount
{
  return self->_requestsMissingAssetsCount;
}

- (unsigned)requestsRequiringAssetsCount
{
  return self->_requestsRequiringAssetsCount;
}

- (ODDSiriSchemaODDRequestsWithoutAssetsCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ODDSiriSchemaODDRequestsWithoutAssetsCounts;
  v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsCounts *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestsRequiringAssetsCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsRequiringAssetsCount:](v5, "setRequestsRequiringAssetsCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"requestsMissingAssetsCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsMissingAssetsCount:](v5, "setRequestsMissingAssetsCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"requestsWithFailuresCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsWithFailuresCount:](v5, "setRequestsWithFailuresCount:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDRequestsWithoutAssetsCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDRequestsWithoutAssetsCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDRequestsWithoutAssetsCounts *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDRequestsWithoutAssetsCounts requestsMissingAssetsCount](self, "requestsMissingAssetsCount"));
    [v3 setObject:v7 forKeyedSubscript:@"requestsMissingAssetsCount"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDRequestsWithoutAssetsCounts requestsRequiringAssetsCount](self, "requestsRequiringAssetsCount"));
  [v3 setObject:v8 forKeyedSubscript:@"requestsRequiringAssetsCount"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDRequestsWithoutAssetsCounts requestsWithFailuresCount](self, "requestsWithFailuresCount"));
    [v3 setObject:v5 forKeyedSubscript:@"requestsWithFailuresCount"];
  }
LABEL_5:
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
  uint64_t v2 = 2654435761 * self->_requestsRequiringAssetsCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_requestsMissingAssetsCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_requestsWithFailuresCount;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $E2296BA4C6D7F3FD3EB21890FBD91B8B has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int requestsRequiringAssetsCount = self->_requestsRequiringAssetsCount;
    if (requestsRequiringAssetsCount != [v4 requestsRequiringAssetsCount]) {
      goto LABEL_14;
    }
    $E2296BA4C6D7F3FD3EB21890FBD91B8B has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unsigned int requestsMissingAssetsCount = self->_requestsMissingAssetsCount;
    if (requestsMissingAssetsCount == [v4 requestsMissingAssetsCount])
    {
      $E2296BA4C6D7F3FD3EB21890FBD91B8B has = self->_has;
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
    unsigned int requestsWithFailuresCount = self->_requestsWithFailuresCount;
    if (requestsWithFailuresCount != [v4 requestsWithFailuresCount]) {
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
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDRequestsWithoutAssetsCountsReadFrom(self, (uint64_t)a3);
}

- (void)deleteRequestsWithFailuresCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasRequestsWithFailuresCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestsWithFailuresCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRequestsWithFailuresCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int requestsWithFailuresCount = a3;
}

- (void)deleteRequestsMissingAssetsCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRequestsMissingAssetsCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestsMissingAssetsCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestsMissingAssetsCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int requestsMissingAssetsCount = a3;
}

- (void)deleteRequestsRequiringAssetsCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRequestsRequiringAssetsCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestsRequiringAssetsCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestsRequiringAssetsCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int requestsRequiringAssetsCount = a3;
}

@end