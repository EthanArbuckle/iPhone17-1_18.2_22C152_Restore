@interface GPBBoolInt32Dictionary
- (BOOL)getInt32:(int *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (GPBBoolInt32Dictionary)init;
- (GPBBoolInt32Dictionary)initWithCapacity:(unint64_t)a3;
- (GPBBoolInt32Dictionary)initWithDictionary:(id)a3;
- (GPBBoolInt32Dictionary)initWithInt32s:(const int *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
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
- (void)removeInt32ForKey:(BOOL)a3;
- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4;
- (void)setInt32:(int)a3 forKey:(BOOL)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation GPBBoolInt32Dictionary

- (GPBBoolInt32Dictionary)init
{
  return [(GPBBoolInt32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
}

- (GPBBoolInt32Dictionary)initWithInt32s:(const int *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)GPBBoolInt32Dictionary;
  result = [(GPBBoolInt32Dictionary *)&v13 init];
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
      int v12 = *a3++;
      result->_values[v10] = v12;
      result->_valueSet[v10] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (GPBBoolInt32Dictionary)initWithDictionary:(id)a3
{
  result = [(GPBBoolInt32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
  if (a3 && result)
  {
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      if (*((unsigned char *)a3 + v5 + 24))
      {
        result->_values[v5] = *((_DWORD *)a3 + v5 + 4);
        result->_valueSet[v5] = 1;
      }
      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (GPBBoolInt32Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(GPBBoolInt32Dictionary *)self initWithInt32s:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDictionary.m", 10304, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator object file lineNumber description];
  }
  v3.receiver = self;
  v3.super_class = (Class)GPBBoolInt32Dictionary;
  [(GPBBoolInt32Dictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[GPBBoolInt32Dictionary allocWithZone:a3];

  return [(GPBBoolInt32Dictionary *)v4 initWithDictionary:self];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 24)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 25)
      && (!self->_valueSet[0] || self->_values[0] == *((_DWORD *)a3 + 4))
      && (!self->_valueSet[1] || self->_values[1] == *((_DWORD *)a3 + 5));
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
    [(NSMutableString *)v3 appendFormat:@"NO: %d", self->_values[0]];
  }
  if (self->_valueSet[1]) {
    [(NSMutableString *)v4 appendFormat:@"YES: %d", self->_values[1]];
  }
  [(NSMutableString *)v4 appendString:@" }"];
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getInt32:(int *)a3 forKey:(BOOL)a4
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
  self->_values[var0] = a3->var1;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(a3, @"false", +[NSString stringWithFormat:@"%d", self->_values[0]]);
  }
  if (self->_valueSet[1])
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%d", self->_values[1]];
    char v6 = (void (*)(id, const __CFString *, NSString *))*((void *)a3 + 2);
    v6(a3, @"true", v5);
  }
}

- (void)enumerateKeysAndInt32sUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, void, char *))a3 + 2))(a3, 0, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, void, char *))a3 + 2))(a3, 1, self->_values[1], &v5);
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
  values = self->_values;
  char v10 = 1;
  do
  {
    char v11 = v10;
    if (valueSet[v4])
    {
      ++v5;
      uint64_t v12 = GPBComputeBoolSize(1);
      uint64_t v13 = sub_1002EC618(values[v4], 2, v7) + v12;
      v6 += v13 + GPBComputeRawVarint32SizeForInteger(v13);
    }
    char v10 = 0;
    uint64_t v4 = 1;
  }
  while ((v11 & 1) != 0);
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
      [a3 writeInt32NoTag:sub_1002EC618(values[v10], 2, v7) + v16];
      [a3 writeBool:1 value:v15];
      sub_1002EC85C(a3, values[v10], 2, v7);
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
      if (*((unsigned char *)a3 + v4 + 24))
      {
        self->_valueSet[v4] = 1;
        self->_values[v4] = *((_DWORD *)a3 + v4 + 4);
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

- (void)setInt32:(int)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeInt32ForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end