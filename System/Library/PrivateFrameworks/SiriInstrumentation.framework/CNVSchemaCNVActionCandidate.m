@interface CNVSchemaCNVActionCandidate
- (BOOL)hasActionCandidateId;
- (BOOL)hasAffinityScore;
- (BOOL)hasLinkMetadata;
- (BOOL)hasParseHypothesisId;
- (BOOL)hasPlugin;
- (BOOL)hasPommesId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVActionCandidate)initWithDictionary:(id)a3;
- (CNVSchemaCNVActionCandidate)initWithJSON:(id)a3;
- (CNVSchemaCNVLinkMetadata)linkMetadata;
- (NSData)jsonData;
- (SISchemaUUID)actionCandidateId;
- (SISchemaUUID)parseHypothesisId;
- (SISchemaUUID)pommesId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)plugin;
- (unint64_t)hash;
- (unint64_t)whichParseid;
- (unsigned)affinityScore;
- (void)deleteActionCandidateId;
- (void)deleteAffinityScore;
- (void)deleteLinkMetadata;
- (void)deleteParseHypothesisId;
- (void)deletePlugin;
- (void)deletePommesId;
- (void)setActionCandidateId:(id)a3;
- (void)setAffinityScore:(unsigned int)a3;
- (void)setHasActionCandidateId:(BOOL)a3;
- (void)setHasAffinityScore:(BOOL)a3;
- (void)setHasLinkMetadata:(BOOL)a3;
- (void)setHasParseHypothesisId:(BOOL)a3;
- (void)setHasPlugin:(BOOL)a3;
- (void)setHasPommesId:(BOOL)a3;
- (void)setLinkMetadata:(id)a3;
- (void)setParseHypothesisId:(id)a3;
- (void)setPlugin:(int)a3;
- (void)setPommesId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVActionCandidate

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNVSchemaCNVActionCandidate;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVActionCandidate *)self actionCandidateId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CNVSchemaCNVActionCandidate *)self deleteActionCandidateId];
  }
  v9 = [(CNVSchemaCNVActionCandidate *)self parseHypothesisId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CNVSchemaCNVActionCandidate *)self deleteParseHypothesisId];
  }
  v12 = [(CNVSchemaCNVActionCandidate *)self pommesId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CNVSchemaCNVActionCandidate *)self deletePommesId];
  }
  v15 = [(CNVSchemaCNVActionCandidate *)self linkMetadata];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CNVSchemaCNVActionCandidate *)self deleteLinkMetadata];
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
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_pommesId, 0);
  objc_storeStrong((id *)&self->_parseHypothesisId, 0);
  objc_storeStrong((id *)&self->_actionCandidateId, 0);
}

- (void)setHasLinkMetadata:(BOOL)a3
{
  self->_hasActionCandidateId = a3;
}

- (void)setHasPommesId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasPommesId
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasParseHypothesisId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasParseHypothesisId
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasActionCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLinkMetadata:(id)a3
{
}

- (CNVSchemaCNVLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (unsigned)affinityScore
{
  return self->_affinityScore;
}

- (int)plugin
{
  return self->_plugin;
}

- (void)setActionCandidateId:(id)a3
{
}

- (SISchemaUUID)actionCandidateId
{
  return self->_actionCandidateId;
}

- (unint64_t)whichParseid
{
  return self->_whichParseid;
}

- (CNVSchemaCNVActionCandidate)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNVSchemaCNVActionCandidate;
  v5 = [(CNVSchemaCNVActionCandidate *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CNVSchemaCNVActionCandidate *)v5 setActionCandidateId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"plugin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVActionCandidate setPlugin:](v5, "setPlugin:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"parseHypothesisId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(CNVSchemaCNVActionCandidate *)v5 setParseHypothesisId:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"pommesId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(CNVSchemaCNVActionCandidate *)v5 setPommesId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"affinityScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVActionCandidate setAffinityScore:](v5, "setAffinityScore:", [v13 unsignedIntValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"linkMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[CNVSchemaCNVLinkMetadata alloc] initWithDictionary:v14];
      [(CNVSchemaCNVActionCandidate *)v5 setLinkMetadata:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (CNVSchemaCNVActionCandidate)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVActionCandidate *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVActionCandidate *)self dictionaryRepresentation];
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
  if (self->_actionCandidateId)
  {
    id v4 = [(CNVSchemaCNVActionCandidate *)self actionCandidateId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionCandidateId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionCandidateId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CNVSchemaCNVActionCandidate affinityScore](self, "affinityScore"));
    [v3 setObject:v7 forKeyedSubscript:@"affinityScore"];
  }
  if (self->_linkMetadata)
  {
    int v8 = [(CNVSchemaCNVActionCandidate *)self linkMetadata];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"linkMetadata"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"linkMetadata"];
    }
  }
  if (self->_parseHypothesisId)
  {
    int v11 = [(CNVSchemaCNVActionCandidate *)self parseHypothesisId];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"parseHypothesisId"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"parseHypothesisId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v14 = [(CNVSchemaCNVActionCandidate *)self plugin] - 1;
    if (v14 > 0x24) {
      v15 = @"CNVPLUGIN_UNKNOWN";
    }
    else {
      v15 = off_1E5EAD1E8[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"plugin"];
  }
  if (self->_pommesId)
  {
    v16 = [(CNVSchemaCNVActionCandidate *)self pommesId];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"pommesId"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"pommesId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_actionCandidateId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_plugin;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(SISchemaUUID *)self->_parseHypothesisId hash];
  unint64_t v6 = [(SISchemaUUID *)self->_pommesId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_affinityScore;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(CNVSchemaCNVLinkMetadata *)self->_linkMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  unint64_t whichParseid = self->_whichParseid;
  if (whichParseid != [v4 whichParseid]) {
    goto LABEL_29;
  }
  unint64_t v6 = [(CNVSchemaCNVActionCandidate *)self actionCandidateId];
  uint64_t v7 = [v4 actionCandidateId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_28;
  }
  uint64_t v8 = [(CNVSchemaCNVActionCandidate *)self actionCandidateId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CNVSchemaCNVActionCandidate *)self actionCandidateId];
    int v11 = [v4 actionCandidateId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    int plugin = self->_plugin;
    if (plugin != [v4 plugin]) {
      goto LABEL_29;
    }
  }
  unint64_t v6 = [(CNVSchemaCNVActionCandidate *)self parseHypothesisId];
  uint64_t v7 = [v4 parseHypothesisId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_28;
  }
  uint64_t v14 = [(CNVSchemaCNVActionCandidate *)self parseHypothesisId];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(CNVSchemaCNVActionCandidate *)self parseHypothesisId];
    int v17 = [v4 parseHypothesisId];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVActionCandidate *)self pommesId];
  uint64_t v7 = [v4 pommesId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_28;
  }
  uint64_t v19 = [(CNVSchemaCNVActionCandidate *)self pommesId];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(CNVSchemaCNVActionCandidate *)self pommesId];
    v22 = [v4 pommesId];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  int v24 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v24 != ((v4[56] >> 1) & 1)) {
    goto LABEL_29;
  }
  if (v24)
  {
    unsigned int affinityScore = self->_affinityScore;
    if (affinityScore != [v4 affinityScore]) {
      goto LABEL_29;
    }
  }
  unint64_t v6 = [(CNVSchemaCNVActionCandidate *)self linkMetadata];
  uint64_t v7 = [v4 linkMetadata];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v26 = [(CNVSchemaCNVActionCandidate *)self linkMetadata];
    if (!v26)
    {

LABEL_32:
      BOOL v31 = 1;
      goto LABEL_30;
    }
    v27 = (void *)v26;
    v28 = [(CNVSchemaCNVActionCandidate *)self linkMetadata];
    v29 = [v4 linkMetadata];
    char v30 = [v28 isEqual:v29];

    if (v30) {
      goto LABEL_32;
    }
  }
  else
  {
LABEL_28:
  }
LABEL_29:
  BOOL v31 = 0;
LABEL_30:

  return v31;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(CNVSchemaCNVActionCandidate *)self actionCandidateId];

  if (v4)
  {
    unint64_t v5 = [(CNVSchemaCNVActionCandidate *)self actionCandidateId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v6 = [(CNVSchemaCNVActionCandidate *)self parseHypothesisId];

  if (v6)
  {
    uint64_t v7 = [(CNVSchemaCNVActionCandidate *)self parseHypothesisId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CNVSchemaCNVActionCandidate *)self pommesId];

  if (v8)
  {
    v9 = [(CNVSchemaCNVActionCandidate *)self pommesId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  v10 = [(CNVSchemaCNVActionCandidate *)self linkMetadata];

  int v11 = v13;
  if (v10)
  {
    int v12 = [(CNVSchemaCNVActionCandidate *)self linkMetadata];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVActionCandidateReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkMetadata
{
}

- (BOOL)hasLinkMetadata
{
  return self->_linkMetadata != 0;
}

- (void)deleteAffinityScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAffinityScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAffinityScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAffinityScore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int affinityScore = a3;
}

- (void)deletePommesId
{
  if (self->_whichParseid == 4)
  {
    self->_unint64_t whichParseid = 0;
    self->_pommesId = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUID)pommesId
{
  if (self->_whichParseid == 4) {
    v2 = self->_pommesId;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPommesId:(id)a3
{
  uint64_t v4 = (SISchemaUUID *)a3;
  parseHypothesisId = self->_parseHypothesisId;
  self->_parseHypothesisId = 0;

  self->_unint64_t whichParseid = 4 * (v4 != 0);
  pommesId = self->_pommesId;
  self->_pommesId = v4;
}

- (void)deleteParseHypothesisId
{
  if (self->_whichParseid == 3)
  {
    self->_unint64_t whichParseid = 0;
    self->_parseHypothesisId = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUID)parseHypothesisId
{
  if (self->_whichParseid == 3) {
    v2 = self->_parseHypothesisId;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setParseHypothesisId:(id)a3
{
  uint64_t v4 = (SISchemaUUID *)a3;
  pommesId = self->_pommesId;
  self->_pommesId = 0;

  unint64_t v6 = 3;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichParseid = v6;
  parseHypothesisId = self->_parseHypothesisId;
  self->_parseHypothesisId = v4;
}

- (void)deletePlugin
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPlugin:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlugin
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPlugin:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int plugin = a3;
}

- (void)deleteActionCandidateId
{
}

- (BOOL)hasActionCandidateId
{
  return self->_actionCandidateId != 0;
}

@end