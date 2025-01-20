@interface PFXWidgetPlacement
+ (id)mapBackgroundShapeStyleWithStackEntry:(id)a3 readerState:(id)a4;
+ (id)mapDefaultBackgroundShapeWithPlacement:(id)a3 readerState:(id)a4;
+ (id)widgetPlacementWithDrawablePlacement:(id)a3 readerState:(id)a4;
- (BOOL)expandedOnly;
- (BOOL)hasChildrenForAdornmentInfo;
- (BOOL)useBackgroundShape;
- (NSArray)orderedChildDrawables;
- (NSString)contentLayout;
- (PFXWidgetPlacement)initWithInfoGeometry:(id)a3;
- (THWWidgetBackgroundInfo)backgroundShape;
- (TSDDrawableInfo)stageThumb;
- (TSDExteriorTextWrap)exteriorTextWrap;
- (TSDImageInfo)fallbackImage;
- (TSDInfo)expandedStageDrawable;
- (TSDInfo)stageDrawable;
- (TSDInfoGeometry)infoGeometry;
- (TSDInfoGeometry)stageGeometry;
- (TSWPShapeInfo)captionShape;
- (TSWPShapeInfo)titleShape;
- (double)contentPadding;
- (void)dealloc;
- (void)setBackgroundShape:(id)a3;
- (void)setCaptionShape:(id)a3;
- (void)setContentLayout:(id)a3;
- (void)setContentPadding:(double)a3;
- (void)setExpandedOnly:(BOOL)a3;
- (void)setExpandedStageDrawable:(id)a3;
- (void)setExteriorTextWrap:(id)a3;
- (void)setFallbackImage:(id)a3;
- (void)setInfoGeometry:(id)a3;
- (void)setOrderedChildDrawables:(id)a3;
- (void)setStageDrawable:(id)a3;
- (void)setStageGeometry:(id)a3;
- (void)setStageThumb:(id)a3;
- (void)setTitleShape:(id)a3;
- (void)setUseBackgroundShape:(BOOL)a3;
@end

@implementation PFXWidgetPlacement

- (PFXWidgetPlacement)initWithInfoGeometry:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFXWidgetPlacement;
  v4 = [(PFXWidgetPlacement *)&v6 init];
  if (v4) {
    v4->mInfoGeometry = (TSDInfoGeometry *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXWidgetPlacement;
  [(PFXWidgetPlacement *)&v3 dealloc];
}

- (BOOL)hasChildrenForAdornmentInfo
{
  return [(PFXWidgetPlacement *)self titleShape]
      || [(PFXWidgetPlacement *)self captionShape]
      || [(PFXWidgetPlacement *)self backgroundShape] != 0;
}

+ (id)mapBackgroundShapeStyleWithStackEntry:(id)a3 readerState:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet");
  id v6 = objc_alloc_init((Class)TSSPropertyMap);
  id v7 = +[PFXGraphicStyle mapStrokeFromStyleProperties:v5 contentState:a4];
  if (v7) {
    [v6 setObject:v7 forProperty:517];
  }
  id v8 = +[PFXGraphicStyle mapOpacityFromStyleProperties:v5];
  if (v8)
  {
    [v8 doubleValue];
    *(float *)&double v9 = v9;
    [v6 setFloatValue:518 forProperty:v9];
  }
  id v10 = +[PFXGraphicStyle mapShadowFromStyleProperties:v5 contentState:a4];
  if (v10) {
    [v6 setObject:v10 forProperty:520];
  }
  id v11 = +[PFXGraphicStyle mapFillFromStyleProperties:v5 contentState:a4];
  if (v11) {
    [v6 setObject:v11 forProperty:516];
  }
  id v12 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "stylesheet"), "styleWithIdentifier:", @"TSWWidgetBackgroundShapeStyle");
  if (!v12)
  {
    id v12 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:", objc_msgSend(a4, "tspContext"));
    [v12 setValue:[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.88627451, 0.91372549, 0.921568627, 1.0) forProperty:516];
    [v12 setValue:[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.682352941, 0.729411765, 0.745098039, 1.0), 1.0) forProperty:517];
    objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:withIdentifier:", v12, @"TSWWidgetBackgroundShapeStyle");
  }
  id v13 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "stylesheet"), "variationOfStyle:propertyMap:", v12, v6);

  return v13;
}

+ (id)mapDefaultBackgroundShapeWithPlacement:(id)a3 readerState:(id)a4
{
  id v7 = [a4 currentHtmlStackEntry];
  id v8 = [v7 valueForAttribute:PFXWidgetConstantDataCornerRadius[0]];
  if (v8)
  {
    [v8 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = 8.0;
  }
  id v11 = [a1 mapBackgroundShapeStyleWithStackEntry:v7 readerState:a4];
  id v12 = objc_alloc((Class)TSDInfoGeometry);
  objc_msgSend(objc_msgSend(a3, "infoGeometry"), "size");
  id v13 = [v12 initWithSize:];
  [v13 size];
  v16 = -[THWWidgetBackgroundInfo initWithContext:geometry:style:pathSource:]([THWWidgetBackgroundInfo alloc], "initWithContext:geometry:style:pathSource:", [a4 tspContext], v13, v11, +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", v10, v14, v15));

  return v16;
}

+ (id)widgetPlacementWithDrawablePlacement:(id)a3 readerState:(id)a4
{
  id v6 = [a4 currentHtmlStackEntry];
  id v7 = [v6 currentEntryMediaState];
  id v8 = -[PFXWidgetPlacement initWithInfoGeometry:]([PFXWidgetPlacement alloc], "initWithInfoGeometry:", [a3 infoGeometry]);
  -[PFXWidgetPlacement setStageGeometry:](v8, "setStageGeometry:", PFXTSDInfoGeometry((const char *)[v6 xmlValueForAttribute:PFXWidgetConstantDataStageGeometry[0]]));
  -[PFXWidgetPlacement setExteriorTextWrap:](v8, "setExteriorTextWrap:", [a3 exteriorTextWrap]);
  [(PFXWidgetPlacement *)v8 setExpandedOnly:+[PFXWidget isWidgetExpandedOnly:a4]];
  id v9 = [v7 childResultCount];
  id v46 = a4;
  [a4 applePubVersion];
  uint64_t v11 = (__PAIR128__((unint64_t)v9, v10) - COERCE_UNSIGNED_INT64(1.00999999)) >> 64;
  if (xmlStrEqual((const xmlChar *)[v6 xmlValueForAttribute:PFXWidgetConstantDataBackgroundEnabled[0]], (const xmlChar *)"yes"))
  {
    [(PFXWidgetPlacement *)v8 setUseBackgroundShape:1];
  }
  id v12 = +[NSMutableArray array];
  if (v11)
  {
    char v43 = 0;
    for (uint64_t i = 0; v11 != i; ++i)
    {
      objc_opt_class();
      [v7 childResultAtIndex:i];
      uint64_t v14 = TSUDynamicCast();
      if (v14)
      {
        double v15 = (THWWidgetBackgroundInfo *)v14;
        v16 = (const xmlChar *)objc_msgSend(objc_msgSend(v7, "xmlAttributeValueForResult:attributeName:", v14, PFXWidgetConstantDataWidgetObjectType[0]), "xmlString");
        if (xmlStrEqual(v16, (const xmlChar *)PFXWidgetConstantObjectValueTitle[0]))
        {
          objc_opt_class();
          [(PFXWidgetPlacement *)v8 setTitleShape:TSUDynamicCast()];
          goto LABEL_10;
        }
        if (xmlStrEqual(v16, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0]))
        {
          objc_opt_class();
          [(PFXWidgetPlacement *)v8 setCaptionShape:TSUDynamicCast()];
          goto LABEL_10;
        }
        if (xmlStrEqual(v16, (const xmlChar *)PFXWidgetConstantObjectValueBackground[0]))
        {
          objc_opt_class();
          [(PFXWidgetPlacement *)v8 setBackgroundShape:TSUDynamicCast()];
          if (![(PFXWidgetPlacement *)v8 backgroundShape])
          {
            objc_opt_class();
            uint64_t v19 = TSUDynamicCast();
            if (v19)
            {
              v20 = (void *)v19;
              v42 = [THWWidgetBackgroundInfo alloc];
              id v41 = [v46 tspContext];
              id v21 = [v20 geometry];
              id v22 = v6;
              id v23 = [v20 shapeStyle];
              id v24 = [v20 pathSource];
              id v25 = v23;
              id v6 = v22;
              [(PFXWidgetPlacement *)v8 setBackgroundShape:[(THWWidgetBackgroundInfo *)v42 initWithContext:v41 geometry:v21 style:v25 pathSource:v24]];
            }
          }
          if (![(PFXWidgetPlacement *)v8 useBackgroundShape]
            || ![(PFXWidgetPlacement *)v8 backgroundShape])
          {
            continue;
          }
          v18 = [(PFXWidgetPlacement *)v8 backgroundShape];
          v17 = v12;
          goto LABEL_11;
        }
        if (xmlStrEqual(v16, (const xmlChar *)PFXWidgetConstantObjectValueStageThumb[0]))
        {
          [(PFXWidgetPlacement *)v8 setStageThumb:v15];
LABEL_10:
          v17 = v12;
          v18 = v15;
LABEL_11:
          [v17 addObject:v18];
          continue;
        }
        if (!v16)
        {
          if (xmlStrEqual((const xmlChar *)objc_msgSend(objc_msgSend(v7, "xmlAttributeValueForResult:attributeName:", v15, PFXWidgetConstantDataFallbackImage[0]), "xmlString"), (const xmlChar *)"yes"))
          {
            objc_opt_class();
            [(PFXWidgetPlacement *)v8 setFallbackImage:TSUDynamicCast()];
            continue;
          }
          if ([(PFXWidgetPlacement *)v8 stageDrawable])
          {
            if (v43)
            {
              objc_opt_class();
              [(PFXWidgetPlacement *)v8 stageDrawable];
              id v26 = (id)TSUDynamicCast();
            }
            else
            {
              id v44 = v6;
              id v26 = objc_msgSend(objc_alloc((Class)TSDGroupInfo), "initWithContext:geometry:", objc_msgSend(v46, "tspContext"), -[TSDInfo geometry](-[PFXWidgetPlacement stageDrawable](v8, "stageDrawable"), "geometry"));
              v27 = [(PFXWidgetPlacement *)v8 stageDrawable];
              [v12 removeObjectIdenticalTo:v27];
              [(PFXWidgetPlacement *)v8 setStageDrawable:v26];
              [v12 addObject:v26];
              id v28 = [(TSDInfo *)v27 geometry];
              id v29 = [v26 geometry];
              v30 = v28;
              id v6 = v44;
              -[TSDInfo setGeometry:](v27, "setGeometry:", [v30 geometryRelativeToGeometry:v29]);
              [v26 addChildInfo:v27];
            }
            -[v15 setGeometry:[v15 geometry] geometryRelativeToGeometry:[v26 geometry]];
            [v26 addChildInfo:v15];
            char v43 = 1;
            continue;
          }
          [(PFXWidgetPlacement *)v8 setStageDrawable:v15];
          if (![(PFXWidgetPlacement *)v8 expandedOnly]) {
            goto LABEL_10;
          }
        }
      }
    }
  }
  [v46 applePubVersion];
  if (v31 < 1.00999999)
  {
    objc_opt_class();
    [v7 childResultAtIndex:v11];
    [(PFXWidgetPlacement *)v8 setFallbackImage:TSUDynamicCast()];
  }
  -[PFXWidgetPlacement setContentLayout:](v8, "setContentLayout:", [v6 valueForAttribute:PFXWidgetConstantDataContentLayout[0]]);
  if ([(PFXWidgetPlacement *)v8 useBackgroundShape])
  {
    if (![(PFXWidgetPlacement *)v8 backgroundShape])
    {
      -[PFXWidgetPlacement setBackgroundShape:](v8, "setBackgroundShape:", [a1 mapDefaultBackgroundShapeWithPlacement:a3 readerState:v46]);
      [v12 insertObject:[self backgroundShape] atIndex:0];
    }
    [(PFXWidgetPlacement *)v8 backgroundShape];
    if (objc_opt_respondsToSelector()) {
      -[THWWidgetBackgroundInfo performSelector:withObject:](-[PFXWidgetPlacement backgroundShape](v8, "backgroundShape"), "performSelector:withObject:", "setExteriorTextWrap:", [a3 exteriorTextWrap]);
    }
  }
  [(PFXWidgetPlacement *)v8 setOrderedChildDrawables:v12];
  if ([(PFXWidgetPlacement *)v8 expandedOnly])
  {
    [(PFXWidgetPlacement *)v8 setExpandedStageDrawable:[(PFXWidgetPlacement *)v8 stageDrawable]];
    -[TSDInfo setGeometry:](-[PFXWidgetPlacement expandedStageDrawable](v8, "expandedStageDrawable"), "setGeometry:", objc_msgSend(-[TSDInfo geometry](-[PFXWidgetPlacement stageDrawable](v8, "stageDrawable"), "geometry"), "copy"));
    if ([(PFXWidgetPlacement *)v8 stageThumb]) {
      [(PFXWidgetPlacement *)v8 setStageDrawable:[(PFXWidgetPlacement *)v8 stageThumb]];
    }
  }
  else if ([(PFXWidgetPlacement *)v8 fallbackImage])
  {
    id v32 = [(TSDInfoGeometry *)[(PFXWidgetPlacement *)v8 stageGeometry] geometryRelativeToGeometry:[(TSDImageInfo *)[(PFXWidgetPlacement *)v8 fallbackImage] geometry]];
    id v33 = v6;
    [v32 size];
    id v34 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:");
    id v35 = objc_alloc((Class)TSDMaskInfo);
    id v36 = [v46 tspContext];
    id v37 = v34;
    id v6 = v33;
    id v38 = [v35 initWithContext:v36 geometry:v32 pathSource:v37];
    [(TSDImageInfo *)[(PFXWidgetPlacement *)v8 fallbackImage] setMaskInfo:v38];
  }
  if ([(PFXWidgetPlacement *)v8 fallbackImage]) {
    [(TSDImageInfo *)[(PFXWidgetPlacement *)v8 fallbackImage] setExteriorTextWrap:+[TSDExteriorTextWrap exteriorTextWrap]];
  }
  id v39 = [v6 valueForAttribute:PFXWidgetConstantDataContentPadding[0]];
  if (v39)
  {
    [v39 doubleValue];
    -[PFXWidgetPlacement setContentPadding:](v8, "setContentPadding:");
  }
  return v8;
}

- (TSDInfo)stageDrawable
{
  return self->mStageDrawable;
}

- (void)setStageDrawable:(id)a3
{
}

- (TSDInfo)expandedStageDrawable
{
  return self->mExpandedStageDrawable;
}

- (void)setExpandedStageDrawable:(id)a3
{
}

- (TSDInfoGeometry)infoGeometry
{
  return self->mInfoGeometry;
}

- (void)setInfoGeometry:(id)a3
{
}

- (TSDInfoGeometry)stageGeometry
{
  return self->mStageGeometry;
}

- (void)setStageGeometry:(id)a3
{
}

- (TSWPShapeInfo)titleShape
{
  return self->mTitleShape;
}

- (void)setTitleShape:(id)a3
{
}

- (TSWPShapeInfo)captionShape
{
  return self->mCaptionShape;
}

- (void)setCaptionShape:(id)a3
{
}

- (THWWidgetBackgroundInfo)backgroundShape
{
  return self->mBackgroundShape;
}

- (void)setBackgroundShape:(id)a3
{
}

- (BOOL)useBackgroundShape
{
  return self->mUseBackgroundShape;
}

- (void)setUseBackgroundShape:(BOOL)a3
{
  self->mUseBackgroundShape = a3;
}

- (TSDDrawableInfo)stageThumb
{
  return self->mStageThumb;
}

- (void)setStageThumb:(id)a3
{
}

- (TSDImageInfo)fallbackImage
{
  return self->mFallbackImage;
}

- (void)setFallbackImage:(id)a3
{
}

- (NSArray)orderedChildDrawables
{
  return &self->mOrderedChildDrawables->super;
}

- (void)setOrderedChildDrawables:(id)a3
{
}

- (double)contentPadding
{
  return self->mContentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->mContentPadding = a3;
}

- (TSDExteriorTextWrap)exteriorTextWrap
{
  return self->mExteriorTextWrap;
}

- (void)setExteriorTextWrap:(id)a3
{
}

- (NSString)contentLayout
{
  return self->mContentLayout;
}

- (void)setContentLayout:(id)a3
{
}

- (BOOL)expandedOnly
{
  return self->_expandedOnly;
}

- (void)setExpandedOnly:(BOOL)a3
{
  self->_expandedOnly = a3;
}

@end