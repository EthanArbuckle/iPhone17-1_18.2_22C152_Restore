@interface TRIPBFieldDescriptor
- ($10779BD48C5E5A5359A19962DF980F89)defaultValue;
- (BOOL)hasDefaultValue;
- (BOOL)isOptional;
- (BOOL)isPackable;
- (BOOL)isRequired;
- (BOOL)isValidEnumValue:(int)a3;
- (Class)msgClass;
- (NSString)name;
- (TRIPBEnumDescriptor)enumDescriptor;
- (TRIPBFieldDescriptor)init;
- (TRIPBFieldDescriptor)initWithFieldDescription:(void *)a3 includesDefault:(BOOL)a4 syntax:(unsigned __int8)a5;
- (TRIPBOneofDescriptor)containingOneof;
- (id)textFormatName;
- (unsigned)dataType;
- (unsigned)fieldType;
- (unsigned)mapKeyDataType;
- (unsigned)number;
- (void)dealloc;
@end

@implementation TRIPBFieldDescriptor

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

- (Class)msgClass
{
  return self->msgClass_;
}

- (BOOL)isValidEnumValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  description = self->description_;
  if (description->var6 != 17)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 648, @"Field Must be of type TRIPBDataTypeEnum");
    description = self->description_;
  }
  enumDescriptor = self->enumHandling_.enumDescriptor_;
  if ((description->var5 & 0x80) != 0) {
    enumDescriptor = [(TRIPBEnumDescriptor *)self->enumHandling_.enumDescriptor_ enumVerifier];
  }
  return ((uint64_t (*)(uint64_t))enumDescriptor)(v3);
}

- (BOOL)isPackable
{
  return (self->description_->var5 >> 2) & 1;
}

- (TRIPBFieldDescriptor)initWithFieldDescription:(void *)a3 includesDefault:(BOOL)a4 syntax:(unsigned __int8)a5
{
  int v5 = a5;
  BOOL v6 = a4;
  v35.receiver = self;
  v35.super_class = (Class)TRIPBFieldDescriptor;
  v9 = [(TRIPBFieldDescriptor *)&v35 init];
  v10 = v9;
  if (!v9) {
    return v10;
  }
  if (v6) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v6) {
    v12 = (char *)a3 + 8;
  }
  else {
    v12 = (char *)a3;
  }
  v9->description_ = (TRIPBMessageFieldDescription *)v12;
  SEL Uid = sel_getUid(*(const char **)((char *)a3 + v11));
  if (Uid) {
    v14 = Uid;
  }
  else {
    v14 = 0;
  }
  v10->getSel_ = v14;
  SEL v15 = SelFromStrings("set", *(char **)((char *)a3 + v11), 0, 1);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v10->setSel_ = v16;
  int v17 = v12[30];
  unsigned int v18 = v17 - 15;
  int v19 = v10->description_->var5 & 0xF02;
  if ((v10->description_->var5 & 0xF02) != 0)
  {
    p_hasOrCountSel = &v10->hasOrCountSel_;
    v21 = *(char **)((char *)a3 + v11);
    v22 = "_Count";
    v23 = 0;
    int v24 = 0;
  }
  else
  {
    if (*((_DWORD *)v12 + 5) > 0x7FFFFFFEu) {
      goto LABEL_25;
    }
    if (v5 == 3 && v18 > 1)
    {
LABEL_28:
      if (v17 == 17)
      {
        v31 = (uint64_t (*)(void))*((void *)v12 + 1);
        if ((*((_WORD *)v12 + 14) & 0x80) != 0) {
          v10->enumHandling_.enumDescriptor_ = (TRIPBEnumDescriptor *)v31();
        }
        else {
          v10->enumHandling_.enumDescriptor_ = (TRIPBEnumDescriptor *)v31;
        }
      }
      goto LABEL_32;
    }
    SEL v27 = SelFromStrings("has", *(char **)((char *)a3 + v11), 0, 0);
    if (v27) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    v10->hasOrCountSel_ = v28;
    p_hasOrCountSel = &v10->setHasSel_;
    v21 = *(char **)((char *)a3 + v11);
    v23 = "setHas";
    v22 = 0;
    int v24 = 1;
  }
  SEL v25 = SelFromStrings(v23, v21, v22, v24);
  if (v25) {
    SEL v26 = v25;
  }
  else {
    SEL v26 = 0;
  }
  SEL *p_hasOrCountSel = v26;
LABEL_25:
  if (v18 > 1) {
    goto LABEL_28;
  }
  v29 = (const char *)*((void *)v12 + 1);
  Class Class = objc_getClass(v29);
  v10->msgClass_ = Class;
  if (!Class) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, @"TRIPBDescriptor.m", 534, @"Class %s not defined", v29);
  }
LABEL_32:
  if (v19) {
    BOOL v32 = 1;
  }
  else {
    BOOL v32 = !v6;
  }
  if (!v32)
  {
    v33 = *(unsigned int **)a3;
    v10->defaultValue_.valueInt64 = (int64_t)v33;
    if (v17 == 13)
    {
      if (v33) {
        v10->defaultValue_.valueInt64 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v33 + 1 length:bswap32(*v33)];
      }
    }
  }
  return v10;
}

- (TRIPBFieldDescriptor)init
{
  v5.receiver = self;
  v5.super_class = (Class)TRIPBFieldDescriptor;
  uint64_t v3 = [(TRIPBFieldDescriptor *)&v5 init];
  if (v3) {
    [(TRIPBFieldDescriptor *)v3 doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (void)dealloc
{
  description = self->description_;
  if (description->var6 == 13 && (description->var5 & 2) == 0) {

  }
  v4.receiver = self;
  v4.super_class = (Class)TRIPBFieldDescriptor;
  [(TRIPBFieldDescriptor *)&v4 dealloc];
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
  return (NSString *)[NSString stringWithUTF8String:self->description_->var0];
}

- (unsigned)mapKeyDataType
{
  unint64_t v2 = (self->description_->var5 & 0xF00u) - 256;
  if (v2 < 0xC00) {
    return byte_19362C2FB[v2 >> 8];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 637, @"Not a map type");
  return 7;
}

- (TRIPBEnumDescriptor)enumDescriptor
{
  if ((self->description_->var5 & 0x80) != 0) {
    return self->enumHandling_.enumDescriptor_;
  }
  else {
    return 0;
  }
}

- ($10779BD48C5E5A5359A19962DF980F89)defaultValue
{
  int64_t valueInt64 = self->defaultValue_.valueInt64;
  description = self->description_;
  if ((description->var5 & 2) == 0)
  {
    int var6 = description->var6;
    if (var6 == 13 && valueInt64 == 0)
    {
      return ($10779BD48C5E5A5359A19962DF980F89)TRIPBEmptyNSData();
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
        return ($10779BD48C5E5A5359A19962DF980F89)&stru_1EE43FA58;
      }
    }
  }
  return ($10779BD48C5E5A5359A19962DF980F89)valueInt64;
}

- (id)textFormatName
{
  if ((self->description_->var5 & 0x40) == 0)
  {
    uint64_t v3 = [(TRIPBFieldDescriptor *)self name];
    unint64_t v4 = [(NSString *)v3 length];
    if ([(NSString *)v3 hasSuffix:@"_p"])
    {
      uint64_t v3 = [(NSString *)v3 substringToIndex:v4 - 2];
      unint64_t v4 = [(NSString *)v3 length];
    }
    if ((self->description_->var5 & 2) != 0 && [(NSString *)v3 hasSuffix:@"Array"])
    {
      uint64_t v3 = [(NSString *)v3 substringToIndex:v4 - 5];
      unint64_t v4 = [(NSString *)v3 length];
    }
    if (self->description_->var6 == 16)
    {
      int v5 = [(NSString *)v3 characterAtIndex:0];
      if ((v5 - 97) <= 0x19)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%C", (unsigned __int16)(v5 - 32));
        return -[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v6);
      }
      return v3;
    }
    else
    {
      v12 = (void *)[MEMORY[0x1E4F28E78] stringWithCapacity:v4];
      if (v4)
      {
        uint64_t v13 = 0;
        unsigned int v14 = 1;
        do
        {
          uint64_t v15 = [(NSString *)v3 characterAtIndex:v13];
          if ((v15 - 65) > 0x19 || v14 == 1) {
            objc_msgSend(v12, "appendFormat:", @"%C", v15);
          }
          else {
            objc_msgSend(v12, "appendFormat:", @"_%C", (v15 + 32));
          }
          uint64_t v13 = v14;
        }
        while (v4 > v14++);
      }
    }
    return v12;
  }
  id AssociatedObject = objc_getAssociatedObject(self, &kTextFormatExtraValueKey);
  if (!AssociatedObject) {
    return 0;
  }
  v9 = (char *)[AssociatedObject pointerValue];
  unsigned int var2 = self->description_->var2;
  uint64_t v11 = [(TRIPBFieldDescriptor *)self name];
  return (id)TRIPBDecodeTextFormatName(v9, var2, v11);
}

- (TRIPBOneofDescriptor)containingOneof
{
  return self->containingOneof_;
}

@end