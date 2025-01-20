@interface UIDragMonitorSessionLifecyleListener
@end

@implementation UIDragMonitorSessionLifecyleListener

void __82___UIDragMonitorSessionLifecyleListener_dragDidBeginWithSession_identifier_reply___block_invoke(uint64_t a1)
{
  v4 = [[_UIDragMonitorSession alloc] initWithSessionIdentifier:*(unsigned int *)(a1 + 56) remoteControlProxy:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) delegate];
  v3 = [*(id *)(a1 + 40) dragMonitor];
  [v2 dragMonitor:v3 didBeginDragSession:v4];

  if ([(_UIDragMonitorSession *)v4 shouldHideLocalDragDisplay]) {
    [*(id *)(a1 + 32) disableDragDisplay];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [(_UIDragMonitorSession *)v4 connect];
}

void __74___UIDragMonitorSessionLifecyleListener_dragDidEndWithSession_identifier___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) dragMonitor];
  v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v4 dragMonitor:v2 didEndDragSessionWithIdentifier:v3];
}

@end