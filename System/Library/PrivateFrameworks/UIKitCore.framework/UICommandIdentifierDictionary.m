@interface UICommandIdentifierDictionary
@end

@implementation UICommandIdentifierDictionary

void __72___UICommandIdentifierDictionary_intersectingIdentifiersFromDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[_UICommandIdentifier identifierWithAction:a2 propertyList:0];
  [v2 addObject:v3];
}

@end