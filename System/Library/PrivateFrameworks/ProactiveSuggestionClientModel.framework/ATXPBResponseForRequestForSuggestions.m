@interface ATXPBResponseForRequestForSuggestions
+ (Class)suggestionsType;
- (ATXPBRequestForContextualActionSuggestions)contextualActionSuggestionRequest;
- (ATXPBRequestForIntentSuggestions)intentSuggestionRequest;
- (ATXPBRequestForInteractionSuggestions)interactionSuggestionRequest;
- (BOOL)hasContextualActionSuggestionRequest;
- (BOOL)hasErrorData;
- (BOOL)hasFeedbackMetadata;
- (BOOL)hasIntentSuggestionRequest;
- (BOOL)hasInteractionSuggestionRequest;
- (BOOL)hasResponseCode;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSData)feedbackMetadata;
- (NSMutableArray)suggestions;
- (NSString)uuidString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)responseCodeAsString:(int)a3;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (int)StringAsResponseCode:(id)a3;
- (int)responseCode;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (void)addSuggestions:(id)a3;
- (void)clearSuggestions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContextualActionSuggestionRequest:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setFeedbackMetadata:(id)a3;
- (void)setHasResponseCode:(BOOL)a3;
- (void)setIntentSuggestionRequest:(id)a3;
- (void)setInteractionSuggestionRequest:(id)a3;
- (void)setResponseCode:(int)a3;
- (void)setSuggestions:(id)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBResponseForRequestForSuggestions

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (void)clearSuggestions
{
}

- (void)addSuggestions:(id)a3
{
  id v4 = a3;
  suggestions = self->_suggestions;
  id v8 = v4;
  if (!suggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_suggestions;
    self->_suggestions = v6;

    id v4 = v8;
    suggestions = self->_suggestions;
  }
  [(NSMutableArray *)suggestions addObject:v4];
}

- (unint64_t)suggestionsCount
{
  return [(NSMutableArray *)self->_suggestions count];
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestions objectAtIndex:a3];
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFeedbackMetadata
{
  return self->_feedbackMetadata != 0;
}

- (int)responseCode
{
  if (*(unsigned char *)&self->_has) {
    return self->_responseCode;
  }
  else {
    return 0;
  }
}

- (void)setResponseCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_responseCode = a3;
}

- (void)setHasResponseCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)responseCodeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5F01AC0[a3];
  }
  return v3;
}

- (int)StringAsResponseCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FallbackToCache"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Error"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SuccessAndReplaceCache"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Max"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasInteractionSuggestionRequest
{
  return self->_interactionSuggestionRequest != 0;
}

- (BOOL)hasContextualActionSuggestionRequest
{
  return self->_contextualActionSuggestionRequest != 0;
}

- (BOOL)hasIntentSuggestionRequest
{
  return self->_intentSuggestionRequest != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBResponseForRequestForSuggestions;
  int v4 = [(ATXPBResponseForRequestForSuggestions *)&v8 description];
  v5 = [(ATXPBResponseForRequestForSuggestions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  if ([(NSMutableArray *)self->_suggestions count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = self->_suggestions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"suggestions"];
  }
  feedbackMetadata = self->_feedbackMetadata;
  if (feedbackMetadata) {
    [v4 setObject:feedbackMetadata forKey:@"feedbackMetadata"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t responseCode = self->_responseCode;
    if (responseCode >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_responseCode);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E5F01AC0[responseCode];
    }
    [v4 setObject:v15 forKey:@"responseCode"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  interactionSuggestionRequest = self->_interactionSuggestionRequest;
  if (interactionSuggestionRequest)
  {
    v18 = [(ATXPBRequestForInteractionSuggestions *)interactionSuggestionRequest dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"interactionSuggestionRequest"];
  }
  contextualActionSuggestionRequest = self->_contextualActionSuggestionRequest;
  if (contextualActionSuggestionRequest)
  {
    v20 = [(ATXPBRequestForContextualActionSuggestions *)contextualActionSuggestionRequest dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"contextualActionSuggestionRequest"];
  }
  intentSuggestionRequest = self->_intentSuggestionRequest;
  if (intentSuggestionRequest)
  {
    v22 = [(ATXPBRequestForIntentSuggestions *)intentSuggestionRequest dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"intentSuggestionRequest"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBResponseForRequestForSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuidString) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_suggestions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_feedbackMetadata) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
  if (self->_interactionSuggestionRequest) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_contextualActionSuggestionRequest) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_intentSuggestionRequest) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_uuidString) {
    objc_msgSend(v9, "setUuidString:");
  }
  if ([(ATXPBResponseForRequestForSuggestions *)self suggestionsCount])
  {
    [v9 clearSuggestions];
    unint64_t v4 = [(ATXPBResponseForRequestForSuggestions *)self suggestionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBResponseForRequestForSuggestions *)self suggestionsAtIndex:i];
        [v9 addSuggestions:v7];
      }
    }
  }
  if (self->_feedbackMetadata) {
    objc_msgSend(v9, "setFeedbackMetadata:");
  }
  uint64_t v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 12) = self->_responseCode;
    *((unsigned char *)v9 + 72) |= 1u;
  }
  if (self->_errorData)
  {
    objc_msgSend(v9, "setErrorData:");
    uint64_t v8 = v9;
  }
  if (self->_interactionSuggestionRequest)
  {
    objc_msgSend(v9, "setInteractionSuggestionRequest:");
    uint64_t v8 = v9;
  }
  if (self->_contextualActionSuggestionRequest)
  {
    objc_msgSend(v9, "setContextualActionSuggestionRequest:");
    uint64_t v8 = v9;
  }
  if (self->_intentSuggestionRequest)
  {
    objc_msgSend(v9, "setIntentSuggestionRequest:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = self->_suggestions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v12), "copyWithZone:", a3, (void)v25);
        [(id)v5 addSuggestions:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_feedbackMetadata copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_responseCode;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v16 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3, (void)v25);
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  id v18 = [(ATXPBRequestForInteractionSuggestions *)self->_interactionSuggestionRequest copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  id v20 = [(ATXPBRequestForContextualActionSuggestions *)self->_contextualActionSuggestionRequest copyWithZone:a3];
  v21 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v20;

  id v22 = [(ATXPBRequestForIntentSuggestions *)self->_intentSuggestionRequest copyWithZone:a3];
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_21;
    }
  }
  suggestions = self->_suggestions;
  if ((unint64_t)suggestions | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](suggestions, "isEqual:")) {
      goto LABEL_21;
    }
  }
  feedbackMetadata = self->_feedbackMetadata;
  if ((unint64_t)feedbackMetadata | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](feedbackMetadata, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_responseCode != *((_DWORD *)v4 + 12)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 2) && !-[NSData isEqual:](errorData, "isEqual:")) {
    goto LABEL_21;
  }
  interactionSuggestionRequest = self->_interactionSuggestionRequest;
  if ((unint64_t)interactionSuggestionRequest | *((void *)v4 + 5))
  {
    if (!-[ATXPBRequestForInteractionSuggestions isEqual:](interactionSuggestionRequest, "isEqual:")) {
      goto LABEL_21;
    }
  }
  contextualActionSuggestionRequest = self->_contextualActionSuggestionRequest;
  if ((unint64_t)contextualActionSuggestionRequest | *((void *)v4 + 1))
  {
    if (!-[ATXPBRequestForContextualActionSuggestions isEqual:](contextualActionSuggestionRequest, "isEqual:")) {
      goto LABEL_21;
    }
  }
  intentSuggestionRequest = self->_intentSuggestionRequest;
  if ((unint64_t)intentSuggestionRequest | *((void *)v4 + 4)) {
    char v12 = -[ATXPBRequestForIntentSuggestions isEqual:](intentSuggestionRequest, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  uint64_t v4 = [(NSMutableArray *)self->_suggestions hash];
  uint64_t v5 = [(NSData *)self->_feedbackMetadata hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_responseCode;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v8 = [(NSData *)self->_errorData hash];
  unint64_t v9 = v8 ^ [(ATXPBRequestForInteractionSuggestions *)self->_interactionSuggestionRequest hash];
  unint64_t v10 = v7 ^ v9 ^ [(ATXPBRequestForContextualActionSuggestions *)self->_contextualActionSuggestionRequest hash];
  return v10 ^ [(ATXPBRequestForIntentSuggestions *)self->_intentSuggestionRequest hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[ATXPBResponseForRequestForSuggestions setUuidString:](self, "setUuidString:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        -[ATXPBResponseForRequestForSuggestions addSuggestions:](self, "addSuggestions:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[ATXPBResponseForRequestForSuggestions setFeedbackMetadata:](self, "setFeedbackMetadata:");
  }
  if (*((unsigned char *)v4 + 72))
  {
    self->_uint64_t responseCode = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[ATXPBResponseForRequestForSuggestions setErrorData:](self, "setErrorData:");
  }
  interactionSuggestionRequest = self->_interactionSuggestionRequest;
  uint64_t v11 = *((void *)v4 + 5);
  if (interactionSuggestionRequest)
  {
    if (v11) {
      -[ATXPBRequestForInteractionSuggestions mergeFrom:](interactionSuggestionRequest, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[ATXPBResponseForRequestForSuggestions setInteractionSuggestionRequest:](self, "setInteractionSuggestionRequest:");
  }
  contextualActionSuggestionRequest = self->_contextualActionSuggestionRequest;
  uint64_t v13 = *((void *)v4 + 1);
  if (contextualActionSuggestionRequest)
  {
    if (v13) {
      -[ATXPBRequestForContextualActionSuggestions mergeFrom:](contextualActionSuggestionRequest, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[ATXPBResponseForRequestForSuggestions setContextualActionSuggestionRequest:](self, "setContextualActionSuggestionRequest:");
  }
  intentSuggestionRequest = self->_intentSuggestionRequest;
  uint64_t v15 = *((void *)v4 + 4);
  if (intentSuggestionRequest)
  {
    if (v15) {
      -[ATXPBRequestForIntentSuggestions mergeFrom:](intentSuggestionRequest, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[ATXPBResponseForRequestForSuggestions setIntentSuggestionRequest:](self, "setIntentSuggestionRequest:");
  }
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)setFeedbackMetadata:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (ATXPBRequestForInteractionSuggestions)interactionSuggestionRequest
{
  return self->_interactionSuggestionRequest;
}

- (void)setInteractionSuggestionRequest:(id)a3
{
}

- (ATXPBRequestForContextualActionSuggestions)contextualActionSuggestionRequest
{
  return self->_contextualActionSuggestionRequest;
}

- (void)setContextualActionSuggestionRequest:(id)a3
{
}

- (ATXPBRequestForIntentSuggestions)intentSuggestionRequest
{
  return self->_intentSuggestionRequest;
}

- (void)setIntentSuggestionRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_interactionSuggestionRequest, 0);
  objc_storeStrong((id *)&self->_intentSuggestionRequest, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_contextualActionSuggestionRequest, 0);
}

@end