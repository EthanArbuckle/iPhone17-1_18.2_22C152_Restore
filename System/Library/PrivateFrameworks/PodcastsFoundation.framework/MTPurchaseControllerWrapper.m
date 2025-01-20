@interface MTPurchaseControllerWrapper
+ (MTPurchaseControllerWrapper)sharedInstance;
- (MTPurchaseControllerWrapper)init;
- (void)fetchChannelUpdatesCheckingEntitlementsNotification;
- (void)forceFetchLatestChannelUpdates;
- (void)syncMusicSubscriptionInformation;
@end

@implementation MTPurchaseControllerWrapper

+ (MTPurchaseControllerWrapper)sharedInstance
{
  if (qword_1EB7680C8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB7680B8;
  return (MTPurchaseControllerWrapper *)v2;
}

- (MTPurchaseControllerWrapper)init
{
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  id v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EB7675A8));
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___MTPurchaseControllerWrapper_purchaseController) = (Class)sub_1ACAF000C((uint64_t)v7);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PurchaseControllerWrapper();
  return [(MTPurchaseControllerWrapper *)&v6 init];
}

- (void)forceFetchLatestChannelUpdates
{
  v2 = self;
  sub_1ACAEF544();
}

- (void)fetchChannelUpdatesCheckingEntitlementsNotification
{
  v2 = self;
  sub_1ACAEFA48();
}

- (void)syncMusicSubscriptionInformation
{
  v2 = self;
  sub_1ACCE3320(0, (uint64_t)sub_1ACCA8A08, 0);
}

- (void).cxx_destruct
{
}

@end