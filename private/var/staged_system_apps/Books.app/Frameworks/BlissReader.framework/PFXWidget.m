@interface PFXWidget
+ (BOOL)isWidgetAutoplay:(id)a3;
+ (BOOL)isWidgetExpandedOnly:(id)a3;
+ (id)drawableWidgetWithContext:(id)a3 infoGeometry:(id)a4 widgetTitle:(id)a5 stageDrawable:(id)a6 widgetInfo:(id)a7;
+ (id)urlForDataBundleWithState:(id)a3;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXWidget

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentXmlStackEntry];
  -[PFXDrawablePlacement setInfoGeometry:](self->super.mPlacement, "setInfoGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataGeometry[0]), "UTF8String")));
  v7.receiver = self;
  v7.super_class = (Class)PFXWidget;
  return [(PFXDrawable *)&v7 mapStartElementWithState:a3];
}

- (void)mapEndElementWithState:(id)a3
{
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXWidget mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXWidget.mm") lineNumber:126 description:@"Shouldn't ever be invoking PFXWidget Any More!"];
  v5.receiver = self;
  v5.super_class = (Class)PFXWidget;
  [(PFXDrawable *)&v5 mapEndElementWithState:a3];
}

+ (BOOL)isWidgetExpandedOnly:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  [a3 applePubVersion];
  if (v5 < 2.2 && ([a3 applePubVersion], vabdd_f64(v6, 2.2) >= 0.00001)) {
    objc_super v7 = PFXWidgetConstantDataFullscreenOnly;
  }
  else {
    objc_super v7 = PFXWidgetConstantDataExpandedOnly;
  }
  return xmlStrEqual((const xmlChar *)[v4 xmlValueForAttribute:*v7], (const xmlChar *)"yes") != 0;
}

+ (BOOL)isWidgetAutoplay:(id)a3
{
  id v3 = [a3 currentHtmlStackEntry];
  id v4 = (const xmlChar *)[v3 xmlValueForAttribute:PFXWidgetConstantDataAutoplay[0]];
  if (v4) {
    LOBYTE(v4) = xmlStrEqual(v4, (const xmlChar *)"yes") != 0;
  }
  return (char)v4;
}

+ (id)drawableWidgetWithContext:(id)a3 infoGeometry:(id)a4 widgetTitle:(id)a5 stageDrawable:(id)a6 widgetInfo:(id)a7
{
  v10 = [[THWDrawablesWidgetInfo alloc] initWithContext:a3 geometry:a4];
  v11 = v10;
  if (a5)
  {
    id v12 = [(THWDrawablesWidgetInfo *)v10 accessibilityDescriptions];
    if (!v12)
    {
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      [(THWDrawablesWidgetInfo *)v11 setAccessibilityDescriptions:v12];
    }
    [v12 setObject:a5 forKey:@"widgetTitle"];
  }
  [(THWDrawablesWidgetInfo *)v11 setStageDrawable:a6];
  [(THWDrawablesWidgetInfo *)v11 setExpandedStageDrawable:a7];
  [(THWDrawablesWidgetInfo *)v11 setExpandedOnly:1];
  return v11;
}

+ (id)urlForDataBundleWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  double v5 = (NSURL *)objc_msgSend(objc_msgSend(v4, "valueForAttribute:", PFXWidgetConstantDataBundlePath[0]), "stringByRemovingPercentEncoding");
  if (v5)
  {
    id v6 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "archive"), "rootFolder"), "stringByAppendingPathComponent:", +[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", v5, objc_msgSend(a3, "entryURI")));
    double v5 = +[NSURL fileURLWithPath:v6];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [v4 valueForAttribute:PFXWidgetConstantDataStartingFile[0]];
  if (!v7 || ![v7 length]) {
    return v5;
  }
  id v8 = [v6 stringByAppendingPathComponent:[v4 valueForAttribute:PFXWidgetConstantDataStartingFile[0]]];

  return +[NSURL fileURLWithPath:v8];
}

@end