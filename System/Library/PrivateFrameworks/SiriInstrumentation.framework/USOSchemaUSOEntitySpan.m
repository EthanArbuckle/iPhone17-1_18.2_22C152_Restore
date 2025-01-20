@interface USOSchemaUSOEntitySpan
- (BOOL)hasEndIndex;
- (BOOL)hasLabel;
- (BOOL)hasMatchInfo;
- (BOOL)hasNodeIndex;
- (BOOL)hasOriginAppBundleIdType;
- (BOOL)hasPayloadAttachmentInfo;
- (BOOL)hasSourceComponent;
- (BOOL)hasStartIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)label;
- (USOSchemaUSOEntitySpan)initWithDictionary:(id)a3;
- (USOSchemaUSOEntitySpan)initWithJSON:(id)a3;
- (USOSchemaUSOMatchInfo)matchInfo;
- (USOSchemaUSOPayloadAttachmentInfo)payloadAttachmentInfo;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)originAppBundleIdType;
- (int)sourceComponent;
- (unint64_t)hash;
- (unsigned)endIndex;
- (unsigned)nodeIndex;
- (unsigned)startIndex;
- (void)deleteEndIndex;
- (void)deleteLabel;
- (void)deleteMatchInfo;
- (void)deleteNodeIndex;
- (void)deleteOriginAppBundleIdType;
- (void)deletePayloadAttachmentInfo;
- (void)deleteSourceComponent;
- (void)deleteStartIndex;
- (void)setEndIndex:(unsigned int)a3;
- (void)setHasEndIndex:(BOOL)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setHasMatchInfo:(BOOL)a3;
- (void)setHasNodeIndex:(BOOL)a3;
- (void)setHasOriginAppBundleIdType:(BOOL)a3;
- (void)setHasPayloadAttachmentInfo:(BOOL)a3;
- (void)setHasSourceComponent:(BOOL)a3;
- (void)setHasStartIndex:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMatchInfo:(id)a3;
- (void)setNodeIndex:(unsigned int)a3;
- (void)setOriginAppBundleIdType:(int)a3;
- (void)setPayloadAttachmentInfo:(id)a3;
- (void)setSourceComponent:(int)a3;
- (void)setStartIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOEntitySpan

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)USOSchemaUSOEntitySpan;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(USOSchemaUSOEntitySpan *)self matchInfo];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(USOSchemaUSOEntitySpan *)self deleteMatchInfo];
  }
  v9 = [(USOSchemaUSOEntitySpan *)self payloadAttachmentInfo];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(USOSchemaUSOEntitySpan *)self deletePayloadAttachmentInfo];
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
  objc_storeStrong((id *)&self->_payloadAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setHasPayloadAttachmentInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasMatchInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPayloadAttachmentInfo:(id)a3
{
}

- (USOSchemaUSOPayloadAttachmentInfo)payloadAttachmentInfo
{
  return self->_payloadAttachmentInfo;
}

- (int)originAppBundleIdType
{
  return self->_originAppBundleIdType;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (void)setMatchInfo:(id)a3
{
}

- (USOSchemaUSOMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (int)sourceComponent
{
  return self->_sourceComponent;
}

- (unsigned)nodeIndex
{
  return self->_nodeIndex;
}

- (USOSchemaUSOEntitySpan)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)USOSchemaUSOEntitySpan;
  v5 = [(USOSchemaUSOEntitySpan *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"nodeIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntitySpan setNodeIndex:](v5, "setNodeIndex:", [v6 unsignedIntValue]);
    }
    v19 = v6;
    v7 = [v4 objectForKeyedSubscript:@"sourceComponent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntitySpan setSourceComponent:](v5, "setSourceComponent:", [v7 intValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(USOSchemaUSOEntitySpan *)v5 setLabel:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"matchInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[USOSchemaUSOMatchInfo alloc] initWithDictionary:v10];
      [(USOSchemaUSOEntitySpan *)v5 setMatchInfo:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"startIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntitySpan setStartIndex:](v5, "setStartIndex:", [v12 unsignedIntValue]);
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"endIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntitySpan setEndIndex:](v5, "setEndIndex:", [v13 unsignedIntValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"originAppBundleIdType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntitySpan setOriginAppBundleIdType:](v5, "setOriginAppBundleIdType:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"payloadAttachmentInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[USOSchemaUSOPayloadAttachmentInfo alloc] initWithDictionary:v15];
      [(USOSchemaUSOEntitySpan *)v5 setPayloadAttachmentInfo:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (USOSchemaUSOEntitySpan)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOEntitySpan *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOEntitySpan *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEntitySpan endIndex](self, "endIndex"));
    [v3 setObject:v4 forKeyedSubscript:@"endIndex"];
  }
  if (self->_label)
  {
    v5 = [(USOSchemaUSOEntitySpan *)self label];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"label"];
  }
  if (self->_matchInfo)
  {
    uint64_t v7 = [(USOSchemaUSOEntitySpan *)self matchInfo];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"matchInfo"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"matchInfo"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEntitySpan nodeIndex](self, "nodeIndex"));
    [v3 setObject:v11 forKeyedSubscript:@"nodeIndex"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    unsigned int v12 = [(USOSchemaUSOEntitySpan *)self originAppBundleIdType] - 1;
    if (v12 > 0x18) {
      objc_super v13 = @"USOBACKINGAPPBUNDLETYPE_UNKNOWN";
    }
    else {
      objc_super v13 = off_1E5EBB820[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"originAppBundleIdType"];
  }
  if (self->_payloadAttachmentInfo)
  {
    v14 = [(USOSchemaUSOEntitySpan *)self payloadAttachmentInfo];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"payloadAttachmentInfo"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"payloadAttachmentInfo"];
    }
  }
  char v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    unsigned int v18 = [(USOSchemaUSOEntitySpan *)self sourceComponent] - 1;
    if (v18 > 6) {
      v19 = @"USOENTITYSPANNLUCOMPONENT_UNKNOWN";
    }
    else {
      v19 = off_1E5EBB8E8[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"sourceComponent"];
    char v17 = (char)self->_has;
  }
  if ((v17 & 4) != 0)
  {
    objc_super v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEntitySpan startIndex](self, "startIndex"));
    [v3 setObject:v20 forKeyedSubscript:@"startIndex"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_nodeIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sourceComponent;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_label hash];
  unint64_t v6 = [(USOSchemaUSOMatchInfo *)self->_matchInfo hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(USOSchemaUSOPayloadAttachmentInfo *)self->_payloadAttachmentInfo hash];
  }
  uint64_t v7 = 2654435761 * self->_startIndex;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_endIndex;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_originAppBundleIdType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(USOSchemaUSOPayloadAttachmentInfo *)self->_payloadAttachmentInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  $B5B1F2BC487705B71D24B3E729459795 has = self->_has;
  unsigned int v6 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_35;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int nodeIndex = self->_nodeIndex;
    if (nodeIndex != [v4 nodeIndex]) {
      goto LABEL_35;
    }
    $B5B1F2BC487705B71D24B3E729459795 has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_35;
  }
  if (v8)
  {
    int sourceComponent = self->_sourceComponent;
    if (sourceComponent != [v4 sourceComponent]) {
      goto LABEL_35;
    }
  }
  v10 = [(USOSchemaUSOEntitySpan *)self label];
  int v11 = [v4 label];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_34;
  }
  uint64_t v12 = [(USOSchemaUSOEntitySpan *)self label];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(USOSchemaUSOEntitySpan *)self label];
    v15 = [v4 label];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  v10 = [(USOSchemaUSOEntitySpan *)self matchInfo];
  int v11 = [v4 matchInfo];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_34;
  }
  uint64_t v17 = [(USOSchemaUSOEntitySpan *)self matchInfo];
  if (v17)
  {
    unsigned int v18 = (void *)v17;
    v19 = [(USOSchemaUSOEntitySpan *)self matchInfo];
    objc_super v20 = [v4 matchInfo];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  $B5B1F2BC487705B71D24B3E729459795 v22 = self->_has;
  int v23 = (*(unsigned int *)&v22 >> 2) & 1;
  unsigned int v24 = v4[56];
  if (v23 != ((v24 >> 2) & 1)) {
    goto LABEL_35;
  }
  if (v23)
  {
    unsigned int startIndex = self->_startIndex;
    if (startIndex != [v4 startIndex]) {
      goto LABEL_35;
    }
    $B5B1F2BC487705B71D24B3E729459795 v22 = self->_has;
    unsigned int v24 = v4[56];
  }
  int v26 = (*(unsigned int *)&v22 >> 3) & 1;
  if (v26 != ((v24 >> 3) & 1)) {
    goto LABEL_35;
  }
  if (v26)
  {
    unsigned int endIndex = self->_endIndex;
    if (endIndex != [v4 endIndex]) {
      goto LABEL_35;
    }
    $B5B1F2BC487705B71D24B3E729459795 v22 = self->_has;
    unsigned int v24 = v4[56];
  }
  int v28 = (*(unsigned int *)&v22 >> 4) & 1;
  if (v28 != ((v24 >> 4) & 1)) {
    goto LABEL_35;
  }
  if (v28)
  {
    int originAppBundleIdType = self->_originAppBundleIdType;
    if (originAppBundleIdType != [v4 originAppBundleIdType]) {
      goto LABEL_35;
    }
  }
  v10 = [(USOSchemaUSOEntitySpan *)self payloadAttachmentInfo];
  int v11 = [v4 payloadAttachmentInfo];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v30 = [(USOSchemaUSOEntitySpan *)self payloadAttachmentInfo];
  if (!v30)
  {

LABEL_38:
    BOOL v35 = 1;
    goto LABEL_36;
  }
  v31 = (void *)v30;
  v32 = [(USOSchemaUSOEntitySpan *)self payloadAttachmentInfo];
  v33 = [v4 payloadAttachmentInfo];
  char v34 = [v32 isEqual:v33];

  if (v34) {
    goto LABEL_38;
  }
LABEL_35:
  BOOL v35 = 0;
LABEL_36:

  return v35;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v5 = [(USOSchemaUSOEntitySpan *)self label];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = [(USOSchemaUSOEntitySpan *)self matchInfo];

  if (v6)
  {
    uint64_t v7 = [(USOSchemaUSOEntitySpan *)self matchInfo];
    PBDataWriterWriteSubmessage();
  }
  char v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v8 = (char)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_11:
      if ((v8 & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  uint64_t v9 = [(USOSchemaUSOEntitySpan *)self payloadAttachmentInfo];

  v10 = v12;
  if (v9)
  {
    int v11 = [(USOSchemaUSOEntitySpan *)self payloadAttachmentInfo];
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEntitySpanReadFrom(self, (uint64_t)a3);
}

- (void)deletePayloadAttachmentInfo
{
}

- (BOOL)hasPayloadAttachmentInfo
{
  return self->_payloadAttachmentInfo != 0;
}

- (void)deleteOriginAppBundleIdType
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasOriginAppBundleIdType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOriginAppBundleIdType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setOriginAppBundleIdType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int originAppBundleIdType = a3;
}

- (void)deleteEndIndex
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasEndIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int endIndex = a3;
}

- (void)deleteStartIndex
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasStartIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int startIndex = a3;
}

- (void)deleteMatchInfo
{
}

- (BOOL)hasMatchInfo
{
  return self->_matchInfo != 0;
}

- (void)deleteLabel
{
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)deleteSourceComponent
{
  *(unsigned char *)&self->_has &= ~2u;
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

- (BOOL)hasSourceComponent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSourceComponent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int sourceComponent = a3;
}

- (void)deleteNodeIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNodeIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int nodeIndex = a3;
}

@end