@interface AccountChannelsProvider
- (void)notifyObserver;
@end

@implementation AccountChannelsProvider

- (void)notifyObserver
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_getObjectType();
    swift_retain();
    dispatch thunk of AccountChannelsProviderUpdateObserver.accountChannelsDidUpdate()();
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end