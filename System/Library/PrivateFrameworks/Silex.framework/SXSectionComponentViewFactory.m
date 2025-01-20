@interface SXSectionComponentViewFactory
- (id)type;
- (int)role;
@end

@implementation SXSectionComponentViewFactory

- (id)type
{
  return @"section";
}

- (int)role
{
  return 0;
}

@end