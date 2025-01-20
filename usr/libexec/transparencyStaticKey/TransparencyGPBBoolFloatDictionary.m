@interface TransparencyGPBBoolFloatDictionary
- (BOOL)getFloat:(float *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBBoolFloatDictionary)init;
- (TransparencyGPBBoolFloatDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBBoolFloatDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBBoolFloatDictionary)initWithFloats:(const float *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndFloatsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeFloatForKey:(BOOL)a3;
- (void)setFloat:(float)a3 forKey:(BOOL)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBBoolFloatDictionary

- (TransparencyGPBBoolFloatDictionary)init
{
  return [(TransparencyGPBBoolFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
}

- (TransparencyGPBBoolFloatDictionary)initWithFloats:(const float *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)TransparencyGPBBoolFloatDictionary;
  result = [(TransparencyGPBBoolFloatDictionary *)&v13 init];
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
      float v12 = *a3++;
      result->_values[v10] = v12;
      result->_valueSet[v10] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (TransparencyGPBBoolFloatDictionary)initWithDictionary:(id)a3
{
  result = [(TransparencyGPBBoolFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
  if (a3 && result)
  {
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      if (*((unsigned char *)a3 + v5 + 24))
      {
        result->_values[v5] = *((float *)a3 + v5 + 4);
        result->_valueSet[v5] = 1;
      }
      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (TransparencyGPBBoolFloatDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBBoolFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBBoolFloatDictionary allocWithZone:a3];

  return [(TransparencyGPBBoolFloatDictionary *)v4 initWithDictionary:self];
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
      && (!self->_valueSet[0] || self->_values[0] == *((float *)a3 + 4))
      && (!self->_valueSet[1] || self->_values[1] == *((float *)a3 + 5));
}

- (unint64_t)hash
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p> {", objc_opt_class(), self];
  v4 = v3;
  if (self->_valueSet[0]) {
    [(NSMutableString *)v3 appendFormat:@"NO: %f", self->_values[0]];
  }
  if (self->_valueSet[1]) {
    [(NSMutableString *)v4 appendFormat:@"YES: %f", self->_values[1]];
  }
  [(NSMutableString *)v4 appendString:@" }"];
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getFloat:(float *)a3 forKey:(BOOL)a4
{
  BOOL v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4]) {
    *a3 = self->_values[a4];
  }
  return v4;
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  BOOL var0 = a4->var0;
  LODWORD(self->_values[var0]) = a3->var1;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(a3, @"false", +[NSString stringWithFormat:@"%.*g", 6, self->_values[0]]);
  }
  if (self->_valueSet[1])
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%.*g", 6, self->_values[1]];
    char v6 = (void (*)(id, const __CFString *, NSString *))*((void *)a3 + 2);
    v6(a3, @"true", v5);
  }
}

- (void)enumerateKeysAndFloatsUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, char *, float))a3 + 2))(a3, 0, &v5, self->_values[0]), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, char *, float))a3 + 2))(a3, 1, &v5, self->_values[1]);
    }
  }
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = *((void *)a3 + 1);
  valueSet = self->_valueSet;
  char v8 = 1;
  do
  {
    char v9 = v8;
    if (valueSet[v3])
    {
      ++v4;
      uint64_t v10 = sub_10001DAF8(1);
      uint64_t v11 = sub_10001D9A0(2) + v10;
      v5 += v11 + sub_10001BE44(v11);
    }
    char v8 = 0;
    uint64_t v3 = 1;
  }
  while ((v9 & 1) != 0);
  return v5 + sub_10001E054(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6 = sub_100027BFC(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
  char v7 = 0;
  uint64_t v8 = 0;
  valueSet = self->_valueSet;
  values = self->_values;
  char v11 = 1;
  do
  {
    char v12 = v11;
    if (valueSet[v8])
    {
      [a3 writeInt32NoTag:v6];
      uint64_t v13 = v7 & 1;
      int v14 = sub_10001DAF8(1);
      [a3 writeInt32NoTag:sub_10001D9A0(2) + v14];
      [a3 writeBool:1 value:v13];
      *(float *)&double v15 = values[v8];
      [a3 writeFloat:2 value:v15];
    }
    char v11 = 0;
    char v7 = 1;
    uint64_t v8 = 1;
  }
  while ((v12 & 1) != 0);
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
        self->_values[v4] = *((float *)a3 + v4 + 4);
      }
      char v5 = 0;
      uint64_t v4 = 1;
    }
    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator) {
      sub_10002DBEC(autocreator, (uint64_t)self);
    }
  }
}

- (void)setFloat:(float)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10002DBEC(autocreator, (uint64_t)self);
  }
}

- (void)removeFloatForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end