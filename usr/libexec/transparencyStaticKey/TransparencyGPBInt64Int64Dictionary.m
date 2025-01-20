@interface TransparencyGPBInt64Int64Dictionary
- (BOOL)getInt64:(int64_t *)a3 forKey:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt64Int64Dictionary)init;
- (TransparencyGPBInt64Int64Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt64Int64Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBInt64Int64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndInt64sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeInt64ForKey:(int64_t)a3;
- (void)setInt64:(int64_t)a3 forKey:(int64_t)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt64Int64Dictionary

- (TransparencyGPBInt64Int64Dictionary)init
{
  return [(TransparencyGPBInt64Int64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
}

- (TransparencyGPBInt64Int64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBInt64Int64Dictionary;
  v8 = [(TransparencyGPBInt64Int64Dictionary *)&v14 init];
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          dictionary = v8->_dictionary;
          uint64_t v10 = *a3++;
          v11 = +[NSNumber numberWithLongLong:v10];
          uint64_t v12 = *a4++;
          [(NSMutableDictionary *)dictionary setObject:v11 forKey:+[NSNumber numberWithLongLong:v12]];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBInt64Int64Dictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBInt64Int64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBInt64Int64Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBInt64Int64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt64Int64Dictionary;
  [(TransparencyGPBInt64Int64Dictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBInt64Int64Dictionary allocWithZone:a3];

  return [(TransparencyGPBInt64Int64Dictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndInt64sUsingBlock:(id)a3
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
    [dictionary objectForKeyedSubscript:v6]
  }
  while (!v7);
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
        uint64_t v14 = sub_10003E244((unint64_t)[v11 longLongValue], 1, v8);
        uint64_t v15 = sub_10003E244((unint64_t)[v13 longLongValue], 2, v7) + v14;
        v12 += v15 + sub_10001BE44(v15);
        id v11 = [v9 nextObject];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    return v12 + sub_10001E054(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30);
  int v8 = [a4 mapKeyDataType];
  uint64_t v9 = sub_100027BFC(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
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
      id v15 = [v13 longLongValue];
      id v16 = [v14 longLongValue];
      int v17 = sub_10003E244((unint64_t)v15, 1, v8);
      [a3 writeInt32NoTag:sub_10003E244((unint64_t)v16, 2, v7) + v17];
      sub_10003E3E4(a3, (uint64_t)v15, 1, v8);
      sub_10003E3E4(a3, (uint64_t)v16, 2, v7);
      id v13 = [v11 nextObject];
    }
    while (v13);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithLongLong:a3->var2];
  int v7 = +[NSNumber numberWithLongLong:a4->var2];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004D7AC;
  v3[3] = &unk_10008E560;
  v3[4] = a3;
  [(TransparencyGPBInt64Int64Dictionary *)self enumerateKeysAndInt64sUsingBlock:v3];
}

- (BOOL)getInt64:(int64_t *)a3 forKey:(int64_t)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithLongLong:a4]];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = (int64_t)[v5 longLongValue];
  }
  return v6 != 0;
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    [(NSMutableDictionary *)self->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
    autocreator = self->_autocreator;
    if (autocreator)
    {
      sub_10002DBEC(autocreator, (uint64_t)self);
    }
  }
}

- (void)setInt64:(int64_t)a3 forKey:(int64_t)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3) forKey:+[NSNumber numberWithLongLong:a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10002DBEC(autocreator, (uint64_t)self);
  }
}

- (void)removeInt64ForKey:(int64_t)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithLongLong:a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end