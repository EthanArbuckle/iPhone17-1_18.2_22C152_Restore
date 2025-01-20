@interface fskitdExtensionManager
- (BOOL)enumerateInstancesForBundle:(id)a3 uid:(unsigned int)a4 block:(id)a5;
- (BOOL)enumerateInstancesForBundle:(id)a3 user:(id)a4 block:(id)a5;
- (NSMapTable)instances;
- (fskitdExtensionManager)init;
- (id)getInstancesInfo;
- (id)instanceKeyFor:(unsigned int)a3 bundleID:(id)a4 instanceID:(id)a5;
- (void)cleanUpInstance:(id)a3;
- (void)existingExtensionForBundle:(id)a3 user:(id)a4 instance:(id)a5 replyHandler:(id)a6;
- (void)existingExtensionForBundle:(id)a3 user:(id)a4 resource:(id)a5 replyHandler:(id)a6;
- (void)existingExtensionForBundle:(id)a3 user:(id)a4 volume:(id)a5 replyHandler:(id)a6;
- (void)extensionForBundle:(id)a3 user:(id)a4 instance:(id)a5 replyHandler:(id)a6;
- (void)extensionForDefaultBundle:(id)a3 user:(id)a4 replyHandler:(id)a5;
- (void)instanceDied:(id)a3 instanceUUID:(id)a4 uid:(unsigned int)a5;
- (void)isVolumeIDUsed:(id)a3 bundle:(id)a4 user:(id)a5 replyHandler:(id)a6;
- (void)setInstances:(id)a3;
@end

@implementation fskitdExtensionManager

- (fskitdExtensionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)fskitdExtensionManager;
  v2 = [(fskitdExtensionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToWeakObjectsMapTable];
    instances = v2->_instances;
    v2->_instances = (NSMapTable *)v3;
  }
  return v2;
}

- (void)extensionForDefaultBundle:(id)a3 user:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = +[FSModuleHost defaultInstanceUUID];
  v11 = [v12 fs_containerIdentifier];
  [(fskitdExtensionManager *)self extensionForBundle:v10 user:v9 instance:v11 replyHandler:v8];
}

- (id)instanceKeyFor:(unsigned int)a3 bundleID:(id)a4 instanceID:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[NSNumber numberWithUnsignedInt:getuid()];
  id v9 = +[FSItemTriple tripleWith:v8 second:v7 third:v6];

  return v9;
}

- (void)extensionForBundle:(id)a3 user:(id)a4 instance:(id)a5 replyHandler:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id, void))a6;
  v13 = -[fskitdExtensionManager instanceKeyFor:bundleID:instanceID:](self, "instanceKeyFor:bundleID:instanceID:", [v10 ruid], v18, v11);
  v14 = self->_instances;
  objc_sync_enter(v14);
  id v15 = [(NSMapTable *)self->_instances objectForKey:v13];
  if (v15)
  {
    v12[2](v12, v15, 0);
  }
  else
  {
    v16 = [v11 uuid];
    id v15 = +[fskitdExtensionInstance newForBundle:v18 user:v10 instance:v16];

    if (v15)
    {
      [(NSMapTable *)self->_instances setObject:v15 forKey:v13];
      v12[2](v12, v15, 0);
    }
    else
    {
      v17 = fs_errorForPOSIXError();
      ((void (**)(id, id, void *))v12)[2](v12, 0, v17);

      id v15 = 0;
    }
  }
  objc_sync_exit(v14);
}

- (void)existingExtensionForBundle:(id)a3 user:(id)a4 instance:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, void))a6;
  v14 = -[fskitdExtensionManager instanceKeyFor:bundleID:instanceID:](self, "instanceKeyFor:bundleID:instanceID:", [v11 ruid], v10, v12);
  id v15 = self->_instances;
  objc_sync_enter(v15);
  v16 = [(NSMapTable *)self->_instances objectForKey:v14];
  objc_sync_exit(v15);

  if (v16)
  {
    v13[2](v13, v16, 0);
  }
  else
  {
    v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315906;
      v20 = "-[fskitdExtensionManager existingExtensionForBundle:user:instance:replyHandler:]";
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 1024;
      unsigned int v24 = [v11 ruid];
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: Can't find any instance using bundleID (%@), uid %u, and instanceID (%@)", (uint8_t *)&v19, 0x26u);
    }

    id v18 = fs_errorForPOSIXError();
    ((void (**)(id, void *, void *))v13)[2](v13, 0, v18);
  }
}

- (BOOL)enumerateInstancesForBundle:(id)a3 uid:(unsigned int)a4 block:(id)a5
{
  id v22 = a3;
  id v6 = (uint64_t (**)(id, void *, void *))a5;
  id v7 = +[NSNumber numberWithUnsignedInt:getuid()];
  obj = self->_instances;
  objc_sync_enter(obj);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [(NSMapTable *)self->_instances keyEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v13 = [v12 first:obj];
        if ([v13 isEqual:v7])
        {
          v14 = [v12 second];
          unsigned int v15 = [v14 isEqual:v22];

          if (v15)
          {
            v16 = [(NSMapTable *)self->_instances objectForKey:v12];
            char v17 = v6[2](v6, v12, v16);

            if (v17)
            {
              BOOL v18 = 1;
              goto LABEL_14;
            }
          }
        }
        else
        {
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
  BOOL v18 = 0;
LABEL_14:

  objc_sync_exit(obj);
  return v18;
}

- (BOOL)enumerateInstancesForBundle:(id)a3 user:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  LOBYTE(a4) = -[fskitdExtensionManager enumerateInstancesForBundle:uid:block:](self, "enumerateInstancesForBundle:uid:block:", v9, [a4 ruid], v8);

  return (char)a4;
}

- (void)existingExtensionForBundle:(id)a3 user:(id)a4 volume:(id)a5 replyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v33 = a5;
  v31 = (void (**)(id, void *, void))a6;
  v29 = v10;
  [v10 ruid];
  id v11 = +[NSNumber numberWithUnsignedInt:getuid()];
  obj = self->_instances;
  objc_sync_enter(obj);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = [(NSMapTable *)self->_instances keyEnumerator];
  id v13 = [v12 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v35;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(v12);
      }
      v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
      char v17 = [v16 first];
      if (![v17 isEqual:v11]) {
        goto LABEL_9;
      }
      BOOL v18 = [v16 second];
      unsigned int v19 = [v18 isEqual:v9];

      if (v19) {
        break;
      }
LABEL_10:
      if (v13 == (id)++v15)
      {
        id v13 = [v12 countByEnumeratingWithState:&v34 objects:v48 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    char v17 = [(NSMapTable *)self->_instances objectForKey:v16];
    v20 = [v17 volumeIDs];
    unsigned int v21 = [v20 containsObject:v33];

    if (v21)
    {
      long long v25 = fskit_std_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        long long v26 = [v16 third];
        v27 = [v16 first];
        v28 = [v16 second];
        *(_DWORD *)buf = 136316162;
        v39 = "-[fskitdExtensionManager existingExtensionForBundle:user:volume:replyHandler:]";
        __int16 v40 = 2112;
        v41 = v26;
        __int16 v42 = 2112;
        v43 = v27;
        __int16 v44 = 2112;
        v45 = v28;
        __int16 v46 = 2112;
        id v47 = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s: Found an instance (%@) with the right bundleID (%@), uid %@, and volumeID (%@)", buf, 0x34u);
      }
      v31[2](v31, v17, 0);

      long long v24 = obj;
      objc_sync_exit(obj);
      goto LABEL_20;
    }
LABEL_9:

    goto LABEL_10;
  }
LABEL_12:

  objc_sync_exit(obj);
  id v22 = fskit_std_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100041CE8();
  }

  long long v23 = fskit_std_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100041C54(self);
  }

  long long v24 = fs_errorForPOSIXError();
  ((void (**)(id, void *, void *))v31)[2](v31, 0, v24);
LABEL_20:
}

- (void)isVolumeIDUsed:(id)a3 bundle:(id)a4 user:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = fskit_std_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100041D5C();
  }

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100037298;
  v16[3] = &unk_100059F30;
  id v15 = v10;
  id v17 = v15;
  BOOL v18 = &v19;
  [(fskitdExtensionManager *)self enumerateInstancesForBundle:v11 user:v12 block:v16];
  (*((void (**)(id, void, void))v13 + 2))(v13, *((unsigned __int8 *)v20 + 24), 0);

  _Block_object_dispose(&v19, 8);
}

- (void)existingExtensionForBundle:(id)a3 user:(id)a4 resource:(id)a5 replyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v31 = a5;
  v29 = (void (**)(id, void *, void))a6;
  v27 = v10;
  [v10 ruid];
  id v11 = +[NSNumber numberWithUnsignedInt:getuid()];
  obj = self->_instances;
  objc_sync_enter(obj);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = [(NSMapTable *)self->_instances keyEnumerator];
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v33;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v12);
      }
      v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
      id v17 = [v16 first];
      if (![v17 isEqual:v11]) {
        goto LABEL_9;
      }
      BOOL v18 = [v16 second];
      unsigned int v19 = [v18 isEqual:v9];

      if (v19) {
        break;
      }
LABEL_10:
      if (v13 == (id)++v15)
      {
        id v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v17 = [(NSMapTable *)self->_instances objectForKey:v16];
    v20 = [v17 resourceIDs];
    uint64_t v21 = [v31 getResourceID];
    unsigned int v22 = [v20 containsObject:v21];

    if (v22)
    {
      long long v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        sub_100041F2C();
      }

      v29[2](v29, v17, 0);
      long long v25 = obj;
      objc_sync_exit(obj);
      goto LABEL_20;
    }
LABEL_9:

    goto LABEL_10;
  }
LABEL_12:

  objc_sync_exit(obj);
  long long v23 = fskit_std_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100041E64((uint64_t)v9, v31, v23);
  }

  long long v24 = fskit_std_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_100041DD0(self);
  }

  long long v25 = fs_errorForPOSIXError();
  ((void (**)(id, void *, void *))v29)[2](v29, 0, v25);
LABEL_20:
}

- (id)getInstancesInfo
{
  id v24 = (id)objc_opt_new();
  v20 = self->_instances;
  objc_sync_enter(v20);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v23 = self;
  uint64_t v3 = [(NSMapTable *)self->_instances keyEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    id obj = v3;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        id v6 = [(NSMapTable *)v23->_instances objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        id v7 = objc_opt_new();
        id v8 = [v6 bundleID];
        [v7 setObject:v8 forKeyedSubscript:@"bundleID"];

        id v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 uid]);
        [v7 setObject:v9 forKeyedSubscript:@"user"];

        id v10 = [v6 instanceID];
        [v7 setObject:v10 forKeyedSubscript:@"instanceID"];

        id v11 = [v6 containerID];
        [v7 setObject:v11 forKeyedSubscript:@"containerID"];

        id v12 = [v6 resourceIDs];
        [v7 setObject:v12 forKeyedSubscript:@"resourceIDs"];

        id v13 = objc_opt_new();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v14 = [v6 volumeIDs];
        id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v26;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v14);
              }
              BOOL v18 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) uuid];
              [v13 addObject:v18];
            }
            id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v15);
        }

        [v7 setObject:v13 forKeyedSubscript:@"volumeIDs"];
        [v24 addObject:v7];
      }
      uint64_t v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v20);

  return v24;
}

- (void)instanceDied:(id)a3 instanceUUID:(id)a4 uid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000356F8;
  uint64_t v21 = sub_100035708;
  id v22 = 0;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100037BE8;
  uint64_t v14 = &unk_100059F30;
  id v9 = a4;
  id v15 = v9;
  uint64_t v16 = &v17;
  [(fskitdExtensionManager *)self enumerateInstancesForBundle:v8 uid:v5 block:&v11];
  id v10 = (void *)v18[5];
  if (v10) {
    [v10 weDied:v11 v12:v13 v14:v14];
  }

  _Block_object_dispose(&v17, 8);
}

- (void)cleanUpInstance:(id)a3
{
  id v9 = a3;
  id v4 = [v9 uid];
  uint64_t v5 = [v9 bundleID];
  id v6 = [v9 containerID];
  id v7 = [(fskitdExtensionManager *)self instanceKeyFor:v4 bundleID:v5 instanceID:v6];

  id v8 = self->_instances;
  objc_sync_enter(v8);
  [(NSMapTable *)self->_instances removeObjectForKey:v7];
  objc_sync_exit(v8);
}

- (NSMapTable)instances
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInstances:(id)a3
{
}

- (void).cxx_destruct
{
}

@end