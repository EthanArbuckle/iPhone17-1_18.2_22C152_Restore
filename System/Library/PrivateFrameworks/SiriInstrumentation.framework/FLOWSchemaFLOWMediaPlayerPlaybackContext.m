@interface FLOWSchemaFLOWMediaPlayerPlaybackContext
- (BOOL)hasContentSource;
- (BOOL)hasEndpoint;
- (BOOL)hasExecutionSource;
- (BOOL)hasLinkId;
- (BOOL)hasPlaylistContext;
- (BOOL)hasRadioStationContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWMediaPlayerPlaybackContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWMediaPlayerPlaybackContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWMediaPlayerPlaylistContext)playlistContext;
- (FLOWSchemaFLOWMediaPlayerRadioStationContext)radioStationContext;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)contentSource;
- (int)endpoint;
- (int)executionSource;
- (unint64_t)hash;
- (unint64_t)whichContenttype;
- (void)deleteContentSource;
- (void)deleteEndpoint;
- (void)deleteExecutionSource;
- (void)deleteLinkId;
- (void)deletePlaylistContext;
- (void)deleteRadioStationContext;
- (void)setContentSource:(int)a3;
- (void)setEndpoint:(int)a3;
- (void)setExecutionSource:(int)a3;
- (void)setHasContentSource:(BOOL)a3;
- (void)setHasEndpoint:(BOOL)a3;
- (void)setHasExecutionSource:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasPlaylistContext:(BOOL)a3;
- (void)setHasRadioStationContext:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setPlaylistContext:(id)a3;
- (void)setRadioStationContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWMediaPlayerPlaybackContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FLOWSchemaFLOWMediaPlayerPlaybackContext;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self deleteLinkId];
  }
  v9 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self radioStationContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self deleteRadioStationContext];
  }
  v12 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self playlistContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self deletePlaylistContext];
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
  objc_storeStrong((id *)&self->_playlistContext, 0);
  objc_storeStrong((id *)&self->_radioStationContext, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasPlaylistContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasPlaylistContext
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasRadioStationContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasRadioStationContext
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)contentSource
{
  return self->_contentSource;
}

- (int)endpoint
{
  return self->_endpoint;
}

- (int)executionSource
{
  return self->_executionSource;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (unint64_t)whichContenttype
{
  return self->_whichContenttype;
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FLOWSchemaFLOWMediaPlayerPlaybackContext;
  v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"executionSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setExecutionSource:](v5, "setExecutionSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"endpoint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setEndpoint:](v5, "setEndpoint:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"contentSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerPlaybackContext setContentSource:](v5, "setContentSource:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"radioStationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[FLOWSchemaFLOWMediaPlayerRadioStationContext alloc] initWithDictionary:v11];
      [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)v5 setRadioStationContext:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"playlistContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[FLOWSchemaFLOWMediaPlayerPlaylistContext alloc] initWithDictionary:v13];
      [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)v5 setPlaylistContext:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self dictionaryRepresentation];
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
    int v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self contentSource];
    v6 = @"FLOWMEDIAPLAYERCONTENTSOURCE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"FLOWMEDIAPLAYERCONTENTSOURCE_LIBRARY";
    }
    if (v5 == 2) {
      uint64_t v7 = @"FLOWMEDIAPLAYERCONTENTSOURCE_CATALOG";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"contentSource"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v8 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self endpoint] - 1;
  if (v8 > 6) {
    v9 = @"FLOWMEDIAPLAYERENDPOINT_UNKNOWN";
  }
  else {
    v9 = off_1E5EAF7E0[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"endpoint"];
  if (*(unsigned char *)&self->_has)
  {
LABEL_15:
    unsigned int v10 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self executionSource] - 1;
    if (v10 > 3) {
      int v11 = @"FLOWMEDIAPLAYERCHOSENEXECUTIONSOURCE_UNKNOWN";
    }
    else {
      int v11 = off_1E5EAF818[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"executionSource"];
  }
LABEL_19:
  if (self->_linkId)
  {
    v12 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self linkId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"linkId"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_playlistContext)
  {
    v15 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self playlistContext];
    objc_super v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"playlistContext"];
    }
    else
    {
      objc_super v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"playlistContext"];
    }
  }
  if (self->_radioStationContext)
  {
    v18 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self radioStationContext];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"radioStationContext"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"radioStationContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = 2654435761 * self->_executionSource;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_endpoint;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_contentSource;
LABEL_8:
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(FLOWSchemaFLOWMediaPlayerRadioStationContext *)self->_radioStationContext hash];
  return v7 ^ [(FLOWSchemaFLOWMediaPlayerPlaylistContext *)self->_playlistContext hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  unint64_t whichContenttype = self->_whichContenttype;
  if (whichContenttype != [v4 whichContenttype]) {
    goto LABEL_29;
  }
  uint64_t v6 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self linkId];
  unint64_t v7 = [v4 linkId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_28;
  }
  uint64_t v8 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self linkId];
  if (v8)
  {
    v9 = (void *)v8;
    unsigned int v10 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self linkId];
    int v11 = [v4 linkId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  $4C2FACFD8AC9B4E7D7283709BAE8166B has = self->_has;
  unsigned int v14 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v14 & 1)) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    int executionSource = self->_executionSource;
    if (executionSource != [v4 executionSource]) {
      goto LABEL_29;
    }
    $4C2FACFD8AC9B4E7D7283709BAE8166B has = self->_has;
    unsigned int v14 = v4[48];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_29;
  }
  if (v16)
  {
    int endpoint = self->_endpoint;
    if (endpoint != [v4 endpoint]) {
      goto LABEL_29;
    }
    $4C2FACFD8AC9B4E7D7283709BAE8166B has = self->_has;
    unsigned int v14 = v4[48];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_29;
  }
  if (v18)
  {
    int contentSource = self->_contentSource;
    if (contentSource != [v4 contentSource]) {
      goto LABEL_29;
    }
  }
  uint64_t v6 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self radioStationContext];
  unint64_t v7 = [v4 radioStationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_28;
  }
  uint64_t v20 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self radioStationContext];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self radioStationContext];
    v23 = [v4 radioStationContext];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v6 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self playlistContext];
  unint64_t v7 = [v4 playlistContext];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v25 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self playlistContext];
  if (!v25)
  {

LABEL_32:
    BOOL v30 = 1;
    goto LABEL_30;
  }
  v26 = (void *)v25;
  v27 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self playlistContext];
  v28 = [v4 playlistContext];
  char v29 = [v27 isEqual:v28];

  if (v29) {
    goto LABEL_32;
  }
LABEL_29:
  BOOL v30 = 0;
LABEL_30:

  return v30;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self linkId];

  if (v4)
  {
    uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  unint64_t v7 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self radioStationContext];

  if (v7)
  {
    uint64_t v8 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self radioStationContext];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self playlistContext];

  unsigned int v10 = v12;
  if (v9)
  {
    int v11 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self playlistContext];
    PBDataWriterWriteSubmessage();

    unsigned int v10 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerPlaybackContextReadFrom(self, (uint64_t)a3);
}

- (void)deletePlaylistContext
{
  if (self->_whichContenttype == 6)
  {
    self->_unint64_t whichContenttype = 0;
    self->_playlistContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWMediaPlayerPlaylistContext)playlistContext
{
  if (self->_whichContenttype == 6) {
    v2 = self->_playlistContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPlaylistContext:(id)a3
{
  uint64_t v4 = (FLOWSchemaFLOWMediaPlayerPlaylistContext *)a3;
  radioStationContext = self->_radioStationContext;
  self->_radioStationContext = 0;

  unint64_t v6 = 6;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichContenttype = v6;
  playlistContext = self->_playlistContext;
  self->_playlistContext = v4;
}

- (void)deleteRadioStationContext
{
  if (self->_whichContenttype == 5)
  {
    self->_unint64_t whichContenttype = 0;
    self->_radioStationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWMediaPlayerRadioStationContext)radioStationContext
{
  if (self->_whichContenttype == 5) {
    v2 = self->_radioStationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRadioStationContext:(id)a3
{
  uint64_t v4 = (FLOWSchemaFLOWMediaPlayerRadioStationContext *)a3;
  playlistContext = self->_playlistContext;
  self->_playlistContext = 0;

  unint64_t v6 = 5;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichContenttype = v6;
  radioStationContext = self->_radioStationContext;
  self->_radioStationContext = v4;
}

- (void)deleteContentSource
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasContentSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasContentSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setContentSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int contentSource = a3;
}

- (void)deleteEndpoint
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEndpoint:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndpoint
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndpoint:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int endpoint = a3;
}

- (void)deleteExecutionSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExecutionSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExecutionSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExecutionSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int executionSource = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end