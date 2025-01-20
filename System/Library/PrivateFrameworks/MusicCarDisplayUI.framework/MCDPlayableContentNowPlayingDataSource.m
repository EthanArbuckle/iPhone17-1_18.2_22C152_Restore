@interface MCDPlayableContentNowPlayingDataSource
- (id)_itemProperties;
- (id)requestLabel;
@end

@implementation MCDPlayableContentNowPlayingDataSource

- (id)_itemProperties
{
  v39[1] = *MEMORY[0x263EF8340];
  id v28 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v38 = *MEMORY[0x263F11A18];
  id v2 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v3 = *MEMORY[0x263F11820];
  v37[0] = *MEMORY[0x263F11880];
  v37[1] = v3;
  uint64_t v4 = *MEMORY[0x263F11838];
  v37[2] = *MEMORY[0x263F11840];
  v37[3] = v4;
  uint64_t v5 = *MEMORY[0x263F117F8];
  v37[4] = *MEMORY[0x263F11830];
  v37[5] = v5;
  uint64_t v6 = *MEMORY[0x263F11868];
  v37[6] = *MEMORY[0x263F11818];
  v37[7] = v6;
  uint64_t v7 = *MEMORY[0x263F11870];
  v37[8] = *MEMORY[0x263F11860];
  v37[9] = v7;
  v37[10] = *MEMORY[0x263F117F0];
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:11];
  v35[0] = *MEMORY[0x263F11AA8];
  v8 = (void *)MEMORY[0x263F12180];
  uint64_t v34 = *MEMORY[0x263F114F8];
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  v26 = [v8 propertySetWithProperties:v27];
  v36[0] = v26;
  v35[1] = *MEMORY[0x263F11A98];
  id v9 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v33 = *MEMORY[0x263F114C0];
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  uint64_t v31 = *MEMORY[0x263F11990];
  v10 = (void *)MEMORY[0x263F12180];
  uint64_t v30 = *MEMORY[0x263F114F0];
  uint64_t v11 = v30;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  v12 = [v10 propertySetWithProperties:v24];
  v32 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v14 = (void *)[v9 initWithProperties:v23 relationships:v13];
  v36[1] = v14;
  v35[2] = *MEMORY[0x263F11AA0];
  v15 = (void *)MEMORY[0x263F12180];
  uint64_t v29 = v11;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  v17 = [v15 propertySetWithProperties:v16];
  v36[2] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
  v19 = (void *)[v2 initWithProperties:v25 relationships:v18];
  v39[0] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  v21 = (void *)[v28 initWithProperties:0 relationships:v20];

  return v21;
}

- (id)requestLabel
{
  return @"CarPlay Now Playing Request - Playable Content";
}

@end