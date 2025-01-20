@interface PPLocationStore
+ (id)_mergedThoroughfareForThorughfare:(id)a3 subThoroughfare:(id)a4 subPremises:(id)a5;
+ (id)defaultStore;
+ (id)describeLocationConsumer:(unint64_t)a3;
+ (id)new;
+ (id)placemarkWithLatitudeDegrees:(id)a3 longitudeDegrees:(id)a4 name:(id)a5 thoroughfare:(id)a6 subthoroughFare:(id)a7 locality:(id)a8 subLocality:(id)a9 administrativeArea:(id)a10 subAdministrativeArea:(id)a11 postalCode:(id)a12 countryCode:(id)a13 country:(id)a14 inlandWater:(id)a15 ocean:(id)a16 areasOfInterest:(id)a17;
+ (id)placemarkWithLocation:(id)a3 name:(id)a4 thoroughfare:(id)a5 subthoroughFare:(id)a6 locality:(id)a7 subLocality:(id)a8 administrativeArea:(id)a9 subAdministrativeArea:(id)a10 postalCode:(id)a11 countryCode:(id)a12 country:(id)a13 inlandWater:(id)a14 ocean:(id)a15 areasOfInterest:(id)a16;
+ (id)placemarkWithName:(id)a3 clLocation:(id)a4;
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)cloudSyncWithError:(id *)a3;
- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 error:(id *)a9;
- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (PPLocationStore)init;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)locationRecordsWithQuery:(id)a3 error:(id *)a4;
- (id)rankedLocationsWithQuery:(id)a3 error:(id *)a4;
- (void)registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPLocationStore

- (PPLocationStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPLocationStore;
  v2 = [(PPLocationStore *)&v6 init];
  if (v2)
  {
    v3 = [[PPClientFeedbackHelper alloc] initWithParentObject:v2];
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v3;
  }
  return v2;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    v4 = self->_clientFeedbackHelper;
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (id)locationRecordsWithQuery:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PPLocationStore.m", 485, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  v8 = objc_opt_new();
  v9 = pp_locations_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = pp_locations_signpost_handle();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPLocationStore.locationRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__PPLocationStore_locationRecordsWithQuery_error___block_invoke;
  v21[3] = &unk_1E550DD78;
  id v22 = v8;
  id v13 = v8;
  BOOL v14 = [(PPLocationStore *)self iterLocationRecordsWithQuery:v7 error:a4 block:v21];
  v15 = pp_locations_signpost_handle();
  v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v16, OS_SIGNPOST_INTERVAL_END, v10, "PPLocationStore.locationRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v14) {
    v17 = v13;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  return v18;
}

uint64_t __50__PPLocationStore_locationRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PPLocationStore.m", 461, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_11:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PPLocationStore.m", 462, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v12 = pp_locations_signpost_handle();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  BOOL v14 = pp_locations_signpost_handle();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PPLocationStore.iterLocationRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  v16 = +[PPLocationReadOnlyClient sharedInstance];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__PPLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke;
  v24[3] = &unk_1E550DD28;
  v26 = v28;
  id v17 = v11;
  id v25 = v17;
  char v18 = [v16 locationRecordsWithQuery:v9 error:a4 handleBatch:v24];

  v19 = pp_locations_signpost_handle();
  v20 = v19;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v20, OS_SIGNPOST_INTERVAL_END, v13, "PPLocationStore.iterLocationRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  _Block_object_dispose(v28, 8);
  return v18;
}

void __60__PPLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = v5;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
            *a3 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (id)rankedLocationsWithQuery:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PPLocationStore.m", 444, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = pp_locations_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = pp_locations_signpost_handle();
  long long v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPLocationStore.rankedLocationsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__PPLocationStore_rankedLocationsWithQuery_error___block_invoke;
  v21[3] = &unk_1E550DD50;
  id v22 = v8;
  id v13 = v8;
  BOOL v14 = [(PPLocationStore *)self iterRankedLocationsWithQuery:v7 error:a4 block:v21];
  long long v15 = pp_locations_signpost_handle();
  v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v16, OS_SIGNPOST_INTERVAL_END, v10, "PPLocationStore.rankedLocationsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v14) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  return v18;
}

uint64_t __50__PPLocationStore_rankedLocationsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PPLocationStore.m", 420, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_11:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PPLocationStore.m", 421, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  long long v12 = pp_locations_signpost_handle();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  BOOL v14 = pp_locations_signpost_handle();
  long long v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PPLocationStore.iterRankedLocationsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  v16 = +[PPLocationReadOnlyClient sharedInstance];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__PPLocationStore_iterRankedLocationsWithQuery_error_block___block_invoke;
  v24[3] = &unk_1E550DD28;
  v26 = v28;
  id v17 = v11;
  id v25 = v17;
  char v18 = [v16 rankedLocationsWithQuery:v9 error:a4 handleBatch:v24];

  v19 = pp_locations_signpost_handle();
  v20 = v19;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v20, OS_SIGNPOST_INTERVAL_END, v13, "PPLocationStore.iterRankedLocationsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  _Block_object_dispose(v28, 8);
  return v18;
}

void __60__PPLocationStore_iterRankedLocationsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = v5;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
            *a3 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  objc_super v6 = +[PPLocationReadWriteClient sharedInstance];
  LOBYTE(a4) = [v6 clearWithError:a3 deletedCount:a4];

  return (char)a4;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  v4 = +[PPLocationReadWriteClient sharedInstance];
  LOBYTE(a3) = [v4 cloudSyncWithError:a3];

  return (char)a3;
}

- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 error:(id *)a9
{
  BOOL v11 = a7;
  uint64_t v12 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  if (!v17)
  {
    char v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PPLocationStore.m", 389, @"Invalid parameter not satisfying: %@", @"locations" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
LABEL_11:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PPLocationStore.m", 390, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v18) {
    goto LABEL_11;
  }
LABEL_3:
  v20 = pp_locations_signpost_handle();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  id v22 = pp_locations_signpost_handle();
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PPLocationStore.donateLocations", (const char *)&unk_18CB1211E, buf, 2u);
  }

  v24 = +[PPLocationReadWriteClient sharedInstance];
  char v25 = [v24 donateLocations:v17 source:v18 contextualNamedEntities:v19 algorithm:v12 cloudSync:v11 decayRate:a9 error:a8];

  v26 = pp_locations_signpost_handle();
  v27 = v26;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v27, OS_SIGNPOST_INTERVAL_END, v21, "PPLocationStore.donateLocations", (const char *)&unk_18CB1211E, v31, 2u);
  }

  return v25;
}

- (void)registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v10 length])
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PPLocationStore.m" lineNumber:365 description:@"clientIdentifier must not be nil or zero length"];
  }
  if ((unint64_t)[v10 length] >= 0xB)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPLocationStore.m", 366, @"clientIdentifier was longer than %d characters.  Please choose a shorter identifer", 10);
  }
  if ([v9 isMapped])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PPLocationStore.m" lineNumber:368 description:@"You cannot send mapped feedback on locations. Please use PPFeedback to create the feedback for locations."];
  }
  [v9 setClientIdentifier:v10];
  uint64_t v12 = +[PPLocationReadOnlyClient sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PPLocationStore_registerFeedback_clientIdentifier_completion___block_invoke;
  v17[3] = &unk_1E550F8A8;
  v17[4] = self;
  id v18 = v11;
  id v13 = v11;
  [v12 registerFeedback:v9 completion:v17];
}

uint64_t __64__PPLocationStore_registerFeedback_clientIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PPLocationStore *)self clientIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PPLocationStore.m", 352, @"The clientIdentifier property must be set on the %@ in order to send feedback.", v13 object file lineNumber description];
  }
  id v14 = [(PPLocationStore *)self clientIdentifier];
  [(PPLocationStore *)self registerFeedback:v8 clientIdentifier:v14 completion:v7];
}

+ (id)describeLocationConsumer:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E550DD98[a3 - 1];
  }
}

+ (id)placemarkWithName:(id)a3 clLocation:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    id v5 = [a1 placemarkWithLocation:a4 name:a3 thoroughfare:0 subthoroughFare:0 locality:0 subLocality:0 administrativeArea:0 subAdministrativeArea:0 postalCode:0 countryCode:0 country:0 inlandWater:0 ocean:0 areasOfInterest:0];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)placemarkWithLatitudeDegrees:(id)a3 longitudeDegrees:(id)a4 name:(id)a5 thoroughfare:(id)a6 subthoroughFare:(id)a7 locality:(id)a8 subLocality:(id)a9 administrativeArea:(id)a10 subAdministrativeArea:(id)a11 postalCode:(id)a12 countryCode:(id)a13 country:(id)a14 inlandWater:(id)a15 ocean:(id)a16 areasOfInterest:(id)a17
{
  id v49 = a5;
  id v48 = a6;
  id v47 = a7;
  id v46 = a8;
  id v45 = a9;
  id v21 = a10;
  id v42 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  v28 = v27;
  char v29 = 0;
  if (a3 && a4)
  {
    v30 = (objc_class *)MEMORY[0x1E4F1E5F0];
    id v41 = v27;
    id v31 = a4;
    id v32 = v21;
    id v33 = a3;
    id v34 = [v30 alloc];
    [v33 doubleValue];
    double v36 = v35;

    id v21 = v32;
    [v31 doubleValue];
    double v38 = v37;

    char v29 = (void *)[v34 initWithLatitude:v36 longitude:v38];
    v28 = v41;
  }
  id v44 = [a1 placemarkWithLocation:v29 name:v49 thoroughfare:v48 subthoroughFare:v47 locality:v46 subLocality:v45 administrativeArea:v21 subAdministrativeArea:v42 postalCode:v22 countryCode:v23 country:v24 inlandWater:v25 ocean:v26 areasOfInterest:v28];

  return v44;
}

+ (id)placemarkWithLocation:(id)a3 name:(id)a4 thoroughfare:(id)a5 subthoroughFare:(id)a6 locality:(id)a7 subLocality:(id)a8 administrativeArea:(id)a9 subAdministrativeArea:(id)a10 postalCode:(id)a11 countryCode:(id)a12 country:(id)a13 inlandWater:(id)a14 ocean:(id)a15 areasOfInterest:(id)a16
{
  id v40 = a16;
  id v38 = a15;
  id v37 = a14;
  id v36 = a13;
  id v35 = a12;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  v28 = objc_opt_new();
  [v28 setObject:v26 forKeyedSubscript:@"Name"];

  [v28 setObject:v25 forKeyedSubscript:@"Thoroughfare"];
  [v28 setObject:v24 forKeyedSubscript:@"SubThoroughfare"];
  [v28 setObject:v23 forKeyedSubscript:@"City"];

  [v28 setObject:v22 forKeyedSubscript:@"SubLocality"];
  [v28 setObject:v21 forKeyedSubscript:@"State"];

  [v28 setObject:v20 forKeyedSubscript:@"SubAdministrativeArea"];
  [v28 setObject:v19 forKeyedSubscript:@"ZIP"];

  [v28 setObject:v35 forKeyedSubscript:@"CountryCode"];
  [v28 setObject:v36 forKeyedSubscript:@"Country"];

  [v28 setObject:v37 forKeyedSubscript:@"InlandWater"];
  [v28 setObject:v38 forKeyedSubscript:@"Ocean"];

  char v29 = [a1 _mergedThoroughfareForThorughfare:v25 subThoroughfare:v24 subPremises:MEMORY[0x1E4F1CBF0]];

  [v28 setObject:v29 forKeyedSubscript:@"Street"];
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F1E630]) initWithLocation:v27 addressDictionary:v28 region:0 areasOfInterest:v40];

  return v30;
}

+ (id)_mergedThoroughfareForThorughfare:(id)a3 subThoroughfare:(id)a4 subPremises:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x192F97350]();
  if (v7 && v8)
  {
    uint64_t v11 = [[NSString alloc] initWithFormat:@"%@ %@", v8, v7];
  }
  else
  {
    id v12 = 0;
    if (!v7 || v8) {
      goto LABEL_11;
    }
    uint64_t v11 = [[NSString alloc] initWithFormat:@"%@", v7, v17];
  }
  id v12 = (id)v11;
  if (v11)
  {
    if ([v9 count])
    {
      id v13 = [NSString alloc];
      id v14 = objc_msgSend(v9, "_pas_componentsJoinedByString:", @" ");
      long long v15 = (void *)[v13 initWithFormat:@"%@ %@", v12, v14];

      goto LABEL_12;
    }
    [v9 count];
  }
LABEL_11:
  id v12 = v12;
  long long v15 = v12;
LABEL_12:

  return v15;
}

+ (id)defaultStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PPLocationStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore__pasOnceToken14 != -1) {
    dispatch_once(&defaultStore__pasOnceToken14, block);
  }
  v2 = (void *)defaultStore__pasExprOnceResult;
  return v2;
}

void __31__PPLocationStore_defaultStore__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult;
  defaultStore__pasExprOnceResult = v1;
}

+ (id)new
{
  return (id)MEMORY[0x1F4181648](a1, a2);
}

@end