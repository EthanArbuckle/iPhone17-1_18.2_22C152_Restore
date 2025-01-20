@interface SyncControllerFactory
+ (Class)resolvedSyncClass;
+ (MTSyncControllerProtocol)resolvedSyncController;
- (_TtC8Podcasts21SyncControllerFactory)init;
@end

@implementation SyncControllerFactory

+ (MTSyncControllerProtocol)resolvedSyncController
{
  id v2 = [self sharedInstance];

  return (MTSyncControllerProtocol *)v2;
}

+ (Class)resolvedSyncClass
{
  sub_100376298();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8Podcasts21SyncControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncControllerFactory();
  return [(SyncControllerFactory *)&v3 init];
}

@end