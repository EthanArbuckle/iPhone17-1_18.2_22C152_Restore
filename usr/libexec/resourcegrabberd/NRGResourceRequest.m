@interface NRGResourceRequest
- (NSString)bundleID;
- (NSString)idsIdentifier;
- (NSString)path;
- (NSString)responseID;
- (PCPersistentTimer)persistentTimer;
- (id)completionBlock;
- (id)description;
- (id)sendWithTransport:(id)a3 toDevice:(id)a4 withTimeout:(double)a5;
- (int)variant;
- (unsigned)type;
- (void)abort;
- (void)handleResponse:(id)a3;
- (void)invalidateTimer;
- (void)setBundleID:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setPath:(id)a3;
- (void)setPersistentTimer:(id)a3;
- (void)setResponseID:(id)a3;
- (void)setType:(unsigned __int16)a3;
- (void)setVariant:(int)a3;
- (void)timerAbort:(id)a3;
@end

@implementation NRGResourceRequest

- (id)sendWithTransport:(id)a3 toDevice:(id)a4 withTimeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_completionBlock) {
    sub_100014CC4();
  }
  if (!v8) {
    sub_100014CF0();
  }
  if (self->_persistentTimer) {
    sub_100014D1C();
  }
  v10 = v9;
  v11 = objc_alloc_init(NRGPBResourceRequest);
  [(NRGPBResourceRequest *)v11 setType:self->_type];
  [(NRGPBResourceRequest *)v11 setIconVariant:self->_variant];
  [(NRGPBResourceRequest *)v11 setBundleID:self->_bundleID];
  v12 = (void *)IDSCopyIDForDevice();
  v13 = [v8 sendProtobufRequest:v11 type:0 priority:200 expectsResponse:1 requestHandler:0 errorHandler:&stru_100020748 toDevice:a5 withTimeout:v12];
  idsIdentifier = self->_idsIdentifier;
  self->_idsIdentifier = v13;

  if (self->_idsIdentifier)
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = +[NSString stringWithFormat:@"%@_resource", v16];

    v18 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:v17 serviceIdentifier:self target:"timerAbort:" selector:v17 userInfo:a5 + a5];
    persistentTimer = self->_persistentTimer;
    self->_persistentTimer = v18;

    [(PCPersistentTimer *)self->_persistentTimer setMinimumEarlyFireProportion:1.0];
    [(PCPersistentTimer *)self->_persistentTimer scheduleInQueue:&_dispatch_main_q];
  }
  else
  {
    (*((void (**)(void))self->_completionBlock + 2))();
  }
  v20 = self->_idsIdentifier;

  return v20;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  [(NRGResourceRequest *)self invalidateTimer];
  if (!v4)
  {
LABEL_12:
    (*((void (**)(void))self->_completionBlock + 2))();
    goto LABEL_13;
  }
  v5 = NRGGetActivePairedDevice();
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  unsigned int v7 = [v5 supportsCapability:v6];

  if (v7)
  {
    id v8 = [v4 resource];
    id v9 = [v4 checksumData];
    unsigned int v10 = [v8 matchesChecksumData:v9];

    if (!v10)
    {
      if ([v4 hasResource]
        && ([v4 resource],
            v13 = objc_claimAutoreleasedReturnValue(),
            id v14 = [v13 length],
            v13,
            v14))
      {
        v15 = nrg_daemon_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100014DC0((uint64_t)self, v4, v15);
        }
      }
      else
      {
        v15 = nrg_daemon_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          bundleID = self->_bundleID;
          int variant = self->_variant;
          unsigned int v18 = [v4 hasResource];
          v19 = [v4 resource];
          int v20 = 138413058;
          v21 = bundleID;
          __int16 v22 = 1024;
          int v23 = variant;
          __int16 v24 = 1024;
          unsigned int v25 = v18;
          __int16 v26 = 2048;
          id v27 = [v19 length];
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "no resource received for %@ (%d) hasResource %{BOOL}u response.resource.length %lu", (uint8_t *)&v20, 0x22u);
        }
      }

      goto LABEL_12;
    }
  }
  completionBlock = (void (**)(id, void *))self->_completionBlock;
  v12 = [v4 resource];
  completionBlock[2](completionBlock, v12);

LABEL_13:
}

- (void)timerAbort:(id)a3
{
  id v4 = a3;
  v5 = nrg_daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    id v8 = [v4 userInfo];
    int v9 = 138412546;
    unsigned int v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ %@ timeout fired", (uint8_t *)&v9, 0x16u);
  }
  [(NRGResourceRequest *)self abort];
}

- (void)abort
{
  [(NRGResourceRequest *)self invalidateTimer];
  v3 = (void (*)(void))*((void *)self->_completionBlock + 2);

  v3();
}

- (void)invalidateTimer
{
  [(PCPersistentTimer *)self->_persistentTimer invalidate];
  persistentTimer = self->_persistentTimer;
  self->_persistentTimer = 0;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@.%d.%d", self->_bundleID, self->_type, self->_variant];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (int)variant
{
  return self->_variant;
}

- (void)setVariant:(int)a3
{
  self->_int variant = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (PCPersistentTimer)persistentTimer
{
  return self->_persistentTimer;
}

- (void)setPersistentTimer:(id)a3
{
}

- (NSString)responseID
{
  return self->_responseID;
}

- (void)setResponseID:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_responseID, 0);
  objc_storeStrong((id *)&self->_persistentTimer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end