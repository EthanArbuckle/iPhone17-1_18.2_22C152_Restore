@interface NLXSchemaNLXLegacyNLContext
- (BOOL)hasIsDictationPrompt;
- (BOOL)hasIsListenAfterSpeaking;
- (BOOL)hasIsStrictPrompt;
- (BOOL)hasLegacyContextSource;
- (BOOL)hasLinkId;
- (BOOL)hasPreviousDomainName;
- (BOOL)isDictationPrompt;
- (BOOL)isEqual:(id)a3;
- (BOOL)isListenAfterSpeaking;
- (BOOL)isStrictPrompt;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaNLXLegacyNLContext)initWithDictionary:(id)a3;
- (NLXSchemaNLXLegacyNLContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)previousDomainName;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)legacyContextSource;
- (unint64_t)hash;
- (void)deleteIsDictationPrompt;
- (void)deleteIsListenAfterSpeaking;
- (void)deleteIsStrictPrompt;
- (void)deleteLegacyContextSource;
- (void)deleteLinkId;
- (void)deletePreviousDomainName;
- (void)setHasIsDictationPrompt:(BOOL)a3;
- (void)setHasIsListenAfterSpeaking:(BOOL)a3;
- (void)setHasIsStrictPrompt:(BOOL)a3;
- (void)setHasLegacyContextSource:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasPreviousDomainName:(BOOL)a3;
- (void)setIsDictationPrompt:(BOOL)a3;
- (void)setIsListenAfterSpeaking:(BOOL)a3;
- (void)setIsStrictPrompt:(BOOL)a3;
- (void)setLegacyContextSource:(int)a3;
- (void)setLinkId:(id)a3;
- (void)setPreviousDomainName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaNLXLegacyNLContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaNLXLegacyNLContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaNLXLegacyNLContext *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLXSchemaNLXLegacyNLContext *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_previousDomainName, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasPreviousDomainName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)legacyContextSource
{
  return self->_legacyContextSource;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (BOOL)isListenAfterSpeaking
{
  return self->_isListenAfterSpeaking;
}

- (void)setPreviousDomainName:(id)a3
{
}

- (NSString)previousDomainName
{
  return self->_previousDomainName;
}

- (BOOL)isStrictPrompt
{
  return self->_isStrictPrompt;
}

- (BOOL)isDictationPrompt
{
  return self->_isDictationPrompt;
}

- (NLXSchemaNLXLegacyNLContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaNLXLegacyNLContext;
  v5 = [(NLXSchemaNLXLegacyNLContext *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDictationPrompt"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaNLXLegacyNLContext setIsDictationPrompt:](v5, "setIsDictationPrompt:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isStrictPrompt"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaNLXLegacyNLContext setIsStrictPrompt:](v5, "setIsStrictPrompt:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"previousDomainName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(NLXSchemaNLXLegacyNLContext *)v5 setPreviousDomainName:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isListenAfterSpeaking"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaNLXLegacyNLContext setIsListenAfterSpeaking:](v5, "setIsListenAfterSpeaking:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(NLXSchemaNLXLegacyNLContext *)v5 setLinkId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"legacyContextSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaNLXLegacyNLContext setLegacyContextSource:](v5, "setLegacyContextSource:", [v13 intValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (NLXSchemaNLXLegacyNLContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaNLXLegacyNLContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaNLXLegacyNLContext *)self dictionaryRepresentation];
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
  if (has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaNLXLegacyNLContext isDictationPrompt](self, "isDictationPrompt"));
    [v3 setObject:v10 forKeyedSubscript:@"isDictationPrompt"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_16:
      v12 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaNLXLegacyNLContext isStrictPrompt](self, "isStrictPrompt"));
      [v3 setObject:v12 forKeyedSubscript:@"isStrictPrompt"];

      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaNLXLegacyNLContext isListenAfterSpeaking](self, "isListenAfterSpeaking"));
  [v3 setObject:v11 forKeyedSubscript:@"isListenAfterSpeaking"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_4:
  if ((has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_5:
  int v5 = [(NLXSchemaNLXLegacyNLContext *)self legacyContextSource];
  v6 = @"NLXLEGACYCONTEXTSOURCE_UNKNOWN";
  if (v5 == 1) {
    v6 = @"NLXLEGACYCONTEXTSOURCE_MODALITY";
  }
  if (v5 == 2) {
    uint64_t v7 = @"NLXLEGACYCONTEXTSOURCE_POMMES";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"legacyContextSource"];
LABEL_11:
  if (self->_linkId)
  {
    v8 = [(NLXSchemaNLXLegacyNLContext *)self linkId];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_previousDomainName)
  {
    v14 = [(NLXSchemaNLXLegacyNLContext *)self previousDomainName];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"previousDomainName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_isDictationPrompt;
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
      uint64_t v4 = 2654435761 * self->_isStrictPrompt;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_previousDomainName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_isListenAfterSpeaking;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(SISchemaUUID *)self->_linkId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_legacyContextSource;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $AA31BA2F0F6CBBACEF946895F2D7C1DD has = self->_has;
  unsigned int v6 = v4[44];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int isDictationPrompt = self->_isDictationPrompt;
    if (isDictationPrompt != [v4 isDictationPrompt]) {
      goto LABEL_22;
    }
    $AA31BA2F0F6CBBACEF946895F2D7C1DD has = self->_has;
    unsigned int v6 = v4[44];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int isStrictPrompt = self->_isStrictPrompt;
    if (isStrictPrompt != [v4 isStrictPrompt]) {
      goto LABEL_22;
    }
  }
  v10 = [(NLXSchemaNLXLegacyNLContext *)self previousDomainName];
  v11 = [v4 previousDomainName];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(NLXSchemaNLXLegacyNLContext *)self previousDomainName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(NLXSchemaNLXLegacyNLContext *)self previousDomainName];
    v15 = [v4 previousDomainName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v17 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v17 != ((v4[44] >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v17)
  {
    int isListenAfterSpeaking = self->_isListenAfterSpeaking;
    if (isListenAfterSpeaking != [v4 isListenAfterSpeaking]) {
      goto LABEL_22;
    }
  }
  v10 = [(NLXSchemaNLXLegacyNLContext *)self linkId];
  v11 = [v4 linkId];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v19 = [(NLXSchemaNLXLegacyNLContext *)self linkId];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(NLXSchemaNLXLegacyNLContext *)self linkId];
    v22 = [v4 linkId];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v26 = (*(unsigned char *)&self->_has >> 3) & 1;
  if (v26 == ((v4[44] >> 3) & 1))
  {
    if (!v26
      || (int legacyContextSource = self->_legacyContextSource,
          legacyContextSource == [v4 legacyContextSource]))
    {
      BOOL v24 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  BOOL v24 = 0;
LABEL_23:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v5 = [(NLXSchemaNLXLegacyNLContext *)self previousDomainName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  unsigned int v6 = [(NLXSchemaNLXLegacyNLContext *)self linkId];

  if (v6)
  {
    unint64_t v7 = [(NLXSchemaNLXLegacyNLContext *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaNLXLegacyNLContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteLegacyContextSource
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasLegacyContextSource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLegacyContextSource
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLegacyContextSource:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int legacyContextSource = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteIsListenAfterSpeaking
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsListenAfterSpeaking:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsListenAfterSpeaking
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsListenAfterSpeaking:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isListenAfterSpeaking = a3;
}

- (void)deletePreviousDomainName
{
}

- (BOOL)hasPreviousDomainName
{
  return self->_previousDomainName != 0;
}

- (void)deleteIsStrictPrompt
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsStrictPrompt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsStrictPrompt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsStrictPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isStrictPrompt = a3;
}

- (void)deleteIsDictationPrompt
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsDictationPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDictationPrompt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsDictationPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isDictationPrompt = a3;
}

@end