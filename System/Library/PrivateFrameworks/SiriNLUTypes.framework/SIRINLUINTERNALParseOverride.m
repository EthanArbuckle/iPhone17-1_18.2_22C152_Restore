@interface SIRINLUINTERNALParseOverride
+ (Class)nluRequestRulesType;
- (BOOL)enabled;
- (BOOL)hasCreationTimestampMsSinceUnixEpoch;
- (BOOL)hasEnabled;
- (BOOL)hasIdA;
- (BOOL)hasParse;
- (BOOL)hasParserIdentifier;
- (BOOL)hasSerializedParse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serializedParse;
- (NSMutableArray)nluRequestRules;
- (NSString)idA;
- (SIRINLUEXTERNALUserParse)parse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nluRequestRulesAtIndex:(unint64_t)a3;
- (id)parserIdentifierAsString:(int)a3;
- (int)StringAsParserIdentifier:(id)a3;
- (int)parserIdentifier;
- (unint64_t)creationTimestampMsSinceUnixEpoch;
- (unint64_t)hash;
- (unint64_t)nluRequestRulesCount;
- (void)addNluRequestRules:(id)a3;
- (void)clearNluRequestRules;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationTimestampMsSinceUnixEpoch:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasCreationTimestampMsSinceUnixEpoch:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasParserIdentifier:(BOOL)a3;
- (void)setIdA:(id)a3;
- (void)setNluRequestRules:(id)a3;
- (void)setParse:(id)a3;
- (void)setParserIdentifier:(int)a3;
- (void)setSerializedParse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALParseOverride

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedParse, 0);
  objc_storeStrong((id *)&self->_parse, 0);
  objc_storeStrong((id *)&self->_nluRequestRules, 0);
  objc_storeStrong((id *)&self->_idA, 0);
}

- (void)setSerializedParse:(id)a3
{
}

- (NSData)serializedParse
{
  return self->_serializedParse;
}

- (void)setNluRequestRules:(id)a3
{
}

- (NSMutableArray)nluRequestRules
{
  return self->_nluRequestRules;
}

- (void)setParse:(id)a3
{
}

- (SIRINLUEXTERNALUserParse)parse
{
  return self->_parse;
}

- (unint64_t)creationTimestampMsSinceUnixEpoch
{
  return self->_creationTimestampMsSinceUnixEpoch;
}

- (void)setIdA:(id)a3
{
}

- (NSString)idA
{
  return self->_idA;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[SIRINLUINTERNALParseOverride setIdA:](self, "setIdA:");
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_enabled = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_creationTimestampMsSinceUnixEpoch = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_6:
    self->_parserIdentifier = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
  parse = self->_parse;
  uint64_t v7 = *((void *)v4 + 4);
  if (parse)
  {
    if (v7) {
      -[SIRINLUEXTERNALUserParse mergeFrom:](parse, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SIRINLUINTERNALParseOverride setParse:](self, "setParse:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 3);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[SIRINLUINTERNALParseOverride addNluRequestRules:](self, "addNluRequestRules:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if (*((void *)v4 + 6)) {
    -[SIRINLUINTERNALParseOverride setSerializedParse:](self, "setSerializedParse:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idA hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = 2654435761 * self->_enabled;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_creationTimestampMsSinceUnixEpoch;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_parserIdentifier;
LABEL_8:
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(SIRINLUEXTERNALUserParse *)self->_parse hash];
  uint64_t v8 = [(NSMutableArray *)self->_nluRequestRules hash];
  return v7 ^ v8 ^ [(NSData *)self->_serializedParse hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  idA = self->_idA;
  if ((unint64_t)idA | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](idA, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) != 0)
    {
      if (self->_enabled)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_28;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_12;
      }
    }
LABEL_28:
    char v9 = 0;
    goto LABEL_29;
  }
  if ((*((unsigned char *)v4 + 60) & 4) != 0) {
    goto LABEL_28;
  }
LABEL_12:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_creationTimestampMsSinceUnixEpoch != *((void *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_parserIdentifier != *((_DWORD *)v4 + 10)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  parse = self->_parse;
  if ((unint64_t)parse | *((void *)v4 + 4) && !-[SIRINLUEXTERNALUserParse isEqual:](parse, "isEqual:")) {
    goto LABEL_28;
  }
  nluRequestRules = self->_nluRequestRules;
  if ((unint64_t)nluRequestRules | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](nluRequestRules, "isEqual:")) {
      goto LABEL_28;
    }
  }
  serializedParse = self->_serializedParse;
  if ((unint64_t)serializedParse | *((void *)v4 + 6)) {
    char v9 = -[NSData isEqual:](serializedParse, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_29:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_idA copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_enabled;
    *(unsigned char *)(v5 + 60) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_creationTimestampMsSinceUnixEpoch;
  *(unsigned char *)(v5 + 60) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_parserIdentifier;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
LABEL_5:
  id v9 = [(SIRINLUEXTERNALUserParse *)self->_parse copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = self->_nluRequestRules;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [(id)v5 addNluRequestRules:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(NSData *)self->_serializedParse copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_idA)
  {
    objc_msgSend(v4, "setIdA:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_enabled;
    *((unsigned char *)v4 + 60) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = self->_creationTimestampMsSinceUnixEpoch;
  *((unsigned char *)v4 + 60) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 10) = self->_parserIdentifier;
    *((unsigned char *)v4 + 60) |= 2u;
  }
LABEL_7:
  if (self->_parse) {
    objc_msgSend(v10, "setParse:");
  }
  if ([(SIRINLUINTERNALParseOverride *)self nluRequestRulesCount])
  {
    [v10 clearNluRequestRules];
    unint64_t v6 = [(SIRINLUINTERNALParseOverride *)self nluRequestRulesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        id v9 = [(SIRINLUINTERNALParseOverride *)self nluRequestRulesAtIndex:i];
        [v10 addNluRequestRules:v9];
      }
    }
  }
  if (self->_serializedParse) {
    objc_msgSend(v10, "setSerializedParse:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_idA) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_parse) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_nluRequestRules;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_serializedParse) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALParseOverrideReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  idA = self->_idA;
  if (idA) {
    [v3 setObject:idA forKey:@"id_a"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v7 = [NSNumber numberWithBool:self->_enabled];
    [v4 setObject:v7 forKey:@"enabled"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:self->_creationTimestampMsSinceUnixEpoch];
  [v4 setObject:v8 forKey:@"creation_timestamp_ms_since_unix_epoch"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t parserIdentifier = self->_parserIdentifier;
  if (parserIdentifier >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parserIdentifier);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = off_1E6578EE0[parserIdentifier];
  }
  [v4 setObject:v10 forKey:@"parser_identifier"];

LABEL_13:
  parse = self->_parse;
  if (parse)
  {
    long long v12 = [(SIRINLUEXTERNALUserParse *)parse dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"parse"];
  }
  if ([(NSMutableArray *)self->_nluRequestRules count])
  {
    long long v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_nluRequestRules, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v14 = self->_nluRequestRules;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"nlu_request_rules"];
  }
  serializedParse = self->_serializedParse;
  if (serializedParse) {
    [v4 setObject:serializedParse forKey:@"serialized_parse"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALParseOverride;
  id v4 = [(SIRINLUINTERNALParseOverride *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALParseOverride *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSerializedParse
{
  return self->_serializedParse != 0;
}

- (id)nluRequestRulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nluRequestRules objectAtIndex:a3];
}

- (unint64_t)nluRequestRulesCount
{
  return [(NSMutableArray *)self->_nluRequestRules count];
}

- (void)addNluRequestRules:(id)a3
{
  id v4 = a3;
  nluRequestRules = self->_nluRequestRules;
  id v8 = v4;
  if (!nluRequestRules)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_nluRequestRules;
    self->_nluRequestRules = v6;

    id v4 = v8;
    nluRequestRules = self->_nluRequestRules;
  }
  [(NSMutableArray *)nluRequestRules addObject:v4];
}

- (void)clearNluRequestRules
{
}

- (BOOL)hasParse
{
  return self->_parse != 0;
}

- (int)StringAsParserIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PARSER_IDENTIFIER_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_OVERRIDES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_SNLC"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_NLV4"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_CATI"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_SHORTCUTS_EXACT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_UAAP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_PSC"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_LVC"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_SSU"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)parserIdentifierAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578EE0[a3];
  }
  return v3;
}

- (BOOL)hasParserIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasParserIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setParserIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t parserIdentifier = a3;
}

- (int)parserIdentifier
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_parserIdentifier;
  }
  else {
    return 1;
  }
}

- (BOOL)hasCreationTimestampMsSinceUnixEpoch
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreationTimestampMsSinceUnixEpoch:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreationTimestampMsSinceUnixEpoch:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationTimestampMsSinceUnixEpoch = a3;
}

- (BOOL)hasEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return (*(unsigned char *)&self->_has & 4) == 0 || self->_enabled;
}

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

+ (Class)nluRequestRulesType
{
  return (Class)objc_opt_class();
}

@end