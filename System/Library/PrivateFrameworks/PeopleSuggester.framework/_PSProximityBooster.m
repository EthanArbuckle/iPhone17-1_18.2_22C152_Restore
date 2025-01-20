@interface _PSProximityBooster
- (RPPeopleDiscovery)peopleDiscovery;
- (_PSProximityBooster)init;
- (id)suggestionsByBoostingNearbySuggestions:(id)a3;
- (void)setPeopleDiscovery:(id)a3;
- (void)startMonitoringProximity;
- (void)stopMonitoringProximity;
@end

@implementation _PSProximityBooster

- (_PSProximityBooster)init
{
  v8.receiver = self;
  v8.super_class = (Class)_PSProximityBooster;
  v2 = [(_PSProximityBooster *)&v8 init];
  if (v2)
  {
    v3 = (RPPeopleDiscovery *)objc_alloc_init(MEMORY[0x1E4F94728]);
    peopleDiscovery = v2->_peopleDiscovery;
    v2->_peopleDiscovery = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.peoplesuggester.proximitybooster", v5);
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setDispatchQueue:v6];

    [(RPPeopleDiscovery *)v2->_peopleDiscovery setDiscoveryMode:400];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setDiscoveryFlags:24];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setChangeFlags:0xFFFFFFFFLL];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setPersonFoundHandler:&__block_literal_global_12];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setPersonLostHandler:&__block_literal_global_9_0];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setPersonChangedHandler:&__block_literal_global_13];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setInvalidationHandler:&__block_literal_global_18_0];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setInterruptionHandler:&__block_literal_global_21_0];
  }
  return v2;
}

- (void)startMonitoringProximity
{
  id v2 = [(_PSProximityBooster *)self peopleDiscovery];
  [v2 activateWithCompletion:&__block_literal_global_24_0];
}

- (void)stopMonitoringProximity
{
  id v2 = [(_PSProximityBooster *)self peopleDiscovery];
  [v2 invalidate];
}

- (id)suggestionsByBoostingNearbySuggestions:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  dispatch_queue_t v6 = [(_PSProximityBooster *)self peopleDiscovery];
  v7 = [v6 dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke;
  block[3] = &unk_1E5ADFC58;
  block[4] = self;
  id v8 = v5;
  id v56 = v8;
  dispatch_sync(v7, block);

  v42 = (void *)[v4 mutableCopy];
  obuint64_t j = [MEMORY[0x1E4F1CA80] set];
  v45 = v4;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v9 = [v4 reverseObjectEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v51 objects:v64 count:16];
  v41 = v8;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v15 = [v14 recipients];
        uint64_t v16 = [v15 count];

        if (v16 == 1)
        {
          v17 = [v14 recipients];
          v18 = [v17 firstObject];

          v19 = [v18 contact];
          v20 = [v19 identifier];

          if (v20 && [v8 containsObject:v20])
          {
            [v42 removeObject:v14];
            [v42 insertObject:v14 atIndex:0];
            v21 = [v14 reason];
            v22 = [v21 stringByAppendingString:@" - "];
            [v22 stringByAppendingString:@"Proximity Boosted"];
            v24 = uint64_t v23 = v12;
            [v14 setReason:v24];

            v25 = [v14 reasonType];
            v26 = [v25 stringByAppendingString:@" - "];
            v27 = [v26 stringByAppendingString:@"Proximity Boosted"];
            [v14 setReasonType:v27];

            uint64_t v12 = v23;
            id v8 = v41;

            [obj addObject:v20];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }
    while (v11);
  }

  v28 = (void *)[v42 copy];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obja = obj;
  uint64_t v29 = [obja countByEnumeratingWithState:&v47 objects:v63 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(obja);
        }
        uint64_t v33 = *(void *)(*((void *)&v47 + 1) + 8 * j);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_32;
        v46[3] = &unk_1E5ADFE18;
        v46[4] = v33;
        v34 = (void *)MEMORY[0x1A6243AD0](v46);
        uint64_t v35 = [v45 indexOfObjectPassingTest:v34];
        uint64_t v36 = [v28 indexOfObjectPassingTest:v34];
        v37 = +[_PSLogging heuristicsChannel];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = [NSNumber numberWithUnsignedInteger:v35];
          v39 = [NSNumber numberWithUnsignedInteger:v36];
          *(_DWORD *)buf = 138412802;
          uint64_t v58 = v33;
          __int16 v59 = 2112;
          v60 = v38;
          __int16 v61 = 2112;
          v62 = v39;
          _os_log_debug_impl(&dword_1A314B000, v37, OS_LOG_TYPE_DEBUG, "Boosting suggestion with contactID %@ from index %@ to index %@", buf, 0x20u);
        }
      }
      uint64_t v30 = [obja countByEnumeratingWithState:&v47 objects:v63 count:16];
    }
    while (v30);
  }

  return v28;
}

- (RPPeopleDiscovery)peopleDiscovery
{
  return self->_peopleDiscovery;
}

- (void)setPeopleDiscovery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end