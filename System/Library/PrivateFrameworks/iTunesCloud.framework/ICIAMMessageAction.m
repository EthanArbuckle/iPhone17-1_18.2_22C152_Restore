@interface ICIAMMessageAction
+ (Class)actionParametersType;
- (BOOL)hasClickEvent;
- (BOOL)hasDisplayText;
- (BOOL)hasIdentifier;
- (BOOL)hasMessageRemovalPolicy;
- (BOOL)hasRequiresDelegate;
- (BOOL)hasURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresDelegate;
- (ICIAMMetricEvent)clickEvent;
- (NSMutableArray)actionParameters;
- (NSString)displayText;
- (NSString)identifier;
- (NSString)uRL;
- (id)actionParametersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageRemovalPolicyAsString:(int)a3;
- (int)StringAsMessageRemovalPolicy:(id)a3;
- (int)messageRemovalPolicy;
- (unint64_t)actionParametersCount;
- (unint64_t)hash;
- (void)addActionParameters:(id)a3;
- (void)clearActionParameters;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionParameters:(id)a3;
- (void)setClickEvent:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setHasMessageRemovalPolicy:(BOOL)a3;
- (void)setHasRequiresDelegate:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageRemovalPolicy:(int)a3;
- (void)setRequiresDelegate:(BOOL)a3;
- (void)setURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMMessageAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_clickEvent, 0);

  objc_storeStrong((id *)&self->_actionParameters, 0);
}

- (void)setClickEvent:(id)a3
{
}

- (ICIAMMetricEvent)clickEvent
{
  return self->_clickEvent;
}

- (void)setActionParameters:(id)a3
{
}

- (NSMutableArray)actionParameters
{
  return self->_actionParameters;
}

- (void)setURL:(id)a3
{
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[ICIAMMessageAction setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 3)) {
    -[ICIAMMessageAction setDisplayText:](self, "setDisplayText:");
  }
  if (*((void *)v4 + 6)) {
    -[ICIAMMessageAction setURL:](self, "setURL:");
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_requiresDelegate = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ICIAMMessageAction addActionParameters:](self, "addActionParameters:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  clickEvent = self->_clickEvent;
  uint64_t v11 = *((void *)v4 + 2);
  if (clickEvent)
  {
    if (v11) {
      -[ICIAMMetricEvent mergeFrom:](clickEvent, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[ICIAMMessageAction setClickEvent:](self, "setClickEvent:");
  }
  if (*((unsigned char *)v4 + 60))
  {
    self->_messageRemovalPolicy = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_displayText hash];
  NSUInteger v5 = [(NSString *)self->_uRL hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_requiresDelegate;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_actionParameters hash];
  unint64_t v8 = [(ICIAMMetricEvent *)self->_clickEvent hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_messageRemovalPolicy;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_24;
    }
  }
  displayText = self->_displayText;
  if ((unint64_t)displayText | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayText, "isEqual:")) {
      goto LABEL_24;
    }
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) != 0)
    {
      if (self->_requiresDelegate)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_24;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_16;
      }
    }
LABEL_24:
    BOOL v10 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0) {
    goto LABEL_24;
  }
LABEL_16:
  actionParameters = self->_actionParameters;
  if ((unint64_t)actionParameters | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](actionParameters, "isEqual:"))
  {
    goto LABEL_24;
  }
  clickEvent = self->_clickEvent;
  if ((unint64_t)clickEvent | *((void *)v4 + 2))
  {
    if (!-[ICIAMMetricEvent isEqual:](clickEvent, "isEqual:")) {
      goto LABEL_24;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_messageRemovalPolicy != *((_DWORD *)v4 + 10)) {
      goto LABEL_24;
    }
    BOOL v10 = 1;
  }
LABEL_25:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_displayText copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_uRL copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_requiresDelegate;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v12 = self->_actionParameters;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "copyWithZone:", a3, (void)v21);
        [(id)v5 addActionParameters:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  id v18 = [(ICIAMMetricEvent *)self->_clickEvent copyWithZone:a3];
  v19 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_messageRemovalPolicy;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v9;
  }
  if (self->_displayText)
  {
    objc_msgSend(v9, "setDisplayText:");
    id v4 = v9;
  }
  if (self->_uRL)
  {
    objc_msgSend(v9, "setURL:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[56] = self->_requiresDelegate;
    v4[60] |= 2u;
  }
  if ([(ICIAMMessageAction *)self actionParametersCount])
  {
    [v9 clearActionParameters];
    unint64_t v5 = [(ICIAMMessageAction *)self actionParametersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ICIAMMessageAction *)self actionParametersAtIndex:i];
        [v9 addActionParameters:v8];
      }
    }
  }
  if (self->_clickEvent) {
    objc_msgSend(v9, "setClickEvent:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 10) = self->_messageRemovalPolicy;
    v9[60] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayText) {
    PBDataWriterWriteStringField();
  }
  if (self->_uRL) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_actionParameters;
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

  if (self->_clickEvent) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMessageActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  displayText = self->_displayText;
  if (displayText) {
    [v4 setObject:displayText forKey:@"displayText"];
  }
  uRL = self->_uRL;
  if (uRL) {
    [v4 setObject:uRL forKey:@"URL"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_requiresDelegate];
    [v4 setObject:v8 forKey:@"requiresDelegate"];
  }
  if ([(NSMutableArray *)self->_actionParameters count])
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_actionParameters, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v10 = self->_actionParameters;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"actionParameters"];
  }
  clickEvent = self->_clickEvent;
  if (clickEvent)
  {
    uint64_t v17 = [(ICIAMMetricEvent *)clickEvent dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"clickEvent"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t messageRemovalPolicy = self->_messageRemovalPolicy;
    if (messageRemovalPolicy >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messageRemovalPolicy);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E5AC96F8[messageRemovalPolicy];
    }
    [v4 setObject:v19 forKey:@"messageRemovalPolicy"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMMessageAction;
  id v4 = [(ICIAMMessageAction *)&v8 description];
  unint64_t v5 = [(ICIAMMessageAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsMessageRemovalPolicy:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Local"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Global"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)messageRemovalPolicyAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AC96F8[a3];
  }

  return v3;
}

- (BOOL)hasMessageRemovalPolicy
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMessageRemovalPolicy:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMessageRemovalPolicy:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t messageRemovalPolicy = a3;
}

- (int)messageRemovalPolicy
{
  if (*(unsigned char *)&self->_has) {
    return self->_messageRemovalPolicy;
  }
  else {
    return 0;
  }
}

- (BOOL)hasClickEvent
{
  return self->_clickEvent != 0;
}

- (id)actionParametersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_actionParameters objectAtIndex:a3];
}

- (unint64_t)actionParametersCount
{
  return [(NSMutableArray *)self->_actionParameters count];
}

- (void)addActionParameters:(id)a3
{
  id v4 = a3;
  actionParameters = self->_actionParameters;
  id v8 = v4;
  if (!actionParameters)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_actionParameters;
    self->_actionParameters = v6;

    id v4 = v8;
    actionParameters = self->_actionParameters;
  }
  [(NSMutableArray *)actionParameters addObject:v4];
}

- (void)clearActionParameters
{
}

- (BOOL)hasRequiresDelegate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasRequiresDelegate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setRequiresDelegate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requiresDelegate = a3;
}

- (BOOL)requiresDelegate
{
  return (*(unsigned char *)&self->_has & 2) != 0 && self->_requiresDelegate;
}

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (BOOL)hasDisplayText
{
  return self->_displayText != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

+ (Class)actionParametersType
{
  return (Class)objc_opt_class();
}

@end