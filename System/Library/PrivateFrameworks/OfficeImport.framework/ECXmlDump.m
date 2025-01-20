@interface ECXmlDump
+ (_xmlNode)xmlNodeForObject:(id)a3;
+ (_xmlNode)xmlNodeWithName:(id)a3 forObject:(id)a4;
- (BOOL)isXmlNodeNeeded;
@end

@implementation ECXmlDump

- (BOOL)isXmlNodeNeeded
{
  return 1;
}

+ (_xmlNode)xmlNodeForObject:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = v6;
  if (v6)
  {
    if (!objc_msgSend(v6, "compare:options:range:", @"ED", 2, 0, 2))
    {
      uint64_t v8 = 2;
      goto LABEL_6;
    }
    if (!objc_msgSend(v7, "compare:options:range:", @"CHD", 2, 0, 3))
    {
      uint64_t v8 = 3;
LABEL_6:
      uint64_t v9 = [v7 substringFromIndex:v8];

      v7 = (void *)v9;
    }
  }
  v10 = (_xmlNode *)[a1 xmlNodeWithName:v7 forObject:v4];

  return v10;
}

+ (_xmlNode)xmlNodeWithName:(id)a3 forObject:(id)a4
{
  v5 = (__CFString *)a3;
  id v6 = a4;
  if (!v5 || ![(__CFString *)v5 length])
  {

    v5 = @"UnknownObject";
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 isXmlNodeNeeded] & 1) == 0)
  {
    xmlNodePtr v7 = 0;
  }
  else
  {
    xmlNodePtr v7 = xmlNewNode(0, (const xmlChar *)[(__CFString *)v5 tc_xmlString]);
    if (objc_opt_respondsToSelector()) {
      [v6 addXmlProperties:v7];
    }
    else {
      sfaxmlSetBoolNoNsProp(v7, (const xmlChar *)"xmlDumpingSupported", 0);
    }
  }

  return v7;
}

@end