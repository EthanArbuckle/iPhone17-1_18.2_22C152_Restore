@interface TXRDeferredImageInfo
- (TXRDeferredImageInfo)init;
- (TXRImageInfo)info;
- (void)setInfo:(id)a3;
- (void)signalLoaded;
@end

@implementation TXRDeferredImageInfo

- (TXRDeferredImageInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)TXRDeferredImageInfo;
  v2 = [(TXRDeferredImageInfo *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    infoLoaded = v2->_infoLoaded;
    v2->_infoLoaded = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (void)signalLoaded
{
}

- (TXRImageInfo)info
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_infoLoaded, 0xFFFFFFFFFFFFFFFFLL);
  info = self->_info;
  return info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_infoLoaded, 0);
}

@end