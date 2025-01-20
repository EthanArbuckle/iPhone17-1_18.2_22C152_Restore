@interface STSchemaSTGeneralSearchResult
- (BOOL)hasBundleId;
- (BOOL)hasGeneralSearchResultId;
- (BOOL)hasResultType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)bundleId;
- (SISchemaUUID)generalSearchResultId;
- (STSchemaSTGeneralSearchResult)initWithDictionary:(id)a3;
- (STSchemaSTGeneralSearchResult)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)resultType;
- (unint64_t)hash;
- (void)deleteBundleId;
- (void)deleteGeneralSearchResultId;
- (void)deleteResultType;
- (void)setBundleId:(id)a3;
- (void)setGeneralSearchResultId:(id)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasGeneralSearchResultId:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setResultType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTGeneralSearchResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STSchemaSTGeneralSearchResult;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(STSchemaSTGeneralSearchResult *)self deleteBundleId];
  }
  v6 = [(STSchemaSTGeneralSearchResult *)self generalSearchResultId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(STSchemaSTGeneralSearchResult *)self deleteGeneralSearchResultId];
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
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_generalSearchResultId, 0);
}

- (void)setHasBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasGeneralSearchResultId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)resultType
{
  return self->_resultType;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setGeneralSearchResultId:(id)a3
{
}

- (SISchemaUUID)generalSearchResultId
{
  return self->_generalSearchResultId;
}

- (STSchemaSTGeneralSearchResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSchemaSTGeneralSearchResult;
  v5 = [(STSchemaSTGeneralSearchResult *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"generalSearchResultId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(STSchemaSTGeneralSearchResult *)v5 setGeneralSearchResultId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(STSchemaSTGeneralSearchResult *)v5 setBundleId:v9];
    }
    objc_super v10 = [v4 objectForKeyedSubscript:@"resultType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTGeneralSearchResult setResultType:](v5, "setResultType:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (STSchemaSTGeneralSearchResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTGeneralSearchResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTGeneralSearchResult *)self dictionaryRepresentation];
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
    id v4 = [(STSchemaSTGeneralSearchResult *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (self->_generalSearchResultId)
  {
    v6 = [(STSchemaSTGeneralSearchResult *)self generalSearchResultId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"generalSearchResultId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"generalSearchResultId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v9 = [(STSchemaSTGeneralSearchResult *)self resultType] - 1;
    if (v9 > 3) {
      objc_super v10 = @"STGENERALSEARCHRESULTTYPE_UNKNOWN";
    }
    else {
      objc_super v10 = off_1E5EC0D58[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"resultType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_generalSearchResultId hash];
  NSUInteger v4 = [(NSString *)self->_bundleId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_resultType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(STSchemaSTGeneralSearchResult *)self generalSearchResultId];
  v6 = [v4 generalSearchResultId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(STSchemaSTGeneralSearchResult *)self generalSearchResultId];
  if (v7)
  {
    int v8 = (void *)v7;
    unsigned int v9 = [(STSchemaSTGeneralSearchResult *)self generalSearchResultId];
    objc_super v10 = [v4 generalSearchResultId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(STSchemaSTGeneralSearchResult *)self bundleId];
  v6 = [v4 bundleId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(STSchemaSTGeneralSearchResult *)self bundleId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(STSchemaSTGeneralSearchResult *)self bundleId];
    v15 = [v4 bundleId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int resultType = self->_resultType, resultType == [v4 resultType]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(STSchemaSTGeneralSearchResult *)self generalSearchResultId];

  if (v4)
  {
    uint64_t v5 = [(STSchemaSTGeneralSearchResult *)self generalSearchResultId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(STSchemaSTGeneralSearchResult *)self bundleId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = v8;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTGeneralSearchResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteResultType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResultType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int resultType = a3;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)deleteGeneralSearchResultId
{
}

- (BOOL)hasGeneralSearchResultId
{
  return self->_generalSearchResultId != 0;
}

@end