@interface TransparencyGPBInt32ObjectDictionary
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialized;
- (TransparencyGPBInt32ObjectDictionary)init;
- (TransparencyGPBInt32ObjectDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt32ObjectDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBInt32ObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const int *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(int)a3;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeObjectForKey:(int)a3;
- (void)setObject:(id)a3 forKey:(int)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt32ObjectDictionary

- (TransparencyGPBInt32ObjectDictionary)init
{
  return [(TransparencyGPBInt32ObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
}

- (TransparencyGPBInt32ObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const int *)a4 count:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TransparencyGPBInt32ObjectDictionary;
  v8 = [(TransparencyGPBInt32ObjectDictionary *)&v12 init];
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          v9 = *a3;
          if (!*a3)
          {
            +[NSException raise:NSInvalidArgumentException format:@"Attempting to add nil object to a Dictionary"];
            v9 = *a3;
          }
          unsigned int v10 = *a4++;
          [(NSMutableDictionary *)v8->_dictionary setObject:v9 forKey:+[NSNumber numberWithInt:v10]];
          ++a3;
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBInt32ObjectDictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBInt32ObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBInt32ObjectDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBInt32ObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt32ObjectDictionary;
  [(TransparencyGPBInt32ObjectDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBInt32ObjectDictionary allocWithZone:a3];

  return [(TransparencyGPBInt32ObjectDictionary *)v4 initWithDictionary:self];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  dictionary = self->_dictionary;
  uint64_t v6 = *((void *)a3 + 2);

  return [(NSMutableDictionary *)dictionary isEqual:v6];
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableDictionary *)self->_dictionary count];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p> { %@ }", objc_opt_class(), self, self->_dictionary];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_dictionary count];
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  char v7 = 0;
  dictionary = self->_dictionary;
  id v5 = [(NSMutableDictionary *)dictionary keyEnumerator];
  do
  {
    id v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, [v6 intValue], -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), &v7);
  }
  while (!v7);
}

- (BOOL)isInitialized
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->_dictionary objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      unsigned int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) isInitialized];
      if (!v7) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(TransparencyGPBInt32ObjectDictionary);
  id v6 = [(NSMutableDictionary *)self->_dictionary keyEnumerator];
  dictionary = v5->_dictionary;
  id v8 = [v6 nextObject];
  if (v8)
  {
    id v9 = v8;
    do
    {
      id v10 = [[self->_dictionary objectForKeyedSubscript:v9] copyWithZone:a3];
      [(NSMutableDictionary *)dictionary setObject:v10 forKey:v9];

      id v9 = [v6 nextObject];
    }
    while (v9);
  }
  return v5;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  dictionary = self->_dictionary;
  unint64_t result = (unint64_t)[(NSMutableDictionary *)dictionary count];
  if (result)
  {
    unint64_t v6 = result;
    int v7 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30);
    int v8 = [a3 mapKeyDataType];
    id v9 = [(NSMutableDictionary *)dictionary keyEnumerator];
    id v10 = [v9 nextObject];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      do
      {
        id v13 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v11];
        uint64_t v14 = sub_10013F3DC([v11 intValue], 1, v8);
        v15 = &sub_10013DFEC(v13, v7)[v14];
        v12 += (uint64_t)&v15[sub_100139664(v15)];
        id v11 = [v9 nextObject];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    return v12 + sub_10013B86C(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30);
  int v8 = [a4 mapKeyDataType];
  uint64_t v9 = sub_10016B9DC(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  id v11 = [(NSMutableDictionary *)dictionary keyEnumerator];
  id v12 = [v11 nextObject];
  if (v12)
  {
    id v13 = v12;
    do
    {
      id v14 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v13];
      [a3 writeInt32NoTag:v9];
      id v15 = [v13 intValue];
      int v16 = sub_10013F3DC(v15, 1, v8);
      [a3 writeInt32NoTag:sub_10013DFEC(v14, v7) + v16];
      sub_10013F57C(a3, (uint64_t)v15, 1, v8);
      sub_10013E120(a3, (const char *)v14, v7);
      id v13 = [v11 nextObject];
    }
    while (v13);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  int64_t var2 = a3->var2;
  unint64_t v6 = +[NSNumber numberWithInt:a4->var3];

  [(NSMutableDictionary *)dictionary setObject:var2 forKey:v6];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001487D4;
  v3[3] = &unk_1002C27E0;
  v3[4] = a3;
  [(TransparencyGPBInt32ObjectDictionary *)self enumerateKeysAndObjectsUsingBlock:v3];
}

- (id)objectForKey:(int)a3
{
  dictionary = self->_dictionary;
  id v4 = +[NSNumber numberWithInt:*(void *)&a3];

  return [(NSMutableDictionary *)dictionary objectForKey:v4];
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    [(NSMutableDictionary *)self->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
    autocreator = self->_autocreator;
    if (autocreator)
    {
      sub_10015C920(autocreator, (uint64_t)self);
    }
  }
}

- (void)setObject:(id)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3) {
    +[NSException raise:NSInvalidArgumentException format:@"Attempting to add nil object to a Dictionary"];
  }
  [(NSMutableDictionary *)self->_dictionary setObject:a3 forKey:+[NSNumber numberWithInt:v4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10015C920(autocreator, (uint64_t)self);
  }
}

- (void)removeObjectForKey:(int)a3
{
  dictionary = self->_dictionary;
  uint64_t v4 = +[NSNumber numberWithInt:*(void *)&a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end