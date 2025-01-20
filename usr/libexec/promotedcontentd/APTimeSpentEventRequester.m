@interface APTimeSpentEventRequester
- (APDatabaseManager)databaseManager;
- (APTimeSpentEventRequester)initWithBundleID:(id)a3 idAccount:(id)a4 contentId:(id)a5 contextId:(id)a6 adDataResponseIdentifier:(id)a7 batchId:(id)a8 impressionIdentifierData:(id)a9 timeSpent:(double)a10 databaseManager:(id)a11;
- (NSData)impressionIdentifierData;
- (NSString)adDataResponseIdentifier;
- (NSString)batchId;
- (NSString)contentId;
- (double)calculateDuration;
- (double)timeSpent;
- (id)logMetadata;
- (id)protoBuffer;
- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5;
- (void)setAdDataResponseIdentifier:(id)a3;
- (void)setBatchId:(id)a3;
- (void)setContentId:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setImpressionIdentifierData:(id)a3;
- (void)setTimeSpent:(double)a3;
@end

@implementation APTimeSpentEventRequester

- (APTimeSpentEventRequester)initWithBundleID:(id)a3 idAccount:(id)a4 contentId:(id)a5 contextId:(id)a6 adDataResponseIdentifier:(id)a7 batchId:(id)a8 impressionIdentifierData:(id)a9 timeSpent:(double)a10 databaseManager:(id)a11
{
  v18 = (__CFString *)a3;
  id obj = a5;
  id v19 = a5;
  id v29 = a7;
  id v28 = a8;
  id v27 = a9;
  id v26 = a11;
  if (!v18) {
    v18 = @"com.apple.ap.promotedcontentd";
  }
  id v20 = a6;
  id v21 = a4;
  v22 = +[NSUUID UUID];
  v30.receiver = self;
  v30.super_class = (Class)APTimeSpentEventRequester;
  v23 = [(APServerRequester *)&v30 initWithBundleID:v18 requestIdentifier:v22 contextIdentifier:v20 contentIdentifier:v19 idAccount:v21];

  if (v23)
  {
    *(double *)(v23 + 140) = a10;
    objc_storeStrong((id *)(v23 + 148), a8);
    objc_storeStrong((id *)(v23 + 156), a7);
    objc_storeStrong((id *)(v23 + 164), a9);
    objc_storeStrong((id *)(v23 + 180), a11);
    objc_storeStrong((id *)(v23 + 172), obj);
  }

  return (APTimeSpentEventRequester *)v23;
}

- (id)protoBuffer
{
  v3 = objc_alloc_init(APPBLogSysEventRequest);
  v4 = [(APTimeSpentEventRequester *)self logMetadata];
  [(APPBLogSysEventRequest *)v3 setMetaData:v4];

  [(APPBLogSysEventRequest *)v3 setEventType:909];

  return v3;
}

- (id)logMetadata
{
  v3 = *(void **)(&self->super._eventType + 1);
  if (!v3)
  {
    v4 = objc_alloc_init(APPBLogMetaData);
    v5 = *(void **)(&self->super._eventType + 1);
    *(void *)(&self->super._eventType + 1) = v4;

    v6 = +[APEncryptedIDProvider provider];
    v7 = [(APServerRequester *)self idAccount];
    v8 = [v6 encryptedIDsForIDAccountPrivate:v7];

    [*(id *)(&self->super._eventType + 1) setBatchId:*(void *)((char *)&self->_timeSpent + 4)];
    [*(id *)(&self->super._eventType + 1) setAdDataResponseIdentifier:*(NSString **)((char *)&self->_batchId + 4)];
    [*(id *)(&self->super._eventType + 1) setImpressionIdentifierData:*(NSString **)((char *)&self->_adDataResponseIdentifier + 4)];
    v9 = +[NSDate date];
    [v9 timeIntervalSince1970];
    [*(id *)(&self->super._eventType + 1) setTimeStamp:];

    v10 = [v8 iAdID];
    [*(id *)(&self->super._eventType + 1) setIAdID:v10];

    v11 = [v8 anonymousDemandID];
    [*(id *)(&self->super._eventType + 1) setAnonymousDemandiAdID:v11];

    v12 = [v8 contentID];
    [*(id *)(&self->super._eventType + 1) setContentiAdID:v12];

    [(APTimeSpentEventRequester *)self calculateDuration];
    [*(id *)(&self->super._eventType + 1) setDuration:(int)v13];

    v3 = *(void **)(&self->super._eventType + 1);
  }

  return v3;
}

- (double)calculateDuration
{
  [(APTimeSpentEventRequester *)self timeSpent];
  if (v2 >= 300.0 && v2 < 600.0)
  {
    double v3 = 10.0;
LABEL_6:
    double v2 = round(v2 / v3) * v3;
    return round(v2);
  }
  if (v2 >= 600.0)
  {
    double v3 = 60.0;
    goto LABEL_6;
  }
  return round(v2);
}

- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)APTimeSpentEventRequester;
  id v8 = a5;
  id v9 = a3;
  [(APLegacyMetricRequester *)&v16 responseReceived:v9 responseProtobuf:a4 error:v8];
  int64_t v10 = +[APLegacyMetricRetryManager resultForResponse:error:](APLegacyMetricRetryManager, "resultForResponse:error:", v9, v8, v16.receiver, v16.super_class);

  if (v10 == 2)
  {
    v11 = [APTimeSpentStoreDatabase alloc];
    v12 = [(APTimeSpentEventRequester *)self databaseManager];
    double v13 = [(APTimeSpentStoreDatabase *)v11 initWithDatabase:v12];

    v14 = [(APTimeSpentEventRequester *)self contentId];
    v17 = v14;
    v15 = +[NSArray arrayWithObjects:&v17 count:1];
    [(APTimeSpentStoreDatabase *)v13 removeEntriesForContentIds:v15];
  }
}

- (double)timeSpent
{
  return *(double *)((char *)&self->_logMetadata + 4);
}

- (void)setTimeSpent:(double)a3
{
  *(double *)((char *)&self->_logMetadata + 4) = a3;
}

- (NSString)batchId
{
  return *(NSString **)((char *)&self->_timeSpent + 4);
}

- (void)setBatchId:(id)a3
{
}

- (NSString)adDataResponseIdentifier
{
  return *(NSString **)((char *)&self->_batchId + 4);
}

- (void)setAdDataResponseIdentifier:(id)a3
{
}

- (NSData)impressionIdentifierData
{
  return *(NSData **)((char *)&self->_adDataResponseIdentifier + 4);
}

- (void)setImpressionIdentifierData:(id)a3
{
}

- (NSString)contentId
{
  return *(NSString **)((char *)&self->_impressionIdentifierData + 4);
}

- (void)setContentId:(id)a3
{
}

- (APDatabaseManager)databaseManager
{
  return *(APDatabaseManager **)((char *)&self->_contentId + 4);
}

- (void)setDatabaseManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_contentId + 4), 0);
  objc_storeStrong((id *)((char *)&self->_impressionIdentifierData + 4), 0);
  objc_storeStrong((id *)((char *)&self->_adDataResponseIdentifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_batchId + 4), 0);
  objc_storeStrong((id *)((char *)&self->_timeSpent + 4), 0);

  objc_storeStrong((id *)(&self->super._eventType + 1), 0);
}

@end