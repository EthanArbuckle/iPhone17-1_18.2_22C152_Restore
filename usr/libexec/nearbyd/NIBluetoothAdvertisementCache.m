@interface NIBluetoothAdvertisementCache
- (BOOL)isSampleInCache:(id)a3;
- (NIBluetoothAdvertisementCache)init;
- (NSArray)allSamples;
- (double)flushIntervalSeconds;
- (double)maximumSampleAgeSeconds;
- (id)cachedSamplesForIdentifier:(id)a3;
- (int64_t)maximumSampleCount;
- (void)addSample:(id)a3;
- (void)clear;
- (void)removeStaleSamples;
- (void)setFlushIntervalSeconds:(double)a3;
- (void)setMaximumSampleAgeSeconds:(double)a3;
- (void)setMaximumSampleCount:(int64_t)a3;
@end

@implementation NIBluetoothAdvertisementCache

- (NIBluetoothAdvertisementCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)NIBluetoothAdvertisementCache;
  v2 = [(NIBluetoothAdvertisementCache *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_maximumSampleCount = 8;
    v2->_maximumSampleAgeSeconds = 1200.0;
    mach_continuous_time();
    TMConvertTicksToSeconds();
    v2->_lastCacheFlushSeconds = v5;
    v2->_flushIntervalSeconds = 60.0;
  }
  return v2;
}

- (NSArray)allSamples
{
  v3 = +[NSMutableArray array];
  cache = self->_cache;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BEEFC;
  v7[3] = &unk_1008577D8;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)cache enumerateKeysAndObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

- (void)addSample:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];

  if (v5)
  {
    cache = self->_cache;
    objc_super v7 = [v4 identifier];
    id v8 = [(NSMutableDictionary *)cache objectForKey:v7];

    if (!v8)
    {
      v9 = self->_cache;
      v10 = +[NSMutableArray array];
      v11 = [v4 identifier];
      [(NSMutableDictionary *)v9 setObject:v10 forKey:v11];
    }
    v12 = self->_cache;
    v13 = [v4 identifier];
    v14 = [(NSMutableDictionary *)v12 objectForKey:v13];

    [v14 addObject:v4];
    [(NIBluetoothAdvertisementCache *)self removeStaleSamples];
    if ((unint64_t)[v14 count] > self->_maximumSampleCount) {
      [v14 removeObjectsInRange:0, (char *)[v14 count] - self->_maximumSampleCount];
    }
  }
  else
  {
    v15 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_100419E58(v15);
    }
  }
}

- (BOOL)isSampleInCache:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];

  if (v5)
  {
    cache = self->_cache;
    objc_super v7 = [v4 identifier];
    id v8 = [(NSMutableDictionary *)cache objectForKey:v7];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v8;
    id v5 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v9);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned int v13 = [v4 channel:v21];
          if (v13 == [v12 channel])
          {
            [v4 rssi];
            double v15 = v14;
            [v12 rssi];
            if (v15 == v16)
            {
              [v4 machContinuousTimeSeconds];
              double v18 = v17;
              [v12 machContinuousTimeSeconds];
              if (vabdd_f64(v18, v19) < 0.001)
              {
                LOBYTE(v5) = 1;
                goto LABEL_14;
              }
            }
          }
        }
        id v5 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return (char)v5;
}

- (void)removeStaleSamples
{
  mach_continuous_time();
  TMConvertTicksToSeconds();
  double v4 = v3;
  if (v3 - self->_lastCacheFlushSeconds > self->_flushIntervalSeconds)
  {
    self->_lastCacheFlushSeconds = v3;
    double v5 = v3 - self->_maximumSampleAgeSeconds;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001BF494;
    v23[3] = &unk_1008577F8;
    *(double *)&v23[4] = v5;
    v6 = +[NSPredicate predicateWithBlock:v23];
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = self->_cache;
    id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          double v14 = -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v13, (void)v19);
          [v14 filterUsingPredicate:v6];
          if (![v14 count]) {
            [v7 addObject:v13];
          }
        }
        id v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v10);
    }

    if (v7 && [v7 count])
    {
      [(NSMutableDictionary *)self->_cache removeObjectsForKeys:v7];
      double v15 = (void *)qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = v15;
        id v17 = [v7 count];
        mach_continuous_time();
        TMConvertTicksToSeconds();
        *(_DWORD *)buf = 134218240;
        id v25 = v17;
        __int16 v26 = 2048;
        double v27 = v18 - v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Purged %lu devices from Bluetooth advertisement cache in %f seconds.", buf, 0x16u);
      }
    }
  }
}

- (id)cachedSamplesForIdentifier:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_cache objectForKey:a3];
  id v4 = [v3 copy];

  return v4;
}

- (void)clear
{
}

- (int64_t)maximumSampleCount
{
  return self->_maximumSampleCount;
}

- (void)setMaximumSampleCount:(int64_t)a3
{
  self->_maximumSampleCount = a3;
}

- (double)maximumSampleAgeSeconds
{
  return self->_maximumSampleAgeSeconds;
}

- (void)setMaximumSampleAgeSeconds:(double)a3
{
  self->_maximumSampleAgeSeconds = a3;
}

- (double)flushIntervalSeconds
{
  return self->_flushIntervalSeconds;
}

- (void)setFlushIntervalSeconds:(double)a3
{
  self->_flushIntervalSeconds = a3;
}

- (void).cxx_destruct
{
}

@end