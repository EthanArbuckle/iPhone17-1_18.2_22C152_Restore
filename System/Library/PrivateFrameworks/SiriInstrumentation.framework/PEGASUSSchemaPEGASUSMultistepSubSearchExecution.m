@interface PEGASUSSchemaPEGASUSMultistepSubSearchExecution
- (BOOL)hasAugmentedQuery;
- (BOOL)hasHasAugmentedQuery;
- (BOOL)hasHasNextSteps;
- (BOOL)hasLoopbackDepth;
- (BOOL)hasNextSteps;
- (BOOL)hasParentDomain;
- (BOOL)hasSearchType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)subSearchDomains;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)loopbackDepth;
- (int)parentDomain;
- (int)searchType;
- (int)subSearchDomainsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)subSearchDomainsCount;
- (void)addSubSearchDomains:(int)a3;
- (void)clearSubSearchDomains;
- (void)deleteHasAugmentedQuery;
- (void)deleteHasNextSteps;
- (void)deleteLoopbackDepth;
- (void)deleteParentDomain;
- (void)deleteSearchType;
- (void)setHasAugmentedQuery:(BOOL)a3;
- (void)setHasHasAugmentedQuery:(BOOL)a3;
- (void)setHasHasNextSteps:(BOOL)a3;
- (void)setHasLoopbackDepth:(BOOL)a3;
- (void)setHasNextSteps:(BOOL)a3;
- (void)setHasParentDomain:(BOOL)a3;
- (void)setHasSearchType:(BOOL)a3;
- (void)setLoopbackDepth:(int)a3;
- (void)setParentDomain:(int)a3;
- (void)setSearchType:(int)a3;
- (void)setSubSearchDomains:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSMultistepSubSearchExecution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (BOOL)hasAugmentedQuery
{
  return self->_hasAugmentedQuery;
}

- (void)setSubSearchDomains:(id)a3
{
}

- (NSArray)subSearchDomains
{
  return self->_subSearchDomains;
}

- (int)searchType
{
  return self->_searchType;
}

- (BOOL)hasNextSteps
{
  return self->_hasNextSteps;
}

- (int)parentDomain
{
  return self->_parentDomain;
}

- (int)loopbackDepth
{
  return self->_loopbackDepth;
}

- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PEGASUSSchemaPEGASUSMultistepSubSearchExecution;
  v5 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"loopbackDepth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setLoopbackDepth:](v5, "setLoopbackDepth:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"parentDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setParentDomain:](v5, "setParentDomain:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"hasNextSteps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setHasNextSteps:](v5, "setHasNextSteps:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"searchType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setSearchType:](v5, "setSearchType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"subSearchDomains"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v8;
      v21 = v7;
      v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution addSubSearchDomains:](v5, "addSubSearchDomains:", [v16 intValue]);
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }

      v7 = v21;
      v6 = v22;
      v8 = v20;
    }
    v17 = [v4 objectForKeyedSubscript:@"hasAugmentedQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setHasAugmentedQuery:](v5, "setHasAugmentedQuery:", [v17 BOOLValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self dictionaryRepresentation];
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
  char v4 = *(&self->_hasAugmentedQuery + 1);
  if ((v4 & 0x10) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution hasAugmentedQuery](self, "hasAugmentedQuery"));
    [v3 setObject:v5 forKeyedSubscript:@"hasAugmentedQuery"];

    char v4 = *(&self->_hasAugmentedQuery + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(&self->_hasAugmentedQuery + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution hasNextSteps](self, "hasNextSteps"));
  [v3 setObject:v6 forKeyedSubscript:@"hasNextSteps"];

  char v4 = *(&self->_hasAugmentedQuery + 1);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution loopbackDepth](self, "loopbackDepth"));
  [v3 setObject:v7 forKeyedSubscript:@"loopbackDepth"];

  char v4 = *(&self->_hasAugmentedQuery + 1);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
LABEL_10:
  unsigned int v8 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self parentDomain] - 1;
  if (v8 > 0x1B) {
    v9 = @"PEGASUSDOMAIN_UNKNOWN";
  }
  else {
    v9 = off_1E5EBF3E8[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"parentDomain"];
  if ((*(&self->_hasAugmentedQuery + 1) & 8) != 0)
  {
LABEL_14:
    unsigned int v10 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self searchType] - 1;
    if (v10 > 6) {
      id v11 = @"PEGASUSMULTISTEPSEARCHTYPE_UNKNOWN";
    }
    else {
      id v11 = off_1E5EBF4C8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"searchType"];
  }
LABEL_18:
  if ([(NSArray *)self->_subSearchDomains count])
  {
    uint64_t v12 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self subSearchDomains];
    uint64_t v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"subSearchDomains"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_hasAugmentedQuery + 1))
  {
    uint64_t v3 = 2654435761 * self->_loopbackDepth;
    if ((*(&self->_hasAugmentedQuery + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_parentDomain;
      if ((*(&self->_hasAugmentedQuery + 1) & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(&self->_hasAugmentedQuery + 1) & 8) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(&self->_hasAugmentedQuery + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(&self->_hasAugmentedQuery + 1) & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_hasNextSteps;
  if ((*(&self->_hasAugmentedQuery + 1) & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_searchType;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  uint64_t v7 = [(NSArray *)self->_subSearchDomains hash];
  if ((*(&self->_hasAugmentedQuery + 1) & 0x10) != 0) {
    uint64_t v8 = 2654435761 * self->_hasAugmentedQuery;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_hasAugmentedQuery + 1);
  unsigned int v6 = v4[33];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_27;
  }
  if (v5)
  {
    int loopbackDepth = self->_loopbackDepth;
    if (loopbackDepth != [v4 loopbackDepth]) {
      goto LABEL_27;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_hasAugmentedQuery + 1);
    unsigned int v6 = v4[33];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v8)
  {
    int parentDomain = self->_parentDomain;
    if (parentDomain != [v4 parentDomain]) {
      goto LABEL_27;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_hasAugmentedQuery + 1);
    unsigned int v6 = v4[33];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v10)
  {
    int hasNextSteps = self->_hasNextSteps;
    if (hasNextSteps == [v4 hasNextSteps])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_hasAugmentedQuery + 1);
      unsigned int v6 = v4[33];
      goto LABEL_14;
    }
LABEL_27:
    BOOL v24 = 0;
    goto LABEL_28;
  }
LABEL_14:
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_27;
  }
  if (v12)
  {
    int searchType = self->_searchType;
    if (searchType != [v4 searchType]) {
      goto LABEL_27;
    }
  }
  uint64_t v14 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self subSearchDomains];
  uint64_t v15 = [v4 subSearchDomains];
  v16 = v15;
  if ((v14 == 0) == (v15 != 0))
  {

    goto LABEL_27;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self subSearchDomains];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self subSearchDomains];
    v20 = [v4 subSearchDomains];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  int v22 = (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 4) & 1;
  if (v22 != ((v4[33] >> 4) & 1)) {
    goto LABEL_27;
  }
  if (v22)
  {
    int hasAugmentedQuery = self->_hasAugmentedQuery;
    if (hasAugmentedQuery != [v4 hasAugmentedQuery]) {
      goto LABEL_27;
    }
  }
  BOOL v24 = 1;
LABEL_28:

  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = *(&self->_hasAugmentedQuery + 1);
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    char v5 = *(&self->_hasAugmentedQuery + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(&self->_hasAugmentedQuery + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char v5 = *(&self->_hasAugmentedQuery + 1);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_hasAugmentedQuery + 1) & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_subSearchDomains;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "intValue", (void)v11);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(&self->_hasAugmentedQuery + 1) & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSMultistepSubSearchExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasAugmentedQuery
{
  *(&self->_hasAugmentedQuery + 1) &= ~0x10u;
}

- (void)setHasHasAugmentedQuery:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xEF | v3;
}

- (BOOL)hasHasAugmentedQuery
{
  return (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 4) & 1;
}

- (void)setHasAugmentedQuery:(BOOL)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 0x10u;
  self->_int hasAugmentedQuery = a3;
}

- (int)subSearchDomainsAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_subSearchDomains objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)subSearchDomainsCount
{
  return [(NSArray *)self->_subSearchDomains count];
}

- (void)addSubSearchDomains:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  subSearchDomains = self->_subSearchDomains;
  if (!subSearchDomains)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_subSearchDomains;
    self->_subSearchDomains = v6;

    subSearchDomains = self->_subSearchDomains;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)subSearchDomains addObject:v8];
}

- (void)clearSubSearchDomains
{
}

- (void)deleteSearchType
{
  *(&self->_hasAugmentedQuery + 1) &= ~8u;
}

- (void)setHasSearchType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xF7 | v3;
}

- (BOOL)hasSearchType
{
  return (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 3) & 1;
}

- (void)setSearchType:(int)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 8u;
  self->_int searchType = a3;
}

- (void)deleteHasNextSteps
{
  *(&self->_hasAugmentedQuery + 1) &= ~4u;
}

- (void)setHasHasNextSteps:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xFB | v3;
}

- (BOOL)hasHasNextSteps
{
  return (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 2) & 1;
}

- (void)setHasNextSteps:(BOOL)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 4u;
  self->_int hasNextSteps = a3;
}

- (void)deleteParentDomain
{
  *(&self->_hasAugmentedQuery + 1) &= ~2u;
}

- (void)setHasParentDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xFD | v3;
}

- (BOOL)hasParentDomain
{
  return (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 1) & 1;
}

- (void)setParentDomain:(int)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 2u;
  self->_int parentDomain = a3;
}

- (void)deleteLoopbackDepth
{
  *(&self->_hasAugmentedQuery + 1) &= ~1u;
}

- (void)setHasLoopbackDepth:(BOOL)a3
{
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xFE | a3;
}

- (BOOL)hasLoopbackDepth
{
  return *(&self->_hasAugmentedQuery + 1);
}

- (void)setLoopbackDepth:(int)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 1u;
  self->_int loopbackDepth = a3;
}

@end