@interface ResourceArbiterClient
- (BOOL)asynchRequestResourceAccess:(BOOL)a3;
- (BOOL)resourceAccessStatus;
- (BOOL)synchRequestResourceAccess;
- (OS_dispatch_semaphore)sema;
- (ResourceArbiterClient)initWithID:(int)a3;
- (int)clientPriority;
- (int)pendingResourceRequest;
- (unsigned)ioService;
- (void)_processResourceAccessStatus:(BOOL)a3;
- (void)dealloc;
- (void)releaseResourceAccess;
- (void)resourceAccessGranted;
- (void)resourceAccessRevoked;
@end

@implementation ResourceArbiterClient

- (void)dealloc
{
  [(BaseResourceArbiterClient *)self setDelegate:0];
  notificationPortQueue = self->_notificationPortQueue;
  if (notificationPortQueue) {
    dispatch_release(notificationPortQueue);
  }
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  io_connect_t ioConnect = self->_ioConnect;
  if (ioConnect) {
    IOServiceClose(ioConnect);
  }
  io_object_t ioNotificationObject = self->_ioNotificationObject;
  if (ioNotificationObject)
  {
    IOObjectRelease(ioNotificationObject);
    self->_io_object_t ioNotificationObject = 0;
  }
  sema = self->_sema;
  if (sema) {
    dispatch_release(sema);
  }
  io_object_t ioService = self->_ioService;
  if (ioService) {
    IOObjectRelease(ioService);
  }
  v9.receiver = self;
  v9.super_class = (Class)ResourceArbiterClient;
  [(ResourceArbiterClient *)&v9 dealloc];
}

- (ResourceArbiterClient)initWithID:(int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ResourceArbiterClient;
  id v4 = [(ResourceArbiterClient *)&v10 init];
  result = 0;
  if (a3 <= 1 && v4)
  {
    [v4 setDelegate:0];
    *((_DWORD *)v4 + 14) = a3;
    *((_DWORD *)v4 + 15) = 0;
    *((unsigned char *)v4 + 48) = 0;
    *((void *)v4 + 8) = dispatch_semaphore_create(0);
    *((_DWORD *)v4 + 8) = 0;
    *((_DWORD *)v4 + 4) = 0;
    *((_DWORD *)v4 + 13) = 0;
    *((void *)v4 + 5) = dispatch_queue_create("vaduserclient-queue", 0);
    mach_port_t v6 = *MEMORY[0x263F0EC90];
    v7 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
    *((void *)v4 + 3) = v7;
    if (v7
      && (IONotificationPortSetDispatchQueue(v7, *((dispatch_queue_t *)v4 + 5)),
          (CFDictionaryRef v8 = IOServiceMatching("VADResourceArbiter")) != 0)
      && (io_service_t MatchingService = IOServiceGetMatchingService(v6, v8), (*((_DWORD *)v4 + 13) = MatchingService) != 0)
      && !IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)v4 + 4)
      && (IOObjectRetain(*((_DWORD *)v4 + 13)),
          !IOServiceAddInterestNotification(*((IONotificationPortRef *)v4 + 3), *((_DWORD *)v4 + 13), "IOGeneralInterest", (IOServiceInterestCallback)ResourceArbiterClientNotifyEvent, v4, (io_object_t *)v4 + 8)))
    {
      return (ResourceArbiterClient *)v4;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)_processResourceAccessStatus:(BOOL)a3
{
  BOOL v3 = a3;
  self->_resourceAccessStatus = a3;
  if (self->_pendingResourceRequest == 1) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
  }
  if ([(BaseResourceArbiterClient *)self delegate])
  {
    [(BaseResourceArbiterClient *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v5 = [(BaseResourceArbiterClient *)self delegate];
      [(ResourceArbiterClientDelegate *)v5 resourceAccessResult:v3];
    }
  }
}

- (BOOL)synchRequestResourceAccess
{
  if (self->_pendingResourceRequest
    || ![(BaseResourceArbiterClient *)self delegate] && self->_clientPriority)
  {
    return 0;
  }
  self->_pendingResourceRequest = 1;
  if (requestResource(self->_ioConnect, self->_clientPriority, 0))
  {
    BOOL result = 0;
    self->_pendingResourceRequest = 0;
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
    self->_pendingResourceRequest = 0;
    return self->_resourceAccessStatus;
  }
  return result;
}

- (BOOL)asynchRequestResourceAccess:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = 0;
  if ([(BaseResourceArbiterClient *)self delegate])
  {
    if (v3)
    {
      self->_pendingResourceRequest = 2;
      BOOL v5 = 1;
      if (requestResource(self->_ioConnect, self->_clientPriority, 1u))
      {
        BOOL v5 = 0;
        self->_pendingResourceRequest = 0;
      }
    }
  }
  return v5;
}

- (void)releaseResourceAccess
{
  self->_resourceAccessStatus = 0;
}

- (void)resourceAccessGranted
{
}

- (void)resourceAccessRevoked
{
  if ([(BaseResourceArbiterClient *)self delegate])
  {
    [(BaseResourceArbiterClient *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v3 = [(BaseResourceArbiterClient *)self delegate];
      [(ResourceArbiterClientDelegate *)v3 resourceAccessRevoked];
    }
  }
}

- (unsigned)ioService
{
  return self->_ioService;
}

- (int)clientPriority
{
  return self->_clientPriority;
}

- (int)pendingResourceRequest
{
  return self->_pendingResourceRequest;
}

- (BOOL)resourceAccessStatus
{
  return self->_resourceAccessStatus;
}

- (OS_dispatch_semaphore)sema
{
  return self->_sema;
}

@end