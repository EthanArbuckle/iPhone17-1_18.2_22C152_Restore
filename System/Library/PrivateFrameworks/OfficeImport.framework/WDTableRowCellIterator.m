@interface WDTableRowCellIterator
- (id)childIteratorFrom:(id)a3;
- (id)newChildIteratorFrom:(id)a3;
@end

@implementation WDTableRowCellIterator

- (id)childIteratorFrom:(id)a3
{
  v3 = [a3 cellIterator];
  return v3;
}

- (id)newChildIteratorFrom:(id)a3
{
  return (id)[a3 newCellIterator];
}

@end