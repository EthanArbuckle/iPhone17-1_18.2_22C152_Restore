@interface GPBFieldDescriptor
- ($452E035DCF5B90C660B45AC6A1361EDE)defaultValue;
- (BOOL)hasDefaultValue;
- (BOOL)isOptional;
- (BOOL)isPackable;
- (BOOL)isRequired;
- (BOOL)isValidEnumValue:(int)a3;
- (Class)msgClass;
- (GPBEnumDescriptor)enumDescriptor;
- (GPBFieldDescriptor)init;
- (GPBFieldDescriptor)initWithFieldDescription:(void *)a3 includesDefault:(BOOL)a4 usesClassRefs:(BOOL)a5 proto3OptionalKnown:(BOOL)a6 syntax:(unsigned __int8)a7;
- (GPBOneofDescriptor)containingOneof;
- (NSString)name;
- (id)textFormatName;
- (unsigned)dataType;
- (unsigned)fieldType;
- (unsigned)mapKeyDataType;
- (unsigned)number;
- (void)dealloc;
@end

@implementation GPBFieldDescriptor

- (GPBFieldDescriptor)init
{
  v5.receiver = self;
  v5.super_class = (Class)GPBFieldDescriptor;
  v3 = [(GPBFieldDescriptor *)&v5 init];
  if (v3) {
    [(GPBFieldDescriptor *)v3 doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (GPBFieldDescriptor)initWithFieldDescription:(void *)a3 includesDefault:(BOOL)a4 usesClassRefs:(BOOL)a5 proto3OptionalKnown:(BOOL)a6 syntax:(unsigned __int8)a7
{
  int v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v42.receiver = self;
  v42.super_class = (Class)GPBFieldDescriptor;
  v13 = [(GPBFieldDescriptor *)&v42 init];
  v14 = v13;
  if (!v13) {
    return v14;
  }
  SEL v40 = a2;
  if (v10) {
    uint64_t v15 = 8;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v10) {
    v16 = (GPBMessageFieldDescription *)((char *)a3 + 8);
  }
  else {
    v16 = (GPBMessageFieldDescription *)a3;
  }
  v13->description_ = v16;
  SEL Uid = sel_getUid(*(const char **)((char *)a3 + v15));
  if (Uid) {
    v18 = Uid;
  }
  else {
    v18 = 0;
  }
  v14->getSel_ = v18;
  SEL v19 = sub_1002DAFA4("set", *(char **)((char *)a3 + v15), 0, 1);
  BOOL v41 = v9;
  if (v19) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  v14->setSel_ = v20;
  int var6 = v16->var6;
  unsigned int v22 = var6 - 17;
  int v23 = v14->description_->var5 & 0xF02;
  if (v7 != 3 || a6 || (v14->description_->var5 & 0xF02) != 0)
  {
    if ((v14->description_->var5 & 0xF02) != 0)
    {
      p_hasOrCountSel = &v14->hasOrCountSel_;
      v26 = *(char **)((char *)a3 + v15);
      v27 = "_Count";
      v28 = 0;
      int v29 = 0;
LABEL_29:
      SEL v32 = sub_1002DAFA4(v28, v26, v27, v29);
      if (v32) {
        SEL v33 = v32;
      }
      else {
        SEL v33 = 0;
      }
      SEL *p_hasOrCountSel = v33;
      goto LABEL_33;
    }
    int var3 = v16->var3;
LABEL_23:
    if (var3 < 0) {
      goto LABEL_33;
    }
    goto LABEL_24;
  }
  int var3 = v16->var3;
  if (var3 < 0 || v22 > 0xFFFFFFFD) {
    goto LABEL_23;
  }
  v16->var5 |= 0x20u;
LABEL_24:
  if ((v16->var5 & 0x20) == 0)
  {
    SEL v30 = sub_1002DAFA4("has", *(char **)((char *)a3 + v15), 0, 0);
    if (v30) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    v14->hasOrCountSel_ = v31;
    p_hasOrCountSel = &v14->setHasSel_;
    v26 = *(char **)((char *)a3 + v15);
    v28 = "setHas";
    v27 = 0;
    int v29 = 1;
    goto LABEL_29;
  }
LABEL_33:
  if (v22 >= 0xFFFFFFFE)
  {
    var0 = v16->var1.var0;
    if (v41)
    {
      v14->msgClass_ = (Class)var0;
    }
    else
    {
      Class Class = objc_getClass(var0);
      v14->msgClass_ = Class;
      if (!Class) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:v40, v14, @"GPBDescriptor.m", 555, @"Class %s not defined", var0 object file lineNumber description];
      }
    }
  }
  else if (var6 == 17)
  {
    v34 = (uint64_t (*)(void))v16->var1.var0;
    if ((v16->var5 & 0x80) != 0) {
      v14->enumHandling_.enumDescriptor_ = (GPBEnumDescriptor *)v34();
    }
    else {
      v14->enumHandling_.enumDescriptor_ = (GPBEnumDescriptor *)v34;
    }
  }
  if (v23) {
    BOOL v37 = 1;
  }
  else {
    BOOL v37 = !v10;
  }
  if (!v37)
  {
    v38 = *(unsigned int **)a3;
    v14->defaultValue_.valueInt64 = (int64_t)v38;
    if (var6 == 13)
    {
      if (v38) {
        v14->defaultValue_.valueInt64 = (int64_t)[objc_alloc((Class)NSData) initWithBytes:v38 + 1 length:bswap32(*v38)];
      }
    }
  }
  return v14;
}

- (void)dealloc
{
  description = self->description_;
  if (description->var6 == 13 && (description->var5 & 2) == 0) {

  }
  v4.receiver = self;
  v4.super_class = (Class)GPBFieldDescriptor;
  [(GPBFieldDescriptor *)&v4 dealloc];
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
  unint64_t v2 = (self->description_->var5 & 0xF00u) - 256;
  if (v2 < 0xC00) {
    return byte_10033F528[v2 >> 8];
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"GPBDescriptor.m" lineNumber:659 description:@"Not a map type"];
  return 7;
}

- (BOOL)isPackable
{
  return (self->description_->var5 >> 2) & 1;
}

- (BOOL)isValidEnumValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  description = self->description_;
  if (description->var6 != 17)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"GPBDescriptor.m" lineNumber:670 description:@"Field Must be of type GPBDataTypeEnum"];
    description = self->description_;
  }
  enumDescriptor = self->enumHandling_.enumDescriptor_;
  if ((description->var5 & 0x80) != 0) {
    enumDescriptor = [(GPBEnumDescriptor *)self->enumHandling_.enumDescriptor_ enumVerifier];
  }

  return ((uint64_t (*)(uint64_t))enumDescriptor)(v3);
}

- (GPBEnumDescriptor)enumDescriptor
{
  if ((self->description_->var5 & 0x80) != 0) {
    return self->enumHandling_.enumDescriptor_;
  }
  else {
    return 0;
  }
}

- ($452E035DCF5B90C660B45AC6A1361EDE)defaultValue
{
  int64_t valueInt64 = self->defaultValue_.valueInt64;
  description = self->description_;
  if ((description->var5 & 2) == 0)
  {
    int var6 = description->var6;
    if (var6 == 13 && valueInt64 == 0)
    {
      return ($452E035DCF5B90C660B45AC6A1361EDE)GPBEmptyNSData();
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
        return ($452E035DCF5B90C660B45AC6A1361EDE)&stru_1003BC4E8;
      }
    }
  }
  return ($452E035DCF5B90C660B45AC6A1361EDE)valueInt64;
}

- (id)textFormatName
{
  if ((self->description_->var5 & 0x40) == 0)
  {
    uint64_t v3 = [(GPBFieldDescriptor *)self name];
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
      v11 = +[NSMutableString stringWithCapacity:v4];
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
  id AssociatedObject = objc_getAssociatedObject(self, &unk_10033F525);
  if (!AssociatedObject) {
    return 0;
  }
  v8 = (char *)[AssociatedObject pointerValue];
  unsigned int var2 = self->description_->var2;
  BOOL v10 = [(GPBFieldDescriptor *)self name];

  return GPBDecodeTextFormatName(v8, var2, v10);
}

- (Class)msgClass
{
  return self->msgClass_;
}

- (GPBOneofDescriptor)containingOneof
{
  return self->containingOneof_;
}

@end