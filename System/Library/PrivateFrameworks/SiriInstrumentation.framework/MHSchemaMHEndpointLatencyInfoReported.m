@interface MHSchemaMHEndpointLatencyInfoReported
- (BOOL)hasCoreSpeechTrailingPacketLatency;
- (BOOL)hasCoreSpeechTrailingPacketLatencyInfo;
- (BOOL)hasFirstPacketLatencyInNs;
- (BOOL)hasTrailingPacketLatency;
- (BOOL)hasTrailingPacketLatencyInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHEndpointLatencyInfoReported)initWithDictionary:(id)a3;
- (MHSchemaMHEndpointLatencyInfoReported)initWithJSON:(id)a3;
- (MHSchemaMHStatisticDistributionInfo)coreSpeechTrailingPacketLatency;
- (MHSchemaMHStatisticDistributionInfo)trailingPacketLatency;
- (MHSchemaMHTrailingPacketLatencyInfo)coreSpeechTrailingPacketLatencyInfo;
- (MHSchemaMHTrailingPacketLatencyInfo)trailingPacketLatencyInfo;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)firstPacketLatencyInNs;
- (unint64_t)hash;
- (void)deleteCoreSpeechTrailingPacketLatency;
- (void)deleteCoreSpeechTrailingPacketLatencyInfo;
- (void)deleteFirstPacketLatencyInNs;
- (void)deleteTrailingPacketLatency;
- (void)deleteTrailingPacketLatencyInfo;
- (void)setCoreSpeechTrailingPacketLatency:(id)a3;
- (void)setCoreSpeechTrailingPacketLatencyInfo:(id)a3;
- (void)setFirstPacketLatencyInNs:(unint64_t)a3;
- (void)setHasCoreSpeechTrailingPacketLatency:(BOOL)a3;
- (void)setHasCoreSpeechTrailingPacketLatencyInfo:(BOOL)a3;
- (void)setHasFirstPacketLatencyInNs:(BOOL)a3;
- (void)setHasTrailingPacketLatency:(BOOL)a3;
- (void)setHasTrailingPacketLatencyInfo:(BOOL)a3;
- (void)setTrailingPacketLatency:(id)a3;
- (void)setTrailingPacketLatencyInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHEndpointLatencyInfoReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MHSchemaMHEndpointLatencyInfoReported;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatencyInfo];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MHSchemaMHEndpointLatencyInfoReported *)self deleteTrailingPacketLatencyInfo];
  }
  v9 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatencyInfo];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MHSchemaMHEndpointLatencyInfoReported *)self deleteCoreSpeechTrailingPacketLatencyInfo];
  }
  v12 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatency];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MHSchemaMHEndpointLatencyInfoReported *)self deleteTrailingPacketLatency];
  }
  v15 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatency];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(MHSchemaMHEndpointLatencyInfoReported *)self deleteCoreSpeechTrailingPacketLatency];
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
  objc_storeStrong((id *)&self->_coreSpeechTrailingPacketLatency, 0);
  objc_storeStrong((id *)&self->_trailingPacketLatency, 0);
  objc_storeStrong((id *)&self->_coreSpeechTrailingPacketLatencyInfo, 0);
  objc_storeStrong((id *)&self->_trailingPacketLatencyInfo, 0);
}

- (void)setHasCoreSpeechTrailingPacketLatency:(BOOL)a3
{
  self->_hasTrailingPacketLatencyInfo = a3;
}

- (void)setHasTrailingPacketLatency:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCoreSpeechTrailingPacketLatencyInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTrailingPacketLatencyInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCoreSpeechTrailingPacketLatency:(id)a3
{
}

- (MHSchemaMHStatisticDistributionInfo)coreSpeechTrailingPacketLatency
{
  return self->_coreSpeechTrailingPacketLatency;
}

- (void)setTrailingPacketLatency:(id)a3
{
}

- (MHSchemaMHStatisticDistributionInfo)trailingPacketLatency
{
  return self->_trailingPacketLatency;
}

- (void)setCoreSpeechTrailingPacketLatencyInfo:(id)a3
{
}

- (MHSchemaMHTrailingPacketLatencyInfo)coreSpeechTrailingPacketLatencyInfo
{
  return self->_coreSpeechTrailingPacketLatencyInfo;
}

- (void)setTrailingPacketLatencyInfo:(id)a3
{
}

- (MHSchemaMHTrailingPacketLatencyInfo)trailingPacketLatencyInfo
{
  return self->_trailingPacketLatencyInfo;
}

- (unint64_t)firstPacketLatencyInNs
{
  return self->_firstPacketLatencyInNs;
}

- (MHSchemaMHEndpointLatencyInfoReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MHSchemaMHEndpointLatencyInfoReported;
  v5 = [(MHSchemaMHEndpointLatencyInfoReported *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"firstPacketLatencyInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointLatencyInfoReported setFirstPacketLatencyInNs:](v5, "setFirstPacketLatencyInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"trailingPacketLatencyInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[MHSchemaMHTrailingPacketLatencyInfo alloc] initWithDictionary:v7];
      [(MHSchemaMHEndpointLatencyInfoReported *)v5 setTrailingPacketLatencyInfo:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"coreSpeechTrailingPacketLatencyInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[MHSchemaMHTrailingPacketLatencyInfo alloc] initWithDictionary:v9];
      [(MHSchemaMHEndpointLatencyInfoReported *)v5 setCoreSpeechTrailingPacketLatencyInfo:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"trailingPacketLatency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[MHSchemaMHStatisticDistributionInfo alloc] initWithDictionary:v11];
      [(MHSchemaMHEndpointLatencyInfoReported *)v5 setTrailingPacketLatency:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"coreSpeechTrailingPacketLatency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[MHSchemaMHStatisticDistributionInfo alloc] initWithDictionary:v13];
      [(MHSchemaMHEndpointLatencyInfoReported *)v5 setCoreSpeechTrailingPacketLatency:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (MHSchemaMHEndpointLatencyInfoReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHEndpointLatencyInfoReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHEndpointLatencyInfoReported *)self dictionaryRepresentation];
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
  if (self->_coreSpeechTrailingPacketLatency)
  {
    id v4 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatency];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"coreSpeechTrailingPacketLatency"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"coreSpeechTrailingPacketLatency"];
    }
  }
  if (self->_coreSpeechTrailingPacketLatencyInfo)
  {
    uint64_t v7 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatencyInfo];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"coreSpeechTrailingPacketLatencyInfo"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"coreSpeechTrailingPacketLatencyInfo"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointLatencyInfoReported firstPacketLatencyInNs](self, "firstPacketLatencyInNs"));
    [v3 setObject:v10 forKeyedSubscript:@"firstPacketLatencyInNs"];
  }
  if (self->_trailingPacketLatency)
  {
    int v11 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatency];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"trailingPacketLatency"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"trailingPacketLatency"];
    }
  }
  if (self->_trailingPacketLatencyInfo)
  {
    int v14 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatencyInfo];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"trailingPacketLatencyInfo"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"trailingPacketLatencyInfo"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_firstPacketLatencyInNs;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(MHSchemaMHTrailingPacketLatencyInfo *)self->_trailingPacketLatencyInfo hash] ^ v3;
  unint64_t v5 = [(MHSchemaMHTrailingPacketLatencyInfo *)self->_coreSpeechTrailingPacketLatencyInfo hash];
  unint64_t v6 = v4 ^ v5 ^ [(MHSchemaMHStatisticDistributionInfo *)self->_trailingPacketLatency hash];
  return v6 ^ [(MHSchemaMHStatisticDistributionInfo *)self->_coreSpeechTrailingPacketLatency hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t firstPacketLatencyInNs = self->_firstPacketLatencyInNs;
    if (firstPacketLatencyInNs != [v4 firstPacketLatencyInNs]) {
      goto LABEL_25;
    }
  }
  unint64_t v6 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatencyInfo];
  uint64_t v7 = [v4 trailingPacketLatencyInfo];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v8 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatencyInfo];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatencyInfo];
    int v11 = [v4 trailingPacketLatencyInfo];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatencyInfo];
  uint64_t v7 = [v4 coreSpeechTrailingPacketLatencyInfo];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v13 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatencyInfo];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatencyInfo];
    v16 = [v4 coreSpeechTrailingPacketLatencyInfo];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatency];
  uint64_t v7 = [v4 trailingPacketLatency];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v18 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatency];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatency];
    v21 = [v4 trailingPacketLatency];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatency];
  uint64_t v7 = [v4 coreSpeechTrailingPacketLatency];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatency];
    if (!v23)
    {

LABEL_28:
      BOOL v28 = 1;
      goto LABEL_26;
    }
    v24 = (void *)v23;
    v25 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatency];
    v26 = [v4 coreSpeechTrailingPacketLatency];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v4 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatencyInfo];

  if (v4)
  {
    unint64_t v5 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatencyInfo];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatencyInfo];

  if (v6)
  {
    uint64_t v7 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatencyInfo];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatency];

  if (v8)
  {
    v9 = [(MHSchemaMHEndpointLatencyInfoReported *)self trailingPacketLatency];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatency];

  int v11 = v13;
  if (v10)
  {
    int v12 = [(MHSchemaMHEndpointLatencyInfoReported *)self coreSpeechTrailingPacketLatency];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHEndpointLatencyInfoReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteCoreSpeechTrailingPacketLatency
{
}

- (BOOL)hasCoreSpeechTrailingPacketLatency
{
  return self->_coreSpeechTrailingPacketLatency != 0;
}

- (void)deleteTrailingPacketLatency
{
}

- (BOOL)hasTrailingPacketLatency
{
  return self->_trailingPacketLatency != 0;
}

- (void)deleteCoreSpeechTrailingPacketLatencyInfo
{
}

- (BOOL)hasCoreSpeechTrailingPacketLatencyInfo
{
  return self->_coreSpeechTrailingPacketLatencyInfo != 0;
}

- (void)deleteTrailingPacketLatencyInfo
{
}

- (BOOL)hasTrailingPacketLatencyInfo
{
  return self->_trailingPacketLatencyInfo != 0;
}

- (void)deleteFirstPacketLatencyInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFirstPacketLatencyInNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFirstPacketLatencyInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFirstPacketLatencyInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t firstPacketLatencyInNs = a3;
}

@end