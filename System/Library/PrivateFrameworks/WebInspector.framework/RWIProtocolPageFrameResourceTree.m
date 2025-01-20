@interface RWIProtocolPageFrameResourceTree
- (NSArray)childFrames;
- (NSArray)resources;
- (RWIProtocolPageFrame)frame;
- (RWIProtocolPageFrameResourceTree)initWithFrame:(id)a3 resources:(id)a4;
- (void)setChildFrames:(id)a3;
- (void)setFrame:(id)a3;
- (void)setResources:(id)a3;
@end

@implementation RWIProtocolPageFrameResourceTree

- (RWIProtocolPageFrameResourceTree)initWithFrame:(id)a3 resources:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RWIProtocolPageFrameResourceTree;
  v6 = [(RWIProtocolJSONObject *)&v25 init];
  if (v6)
  {
    if (!v19) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"frame" format];
    }
    if (!v20) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"resources" format];
    }
    v18 = v6;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v20;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = (void *)MEMORY[0x263EFF940];
            v14 = (objc_class *)objc_opt_class();
            v15 = NSStringFromClass(v14);
            [v13 raise:v10, @"array should contain objects of type '%@', found bad value: %@", v15, v12 format];
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    v6 = v18;
    [(RWIProtocolPageFrameResourceTree *)v18 setFrame:v19];
    [(RWIProtocolPageFrameResourceTree *)v18 setResources:v7];
    v16 = v18;
  }

  return v6;
}

- (void)setFrame:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResourceTree;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"frame"];
}

- (RWIProtocolPageFrame)frame
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolPageFrameResourceTree;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"frame"];
  if (v3)
  {
    v4 = [RWIProtocolPageFrame alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolPageFrameResourceTree;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"frame"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    id v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    uint64_t v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    if (v9)
    {
      if (*v9 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v9;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setChildFrames:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = (void *)MEMORY[0x263EFF940];
          uint64_t v10 = (objc_class *)objc_opt_class();
          objc_super v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolPageFrameResourceTree;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"childFrames"];
  uint64_t v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*v12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v12;
    }
  }
}

- (NSArray)childFrames
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolPageFrameResourceTree;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"childFrames"];
  v2 = Inspector::toObjCArray<RWIProtocolPageFrameResourceTree>(&v6);
  id v3 = v6;
  uint64_t v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- (void)setResources:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = (void *)MEMORY[0x263EFF940];
          uint64_t v10 = (objc_class *)objc_opt_class();
          objc_super v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolPageFrameResourceTree;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"resources"];
  uint64_t v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*v12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v12;
    }
  }
}

- (NSArray)resources
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolPageFrameResourceTree;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"resources"];
  v2 = Inspector::toObjCArray<RWIProtocolPageFrameResource>(&v6);
  id v3 = v6;
  uint64_t v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

@end