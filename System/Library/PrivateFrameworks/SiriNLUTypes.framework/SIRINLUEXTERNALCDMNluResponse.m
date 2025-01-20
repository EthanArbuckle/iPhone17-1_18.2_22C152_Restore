@interface SIRINLUEXTERNALCDMNluResponse
+ (Class)parsesType;
+ (Class)repetitionResultsType;
- (BOOL)hasLanguageVariantResult;
- (BOOL)hasRequestId;
- (BOOL)hasResponseStatus;
- (BOOL)hasSupplementaryOutput;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)parses;
- (NSMutableArray)repetitionResults;
- (SIRINLUEXTERNALLanguageVariantResult)languageVariantResult;
- (SIRINLUEXTERNALNLUSupplementaryOutput)supplementaryOutput;
- (SIRINLUEXTERNALRequestID)requestId;
- (SIRINLUEXTERNALResponseStatus)responseStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parsesAtIndex:(unint64_t)a3;
- (id)repetitionResultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)parsesCount;
- (unint64_t)repetitionResultsCount;
- (void)addParses:(id)a3;
- (void)addRepetitionResults:(id)a3;
- (void)clearParses;
- (void)clearRepetitionResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLanguageVariantResult:(id)a3;
- (void)setParses:(id)a3;
- (void)setRepetitionResults:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setSupplementaryOutput:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALCDMNluResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryOutput, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_repetitionResults, 0);
  objc_storeStrong((id *)&self->_parses, 0);
  objc_storeStrong((id *)&self->_languageVariantResult, 0);
}

- (void)setSupplementaryOutput:(id)a3
{
}

- (SIRINLUEXTERNALNLUSupplementaryOutput)supplementaryOutput
{
  return self->_supplementaryOutput;
}

- (void)setLanguageVariantResult:(id)a3
{
}

- (SIRINLUEXTERNALLanguageVariantResult)languageVariantResult
{
  return self->_languageVariantResult;
}

- (void)setRepetitionResults:(id)a3
{
}

- (NSMutableArray)repetitionResults
{
  return self->_repetitionResults;
}

- (void)setResponseStatus:(id)a3
{
}

- (SIRINLUEXTERNALResponseStatus)responseStatus
{
  return self->_responseStatus;
}

- (void)setParses:(id)a3
{
}

- (NSMutableArray)parses
{
  return self->_parses;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = *((void *)v4 + 4);
  if (requestId)
  {
    if (v6) {
      -[SIRINLUEXTERNALRequestID mergeFrom:](requestId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALCDMNluResponse setRequestId:](self, "setRequestId:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUEXTERNALCDMNluResponse *)self addParses:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  responseStatus = self->_responseStatus;
  uint64_t v13 = *((void *)v4 + 5);
  if (responseStatus)
  {
    if (v13) {
      -[SIRINLUEXTERNALResponseStatus mergeFrom:](responseStatus, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[SIRINLUEXTERNALCDMNluResponse setResponseStatus:](self, "setResponseStatus:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = *((id *)v4 + 3);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        -[SIRINLUEXTERNALCDMNluResponse addRepetitionResults:](self, "addRepetitionResults:", *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  languageVariantResult = self->_languageVariantResult;
  uint64_t v20 = *((void *)v4 + 1);
  if (languageVariantResult)
  {
    if (v20) {
      -[SIRINLUEXTERNALLanguageVariantResult mergeFrom:](languageVariantResult, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SIRINLUEXTERNALCDMNluResponse setLanguageVariantResult:](self, "setLanguageVariantResult:");
  }
  supplementaryOutput = self->_supplementaryOutput;
  uint64_t v22 = *((void *)v4 + 6);
  if (supplementaryOutput)
  {
    if (v22) {
      -[SIRINLUEXTERNALNLUSupplementaryOutput mergeFrom:](supplementaryOutput, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[SIRINLUEXTERNALCDMNluResponse setSupplementaryOutput:](self, "setSupplementaryOutput:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALRequestID *)self->_requestId hash];
  uint64_t v4 = [(NSMutableArray *)self->_parses hash] ^ v3;
  unint64_t v5 = [(SIRINLUEXTERNALResponseStatus *)self->_responseStatus hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_repetitionResults hash];
  unint64_t v7 = [(SIRINLUEXTERNALLanguageVariantResult *)self->_languageVariantResult hash];
  return v6 ^ v7 ^ [(SIRINLUEXTERNALNLUSupplementaryOutput *)self->_supplementaryOutput hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[4]))
     || -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:"))
    && ((parses = self->_parses, !((unint64_t)parses | v4[2]))
     || -[NSMutableArray isEqual:](parses, "isEqual:"))
    && ((responseStatus = self->_responseStatus, !((unint64_t)responseStatus | v4[5]))
     || -[SIRINLUEXTERNALResponseStatus isEqual:](responseStatus, "isEqual:"))
    && ((repetitionResults = self->_repetitionResults, !((unint64_t)repetitionResults | v4[3]))
     || -[NSMutableArray isEqual:](repetitionResults, "isEqual:"))
    && ((languageVariantResult = self->_languageVariantResult, !((unint64_t)languageVariantResult | v4[1]))
     || -[SIRINLUEXTERNALLanguageVariantResult isEqual:](languageVariantResult, "isEqual:")))
  {
    supplementaryOutput = self->_supplementaryOutput;
    if ((unint64_t)supplementaryOutput | v4[6]) {
      char v11 = -[SIRINLUEXTERNALNLUSupplementaryOutput isEqual:](supplementaryOutput, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALRequestID *)self->_requestId copyWithZone:a3];
  unint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = self->_parses;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addParses:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  id v14 = [(SIRINLUEXTERNALResponseStatus *)self->_responseStatus copyWithZone:a3];
  uint64_t v15 = (void *)v5[5];
  v5[5] = v14;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v16 = self->_repetitionResults;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v20), "copyWithZone:", a3, (void)v27);
        [v5 addRepetitionResults:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }

  id v22 = [(SIRINLUEXTERNALLanguageVariantResult *)self->_languageVariantResult copyWithZone:a3];
  long long v23 = (void *)v5[1];
  v5[1] = v22;

  id v24 = [(SIRINLUEXTERNALNLUSupplementaryOutput *)self->_supplementaryOutput copyWithZone:a3];
  long long v25 = (void *)v5[6];
  v5[6] = v24;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if (self->_requestId) {
    objc_msgSend(v13, "setRequestId:");
  }
  if ([(SIRINLUEXTERNALCDMNluResponse *)self parsesCount])
  {
    [v13 clearParses];
    unint64_t v4 = [(SIRINLUEXTERNALCDMNluResponse *)self parsesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(SIRINLUEXTERNALCDMNluResponse *)self parsesAtIndex:i];
        [v13 addParses:v7];
      }
    }
  }
  if (self->_responseStatus) {
    objc_msgSend(v13, "setResponseStatus:");
  }
  if ([(SIRINLUEXTERNALCDMNluResponse *)self repetitionResultsCount])
  {
    [v13 clearRepetitionResults];
    unint64_t v8 = [(SIRINLUEXTERNALCDMNluResponse *)self repetitionResultsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUEXTERNALCDMNluResponse *)self repetitionResultsAtIndex:j];
        [v13 addRepetitionResults:v11];
      }
    }
  }
  if (self->_languageVariantResult) {
    objc_msgSend(v13, "setLanguageVariantResult:");
  }
  uint64_t v12 = v13;
  if (self->_supplementaryOutput)
  {
    objc_msgSend(v13, "setSupplementaryOutput:");
    uint64_t v12 = v13;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_requestId) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_parses;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_responseStatus) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_repetitionResults;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_languageVariantResult) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_supplementaryOutput) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDMNluResponseReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALRequestID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  if ([(NSMutableArray *)self->_parses count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_parses, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v7 = self->_parses;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"parses"];
  }
  responseStatus = self->_responseStatus;
  if (responseStatus)
  {
    uint64_t v14 = [(SIRINLUEXTERNALResponseStatus *)responseStatus dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"response_status"];
  }
  if ([(NSMutableArray *)self->_repetitionResults count])
  {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_repetitionResults, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v16 = self->_repetitionResults;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "dictionaryRepresentation", (void)v27);
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"repetition_results"];
  }
  languageVariantResult = self->_languageVariantResult;
  if (languageVariantResult)
  {
    long long v23 = [(SIRINLUEXTERNALLanguageVariantResult *)languageVariantResult dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"language_variant_result"];
  }
  supplementaryOutput = self->_supplementaryOutput;
  if (supplementaryOutput)
  {
    uint64_t v25 = [(SIRINLUEXTERNALNLUSupplementaryOutput *)supplementaryOutput dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"supplementary_output"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALCDMNluResponse;
  id v4 = [(SIRINLUEXTERNALCDMNluResponse *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALCDMNluResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSupplementaryOutput
{
  return self->_supplementaryOutput != 0;
}

- (BOOL)hasLanguageVariantResult
{
  return self->_languageVariantResult != 0;
}

- (id)repetitionResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_repetitionResults objectAtIndex:a3];
}

- (unint64_t)repetitionResultsCount
{
  return [(NSMutableArray *)self->_repetitionResults count];
}

- (void)addRepetitionResults:(id)a3
{
  id v4 = a3;
  repetitionResults = self->_repetitionResults;
  id v8 = v4;
  if (!repetitionResults)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_repetitionResults;
    self->_repetitionResults = v6;

    id v4 = v8;
    repetitionResults = self->_repetitionResults;
  }
  [(NSMutableArray *)repetitionResults addObject:v4];
}

- (void)clearRepetitionResults
{
}

- (BOOL)hasResponseStatus
{
  return self->_responseStatus != 0;
}

- (id)parsesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_parses objectAtIndex:a3];
}

- (unint64_t)parsesCount
{
  return [(NSMutableArray *)self->_parses count];
}

- (void)addParses:(id)a3
{
  id v4 = a3;
  parses = self->_parses;
  id v8 = v4;
  if (!parses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_parses;
    self->_parses = v6;

    id v4 = v8;
    parses = self->_parses;
  }
  [(NSMutableArray *)parses addObject:v4];
}

- (void)clearParses
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

+ (Class)repetitionResultsType
{
  return (Class)objc_opt_class();
}

+ (Class)parsesType
{
  return (Class)objc_opt_class();
}

@end