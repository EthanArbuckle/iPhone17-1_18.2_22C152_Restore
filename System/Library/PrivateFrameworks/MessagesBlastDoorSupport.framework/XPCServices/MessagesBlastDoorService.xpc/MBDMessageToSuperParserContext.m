@interface MBDMessageToSuperParserContext
- (BOOL)supportsMessagePartNumbersInAttributes;
- (id)name;
@end

@implementation MBDMessageToSuperParserContext

- (id)name
{
  return @"MBDMessageToSuper";
}

- (BOOL)supportsMessagePartNumbersInAttributes
{
  return 1;
}

@end