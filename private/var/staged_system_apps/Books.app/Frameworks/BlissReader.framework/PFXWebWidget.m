@interface PFXWebWidget
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXWebWidget

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  id v7 = +[PFXWidget urlForDataBundleWithState:a3];
  v8 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", [a3 tspContext]);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v8);
  id v9 = PFXTSDInfoGeometry((const char *)[v5 valueForAttribute:[PFXWidgetConstantDataStageGeometry[0] UTF8String]]);
  v10 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantDataNotifiesOnReady[0]];
  BOOL v30 = v10 && *v10 && xmlStrEqual(v10, (const xmlChar *)"yes") != 0;
  [a3 applePubVersion];
  double v12 = v11;
  v13 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantAllowNetworkAccess];
  id v31 = v7;
  id v32 = v6;
  v14 = self;
  if (v13) {
    BOOL v15 = xmlStrEqual(v13, (const xmlChar *)"yes") != 0;
  }
  else {
    BOOL v15 = 1;
  }
  v16 = +[PFXAutoplayConfig autoplayConfigWithState:a3];
  v17 = [THWWebInfo alloc];
  id v18 = [a3 tspContext];
  v19 = [(PFXDrawablePlacement *)v14->super.super.mPlacement infoGeometry];
  id v20 = objc_msgSend(objc_msgSend(a3, "archive"), "drmContext");
  BYTE1(v29) = v15;
  LOBYTE(v29) = v12 <= 1.01;
  v21 = v17;
  v22 = v14;
  v23 = -[THWWebInfo initWithContext:geometry:stageGeometry:sourceURL:drmContext:exposurePolicy:ignoreInfoPlist:allowNetworkAccess:autoplayConfig:](v21, "initWithContext:geometry:stageGeometry:sourceURL:drmContext:exposurePolicy:ignoreInfoPlist:allowNetworkAccess:autoplayConfig:", v18, v19, v9, v31, v20, v30, v29, v16);

  -[THWWebInfo setProgressKitID:](v23, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v5 xmlElementId]));
  -[THWWebInfo setProgressKitSectionID:](v23, "setProgressKitSectionID:", [a3 nodeGUID]);
  v24 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:v22->super.super.mPlacement readerState:a3];
  if ([(PFXWidgetPlacement *)v24 hasChildrenForAdornmentInfo]) {
    [(THWWebInfo *)v23 setAdornmentInfo:+[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:v24 readerState:a3]];
  }
  [a3 setUniqueIdForInfo:v23 fromStackEntry:v5];
  [a3 setCfiPathForInfo:v23 fromStackEntry:v5];
  if (+[PFXWidget isWidgetExpandedOnly:a3])
  {
    v25 = +[PFXWidget drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:](PFXWebWidget, "drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](v22->super.super.mPlacement, "infoGeometry"), objc_msgSend(v5, "titleAttributeValue"), -[PFXWidgetPlacement stageDrawable](v24, "stageDrawable"), v23);
    [(THWWebInfo *)v25 setAdornmentInfo:[(THWWebInfo *)v23 adornmentInfo]];
    [(THWWidgetAdornmentInfo *)[(THWWebInfo *)v25 adornmentInfo] updateParentInfo:v25];
    v26 = (TSDDrawableInfo *)[(THWWebInfo *)v25 stageDrawable];
    v27 = v32;
  }
  else
  {
    [(THWWidgetAdornmentInfo *)[(THWWebInfo *)v23 adornmentInfo] updateParentInfo:v23];
    v25 = v23;
    v27 = v32;
    if (![(PFXWidgetPlacement *)v24 stageThumb]) {
      goto LABEL_15;
    }
    v26 = [(PFXWidgetPlacement *)v24 stageThumb];
    v25 = v23;
  }
  [(THWWebInfo *)v23 setPlaceholderInfo:v26];
LABEL_15:
  [v27 setResult:v25];
  objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "setResult:", v25);

  mPlacement = v22->super.super.mPlacement;

  [(PFXDrawablePlacement *)mPlacement mapEndElementWithState:a3];
}

@end