@interface WDBlockRunIterator
- (id)childIteratorFrom:(id)a3;
- (id)newChildIteratorFrom:(id)a3;
@end

@implementation WDBlockRunIterator

- (id)childIteratorFrom:(id)a3
{
  v3 = [a3 runIterator];
  return v3;
}

- (id)newChildIteratorFrom:(id)a3
{
  return (id)[a3 newRunIterator];
}

@end