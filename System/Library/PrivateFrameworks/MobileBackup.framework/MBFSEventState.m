@interface MBFSEventState
+ (id)stateForVolumeMountPoints:(id)a3 error:(id *)a4;
- (MBFSEventState)initWithDictionaryRepresentation:(id)a3;
- (NSDate)dateCreated;
- (NSDictionary)eventDatabaseUUIDForVolumeUUID;
- (NSNumber)eventId;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setDateCreated:(id)a3;
- (void)setEventDatabaseUUIDForVolumeUUID:(id)a3;
- (void)setEventId:(id)a3;
@end

@implementation MBFSEventState

- (MBFSEventState)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MBFSEventState;
  v5 = [(MBFSEventState *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dateCreated"];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v5->_dateCreated, v6);
        v7 = [v4 objectForKeyedSubscript:@"eventId"];
        if (v7)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_storeStrong((id *)&v5->_eventId, v7);
            v8 = [v4 objectForKeyedSubscript:@"eventDatabaseUUIDForVolumeUUID"];
            if (v8)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v23 = 0u;
                long long v24 = 0u;
                long long v21 = 0u;
                long long v22 = 0u;
                v19 = v8;
                v9 = v8;
                id v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
                if (v10)
                {
                  id v11 = v10;
                  uint64_t v20 = *(void *)v22;
                  while (2)
                  {
                    v12 = 0;
                    do
                    {
                      if (*(void *)v22 != v20) {
                        objc_enumerationMutation(v9);
                      }
                      uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v12);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0
                        || ([(NSDictionary *)v9 objectForKeyedSubscript:v13],
                            v14 = objc_claimAutoreleasedReturnValue(),
                            objc_opt_class(),
                            char isKindOfClass = objc_opt_isKindOfClass(),
                            v14,
                            (isKindOfClass & 1) == 0))
                      {

                        v8 = v19;
                        goto LABEL_20;
                      }
                      v12 = (char *)v12 + 1;
                    }
                    while (v11 != v12);
                    id v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
                    if (v11) {
                      continue;
                    }
                    break;
                  }
                }

                eventDatabaseUUIDForVolumeUUID = v5->_eventDatabaseUUIDForVolumeUUID;
                v5->_eventDatabaseUUIDForVolumeUUID = v9;

                goto LABEL_18;
              }
            }
LABEL_20:
          }
        }
      }
    }

    v17 = 0;
    goto LABEL_23;
  }
LABEL_18:
  v17 = v5;
LABEL_23:

  return v17;
}

- (id)dictionaryRepresentation
{
  long long v2 = *(_OWORD *)&self->_dateCreated;
  v5[0] = @"dateCreated";
  v5[1] = @"eventId";
  long long v6 = v2;
  v5[2] = @"eventDatabaseUUIDForVolumeUUID";
  eventDatabaseUUIDForVolumeUUID = self->_eventDatabaseUUIDForVolumeUUID;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:v5 count:3];
  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; dateCreated=%@ eventId=%@ eventDatabaseUUIDForVolumeUUID=%@>",
           class_getName(v3),
           self,
           self->_dateCreated,
           self->_eventId,
           self->_eventDatabaseUUIDForVolumeUUID);
}

+ (id)stateForVolumeMountPoints:(id)a3 error:(id *)a4
{
  id v5 = a3;
  long long v6 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
      uint64_t v13 = +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:v12 error:a4];
      if (!v13) {
        goto LABEL_18;
      }
      v14 = (void *)v13;
      memset(&v27, 0, sizeof(v27));
      id v15 = v12;
      if (stat((const char *)[v15 fileSystemRepresentation], &v27)) {
        break;
      }
      uint64_t st_dev = v27.st_dev;
      CFUUIDRef v17 = FSEventsCopyUUIDForDevice(v27.st_dev);
      if (!v17)
      {
        if (a4)
        {
          objc_super v25 = +[MBError errorWithCode:4, @"FSEventsCopyUUIDForDevice returned nil for device %d", st_dev format];
LABEL_16:
          *a4 = v25;
        }
        goto LABEL_17;
      }
      CFUUIDRef v18 = v17;
      v19 = (__CFString *)CFUUIDCreateString(0, v17);
      CFRelease(v18);
      uint64_t v20 = [v14 UUIDString];
      [v6 setObject:v19 forKeyedSubscript:v20];

      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    long long v24 = __error();
    if (a4)
    {
      objc_super v25 = +[MBError errorWithErrno:*v24 path:v15 format:@"stat error"];
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    long long v21 = 0;
    goto LABEL_19;
  }
LABEL_11:

  long long v21 = objc_opt_new();
  long long v22 = +[NSDate now];
  [v21 setDateCreated:v22];

  long long v23 = +[NSNumber numberWithUnsignedLongLong:FSEventsGetCurrentEventId()];
  [v21 setEventId:v23];

  [v21 setEventDatabaseUUIDForVolumeUUID:v6];
LABEL_19:

  return v21;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (NSNumber)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
}

- (NSDictionary)eventDatabaseUUIDForVolumeUUID
{
  return self->_eventDatabaseUUIDForVolumeUUID;
}

- (void)setEventDatabaseUUIDForVolumeUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDatabaseUUIDForVolumeUUID, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end