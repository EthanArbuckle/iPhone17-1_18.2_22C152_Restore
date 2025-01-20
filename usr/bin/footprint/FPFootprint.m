@interface FPFootprint
- (id)ioAccelMemoryInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4 error:(id *)a5;
- (id)ioSurfaceExtendedInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4;
- (void)dealloc;
@end

@implementation FPFootprint

- (void)dealloc
{
  memoryObjects = self->_memoryObjects;
  if (memoryObjects) {
    CFRelease(memoryObjects);
  }
  sharedCacheMemoryObjectsTable = self->_sharedCacheMemoryObjectsTable;
  self->_sharedCacheMemoryObjectsTable = 0;

  textMemoryObjects = self->_textMemoryObjects;
  if (textMemoryObjects) {
    CFRelease(textMemoryObjects);
  }
  linkeditMemoryObjects = self->_linkeditMemoryObjects;
  if (linkeditMemoryObjects) {
    CFRelease(linkeditMemoryObjects);
  }
  v7.receiver = self;
  v7.super_class = (Class)FPFootprint;
  [(FPFootprint *)&v7 dealloc];
}

- (id)ioSurfaceExtendedInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_allPIDsIOSurfaceDescriptionsLock = &self->_allPIDsIOSurfaceDescriptionsLock;
  os_unfair_lock_lock(&self->_allPIDsIOSurfaceDescriptionsLock);
  allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  if (!allPIDsIOSurfaceDescriptions)
  {
    v9 = +[IOSurfaceDebugDescription surfaceDescriptions];
    v10 = self->_allPIDsIOSurfaceDescriptions;
    self->_allPIDsIOSurfaceDescriptions = v9;

    allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  }
  v11 = +[NSNumber numberWithInt:v4];
  v12 = [(NSDictionary *)allPIDsIOSurfaceDescriptions objectForKey:v11];

  os_unfair_lock_unlock(p_allPIDsIOSurfaceDescriptionsLock);
  if (v12)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100014964;
    v25[3] = &unk_100029D60;
    v25[4] = a3;
    v13 = +[NSPredicate predicateWithBlock:v25];
    v14 = [v12 filteredArrayUsingPredicate:v13];
    v15 = [v14 firstObject];

    if (v15)
    {
      v26[0] = @"surfaceID";
      v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 surfaceID]);
      v27[0] = v16;
      v26[1] = @"PixelFormat";
      v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 pixelFormat]);
      v27[1] = v17;
      v26[2] = @"Width";
      v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 width]);
      v27[2] = v18;
      v26[3] = @"Height";
      v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 height]);
      v27[3] = v19;
      v20 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
      id v21 = [v20 mutableCopy];

      v22 = [v15 name];

      if (v22)
      {
        v23 = [v15 name];
        [v21 setObject:v23 forKey:@"Name"];
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)ioAccelMemoryInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  self;
  if (objc_opt_class())
  {
    os_unfair_lock_lock(&self->_allPIDsIOAccelMemoryInfosLock);
    if (!self->_allPIDsIOAccelMemoryInfos)
    {
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x3032000000;
      v61 = sub_100015064;
      v62 = sub_100015074;
      id v63 = +[NSMutableDictionary dictionary];
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2020000000;
      char v57 = 0;
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v11 = dispatch_queue_create("com.apple.footprint.ioaccelmemoryinfo", v10);

      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10001507C;
      v50[3] = &unk_100029DC0;
      v52 = &v54;
      v53 = &v58;
      v12 = v9;
      v51 = v12;
      +[IOAccelMemoryInfo collectDataWithCompletionQueue:v11 completionBlock:v50];
      dispatch_time_t v13 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v12, v13);
      if (a5 && !*((unsigned char *)v55 + 24) && !*a5)
      {
        NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
        CFStringRef v67 = @"Timed out waiting to fetch IOAccelMemory region infos";
        v14 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        *a5 = +[NSError errorWithDomain:@"FootprintErrorDomain" code:1 userInfo:v14];
      }
      v15 = (NSDictionary *)[(id)v59[5] copy];
      allPIDsIOAccelMemoryInfos = self->_allPIDsIOAccelMemoryInfos;
      self->_allPIDsIOAccelMemoryInfos = v15;

      _Block_object_dispose(&v54, 8);
      _Block_object_dispose(&v58, 8);
    }
    os_unfair_lock_unlock(&self->_allPIDsIOAccelMemoryInfosLock);
    v17 = self->_allPIDsIOAccelMemoryInfos;
    v18 = +[NSNumber numberWithInt:v6];
    v19 = [(NSDictionary *)v17 objectForKeyedSubscript:v18];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v46 objects:v65 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v47;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v47 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v25 = [v24 mappings];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v26 = v25;
          id v27 = [v26 countByEnumeratingWithState:&v42 objects:v64 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v43;
LABEL_15:
            uint64_t v29 = 0;
            while (1)
            {
              if (*(void *)v43 != v28) {
                objc_enumerationMutation(v26);
              }
              if ([*(id *)(*((void *)&v42 + 1) + 8 * v29) address] == (id)a3) {
                break;
              }
              if (v27 == (id)++v29)
              {
                id v27 = [v26 countByEnumeratingWithState:&v42 objects:v64 count:16];
                if (v27) {
                  goto LABEL_15;
                }
                goto LABEL_21;
              }
            }
            id v30 = v24;

            if (!v30) {
              continue;
            }

            v31 = +[NSMutableDictionary dictionary];
            v32 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v30 surfaceID]);
            [v31 setObject:v32 forKeyedSubscript:@"SurfaceID"];

            v33 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 length]);
            [v31 setObject:v33 forKeyedSubscript:@"Size"];

            v34 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 dirtyLength]);
            [v31 setObject:v34 forKeyedSubscript:@"DirtySize"];

            v35 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 residentLength]);
            [v31 setObject:v35 forKeyedSubscript:@"ResidentSize"];

            v36 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v30 wired]);
            [v31 setObject:v36 forKeyedSubscript:@"IsWired"];

            v37 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v30 purgeable]);
            [v31 setObject:v37 forKeyedSubscript:@"IsPurgeable"];

            v38 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v30 cachedCopy]);
            [v31 setObject:v38 forKeyedSubscript:@"CachedCopy"];

            v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 memoryPool]);
            [v31 setObject:v39 forKeyedSubscript:@"MemoryPool"];

            v40 = [v30 formattedDescriptions];
            [v31 setObject:v40 forKeyedSubscript:@"Descriptions"];

            goto LABEL_28;
          }
LABEL_21:
        }
        id v21 = [v20 countByEnumeratingWithState:&v46 objects:v65 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
    v31 = 0;
    id v30 = v20;
LABEL_28:
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatherEndTime, 0);
  objc_storeStrong((id *)&self->_gatherStartTime, 0);
  objc_storeStrong((id *)&self->_outputFormatters, 0);
  objc_storeStrong((id *)&self->_sharedCacheMemoryObjectsTable, 0);
  objc_storeStrong((id *)&self->_allPIDsIOAccelMemoryInfos, 0);
  objc_storeStrong((id *)&self->_allPIDsIOSurfaceDescriptions, 0);
  objc_storeStrong((id *)&self->_pidToFootprint, 0);

  objc_storeStrong((id *)&self->_processes, 0);
}

@end