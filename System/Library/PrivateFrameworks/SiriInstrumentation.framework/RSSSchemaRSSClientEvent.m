@interface RSSSchemaRSSClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCompanionSyncPluginSyncObjectAcquisitionStarted;
- (BOOL)hasCompanionSyncPluginSyncRequested;
- (BOOL)hasCompanionSyncUploadStarted;
- (BOOL)hasEventMetadata;
- (BOOL)hasSyncDataDonationFailed;
- (BOOL)hasSyncDataDownloadContext;
- (BOOL)hasSyncDataUpdatedNotificationReceived;
- (BOOL)hasSyncTokenFetchRequestReceived;
- (BOOL)hasSyncTokenReceived;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RSSSchemaRSSClientEvent)initWithDictionary:(id)a3;
- (RSSSchemaRSSClientEvent)initWithJSON:(id)a3;
- (RSSSchemaRSSClientEventMetadata)eventMetadata;
- (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted)companionSyncPluginSyncObjectAcquisitionStarted;
- (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested)companionSyncPluginSyncRequested;
- (RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted)companionSyncUploadStarted;
- (RSSSchemaRSSSiriVocabSyncDataDonationFailed)syncDataDonationFailed;
- (RSSSchemaRSSSiriVocabSyncDataDownloadContext)syncDataDownloadContext;
- (RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived)syncDataUpdatedNotificationReceived;
- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)syncTokenFetchRequestReceived;
- (RSSSchemaRSSSiriVocabSyncTokenReceived)syncTokenReceived;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteCompanionSyncPluginSyncObjectAcquisitionStarted;
- (void)deleteCompanionSyncPluginSyncRequested;
- (void)deleteCompanionSyncUploadStarted;
- (void)deleteEventMetadata;
- (void)deleteSyncDataDonationFailed;
- (void)deleteSyncDataDownloadContext;
- (void)deleteSyncDataUpdatedNotificationReceived;
- (void)deleteSyncTokenFetchRequestReceived;
- (void)deleteSyncTokenReceived;
- (void)setCompanionSyncPluginSyncObjectAcquisitionStarted:(id)a3;
- (void)setCompanionSyncPluginSyncRequested:(id)a3;
- (void)setCompanionSyncUploadStarted:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasCompanionSyncPluginSyncObjectAcquisitionStarted:(BOOL)a3;
- (void)setHasCompanionSyncPluginSyncRequested:(BOOL)a3;
- (void)setHasCompanionSyncUploadStarted:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasSyncDataDonationFailed:(BOOL)a3;
- (void)setHasSyncDataDownloadContext:(BOOL)a3;
- (void)setHasSyncDataUpdatedNotificationReceived:(BOOL)a3;
- (void)setHasSyncTokenFetchRequestReceived:(BOOL)a3;
- (void)setHasSyncTokenReceived:(BOOL)a3;
- (void)setSyncDataDonationFailed:(id)a3;
- (void)setSyncDataDownloadContext:(id)a3;
- (void)setSyncDataUpdatedNotificationReceived:(id)a3;
- (void)setSyncTokenFetchRequestReceived:(id)a3;
- (void)setSyncTokenReceived:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RSSSchemaRSSClientEvent

- (id)getComponentId
{
  v2 = [(RSSSchemaRSSClientEvent *)self eventMetadata];
  v3 = [v2 rssId];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 value];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 length];

  if (v6) {
    id v4 = v3;
  }
  else {
LABEL_5:
  }
    id v4 = 0;
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 1;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)RSSSchemaRSSClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v34 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(RSSSchemaRSSClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RSSSchemaRSSClientEvent *)self deleteEventMetadata];
  }
  v9 = [(RSSSchemaRSSClientEvent *)self syncDataDownloadContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RSSSchemaRSSClientEvent *)self deleteSyncDataDownloadContext];
  }
  v12 = [(RSSSchemaRSSClientEvent *)self syncTokenReceived];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(RSSSchemaRSSClientEvent *)self deleteSyncTokenReceived];
  }
  v15 = [(RSSSchemaRSSClientEvent *)self syncTokenFetchRequestReceived];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(RSSSchemaRSSClientEvent *)self deleteSyncTokenFetchRequestReceived];
  }
  v18 = [(RSSSchemaRSSClientEvent *)self syncDataUpdatedNotificationReceived];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(RSSSchemaRSSClientEvent *)self deleteSyncDataUpdatedNotificationReceived];
  }
  v21 = [(RSSSchemaRSSClientEvent *)self syncDataDonationFailed];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(RSSSchemaRSSClientEvent *)self deleteSyncDataDonationFailed];
  }
  v24 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncRequested];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(RSSSchemaRSSClientEvent *)self deleteCompanionSyncPluginSyncRequested];
  }
  v27 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncObjectAcquisitionStarted];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(RSSSchemaRSSClientEvent *)self deleteCompanionSyncPluginSyncObjectAcquisitionStarted];
  }
  v30 = [(RSSSchemaRSSClientEvent *)self companionSyncUploadStarted];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(RSSSchemaRSSClientEvent *)self deleteCompanionSyncUploadStarted];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(RSSSchemaRSSClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 7) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABD98[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 7) {
    return 0;
  }
  else {
    return off_1E5EABDD8[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionSyncUploadStarted, 0);
  objc_storeStrong((id *)&self->_companionSyncPluginSyncObjectAcquisitionStarted, 0);
  objc_storeStrong((id *)&self->_companionSyncPluginSyncRequested, 0);
  objc_storeStrong((id *)&self->_syncDataDonationFailed, 0);
  objc_storeStrong((id *)&self->_syncDataUpdatedNotificationReceived, 0);
  objc_storeStrong((id *)&self->_syncTokenFetchRequestReceived, 0);
  objc_storeStrong((id *)&self->_syncTokenReceived, 0);
  objc_storeStrong((id *)&self->_syncDataDownloadContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasCompanionSyncUploadStarted:(BOOL)a3
{
  self->_hasCompanionSyncUploadStarted = a3;
}

- (BOOL)hasCompanionSyncUploadStarted
{
  return self->_hasCompanionSyncUploadStarted;
}

- (void)setHasCompanionSyncPluginSyncObjectAcquisitionStarted:(BOOL)a3
{
  self->_hasCompanionSyncPluginSyncObjectAcquisitionStarted = a3;
}

- (BOOL)hasCompanionSyncPluginSyncObjectAcquisitionStarted
{
  return self->_hasCompanionSyncPluginSyncObjectAcquisitionStarted;
}

- (void)setHasCompanionSyncPluginSyncRequested:(BOOL)a3
{
  self->_hasCompanionSyncPluginSyncRequested = a3;
}

- (BOOL)hasCompanionSyncPluginSyncRequested
{
  return self->_hasCompanionSyncPluginSyncRequested;
}

- (void)setHasSyncDataDonationFailed:(BOOL)a3
{
  self->_hasSyncDataDonationFailed = a3;
}

- (BOOL)hasSyncDataDonationFailed
{
  return self->_hasSyncDataDonationFailed;
}

- (void)setHasSyncDataUpdatedNotificationReceived:(BOOL)a3
{
  self->_hasSyncDataUpdatedNotificationReceived = a3;
}

- (BOOL)hasSyncDataUpdatedNotificationReceived
{
  return self->_hasSyncDataUpdatedNotificationReceived;
}

- (void)setHasSyncTokenFetchRequestReceived:(BOOL)a3
{
  self->_hasSyncTokenFetchRequestReceived = a3;
}

- (BOOL)hasSyncTokenFetchRequestReceived
{
  return self->_hasSyncTokenFetchRequestReceived;
}

- (void)setHasSyncTokenReceived:(BOOL)a3
{
  self->_hasSyncTokenReceived = a3;
}

- (BOOL)hasSyncTokenReceived
{
  return self->_hasSyncTokenReceived;
}

- (void)setHasSyncDataDownloadContext:(BOOL)a3
{
  self->_hasSyncDataDownloadContext = a3;
}

- (BOOL)hasSyncDataDownloadContext
{
  return self->_hasSyncDataDownloadContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (RSSSchemaRSSClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RSSSchemaRSSClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RSSSchemaRSSClientEvent;
  v5 = [(RSSSchemaRSSClientEvent *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[RSSSchemaRSSClientEventMetadata alloc] initWithDictionary:v6];
      [(RSSSchemaRSSClientEvent *)v5 setEventMetadata:v7];
    }
    v27 = (void *)v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"syncDataDownloadContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[RSSSchemaRSSSiriVocabSyncDataDownloadContext alloc] initWithDictionary:v8];
      [(RSSSchemaRSSClientEvent *)v5 setSyncDataDownloadContext:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"syncTokenReceived", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[RSSSchemaRSSSiriVocabSyncTokenReceived alloc] initWithDictionary:v10];
      [(RSSSchemaRSSClientEvent *)v5 setSyncTokenReceived:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"syncTokenFetchRequestReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived alloc] initWithDictionary:v12];
      [(RSSSchemaRSSClientEvent *)v5 setSyncTokenFetchRequestReceived:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"syncDataUpdatedNotificationReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived alloc] initWithDictionary:v14];
      [(RSSSchemaRSSClientEvent *)v5 setSyncDataUpdatedNotificationReceived:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"syncDataDonationFailed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[RSSSchemaRSSSiriVocabSyncDataDonationFailed alloc] initWithDictionary:v16];
      [(RSSSchemaRSSClientEvent *)v5 setSyncDataDonationFailed:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"companionSyncPluginSyncRequested"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested alloc] initWithDictionary:v18];
      [(RSSSchemaRSSClientEvent *)v5 setCompanionSyncPluginSyncRequested:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"companionSyncPluginSyncObjectAcquisitionStarted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted alloc] initWithDictionary:v20];
      [(RSSSchemaRSSClientEvent *)v5 setCompanionSyncPluginSyncObjectAcquisitionStarted:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"companionSyncUploadStarted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted alloc] initWithDictionary:v22];
      [(RSSSchemaRSSClientEvent *)v5 setCompanionSyncUploadStarted:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (RSSSchemaRSSClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RSSSchemaRSSClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RSSSchemaRSSClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_companionSyncPluginSyncObjectAcquisitionStarted)
  {
    id v4 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncObjectAcquisitionStarted];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"companionSyncPluginSyncObjectAcquisitionStarted"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"companionSyncPluginSyncObjectAcquisitionStarted"];
    }
  }
  if (self->_companionSyncPluginSyncRequested)
  {
    uint64_t v7 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncRequested];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"companionSyncPluginSyncRequested"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"companionSyncPluginSyncRequested"];
    }
  }
  if (self->_companionSyncUploadStarted)
  {
    v10 = [(RSSSchemaRSSClientEvent *)self companionSyncUploadStarted];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"companionSyncUploadStarted"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"companionSyncUploadStarted"];
    }
  }
  if (self->_eventMetadata)
  {
    v13 = [(RSSSchemaRSSClientEvent *)self eventMetadata];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_syncDataDonationFailed)
  {
    v16 = [(RSSSchemaRSSClientEvent *)self syncDataDonationFailed];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"syncDataDonationFailed"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"syncDataDonationFailed"];
    }
  }
  if (self->_syncDataDownloadContext)
  {
    v19 = [(RSSSchemaRSSClientEvent *)self syncDataDownloadContext];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"syncDataDownloadContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"syncDataDownloadContext"];
    }
  }
  if (self->_syncDataUpdatedNotificationReceived)
  {
    v22 = [(RSSSchemaRSSClientEvent *)self syncDataUpdatedNotificationReceived];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"syncDataUpdatedNotificationReceived"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"syncDataUpdatedNotificationReceived"];
    }
  }
  if (self->_syncTokenFetchRequestReceived)
  {
    v25 = [(RSSSchemaRSSClientEvent *)self syncTokenFetchRequestReceived];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"syncTokenFetchRequestReceived"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"syncTokenFetchRequestReceived"];
    }
  }
  if (self->_syncTokenReceived)
  {
    objc_super v28 = [(RSSSchemaRSSClientEvent *)self syncTokenReceived];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"syncTokenReceived"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"syncTokenReceived"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RSSSchemaRSSClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(RSSSchemaRSSSiriVocabSyncDataDownloadContext *)self->_syncDataDownloadContext hash] ^ v3;
  unint64_t v5 = [(RSSSchemaRSSSiriVocabSyncTokenReceived *)self->_syncTokenReceived hash];
  unint64_t v6 = v4 ^ v5 ^ [(RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *)self->_syncTokenFetchRequestReceived hash];
  unint64_t v7 = [(RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *)self->_syncDataUpdatedNotificationReceived hash];
  unint64_t v8 = v7 ^ [(RSSSchemaRSSSiriVocabSyncDataDonationFailed *)self->_syncDataDonationFailed hash];
  unint64_t v9 = v6 ^ v8 ^ [(RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *)self->_companionSyncPluginSyncRequested hash];
  unint64_t v10 = [(RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *)self->_companionSyncPluginSyncObjectAcquisitionStarted hash];
  return v9 ^ v10 ^ [(RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *)self->_companionSyncUploadStarted hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_48;
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v8 = [(RSSSchemaRSSClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(RSSSchemaRSSClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self syncDataDownloadContext];
  unint64_t v7 = [v4 syncDataDownloadContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v13 = [(RSSSchemaRSSClientEvent *)self syncDataDownloadContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(RSSSchemaRSSClientEvent *)self syncDataDownloadContext];
    v16 = [v4 syncDataDownloadContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self syncTokenReceived];
  unint64_t v7 = [v4 syncTokenReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v18 = [(RSSSchemaRSSClientEvent *)self syncTokenReceived];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(RSSSchemaRSSClientEvent *)self syncTokenReceived];
    v21 = [v4 syncTokenReceived];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self syncTokenFetchRequestReceived];
  unint64_t v7 = [v4 syncTokenFetchRequestReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v23 = [(RSSSchemaRSSClientEvent *)self syncTokenFetchRequestReceived];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(RSSSchemaRSSClientEvent *)self syncTokenFetchRequestReceived];
    int v26 = [v4 syncTokenFetchRequestReceived];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self syncDataUpdatedNotificationReceived];
  unint64_t v7 = [v4 syncDataUpdatedNotificationReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v28 = [(RSSSchemaRSSClientEvent *)self syncDataUpdatedNotificationReceived];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(RSSSchemaRSSClientEvent *)self syncDataUpdatedNotificationReceived];
    v31 = [v4 syncDataUpdatedNotificationReceived];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self syncDataDonationFailed];
  unint64_t v7 = [v4 syncDataDonationFailed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v33 = [(RSSSchemaRSSClientEvent *)self syncDataDonationFailed];
  if (v33)
  {
    objc_super v34 = (void *)v33;
    v35 = [(RSSSchemaRSSClientEvent *)self syncDataDonationFailed];
    v36 = [v4 syncDataDonationFailed];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncRequested];
  unint64_t v7 = [v4 companionSyncPluginSyncRequested];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v38 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncRequested];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncRequested];
    v41 = [v4 companionSyncPluginSyncRequested];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncObjectAcquisitionStarted];
  unint64_t v7 = [v4 companionSyncPluginSyncObjectAcquisitionStarted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v43 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncObjectAcquisitionStarted];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncObjectAcquisitionStarted];
    v46 = [v4 companionSyncPluginSyncObjectAcquisitionStarted];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self companionSyncUploadStarted];
  unint64_t v7 = [v4 companionSyncUploadStarted];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v48 = [(RSSSchemaRSSClientEvent *)self companionSyncUploadStarted];
    if (!v48)
    {

LABEL_51:
      BOOL v53 = 1;
      goto LABEL_49;
    }
    v49 = (void *)v48;
    v50 = [(RSSSchemaRSSClientEvent *)self companionSyncUploadStarted];
    v51 = [v4 companionSyncUploadStarted];
    char v52 = [v50 isEqual:v51];

    if (v52) {
      goto LABEL_51;
    }
  }
  else
  {
LABEL_47:
  }
LABEL_48:
  BOOL v53 = 0;
LABEL_49:

  return v53;
}

- (void)writeTo:(id)a3
{
  id v22 = a3;
  id v4 = [(RSSSchemaRSSClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(RSSSchemaRSSClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(RSSSchemaRSSClientEvent *)self syncDataDownloadContext];

  if (v6)
  {
    unint64_t v7 = [(RSSSchemaRSSClientEvent *)self syncDataDownloadContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(RSSSchemaRSSClientEvent *)self syncTokenReceived];

  if (v8)
  {
    unint64_t v9 = [(RSSSchemaRSSClientEvent *)self syncTokenReceived];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(RSSSchemaRSSClientEvent *)self syncTokenFetchRequestReceived];

  if (v10)
  {
    int v11 = [(RSSSchemaRSSClientEvent *)self syncTokenFetchRequestReceived];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(RSSSchemaRSSClientEvent *)self syncDataUpdatedNotificationReceived];

  if (v12)
  {
    uint64_t v13 = [(RSSSchemaRSSClientEvent *)self syncDataUpdatedNotificationReceived];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(RSSSchemaRSSClientEvent *)self syncDataDonationFailed];

  if (v14)
  {
    v15 = [(RSSSchemaRSSClientEvent *)self syncDataDonationFailed];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncRequested];

  if (v16)
  {
    int v17 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncRequested];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncObjectAcquisitionStarted];

  if (v18)
  {
    v19 = [(RSSSchemaRSSClientEvent *)self companionSyncPluginSyncObjectAcquisitionStarted];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(RSSSchemaRSSClientEvent *)self companionSyncUploadStarted];

  if (v20)
  {
    v21 = [(RSSSchemaRSSClientEvent *)self companionSyncUploadStarted];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RSSSchemaRSSClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteCompanionSyncUploadStarted
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_companionSyncUploadStarted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted)companionSyncUploadStarted
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_companionSyncUploadStarted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCompanionSyncUploadStarted:(id)a3
{
  id v4 = (RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  unint64_t v12 = 108;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = v4;
}

- (void)deleteCompanionSyncPluginSyncObjectAcquisitionStarted
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted)companionSyncPluginSyncObjectAcquisitionStarted
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCompanionSyncPluginSyncObjectAcquisitionStarted:(id)a3
{
  id v4 = (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  unint64_t v12 = 107;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = v4;
}

- (void)deleteCompanionSyncPluginSyncRequested
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_companionSyncPluginSyncRequested = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested)companionSyncPluginSyncRequested
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_companionSyncPluginSyncRequested;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCompanionSyncPluginSyncRequested:(id)a3
{
  id v4 = (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  unint64_t v12 = 106;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = v4;
}

- (void)deleteSyncDataDonationFailed
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_syncDataDonationFailed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RSSSchemaRSSSiriVocabSyncDataDonationFailed)syncDataDonationFailed
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_syncDataDonationFailed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSyncDataDonationFailed:(id)a3
{
  id v4 = (RSSSchemaRSSSiriVocabSyncDataDonationFailed *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  unint64_t v12 = 105;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = v4;
}

- (void)deleteSyncDataUpdatedNotificationReceived
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_syncDataUpdatedNotificationReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived)syncDataUpdatedNotificationReceived
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_syncDataUpdatedNotificationReceived;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSyncDataUpdatedNotificationReceived:(id)a3
{
  id v4 = (RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  unint64_t v12 = 104;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = v4;
}

- (void)deleteSyncTokenFetchRequestReceived
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_syncTokenFetchRequestReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)syncTokenFetchRequestReceived
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_syncTokenFetchRequestReceived;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSyncTokenFetchRequestReceived:(id)a3
{
  id v4 = (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  unint64_t v12 = 103;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = v4;
}

- (void)deleteSyncTokenReceived
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_syncTokenReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RSSSchemaRSSSiriVocabSyncTokenReceived)syncTokenReceived
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_syncTokenReceived;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSyncTokenReceived:(id)a3
{
  id v4 = (RSSSchemaRSSSiriVocabSyncTokenReceived *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  unint64_t v12 = 102;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = v4;
}

- (void)deleteSyncDataDownloadContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_syncDataDownloadContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RSSSchemaRSSSiriVocabSyncDataDownloadContext)syncDataDownloadContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_syncDataDownloadContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSyncDataDownloadContext:(id)a3
{
  id v4 = (RSSSchemaRSSSiriVocabSyncDataDownloadContext *)a3;
  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  unint64_t v12 = 101;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(RSSSchemaRSSClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 7) {
    return @"com.apple.aiml.siri.rss.RSSClientEvent";
  }
  else {
    return off_1E5EB4A70[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 50;
}

@end