@interface RDStoreControllerCloudKitNetworkActivityObserver
- (BOOL)isObsolete;
- (_TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver)init;
- (void)updateNetworkActivityWithValue:(id)a3;
@end

@implementation RDStoreControllerCloudKitNetworkActivityObserver

- (BOOL)isObsolete
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  v3 = Strong;
  if (Strong) {

  }
  return v3 == 0;
}

- (void)updateNetworkActivityWithValue:(id)a3
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  id v5 = a3;
  v6 = self;
  [Strong cloudKitNetworkActivityDidUpdate:v5];
}

- (_TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver)init
{
  result = (_TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end