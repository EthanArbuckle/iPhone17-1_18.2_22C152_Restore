@interface PMPasswordOptionsController
+ (id)makePasswordOptionsViewController;
- (PMPasswordOptionsController)init;
@end

@implementation PMPasswordOptionsController

+ (id)makePasswordOptionsViewController
{
  type metadata accessor for PMPasswordOptionsViewController();
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

  return v2;
}

- (PMPasswordOptionsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PMPasswordOptionsController;
  return [(PMPasswordOptionsController *)&v3 init];
}

@end