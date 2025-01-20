@interface VolumeController.Delegate
- (_TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate)init;
- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation VolumeController.Delegate

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    sub_1002C761C();
    id v6 = a3;
    v7 = self;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

    swift_release();
    swift_release();
  }
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1002C76B0();
}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    sub_1002C761C();
    id v6 = a3;
    v7 = self;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

    swift_release();
    swift_release();
  }
}

- (_TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate)init
{
  swift_weakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VolumeController.Delegate();
  return [(VolumeController.Delegate *)&v4 init];
}

- (void).cxx_destruct
{
}

@end