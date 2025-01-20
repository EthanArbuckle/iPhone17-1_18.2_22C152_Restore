@interface SIRINLUEXTERNALUsoEntityIdentifier
- (BOOL)hasBackingAppBundleId;
- (BOOL)hasGroupIndex;
- (BOOL)hasInterpretationGroup;
- (BOOL)hasNamespaceA;
- (BOOL)hasNodeIndex;
- (BOOL)hasProbability;
- (BOOL)hasSourceComponent;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)backingAppBundleId;
- (NSString)value;
- (SIRICOMMONDoubleValue)probability;
- (SIRICOMMONStringValue)namespaceA;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sourceComponentAsString:(int)a3;
- (int)StringAsSourceComponent:(id)a3;
- (int)sourceComponent;
- (unint64_t)hash;
- (unsigned)groupIndex;
- (unsigned)interpretationGroup;
- (unsigned)nodeIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackingAppBundleId:(id)a3;
- (void)setGroupIndex:(unsigned int)a3;
- (void)setHasGroupIndex:(BOOL)a3;
- (void)setHasInterpretationGroup:(BOOL)a3;
- (void)setHasNodeIndex:(BOOL)a3;
- (void)setHasSourceComponent:(BOOL)a3;
- (void)setInterpretationGroup:(unsigned int)a3;
- (void)setNamespaceA:(id)a3;
- (void)setNodeIndex:(unsigned int)a3;
- (void)setProbability:(id)a3;
- (void)setSourceComponent:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUsoEntityIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_namespaceA, 0);
  objc_storeStrong((id *)&self->_backingAppBundleId, 0);
}

- (void)setProbability:(id)a3
{
}

- (SIRICOMMONDoubleValue)probability
{
  return self->_probability;
}

- (void)setNamespaceA:(id)a3
{
}

- (SIRICOMMONStringValue)namespaceA
{
  return self->_namespaceA;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setBackingAppBundleId:(id)a3
{
}

- (NSString)backingAppBundleId
{
  return self->_backingAppBundleId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if ((v4[16] & 4) != 0)
  {
    self->_nodeIndex = v4[8];
    *(unsigned char *)&self->_has |= 4u;
  }
  v11 = v4;
  if (*((void *)v4 + 1))
  {
    -[SIRINLUEXTERNALUsoEntityIdentifier setBackingAppBundleId:](self, "setBackingAppBundleId:");
    v5 = v11;
  }
  if (*((void *)v5 + 7))
  {
    -[SIRINLUEXTERNALUsoEntityIdentifier setValue:](self, "setValue:");
    v5 = v11;
  }
  namespaceA = self->_namespaceA;
  uint64_t v7 = *((void *)v5 + 3);
  if (namespaceA)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[SIRICOMMONStringValue mergeFrom:](namespaceA, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[SIRINLUEXTERNALUsoEntityIdentifier setNamespaceA:](self, "setNamespaceA:");
  }
  v5 = v11;
LABEL_13:
  probability = self->_probability;
  uint64_t v9 = *((void *)v5 + 5);
  if (probability)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[SIRICOMMONDoubleValue mergeFrom:](probability, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[SIRINLUEXTERNALUsoEntityIdentifier setProbability:](self, "setProbability:");
  }
  v5 = v11;
LABEL_19:
  char v10 = *((unsigned char *)v5 + 64);
  if ((v10 & 8) != 0)
  {
    self->_sourceComponent = v5[12];
    *(unsigned char *)&self->_has |= 8u;
    char v10 = *((unsigned char *)v5 + 64);
    if ((v10 & 1) == 0)
    {
LABEL_21:
      if ((v10 & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v5[16] & 1) == 0)
  {
    goto LABEL_21;
  }
  self->_groupIndex = v5[4];
  *(unsigned char *)&self->_has |= 1u;
  if ((v5[16] & 2) != 0)
  {
LABEL_22:
    self->_interpretationGroup = v5[5];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_23:
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_nodeIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_backingAppBundleId hash];
  NSUInteger v5 = [(NSString *)self->_value hash];
  unint64_t v6 = [(SIRICOMMONStringValue *)self->_namespaceA hash];
  unint64_t v7 = [(SIRICOMMONDoubleValue *)self->_probability hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v8 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v8 = 2654435761 * self->_sourceComponent;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_groupIndex;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_interpretationGroup;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_nodeIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
LABEL_29:
    BOOL v9 = 0;
    goto LABEL_30;
  }
  backingAppBundleId = self->_backingAppBundleId;
  if ((unint64_t)backingAppBundleId | *((void *)v4 + 1)
    && !-[NSString isEqual:](backingAppBundleId, "isEqual:"))
  {
    goto LABEL_29;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](value, "isEqual:")) {
      goto LABEL_29;
    }
  }
  namespaceA = self->_namespaceA;
  if ((unint64_t)namespaceA | *((void *)v4 + 3))
  {
    if (!-[SIRICOMMONStringValue isEqual:](namespaceA, "isEqual:")) {
      goto LABEL_29;
    }
  }
  probability = self->_probability;
  if ((unint64_t)probability | *((void *)v4 + 5))
  {
    if (!-[SIRICOMMONDoubleValue isEqual:](probability, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_sourceComponent != *((_DWORD *)v4 + 12)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_groupIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_29;
  }
  BOOL v9 = (*((unsigned char *)v4 + 64) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_interpretationGroup != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
    BOOL v9 = 1;
  }
LABEL_30:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_nodeIndex;
    *(unsigned char *)(v5 + 64) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_backingAppBundleId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  uint64_t v9 = [(NSString *)self->_value copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v9;

  id v11 = [(SIRICOMMONStringValue *)self->_namespaceA copyWithZone:a3];
  v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  id v13 = [(SIRICOMMONDoubleValue *)self->_probability copyWithZone:a3];
  v14 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v13;

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 16) = self->_groupIndex;
    *(unsigned char *)(v6 + 64) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 48) = self->_sourceComponent;
  *(unsigned char *)(v6 + 64) |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 20) = self->_interpretationGroup;
    *(unsigned char *)(v6 + 64) |= 2u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[8] = self->_nodeIndex;
    *((unsigned char *)v4 + 64) |= 4u;
  }
  uint64_t v6 = v4;
  if (self->_backingAppBundleId)
  {
    objc_msgSend(v4, "setBackingAppBundleId:");
    id v4 = v6;
  }
  if (self->_value)
  {
    objc_msgSend(v6, "setValue:");
    id v4 = v6;
  }
  if (self->_namespaceA)
  {
    objc_msgSend(v6, "setNamespaceA:");
    id v4 = v6;
  }
  if (self->_probability)
  {
    objc_msgSend(v6, "setProbability:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[12] = self->_sourceComponent;
    *((unsigned char *)v4 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  v4[4] = self->_groupIndex;
  *((unsigned char *)v4 + 64) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    v4[5] = self->_interpretationGroup;
    *((unsigned char *)v4 + 64) |= 2u;
  }
LABEL_15:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_backingAppBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_value) {
    PBDataWriterWriteStringField();
  }
  if (self->_namespaceA) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_probability) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_14:
  }
    PBDataWriterWriteUint32Field();
LABEL_15:
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoEntityIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_nodeIndex];
    [v3 setObject:v4 forKey:@"node_index"];
  }
  backingAppBundleId = self->_backingAppBundleId;
  if (backingAppBundleId) {
    [v3 setObject:backingAppBundleId forKey:@"backing_app_bundle_id"];
  }
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  namespaceA = self->_namespaceA;
  if (namespaceA)
  {
    uint64_t v8 = [(SIRICOMMONStringValue *)namespaceA dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"namespace_a"];
  }
  probability = self->_probability;
  if (probability)
  {
    uint64_t v10 = [(SIRICOMMONDoubleValue *)probability dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"probability"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t sourceComponent = self->_sourceComponent;
    if (sourceComponent >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sourceComponent);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E6578D68[sourceComponent];
    }
    [v3 setObject:v15 forKey:@"source_component"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  v16 = [NSNumber numberWithUnsignedInt:self->_groupIndex];
  [v3 setObject:v16 forKey:@"group_index"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    v12 = [NSNumber numberWithUnsignedInt:self->_interpretationGroup];
    [v3 setObject:v12 forKey:@"interpretation_group"];
  }
LABEL_15:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUsoEntityIdentifier;
  id v4 = [(SIRINLUEXTERNALUsoEntityIdentifier *)&v8 description];
  id v5 = [(SIRINLUEXTERNALUsoEntityIdentifier *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasInterpretationGroup
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasInterpretationGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setInterpretationGroup:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_interpretationGroup = a3;
}

- (unsigned)interpretationGroup
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_interpretationGroup;
  }
  else {
    return 0;
  }
}

- (BOOL)hasGroupIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasGroupIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setGroupIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_groupIndex = a3;
}

- (unsigned)groupIndex
{
  if (*(unsigned char *)&self->_has) {
    return self->_groupIndex;
  }
  else {
    return 0;
  }
}

- (int)StringAsSourceComponent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NLU_COMPONENT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NLU_COMPONENT_SPAN_MATCH_SIRI_VOCAB"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NLU_COMPONENT_SPAN_MATCH_VOC_FILE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NLU_COMPONENT_SPAN_MATCH_MENTION_RESOLVER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NLU_COMPONENT_SPAN_MATCH_CONTEXTUAL_SPAN_MATCHER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NLU_COMPONENT_PARSER_CATI"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NLU_COMPONENT_PARSER_SSU"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)sourceComponentAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578D68[a3];
  }
  return v3;
}

- (BOOL)hasSourceComponent
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSourceComponent:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setSourceComponent:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t sourceComponent = a3;
}

- (int)sourceComponent
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_sourceComponent;
  }
  else {
    return 0;
  }
}

- (BOOL)hasProbability
{
  return self->_probability != 0;
}

- (BOOL)hasNamespaceA
{
  return self->_namespaceA != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasBackingAppBundleId
{
  return self->_backingAppBundleId != 0;
}

- (BOOL)hasNodeIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nodeIndex = a3;
}

- (unsigned)nodeIndex
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_nodeIndex;
  }
  else {
    return 0;
  }
}

@end