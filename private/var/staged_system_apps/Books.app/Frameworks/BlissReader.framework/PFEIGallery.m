@interface PFEIGallery
+ (id)galleryItemFromEntry:(id)a3;
- (BOOL)mapStartElementWithState:(id)a3;
- (BOOL)shareCaption;
- (BOOL)showThumbs;
- (void)mapEndElementWithState:(id)a3;
- (void)setShareCaption:(BOOL)a3;
- (void)setShowThumbs:(BOOL)a3;
@end

@implementation PFEIGallery

+ (id)galleryItemFromEntry:(id)a3
{
  id v4 = [a3 htmlReaderState];
  id v5 = [a3 currentEntryMediaState];
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v10 = (const char *)[a3 xmlValueForAttribute:PFXWidgetConstantGalleryItemExpandedCropRect[0]];
  if (v10)
  {
    double v24 = 0.0;
    double v25 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
    if (sscanf(v10, "%lf %lf %lf %lf", &v25, &v24, &v23, &v22) == 4)
    {
      double y = v24;
      double x = v25;
      double height = v22;
      double width = v23;
    }
  }
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  if (CGRectIsEmpty(v26)) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFEIGallery galleryItemFromEntry:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIGallery.mm") lineNumber:49 description:@"No crop rect for a gallery item"];
  }
  v11 = (THWGalleryItem *)[v5 childResultCount];
  if (v11)
  {
    unint64_t v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    do
    {
      id v16 = [v5 childResultAtIndex:v12];
      if (v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (!v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v14 = v16;
          }
          else {
            id v14 = 0;
          }
        }
      }
      else
      {
        objc_opt_class();
        v17 = (void *)TSUDynamicCast();
        id v15 = [v17 imageData];
        id v13 = [v17 accessibilityDescriptions];
      }
      ++v12;
    }
    while (v12 < (unint64_t)[v5 childResultCount]);
    if (v15)
    {
      objc_opt_class();
      objc_msgSend(objc_msgSend(a3, "readerState"), "ancestorReaderWithClass:", objc_opt_class());
      v18 = (void *)TSUDynamicCast();
      if ([v18 showThumbs])
      {
        v19 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [a3 xmlValueForAttribute:PFXWidgetConstantDataThumbnailSrc[0]]);
        if (v19) {
          v19 = (NSString *)objc_msgSend(v4, "imageDataForUri:isSharable:", objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", v19, objc_msgSend(v4, "entryURI")), "stringByRemovingPercentEncoding"), 0);
        }
      }
      else
      {
        v19 = 0;
      }
      if (([v18 shareCaption] & (v14 != 0)) != 0) {
        id v20 = 0;
      }
      else {
        id v20 = v14;
      }
      v11 = -[THWGalleryItem initWithContext:imageData:thumbnailData:captionStorage:cropRect:accessibilityDescriptions:]([THWGalleryItem alloc], "initWithContext:imageData:thumbnailData:captionStorage:cropRect:accessibilityDescriptions:", [v4 tspContext], v15, v19, v20, v13, x, y, width, height);
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  -[PFEIGallery setShowThumbs:](self, "setShowThumbs:", xmlStrEqual((const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantGalleryShowThumbs[0]], (const xmlChar *)"yes") != 0);
  -[PFEIGallery setShareCaption:](self, "setShareCaption:", xmlStrEqual((const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantGalleryShareCaption[0]], (const xmlChar *)"yes") != 0);
  v7.receiver = self;
  v7.super_class = (Class)PFEIGallery;
  return [(PFEIWidget *)&v7 mapStartElementWithState:a3];
}

- (void)mapEndElementWithState:(id)a3
{
  [(PFXDrawablePlacement *)[(PFEIWidget *)self placement] mapEndElementWithState:a3];
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  objc_super v7 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", [a3 tspContext]);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v7);
  objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageCornerRadius[0]), "doubleValue");
  double v9 = v8;
  id v10 = PFXTSDInfoGeometry((const char *)[v5 valueForAttribute:[PFXWidgetConstantDataStageGeometry[0] UTF8String]]);
  [v10 position];
  double v12 = v11;
  double v14 = v13;
  [v10 size];
  v33 = -[THWStageGeometry initWithFrame:cornerRadius:]([THWStageGeometry alloc], "initWithFrame:cornerRadius:", v12, v14, v15, v16, v9);
  v34 = v7;
  v17 = -[THWGalleryInfo initWithContext:geometry:style:stageGeometry:]([THWGalleryInfo alloc], "initWithContext:geometry:style:stageGeometry:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](-[PFEIWidget placement](self, "placement"), "infoGeometry"), v7, v33);
  id v36 = v5;
  id v18 = [v5 valueForAttribute:PFXWidgetConstantDataContentPadding[0]];
  if (v18)
  {
    [v18 doubleValue];
    -[THWGalleryInfo setContentPadding:](v17, "setContentPadding:");
  }
  objc_opt_class();
  v35 = v6;
  objc_msgSend(objc_msgSend(v6, "childResults"), "firstObject");
  v19 = (void *)TSUDynamicCast();
  objc_opt_class();
  [v19 second];
  id v20 = (void *)TSUDynamicCast();
  id v21 = objc_alloc_init((Class)NSMutableArray);
  if ([v20 count])
  {
    unint64_t v22 = 0;
    do
    {
      objc_opt_class();
      [v20 objectAtIndexedSubscript:v22];
      double v23 = (void *)TSUDynamicCast();
      id v24 = [v23 second];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v21 addObject:v23];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v24 cropRect];
          if (CGRectIsEmpty(v38))
          {
            id v25 = +[TSUAssertionHandler currentHandler];
            CGRect v26 = v17;
            id v27 = v21;
            v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIGallery mapEndElementWithState:]");
            v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIGallery.mm"];
            v30 = v28;
            id v21 = v27;
            v17 = v26;
            [v25 handleFailureInFunction:v30 file:v29 lineNumber:176 description:@"No crop rect for a gallery item"];
          }
          [(THWGalleryInfo *)v17 addItem:v24];
          objc_msgSend(objc_msgSend(v24, "captionStorage"), "setParentInfo:", v17);
        }
      }
      ++v22;
    }
    while (v22 < (unint64_t)[v20 count]);
  }
  BOOL v31 = [(PFEIGallery *)self showThumbs]
     && [(NSArray *)[(THWGalleryInfo *)v17 items] count] > 1;
  [(THWGalleryInfo *)v17 setThumbnailsVisible:v31];
  id v32 = [objc_alloc((Class)TSUPair) initWithFirst:@"gallery" second:v17];
  [v21 addObject:v32];

  [a3 setUniqueIdForInfo:v17 fromStackEntry:v36];
  [a3 setCfiPathForInfo:v17 fromStackEntry:v36];
  [v35 setResult:v21];

  v37.receiver = self;
  v37.super_class = (Class)PFEIGallery;
  [(PFEIWidget *)&v37 mapEndElementWithState:a3];
}

- (BOOL)showThumbs
{
  return self->_showThumbs;
}

- (void)setShowThumbs:(BOOL)a3
{
  self->_showThumbs = a3;
}

- (BOOL)shareCaption
{
  return self->_shareCaption;
}

- (void)setShareCaption:(BOOL)a3
{
  self->_shareCaption = a3;
}

@end