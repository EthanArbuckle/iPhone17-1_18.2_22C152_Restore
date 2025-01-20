@interface W5WiFiActiveSnifferRequest
- (BhoundBpfFileDescriptor)activeBFD;
- (BhoundPcap)activePCap;
- (NSFileHandle)activeFileHandle;
- (OS_dispatch_source)timeoutTimer;
- (W5WiFiSnifferRequest)requestInfo;
- (void)dealloc;
- (void)setActiveBFD:(id)a3;
- (void)setActiveFileHandle:(id)a3;
- (void)setActivePCap:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation W5WiFiActiveSnifferRequest

- (void)dealloc
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    dispatch_release(timeoutTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)W5WiFiActiveSnifferRequest;
  [(W5WiFiActiveSnifferRequest *)&v4 dealloc];
}

- (W5WiFiSnifferRequest)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (NSFileHandle)activeFileHandle
{
  return self->_activeFileHandle;
}

- (void)setActiveFileHandle:(id)a3
{
}

- (BhoundBpfFileDescriptor)activeBFD
{
  return self->_activeBFD;
}

- (void)setActiveBFD:(id)a3
{
}

- (BhoundPcap)activePCap
{
  return self->_activePCap;
}

- (void)setActivePCap:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

@end