@interface SSDoubleLinkedListNode
- (NSString)listIdentifier;
- (SSDoubleLinkedListNode)init;
- (SSDoubleLinkedListNode)initWithObject:(id)a3;
- (SSDoubleLinkedListNode)next;
- (SSDoubleLinkedListNode)previous;
- (id)object;
- (void)setListIdentifier:(id)a3;
- (void)setNext:(id)a3;
- (void)setObject:(id)a3;
- (void)setPrevious:(id)a3;
@end

@implementation SSDoubleLinkedListNode

- (SSDoubleLinkedListNode)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSDoubleLinkedListNode;
  v6 = [(SSDoubleLinkedListNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (void)setPrevious:(id)a3
{
}

- (void)setNext:(id)a3
{
}

- (void)setListIdentifier:(id)a3
{
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (SSDoubleLinkedListNode)init
{
  return [(SSDoubleLinkedListNode *)self initWithObject:0];
}

- (SSDoubleLinkedListNode)previous
{
  return self->_previous;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (SSDoubleLinkedListNode)next
{
  return self->_next;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_previous, 0);
}

@end