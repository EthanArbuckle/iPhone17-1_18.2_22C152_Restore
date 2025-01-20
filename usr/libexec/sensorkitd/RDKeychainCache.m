@interface RDKeychainCache
- (BOOL)addToKeychainKey:(id)a3 withName:(id)a4 sensor:(id)a5;
- (BOOL)removeFromKeychain:(id)a3;
- (RDKeychainCache)init;
- (id)keyDataFromKeyChainWithName:(id)a3;
- (id)keyNamesForSensor:(id)a3;
@end

@implementation RDKeychainCache

- (RDKeychainCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)RDKeychainCache;
  v2 = [(RDKeychainCache *)&v4 init];
  if (v2) {
    v2->_cache = (NSCache *)objc_alloc_init((Class)NSCache);
  }
  return v2;
}

- (BOOL)addToKeychainKey:(id)a3 withName:(id)a4 sensor:(id)a5
{
  if (self)
  {
    v6 = self;
    -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", a3, a4, a5);
    LOBYTE(self) = [(NSCache *)v6->_cache objectForKey:a4] != 0;
  }
  return (char)self;
}

- (id)keyDataFromKeyChainWithName:(id)a3
{
  return [(NSCache *)self->_cache objectForKey:a3];
}

- (BOOL)removeFromKeychain:(id)a3
{
  return 1;
}

- (id)keyNamesForSensor:(id)a3
{
  return &__NSArray0__struct;
}

@end