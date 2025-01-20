@interface PFAITocConfigBody
- (BOOL)mapStartElementWithState:(id)a3;
- (void)addDrawablesToPageZOrderWithState:(id)a3;
- (void)createBodiesWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAITocConfigBody

- (void)createBodiesWithState:(id)a3
{
  id v4 = [a3 pageInfo];
  +[PFXDrawablePlacement boundsWithProperties:readerState:](PFXDrawablePlacement, "boundsWithProperties:readerState:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "paginatedState"), "pageCache"), "pageWithIndex:", 0), a3);
  id v9 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:v5 size:v6];
  v14 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", [a3 tspContext], v9);
  id v10 = [objc_alloc((Class)TSSPropertyMap) initWithCapacity:3];
  id v11 = [objc_alloc((Class)TSWPColumns) initWithColumnCount:1];
  [v10 setObject:v11 forProperty:148];

  id v12 = objc_alloc_init((Class)TSWPPadding);
  [v10 setObject:v12 forProperty:146];

  [v10 setIntValue:0 forProperty:149];
  id v13 = objc_msgSend(objc_alloc((Class)TSWPColumnStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), @"BOGUS Column Style Name", v10, 0);
  [(THModelBodyTextInfo *)v14 setColumnStyle:v13];
  [(THModelBodyTextInfo *)v14 setExteriorTextWrap:+[TSDExteriorTextWrap exteriorTextWrap]];
  [v4 addBodyBoxInfo:v14 insertContext:0];
  +[PFAITocConfigDrawablePlacement cacheDrawable:v14 readerState:a3];
}

- (void)addDrawablesToPageZOrderWithState:(id)a3
{
  id v4 = [a3 pageInfo];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  [a3 pageDrawableList];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(objc_msgSend(v4, "drawablesZOrder"), "addDrawable:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFAITocConfigBody;
  BOOL v4 = -[PFXBody mapStartElementWithState:](&v6, "mapStartElementWithState:");
  if (v4) {
    objc_msgSend(objc_msgSend(a3, "thNodeBody"), "setNodeUniqueID:forInfo:", objc_msgSend(a3, "nodeGUID"), objc_msgSend(objc_msgSend(a3, "thNodeBody"), "bodyStorage"));
  }
  return v4;
}

- (void)mapEndElementWithState:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PFAITocConfigBody;
  -[PFXBody mapEndElementWithState:](&v5, "mapEndElementWithState:");
  if (xmlStrEqual((const xmlChar *)"body", (const xmlChar *)objc_msgSend(objc_msgSend(a3, "currentXmlStackEntry"), "xmlElementName")))
  {
    [(PFAITocConfigBody *)self createBodiesWithState:a3];
    [(PFAITocConfigBody *)self addDrawablesToPageZOrderWithState:a3];
  }
}

@end