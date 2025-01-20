@interface _MFMailboxUidChildrenEnumerator
- (id)_initWithMailbox:(id)a3 includeHiddenChildren:(BOOL)a4;
- (id)nextObject;
@end

@implementation _MFMailboxUidChildrenEnumerator

- (id)nextObject
{
  unint64_t v3 = [(NSMutableArray *)self->_mailboxes count];
  while (self->_index < v3)
  {
    v4 = -[NSMutableArray objectAtIndex:](self->_mailboxes, "objectAtIndex:");
    v5 = v4;
    ++self->_index;
    if (self->_includeHidden || [v4 isVisible]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6) {
      goto LABEL_10;
    }
  }
  id v6 = 0;
LABEL_10:
  return v6;
}

- (void).cxx_destruct
{
}

- (id)_initWithMailbox:(id)a3 includeHiddenChildren:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MFMailboxUidChildrenEnumerator;
  v7 = [(_MFMailboxUidChildrenEnumerator *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 _mutableChildren];
    mailboxes = v7->_mailboxes;
    v7->_mailboxes = (NSMutableArray *)v8;

    v7->_includeHidden = a4;
  }

  return v7;
}

@end