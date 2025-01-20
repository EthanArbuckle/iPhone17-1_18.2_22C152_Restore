@interface RWIProtocolDOMNode
- (NSArray)attributes;
- (NSArray)children;
- (NSArray)layoutFlags;
- (NSArray)pseudoElements;
- (NSArray)shadowRoots;
- (NSString)baseURL;
- (NSString)contentSecurityPolicyHash;
- (NSString)documentURL;
- (NSString)frameId;
- (NSString)localName;
- (NSString)name;
- (NSString)nodeName;
- (NSString)nodeValue;
- (NSString)publicId;
- (NSString)systemId;
- (NSString)value;
- (NSString)xmlVersion;
- (RWIProtocolDOMNode)contentDocument;
- (RWIProtocolDOMNode)initWithNodeId:(int)a3 nodeType:(int)a4 nodeName:(id)a5 localName:(id)a6 nodeValue:(id)a7;
- (RWIProtocolDOMNode)templateContent;
- (int)childNodeCount;
- (int)nodeId;
- (int)nodeType;
- (int64_t)customElementState;
- (int64_t)pseudoType;
- (int64_t)shadowRootType;
- (void)setAttributes:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setChildNodeCount:(int)a3;
- (void)setChildren:(id)a3;
- (void)setContentDocument:(id)a3;
- (void)setContentSecurityPolicyHash:(id)a3;
- (void)setCustomElementState:(int64_t)a3;
- (void)setDocumentURL:(id)a3;
- (void)setFrameId:(id)a3;
- (void)setLayoutFlags:(id)a3;
- (void)setLocalName:(id)a3;
- (void)setName:(id)a3;
- (void)setNodeId:(int)a3;
- (void)setNodeName:(id)a3;
- (void)setNodeType:(int)a3;
- (void)setNodeValue:(id)a3;
- (void)setPseudoElements:(id)a3;
- (void)setPseudoType:(int64_t)a3;
- (void)setPublicId:(id)a3;
- (void)setShadowRootType:(int64_t)a3;
- (void)setShadowRoots:(id)a3;
- (void)setSystemId:(id)a3;
- (void)setTemplateContent:(id)a3;
- (void)setValue:(id)a3;
- (void)setXmlVersion:(id)a3;
@end

@implementation RWIProtocolDOMNode

- (RWIProtocolDOMNode)initWithNodeId:(int)a3 nodeType:(int)a4 nodeName:(id)a5 localName:(id)a6 nodeValue:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)RWIProtocolDOMNode;
  v15 = [(RWIProtocolJSONObject *)&v18 init];
  if (v15)
  {
    if (!v12) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"nodeName" format];
    }
    if (!v13) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"localName" format];
    }
    if (!v14) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"nodeValue" format];
    }
    [(RWIProtocolDOMNode *)v15 setNodeId:v10];
    [(RWIProtocolDOMNode *)v15 setNodeType:v9];
    [(RWIProtocolDOMNode *)v15 setNodeName:v12];
    [(RWIProtocolDOMNode *)v15 setLocalName:v13];
    [(RWIProtocolDOMNode *)v15 setNodeValue:v14];
    v16 = v15;
  }

  return v15;
}

- (void)setNodeId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"nodeId"];
}

- (int)nodeId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"nodeId"];
}

- (void)setNodeType:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"nodeType"];
}

- (int)nodeType
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"nodeType"];
}

- (void)setNodeName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"nodeName"];
}

- (NSString)nodeName
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"nodeName"];
  return (NSString *)v2;
}

- (void)setLocalName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"localName"];
}

- (NSString)localName
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"localName"];
  return (NSString *)v2;
}

- (void)setNodeValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"nodeValue"];
}

- (NSString)nodeValue
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"nodeValue"];
  return (NSString *)v2;
}

- (void)setFrameId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"frameId"];
}

- (NSString)frameId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"frameId"];
  return (NSString *)v2;
}

- (void)setChildNodeCount:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"childNodeCount"];
}

- (int)childNodeCount
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"childNodeCount"];
}

- (void)setChildren:(id)a3
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
  v14.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"children"];
  id v12 = v15;
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

- (NSArray)children
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"children"];
  v2 = Inspector::toObjCArray<RWIProtocolDOMNode>(&v6);
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

- (void)setAttributes:(id)a3
{
  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"attributes"];
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)attributes
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"attributes"];
  v2 = Inspector::toObjCStringArray(&v6);
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

- (void)setDocumentURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"documentURL"];
}

- (NSString)documentURL
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"documentURL"];
  return (NSString *)v2;
}

- (void)setBaseURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"baseURL"];
}

- (NSString)baseURL
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"baseURL"];
  return (NSString *)v2;
}

- (void)setPublicId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"publicId"];
}

- (NSString)publicId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"publicId"];
  return (NSString *)v2;
}

- (void)setSystemId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"systemId"];
}

- (NSString)systemId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"systemId"];
  return (NSString *)v2;
}

- (void)setXmlVersion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"xmlVersion"];
}

- (NSString)xmlVersion
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"xmlVersion"];
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"value"];
}

- (NSString)value
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"value"];
  return (NSString *)v2;
}

- (void)setPseudoType:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  objc_super v4 = v7;
  if (v7) {
    objc_super v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"pseudoType"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)pseudoType
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMNode;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"pseudoType"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 6; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMPseudoType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMPseudoType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 6);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDOMPseudoType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setShadowRootType:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  unint64_t v4 = v7;
  if (v7) {
    objc_super v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"shadowRootType"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)shadowRootType
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMNode;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"shadowRootType"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMShadowRootType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMShadowRootType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 9);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDOMShadowRootType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setCustomElementState:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  unint64_t v4 = v7;
  if (v7) {
    objc_super v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"customElementState"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)customElementState
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMNode;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"customElementState"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 12; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMCustomElementState>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMCustomElementState>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 12);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDOMCustomElementState>(WTF::String const&)::mappings)[i + 2];
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

- (void)setContentDocument:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"contentDocument"];
}

- (RWIProtocolDOMNode)contentDocument
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMNode;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"contentDocument"];
  if (v3)
  {
    unint64_t v4 = [RWIProtocolDOMNode alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMNode;
    objc_super v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"contentDocument"];
    [v5 toJSONObject];
    objc_super v6 = v12;
    ++*v12;
    id v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    uint64_t v8 = v13;
    id v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    objc_super v9 = v12;
    id v12 = 0;
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
    v7 = 0;
  }

  return v7;
}

- (void)setShadowRoots:(id)a3
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
  v14.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"shadowRoots"];
  id v12 = v15;
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

- (NSArray)shadowRoots
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"shadowRoots"];
  id v2 = Inspector::toObjCArray<RWIProtocolDOMNode>(&v6);
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

- (void)setTemplateContent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"templateContent"];
}

- (RWIProtocolDOMNode)templateContent
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMNode;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"templateContent"];
  if (v3)
  {
    uint64_t v4 = [RWIProtocolDOMNode alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMNode;
    objc_super v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"templateContent"];
    [v5 toJSONObject];
    uint64_t v6 = v12;
    ++*v12;
    id v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    uint64_t v8 = v13;
    id v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    objc_super v9 = v12;
    id v12 = 0;
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
    v7 = 0;
  }

  return v7;
}

- (void)setPseudoElements:(id)a3
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
  v14.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"pseudoElements"];
  id v12 = v15;
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

- (NSArray)pseudoElements
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"pseudoElements"];
  id v2 = Inspector::toObjCArray<RWIProtocolDOMNode>(&v6);
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

- (void)setContentSecurityPolicyHash:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"contentSecurityPolicyHash"];
}

- (NSString)contentSecurityPolicyHash
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMNode;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"contentSecurityPolicyHash"];
  return (NSString *)v2;
}

- (void)setLayoutFlags:(id)a3
{
  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"layoutFlags"];
  objc_super v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)layoutFlags
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMNode;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"layoutFlags"];
  id v2 = Inspector::toObjCStringArray(&v6);
  objc_super v3 = v6;
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