@interface PersistenceManager
+ (id)sharedManager;
- (BOOL)_writeDirectionsCache:(id)a3 error:(id *)a4;
- (BOOL)addDataToDirectionsCache:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)writePins:(id)a3 error:(id *)a4;
- (BOOL)writeRoutingAppLaunchRecord:(id)a3 error:(id *)a4;
- (PersistenceManager)initWithPersistenceData:(id)a3;
- (id)cacheKeyForWaypoints:(id)a3;
- (id)directionsCache;
- (id)directionsCacheDataArrayForKey:(id)a3;
- (id)readPins;
- (id)readRoutingAppLaunchRecord;
- (void)_cleanDirectionsCache;
- (void)_deleteDirectionsCacheFile;
- (void)_syncDirectionsCacheIfNeeded;
- (void)dealloc;
- (void)deleteRoutingAppLaunchRecord;
@end

@implementation PersistenceManager

+ (id)sharedManager
{
  if (qword_10160F128 != -1) {
    dispatch_once(&qword_10160F128, &stru_1012EF2C0);
  }
  v2 = (void *)qword_10160F120;

  return v2;
}

- (PersistenceManager)initWithPersistenceData:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PersistenceManager;
  v6 = [(PersistenceManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locations, a3);
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"_syncDirectionsCacheIfNeeded" name:UIApplicationProtectedDataDidBecomeAvailable object:0];

    v9 = +[GEOResourceManifestManager modernManager];
    [v9 addTileGroupObserver:v7 queue:&_dispatch_main_q];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[GEOResourceManifestManager modernManager];
  [v3 removeTileGroupObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PersistenceManager;
  [(PersistenceManager *)&v5 dealloc];
}

- (id)readPins
{
  v2 = [(MSPMapsPaths *)self->_locations pinsSettingsPath];
  v3 = +[NSDictionary dictionaryWithContentsOfFile:v2];

  v4 = [v3 objectForKeyedSubscript:@"PinsKey"];
  objc_super v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_alloc((Class)MSPPinStorage);
        id v13 = [v12 initWithData:v11];
        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = +[NSArray arrayWithArray:v5];

  return v14;
}

- (BOOL)writePins:(id)a3 error:(id *)a4
{
  id v6 = [a3 arrayByApplyingSelector:"data"];
  v13[0] = @"PinsKey";
  v13[1] = @"PinsVersion";
  v14[0] = v6;
  v14[1] = &off_1013A78A0;
  id v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v8 = [(MSPMapsPaths *)self->_locations pinsSettingsPath];
  id v12 = 0;
  unsigned __int8 v9 = [v7 _maps_writeBinaryPlist:v8 error:&v12];
  id v10 = v12;

  if (*a4) {
    *a4 = v10;
  }

  return v9;
}

- (id)readRoutingAppLaunchRecord
{
  v3 = [(MSPMapsPaths *)self->_locations routingAppLaunchRecordPath];
  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    uint64_t v12 = 0;
    id v6 = +[NSData dataWithContentsOfFile:v3 options:1 error:&v12];
    if (v12) {
      [(PersistenceManager *)self deleteRoutingAppLaunchRecord];
    }
    if (v6)
    {
      id v11 = 0;
      id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
      id v8 = v11;
      if (!v8) {
        goto LABEL_9;
      }
      unsigned __int8 v9 = v8;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_alloc_init(RoutingAppLaunchRecord);
LABEL_9:

  return v7;
}

- (BOOL)writeRoutingAppLaunchRecord:(id)a3 error:(id *)a4
{
  locations = self->_locations;
  id v7 = a3;
  id v8 = [(MSPMapsPaths *)locations routingAppLaunchRecordPath];
  [(PersistenceManager *)self deleteRoutingAppLaunchRecord];
  unsigned __int8 v9 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];

  if (v9)
  {
    id v14 = 0;
    BOOL v10 = 1;
    [v9 writeToFile:v8 options:1 error:&v14];
    id v11 = v14;
    uint64_t v12 = v11;
    if (v11)
    {
      if (*a4)
      {
        BOOL v10 = 0;
        *a4 = v11;
      }
      else
      {
        BOOL v10 = 1;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)deleteRoutingAppLaunchRecord
{
  id v5 = +[NSFileManager defaultManager];
  v3 = [(MSPMapsPaths *)self->_locations routingAppLaunchRecordPath];
  if ([v5 fileExistsAtPath:v3])
  {
    v4 = +[NSFileManager defaultManager];
    [v4 removeItemAtPath:v3 error:0];
  }
}

- (id)cacheKeyForWaypoints:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = @"T";
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v9 isCurrentLocation])
        {
          [(__CFString *)v6 stringByAppendingString:@"|C"];
          BOOL v10 = v6;
          id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v11 = [v9 locationForWaypoint];
          if (!v11)
          {

            long long v17 = 0;
            goto LABEL_16;
          }
          BOOL v10 = v11;
          [(__CFString *)v11 lat];
          uint64_t v13 = v12;
          [(__CFString *)v10 lng];
          v15 = +[NSString stringWithFormat:@"|%f%f", v13, v14, (void)v19];
          uint64_t v16 = [(__CFString *)v6 stringByAppendingString:v15];

          id v6 = (__CFString *)v16;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = @"T";
  }

  id v6 = v6;
  long long v17 = v6;
LABEL_16:

  return v17;
}

- (BOOL)addDataToDirectionsCache:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(PersistenceManager *)self _cleanDirectionsCache];
  id v10 = [v8 count];
  if (v9) {
    BOOL v11 = v10 == (id)2;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(PersistenceManager *)self directionsCache];
    id v14 = [v13 mutableCopy];

    v21[0] = @"d";
    v15 = +[NSDate date];
    v21[1] = @"a";
    v22[0] = v15;
    v22[1] = v8;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

    [v14 setObject:v16 forKeyedSubscript:v9];
    if ([(PersistenceManager *)self _writeDirectionsCache:v14 error:a5])
    {
      long long v17 = +[NSDictionary dictionaryWithDictionary:v14];
      directionsCache = self->_directionsCache;
      self->_directionsCache = v17;
    }
    else
    {
      objc_storeStrong((id *)&self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked, a4);
      long long v19 = v16;
      directionsCache = self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked;
      self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = v19;
    }
  }
  return v12;
}

- (id)directionsCacheDataArrayForKey:(id)a3
{
  id v4 = a3;
  [(PersistenceManager *)self _cleanDirectionsCache];
  id v5 = [(PersistenceManager *)self directionsCache];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:@"a"];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)directionsCache
{
  directionsCache = self->_directionsCache;
  if (directionsCache)
  {
    id v3 = directionsCache;
LABEL_8:
    long long v19 = v3;
    goto LABEL_9;
  }
  id v5 = +[UIApplication sharedApplication];
  unsigned __int8 v6 = [v5 isProtectedDataAvailable];

  if ((v6 & 1) == 0)
  {
    id v3 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    goto LABEL_8;
  }
  uint64_t v7 = [(MSPMapsPaths *)self->_locations directionsCachePath];
  id v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    uint64_t v24 = 0;
    uint64_t v10 = +[NSData dataWithContentsOfFile:v7 options:1 error:&v24];
    if (v10)
    {
      BOOL v11 = (void *)v10;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
      long long v17 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v16 fromData:v11 error:0];
      long long v18 = self->_directionsCache;
      self->_directionsCache = v17;
    }
    else
    {
      [(PersistenceManager *)self _deleteDirectionsCacheFile];
    }
  }
  long long v21 = self->_directionsCache;
  if (!v21)
  {
    long long v22 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    v23 = self->_directionsCache;
    self->_directionsCache = v22;

    long long v21 = self->_directionsCache;
  }
  long long v19 = v21;

LABEL_9:

  return v19;
}

- (void)_syncDirectionsCacheIfNeeded
{
  if (self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked)
  {
    id v3 = [(PersistenceManager *)self directionsCache];
    id v4 = [v3 mutableCopy];

    [v4 setObject:self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked forKeyedSubscript:self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked];
    id v9 = 0;
    unsigned int v5 = [(PersistenceManager *)self _writeDirectionsCache:v4 error:&v9];
    id v6 = v9;
    if (v5)
    {
      directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked;
      self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = 0;

      directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked;
      self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = 0;
    }
  }
}

- (BOOL)_writeDirectionsCache:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[UIApplication sharedApplication];
  unsigned __int8 v8 = [v7 isProtectedDataAvailable];

  if (v8)
  {
    id v9 = [(MSPMapsPaths *)self->_locations directionsCachePath];
    [(PersistenceManager *)self _deleteDirectionsCacheFile];
    uint64_t v10 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    BOOL v11 = v10;
    if (v10)
    {
      id v16 = 0;
      [v10 writeToFile:v9 options:536870913 error:&v16];
      id v12 = v16;
      uint64_t v13 = v12;
      if (v12 && *a4)
      {
        BOOL v14 = 0;
        *a4 = v12;
      }
      else
      {
        BOOL v14 = 1;
      }
    }
    else if (a4)
    {
      +[NSError errorWithDomain:NSCocoaErrorDomain code:256 userInfo:0];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else if (a4)
  {
    +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:0];
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_cleanDirectionsCache
{
  if (self->_directionsCache)
  {
    id v3 = objc_alloc((Class)NSMutableDictionary);
    id v4 = [(PersistenceManager *)self directionsCache];
    id v18 = [v3 initWithCapacity:[v4 count]];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(PersistenceManager *)self directionsCache];
    id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        unsigned __int8 v8 = 0;
        do
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v8);
          uint64_t v10 = [(PersistenceManager *)self directionsCache];
          BOOL v11 = [v10 objectForKeyedSubscript:v9];

          id v12 = [v11 objectForKeyedSubscript:@"d"];
          GEOConfigGetDouble();
          BOOL v14 = +[NSDate dateWithTimeIntervalSinceNow:-v13];
          id v15 = [v12 compare:v14];

          if (v15 == (id)1) {
            [v18 setObject:v11 forKeyedSubscript:v9];
          }

          unsigned __int8 v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    id v16 = +[NSDictionary dictionaryWithDictionary:v18];
    directionsCache = self->_directionsCache;
    self->_directionsCache = v16;
  }
}

- (void)_deleteDirectionsCacheFile
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(MSPMapsPaths *)self->_locations directionsCachePath];
  if ([v3 fileExistsAtPath:v4])
  {
    id v5 = +[NSFileManager defaultManager];
    uint64_t v6 = 0;
    [v5 removeItemAtPath:v4 error:&v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked, 0);
  objc_storeStrong((id *)&self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked, 0);
  objc_storeStrong((id *)&self->_directionsCache, 0);

  objc_storeStrong((id *)&self->_locations, 0);
}

@end