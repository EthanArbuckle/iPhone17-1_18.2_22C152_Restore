@interface PPConnectionsMetricsTracker
+ (PPConnectionsMetricsTracker)sharedInstance;
+ (id)consumerStringForConsumerType:(unint64_t)a3;
+ (id)donationSourceFromBundleID:(id)a3;
+ (id)triggerFromCriteria:(id)a3;
- (PETDistributionEventTracker)timingTracker;
- (PETGoalConversionEventTracker)conversionTracker;
- (PETScalarEventTracker)dismissalTracker;
- (PETScalarEventTracker)donationTracker;
- (PETScalarEventTracker)opportunityTracker;
- (PETScalarEventTracker)pasteboardTracker;
- (PPConnectionsMetricsTracker)init;
- (__CFString)privacyFriendlyBundleIdentifierWith:(__CFString *)a1;
- (void)setConversionTracker:(id)a3;
- (void)setDismissalTracker:(id)a3;
- (void)setDonationTracker:(id)a3;
- (void)setOpportunityTracker:(id)a3;
- (void)setPasteboardTracker:(id)a3;
- (void)setTimingTracker:(id)a3;
- (void)trackConversionGoalForConsumer:(id)a3 source:(id)a4 trigger:(id)a5 originatingApp:(id)a6 targetApp:(id)a7 converted:(BOOL)a8;
- (void)trackDismissalForConsumer:(id)a3 source:(id)a4 trigger:(id)a5 originatingApp:(id)a6 targetApp:(id)a7;
- (void)trackDonationFromBundleId:(id)a3 source:(id)a4 hasLatLon:(BOOL)a5 isEligible:(BOOL)a6;
- (void)trackOpportunityForConsumer:(id)a3 trigger:(id)a4 targetApp:(id)a5;
- (void)trackPasteboardItemFromBundleId:(id)a3 hasAddress:(BOOL)a4 isEligible:(BOOL)a5;
- (void)trackTimingForConsumer:(id)a3 time:(unint64_t)a4;
@end

@implementation PPConnectionsMetricsTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardTracker, 0);
  objc_storeStrong((id *)&self->_donationTracker, 0);
  objc_storeStrong((id *)&self->_timingTracker, 0);
  objc_storeStrong((id *)&self->_dismissalTracker, 0);
  objc_storeStrong((id *)&self->_conversionTracker, 0);
  objc_storeStrong((id *)&self->_opportunityTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setPasteboardTracker:(id)a3
{
}

- (PETScalarEventTracker)pasteboardTracker
{
  return self->_pasteboardTracker;
}

- (void)setDonationTracker:(id)a3
{
}

- (PETScalarEventTracker)donationTracker
{
  return self->_donationTracker;
}

- (void)setTimingTracker:(id)a3
{
}

- (PETDistributionEventTracker)timingTracker
{
  return self->_timingTracker;
}

- (void)setDismissalTracker:(id)a3
{
}

- (PETScalarEventTracker)dismissalTracker
{
  return self->_dismissalTracker;
}

- (void)setConversionTracker:(id)a3
{
}

- (PETGoalConversionEventTracker)conversionTracker
{
  return self->_conversionTracker;
}

- (void)setOpportunityTracker:(id)a3
{
}

- (PETScalarEventTracker)opportunityTracker
{
  return self->_opportunityTracker;
}

- (void)trackPasteboardItemFromBundleId:(id)a3 hasAddress:(BOOL)a4 isEligible:(BOOL)a5
{
  id v8 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PPConnectionsMetricsTracker_trackPasteboardItemFromBundleId_hasAddress_isEligible___block_invoke;
  block[3] = &unk_1E65DB858;
  block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(queue, block);
}

void __85__PPConnectionsMetricsTracker_trackPasteboardItemFromBundleId_hasAddress_isEligible___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking pasteboard item addition", v8, 2u);
  }

  v3 = -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 32), *(__CFString **)(a1 + 40));
  v4 = [*(id *)(a1 + 32) pasteboardTracker];
  v5 = @"1";
  if (*(unsigned char *)(a1 + 48)) {
    v6 = @"1";
  }
  else {
    v6 = @"0";
  }
  if (!*(unsigned char *)(a1 + 49)) {
    v5 = @"0";
  }
  v9[0] = v6;
  v9[1] = v5;
  v9[2] = v3;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  [v4 trackEventWithPropertyValues:v7];
}

- (__CFString)privacyFriendlyBundleIdentifierWith:(__CFString *)a1
{
  if (a1)
  {
    v3 = @"unknown";
    if (a2) {
      v3 = a2;
    }
    a1 = v3;
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)trackDonationFromBundleId:(id)a3 source:(id)a4 hasLatLon:(BOOL)a5 isEligible:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PPConnectionsMetricsTracker_trackDonationFromBundleId_source_hasLatLon_isEligible___block_invoke;
  v15[3] = &unk_1E65DB830;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  BOOL v18 = a5;
  BOOL v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, v15);
}

void __85__PPConnectionsMetricsTracker_trackDonationFromBundleId_source_hasLatLon_isEligible___block_invoke(uint64_t a1)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking donation", v8, 2u);
  }

  v3 = -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 32), *(__CFString **)(a1 + 40));
  v4 = [*(id *)(a1 + 32) donationTracker];
  if (*(unsigned char *)(a1 + 56)) {
    v5 = @"1";
  }
  else {
    v5 = @"0";
  }
  v9[0] = *(void *)(a1 + 48);
  v9[1] = v5;
  if (*(unsigned char *)(a1 + 57)) {
    v6 = @"1";
  }
  else {
    v6 = @"0";
  }
  v9[2] = v6;
  v9[3] = v3;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  [v4 trackEventWithPropertyValues:v7];
}

- (void)trackTimingForConsumer:(id)a3 time:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PPConnectionsMetricsTracker_trackTimingForConsumer_time___block_invoke;
  block[3] = &unk_1E65DB808;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __59__PPConnectionsMetricsTracker_trackTimingForConsumer_time___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking timing", v5, 2u);
  }

  v3 = [*(id *)(a1 + 32) timingTracker];
  v6[0] = *(void *)(a1 + 40);
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 trackEventWithPropertyValues:v4 value:(double)*(unint64_t *)(a1 + 48)];
}

- (void)trackDismissalForConsumer:(id)a3 source:(id)a4 trigger:(id)a5 originatingApp:(id)a6 targetApp:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__PPConnectionsMetricsTracker_trackDismissalForConsumer_source_trigger_originatingApp_targetApp___block_invoke;
  v23[3] = &unk_1E65DB7E0;
  id v24 = v12;
  v25 = self;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, v23);
}

void __97__PPConnectionsMetricsTracker_trackDismissalForConsumer_source_trigger_originatingApp_targetApp___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v6;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking dismissal for consumer = %@", buf, 0xCu);
  }

  v3 = [*(id *)(a1 + 40) dismissalTracker];
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = *(void *)(a1 + 32);
  v7[1] = v4;
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  [v3 trackEventWithPropertyValues:v5];
}

- (void)trackOpportunityForConsumer:(id)a3 trigger:(id)a4 targetApp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__PPConnectionsMetricsTracker_trackOpportunityForConsumer_trigger_targetApp___block_invoke;
  v15[3] = &unk_1E65DC758;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __77__PPConnectionsMetricsTracker_trackOpportunityForConsumer_trigger_targetApp___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v7;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking opportunity for consumer = %@", buf, 0xCu);
  }

  v3 = -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 40), *(__CFString **)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 40) opportunityTracker];
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = *(void *)(a1 + 32);
  v8[1] = v5;
  v8[2] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  [v4 trackEventWithPropertyValues:v6];
}

- (void)trackConversionGoalForConsumer:(id)a3 source:(id)a4 trigger:(id)a5 originatingApp:(id)a6 targetApp:(id)a7 converted:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PPConnectionsMetricsTracker_trackConversionGoalForConsumer_source_trigger_originatingApp_targetApp_converted___block_invoke;
  block[3] = &unk_1E65DB7B8;
  BOOL v32 = a8;
  id v26 = v14;
  id v27 = self;
  id v28 = v17;
  id v29 = v18;
  id v30 = v15;
  id v31 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v18;
  id v23 = v17;
  id v24 = v14;
  dispatch_async(queue, block);
}

void __112__PPConnectionsMetricsTracker_trackConversionGoalForConsumer_source_trigger_originatingApp_targetApp_converted___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = *(unsigned __int8 *)(a1 + 80);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = v12;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking conversion for consumer = %@, converted = %d", buf, 0x12u);
  }

  v3 = -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 40), *(__CFString **)(a1 + 48));
  uint64_t v4 = -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 40), *(__CFString **)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  v13[0] = *(void *)(a1 + 32);
  v13[1] = v5;
  v13[2] = v6;
  v13[3] = v3;
  v13[4] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  int v8 = *(unsigned __int8 *)(a1 + 80);
  id v9 = [*(id *)(a1 + 40) conversionTracker];
  uint64_t v10 = v9;
  if (v8) {
    [v9 trackGoalConversionEventWithPropertyValues:v7];
  }
  else {
    [v9 trackGoalOpportunityEventWithPropertyValues:v7];
  }
}

- (PPConnectionsMetricsTracker)init
{
  v48[4] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PPConnectionsMetricsTracker;
  uint64_t v2 = [(PPConnectionsMetricsTracker *)&v40 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    v48[0] = @"springboard";
    v48[1] = @"quicktype";
    v48[2] = @"maps";
    v48[3] = @"mapsWidget";
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    uint64_t v5 = [v3 propertyWithName:@"consumer" possibleValues:v4];

    uint64_t v6 = (void *)MEMORY[0x1E4F93720];
    v47[0] = @"donation";
    v47[1] = @"schemaorg";
    v47[2] = @"pasteboard";
    v47[3] = @"siri";
    v47[4] = @"calendar";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:5];
    uint64_t v8 = [v6 propertyWithName:@"source" possibleValues:v7];

    id v9 = (void *)MEMORY[0x1E4F93720];
    v46[0] = @"semantic";
    v46[1] = @"ling_location";
    v46[2] = @"ling_address";
    v46[3] = @"ling_phone";
    v46[4] = @"na";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:5];
    uint64_t v11 = [v9 propertyWithName:@"trigger" possibleValues:v10];

    v33 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"originating_app"];
    uint64_t v12 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"target_app"];
    v45[0] = v5;
    v45[1] = v8;
    v34 = (void *)v8;
    v45[2] = v11;
    v45[3] = v33;
    uint64_t v13 = v11;
    v37 = (void *)v12;
    v38 = (void *)v11;
    v45[4] = v12;
    uint64_t v14 = v12;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:5];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F93730]) initWithFeatureId:@"PEXConnections" opportunityEvent:@"shown" conversionEvent:@"engaged" registerProperties:v39];
    [(PPConnectionsMetricsTracker *)v2 setConversionTracker:v15];

    __int16 v16 = (void *)[objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"PEXConnections" event:@"dismissed" registerProperties:v39];
    [(PPConnectionsMetricsTracker *)v2 setDismissalTracker:v16];

    v44[0] = v5;
    v44[1] = v13;
    v36 = (void *)v5;
    v44[2] = v14;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
    int v17 = (void *)[objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"PEXConnections" event:@"opportunity" registerProperties:v35];
    [(PPConnectionsMetricsTracker *)v2 setOpportunityTracker:v17];

    uint64_t v43 = v5;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"PEXConnections" event:@"timing" registerProperties:v18];
    [(PPConnectionsMetricsTracker *)v2 setTimingTracker:v19];

    v42[0] = v8;
    id v20 = [MEMORY[0x1E4F93720] propertyWithName:@"has_latlon" possibleValues:&unk_1F256AEB0];
    v42[1] = v20;
    id v21 = [MEMORY[0x1E4F93720] propertyWithName:@"eligible" possibleValues:&unk_1F256AEC8];
    v42[2] = v21;
    v42[3] = v33;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];

    id v23 = (void *)[objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"PEXConnections" event:@"donation" registerProperties:v22];
    [(PPConnectionsMetricsTracker *)v2 setDonationTracker:v23];

    id v24 = [MEMORY[0x1E4F93720] propertyWithName:@"has_address" possibleValues:&unk_1F256AEE0];
    v41[0] = v24;
    v25 = [MEMORY[0x1E4F93720] propertyWithName:@"eligible" possibleValues:&unk_1F256AEF8];
    v41[1] = v25;
    v41[2] = v33;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];

    id v27 = (void *)[objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"PEXConnections" event:@"pasteboard" registerProperties:v26];
    [(PPConnectionsMetricsTracker *)v2 setPasteboardTracker:v27];

    id v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.PPConnections.metrics", v29);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v30;
  }
  return v2;
}

+ (id)triggerFromCriteria:(id)a3
{
  id v3 = a3;
  if (+[PPConnectionsUtils isValidLinguisticQuery:v3])
  {
    if ([v3 fields])
    {
      uint64_t v4 = @"ling_phone";
    }
    else if ([v3 subtype] == 6)
    {
      uint64_t v4 = @"ling_location";
    }
    else if ([v3 subtype] == 7)
    {
      uint64_t v4 = @"ling_address";
    }
    else
    {
      uint64_t v4 = @"na";
    }
  }
  else
  {
    uint64_t v5 = +[PPConnectionsUtils supportedLocationSemanticTypes];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v3, "semanticTag"));
    int v7 = [v5 containsObject:v6];

    if (v7) {
      uint64_t v4 = @"semantic";
    }
    else {
      uint64_t v4 = @"na";
    }
  }

  return v4;
}

+ (id)donationSourceFromBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F8A0F0]])
  {
    uint64_t v4 = @"siri";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F8A0E8]])
  {
    uint64_t v4 = @"schemaorg";
  }
  else
  {
    uint64_t v4 = @"donation";
  }

  return v4;
}

+ (id)consumerStringForConsumerType:(unint64_t)a3
{
  id v3 = @"maps";
  uint64_t v4 = @"mapsWidget";
  uint64_t v5 = @"quicktype";
  if ((a3 & 1) == 0) {
    uint64_t v5 = @"unknown";
  }
  if ((a3 & 4) == 0) {
    uint64_t v4 = v5;
  }
  if ((a3 & 2) == 0) {
    id v3 = v4;
  }
  if ((a3 & 8) != 0) {
    return @"springboard";
  }
  else {
    return v3;
  }
}

+ (PPConnectionsMetricsTracker)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PPConnectionsMetricsTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  uint64_t v2 = (void *)sharedInstance_shared_23997;
  return (PPConnectionsMetricsTracker *)v2;
}

uint64_t __45__PPConnectionsMetricsTracker_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance_shared_23997 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end