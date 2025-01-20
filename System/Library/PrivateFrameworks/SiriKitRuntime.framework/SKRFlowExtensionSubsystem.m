@interface SKRFlowExtensionSubsystem
+ (id)initForPlugInKit;
- (SKRFlowExtensionSubsystem)init;
@end

@implementation SKRFlowExtensionSubsystem

+ (id)initForPlugInKit
{
  objc_msgSend(self, sel__startListening);
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FlowExtensionSubsystem()), sel_init);

  return v2;
}

- (SKRFlowExtensionSubsystem)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FlowExtensionSubsystem();
  return [(SKRFlowExtensionSubsystem *)&v3 init];
}

@end