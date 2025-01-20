@interface JSContext(RWIExtras)
- (RWIProtocolInspector)_inspector;
@end

@implementation JSContext(RWIExtras)

- (RWIProtocolInspector)_inspector
{
  AssociatedObject = (RWIProtocolInspector *)objc_getAssociatedObject(a1, &-[JSContext(RWIExtras) _inspector]::rwiProtocolInspectorAssociatedObjectKey);
  if (!AssociatedObject)
  {
    [a1 JSGlobalContextRef];
    AssociatedObject = [[RWIProtocolInspector alloc] initWithController:JSGlobalContextGetAugmentableInspectorController()];
    objc_setAssociatedObject(a1, &-[JSContext(RWIExtras) _inspector]::rwiProtocolInspectorAssociatedObjectKey, AssociatedObject, (void *)0x301);
    if (AssociatedObject) {
      CFRelease(AssociatedObject);
    }
  }
  return AssociatedObject;
}

@end