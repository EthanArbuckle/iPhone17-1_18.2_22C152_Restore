@interface PFXGalleryWidget
- (BOOL)mapStartElementWithState:(id)a3;
- (PFXDrawablePlacement)placement;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXGalleryWidget

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXGalleryWidget;
  [(PFXGalleryWidget *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->mPlacement = v5;
  unsigned __int8 v6 = [(PFXDrawablePlacement *)v5 mapStartElementWithState:a3];
  id v7 = [a3 currentHtmlDocMediaState];
  if ([(PFXDrawablePlacement *)self->mPlacement mode] == 2)
  {
    if ([v7 hasHints])
    {
      if (([a3 inTable] & 1) == 0)
      {
        id v8 = [v7 nextHintLocation];
        if (v8 == [a3 totalTextRead])
        {
          objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "storage")), "addLineBreakHintWithPresentationId:", @"p");
          [v7 popHint];
        }
      }
    }
  }
  return v6;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  id v7 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", [a3 tspContext]);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v7);
  int v42 = xmlStrEqual((const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantGalleryShowThumbs[0]], (const xmlChar *)"yes");
  int v41 = xmlStrEqual((const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantGalleryShareCaption[0]], (const xmlChar *)"yes");
  objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageCornerRadius[0]), "doubleValue");
  double v9 = v8;
  id v10 = PFXTSDInfoGeometry((const char *)[v5 valueForAttribute:[PFXWidgetConstantDataStageGeometry[0] UTF8String]]);
  [v10 position];
  double v12 = v11;
  double v14 = v13;
  [v10 size];
  v17 = -[THWStageGeometry initWithFrame:cornerRadius:]([THWStageGeometry alloc], "initWithFrame:cornerRadius:", v12, v14, v15, v16, v9);
  v18 = -[THWGalleryInfo initWithContext:geometry:style:stageGeometry:]([THWGalleryInfo alloc], "initWithContext:geometry:style:stageGeometry:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->mPlacement, "infoGeometry"), v7, v17);
  id v39 = v5;
  -[THWGalleryInfo setProgressKitID:](v18, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v5 xmlElementId]));
  -[THWGalleryInfo setProgressKitSectionID:](v18, "setProgressKitSectionID:", [a3 nodeGUID]);
  [(THWGalleryInfo *)v18 setThumbnailsVisible:v42 != 0];

  v38 = self;
  id v43 = a3;
  v19 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:self->mPlacement readerState:a3];
  [(PFXWidgetPlacement *)v19 contentPadding];
  v40 = v18;
  -[THWGalleryInfo setContentPadding:](v18, "setContentPadding:");
  if ([(PFXWidgetPlacement *)v19 hasChildrenForAdornmentInfo])
  {
    [(THWGalleryInfo *)v18 setAdornmentInfo:+[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:v19 readerState:a3]];
    [(THWWidgetAdornmentInfo *)[(THWGalleryInfo *)v18 adornmentInfo] updateParentInfo:v18];
  }
  v20 = (char *)[v6 childResultCount];
  if (v20)
  {
    v21 = v20;
    for (i = 0; i != v21; ++i)
    {
      if (objc_msgSend(objc_msgSend(v6, "childElementNameAtIndex:", i), "isEqualToString:", @"div"))
      {
        objc_opt_class();
        [v6 childResultAtIndex:i];
        v23 = (void *)TSUDynamicCast();
        if (v23)
        {
          v24 = v23;
          if (v42) {
            id v25 = [v23 thumbnail];
          }
          else {
            id v25 = 0;
          }
          id v26 = [v24 caption];
          id v27 = v26;
          if (v41)
          {
            if (v26)
            {
              [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXGalleryWidget mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXGalleryWidget.mm") lineNumber:259 description:@"Gallery item with own caption in a widget with shared caption"];
              id v27 = 0;
            }
          }
          else if (v26)
          {
            [v43 setUniqueIdForInfo:objc_msgSend(v24, "caption"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"caption-%lu", i + 1), v39 withPostfix fromStackEntry];
          }
          v28 = [THWGalleryItem alloc];
          id v29 = [v43 tspContext];
          id v30 = [v24 fullres];
          [v24 fullresCropRect];
          v35 = -[THWGalleryItem initWithContext:imageData:thumbnailData:captionStorage:cropRect:accessibilityDescriptions:](v28, "initWithContext:imageData:thumbnailData:captionStorage:cropRect:accessibilityDescriptions:", v29, v30, v25, v27, [v24 accessibilityDescriptions], v31, v32, v33, v34);
          if (v35)
          {
            v36 = v35;
            [(THWGalleryItem *)v35 cropRect];
            if (CGRectIsEmpty(v45)) {
              [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXGalleryWidget mapEndElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXGalleryWidget.mm") lineNumber:279 description:@"No crop rect for a gallery item"];
            }
            [(THWGalleryInfo *)v40 addItem:v36];
          }
        }
      }
    }
  }
  [v43 setUniqueIdForInfo:v40 fromStackEntry:v39];
  [v6 setResult:v40];

  mPlacement = v38->mPlacement;

  [(PFXDrawablePlacement *)mPlacement mapEndElementWithState:v43];
}

- (PFXDrawablePlacement)placement
{
  return self->mPlacement;
}

@end