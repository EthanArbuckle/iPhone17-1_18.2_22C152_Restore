@interface MTSchemaMTAppInvocationMetadata
- (BOOL)hasAudioChannel;
- (BOOL)hasAutoTranslateSessionId;
- (BOOL)hasConversationTabView;
- (BOOL)hasDisplayMode;
- (BOOL)hasIsGenderAlternativeEnabled;
- (BOOL)hasIsPlayTranslationsEnabled;
- (BOOL)hasLocalePair;
- (BOOL)hasTabName;
- (BOOL)hasTabSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGenderAlternativeEnabled;
- (BOOL)isPlayTranslationsEnabled;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTAppInvocationMetadata)initWithDictionary:(id)a3;
- (MTSchemaMTAppInvocationMetadata)initWithJSON:(id)a3;
- (MTSchemaMTLocalePair)localePair;
- (NSData)jsonData;
- (SISchemaUUID)autoTranslateSessionId;
- (SISchemaUUID)tabSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioChannel;
- (int)conversationTabView;
- (int)displayMode;
- (int)tabName;
- (unint64_t)hash;
- (void)deleteAudioChannel;
- (void)deleteAutoTranslateSessionId;
- (void)deleteConversationTabView;
- (void)deleteDisplayMode;
- (void)deleteIsGenderAlternativeEnabled;
- (void)deleteIsPlayTranslationsEnabled;
- (void)deleteLocalePair;
- (void)deleteTabName;
- (void)deleteTabSessionId;
- (void)setAudioChannel:(int)a3;
- (void)setAutoTranslateSessionId:(id)a3;
- (void)setConversationTabView:(int)a3;
- (void)setDisplayMode:(int)a3;
- (void)setHasAudioChannel:(BOOL)a3;
- (void)setHasAutoTranslateSessionId:(BOOL)a3;
- (void)setHasConversationTabView:(BOOL)a3;
- (void)setHasDisplayMode:(BOOL)a3;
- (void)setHasIsGenderAlternativeEnabled:(BOOL)a3;
- (void)setHasIsPlayTranslationsEnabled:(BOOL)a3;
- (void)setHasLocalePair:(BOOL)a3;
- (void)setHasTabName:(BOOL)a3;
- (void)setHasTabSessionId:(BOOL)a3;
- (void)setIsGenderAlternativeEnabled:(BOOL)a3;
- (void)setIsPlayTranslationsEnabled:(BOOL)a3;
- (void)setLocalePair:(id)a3;
- (void)setTabName:(int)a3;
- (void)setTabSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTAppInvocationMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTSchemaMTAppInvocationMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTAppInvocationMetadata *)self localePair];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MTSchemaMTAppInvocationMetadata *)self deleteLocalePair];
  }
  v9 = [(MTSchemaMTAppInvocationMetadata *)self tabSessionId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MTSchemaMTAppInvocationMetadata *)self deleteTabSessionId];
  }
  v12 = [(MTSchemaMTAppInvocationMetadata *)self autoTranslateSessionId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MTSchemaMTAppInvocationMetadata *)self deleteAutoTranslateSessionId];
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
  objc_storeStrong((id *)&self->_autoTranslateSessionId, 0);
  objc_storeStrong((id *)&self->_tabSessionId, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
}

- (void)setHasAutoTranslateSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasTabSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLocalePair:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)audioChannel
{
  return self->_audioChannel;
}

- (int)conversationTabView
{
  return self->_conversationTabView;
}

- (BOOL)isPlayTranslationsEnabled
{
  return self->_isPlayTranslationsEnabled;
}

- (void)setAutoTranslateSessionId:(id)a3
{
}

- (SISchemaUUID)autoTranslateSessionId
{
  return self->_autoTranslateSessionId;
}

- (void)setTabSessionId:(id)a3
{
}

- (SISchemaUUID)tabSessionId
{
  return self->_tabSessionId;
}

- (int)tabName
{
  return self->_tabName;
}

- (BOOL)isGenderAlternativeEnabled
{
  return self->_isGenderAlternativeEnabled;
}

- (void)setLocalePair:(id)a3
{
}

- (MTSchemaMTLocalePair)localePair
{
  return self->_localePair;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (MTSchemaMTAppInvocationMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MTSchemaMTAppInvocationMetadata;
  v5 = [(MTSchemaMTAppInvocationMetadata *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"displayMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTAppInvocationMetadata setDisplayMode:](v5, "setDisplayMode:", [v6 intValue]);
    }
    v21 = v6;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"localePair"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[MTSchemaMTLocalePair alloc] initWithDictionary:v7];
      [(MTSchemaMTAppInvocationMetadata *)v5 setLocalePair:v8];
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isGenderAlternativeEnabled", v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTAppInvocationMetadata setIsGenderAlternativeEnabled:](v5, "setIsGenderAlternativeEnabled:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"tabName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTAppInvocationMetadata setTabName:](v5, "setTabName:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"tabSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(MTSchemaMTAppInvocationMetadata *)v5 setTabSessionId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"autoTranslateSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[SISchemaUUID alloc] initWithDictionary:v13];
      [(MTSchemaMTAppInvocationMetadata *)v5 setAutoTranslateSessionId:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"isPlayTranslationsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTAppInvocationMetadata setIsPlayTranslationsEnabled:](v5, "setIsPlayTranslationsEnabled:", [v15 BOOLValue]);
    }
    objc_super v16 = [v4 objectForKeyedSubscript:@"conversationTabView"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTAppInvocationMetadata setConversationTabView:](v5, "setConversationTabView:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"audioChannel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTAppInvocationMetadata setAudioChannel:](v5, "setAudioChannel:", [v17 intValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (MTSchemaMTAppInvocationMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTAppInvocationMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTAppInvocationMetadata *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    unsigned int v4 = [(MTSchemaMTAppInvocationMetadata *)self audioChannel] - 1;
    if (v4 > 4) {
      v5 = @"MTAPPAUDIOCHANNEL_UNKNOWN";
    }
    else {
      v5 = off_1E5EBCCA8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioChannel"];
  }
  if (self->_autoTranslateSessionId)
  {
    v6 = [(MTSchemaMTAppInvocationMetadata *)self autoTranslateSessionId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"autoTranslateSessionId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"autoTranslateSessionId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    int v10 = [(MTSchemaMTAppInvocationMetadata *)self conversationTabView];
    int v11 = @"MTAPPCONVERSATIONTABVIEW_UNKNOWN";
    if (v10 == 1) {
      int v11 = @"MTAPPCONVERSATIONTABVIEW_FACE_TO_FACE";
    }
    if (v10 == 2) {
      v12 = @"MTAPPCONVERSATIONTABVIEW_SIDE_BY_SIDE";
    }
    else {
      v12 = v11;
    }
    [v3 setObject:v12 forKeyedSubscript:@"conversationTabView"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v13 = [(MTSchemaMTAppInvocationMetadata *)self displayMode] - 1;
    if (v13 > 2) {
      int v14 = @"MTAPPDISPLAYMODE_UNKNOWN";
    }
    else {
      int v14 = off_1E5EBCCD0[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"displayMode"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[MTSchemaMTAppInvocationMetadata isGenderAlternativeEnabled](self, "isGenderAlternativeEnabled"));
    [v3 setObject:v15 forKeyedSubscript:@"isGenderAlternativeEnabled"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_super v16 = objc_msgSend(NSNumber, "numberWithBool:", -[MTSchemaMTAppInvocationMetadata isPlayTranslationsEnabled](self, "isPlayTranslationsEnabled"));
    [v3 setObject:v16 forKeyedSubscript:@"isPlayTranslationsEnabled"];
  }
  if (self->_localePair)
  {
    v17 = [(MTSchemaMTAppInvocationMetadata *)self localePair];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"localePair"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"localePair"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v20 = [(MTSchemaMTAppInvocationMetadata *)self tabName] - 1;
    if (v20 > 3) {
      v21 = @"MTAPPTABNAME_UNKNOWN";
    }
    else {
      v21 = off_1E5EBCCE8[v20];
    }
    [v3 setObject:v21 forKeyedSubscript:@"tabName"];
  }
  if (self->_tabSessionId)
  {
    objc_super v22 = [(MTSchemaMTAppInvocationMetadata *)self tabSessionId];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"tabSessionId"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"tabSessionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_displayMode;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(MTSchemaMTLocalePair *)self->_localePair hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_isGenderAlternativeEnabled;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_tabName;
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
LABEL_9:
  unint64_t v7 = [(SISchemaUUID *)self->_tabSessionId hash];
  unint64_t v8 = [(SISchemaUUID *)self->_autoTranslateSessionId hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_isPlayTranslationsEnabled;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_conversationTabView;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_audioChannel;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[60] & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    int displayMode = self->_displayMode;
    if (displayMode != [v4 displayMode]) {
      goto LABEL_27;
    }
  }
  uint64_t v6 = [(MTSchemaMTAppInvocationMetadata *)self localePair];
  unint64_t v7 = [v4 localePair];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_26;
  }
  uint64_t v8 = [(MTSchemaMTAppInvocationMetadata *)self localePair];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(MTSchemaMTAppInvocationMetadata *)self localePair];
    uint64_t v11 = [v4 localePair];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  $48140CF3950320FCE88C15C9425D0D2A has = self->_has;
  int v14 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v15 = v4[60];
  if (v14 != ((v15 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v14)
  {
    int isGenderAlternativeEnabled = self->_isGenderAlternativeEnabled;
    if (isGenderAlternativeEnabled != [v4 isGenderAlternativeEnabled]) {
      goto LABEL_27;
    }
    $48140CF3950320FCE88C15C9425D0D2A has = self->_has;
    unsigned int v15 = v4[60];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v17)
  {
    int tabName = self->_tabName;
    if (tabName != [v4 tabName]) {
      goto LABEL_27;
    }
  }
  uint64_t v6 = [(MTSchemaMTAppInvocationMetadata *)self tabSessionId];
  unint64_t v7 = [v4 tabSessionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_26;
  }
  uint64_t v19 = [(MTSchemaMTAppInvocationMetadata *)self tabSessionId];
  if (v19)
  {
    unsigned int v20 = (void *)v19;
    v21 = [(MTSchemaMTAppInvocationMetadata *)self tabSessionId];
    objc_super v22 = [v4 tabSessionId];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v6 = [(MTSchemaMTAppInvocationMetadata *)self autoTranslateSessionId];
  unint64_t v7 = [v4 autoTranslateSessionId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v24 = [(MTSchemaMTAppInvocationMetadata *)self autoTranslateSessionId];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(MTSchemaMTAppInvocationMetadata *)self autoTranslateSessionId];
    v27 = [v4 autoTranslateSessionId];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  $48140CF3950320FCE88C15C9425D0D2A v31 = self->_has;
  int v32 = (*(unsigned int *)&v31 >> 3) & 1;
  unsigned int v33 = v4[60];
  if (v32 == ((v33 >> 3) & 1))
  {
    if (v32)
    {
      int isPlayTranslationsEnabled = self->_isPlayTranslationsEnabled;
      if (isPlayTranslationsEnabled != [v4 isPlayTranslationsEnabled]) {
        goto LABEL_27;
      }
      $48140CF3950320FCE88C15C9425D0D2A v31 = self->_has;
      unsigned int v33 = v4[60];
    }
    int v35 = (*(unsigned int *)&v31 >> 4) & 1;
    if (v35 == ((v33 >> 4) & 1))
    {
      if (v35)
      {
        int conversationTabView = self->_conversationTabView;
        if (conversationTabView != [v4 conversationTabView]) {
          goto LABEL_27;
        }
        $48140CF3950320FCE88C15C9425D0D2A v31 = self->_has;
        unsigned int v33 = v4[60];
      }
      int v37 = (*(unsigned int *)&v31 >> 5) & 1;
      if (v37 == ((v33 >> 5) & 1))
      {
        if (!v37
          || (int audioChannel = self->_audioChannel, audioChannel == [v4 audioChannel]))
        {
          BOOL v29 = 1;
          goto LABEL_28;
        }
      }
    }
  }
LABEL_27:
  BOOL v29 = 0;
LABEL_28:

  return v29;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(MTSchemaMTAppInvocationMetadata *)self localePair];

  if (v4)
  {
    uint64_t v5 = [(MTSchemaMTAppInvocationMetadata *)self localePair];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v7 = [(MTSchemaMTAppInvocationMetadata *)self tabSessionId];

  if (v7)
  {
    uint64_t v8 = [(MTSchemaMTAppInvocationMetadata *)self tabSessionId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v9 = [(MTSchemaMTAppInvocationMetadata *)self autoTranslateSessionId];

  if (v9)
  {
    uint64_t v10 = [(MTSchemaMTAppInvocationMetadata *)self autoTranslateSessionId];
    PBDataWriterWriteSubmessage();
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v11 = (char)self->_has;
    if ((v11 & 0x10) == 0)
    {
LABEL_15:
      if ((v11 & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_16:
  }
    PBDataWriterWriteInt32Field();
LABEL_17:
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTAppInvocationMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioChannel
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasAudioChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAudioChannel
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAudioChannel:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int audioChannel = a3;
}

- (void)deleteConversationTabView
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasConversationTabView:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasConversationTabView
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setConversationTabView:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int conversationTabView = a3;
}

- (void)deleteIsPlayTranslationsEnabled
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsPlayTranslationsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPlayTranslationsEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsPlayTranslationsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isPlayTranslationsEnabled = a3;
}

- (void)deleteAutoTranslateSessionId
{
}

- (BOOL)hasAutoTranslateSessionId
{
  return self->_autoTranslateSessionId != 0;
}

- (void)deleteTabSessionId
{
}

- (BOOL)hasTabSessionId
{
  return self->_tabSessionId != 0;
}

- (void)deleteTabName
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTabName:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTabName
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTabName:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int tabName = a3;
}

- (void)deleteIsGenderAlternativeEnabled
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsGenderAlternativeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsGenderAlternativeEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsGenderAlternativeEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isGenderAlternativeEnabled = a3;
}

- (void)deleteLocalePair
{
}

- (BOOL)hasLocalePair
{
  return self->_localePair != 0;
}

- (void)deleteDisplayMode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDisplayMode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDisplayMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int displayMode = a3;
}

@end