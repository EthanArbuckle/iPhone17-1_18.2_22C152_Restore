@interface TransparencyGPBDescriptor
+ (id)allocDescriptorForClass:(Class)a3 file:(id)a4 fields:(void *)a5 fieldCount:(unsigned int)a6 storageSize:(unsigned int)a7 flags:(unsigned int)a8;
+ (id)allocDescriptorForClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9;
+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9;
- (BOOL)isWireFormat;
- (Class)messageClass;
- (NSArray)fields;
- (NSArray)oneofs;
- (NSString)fullName;
- (NSString)name;
- (TransparencyGPBDescriptor)containingType;
- (TransparencyGPBDescriptor)initWithClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(id)a6 storageSize:(unsigned int)a7 wireFormat:(BOOL)a8;
- (TransparencyGPBFileDescriptor)file;
- (const)extensionRanges;
- (id)fieldWithName:(id)a3;
- (id)fieldWithNumber:(unsigned int)a3;
- (id)oneofWithName:(id)a3;
- (unsigned)extensionRangesCount;
- (void)dealloc;
- (void)setupContainingMessageClass:(Class)a3;
- (void)setupContainingMessageClassName:(const char *)a3;
- (void)setupExtensionRanges:(const TransparencyGPBExtensionRange *)a3 count:(int)a4;
- (void)setupExtraTextInfo:(const char *)a3;
- (void)setupMessageClassNameSuffix:(id)a3;
- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5;
@end

@implementation TransparencyGPBDescriptor

+ (id)allocDescriptorForClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a8;
  if (a9 >= 0x20) {
    sub_1000F71D4();
  }
  if (a7)
  {
    id v25 = a4;
    unsigned int v26 = v9;
    uint64_t v16 = a7;
    id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a7];
    unsigned int v18 = 0;
    v19 = (unsigned __int16 *)a6;
    do
    {
      v20 = v19 + 18;
      if (a9)
      {
        v21 = v19;
      }
      else
      {
        v20 = (unsigned __int16 *)((char *)a6 + 28);
        v21 = a6;
      }
      v18 |= *v20;
      v22 = [[TransparencyGPBFieldDescriptor alloc] initWithFieldDescription:v21 descriptorFlags:a9];
      [v17 addObject:v22];

      v19 += 20;
      a6 = (char *)a6 + 32;
      --v16;
    }
    while (v16);
    a4 = v25;
    if (v18 >= 0x2000) {
      sub_1000F71D4();
    }
    uint64_t v9 = v26;
  }
  else
  {
    id v17 = 0;
  }
  id v23 = [objc_alloc((Class)a1) initWithClass:a3 messageName:a4 fileDescription:a5 fields:v17 storageSize:v9 wireFormat:(a9 >> 1) & 1];

  return v23;
}

+ (id)allocDescriptorForClass:(Class)a3 file:(id)a4 fields:(void *)a5 fieldCount:(unsigned int)a6 storageSize:(unsigned int)a7 flags:(unsigned int)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  id v12 = a4;
  if ((~a8 & 0x1C) != 0)
  {
    id v25 = a1;
    unsigned int v26 = a3;
    unsigned int v13 = [a4 syntax];
    if (v10)
    {
      unsigned int v14 = v13;
      BOOL v16 = (a8 & 8) == 0 && v13 == 3;
      uint64_t v17 = v10;
      unsigned int v18 = (char *)a5 + 8;
      v19 = (char *)a5;
      do
      {
        if (a8) {
          v20 = v18;
        }
        else {
          v20 = v19;
        }
        if ((a8 & 4) == 0 && v20[30] - 15 <= 1) {
          *((void *)v20 + 1) = objc_getClass(*((const char **)v20 + 1));
        }
        if (v16
          && (*((_WORD *)v20 + 14) & 0xF02) == 0
          && (*((_DWORD *)v20 + 5) & 0x80000000) == 0
          && v20[30] - 17 <= 0xFFFFFFFD)
        {
          *((_WORD *)v20 + 14) |= 0x20u;
        }
        if ((a8 & 0x10) == 0 && v20[30] == 17 && v14 != 3) {
          *((_WORD *)v20 + 14) |= 0x1000u;
        }
        v18 += 40;
        v19 += 32;
        --v17;
      }
      while (v17);
    }
    a8 |= 0x1Cu;
    id v12 = a4;
    uint64_t v9 = a7;
    a1 = v25;
    a3 = v26;
  }
  LODWORD(v24) = a8;
  id v22 = [a1 allocDescriptorForClass:a3 messageName:0 fileDescription:0 fields:a5 fieldCount:v10 storageSize:v9 flags:v24];
  objc_setAssociatedObject(v22, &unk_10010E51C, v12, (void *)1);
  return v22;
}

+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  return _[a1 allocDescriptorForClass:a3 file:a5 fields:a6 fieldCount:*(void *)&a7 storageSize:*(void *)&a8 flags:a9];
}

- (TransparencyGPBDescriptor)initWithClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(id)a6 storageSize:(unsigned int)a7 wireFormat:(BOOL)a8
{
  v17.receiver = self;
  v17.super_class = (Class)TransparencyGPBDescriptor;
  unsigned int v14 = [(TransparencyGPBDescriptor *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->messageClass_ = a3;
    v14->messageName_ = (NSString *)[a4 copy];
    v15->fileDescription_ = a5;
    v15->fields_ = (NSArray *)a6;
    v15->storageSize_ = a7;
    v15->wireFormat_ = a8;
  }
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBDescriptor;
  [(TransparencyGPBDescriptor *)&v3 dealloc];
}

- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5
{
  uint64_t v7 = a4;
  v8 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a4];
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = a3[v9];
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
          BOOL v16 = 0;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(fields);
            }
            if (*(_DWORD *)(*(void *)(*(void *)(*((void *)&v20 + 1) + 8 * (void)v16) + 8) + 20) == a5) {
              [v12 addObject:];
            }
            BOOL v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [(NSArray *)fields countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
      objc_super v17 = [[TransparencyGPBOneofDescriptor alloc] initWithName:v10 fields:v12];
      [(NSArray *)v8 addObject:v17];

      ++v9;
      --a5;
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
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
          if ((*(_WORD *)(v10[1] + 28) & 0x40) != 0) {
            objc_setAssociatedObject(v10, &unk_10010E51D, v4, (void *)1);
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

- (void)setupExtensionRanges:(const TransparencyGPBExtensionRange *)a3 count:(int)a4
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

  [(TransparencyGPBDescriptor *)self setupContainingMessageClass:Class];
}

- (void)setupMessageClassNameSuffix:(id)a3
{
  if ([a3 length])
  {
    objc_setAssociatedObject(self, &unk_10010E51F, a3, (void *)1);
  }
}

- (NSString)name
{
  return NSStringFromClass(self->messageClass_);
}

- (TransparencyGPBFileDescriptor)file
{
  objc_sync_enter(self);
  AssociatedObject = (TransparencyGPBFileDescriptor *)objc_getAssociatedObject(self, &unk_10010E51C);
  if (!AssociatedObject)
  {
    fileDescription = self->fileDescription_;
    if (fileDescription->var0)
    {
      CFStringRef v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
      fileDescription = self->fileDescription_;
    }
    else
    {
      CFStringRef v5 = &stru_10013DAE0;
    }
    if (fileDescription->var1) {
      id v6 = [[TransparencyGPBFileDescriptor alloc] initWithPackage:v5 objcPrefix:+[NSString stringWithUTF8String:self->fileDescription_->var1] syntax:self->fileDescription_->var2];
    }
    else {
      id v6 = [[TransparencyGPBFileDescriptor alloc] initWithPackage:v5 syntax:self->fileDescription_->var2];
    }
    AssociatedObject = v6;
    objc_setAssociatedObject(v6, &unk_10010E51C, v6, (void *)1);
  }
  objc_sync_exit(self);
  return AssociatedObject;
}

- (TransparencyGPBDescriptor)containingType
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_10010E51E);

  return (TransparencyGPBDescriptor *)[AssociatedObject descriptor];
}

- (NSString)fullName
{
  objc_super v3 = [(TransparencyGPBDescriptor *)self containingType];
  v4 = v3;
  messageName = self->messageName_;
  if (messageName)
  {
    if (v3) {
      return +[NSString stringWithFormat:@"%@.%@", [(TransparencyGPBDescriptor *)v3 fullName], self->messageName_];
    }
    if (self->fileDescription_->var0) {
      return +[NSString stringWithFormat:@"%s.%@", self->fileDescription_->var0, messageName];
    }
    return messageName;
  }
  id v7 = NSStringFromClass([(TransparencyGPBDescriptor *)self messageClass]);
  uint64_t v8 = [(TransparencyGPBDescriptor *)self file];
  uint64_t v9 = [(TransparencyGPBFileDescriptor *)v8 objcPrefix];
  if (v9 && ![(NSString *)v7 hasPrefix:v9]) {
    return 0;
  }
  if (v4)
  {
    uint64_t v10 = NSStringFromClass([(TransparencyGPBDescriptor *)v4 messageClass]);
    id AssociatedObject = objc_getAssociatedObject(v4, &unk_10010E51F);
    if (AssociatedObject)
    {
      long long v12 = AssociatedObject;
      if (![(NSString *)v10 hasSuffix:AssociatedObject]) {
        return 0;
      }
      uint64_t v10 = -[NSString substringToIndex:](v10, "substringToIndex:", (unsigned char *)-[NSString length](v10, "length") - (unsigned char *)[v12 length]);
    }
    uint64_t v9 = [(NSString *)v10 stringByAppendingString:@"_"];
    if (![(NSString *)v7 hasPrefix:v9]) {
      return 0;
    }
  }
  messageName = [(NSString *)v7 substringFromIndex:[(NSString *)v9 length]];
  id v13 = objc_getAssociatedObject(self, &unk_10010E51F);
  if (!v13) {
    goto LABEL_14;
  }
  long long v14 = v13;
  if (![(NSString *)messageName hasSuffix:v13]) {
    return 0;
  }
  messageName = -[NSString substringToIndex:](messageName, "substringToIndex:", (unsigned char *)-[NSString length](messageName, "length") - (unsigned char *)[v14 length]);
LABEL_14:
  if (v4) {
    uint64_t v15 = [(TransparencyGPBDescriptor *)v4 fullName];
  }
  else {
    uint64_t v15 = [(TransparencyGPBFileDescriptor *)v8 package];
  }
  BOOL v16 = v15;
  if ([(NSString *)v15 length]) {
    return +[NSString stringWithFormat:@"%@.%@", v16, messageName];
  }
  return messageName;
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

- (BOOL)isWireFormat
{
  return self->wireFormat_;
}

@end