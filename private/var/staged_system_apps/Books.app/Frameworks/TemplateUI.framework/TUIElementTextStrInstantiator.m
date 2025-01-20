@interface TUIElementTextStrInstantiator
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementTextStrInstantiator

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [v10 stringForAttribute:102 node:a4.var0];
  unsigned int v13 = sub_5ED20(v12, (unint64_t)[v9 options]);

  v14 = [v10 stringForAttribute:215 node:a4.var0];
  v15 = v14;
  if (!v14) {
    goto LABEL_26;
  }
  id v16 = v14;
  if ((v13 & 1) == 0) {
    goto LABEL_6;
  }
  if (qword_2DF430 != -1) {
    dispatch_once(&qword_2DF430, &stru_2531D8);
  }
  if ([v16 rangeOfCharacterFromSet:qword_2DF428] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = +[NSString stringWithFormat:@"<body>%@</body>", v16];
    v20 = [v19 dataUsingEncoding:4];
    v21 = v20;
    if (v20
      && (id v22 = v20,
          (htmlParserCtxtPtr MemoryParserCtxt = htmlCreateMemoryParserCtxt((const char *)[v22 bytes], (int)objc_msgSend(v22, "length"))) != 0))
    {
      v24 = MemoryParserCtxt;
      id v25 = v22;
      htmlDocPtr Memory = htmlCtxtReadMemory(v24, (const char *)[v25 bytes], (int)[v25 length], "http://baseurl/baseurl.html", "UTF-8", 10336);
      htmlDocPtr v34 = Memory;
      if (!Memory)
      {
        id v27 = v25;
        htmlDocPtr Memory = htmlCtxtReadMemory(v24, (const char *)[v27 bytes], (int)[v27 length], "http://baseurl/baseurl.html", "UTF-8", 10337);
      }
      htmlFreeParserCtxt(v24);

      if (Memory)
      {
        RootElement = xmlDocGetRootElement(Memory);
        if (RootElement)
        {
          v18 = sub_60AA8(RootElement, 0, (v34 != 0) & (v13 >> 1));
        }
        else
        {
          v18 = 0;
        }
        xmlFreeDoc(Memory);
        goto LABEL_18;
      }
    }
    else
    {
    }
    v18 = 0;
  }
  else
  {
LABEL_6:
    v17 = [[TUIStringTextFragment alloc] initWithString:v16];
    v40 = v17;
    v18 = +[NSArray arrayWithObjects:&v40 count:1];
  }
LABEL_18:

  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v29 = v18;
  id v30 = [v29 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v36;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(v29);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * i) appendToBuilder:v9 context:v11];
      }
      id v31 = [v29 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v31);
  }

LABEL_26:
}

@end