@interface _UIWebFormDelegateEditedFormsMap
- (_UIWebFormDelegateEditedFormsMap)init;
- (id)_keyForWebFrame:(id)a3;
- (id)allValues;
- (id)objectForKey:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _UIWebFormDelegateEditedFormsMap

- (_UIWebFormDelegateEditedFormsMap)init
{
  v4.receiver = self;
  v4.super_class = (Class)_UIWebFormDelegateEditedFormsMap;
  v2 = [(_UIWebFormDelegateEditedFormsMap *)&v4 init];
  if (v2)
  {
    v2->_lifetimeHelper = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
    v2->_map = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIWebFormDelegateEditedFormsMap;
  [(_UIWebFormDelegateEditedFormsMap *)&v3 dealloc];
}

- (id)_keyForWebFrame:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", a3);
}

- (id)objectForKey:(id)a3
{
  map = self->_map;
  id v4 = [(_UIWebFormDelegateEditedFormsMap *)self _keyForWebFrame:a3];
  return (id)[(NSMutableDictionary *)map objectForKey:v4];
}

- (id)allValues
{
  return (id)[(NSMutableDictionary *)self->_map allValues];
}

- (void)removeAllObjects
{
  [(NSMutableDictionary *)self->_map removeAllObjects];
  lifetimeHelper = self->_lifetimeHelper;
  [(NSMutableArray *)lifetimeHelper removeAllObjects];
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_map, "removeObjectForKey:", -[_UIWebFormDelegateEditedFormsMap _keyForWebFrame:](self, "_keyForWebFrame:"));
  lifetimeHelper = self->_lifetimeHelper;
  [(NSMutableArray *)lifetimeHelper removeObject:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (([(NSMutableArray *)self->_lifetimeHelper containsObject:a4] & 1) == 0) {
    [(NSMutableArray *)self->_lifetimeHelper addObject:a4];
  }
  map = self->_map;
  id v8 = [(_UIWebFormDelegateEditedFormsMap *)self _keyForWebFrame:a4];
  [(NSMutableDictionary *)map setObject:a3 forKey:v8];
}

@end