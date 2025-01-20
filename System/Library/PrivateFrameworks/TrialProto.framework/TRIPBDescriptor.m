@interface TRIPBDescriptor
+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9;
- (BOOL)isWireFormat;
- (Class)messageClass;
- (NSArray)fields;
- (NSArray)oneofs;
- (NSString)fullName;
- (NSString)name;
- (TRIPBDescriptor)containingType;
- (TRIPBDescriptor)initWithClass:(Class)a3 file:(id)a4 fields:(id)a5 storageSize:(unsigned int)a6 wireFormat:(BOOL)a7;
- (TRIPBFileDescriptor)file;
- (const)extensionRanges;
- (id)fieldWithName:(id)a3;
- (id)fieldWithNumber:(unsigned int)a3;
- (id)oneofWithName:(id)a3;
- (unsigned)extensionRangesCount;
- (void)dealloc;
- (void)setupContainingMessageClassName:(const char *)a3;
- (void)setupExtensionRanges:(const TRIPBExtensionRange *)a3 count:(int)a4;
- (void)setupExtraTextInfo:(const char *)a3;
- (void)setupMessageClassNameSuffix:(id)a3;
- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5;
@end

@implementation TRIPBDescriptor

- (TRIPBFileDescriptor)file
{
  return self->file_;
}

- (Class)messageClass
{
  return self->messageClass_;
}

- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((a5 & 0x80000000) == 0)
  {
    v19 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[TRIPBDescriptor setupOneofs:count:firstHasIndex:]"), @"TRIPBDescriptor.m", 187, @"Should always be <0");
  }
  uint64_t v7 = a4;
  v8 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = a3[v9];
      fields = self->fields_;
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v13 = [(NSArray *)fields countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(fields);
            }
            if (*(_DWORD *)(*(void *)(*(void *)(*((void *)&v22 + 1) + 8 * v16) + 8) + 20) == v5) {
              objc_msgSend(v12, "addObject:");
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [(NSArray *)fields countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
      }
      if (![v12 count])
      {
        v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[TRIPBDescriptor setupOneofs:count:firstHasIndex:]"), @"TRIPBDescriptor.m", 193, @"No fields for this oneof? (%s:%d)", v10, v5);
      }
      v17 = [[TRIPBOneofDescriptor alloc] initWithName:v10 fields:v12];
      [(NSArray *)v8 addObject:v17];

      ++v9;
      uint64_t v5 = (v5 - 1);
    }
    while (v9 != v7);
  }
  self->oneofs_ = v8;
}

+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  LODWORD(v9) = a7;
  uint64_t v11 = objc_msgSend(a5, "syntax", a3, a4);
  if (v9)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = v9;
    uint64_t v15 = (char *)a6;
    uint64_t v9 = v9;
    do
    {
      if (!v13) {
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
      }
      if (a9) {
        uint64_t v16 = a6;
      }
      else {
        uint64_t v16 = v15;
      }
      v17 = [[TRIPBFieldDescriptor alloc] initWithFieldDescription:v16 includesDefault:a9 & 1 syntax:v12];
      [v13 addObject:v17];

      v15 += 32;
      a6 = (char *)a6 + 40;
      --v9;
    }
    while (v9);
  }
  else
  {
    uint64_t v13 = 0;
  }
  v18 = (void *)[objc_alloc((Class)a1) initWithClass:a3 file:a5 fields:v13 storageSize:a8 wireFormat:(a9 >> 1) & 1];

  return v18;
}

- (TRIPBDescriptor)initWithClass:(Class)a3 file:(id)a4 fields:(id)a5 storageSize:(unsigned int)a6 wireFormat:(BOOL)a7
{
  v15.receiver = self;
  v15.super_class = (Class)TRIPBDescriptor;
  uint64_t v12 = [(TRIPBDescriptor *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->messageClass_ = a3;
    v12->file_ = (TRIPBFileDescriptor *)a4;
    v12->fields_ = (NSArray *)a5;
    v13->storageSize_ = a6;
    v13->wireFormat_ = a7;
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TRIPBDescriptor;
  [(TRIPBDescriptor *)&v3 dealloc];
}

- (void)setupExtraTextInfo:(const char *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:");
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    fields = self->fields_;
    uint64_t v6 = [(NSArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(fields);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if ((*(_WORD *)(v10[1] + 28) & 0x40) != 0) {
            objc_setAssociatedObject(v10, &kTextFormatExtraValueKey, v4, (void *)1);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setupExtensionRanges:(const TRIPBExtensionRange *)a3 count:(int)a4
{
  self->extensionRanges_ = a3;
  self->extensionRangesCount_ = a4;
}

- (void)setupContainingMessageClassName:(const char *)a3
{
  if (!objc_getClass(a3)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 226, @"Class %s not defined", a3);
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F29238] valueWithPointer:a3];
  objc_setAssociatedObject(self, &kParentClassNameValueKey, v6, (void *)1);
}

- (void)setupMessageClassNameSuffix:(id)a3
{
  if ([a3 length])
  {
    objc_setAssociatedObject(self, &kClassNameSuffixKey, a3, (void *)1);
  }
}

- (NSString)name
{
  return NSStringFromClass(self->messageClass_);
}

- (TRIPBDescriptor)containingType
{
  result = (TRIPBDescriptor *)objc_getAssociatedObject(self, &kParentClassNameValueKey);
  if (result)
  {
    uint64_t v5 = (const char *)[(TRIPBDescriptor *)result pointerValue];
    Class Class = objc_getClass(v5);
    if (!Class) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 253, @"Class %s not defined", v5);
    }
    return (TRIPBDescriptor *)[(objc_class *)Class descriptor];
  }
  return result;
}

- (NSString)fullName
{
  v4 = NSStringFromClass([(TRIPBDescriptor *)self messageClass]);
  uint64_t v5 = [(TRIPBDescriptor *)self file];
  uint64_t v6 = [(TRIPBFileDescriptor *)v5 objcPrefix];
  if (v6 && ![(NSString *)v4 hasPrefix:v6])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 264, @"Class didn't have correct prefix? (%@ - %@)", v4, v6);
    return 0;
  }
  uint64_t v7 = [(TRIPBDescriptor *)self containingType];
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v9 = NSStringFromClass([(TRIPBDescriptor *)v7 messageClass]);
  id AssociatedObject = objc_getAssociatedObject(v8, &kClassNameSuffixKey);
  if (AssociatedObject)
  {
    long long v11 = AssociatedObject;
    if (![(NSString *)v9 hasSuffix:AssociatedObject])
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 278, @"ParentMessage class didn't have correct suffix? (%@ - %@)", v4, v11);
      return 0;
    }
    uint64_t v9 = -[NSString substringToIndex:](v9, "substringToIndex:", -[NSString length](v9, "length") - [v11 length]);
  }
  uint64_t v6 = [(NSString *)v9 stringByAppendingString:@"_"];
  if (![(NSString *)v4 hasPrefix:v6])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 288, @"Class didn't have the correct parent name prefix? (%@ - %@)", v6, v4);
    return 0;
  }
LABEL_8:
  long long v12 = [(NSString *)v4 substringFromIndex:[(NSString *)v6 length]];
  id v13 = objc_getAssociatedObject(self, &kClassNameSuffixKey);
  if (!v13) {
    goto LABEL_11;
  }
  long long v14 = v13;
  if (![(NSString *)v12 hasSuffix:v13])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDescriptor.m", 302, @"Message class didn't have correct suffix? (%@ - %@)", v12, v14);
    return 0;
  }
  long long v12 = -[NSString substringToIndex:](v12, "substringToIndex:", -[NSString length](v12, "length") - [v14 length]);
LABEL_11:
  if (v8) {
    objc_super v15 = [(TRIPBDescriptor *)v8 fullName];
  }
  else {
    objc_super v15 = [(TRIPBFileDescriptor *)v5 package];
  }
  v17 = v15;
  if (![(NSString *)v15 length]) {
    return v12;
  }
  return (NSString *)[NSString stringWithFormat:@"%@.%@", v17, v12];
}

- (id)fieldWithNumber:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  fields = self->fields_;
  id result = (id)[(NSArray *)fields countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(fields);
      }
      id result = *(id *)(*((void *)&v9 + 1) + 8 * v8);
      if (*(_DWORD *)(*((void *)result + 1) + 16) == a3) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id result = (id)[(NSArray *)fields countByEnumeratingWithState:&v9 objects:v13 count:16];
        id v6 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)fieldWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  fields = self->fields_;
  uint64_t v5 = [(NSArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(fields);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "name"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)oneofWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  oneofs = self->oneofs_;
  uint64_t v5 = [(NSArray *)oneofs countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(oneofs);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "name"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)oneofs countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (NSArray)fields
{
  return self->fields_;
}

- (NSArray)oneofs
{
  return self->oneofs_;
}

- (const)extensionRanges
{
  return self->extensionRanges_;
}

- (unsigned)extensionRangesCount
{
  return self->extensionRangesCount_;
}

- (BOOL)isWireFormat
{
  return self->wireFormat_;
}

@end