@interface SIRINLUEXTERNALNLU_ROUTERTurnSummary
- (BOOL)hasExecutedQuery;
- (BOOL)hasExecutionSource;
- (BOOL)hasGenAiMetadata;
- (BOOL)hasResponseText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)executedQuery;
- (NSString)responseText;
- (SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata)genAiMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)executionSourceAsString:(int)a3;
- (int)StringAsExecutionSource:(id)a3;
- (int)executionSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExecutedQuery:(id)a3;
- (void)setExecutionSource:(int)a3;
- (void)setGenAiMetadata:(id)a3;
- (void)setHasExecutionSource:(BOOL)a3;
- (void)setResponseText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERTurnSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseText, 0);
  objc_storeStrong((id *)&self->_genAiMetadata, 0);
  objc_storeStrong((id *)&self->_executedQuery, 0);
}

- (void)setGenAiMetadata:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata)genAiMetadata
{
  return self->_genAiMetadata;
}

- (void)setResponseText:(id)a3
{
}

- (NSString)responseText
{
  return self->_responseText;
}

- (void)setExecutedQuery:(id)a3
{
}

- (NSString)executedQuery
{
  return self->_executedQuery;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  v7 = v4;
  if (*((void *)v4 + 1))
  {
    -[SIRINLUEXTERNALNLU_ROUTERTurnSummary setExecutedQuery:](self, "setExecutedQuery:");
    v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[SIRINLUEXTERNALNLU_ROUTERTurnSummary setResponseText:](self, "setResponseText:");
    v4 = v7;
  }
  if (v4[10])
  {
    self->_executionSource = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  genAiMetadata = self->_genAiMetadata;
  uint64_t v6 = *((void *)v4 + 3);
  if (genAiMetadata)
  {
    if (v6) {
      -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata mergeFrom:](genAiMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALNLU_ROUTERTurnSummary setGenAiMetadata:](self, "setGenAiMetadata:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_executedQuery hash];
  NSUInteger v4 = [(NSString *)self->_responseText hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_executionSource;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *)self->_genAiMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  executedQuery = self->_executedQuery;
  if ((unint64_t)executedQuery | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](executedQuery, "isEqual:")) {
      goto LABEL_13;
    }
  }
  responseText = self->_responseText;
  if ((unint64_t)responseText | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](responseText, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_executionSource != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  genAiMetadata = self->_genAiMetadata;
  if ((unint64_t)genAiMetadata | *((void *)v4 + 3)) {
    char v8 = -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata isEqual:](genAiMetadata, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_executedQuery copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_responseText copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_executionSource;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v10 = [(SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *)self->_genAiMetadata copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_executedQuery)
  {
    objc_msgSend(v4, "setExecutedQuery:");
    id v4 = v5;
  }
  if (self->_responseText)
  {
    objc_msgSend(v5, "setResponseText:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_executionSource;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_genAiMetadata)
  {
    objc_msgSend(v5, "setGenAiMetadata:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_executedQuery)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_responseText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_genAiMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERTurnSummaryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  executedQuery = self->_executedQuery;
  if (executedQuery) {
    [v3 setObject:executedQuery forKey:@"executed_query"];
  }
  responseText = self->_responseText;
  if (responseText) {
    [v4 setObject:responseText forKey:@"response_text"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t executionSource = self->_executionSource;
    if (executionSource >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_executionSource);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E6579028[executionSource];
    }
    [v4 setObject:v8 forKey:@"execution_source"];
  }
  genAiMetadata = self->_genAiMetadata;
  if (genAiMetadata)
  {
    id v10 = [(SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *)genAiMetadata dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"gen_ai_metadata"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERTurnSummary;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERTurnSummary *)&v8 description];
  id v5 = [(SIRINLUEXTERNALNLU_ROUTERTurnSummary *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGenAiMetadata
{
  return self->_genAiMetadata != 0;
}

- (int)StringAsExecutionSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EXECUTION_SOURCE_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EXECUTION_SOURCE_SIRI_X"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXECUTION_SOURCE_PLANNER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EXECUTION_SOURCE_PQA_SEARCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EXECUTION_SOURCE_GENAI"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)executionSourceAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6579028[a3];
  }
  return v3;
}

- (BOOL)hasExecutionSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasExecutionSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setExecutionSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t executionSource = a3;
}

- (int)executionSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_executionSource;
  }
  else {
    return 0;
  }
}

- (BOOL)hasResponseText
{
  return self->_responseText != 0;
}

- (BOOL)hasExecutedQuery
{
  return self->_executedQuery != 0;
}

@end