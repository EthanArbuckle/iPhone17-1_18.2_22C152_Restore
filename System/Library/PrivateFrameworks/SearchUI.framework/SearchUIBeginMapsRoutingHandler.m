@interface SearchUIBeginMapsRoutingHandler
- (id)defaultSymbolName;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIBeginMapsRoutingHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 mapsData];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F30F08];
    v8 = [v5 mapsData];
    v9 = [v7 mapItemWithSerializedPlaceData:v8];
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    v11 = [v5 location];
    [v11 lat];
    double v13 = v12;
    v14 = [v5 location];
    [v14 lng];
    v8 = (void *)[v10 initWithLatitude:v13 longitude:v15];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F30F08]) initWithCLLocation:v8];
    v16 = [v5 name];
    [v9 setName:v16];
  }
  unsigned int v17 = [v5 directionsMode] - 1;
  if (v17 > 4) {
    v18 = (id *)MEMORY[0x1E4F30D40];
  }
  else {
    v18 = (id *)qword_1E6E74500[v17];
  }
  id v19 = *v18;
  if ([v5 shouldSearchDirectionsAlongCurrentRoute])
  {
    uint64_t v20 = *MEMORY[0x1E4F30D88];
    v28[0] = *MEMORY[0x1E4F31130];
    v28[1] = v20;
    v29[0] = MEMORY[0x1E4F1CC38];
    v29[1] = &unk_1F404B0A0;
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    v22 = (id *)v29;
    v23 = v28;
    uint64_t v24 = 2;
  }
  else
  {
    uint64_t v26 = *MEMORY[0x1E4F30D48];
    id v27 = v19;
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    v22 = &v27;
    v23 = &v26;
    uint64_t v24 = 1;
  }
  v25 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v24];
  [v9 openInMapsWithLaunchOptions:v25 completionHandler:0];
}

- (id)defaultSymbolName
{
  v2 = [(SearchUICommandHandler *)self command];
  if ([v2 shouldSearchDirectionsAlongCurrentRoute]) {
    v3 = @"plus.circle";
  }
  else {
    v3 = @"arrow.triangle.turn.up.right.circle";
  }
  v4 = v3;

  return v4;
}

@end