@interface WFTreeXMLDocumentStripper
+ (id)treeStripperWithXMLDocument:(_xmlDoc *)a3;
- (BOOL)hasFrameset;
- (BOOL)hasShortRefresh;
- (WFTreeXMLDocumentStripper)initWithXMLDocument:(_xmlDoc *)a3;
- (id)URLString;
- (id)description;
- (id)images;
- (id)links;
- (id)metaTagDescription;
- (id)metaTagKeywords;
- (id)metaTagRating;
- (id)metaTagsLabeled;
- (id)metaTagsUnlabeled;
- (id)pageContent;
- (id)pageTitle;
- (id)processXMLDocument:(_xmlDoc *)a3 blockComments:(BOOL)a4;
- (id)scriptBlocks;
- (void)dealloc;
- (void)processXMLDocument:(_xmlDoc *)a3;
- (void)setPageTitle:(id)a3;
- (void)setXMLDocument:(_xmlDoc *)a3;
- (void)strip;
@end

@implementation WFTreeXMLDocumentStripper

+ (id)treeStripperWithXMLDocument:(_xmlDoc *)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithXMLDocument:a3];
  return v3;
}

- (WFTreeXMLDocumentStripper)initWithXMLDocument:(_xmlDoc *)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFTreeXMLDocumentStripper;
    v4 = [(WFTreeXMLDocumentStripper *)&v7 init];
    v5 = v4;
    if (v4)
    {
      [(WFTreeXMLDocumentStripper *)v4 setXMLDocument:a3];
      [(WFTreeXMLDocumentStripper *)v5 strip];
    }
  }
  else
  {
    NSLog(&cfstr_SErrorPassingA.isa, a2, "-[WFTreeXMLDocumentStripper initWithXMLDocument:]");
    return 0;
  }
  return v5;
}

- (void)setXMLDocument:(_xmlDoc *)a3
{
  self->xmlDocument = a3;
}

- (void)setPageTitle:(id)a3
{
  id v5 = a3;

  self->pageTitle = (NSString *)a3;
}

- (id)URLString
{
  return 0;
}

- (id)pageTitle
{
  return self->pageTitle;
}

- (id)metaTagDescription
{
  return (id)[(NSMutableDictionary *)self->metaTagsLabeled objectForKey:@"description"];
}

- (id)metaTagKeywords
{
  return (id)[(NSMutableDictionary *)self->metaTagsLabeled objectForKey:@"keywords"];
}

- (id)metaTagRating
{
  return (id)[(NSMutableDictionary *)self->metaTagsLabeled objectForKey:@"rating"];
}

- (id)metaTagsLabeled
{
  return self->metaTagsLabeled;
}

- (id)metaTagsUnlabeled
{
  return self->metaTagsUnlabeled;
}

- (id)scriptBlocks
{
  return self->scriptBlocks;
}

- (id)images
{
  return self->images;
}

- (id)pageContent
{
  return self->pageContent;
}

- (id)links
{
  return self->links;
}

- (BOOL)hasFrameset
{
  return self->hasFrameset;
}

- (BOOL)hasShortRefresh
{
  return self->hasShortRefresh;
}

- (void)strip
{
}

- (void)processXMLDocument:(_xmlDoc *)a3
{
  id v7 = (id)objc_opt_new();
  self->scriptBlocks = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  self->images = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  self->metaTagsLabeled = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  self->metaTagsUnlabeled = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  self->links = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  *(_WORD *)&self->hasFrameset = 0;
  id v5 = [(WFTreeXMLDocumentStripper *)self processXMLDocument:a3 blockComments:1];
  self->pageContent = v5;
  v6 = v5;
}

- (id)processXMLDocument:(_xmlDoc *)a3 blockComments:(BOOL)a4
{
  v6 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @" ", a4);
  id v7 = (void *)[MEMORY[0x263EFF980] array];
  for (i = a3->last; i; i = i->prev)
    objc_msgSend(v7, "WF_push:", i);
  if ([v7 count])
  {
    unint64_t v9 = 0x263F08000uLL;
    while (1)
    {
      uint64_t v10 = objc_msgSend(v7, "WF_pop");
      uint64_t v11 = *(void *)(v10 + 16);
      if (!v11) {
        goto LABEL_39;
      }
      v12 = objc_msgSend((id)objc_msgSend(*(id *)(v9 + 2880), "stringWithFormat:", @"%s", v11), "lowercaseString");
      if ([v12 isEqualToString:@"a"]) {
        break;
      }
      if ([v12 isEqualToString:@"style"]) {
        goto LABEL_43;
      }
      if ([v12 isEqualToString:@"script"])
      {
        v13 = +[WFJavascriptStripper stripJavascript:](WFJavascriptStripper, "stripJavascript:", +[XMLNode getJavascriptFromNode:v10]);
        scriptBlocks = self->scriptBlocks;
        goto LABEL_8;
      }
      if ([v12 isEqualToString:@"meta"])
      {
        id v15 = +[XMLNode stringValueForAttribute:@"name" inNode:v10];
        id v16 = +[XMLNode stringValueForAttribute:@"content" inNode:v10];
        id v17 = +[XMLNode stringValueForAttribute:@"http-equiv" inNode:v10];
        id v18 = v16;
        if (v17) {
          BOOL v19 = v15 == 0;
        }
        else {
          BOOL v19 = 0;
        }
        if (!v19) {
          id v17 = v15;
        }
        if (!v16 || v17)
        {
          unint64_t v9 = 0x263F08000;
          if (v17)
          {
            if (v18)
            {
              v20 = v18;
              v21 = (void *)[v17 lowercaseString];
              if (![(NSMutableDictionary *)self->metaTagsLabeled objectForKey:v21])
              {
                if ([v21 isEqualToString:@"refresh"])
                {
                  v30 = objc_msgSend(v20, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceCharacterSet"));
                  if ((objc_msgSend(v30, "WF_containsString:", @"url=http://images.google.") & 1) == 0)
                  {
                    v31 = (void *)[MEMORY[0x263F08B08] scannerWithString:v30];
                    id v32 = 0;
                    if (objc_msgSend(v31, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x263F08708], "decimalDigitCharacterSet"), &v32))
                    {
                      int v22 = [v32 intValue];
                      if (kWFIgnoreRefreshCutoff > v22) {
                        self->hasShortRefresh = 1;
                      }
                    }
                  }
                }
                [(NSMutableDictionary *)self->metaTagsLabeled setObject:v20 forKey:v21];
              }
            }
          }
        }
        else
        {
          [(NSMutableArray *)self->metaTagsUnlabeled addObject:v16];
          unint64_t v9 = 0x263F08000;
        }
        goto LABEL_43;
      }
      if ([v12 isEqualToString:@"img"])
      {
        v13 = +[WFImg imgWithNode:v10];
        scriptBlocks = self->images;
        goto LABEL_8;
      }
      if (([v12 isEqualToString:@"title"] & 1) == 0)
      {
        if ([v12 isEqualToString:@"frameset"]) {
          self->hasFrameset = 1;
        }
LABEL_39:
        if (*(_DWORD *)(v10 + 8) == 3)
        {
          uint64_t v25 = *(void *)(v10 + 80);
          if (v25)
          {
            v26 = (void *)[*(id *)(v9 + 2880) stringWithCString:v25 encoding:4];
            uint64_t v27 = objc_msgSend(v26, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"));
            if (v27)
            {
              [v6 appendString:v27];
              [v6 appendString:@" "];
            }
          }
        }
        goto LABEL_43;
      }
      if ([(WFTreeXMLDocumentStripper *)self pageTitle]) {
        goto LABEL_39;
      }
      uint64_t v23 = *(void *)(v10 + 24);
      if (v23)
      {
        uint64_t v24 = *(void *)(v23 + 80);
        if (v24) {
          -[WFTreeXMLDocumentStripper setPageTitle:](self, "setPageTitle:", [*(id *)(v9 + 2880) stringWithCString:v24 encoding:4]);
        }
      }
LABEL_43:
      for (uint64_t j = *(void *)(v10 + 32); j; uint64_t j = *(void *)(j + 56))
        objc_msgSend(v7, "WF_push:", j);
      if (![v7 count]) {
        return v6;
      }
    }
    v13 = +[WFLink linkWithNode:v10];
    scriptBlocks = self->links;
LABEL_8:
    [(NSMutableArray *)scriptBlocks addObject:v13];
    goto LABEL_43;
  }
  return v6;
}

- (id)description
{
  v3 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"<%@:%p\n", objc_msgSend((id)objc_opt_class(), "description"), self];
  [v3 appendFormat:@"\tpageTitle:%@\n", self->pageTitle];
  [v3 appendFormat:@"\tmetaTagDescription:%@\n", -[WFTreeXMLDocumentStripper metaTagDescription](self, "metaTagDescription")];
  [v3 appendFormat:@"\tmetaTagKeywords:%@\n", -[WFTreeXMLDocumentStripper metaTagKeywords](self, "metaTagKeywords")];
  [v3 appendFormat:@"\tscriptBlocks:%@\n", self->scriptBlocks];
  [v3 appendFormat:@"\timages:%@\n", self->images];
  [v3 appendFormat:@"\tpageContent:%@\n", self->pageContent];
  [v3 appendString:@">"];
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFTreeXMLDocumentStripper;
  [(WFTreeXMLDocumentStripper *)&v3 dealloc];
}

@end