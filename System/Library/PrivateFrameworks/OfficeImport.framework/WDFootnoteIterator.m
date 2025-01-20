@interface WDFootnoteIterator
- (BOOL)test:(id)a3;
@end

@implementation WDFootnoteIterator

- (BOOL)test:(id)a3
{
  return [a3 runType] == 1;
}

@end