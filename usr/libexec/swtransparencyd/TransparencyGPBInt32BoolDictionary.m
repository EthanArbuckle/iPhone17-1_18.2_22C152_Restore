@interface TransparencyGPBInt32BoolDictionary
- (BOOL)getBool:(BOOL *)a3 forKey:(int)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt32BoolDictionary)init;
- (TransparencyGPBInt32BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const int *)a4 count:(unint64_t)a5;
- (TransparencyGPBInt32BoolDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt32BoolDictionary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndBoolsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeBoolForKey:(int)a3;
- (void)setBool:(BOOL)a3 forKey:(int)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt32BoolDictionary

- (TransparencyGPBInt32BoolDictionary)init
{
  return [(TransparencyGPBInt32BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
}

- (TransparencyGPBInt32BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const int *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBInt32BoolDictionary;
  v8 = [(TransparencyGPBInt32BoolDictionary *)&v14 init];
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
          unsigned int v10 = *(unsigned __int8 *)a3++;
          v11 = +[NSNumber numberWithBool:v10];
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

- (TransparencyGPBInt32BoolDictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBInt32BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBInt32BoolDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBInt32BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt32BoolDictionary;
  [(TransparencyGPBInt32BoolDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBInt32BoolDictionary allocWithZone:a3];

  return [(TransparencyGPBInt32BoolDictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndBoolsUsingBlock:(id)a3
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
    [dictionary objectForKeyedSubscript:v6] ?: [v6 intValue] ?: objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "BOOLValue") ?: &v7;
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
    int v7 = [a3 mapKeyDataType];
    id v8 = [(NSMutableDictionary *)dictionary keyEnumerator];
    id v9 = [v8 nextObject];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0;
      do
      {
        id v12 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v10];
        uint64_t v13 = sub_1000CE104([v10 intValue], 1, v7);
        [v12 BOOLValue];
        uint64_t v14 = sub_1000CA038(2) + v13;
        v11 += v14 + sub_1000C838C(v14);
        id v10 = [v8 nextObject];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    return v11 + sub_1000CA594(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = [a4 mapKeyDataType];
  uint64_t v8 = sub_1000FA704(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  id v10 = [(NSMutableDictionary *)dictionary keyEnumerator];
  id v11 = [v10 nextObject];
  if (v11)
  {
    id v12 = v11;
    do
    {
      id v13 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v12];
      [a3 writeInt32NoTag:v8];
      id v14 = [v12 intValue];
      id v15 = [v13 BOOLValue];
      int v16 = sub_1000CE104(v14, 1, v7);
      [a3 writeInt32NoTag:sub_1000CA038(2) + v16];
      sub_1000CE2A4(a3, (uint64_t)v14, 1, v7);
      [a3 writeBool:2 value:v15];
      id v12 = [v10 nextObject];
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithBool:a3->var0];
  int v7 = +[NSNumber numberWithInt:a4->var3];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D4F04;
  v3[3] = &unk_10013B0D0;
  v3[4] = a3;
  [(TransparencyGPBInt32BoolDictionary *)self enumerateKeysAndBoolsUsingBlock:v3];
}

- (BOOL)getBool:(BOOL *)a3 forKey:(int)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithInt:*(void *)&a4]];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 BOOLValue];
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

- (void)setBool:(BOOL)a3 forKey:(int)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3) forKey:+[NSNumber numberWithInt:*(void *)&a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_1000EB648(autocreator, (uint64_t)self);
  }
}

- (void)removeBoolForKey:(int)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithInt:*(void *)&a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end