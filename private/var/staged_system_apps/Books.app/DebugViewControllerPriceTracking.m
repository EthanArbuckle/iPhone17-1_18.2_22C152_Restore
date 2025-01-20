@interface DebugViewControllerPriceTracking
- (BKDebugViewSection)section;
- (DebugViewControllerPriceTracking)init;
- (DebugViewControllerPriceTracking)initWithOwner:(id)a3;
@end

@implementation DebugViewControllerPriceTracking

- (DebugViewControllerPriceTracking)initWithOwner:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(DebugViewControllerPriceTracking *)&v6 init];
}

- (DebugViewControllerPriceTracking)init
{
  result = (DebugViewControllerPriceTracking *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BKDebugViewSection)section
{
  v2 = self;
  id v3 = sub_1002C0A08();

  return (BKDebugViewSection *)v3;
}

@end