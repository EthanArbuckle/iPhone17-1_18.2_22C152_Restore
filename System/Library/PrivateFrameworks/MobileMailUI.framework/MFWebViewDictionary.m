@interface MFWebViewDictionary
- (BOOL)isEqualToDictionary:(id)a3;
- (MFWebViewDictionary)init;
- (MFWebViewDictionary)initWithCapacity:(unint64_t)a3;
- (NSString)javascriptName;
- (id)allKeys;
- (id)allKeysForObject:(id)a3;
- (id)allValues;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)keyEnumerator;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_setRequiresSynchronization;
- (void)_updateRemoteInstance;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
- (void)registerWithWebView:(id)a3 javascriptName:(id)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setValuesForKeysWithDictionary:(id)a3;
@end

@implementation MFWebViewDictionary

- (MFWebViewDictionary)initWithCapacity:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MFWebViewDictionary;
  v3 = [(MFWebViewDictionary *)&v9 init];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storage = v3->_storage;
    v3->_storage = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    changedKeys = v3->_changedKeys;
    v3->_changedKeys = v6;

    v3->_requiresResynchronization = 1;
  }
  return v3;
}

- (MFWebViewDictionary)init
{
  return [(MFWebViewDictionary *)self initWithCapacity:0];
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  v5 = [(NSMutableDictionary *)self->_storage descriptionWithLocale:a3 indent:a4];
  v6 = NSString;
  uint64_t v7 = objc_opt_class();
  javascriptName = self->_javascriptName;
  objc_super v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v10 = [v5 stringByTrimmingCharactersInSet:v9];
  v11 = [v6 stringWithFormat:@"<%@: %p> jsName='%@' => %@", v7, self, javascriptName, v10];

  return v11;
}

- (void)registerWithWebView:(id)a3 javascriptName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = (NSString *)[v6 copy];
  javascriptName = self->_javascriptName;
  self->_javascriptName = v7;

  objc_super v9 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3A20D78];
  v10 = [v13 _remoteObjectRegistry];
  v11 = [v10 remoteObjectProxyWithInterface:v9];
  webProcessProxy = self->_webProcessProxy;
  self->_webProcessProxy = v11;

  [(MFMailWebProcessProxy *)self->_webProcessProxy registerDictionary:self->_storage name:v6];
}

- (void)_setRequiresSynchronization
{
  self->_requiresResynchronization = 1;
}

- (void)_updateRemoteInstance
{
  if (self->_requiresResynchronization)
  {
    [(MFMailWebProcessProxy *)self->_webProcessProxy setDictionary:self->_storage forWebViewDictionaryWithName:self->_javascriptName];
    self->_requiresResynchronization = 0;
  }
  else
  {
    storage = self->_storage;
    v4 = [(NSMutableSet *)self->_changedKeys allObjects];
    id v5 = [(NSMutableDictionary *)storage dictionaryWithValuesForKeys:v4];

    [(MFMailWebProcessProxy *)self->_webProcessProxy setValuesForKeysWithDictionary:v5 forWebViewDictionaryWithName:self->_javascriptName];
    [(NSMutableSet *)self->_changedKeys removeAllObjects];
  }
}

- (BOOL)isEqualToDictionary:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  else {
    return [(NSMutableDictionary *)self->_storage isEqualToDictionary:*((void *)a3 + 1)];
  }
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_storage hash];
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_storage count];
}

- (id)objectForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:a3];
  return v3;
}

- (id)keyEnumerator
{
  return (id)[(NSMutableDictionary *)self->_storage keyEnumerator];
}

- (id)allKeys
{
  return (id)[(NSMutableDictionary *)self->_storage allKeys];
}

- (id)allKeysForObject:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_storage allKeysForObject:a3];
  return v3;
}

- (id)allValues
{
  return (id)[(NSMutableDictionary *)self->_storage allValues];
}

- (id)objectEnumerator
{
  return (id)[(NSMutableDictionary *)self->_storage objectEnumerator];
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  v4 = [(NSMutableDictionary *)self->_storage objectsForKeys:a3 notFoundMarker:a4];
  return v4;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
}

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:a3];
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableDictionary *)self->_storage countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary removeObjectForKey:](self->_storage, "removeObjectForKey:");
  [(NSMutableSet *)self->_changedKeys addObject:v4];
  [(MFWebViewDictionary *)self synchronize];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(NSMutableDictionary *)self->_storage setObject:v7 forKey:v6];
  [(NSMutableSet *)self->_changedKeys addObject:v6];
  [(MFWebViewDictionary *)self synchronize];
}

- (void)removeAllObjects
{
  [(NSMutableDictionary *)self->_storage removeAllObjects];
  [(MFWebViewDictionary *)self _setRequiresSynchronization];
  [(MFWebViewDictionary *)self synchronize];
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary removeObjectsForKeys:](self->_storage, "removeObjectsForKeys:");
  [(NSMutableSet *)self->_changedKeys addObjectsFromArray:v4];
  [(MFWebViewDictionary *)self synchronize];
}

- (void)setDictionary:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary setDictionary:](self->_storage, "setDictionary:");
  [(MFWebViewDictionary *)self _setRequiresSynchronization];
  [(MFWebViewDictionary *)self synchronize];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(NSMutableDictionary *)self->_storage setObject:v7 forKeyedSubscript:v6];
  [(NSMutableSet *)self->_changedKeys addObject:v6];
  [(MFWebViewDictionary *)self synchronize];
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  id v6 = a3;
  -[NSMutableDictionary setValuesForKeysWithDictionary:](self->_storage, "setValuesForKeysWithDictionary:");
  changedKeys = self->_changedKeys;
  id v5 = [v6 allKeys];
  [(NSMutableSet *)changedKeys addObjectsFromArray:v5];

  [(MFWebViewDictionary *)self synchronize];
}

- (NSString)javascriptName
{
  return self->_javascriptName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javascriptName, 0);
  objc_storeStrong((id *)&self->_changedKeys, 0);
  objc_storeStrong((id *)&self->_webProcessProxy, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end