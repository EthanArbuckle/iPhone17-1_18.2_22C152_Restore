@interface PFEIViewport
- (BOOL)mapStartElementWithState:(id)a3;
- (PFXDrawablePlacement)placement;
- (id)_backgroundShapeInfoCanvasSize:(CGSize)a3 readerState:(id)a4;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFEIViewport

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFEIViewport;
  [(PFEIViewport *)&v3 dealloc];
}

- (PFXDrawablePlacement)placement
{
  return self->_drawablePlacement;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  [v6 setOriginalStorage:[v6 storage]];
  id v7 = objc_msgSend(objc_alloc((Class)TSWPStorage), "initWithContext:string:stylesheet:kind:", +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"), &stru_46D7E8, objc_msgSend(objc_msgSend(a3, "orientationState"), "stylesheet"), 3);
  [v6 setOverriddenStorage:v7];
  [v7 setParagraphLevel:0 forCharRange:[v7 length] undoTransaction:0];
  objc_msgSend(v7, "setParagraphStyle:forCharRange:undoTransaction:", objc_msgSend(objc_msgSend(a3, "orientationState"), "defaultParagraphStyle"), objc_msgSend(v7, "length"), 0, 0);

  v8 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->_drawablePlacement = v8;
  [(PFXDrawablePlacement *)v8 mapStartElementWithState:a3];
  -[PFXDrawablePlacement setInfoGeometry:](self->_drawablePlacement, "setInfoGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataGeometry[0]), "UTF8String")));
  return 1;
}

- (id)_backgroundShapeInfoCanvasSize:(CGSize)a3 readerState:(id)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)TSDShapeInfo), "initWithContext:geometry:style:", objc_msgSend(a4, "tspContext"), objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", a3.width, a3.height), +[PFXWidgetPlacement mapBackgroundShapeStyleWithStackEntry:readerState:](PFXWidgetPlacement, "mapBackgroundShapeStyleWithStackEntry:readerState:", objc_msgSend(a4, "currentHtmlStackEntry"), a4));

  return v4;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  objc_opt_class();
  [v6 childResultAtIndex:0];
  uint64_t v7 = TSUDynamicCast();
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v5 valueForAttribute:PFXWidgetConstantDataContentPadding[0]];
    if (v9)
    {
      [v9 doubleValue];
      double v11 = v10;
    }
    else
    {
      double v11 = 0.0;
    }
    id v12 = [v5 valueForAttribute:PFXWidgetConstantDataCanvasWidth[0]];
    if (v12)
    {
      [v12 doubleValue];
      double v14 = v13;
    }
    else
    {
      double v14 = 180.0;
    }
    id v15 = [v5 valueForAttribute:PFXWidgetConstantDataCanvasHeight[0]];
    if (v15)
    {
      [v15 doubleValue];
      double v17 = v16;
    }
    else
    {
      double v17 = 200.0;
    }
    id v18 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:CGPointZero.x, CGPointZero.y, v14, v17];
    id v19 = [objc_alloc((Class)TSWPShapeStyle) initWithContext:[a3 tspContext]];
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v19);
    id v20 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(a3, "tspContext"), v18, v19, v8);
    [v20 setStroke:[TSDStroke emptyStroke]];
    v21 = (NSString *)[v5 valueForAttribute:PFXWidgetConstantDataViewportSize[0]];
    double width = v14;
    double height = v17;
    if (v21)
    {
      CGSize v24 = CGSizeFromString(v21);
      double width = v24.width;
      double height = v24.height;
    }
    id v25 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:CGPointZero.x, CGPointZero.y, width, height];
    v26 = -[THWViewportInfo initWithContext:geometry:]([THWViewportInfo alloc], "initWithContext:geometry:", [a3 tspContext], v25);
    -[THWViewportInfo setCanvasSize:](v26, "setCanvasSize:", v14, v17);
    [(THWViewportInfo *)v26 setContentPadding:v11];
    -[THWViewportInfo setBackgroundShape:](v26, "setBackgroundShape:", -[PFEIViewport _backgroundShapeInfoCanvasSize:readerState:](self, "_backgroundShapeInfoCanvasSize:readerState:", a3, v14, v17));
    [(THWViewportInfo *)v26 setExteriorTextWrap:[(PFXDrawablePlacement *)self->_drawablePlacement exteriorTextWrap]];
    id v27 = v20;
    [(THWViewportInfo *)v26 setCanvasInfos:+[NSArray arrayWithObjects:&v27 count:1]];
    if ([(THWViewportInfo *)v26 backgroundShape])
    {
      [(THWViewportInfo *)v26 setStroke:[(TSDShapeInfo *)[(THWViewportInfo *)v26 backgroundShape] stroke]];
      [(TSDShapeInfo *)[(THWViewportInfo *)v26 backgroundShape] setStroke:+[TSDStroke emptyStroke]];
      [(TSDShapeInfo *)[(THWViewportInfo *)v26 backgroundShape] setGeometry:v25];
    }
    [v6 setResult:v26];
  }
}

@end