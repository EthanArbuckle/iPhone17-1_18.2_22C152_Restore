@interface GPBEnumDescriptor
+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7;
+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 extraTextFormatInfo:(const char *)a8;
- (BOOL)getValue:(int *)a3 forEnumName:(id)a4;
- (BOOL)getValue:(int *)a3 forEnumTextFormatName:(id)a4;
- (GPBEnumDescriptor)initWithName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7;
- (NSString)name;
- (id)enumNameForValue:(int)a3;
- (id)getEnumNameForIndex:(unsigned int)a3;
- (id)getEnumTextFormatNameForIndex:(unsigned int)a3;
- (id)textFormatNameForValue:(int)a3;
- (unsigned)enumNameCount;
- (void)calcValueNameOffsets;
- (void)dealloc;
- (void)enumVerifier;
@end

@implementation GPBEnumDescriptor

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = objc_alloc((Class)a1);

  return [v12 initWithName:a3 valueNames:a4 values:a5 count:v8 enumVerifier:a7];
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 extraTextFormatInfo:(const char *)a8
{
  id result = [a1 allocDescriptorForName:a3 valueNames:a4 values:a5 count:*(void *)&a6 enumVerifier:a7];
  *((void *)result + 5) = a8;
  return result;
}

- (GPBEnumDescriptor)initWithName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7
{
  v14.receiver = self;
  v14.super_class = (Class)GPBEnumDescriptor;
  id v12 = [(GPBEnumDescriptor *)&v14 init];
  if (v12)
  {
    v12->name_ = (NSString *)[a3 copy];
    v12->valueNames_ = a4;
    v12->valueCount_ = a6;
    v12->values_ = a5;
    v12->enumVerifier_ = a7;
  }
  return v12;
}

- (void)dealloc
{
  nameOffsets = self->nameOffsets_;
  if (nameOffsets) {
    free(nameOffsets);
  }
  v4.receiver = self;
  v4.super_class = (Class)GPBEnumDescriptor;
  [(GPBEnumDescriptor *)&v4 dealloc];
}

- (void)calcValueNameOffsets
{
  objc_sync_enter(self);
  if (!self->nameOffsets_)
  {
    v3 = (unsigned int *)malloc_type_malloc(4 * self->valueCount_, 0x100004052888210uLL);
    if (v3)
    {
      if (self->valueCount_)
      {
        unint64_t v4 = 0;
        valueNames = self->valueNames_;
        v6 = valueNames;
        do
        {
          v3[v4] = v6 - valueNames;
          while (*(unsigned __int8 *)v6++)
            ;
          ++v4;
        }
        while (v4 < self->valueCount_);
      }
      self->nameOffsets_ = v3;
    }
  }

  objc_sync_exit(self);
}

- (id)enumNameForValue:(int)a3
{
  uint64_t valueCount = self->valueCount_;
  if (!valueCount) {
    return 0;
  }
  uint64_t v4 = 0;
  while (self->values_[v4] != a3)
  {
    if (valueCount == ++v4) {
      return 0;
    }
  }
  return [(GPBEnumDescriptor *)self getEnumNameForIndex:v4];
}

- (BOOL)getValue:(int *)a3 forEnumName:(id)a4
{
  NSUInteger v7 = [(NSString *)self->name_ length];
  NSUInteger v8 = v7 + 1;
  if ((unint64_t)[a4 length] <= v7 + 1) {
    goto LABEL_10;
  }
  unsigned int v9 = [a4 hasPrefix:self->name_];
  if (!v9) {
    return v9;
  }
  if ([a4 characterAtIndex:v7] != 95
    || (v10 = (char *)[a4 UTF8String], (nameOffsets = self->nameOffsets_) == 0)
    && ([(GPBEnumDescriptor *)self calcValueNameOffsets],
        (nameOffsets = self->nameOffsets_) == 0)
    || (uint64_t valueCount = self->valueCount_, !valueCount))
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9;
  }
  unint64_t v13 = 0;
  objc_super v14 = &v10[v8];
  valueNames = self->valueNames_;
  uint64_t v16 = 4 * valueCount;
  while (strcmp(v14, &valueNames[nameOffsets[v13 / 4]]))
  {
    v13 += 4;
    if (v16 == v13) {
      goto LABEL_10;
    }
  }
  if (a3) {
    *a3 = self->values_[v13 / 4];
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)getValue:(int *)a3 forEnumTextFormatName:(id)a4
{
  if (!self->nameOffsets_)
  {
    [(GPBEnumDescriptor *)self calcValueNameOffsets];
    if (!self->nameOffsets_) {
      return 0;
    }
  }
  if (!self->valueCount_) {
    return 0;
  }
  uint64_t v7 = 0;
  while (!objc_msgSend(-[GPBEnumDescriptor getEnumTextFormatNameForIndex:](self, "getEnumTextFormatNameForIndex:", v7), "isEqual:", a4))
  {
    if (++v7 >= self->valueCount_) {
      return 0;
    }
  }
  if (a3) {
    *a3 = self->values_[v7];
  }
  return 1;
}

- (id)textFormatNameForValue:(int)a3
{
  uint64_t valueCount = self->valueCount_;
  if (!valueCount) {
    return 0;
  }
  uint64_t v4 = 0;
  while (self->values_[v4] != a3)
  {
    if (valueCount == ++v4) {
      return 0;
    }
  }
  return [(GPBEnumDescriptor *)self getEnumTextFormatNameForIndex:v4];
}

- (unsigned)enumNameCount
{
  return self->valueCount_;
}

- (id)getEnumNameForIndex:(unsigned int)a3
{
  nameOffsets = self->nameOffsets_;
  if ((nameOffsets
     || ([(GPBEnumDescriptor *)self calcValueNameOffsets],
         (nameOffsets = self->nameOffsets_) != 0))
    && self->valueCount_ > a3)
  {
    return +[NSString stringWithFormat:@"%@_%s", self->name_, &self->valueNames_[nameOffsets[a3]]];
  }
  else
  {
    return 0;
  }
}

- (id)getEnumTextFormatNameForIndex:(unsigned int)a3
{
  nameOffsets = self->nameOffsets_;
  if (!nameOffsets)
  {
    [(GPBEnumDescriptor *)self calcValueNameOffsets];
    nameOffsets = self->nameOffsets_;
    if (!nameOffsets) {
      return 0;
    }
  }
  if (self->valueCount_ <= a3) {
    return 0;
  }
  v6 = +[NSString stringWithUTF8String:&self->valueNames_[nameOffsets[a3]]];
  extraTextFormatInfo = (char *)self->extraTextFormatInfo_;
  if (!extraTextFormatInfo || (NSUInteger v8 = (NSMutableString *)GPBDecodeTextFormatName(extraTextFormatInfo, a3, v6)) == 0)
  {
    unsigned int v9 = [(NSString *)v6 length];
    NSUInteger v8 = +[NSMutableString stringWithCapacity:v9];
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        unsigned int v11 = [(NSString *)v6 characterAtIndex:i];
        char v12 = v11;
        if (i && v11 >= 0x41 && v11 <= 0x5A) {
          [(NSMutableString *)v8 appendString:@"_"];
        }
        [(NSMutableString *)v8 appendFormat:@"%c", __toupper(v12)];
      }
    }
  }
  return v8;
}

- (NSString)name
{
  return self->name_;
}

- (void)enumVerifier
{
  return self->enumVerifier_;
}

@end