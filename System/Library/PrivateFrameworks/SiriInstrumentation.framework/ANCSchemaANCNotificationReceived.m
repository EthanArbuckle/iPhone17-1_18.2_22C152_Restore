@interface ANCSchemaANCNotificationReceived
- (ANCSchemaANCAppNotificationMetadata)notificationMetadata;
- (ANCSchemaANCAudioDevice)connectedAudioDevice;
- (ANCSchemaANCBackgroundContent)backgroundContent;
- (ANCSchemaANCNotificationReceived)initWithDictionary:(id)a3;
- (ANCSchemaANCNotificationReceived)initWithJSON:(id)a3;
- (BOOL)hasAnnouncementCategory;
- (BOOL)hasAppCategory;
- (BOOL)hasBackgroundContent;
- (BOOL)hasBobbleEnabled;
- (BOOL)hasBobbleSupported;
- (BOOL)hasConnectedAudioDevice;
- (BOOL)hasIsTimeSensitiveAnnouncement;
- (BOOL)hasLinkId;
- (BOOL)hasNotificationMetadata;
- (BOOL)hasTargetPlatform;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTimeSensitiveAnnouncement;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)announcementCategory;
- (int)appCategory;
- (int)bobbleEnabled;
- (int)bobbleSupported;
- (int)targetPlatform;
- (unint64_t)hash;
- (void)deleteAnnouncementCategory;
- (void)deleteAppCategory;
- (void)deleteBackgroundContent;
- (void)deleteBobbleEnabled;
- (void)deleteBobbleSupported;
- (void)deleteConnectedAudioDevice;
- (void)deleteIsTimeSensitiveAnnouncement;
- (void)deleteLinkId;
- (void)deleteNotificationMetadata;
- (void)deleteTargetPlatform;
- (void)setAnnouncementCategory:(int)a3;
- (void)setAppCategory:(int)a3;
- (void)setBackgroundContent:(id)a3;
- (void)setBobbleEnabled:(int)a3;
- (void)setBobbleSupported:(int)a3;
- (void)setConnectedAudioDevice:(id)a3;
- (void)setHasAnnouncementCategory:(BOOL)a3;
- (void)setHasAppCategory:(BOOL)a3;
- (void)setHasBackgroundContent:(BOOL)a3;
- (void)setHasBobbleEnabled:(BOOL)a3;
- (void)setHasBobbleSupported:(BOOL)a3;
- (void)setHasConnectedAudioDevice:(BOOL)a3;
- (void)setHasIsTimeSensitiveAnnouncement:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasNotificationMetadata:(BOOL)a3;
- (void)setHasTargetPlatform:(BOOL)a3;
- (void)setIsTimeSensitiveAnnouncement:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setNotificationMetadata:(id)a3;
- (void)setTargetPlatform:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ANCSchemaANCNotificationReceived

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ANCSchemaANCNotificationReceived;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(ANCSchemaANCNotificationReceived *)self connectedAudioDevice];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ANCSchemaANCNotificationReceived *)self deleteConnectedAudioDevice];
  }
  v9 = [(ANCSchemaANCNotificationReceived *)self linkId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ANCSchemaANCNotificationReceived *)self deleteLinkId];
  }
  v12 = [(ANCSchemaANCNotificationReceived *)self backgroundContent];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ANCSchemaANCNotificationReceived *)self deleteBackgroundContent];
  }
  v15 = [(ANCSchemaANCNotificationReceived *)self notificationMetadata];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ANCSchemaANCNotificationReceived *)self deleteNotificationMetadata];
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
  objc_storeStrong((id *)&self->_notificationMetadata, 0);
  objc_storeStrong((id *)&self->_backgroundContent, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_connectedAudioDevice, 0);
}

- (void)setHasNotificationMetadata:(BOOL)a3
{
  self->_hasConnectedAudioDevice = a3;
}

- (void)setHasBackgroundContent:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasConnectedAudioDevice:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)bobbleSupported
{
  return self->_bobbleSupported;
}

- (int)bobbleEnabled
{
  return self->_bobbleEnabled;
}

- (void)setNotificationMetadata:(id)a3
{
}

- (ANCSchemaANCAppNotificationMetadata)notificationMetadata
{
  return self->_notificationMetadata;
}

- (void)setBackgroundContent:(id)a3
{
}

- (ANCSchemaANCBackgroundContent)backgroundContent
{
  return self->_backgroundContent;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (int)appCategory
{
  return self->_appCategory;
}

- (BOOL)isTimeSensitiveAnnouncement
{
  return self->_isTimeSensitiveAnnouncement;
}

- (void)setConnectedAudioDevice:(id)a3
{
}

- (ANCSchemaANCAudioDevice)connectedAudioDevice
{
  return self->_connectedAudioDevice;
}

- (int)targetPlatform
{
  return self->_targetPlatform;
}

- (int)announcementCategory
{
  return self->_announcementCategory;
}

- (ANCSchemaANCNotificationReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ANCSchemaANCNotificationReceived;
  v5 = [(ANCSchemaANCNotificationReceived *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"announcementCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCNotificationReceived setAnnouncementCategory:](v5, "setAnnouncementCategory:", [v6 intValue]);
    }
    v23 = v6;
    v7 = [v4 objectForKeyedSubscript:@"targetPlatform"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCNotificationReceived setTargetPlatform:](v5, "setTargetPlatform:", [v7 intValue]);
    }
    int v8 = objc_msgSend(v4, "objectForKeyedSubscript:", @"connectedAudioDevice", v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ANCSchemaANCAudioDevice alloc] initWithDictionary:v8];
      [(ANCSchemaANCNotificationReceived *)v5 setConnectedAudioDevice:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isTimeSensitiveAnnouncement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCNotificationReceived setIsTimeSensitiveAnnouncement:](v5, "setIsTimeSensitiveAnnouncement:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"appCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCNotificationReceived setAppCategory:](v5, "setAppCategory:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(ANCSchemaANCNotificationReceived *)v5 setLinkId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"backgroundContent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[ANCSchemaANCBackgroundContent alloc] initWithDictionary:v14];
      [(ANCSchemaANCNotificationReceived *)v5 setBackgroundContent:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"notificationMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[ANCSchemaANCAppNotificationMetadata alloc] initWithDictionary:v16];
      [(ANCSchemaANCNotificationReceived *)v5 setNotificationMetadata:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"bobbleEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCNotificationReceived setBobbleEnabled:](v5, "setBobbleEnabled:", [v18 intValue]);
    }
    objc_super v19 = [v4 objectForKeyedSubscript:@"bobbleSupported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCNotificationReceived setBobbleSupported:](v5, "setBobbleSupported:", [v19 intValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (ANCSchemaANCNotificationReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ANCSchemaANCNotificationReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ANCSchemaANCNotificationReceived *)self dictionaryRepresentation];
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
    unsigned int v5 = [(ANCSchemaANCNotificationReceived *)self announcementCategory] - 1;
    if (v5 > 6) {
      v6 = @"ANCCATEGORY_UNKNOWN";
    }
    else {
      v6 = off_1E5EAC288[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"announcementCategory"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    int v7 = [(ANCSchemaANCNotificationReceived *)self appCategory];
    int v8 = @"ANCAPPCATEGORY_UNKNOWN";
    if (v7 == 1) {
      int v8 = @"ANCAPPCATEGORY_FIRST_PARTY";
    }
    if (v7 == 2) {
      v9 = @"ANCAPPCATEGORY_THIRD_PARTY";
    }
    else {
      v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"appCategory"];
  }
  if (self->_backgroundContent)
  {
    v10 = [(ANCSchemaANCNotificationReceived *)self backgroundContent];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"backgroundContent"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"backgroundContent"];
    }
  }
  char v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    int v14 = [(ANCSchemaANCNotificationReceived *)self bobbleEnabled];
    v15 = @"ANCFEATUREENABLEMENTSTATUS_UNKNOWN";
    if (v14 == 1) {
      v15 = @"ANCFEATUREENABLEMENTSTATUS_ENABLED";
    }
    if (v14 == 2) {
      v16 = @"ANCFEATUREENABLEMENTSTATUS_DISABLED";
    }
    else {
      v16 = v15;
    }
    [v3 setObject:v16 forKeyedSubscript:@"bobbleEnabled"];
    char v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
  {
    int v17 = [(ANCSchemaANCNotificationReceived *)self bobbleSupported];
    v18 = @"ANCFEATURESUPPORTSTATUS_UNKNOWN";
    if (v17 == 1) {
      v18 = @"ANCFEATURESUPPORTSTATUS_SUPPORTED";
    }
    if (v17 == 2) {
      objc_super v19 = @"ANCFEATURESUPPORTSTATUS_UNSUPPORTED";
    }
    else {
      objc_super v19 = v18;
    }
    [v3 setObject:v19 forKeyedSubscript:@"bobbleSupported"];
  }
  if (self->_connectedAudioDevice)
  {
    v20 = [(ANCSchemaANCNotificationReceived *)self connectedAudioDevice];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"connectedAudioDevice"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"connectedAudioDevice"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[ANCSchemaANCNotificationReceived isTimeSensitiveAnnouncement](self, "isTimeSensitiveAnnouncement"));
    [v3 setObject:v23 forKeyedSubscript:@"isTimeSensitiveAnnouncement"];
  }
  if (self->_linkId)
  {
    objc_super v24 = [(ANCSchemaANCNotificationReceived *)self linkId];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_notificationMetadata)
  {
    v27 = [(ANCSchemaANCNotificationReceived *)self notificationMetadata];
    v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"notificationMetadata"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"notificationMetadata"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v30 = [(ANCSchemaANCNotificationReceived *)self targetPlatform] - 1;
    if (v30 > 3) {
      v31 = @"ANCTARGETPLATFORM_UNKNOWN";
    }
    else {
      v31 = off_1E5EAC2C0[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"targetPlatform"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_announcementCategory;
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
      uint64_t v4 = 2654435761 * self->_targetPlatform;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(ANCSchemaANCAudioDevice *)self->_connectedAudioDevice hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isTimeSensitiveAnnouncement;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_appCategory;
      goto LABEL_11;
    }
  }
  uint64_t v7 = 0;
LABEL_11:
  unint64_t v8 = [(SISchemaUUID *)self->_linkId hash];
  unint64_t v9 = [(ANCSchemaANCBackgroundContent *)self->_backgroundContent hash];
  unint64_t v10 = [(ANCSchemaANCAppNotificationMetadata *)self->_notificationMetadata hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v11 = 2654435761 * self->_bobbleEnabled;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_bobbleSupported;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  $6570D294FEFED79133EDD7D328F2C8CF has = self->_has;
  unsigned int v6 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&has)
  {
    int announcementCategory = self->_announcementCategory;
    if (announcementCategory != [v4 announcementCategory]) {
      goto LABEL_36;
    }
    $6570D294FEFED79133EDD7D328F2C8CF has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_36;
  }
  if (v8)
  {
    int targetPlatform = self->_targetPlatform;
    if (targetPlatform != [v4 targetPlatform]) {
      goto LABEL_36;
    }
  }
  unint64_t v10 = [(ANCSchemaANCNotificationReceived *)self connectedAudioDevice];
  uint64_t v11 = [v4 connectedAudioDevice];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_35;
  }
  uint64_t v12 = [(ANCSchemaANCNotificationReceived *)self connectedAudioDevice];
  if (v12)
  {
    char v13 = (void *)v12;
    int v14 = [(ANCSchemaANCNotificationReceived *)self connectedAudioDevice];
    v15 = [v4 connectedAudioDevice];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  $6570D294FEFED79133EDD7D328F2C8CF v17 = self->_has;
  int v18 = (*(unsigned int *)&v17 >> 2) & 1;
  unsigned int v19 = v4[64];
  if (v18 != ((v19 >> 2) & 1)) {
    goto LABEL_36;
  }
  if (v18)
  {
    int isTimeSensitiveAnnouncement = self->_isTimeSensitiveAnnouncement;
    if (isTimeSensitiveAnnouncement != [v4 isTimeSensitiveAnnouncement]) {
      goto LABEL_36;
    }
    $6570D294FEFED79133EDD7D328F2C8CF v17 = self->_has;
    unsigned int v19 = v4[64];
  }
  int v21 = (*(unsigned int *)&v17 >> 3) & 1;
  if (v21 != ((v19 >> 3) & 1)) {
    goto LABEL_36;
  }
  if (v21)
  {
    int appCategory = self->_appCategory;
    if (appCategory != [v4 appCategory]) {
      goto LABEL_36;
    }
  }
  unint64_t v10 = [(ANCSchemaANCNotificationReceived *)self linkId];
  uint64_t v11 = [v4 linkId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_35;
  }
  uint64_t v23 = [(ANCSchemaANCNotificationReceived *)self linkId];
  if (v23)
  {
    objc_super v24 = (void *)v23;
    v25 = [(ANCSchemaANCNotificationReceived *)self linkId];
    v26 = [v4 linkId];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ANCSchemaANCNotificationReceived *)self backgroundContent];
  uint64_t v11 = [v4 backgroundContent];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_35;
  }
  uint64_t v28 = [(ANCSchemaANCNotificationReceived *)self backgroundContent];
  if (v28)
  {
    v29 = (void *)v28;
    unsigned int v30 = [(ANCSchemaANCNotificationReceived *)self backgroundContent];
    v31 = [v4 backgroundContent];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ANCSchemaANCNotificationReceived *)self notificationMetadata];
  uint64_t v11 = [v4 notificationMetadata];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v33 = [(ANCSchemaANCNotificationReceived *)self notificationMetadata];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(ANCSchemaANCNotificationReceived *)self notificationMetadata];
    v36 = [v4 notificationMetadata];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  $6570D294FEFED79133EDD7D328F2C8CF v40 = self->_has;
  int v41 = (*(unsigned int *)&v40 >> 4) & 1;
  unsigned int v42 = v4[64];
  if (v41 == ((v42 >> 4) & 1))
  {
    if (v41)
    {
      int bobbleEnabled = self->_bobbleEnabled;
      if (bobbleEnabled != [v4 bobbleEnabled]) {
        goto LABEL_36;
      }
      $6570D294FEFED79133EDD7D328F2C8CF v40 = self->_has;
      unsigned int v42 = v4[64];
    }
    int v44 = (*(unsigned int *)&v40 >> 5) & 1;
    if (v44 == ((v42 >> 5) & 1))
    {
      if (!v44
        || (int bobbleSupported = self->_bobbleSupported,
            bobbleSupported == [v4 bobbleSupported]))
      {
        BOOL v38 = 1;
        goto LABEL_37;
      }
    }
  }
LABEL_36:
  BOOL v38 = 0;
LABEL_37:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v5 = [(ANCSchemaANCNotificationReceived *)self connectedAudioDevice];

  if (v5)
  {
    unsigned int v6 = [(ANCSchemaANCNotificationReceived *)self connectedAudioDevice];
    PBDataWriterWriteSubmessage();
  }
  char v7 = (char)self->_has;
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v7 = (char)self->_has;
  }
  if ((v7 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v8 = [(ANCSchemaANCNotificationReceived *)self linkId];

  if (v8)
  {
    unint64_t v9 = [(ANCSchemaANCNotificationReceived *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(ANCSchemaANCNotificationReceived *)self backgroundContent];

  if (v10)
  {
    uint64_t v11 = [(ANCSchemaANCNotificationReceived *)self backgroundContent];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(ANCSchemaANCNotificationReceived *)self notificationMetadata];

  if (v12)
  {
    char v13 = [(ANCSchemaANCNotificationReceived *)self notificationMetadata];
    PBDataWriterWriteSubmessage();
  }
  char v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v14 = (char)self->_has;
  }
  if ((v14 & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCNotificationReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteBobbleSupported
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasBobbleSupported:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasBobbleSupported
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBobbleSupported:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int bobbleSupported = a3;
}

- (void)deleteBobbleEnabled
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasBobbleEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBobbleEnabled
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBobbleEnabled:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int bobbleEnabled = a3;
}

- (void)deleteNotificationMetadata
{
}

- (BOOL)hasNotificationMetadata
{
  return self->_notificationMetadata != 0;
}

- (void)deleteBackgroundContent
{
}

- (BOOL)hasBackgroundContent
{
  return self->_backgroundContent != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteAppCategory
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAppCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppCategory
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int appCategory = a3;
}

- (void)deleteIsTimeSensitiveAnnouncement
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsTimeSensitiveAnnouncement:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsTimeSensitiveAnnouncement
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsTimeSensitiveAnnouncement:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isTimeSensitiveAnnouncement = a3;
}

- (void)deleteConnectedAudioDevice
{
}

- (BOOL)hasConnectedAudioDevice
{
  return self->_connectedAudioDevice != 0;
}

- (void)deleteTargetPlatform
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTargetPlatform:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTargetPlatform
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTargetPlatform:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int targetPlatform = a3;
}

- (void)deleteAnnouncementCategory
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAnnouncementCategory:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnnouncementCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAnnouncementCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int announcementCategory = a3;
}

@end