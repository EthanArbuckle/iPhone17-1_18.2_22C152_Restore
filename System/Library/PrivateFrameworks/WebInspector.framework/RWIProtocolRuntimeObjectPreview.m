@interface RWIProtocolRuntimeObjectPreview
- (BOOL)lossless;
- (BOOL)overflow;
- (NSArray)entries;
- (NSArray)properties;
- (NSString)stringRepresentation;
- (RWIProtocolRuntimeObjectPreview)initWithType:(int64_t)a3 lossless:(BOOL)a4;
- (int)size;
- (int64_t)subtype;
- (int64_t)type;
- (void)setEntries:(id)a3;
- (void)setLossless:(BOOL)a3;
- (void)setOverflow:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setSize:(int)a3;
- (void)setStringRepresentation:(id)a3;
- (void)setSubtype:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation RWIProtocolRuntimeObjectPreview

- (RWIProtocolRuntimeObjectPreview)initWithType:(int64_t)a3 lossless:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  v6 = [(RWIProtocolJSONObject *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(RWIProtocolRuntimeObjectPreview *)v6 setType:a3];
    [(RWIProtocolRuntimeObjectPreview *)v7 setLossless:v4];
    v8 = v7;
  }

  return v7;
}

- (void)setType:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    BOOL v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    BOOL v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"type"];

  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
}

- (int64_t)type
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"type"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 24; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolRuntimeObjectPreviewType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolRuntimeObjectPreviewType>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 24);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolRuntimeObjectPreviewType>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setSubtype:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    unint64_t v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    unint64_t v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"subtype"];

  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
}

- (int64_t)subtype
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"subtype"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 42; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolRuntimeObjectPreviewSubtype>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolRuntimeObjectPreviewSubtype>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 42);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolRuntimeObjectPreviewSubtype>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setStringRepresentation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"description"];
}

- (NSString)stringRepresentation
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"description"];
  return (NSString *)v2;
}

- (void)setLossless:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"lossless"];
}

- (BOOL)lossless
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"lossless"];
}

- (void)setOverflow:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"overflow"];
}

- (BOOL)overflow
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"overflow"];
}

- (void)setProperties:(id)a3
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
          objc_super v9 = (void *)MEMORY[0x263EFF940];
          uint64_t v10 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"properties"];
  v12 = v15;
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

- (NSArray)properties
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"properties"];
  id v2 = Inspector::toObjCArray<RWIProtocolRuntimePropertyPreview>(&v6);
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

- (void)setEntries:(id)a3
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
          objc_super v9 = (void *)MEMORY[0x263EFF940];
          uint64_t v10 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"entries"];
  v12 = v15;
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

- (NSArray)entries
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"entries"];
  id v2 = Inspector::toObjCArray<RWIProtocolRuntimeEntryPreview>(&v6);
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

- (void)setSize:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"size"];
}

- (int)size
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeObjectPreview;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"size"];
}

@end