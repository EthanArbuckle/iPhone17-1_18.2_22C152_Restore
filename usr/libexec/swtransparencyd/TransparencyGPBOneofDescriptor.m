@interface TransparencyGPBOneofDescriptor
- (NSArray)fields;
- (NSString)name;
- (TransparencyGPBOneofDescriptor)initWithName:(const char *)a3 fields:(id)a4;
- (id)fieldWithName:(id)a3;
- (id)fieldWithNumber:(unsigned int)a3;
- (void)dealloc;
@end

@implementation TransparencyGPBOneofDescriptor

- (TransparencyGPBOneofDescriptor)initWithName:(const char *)a3 fields:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)TransparencyGPBOneofDescriptor;
  v6 = [(TransparencyGPBOneofDescriptor *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->name_ = a3;
    v6->fields_ = (NSArray *)a4;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [a4 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(a4);
          }
          *(void *)(*(void *)(*((void *)&v15 + 1) + 8 * i) + 16) = v7;
        }
        id v9 = [a4 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
    SEL v12 = sub_1000CB728(0, (char *)a3, "OneOfCase", 0);
    if (v12) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    v7->caseSel_ = v13;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBOneofDescriptor;
  [(TransparencyGPBOneofDescriptor *)&v3 dealloc];
}

- (NSString)name
{
  return +[NSString stringWithUTF8String:self->name_];
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

- (NSArray)fields
{
  return self->fields_;
}

@end