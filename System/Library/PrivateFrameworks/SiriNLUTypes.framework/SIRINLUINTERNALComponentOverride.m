@interface SIRINLUINTERNALComponentOverride
+ (Class)nluRequestRulesType;
- (BOOL)enabled;
- (BOOL)hasCreationTimestampMsSinceUnixEpoch;
- (BOOL)hasEnabled;
- (BOOL)hasIdA;
- (BOOL)hasOverrideNamespace;
- (BOOL)hasSerializedValue;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serializedValue;
- (NSMutableArray)nluRequestRules;
- (NSString)idA;
- (SIRINLUINTERNALOverrideValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nluRequestRulesAtIndex:(unint64_t)a3;
- (id)overrideNamespaceAsString:(int)a3;
- (int)StringAsOverrideNamespace:(id)a3;
- (int)overrideNamespace;
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
- (void)setHasOverrideNamespace:(BOOL)a3;
- (void)setIdA:(id)a3;
- (void)setNluRequestRules:(id)a3;
- (void)setOverrideNamespace:(int)a3;
- (void)setSerializedValue:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALComponentOverride

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_serializedValue, 0);
  objc_storeStrong((id *)&self->_nluRequestRules, 0);
  objc_storeStrong((id *)&self->_idA, 0);
}

- (void)setSerializedValue:(id)a3
{
}

- (NSData)serializedValue
{
  return self->_serializedValue;
}

- (void)setNluRequestRules:(id)a3
{
}

- (NSMutableArray)nluRequestRules
{
  return self->_nluRequestRules;
}

- (void)setValue:(id)a3
{
}

- (SIRINLUINTERNALOverrideValue)value
{
  return self->_value;
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
    -[SIRINLUINTERNALComponentOverride setIdA:](self, "setIdA:");
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_overrideNamespace = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_enabled = *((unsigned char *)v4 + 56);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 60))
  {
LABEL_6:
    self->_creationTimestampMsSinceUnixEpoch = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  value = self->_value;
  uint64_t v7 = *((void *)v4 + 6);
  if (value)
  {
    if (v7) {
      -[SIRINLUINTERNALOverrideValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SIRINLUINTERNALComponentOverride setValue:](self, "setValue:");
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
        -[SIRINLUINTERNALComponentOverride addNluRequestRules:](self, "addNluRequestRules:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if (*((void *)v4 + 5)) {
    -[SIRINLUINTERNALComponentOverride setSerializedValue:](self, "setSerializedValue:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idA hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = 2654435761 * self->_overrideNamespace;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_enabled;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_creationTimestampMsSinceUnixEpoch;
LABEL_8:
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(SIRINLUINTERNALOverrideValue *)self->_value hash];
  uint64_t v8 = [(NSMutableArray *)self->_nluRequestRules hash];
  return v7 ^ v8 ^ [(NSData *)self->_serializedValue hash];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_overrideNamespace != *((_DWORD *)v4 + 8)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
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
        goto LABEL_17;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_17;
      }
    }
LABEL_28:
    char v9 = 0;
    goto LABEL_29;
  }
  if ((*((unsigned char *)v4 + 60) & 4) != 0) {
    goto LABEL_28;
  }
LABEL_17:
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
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 6) && !-[SIRINLUINTERNALOverrideValue isEqual:](value, "isEqual:")) {
    goto LABEL_28;
  }
  nluRequestRules = self->_nluRequestRules;
  if ((unint64_t)nluRequestRules | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](nluRequestRules, "isEqual:")) {
      goto LABEL_28;
    }
  }
  serializedValue = self->_serializedValue;
  if ((unint64_t)serializedValue | *((void *)v4 + 5)) {
    char v9 = -[NSData isEqual:](serializedValue, "isEqual:");
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
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_overrideNamespace;
    *(unsigned char *)(v5 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 56) = self->_enabled;
  *(unsigned char *)(v5 + 60) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_creationTimestampMsSinceUnixEpoch;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
LABEL_5:
  id v9 = [(SIRINLUINTERNALOverrideValue *)self->_value copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

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

  uint64_t v17 = [(NSData *)self->_serializedValue copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

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
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_overrideNamespace;
    *((unsigned char *)v4 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 56) = self->_enabled;
  *((unsigned char *)v4 + 60) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = self->_creationTimestampMsSinceUnixEpoch;
    *((unsigned char *)v4 + 60) |= 1u;
  }
LABEL_7:
  if (self->_value) {
    objc_msgSend(v10, "setValue:");
  }
  if ([(SIRINLUINTERNALComponentOverride *)self nluRequestRulesCount])
  {
    [v10 clearNluRequestRules];
    unint64_t v6 = [(SIRINLUINTERNALComponentOverride *)self nluRequestRulesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        id v9 = [(SIRINLUINTERNALComponentOverride *)self nluRequestRulesAtIndex:i];
        [v10 addNluRequestRules:v9];
      }
    }
  }
  if (self->_serializedValue) {
    objc_msgSend(v10, "setSerializedValue:");
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
LABEL_6:
  }
    PBDataWriterWriteUint64Field();
LABEL_7:
  if (self->_value) {
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

  if (self->_serializedValue) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALComponentOverrideReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    uint64_t overrideNamespace = self->_overrideNamespace;
    if (overrideNamespace >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_overrideNamespace);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E6578DE8[overrideNamespace];
    }
    [v4 setObject:v8 forKey:@"override_namespace"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v9 = [NSNumber numberWithBool:self->_enabled];
    [v4 setObject:v9 forKey:@"enabled"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v10 = [NSNumber numberWithUnsignedLongLong:self->_creationTimestampMsSinceUnixEpoch];
    [v4 setObject:v10 forKey:@"creation_timestamp_ms_since_unix_epoch"];
  }
  value = self->_value;
  if (value)
  {
    long long v12 = [(SIRINLUINTERNALOverrideValue *)value dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"value"];
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
  serializedValue = self->_serializedValue;
  if (serializedValue) {
    [v4 setObject:serializedValue forKey:@"serialized_value"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALComponentOverride;
  id v4 = [(SIRINLUINTERNALComponentOverride *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALComponentOverride *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSerializedValue
{
  return self->_serializedValue != 0;
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

- (BOOL)hasValue
{
  return self->_value != 0;
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

- (int)StringAsOverrideNamespace:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OVERRIDE_NAMESPACE_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OVERRIDE_NAMESPACE_NLX"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OVERRIDE_NAMESPACE_CCQR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"OVERRIDE_NAMESPACE_MDS_UAAP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OVERRIDE_NAMESPACE_LVC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OVERRIDE_NAMESPACE_NLv4"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OVERRIDE_NAMESPACE_PLANNER"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)overrideNamespaceAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578DE8[a3];
  }
  return v3;
}

- (BOOL)hasOverrideNamespace
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasOverrideNamespace:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setOverrideNamespace:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t overrideNamespace = a3;
}

- (int)overrideNamespace
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_overrideNamespace;
  }
  else {
    return 0;
  }
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