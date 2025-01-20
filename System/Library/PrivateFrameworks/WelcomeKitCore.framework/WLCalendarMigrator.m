@interface WLCalendarMigrator
+ (id)contentType;
- (BOOL)accountBased;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (WLCalendarMigrator)init;
- (WLFeaturePayload)featurePayload;
- (id)contentType;
- (id)dataType;
- (id)importWillBegin;
- (void)_importDataRecord:(id)a3 summary:(id)a4;
- (void)addWorkingTime:(unint64_t)a3;
- (void)enable;
- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4;
- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6;
- (void)setEstimatedDataSize:(unint64_t)a3;
- (void)setFeaturePayload:(id)a3;
- (void)setState:(id)a3;
@end

@implementation WLCalendarMigrator

- (WLCalendarMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLCalendarMigrator;
  v2 = [(WLCalendarMigrator *)&v6 init];
  if (v2)
  {
    v3 = (EKEventStore *)objc_alloc_init(MEMORY[0x263F04B98]);
    eventStore = v2->_eventStore;
    v2->_eventStore = v3;
  }
  return v2;
}

- (void)enable
{
  p_featurePayload = &self->_featurePayload;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setEnabled:1];

  id v4 = objc_loadWeakRetained((id *)p_featurePayload);
  [v4 setState:@"enabled"];
}

- (void)setState:(id)a3
{
  p_featurePayload = &self->_featurePayload;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  [WeakRetained setState:v4];
}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:a3];
}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);
}

+ (id)contentType
{
  return @"calendar";
}

- (id)contentType
{
  return +[WLCalendarMigrator contentType];
}

- (id)dataType
{
  return +[WLCalendarMigrator contentType];
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4 = a3;
  if (![v4 itemSize]) {
    [v4 setItemSize:256];
  }
}

- (id)importWillBegin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:0];

  return 0;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  id v14 = a6;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

  id v12 = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(v12, "setSize:", objc_msgSend(v12, "size") + objc_msgSend(v10, "length"));

  [(WLCalendarMigrator *)self _importDataRecord:v10 summary:v9];
  v13 = v14;
  if (v14)
  {
    (*((void (**)(id, uint64_t, void))v14 + 2))(v14, 1, 0);
    v13 = v14;
  }
}

- (void)_importDataRecord:(id)a3 summary:(id)a4
{
  eventStore = self->_eventStore;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(EKEventStore *)eventStore defaultCalendarForNewEvents];
  id v9 = [(EKEventStore *)self->_eventStore importICSData:v8 intoCalendar:v10 options:0];

  [(EKEventStore *)self->_eventStore reset];
  _WLLog();
}

- (WLFeaturePayload)featurePayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  return (WLFeaturePayload *)WeakRetained;
}

- (void)setFeaturePayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end