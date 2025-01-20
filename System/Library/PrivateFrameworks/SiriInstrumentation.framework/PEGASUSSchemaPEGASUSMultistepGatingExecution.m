@interface PEGASUSSchemaPEGASUSMultistepGatingExecution
- (BOOL)hasLoopbackDepth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)domains;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSMultistepGatingExecution)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSMultistepGatingExecution)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)domainsAtIndex:(unint64_t)a3;
- (int)loopbackDepth;
- (unint64_t)domainsCount;
- (unint64_t)hash;
- (void)addDomains:(int)a3;
- (void)clearDomains;
- (void)deleteLoopbackDepth;
- (void)setDomains:(id)a3;
- (void)setHasLoopbackDepth:(BOOL)a3;
- (void)setLoopbackDepth:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSMultistepGatingExecution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setDomains:(id)a3
{
}

- (NSArray)domains
{
  return self->_domains;
}

- (int)loopbackDepth
{
  return self->_loopbackDepth;
}

- (PEGASUSSchemaPEGASUSMultistepGatingExecution)initWithDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PEGASUSSchemaPEGASUSMultistepGatingExecution;
  v5 = [(PEGASUSSchemaPEGASUSMultistepGatingExecution *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"loopbackDepth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMultistepGatingExecution setLoopbackDepth:](v5, "setLoopbackDepth:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"domains"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[PEGASUSSchemaPEGASUSMultistepGatingExecution addDomains:](v5, "addDomains:", objc_msgSend(v13, "intValue", (void)v16));
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v10);
      }
    }
    v14 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSMultistepGatingExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSMultistepGatingExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSMultistepGatingExecution *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_domains count])
  {
    id v4 = [(PEGASUSSchemaPEGASUSMultistepGatingExecution *)self domains];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"domains"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[PEGASUSSchemaPEGASUSMultistepGatingExecution loopbackDepth](self, "loopbackDepth"));
    [v3 setObject:v6 forKeyedSubscript:@"loopbackDepth"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_loopbackDepth;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSArray *)self->_domains hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int loopbackDepth = self->_loopbackDepth, loopbackDepth == [v4 loopbackDepth]))
      {
        v6 = [(PEGASUSSchemaPEGASUSMultistepGatingExecution *)self domains];
        uint64_t v7 = [v4 domains];
        id v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(PEGASUSSchemaPEGASUSMultistepGatingExecution *)self domains];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [(PEGASUSSchemaPEGASUSMultistepGatingExecution *)self domains];
          uint64_t v12 = [v4 domains];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_domains;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "intValue", (void)v10);
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSMultistepGatingExecutionReadFrom(self, (uint64_t)a3);
}

- (int)domainsAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_domains objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)domainsCount
{
  return [(NSArray *)self->_domains count];
}

- (void)addDomains:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  domains = self->_domains;
  if (!domains)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_domains;
    self->_domains = v6;

    domains = self->_domains;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)domains addObject:v8];
}

- (void)clearDomains
{
}

- (void)deleteLoopbackDepth
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLoopbackDepth:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLoopbackDepth
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLoopbackDepth:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int loopbackDepth = a3;
}

@end