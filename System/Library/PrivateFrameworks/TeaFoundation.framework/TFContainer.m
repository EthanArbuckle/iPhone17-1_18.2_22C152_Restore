@interface TFContainer
- (TFContainer)init;
- (TFContainer)initWithBundleAssemblies:(id)a3 assemblies:(id)a4;
- (TFResolver)resolver;
@end

@implementation TFContainer

- (TFResolver)resolver
{
  v2 = (void *)BridgedContainer.resolver.getter();

  return (TFResolver *)v2;
}

- (TFContainer)initWithBundleAssemblies:(id)a3 assemblies:(id)a4
{
  unint64_t v4 = sub_191EE8520();
  unint64_t v5 = sub_191EE8520();
  return (TFContainer *)BridgedContainer.init(bundleAssemblies:assemblies:)(v4, v5);
}

- (TFContainer)init
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

@end