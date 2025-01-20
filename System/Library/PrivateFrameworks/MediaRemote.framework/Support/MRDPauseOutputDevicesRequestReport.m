@interface MRDPauseOutputDevicesRequestReport
- (MRDPauseOutputDevicesRequestReport)initWithOutputDevices:(id)a3 requestID:(id)a4;
- (NSArray)outputDevices;
- (NSDate)startDate;
- (NSError)error;
- (NSMutableArray)operations;
- (NSString)requestID;
- (double)duration;
- (id)description;
- (int)appletvsEffected;
- (int)devicesForcedRemoved;
- (int)devicesPaused;
- (int)devicesRemoved;
- (int)endpointsForcedRemoved;
- (int)endpointsPaused;
- (int)endpointsRemoved;
- (int)homepodsEffected;
- (void)addOperation:(id)a3;
@end

@implementation MRDPauseOutputDevicesRequestReport

- (MRDPauseOutputDevicesRequestReport)initWithOutputDevices:(id)a3 requestID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MRDPauseOutputDevicesRequestReport;
  v9 = [(MRDPauseOutputDevicesRequestReport *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestID, a4);
    objc_storeStrong((id *)&v10->_outputDevices, a3);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    operations = v10->_operations;
    v10->_operations = v11;

    uint64_t v13 = +[NSDate now];
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v13;
  }
  return v10;
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  v4 = self->_operations;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_operations addObject:v5];
  objc_sync_exit(v4);
}

- (NSError)error
{
  v2 = [(NSMutableArray *)self->_operations msv_firstWhere:&stru_10041A430];
  v3 = [v2 error];

  return (NSError *)v3;
}

- (double)duration
{
  [(NSDate *)self->_startDate timeIntervalSinceNow];
  return -v2;
}

- (int)homepodsEffected
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v2 = self->_operations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    LODWORD(v5) = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "pauseOperation", (void)v12);
        v9 = [v8 relevantOutputDevices];
        v10 = objc_msgSend(v9, "msv_filter:", &stru_10041A450);
        id v5 = (char *)[v10 count] + (int)v5;
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    LODWORD(v5) = 0;
  }

  return (int)v5;
}

- (int)appletvsEffected
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v2 = self->_operations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    LODWORD(v5) = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "pauseOperation", (void)v12);
        v9 = [v8 relevantOutputDevices];
        v10 = objc_msgSend(v9, "msv_filter:", &stru_10041A470);
        id v5 = (char *)[v10 count] + (int)v5;
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    LODWORD(v5) = 0;
  }

  return (int)v5;
}

- (int)endpointsForcedRemoved
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = self->_operations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "pauseOperation", (void)v11);
        id v9 = [v8 type];

        if (v9 == (id)3) {
          ++v5;
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)devicesForcedRemoved
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v2 = self->_operations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "pauseOperation", (void)v14);
        id v10 = [v9 type];

        if (v10 == (id)3)
        {
          long long v11 = [v8 pauseOperation];
          long long v12 = [v11 relevantOutputDevices];
          v5 += [v12 count];
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)endpointsRemoved
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = self->_operations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "pauseOperation", (void)v11);
        id v9 = [v8 type];

        if (v9 == (id)2) {
          ++v5;
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)devicesRemoved
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v2 = self->_operations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "pauseOperation", (void)v14);
        id v10 = [v9 type];

        if (v10 == (id)2)
        {
          long long v11 = [v8 pauseOperation];
          long long v12 = [v11 relevantOutputDevices];
          v5 += [v12 count];
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)endpointsPaused
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = self->_operations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "pauseOperation", (void)v11);
        id v9 = [v8 type];

        if (v9 == (id)1) {
          ++v5;
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)devicesPaused
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v2 = self->_operations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "pauseOperation", (void)v14);
        id v10 = [v9 type];

        if (v10 == (id)1)
        {
          long long v11 = [v8 pauseOperation];
          long long v12 = [v11 relevantOutputDevices];
          v5 += [v12 count];
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@ Report\n", @"MRDPauseOutputDevicesRequest.pauseOutputDeviceUIDs"];
  [v3 appendString:@"----------------------------------\n"];
  [v3 appendFormat:@"Identifier: %@\n", self->_requestID];
  [(MRDPauseOutputDevicesRequestReport *)self duration];
  objc_msgSend(v3, "appendFormat:", @"Duration: %lf seconds\n", v4);
  [v3 appendFormat:@"outputDevices = %@\n", self->_outputDevices];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obj = self->_operations;
  id v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v43;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v5;
        uint64_t v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        [v3 appendFormat:@"{\n"];
        id v7 = [v6 pauseOperation];
        unint64_t v8 = (unint64_t)[v7 type];
        CFStringRef v9 = @"?";
        if (v8 <= 4) {
          CFStringRef v9 = off_10041A490[v8];
        }
        [v3 appendFormat:@" Operation: %@\n", v9];

        id v10 = [v6 pauseOperation];
        long long v11 = [v10 reason];
        [v3 appendFormat:@" Reason: %@\n", v11];

        long long v12 = [v6 endpoint];
        long long v13 = [v12 debugName];
        [v3 appendFormat:@" Endpoint: %@\n", v13];

        [v6 duration];
        objc_msgSend(v3, "appendFormat:", @" Duration: %lf\n", v14);
        long long v15 = [v6 pauseOperation];
        long long v16 = [v15 relevantOutputDevices];
        id v17 = [v16 count];

        if (v17)
        {
          v18 = [v6 pauseOperation];
          v19 = [v18 relevantOutputDeviceUIDs];
          [v3 appendFormat:@" RelevantOuptutDevices: %@\n", v19];

          v20 = [v6 pauseOperation];
          v21 = [v20 devicesInGroup];
          [v3 appendFormat:@" DevicesInGroup: %@\n", v21];
        }
        [v3 appendFormat:@" Events:\n"];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v22 = [v6 events];
        id v23 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v39;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v39 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              v28 = [v27 error];

              v29 = [v27 name];
              [v27 duration];
              uint64_t v31 = v30;
              if (v28)
              {
                v32 = [v27 error];
                [v3 appendFormat:@"    %@ : %lf seconds : %@\n", v29, v31, v32];
              }
              else
              {
                [v3 appendFormat:@"    %@ : %lf seconds\n", v29, v30];
              }
            }
            id v24 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v24);
        }

        [v3 appendFormat:@"}\n"];
        uint64_t v5 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      id v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v36);
  }

  [v3 appendString:@"----------------------------------\n"];

  return v3;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (NSMutableArray)operations
{
  return self->_operations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

@end