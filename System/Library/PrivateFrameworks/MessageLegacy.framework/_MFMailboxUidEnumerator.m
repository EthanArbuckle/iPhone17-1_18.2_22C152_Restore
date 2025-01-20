@interface _MFMailboxUidEnumerator
- (_MFMailboxUidEnumerator)initWithMailbox:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation _MFMailboxUidEnumerator

- (id)nextObject
{
  unint64_t index = self->_index;
  if (index >= [(NSMutableArray *)self->_mailboxes count]) {
    return 0;
  }
  return (id)[(NSMutableArray *)self->_mailboxes objectAtIndex:self->_index++];
}

- (_MFMailboxUidEnumerator)initWithMailbox:(id)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)_MFMailboxUidEnumerator;
    v4 = [(_MFMailboxUidEnumerator *)&v7 init];
    if (v4)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v4->_mailboxes = v5;
      [a3 addToPostOrderTraversal:v5];
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MFMailboxUidEnumerator;
  [(_MFMailboxUidEnumerator *)&v3 dealloc];
}

@end