@interface SSDoubleLinkedList
- (NSArray)allNodes;
- (NSString)listIdentifier;
- (SSDoubleLinkedList)init;
- (SSDoubleLinkedListNode)head;
- (SSDoubleLinkedListNode)tail;
- (id)appendObject:(id)a3;
- (id)description;
- (id)insertObject:(id)a3;
- (unint64_t)count;
- (void)appendNode:(id)a3;
- (void)insertNode:(id)a3;
- (void)removeAllNodes;
- (void)removeNode:(id)a3;
- (void)setHead:(id)a3;
- (void)setListIdentifier:(id)a3;
- (void)setTail:(id)a3;
@end

@implementation SSDoubleLinkedList

- (SSDoubleLinkedList)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSDoubleLinkedList;
  v2 = [(SSDoubleLinkedList *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    listIdentifier = v2->_listIdentifier;
    v2->_listIdentifier = (NSString *)v4;
  }
  return v2;
}

- (id)insertObject:(id)a3
{
  id v4 = a3;
  v5 = [[SSDoubleLinkedListNode alloc] initWithObject:v4];

  [(SSDoubleLinkedList *)self insertNode:v5];
  return v5;
}

- (void)insertNode:(id)a3
{
  id v9 = a3;
  id v4 = [v9 listIdentifier];

  if (v4)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"SSDoubleLinkedListInvalidNode" reason:@"Attempting to add a node that has already been added to another list." userInfo:0];
    objc_exception_throw(v8);
  }
  v5 = [(SSDoubleLinkedList *)self head];
  [(SSDoubleLinkedList *)self setHead:v9];
  v6 = [(SSDoubleLinkedList *)self tail];

  if (!v6) {
    [(SSDoubleLinkedList *)self setTail:v9];
  }
  [v9 setPrevious:0];
  [v9 setNext:v5];
  [v5 setPrevious:v9];
  objc_super v7 = [(SSDoubleLinkedList *)self listIdentifier];
  [v9 setListIdentifier:v7];

  ++self->_count;
}

- (SSDoubleLinkedListNode)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
}

- (void)setHead:(id)a3
{
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (SSDoubleLinkedListNode)head
{
  return self->_head;
}

- (NSArray)allNodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(SSDoubleLinkedList *)self head];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      [v3 addObject:v5];
      uint64_t v6 = [v5 next];

      v5 = (void *)v6;
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (void)appendNode:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 listIdentifier];

  if (v4)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"SSDoubleLinkedListInvalidNode" reason:@"Attempting to add a node that has already been added to another list." userInfo:0];
    objc_exception_throw(v8);
  }
  v5 = [(SSDoubleLinkedList *)self tail];
  [(SSDoubleLinkedList *)self setTail:v9];
  uint64_t v6 = [(SSDoubleLinkedList *)self head];

  if (!v6) {
    [(SSDoubleLinkedList *)self setHead:v9];
  }
  [v9 setPrevious:v5];
  [v9 setNext:0];
  [v5 setNext:v9];
  objc_super v7 = [(SSDoubleLinkedList *)self listIdentifier];
  [v9 setListIdentifier:v7];

  ++self->_count;
}

- (id)appendObject:(id)a3
{
  id v4 = a3;
  v5 = [[SSDoubleLinkedListNode alloc] initWithObject:v4];

  [(SSDoubleLinkedList *)self appendNode:v5];
  return v5;
}

- (void)removeAllNodes
{
  self->_count = 0;
}

- (void)removeNode:(id)a3
{
  id v15 = a3;
  id v4 = [v15 listIdentifier];
  v5 = [(SSDoubleLinkedList *)self listIdentifier];

  if (v4 != v5)
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"SSDoubleLinkedListInvalidNode" reason:@"Attempting to remove a node from a list it doesn't belong to." userInfo:0];
    objc_exception_throw(v14);
  }
  uint64_t v6 = [v15 next];
  objc_super v7 = [v15 previous];
  [v6 setPrevious:v7];

  id v8 = [v15 previous];
  id v9 = [v15 next];
  [v8 setNext:v9];

  id v10 = [(SSDoubleLinkedList *)self head];

  if (v10 == v15)
  {
    v11 = [v15 next];
    [(SSDoubleLinkedList *)self setHead:v11];
  }
  id v12 = [(SSDoubleLinkedList *)self tail];

  if (v12 == v15)
  {
    v13 = [v15 previous];
    [(SSDoubleLinkedList *)self setTail:v13];
  }
  [v15 setListIdentifier:0];
  --self->_count;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SSDoubleLinkedList *)self allNodes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 object];
        [v3 appendFormat:@"%@", v10];

        v11 = [(SSDoubleLinkedList *)self tail];

        if (v9 != v11) {
          [v3 appendString:@",\n"];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setListIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

@end