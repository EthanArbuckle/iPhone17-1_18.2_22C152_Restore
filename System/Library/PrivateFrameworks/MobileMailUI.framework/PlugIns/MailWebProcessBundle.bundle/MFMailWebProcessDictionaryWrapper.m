@interface MFMailWebProcessDictionaryWrapper
- (JSValue)onChangeCallback;
- (MFMailWebProcessDictionaryWrapper)init;
- (MFMailWebProcessDictionaryWrapper)initWithName:(id)a3;
- (NSDictionary)dictionary;
- (NSString)name;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setName:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setOnChangeCallback:(id)a3;
- (void)setValuesForKeysWithDictionary:(id)a3;
@end

@implementation MFMailWebProcessDictionaryWrapper

- (MFMailWebProcessDictionaryWrapper)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMailWebProcessDictionaryWrapper;
  v6 = [(MFMailWebProcessDictionaryWrapper *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    storage = v7->_storage;
    v7->_storage = v8;
  }
  return v7;
}

- (MFMailWebProcessDictionaryWrapper)init
{
  return [(MFMailWebProcessDictionaryWrapper *)self initWithName:0];
}

- (void)setDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (NSMutableDictionary *)[v4 mutableCopy];
  storage = self->_storage;
  self->_storage = v5;

  if (self->_onChangeCallback)
  {
    v7 = [v4 allKeys];
    onChangeCallback = self->_onChangeCallback;
    objc_super v11 = v7;
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
    id v10 = [(JSValue *)onChangeCallback callWithArguments:v9];
  }
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)self->_storage;
}

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = [(MFMailWebProcessDictionaryWrapper *)self objectForKey:a3];
  return v3;
}

- (id)objectForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:a3];
  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[NSNull null];
  }
  [(NSMutableDictionary *)self->_storage setObject:v6 forKeyedSubscript:v7];
  onChangeCallback = self->_onChangeCallback;
  if (onChangeCallback)
  {
    id v12 = v7;
    v9 = +[NSArray arrayWithObjects:&v12 count:1];
    v13 = v9;
    id v10 = +[NSArray arrayWithObjects:&v13 count:1];
    id v11 = [(JSValue *)onChangeCallback callWithArguments:v10];
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_storage removeObjectForKey:v4];
  onChangeCallback = self->_onChangeCallback;
  if (onChangeCallback)
  {
    id v9 = v4;
    id v6 = +[NSArray arrayWithObjects:&v9 count:1];
    id v10 = v6;
    id v7 = +[NSArray arrayWithObjects:&v10 count:1];
    id v8 = [(JSValue *)onChangeCallback callWithArguments:v7];
  }
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v4 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (!v5) {
    goto LABEL_13;
  }
  char v6 = 0;
  uint64_t v7 = *(void *)v19;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
      id v10 = [v4 objectForKeyedSubscript:v9];
      id v11 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:v9];
      unsigned __int8 v12 = [v10 isEqual:v11];

      if ((v12 & 1) == 0)
      {
        v13 = [v4 objectForKeyedSubscript:v9];
        [(NSMutableDictionary *)self->_storage setObject:v13 forKeyedSubscript:v9];

        char v6 = 1;
      }
    }
    id v5 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  }
  while (v5);

  if (v6)
  {
    onChangeCallback = self->_onChangeCallback;
    if (onChangeCallback)
    {
      id obj = [v4 allKeys];
      id v22 = obj;
      v15 = +[NSArray arrayWithObjects:&v22 count:1];
      id v16 = [(JSValue *)onChangeCallback callWithArguments:v15];

LABEL_13:
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (JSValue)onChangeCallback
{
  return self->_onChangeCallback;
}

- (void)setOnChangeCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onChangeCallback, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end