@interface WFNextHourPrecipitation(WeatherAdditions)
- (id)dictionaryRepresentation;
- (uint64_t)initWithDictionary:()WeatherAdditions;
@end

@implementation WFNextHourPrecipitation(WeatherAdditions)

- (uint64_t)initWithDictionary:()WeatherAdditions
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKey:0x26DAE1530];
  unint64_t v5 = [v4 unsignedIntegerValue];

  if (v5) {
    [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v5];
  }
  else {
  v39 = [MEMORY[0x263EFF910] distantPast];
  }
  v6 = [v3 objectForKey:0x26DAE1550];
  unint64_t v7 = [v6 unsignedIntegerValue];

  if (v7) {
    [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v7];
  }
  else {
  v38 = [MEMORY[0x263EFF910] distantPast];
  }
  v8 = [v3 objectForKey:0x26DAE1570];
  unint64_t v9 = [v8 unsignedIntegerValue];

  if (v9) {
    [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v9];
  }
  else {
  v37 = [MEMORY[0x263EFF910] distantPast];
  }
  v10 = [v3 objectForKey:0x26DAE1590];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)[objc_alloc(MEMORY[0x263F85F50]) initWithDictionary:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v14);
  }
  v36 = v12;

  v18 = [v3 objectForKey:0x26DAE15B0];
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(objc_alloc(MEMORY[0x263F85F48]), "initWithDictionary:", *(void *)(*((void *)&v46 + 1) + 8 * j), v36);
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v22);
  }

  v41 = v3;
  v26 = [v3 objectForKey:0x26DAE15D0];
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v28 = v26;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = (void *)[objc_alloc(MEMORY[0x263F85F40]) initWithDictionary:*(void *)(*((void *)&v42 + 1) + 8 * k)];
        [v27 addObject:v33];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v30);
  }

  uint64_t v34 = [a1 initWithReadDate:v39 startDate:v38 expirationDate:v37 minutes:v11 conditions:v27 descriptions:v19];
  return v34;
}

- (id)dictionaryRepresentation
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v2 = NSNumber;
  id v3 = [a1 readDate];
  [v3 timeIntervalSince1970];
  v33 = objc_msgSend(v2, "numberWithDouble:");

  v4 = NSNumber;
  unint64_t v5 = [a1 startDate];
  [v5 timeIntervalSince1970];
  v32 = objc_msgSend(v4, "numberWithDouble:");

  v6 = NSNumber;
  unint64_t v7 = [a1 expirationDate];
  [v7 timeIntervalSince1970];
  v8 = objc_msgSend(v6, "numberWithDouble:");

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v10 = [a1 minutes];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "dictionaryRepresentation", v32);
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v12);
  }

  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v17 = [a1 precipitationDescriptions];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * j), "dictionaryRepresentation", v32);
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v19);
  }

  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v24 = [a1 conditions];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * k), "dictionaryRepresentation", v32);
        [v23 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v48 count:16];
    }
    while (v26);
  }

  v46[0] = 0x26DAE1530;
  v46[1] = 0x26DAE1550;
  v47[0] = v33;
  v47[1] = v32;
  v46[2] = 0x26DAE1570;
  v46[3] = 0x26DAE1590;
  v47[2] = v8;
  v47[3] = v9;
  v46[4] = 0x26DAE15B0;
  v46[5] = 0x26DAE15D0;
  v47[4] = v16;
  v47[5] = v23;
  uint64_t v30 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:6];

  return v30;
}

@end