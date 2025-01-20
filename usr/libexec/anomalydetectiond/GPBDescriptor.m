@interface GPBDescriptor
+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9;
- (BOOL)isWireFormat;
- (Class)messageClass;
- (GPBDescriptor)containingType;
- (GPBDescriptor)initWithClass:(Class)a3 file:(id)a4 fields:(id)a5 storageSize:(unsigned int)a6 wireFormat:(BOOL)a7;
- (GPBFileDescriptor)file;
- (NSArray)fields;
- (NSArray)oneofs;
- (NSString)fullName;
- (NSString)name;
- (const)extensionRanges;
- (id)fieldWithName:(id)a3;
- (id)fieldWithNumber:(unsigned int)a3;
- (id)oneofWithName:(id)a3;
- (unsigned)extensionRangesCount;
- (void)dealloc;
- (void)setupContainingMessageClass:(Class)a3;
- (void)setupContainingMessageClassName:(const char *)a3;
- (void)setupExtensionRanges:(const GPBExtensionRange *)a3 count:(int)a4;
- (void)setupExtraTextInfo:(const char *)a3;
- (void)setupMessageClassNameSuffix:(id)a3;
- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5;
@end

@implementation GPBDescriptor

+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  LODWORD(v9) = a7;
  id v11 = [a5 syntax:a3, a4];
  if (v9)
  {
    id v12 = v11;
    id v13 = 0;
    uint64_t v9 = v9;
    uint64_t v23 = v9;
    v14 = (char *)a6;
    do
    {
      if (!v13) {
        id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v23];
      }
      if (a9) {
        v15 = v14;
      }
      else {
        v15 = a6;
      }
      v16 = [[GPBFieldDescriptor alloc] initWithFieldDescription:v15 includesDefault:a9 & 1 usesClassRefs:(a9 >> 2) & 1 proto3OptionalKnown:(a9 >> 3) & 1 syntax:v12];
      [v13 addObject:v16];

      v14 += 40;
      a6 = (char *)a6 + 32;
      --v9;
    }
    while (v9);
  }
  else
  {
    id v13 = 0;
  }
  id v17 = [objc_alloc((Class)a1) initWithClass:a3 file:a5 fields:v13 storageSize:a8 wireFormat:(a9 >> 1) & 1];

  return v17;
}

- (GPBDescriptor)initWithClass:(Class)a3 file:(id)a4 fields:(id)a5 storageSize:(unsigned int)a6 wireFormat:(BOOL)a7
{
  v15.receiver = self;
  v15.super_class = (Class)GPBDescriptor;
  id v12 = [(GPBDescriptor *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    v12->messageClass_ = a3;
    v12->file_ = (GPBFileDescriptor *)a4;
    v12->fields_ = (NSArray *)a5;
    v13->storageSize_ = a6;
    v13->wireFormat_ = a7;
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GPBDescriptor;
  [(GPBDescriptor *)&v3 dealloc];
}

- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ((a5 & 0x80000000) == 0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GPBDescriptor setupOneofs:count:firstHasIndex:]"), @"GPBDescriptor.m", 191, @"Should always be <0");
  }
  uint64_t v7 = a4;
  v8 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a4];
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = a3[v9];
      fields = self->fields_;
      id v12 = objc_alloc_init((Class)NSMutableArray);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = [(NSArray *)fields countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          v16 = 0;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(fields);
            }
            if (*(_DWORD *)(*(void *)(*(void *)(*((void *)&v20 + 1) + 8 * (void)v16) + 8) + 20) == v5) {
              [v12 addObject:];
            }
            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [(NSArray *)fields countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
      if (![v12 count]) {
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GPBDescriptor setupOneofs:count:firstHasIndex:]"), @"GPBDescriptor.m", 197, @"No fields for this oneof? (%s:%d)", v10, v5);
      }
      id v17 = [[GPBOneofDescriptor alloc] initWithName:v10 fields:v12];
      [(NSArray *)v8 addObject:v17];

      ++v9;
      uint64_t v5 = (v5 - 1);
    }
    while (v9 != v7);
  }
  self->oneofs_ = v8;
}

- (void)setupExtraTextInfo:(const char *)a3
{
  if (a3)
  {
    v4 = +[NSValue valueWithPointer:](NSValue, "valueWithPointer:");
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    fields = self->fields_;
    id v6 = [(NSArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(fields);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
          if ((*(_WORD *)(v10[1] + 28) & 0x40) != 0) {
            objc_setAssociatedObject(v10, &unk_10033F525, v4, (void *)1);
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setupExtensionRanges:(const GPBExtensionRange *)a3 count:(int)a4
{
  self->extensionRanges_ = a3;
  self->extensionRangesCount_ = a4;
}

- (void)setupContainingMessageClass:(Class)a3
{
}

- (void)setupContainingMessageClassName:(const char *)a3
{
  Class Class = objc_getClass(a3);
  if (!Class) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDescriptor.m", 237, @"Class %s not defined", a3 object file lineNumber description];
  }

  [(GPBDescriptor *)self setupContainingMessageClass:Class];
}

- (void)setupMessageClassNameSuffix:(id)a3
{
  if ([a3 length])
  {
    objc_setAssociatedObject(self, &unk_10033F527, a3, (void *)1);
  }
}

- (NSString)name
{
  return NSStringFromClass(self->messageClass_);
}

- (GPBDescriptor)containingType
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_10033F526);

  return (GPBDescriptor *)[AssociatedObject descriptor];
}

- (NSString)fullName
{
  v4 = NSStringFromClass([(GPBDescriptor *)self messageClass]);
  uint64_t v5 = [(GPBDescriptor *)self file];
  id v6 = [(GPBFileDescriptor *)v5 objcPrefix];
  if (v6 && ![(NSString *)v4 hasPrefix:v6])
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDescriptor.m", 265, @"Class didn't have correct prefix? (%@ - %@)", v4, v6 object file lineNumber description];
    return 0;
  }
  id v7 = [(GPBDescriptor *)self containingType];
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v9 = NSStringFromClass([(GPBDescriptor *)v7 messageClass]);
  id AssociatedObject = objc_getAssociatedObject(v8, &unk_10033F527);
  if (AssociatedObject)
  {
    long long v11 = AssociatedObject;
    if (![(NSString *)v9 hasSuffix:AssociatedObject])
    {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDescriptor.m", 279, @"ParentMessage class didn't have correct suffix? (%@ - %@)", v4, v11 object file lineNumber description];
      return 0;
    }
    uint64_t v9 = -[NSString substringToIndex:](v9, "substringToIndex:", (unsigned char *)-[NSString length](v9, "length") - (unsigned char *)[v11 length]);
  }
  id v6 = [(NSString *)v9 stringByAppendingString:@"_"];
  if (![(NSString *)v4 hasPrefix:v6])
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDescriptor.m", 289, @"Class didn't have the correct parent name prefix? (%@ - %@)", v6, v4 object file lineNumber description];
    return 0;
  }
LABEL_8:
  long long v12 = [(NSString *)v4 substringFromIndex:[(NSString *)v6 length]];
  id v13 = objc_getAssociatedObject(self, &unk_10033F527);
  if (!v13) {
    goto LABEL_11;
  }
  long long v14 = v13;
  if (![(NSString *)v12 hasSuffix:v13])
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDescriptor.m", 303, @"Message class didn't have correct suffix? (%@ - %@)", v12, v14 object file lineNumber description];
    return 0;
  }
  long long v12 = -[NSString substringToIndex:](v12, "substringToIndex:", (unsigned char *)-[NSString length](v12, "length") - (unsigned char *)[v14 length]);
LABEL_11:
  if (v8) {
    uint64_t v15 = [(GPBDescriptor *)v8 fullName];
  }
  else {
    uint64_t v15 = [(GPBFileDescriptor *)v5 package];
  }
  id v17 = v15;
  if (![(NSString *)v15 length]) {
    return v12;
  }
  return +[NSString stringWithFormat:@"%@.%@", v17, v12];
}

- (id)fieldWithNumber:(unsigned int)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  fields = self->fields_;
  id result = [(NSArray *)fields countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        id result = [(NSArray *)fields countByEnumeratingWithState:&v9 objects:v13 count:16];
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
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  fields = self->fields_;
  id v5 = [(NSArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(fields);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "name"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)oneofWithName:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  oneofs = self->oneofs_;
  id v5 = [(NSArray *)oneofs countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(oneofs);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "name"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)oneofs countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (Class)messageClass
{
  return self->messageClass_;
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

- (GPBFileDescriptor)file
{
  return self->file_;
}

- (BOOL)isWireFormat
{
  return self->wireFormat_;
}

@end