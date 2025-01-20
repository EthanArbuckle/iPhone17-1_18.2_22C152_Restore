@interface SIRINLUINTERNALRewriteInteraction
+ (Class)originalUtterancesType;
+ (Class)siriResponseType;
- (BOOL)hasLocale;
- (BOOL)hasStartTimestamp;
- (BOOL)hasTap2edit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)tap2edit;
- (NSMutableArray)originalUtterances;
- (NSMutableArray)siriResponses;
- (NSString)locale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)originalUtterancesAtIndex:(unint64_t)a3;
- (id)siriResponseAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)originalUtterancesCount;
- (unint64_t)siriResponsesCount;
- (unint64_t)startTimestamp;
- (void)addOriginalUtterances:(id)a3;
- (void)addSiriResponse:(id)a3;
- (void)clearOriginalUtterances;
- (void)clearSiriResponses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setHasTap2edit:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setOriginalUtterances:(id)a3;
- (void)setSiriResponses:(id)a3;
- (void)setStartTimestamp:(unint64_t)a3;
- (void)setTap2edit:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALRewriteInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriResponses, 0);
  objc_storeStrong((id *)&self->_originalUtterances, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (BOOL)tap2edit
{
  return self->_tap2edit;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setSiriResponses:(id)a3
{
}

- (NSMutableArray)siriResponses
{
  return self->_siriResponses;
}

- (void)setOriginalUtterances:(id)a3
{
}

- (NSMutableArray)originalUtterances
{
  return self->_originalUtterances;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SIRINLUINTERNALRewriteInteraction *)self addOriginalUtterances:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[SIRINLUINTERNALRewriteInteraction addSiriResponse:](self, "addSiriResponse:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 2)) {
    -[SIRINLUINTERNALRewriteInteraction setLocale:](self, "setLocale:");
  }
  char v15 = *((unsigned char *)v4 + 44);
  if ((v15 & 2) != 0)
  {
    self->_tap2edit = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
    char v15 = *((unsigned char *)v4 + 44);
  }
  if (v15)
  {
    self->_startTimestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_originalUtterances hash];
  uint64_t v4 = [(NSMutableArray *)self->_siriResponses hash];
  NSUInteger v5 = [(NSString *)self->_locale hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_tap2edit;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v7 = 2654435761u * self->_startTimestamp;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  originalUtterances = self->_originalUtterances;
  if ((unint64_t)originalUtterances | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](originalUtterances, "isEqual:")) {
      goto LABEL_20;
    }
  }
  siriResponses = self->_siriResponses;
  if ((unint64_t)siriResponses | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](siriResponses, "isEqual:")) {
      goto LABEL_20;
    }
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_tap2edit)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_16;
      }
    }
LABEL_20:
    BOOL v8 = 0;
    goto LABEL_21;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  BOOL v8 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_startTimestamp != *((void *)v4 + 1)) {
      goto LABEL_20;
    }
    BOOL v8 = 1;
  }
LABEL_21:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = self->_originalUtterances;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addOriginalUtterances:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = self->_siriResponses;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        [(id)v5 addSiriResponse:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_locale copyWithZone:a3];
  long long v19 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v18;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_tap2edit;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_startTimestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if ([(SIRINLUINTERNALRewriteInteraction *)self originalUtterancesCount])
  {
    [v13 clearOriginalUtterances];
    unint64_t v4 = [(SIRINLUINTERNALRewriteInteraction *)self originalUtterancesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUINTERNALRewriteInteraction *)self originalUtterancesAtIndex:i];
        [v13 addOriginalUtterances:v7];
      }
    }
  }
  if ([(SIRINLUINTERNALRewriteInteraction *)self siriResponsesCount])
  {
    [v13 clearSiriResponses];
    unint64_t v8 = [(SIRINLUINTERNALRewriteInteraction *)self siriResponsesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUINTERNALRewriteInteraction *)self siriResponseAtIndex:j];
        [v13 addSiriResponse:v11];
      }
    }
  }
  if (self->_locale) {
    objc_msgSend(v13, "setLocale:");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v13 + 40) = self->_tap2edit;
    *((unsigned char *)v13 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v13 + 1) = self->_startTimestamp;
    *((unsigned char *)v13 + 44) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v5 = self->_originalUtterances;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = self->_siriResponses;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALRewriteInteractionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_originalUtterances count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_originalUtterances, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v5 = self->_originalUtterances;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"original_utterances"];
  }
  if ([(NSMutableArray *)self->_siriResponses count])
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_siriResponses, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v12 = self->_siriResponses;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (void)v23);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"siri_response"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    long long v20 = [NSNumber numberWithBool:self->_tap2edit];
    [v3 setObject:v20 forKey:@"tap2edit"];

    char has = (char)self->_has;
  }
  if (has)
  {
    long long v21 = [NSNumber numberWithUnsignedLongLong:self->_startTimestamp];
    [v3 setObject:v21 forKey:@"start_timestamp"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALRewriteInteraction;
  id v4 = [(SIRINLUINTERNALRewriteInteraction *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALRewriteInteraction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasStartTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startTimestamp = a3;
}

- (BOOL)hasTap2edit
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTap2edit:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTap2edit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tap2edit = a3;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (id)siriResponseAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_siriResponses objectAtIndex:a3];
}

- (unint64_t)siriResponsesCount
{
  return [(NSMutableArray *)self->_siriResponses count];
}

- (void)addSiriResponse:(id)a3
{
  id v4 = a3;
  siriResponses = self->_siriResponses;
  id v8 = v4;
  if (!siriResponses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_siriResponses;
    self->_siriResponses = v6;

    id v4 = v8;
    siriResponses = self->_siriResponses;
  }
  [(NSMutableArray *)siriResponses addObject:v4];
}

- (void)clearSiriResponses
{
}

- (id)originalUtterancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_originalUtterances objectAtIndex:a3];
}

- (unint64_t)originalUtterancesCount
{
  return [(NSMutableArray *)self->_originalUtterances count];
}

- (void)addOriginalUtterances:(id)a3
{
  id v4 = a3;
  originalUtterances = self->_originalUtterances;
  id v8 = v4;
  if (!originalUtterances)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_originalUtterances;
    self->_originalUtterances = v6;

    id v4 = v8;
    originalUtterances = self->_originalUtterances;
  }
  [(NSMutableArray *)originalUtterances addObject:v4];
}

- (void)clearOriginalUtterances
{
}

+ (Class)siriResponseType
{
  return (Class)objc_opt_class();
}

+ (Class)originalUtterancesType
{
  return (Class)objc_opt_class();
}

@end