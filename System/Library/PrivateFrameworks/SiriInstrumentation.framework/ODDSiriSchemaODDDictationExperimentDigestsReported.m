@interface ODDSiriSchemaODDDictationExperimentDigestsReported
- (BOOL)hasDigestType;
- (BOOL)hasExperimentFixedDimensions;
- (BOOL)hasFixedDimensions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)digests;
- (NSData)jsonData;
- (ODDSiriSchemaODDDictationExperimentDigestsReported)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDictationExperimentDigestsReported)initWithJSON:(id)a3;
- (ODDSiriSchemaODDExperimentFixedDimensions)experimentFixedDimensions;
- (ODDSiriSchemaODDFixedDimensions)fixedDimensions;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)digestsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)digestType;
- (unint64_t)digestsCount;
- (unint64_t)hash;
- (void)addDigests:(id)a3;
- (void)clearDigests;
- (void)deleteDigestType;
- (void)deleteExperimentFixedDimensions;
- (void)deleteFixedDimensions;
- (void)setDigestType:(int)a3;
- (void)setDigests:(id)a3;
- (void)setExperimentFixedDimensions:(id)a3;
- (void)setFixedDimensions:(id)a3;
- (void)setHasDigestType:(BOOL)a3;
- (void)setHasExperimentFixedDimensions:(BOOL)a3;
- (void)setHasFixedDimensions:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDictationExperimentDigestsReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODDSiriSchemaODDDictationExperimentDigestsReported;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self experimentFixedDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self deleteExperimentFixedDimensions];
  }
  v9 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self fixedDimensions];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self deleteFixedDimensions];
  }
  v12 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self digests];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self setDigests:v13];

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
  objc_storeStrong((id *)&self->_digests, 0);
  objc_storeStrong((id *)&self->_fixedDimensions, 0);
  objc_storeStrong((id *)&self->_experimentFixedDimensions, 0);
}

- (void)setHasFixedDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasExperimentFixedDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDigests:(id)a3
{
}

- (NSArray)digests
{
  return self->_digests;
}

- (void)setFixedDimensions:(id)a3
{
}

- (ODDSiriSchemaODDFixedDimensions)fixedDimensions
{
  return self->_fixedDimensions;
}

- (void)setExperimentFixedDimensions:(id)a3
{
}

- (ODDSiriSchemaODDExperimentFixedDimensions)experimentFixedDimensions
{
  return self->_experimentFixedDimensions;
}

- (int)digestType
{
  return self->_digestType;
}

- (ODDSiriSchemaODDDictationExperimentDigestsReported)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ODDSiriSchemaODDDictationExperimentDigestsReported;
  v5 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"digestType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDictationExperimentDigestsReported setDigestType:](v5, "setDigestType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"experimentFixedDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[ODDSiriSchemaODDExperimentFixedDimensions alloc] initWithDictionary:v7];
      [(ODDSiriSchemaODDDictationExperimentDigestsReported *)v5 setExperimentFixedDimensions:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"fixedDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[ODDSiriSchemaODDFixedDimensions alloc] initWithDictionary:v9];
      [(ODDSiriSchemaODDDictationExperimentDigestsReported *)v5 setFixedDimensions:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"digests"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v9;
      v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [[ODDSiriSchemaODDDictationExperimentDigest alloc] initWithDictionary:v17];
              [(ODDSiriSchemaODDDictationExperimentDigestsReported *)v5 addDigests:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v14);
      }

      v6 = v22;
      v9 = v21;
    }
    v19 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDictationExperimentDigestsReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self digestType] - 1;
    if (v4 > 3) {
      v5 = @"ODDEXPERIMENTDIGESTTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EC1770[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"digestType"];
  }
  if ([(NSArray *)self->_digests count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = self->_digests;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"digests"];
  }
  if (self->_experimentFixedDimensions)
  {
    uint64_t v14 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self experimentFixedDimensions];
    uint64_t v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"experimentFixedDimensions"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"experimentFixedDimensions"];
    }
  }
  if (self->_fixedDimensions)
  {
    uint64_t v17 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self fixedDimensions];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"fixedDimensions"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"fixedDimensions"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v21);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_digestType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ODDSiriSchemaODDExperimentFixedDimensions *)self->_experimentFixedDimensions hash] ^ v3;
  unint64_t v5 = [(ODDSiriSchemaODDFixedDimensions *)self->_fixedDimensions hash];
  return v4 ^ v5 ^ [(NSArray *)self->_digests hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int digestType = self->_digestType;
    if (digestType != [v4 digestType]) {
      goto LABEL_20;
    }
  }
  v6 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self experimentFixedDimensions];
  uint64_t v7 = [v4 experimentFixedDimensions];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v8 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self experimentFixedDimensions];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self experimentFixedDimensions];
    int v11 = [v4 experimentFixedDimensions];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self fixedDimensions];
  uint64_t v7 = [v4 fixedDimensions];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self fixedDimensions];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self fixedDimensions];
    v16 = [v4 fixedDimensions];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self digests];
  uint64_t v7 = [v4 digests];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self digests];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self digests];
    long long v21 = [v4 digests];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self experimentFixedDimensions];

  if (v5)
  {
    v6 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self experimentFixedDimensions];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self fixedDimensions];

  if (v7)
  {
    uint64_t v8 = [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self fixedDimensions];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = self->_digests;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationExperimentDigestsReportedReadFrom(self, (uint64_t)a3);
}

- (id)digestsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_digests objectAtIndexedSubscript:a3];
}

- (unint64_t)digestsCount
{
  return [(NSArray *)self->_digests count];
}

- (void)addDigests:(id)a3
{
  id v4 = a3;
  digests = self->_digests;
  id v8 = v4;
  if (!digests)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_digests;
    self->_digests = v6;

    id v4 = v8;
    digests = self->_digests;
  }
  [(NSArray *)digests addObject:v4];
}

- (void)clearDigests
{
}

- (void)deleteFixedDimensions
{
}

- (BOOL)hasFixedDimensions
{
  return self->_fixedDimensions != 0;
}

- (void)deleteExperimentFixedDimensions
{
}

- (BOOL)hasExperimentFixedDimensions
{
  return self->_experimentFixedDimensions != 0;
}

- (void)deleteDigestType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDigestType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDigestType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDigestType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int digestType = a3;
}

@end