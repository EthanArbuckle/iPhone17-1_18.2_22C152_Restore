@interface MRDPauseOutputDevicesRequestEndpointOperation
- (MRAVEndpoint)endpoint;
- (MRDPauseOutputDevicesRequestEndpointOperation)initWithEndpoint:(id)a3;
- (MRDPauseOutputDevicesRequestOperation)pauseOperation;
- (NSDate)startDate;
- (NSError)error;
- (NSMutableArray)events;
- (double)duration;
- (void)endEvent:(id)a3 withError:(id)a4;
- (void)setPauseOperation:(id)a3;
- (void)setStartDate:(id)a3;
- (void)startEvent:(id)a3;
@end

@implementation MRDPauseOutputDevicesRequestEndpointOperation

- (MRDPauseOutputDevicesRequestEndpointOperation)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRDPauseOutputDevicesRequestEndpointOperation;
  v6 = [(MRDPauseOutputDevicesRequestEndpointOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    events = v7->_events;
    v7->_events = v8;
  }
  return v7;
}

- (void)startEvent:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init(MRDPauseOutputDevicesRequestEndpointOperationEvent);
  [(MRDPauseOutputDevicesRequestEndpointOperationEvent *)v6 setName:v4];

  id v5 = +[NSDate now];
  [(MRDPauseOutputDevicesRequestEndpointOperationEvent *)v6 setStartDate:v5];

  [(NSMutableArray *)self->_events addObject:v6];
}

- (void)endEvent:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = self->_events;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "name", (void)v17);
        unsigned int v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          v16 = +[NSDate now];
          [v13 setEndDate:v16];

          if ((MRMediaRemoteErrorIsInformational() & 1) == 0) {
            [v13 setError:v7];
          }
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (NSError)error
{
  v2 = [(NSMutableArray *)self->_events msv_firstWhere:&stru_10041A330];
  v3 = [v2 error];

  return (NSError *)v3;
}

- (double)duration
{
  v3 = [(NSMutableArray *)self->_events msv_map:&stru_10041A370];
  id v4 = [(NSMutableArray *)self->_events msv_map:&stru_10041A390];
  id v5 = [v3 sortedArrayUsingComparator:&stru_10041A3D0];
  id v6 = [v5 firstObject];

  id v7 = [v4 sortedArrayUsingComparator:&stru_10041A3F0];
  v8 = [v7 lastObject];

  [v6 timeIntervalSinceDate:v8];
  double v10 = -v9;

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (MRDPauseOutputDevicesRequestOperation)pauseOperation
{
  return self->_pauseOperation;
}

- (void)setPauseOperation:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_pauseOperation, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end