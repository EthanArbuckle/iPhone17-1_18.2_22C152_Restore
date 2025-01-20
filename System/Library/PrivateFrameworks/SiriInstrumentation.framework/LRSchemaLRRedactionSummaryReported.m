@interface LRSchemaLRRedactionSummaryReported
- (BOOL)hasHasRedactedEvents;
- (BOOL)hasMessageCreationTimeSince1970;
- (BOOL)hasPreProcessorInfo;
- (BOOL)hasRedactedEvents;
- (BOOL)hasSummaryCreationTimeSince1970;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LRSchemaLRPreprocessorInfo)preProcessorInfo;
- (LRSchemaLRRedactionSummaryReported)initWithDictionary:(id)a3;
- (LRSchemaLRRedactionSummaryReported)initWithJSON:(id)a3;
- (NSArray)redactionSignals;
- (NSArray)redactionWindows;
- (NSData)jsonData;
- (double)messageCreationTimeSince1970;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)redactionSignalsAtIndex:(unint64_t)a3;
- (id)redactionWindowsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)redactionSignalsCount;
- (unint64_t)redactionWindowsCount;
- (unint64_t)summaryCreationTimeSince1970;
- (void)addRedactionSignals:(id)a3;
- (void)addRedactionWindows:(id)a3;
- (void)clearRedactionSignals;
- (void)clearRedactionWindows;
- (void)deleteHasRedactedEvents;
- (void)deleteMessageCreationTimeSince1970;
- (void)deletePreProcessorInfo;
- (void)deleteSummaryCreationTimeSince1970;
- (void)setHasHasRedactedEvents:(BOOL)a3;
- (void)setHasMessageCreationTimeSince1970:(BOOL)a3;
- (void)setHasPreProcessorInfo:(BOOL)a3;
- (void)setHasRedactedEvents:(BOOL)a3;
- (void)setHasSummaryCreationTimeSince1970:(BOOL)a3;
- (void)setMessageCreationTimeSince1970:(double)a3;
- (void)setPreProcessorInfo:(id)a3;
- (void)setRedactionSignals:(id)a3;
- (void)setRedactionWindows:(id)a3;
- (void)setSummaryCreationTimeSince1970:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation LRSchemaLRRedactionSummaryReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)LRSchemaLRRedactionSummaryReported;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(LRSchemaLRRedactionSummaryReported *)self redactionWindows];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(LRSchemaLRRedactionSummaryReported *)self setRedactionWindows:v7];

  v8 = [(LRSchemaLRRedactionSummaryReported *)self redactionSignals];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(LRSchemaLRRedactionSummaryReported *)self setRedactionSignals:v9];

  v10 = [(LRSchemaLRRedactionSummaryReported *)self preProcessorInfo];
  v11 = [v10 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v11 suppressMessage];
  if (v4) {
    [(LRSchemaLRRedactionSummaryReported *)self deletePreProcessorInfo];
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
  objc_storeStrong((id *)&self->_preProcessorInfo, 0);
  objc_storeStrong((id *)&self->_redactionSignals, 0);
  objc_storeStrong((id *)&self->_redactionWindows, 0);
}

- (void)setHasPreProcessorInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)messageCreationTimeSince1970
{
  return self->_messageCreationTimeSince1970;
}

- (void)setPreProcessorInfo:(id)a3
{
}

- (LRSchemaLRPreprocessorInfo)preProcessorInfo
{
  return self->_preProcessorInfo;
}

- (unint64_t)summaryCreationTimeSince1970
{
  return self->_summaryCreationTimeSince1970;
}

- (void)setRedactionSignals:(id)a3
{
}

- (NSArray)redactionSignals
{
  return self->_redactionSignals;
}

- (void)setRedactionWindows:(id)a3
{
}

- (NSArray)redactionWindows
{
  return self->_redactionWindows;
}

- (BOOL)hasRedactedEvents
{
  return self->_hasRedactedEvents;
}

- (LRSchemaLRRedactionSummaryReported)initWithDictionary:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)LRSchemaLRRedactionSummaryReported;
  v5 = [(LRSchemaLRRedactionSummaryReported *)&v40 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasRedactedEvents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRRedactionSummaryReported setHasRedactedEvents:](v5, "setHasRedactedEvents:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"redactionWindows"];
    objc_opt_class();
    v29 = v7;
    if (objc_opt_isKindOfClass())
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[LRSchemaLRWindow alloc] initWithDictionary:v13];
              [(LRSchemaLRRedactionSummaryReported *)v5 addRedactionWindows:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v10);
      }

      v7 = v29;
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"redactionSignals", v29, v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = [[LRSchemaLRRedactionSignal alloc] initWithDictionary:v21];
              [(LRSchemaLRRedactionSummaryReported *)v5 addRedactionSignals:v22];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v18);
      }

      v7 = v30;
      v6 = v31;
    }
    v23 = [v4 objectForKeyedSubscript:@"summaryCreationTimeSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRRedactionSummaryReported setSummaryCreationTimeSince1970:](v5, "setSummaryCreationTimeSince1970:", [v23 unsignedLongLongValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"preProcessorInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[LRSchemaLRPreprocessorInfo alloc] initWithDictionary:v24];
      [(LRSchemaLRRedactionSummaryReported *)v5 setPreProcessorInfo:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"messageCreationTimeSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v26 doubleValue];
      -[LRSchemaLRRedactionSummaryReported setMessageCreationTimeSince1970:](v5, "setMessageCreationTimeSince1970:");
    }
    v27 = v5;
  }
  return v5;
}

- (LRSchemaLRRedactionSummaryReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LRSchemaLRRedactionSummaryReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LRSchemaLRRedactionSummaryReported *)self dictionaryRepresentation];
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[LRSchemaLRRedactionSummaryReported hasRedactedEvents](self, "hasRedactedEvents"));
    [v3 setObject:v5 forKeyedSubscript:@"hasRedactedEvents"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = NSNumber;
    [(LRSchemaLRRedactionSummaryReported *)self messageCreationTimeSince1970];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"messageCreationTimeSince1970"];
  }
  if (self->_preProcessorInfo)
  {
    id v8 = [(LRSchemaLRRedactionSummaryReported *)self preProcessorInfo];
    uint64_t v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"preProcessorInfo"];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"preProcessorInfo"];
    }
  }
  if ([(NSArray *)self->_redactionSignals count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v12 = self->_redactionSignals;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"redactionSignals"];
  }
  if ([(NSArray *)self->_redactionWindows count])
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v20 = self->_redactionWindows;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v29 + 1) + 8 * j) dictionaryRepresentation];
          if (v25)
          {
            [v19 addObject:v25];
          }
          else
          {
            v26 = [MEMORY[0x1E4F1CA98] null];
            [v19 addObject:v26];
          }
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"redactionWindows"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[LRSchemaLRRedactionSummaryReported summaryCreationTimeSince1970](self, "summaryCreationTimeSince1970"));
    [v3 setObject:v27 forKeyedSubscript:@"summaryCreationTimeSince1970"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_hasRedactedEvents;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_redactionWindows hash];
  uint64_t v5 = [(NSArray *)self->_redactionSignals hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v6 = 2654435761u * self->_summaryCreationTimeSince1970;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = [(LRSchemaLRPreprocessorInfo *)self->_preProcessorInfo hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double messageCreationTimeSince1970 = self->_messageCreationTimeSince1970;
    double v10 = -messageCreationTimeSince1970;
    if (messageCreationTimeSince1970 >= 0.0) {
      double v10 = self->_messageCreationTimeSince1970;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    int hasRedactedEvents = self->_hasRedactedEvents;
    if (hasRedactedEvents != [v4 hasRedactedEvents]) {
      goto LABEL_23;
    }
  }
  unint64_t v6 = [(LRSchemaLRRedactionSummaryReported *)self redactionWindows];
  unint64_t v7 = [v4 redactionWindows];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(LRSchemaLRRedactionSummaryReported *)self redactionWindows];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    double v10 = [(LRSchemaLRRedactionSummaryReported *)self redactionWindows];
    long double v11 = [v4 redactionWindows];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  unint64_t v6 = [(LRSchemaLRRedactionSummaryReported *)self redactionSignals];
  unint64_t v7 = [v4 redactionSignals];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(LRSchemaLRRedactionSummaryReported *)self redactionSignals];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(LRSchemaLRRedactionSummaryReported *)self redactionSignals];
    id v16 = [v4 redactionSignals];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  int v18 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v18 != ((v4[56] >> 1) & 1)) {
    goto LABEL_23;
  }
  if (v18)
  {
    unint64_t summaryCreationTimeSince1970 = self->_summaryCreationTimeSince1970;
    if (summaryCreationTimeSince1970 != [v4 summaryCreationTimeSince1970]) {
      goto LABEL_23;
    }
  }
  unint64_t v6 = [(LRSchemaLRRedactionSummaryReported *)self preProcessorInfo];
  unint64_t v7 = [v4 preProcessorInfo];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v20 = [(LRSchemaLRRedactionSummaryReported *)self preProcessorInfo];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    uint64_t v22 = [(LRSchemaLRRedactionSummaryReported *)self preProcessorInfo];
    uint64_t v23 = [v4 preProcessorInfo];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  int v27 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v27 == ((v4[56] >> 2) & 1))
  {
    if (!v27
      || (double messageCreationTimeSince1970 = self->_messageCreationTimeSince1970,
          [v4 messageCreationTimeSince1970],
          messageCreationTimeSince1970 == v29))
    {
      BOOL v25 = 1;
      goto LABEL_24;
    }
  }
LABEL_23:
  BOOL v25 = 0;
LABEL_24:

  return v25;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_redactionWindows;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v10 = self->_redactionSignals;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  uint64_t v15 = [(LRSchemaLRRedactionSummaryReported *)self preProcessorInfo];

  if (v15)
  {
    id v16 = [(LRSchemaLRRedactionSummaryReported *)self preProcessorInfo];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRRedactionSummaryReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteMessageCreationTimeSince1970
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMessageCreationTimeSince1970:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMessageCreationTimeSince1970
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMessageCreationTimeSince1970:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double messageCreationTimeSince1970 = a3;
}

- (void)deletePreProcessorInfo
{
}

- (BOOL)hasPreProcessorInfo
{
  return self->_preProcessorInfo != 0;
}

- (void)deleteSummaryCreationTimeSince1970
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSummaryCreationTimeSince1970:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSummaryCreationTimeSince1970
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSummaryCreationTimeSince1970:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t summaryCreationTimeSince1970 = a3;
}

- (id)redactionSignalsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_redactionSignals objectAtIndexedSubscript:a3];
}

- (unint64_t)redactionSignalsCount
{
  return [(NSArray *)self->_redactionSignals count];
}

- (void)addRedactionSignals:(id)a3
{
  id v4 = a3;
  redactionSignals = self->_redactionSignals;
  id v8 = v4;
  if (!redactionSignals)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_redactionSignals;
    self->_redactionSignals = v6;

    id v4 = v8;
    redactionSignals = self->_redactionSignals;
  }
  [(NSArray *)redactionSignals addObject:v4];
}

- (void)clearRedactionSignals
{
}

- (id)redactionWindowsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_redactionWindows objectAtIndexedSubscript:a3];
}

- (unint64_t)redactionWindowsCount
{
  return [(NSArray *)self->_redactionWindows count];
}

- (void)addRedactionWindows:(id)a3
{
  id v4 = a3;
  redactionWindows = self->_redactionWindows;
  id v8 = v4;
  if (!redactionWindows)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_redactionWindows;
    self->_redactionWindows = v6;

    id v4 = v8;
    redactionWindows = self->_redactionWindows;
  }
  [(NSArray *)redactionWindows addObject:v4];
}

- (void)clearRedactionWindows
{
}

- (void)deleteHasRedactedEvents
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHasRedactedEvents:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasRedactedEvents
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRedactedEvents:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int hasRedactedEvents = a3;
}

@end