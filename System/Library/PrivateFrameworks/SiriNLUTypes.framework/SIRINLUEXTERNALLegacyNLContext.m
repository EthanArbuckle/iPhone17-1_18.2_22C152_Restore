@interface SIRINLUEXTERNALLegacyNLContext
+ (Class)renderedTextsType;
+ (Class)responseSemanticValuesType;
- (BOOL)dictationPrompt;
- (BOOL)hasDictationPrompt;
- (BOOL)hasLegacyContextSource;
- (BOOL)hasListenAfterSpeaking;
- (BOOL)hasPreviousDomainName;
- (BOOL)hasStrictPrompt;
- (BOOL)isEqual:(id)a3;
- (BOOL)listenAfterSpeaking;
- (BOOL)readFrom:(id)a3;
- (BOOL)strictPrompt;
- (NSMutableArray)renderedTexts;
- (NSMutableArray)responseSemanticValues;
- (NSString)previousDomainName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)legacyContextSourceAsString:(int)a3;
- (id)renderedTextsAtIndex:(unint64_t)a3;
- (id)responseSemanticValuesAtIndex:(unint64_t)a3;
- (int)StringAsLegacyContextSource:(id)a3;
- (int)legacyContextSource;
- (unint64_t)hash;
- (unint64_t)renderedTextsCount;
- (unint64_t)responseSemanticValuesCount;
- (void)addRenderedTexts:(id)a3;
- (void)addResponseSemanticValues:(id)a3;
- (void)clearRenderedTexts;
- (void)clearResponseSemanticValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDictationPrompt:(BOOL)a3;
- (void)setHasDictationPrompt:(BOOL)a3;
- (void)setHasLegacyContextSource:(BOOL)a3;
- (void)setHasListenAfterSpeaking:(BOOL)a3;
- (void)setHasStrictPrompt:(BOOL)a3;
- (void)setLegacyContextSource:(int)a3;
- (void)setListenAfterSpeaking:(BOOL)a3;
- (void)setPreviousDomainName:(id)a3;
- (void)setRenderedTexts:(id)a3;
- (void)setResponseSemanticValues:(id)a3;
- (void)setStrictPrompt:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALLegacyNLContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseSemanticValues, 0);
  objc_storeStrong((id *)&self->_renderedTexts, 0);
  objc_storeStrong((id *)&self->_previousDomainName, 0);
}

- (void)setResponseSemanticValues:(id)a3
{
}

- (NSMutableArray)responseSemanticValues
{
  return self->_responseSemanticValues;
}

- (void)setRenderedTexts:(id)a3
{
}

- (NSMutableArray)renderedTexts
{
  return self->_renderedTexts;
}

- (BOOL)listenAfterSpeaking
{
  return self->_listenAfterSpeaking;
}

- (void)setPreviousDomainName:(id)a3
{
}

- (NSString)previousDomainName
{
  return self->_previousDomainName;
}

- (BOOL)strictPrompt
{
  return self->_strictPrompt;
}

- (BOOL)dictationPrompt
{
  return self->_dictationPrompt;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  char v6 = v4[44];
  if ((v6 & 2) != 0)
  {
    self->_dictationPrompt = v4[40];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = v4[44];
  }
  if ((v6 & 8) != 0)
  {
    self->_strictPrompt = v4[42];
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 2)) {
    -[SIRINLUEXTERNALLegacyNLContext setPreviousDomainName:](self, "setPreviousDomainName:");
  }
  if ((*((unsigned char *)v5 + 44) & 4) != 0)
  {
    self->_listenAfterSpeaking = *((unsigned char *)v5 + 41);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v5 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
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
        [(SIRINLUEXTERNALLegacyNLContext *)self addRenderedTexts:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v5 + 44))
  {
    self->_legacyContextSource = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v5 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SIRINLUEXTERNALLegacyNLContext addResponseSemanticValues:](self, "addResponseSemanticValues:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_dictationPrompt;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_strictPrompt;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_previousDomainName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_listenAfterSpeaking;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_renderedTexts hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_legacyContextSource;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ [(NSMutableArray *)self->_responseSemanticValues hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 44);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0) {
      goto LABEL_39;
    }
    if (self->_dictationPrompt)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0) {
      goto LABEL_39;
    }
    if (self->_strictPrompt)
    {
      if (!*((unsigned char *)v4 + 42)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 42))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_39;
  }
  previousDomainName = self->_previousDomainName;
  if ((unint64_t)previousDomainName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](previousDomainName, "isEqual:")) {
      goto LABEL_39;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_39;
    }
    if (self->_listenAfterSpeaking)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_39;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_39;
  }
  renderedTexts = self->_renderedTexts;
  if (!((unint64_t)renderedTexts | *((void *)v4 + 3))) {
    goto LABEL_32;
  }
  if (!-[NSMutableArray isEqual:](renderedTexts, "isEqual:"))
  {
LABEL_39:
    char v10 = 0;
    goto LABEL_40;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 44);
LABEL_32:
  if (has)
  {
    if ((v6 & 1) == 0 || self->_legacyContextSource != *((_DWORD *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if (v6)
  {
    goto LABEL_39;
  }
  responseSemanticValues = self->_responseSemanticValues;
  if ((unint64_t)responseSemanticValues | *((void *)v4 + 4)) {
    char v10 = -[NSMutableArray isEqual:](responseSemanticValues, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_40:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[40] = self->_dictationPrompt;
    v5[44] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v5[42] = self->_strictPrompt;
    v5[44] |= 8u;
  }
  uint64_t v8 = [(NSString *)self->_previousDomainName copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v6[41] = self->_listenAfterSpeaking;
    v6[44] |= 4u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  char v10 = self->_renderedTexts;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [v6 addRenderedTexts:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 2) = self->_legacyContextSource;
    v6[44] |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_responseSemanticValues;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [v6 addResponseSemanticValues:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[40] = self->_dictationPrompt;
    v4[44] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[42] = self->_strictPrompt;
    v4[44] |= 8u;
  }
  uint64_t v14 = v4;
  if (self->_previousDomainName)
  {
    objc_msgSend(v4, "setPreviousDomainName:");
    id v4 = v14;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[41] = self->_listenAfterSpeaking;
    v4[44] |= 4u;
  }
  if ([(SIRINLUEXTERNALLegacyNLContext *)self renderedTextsCount])
  {
    [v14 clearRenderedTexts];
    unint64_t v6 = [(SIRINLUEXTERNALLegacyNLContext *)self renderedTextsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(SIRINLUEXTERNALLegacyNLContext *)self renderedTextsAtIndex:i];
        [v14 addRenderedTexts:v9];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v14 + 2) = self->_legacyContextSource;
    v14[44] |= 1u;
  }
  if ([(SIRINLUEXTERNALLegacyNLContext *)self responseSemanticValuesCount])
  {
    [v14 clearResponseSemanticValues];
    unint64_t v10 = [(SIRINLUEXTERNALLegacyNLContext *)self responseSemanticValuesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(SIRINLUEXTERNALLegacyNLContext *)self responseSemanticValuesAtIndex:j];
        [v14 addResponseSemanticValues:v13];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_previousDomainName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v6 = self->_renderedTexts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v11 = self->_responseSemanticValues;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALLegacyNLContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    NSUInteger v5 = [NSNumber numberWithBool:self->_dictationPrompt];
    [v3 setObject:v5 forKey:@"dictation_prompt"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    unint64_t v6 = [NSNumber numberWithBool:self->_strictPrompt];
    [v3 setObject:v6 forKey:@"strict_prompt"];
  }
  previousDomainName = self->_previousDomainName;
  if (previousDomainName) {
    [v3 setObject:previousDomainName forKey:@"previous_domain_name"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_listenAfterSpeaking];
    [v3 setObject:v8 forKey:@"listen_after_speaking"];
  }
  if ([(NSMutableArray *)self->_renderedTexts count])
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_renderedTexts, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unint64_t v10 = self->_renderedTexts;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"rendered_texts"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t legacyContextSource = self->_legacyContextSource;
    if (legacyContextSource >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_legacyContextSource);
      long long v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v17 = off_1E6578E98[legacyContextSource];
    }
    [v3 setObject:v17 forKey:@"legacy_context_source"];
  }
  responseSemanticValues = self->_responseSemanticValues;
  if (responseSemanticValues) {
    [v3 setObject:responseSemanticValues forKey:@"response_semantic_values"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALLegacyNLContext;
  id v4 = [(SIRINLUEXTERNALLegacyNLContext *)&v8 description];
  NSUInteger v5 = [(SIRINLUEXTERNALLegacyNLContext *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)responseSemanticValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_responseSemanticValues objectAtIndex:a3];
}

- (unint64_t)responseSemanticValuesCount
{
  return [(NSMutableArray *)self->_responseSemanticValues count];
}

- (void)addResponseSemanticValues:(id)a3
{
  id v4 = a3;
  responseSemanticValues = self->_responseSemanticValues;
  id v8 = v4;
  if (!responseSemanticValues)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_responseSemanticValues;
    self->_responseSemanticValues = v6;

    id v4 = v8;
    responseSemanticValues = self->_responseSemanticValues;
  }
  [(NSMutableArray *)responseSemanticValues addObject:v4];
}

- (void)clearResponseSemanticValues
{
}

- (int)StringAsLegacyContextSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LEGACYCONTEXTSOURCE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEGACYCONTEXTSOURCE_MODALITY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LEGACYCONTEXTSOURCE_POMMES"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LEGACYCONTEXTSOURCE_PROTO_PROMPT_CONTEXT"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)legacyContextSourceAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578E98[a3];
  }
  return v3;
}

- (BOOL)hasLegacyContextSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLegacyContextSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLegacyContextSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t legacyContextSource = a3;
}

- (int)legacyContextSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_legacyContextSource;
  }
  else {
    return 0;
  }
}

- (id)renderedTextsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_renderedTexts objectAtIndex:a3];
}

- (unint64_t)renderedTextsCount
{
  return [(NSMutableArray *)self->_renderedTexts count];
}

- (void)addRenderedTexts:(id)a3
{
  id v4 = a3;
  renderedTexts = self->_renderedTexts;
  id v8 = v4;
  if (!renderedTexts)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_renderedTexts;
    self->_renderedTexts = v6;

    id v4 = v8;
    renderedTexts = self->_renderedTexts;
  }
  [(NSMutableArray *)renderedTexts addObject:v4];
}

- (void)clearRenderedTexts
{
}

- (BOOL)hasListenAfterSpeaking
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasListenAfterSpeaking:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setListenAfterSpeaking:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_listenAfterSpeaking = a3;
}

- (BOOL)hasPreviousDomainName
{
  return self->_previousDomainName != 0;
}

- (BOOL)hasStrictPrompt
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasStrictPrompt:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setStrictPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_strictPrompt = a3;
}

- (BOOL)hasDictationPrompt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDictationPrompt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDictationPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dictationPrompt = a3;
}

+ (Class)responseSemanticValuesType
{
  return (Class)objc_opt_class();
}

+ (Class)renderedTextsType
{
  return (Class)objc_opt_class();
}

@end