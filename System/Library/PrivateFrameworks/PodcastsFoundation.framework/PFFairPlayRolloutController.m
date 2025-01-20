@interface PFFairPlayRolloutController
+ (PFFairPlayRolloutController)sharedInstance;
- (BOOL)isEnabled;
- (PFFairPlayRolloutController)init;
- (void)didRollbackStatusChangeWithCompletion:(id)a3;
@end

@implementation PFFairPlayRolloutController

+ (PFFairPlayRolloutController)sharedInstance
{
  if (qword_1EB76C580 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB76C578;
  return (PFFairPlayRolloutController *)v2;
}

- (BOOL)isEnabled
{
  return _s18PodcastsFoundation25FairPlayRolloutControllerC9isEnabledSbyF_0() & 1;
}

- (void)didRollbackStatusChangeWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  FairPlayRolloutController.didRollbackStatusChange(completion:)((uint64_t)sub_1ACDDAB70, v5);

  swift_release();
}

- (PFFairPlayRolloutController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFFairPlayRolloutController____lazy_storage___internalQueue) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(PFFairPlayRolloutController *)&v5 init];
}

- (void).cxx_destruct
{
}

@end