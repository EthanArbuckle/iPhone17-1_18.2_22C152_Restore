@interface TransparencyGPBUInt32Int32Dictionary
- (BOOL)getInt32:(int *)a3 forKey:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBUInt32Int32Dictionary)init;
- (TransparencyGPBUInt32Int32Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBUInt32Int32Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBUInt32Int32Dictionary)initWithInt32s:(const int *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5;
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
- (void)removeInt32ForKey:(unsigned int)a3;
- (void)setInt32:(int)a3 forKey:(unsigned int)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBUInt32Int32Dictionary

- (TransparencyGPBUInt32Int32Dictionary)init
{
  return [(TransparencyGPBUInt32Int32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
}

- (TransparencyGPBUInt32Int32Dictionary)initWithInt32s:(const int *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBUInt32Int32Dictionary;
  v8 = [(TransparencyGPBUInt32Int32Dictionary *)&v14 init];
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
          [(NSMutableDictionary *)dictionary setObject:v11 forKey:+[NSNumber numberWithUnsignedInt:v12]];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBUInt32Int32Dictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBUInt32Int32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBUInt32Int32Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBUInt32Int32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBUInt32Int32Dictionary;
  [(TransparencyGPBUInt32Int32Dictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBUInt32Int32Dictionary allocWithZone:a3];

  return [(TransparencyGPBUInt32Int32Dictionary *)v4 initWithDictionary:self];
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, [v6 unsignedIntValue], [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "intValue")], &v7);
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
        uint64_t v14 = sub_10013EAE8([v11 unsignedIntValue], 1, v8);
        uint64_t v15 = sub_10013F3DC([v13 intValue], 2, v7) + v14;
        v12 += v15 + sub_100139664(v15);
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
      id v15 = [v13 unsignedIntValue];
      id v16 = [v14 intValue];
      LODWORD(v14) = sub_10013EAE8(v15, 1, v8);
      [a3 writeInt32NoTag:sub_10013F3DC(v16, 2, v7) + v14];
      if (v8 == 1)
      {
        [a3 writeFixed32:1 value:v15];
      }
      else if (v8 == 11)
      {
        [a3 writeUInt32:1 value:v15];
      }
      sub_10013F57C(a3, (uint64_t)v16, 2, v7);
      id v13 = [v11 nextObject];
    }
    while (v13);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithInt:a3->var3];
  int v7 = +[NSNumber numberWithUnsignedInt:a4->var3];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10013F684;
  v3[3] = &unk_1002C25B0;
  v3[4] = a3;
  [(TransparencyGPBUInt32Int32Dictionary *)self enumerateKeysAndInt32sUsingBlock:v3];
}

- (BOOL)getInt32:(int *)a3 forKey:(unsigned int)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithUnsignedInt:*(void *)&a4]];
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
      sub_10015C920(autocreator, (uint64_t)self);
    }
  }
}

- (void)setInt32:(int)a3 forKey:(unsigned int)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(void *)&a3) forKey:+[NSNumber numberWithUnsignedInt:*(void *)&a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10015C920(autocreator, (uint64_t)self);
  }
}

- (void)removeInt32ForKey:(unsigned int)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end