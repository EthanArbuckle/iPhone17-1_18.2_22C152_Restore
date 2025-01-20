@interface TransparencyGPBInt32Int32Dictionary
- (BOOL)getInt32:(int *)a3 forKey:(int)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt32Int32Dictionary)init;
- (TransparencyGPBInt32Int32Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt32Int32Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBInt32Int32Dictionary)initWithInt32s:(const int *)a3 forKeys:(const int *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndInt32sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeInt32ForKey:(int)a3;
- (void)setInt32:(int)a3 forKey:(int)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt32Int32Dictionary

- (TransparencyGPBInt32Int32Dictionary)init
{
  return [(TransparencyGPBInt32Int32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
}

- (TransparencyGPBInt32Int32Dictionary)initWithInt32s:(const int *)a3 forKeys:(const int *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBInt32Int32Dictionary;
  v8 = [(TransparencyGPBInt32Int32Dictionary *)&v14 init];
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
          unsigned int v10 = *a3++;
          v11 = +[NSNumber numberWithInt:v10];
          unsigned int v12 = *a4++;
          [(NSMutableDictionary *)dictionary setObject:v11 forKey:+[NSNumber numberWithInt:v12]];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBInt32Int32Dictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBInt32Int32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBInt32Int32Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBInt32Int32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt32Int32Dictionary;
  [(TransparencyGPBInt32Int32Dictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBInt32Int32Dictionary allocWithZone:a3];

  return [(TransparencyGPBInt32Int32Dictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndInt32sUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, [v6 intValue], [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "intValue") intValue], &v7);
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
        uint64_t v14 = sub_1000CE104([v11 intValue], 1, v8);
        uint64_t v15 = sub_1000CE104([v13 intValue], 2, v7) + v14;
        v12 += v15 + sub_1000C838C(v15);
        id v11 = [v9 nextObject];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    return v12 + sub_1000CA594(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30);
  int v8 = [a4 mapKeyDataType];
  uint64_t v9 = sub_1000FA704(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
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
      id v16 = [v14 intValue];
      int v17 = sub_1000CE104(v15, 1, v8);
      [a3 writeInt32NoTag:sub_1000CE104(v16, 2, v7) + v17];
      sub_1000CE2A4(a3, (uint64_t)v15, 1, v8);
      sub_1000CE2A4(a3, (uint64_t)v16, 2, v7);
      id v13 = [v11 nextObject];
    }
    while (v13);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithInt:a3->var3];
  int v7 = +[NSNumber numberWithInt:a4->var3];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D35A4;
  v3[3] = &unk_10013B058;
  v3[4] = a3;
  [(TransparencyGPBInt32Int32Dictionary *)self enumerateKeysAndInt32sUsingBlock:v3];
}

- (BOOL)getInt32:(int *)a3 forKey:(int)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithInt:*(void *)&a4]];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 intValue];
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
      sub_1000EB648(autocreator, (uint64_t)self);
    }
  }
}

- (void)setInt32:(int)a3 forKey:(int)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(void *)&a3) forKey:+[NSNumber numberWithInt:*(void *)&a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_1000EB648(autocreator, (uint64_t)self);
  }
}

- (void)removeInt32ForKey:(int)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithInt:*(void *)&a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end