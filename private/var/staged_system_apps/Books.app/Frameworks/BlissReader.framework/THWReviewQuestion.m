@interface THWReviewQuestion
- (BOOL)isText;
- (BOOL)p_referenceContentIsImage;
- (CGSize)imageSize;
- (CGSize)referenceContentSize;
- (Class)evaluatorClass;
- (Class)layoutClass;
- (NSArray)choices;
- (NSString)alternatePrompt;
- (NSString)imageAccessibilityDescription;
- (NSString)questionID;
- (NSString)referenceContentAlternate;
- (NSString)referenceContentType;
- (NSString)titleAccessibilityDescription;
- (THWReviewQuestion)initWithContext:(id)a3 type:(int)a4 text:(BOOL)a5 numberOfChoices:(unint64_t)a6 titleAccessibilityDescription:(id)a7 imageAccessibilityDescription:(id)a8;
- (TSDImageInfo)imageInfo;
- (TSPObjectContext)context;
- (TSWPParagraphStyle)choiceNumberStyle;
- (TSWPStorage)prompt;
- (id)choiceAtIndex:(unint64_t)a3;
- (id)p_defaultListLabelParagraphStyleFromStyle:(id)a3;
- (id)referenceContent;
- (int)cardinality;
- (int)evaluateAnswerWithResponseController:(id)a3 updateScore:(BOOL)a4 choiceBlock:(id)a5;
- (int)imagePlacement;
- (int)referenceContentPlacement;
- (int)type;
- (unint64_t)indexForChoice:(id)a3;
- (unint64_t)numberOfChoices;
- (void)addChoice:(id)a3;
- (void)dealloc;
- (void)p_ensureChoicesAreValid;
- (void)setAlternatePrompt:(id)a3;
- (void)setChoiceNumberStyle:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setQuestionID:(id)a3;
- (void)setReferenceContent:(id)a3;
- (void)setReferenceContentAlternate:(id)a3;
- (void)setReferenceContentPlacement:(int)a3;
- (void)setReferenceContentSize:(CGSize)a3;
- (void)setReferenceContentType:(id)a3;
@end

@implementation THWReviewQuestion

- (THWReviewQuestion)initWithContext:(id)a3 type:(int)a4 text:(BOOL)a5 numberOfChoices:(unint64_t)a6 titleAccessibilityDescription:(id)a7 imageAccessibilityDescription:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)THWReviewQuestion;
  v14 = [(THWReviewQuestion *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a4;
    v14->_text = a5;
    v14->_cardinality = 0;
    v14->_context = (TSPObjectContext *)a3;
    v14->_numberOfChoices = a6;
    v14->_titleAccessibilityDescription = (NSString *)[a7 copy];
    v15->_imageAccessibilityDescription = (NSString *)[a8 copy];
  }
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewQuestion;
  [(THWReviewQuestion *)&v3 dealloc];
}

- (BOOL)p_referenceContentIsImage
{
  objc_super v3 = [(THWReviewQuestion *)self referenceContentType];
  if (![(THWReviewQuestion *)self referenceContent] || !v3) {
    return 0;
  }
  v4 = TSWReviewQuestionDescriptionReferenceContentTypeImageValue;

  return [(NSString *)v3 isEqual:v4];
}

- (TSDImageInfo)imageInfo
{
  if (!self->_imageInfo && [(THWReviewQuestion *)self p_referenceContentIsImage])
  {
    id v3 = [objc_alloc((Class)TSDMediaStyle) initWithContext:[self context] name:0 overridePropertyMap:0 isVariation:0];
    v4 = [objc_alloc((Class)TSDImageInfo) initWithContext:[self context] geometry:0 style:v3 imageData:-[self referenceContent] originalImageData:0];
    self->_imageInfo = v4;
    [(TSDImageInfo *)v4 setAccessibilityDescription:self->_imageAccessibilityDescription];
    [(TSDImageInfo *)self->_imageInfo setLocked:1];
  }
  return self->_imageInfo;
}

- (int)imagePlacement
{
  int result = [(THWReviewQuestion *)self p_referenceContentIsImage];
  if (result)
  {
    return [(THWReviewQuestion *)self referenceContentPlacement];
  }
  return result;
}

- (CGSize)imageSize
{
  if ([(THWReviewQuestion *)self p_referenceContentIsImage])
  {
    [(THWReviewQuestion *)self referenceContentSize];
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)p_defaultListLabelParagraphStyleFromStyle:(id)a3
{
  id v4 = [[self->_prompt paragraphStyleAtParIndex:0 effectiveRange:0] valueForProperty:16];
  if (!v4) {
    id v4 = [[TSUFont systemFontOfSize:20.0] fontName];
  }
  id v5 = +[TSSPropertyMap propertyMap];
  LODWORD(v6) = 20.0;
  [v5 setFloatValue:17 forProperty:v6];
  [v5 setObject:v4 forProperty:16];
  id v7 = [a3 stylesheet];

  return [v7 variationOfStyle:a3 propertyMap:v5];
}

- (void)p_ensureChoicesAreValid
{
  if (self->_type == 1)
  {
    v2 = self;
    id v3 = objc_alloc_init((Class)NSMutableArray);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    choices = v2->_choices;
    id v5 = [(NSMutableArray *)choices countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      id v6 = v5;
      v20 = v2;
      id v7 = 0;
      id v8 = 0;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(choices);
          }
          v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v12 = [v11 contentStorage];
          if (v12)
          {
            id v13 = [v12 paragraphStyleAtParIndex:0 effectiveRange:0];
            id v14 = v13;
            if (!v7) {
              id v7 = v13;
            }
            id v15 = [v13 overridePropertyMap];
            if ([v15 containsProperty:16]
              && ([v15 containsProperty:17] & 1) != 0)
            {
              if (!v8) {
                id v8 = v14;
              }
            }
            else
            {
              [v3 addObject:v11];
            }
          }
        }
        id v6 = [(NSMutableArray *)choices countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v6);
      v2 = v20;
      if (![v3 count]) {
        goto LABEL_31;
      }
      if (v8) {
        goto LABEL_24;
      }
    }
    else
    {
      if (![v3 count])
      {
LABEL_31:

        return;
      }
      id v7 = 0;
    }
    id v8 = [(THWReviewQuestion *)v2 p_defaultListLabelParagraphStyleFromStyle:v7];
LABEL_24:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v16 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "contentStorage"), "setParagraphStyle:atParIndex:undoTransaction:", v8, 0, 0);
        }
        id v17 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }
    goto LABEL_31;
  }
}

- (void)addChoice:(id)a3
{
  if (a3)
  {
    choices = self->_choices;
    if (!choices)
    {
      choices = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:self->_numberOfChoices];
      self->_choices = choices;
    }
    [(NSMutableArray *)choices addObject:a3];
    if ([(NSMutableArray *)self->_choices count] == self->_numberOfChoices)
    {
      [(THWReviewQuestion *)self p_ensureChoicesAreValid];
    }
  }
}

- (unint64_t)indexForChoice:(id)a3
{
  return (unint64_t)[(NSMutableArray *)self->_choices indexOfObjectIdenticalTo:a3];
}

- (id)choiceAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_choices count] <= a3) {
    return 0;
  }
  choices = self->_choices;

  return [(NSMutableArray *)choices objectAtIndex:a3];
}

- (void)setQuestionID:(id)a3
{
  questionID = self->_questionID;
  if (questionID != a3)
  {

    self->_questionID = (NSString *)[a3 copy];
  }
}

- (int)cardinality
{
  int result = self->_cardinality;
  if (!result)
  {
    int type = self->_type;
    if (type == 2)
    {
      int result = 3;
    }
    else
    {
      if (type != 1) {
        return 0;
      }
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      choices = self->_choices;
      id v6 = [(NSMutableArray *)choices countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        id v7 = v6;
        unint64_t v8 = 0;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(choices);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * i) fraction];
            if (v11 > 0.0) {
              ++v8;
            }
          }
          id v7 = [(NSMutableArray *)choices countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
        if (v8 <= 1) {
          int result = 1;
        }
        else {
          int result = 2;
        }
      }
      else
      {
        int result = 1;
      }
    }
    self->_cardinality = result;
  }
  return result;
}

- (Class)layoutClass
{
  int type = self->_type;
  if (type == 2 || type == 1) {
    return (Class)objc_opt_class();
  }
  else {
    return 0;
  }
}

- (Class)evaluatorClass
{
  int type = self->_type;
  if (type == 1 || type == 2) {
    return (Class)objc_opt_class();
  }
  else {
    return 0;
  }
}

- (int)evaluateAnswerWithResponseController:(id)a3 updateScore:(BOOL)a4 choiceBlock:(id)a5
{
  BOOL v5 = a4;
  v25[4] = a5;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_181B7C;
  v26[3] = &unk_45A3B8;
  v26[4] = a5;
  v24[4] = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_181B98;
  v25[3] = &unk_45A3B8;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_181BB4;
  v24[3] = &unk_45A3B8;
  if (a4) {
    id v8 = 0;
  }
  else {
    id v8 = [a3 newTemporateReviewResponseMOC];
  }
  id v9 = [a3 responseForQuestionID:[self questionID] temporaryMOC:v8];
  v10 = [[TSWReviewResponseEvaluatorDataSource alloc] initWithResponse:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v11 = [(THWReviewQuestion *)self choices];
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) fraction];
        -[TSWReviewResponseEvaluatorDataSource addFraction:](v10, "addFraction:");
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v13);
  }
  id v16 = [(objc_class *)[(THWReviewQuestion *)self evaluatorClass] evaluate:v10 blockIfCorrect:v26 blockIfIncorrect:v25 blockIfMissing:v24];
  if (![v16 correctCount])
  {
    int v17 = 3;
    if (!v5) {
      goto LABEL_17;
    }
LABEL_16:
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_181BD0;
    v19[3] = &unk_456E38;
    v19[4] = v9;
    v19[5] = v16;
    [a3 mutateResponse:v9 block:v19];
    goto LABEL_17;
  }
  if ([v16 incorrectCount])
  {
    int v17 = 4;
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ([v16 missingCount]) {
    int v17 = 5;
  }
  else {
    int v17 = 6;
  }
  if (v5) {
    goto LABEL_16;
  }
LABEL_17:

  return v17;
}

- (int)type
{
  return self->_type;
}

- (TSWPStorage)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)alternatePrompt
{
  return self->_alternatePrompt;
}

- (void)setAlternatePrompt:(id)a3
{
}

- (TSWPParagraphStyle)choiceNumberStyle
{
  return self->_choiceNumberStyle;
}

- (void)setChoiceNumberStyle:(id)a3
{
}

- (id)referenceContent
{
  return self->_referenceContent;
}

- (void)setReferenceContent:(id)a3
{
}

- (NSString)referenceContentType
{
  return self->_referenceContentType;
}

- (void)setReferenceContentType:(id)a3
{
}

- (NSString)referenceContentAlternate
{
  return self->_referenceContentAlternate;
}

- (void)setReferenceContentAlternate:(id)a3
{
}

- (CGSize)referenceContentSize
{
  double width = self->_referenceContentSize.width;
  double height = self->_referenceContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setReferenceContentSize:(CGSize)a3
{
  self->_referenceContentSize = a3;
}

- (int)referenceContentPlacement
{
  return self->_referenceContentPlacement;
}

- (void)setReferenceContentPlacement:(int)a3
{
  self->_referenceContentPlacement = a3;
}

- (NSArray)choices
{
  return &self->_choices->super;
}

- (NSString)questionID
{
  return self->_questionID;
}

- (BOOL)isText
{
  return self->_text;
}

- (TSPObjectContext)context
{
  return self->_context;
}

- (NSString)titleAccessibilityDescription
{
  return self->_titleAccessibilityDescription;
}

- (NSString)imageAccessibilityDescription
{
  return self->_imageAccessibilityDescription;
}

- (unint64_t)numberOfChoices
{
  return self->_numberOfChoices;
}

@end