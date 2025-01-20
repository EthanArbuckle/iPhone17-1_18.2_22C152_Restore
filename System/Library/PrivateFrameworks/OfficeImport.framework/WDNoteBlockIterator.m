@interface WDNoteBlockIterator
- (id)childIteratorFrom:(id)a3;
- (id)newChildIteratorFrom:(id)a3;
@end

@implementation WDNoteBlockIterator

- (id)childIteratorFrom:(id)a3
{
  v3 = [a3 text];
  v4 = [v3 blockIterator];

  return v4;
}

- (id)newChildIteratorFrom:(id)a3
{
  v3 = [a3 text];
  v4 = (void *)[v3 newBlockIterator];

  return v4;
}

@end