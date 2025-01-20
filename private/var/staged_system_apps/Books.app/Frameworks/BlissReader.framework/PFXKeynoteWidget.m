@interface PFXKeynoteWidget
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXKeynoteWidget

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = +[PFXWidget urlForDataBundleWithState:a3];
  v7 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", [a3 tspContext]);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v7);
  v8 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:self->super.super.mPlacement readerState:a3];
  id v9 = [v5 valueForAttribute:PFXWidgetConstantDataStageGeometry[0]];
  if (v9)
  {
    v22 = -[THWKeynoteShowInfo initWithContext:geometry:sourceURL:drmContext:]([THWKeynoteShowInfo alloc], "initWithContext:geometry:sourceURL:drmContext:", [a3 tspContext], PFXTSDInfoGeometry((const char *)objc_msgSend(v9, "UTF8String")), v6, objc_msgSend(objc_msgSend(a3, "archive"), "drmContext"));
    id v10 = [v5 valueForAttribute:PFXWidgetConstantKeynoteShowTransportControls[0]];
    if (v10) {
      id v11 = [v10 isEqualToString:@"yes"];
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
    v22 = 0;
  }
  v21 = v8;
  if ([(PFXWidgetPlacement *)v8 hasChildrenForAdornmentInfo])
  {
    id v12 = +[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:v8 readerState:a3];
    id v13 = [v12 title];
    v14 = v7;
    if (v13)
    {
      id v20 = [v13 containedStorage];
      id v15 = [a3 ancestorEntryWithReaderClass:objc_opt_class()];
      objc_opt_class();
      [v15 reader];
      v16 = (void *)TSUDynamicCast();
      if (v16) {
        [v16 setGutterTitleStorage:v20];
      }
    }
  }
  else
  {
    v14 = v7;
    id v12 = 0;
  }
  v17 = -[THWKeynoteInfo initWithContext:geometry:style:showInfo:adornmentInfo:showTransportControls:autoPlayConfig:]([THWKeynoteInfo alloc], "initWithContext:geometry:style:showInfo:adornmentInfo:showTransportControls:autoPlayConfig:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->super.super.mPlacement, "infoGeometry"), v14, v22, v12, v11, +[PFXAutoplayConfig autoplayConfigWithState:](PFXAutoplayConfig, "autoplayConfigWithState:", a3));
  -[THWKeynoteInfo setProgressKitID:](v17, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v5 xmlElementId]));
  -[THWKeynoteInfo setProgressKitSectionID:](v17, "setProgressKitSectionID:", [a3 nodeGUID]);
  v18 = v17;
  if (+[PFXWidget isWidgetExpandedOnly:a3])
  {
    v18 = +[PFXWidget drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:](PFXKeynoteWidget, "drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->super.super.mPlacement, "infoGeometry"), objc_msgSend(v5, "titleAttributeValue"), -[PFXWidgetPlacement stageDrawable](v21, "stageDrawable"), v17);
    [(THWKeynoteInfo *)v18 setAdornmentInfo:[(THWKeynoteInfo *)v17 adornmentInfo]];
    [(THWWidgetAdornmentInfo *)[(THWKeynoteInfo *)v18 adornmentInfo] updateParentInfo:v18];
  }
  [a3 setUniqueIdForInfo:v18 fromStackEntry:v5];
  objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "setResult:", v18);

  mPlacement = self->super.super.mPlacement;

  [(PFXDrawablePlacement *)mPlacement mapEndElementWithState:a3];
}

@end