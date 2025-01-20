@interface TRIPBExtensionDescriptor
- (BOOL)isPackable;
- (BOOL)isRepeated;
- (Class)containingMessageClass;
- (Class)msgClass;
- (NSString)singletonName;
- (TRIPBEnumDescriptor)enumDescriptor;
- (TRIPBExtensionDescriptor)initWithExtensionDescription:(TRIPBExtensionDescription *)a3;
- (const)singletonNameC;
- (id)defaultValue;
- (int)alternateWireType;
- (int)wireType;
- (int64_t)compareByFieldNumber:(id)a3;
- (unsigned)dataType;
- (unsigned)fieldNumber;
- (void)dealloc;
@end

@implementation TRIPBExtensionDescriptor

- (TRIPBExtensionDescriptor)initWithExtensionDescription:(TRIPBExtensionDescription *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TRIPBExtensionDescriptor;
  v5 = [(TRIPBExtensionDescriptor *)&v13 init];
  v6 = v5;
  if (v5)
  {
    v5->description_ = a3;
    var2 = a3->var2;
    description = a3;
    if (var2)
    {
      uint64_t v9 = (uint64_t)objc_lookUpClass(var2);
      if (!v9 && (strcmp(a3->var2, "TRIPBFieldOptions") || (uint64_t v9 = objc_opt_class()) == 0))
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"TRIPBDescriptor.m", 988, @"Class %s not defined", a3->var2);
        uint64_t v9 = 0;
      }
      v6->containingMessageClass_ = (Class)v9;
      description = v6->description_;
    }
    int var6 = description->var6;
    if (var6 == 13)
    {
      v11 = (unsigned int *)a3->var0.var2;
      if (v11) {
        v6->defaultValue_.valueInt64 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v11 + 1 length:bswap32(*v11)];
      }
    }
    else if ((var6 - 15) >= 2)
    {
      v6->defaultValue_.valueInt64 = a3->var0.var2;
    }
  }
  return v6;
}

- (void)dealloc
{
  description = self->description_;
  if (description->var6 == 13 && (description->var7 & 1) == 0) {

  }
  v4.receiver = self;
  v4.super_class = (Class)TRIPBExtensionDescriptor;
  [(TRIPBExtensionDescriptor *)&v4 dealloc];
}

- (NSString)singletonName
{
  return (NSString *)[NSString stringWithUTF8String:self->description_->var1];
}

- (const)singletonNameC
{
  return self->description_->var1;
}

- (unsigned)fieldNumber
{
  return self->description_->var5;
}

- (unsigned)dataType
{
  return self->description_->var6;
}

- (int)wireType
{
  description = self->description_;
  if ((description->var7 & 2) != 0) {
    return 2;
  }
  else {
    return TRIPBWireFormatForType_format[description->var6];
  }
}

- (int)alternateWireType
{
  description = self->description_;
  if (description->var7)
  {
    if ((description->var7 & 2) == 0) {
      return 2;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 1054, @"Only valid on repeated extensions");
    description = self->description_;
    if ((description->var7 & 2) == 0) {
      return 2;
    }
  }
  return TRIPBWireFormatForType_format[description->var6];
}

- (BOOL)isRepeated
{
  return self->description_->var7 & 1;
}

- (BOOL)isPackable
{
  return (self->description_->var7 >> 1) & 1;
}

- (Class)msgClass
{
  return objc_getClass(self->description_->var3);
}

- (TRIPBEnumDescriptor)enumDescriptor
{
  description = self->description_;
  if (description->var6 == 17) {
    return (TRIPBEnumDescriptor *)((uint64_t (*)(void))description->var4)();
  }
  else {
    return 0;
  }
}

- (id)defaultValue
{
  description = self->description_;
  if (description->var7)
  {
    return 0;
  }
  else
  {
    valueData = 0;
    switch(description->var6)
    {
      case 0u:
        id result = (id)[NSNumber numberWithBool:self->defaultValue_.valueBool];
        break;
      case 1u:
      case 0xBu:
        id result = (id)[NSNumber numberWithUnsignedInt:self->defaultValue_.valueUInt32];
        break;
      case 2u:
      case 7u:
      case 9u:
      case 0x11u:
        id result = (id)[NSNumber numberWithInt:self->defaultValue_.valueUInt32];
        break;
      case 3u:
        LODWORD(v2) = self->defaultValue_.valueInt32;
        id result = (id)[NSNumber numberWithFloat:v2];
        break;
      case 4u:
      case 0xCu:
        id result = (id)[NSNumber numberWithUnsignedLongLong:self->defaultValue_.valueInt64];
        break;
      case 5u:
      case 8u:
      case 0xAu:
        id result = (id)[NSNumber numberWithLongLong:self->defaultValue_.valueInt64];
        break;
      case 6u:
        id result = (id)[NSNumber numberWithDouble:self->defaultValue_.valueDouble];
        break;
      case 0xDu:
        valueData = self->defaultValue_.valueData;
        if (valueData) {
          return valueData;
        }
        id result = (id)TRIPBEmptyNSData();
        break;
      case 0xEu:
        valueData = self->defaultValue_.valueData;
        if (!valueData) {
          return &stru_1EE43FA58;
        }
        return valueData;
      default:
        return valueData;
    }
  }
  return result;
}

- (int64_t)compareByFieldNumber:(id)a3
{
  int var5 = self->description_->var5;
  int v4 = *(_DWORD *)(*((void *)a3 + 1) + 40);
  BOOL v5 = var5 < v4;
  int64_t v6 = var5 != v4;
  if (v5) {
    return -1;
  }
  else {
    return v6;
  }
}

- (Class)containingMessageClass
{
  return self->containingMessageClass_;
}

@end