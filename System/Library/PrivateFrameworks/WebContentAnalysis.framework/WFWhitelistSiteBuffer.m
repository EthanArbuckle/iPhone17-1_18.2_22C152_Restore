@interface WFWhitelistSiteBuffer
- (BOOL)containsURLString:(id)a3;
- (BOOL)treeContainsURLString:(id)a3;
- (NSMutableDictionary)siteTree;
- (WCRURLList)urlList;
- (WFWhitelistSiteBuffer)init;
- (unint64_t)maxSize;
- (void)addURLString:(id)a3;
- (void)dealloc;
- (void)setMaxSize:(unint64_t)a3;
- (void)setSiteTree:(id)a3;
- (void)setUrlList:(id)a3;
@end

@implementation WFWhitelistSiteBuffer

- (WFWhitelistSiteBuffer)init
{
  v5.receiver = self;
  v5.super_class = (Class)WFWhitelistSiteBuffer;
  v2 = [(WFWhitelistSiteBuffer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_maxSize = 100000;
    v2->_siteTree = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3->_urlList = (WCRURLList *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  siteTree = self->_siteTree;
  if (siteTree) {

  }
  urlList = self->_urlList;
  if (urlList) {

  }
  v5.receiver = self;
  v5.super_class = (Class)WFWhitelistSiteBuffer;
  [(WFWhitelistSiteBuffer *)&v5 dealloc];
}

- (void)addURLString:(id)a3
{
  v4 = [(WFWhitelistSiteBuffer *)self urlList];
  [(WCRURLList *)v4 addURLString:a3];
}

- (BOOL)treeContainsURLString:(id)a3
{
  v4 = objc_msgSend(a3, "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4);
  objc_super v5 = objc_msgSend(NSURL, "URLWithString:", objc_msgSend(v4, "lowercaseString"));
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", objc_msgSend((id)objc_msgSend(v5, "host"), "componentsSeparatedByString:", @"."));
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v5, "pathComponents"), "count") >= 2) {
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v5, "pathComponents"));
  }
  if ([v5 query]) {
    objc_msgSend(v6, "addObject:", objc_msgSend(v5, "query"));
  }
  if ([v5 fragment]) {
    objc_msgSend(v6, "addObject:", objc_msgSend(v5, "fragment"));
  }
  v7 = [(WFWhitelistSiteBuffer *)self siteTree];
  uint64_t v8 = [v6 count] - 1;
  if (v8 < 0) {
    return 0;
  }
  while (1)
  {
    v9 = (NSMutableDictionary *)-[NSMutableDictionary objectForKey:](v7, "objectForKey:", [v6 objectAtIndex:v8]);
    if (!v9) {
      goto LABEL_17;
    }
    v10 = v9;
    if (!v8
      && [(NSMutableDictionary *)v9 count] == 1
      && (objc_msgSend((id)-[NSMutableDictionary objectForKey:](v10, "objectForKey:", @"kWFEndpointKey"), "BOOLValue") & 1) != 0)
    {
      return 1;
    }
    if ([(NSMutableDictionary *)v10 count] == 1
      && (char v11 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v10, "objectForKey:", @"kWFEndpointKey"), "BOOLValue"), v8))
    {
      v7 = v10;
      if (v11) {
        return 1;
      }
    }
    else
    {
      v7 = v10;
    }
LABEL_17:
    if (v8-- <= 0) {
      return 0;
    }
  }
}

- (BOOL)containsURLString:(id)a3
{
  v4 = [(WFWhitelistSiteBuffer *)self urlList];
  return [(WCRURLList *)v4 containsURLString:a3];
}

- (NSMutableDictionary)siteTree
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSiteTree:(id)a3
{
}

- (WCRURLList)urlList
{
  return (WCRURLList *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlList:(id)a3
{
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(unint64_t)a3
{
  self->_maxSize = a3;
}

@end