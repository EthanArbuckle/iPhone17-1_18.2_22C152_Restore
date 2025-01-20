@interface TAFilterObservationAggregator
+ (id)aggregateObservationsThroughHistoryForDetectionResults:(id)a3 visitSnapshotBuffer:(id)a4 intervisitSnapshotBuffer:(id)a5 clock:(id)a6;
+ (id)aggregateObservationsThroughHistoryForSingleDetection:(id)a3 visitSnapshotBuffer:(id)a4 intervisitSnapshotBuffer:(id)a5 clock:(id)a6;
+ (id)location:(id)a3 withAdvertisementTimestamp:(id)a4;
+ (void)attachAISInfo:(id)a3 deviceRecord:(id)a4;
@end

@implementation TAFilterObservationAggregator

+ (void)attachAISInfo:(id)a3 deviceRecord:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v11 address];
        v13 = [v6 getAccessoryInfo:v12];

        [v11 setAccessoryInfo:v13];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (id)aggregateObservationsThroughHistoryForDetectionResults:(id)a3 visitSnapshotBuffer:(id)a4 intervisitSnapshotBuffer:(id)a5 clock:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = +[TAFilterObservationAggregator aggregateObservationsThroughHistoryForSingleDetection:visitSnapshotBuffer:intervisitSnapshotBuffer:clock:](TAFilterObservationAggregator, "aggregateObservationsThroughHistoryForSingleDetection:visitSnapshotBuffer:intervisitSnapshotBuffer:clock:", *(void *)(*((void *)&v21 + 1) + 8 * i), v10, v11, v12, (void)v21);
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v13;
}

+ (id)location:(id)a3 withAdvertisementTimestamp:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [TALocationLite alloc];
  uint64_t v8 = [v5 scanDate];

  [v6 latitude];
  double v41 = v9;
  [v6 longitude];
  double v40 = v10;
  [v6 horizontalAccuracy];
  double v39 = v11;
  [v6 altitude];
  double v38 = v12;
  [v6 verticalAccuracy];
  double v37 = v13;
  [v6 speed];
  double v36 = v14;
  [v6 speedAccuracy];
  double v35 = v15;
  [v6 course];
  double v17 = v16;
  [v6 courseAccuracy];
  uint64_t v19 = v18;
  [v6 deltaDistance];
  uint64_t v21 = v20;
  [v6 deltaDistanceAccuracy];
  uint64_t v23 = v22;
  [v6 groundAltitude];
  uint64_t v25 = v24;
  [v6 groundAltitudeUncertainty];
  uint64_t v27 = v26;
  [v6 pressure];
  uint64_t v29 = v28;
  [v6 pressureUncertainty];
  uint64_t v31 = v30;
  uint64_t v32 = [v6 isSimulatedOrSpoofed];

  v33 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:](v7, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", v8, v32, v41, v40, v39, v38, v37, v36, v35, v17, v19, v21, v23, v25, v27,
          v29,
          v31);

  return v33;
}

+ (id)aggregateObservationsThroughHistoryForSingleDetection:(id)a3 visitSnapshotBuffer:(id)a4 intervisitSnapshotBuffer:(id)a5 clock:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = 0;
  if (v9 && v12)
  {
    id v50 = v12;
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v51 = v10;
    if (v10)
    {
      id v49 = v11;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obuint64_t j = [v10 bufferCopy];
      uint64_t v15 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v59 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            uint64_t v20 = [v19 earliestUtAdvertisements];
            uint64_t v21 = [v9 address];
            uint64_t v22 = [v20 objectForKeyedSubscript:v21];

            uint64_t v23 = [v19 latestUtAdvertisements];
            uint64_t v24 = [v9 address];
            uint64_t v25 = [v23 objectForKeyedSubscript:v24];

            uint64_t v26 = [v19 getLocationRepresentingSnapshot];
            if (v22)
            {
              uint64_t v27 = +[TAFilterObservationAggregator location:v26 withAdvertisementTimestamp:v22];
              [v14 addObject:v27];
            }
            if (v25 && ([v25 isEqual:v22] & 1) == 0)
            {
              uint64_t v28 = +[TAFilterObservationAggregator location:v26 withAdvertisementTimestamp:v25];
              [v14 addObject:v28];
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
        }
        while (v16);
      }

      id v11 = v49;
    }
    if (v11)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v29 = [v11 bufferCopy];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v55 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = [*(id *)(*((void *)&v54 + 1) + 8 * j) accumulatedDeviceMetrics];
            double v35 = [v9 address];
            double v36 = [v34 objectForKeyedSubscript:v35];

            if (v36)
            {
              double v37 = [v36 sampledObservedLocations];
              [v14 addObjectsFromArray:v37];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v31);
      }
    }
    double v38 = [v9 locationHistory];
    [v14 addObjectsFromArray:v38];

    obja = [TASuspiciousDevice alloc];
    double v39 = [v9 latestAdvertisement];
    double v40 = [v9 detectionSummary];
    double v41 = (void *)[v14 copy];
    v42 = [v9 detectionMetrics];
    uint64_t v43 = [v9 detectionType];
    id v44 = v11;
    uint64_t v45 = [v9 immediacyType];
    v46 = [v9 accessoryInfo];
    uint64_t v48 = v45;
    id v11 = v44;
    double v13 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](obja, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v39, v40, v50, v41, v42, v43, v48, v46, [v9 forceSurfaceReason]);

    id v12 = v50;
    id v10 = v51;
  }

  return v13;
}

@end