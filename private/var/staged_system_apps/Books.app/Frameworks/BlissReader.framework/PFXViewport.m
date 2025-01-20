@interface PFXViewport
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXViewport

- (void)mapEndElementWithState:(id)a3
{
  id v21 = [a3 currentHtmlStackEntry];
  id v3 = [v21 currentEntryMediaState];
  id v22 = +[NSMutableArray array];
  v4 = 0;
  if ([v3 childResultCount])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v3 childResultAtIndex:v5];
      if ([v6 conformsToProtocol:&OBJC_PROTOCOL___TSDInfo])
      {
        v7 = (const xmlChar *)objc_msgSend(objc_msgSend(v3, "xmlAttributeValueForResult:attributeName:", v6, PFXWidgetConstantDataFallbackImage[0]), "xmlString");
        v8 = (const xmlChar *)objc_msgSend(objc_msgSend(v3, "xmlAttributeValueForResult:attributeName:", v6, PFXWidgetConstantDataWidgetObjectType[0]), "xmlString");
        if (xmlStrEqual(v8, (const xmlChar *)PFXWidgetConstantObjectValueBackground[0])
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v4 = v6;
        }
        else if (!xmlStrEqual(v7, (const xmlChar *)"yes"))
        {
          [v22 addObject:v6];
        }
      }
      ++v5;
    }
    while (v5 < (unint64_t)[v3 childResultCount]);
  }
  id v9 = [v21 valueForAttribute:PFXWidgetConstantDataContentPadding[0]];
  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }
  id v12 = [v21 valueForAttribute:PFXWidgetConstantDataCanvasWidth[0]];
  if (v12)
  {
    [v12 doubleValue];
    double v14 = v13;
  }
  else
  {
    double v14 = 180.0;
  }
  id v15 = [v21 valueForAttribute:PFXWidgetConstantDataCanvasHeight[0]];
  if (v15)
  {
    [v15 doubleValue];
    double v17 = v16;
  }
  else
  {
    double v17 = 200.0;
  }
  if (!v4) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXViewport mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXViewport.mm") lineNumber:77 description:@"invalid nil value for '%s'", "backgroundShape"];
  }
  v18 = -[THWViewportInfo initWithContext:geometry:]([THWViewportInfo alloc], "initWithContext:geometry:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"));
  -[THWViewportInfo setProgressKitID:](v18, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v21 xmlElementId]));
  -[THWViewportInfo setProgressKitSectionID:](v18, "setProgressKitSectionID:", [a3 nodeGUID]);
  [(THWViewportInfo *)v18 setBackgroundShape:v4];
  -[THWViewportInfo setCanvasSize:](v18, "setCanvasSize:", v14, v17);
  [(THWViewportInfo *)v18 setContentPadding:v11];
  [(THWViewportInfo *)v18 setExteriorTextWrap:[(PFXDrawablePlacement *)self->super.mPlacement exteriorTextWrap]];
  [(THWViewportInfo *)v18 setCanvasInfos:v22];
  if (v4)
  {
    -[THWViewportInfo setStroke:](v18, "setStroke:", [v4 stroke]);
    [v4 setStroke:[TSDStroke emptyStroke]];
  }
  [v3 setResult:v18];

  v23.receiver = self;
  v23.super_class = (Class)PFXViewport;
  [(PFXDrawable *)&v23 mapEndElementWithState:a3];
}

@end