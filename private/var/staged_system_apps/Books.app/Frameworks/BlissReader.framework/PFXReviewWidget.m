@interface PFXReviewWidget
+ (id)questionTypeFromQuestionType:(int)a3 answersAreText:(BOOL)a4;
+ (void)mapAnswer:(id)a3 toChoice:(id)a4 questionType:(int)a5;
- (BOOL)mapStartElementWithState:(id)a3;
- (PFXDrawablePlacement)placement;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXReviewWidget

+ (id)questionTypeFromQuestionType:(int)a3 answersAreText:(BOOL)a4
{
  if (a3 == 2)
  {
    if (a4) {
      v4 = &TSWReviewQuestionDescriptionTypeAssociativeTokenValue;
    }
    else {
      v4 = &TSWReviewQuestionDescriptionTypeAssociativeImageValue;
    }
  }
  else
  {
    if (a3 != 1)
    {
      [TSUAssertionHandler currentHandler][TSUAssertionHandler handleFailureInFunction:@"+[NSString stringWithUTF8String:]" file:@"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXReviewWidget.mm" lineNumber:463 description:@"PFXReviewWidget: bad question type"];
      return 0;
    }
    if (a4) {
      v4 = &TSWReviewQuestionDescriptionTypeMultiChoiceValue;
    }
    else {
      v4 = &TSWReviewQuestionDescriptionTypeMultiChoiceImageValue;
    }
  }
  return *v4;
}

+ (void)mapAnswer:(id)a3 toChoice:(id)a4 questionType:(int)a5
{
  [a3 answerWeight];
  [a4 setFraction:];
  if (a5 == 2)
  {
    id v8 = [a3 placementHint];
    if (v8) {
      [a4 setPlacardPlacement:v8];
    }
  }
  [a4 setTargetRegion:[a3 targetRegion]];
  objc_opt_class();
  v9 = (void *)TSUDynamicCast();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(a4, "setContent:", objc_msgSend(objc_msgSend(v9, "imageInfo"), "imageData"));
    [a4 setContentType:TSWReviewChoiceDescriptionContentTypeImageValue];
    [a4 setAccessibilityDescription:[v10 accessibilityDescription]];
    v11 = v10;
LABEL_12:
    id v19 = [v11 targetAccessibilityDescription];
    [a4 setTargetAccesibilityDescription:v19];
    return;
  }
  objc_opt_class();
  v12 = (void *)TSUDynamicCast();
  if (v12)
  {
    v13 = v12;
    if (a5 == 2 && (unint64_t)objc_msgSend(objc_msgSend(v12, "textStorage"), "paragraphCount") >= 2)
    {
      v14 = (char *)objc_msgSend(objc_msgSend(v13, "textStorage"), "textRangeForParagraphAtIndex:", 0);
      uint64_t v16 = v15;
      v17 = [v13 textStorage].length;
      v18 = &v14[v16];
      if (v17 > v18) {
        objc_msgSend(objc_msgSend(v13, "textStorage"), "deleteRange:undoTransaction:", v18, v17 - v18, 0);
      }
    }
    [a4 setContent:[v13 textStorage]];
    [a4 setContentType:TSWReviewChoiceDescriptionContentTypeTextValue];
    [a4 setAccessibilityDescription:[v13 accessibilityDescription]];
    v11 = v13;
    goto LABEL_12;
  }
  id v20 = +[TSUAssertionHandler currentHandler];
  v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFXReviewWidget mapAnswer:toChoice:questionType:]");
  v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXReviewWidget.mm"];

  [v20 handleFailureInFunction:v21 file:v22 lineNumber:509 description:@"PFXReviewWidget: bad answer type"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidget;
  [(PFXReviewWidget *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->_placement = v5;
  unsigned __int8 v6 = [(PFXDrawablePlacement *)v5 mapStartElementWithState:a3];
  id v7 = [a3 currentHtmlDocMediaState];
  if ([(PFXDrawablePlacement *)self->_placement mode] == 2)
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
  id v61 = [v5 currentEntryMediaState];
  id v59 = [a3 tspContext];
  unsigned __int8 v6 = [[TSWWidgetStyle alloc] initWithContext:v59];
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v6);
  objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageCornerRadius[0]), "doubleValue");
  double v8 = v7;
  id v9 = PFXTSDInfoGeometry((const char *)[v5 valueForAttribute:[PFXWidgetConstantDataStageGeometry[0] UTF8String]]);
  [v9 position];
  double v11 = v10;
  double v13 = v12;
  [v9 size];
  uint64_t v16 = -[THWStageGeometry initWithFrame:cornerRadius:]([THWStageGeometry alloc], "initWithFrame:cornerRadius:", v11, v13, v14, v15, v8);
  v17 = [THWReviewInfo alloc];
  id v18 = [a3 tspContext];
  id v19 = [(PFXDrawablePlacement *)self->_placement infoGeometry];
  id v20 = v18;
  id v21 = a3;
  v22 = [(THWReviewInfo *)v17 initWithContext:v20 geometry:v19 style:v6 stageGeometry:v16];

  v63 = v5;
  -[THWReviewInfo setProgressKitID:](v22, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v5 xmlElementId]));
  -[THWReviewInfo setProgressKitSectionID:](v22, "setProgressKitSectionID:", [a3 nodeGUID]);

  v57 = self;
  v23 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:self->_placement readerState:a3];
  if ([(PFXWidgetPlacement *)v23 hasChildrenForAdornmentInfo]) {
    [(THWReviewInfo *)v22 setAdornmentInfo:+[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:v23 readerState:v21]];
  }
  v56 = v23;
  v62 = v21;
  v60 = (char *)[v61 childResultCount];
  if (v60)
  {
    v24 = 0;
    v58 = v22;
    do
    {
      [v61 childResultAtIndex:v24];
      objc_opt_class();
      v25 = (void *)TSUDynamicCast();
      if (v25)
      {
        v26 = v25;
        id v27 = [v25 type];
        if (v27 == 2) {
          uint64_t v28 = 2;
        }
        else {
          uint64_t v28 = v27 == 1;
        }
        v29 = [[THWReviewQuestion alloc] initWithContext:v59 type:v28 text:[v26 answersAreText] numberOfChoices:[v26 answers].count titleAccessibilityDescription:[v26 titleAccessibilityDescription] imageAccessibilityDescription:[v26 imageAccessibilityDescription]];
        -[THWReviewQuestion setPrompt:](v29, "setPrompt:", objc_msgSend(objc_msgSend(v26, "title"), "textStorage"));
        -[THWReviewQuestion setAlternatePrompt:](v29, "setAlternatePrompt:", [v26 titleAccessibilityDescription]);
        -[THWReviewQuestion setChoiceNumberStyle:](v29, "setChoiceNumberStyle:", [v26 numberParagraphStyle]);
        id v30 = [v26 imageInfo];
        if (v30)
        {
          v31 = v30;
          -[THWReviewQuestion setReferenceContent:](v29, "setReferenceContent:", [v30 imageData]);
          [(THWReviewQuestion *)v29 setReferenceContentType:TSWReviewQuestionDescriptionReferenceContentTypeImageValue];
          -[THWReviewQuestion setReferenceContentAlternate:](v29, "setReferenceContentAlternate:", [v26 imageAccessibilityDescription]);
          objc_msgSend(objc_msgSend(v31, "geometry"), "boundsBeforeRotation");
          -[THWReviewQuestion setReferenceContentSize:](v29, "setReferenceContentSize:", v32, v33);
          id v34 = [v26 contentRefPlacement];
          if (v34) {
            [(THWReviewQuestion *)v29 setReferenceContentPlacement:v34];
          }
        }
        id v35 = [v26 answers];
        id v21 = v62;
        if ([v35 count])
        {
          uint64_t v36 = 0;
          while (1)
          {
            v37 = objc_alloc_init(THWReviewChoice);
            +[PFXReviewWidget mapAnswer:toChoice:questionType:](PFXReviewWidget, "mapAnswer:toChoice:questionType:", [v35 objectAtIndex:v36], v37, v27);
            objc_opt_class();
            v38 = (void *)TSUDynamicCast();
            if (v38) {
              break;
            }
            objc_opt_class();
            v40 = (void *)TSUDynamicCast();
            if (v40)
            {
              id v39 = [v40 textStorage];
LABEL_18:
              if (v39) {
                [v21 setUniqueIdForInfo:v39, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"question-%lu-answer-%lu", v24 + 1, v36 + 1), v63 withPostfix fromStackEntry];
              }
              goto LABEL_21;
            }
            id v41 = +[TSUAssertionHandler currentHandler];
            v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXReviewWidget mapEndElementWithState:]");
            v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXReviewWidget.mm"];
            v44 = v41;
            id v21 = v62;
            [v44 handleFailureInFunction:v42 file:v43 lineNumber:655 description:@"PFXReviewWidget: bad answer type"];
LABEL_21:
            [(THWReviewQuestion *)v29 addChoice:v37];

            if (++v36 >= (unint64_t)[v35 count]) {
              goto LABEL_22;
            }
          }
          id v39 = [v38 imageInfo];
          goto LABEL_18;
        }
LABEL_22:
        v22 = v58;
        [(THWReviewInfo *)v58 addQuestion:v29];
      }
      else
      {
        objc_opt_class();
        uint64_t v45 = TSUDynamicCast();
        if (v45) {
          [(THWReviewInfo *)v22 setQuestionNumberStyle:v45];
        }
      }
      ++v24;
    }
    while (v24 != v60);
  }
  if (+[PFXWidget isWidgetExpandedOnly:v21])
  {
    id v46 = [v21 tspContext];
    v47 = self;
    v48 = [(PFXDrawablePlacement *)self->_placement infoGeometry];
    v49 = v63;
    id v50 = [v63 titleAttributeValue];
    v51 = [(PFXWidgetPlacement *)v56 stageDrawable];
    id v52 = v50;
    id v21 = v62;
    v53 = +[PFXWidget drawableWidgetWithContext:v46 infoGeometry:v48 widgetTitle:v52 stageDrawable:v51 widgetInfo:v22];
    [(THWReviewInfo *)v53 setAdornmentInfo:[(THWReviewInfo *)v22 adornmentInfo]];
    [(THWWidgetAdornmentInfo *)[(THWReviewInfo *)v53 adornmentInfo] updateParentInfo:v53];
    id v54 = [v62 setUniqueIdForInfo:v53 fromStackEntry:v63];
  }
  else
  {
    v49 = v63;
    id v54 = [v21 setUniqueIdForInfo:v22 fromStackEntry:v63];
    [(THWWidgetAdornmentInfo *)[(THWReviewInfo *)v22 adornmentInfo] updateParentInfo:v22];
    v53 = v22;
    v47 = v57;
  }
  objc_msgSend(objc_msgSend(v49, "currentEntryMediaState"), "setResult:", v53);
  -[THWReviewInfo updateWithUniqueID:contentNodeGUID:](v22, "updateWithUniqueID:contentNodeGUID:", v54, [v21 nodeGUID]);

  placement = v47->_placement;

  [(PFXDrawablePlacement *)placement mapEndElementWithState:v21];
}

- (PFXDrawablePlacement)placement
{
  return self->_placement;
}

@end