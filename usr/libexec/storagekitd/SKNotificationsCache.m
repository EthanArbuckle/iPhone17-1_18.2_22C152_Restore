@interface SKNotificationsCache
- (NSMutableArray)appearedDisks;
- (NSMutableArray)changedDisks;
- (NSMutableArray)disappearedDisks;
- (NSMutableArray)disksToProcess;
- (OS_dispatch_group)processingGroup;
- (SKDisk)processedDisk;
- (SKNotificationsCache)initWithDiskOperationMap:(id)a3;
- (void)prepareWithDiskOperationMap:(id)a3;
- (void)setProcessedDisk:(id)a3;
@end

@implementation SKNotificationsCache

- (void)prepareWithDiskOperationMap:(id)a3
{
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = a3;
  id v36 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v36)
  {
    uint64_t v4 = *(void *)v39;
    p_vtable = SKVolume.vtable;
    uint64_t v34 = *(void *)v39;
    v35 = self;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v39 != v4) {
          objc_enumerationMutation(obj);
        }
        v7 = [obj objectForKey:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        v8 = [(SKDiskOperations *)v7 objectForKeyedSubscript:p_vtable[325]];
        if ([v8 isEqualToString:off_100055A50])
        {

LABEL_8:
          v9 = [(SKNotificationsCache *)self disksToProcess];
          v10 = [[SKDiskOperations alloc] initWithWholeDiskOperation:v7];
          [v9 addObject:v10];
          goto LABEL_34;
        }
        v11 = p_vtable;
        v12 = [(SKDiskOperations *)v7 objectForKeyedSubscript:p_vtable[325]];
        if ([v12 isEqualToString:off_100055A48])
        {
          v13 = [(SKDiskOperations *)v7 objectForKeyedSubscript:off_100055A58];
          unsigned __int8 v14 = sub_100012388(v13);

          self = v35;
          p_vtable = v11;
          if ((v14 & 1) == 0) {
            goto LABEL_8;
          }
        }
        else
        {

          p_vtable = v11;
        }
        v9 = [(SKDiskOperations *)v7 objectForKey:off_100055A60];
        v10 = (SKDiskOperations *)DADiskCopyDescription((DADiskRef)v9);
        v15 = [(SKDiskOperations *)v10 objectForKeyedSubscript:kDADiskDescriptionVolumeNetworkKey];
        if (sub_100012340(v15))
        {
          v16 = sub_10000DD48();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v45 = "-[SKNotificationsCache prepareWithDiskOperationMap:]";
            __int16 v46 = 2112;
            v47 = v9;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s: %@ is a network disk, ignoring", buf, 0x16u);
          }
        }
        else
        {
          v16 = [(SKDiskOperations *)v10 objectForKeyedSubscript:kDADiskDescriptionMediaWholeKey];
          if ((sub_100012340(v16) & 1) != 0
            || +[SKAPFSDisk isLIFSAPFSWithDiskDescription:v10])
          {
            v17 = [(SKNotificationsCache *)self disksToProcess];
            id v18 = [v17 indexOfObject:v9];

            self = v35;
            v19 = [(SKNotificationsCache *)v35 disksToProcess];
            DADiskRef v20 = v19;
            if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v21 = [[SKDiskOperations alloc] initWithWholeDiskOperation:v7];
              [(__DADisk *)v20 addObject:v21];
            }
            else
            {
              v21 = [(__DADisk *)v19 objectAtIndexedSubscript:v18];
              [(SKDiskOperations *)v21 setWholeDiskOperation:v7];
            }
          }
          else
          {
            DADiskRef v20 = DADiskCopyWholeDisk((DADiskRef)v9);
            if (v20)
            {
              v22 = [(SKNotificationsCache *)self disksToProcess];
              id v23 = [v22 indexOfObject:v20];

              if (v23 == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v24 = v11[325];
                v42[0] = off_100055A60;
                v42[1] = v24;
                v43[0] = v20;
                v43[1] = off_100055A38;
                v21 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
                v33 = [[SKDiskOperations alloc] initWithWholeDiskOperation:v21];
                v25 = [(SKDiskOperations *)v33 childrenOperations];
                [v25 addObject:v7];

                v26 = [(SKNotificationsCache *)v35 disksToProcess];
                v27 = v26;
                v28 = v33;
              }
              else
              {
                v21 = [(SKNotificationsCache *)v35 disksToProcess];
                v33 = [(SKDiskOperations *)v21 objectAtIndexedSubscript:v23];
                v26 = [(SKDiskOperations *)v33 childrenOperations];
                v27 = v26;
                v28 = v7;
              }
              [v26 addObject:v28];

              self = v35;
            }
            else
            {
              v29 = sub_10000DD48();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v45 = "-[SKNotificationsCache prepareWithDiskOperationMap:]";
                __int16 v46 = 2112;
                v47 = v9;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: Failed to get whole disk for %@", buf, 0x16u);
              }

              v21 = [[SKDiskOperations alloc] initWithWholeDiskOperation:v7];
              v30 = [(SKNotificationsCache *)self disksToProcess];
              id v32 = [v30 indexOfObject:v9];

              self = v35;
              v31 = [(SKNotificationsCache *)v35 disksToProcess];
              v33 = v31;
              if (v32 == (id)0x7FFFFFFFFFFFFFFFLL) {
                [(SKDiskOperations *)v31 addObject:v21];
              }
              else {
                -[SKDiskOperations setObject:atIndexedSubscript:](v31, "setObject:atIndexedSubscript:", v21);
              }
            }
          }
          p_vtable = v11;
        }

        uint64_t v4 = v34;
LABEL_34:
      }
      id v36 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v36);
  }
}

- (SKNotificationsCache)initWithDiskOperationMap:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKNotificationsCache;
  v5 = [(SKNotificationsCache *)&v17 init];
  if (v5)
  {
    uint64_t v6 = +[NSMutableArray array];
    appearedDisks = v5->_appearedDisks;
    v5->_appearedDisks = (NSMutableArray *)v6;

    uint64_t v8 = +[NSMutableArray array];
    changedDisks = v5->_changedDisks;
    v5->_changedDisks = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableArray array];
    disappearedDisks = v5->_disappearedDisks;
    v5->_disappearedDisks = (NSMutableArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    disksToProcess = v5->_disksToProcess;
    v5->_disksToProcess = (NSMutableArray *)v12;

    dispatch_group_t v14 = dispatch_group_create();
    processingGroup = v5->_processingGroup;
    v5->_processingGroup = (OS_dispatch_group *)v14;

    [(SKNotificationsCache *)v5 prepareWithDiskOperationMap:v4];
  }

  return v5;
}

- (NSMutableArray)appearedDisks
{
  return self->_appearedDisks;
}

- (NSMutableArray)changedDisks
{
  return self->_changedDisks;
}

- (NSMutableArray)disappearedDisks
{
  return self->_disappearedDisks;
}

- (OS_dispatch_group)processingGroup
{
  return self->_processingGroup;
}

- (NSMutableArray)disksToProcess
{
  return self->_disksToProcess;
}

- (SKDisk)processedDisk
{
  return self->_processedDisk;
}

- (void)setProcessedDisk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedDisk, 0);
  objc_storeStrong((id *)&self->_disksToProcess, 0);
  objc_storeStrong((id *)&self->_processingGroup, 0);
  objc_storeStrong((id *)&self->_disappearedDisks, 0);
  objc_storeStrong((id *)&self->_changedDisks, 0);

  objc_storeStrong((id *)&self->_appearedDisks, 0);
}

@end