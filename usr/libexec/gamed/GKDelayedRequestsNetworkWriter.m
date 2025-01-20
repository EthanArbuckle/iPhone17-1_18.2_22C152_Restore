@interface GKDelayedRequestsNetworkWriter
+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4;
- (GKDataTransport)transport;
- (GKDelayedRequestsNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4;
- (NSString)bagKey;
- (void)setBagKey:(id)a3;
- (void)setTransport:(id)a3;
- (void)writeResources:(id)a3 handler:(id)a4;
@end

@implementation GKDelayedRequestsNetworkWriter

+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[GKDelayedRequestsNetworkWriter alloc] initWithTransport:v6 forBagKey:v5];

  return v7;
}

- (GKDelayedRequestsNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKDelayedRequestsNetworkWriter;
  v8 = [(GKDelayedRequestsNetworkWriter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GKDelayedRequestsNetworkWriter *)v8 setTransport:v6];
    [(GKDelayedRequestsNetworkWriter *)v9 setBagKey:v7];
  }

  return v9;
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 _gkValuesForKeyPath:@"resourceID"];
  if ((unint64_t)[v8 count] >= 2)
  {
    v17 = +[NSString stringWithFormat:@"%@ is being asked to submit a delayed request for multiple players:%@. This is not currently supported. Bag key: %@", v8, objc_opt_class(), self->_bagKey];
    id v18 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v17 userInfo:0];

    objc_exception_throw(v18);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = [v6 _gkResourceWithID:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        v14 = [v13 representedItem];

        bagKey = self->_bagKey;
        transport = self->_transport;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000D50D8;
        v20[3] = &unk_1002D45D8;
        id v21 = v7;
        [(GKDataTransport *)transport postRequest:v14 forBagKey:bagKey result:v20];
      }
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
}

- (GKDataTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);

  objc_storeStrong((id *)&self->_bagKey, 0);
}

@end