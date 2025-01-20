@interface PFXInteractiveImageWidgetCalloutType
+ (void)readScaleTranslation:(double *)a3 translation:(CGPoint *)a4 stackEntry:(id)a5;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXInteractiveImageWidgetCalloutType

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

+ (void)readScaleTranslation:(double *)a3 translation:(CGPoint *)a4 stackEntry:(id)a5
{
  v8 = (const char *)[a5 xmlValueForAttribute:PFXWidgetConstantVisualDictionaryObjectAttributeScale[0]];
  if (v8)
  {
    CGFloat v12 = 1.0;
    if (sscanf(v8, "%lgpt", &v12)) {
      *a3 = v12;
    }
  }
  v9 = (const char *)[a5 xmlValueForAttribute:PFXWidgetConstantVisualDictionaryObjectAttributeTranslate[0]];
  if (v9)
  {
    double v11 = 0.0;
    CGFloat v12 = 0.0;
    if (sscanf(v9, "(%lg,%lg)", &v12, &v11))
    {
      CGFloat v10 = v11;
      a4->x = v12;
      a4->y = v10;
    }
  }
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  id v6 = [v5 propertySet];
  id v7 = [a3 tspContext];
  +[PFXDrawablePlacement boundsWithProperties:v6 readerState:a3];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v39 = 1.0;
  CGPoint v38 = CGPointZero;
  [(id)objc_opt_class() readScaleTranslation:&v39 translation:&v38 stackEntry:v4];
  id v16 = [v4 valueForAttribute:PFXWidgetConstantVisualDictionaryCalloutOrder[0]];
  if (v16 && (v17 = v16, [v16 length])) {
    v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 integerValue]);
  }
  else {
    v35 = 0;
  }
  v18 = (char *)[v5 childResultCount];
  id v36 = a3;
  id v37 = v7;
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0;
    id v22 = 0;
    for (i = 0; i != v19; ++i)
    {
      id v24 = [v5 childResultAtIndex:i];
      objc_opt_class();
      uint64_t v25 = TSUDynamicCast();
      if (v25)
      {
        id v26 = [v5 xmlAttributeValueForResult:v25 attributeName:PFXWidgetConstantDataWidgetObjectType[0]];
        if (v26)
        {
          v27 = v26;
          v28 = (const xmlChar *)[v26 xmlString];
          if (xmlStrEqual(v28, (const xmlChar *)PFXWidgetConstantObjectValueTitle[0]))
          {
            if (v20) {
              [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXInteractiveImageWidgetCalloutType mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXInteractiveImageWidget.mm") lineNumber:122 description:@"PFXInteractiveImageWidget: title assigned already"];
            }
            objc_opt_class();
            v20 = (void *)TSUDynamicCast();
          }
          else
          {
            v29 = (const xmlChar *)[v27 xmlString];
            if (xmlStrEqual(v29, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0]))
            {
              if (v21) {
                [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXInteractiveImageWidgetCalloutType mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXInteractiveImageWidget.mm") lineNumber:127 description:@"PFXInteractiveImageWidget: caption assigned already"];
              }
              objc_opt_class();
              v21 = (void *)TSUDynamicCast();
            }
          }
        }
        else
        {
          if (v22) {
            [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXInteractiveImageWidgetCalloutType mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXInteractiveImageWidget.mm") lineNumber:133 description:@"PFXInteractiveImageWidget: line assigned already"];
          }
          id v22 = v24;
        }
      }
    }
    if (v20) {
      goto LABEL_26;
    }
  }
  else
  {
    id v22 = 0;
    v21 = 0;
    v20 = 0;
  }
  if (v21 || v22)
  {
LABEL_26:
    id v30 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:", objc_msgSend(v36, "tspContext"));
    id v31 = [objc_alloc((Class)TSDShapeInfo) initWithContext:v37 geometry:[objc_alloc((Class)TSDInfoGeometry) initWithPosition:v9 size:v11] style:v30];

    CGPoint v32 = v38;
    v33 = [THWInteractiveImageCalloutInfo alloc];
    v34 = -[THWInteractiveImageCalloutInfo initWithViewScale:contentOffset:groupShape:titleStorage:titleGeometry:descriptionStorage:descriptionGeometry:lineShape:](v33, "initWithViewScale:contentOffset:groupShape:titleStorage:titleGeometry:descriptionStorage:descriptionGeometry:lineShape:", v31, [v20 containedStorage], objc_msgSend(v20, "geometry"), objc_msgSend(v21, "containedStorage"), objc_msgSend(v21, "geometry"), v22, v39, v32);

    [v5 setResult:[TSUPair pairWithFirst:v34 second:v35]];
  }
}

@end