@interface TUIElementIf
+ (BOOL)evaluateAttributes;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
@end

@implementation TUIElementIf

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (BOOL)evaluateAttributes
{
  return 0;
}

@end