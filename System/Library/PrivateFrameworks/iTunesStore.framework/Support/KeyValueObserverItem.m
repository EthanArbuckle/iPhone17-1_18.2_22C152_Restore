@interface KeyValueObserverItem
- (KeyValueObserverItem)initWithObject:(id)a3 keyPath:(id)a4 block:(id)a5;
- (NSString)keyPath;
- (id)block;
- (id)object;
- (void)dealloc;
@end

@implementation KeyValueObserverItem

- (KeyValueObserverItem)initWithObject:(id)a3 keyPath:(id)a4 block:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)KeyValueObserverItem;
  v8 = [(KeyValueObserverItem *)&v10 init];
  if (v8)
  {
    v8->_block = [a5 copy];
    v8->_keyPath = (NSString *)[a4 copy];
    v8->_object = a3;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KeyValueObserverItem;
  [(KeyValueObserverItem *)&v3 dealloc];
}

- (id)block
{
  return self->_block;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)object
{
  return self->_object;
}

@end