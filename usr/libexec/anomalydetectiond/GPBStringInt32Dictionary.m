@interface GPBStringInt32Dictionary
- (BOOL)getInt32:(int *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (GPBStringInt32Dictionary)init;
- (GPBStringInt32Dictionary)initWithCapacity:(unint64_t)a3;
- (GPBStringInt32Dictionary)initWithDictionary:(id)a3;
- (GPBStringInt32Dictionary)initWithInt32s:(const int *)a3 forKeys:(id *)a4 count:(unint64_t)a5;
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
- (void)removeInt32ForKey:(id)a3;
- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4;
- (void)setInt32:(int)a3 forKey:(id)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation GPBStringInt32Dictionary

- (GPBStringInt32Dictionary)init
{
  return [(GPBStringInt32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
}

- (GPBStringInt32Dictionary)initWithInt32s:(const int *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)GPBStringInt32Dictionary;
  v8 = [(GPBStringInt32Dictionary *)&v14 init];
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          if (!*a4) {
            +[NSException raise:NSInvalidArgumentException format:@"Attempting to add nil key to a Dictionary"];
          }
          dictionary = v8->_dictionary;
          unsigned int v10 = *a3++;
          v11 = +[NSNumber numberWithInt:v10];
          uint64_t v12 = (uint64_t)*a4++;
          [(NSMutableDictionary *)dictionary setObject:v11 forKey:v12];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (GPBStringInt32Dictionary)initWithDictionary:(id)a3
{
  v4 = [(GPBStringInt32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (GPBStringInt32Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(GPBStringInt32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDictionary.m", 8673, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator object file lineNumber description];
  }

  v3.receiver = self;
  v3.super_class = (Class)GPBStringInt32Dictionary;
  [(GPBStringInt32Dictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[GPBStringInt32Dictionary allocWithZone:a3];

  return [(GPBStringInt32Dictionary *)v4 initWithDictionary:self];
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
    [dictionary objectForKeyedSubscript:v6].intValue
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
    unsigned int v7 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30);
    unsigned int v8 = [a3 mapKeyDataType];
    id v9 = [(NSMutableDictionary *)dictionary keyEnumerator];
    id v10 = [v9 nextObject];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      do
      {
        id v13 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v11];
        objc_super v14 = sub_100301794(v11, v8);
        v15 = &v14[sub_1002EC618([v13 intValue], 2, v7)];
        v12 += (uint64_t)&v15[GPBComputeRawVarint32SizeForInteger(v15)];
        id v11 = [v9 nextObject];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    return v12 + GPBComputeWireFormatTagSize(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  unsigned int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30);
  unsigned int v8 = [a4 mapKeyDataType];
  uint64_t Tag = GPBWireFormatMakeTag(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  id v11 = [(NSMutableDictionary *)dictionary keyEnumerator];
  id v12 = [v11 nextObject];
  if (v12)
  {
    id v13 = v12;
    do
    {
      id v14 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v13];
      [a3 writeInt32NoTag:Tag];
      id v15 = [v14 intValue];
      unsigned int v16 = sub_100301794(v13, v8);
      [a3 writeInt32NoTag:sub_1002EC618(v15, 2, v7) + v16];
      sub_10030195C(a3, (uint64_t)v13, v8);
      sub_1002EC85C(a3, (uint64_t)v15, 2, v7);
      id v13 = [v11 nextObject];
    }
    while (v13);
  }
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithInt:a3->var3];
  int64_t var2 = a4->var2;

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:var2];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100302318;
  v3[3] = &unk_1003BAAC0;
  v3[4] = a3;
  [(GPBStringInt32Dictionary *)self enumerateKeysAndInt32sUsingBlock:v3];
}

- (BOOL)getInt32:(int *)a3 forKey:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:a4];
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
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setInt32:(int)a3 forKey:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!a4) {
    +[NSException raise:NSInvalidArgumentException format:@"Attempting to add nil key to a Dictionary"];
  }
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithInt:v5] forKey:a4];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeInt32ForKey:(id)a3
{
}

- (void)removeAll
{
}

@end