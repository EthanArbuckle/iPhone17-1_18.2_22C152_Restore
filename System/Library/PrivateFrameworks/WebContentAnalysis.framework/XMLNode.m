@interface XMLNode
+ (id)getJavascriptFromNode:(_xmlNode *)a3;
+ (id)stringValueForAttribute:(id)a3 inNode:(_xmlNode *)a4;
- (XMLNode)initWithNode:(_xmlNode *)a3;
- (_xmlNode)xmlNode;
- (id)_stringValueFromAttribute:(id)a3;
- (int64_t)_intValueFromAttribute:(id)a3;
- (void)dealloc;
- (void)setXmlNode:(_xmlNode *)a3;
@end

@implementation XMLNode

- (XMLNode)initWithNode:(_xmlNode *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)XMLNode;
  v4 = [(XMLNode *)&v7 init];
  v5 = v4;
  if (v4) {
    [(XMLNode *)v4 setXmlNode:a3];
  }
  return v5;
}

- (void)setXmlNode:(_xmlNode *)a3
{
  self->_xmlNode = a3;
}

- (_xmlNode)xmlNode
{
  return self->_xmlNode;
}

- (id)_stringValueFromAttribute:(id)a3
{
  return +[XMLNode stringValueForAttribute:a3 inNode:self->_xmlNode];
}

- (int64_t)_intValueFromAttribute:(id)a3
{
  v4 = (const char *)[a3 UTF8String];
  int64_t v5 = kWFImgDimensionUnknown;
  if ((void)[(XMLNode *)self xmlNode][88])
  {
    for (uint64_t i = (uint64_t)[(XMLNode *)self xmlNode][88]; i; uint64_t i = *(void *)(i + 48))
    {
      if (!strcmp(*(const char **)(i + 16), v4))
      {
        for (uint64_t j = *(void *)(i + 24); j; uint64_t j = *(void *)(j + 48))
        {
          if (!strcmp(*(const char **)(j + 16), "text")) {
            int64_t v5 = atoi(*(const char **)(j + 80));
          }
        }
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)XMLNode;
  [(XMLNode *)&v2 dealloc];
}

+ (id)stringValueForAttribute:(id)a3 inNode:(_xmlNode *)a4
{
  uint64_t v5 = [a3 UTF8String];
  properties = a4->properties;
  if (properties)
  {
    objc_super v7 = (const char *)v5;
    do
    {
      if (!strcmp((const char *)properties->name, v7))
      {
        children = properties->children;
        if (children)
        {
          while (strcmp((const char *)children->name, "text"))
          {
            children = children->next;
            if (!children) {
              goto LABEL_4;
            }
          }
          [NSString stringWithCString:children->content encoding:4];
        }
      }
LABEL_4:
      properties = properties->next;
    }
    while (properties);
  }
  return 0;
}

+ (id)getJavascriptFromNode:(_xmlNode *)a3
{
  children = a3->children;
  if (children) {
    return (id)[NSString stringWithCString:children->content encoding:4];
  }
  else {
    return 0;
  }
}

@end