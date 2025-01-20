@interface BMMultiStreamVectorClockConverter
+ (id)_reinitializeSiteIdentifier:(id)a3;
+ (id)multiStreamRangeClockVectorFromIndexClockVectors:(id)a3;
+ (id)multiStreamTimestampClockVectorToVectorClock:(id)a3;
+ (id)multiStreamVectorClockToTimestampVectorClock:(id)a3;
+ (id)rangeTimestampClockVectorFromIndexClockVector:(id)a3;
+ (id)timestampClockVectorToTimeStampVector:(id)a3;
+ (id)timestampVectorToTimeStampClockVector:(id)a3;
- (BMMultiStreamVectorClockConverter)init;
@end

@implementation BMMultiStreamVectorClockConverter

- (BMMultiStreamVectorClockConverter)init
{
  v3.receiver = self;
  v3.super_class = (Class)BMMultiStreamVectorClockConverter;
  return [(BMMultiStreamVectorClockConverter *)&v3 init];
}

+ (id)_reinitializeSiteIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [v3 modifier];

  if (!v4)
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100044264((uint64_t)v3, v5);
    }
  }
  id v6 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v7 = [v3 identifier];
  v8 = [v3 modifier];
  id v9 = [v6 initWithIdentifier:v7 modifier:v8];

  return v9;
}

+ (id)timestampVectorToTimeStampClockVector:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v16 = v4;
  id v6 = [v4 timestamps];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 siteIdentifierObject];
        id v13 = [objc_alloc((Class)NSIndexSet) initWithIndex:[v11 clockValue]];
        v14 = [a1 _reinitializeSiteIdentifier:v12];
        [v5 addClockValuesInIndexSet:v13 forSiteIdentifier:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)timestampClockVectorToTimeStampVector:(id)a3
{
  id v4 = a3;
  v5 = [v4 allSiteIdentifiers];
  id v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = [a1 _reinitializeSiteIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        v12 = [v4 clockValuesForSiteIdentifier:v11];
        id v13 = [objc_alloc((Class)CKDistributedTimestamp) initWithSiteIdentifierObject:v11 clockValue:[v12 lastIndex]];
        [v6 addObject:v13];
      }
      id v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v14 = [objc_alloc((Class)CKDistributedTimestampVector) initWithTimestamps:v6];

  return v14;
}

+ (id)multiStreamTimestampClockVectorToVectorClock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(BMMultiStreamVectorClock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v3 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v3 timestampClockVectorForStreamIdentifier:v9];
        v12 = +[BMMultiStreamVectorClockConverter timestampClockVectorToTimeStampVector:v11];
        [(BMMultiStreamVectorClock *)v4 setVectorClockTo:v12 forStreamIdentifier:v9];
      }
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)multiStreamVectorClockToTimestampVectorClock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(BMMultiStreamTimestampClockVector);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v3 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v3 vectorClockForStreamIdentifier:v9];
        v12 = +[BMMultiStreamVectorClockConverter timestampVectorToTimeStampClockVector:v11];
        [(BMMultiStreamTimestampClockVector *)v4 setVectorClockTo:v12 forStreamIdentifier:v9];
      }
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)rangeTimestampClockVectorFromIndexClockVector:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v4 allSiteIdentifiers];
  id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = [a1 _reinitializeSiteIdentifier:v10];
        v12 = [v4 clockValuesForSiteIdentifier:v11];
        if ([v12 count] == (id)1)
        {
          id v13 = sub_100006818((uint64_t)[v12 firstIndex]);
          [v5 addClockValuesInIndexSet:v13 forSiteIdentifier:v10];
        }
        else
        {
          [v5 addClockValuesInIndexSet:v12 forSiteIdentifier:v11];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)multiStreamRangeClockVectorFromIndexClockVectors:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(BMMultiStreamTimestampClockVector);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v4 allKeys];
  id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v4 timestampClockVectorForStreamIdentifier:v10];
        id v13 = [a1 rangeTimestampClockVectorFromIndexClockVector:v12];
        [(BMMultiStreamTimestampClockVector *)v5 setVectorClockTo:v13 forStreamIdentifier:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

@end