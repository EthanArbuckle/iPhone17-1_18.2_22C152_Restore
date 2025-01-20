@interface PHOrientationMonitorComposer
- (PHOrientationMonitorComposer)init;
- (id)compose;
@end

@implementation PHOrientationMonitorComposer

- (PHOrientationMonitorComposer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrientationMonitorComposer();
  return [(PHOrientationMonitorComposer *)&v3 init];
}

- (id)compose
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = sub_10000FEA8();
  swift_release();

  return v2;
}

@end