@interface PFXGalleryWidgetType
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXGalleryWidgetType

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  v6 = (const xmlChar *)[v4 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0]))
  {
    v7 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", [a3 tspContext], &stru_46D7E8, objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), 3);
    [v5 setOverriddenStorage:v7];
  }
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  v6 = (const xmlChar *)[v4 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0]))
  {
    id v7 = [v5 storage];
    [v5 setResult:v7];
  }
  else if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantGalleryObjectValueItem[0]) {
         && [v5 childResultCount])
  }
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v12 = (const char *)[v4 xmlValueForAttribute:PFXWidgetConstantGalleryItemExpandedCropRect[0]];
    if (v12)
    {
      double v29 = 0.0;
      double v30 = 0.0;
      double v27 = 0.0;
      double v28 = 0.0;
      if (sscanf(v12, "%lf %lf %lf %lf", &v30, &v29, &v28, &v27) == 4)
      {
        double y = v29;
        double x = v30;
        double height = v27;
        double width = v28;
      }
    }
    if ([v5 childResultCount])
    {
      id v13 = 0;
      id v24 = 0;
      id v25 = 0;
      id v14 = 0;
      unint64_t v15 = 0;
      do
      {
        id v16 = [v5 childResultAtIndex:v15];
        v17 = (const xmlChar *)objc_msgSend(objc_msgSend(v5, "xmlAttributeValueForResult:attributeName:", v16, PFXWidgetConstantDataWidgetObjectType[0]), "xmlString");
        if (xmlStrEqual(v17, (const xmlChar *)PFXWidgetConstantGalleryObjectValueFullScreen[0]))
        {
          objc_opt_class();
          v18 = (void *)TSUDynamicCast();
          id v13 = [v18 imageData];
          id v14 = [v18 accessibilityDescriptions];
        }
        else if (xmlStrEqual(v17, (const xmlChar *)PFXWidgetConstantGalleryObjectValueThumbnail[0]))
        {
          objc_opt_class();
          id v25 = [(id)TSUDynamicCast() imageData];
        }
        else if (!v17)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          id v20 = v24;
          if (isKindOfClass) {
            id v20 = v16;
          }
          id v24 = v20;
        }
        ++v15;
      }
      while (v15 < (unint64_t)[v5 childResultCount]);
    }
    else
    {
      id v14 = 0;
      id v24 = 0;
      id v25 = 0;
      id v13 = 0;
    }
    [a3 thinningScaleForImageData:v13];
    CGFloat v22 = v21;
    if (v21 > 1.0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXGalleryWidgetType mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXGalleryWidget.mm") lineNumber:126 description:@"thinning scale is going the wrong way"];
    }
    if (v22 < 1.0)
    {
      CGAffineTransformMakeScale(&v26, v22, v22);
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      CGRect v33 = CGRectApplyAffineTransform(v32, &v26);
      CGRect v34 = CGRectIntegral(v33);
      double x = v34.origin.x;
      double y = v34.origin.y;
      double width = v34.size.width;
      double height = v34.size.height;
    }
    if (v13)
    {
      v23 = objc_alloc_init(PFXGalleryItem2);
      [(PFXGalleryItem2 *)v23 setFullres:v13];
      -[PFXGalleryItem2 setFullresCropRect:](v23, "setFullresCropRect:", x, y, width, height);
      [(PFXGalleryItem2 *)v23 setThumbnail:v25];
      [(PFXGalleryItem2 *)v23 setCaption:v24];
      [(PFXGalleryItem2 *)v23 setAccessibilityDescriptions:v14];
      [v5 setResult:v23];
    }
  }
}

@end