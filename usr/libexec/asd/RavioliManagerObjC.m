@interface RavioliManagerObjC
+ (_TtC3asd18RavioliManagerObjC)shared;
- (_TtC3asd18RavioliManagerObjC)init;
- (void)triggerImmediateRavioliFetchWithBagID:(id)a3 notificationId:(id)a4 completion:(id)a5;
- (void)triggerRavioliFetchWithBagID:(id)a3 notificationId:(id)a4 completion:(id)a5;
@end

@implementation RavioliManagerObjC

+ (_TtC3asd18RavioliManagerObjC)shared
{
  id v2 = static RavioliManagerObjC.shared.getter();

  return (_TtC3asd18RavioliManagerObjC *)v2;
}

- (_TtC3asd18RavioliManagerObjC)init
{
  return (_TtC3asd18RavioliManagerObjC *)sub_1000682E4();
}

- (void)triggerRavioliFetchWithBagID:(id)a3 notificationId:(id)a4 completion:(id)a5
{
}

- (void)triggerImmediateRavioliFetchWithBagID:(id)a3 notificationId:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
}

@end