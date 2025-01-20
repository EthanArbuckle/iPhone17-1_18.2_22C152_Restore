@interface PFXShape
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXShape

- (void)mapEndElementWithState:(id)a3
{
  id v64 = [a3 currentHtmlDocMediaState];
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  id v7 = [v6 propertySet];
  v65 = v6;
  if (xmlStrEqual((const xmlChar *)[v5 xmlElementName], (const xmlChar *)"path"))
  {
    v8 = (TSDBezierPath *)PFXBezierPathWithSvgPath((const xmlChar *)[v5 xmlValueForAttribute:"d"]);
LABEL_3:
    v9 = v8;
    goto LABEL_4;
  }
  if (xmlStrEqual((const xmlChar *)[v5 xmlElementName], (const xmlChar *)"rect"))
  {
    +[PFXDrawablePlacement boundsWithStackEntry:v5 readerState:a3];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    objc_msgSend(objc_msgSend(v5, "valueForAttribute:", "rx"), "doubleValue");
    double v20 = v19;
    objc_msgSend(objc_msgSend(v5, "valueForAttribute:", "ry"), "doubleValue");
    if (v20 * v21 == 0.0)
    {
      v8 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v12, v14, v16, v18);
      goto LABEL_3;
    }
    memset(&v73, 0, sizeof(v73));
    CGAffineTransformMakeScale(&v73, 100.0 / v20, 100.0 / v21);
    CGAffineTransform v72 = v73;
    v74.origin.x = v12;
    v74.origin.CGFloat y = v14;
    v74.size.width = v16;
    v74.size.height = v18;
    CGRectApplyAffineTransform(v74, &v72);
    v60 = (const CGPath *)TSDCreateRoundRectPathForRectWithRadius();
    v9 = +[TSDBezierPath bezierPathWithCGPath:v60];
    CGPathRelease(v60);
    CGAffineTransform v70 = v73;
    CGAffineTransformInvert(&v71, &v70);
    [(TSDBezierPath *)v9 transformUsingAffineTransform:&v71];
  }
  else
  {
    v9 = 0;
  }
LABEL_4:
  [(TSDBezierPath *)v9 bounds];
  -[PFXDrawablePlacement setBounds:](self->super.mPlacement, "setBounds:");
  mPlacement = self->super.mPlacement;
  if (mPlacement)
  {
    [(PFXDrawablePlacement *)mPlacement affineTransform];
    mPlacement = self->super.mPlacement;
  }
  else
  {
    memset(v69, 0, sizeof(v69));
  }
  [(PFXDrawablePlacement *)mPlacement bounds];
  [(PFXDrawablePlacement *)self->super.mPlacement setInfoGeometry:+[PFXDrawablePlacement affineGeometryWithAffineTransform:appliedToBounds:](PFXDrawablePlacement, "affineGeometryWithAffineTransform:appliedToBounds:", v69)];
  CGFloat y = CGPointZero.y;
  [(TSDInfoGeometry *)[(PFXDrawablePlacement *)self->super.mPlacement infoGeometry] size];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [(PFXDrawablePlacement *)self->super.mPlacement bounds];
  -[TSDBezierPath transformUsingAffineTransform:](v9, "transformUsingAffineTransform:", v68, mapSrcRectOntoDstRect((uint64_t)v68, v27, v28, v29, v30, CGPointZero.x, y, v24, v26));
  id v66 = [objc_alloc((Class)TSDBezierPathSource) initWithBezierPath:v9];
  id v31 = objc_alloc_init((Class)TSSPropertyMap);
  id v32 = +[PFXGraphicStyle mapStrokeFromStyleProperties:v7 contentState:a3];
  if (v32) {
    [v31 setObject:v32 forProperty:517];
  }
  id v33 = +[PFXGraphicStyle mapShadowFromStyleProperties:v7 contentState:a3];
  if (v33) {
    [v31 setObject:v33 forProperty:520];
  }
  id v34 = +[PFXGraphicStyle mapFillFromStyleProperties:v7 contentState:a3];
  if (v34) {
    [v31 setObject:v34 forProperty:516];
  }
  id v35 = +[PFXGraphicStyle mapReflectionFromStyleProperties:v7];
  if (v35) {
    [v31 setObject:v35 forProperty:519];
  }
  id v36 = +[PFXGraphicStyle mapOpacityFromStyleProperties:v7];
  if (v36)
  {
    [v36 doubleValue];
    *(float *)&double v37 = v37;
    [v31 setFloatValue:518 forProperty:v37];
  }
  id v38 = +[PFXGraphicStyle mapMarkerProperty:"marker-start" fromStyleProperties:v7 contentState:a3];
  id v39 = +[PFXGraphicStyle mapMarkerProperty:"marker-end" fromStyleProperties:v7 contentState:a3];
  id v40 = [v5 parentHtmlStackEntry];
  [a3 drawableReaderForCurrentMediaStateWithStackEntry:v40];
  objc_opt_class();
  v61 = v5;
  id v62 = v39;
  id v63 = v38;
  if (objc_opt_isKindOfClass())
  {
    [a3 drawableReaderForCurrentMediaStateWithStackEntry:[v40 parentHtmlStackEntry]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = 0;
      int v41 = 0;
      int v42 = 1;
      int v43 = 1;
      v44 = (Class *)TSWPShapeStyle_ptr;
    }
    else
    {
      v45 = (const xmlChar *)[v40 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
      if (v45
        && ((v46 = v45, xmlStrEqual(v45, (const xmlChar *)PFXWidgetConstantObjectValueTitle[0]))
         || xmlStrEqual(v46, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0])))
      {
        int v42 = 1;
        v44 = (Class *)TSWPShapeStyle_ptr;
      }
      else
      {
        int v42 = 0;
        v44 = (Class *)TSDShapeStyle_ptr;
      }
      v47 = v61;
      int v43 = 0;
      if (objc_msgSend(v61, "xmlElementId", v61)) {
        id v5 = v47;
      }
      else {
        id v5 = v40;
      }
      int v41 = v42;
    }
  }
  else
  {
    int v42 = 0;
    int v41 = 0;
    int v43 = 0;
    v44 = (Class *)TSDShapeStyle_ptr;
  }
  id v48 = [objc_alloc(*v44) initWithContext:[a3 tspContext] name:0 overridePropertyMap:v31 isVariation:0];
  objc_msgSend(objc_msgSend(v64, "stylesheet"), "addStyle:", v48);

  if (v42)
  {
    id v49 = objc_alloc((Class)TSWPShapeInfo);
    id v50 = [a3 tspContext];
    v51 = [(PFXDrawablePlacement *)self->super.mPlacement infoGeometry];
    id v52 = v50;
    v53 = v66;
    id v54 = [v49 initWithContext:v52 geometry:v51 style:v48 pathSource:v66 wpStorage:0];
    [v54 setTextUserEditable:0];
    if (((v43 | v41 ^ 1) & 1) == 0)
    {
      v55 = [[THWPStorage alloc] initWithContext:[a3 tspContext] string:&stru_46D7E8 stylesheet:[v64 stylesheet] kind:3];
      [v54 setContainedStorage:v55];
      [a3 setUniqueIdForInfo:v55 withPostfix:@"storage" fromStackEntry:v5];
      [a3 setCfiPathForInfo:v55 fromStackEntry:v61];

      v53 = v66;
    }
  }
  else
  {
    id v56 = objc_alloc((Class)TSDShapeInfo);
    id v57 = [a3 tspContext];
    v58 = [(PFXDrawablePlacement *)self->super.mPlacement infoGeometry];
    v59 = v56;
    v53 = v66;
    id v54 = [v59 initWithContext:v57 geometry:v58 style:v48 pathSource:v66];
  }
  [v54 setTailLineEnd:v63, v61];
  [v54 setHeadLineEnd:v62];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a3 setUniqueIdForInfo:v54 fromStackEntry:v5];
    }
  }
  [v65 setResult:v54];

  v67.receiver = self;
  v67.super_class = (Class)PFXShape;
  [(PFXDrawable *)&v67 mapEndElementWithState:a3];
}

@end