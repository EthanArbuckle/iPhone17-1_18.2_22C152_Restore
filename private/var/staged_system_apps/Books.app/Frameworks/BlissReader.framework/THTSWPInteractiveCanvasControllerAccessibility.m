@interface THTSWPInteractiveCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation THTSWPInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPInteractiveCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end