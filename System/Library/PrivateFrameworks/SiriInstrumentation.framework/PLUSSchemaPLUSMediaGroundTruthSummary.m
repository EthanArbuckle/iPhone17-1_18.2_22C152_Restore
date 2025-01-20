@interface PLUSSchemaPLUSMediaGroundTruthSummary
- (BOOL)hasGroundTruthCount;
- (BOOL)hasMediaEntityCount;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSMediaGroundTruthSummary)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSMediaGroundTruthSummary)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)groundTruthCount;
- (int)mediaEntityCount;
- (int)source;
- (unint64_t)hash;
- (void)deleteGroundTruthCount;
- (void)deleteMediaEntityCount;
- (void)deleteSource;
- (void)setGroundTruthCount:(int)a3;
- (void)setHasGroundTruthCount:(BOOL)a3;
- (void)setHasMediaEntityCount:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setMediaEntityCount:(int)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSMediaGroundTruthSummary

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)mediaEntityCount
{
  return self->_mediaEntityCount;
}

- (int)groundTruthCount
{
  return self->_groundTruthCount;
}

- (int)source
{
  return self->_source;
}

- (PLUSSchemaPLUSMediaGroundTruthSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUSSchemaPLUSMediaGroundTruthSummary;
  v5 = [(PLUSSchemaPLUSMediaGroundTruthSummary *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaGroundTruthSummary setSource:](v5, "setSource:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"groundTruthCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaGroundTruthSummary setGroundTruthCount:](v5, "setGroundTruthCount:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"mediaEntityCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaGroundTruthSummary setMediaEntityCount:](v5, "setMediaEntityCount:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSMediaGroundTruthSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSMediaGroundTruthSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSMediaGroundTruthSummary *)self dictionaryRepresentation];
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
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[PLUSSchemaPLUSMediaGroundTruthSummary mediaEntityCount](self, "mediaEntityCount"));
    [v3 setObject:v6 forKeyedSubscript:@"mediaEntityCount"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_7:
    unsigned int v7 = [(PLUSSchemaPLUSMediaGroundTruthSummary *)self source] - 1;
    if (v7 > 8) {
      v8 = @"PLUSMEDIAGROUNDTRUTHSOURCE_UNKNOWN";
    }
    else {
      v8 = off_1E5EBA7C0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"source"];
    goto LABEL_11;
  }
  v5 = objc_msgSend(NSNumber, "numberWithInt:", -[PLUSSchemaPLUSMediaGroundTruthSummary groundTruthCount](self, "groundTruthCount"));
  [v3 setObject:v5 forKeyedSubscript:@"groundTruthCount"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (has) {
    goto LABEL_7;
  }
LABEL_11:
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
  uint64_t v2 = 2654435761 * self->_source;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_groundTruthCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_mediaEntityCount;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $617A844BD5AE851F84C0C4DED5AF263B has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int source = self->_source;
    if (source != [v4 source]) {
      goto LABEL_14;
    }
    $617A844BD5AE851F84C0C4DED5AF263B has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int groundTruthCount = self->_groundTruthCount;
    if (groundTruthCount == [v4 groundTruthCount])
    {
      $617A844BD5AE851F84C0C4DED5AF263B has = self->_has;
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
    int mediaEntityCount = self->_mediaEntityCount;
    if (mediaEntityCount != [v4 mediaEntityCount]) {
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
  return PLUSSchemaPLUSMediaGroundTruthSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteMediaEntityCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMediaEntityCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMediaEntityCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMediaEntityCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int mediaEntityCount = a3;
}

- (void)deleteGroundTruthCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasGroundTruthCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGroundTruthCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGroundTruthCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int groundTruthCount = a3;
}

- (void)deleteSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int source = a3;
}

@end