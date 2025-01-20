@interface TRIPBUnknownFieldSet
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

@implementation TRIPBUnknownFieldSet

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TRIPBUnknownFieldSet allocWithZone:a3] init];
  fields = self->fields_;
  if (fields) {
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)CopyWorker, v4);
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
  v4.super_class = (Class)TRIPBUnknownFieldSet;
  [(TRIPBUnknownFieldSet *)&v4 dealloc];
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
  v16[1] = *(const void **)MEMORY[0x1E4F143B8];
  fields = self->fields_;
  if (fields)
  {
    size_t Count = CFDictionaryGetCount(fields);
    v5 = (const void **)((char *)v16 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, v16, v5);
    unint64_t v6 = &v16[-2 * Count];
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
      qsort_b(&v16[-2 * Count], Count, 0x10uLL, &__block_literal_global_0);
      v10 = (uint64_t *)(v6 + 1);
      v11 = (const void **)((char *)v16 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
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
      qsort_b(v6, 0, 0x10uLL, &__block_literal_global_0);
    }
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:Count];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v14 array];
  }
}

uint64_t __36__TRIPBUnknownFieldSet_sortedFields__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 == *a3) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = -1;
  }
  if (*a2 > *a3) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)writeToCodedOutputStream:(id)a3
{
  v14[1] = *(const void **)MEMORY[0x1E4F143B8];
  fields = self->fields_;
  if (fields)
  {
    size_t Count = CFDictionaryGetCount(fields);
    uint64_t v7 = (const void **)((char *)v14 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, v14, v7);
    if (Count < 2)
    {
      [(id)*v7 writeToOutput:a3];
    }
    else
    {
      BOOL v8 = &v14[-2 * Count];
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
      qsort_b(&v14[-2 * Count], Count, 0x10uLL, &__block_literal_global_3);
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

uint64_t __49__TRIPBUnknownFieldSet_writeToCodedOutputStream___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 == *a3) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = -1;
  }
  if (*a2 > *a3) {
    return 1;
  }
  else {
    return v3;
  }
}

- (id)description
{
  unsigned int v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>: TextFormat: {\n", objc_opt_class(), self];
  objc_msgSend(v3, "appendString:", TRIPBTextFormatForUnknownFieldSet(self, @"  "));
  [v3 appendString:@"}"];
  return v3;
}

- (unint64_t)serializedSize
{
  unint64_t context = 0;
  unint64_t result = (unint64_t)self->fields_;
  if (result)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)TRIPBUnknownFieldSetSerializedSize, &context);
    return context;
  }
  return result;
}

- (void)writeAsMessageSetTo:(id)a3
{
  fields = self->fields_;
  if (fields) {
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)TRIPBUnknownFieldSetWriteAsMessageSetTo, a3);
  }
}

- (unint64_t)serializedSizeAsMessageSet
{
  unint64_t context = 0;
  unint64_t result = (unint64_t)self->fields_;
  if (result)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)TRIPBUnknownFieldSetSerializedSizeAsMessageSet, &context);
    return context;
  }
  return result;
}

- (id)data
{
  unsigned int v3 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", -[TRIPBUnknownFieldSet serializedSize](self, "serializedSize"));
  objc_super v4 = [[TRIPBCodedOutputStream alloc] initWithData:v3];
  [(TRIPBUnknownFieldSet *)self writeToCodedOutputStream:v4];

  return v3;
}

+ (BOOL)isFieldTag:(int)a3
{
  return (a3 & 7) != 4;
}

- (void)addField:(id)a3
{
  int v5 = [a3 number];
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Zero is not a valid field number."];
  }
  fields = self->fields_;
  if (!fields)
  {
    fields = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
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
    Value = (TRIPBUnknownField *)CFDictionaryGetValue(fields, (const void *)a3);
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
    Value = [[TRIPBUnknownField alloc] initWithNumber:v5];
    [(TRIPBUnknownFieldSet *)self addField:Value];
  }
  return Value;
}

- (void)mergeUnknownFields:(id)a3
{
  if (a3)
  {
    CFDictionaryRef v4 = (const __CFDictionary *)*((void *)a3 + 1);
    if (v4) {
      CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)TRIPBUnknownFieldSetMergeUnknownFields, self);
    }
  }
}

- (void)mergeFromData:(id)a3
{
  CFDictionaryRef v4 = [[TRIPBCodedInputStream alloc] initWithData:a3];
  [(TRIPBUnknownFieldSet *)self mergeFromCodedInputStream:v4];
  [(TRIPBCodedInputStream *)v4 checkLastTagWas:0];
}

- (void)mergeVarintField:(int)a3 value:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Zero is not a valid field number."];
  }
  id v7 = [(TRIPBUnknownFieldSet *)self mutableFieldForNumber:v5 create:1];
  [v7 addVarint:a4];
}

- (BOOL)mergeFieldFrom:(int)a3 input:(id)a4
{
  if ((~a3 & 6) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBUnknownFieldSet.m", 325, @"Got passed an invalid tag");
  }
  BOOL v7 = 0;
  int v8 = a3 & 7;
  uint64_t v9 = a3 >> 3;
  switch(v8)
  {
    case 0:
      BOOL v7 = 1;
      objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v9, 1), "addVarint:", ReadRawVarint64((uint64_t *)a4 + 1));
      break;
    case 1:
      BOOL v7 = 1;
      id v10 = [(TRIPBUnknownFieldSet *)self mutableFieldForNumber:v9 create:1];
      CheckSize((uint64_t)a4 + 8, 8);
      uint64_t v11 = *((void *)a4 + 3);
      uint64_t v12 = *(void *)(*((void *)a4 + 1) + v11);
      *((void *)a4 + 3) = v11 + 8;
      [v10 addFixed64:v12];
      break;
    case 2:
      RetainedBytes = (void *)TRIPBCodedInputStreamReadRetainedBytes((uint64_t *)a4 + 1);
      BOOL v7 = 1;
      objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v9, 1), "addLengthDelimited:", RetainedBytes);

      break;
    case 3:
      v14 = objc_alloc_init(TRIPBUnknownFieldSet);
      [a4 readUnknownGroup:v9 message:v14];
      BOOL v7 = 1;
      objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v9, 1), "addGroup:", v14);

      break;
    case 5:
      BOOL v7 = 1;
      id v15 = [(TRIPBUnknownFieldSet *)self mutableFieldForNumber:v9 create:1];
      CheckSize((uint64_t)a4 + 8, 4);
      uint64_t v16 = *((void *)a4 + 3);
      uint64_t v17 = *(unsigned int *)(*((void *)a4 + 1) + v16);
      *((void *)a4 + 3) = v16 + 4;
      [v15 addFixed32:v17];
      break;
    default:
      return v7;
  }
  return v7;
}

- (void)mergeMessageSetMessage:(int)a3 data:(id)a4
{
  id v5 = [(TRIPBUnknownFieldSet *)self mutableFieldForNumber:*(void *)&a3 create:1];
  [v5 addLengthDelimited:a4];
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  id v5 = [(TRIPBUnknownFieldSet *)self mutableFieldForNumber:*(void *)&a3 create:1];
  [v5 addLengthDelimited:a4];
}

- (void)mergeFromCodedInputStream:(id)a3
{
  id v5 = (char *)a3 + 8;
  do
    uint64_t Tag = TRIPBCodedInputStreamReadTag((uint64_t)v5);
  while (Tag && [(TRIPBUnknownFieldSet *)self mergeFieldFrom:Tag input:a3]);
}

- (void)getTags:(int *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  fields = self->fields_;
  if (fields)
  {
    CFIndex Count = CFDictionaryGetCount(fields);
    BOOL v7 = (const void **)((char *)v9 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, v7, 0);
    for (; Count; --Count)
    {
      int v8 = *v7++;
      *a3++ = (int)v8;
    }
  }
}

@end