@interface NetworkReachability
+ (id)sharedNetworkReachability;
- (_TtC8StocksUI19NetworkReachability)init;
@end

@implementation NetworkReachability

+ (id)sharedNetworkReachability
{
  if (qword_26AC71000 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AC70FF8;

  return v2;
}

- (_TtC8StocksUI19NetworkReachability)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(FCNetworkReachability *)&v3 init];
}

@end