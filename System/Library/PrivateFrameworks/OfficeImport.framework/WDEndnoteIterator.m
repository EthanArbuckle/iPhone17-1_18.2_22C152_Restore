@interface WDEndnoteIterator
- (BOOL)test:(id)a3;
@end

@implementation WDEndnoteIterator

- (BOOL)test:(id)a3
{
  return [a3 runType] == 2;
}

@end