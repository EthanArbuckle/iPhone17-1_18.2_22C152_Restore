@interface TCSIDSIDStatusController
+ (id)stringForDestinationToStatus:(id)a3;
- (IDSBatchIDQueryController)queryController;
- (NSArray)destinations;
- (NSMutableDictionary)destinationToStatus;
- (NSNumber)status;
- (NSString)tinCanHandle;
- (TCSIDSIDStatusController)initWithItem:(id)a3 delegate:(id)a4 timeout:(double)a5;
- (TCSIDSIDStatusControllerDelegate)delegate;
- (TUIDSLookup)item;
- (void)_statusQueryTimedOut;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)execute;
- (void)setQueryController:(id)a3;
@end

@implementation TCSIDSIDStatusController

- (TCSIDSIDStatusController)initWithItem:(id)a3 delegate:(id)a4 timeout:(double)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TCSIDSIDStatusController;
  v11 = [(TCSIDSIDStatusController *)&v27 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_item, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    destinationToStatus = v12->_destinationToStatus;
    v12->_destinationToStatus = (NSMutableDictionary *)v13;

    uint64_t v15 = [v9 idsCanonicalDestinations];
    destinations = v12->_destinations;
    v12->_destinations = (NSArray *)v15;

    v12->_timeout = a5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v17 = v12->_destinations;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_destinationToStatus, "setObject:forKeyedSubscript:", &unk_26CFD1DD8, *(void *)(*((void *)&v23 + 1) + 8 * v21++), (void)v23);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v19);
    }
  }
  return v12;
}

- (void)execute
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  _TCSInitializeLogging();
  v3 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    destinations = self->_destinations;
    v5 = v3;
    v6 = [(NSArray *)destinations componentsJoinedByString:@", "];
    v7 = TCSLogSafeDescription(v6);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v7;
    _os_log_impl(&dword_21E834000, v5, OS_LOG_TYPE_DEFAULT, "IDS status query initiated for destinations: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  timer = self->_timer;
  self->_timer = v8;

  id v10 = self->_timer;
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v12 = self->_timer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __35__TCSIDSIDStatusController_execute__block_invoke;
  handler[3] = &unk_2644C8B00;
  objc_copyWeak(&v17, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_timer);
  id v13 = objc_alloc(MEMORY[0x263F4A008]);
  v14 = (IDSBatchIDQueryController *)[v13 initWithService:@"com.apple.private.alloy.tincan.audio" delegate:self queue:MEMORY[0x263EF83A0]];
  queryController = self->_queryController;
  self->_queryController = v14;

  [(IDSBatchIDQueryController *)self->_queryController setDestinations:self->_destinations];
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __35__TCSIDSIDStatusController_execute__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _statusQueryTimedOut];
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  [(IDSBatchIDQueryController *)self->_queryController invalidate];
  v4.receiver = self;
  v4.super_class = (Class)TCSIDSIDStatusController;
  [(TCSIDSIDStatusController *)&v4 dealloc];
}

- (void)_statusQueryTimedOut
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E834000, log, OS_LOG_TYPE_ERROR, "IDS status query timed out without a definitive answer.", v1, 2u);
}

- (NSNumber)status
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(TCSIDSIDStatusController *)self destinationToStatus];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v4)
  {

    return (NSNumber *)&unk_26CFD1E20;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v7 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
      id v10 = [(TCSIDSIDStatusController *)self destinationToStatus];
      dispatch_time_t v11 = [v10 objectForKeyedSubscript:v9];
      uint64_t v12 = [v11 integerValue];

      switch(v12)
      {
        case 17486201:
          ++v15;
          break;
        case 1:
          ++v6;
          break;
        case 0:
          ++v14;
          break;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v5);

  if (v6) {
    return (NSNumber *)&unk_26CFD1DF0;
  }
  if (v15) {
    return (NSNumber *)&unk_26CFD1DD8;
  }
  if (!v14) {
    return (NSNumber *)&unk_26CFD1E20;
  }
  return (NSNumber *)&unk_26CFD1E08;
}

- (NSString)tinCanHandle
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v3 = [(TCSIDSIDStatusController *)self status];
  uint64_t v4 = [v3 integerValue];

  if (v4 == 1)
  {
    uint64_t v5 = [(TCSIDSIDStatusController *)self destinationToStatus];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__TCSIDSIDStatusController_tinCanHandle__block_invoke;
    v8[3] = &unk_2644C9110;
    v8[4] = &v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSString *)v6;
}

void __40__TCSIDSIDStatusController_tinCanHandle__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 integerValue] == 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v9 count])
  {
    if ([@"com.apple.private.alloy.tincan.audio" isEqualToString:v10])
    {
      _TCSInitializeLogging();
      uint64_t v12 = TCSLogDefault;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
          -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:]((uint64_t)v11, v12);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = v12;
          long long v16 = [(id)objc_opt_class() stringForDestinationToStatus:v9];
          long long v17 = TCSLogSafeDescription(v16);
          *(_DWORD *)buf = 138412290;
          v39 = v17;
          _os_log_impl(&dword_21E834000, v15, OS_LOG_TYPE_DEFAULT, "IDS status query returned status update: %@", buf, 0xCu);
        }
        v32 = [(TCSIDSIDStatusController *)self status];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v18 = v9;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v34 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              long long v24 = [(TCSIDSIDStatusController *)self destinationToStatus];
              long long v25 = [v24 objectForKeyedSubscript:v23];

              if (v25)
              {
                long long v26 = [v18 objectForKeyedSubscript:v23];
                objc_super v27 = [(TCSIDSIDStatusController *)self destinationToStatus];
                [v27 setObject:v26 forKeyedSubscript:v23];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v20);
        }

        v28 = [(TCSIDSIDStatusController *)self status];
        if (v32 != v28 && ([v32 isEqualToNumber:v28] & 1) == 0)
        {
          uint64_t v29 = [(TCSIDSIDStatusController *)self delegate];
          [v29 tinCanIDSIDStatusControllerStatusDidChange:self];
        }
        timer = self->_timer;
        id v11 = 0;
        if (timer)
        {
          dispatch_source_cancel(timer);
          v31 = self->_timer;
          self->_timer = 0;
        }
      }
    }
    else
    {
      _TCSInitializeLogging();
      id v14 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
        -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:]((uint64_t)v10, v14);
      }
    }
  }
  else
  {
    _TCSInitializeLogging();
    id v13 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:](v13);
    }
  }
}

+ (id)stringForDestinationToStatus:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__TCSIDSIDStatusController_stringForDestinationToStatus___block_invoke;
  v9[3] = &unk_2644C9138;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v7 = [v6 componentsJoinedByString:@", "];

  return v7;
}

void __57__TCSIDSIDStatusController_stringForDestinationToStatus___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v10 = (id)IDSCopyRawAddressForDestination();
  uint64_t v5 = [v4 integerValue];

  id v6 = @"valid";
  uint64_t v7 = @"unknown";
  if (v5 == 2) {
    uint64_t v7 = @"invalid";
  }
  if (v5 == 17486201) {
    id v8 = @"loading";
  }
  else {
    id v8 = v7;
  }
  if (v5 != 1) {
    id v6 = v8;
  }
  id v9 = [NSString stringWithFormat:@"%@ = %@", v10, v6];
  [*(id *)(a1 + 32) addObject:v9];
}

- (TUIDSLookup)item
{
  return self->_item;
}

- (TCSIDSIDStatusControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TCSIDSIDStatusControllerDelegate *)WeakRetained;
}

- (IDSBatchIDQueryController)queryController
{
  return self->_queryController;
}

- (void)setQueryController:(id)a3
{
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (NSMutableDictionary)destinationToStatus
{
  return self->_destinationToStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationToStatus, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end