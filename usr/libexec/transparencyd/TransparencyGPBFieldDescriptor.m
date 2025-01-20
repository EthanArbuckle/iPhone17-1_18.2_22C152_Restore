@interface TransparencyGPBFieldDescriptor
- ($1527345D6AC78D9C4150442774565095)defaultValue;
- (BOOL)hasDefaultValue;
- (BOOL)isOptional;
- (BOOL)isPackable;
- (BOOL)isRequired;
- (BOOL)isValidEnumValue:(int)a3;
- (Class)msgClass;
- (NSString)name;
- (TransparencyGPBEnumDescriptor)enumDescriptor;
- (TransparencyGPBFieldDescriptor)initWithFieldDescription:(void *)a3 descriptorFlags:(unsigned int)a4;
- (TransparencyGPBOneofDescriptor)containingOneof;
- (id)textFormatName;
- (unsigned)dataType;
- (unsigned)fieldType;
- (unsigned)mapKeyDataType;
- (unsigned)number;
- (void)dealloc;
@end

@implementation TransparencyGPBFieldDescriptor

- (TransparencyGPBFieldDescriptor)initWithFieldDescription:(void *)a3 descriptorFlags:(unsigned int)a4
{
  char v4 = a4;
  v26.receiver = self;
  v26.super_class = (Class)TransparencyGPBFieldDescriptor;
  v6 = [(TransparencyGPBFieldDescriptor *)&v26 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if (v4) {
    v8 = (TransparencyGPBMessageFieldDescription *)((char *)a3 + 8);
  }
  else {
    v8 = (TransparencyGPBMessageFieldDescription *)a3;
  }
  v6->description_ = v8;
  SEL Uid = sel_getUid(*((const char **)a3 + (v4 & 1)));
  if (Uid) {
    v10 = Uid;
  }
  else {
    v10 = 0;
  }
  v7->getSel_ = v10;
  SEL v11 = sub_10013CA00("set", *((char **)a3 + (v4 & 1)), 0, 1);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v7->setSel_ = v12;
  int var6 = v8->var6;
  int v14 = v7->description_->var5 & 0xF02;
  if ((v7->description_->var5 & 0xF02) != 0)
  {
    p_hasOrCountSel = &v7->hasOrCountSel_;
    v16 = (char *)*((void *)a3 + (v4 & 1));
    v17 = "_Count";
    v18 = 0;
    int v19 = 0;
  }
  else
  {
    if (v8->var3 < 0 || (v8->var5 & 0x20) != 0) {
      goto LABEL_21;
    }
    SEL v22 = sub_10013CA00("has", *((char **)a3 + (v4 & 1)), 0, 0);
    if (v22) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    v7->hasOrCountSel_ = v23;
    p_hasOrCountSel = &v7->setHasSel_;
    v16 = (char *)*((void *)a3 + (v4 & 1));
    v18 = "setHas";
    v17 = 0;
    int v19 = 1;
  }
  SEL v20 = sub_10013CA00(v18, v16, v17, v19);
  if (v20) {
    SEL v21 = v20;
  }
  else {
    SEL v21 = 0;
  }
  SEL *p_hasOrCountSel = v21;
LABEL_21:
  if ((var6 - 15) <= 1)
  {
    v7->msgClass_ = v8->var1.var1;
LABEL_27:
    if ((v4 & 1) != 0 && !v14)
    {
      v24 = *(unsigned int **)a3;
      v7->defaultValue_.valueInt64 = (int64_t)v24;
      if (var6 == 13)
      {
        if (v24) {
          v7->defaultValue_.valueInt64 = (int64_t)[objc_alloc((Class)NSData) initWithBytes:v24 + 1 length:bswap32(*v24)];
        }
      }
    }
    return v7;
  }
  if (var6 != 17) {
    goto LABEL_27;
  }
  v7->enumDescriptor_ = (TransparencyGPBEnumDescriptor *)((uint64_t (*)(void))v8->var1.var0)();
  if ((v4 & 1) != 0 && !v14) {
    v7->defaultValue_.valueInt64 = *(void *)a3;
  }
  return v7;
}

- (void)dealloc
{
  description = self->description_;
  if (description->var6 == 13 && (description->var5 & 2) == 0) {

  }
  v4.receiver = self;
  v4.super_class = (Class)TransparencyGPBFieldDescriptor;
  [(TransparencyGPBFieldDescriptor *)&v4 dealloc];
}

- (unsigned)dataType
{
  return self->description_->var6;
}

- (BOOL)hasDefaultValue
{
  return (self->description_->var5 >> 4) & 1;
}

- (unsigned)number
{
  return self->description_->var2;
}

- (NSString)name
{
  return +[NSString stringWithUTF8String:self->description_->var0];
}

- (BOOL)isRequired
{
  return self->description_->var5 & 1;
}

- (BOOL)isOptional
{
  return (self->description_->var5 >> 3) & 1;
}

- (unsigned)fieldType
{
  unsigned __int16 var5 = self->description_->var5;
  if ((var5 & 2) != 0) {
    return 1;
  }
  else {
    return 2 * ((var5 & 0xF00) != 0);
  }
}

- (unsigned)mapKeyDataType
{
  uint64_t v2 = (((self->description_->var5 & 0xF00u) - 256) >> 8) - 1;
  if (v2 > 0xA) {
    return 7;
  }
  else {
    return byte_10028ACA8[v2];
  }
}

- (BOOL)isPackable
{
  return (self->description_->var5 >> 2) & 1;
}

- (BOOL)isValidEnumValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v4 = [(TransparencyGPBEnumDescriptor *)self->enumDescriptor_ enumVerifier];

  return v4(v3);
}

- (TransparencyGPBEnumDescriptor)enumDescriptor
{
  return self->enumDescriptor_;
}

- ($1527345D6AC78D9C4150442774565095)defaultValue
{
  int64_t valueInt64 = self->defaultValue_.valueInt64;
  description = self->description_;
  if ((description->var5 & 2) == 0)
  {
    int var6 = description->var6;
    if (var6 == 13 && valueInt64 == 0)
    {
      return ($1527345D6AC78D9C4150442774565095)sub_100167DB8();
    }
    else
    {
      if (valueInt64) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = var6 == 14;
      }
      if (v7) {
        return ($1527345D6AC78D9C4150442774565095)&stru_1002CE4C0;
      }
    }
  }
  return ($1527345D6AC78D9C4150442774565095)valueInt64;
}

- (id)textFormatName
{
  if ((self->description_->var5 & 0x40) == 0)
  {
    uint64_t v3 = [(TransparencyGPBFieldDescriptor *)self name];
    objc_super v4 = [(NSString *)v3 length];
    if ([(NSString *)v3 hasSuffix:@"_p"])
    {
      uint64_t v3 = [(NSString *)v3 substringToIndex:v4 - 2];
      objc_super v4 = [(NSString *)v3 length];
    }
    if ((self->description_->var5 & 2) != 0 && [(NSString *)v3 hasSuffix:@"Array"])
    {
      uint64_t v3 = [(NSString *)v3 substringToIndex:v4 - 5];
      objc_super v4 = [(NSString *)v3 length];
    }
    if (self->description_->var6 == 16)
    {
      unsigned int v5 = [(NSString *)v3 characterAtIndex:0];
      if (v5 - 97 <= 0x19)
      {
        v6 = +[NSString stringWithFormat:@"%C", (unsigned __int16)(v5 - 32)];
        return -[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v6);
      }
      return v3;
    }
    else
    {
      SEL v11 = +[NSMutableString stringWithCapacity:v4];
      if (v4)
      {
        uint64_t v12 = 0;
        unsigned int v13 = 1;
        do
        {
          id v14 = (id)[(NSString *)v3 characterAtIndex:v12];
          if ((v14 - 65) > 0x19 || v13 == 1) {
            [(NSMutableString *)v11 appendFormat:@"%C", v14];
          }
          else {
            [(NSMutableString *)v11 appendFormat:@"_%C", (v14 + 32)];
          }
          uint64_t v12 = v13;
        }
        while ((unint64_t)v4 > v13++);
      }
    }
    return v11;
  }
  id AssociatedObject = objc_getAssociatedObject(self, &unk_10028ACA5);
  if (!AssociatedObject) {
    return 0;
  }
  v8 = (char *)[AssociatedObject pointerValue];
  unsigned int var2 = self->description_->var2;
  v10 = [(TransparencyGPBFieldDescriptor *)self name];

  return sub_10016A6C8(v8, var2, v10);
}

- (Class)msgClass
{
  return self->msgClass_;
}

- (TransparencyGPBOneofDescriptor)containingOneof
{
  return self->containingOneof_;
}

@end