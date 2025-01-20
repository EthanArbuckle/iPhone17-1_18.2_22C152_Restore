@interface PFXReviewWidgetType
- (BOOL)mapStartElementWithState:(id)a3;
- (int)mapContentRefPlacehment:(id)a3;
- (void)mapAnswerAttributes:(id)a3 stackEntry:(id)a4 result:(id)a5 orientationState:(id)a6;
- (void)mapEndElementWithState:(id)a3;
- (void)mapEndQuestionElementWithState:(id)a3;
- (void)mapEndTextElementWithState:(id)a3;
@end

@implementation PFXReviewWidgetType

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  v6 = (const xmlChar *)[v4 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewTitle[0])
    || xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewText[0]))
  {
    v7 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", [a3 tspContext], &stru_46D7E8, objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), 3);
    [v5 setOverriddenStorage:v7];
  }
  return 1;
}

- (void)mapAnswerAttributes:(id)a3 stackEntry:(id)a4 result:(id)a5 orientationState:(id)a6
{
  if (a4)
  {
    v10 = (const xmlChar *)[a4 xmlValueForAttribute:PFXWidgetConstantReviewObjectAttributeTargetRegion[0]];
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!a5 || !a6) {
    goto LABEL_18;
  }
  v10 = (const xmlChar *)objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, PFXWidgetConstantReviewObjectAttributeTargetRegion[0]), "xmlString");
  if (v10) {
LABEL_3:
  }
    [a3 setTargetRegion:PFXBezierPathWithSvgPath(v10)];
LABEL_4:
  if (a4)
  {
    v11 = (const char *)[a4 xmlValueForAttribute:PFXWidgetConstantReviewObjectAttributeAnswerGeometry[0]];
    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  if (!a5 || !a6) {
    goto LABEL_22;
  }
  v11 = (const char *)objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, PFXWidgetConstantReviewObjectAttributeAnswerGeometry[0]), "xmlString");
  if (v11) {
LABEL_6:
  }
    [a3 setAnswerGeometry:PFXTSDInfoGeometry(v11)];
LABEL_7:
  if (a4)
  {
    id v12 = [a4 valueForAttribute:PFXWidgetConstantReviewObjectAttributeAnswerWeight[0]];
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_22:
  if (!a5 || !a6) {
    goto LABEL_26;
  }
  id v12 = objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, PFXWidgetConstantReviewObjectAttributeAnswerWeight[0]), "nsString");
  if (v12)
  {
LABEL_9:
    [v12 doubleValue];
    [a3 setAnswerWeight:];
  }
LABEL_10:
  if (a4)
  {
    id v13 = [a4 valueForAttribute:"title"];
    if (![v13 length]) {
      id v13 = [a4 valueForAttribute:"alt"];
    }
    id v14 = [a4 valueForAttribute:PFXWidgetConstantDataAdditionalAlternate[0]];
LABEL_31:
    id v15 = v14;
    goto LABEL_32;
  }
LABEL_26:
  id v13 = 0;
  id v15 = 0;
  if (a5 && a6)
  {
    id v13 = objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, "title"), "nsString");
    if (![v13 length]) {
      id v13 = objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, "alt"), "nsString");
    }
    id v14 = objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, PFXWidgetConstantDataAdditionalAlternate[0]), "nsString");
    goto LABEL_31;
  }
LABEL_32:
  [a3 setAccessibilityDescription:v13];

  [a3 setTargetAccessibilityDescription:v15];
}

- (void)mapEndTextElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  v6 = (const xmlChar *)[v4 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
  v8 = objc_alloc_init(PFXReviewWidgetText2);
  -[PFXReviewWidgetText2 setTextStorage:](v8, "setTextStorage:", [v5 storage]);
  [(PFXReviewWidgetText2 *)v8 setIsTitle:xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewTitle[0]) != 0];
  id v7 = [v4 valueForAttribute:PFXWidgetConstantDataGeometry[0]];
  if (v7) {
    -[PFXReviewWidgetText2 setTextGeometry:](v8, "setTextGeometry:", PFXTSDInfoGeometry((const char *)[v7 UTF8String]));
  }
  [(PFXReviewWidgetType *)self mapAnswerAttributes:v8 stackEntry:v4 result:0 orientationState:0];
  [v5 setResult:v8];
}

- (int)mapContentRefPlacehment:(id)a3
{
  v3 = (const xmlChar *)[a3 xmlString];
  if (xmlStrEqual(v3, (const xmlChar *)"top")) {
    return 1;
  }
  if (xmlStrEqual(v3, (const xmlChar *)"bottom")) {
    return 3;
  }
  if (xmlStrEqual(v3, (const xmlChar *)"left")) {
    return 4;
  }
  return 2 * (xmlStrEqual(v3, (const xmlChar *)"right") != 0);
}

- (void)mapEndQuestionElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  v6 = (const xmlChar *)[v4 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
  if (v6)
  {
    id v7 = v6;
    if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueMultipleChoiceQuestion[0]))
    {
      uint64_t v8 = 1;
    }
    else
    {
      if (!xmlStrEqual(v7, (const xmlChar *)PFXWidgetConstantReviewObjectValueAssociateQuestion[0])) {
        return;
      }
      uint64_t v8 = 2;
    }
    id v9 = objc_alloc_init((Class)NSMutableArray);
    v19 = objc_alloc_init(PFXReviewWidgetQuestion2);
    [(PFXReviewWidgetQuestion2 *)v19 setAnswers:v9];
    [(PFXReviewWidgetQuestion2 *)v19 setType:v8];
    -[PFXReviewWidgetQuestion2 setTitleAccessibilityDescription:](v19, "setTitleAccessibilityDescription:", [v4 valueForAttribute:"title"]);
    v10 = (char *)[v5 childResultCount];
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        id v13 = [v5 childResultAtIndex:i];
        objc_opt_class();
        uint64_t v14 = TSUDynamicCast();
        if (v14)
        {
          uint64_t v15 = v14;
          if ([v5 xmlAttributeValueForResult:v14 attributeName:PFXWidgetConstantDataWidgetObjectType[0]])
          {
            v16 = objc_alloc_init(PFXReviewWidgetImageAnswer2);
            [(PFXReviewWidgetImageAnswer2 *)v16 setImageInfo:v15];
            [(PFXReviewWidgetType *)self mapAnswerAttributes:v16 stackEntry:0 result:v15 orientationState:v5];
            [v9 addObject:v16];
          }
          else
          {
            id v17 = [v5 xmlAttributeValueForResult:v15 attributeName:PFXWidgetConstantReviewObjectAttributeDropAreaGeometry[0]];
            if (v17) {
              -[PFXReviewWidgetQuestion2 setDropAreaGeometry:](v19, "setDropAreaGeometry:", PFXTSDInfoGeometry((const char *)[v17 xmlString]));
            }
            id v18 = [v5 xmlAttributeValueForResult:v15 attributeName:PFXWidgetConstantReviewObjectAttributeQuestionAlign[0]];
            if (v18) {
              [(PFXReviewWidgetQuestion2 *)v19 setContentRefPlacement:[(PFXReviewWidgetType *)self mapContentRefPlacehment:v18]];
            }
            [(PFXReviewWidgetQuestion2 *)v19 setImageInfo:v13];
            -[PFXReviewWidgetQuestion2 setImageAccessibilityDescription:](v19, "setImageAccessibilityDescription:", objc_msgSend(objc_msgSend(v5, "xmlAttributeValueForResult:attributeName:", v15, "alt"), "nsString"));
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 isTitle])
          {
            [(PFXReviewWidgetQuestion2 *)v19 setTitle:v13];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(PFXReviewWidgetQuestion2 *)v19 setNumberParagraphStyle:v13];
            }
            else {
              [v9 addObject:v13];
            }
          }
        }
      }
    }

    [v5 setResult:v19];
  }
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  v6 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewTitle[0])
    || xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewText[0]))
  {
    [(PFXReviewWidgetType *)self mapEndTextElementWithState:a3];
  }
  else if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueMultipleChoiceQuestion[0]) {
         || xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueAssociateQuestion[0]))
  }
  {
    [(PFXReviewWidgetType *)self mapEndQuestionElementWithState:a3];
  }
}

@end