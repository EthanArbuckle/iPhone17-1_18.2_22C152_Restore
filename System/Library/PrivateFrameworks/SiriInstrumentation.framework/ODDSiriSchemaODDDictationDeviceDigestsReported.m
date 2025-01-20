@interface ODDSiriSchemaODDDictationDeviceDigestsReported
- (BOOL)hasFixedDimensions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)digests;
- (NSData)jsonData;
- (ODDSiriSchemaODDDictationDeviceDigestsReported)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDictationDeviceDigestsReported)initWithJSON:(id)a3;
- (ODDSiriSchemaODDFixedDimensions)fixedDimensions;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)digestsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)digestsCount;
- (unint64_t)hash;
- (void)addDigests:(id)a3;
- (void)clearDigests;
- (void)deleteFixedDimensions;
- (void)setDigests:(id)a3;
- (void)setFixedDimensions:(id)a3;
- (void)setHasFixedDimensions:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDictationDeviceDigestsReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDDictationDeviceDigestsReported;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self fixedDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self deleteFixedDimensions];
  }
  v9 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self digests];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self setDigests:v10];

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
}

- (void)setHasFixedDimensions:(BOOL)a3
{
  self->_hasFixedDimensions = a3;
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

- (ODDSiriSchemaODDDictationDeviceDigestsReported)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ODDSiriSchemaODDDictationDeviceDigestsReported;
  v5 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"fixedDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDFixedDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDDictationDeviceDigestsReported *)v5 setFixedDimensions:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"digests"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[ODDSiriSchemaODDDictationDigest alloc] initWithDictionary:v14];
              [(ODDSiriSchemaODDDictationDeviceDigestsReported *)v5 addDigests:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDictationDeviceDigestsReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_digests count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_digests;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"digests"];
  }
  if (self->_fixedDimensions)
  {
    uint64_t v12 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self fixedDimensions];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"fixedDimensions"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"fixedDimensions"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDFixedDimensions *)self->_fixedDimensions hash];
  return [(NSArray *)self->_digests hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self fixedDimensions];
  uint64_t v6 = [v4 fixedDimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self fixedDimensions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self fixedDimensions];
    uint64_t v10 = [v4 fixedDimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self digests];
  uint64_t v6 = [v4 digests];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self digests];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self digests];
    v15 = [v4 digests];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self fixedDimensions];

  if (v5)
  {
    uint64_t v6 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self fixedDimensions];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_digests;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationDeviceDigestsReportedReadFrom(self, (uint64_t)a3);
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
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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

@end