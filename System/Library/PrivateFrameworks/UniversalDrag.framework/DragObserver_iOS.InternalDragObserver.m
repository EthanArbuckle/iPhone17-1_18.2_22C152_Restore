@interface DragObserver_iOS.InternalDragObserver
- (BOOL)dragMonitorSessionShouldHideLocalDragDisplay:(id)a3;
- (_TtCC13UniversalDrag16DragObserver_iOSP33_46F4F7DBF7EBE5237C36EDB049F4D13E20InternalDragObserver)init;
- (void)dragMonitor:(id)a3 didBeginDragSession:(id)a4;
- (void)dragMonitor:(id)a3 didEndDragSessionWithIdentifier:(unsigned int)a4;
- (void)dragMonitorSession:(id)a3 didConnectWithItems:(id)a4;
- (void)dragMonitorSession:(id)a3 didUpdateDragPresentation:(id)a4;
@end

@implementation DragObserver_iOS.InternalDragObserver

- (void)dragMonitor:(id)a3 didBeginDragSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_26079EFE8((int)v6, v7);
}

- (void)dragMonitor:(id)a3 didEndDragSessionWithIdentifier:(unsigned int)a4
{
  id v6 = a3;
  id v7 = self;
  sub_26079F0F0((uint64_t)v6, a4);
}

- (void)dragMonitorSession:(id)a3 didConnectWithItems:(id)a4
{
  sub_260760514(0, (unint64_t *)&unk_26A8A8F40);
  uint64_t v5 = sub_2607BD5E0();
  nullsub_1(a3, v5);

  swift_bridgeObjectRelease();
}

- (void)dragMonitorSession:(id)a3 didUpdateDragPresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_26079F2E8(v6, v7);
}

- (BOOL)dragMonitorSessionShouldHideLocalDragDisplay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_26079F60C();

  return self & 1;
}

- (_TtCC13UniversalDrag16DragObserver_iOSP33_46F4F7DBF7EBE5237C36EDB049F4D13E20InternalDragObserver)init
{
  return (_TtCC13UniversalDrag16DragObserver_iOSP33_46F4F7DBF7EBE5237C36EDB049F4D13E20InternalDragObserver *)sub_26079F6A4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_weakDestroy();
}

@end