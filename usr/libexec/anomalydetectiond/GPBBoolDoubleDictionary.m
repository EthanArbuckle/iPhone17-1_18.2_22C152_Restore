@interface GPBBoolDoubleDictionary
- (BOOL)getDouble:(double *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (GPBBoolDoubleDictionary)init;
- (GPBBoolDoubleDictionary)initWithCapacity:(unint64_t)a3;
- (GPBBoolDoubleDictionary)initWithDictionary:(id)a3;
- (GPBBoolDoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndDoublesUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeDoubleForKey:(BOOL)a3;
- (void)setDouble:(double)a3 forKey:(BOOL)a4;
- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation GPBBoolDoubleDictionary

- (GPBBoolDoubleDictionary)init
{
  return [(GPBBoolDoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
}

- (GPBBoolDoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)GPBBoolDoubleDictionary;
  result = [(GPBBoolDoubleDictionary *)&v13 init];
  if (result) {
    BOOL v9 = a5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    do
    {
      unsigned int v11 = *(unsigned __int8 *)a4++;
      uint64_t v10 = v11;
      double v12 = *a3++;
      result->_values[v10] = v12;
      result->_valueSet[v10] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (GPBBoolDoubleDictionary)initWithDictionary:(id)a3
{
  result = [(GPBBoolDoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
  if (a3 && result)
  {
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      if (*((unsigned char *)a3 + v5 + 32))
      {
        result->_values[v5] = *((double *)a3 + v5 + 2);
        result->_valueSet[v5] = 1;
      }
      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (GPBBoolDoubleDictionary)initWithCapacity:(unint64_t)a3
{
  return [(GPBBoolDoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDictionary.m", 11359, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator object file lineNumber description];
  }
  v3.receiver = self;
  v3.super_class = (Class)GPBBoolDoubleDictionary;
  [(GPBBoolDoubleDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[GPBBoolDoubleDictionary allocWithZone:a3];

  return [(GPBBoolDoubleDictionary *)v4 initWithDictionary:self];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 32)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 33)
      && (!self->_valueSet[0] || self->_values[0] == *((double *)a3 + 2))
      && (!self->_valueSet[1] || self->_values[1] == *((double *)a3 + 3));
}

- (unint64_t)hash
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithFormat:@"<%@ %p> {", objc_opt_class(), self];
  v4 = v3;
  if (self->_valueSet[0]) {
    [(NSMutableString *)v3 appendFormat:@"NO: %lf", *(void *)&self->_values[0]];
  }
  if (self->_valueSet[1]) {
    [(NSMutableString *)v4 appendFormat:@"YES: %lf", *(void *)&self->_values[1]];
  }
  [(NSMutableString *)v4 appendString:@" }"];
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getDouble:(double *)a3 forKey:(BOOL)a4
{
  BOOL v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4]) {
    *a3 = self->_values[a4];
  }
  return v4;
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  BOOL var0 = a4->var0;
  self->_values[var0] = a3->var6;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(a3, @"false", +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&self->_values[0]]);
  }
  if (self->_valueSet[1])
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&self->_values[1]];
    char v6 = (void (*)(id, const __CFString *, NSString *))*((void *)a3 + 2);
    v6(a3, @"true", v5);
  }
}

- (void)enumerateKeysAndDoublesUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, char *, double))a3 + 2))(a3, 0, &v5, self->_values[0]), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, char *, double))a3 + 2))(a3, 1, &v5, self->_values[1]);
    }
  }
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  unsigned int v7 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30);
  valueSet = self->_valueSet;
  char v9 = 1;
  do
  {
    char v10 = v9;
    if (valueSet[v4])
    {
      ++v5;
      uint64_t v11 = GPBComputeBoolSize(1);
      uint64_t v12 = sub_1002EFA8C(v7) + v11;
      v6 += v12 + GPBComputeRawVarint32SizeForInteger(v12);
    }
    char v9 = 0;
    uint64_t v4 = 1;
  }
  while ((v10 & 1) != 0);
  return v6 + GPBComputeWireFormatTagSize(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v5;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6 = *((void *)a4 + 1);
  unsigned int v7 = *(unsigned __int8 *)(v6 + 30);
  uint64_t Tag = GPBWireFormatMakeTag(*(_DWORD *)(v6 + 16), 2);
  char v9 = 0;
  uint64_t v10 = 0;
  valueSet = self->_valueSet;
  values = self->_values;
  char v13 = 1;
  do
  {
    char v14 = v13;
    if (valueSet[v10])
    {
      [a3 writeInt32NoTag:Tag];
      uint64_t v15 = v9 & 1;
      int v16 = GPBComputeBoolSize(1);
      [a3 writeInt32NoTag:sub_1002EFA8C(v7) + v16];
      [a3 writeBool:1 value:v15];
      sub_1002EFC60(a3, v7, values[v10]);
    }
    char v13 = 0;
    char v9 = 1;
    uint64_t v10 = 1;
  }
  while ((v14 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    uint64_t v4 = 0;
    char v5 = 1;
    do
    {
      char v6 = v5;
      if (*((unsigned char *)a3 + v4 + 32))
      {
        self->_valueSet[v4] = 1;
        self->_values[v4] = *((double *)a3 + v4 + 2);
      }
      char v5 = 0;
      uint64_t v4 = 1;
    }
    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator) {
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setDouble:(double)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeDoubleForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end