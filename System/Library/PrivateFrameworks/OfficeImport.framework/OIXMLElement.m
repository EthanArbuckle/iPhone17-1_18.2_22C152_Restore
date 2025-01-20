@interface OIXMLElement
+ (OIXMLElement)elementWithType:(unsigned __int8)a3;
+ (OIXMLElement)elementWithType:(unsigned __int8)a3 stringValue:(id)a4;
- (BOOL)isEmptyHTMLElement;
- (OIXMLElement)initWithType:(unsigned __int8)a3;
- (OIXMLElement)initWithType:(unsigned __int8)a3 stringValue:(id)a4;
- (id)closingTagString;
- (id)contentString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (id)openingTagString;
- (id)stringValue;
- (int64_t)attributeCount;
- (int64_t)childrenCount;
- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4;
- (void)addAttribute:(id)a3;
- (void)addChild:(id)a3;
- (void)insertChild:(id)a3 atIndex:(unint64_t)a4;
- (void)setStringValue:(id)a3;
@end

@implementation OIXMLElement

- (void)addAttribute:(id)a3
{
  id v5 = a3;
  p_id attributes = &self->_attributes;
  id attributes = self->_attributes;
  id v13 = v5;
  if (!attributes)
  {
    objc_storeStrong(&self->_attributes, a3);
    goto LABEL_5;
  }
  if (self->_hasMultipleAttributes)
  {
    [attributes addObject:v5];
LABEL_5:
    v8 = v13;
    goto LABEL_7;
  }
  v9 = (objc_class *)MEMORY[0x263EFF980];
  id v10 = attributes;
  uint64_t v11 = objc_msgSend([v9 alloc], "initWithObjects:", v10, 0);
  id v12 = *p_attributes;
  id *p_attributes = (id)v11;

  [*p_attributes addObject:v13];
  v8 = v13;
  self->_hasMultipleAttributes = 1;
LABEL_7:
}

- (void)addChild:(id)a3
{
  id v5 = a3;
  p_id children = &self->_children;
  id children = self->_children;
  id v13 = v5;
  if (!children)
  {
    objc_storeStrong(&self->_children, a3);
    goto LABEL_5;
  }
  if (self->_hasMultipleChildren)
  {
    [children addObject:v5];
LABEL_5:
    v8 = v13;
    goto LABEL_7;
  }
  v9 = (objc_class *)MEMORY[0x263EFF980];
  id v10 = children;
  uint64_t v11 = objc_msgSend([v9 alloc], "initWithObjects:", v10, 0);
  id v12 = *p_children;
  id *p_children = (id)v11;

  [*p_children addObject:v13];
  v8 = v13;
  self->_hasMultipleChildren = 1;
LABEL_7:
}

- (id)openingTagString
{
  v3 = [MEMORY[0x263F089D8] string];
  UniChar chars = 60;
  CFStringAppendCharacters(v3, &chars, 1);
  v4 = [(OIXMLElement *)self name];
  CFStringAppend(v3, v4);

  if ([(OIXMLElement *)self attributeCount] == 1)
  {
    CFStringAppend(v3, @" ");
    [self->_attributes _appendXMLStringToString:v3 level:0];
  }
  else
  {
    uint64_t v5 = [self->_attributes count];
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        v8 = [self->_attributes objectAtIndex:i];
        CFStringAppend(v3, @" ");
        [v8 _appendXMLStringToString:v3 level:0];
      }
    }
  }
  UniChar v10 = 62;
  CFStringAppendCharacters(v3, &v10, 1);
  return v3;
}

- (int64_t)attributeCount
{
  int64_t result = (int64_t)self->_attributes;
  if (result)
  {
    if (self->_hasMultipleAttributes) {
      return [(id)result count];
    }
    else {
      return 1;
    }
  }
  return result;
}

- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4
{
  v7 = [(OIXMLElement *)self name];
  if (v7)
  {
    UniChar chars = 60;
    CFStringAppendCharacters(a3, &chars, 1);
    CFStringAppend(a3, v7);
    if ([(OIXMLElement *)self attributeCount] == 1)
    {
      CFStringAppend(a3, @" ");
      [self->_attributes _appendXMLStringToString:a3 level:(a4 + 1)];
    }
    else
    {
      uint64_t v8 = [self->_attributes count];
      if (v8 >= 1)
      {
        uint64_t v9 = v8;
        UniChar v10 = 0;
        for (uint64_t i = 0; i != v9; ++i)
        {
          id v12 = [self->_attributes objectAtIndex:i];

          CFStringAppend(a3, @" ");
          [v12 _appendXMLStringToString:a3 level:(a4 + 1)];
          UniChar v10 = v12;
        }
LABEL_9:
        uint64_t v13 = [(OIXMLElement *)self childrenCount];
        UniChar v19 = 62;
        CFStringAppendCharacters(a3, &v19, 1);
        if (v13 == 1)
        {
          [self->_children _appendXMLStringToString:a3 level:(a4 + 1)];
        }
        else if (v13 < 1)
        {
          if ([(OIXMLElement *)self isEmptyHTMLElement])
          {
LABEL_17:

            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v15 = (a4 + 1);
          v16 = v12;
          do
          {
            id v12 = [self->_children objectAtIndex:v14];

            [v12 _appendXMLStringToString:a3 level:v15];
            ++v14;
            v16 = v12;
          }
          while (v13 != v14);
        }
        *(_DWORD *)v18 = 3080252;
        CFStringAppendCharacters(a3, v18, 2);
        CFStringAppend(a3, v7);
        UniChar v17 = 62;
        CFStringAppendCharacters(a3, &v17, 1);
        goto LABEL_17;
      }
    }
    id v12 = 0;
    goto LABEL_9;
  }
LABEL_18:
}

- (int64_t)childrenCount
{
  int64_t result = (int64_t)self->_children;
  if (result)
  {
    if (self->_hasMultipleChildren) {
      return [(id)result count];
    }
    else {
      return 1;
    }
  }
  return result;
}

- (id)closingTagString
{
  v2 = NSString;
  v3 = [(OIXMLElement *)self name];
  v4 = [v2 stringWithFormat:@"</%@>", v3];

  return v4;
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  p_id children = &self->_children;
  id children = self->_children;
  id v15 = v7;
  if (!children)
  {
    objc_storeStrong(&self->_children, a3);
    goto LABEL_5;
  }
  if (self->_hasMultipleChildren)
  {
    [children insertObject:v7 atIndex:a4];
LABEL_5:
    UniChar v10 = v15;
    goto LABEL_7;
  }
  uint64_t v11 = (objc_class *)MEMORY[0x263EFF980];
  id v12 = children;
  uint64_t v13 = objc_msgSend([v11 alloc], "initWithObjects:", v12, 0);
  id v14 = *p_children;
  id *p_children = (id)v13;

  [*p_children insertObject:v15 atIndex:a4];
  UniChar v10 = v15;
  self->_hasMultipleChildren = 1;
LABEL_7:
}

- (OIXMLElement)initWithType:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OIXMLElement;
  int64_t result = [(OIXMLElement *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (OIXMLElement)initWithType:(unsigned __int8)a3 stringValue:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [(OIXMLElement *)self initWithType:v4];
  uint64_t v8 = v7;
  if (v7) {
    [(OIXMLElement *)v7 setStringValue:v6];
  }

  return v8;
}

+ (OIXMLElement)elementWithType:(unsigned __int8)a3
{
  v3 = [[OIXMLElement alloc] initWithType:a3 stringValue:0];
  return v3;
}

+ (OIXMLElement)elementWithType:(unsigned __int8)a3 stringValue:(id)a4
{
  uint64_t v4 = a3;
  id v5 = a4;
  id v6 = [[OIXMLElement alloc] initWithType:v4 stringValue:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[OIXMLElement alloc] initWithType:self->_type];
  uint64_t v6 = [self->_attributes copyWithZone:a3];
  id attributes = v5->_attributes;
  v5->_id attributes = (id)v6;

  uint64_t v8 = [self->_children copyWithZone:a3];
  id children = v5->_children;
  v5->_id children = (id)v8;

  v5->_hasMultipleAttributes = self->_hasMultipleAttributes;
  v5->_hasMultipleChildren = self->_hasMultipleChildren;
  return v5;
}

- (id)name
{
  return name_names[self->_type];
}

- (BOOL)isEmptyHTMLElement
{
  return isEmptyHTMLElement_empty[self->_type];
}

- (void)setStringValue:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v4 = [[OIXMLTextNode alloc] initWithStringValue:v6];
    id children = self->_children;
    if (children)
    {
      self->_id children = 0;
    }
    [(OIXMLElement *)self addChild:v4];
  }
  else
  {
    uint64_t v4 = (OIXMLTextNode *)self->_children;
    self->_id children = 0;
  }
}

- (id)stringValue
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26EBF24D8];
  id children = self->_children;
  if (self->_hasMultipleChildren)
  {
    uint64_t v5 = [children count];
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [self->_children objectAtIndex:i];
        uint64_t v9 = [v8 stringValue];
        [v3 appendString:v9];
      }
    }
  }
  else if (children)
  {
    UniChar v10 = [children stringValue];
    [v3 appendString:v10];
  }
  return v3;
}

- (id)contentString
{
  v3 = [MEMORY[0x263F089D8] string];
  int64_t v4 = [(OIXMLElement *)self childrenCount];
  id children = self->_children;
  if (v4 == 1)
  {
    [children _appendXMLStringToString:v3 level:0];
  }
  else
  {
    uint64_t v6 = [children count];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [self->_children objectAtIndex:i];
        [v9 _appendXMLStringToString:v3 level:0];
      }
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_children, 0);
  objc_storeStrong(&self->_attributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end