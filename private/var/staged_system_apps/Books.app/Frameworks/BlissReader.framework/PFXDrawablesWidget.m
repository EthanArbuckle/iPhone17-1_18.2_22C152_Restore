@interface PFXDrawablesWidget
+ (id)adornmentInfoWithWidgetPlacement:(id)a3 readerState:(id)a4;
- (BOOL)isAudioOnlyWithPosterImage:(id)a3;
- (BOOL)mapStartElementWithState:(id)a3;
- (PFXDrawablePlacement)placement;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXDrawablesWidget

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXDrawablesWidget;
  [(PFXDrawablesWidget *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->mDrawablePlacement = v5;
  unsigned __int8 v6 = [(PFXDrawablePlacement *)v5 mapStartElementWithState:a3];
  id v7 = [a3 currentHtmlDocMediaState];
  if ([(PFXDrawablePlacement *)self->mDrawablePlacement mode] == 2)
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

- (BOOL)isAudioOnlyWithPosterImage:(id)a3
{
  objc_opt_class();
  [a3 expandedStageDrawable];
  unsigned int v4 = [(id)TSUDynamicCast() isAudioOnly];
  if (v4)
  {
    objc_opt_class();
    [a3 stageDrawable];
    LOBYTE(v4) = TSUDynamicCast() != 0;
  }
  return v4;
}

- (void)mapEndElementWithState:(id)a3
{
  v5 = -[THWDrawablesWidgetInfo initWithContext:geometry:]([THWDrawablesWidgetInfo alloc], "initWithContext:geometry:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->mDrawablePlacement, "infoGeometry"));
  unsigned __int8 v6 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:self->mDrawablePlacement readerState:a3];
  [(THWDrawablesWidgetInfo *)v5 setContainerWrap:[(NSString *)[(PFXWidgetPlacement *)v6 contentLayout] isEqualToString:@"freeform"] ^ 1];
  id v7 = [a3 currentHtmlStackEntry];
  id v8 = [v7 valueForAttribute:"title"];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(THWDrawablesWidgetInfo *)v5 accessibilityDescriptions];
    if (!v10)
    {
      id v10 = (id)objc_opt_new();
      [(THWDrawablesWidgetInfo *)v5 setAccessibilityDescriptions:v10];
    }
    [v10 setObject:v9 forKey:@"widgetTitle"];
  }
  [(PFXWidgetPlacement *)v6 stageDrawable];
  v11 = (void *)TSUProtocolCast();
  if (v11) {
    [v11 setAutoplayConfig:[PFXAutoplayConfig autoplayConfigWithState:a3]];
  }
  [(THWDrawablesWidgetInfo *)v5 setStageDrawable:[(PFXWidgetPlacement *)v6 stageDrawable]];
  [(THWDrawablesWidgetInfo *)v5 setExpandedStageDrawable:[(PFXWidgetPlacement *)v6 expandedStageDrawable]];
  [(THWDrawablesWidgetInfo *)v5 setExpandedOnly:[(PFXWidgetPlacement *)v6 expandedOnly]];
  if ([(PFXDrawablesWidget *)self isAudioOnlyWithPosterImage:v5])
  {
    objc_opt_class();
    [(THWDrawablesWidgetInfo *)v5 expandedStageDrawable];
    v12 = (void *)TSUDynamicCast();
    objc_opt_class();
    [(THWDrawablesWidgetInfo *)v5 stageDrawable];
    v13 = (void *)TSUDynamicCast();
    [v12 setPosterImageData:[v13 imageData]];
    [v12 setPosterImageInfo:v13];
    [v12 setGeometry:[v13 geometry]];
    [(THWDrawablesWidgetInfo *)v5 setStageDrawable:v12];
    [(THWDrawablesWidgetInfo *)v5 setExpandedStageDrawable:0];
  }
  if ([(PFXWidgetPlacement *)v6 hasChildrenForAdornmentInfo]
    || [(THWDrawablesWidgetInfo *)v5 containerWrap])
  {
    -[THWDrawablesWidgetInfo setAdornmentInfo:](v5, "setAdornmentInfo:", [(id)objc_opt_class() adornmentInfoWithWidgetPlacement:v6 readerState:a3]);
    [(THWWidgetAdornmentInfo *)[(THWDrawablesWidgetInfo *)v5 adornmentInfo] updateParentInfo:v5];
    v14 = [(THWWidgetAdornmentInfo *)[(THWDrawablesWidgetInfo *)v5 adornmentInfo] title];
    if (v14)
    {
      id v15 = [(TSWPShapeInfo *)v14 containedStorage];
      id v16 = [a3 ancestorEntryWithReaderClass:objc_opt_class()];
      objc_opt_class();
      [v16 reader];
      v17 = (void *)TSUDynamicCast();
      if (v17) {
        [v17 setGutterTitleStorage:v15];
      }
    }
  }
  objc_msgSend(objc_msgSend(v7, "currentEntryMediaState"), "setResult:", v5);
  mDrawablePlacement = self->mDrawablePlacement;

  [(PFXDrawablePlacement *)mDrawablePlacement mapEndElementWithState:a3];
}

+ (id)adornmentInfoWithWidgetPlacement:(id)a3 readerState:(id)a4
{
  v5 = objc_alloc_init(THWWidgetAdornmentInfo);
  [a3 contentPadding];
  -[THWWidgetAdornmentInfo setContentPadding:](v5, "setContentPadding:");
  -[THWWidgetAdornmentInfo setExteriorTextWrap:](v5, "setExteriorTextWrap:", [a3 exteriorTextWrap]);
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = [a3 orderedChildDrawables];
  id v8 = [a3 titleShape];
  if (v8)
  {
    id v9 = v8;
    [v6 setObject:v8 forKey:[NSNumber numberWithInteger:[v7 indexOfObject:v8]]];
    [(THWWidgetAdornmentInfo *)v5 setTitle:v9];
  }
  id v10 = [a3 captionShape];
  if (v10)
  {
    id v11 = v10;
    [v6 setObject:v10 forKey:[NSNumber numberWithInteger:[v7 indexOfObject:v10]]];
    [(THWWidgetAdornmentInfo *)v5 setCaption:v11];
  }
  if ([a3 useBackgroundShape])
  {
    id v12 = [a3 backgroundShape];
    [v6 setObject:v12 forKey:[NSNumber numberWithInteger:[v7 indexOfObject:v12]]];
    [(THWWidgetAdornmentInfo *)v5 setBackground:v12];
  }
  [(THWWidgetAdornmentInfo *)v5 setInsertionOrder:v6];

  return v5;
}

- (PFXDrawablePlacement)placement
{
  return self->mDrawablePlacement;
}

@end