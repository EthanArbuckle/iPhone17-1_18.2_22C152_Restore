@interface MSVLRUDictionaryNode
- (MSVLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4;
- (MSVLRUDictionaryNode)next;
- (MSVLRUDictionaryNode)prev;
- (id)copyWithZone:(_NSZone *)a3;
- (id)key;
- (id)object;
- (void)setNext:(id)a3;
- (void)setObject:(id)a3;
- (void)setPrev:(id)a3;
@end

@implementation MSVLRUDictionaryNode

- (id)object
{
  return self->_object;
}

- (void)setPrev:(id)a3
{
}

- (void)setNext:(id)a3
{
}

- (MSVLRUDictionaryNode)next
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_next);
  return (MSVLRUDictionaryNode *)WeakRetained;
}

- (MSVLRUDictionaryNode)prev
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prev);
  return (MSVLRUDictionaryNode *)WeakRetained;
}

- (MSVLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSVLRUDictionaryNode;
  v9 = [(MSVLRUDictionaryNode *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong(&v10->_object, a4);
  }

  return v10;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_prev);
  objc_destroyWeak((id *)&self->_next);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

- (id)key
{
  return self->_key;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MSVLRUDictionaryNode alloc];
  id key = self->_key;
  id object = self->_object;
  return [(MSVLRUDictionaryNode *)v4 initWithKey:key object:object];
}

@end