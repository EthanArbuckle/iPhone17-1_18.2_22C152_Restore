@interface POXMLXPathResult
- (NSArray)nodes;
- (POXMLXPathContext)xpathContext;
- (POXMLXPathResult)init;
- (_xmlXPathObject)xpathObj;
- (int)nodeCount;
- (void)dealloc;
- (void)nodes;
- (void)setXpathContext:(id)a3;
- (void)setXpathObj:(_xmlXPathObject *)a3;
@end

@implementation POXMLXPathResult

- (POXMLXPathResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)POXMLXPathResult;
  result = [(POXMLXPathResult *)&v3 init];
  if (result) {
    result->_xpathObj = 0;
  }
  return result;
}

- (void)dealloc
{
  if ([(POXMLXPathResult *)self xpathObj]) {
    xmlXPathFreeObject([(POXMLXPathResult *)self xpathObj]);
  }
  [(POXMLXPathResult *)self setXpathObj:0];
  v3.receiver = self;
  v3.super_class = (Class)POXMLXPathResult;
  [(POXMLXPathResult *)&v3 dealloc];
}

- (int)nodeCount
{
  v2 = (int *)[(POXMLXPathResult *)self xpathObj][8];
  if (v2) {
    return *v2;
  }
  else {
    return 0;
  }
}

- (NSArray)nodes
{
  if ([(POXMLXPathResult *)self xpathObj]
    && (void)[(POXMLXPathResult *)self xpathObj][8]
    && *(_DWORD *)[(POXMLXPathResult *)self xpathObj][8]
    && *(void *)((void)[(POXMLXPathResult *)self xpathObj][8] + 8))
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    v4 = (unsigned int *)[(POXMLXPathResult *)self xpathObj][8];
    if (v4)
    {
      uint64_t v5 = *v4;
      if ((int)v5 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = 8 * v5;
        do
        {
          uint64_t v8 = *(void *)(*((void *)v4 + 1) + v6);
          if (!v8) {
            -[POXMLXPathResult nodes]();
          }
          if (*(_DWORD *)(v8 + 8) == 1)
          {
            v9 = objc_alloc_init(POXMLNode);
            [(POXMLNode *)v9 setNode:v8];
            [(POXMLNode *)v9 setXpathResultSet:self];
            [v3 addObject:v9];
          }
          v6 += 8;
        }
        while (v7 != v6);
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSArray *)v3;
}

- (_xmlXPathObject)xpathObj
{
  return self->_xpathObj;
}

- (void)setXpathObj:(_xmlXPathObject *)a3
{
  self->_xpathObj = a3;
}

- (POXMLXPathContext)xpathContext
{
  return self->_xpathContext;
}

- (void)setXpathContext:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)nodes
{
}

@end