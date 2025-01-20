@interface PLUSSchemaPLUSContactGroundTruthSourceSummary
- (BOOL)hasCount;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactGroundTruthSourceSummary)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactGroundTruthSourceSummary)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)source;
- (unint64_t)count;
- (unint64_t)hash;
- (void)deleteCount;
- (void)deleteSource;
- (void)setCount:(unint64_t)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactGroundTruthSourceSummary

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)count
{
  return self->_count;
}

- (int)source
{
  return self->_source;
}

- (PLUSSchemaPLUSContactGroundTruthSourceSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSContactGroundTruthSourceSummary;
  v5 = [(PLUSSchemaPLUSContactGroundTruthSourceSummary *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactGroundTruthSourceSummary setSource:](v5, "setSource:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"count"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactGroundTruthSourceSummary setCount:](v5, "setCount:", [v7 unsignedLongLongValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactGroundTruthSourceSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactGroundTruthSourceSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactGroundTruthSourceSummary *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSContactGroundTruthSourceSummary count](self, "count"));
    [v3 setObject:v5 forKeyedSubscript:@"count"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(PLUSSchemaPLUSContactGroundTruthSourceSummary *)self source] - 1;
    if (v6 > 0xD) {
      uint64_t v7 = @"PLUSCONTACTGROUNDTRUTHSOURCE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB3F90[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"source"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_source;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_count;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $C20513E236D6217C0A9D094F24ABAC7D has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int source = self->_source;
    if (source != [v4 source])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $C20513E236D6217C0A9D094F24ABAC7D has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unint64_t count = self->_count;
    if (count != [v4 count]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactGroundTruthSourceSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t count = a3;
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