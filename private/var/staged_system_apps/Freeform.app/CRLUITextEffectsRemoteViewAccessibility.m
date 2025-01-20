@interface CRLUITextEffectsRemoteViewAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
@end

@implementation CRLUITextEffectsRemoteViewAccessibility

+ (id)crlaxTargetClassName
{
  return @"_UITextEffectsRemoteView";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end