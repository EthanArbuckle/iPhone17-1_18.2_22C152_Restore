@interface INFERENCESchemaINFERENCEEuclidServiceMetrics
- (BOOL)hasIsAsrE3Invoked;
- (BOOL)hasNumEuclidCandidates;
- (BOOL)isAsrE3Invoked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEEuclidServiceMetrics)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEEuclidServiceMetrics)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numEuclidCandidates;
- (void)deleteIsAsrE3Invoked;
- (void)deleteNumEuclidCandidates;
- (void)setHasIsAsrE3Invoked:(BOOL)a3;
- (void)setHasNumEuclidCandidates:(BOOL)a3;
- (void)setIsAsrE3Invoked:(BOOL)a3;
- (void)setNumEuclidCandidates:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEEuclidServiceMetrics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numEuclidCandidates
{
  return self->_numEuclidCandidates;
}

- (BOOL)isAsrE3Invoked
{
  return self->_isAsrE3Invoked;
}

- (INFERENCESchemaINFERENCEEuclidServiceMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INFERENCESchemaINFERENCEEuclidServiceMetrics;
  v5 = [(INFERENCESchemaINFERENCEEuclidServiceMetrics *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAsrE3Invoked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEEuclidServiceMetrics setIsAsrE3Invoked:](v5, "setIsAsrE3Invoked:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numEuclidCandidates"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEEuclidServiceMetrics setNumEuclidCandidates:](v5, "setNumEuclidCandidates:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEEuclidServiceMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEEuclidServiceMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEEuclidServiceMetrics *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEEuclidServiceMetrics isAsrE3Invoked](self, "isAsrE3Invoked"));
    [v3 setObject:v5 forKeyedSubscript:@"isAsrE3Invoked"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEEuclidServiceMetrics numEuclidCandidates](self, "numEuclidCandidates"));
    [v3 setObject:v6 forKeyedSubscript:@"numEuclidCandidates"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isAsrE3Invoked;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_numEuclidCandidates;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $C34EC254A8497177043C37FF4438BF9B has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int isAsrE3Invoked = self->_isAsrE3Invoked;
    if (isAsrE3Invoked != [v4 isAsrE3Invoked])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $C34EC254A8497177043C37FF4438BF9B has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int numEuclidCandidates = self->_numEuclidCandidates;
    if (numEuclidCandidates != [v4 numEuclidCandidates]) {
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
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEEuclidServiceMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumEuclidCandidates
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumEuclidCandidates:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumEuclidCandidates
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumEuclidCandidates:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numEuclidCandidates = a3;
}

- (void)deleteIsAsrE3Invoked
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsAsrE3Invoked:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAsrE3Invoked
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAsrE3Invoked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isAsrE3Invoked = a3;
}

@end