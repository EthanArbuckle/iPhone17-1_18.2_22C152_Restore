@interface NAUAnalyticsEnvelopeTracker
+ (id)_contentTypeProperty;
+ (id)_daysSinceSubmissionDateProperty;
+ (void)_registerContentTypes:(id)a3 withEventName:(id)a4;
+ (void)_registerEnvelopes:(id)a3 withEventName:(id)a4;
+ (void)registerEnvelopeContentTypesAsDropped:(id)a3 forReason:(unint64_t)a4 withError:(id)a5;
+ (void)registerEnvelopeContentTypesAsPreparedForUpload:(id)a3;
+ (void)registerEnvelopeContentTypesAsRetainedForUploadRetry:(id)a3;
+ (void)registerEnvelopeContentTypesAsUploaded:(id)a3;
+ (void)registerEnvelopeCreationAnticipatedForContentType:(int)a3;
+ (void)registerEnvelopesAsCreated:(id)a3;
+ (void)registerEnvelopesAsReceivedByUploader:(id)a3;
+ (void)registerEnvelopesAsSubmittedToUploader:(id)a3;
@end

@implementation NAUAnalyticsEnvelopeTracker

+ (void)registerEnvelopeCreationAnticipatedForContentType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7[1] = *MEMORY[0x263EF8340];
  if (a3 >= 9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeCreationAnticipatedForContentType:]();
  }
  v5 = [NSNumber numberWithInt:v3];
  v7[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [a1 _registerContentTypes:v6 withEventName:@"anticipated"];
}

+ (void)registerEnvelopesAsCreated:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsCreated:]();
  }
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_4)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsCreated:]();
  }
  [a1 _registerEnvelopes:v4 withEventName:@"created"];
}

BOOL __58__NAUAnalyticsEnvelopeTracker_registerEnvelopesAsCreated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentType] > 8;
}

+ (void)registerEnvelopesAsSubmittedToUploader:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsSubmittedToUploader:]();
  }
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_21)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsSubmittedToUploader:]();
  }
  [a1 _registerEnvelopes:v4 withEventName:@"submitted"];
}

BOOL __70__NAUAnalyticsEnvelopeTracker_registerEnvelopesAsSubmittedToUploader___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentType] > 8;
}

+ (void)registerEnvelopesAsReceivedByUploader:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsReceivedByUploader:]();
  }
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_26)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsReceivedByUploader:]();
  }
  [a1 _registerEnvelopes:v4 withEventName:@"received"];
}

BOOL __69__NAUAnalyticsEnvelopeTracker_registerEnvelopesAsReceivedByUploader___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentType] > 8;
}

+ (void)registerEnvelopeContentTypesAsPreparedForUpload:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsPreparedForUpload:]();
  }
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_33)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsPreparedForUpload:]();
  }
  [a1 _registerContentTypes:v4 withEventName:@"prepared"];
}

BOOL __79__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsPreparedForUpload___block_invoke(uint64_t a1, void *a2)
{
  return [a2 unsignedIntegerValue] > 8;
}

+ (void)registerEnvelopeContentTypesAsRetainedForUploadRetry:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsRetainedForUploadRetry:]();
  }
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_39)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsRetainedForUploadRetry:]();
  }
  [a1 _registerContentTypes:v4 withEventName:@"retained"];
}

BOOL __84__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsRetainedForUploadRetry___block_invoke(uint64_t a1, void *a2)
{
  return [a2 unsignedIntegerValue] > 8;
}

+ (void)registerEnvelopeContentTypesAsUploaded:(id)a3
{
  v31[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsUploaded:]();
  }
  v5 = [v4 allKeys];
  int v6 = objc_msgSend(v5, "fc_containsObjectPassingTest:", &__block_literal_global_45);

  if (v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsUploaded:]();
  }
  v7 = [MEMORY[0x263EFF910] date];
  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  v9 = [MEMORY[0x263EFFA18] localTimeZone];
  v24 = [v8 componentsInTimeZone:v9 fromDate:v7];

  uint64_t v23 = [v24 hour];
  v10 = objc_msgSend(MEMORY[0x263F61888], "propertyWithName:range:", @"localHour", 0, 24);
  id v11 = objc_alloc(MEMORY[0x263F61898]);
  v12 = [a1 _contentTypeProperty];
  v31[0] = v12;
  v13 = [a1 _daysSinceSubmissionDateProperty];
  v31[1] = v13;
  v31[2] = v10;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  v15 = (void *)[v11 initWithFeatureId:@"newsenvelopetracker" event:@"uploaded" registerProperties:v14];

  id v16 = objc_alloc(MEMORY[0x263F61880]);
  v17 = [a1 _contentTypeProperty];
  v30 = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  v19 = (void *)[v16 initWithFeatureId:@"newsenvelopetracker" event:@"uploaded_interval" registerProperties:v18];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke_62;
  v25[3] = &unk_264538E00;
  id v26 = v15;
  id v27 = v7;
  id v28 = v19;
  uint64_t v29 = v23;
  id v20 = v19;
  id v21 = v7;
  id v22 = v15;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];
}

BOOL __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 unsignedIntegerValue] > 8;
}

void __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke_2;
  v7[3] = &unk_264538DD8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  uint64_t v12 = *(void *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke_2(uint64_t a1, void *a2)
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "fc_GregorianCalendarDaysSinceDate:", v4));
  id v6 = *(void **)(a1 + 32);
  v14[0] = *(void *)(a1 + 40);
  v14[1] = v5;
  v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  v14[2] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  [v6 trackEventWithPropertyValues:v8];

  [*(id *)(a1 + 48) timeIntervalSinceDate:v4];
  double v10 = v9;

  id v11 = *(void **)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [v11 trackEventWithPropertyValues:v12 value:v10 / 60.0];
}

+ (void)registerEnvelopeContentTypesAsDropped:(id)a3 forReason:(unint64_t)a4 withError:(id)a5
{
  v58[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v43 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsDropped:forReason:withError:]();
  }
  double v9 = [MEMORY[0x263EFF910] date];
  id v10 = objc_alloc(MEMORY[0x263F61898]);
  id v11 = [a1 _contentTypeProperty];
  v58[0] = v11;
  uint64_t v12 = (void *)MEMORY[0x263F61888];
  v56[0] = &unk_26D195DC0;
  v56[1] = &unk_26D195DD8;
  v57[0] = @"sampling";
  v57[1] = @"failed";
  v56[2] = &unk_26D195DF0;
  v56[3] = &unk_26D195E08;
  v57[2] = @"missingconfig";
  v57[3] = @"pruned";
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:4];
  v14 = [v12 propertyWithName:@"reason" enumMapping:v13];
  v58[1] = v14;
  v15 = [a1 _daysSinceSubmissionDateProperty];
  v58[2] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:3];
  v17 = (void *)[v10 initWithFeatureId:@"newsenvelopetracker" event:@"dropped" registerProperties:v16];

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke;
  v49[3] = &unk_264538E50;
  id v18 = v9;
  id v50 = v18;
  id v19 = v17;
  id v51 = v19;
  unint64_t v52 = a4;
  [v8 enumerateKeysAndObjectsUsingBlock:v49];
  BOOL v20 = a4 == 2;
  id v21 = v43;
  if (v20 && v43)
  {
    uint64_t v22 = *MEMORY[0x263F592A8];
    v55[0] = *MEMORY[0x263F08570];
    v55[1] = v22;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    uint64_t v23 = [v43 domain];
    v41 = (void *)v23;
    int v24 = [v42 containsObject:v23];
    v25 = @"unknown";
    if (v24) {
      v25 = (__CFString *)v23;
    }
    v40 = v25;
    id v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v43, "code"));
    char v39 = [&unk_26D195F28 containsObject:v26];
    id v27 = [MEMORY[0x263F61888] freeValuedPropertyWithName:@"errorDomain"];
    id v28 = (void *)MEMORY[0x263F61888];
    v54[0] = @"yes";
    v54[1] = @"no";
    uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
    v30 = [v28 propertyWithName:@"errorCodeValid" possibleValues:v29];

    v31 = [MEMORY[0x263F61888] freeValuedPropertyWithName:@"errorCode"];
    id v32 = objc_alloc(MEMORY[0x263F61898]);
    v33 = [a1 _contentTypeProperty];
    v53[0] = v33;
    v53[1] = v27;
    v53[2] = v30;
    v53[3] = v31;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];
    v35 = (void *)[v32 initWithFeatureId:@"newsenvelopetracker" event:@"upload_error" registerProperties:v34];

    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke_135;
    v44[3] = &unk_264538E78;
    id v45 = v35;
    v46 = v40;
    char v48 = v39;
    id v47 = v26;
    id v36 = v26;
    v37 = v40;
    id v38 = v35;
    [v8 enumerateKeysAndObjectsUsingBlock:v44];

    id v21 = v43;
  }
}

void __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke_2;
  v7[3] = &unk_264538E28;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 48);
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "fc_GregorianCalendarDaysSinceDate:", a2);
  id v4 = *(void **)(a1 + 40);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 56), *(void *)(a1 + 48));
  v8[1] = v5;
  id v6 = [NSNumber numberWithUnsignedInteger:v3];
  v8[2] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  [v4 trackEventWithPropertyValues:v7];
}

void __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  v13[4] = *MEMORY[0x263EF8340];
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v13[0] = a2;
  v13[1] = v4;
  if (*(unsigned char *)(a1 + 56)) {
    id v6 = @"yes";
  }
  else {
    id v6 = @"no";
  }
  v13[2] = v6;
  v7 = *(void **)(a1 + 48);
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 stringValue];
  v13[3] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
  uint64_t v12 = [v8 count];

  [v5 trackEventWithPropertyValues:v11 value:v12];
}

+ (void)_registerEnvelopes:(id)a3 withEventName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker _registerEnvelopes:withEventName:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker _registerEnvelopes:withEventName:]();
  }
LABEL_6:
  id v8 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_139);
  [a1 _registerContentTypes:v8 withEventName:v7];
}

uint64_t __64__NAUAnalyticsEnvelopeTracker__registerEnvelopes_withEventName___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 contentType];

  return [v2 numberWithInt:v3];
}

+ (void)_registerContentTypes:(id)a3 withEventName:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker _registerContentTypes:withEventName:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NAUAnalyticsEnvelopeTracker _registerContentTypes:withEventName:]();
  }
LABEL_6:
  id v8 = objc_alloc(MEMORY[0x263F61898]);
  id v9 = [a1 _contentTypeProperty];
  v26[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  uint64_t v11 = (void *)[v8 initWithFeatureId:@"newsenvelopetracker" event:v7 registerProperties:v10];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = (id)[objc_alloc(MEMORY[0x263F08760]) initWithArray:v6];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v12, "countForObject:", v17, (void)v20);
        uint64_t v24 = v17;
        id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
        [v11 trackEventWithPropertyValues:v19 value:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v14);
  }
}

+ (id)_contentTypeProperty
{
  return (id)objc_msgSend(MEMORY[0x263F61888], "propertyWithName:range:", @"contentType", 0, 9);
}

+ (id)_daysSinceSubmissionDateProperty
{
  return (id)objc_msgSend(MEMORY[0x263F61888], "propertyWithName:range:", @"daysSinceSubmission", 0, 10);
}

+ (void)registerEnvelopeCreationAnticipatedForContentType:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(contentType)", v6, 2u);
}

+ (void)registerEnvelopesAsCreated:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![envelopes fc_containsObjectPassingTest:^BOOL(NTPBEnvelope *envelope) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(envelope.contentType); }]",
    v6,
    2u);
}

+ (void)registerEnvelopesAsCreated:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);
}

+ (void)registerEnvelopesAsSubmittedToUploader:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![envelopes fc_containsObjectPassingTest:^BOOL(NTPBEnvelope *envelope) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(envelope.contentType); }]",
    v6,
    2u);
}

+ (void)registerEnvelopesAsSubmittedToUploader:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);
}

+ (void)registerEnvelopesAsReceivedByUploader:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![envelopes fc_containsObjectPassingTest:^BOOL(NTPBEnvelope *envelope) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(envelope.contentType); }]",
    v6,
    2u);
}

+ (void)registerEnvelopesAsReceivedByUploader:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);
}

+ (void)registerEnvelopeContentTypesAsPreparedForUpload:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![contentTypes fc_containsObjectPassingTest:^BOOL(NSNumber *contentType) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported((NTPBEnvelope_ContentType)[contentType unsignedIntegerValue]); }]",
    v6,
    2u);
}

+ (void)registerEnvelopeContentTypesAsPreparedForUpload:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypes", v6, 2u);
}

+ (void)registerEnvelopeContentTypesAsRetainedForUploadRetry:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![contentTypes fc_containsObjectPassingTest:^BOOL(NSNumber *contentType) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported((NTPBEnvelope_ContentType)[contentType unsignedIntegerValue]); }]",
    v6,
    2u);
}

+ (void)registerEnvelopeContentTypesAsRetainedForUploadRetry:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypes", v6, 2u);
}

+ (void)registerEnvelopeContentTypesAsUploaded:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![submissionDatesByContentType.allKeys fc_containsObjectPassingTest:^BOOL(NSNumber *contentType) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported((NTPBEnvelope_ContentType)[contentType unsignedIntegerValue]); }]",
    v6,
    2u);
}

+ (void)registerEnvelopeContentTypesAsUploaded:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"submissionDatesByContentType", v6, 2u);
}

+ (void)registerEnvelopeContentTypesAsDropped:forReason:withError:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"submissionDatesByContentType", v6, 2u);
}

+ (void)_registerEnvelopes:withEventName:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"eventName", v6, 2u);
}

+ (void)_registerEnvelopes:withEventName:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);
}

+ (void)_registerContentTypes:withEventName:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"eventName", v6, 2u);
}

+ (void)_registerContentTypes:withEventName:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypes", v6, 2u);
}

@end