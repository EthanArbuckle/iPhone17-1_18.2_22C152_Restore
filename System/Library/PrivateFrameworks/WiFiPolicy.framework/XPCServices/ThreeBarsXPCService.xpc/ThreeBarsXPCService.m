int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];
  NSLog(@"%s: listener has resumed", "main");

  return 0;
}

uint64_t sub_1000023D4(uint64_t a1)
{
  id v2 = [objc_alloc((Class)WiFi3BarsSource) initWithChangeHandler:0 localStoreType:1];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (!v3) {
      goto LABEL_9;
    }
    v4 = *(void (**)(void))(v3 + 16);
LABEL_8:
    v4();
    goto LABEL_9;
  }
  v7 = v2;
  NSLog(@"%s: submitting cache size metric", "-[TBXPCService maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:]_block_invoke");
  [v7 submitCacheAnalyticsEvent];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8)
    || (NSLog(@"%s: purging local store if it size exceeds %lu bytes", "-[TBXPCService maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:]_block_invoke", *(void *)(a1 + 56)), [v7 prune3BarsNetworks:*(void *)(a1 + 56) completionHandler:0], *(unsigned char *)(*(void *)(a1 + 32) + 8)))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (!v5) {
      goto LABEL_9;
    }
    v4 = *(void (**)(void))(v5 + 16);
    goto LABEL_8;
  }
  NSLog(@"%s: fetching networks predicted based on current location", "-[TBXPCService maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:]_block_invoke");
  [v7 fetch3BarsNetworksPredictedForLocation:*(void *)(a1 + 40) duration:*(void *)(a1 + 72) maxLocations:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 64)];
LABEL_9:

  return _objc_release_x1();
}

void sub_10000276C(uint64_t a1, void *a2, void *a3, int a4)
{
  id v12 = a2;
  id v7 = a3;
  v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
  if (a4)
  {
    v9 = [v12 error];

    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      v11 = [v12 error];
      NSLog(@"%s: fetch for %llu failed, error %@", "-[TBXPCService fetchTileFromVisitedCallback:cacheAge:]_block_invoke", v10, v11);
    }
    else
    {
      NSLog(@"%s: fetch for %llu completed", "-[TBXPCService fetchTileFromVisitedCallback:cacheAge:]_block_invoke", v10);
    }
  }
}

void sub_100002900(uint64_t a1)
{
  id v2 = [objc_alloc((Class)WiFi3BarsSource) initWithChangeHandler:0 localStoreType:1];
  NSLog(@"%s: fetching networks based on given location", "-[TBXPCService fetch3BarsNetworksForLocation:]_block_invoke");
  [v2 fetch3BarsNetworksFor:*(void *)(a1 + 32)];
}

void sub_100002A10(uint64_t a1)
{
  id v2 = [objc_alloc((Class)WiFi3BarsSource) initWithChangeHandler:0 localStoreType:1];
  [v2 prune3BarsNetworks:*(void *)(a1 + 32) completionHandler:0];
}

void sub_100002B50(uint64_t a1)
{
  id v2 = [objc_alloc((Class)WiFi3BarsSource) initWithChangeHandler:0 localStoreType:1];
  [v2 forceFetch3BarsNetworkMatchingBSSID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

void NSLog(NSString *format, ...)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sourceMediator(void *a1, const char *a2, ...)
{
  return [a1 sourceMediator];
}

id objc_msgSend_submitCacheAnalyticsEvent(void *a1, const char *a2, ...)
{
  return [a1 submitCacheAnalyticsEvent];
}

id objc_msgSend_tileItemDescriptorWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tileItemDescriptorWithKey:");
}