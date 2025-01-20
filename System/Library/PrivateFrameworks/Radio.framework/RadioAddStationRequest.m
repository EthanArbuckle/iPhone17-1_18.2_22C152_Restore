@interface RadioAddStationRequest
- (RadioAddStationRequest)init;
- (RadioAddStationRequest)initWithLibraryTrackDictionary:(id)a3 useArtist:(BOOL)a4;
- (RadioAddStationRequest)initWithQueryTerm:(id)a3 queryID:(int64_t)a4;
- (RadioAddStationRequest)initWithRadioTrackDictionary:(id)a3 useArtist:(BOOL)a4;
- (RadioAddStationRequest)initWithStation:(id)a3;
- (RadioAddStationRequest)initWithStationDictionary:(id)a3;
- (id)changeList;
- (id)matchDictionary;
- (void)startWithAddStationCompletionHandler:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation RadioAddStationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationHashForSkipHistoryCopying, 0);
  objc_storeStrong((id *)&self->_stationDictionary, 0);
  objc_storeStrong((id *)&self->_matchDictionary, 0);
}

- (void)startWithAddStationCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[RadioModel sharedModel];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke;
  v13[3] = &unk_2643AA648;
  id v6 = v5;
  id v14 = v6;
  [v6 performWriteTransactionWithBlock:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke_2;
  v10[3] = &unk_2643AA120;
  v10[4] = self;
  id v11 = v6;
  id v12 = v4;
  v9.receiver = self;
  v9.super_class = (Class)RadioAddStationRequest;
  id v7 = v4;
  id v8 = v6;
  [(RadioSyncRequest *)&v9 startWithCompletionHandler:v10];
}

uint64_t __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 globalVersion] + 1;
  return [v1 setGlobalVersion:v2];
}

void __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [*(id *)(a1 + 32) responseDictionary];
    *(_DWORD *)buf = 138412290;
    v32 = v7;
    _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_INFO, "[RadioAddStationRequest] Add station response: %@", buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) status] != 1)
  {
    v17 = *(void **)(a1 + 40);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke_63;
    v23[3] = &unk_2643AA0F8;
    id v24 = v17;
    uint64_t v25 = a2;
    [v24 performWriteTransactionWithBlock:v23];
    objc_super v9 = 0;
    id v18 = v24;
LABEL_25:

    goto LABEL_26;
  }
  id v8 = +[RadioModel sharedModel];
  objc_super v9 = [v8 stationWithPersistentID:*(void *)(*(void *)(a1 + 32) + 136)];

  if (*(void *)(*(void *)(a1 + 32) + 128)
    && (!v9 || ([v9 isFeatured] & 1) != 0 || objc_msgSend(v9, "isSponsored")))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v10 = +[RadioModel sharedModel];
    id v11 = [v10 userStations];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (![v16 persistentID]
            && ([v16 isFeatured] & 1) == 0
            && ([v16 isSponsored] & 1) == 0)
          {
            id v19 = v16;

            objc_super v9 = v19;
            goto LABEL_21;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  if (*(void *)(*(void *)(a1 + 32) + 152))
  {
    uint64_t v20 = [v9 stationID];
    if (v20)
    {
      uint64_t v21 = v20;
      id v18 = +[RadioModel sharedModel];
      [v18 copySkipHistoryFromStationHash:*(void *)(*(void *)(a1 + 32) + 152) toStationID:v21];
      goto LABEL_25;
    }
  }
LABEL_26:
  uint64_t v22 = *(void *)(a1 + 48);
  if (v22) {
    (*(void (**)(uint64_t, void *, uint64_t, id))(v22 + 16))(v22, v9, a2, v5);
  }
}

uint64_t __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke_63(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) globalVersion];
  if (result == *(void *)(a1 + 40))
  {
    uint64_t v3 = result - 1;
    id v4 = *(void **)(a1 + 32);
    return [v4 setGlobalVersion:v3];
  }
  return result;
}

- (void)startWithCompletionHandler:(id)a3
{
}

- (id)matchDictionary
{
  return self->_matchDictionary;
}

- (id)changeList
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->_matchDictionary)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v3 = NSDictionary;
    stationDictionary = self->_stationDictionary;
    id v5 = [NSNumber numberWithInt:1];
    id v6 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", stationDictionary, @"station-dict", v5, @"change-type", 0);
    v8[0] = v6;
    uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  return v2;
}

- (RadioAddStationRequest)initWithQueryTerm:(id)a3 queryID:(int64_t)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"RadioAddStationRequest.m", 86, @"Invalid parameter not satisfying: %@", @"queryTerm" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)RadioAddStationRequest;
  id v8 = [(RadioSyncRequest *)&v15 init];
  if (v8)
  {
    v8->_persistentID = arc4random();
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    if (a4)
    {
      v10 = [NSNumber numberWithUnsignedLongLong:a4];
      [v9 setObject:v10 forKey:@"id"];
    }
    if (v7) {
      [v9 setObject:v7 forKey:@"term"];
    }
    v16 = @"query";
    v17[0] = v9;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    matchDictionary = v8->_matchDictionary;
    v8->_matchDictionary = (NSDictionary *)v11;
  }
  return v8;
}

- (RadioAddStationRequest)initWithRadioTrackDictionary:(id)a3 useArtist:(BOOL)a4
{
  BOOL v4 = a4;
  v16[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)RadioAddStationRequest;
    id v7 = [(RadioSyncRequest *)&v14 init];
    if (v7)
    {
      v7->_persistentID = arc4random();
      v16[0] = v6;
      v15[0] = @"radio-track";
      v15[1] = @"use-artist";
      id v8 = [NSNumber numberWithBool:v4];
      v16[1] = v8;
      v15[2] = @"persistent-id";
      objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llx", v7->_persistentID);
      v16[2] = v9;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
      matchDictionary = v7->_matchDictionary;
      v7->_matchDictionary = (NSDictionary *)v10;
    }
    self = v7;
    uint64_t v12 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"radioTrackDictionary must be non-nil"];
    uint64_t v12 = 0;
  }

  return v12;
}

- (RadioAddStationRequest)initWithLibraryTrackDictionary:(id)a3 useArtist:(BOOL)a4
{
  BOOL v4 = a4;
  v16[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)RadioAddStationRequest;
    id v7 = [(RadioSyncRequest *)&v14 init];
    if (v7)
    {
      v7->_persistentID = arc4random();
      v16[0] = v6;
      v15[0] = @"library-track";
      v15[1] = @"use-artist";
      id v8 = [NSNumber numberWithBool:v4];
      v16[1] = v8;
      v15[2] = @"persistent-id";
      objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llx", v7->_persistentID);
      v16[2] = v9;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
      matchDictionary = v7->_matchDictionary;
      v7->_matchDictionary = (NSDictionary *)v10;
    }
    self = v7;
    uint64_t v12 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"libraryTrackDictionary must be non-nil"];
    uint64_t v12 = 0;
  }

  return v12;
}

- (RadioAddStationRequest)initWithStationDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)RadioAddStationRequest;
    id v5 = [(RadioSyncRequest *)&v12 init];
    if (v5)
    {
      v5->_persistentID = arc4random();
      uint64_t v6 = [v4 mutableCopy];
      stationDictionary = v5->_stationDictionary;
      v5->_stationDictionary = (NSMutableDictionary *)v6;

      id v8 = v5->_stationDictionary;
      objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llx", v5->_persistentID);
      [(NSMutableDictionary *)v8 setObject:v9 forKey:@"persistent-id"];
    }
    self = v5;
    uint64_t v10 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"stationDictionary must be non-nil"];
    uint64_t v10 = 0;
  }

  return v10;
}

- (RadioAddStationRequest)initWithStation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dictionaryRepresentation];
  uint64_t v6 = [(RadioAddStationRequest *)self initWithStationDictionary:v5];

  if (v6)
  {
    uint64_t v7 = [v4 stationHash];
    stationHashForSkipHistoryCopying = v6->_stationHashForSkipHistoryCopying;
    v6->_stationHashForSkipHistoryCopying = (NSString *)v7;

    objc_super v9 = +[RadioModel sharedModel];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__RadioAddStationRequest_initWithStation___block_invoke;
    v11[3] = &unk_2643AA1C0;
    id v12 = v4;
    uint64_t v13 = v6;
    [v9 performWriteTransactionWithBlock:v11];
  }
  return v6;
}

uint64_t __42__RadioAddStationRequest_initWithStation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPersistentID:*(void *)(*(void *)(a1 + 40) + 136)];
}

- (RadioAddStationRequest)init
{
  return 0;
}

@end