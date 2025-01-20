@interface GPBUnknownFieldSet
+ (BOOL)isFieldTag:(int)a3;
- (BOOL)hasField:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFieldFrom:(int)a3 input:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)description;
- (id)getField:(int)a3;
- (id)mutableFieldForNumber:(int)a3 create:(BOOL)a4;
- (id)sortedFields;
- (unint64_t)countOfFields;
- (unint64_t)hash;
- (unint64_t)serializedSize;
- (unint64_t)serializedSizeAsMessageSet;
- (void)addField:(id)a3;
- (void)addUnknownMapEntry:(int)a3 value:(id)a4;
- (void)dealloc;
- (void)getTags:(int *)a3;
- (void)mergeFromCodedInputStream:(id)a3;
- (void)mergeFromData:(id)a3;
- (void)mergeMessageSetMessage:(int)a3 data:(id)a4;
- (void)mergeUnknownFields:(id)a3;
- (void)mergeVarintField:(int)a3 value:(int)a4;
- (void)writeAsMessageSetTo:(id)a3;
- (void)writeToCodedOutputStream:(id)a3;
@end

@implementation GPBUnknownFieldSet

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[GPBUnknownFieldSet allocWithZone:a3] init];
  fields = self->fields_;
  if (fields) {
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)sub_1002E9F24, v4);
  }
  return v4;
}

- (void)dealloc
{
  fields = self->fields_;
  if (fields) {
    CFRelease(fields);
  }
  v4.receiver = self;
  v4.super_class = (Class)GPBUnknownFieldSet;
  [(GPBUnknownFieldSet *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  fields = self->fields_;
  unint64_t v6 = *((void *)a3 + 1);
  BOOL result = ((unint64_t)fields | v6) == 0;
  if (fields) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    return CFEqual(self->fields_, (CFTypeRef)v6) != 0;
  }
  return result;
}

- (unint64_t)hash
{
  fields = self->fields_;
  if (fields) {
    return CFHash(fields);
  }
  else {
    return objc_opt_class();
  }
}

- (BOOL)hasField:(int)a3
{
  fields = self->fields_;
  if (fields) {
    LOBYTE(fields) = CFDictionaryGetValue(fields, (const void *)a3) != 0;
  }
  return (char)fields;
}

- (id)getField:(int)a3
{
  id result = self->fields_;
  if (result) {
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)a3);
  }
  return result;
}

- (unint64_t)countOfFields
{
  unint64_t result = (unint64_t)self->fields_;
  if (result) {
    return CFDictionaryGetCount((CFDictionaryRef)result);
  }
  return result;
}

- (id)sortedFields
{
  fields = self->fields_;
  if (fields)
  {
    size_t Count = CFDictionaryGetCount(fields);
    v5 = (const void **)((char *)&v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, &v15, v5);
    unint64_t v6 = &v15 - 2 * Count;
    if (Count)
    {
      uint64_t v7 = 0;
      BOOL v8 = v6 + 1;
      do
      {
        v9 = v5[v7];
        *(v8 - 1) = v9;
        *BOOL v8 = v9;
        ++v7;
        v8 += 2;
      }
      while (Count != v7);
      qsort_b(&v15 - 2 * Count, Count, 0x10uLL, &stru_1003BA550);
      v10 = (uint64_t *)(v6 + 1);
      v11 = (const void **)((char *)&v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
      size_t v12 = Count;
      do
      {
        uint64_t v13 = *v10;
        v10 += 2;
        *v11++ = v13;
        --v12;
      }
      while (v12);
    }
    else
    {
      qsort_b(v6, 0, 0x10uLL, &stru_1003BA550);
    }
    return +[NSArray arrayWithObjects:v5 count:Count];
  }
  else
  {
    return +[NSArray array];
  }
}

- (void)writeToCodedOutputStream:(id)a3
{
  fields = self->fields_;
  if (fields)
  {
    size_t Count = CFDictionaryGetCount(fields);
    uint64_t v7 = (const void **)((char *)&v14 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, &v14, v7);
    if (Count < 2)
    {
      [(id)*v7 writeToOutput:a3];
    }
    else
    {
      BOOL v8 = &v14 - 2 * Count;
      uint64_t v9 = 0;
      v10 = v8 + 1;
      do
      {
        v11 = v7[v9];
        *(v10 - 1) = v11;
        void *v10 = v11;
        ++v9;
        v10 += 2;
      }
      while (Count != v9);
      qsort_b(&v14 - 2 * Count, Count, 0x10uLL, &stru_1003BA570);
      size_t v12 = (void **)(v8 + 1);
      do
      {
        uint64_t v13 = *v12;
        v12 += 2;
        [v13 writeToOutput:a3];
        --Count;
      }
      while (Count);
    }
  }
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p>: TextFormat: {\n", objc_opt_class(), self];
  [(NSMutableString *)v3 appendString:GPBTextFormatForUnknownFieldSet(self, @"  ")];
  [(NSMutableString *)v3 appendString:@"}"];
  return v3;
}

- (unint64_t)serializedSize
{
  unint64_t context = 0;
  unint64_t result = (unint64_t)self->fields_;
  if (result)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)sub_1002EA460, &context);
    return context;
  }
  return result;
}

- (void)writeAsMessageSetTo:(id)a3
{
  fields = self->fields_;
  if (fields) {
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)sub_1002EA4B4, a3);
  }
}

- (unint64_t)serializedSizeAsMessageSet
{
  unint64_t context = 0;
  unint64_t result = (unint64_t)self->fields_;
  if (result)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)sub_1002EA500, &context);
    return context;
  }
  return result;
}

- (id)data
{
  v3 = +[NSMutableData dataWithLength:[(GPBUnknownFieldSet *)self serializedSize]];
  objc_super v4 = [[GPBCodedOutputStream alloc] initWithData:v3];
  [(GPBUnknownFieldSet *)self writeToCodedOutputStream:v4];

  return v3;
}

+ (BOOL)isFieldTag:(int)a3
{
  return GPBWireFormatGetTagWireType(a3) != 4;
}

- (void)addField:(id)a3
{
  signed int v5 = [a3 number];
  if (!v5) {
    +[NSException raise:NSInvalidArgumentException format:@"Zero is not a valid field number."];
  }
  fields = self->fields_;
  if (!fields)
  {
    fields = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
    self->fields_ = fields;
  }

  CFDictionarySetValue(fields, (const void *)v5, a3);
}

- (id)mutableFieldForNumber:(int)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  fields = self->fields_;
  if (fields)
  {
    Value = (GPBUnknownField *)CFDictionaryGetValue(fields, (const void *)a3);
    if (Value) {
      return Value;
    }
  }
  else
  {
    Value = 0;
  }
  if (v4)
  {
    Value = [[GPBUnknownField alloc] initWithNumber:v5];
    [(GPBUnknownFieldSet *)self addField:Value];
  }
  return Value;
}

- (void)mergeUnknownFields:(id)a3
{
  if (a3)
  {
    CFDictionaryRef v4 = (const __CFDictionary *)*((void *)a3 + 1);
    if (v4) {
      CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)sub_1002EA718, self);
    }
  }
}

- (void)mergeFromData:(id)a3
{
  CFDictionaryRef v4 = [[GPBCodedInputStream alloc] initWithData:a3];
  [(GPBUnknownFieldSet *)self mergeFromCodedInputStream:v4];
  [(GPBCodedInputStream *)v4 checkLastTagWas:0];
}

- (void)mergeVarintField:(int)a3 value:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!a3) {
    +[NSException raise:NSInvalidArgumentException format:@"Zero is not a valid field number."];
  }
  id v7 = [(GPBUnknownFieldSet *)self mutableFieldForNumber:v5 create:1];

  [v7 addVarint:a4];
}

- (BOOL)mergeFieldFrom:(int)a3 input:(id)a4
{
  if (!GPBWireFormatIsValidTag(a3)) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"GPBUnknownFieldSet.m" lineNumber:325 description:@"Got passed an invalid tag"];
  }
  uint64_t TagFieldNumber = GPBWireFormatGetTagFieldNumber(a3);
  int TagWireType = GPBWireFormatGetTagWireType(a3);
  BOOL v10 = 0;
  v11 = (uint64_t *)((char *)a4 + 8);
  switch(TagWireType)
  {
    case 0:
      BOOL v10 = 1;
      [self mutableFieldForNumber:TagFieldNumber create:1]->addVarint(GPBCodedInputStreamReadInt64(v11));
      break;
    case 1:
      BOOL v10 = 1;
      [self mutableFieldForNumber:TagFieldNumber create:1]->addFixed64:GPBCodedInputStreamReadFixed64(v11);
      break;
    case 2:
      id RetainedBytes = GPBCodedInputStreamReadRetainedBytes(v11);
      BOOL v10 = 1;
      [self mutableFieldForNumber:TagFieldNumber create:1]->addLengthDelimited:RetainedBytes;

      break;
    case 3:
      uint64_t v13 = objc_alloc_init(GPBUnknownFieldSet);
      [a4 readUnknownGroup:TagFieldNumber message:v13];
      BOOL v10 = 1;
      [self mutableFieldForNumber:TagFieldNumber create:1 addGroup:v13];

      break;
    case 5:
      BOOL v10 = 1;
      [self mutableFieldForNumber:TagFieldNumber create:1].addFixed32:GPBCodedInputStreamReadFixed32(v11);
      break;
    default:
      return v10;
  }
  return v10;
}

- (void)mergeMessageSetMessage:(int)a3 data:(id)a4
{
  id v5 = [(GPBUnknownFieldSet *)self mutableFieldForNumber:*(void *)&a3 create:1];

  [v5 addLengthDelimited:a4];
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  id v5 = [(GPBUnknownFieldSet *)self mutableFieldForNumber:*(void *)&a3 create:1];

  [v5 addLengthDelimited:a4];
}

- (void)mergeFromCodedInputStream:(id)a3
{
  do
    uint64_t Tag = GPBCodedInputStreamReadTag((uint64_t)a3 + 8);
  while (Tag && [(GPBUnknownFieldSet *)self mergeFieldFrom:Tag input:a3]);
}

- (void)getTags:(int *)a3
{
  fields = self->fields_;
  if (fields)
  {
    CFIndex Count = CFDictionaryGetCount(fields);
    id v7 = (const void **)((char *)&v9 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, v7, 0);
    for (; Count; --Count)
    {
      BOOL v8 = *v7++;
      *a3++ = (int)v8;
    }
  }
}

@end