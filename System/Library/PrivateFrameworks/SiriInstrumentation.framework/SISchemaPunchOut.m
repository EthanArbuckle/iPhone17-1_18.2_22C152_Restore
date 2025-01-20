@interface SISchemaPunchOut
- (BOOL)hasAceID;
- (BOOL)hasAppID;
- (BOOL)hasIsPunchoutToHomeScreen;
- (BOOL)hasPunchOutUI;
- (BOOL)hasUrlScheme;
- (BOOL)hasViewContainer;
- (BOOL)hasViewElementID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPunchoutToHomeScreen;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)viewElementID;
- (NSString)aceID;
- (NSString)appID;
- (NSString)urlScheme;
- (SISchemaPunchOut)initWithDictionary:(id)a3;
- (SISchemaPunchOut)initWithJSON:(id)a3;
- (SISchemaViewContainer)viewContainer;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)punchOutUI;
- (unint64_t)hash;
- (void)deleteAceID;
- (void)deleteAppID;
- (void)deleteIsPunchoutToHomeScreen;
- (void)deletePunchOutUI;
- (void)deleteUrlScheme;
- (void)deleteViewContainer;
- (void)deleteViewElementID;
- (void)setAceID:(id)a3;
- (void)setAppID:(id)a3;
- (void)setHasAceID:(BOOL)a3;
- (void)setHasAppID:(BOOL)a3;
- (void)setHasIsPunchoutToHomeScreen:(BOOL)a3;
- (void)setHasPunchOutUI:(BOOL)a3;
- (void)setHasUrlScheme:(BOOL)a3;
- (void)setHasViewContainer:(BOOL)a3;
- (void)setHasViewElementID:(BOOL)a3;
- (void)setIsPunchoutToHomeScreen:(BOOL)a3;
- (void)setPunchOutUI:(int)a3;
- (void)setUrlScheme:(id)a3;
- (void)setViewContainer:(id)a3;
- (void)setViewElementID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaPunchOut

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaPunchOut;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaPunchOut *)self viewContainer];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaPunchOut *)self deleteViewContainer];
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
  objc_storeStrong((id *)&self->_aceID, 0);
  objc_storeStrong((id *)&self->_viewElementID, 0);
  objc_storeStrong((id *)&self->_viewContainer, 0);
  objc_storeStrong((id *)&self->_urlScheme, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

- (void)setHasAceID:(BOOL)a3
{
  self->_hasUrlScheme = a3;
}

- (void)setHasViewElementID:(BOOL)a3
{
  self->_hasAppID = a3;
}

- (void)setHasViewContainer:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasUrlScheme:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAppID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAceID:(id)a3
{
}

- (NSString)aceID
{
  return self->_aceID;
}

- (BOOL)isPunchoutToHomeScreen
{
  return self->_isPunchoutToHomeScreen;
}

- (int)punchOutUI
{
  return self->_punchOutUI;
}

- (void)setViewElementID:(id)a3
{
}

- (NSData)viewElementID
{
  return self->_viewElementID;
}

- (void)setViewContainer:(id)a3
{
}

- (SISchemaViewContainer)viewContainer
{
  return self->_viewContainer;
}

- (void)setUrlScheme:(id)a3
{
}

- (NSString)urlScheme
{
  return self->_urlScheme;
}

- (void)setAppID:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (SISchemaPunchOut)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SISchemaPunchOut;
  v5 = [(SISchemaPunchOut *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaPunchOut *)v5 setAppID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"urlScheme"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(SISchemaPunchOut *)v5 setUrlScheme:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"viewContainer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[SISchemaViewContainer alloc] initWithDictionary:v10];
      [(SISchemaPunchOut *)v5 setViewContainer:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"viewElementID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
      [(SISchemaPunchOut *)v5 setViewElementID:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"punchOutUI"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaPunchOut setPunchOutUI:](v5, "setPunchOutUI:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"isPunchoutToHomeScreen"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaPunchOut setIsPunchoutToHomeScreen:](v5, "setIsPunchoutToHomeScreen:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"aceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(SISchemaPunchOut *)v5 setAceID:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (SISchemaPunchOut)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaPunchOut *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaPunchOut *)self dictionaryRepresentation];
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
  if (self->_aceID)
  {
    id v4 = [(SISchemaPunchOut *)self aceID];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"aceID"];
  }
  if (self->_appID)
  {
    v6 = [(SISchemaPunchOut *)self appID];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"appID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaPunchOut isPunchoutToHomeScreen](self, "isPunchoutToHomeScreen"));
    [v3 setObject:v9 forKeyedSubscript:@"isPunchoutToHomeScreen"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v10 = [(SISchemaPunchOut *)self punchOutUI] - 1;
    if (v10 > 6) {
      v11 = @"PUNCHOUTUI_UNKNOWN";
    }
    else {
      v11 = off_1E5EB8238[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"punchOutUI"];
  }
  if (self->_urlScheme)
  {
    v12 = [(SISchemaPunchOut *)self urlScheme];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"urlScheme"];
  }
  if (self->_viewContainer)
  {
    v14 = [(SISchemaPunchOut *)self viewContainer];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"viewContainer"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"viewContainer"];
    }
  }
  if (self->_viewElementID)
  {
    v17 = [(SISchemaPunchOut *)self viewElementID];
    v18 = [v17 base64EncodedStringWithOptions:0];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"viewElementID"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"viewElementID"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appID hash];
  NSUInteger v4 = [(NSString *)self->_urlScheme hash];
  unint64_t v5 = [(SISchemaViewContainer *)self->_viewContainer hash];
  uint64_t v6 = [(NSData *)self->_viewElementID hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_punchOutUI;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_aceID hash];
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_isPunchoutToHomeScreen;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_aceID hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  unint64_t v5 = [(SISchemaPunchOut *)self appID];
  uint64_t v6 = [v4 appID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v7 = [(SISchemaPunchOut *)self appID];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    objc_super v9 = [(SISchemaPunchOut *)self appID];
    unsigned int v10 = [v4 appID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaPunchOut *)self urlScheme];
  uint64_t v6 = [v4 urlScheme];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v12 = [(SISchemaPunchOut *)self urlScheme];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(SISchemaPunchOut *)self urlScheme];
    v15 = [v4 urlScheme];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaPunchOut *)self viewContainer];
  uint64_t v6 = [v4 viewContainer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v17 = [(SISchemaPunchOut *)self viewContainer];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(SISchemaPunchOut *)self viewContainer];
    objc_super v20 = [v4 viewContainer];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaPunchOut *)self viewElementID];
  uint64_t v6 = [v4 viewElementID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v22 = [(SISchemaPunchOut *)self viewElementID];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(SISchemaPunchOut *)self viewElementID];
    v25 = [v4 viewElementID];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  $B07984093DBDE6FD095F2C080453EFAF has = self->_has;
  unsigned int v28 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v28 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    int punchOutUI = self->_punchOutUI;
    if (punchOutUI != [v4 punchOutUI]) {
      goto LABEL_34;
    }
    $B07984093DBDE6FD095F2C080453EFAF has = self->_has;
    unsigned int v28 = v4[56];
  }
  int v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v30)
  {
    int isPunchoutToHomeScreen = self->_isPunchoutToHomeScreen;
    if (isPunchoutToHomeScreen != [v4 isPunchoutToHomeScreen]) {
      goto LABEL_34;
    }
  }
  unint64_t v5 = [(SISchemaPunchOut *)self aceID];
  uint64_t v6 = [v4 aceID];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v32 = [(SISchemaPunchOut *)self aceID];
  if (!v32)
  {

LABEL_37:
    BOOL v37 = 1;
    goto LABEL_35;
  }
  v33 = (void *)v32;
  v34 = [(SISchemaPunchOut *)self aceID];
  v35 = [v4 aceID];
  char v36 = [v34 isEqual:v35];

  if (v36) {
    goto LABEL_37;
  }
LABEL_34:
  BOOL v37 = 0;
LABEL_35:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  NSUInteger v4 = [(SISchemaPunchOut *)self appID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(SISchemaPunchOut *)self urlScheme];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(SISchemaPunchOut *)self viewContainer];

  if (v6)
  {
    uint64_t v7 = [(SISchemaPunchOut *)self viewContainer];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SISchemaPunchOut *)self viewElementID];

  if (v8) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  unsigned int v10 = [(SISchemaPunchOut *)self aceID];

  int v11 = v12;
  if (v10)
  {
    PBDataWriterWriteStringField();
    int v11 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaPunchOutReadFrom(self, (uint64_t)a3);
}

- (void)deleteAceID
{
}

- (BOOL)hasAceID
{
  return self->_aceID != 0;
}

- (void)deleteIsPunchoutToHomeScreen
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsPunchoutToHomeScreen:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPunchoutToHomeScreen
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsPunchoutToHomeScreen:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isPunchoutToHomeScreen = a3;
}

- (void)deletePunchOutUI
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPunchOutUI:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPunchOutUI
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPunchOutUI:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int punchOutUI = a3;
}

- (void)deleteViewElementID
{
}

- (BOOL)hasViewElementID
{
  return self->_viewElementID != 0;
}

- (void)deleteViewContainer
{
}

- (BOOL)hasViewContainer
{
  return self->_viewContainer != 0;
}

- (void)deleteUrlScheme
{
}

- (BOOL)hasUrlScheme
{
  return self->_urlScheme != 0;
}

- (void)deleteAppID
{
}

- (BOOL)hasAppID
{
  return self->_appID != 0;
}

@end