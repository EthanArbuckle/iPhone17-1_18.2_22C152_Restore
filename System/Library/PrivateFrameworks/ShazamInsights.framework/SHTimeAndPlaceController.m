@interface SHTimeAndPlaceController
- (SHDataFetcher)dataFetcher;
- (void)affinityGroupsFromData:(id)a3 atLocation:(id)a4 onDate:(id)a5 configuration:(id)a6 completionHandler:(id)a7;
@end

@implementation SHTimeAndPlaceController

- (void)affinityGroupsFromData:(id)a3 atLocation:(id)a4 onDate:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a7;
  id v22 = 0;
  v13 = +[SHTimeAndPlaceServerResponseParser regionAffinityGroupsFromServerData:a3 error:&v22];
  id v14 = v22;
  if (v13)
  {
    v15 = [MEMORY[0x263EFF980] array];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __101__SHTimeAndPlaceController_affinityGroupsFromData_atLocation_onDate_configuration_completionHandler___block_invoke;
    v17[3] = &unk_2647AD028;
    id v21 = v12;
    id v18 = v10;
    id v19 = v13;
    id v20 = v15;
    id v16 = v15;
    [v11 geoHashLengthsWithCompletionHandler:v17];
  }
  else
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v14);
  }
}

void __101__SHTimeAndPlaceController_affinityGroupsFromData_atLocation_onDate_configuration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a4)
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "sh_geohashOfLength:");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "regionsForGeohash:", v6, (void)v19);
          uint64_t v14 = [v13 count];

          if (v14)
          {
            v15 = *(void **)(a1 + 48);
            id v16 = [v12 affinityGroup];
            [v15 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = (void *)[*(id *)(a1 + 48) copy];
    (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, 0);
  }
}

- (SHDataFetcher)dataFetcher
{
  return self->_dataFetcher;
}

- (void).cxx_destruct
{
}

@end