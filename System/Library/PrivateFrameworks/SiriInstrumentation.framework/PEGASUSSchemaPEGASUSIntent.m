@interface PEGASUSSchemaPEGASUSIntent
- (BOOL)hasConfidence;
- (BOOL)hasIntentCategory;
- (BOOL)hasLinkId;
- (BOOL)hasName;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (PEGASUSSchemaPEGASUSIntent)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSIntent)initWithJSON:(id)a3;
- (SISchemaUUID)linkId;
- (float)confidence;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)intentCategory;
- (int)source;
- (unint64_t)hash;
- (void)deleteConfidence;
- (void)deleteIntentCategory;
- (void)deleteLinkId;
- (void)deleteName;
- (void)deleteSource;
- (void)setConfidence:(float)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasIntentCategory:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setIntentCategory:(int)a3;
- (void)setLinkId:(id)a3;
- (void)setName:(id)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSIntent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PEGASUSSchemaPEGASUSIntent;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSIntent *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PEGASUSSchemaPEGASUSIntent *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (int)source
{
  return self->_source;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (int)intentCategory
{
  return self->_intentCategory;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (PEGASUSSchemaPEGASUSIntent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PEGASUSSchemaPEGASUSIntent;
  v5 = [(PEGASUSSchemaPEGASUSIntent *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSIntent *)v5 setLinkId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"intentCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSIntent setIntentCategory:](v5, "setIntentCategory:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(PEGASUSSchemaPEGASUSIntent *)v5 setName:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSIntent setSource:](v5, "setSource:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"confidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[PEGASUSSchemaPEGASUSIntent setConfidence:](v5, "setConfidence:");
    }
    v13 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSIntent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSIntent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSIntent *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = NSNumber;
    [(PEGASUSSchemaPEGASUSIntent *)self confidence];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"confidence"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(PEGASUSSchemaPEGASUSIntent *)self intentCategory] - 1;
    if (v7 > 2) {
      v8 = @"PEGASUSINTENTCATEGORY_UNKNOWN";
    }
    else {
      v8 = off_1E5EB3B60[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"intentCategory"];
  }
  if (self->_linkId)
  {
    objc_super v9 = [(PEGASUSSchemaPEGASUSIntent *)self linkId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_name)
  {
    v12 = [(PEGASUSSchemaPEGASUSIntent *)self name];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"name"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v14 = [(PEGASUSSchemaPEGASUSIntent *)self source] - 1;
    if (v14 > 4) {
      objc_super v15 = @"PEGASUSINTENTSOURCE_UNKNOWN";
    }
    else {
      objc_super v15 = off_1E5EB3B78[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"source"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_intentCategory;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_source;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  float confidence = self->_confidence;
  double v8 = confidence;
  if (confidence < 0.0) {
    double v8 = -confidence;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSIntent *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSIntent *)self linkId];
  if (v7)
  {
    double v8 = (void *)v7;
    long double v9 = [(PEGASUSSchemaPEGASUSIntent *)self linkId];
    double v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int intentCategory = self->_intentCategory;
    if (intentCategory != [v4 intentCategory]) {
      goto LABEL_15;
    }
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSIntent *)self name];
  uint64_t v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(PEGASUSSchemaPEGASUSIntent *)self name];
  if (v13)
  {
    unsigned int v14 = (void *)v13;
    objc_super v15 = [(PEGASUSSchemaPEGASUSIntent *)self name];
    v16 = [v4 name];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  $C581A5FE487374A0C1516C663F5F6CD8 has = self->_has;
  int v21 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v22 = v4[40];
  if (v21 == ((v22 >> 1) & 1))
  {
    if (v21)
    {
      int source = self->_source;
      if (source != [v4 source]) {
        goto LABEL_15;
      }
      $C581A5FE487374A0C1516C663F5F6CD8 has = self->_has;
      unsigned int v22 = v4[40];
    }
    int v24 = (*(unsigned int *)&has >> 2) & 1;
    if (v24 == ((v22 >> 2) & 1))
    {
      if (!v24 || (float confidence = self->_confidence, [v4 confidence], confidence == v26))
      {
        BOOL v18 = 1;
        goto LABEL_16;
      }
    }
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PEGASUSSchemaPEGASUSIntent *)self linkId];

  if (v4)
  {
    NSUInteger v5 = [(PEGASUSSchemaPEGASUSIntent *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v6 = [(PEGASUSSchemaPEGASUSIntent *)self name];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  double v8 = v9;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    double v8 = v9;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    double v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSIntentReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteConfidence
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasConfidence
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setConfidence:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float confidence = a3;
}

- (void)deleteSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int source = a3;
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteIntentCategory
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIntentCategory:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIntentCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIntentCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int intentCategory = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end