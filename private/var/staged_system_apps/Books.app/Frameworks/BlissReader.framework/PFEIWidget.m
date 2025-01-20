@interface PFEIWidget
+ (id)backgroundShapeStyleWithPropertySet:(id)a3 stylesheet:(id)a4 readerState:(id)a5;
- (BOOL)mapStartElementWithState:(id)a3;
- (PFXDrawablePlacement)drawablePlacement;
- (PFXDrawablePlacement)placement;
- (id)_adornmentInfoWithResults:(id)a3 readerState:(id)a4;
- (id)_widgetFromResults:(id)a3;
- (int)_adornmentLayoutModeFromString:(const char *)a3;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
- (void)setDrawablePlacement:(id)a3;
@end

@implementation PFEIWidget

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFEIWidget;
  [(PFEIWidget *)&v3 dealloc];
}

- (PFXDrawablePlacement)placement
{
  return self->_drawablePlacement;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  [v6 setCurrentBreakStateSameAsParent];
  +[PFXBlock addBreakIfApplicableToEntry:v5 newBreakState:10 hintCollector:0];
  id v7 = [v6 storage];
  [v7 setParagraphLevel:0 forCharRange:[v7 length] undoTransaction:0];
  objc_msgSend(v7, "setParagraphStyle:forCharRange:undoTransaction:", objc_msgSend(objc_msgSend(a3, "orientationState"), "defaultParagraphStyle"), objc_msgSend(v7, "length"), 0, 0);
  [v6 setOriginalStorage:v7];
  v8 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"), &stru_46D7E8, objc_msgSend(objc_msgSend(a3, "orientationState"), "stylesheet"), 3);
  [v6 setOverriddenStorage:v8];

  v9 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->_drawablePlacement = v9;
  [(PFXDrawablePlacement *)v9 mapStartElementWithState:a3];
  -[PFXDrawablePlacement setInfoGeometry:](self->_drawablePlacement, "setInfoGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataGeometry[0]), "UTF8String")));
  return 1;
}

+ (id)backgroundShapeStyleWithPropertySet:(id)a3 stylesheet:(id)a4 readerState:(id)a5
{
  id v7 = objc_alloc_init((Class)TSSPropertyMap);
  id v8 = +[PFXGraphicStyle mapStrokeFromStyleProperties:a3 contentState:a5];
  if (v8) {
    [v7 setObject:v8 forProperty:517];
  }
  id v9 = +[PFXGraphicStyle mapShadowFromStyleProperties:a3 contentState:a5];
  if (v9) {
    [v7 setObject:v9 forProperty:520];
  }
  id v10 = +[PFXGraphicStyle mapFillFromStyleProperties:a3 contentState:a5];
  if (v10) {
    [v7 setObject:v10 forProperty:516];
  }
  id v11 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a5, "tspContext"), 0, v7, 1);

  return v11;
}

- (int)_adornmentLayoutModeFromString:(const char *)a3
{
  if (xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"top-together")) {
    return 1;
  }
  else {
    return 2 * (xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"bottom") != 0);
  }
}

- (id)_adornmentInfoWithResults:(id)a3 readerState:(id)a4
{
  id v28 = [a4 currentHtmlStackEntry];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = (char *)[a3 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    id v6 = v5;
    long long v31 = 0uLL;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_opt_class();
        id v9 = (void *)TSUDynamicCast();
        [v9 second];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v9 second];
          objc_opt_class();
          [v9 first];
          id v11 = (void *)TSUDynamicCast();
          if ([v11 isEqualToString:@"header"])
          {
            *(void *)&long long v31 = v10;
          }
          else
          {
            unsigned int v12 = [v11 isEqualToString:@"figcaption"];
            id v13 = (id)*((void *)&v31 + 1);
            if (v12) {
              id v13 = v10;
            }
            *((void *)&v31 + 1) = v13;
          }
        }
      }
      id v6 = (char *)[a3 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v6);
  }
  else
  {
    long long v31 = 0uLL;
  }
  id v14 = +[NSMutableDictionary dictionary];
  v15 = objc_alloc_init(THWWidgetAdornmentInfo);
  if (xmlStrEqual((const xmlChar *)[v28 xmlValueForAttribute:PFXWidgetConstantDataBackgroundEnabled[0]], (const xmlChar *)"yes"))
  {
    id v16 = a4;
    id v17 = +[PFXWidgetPlacement mapDefaultBackgroundShapeWithPlacement:self->_drawablePlacement readerState:a4];
    [v14 setObject:v17 forKey:[NSNumber numberWithInteger:0]];
    [(THWWidgetAdornmentInfo *)v15 setBackground:v17];
    uint64_t v18 = 1;
  }
  else
  {
    uint64_t v18 = 0;
    id v16 = a4;
  }
  uint64_t v19 = v31;
  if (v31 != 0)
  {
    *(void *)&long long v31 = v14;
    id v20 = objc_alloc_init((Class)TSSPropertyMap);
    LODWORD(v21) = 1.0;
    [v20 setFloatValue:518 forProperty:v21];
    [v20 setObject:[TSWPShapeStyle defaultValueForProperty:148] forProperty:148];
    [v20 setObject:[TSWPShapeStyle defaultValueForProperty:146] forProperty:146];
    [v20 setObject:[TSWPShapeStyle defaultValueForProperty:516] forProperty:516];
    [v20 setObject:[TSWPShapeStyle defaultValueForProperty:517] forProperty:517];
    [v20 setObject:[TSWPShapeStyle defaultValueForProperty:519] forProperty:519];
    [v20 setObject:[TSWPShapeStyle defaultValueForProperty:520] forProperty:520];
    id v22 = objc_msgSend(objc_alloc((Class)TSWPShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(v16, "tspContext"), 0, v20, 0);
    id v23 = [objc_alloc((Class)TSDInfoGeometry) initWithSize:50.0, 50.0];
    objc_msgSend(objc_msgSend(objc_msgSend(v16, "orientationState"), "stylesheet"), "addStyle:", v22);
    if (v19)
    {
      id v24 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(v16, "tspContext"), v23, v22, v19);
      [v31 setObject:v24 forKey:[NSNumber numberWithInteger:v18]];
      [(THWWidgetAdornmentInfo *)v15 setTitle:v24];

      ++v18;
    }
    if (*((void *)&v31 + 1))
    {
      id v25 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(a4, "tspContext"), v23, v22, *((void *)&v31 + 1));
      [v31 setObject:v25 forKey:[NSNumber numberWithInteger:v18]];
      [(THWWidgetAdornmentInfo *)v15 setCaption:v25];
    }
    id v14 = (id)v31;
  }
  [(THWWidgetAdornmentInfo *)v15 setInsertionOrder:v14];
  -[THWWidgetAdornmentInfo setLayoutMode:](v15, "setLayoutMode:", -[PFEIWidget _adornmentLayoutModeFromString:](self, "_adornmentLayoutModeFromString:", [v28 xmlValueForAttribute:PFXWidgetConstantDataContentLayout[0]]));
  id v26 = [v28 valueForAttribute:PFXWidgetConstantDataContentPadding[0]];
  if (v26)
  {
    [v26 doubleValue];
    -[THWWidgetAdornmentInfo setContentPadding:](v15, "setContentPadding:");
  }
  return v15;
}

- (id)_widgetFromResults:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id result = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    id v5 = (char *)result;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a3);
        }
        objc_opt_class();
        id v8 = (void *)TSUDynamicCast();
        if ([v8 second] conformsToProtocol:&OBJC_PROTOCOL___THWWidgetInfo)return [v8 second]; {
        ++v7;
        }
      }
      while (v5 != v7);
      id result = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      id v5 = (char *)result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  objc_opt_class();
  [v6 result];
  uint64_t v7 = TSUDynamicCast();
  id v8 = [(PFEIWidget *)self _widgetFromResults:v7];
  long long v9 = v8;
  if (!v7)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIWidget mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIWidget.mm") lineNumber:300 description:@"invalid nil value for '%s'", "results"];
    if (v9) {
      goto LABEL_3;
    }
LABEL_7:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIWidget mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIWidget.mm") lineNumber:301 description:@"invalid nil value for '%s'", "widgetInfo"];
    return;
  }
  if (!v8) {
    goto LABEL_7;
  }
LABEL_3:
  id v10 = objc_msgSend(objc_msgSend(v6, "originalStorage"), "length");
  uint64_t v11 = TSUProtocolCast();
  [v9 setAdornmentInfo:[self _adornmentInfoWithResults:v7 readerState:a3]];
  objc_msgSend(objc_msgSend(v9, "adornmentInfo"), "updateParentInfo:", v11);
  id v13 = -[THWAnchoredWidgetInfo initWithContext:widgetInfo:]([THWAnchoredWidgetInfo alloc], "initWithContext:widgetInfo:", [a3 tspContext], v9);
  id v12 = objc_msgSend(objc_alloc((Class)TSWPDrawableAttachment), "initWithContext:drawable:", objc_msgSend(a3, "tspContext"), v13);
  objc_msgSend(objc_msgSend(v6, "originalStorage"), "insertAttachmentOrFootnote:range:", v12, v10, 0);
  -[THWAnchoredWidgetInfo setParentInfo:](v13, "setParentInfo:", [v6 originalStorage]);
  [v6 setParentBreakStateSameAsCurrent];
  [a3 setUniqueIdForInfo:v9 fromStackEntry:v5];
}

- (PFXDrawablePlacement)drawablePlacement
{
  return self->_drawablePlacement;
}

- (void)setDrawablePlacement:(id)a3
{
}

@end