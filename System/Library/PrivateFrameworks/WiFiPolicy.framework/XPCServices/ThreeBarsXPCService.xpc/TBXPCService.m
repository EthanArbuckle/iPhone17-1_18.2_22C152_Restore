@interface TBXPCService
- (TBXPCService)init;
- (void)cancelMaintenanceTask;
- (void)fetch3BarsNetworksForLocation:(id)a3;
- (void)fetchTileFromVisitedCallback:(unint64_t)a3 cacheAge:(id)a4;
- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4;
- (void)maintenanceTask:(unint64_t)a3 location:(id)a4 predictedForDuration:(double)a5 maxPredictedLocations:(unint64_t)a6 completionHandler:(id)a7;
- (void)prune3BarsNetworks:(unint64_t)a3;
@end

@implementation TBXPCService

- (TBXPCService)init
{
  NSLog(@"%s:", a2, "-[TBXPCService init]");
  v7.receiver = self;
  v7.super_class = (Class)TBXPCService;
  v3 = [(TBXPCService *)&v7 init];
  dispatch_queue_t v4 = dispatch_queue_create(0, 0);
  processingQueue = v3->_processingQueue;
  v3->_processingQueue = (OS_dispatch_queue *)v4;

  return v3;
}

- (void)maintenanceTask:(unint64_t)a3 location:(id)a4 predictedForDuration:(double)a5 maxPredictedLocations:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  NSLog(@"%s: sizeLimit = %ld, duration = %f, maxLocations = %lu", "-[TBXPCService maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:]", a3, *(void *)&a5, a6);
  self->_isCancelled = 0;
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000023D4;
  block[3] = &unk_100004158;
  id v19 = v13;
  unint64_t v20 = a3;
  block[4] = self;
  id v18 = v12;
  double v21 = a5;
  unint64_t v22 = a6;
  id v15 = v12;
  id v16 = v13;
  dispatch_async(processingQueue, block);
}

- (void)cancelMaintenanceTask
{
  NSLog(@"%s: _isCancelled = %d", a2, "-[TBXPCService cancelMaintenanceTask]", self->_isCancelled);
  self->_isCancelled = 1;
}

- (void)fetchTileFromVisitedCallback:(unint64_t)a3 cacheAge:(id)a4
{
  id v5 = a4;
  NSLog(@"%s: tileKey = %llu, cacheAge = %@", "-[TBXPCService fetchTileFromVisitedCallback:cacheAge:]", a3, v5);
  id v6 = [objc_alloc((Class)WiFi3BarsSource) initWithChangeHandler:0 localStoreType:1];
  objc_super v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  v8 = +[TBTileItemDescriptor tileItemDescriptorWithKey:v7];

  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, 0);
  id v10 = [objc_alloc((Class)TBTileFetchRequestDescriptor) initWithTileItems:v9 maxCacheAge:v5];

  id v11 = [objc_alloc((Class)TBTileFetchRequest) initWithDescriptor:v10 sourcePolicy:3 cacheable:1];
  v16[0] = @"trigger";
  v16[1] = @"tileKey";
  v17[0] = &off_100004450;
  id v12 = +[NSNumber numberWithUnsignedLongLong:a3];
  v17[1] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v11 setUserInfo:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000276C;
  v15[3] = &unk_100004178;
  v15[4] = a3;
  [v11 setResultsHandler:v15];
  v14 = [v6 sourceMediator];
  [v14 executeFetchRequest:v11];
}

- (void)fetch3BarsNetworksForLocation:(id)a3
{
  id v4 = a3;
  NSLog(@"%s:", "-[TBXPCService fetch3BarsNetworksForLocation:]");
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002900;
  block[3] = &unk_1000041A0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, block);
}

- (void)prune3BarsNetworks:(unint64_t)a3
{
  NSLog(@"%s:", a2, "-[TBXPCService prune3BarsNetworks:]");
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002A10;
  block[3] = &unk_1000041C0;
  void block[4] = a3;
  dispatch_async(processingQueue, block);
}

- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSLog(@"%s:", "-[TBXPCService forceFetch3BarsNetworkMatchingBSSID:completionHandler:]");
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002B50;
  block[3] = &unk_1000041E8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(processingQueue, block);
}

- (void).cxx_destruct
{
}

@end