@interface PFAIAnchoredDrawable
- (BOOL)mapStartElementWithState:(id)a3;
- (TSWPStorage)gutterTitleStorage;
- (id)movieInfoForDrawableWidgetInfo:(id)a3;
- (id)sceneInfoForDrawableWidgetInfo:(id)a3;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
- (void)setGutterTitleStorage:(id)a3;
@end

@implementation PFAIAnchoredDrawable

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIAnchoredDrawable;
  [(PFAIAnchoredDrawable *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (id)movieInfoForDrawableWidgetInfo:(id)a3
{
  objc_opt_class();
  [a3 stageDrawable];
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    objc_opt_class();
    [a3 expandedStageDrawable];
    return (id)TSUDynamicCast();
  }
  return result;
}

- (id)sceneInfoForDrawableWidgetInfo:(id)a3
{
  objc_opt_class();
  [a3 stageDrawable];
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    objc_opt_class();
    [a3 expandedStageDrawable];
    return (id)TSUDynamicCast();
  }
  return result;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  if (objc_msgSend(objc_msgSend(v5, "flowState"), "childResultCount") == (char *)&dword_0 + 1
    && objc_msgSend(objc_msgSend(v5, "paginatedState"), "childResultCount") == (char *)&dword_0 + 2)
  {
    objc_opt_class();
    objc_msgSend(objc_msgSend(v5, "flowState"), "childResultAtIndex:", 0);
    v6 = (void *)TSUDynamicCast();
    if (v6)
    {
      v7 = v6;
      if ((unint64_t)[v6 count] >= 4)
      {
        id v81 = objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet");
        objc_opt_class();
        [v7 objectAtIndex:0];
        uint64_t v82 = TSUDynamicCast();
        objc_opt_class();
        [v7 objectAtIndex:1];
        uint64_t v8 = TSUDynamicCast();
        if ((unint64_t)[v7 count] >= 3)
        {
          v80 = (void *)v8;
          v9 = 0;
          uint64_t v10 = 0;
          unint64_t v11 = 2;
          do
          {
            objc_opt_class();
            [v7 objectAtIndex:v11];
            uint64_t v12 = TSUDynamicCast();
            if (v12)
            {
              v9 = (void *)v12;
            }
            else
            {
              objc_opt_class();
              [v7 objectAtIndex:v11];
              uint64_t v13 = TSUDynamicCast();
              if (v13) {
                uint64_t v10 = v13;
              }
            }
            ++v11;
          }
          while (v11 < (unint64_t)[v7 count]);
          if (v9) {
            BOOL v14 = v10 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14)
          {
            v15 = (char *)[v7 count];
            id v16 = objc_msgSend(objc_msgSend(v5, "paginatedState"), "childResultAtIndex:", 0);
            v79 = (void *)TSUProtocolCast();
            v17 = -[THWGutterInfo initWithContext:geometry:]([THWGutterInfo alloc], "initWithContext:geometry:", [a3 tspContext], v80);
            v76 = v15;
            v83 = v17;
            if (v15 == (unsigned char *)&dword_4 + 1)
            {
              objc_opt_class();
              [v7 objectAtIndex:2];
              -[THWGutterInfo setGutterOrder:](v83, "setGutterOrder:", [(id)TSUDynamicCast() integerValue]);
              v17 = v83;
            }
            v78 = v16;
            [(THWGutterInfo *)v17 setAssociatedInfo:v16];
            [a3 addGutterInfo:v83];
            +[PFXFrameStyle mapContentPaddingFromStyleProperties:v82 contentState:a3];
            double v19 = v18;
            +[PFXFrameStyle mapRadiusFromStyleProperties:v82 contentState:a3];
            double v21 = v20;
            [v80 size];
            double v23 = v22;
            objc_msgSend(objc_msgSend(v9, "geometry"), "size");
            if (v23 >= v24 + v19 * 2.0)
            {
              objc_msgSend(objc_msgSend(v9, "geometry"), "size");
              double v26 = v27 + v19 * 2.0;
            }
            else
            {
              [v80 size];
              double v26 = v25;
            }
            [v80 size];
            double v29 = (v28 - v26) * 0.5;
            objc_msgSend(objc_msgSend(v9, "geometry"), "size");
            double v31 = v30 + v19 * 2.0;
            id v32 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:v29 size:0.0 v26 v31];
            id v77 = +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", v21, v26, v31);
            id v33 = [v81 styleWithIdentifier:@"TSWWidgetBackgroundShapeStyle"];
            if (!v33)
            {
              id v33 = [objc_alloc((Class)TSDShapeStyle) initWithContext:[a3 tspContext]];
              [v33 setValue:[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.88627451, 0.91372549, 0.921568627, 1.0) forProperty:516];
              [v33 setValue:[+[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.682352941, 0.729411765, 0.745098039, 1.0), 1.0) forProperty:517];
              [v33 setValue:[TSDShadow defaultDisabledShadow] forProperty:520];
              [v81 addStyle:v33 withIdentifier:@"TSWWidgetBackgroundShapeStyle"];
            }
            id v34 = objc_alloc_init((Class)TSSPropertyMap);
            id v35 = +[PFXGraphicStyle mapStrokeFromStyleProperties:v82 contentState:a3];
            if (v35) {
              [v34 setObject:v35 forProperty:517];
            }
            id v36 = +[PFXGraphicStyle mapShadowFromStyleProperties:v82 contentState:a3];
            if (v36) {
              [v34 setObject:v36 forProperty:520];
            }
            id v37 = +[PFXGraphicStyle mapFillFromStyleProperties:v82 contentState:a3];
            if (v37) {
              [v34 setObject:v37 forProperty:516];
            }
            id v38 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, v34, 1);
            [v81 addStyle:v38 withParent:v33];

            id v39 = objc_msgSend(objc_alloc((Class)TSDShapeInfo), "initWithContext:geometry:style:pathSource:", objc_msgSend(a3, "tspContext"), v32, v38, v77);
            [(THWGutterInfo *)v83 addChildInfo:v39];
            [(THWGutterInfo *)v83 setBackgroundShape:v39];

            if (self->mGutterTitleStorage && v79)
            {
              v40 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", [a3 tspContext], -[TSWPStorage string](self->mGutterTitleStorage, "string"), v81, -[TSWPStorage wpKind](self->mGutterTitleStorage, "wpKind"));
              id v41 = [(TSWPStorage *)self->mGutterTitleStorage range];
              -[THWPStorage replaceCharactersInRange:withStorage:usePasteRules:dolcContext:undoTransaction:](v40, "replaceCharactersInRange:withStorage:usePasteRules:dolcContext:undoTransaction:", v41, v42, self->mGutterTitleStorage, 0, 0, 0);
              id v43 = [(THWPStorage *)v40 range];
              -[THWPStorage setParagraphStyle:forCharRange:undoTransaction:](v40, "setParagraphStyle:forCharRange:undoTransaction:", v10, v43, v44, 0);
              [a3 setPaginatedAsCurrent];
              id v45 = objc_msgSend(objc_msgSend(a3, "currentDocOrientationState"), "contentNodeBody");
              id v46 = [[[v79 adornmentInfo] title] containedStorage];
              if (v46)
              {
                v47 = (NSString *)[v45 nodeUniqueIDForInfo:v46];
                v48 = v80;
              }
              else
              {
                id v49 = [v5 xmlElementId];
                v48 = v80;
                if (v49) {
                  v50 = +[NSString stringWithFormat:@"%s-guttertitle", v49];
                }
                else {
                  v50 = +[NSString stringWithUUID];
                }
                v47 = v50;
              }
              [a3 setFlowAsCurrent];
              objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentDocOrientationState"), "contentNodeBody"), "setNodeUniqueID:forInfo:", v47, v40);
              [a3 setUniqueIdForInfo:v40 withPostfix:0 fromStackEntry:v5];
              [v48 size];
              id v52 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:1, 0, 0, 0, 0.0, v19 + v31, v51, 1.0, 0.0];
              id v53 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(a3, "tspContext"), v52, objc_msgSend(objc_msgSend(objc_msgSend(v79, "adornmentInfo"), "title"), "tswpShapeStyle"), v40);

              [v53 setTextUserEditable:0];
              [v53 setAllowsLastLineTruncation:1];
              [v53 setMaxLineCount:3];
              [v53 setVerticalAlignment:0];
              [(THWGutterInfo *)v83 addChildInfo:v53];
              [(THWGutterInfo *)v83 setTitleShape:v53];
            }
            objc_opt_class();
            v54 = (void *)TSUDynamicCast();
            id v55 = [(PFAIAnchoredDrawable *)self movieInfoForDrawableWidgetInfo:v54];
            id v56 = [(PFAIAnchoredDrawable *)self sceneInfoForDrawableWidgetInfo:v54];
            id v57 = objc_msgSend(v55, "copyWithContext:stylesheet:", objc_msgSend(v55, "context"), objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"));
            id v58 = v78;
            if (v54)
            {
              id v59 = [v54 expandedStageDrawable:v78];
              id v58 = v78;
              if (v59)
              {
                id v60 = objc_msgSend(objc_msgSend(v54, "expandedStageDrawable", v78), "repClass");
                char v61 = (objc_opt_respondsToSelector() & 1) != 0
                    ? [v60 expandedAllowsPresentationInExpandedForInfo:[v54 expandedStageDrawable] isReflowablePresentation:0] ^ 1: 0;
                unsigned int v62 = [v60 conformsToProtocol:&OBJC_PROTOCOL___THWExpandedRep];
                id v58 = v78;
                if (v62)
                {
                  id v58 = v78;
                  if ((v61 & 1) == 0) {
                    id v58 = [v54 expandedStageDrawable:v78];
                  }
                }
              }
            }
            [(THWGutterInfo *)v83 setExpandedDrawableToPresent:v58];
            id v63 = objc_msgSend(objc_msgSend(v9, "geometry"), "mutableCopy");
            if ([v57 isAudioOnly])
            {
              [(THWGutterInfo *)v83 addChildInfo:v57];
              if ([v57 posterImageData])
              {
                objc_opt_class();
                [v57 setPosterImageInfo:TSUDynamicCast()];
              }
              [(THWGutterInfo *)v83 setStageInfo:v57];
              v64 = v76;
              if ([v57 controlStyle] == 1) {
                [v57 setControlStyle:2];
              }
            }
            else
            {
              [(THWGutterInfo *)v83 addChildInfo:v9];
              [(THWGutterInfo *)v83 setStageInfo:v9];
              if (v57)
              {
                [(THWGutterInfo *)v83 setExpandedDrawableToPresent:v57];
                [v57 setParentInfo:v54];
              }
              v64 = v76;
              if (v56) {
                [(THWGutterInfo *)v83 setExpandedDrawableToPresent:v56];
              }
            }
            [v63 size];
            double v66 = v65;
            [(-[THWGutterInfo geometry](v83, "geometry")) size];
            BOOL v68 = v66 < v67 + v19 * -2.0;
            double v69 = v19;
            if (v68)
            {
              [v83 geometry:v19 size];
              [v63 size];
              TSDFloorForMainScreen();
            }
            [v63 setPosition:v69, v19];
            [(TSDDrawableInfo *)[(THWGutterInfo *)v83 stageInfo] setGeometry:v63];

            id v70 = objc_msgSend(objc_msgSend(a3, "flowState"), "characterPositionForDrawableAnchorId:", objc_msgSend(v5, "valueForAttribute:", "data-anchor-ref"));
            if (v70 == (id)0x7FFFFFFFFFFFFFFFLL) {
              [(THWGutterInfo *)v83 setGutterOrder:0x7FFFFFFFFFFFFFFFLL];
            }
            id v71 = objc_msgSend(objc_msgSend(a3, "flowState"), "contentNodeBody");
            v72 = v71;
            if (v79)
            {
              [v71 setExpandedDrawable:forWidgetInfo:v83];
              [v72 setExpandedDrawable:[v83 expandedDrawableToPresent] forWidgetInfo:[v83 expandedDrawableToPresent]];
            }
            if (v57 && ([v57 isAudioOnly] & 1) == 0) {
              [v72 setExpandedDrawable:[v83 expandedDrawableToPresent] forWidgetInfo:[v83 expandedDrawableToPresent]];
            }
            id v73 = [v72 gutterDrawableStorage];
            v74 = v73;
            if (v64 == (unsigned char *)&dword_4 + 1) {
              [v73 setShouldUseGutterOrder:1];
            }
            v75 = -[THWGutterObjectPositioning initWithContext:]([THWGutterObjectPositioning alloc], "initWithContext:", [v78 context]);
            [v80 position];
            -[THWGutterObjectPositioning setOffset:](v75, "setOffset:");
            [(THWGutterObjectPositioning *)v75 setBodyCharIndex:v70];
            [v74 addDrawable:v83 positioning:v75 insertContext:0];
          }
        }
      }
    }
  }
}

- (TSWPStorage)gutterTitleStorage
{
  return self->mGutterTitleStorage;
}

- (void)setGutterTitleStorage:(id)a3
{
}

@end