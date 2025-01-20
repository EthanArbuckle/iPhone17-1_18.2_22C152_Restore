@interface SIRINLUEXTERNALUsoNode
+ (Class)normalizedStringPayloadsType;
- (BOOL)hasEntityLabel;
- (BOOL)hasIntegerPayload;
- (BOOL)hasStringPayload;
- (BOOL)hasUsoElementId;
- (BOOL)hasUsoVerbElementId;
- (BOOL)hasVerbLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)normalizedStringPayloads;
- (NSString)entityLabel;
- (NSString)verbLabel;
- (SIRICOMMONInt64Value)integerPayload;
- (SIRICOMMONStringValue)stringPayload;
- (SIRICOMMONUInt32Value)usoVerbElementId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)normalizedStringPayloadsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)normalizedStringPayloadsCount;
- (unsigned)usoElementId;
- (void)addNormalizedStringPayloads:(id)a3;
- (void)clearNormalizedStringPayloads;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEntityLabel:(id)a3;
- (void)setHasUsoElementId:(BOOL)a3;
- (void)setIntegerPayload:(id)a3;
- (void)setNormalizedStringPayloads:(id)a3;
- (void)setStringPayload:(id)a3;
- (void)setUsoElementId:(unsigned int)a3;
- (void)setUsoVerbElementId:(id)a3;
- (void)setVerbLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUsoNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verbLabel, 0);
  objc_storeStrong((id *)&self->_usoVerbElementId, 0);
  objc_storeStrong((id *)&self->_stringPayload, 0);
  objc_storeStrong((id *)&self->_normalizedStringPayloads, 0);
  objc_storeStrong((id *)&self->_integerPayload, 0);
  objc_storeStrong((id *)&self->_entityLabel, 0);
}

- (void)setNormalizedStringPayloads:(id)a3
{
}

- (NSMutableArray)normalizedStringPayloads
{
  return self->_normalizedStringPayloads;
}

- (void)setVerbLabel:(id)a3
{
}

- (NSString)verbLabel
{
  return self->_verbLabel;
}

- (void)setEntityLabel:(id)a3
{
}

- (NSString)entityLabel
{
  return self->_entityLabel;
}

- (void)setUsoVerbElementId:(id)a3
{
}

- (SIRICOMMONUInt32Value)usoVerbElementId
{
  return self->_usoVerbElementId;
}

- (void)setIntegerPayload:(id)a3
{
}

- (SIRICOMMONInt64Value)integerPayload
{
  return self->_integerPayload;
}

- (void)setStringPayload:(id)a3
{
}

- (SIRICOMMONStringValue)stringPayload
{
  return self->_stringPayload;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if (v4[16])
  {
    self->_usoElementId = v4[10];
    *(unsigned char *)&self->_has |= 1u;
  }
  stringPayload = self->_stringPayload;
  uint64_t v7 = *((void *)v5 + 4);
  if (stringPayload)
  {
    if (v7) {
      -[SIRICOMMONStringValue mergeFrom:](stringPayload, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SIRINLUEXTERNALUsoNode setStringPayload:](self, "setStringPayload:");
  }
  integerPayload = self->_integerPayload;
  uint64_t v9 = *((void *)v5 + 2);
  if (integerPayload)
  {
    if (v9) {
      -[SIRICOMMONInt64Value mergeFrom:](integerPayload, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[SIRINLUEXTERNALUsoNode setIntegerPayload:](self, "setIntegerPayload:");
  }
  usoVerbElementId = self->_usoVerbElementId;
  uint64_t v11 = *((void *)v5 + 6);
  if (usoVerbElementId)
  {
    if (v11) {
      -[SIRICOMMONUInt32Value mergeFrom:](usoVerbElementId, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SIRINLUEXTERNALUsoNode setUsoVerbElementId:](self, "setUsoVerbElementId:");
  }
  if (*((void *)v5 + 1)) {
    -[SIRINLUEXTERNALUsoNode setEntityLabel:](self, "setEntityLabel:");
  }
  if (*((void *)v5 + 7)) {
    -[SIRINLUEXTERNALUsoNode setVerbLabel:](self, "setVerbLabel:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v5 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SIRINLUEXTERNALUsoNode addNormalizedStringPayloads:](self, "addNormalizedStringPayloads:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_usoElementId;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SIRICOMMONStringValue *)self->_stringPayload hash] ^ v3;
  unint64_t v5 = [(SIRICOMMONInt64Value *)self->_integerPayload hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRICOMMONUInt32Value *)self->_usoVerbElementId hash];
  NSUInteger v7 = [(NSString *)self->_entityLabel hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_verbLabel hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_normalizedStringPayloads hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_usoElementId != *((_DWORD *)v4 + 10)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  stringPayload = self->_stringPayload;
  if ((unint64_t)stringPayload | *((void *)v4 + 4)
    && !-[SIRICOMMONStringValue isEqual:](stringPayload, "isEqual:"))
  {
    goto LABEL_19;
  }
  integerPayload = self->_integerPayload;
  if ((unint64_t)integerPayload | *((void *)v4 + 2))
  {
    if (!-[SIRICOMMONInt64Value isEqual:](integerPayload, "isEqual:")) {
      goto LABEL_19;
    }
  }
  usoVerbElementId = self->_usoVerbElementId;
  if ((unint64_t)usoVerbElementId | *((void *)v4 + 6))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](usoVerbElementId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  entityLabel = self->_entityLabel;
  if ((unint64_t)entityLabel | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](entityLabel, "isEqual:")) {
      goto LABEL_19;
    }
  }
  verbLabel = self->_verbLabel;
  if ((unint64_t)verbLabel | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](verbLabel, "isEqual:")) {
      goto LABEL_19;
    }
  }
  normalizedStringPayloads = self->_normalizedStringPayloads;
  if ((unint64_t)normalizedStringPayloads | *((void *)v4 + 3)) {
    char v11 = -[NSMutableArray isEqual:](normalizedStringPayloads, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_usoElementId;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v7 = [(SIRICOMMONStringValue *)self->_stringPayload copyWithZone:a3];
  NSUInteger v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(SIRICOMMONInt64Value *)self->_integerPayload copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(SIRICOMMONUInt32Value *)self->_usoVerbElementId copyWithZone:a3];
  id v12 = (void *)v6[6];
  v6[6] = v11;

  uint64_t v13 = [(NSString *)self->_entityLabel copyWithZone:a3];
  uint64_t v14 = (void *)v6[1];
  v6[1] = v13;

  uint64_t v15 = [(NSString *)self->_verbLabel copyWithZone:a3];
  v16 = (void *)v6[7];
  v6[7] = v15;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v17 = self->_normalizedStringPayloads;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (void)v24);
        [v6 addNormalizedStringPayloads:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_usoElementId;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  id v9 = v4;
  if (self->_stringPayload) {
    objc_msgSend(v4, "setStringPayload:");
  }
  if (self->_integerPayload) {
    objc_msgSend(v9, "setIntegerPayload:");
  }
  if (self->_usoVerbElementId) {
    objc_msgSend(v9, "setUsoVerbElementId:");
  }
  if (self->_entityLabel) {
    objc_msgSend(v9, "setEntityLabel:");
  }
  if (self->_verbLabel) {
    objc_msgSend(v9, "setVerbLabel:");
  }
  if ([(SIRINLUEXTERNALUsoNode *)self normalizedStringPayloadsCount])
  {
    [v9 clearNormalizedStringPayloads];
    unint64_t v5 = [(SIRINLUEXTERNALUsoNode *)self normalizedStringPayloadsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        NSUInteger v8 = [(SIRINLUEXTERNALUsoNode *)self normalizedStringPayloadsAtIndex:i];
        [v9 addNormalizedStringPayloads:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_stringPayload) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_integerPayload) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_usoVerbElementId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_entityLabel) {
    PBDataWriterWriteStringField();
  }
  if (self->_verbLabel) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_normalizedStringPayloads;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoNodeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_usoElementId];
    [v3 setObject:v4 forKey:@"uso_element_id"];
  }
  stringPayload = self->_stringPayload;
  if (stringPayload)
  {
    uint64_t v6 = [(SIRICOMMONStringValue *)stringPayload dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"string_payload"];
  }
  integerPayload = self->_integerPayload;
  if (integerPayload)
  {
    uint64_t v8 = [(SIRICOMMONInt64Value *)integerPayload dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"integer_payload"];
  }
  usoVerbElementId = self->_usoVerbElementId;
  if (usoVerbElementId)
  {
    long long v10 = [(SIRICOMMONUInt32Value *)usoVerbElementId dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"uso_verb_element_id"];
  }
  entityLabel = self->_entityLabel;
  if (entityLabel) {
    [v3 setObject:entityLabel forKey:@"entity_label"];
  }
  verbLabel = self->_verbLabel;
  if (verbLabel) {
    [v3 setObject:verbLabel forKey:@"verb_label"];
  }
  normalizedStringPayloads = self->_normalizedStringPayloads;
  if (normalizedStringPayloads) {
    [v3 setObject:normalizedStringPayloads forKey:@"normalized_string_payloads"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUsoNode;
  id v4 = [(SIRINLUEXTERNALUsoNode *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALUsoNode *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)normalizedStringPayloadsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_normalizedStringPayloads objectAtIndex:a3];
}

- (unint64_t)normalizedStringPayloadsCount
{
  return [(NSMutableArray *)self->_normalizedStringPayloads count];
}

- (void)addNormalizedStringPayloads:(id)a3
{
  id v4 = a3;
  normalizedStringPayloads = self->_normalizedStringPayloads;
  id v8 = v4;
  if (!normalizedStringPayloads)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_normalizedStringPayloads;
    self->_normalizedStringPayloads = v6;

    id v4 = v8;
    normalizedStringPayloads = self->_normalizedStringPayloads;
  }
  [(NSMutableArray *)normalizedStringPayloads addObject:v4];
}

- (void)clearNormalizedStringPayloads
{
}

- (BOOL)hasVerbLabel
{
  return self->_verbLabel != 0;
}

- (BOOL)hasEntityLabel
{
  return self->_entityLabel != 0;
}

- (BOOL)hasUsoVerbElementId
{
  return self->_usoVerbElementId != 0;
}

- (BOOL)hasIntegerPayload
{
  return self->_integerPayload != 0;
}

- (BOOL)hasStringPayload
{
  return self->_stringPayload != 0;
}

- (BOOL)hasUsoElementId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasUsoElementId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setUsoElementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_usoElementId = a3;
}

- (unsigned)usoElementId
{
  if (*(unsigned char *)&self->_has) {
    return self->_usoElementId;
  }
  else {
    return 0;
  }
}

+ (Class)normalizedStringPayloadsType
{
  return (Class)objc_opt_class();
}

@end