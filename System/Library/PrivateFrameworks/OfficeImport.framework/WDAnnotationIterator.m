@interface WDAnnotationIterator
- (BOOL)test:(id)a3;
@end

@implementation WDAnnotationIterator

- (BOOL)test:(id)a3
{
  return [a3 runType] == 9;
}

@end