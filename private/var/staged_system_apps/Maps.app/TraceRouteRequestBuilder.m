@interface TraceRouteRequestBuilder
- (NSURL)traceURL;
- (TraceRouteRequestBuilder)initWithTraceURL:(id)a3;
- (id)buildDirectionsRequestDetails;
@end

@implementation TraceRouteRequestBuilder

- (TraceRouteRequestBuilder)initWithTraceURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TraceRouteRequestBuilder;
  v6 = [(TraceRouteRequestBuilder *)&v10 init];
  if (!v6) {
    goto LABEL_4;
  }
  if ([v5 isFileURL])
  {
    objc_storeStrong((id *)&v6->_traceURL, a3);
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "TraceRouteRequestBuilder is expecting a file URL, got %{public}@", buf, 0xCu);
  }

  v7 = 0;
LABEL_8:

  return v7;
}

- (id)buildDirectionsRequestDetails
{
  id v3 = objc_alloc((Class)MNDirectionsRequestDetails);
  v4 = [(TraceRouteRequestBuilder *)self traceURL];
  id v5 = [v4 path];
  id v6 = [v3 initWithTracePath:v5];

  return v6;
}

- (NSURL)traceURL
{
  return self->_traceURL;
}

- (void).cxx_destruct
{
}

@end