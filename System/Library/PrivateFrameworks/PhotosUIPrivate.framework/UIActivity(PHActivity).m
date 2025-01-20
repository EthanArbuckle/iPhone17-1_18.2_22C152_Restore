@interface UIActivity(PHActivity)
+ (id)ph_PhotosApplicationActivitiesTypePublish:()PHActivity;
+ (id)ph_PhotosApplicationActivityTypeOrder;
@end

@implementation UIActivity(PHActivity)

+ (id)ph_PhotosApplicationActivityTypeOrder
{
  v0 = (void *)MEMORY[0x1E4F1CA48];
  v1 = +[PUActivityViewController defaultActivityTypeOrder];
  v2 = [v0 arrayWithArray:v1];

  [v2 insertObject:*MEMORY[0x1E4F90B08] atIndex:2];
  return v2;
}

+ (id)ph_PhotosApplicationActivitiesTypePublish:()PHActivity
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v15 = +[PUActivityViewController photosApplicationActivities:](PUActivityViewController, "photosApplicationActivities:");
  v27[0] = *MEMORY[0x1E4F90948];
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v1 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v0;
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v4 = v15;
        uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v6; ++j)
            {
              if (*(void *)v18 != v7) {
                objc_enumerationMutation(v4);
              }
              v9 = *(void **)(*((void *)&v17 + 1) + 8 * j);
              v10 = [v9 activityType];
              int v11 = [v10 isEqualToString:v3];

              if (v11) {
                [v1 addObject:v9];
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v6);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }

  return v1;
}

@end