@interface PFSharedDispatchQueues
+ (id)localAssetSupportWorkQueue;
- (PFSharedDispatchQueues)init;
@end

@implementation PFSharedDispatchQueues

+ (id)localAssetSupportWorkQueue
{
  if (qword_1EB76E160 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB76E150;
  return v2;
}

- (PFSharedDispatchQueues)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharedDispatchQueues();
  return [(PFSharedDispatchQueues *)&v3 init];
}

@end