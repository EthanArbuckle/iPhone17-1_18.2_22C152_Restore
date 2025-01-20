@interface _UIPopoverSceneSpecification
- (BOOL)isInternal;
- (BOOL)isUIKitManaged;
- (Class)uiSceneMinimumClass;
- (id)uiSceneSessionRole;
@end

@implementation _UIPopoverSceneSpecification

- (BOOL)isUIKitManaged
{
  return 1;
}

- (BOOL)isInternal
{
  return 1;
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

- (id)uiSceneSessionRole
{
  return @"UIWindowSceneSessionTypePopover";
}

@end