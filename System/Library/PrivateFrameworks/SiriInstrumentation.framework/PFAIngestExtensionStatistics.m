@interface PFAIngestExtensionStatistics
- (BOOL)hasBundleId;
- (BOOL)hasMessageCount;
- (BOOL)hasMissingTimestampCount;
- (BOOL)hasResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)bundleId;
- (PFAIngestExtensionStatistics)initWithDictionary:(id)a3;
- (PFAIngestExtensionStatistics)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)result;
- (unint64_t)hash;
- (unsigned)messageCount;
- (unsigned)missingTimestampCount;
- (void)deleteBundleId;
- (void)deleteMessageCount;
- (void)deleteMissingTimestampCount;
- (void)deleteResult;
- (void)setBundleId:(id)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasMessageCount:(BOOL)a3;
- (void)setHasMissingTimestampCount:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setMessageCount:(unsigned int)a3;
- (void)setMissingTimestampCount:(unsigned int)a3;
- (void)setResult:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAIngestExtensionStatistics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)missingTimestampCount
{
  return self->_missingTimestampCount;
}

- (unsigned)messageCount
{
  return self->_messageCount;
}

- (int)result
{
  return self->_result;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (PFAIngestExtensionStatistics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFAIngestExtensionStatistics;
  v5 = [(PFAIngestExtensionStatistics *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PFAIngestExtensionStatistics *)v5 setBundleId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"result"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAIngestExtensionStatistics setResult:](v5, "setResult:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"messageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAIngestExtensionStatistics setMessageCount:](v5, "setMessageCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"missingTimestampCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAIngestExtensionStatistics setMissingTimestampCount:](v5, "setMissingTimestampCount:", [v10 unsignedIntValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (PFAIngestExtensionStatistics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAIngestExtensionStatistics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAIngestExtensionStatistics *)self dictionaryRepresentation];
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
  if (self->_bundleId)
  {
    id v4 = [(PFAIngestExtensionStatistics *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAIngestExtensionStatistics missingTimestampCount](self, "missingTimestampCount"));
    [v3 setObject:v8 forKeyedSubscript:@"missingTimestampCount"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_13;
    }
LABEL_9:
    unsigned int v9 = [(PFAIngestExtensionStatistics *)self result] - 1;
    if (v9 > 3) {
      v10 = @"EXTENSIONRESULT_UNKNOWN";
    }
    else {
      v10 = off_1E5EBF270[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"result"];
    goto LABEL_13;
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAIngestExtensionStatistics messageCount](self, "messageCount"));
  [v3 setObject:v7 forKeyedSubscript:@"messageCount"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_8;
  }
LABEL_5:
  if (has) {
    goto LABEL_9;
  }
LABEL_13:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_result;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_messageCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_missingTimestampCount;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(PFAIngestExtensionStatistics *)self bundleId];
  uint64_t v6 = [v4 bundleId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(PFAIngestExtensionStatistics *)self bundleId];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    v10 = [(PFAIngestExtensionStatistics *)self bundleId];
    v11 = [v4 bundleId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $09D4D067779015D36E77362799C41D3B has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int v15 = self->_result;
    if (v15 != [v4 result]) {
      goto LABEL_20;
    }
    $09D4D067779015D36E77362799C41D3B has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    unsigned int messageCount = self->_messageCount;
    if (messageCount == [v4 messageCount])
    {
      $09D4D067779015D36E77362799C41D3B has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    unsigned int missingTimestampCount = self->_missingTimestampCount;
    if (missingTimestampCount != [v4 missingTimestampCount]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PFAIngestExtensionStatistics *)self bundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAIngestExtensionStatisticsReadFrom(self, (uint64_t)a3);
}

- (void)deleteMissingTimestampCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMissingTimestampCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMissingTimestampCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMissingTimestampCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int missingTimestampCount = a3;
}

- (void)deleteMessageCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMessageCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMessageCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int messageCount = a3;
}

- (void)deleteResult
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResult:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResult
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResult:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_result = a3;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

@end