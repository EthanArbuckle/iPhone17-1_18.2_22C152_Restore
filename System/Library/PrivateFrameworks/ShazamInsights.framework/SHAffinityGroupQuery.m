@interface SHAffinityGroupQuery
+ (void)affinityGroupsForLocation:(id)a3 atDate:(id)a4 completionHandler:(id)a5;
+ (void)affinityGroupsForLocation:(id)a3 atDate:(id)a4 configuration:(id)a5 completionHandler:(id)a6;
@end

@implementation SHAffinityGroupQuery

+ (void)affinityGroupsForLocation:(id)a3 atDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke;
  v14[3] = &unk_2647ACFB0;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v18 = a1;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  +[SHInsightsConfiguration fetchSharedInstanceWithCompletion:v14];
}

uint64_t __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 56) affinityGroupsForLocation:*(void *)(a1 + 32) atDate:*(void *)(a1 + 40) configuration:a2 completionHandler:*(void *)(a1 + 48)];
}

+ (void)affinityGroupsForLocation:(id)a3 atDate:(id)a4 configuration:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_configuration_completionHandler___block_invoke;
  v17[3] = &unk_2647AD028;
  id v18 = v11;
  id v19 = v10;
  id v20 = v9;
  id v21 = v12;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  [v15 geoHashLengthsWithCompletionHandler:v17];
}

void __89__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_configuration_completionHandler___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    v5 = (void (*)(void))*((void *)a1[7] + 2);
    v5();
  }
  else
  {
    id v6 = a1[4];
    id v7 = a1[5];
    id v8 = objc_msgSend(a1[6], "sh_geohashOfLength:", a2);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __89__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_configuration_completionHandler___block_invoke_2;
    v9[3] = &unk_2647AD000;
    id v13 = a1[7];
    id v10 = a1[6];
    id v11 = a1[5];
    id v12 = a1[4];
    [v6 geoChartsEndpointForDate:v7 geoHash:v8 completionHandler:v9];
  }
}

void __89__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_configuration_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[SHDataFetcherFileInfo dataFetcherForSourceURL:v3];
    id v5 = a1[4];
    id v6 = a1[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __89__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_configuration_completionHandler___block_invoke_3;
    v7[3] = &unk_2647ACFD8;
    id v11 = a1[7];
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = a1[6];
    [v4 clusterDataAtURL:v3 forLocation:v5 date:v6 completionHandler:v7];
  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }
}

void __89__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_configuration_completionHandler___block_invoke_3(void *a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v3 = objc_alloc_init(SHTimeAndPlaceController);
    v4 = [v5 data];
    [(SHTimeAndPlaceController *)v3 affinityGroupsFromData:v4 atLocation:a1[4] onDate:a1[5] configuration:a1[6] completionHandler:a1[7]];
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

@end