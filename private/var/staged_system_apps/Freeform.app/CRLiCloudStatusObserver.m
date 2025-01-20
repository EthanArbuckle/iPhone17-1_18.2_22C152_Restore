@interface CRLiCloudStatusObserver
+ (void)qa_resetConnectICloudDialog:(id)a3;
@end

@implementation CRLiCloudStatusObserver

+ (void)qa_resetConnectICloudDialog:(id)a3
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  id v3 = [self standardUserDefaults];
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 removeObjectForKey:v4];

  sub_100522F00((uint64_t)v5, &qword_101672BF0);
}

@end