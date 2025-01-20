@interface DOMOverflowEvent
- (BOOL)horizontalOverflow;
- (BOOL)verticalOverflow;
- (unsigned)orient;
@end

@implementation DOMOverflowEvent

- (unsigned)orient
{
  return 0;
}

- (BOOL)horizontalOverflow
{
  return 0;
}

- (BOOL)verticalOverflow
{
  return 0;
}

@end