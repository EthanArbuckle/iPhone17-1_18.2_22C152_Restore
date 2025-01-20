@interface GPBExtensionDescriptor
- (BOOL)isPackable;
- (BOOL)isRepeated;
- (Class)containingMessageClass;
- (Class)msgClass;
- (GPBEnumDescriptor)enumDescriptor;
- (GPBExtensionDescriptor)initWithExtensionDescription:(GPBExtensionDescription *)a3;
- (GPBExtensionDescriptor)initWithExtensionDescription:(GPBExtensionDescription *)description usesClassRefs:(BOOL)a4;
- (NSString)singletonName;
- (const)singletonNameC;
- (id)defaultValue;
- (int)alternateWireType;
- (int)wireType;
- (int64_t)compareByFieldNumber:(id)a3;
- (unsigned)dataType;
- (unsigned)fieldNumber;
- (void)dealloc;
@end

@implementation GPBExtensionDescriptor

- (GPBExtensionDescriptor)initWithExtensionDescription:(GPBExtensionDescription *)description usesClassRefs:(BOOL)a4
{
  v15.receiver = self;
  v15.super_class = (Class)GPBExtensionDescriptor;
  v7 = [(GPBExtensionDescriptor *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v7->description_ = description;
    if (!a4)
    {
      var0 = description->var3.var0;
      if (var0)
      {
        Class v10 = objc_lookUpClass(description->var3.var0);
        if (!v10) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, v8, @"GPBDescriptor.m", 993, @"Class %s not defined", var0 object file lineNumber description];
        }
        v8->description_->var3.var0 = (char *)v10;
        description = v8->description_;
      }
      v11 = description->var2.var0;
      if (v11)
      {
        Class v12 = objc_lookUpClass(description->var2.var0);
        if (!v12) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, v8, @"GPBDescriptor.m", 1000, @"Class %s not defined", v11 object file lineNumber description];
        }
        v8->description_->var2.var0 = (char *)v12;
        description = v8->description_;
      }
    }
    int var6 = description->var6;
    if (var6 == 13)
    {
      if (description->var0.var2) {
        v8->defaultValue_.valueInt64 = (int64_t)[objc_alloc((Class)NSData) initWithBytes:description->var0.var2 + 4 length:bswap32(*(_DWORD *)description->var0.var2)];
      }
    }
    else if ((var6 - 15) >= 2)
    {
      v8->defaultValue_.valueInt64 = description->var0.var2;
    }
  }
  return v8;
}

- (GPBExtensionDescriptor)initWithExtensionDescription:(GPBExtensionDescription *)a3
{
  return [(GPBExtensionDescriptor *)self initWithExtensionDescription:a3 usesClassRefs:0];
}

- (void)dealloc
{
  description = self->description_;
  if (description->var6 == 13 && (description->var7 & 1) == 0) {

  }
  v4.receiver = self;
  v4.super_class = (Class)GPBExtensionDescriptor;
  [(GPBExtensionDescriptor *)&v4 dealloc];
}

- (NSString)singletonName
{
  return +[NSString stringWithUTF8String:self->description_->var1];
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
  return GPBWireFormatForType(self->description_->var6, (self->description_->var7 & 2) != 0);
}

- (int)alternateWireType
{
  description = self->description_;
  unsigned __int8 var7 = description->var7;
  if ((var7 & 1) == 0)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"GPBDescriptor.m" lineNumber:1071 description:@"Only valid on repeated extensions"];
    description = self->description_;
    unsigned __int8 var7 = description->var7;
  }
  int var6 = description->var6;

  return GPBWireFormatForType(var6, (var7 & 2) == 0);
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
  return self->description_->var3.var1.var1;
}

- (Class)containingMessageClass
{
  return self->description_->var2.var1;
}

- (GPBEnumDescriptor)enumDescriptor
{
  description = self->description_;
  if (description->var6 == 17) {
    return (GPBEnumDescriptor *)((uint64_t (*)(void))description->var4)();
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
        id result = +[NSNumber numberWithBool:self->defaultValue_.valueBool];
        break;
      case 1u:
      case 0xBu:
        id result = +[NSNumber numberWithUnsignedInt:self->defaultValue_.valueUInt32];
        break;
      case 2u:
      case 7u:
      case 9u:
      case 0x11u:
        id result = +[NSNumber numberWithInt:self->defaultValue_.valueUInt32];
        break;
      case 3u:
        LODWORD(v2) = self->defaultValue_.valueInt32;
        id result = +[NSNumber numberWithFloat:v2];
        break;
      case 4u:
      case 0xCu:
        id result = +[NSNumber numberWithUnsignedLongLong:self->defaultValue_.valueInt64];
        break;
      case 5u:
      case 8u:
      case 0xAu:
        id result = +[NSNumber numberWithLongLong:self->defaultValue_.valueInt64];
        break;
      case 6u:
        id result = +[NSNumber numberWithDouble:self->defaultValue_.valueDouble];
        break;
      case 0xDu:
        valueData = self->defaultValue_.valueData;
        if (valueData) {
          return valueData;
        }
        id result = (id)GPBEmptyNSData();
        break;
      case 0xEu:
        valueData = self->defaultValue_.valueData;
        if (!valueData) {
          return &stru_1003BC4E8;
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

@end