@interface GPBBoolBoolDictionary
- (BOOL)getBool:(BOOL *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (GPBBoolBoolDictionary)init;
- (GPBBoolBoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (GPBBoolBoolDictionary)initWithCapacity:(unint64_t)a3;
- (GPBBoolBoolDictionary)initWithDictionary:(id)a3;
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
- (void)removeBoolForKey:(BOOL)a3;
- (void)setBool:(BOOL)a3 forKey:(BOOL)a4;
- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation GPBBoolBoolDictionary

- (GPBBoolBoolDictionary)init
{
  return [(GPBBoolBoolDictionary *)self initWithBools:0 forKeys:0 count:0];
}

- (GPBBoolBoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)GPBBoolBoolDictionary;
  result = [(GPBBoolBoolDictionary *)&v12 init];
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
      LOBYTE(v11) = *a3++;
      result->_values[v10] = v11;
      result->_valueSet[v10] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (GPBBoolBoolDictionary)initWithDictionary:(id)a3
{
  result = [(GPBBoolBoolDictionary *)self initWithBools:0 forKeys:0 count:0];
  if (a3 && result)
  {
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      if (*((unsigned char *)a3 + v5 + 18))
      {
        result->_values[v5] = *((unsigned char *)a3 + v5 + 16);
        result->_valueSet[v5] = 1;
      }
      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (GPBBoolBoolDictionary)initWithCapacity:(unint64_t)a3
{
  return [(GPBBoolBoolDictionary *)self initWithBools:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDictionary.m", 10937, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator object file lineNumber description];
  }
  v3.receiver = self;
  v3.super_class = (Class)GPBBoolBoolDictionary;
  [(GPBBoolBoolDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[GPBBoolBoolDictionary allocWithZone:a3];

  return [(GPBBoolBoolDictionary *)v4 initWithDictionary:self];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 18)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 19)
      && (!self->_valueSet[0] || self->_values[0] == *((unsigned __int8 *)a3 + 16))
      && (!self->_valueSet[1] || self->_values[1] == *((unsigned __int8 *)a3 + 17));
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

- (BOOL)getBool:(BOOL *)a3 forKey:(BOOL)a4
{
  BOOL v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4]) {
    *a3 = self->_values[a4];
  }
  return v4;
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  BOOL v4 = (char *)self + a4->var0;
  v4[16] = a3->var0;
  v4[18] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0])
  {
    if (self->_values[0]) {
      CFStringRef v5 = @"true";
    }
    else {
      CFStringRef v5 = @"false";
    }
    (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(a3, @"false", v5);
  }
  if (self->_valueSet[1])
  {
    if (self->_values[1]) {
      CFStringRef v6 = @"true";
    }
    else {
      CFStringRef v6 = @"false";
    }
    char v7 = (void (*)(id, const __CFString *, const __CFString *))*((void *)a3 + 2);
    v7(a3, @"true", v6);
  }
}

- (void)enumerateKeysAndBoolsUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, BOOL, char *))a3 + 2))(a3, 0, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, BOOL, char *))a3 + 2))(a3, 1, self->_values[1], &v5);
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
      uint64_t v13 = sub_1002EE644(values[v4], 2, v7) + v12;
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
      [a3 writeInt32NoTag:sub_1002EE644(values[v10], 2, v7) + v16];
      [a3 writeBool:1 value:v15];
      sub_1002EE820(a3, values[v10], 2, v7);
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
      if (*((unsigned char *)a3 + v4 + 18))
      {
        self->_valueSet[v4] = 1;
        self->_values[v4] = *((unsigned char *)a3 + v4 + 16);
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

- (void)setBool:(BOOL)a3 forKey:(BOOL)a4
{
  char v5 = (char *)self + a4;
  v5[16] = a3;
  v5[18] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeBoolForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end