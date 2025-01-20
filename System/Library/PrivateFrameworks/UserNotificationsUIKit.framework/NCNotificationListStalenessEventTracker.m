@interface NCNotificationListStalenessEventTracker
+ (NCNotificationListStalenessEventTracker)eventTrackerWithAutomaticCollation;
+ (id)_allMetricsSafeBundleIdentifiers;
+ (id)_metricsSafeBundleIdentifierByBundleIdentifier;
+ (id)_metricsSafeBundleIdentifierForBundleIdentifier:(id)a3;
- (NCNotificationListSection)notificationList;
- (NCNotificationListStalenessEventTracker)init;
- (NCNotificationStructuredSectionList)structuredSectionList;
- (void)_handleListPresentedEvent;
- (void)_queue_collateAndRecordMetrics;
- (void)_queue_processRequests:(id)a3 timestamp:(id)a4;
- (void)_startAutocollation;
- (void)_stopAutocollation;
- (void)collateAndRecordMetrics;
- (void)dealloc;
- (void)handleEvent:(unint64_t)a3;
- (void)setNotificationList:(id)a3;
- (void)setStructuredSectionList:(id)a3;
@end

@implementation NCNotificationListStalenessEventTracker

+ (NCNotificationListStalenessEventTracker)eventTrackerWithAutomaticCollation
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 _startAutocollation];

  return (NCNotificationListStalenessEventTracker *)v2;
}

- (NCNotificationListStalenessEventTracker)init
{
  v23[10] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationListStalenessEventTracker;
  id v2 = [(NCNotificationListStalenessEventTracker *)&v20 init];
  if (v2)
  {
    v3 = NCGetEventTrackerQueue();
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.UserNotificationsUIKit.NotificationListStalenessMetric", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastDisplayedDateByNotificationMetadata = v2->_lastDisplayedDateByNotificationMetadata;
    v2->_lastDisplayedDateByNotificationMetadata = v6;

    v8 = (void *)MEMORY[0x1E4F93720];
    v9 = [(id)objc_opt_class() _allMetricsSafeBundleIdentifiers];
    v10 = [v8 propertyWithName:@"bundleIdentifier" possibleValues:v9 autoSanitizeValues:0];

    v11 = (void *)MEMORY[0x1E4F93720];
    v22[0] = &unk_1F2F842B0;
    v22[1] = &unk_1F2F842C8;
    v23[0] = @"InsideMinute";
    v23[1] = @"InsideFiveMinutes";
    v22[2] = &unk_1F2F842E0;
    v22[3] = &unk_1F2F842F8;
    v23[2] = @"InsideTwentyMinutes";
    v23[3] = @"InsideHour";
    v22[4] = &unk_1F2F84310;
    v22[5] = &unk_1F2F84328;
    v23[4] = @"InsideTwoHours";
    v23[5] = @"InsideSixHours";
    v22[6] = &unk_1F2F84340;
    v22[7] = &unk_1F2F84358;
    v23[6] = @"InsideDay";
    v23[7] = @"InsideTwoDays";
    v22[8] = &unk_1F2F84370;
    v22[9] = &unk_1F2F84388;
    v23[8] = @"InsideWeek";
    v23[9] = @"OutsideWeek";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:10];
    v13 = [v11 propertyWithName:@"timeInterval" enumMapping:v12];

    v14 = [MEMORY[0x1E4F93720] propertyWithName:@"pairedDeviceCount" rangeMin:0 rangeMax:99];
    id v15 = objc_alloc(MEMORY[0x1E4F93738]);
    v21[0] = v10;
    v21[1] = v13;
    v21[2] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    uint64_t v17 = [v15 initWithFeatureId:@"NotificationsUI" event:@"lockscreenStaleness" registerProperties:v16];
    stalenessEventTracker = v2->_stalenessEventTracker;
    v2->_stalenessEventTracker = (PETScalarEventTracker *)v17;
  }
  return v2;
}

- (void)dealloc
{
  [(NCNotificationListStalenessEventTracker *)self _stopAutocollation];
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListStalenessEventTracker;
  [(NCNotificationListStalenessEventTracker *)&v3 dealloc];
}

- (void)_startAutocollation
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleSignificantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopAutocollation
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
}

- (void)handleEvent:(unint64_t)a3
{
  if (!a3) {
    [(NCNotificationListStalenessEventTracker *)self _handleListPresentedEvent];
  }
}

- (void)_handleListPresentedEvent
{
  objc_super v3 = [MEMORY[0x1E4F1C9C8] date];
  dispatch_queue_t v4 = [(NCNotificationListStalenessEventTracker *)self structuredSectionList];
  v5 = [v4 allNotificationRequests];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NCNotificationListStalenessEventTracker__handleListPresentedEvent__block_invoke;
  block[3] = &unk_1E6A93A88;
  block[4] = self;
  id v10 = v5;
  id v11 = v3;
  id v7 = v3;
  id v8 = v5;
  dispatch_async(queue, block);
}

uint64_t __68__NCNotificationListStalenessEventTracker__handleListPresentedEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processRequests:timestamp:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_processRequests:(id)a3 timestamp:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = +[NCEventTrackerNotificationMetadata metadataForNotificationRequest:](NCEventTrackerNotificationMetadata, "metadataForNotificationRequest:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [(NSMutableDictionary *)self->_lastDisplayedDateByNotificationMetadata setObject:v7 forKey:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)collateAndRecordMetrics
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NCNotificationListStalenessEventTracker_collateAndRecordMetrics__block_invoke;
  block[3] = &unk_1E6A91BB0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __66__NCNotificationListStalenessEventTracker_collateAndRecordMetrics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_collateAndRecordMetrics");
}

- (void)_queue_collateAndRecordMetrics
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableDictionary *)self->_lastDisplayedDateByNotificationMetadata count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = self->_lastDisplayedDateByNotificationMetadata;
    uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v39 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v50 != v39) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v8 = [(NSMutableDictionary *)self->_lastDisplayedDateByNotificationMetadata objectForKey:v7];
          uint64_t v9 = [v7 date];
          [v8 timeIntervalSinceDate:v9];
          double v11 = v10;

          uint64_t v12 = NCTimeIntervalBinForTimeInterval(v11);
          v13 = objc_opt_class();
          long long v14 = [v7 bundleIdentifier];
          long long v15 = [v13 _metricsSafeBundleIdentifierForBundleIdentifier:v14];

          id v16 = [v3 objectForKey:v15];
          if (!v16)
          {
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v3 setObject:v16 forKey:v15];
          }
          long long v17 = [NSNumber numberWithUnsignedInteger:v12];
          v18 = [v16 objectForKey:v17];
          uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") + 1);

          [v16 setObject:v19 forKey:v17];
        }
        uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v5);
    }
    objc_super v20 = self;

    unint64_t v21 = BBEventTrackingSyncDeviceCount();
    if (v21 >= 0x63) {
      uint64_t v22 = 99;
    }
    else {
      uint64_t v22 = v21;
    }
    v23 = [NSNumber numberWithUnsignedInteger:v22];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obja = v3;
    uint64_t v36 = [obja countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v46;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(obja);
          }
          uint64_t v40 = v24;
          uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * v24);
          v26 = objc_msgSend(obja, "objectForKey:", v25, v35);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v54 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v42 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * j);
                v32 = [v26 objectForKey:v31];
                stalenessEventTracker = v20->_stalenessEventTracker;
                v53[0] = v25;
                v53[1] = v31;
                v53[2] = v23;
                v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
                -[PETScalarEventTracker trackEventWithPropertyValues:value:](stalenessEventTracker, "trackEventWithPropertyValues:value:", v34, [v32 unsignedIntegerValue]);
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v54 count:16];
            }
            while (v28);
          }

          uint64_t v24 = v40 + 1;
        }
        while (v40 + 1 != v36);
        uint64_t v36 = [obja countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v36);
    }

    [(NSMutableDictionary *)v20->_lastDisplayedDateByNotificationMetadata removeAllObjects];
  }
}

+ (id)_metricsSafeBundleIdentifierByBundleIdentifier
{
  if (_metricsSafeBundleIdentifierByBundleIdentifier_onceToken != -1) {
    dispatch_once(&_metricsSafeBundleIdentifierByBundleIdentifier_onceToken, &__block_literal_global_18);
  }
  id v2 = (void *)_metricsSafeBundleIdentifierByBundleIdentifier_allowedList;

  return v2;
}

void __89__NCNotificationListStalenessEventTracker__metricsSafeBundleIdentifierByBundleIdentifier__block_invoke()
{
  v0 = (void *)_metricsSafeBundleIdentifierByBundleIdentifier_allowedList;
  _metricsSafeBundleIdentifierByBundleIdentifier_allowedList = (uint64_t)&unk_1F2F846D0;
}

+ (id)_allMetricsSafeBundleIdentifiers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = [a1 _metricsSafeBundleIdentifierByBundleIdentifier];
  id v3 = [v2 allValues];

  v7[0] = @"1stParty";
  v7[1] = @"3rdParty";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

+ (id)_metricsSafeBundleIdentifierForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "un_isFirstPartyIdentifier"))
  {
    uint64_t v5 = [a1 _metricsSafeBundleIdentifierByBundleIdentifier];
    uint64_t v6 = [v5 objectForKey:v4];
    id v7 = (void *)v6;
    id v8 = @"1stParty";
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = @"3rdParty";
  }

  return v9;
}

- (NCNotificationListSection)notificationList
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationList);

  return (NCNotificationListSection *)WeakRetained;
}

- (void)setNotificationList:(id)a3
{
}

- (NCNotificationStructuredSectionList)structuredSectionList
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_structuredSectionList);

  return (NCNotificationStructuredSectionList *)WeakRetained;
}

- (void)setStructuredSectionList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_structuredSectionList);
  objc_destroyWeak((id *)&self->_notificationList);
  objc_storeStrong((id *)&self->_stalenessEventTracker, 0);
  objc_storeStrong((id *)&self->_lastDisplayedDateByNotificationMetadata, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end