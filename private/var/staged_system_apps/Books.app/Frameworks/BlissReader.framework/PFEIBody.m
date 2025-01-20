@interface PFEIBody
- (BOOL)mapStartElementWithState:(id)a3;
- (id)_columnStyleWithReaderState:(id)a3;
- (id)_propertySetForFlowBodyWithStyleCache:(id)a3;
- (void)_createNodeContentsWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFEIBody

- (id)_columnStyleWithReaderState:(id)a3
{
  id v4 = [objc_alloc((Class)TSWPColumns) initWithColumnCount:1];
  id v5 = [objc_alloc((Class)TSWPPadding) initWithTopInset:0.0 leftInset:0.0 bottomInset:0.0 rightInset:0.0];
  id v6 = [objc_alloc((Class)TSSPropertyMap) initWithCapacity:3];
  [v6 setObject:v4 forProperty:148];
  [v6 setObject:v5 forProperty:146];
  [v6 setIntValue:0 forProperty:149];
  id v7 = objc_msgSend(objc_alloc((Class)TSWPColumnStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), @"Flow Column Style", v6, 0);

  return v7;
}

- (id)_propertySetForFlowBodyWithStyleCache:(id)a3
{
  id v4 = objc_alloc_init(PFSStyleSelector);
  PFSStyleSimpleSelector::setElement((PFSStyleSimpleSelector *)[(PFSStyleSelector *)v4 addSimpleSelector], "html");
  PFSStyleSimpleSelector::setElement((PFSStyleSimpleSelector *)[(PFSStyleSelector *)v4 addSimpleSelector], "body");
  [(PFSStyleSelector *)v4 freeze];
  id v5 = [a3 createPropertySetWithSelector:v4];

  return v5;
}

- (void)_createNodeContentsWithState:(id)a3
{
  id v5 = [a3 orientationState];
  id v6 = [v5 contentNodeBody];
  id v7 = -[PFEIBody _propertySetForFlowBodyWithStyleCache:](self, "_propertySetForFlowBodyWithStyleCache:", [v5 styleCache]);
  v18 = -[THModelPageInfo initWithContext:]([THModelFlowPageInfo alloc], "initWithContext:", [a3 tspContext]);
  double v8 = 0.0;
  -[v18 setGeometry:[objc_alloc((Class)TSDInfoGeometry) initWithSize:768.0, 0.0]];
  [(THModelPageInfo *)v18 setAutosizes:1];
  objc_opt_class();
  [v7 valueForProperty:"margin"];
  v9 = (void *)TSUDynamicCast();
  double v10 = 0.0;
  double v11 = 0.0;
  if ([v9 count] == &dword_4)
  {
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v9 objectAtIndex:0], a3);
    double v13 = v12;
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v9 objectAtIndex:1], a3);
    double v10 = v14;
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v9 objectAtIndex:3], a3);
    double v11 = v15;
    double v8 = v13 + 0.0;
  }
  id v16 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:v11 size:v8];
  v17 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", [a3 tspContext], v16);
  [(THModelBodyTextInfo *)v17 setAutosizes:1];
  [(THModelBodyTextInfo *)v17 setColumnStyle:[(PFEIBody *)self _columnStyleWithReaderState:a3]];
  [(THModelPageInfo *)v18 addBodyBoxInfo:v17 insertContext:0];
  [(THDrawablesZOrder *)[(THModelPageInfo *)v18 drawablesZOrder] addDrawable:v17];
  -[THDrawablesZOrder addDrawable:](-[THModelPageInfo drawablesZOrder](v18, "drawablesZOrder"), "addDrawable:", [v5 bodyStorage]);
  [v6 addPageInfo:v18];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFEIBody;
  -[PFXBody mapStartElementWithState:](&v6, "mapStartElementWithState:");
  [(PFEIBody *)self _createNodeContentsWithState:a3];
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "orientationState"), "contentNodeBody"), "setNodeUniqueID:forInfo:", objc_msgSend(a3, "nodeGUID"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "storage"));
  [a3 setCfiPathForCurrentStorage];
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFEIBody;
  -[PFXBody mapEndElementWithState:](&v6, "mapEndElementWithState:");
  id v4 = [[[a3 orientationState] contentNodeBody] pages];
  if ([v4 count] != (char *)&dword_0 + 1) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIBody mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIBody.mm") lineNumber:146 description:@"Unexpected number of pages."];
  }
  if ([v4 count] == (char *)&dword_0 + 1)
  {
    objc_opt_class();
    [v4 lastObject];
    id v5 = (void *)TSUDynamicCast();
    if (!v5) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIBody mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIBody.mm") lineNumber:150 description:@"invalid nil value for '%s'", "flowPageInfo"];
    }
    [v5 setHasBodyFlow:1];
  }
}

@end