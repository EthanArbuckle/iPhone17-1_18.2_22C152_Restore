@interface SIRINLUEXTERNALUsoEntitySpan
+ (Class)alternativesType;
+ (Class)propertiesType;
- (BOOL)hasEndIndex;
- (BOOL)hasLabel;
- (BOOL)hasMatchInfo;
- (BOOL)hasNodeIndex;
- (BOOL)hasOriginAppId;
- (BOOL)hasOriginEntityId;
- (BOOL)hasPayloadAttachmentInfo;
- (BOOL)hasSourceComponent;
- (BOOL)hasStartIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)alternatives;
- (NSMutableArray)properties;
- (SIRICOMMONStringValue)label;
- (SIRICOMMONStringValue)originAppId;
- (SIRICOMMONStringValue)originEntityId;
- (SIRICOMMONUInt32Value)endIndex;
- (SIRICOMMONUInt32Value)startIndex;
- (SIRINLUEXTERNALMatchInfo)matchInfo;
- (SIRINLUEXTERNALPayloadAttachmentInfo)payloadAttachmentInfo;
- (id)alternativesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)propertiesAtIndex:(unint64_t)a3;
- (id)sourceComponentAsString:(int)a3;
- (int)StringAsSourceComponent:(id)a3;
- (int)sourceComponent;
- (unint64_t)alternativesCount;
- (unint64_t)hash;
- (unint64_t)propertiesCount;
- (unsigned)nodeIndex;
- (void)addAlternatives:(id)a3;
- (void)addProperties:(id)a3;
- (void)clearAlternatives;
- (void)clearProperties;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlternatives:(id)a3;
- (void)setEndIndex:(id)a3;
- (void)setHasNodeIndex:(BOOL)a3;
- (void)setHasSourceComponent:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMatchInfo:(id)a3;
- (void)setNodeIndex:(unsigned int)a3;
- (void)setOriginAppId:(id)a3;
- (void)setOriginEntityId:(id)a3;
- (void)setPayloadAttachmentInfo:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSourceComponent:(int)a3;
- (void)setStartIndex:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUsoEntitySpan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startIndex, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_payloadAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_originEntityId, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_endIndex, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
}

- (void)setPayloadAttachmentInfo:(id)a3
{
}

- (SIRINLUEXTERNALPayloadAttachmentInfo)payloadAttachmentInfo
{
  return self->_payloadAttachmentInfo;
}

- (void)setOriginEntityId:(id)a3
{
}

- (SIRICOMMONStringValue)originEntityId
{
  return self->_originEntityId;
}

- (void)setAlternatives:(id)a3
{
}

- (NSMutableArray)alternatives
{
  return self->_alternatives;
}

- (void)setEndIndex:(id)a3
{
}

- (SIRICOMMONUInt32Value)endIndex
{
  return self->_endIndex;
}

- (void)setStartIndex:(id)a3
{
}

- (SIRICOMMONUInt32Value)startIndex
{
  return self->_startIndex;
}

- (void)setProperties:(id)a3
{
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setMatchInfo:(id)a3
{
}

- (SIRINLUEXTERNALMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void)setLabel:(id)a3
{
}

- (SIRICOMMONStringValue)label
{
  return self->_label;
}

- (void)setOriginAppId:(id)a3
{
}

- (SIRICOMMONStringValue)originAppId
{
  return self->_originAppId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if (v4[24])
  {
    self->_nodeIndex = v4[10];
    *(unsigned char *)&self->_has |= 1u;
  }
  originAppId = self->_originAppId;
  uint64_t v7 = *((void *)v5 + 6);
  if (originAppId)
  {
    if (v7) {
      -[SIRICOMMONStringValue mergeFrom:](originAppId, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setOriginAppId:](self, "setOriginAppId:");
  }
  if ((*((unsigned char *)v5 + 96) & 2) != 0)
  {
    self->_sourceComponent = *((_DWORD *)v5 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
  label = self->_label;
  uint64_t v9 = *((void *)v5 + 3);
  if (label)
  {
    if (v9) {
      -[SIRICOMMONStringValue mergeFrom:](label, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setLabel:](self, "setLabel:");
  }
  matchInfo = self->_matchInfo;
  uint64_t v11 = *((void *)v5 + 4);
  if (matchInfo)
  {
    if (v11) {
      -[SIRINLUEXTERNALMatchInfo mergeFrom:](matchInfo, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setMatchInfo:](self, "setMatchInfo:");
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = *((id *)v5 + 9);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SIRINLUEXTERNALUsoEntitySpan *)self addProperties:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v14);
  }

  startIndex = self->_startIndex;
  uint64_t v18 = *((void *)v5 + 11);
  if (startIndex)
  {
    if (v18) {
      -[SIRICOMMONUInt32Value mergeFrom:](startIndex, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setStartIndex:](self, "setStartIndex:");
  }
  endIndex = self->_endIndex;
  uint64_t v20 = *((void *)v5 + 2);
  if (endIndex)
  {
    if (v20) {
      -[SIRICOMMONUInt32Value mergeFrom:](endIndex, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setEndIndex:](self, "setEndIndex:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = *((id *)v5 + 1);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        -[SIRINLUEXTERNALUsoEntitySpan addAlternatives:](self, "addAlternatives:", *(void *)(*((void *)&v30 + 1) + 8 * j), (void)v30);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v23);
  }

  originEntityId = self->_originEntityId;
  uint64_t v27 = *((void *)v5 + 7);
  if (originEntityId)
  {
    if (v27) {
      -[SIRICOMMONStringValue mergeFrom:](originEntityId, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setOriginEntityId:](self, "setOriginEntityId:");
  }
  payloadAttachmentInfo = self->_payloadAttachmentInfo;
  uint64_t v29 = *((void *)v5 + 8);
  if (payloadAttachmentInfo)
  {
    if (v29) {
      -[SIRINLUEXTERNALPayloadAttachmentInfo mergeFrom:](payloadAttachmentInfo, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setPayloadAttachmentInfo:](self, "setPayloadAttachmentInfo:");
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_nodeIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SIRICOMMONStringValue *)self->_originAppId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_sourceComponent;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(SIRICOMMONStringValue *)self->_label hash];
  unint64_t v7 = [(SIRINLUEXTERNALMatchInfo *)self->_matchInfo hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_properties hash];
  unint64_t v9 = v6 ^ v8 ^ [(SIRICOMMONUInt32Value *)self->_startIndex hash];
  unint64_t v10 = [(SIRICOMMONUInt32Value *)self->_endIndex hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_alternatives hash];
  unint64_t v12 = v11 ^ [(SIRICOMMONStringValue *)self->_originEntityId hash];
  return v9 ^ v12 ^ [(SIRINLUEXTERNALPayloadAttachmentInfo *)self->_payloadAttachmentInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 96);
  if (has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_nodeIndex != *((_DWORD *)v4 + 10)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_31;
  }
  originAppId = self->_originAppId;
  if ((unint64_t)originAppId | *((void *)v4 + 6))
  {
    if (!-[SIRICOMMONStringValue isEqual:](originAppId, "isEqual:"))
    {
LABEL_31:
      char v16 = 0;
      goto LABEL_32;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 96);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_sourceComponent != *((_DWORD *)v4 + 20)) {
      goto LABEL_31;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_31;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 3) && !-[SIRICOMMONStringValue isEqual:](label, "isEqual:")) {
    goto LABEL_31;
  }
  matchInfo = self->_matchInfo;
  if ((unint64_t)matchInfo | *((void *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALMatchInfo isEqual:](matchInfo, "isEqual:")) {
      goto LABEL_31;
    }
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](properties, "isEqual:")) {
      goto LABEL_31;
    }
  }
  startIndex = self->_startIndex;
  if ((unint64_t)startIndex | *((void *)v4 + 11))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](startIndex, "isEqual:")) {
      goto LABEL_31;
    }
  }
  endIndex = self->_endIndex;
  if ((unint64_t)endIndex | *((void *)v4 + 2))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](endIndex, "isEqual:")) {
      goto LABEL_31;
    }
  }
  alternatives = self->_alternatives;
  if ((unint64_t)alternatives | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](alternatives, "isEqual:")) {
      goto LABEL_31;
    }
  }
  originEntityId = self->_originEntityId;
  if ((unint64_t)originEntityId | *((void *)v4 + 7))
  {
    if (!-[SIRICOMMONStringValue isEqual:](originEntityId, "isEqual:")) {
      goto LABEL_31;
    }
  }
  payloadAttachmentInfo = self->_payloadAttachmentInfo;
  if ((unint64_t)payloadAttachmentInfo | *((void *)v4 + 8)) {
    char v16 = -[SIRINLUEXTERNALPayloadAttachmentInfo isEqual:](payloadAttachmentInfo, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_32:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_nodeIndex;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  id v7 = [(SIRICOMMONStringValue *)self->_originAppId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_sourceComponent;
    *(unsigned char *)(v6 + 96) |= 2u;
  }
  id v9 = [(SIRICOMMONStringValue *)self->_label copyWithZone:a3];
  unint64_t v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  id v11 = [(SIRINLUEXTERNALMatchInfo *)self->_matchInfo copyWithZone:a3];
  unint64_t v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v13 = self->_properties;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * v17) copyWithZone:a3];
        [(id)v6 addProperties:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v15);
  }

  id v19 = [(SIRICOMMONUInt32Value *)self->_startIndex copyWithZone:a3];
  uint64_t v20 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v19;

  id v21 = [(SIRICOMMONUInt32Value *)self->_endIndex copyWithZone:a3];
  uint64_t v22 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v21;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v23 = self->_alternatives;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v27), "copyWithZone:", a3, (void)v34);
        [(id)v6 addAlternatives:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v25);
  }

  id v29 = [(SIRICOMMONStringValue *)self->_originEntityId copyWithZone:a3];
  long long v30 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v29;

  id v31 = [(SIRINLUEXTERNALPayloadAttachmentInfo *)self->_payloadAttachmentInfo copyWithZone:a3];
  long long v32 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v31;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_nodeIndex;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  uint64_t v14 = v4;
  if (self->_originAppId)
  {
    objc_msgSend(v4, "setOriginAppId:");
    id v4 = v14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[20] = self->_sourceComponent;
    *((unsigned char *)v4 + 96) |= 2u;
  }
  if (self->_label) {
    objc_msgSend(v14, "setLabel:");
  }
  if (self->_matchInfo) {
    objc_msgSend(v14, "setMatchInfo:");
  }
  if ([(SIRINLUEXTERNALUsoEntitySpan *)self propertiesCount])
  {
    [v14 clearProperties];
    unint64_t v5 = [(SIRINLUEXTERNALUsoEntitySpan *)self propertiesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(SIRINLUEXTERNALUsoEntitySpan *)self propertiesAtIndex:i];
        [v14 addProperties:v8];
      }
    }
  }
  if (self->_startIndex) {
    objc_msgSend(v14, "setStartIndex:");
  }
  if (self->_endIndex) {
    objc_msgSend(v14, "setEndIndex:");
  }
  if ([(SIRINLUEXTERNALUsoEntitySpan *)self alternativesCount])
  {
    [v14 clearAlternatives];
    unint64_t v9 = [(SIRINLUEXTERNALUsoEntitySpan *)self alternativesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        unint64_t v12 = [(SIRINLUEXTERNALUsoEntitySpan *)self alternativesAtIndex:j];
        [v14 addAlternatives:v12];
      }
    }
  }
  if (self->_originEntityId) {
    objc_msgSend(v14, "setOriginEntityId:");
  }
  uint64_t v13 = v14;
  if (self->_payloadAttachmentInfo)
  {
    objc_msgSend(v14, "setPayloadAttachmentInfo:");
    uint64_t v13 = v14;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_originAppId) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_label) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_matchInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_properties;
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

  if (self->_startIndex) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_endIndex) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v10 = self->_alternatives;
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

  if (self->_originEntityId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_payloadAttachmentInfo) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoEntitySpanReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_nodeIndex];
    [v3 setObject:v4 forKey:@"node_index"];
  }
  originAppId = self->_originAppId;
  if (originAppId)
  {
    uint64_t v6 = [(SIRICOMMONStringValue *)originAppId dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"origin_app_id"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t sourceComponent = self->_sourceComponent;
    if (sourceComponent >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sourceComponent);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E6578FD0[sourceComponent];
    }
    [v3 setObject:v8 forKey:@"source_component"];
  }
  label = self->_label;
  if (label)
  {
    unint64_t v10 = [(SIRICOMMONStringValue *)label dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"label"];
  }
  matchInfo = self->_matchInfo;
  if (matchInfo)
  {
    uint64_t v12 = [(SIRINLUEXTERNALMatchInfo *)matchInfo dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"match_info"];
  }
  if ([(NSMutableArray *)self->_properties count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_properties, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v14 = self->_properties;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"properties"];
  }
  startIndex = self->_startIndex;
  if (startIndex)
  {
    long long v21 = [(SIRICOMMONUInt32Value *)startIndex dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"start_index"];
  }
  endIndex = self->_endIndex;
  if (endIndex)
  {
    uint64_t v23 = [(SIRICOMMONUInt32Value *)endIndex dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"end_index"];
  }
  if ([(NSMutableArray *)self->_alternatives count])
  {
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_alternatives, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v25 = self->_alternatives;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = [*(id *)(*((void *)&v36 + 1) + 8 * j) dictionaryRepresentation];
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKey:@"alternatives"];
  }
  originEntityId = self->_originEntityId;
  if (originEntityId)
  {
    long long v32 = [(SIRICOMMONStringValue *)originEntityId dictionaryRepresentation];
    [v3 setObject:v32 forKey:@"origin_entity_id"];
  }
  payloadAttachmentInfo = self->_payloadAttachmentInfo;
  if (payloadAttachmentInfo)
  {
    long long v34 = [(SIRINLUEXTERNALPayloadAttachmentInfo *)payloadAttachmentInfo dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"payload_attachment_info"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUsoEntitySpan;
  id v4 = [(SIRINLUEXTERNALUsoEntitySpan *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALUsoEntitySpan *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPayloadAttachmentInfo
{
  return self->_payloadAttachmentInfo != 0;
}

- (BOOL)hasOriginEntityId
{
  return self->_originEntityId != 0;
}

- (id)alternativesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_alternatives objectAtIndex:a3];
}

- (unint64_t)alternativesCount
{
  return [(NSMutableArray *)self->_alternatives count];
}

- (void)addAlternatives:(id)a3
{
  id v4 = a3;
  alternatives = self->_alternatives;
  id v8 = v4;
  if (!alternatives)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_alternatives;
    self->_alternatives = v6;

    id v4 = v8;
    alternatives = self->_alternatives;
  }
  [(NSMutableArray *)alternatives addObject:v4];
}

- (void)clearAlternatives
{
}

- (BOOL)hasEndIndex
{
  return self->_endIndex != 0;
}

- (BOOL)hasStartIndex
{
  return self->_startIndex != 0;
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_properties objectAtIndex:a3];
}

- (unint64_t)propertiesCount
{
  return [(NSMutableArray *)self->_properties count];
}

- (void)addProperties:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  id v8 = v4;
  if (!properties)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_properties;
    self->_properties = v6;

    id v4 = v8;
    properties = self->_properties;
  }
  [(NSMutableArray *)properties addObject:v4];
}

- (void)clearProperties
{
}

- (BOOL)hasMatchInfo
{
  return self->_matchInfo != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
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
    id v3 = off_1E6578FD0[a3];
  }
  return v3;
}

- (BOOL)hasSourceComponent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSourceComponent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSourceComponent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t sourceComponent = a3;
}

- (int)sourceComponent
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_sourceComponent;
  }
  else {
    return 0;
  }
}

- (BOOL)hasOriginAppId
{
  return self->_originAppId != 0;
}

- (BOOL)hasNodeIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_nodeIndex = a3;
}

- (unsigned)nodeIndex
{
  if (*(unsigned char *)&self->_has) {
    return self->_nodeIndex;
  }
  else {
    return 0;
  }
}

+ (Class)alternativesType
{
  return (Class)objc_opt_class();
}

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

@end