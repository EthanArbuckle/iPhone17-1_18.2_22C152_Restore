@interface NSSafeMutableDictionary
- (NSSafeMutableDictionary)init;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation NSSafeMutableDictionary

- (id)objectForKey:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  v6 = [(NSMutableDictionary *)self->_storage objectForKey:v5];

  [(NSLock *)self->_lock unlock];
  return v6;
}

- (NSSafeMutableDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)NSSafeMutableDictionary;
  v2 = [(NSSafeMutableDictionary *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    storage = v2->_storage;
    v2->_storage = v3;

    id v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v5;
  }
  return v2;
}

- (void)removeAllObjects
{
  [(NSLock *)self->_lock lock];
  [(NSMutableDictionary *)self->_storage removeAllObjects];
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)removeObjectForKey:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  [(NSMutableDictionary *)self->_storage removeObjectForKey:v5];

  v6 = self->_lock;
  [(NSLock *)v6 unlock];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  [(NSLock *)lock lock];
  [(NSMutableDictionary *)self->_storage setObject:v8 forKey:v7];

  v9 = self->_lock;
  [(NSLock *)v9 unlock];
}

- (id)keyEnumerator
{
  return (id)[(NSMutableDictionary *)self->_storage keyEnumerator];
}

- (unint64_t)count
{
  [(NSLock *)self->_lock lock];
  unint64_t v3 = [(NSMutableDictionary *)self->_storage count];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end