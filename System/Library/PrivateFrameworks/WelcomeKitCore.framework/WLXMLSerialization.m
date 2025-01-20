@interface WLXMLSerialization
- (id)XMLObjectWithData:(id)a3;
- (id)XMLObjectWithString:(id)a3;
- (id)parseXMLContent:(_xmlNode *)a3;
@end

@implementation WLXMLSerialization

- (id)XMLObjectWithString:(id)a3
{
  v4 = [a3 dataUsingEncoding:4];
  v5 = [(WLXMLSerialization *)self XMLObjectWithData:v4];

  return v5;
}

- (id)XMLObjectWithData:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 bytes];
  int v6 = [v4 length];

  xmlDocPtr Memory = xmlReadMemory(v5, v6, 0, 0, 0);
  v8 = [(WLXMLSerialization *)self parseXMLContent:xmlDocGetRootElement(Memory)];
  xmlFreeDoc(Memory);
  return v8;
}

- (id)parseXMLContent:(_xmlNode *)a3
{
  if (!a3)
  {
LABEL_16:
    v12 = &stru_26DF81F20;
    goto LABEL_19;
  }
  children = a3->children;
  if (!children)
  {
    Content = xmlNodeGetContent(a3);
    if (Content)
    {
      v12 = (__CFString *)[[NSString alloc] initWithUTF8String:Content];
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  while (1)
  {
    name = children->name;
    if (name) {
      break;
    }
LABEL_12:
    if (!children)
    {
      v12 = (__CFString *)v5;
      goto LABEL_18;
    }
  }
  v7 = (void *)[[NSString alloc] initWithUTF8String:name];
  v8 = [v5 objectForKeyedSubscript:v7];
  if (([v7 isEqualToString:@"text"] & 1) == 0)
  {
    if (v8)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v10 = [(WLXMLSerialization *)self parseXMLContent:children];
      if (isKindOfClass)
      {
        [v8 addObject:v10];
      }
      else
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v8, v10, 0);
        [v5 setObject:v11 forKey:v7];
      }
    }
    else
    {
      v10 = [(WLXMLSerialization *)self parseXMLContent:children];
      [v5 setObject:v10 forKey:v7];
    }

    children = children->next;
    goto LABEL_12;
  }
  v12 = [(WLXMLSerialization *)self parseXMLContent:children];

LABEL_18:
LABEL_19:
  return v12;
}

@end