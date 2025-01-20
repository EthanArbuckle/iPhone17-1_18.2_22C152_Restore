@interface TSKAddedToDocumentContext_PastingMatchStyle
- (BOOL)matchStyle;
- (id)description;
@end

@implementation TSKAddedToDocumentContext_PastingMatchStyle

- (id)description
{
  return @"Pasted Match Style";
}

- (BOOL)matchStyle
{
  return 1;
}

@end