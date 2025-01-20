@interface THWReviewImageMultipleChoiceRep
- (BOOL)directlyManagesLayerContent;
- (NSArray)choiceStates;
- (THWReviewMoreAnswersLayer)moreAnswersLayer;
- (id)additionalLayersOverLayer;
- (id)p_choiceAtIndex:(unint64_t)a3;
- (id)p_questionHost;
- (id)p_repForChoiceIndex:(unint64_t)a3;
- (int)questionState;
- (int)reviewQuestionStateForChoiceIndex:(unint64_t)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)p_updateChoiceStates;
- (void)p_updateMoreAnswersLayer;
- (void)reviewQuestionAnswerUpdated;
- (void)reviewQuestionUpdateChoiceIndex:(unint64_t)a3 withState:(int)a4;
- (void)screenScaleDidChange;
- (void)setQuestionState:(int)a3;
- (void)updateChildrenFromLayout;
@end

@implementation THWReviewImageMultipleChoiceRep

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageMultipleChoiceRep;
  [(THWReviewImageMultipleChoiceRep *)&v3 dealloc];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateChildrenFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageMultipleChoiceRep;
  [(THWReviewImageMultipleChoiceRep *)&v3 updateChildrenFromLayout];
  if (!self->_questionState) {
    [self setQuestionState:[-[THWReviewImageMultipleChoiceRep p_questionHost](self, "p_questionHost") reviewQuestionInitialState:self]];
  }
  [(THWReviewImageMultipleChoiceRep *)self p_updateChoiceStates];
}

- (void)p_updateChoiceStates
{
  id v3 = [(NSArray *)self->_choiceStates count];
  if (v3 != objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewImageMultipleChoiceRep layout](self, "layout"), "question"), "choices"), "count"))
  {

    self->_choiceStates = 0;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = [(THWReviewImageMultipleChoiceRep *)self p_questionHost];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = objc_msgSend(objc_msgSend(-[THWReviewImageMultipleChoiceRep layout](self, "layout", 0), "question"), "choices");
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [[THWReviewImageAnswerChoiceState alloc] initWithChoice:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10) questionRep:self questionHost:v5];
          [v4 addObject:v11];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    self->_choiceStates = (NSArray *)[v4 copy];
  }
}

- (void)screenScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageMultipleChoiceRep;
  [(THWReviewImageMultipleChoiceRep *)&v3 screenScaleDidChange];
  if (self->_moreAnswersLayer)
  {
    [self canvas].contentsScale
    -[THWReviewMoreAnswersLayer setContentsScale:](self->_moreAnswersLayer, "setContentsScale:");
  }
}

- (id)additionalLayersOverLayer
{
  if ([(THWReviewImageMultipleChoiceRep *)self questionState] != 5) {
    return 0;
  }
  [(THWReviewImageMultipleChoiceRep *)self p_updateMoreAnswersLayer];
  if (!self->_moreAnswersLayer) {
    return 0;
  }
  moreAnswersLayer = self->_moreAnswersLayer;
  return +[NSArray arrayWithObjects:&moreAnswersLayer count:1];
}

- (void)p_updateMoreAnswersLayer
{
  id v3 = [(THWReviewImageMultipleChoiceRep *)self canvas];
  [v3 viewScale];
  double v5 = v4;
  [v3 contentsScale];
  double v7 = v6;
  if (!self->_moreAnswersLayer)
  {
    id v8 = objc_alloc_init(THWReviewMoreAnswersLayer);
    self->_moreAnswersLayer = v8;
    [(THWReviewMoreAnswersLayer *)v8 setContentsScale:v7];
  }
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewImageMultipleChoiceRep parentRep](self, "parentRep"), "layout"), "geometry"), "size");
  TSDRectWithSize();
  CGRectInset(v15, 0.0, 14.0);
  [(THWReviewMoreAnswersLayer *)self->_moreAnswersLayer layerSize];
  TSDRectWithSizeAlignedToRect();
  TSDMultiplyPointScalar();
  TSDRoundedPointForScale();
  double v10 = v9;
  double v12 = v11;
  [(THWReviewMoreAnswersLayer *)self->_moreAnswersLayer setScale:v5];
  moreAnswersLayer = self->_moreAnswersLayer;

  -[THWReviewMoreAnswersLayer setPosition:](moreAnswersLayer, "setPosition:", v10, v12);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  if (![a3 tag])
  {
    [(THWReviewImageMultipleChoiceRep *)self p_updateChoiceStates];
    objc_opt_class();
    double v6 = (void *)TSUDynamicCast();
    id v7 = [a3 index];
    if (v7 >= (id)[(NSArray *)self->_choiceStates count]) {
      id v8 = 0;
    }
    else {
      id v8 = -[NSArray objectAtIndex:](self->_choiceStates, "objectAtIndex:", [a3 index]);
    }
    [v6 setDelegate:v8];
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  if (![a3 tag])
  {
    objc_opt_class();
    double v4 = (void *)TSUDynamicCast();
    [v4 setDelegate:0];
  }
}

- (int)reviewQuestionStateForChoiceIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_choiceStates count] <= a3) {
    return 0;
  }
  id v5 = [(NSArray *)self->_choiceStates objectAtIndex:a3];
  if (!v5) {
    return 0;
  }

  return [v5 choiceState];
}

- (void)reviewQuestionUpdateChoiceIndex:(unint64_t)a3 withState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(NSArray *)self->_choiceStates count] <= a3) {
    id v7 = 0;
  }
  else {
    id v7 = [(NSArray *)self->_choiceStates objectAtIndex:a3];
  }

  [v7 setChoiceState:v4];
}

- (void)reviewQuestionAnswerUpdated
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  choiceStates = self->_choiceStates;
  id v3 = [(NSArray *)choiceStates countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(choiceStates);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) updateRadioState];
      }
      id v4 = [(NSArray *)choiceStates countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setQuestionState:(int)a3
{
  if (self->_questionState != a3)
  {
    self->_questionState = a3;
    [self canvas].invalidateLayers;
    if (self->_questionState <= 2u)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      choiceStates = self->_choiceStates;
      id v6 = [(NSArray *)choiceStates countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(choiceStates);
            }
            long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            if (a3 < 2
              || [*(id *)(*((void *)&v11 + 1) + 8 * i) choiceState] != 1)
            {
              [v10 setChoiceState:0];
              [v10 updateRadioState];
            }
          }
          id v7 = [(NSArray *)choiceStates countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
    [self.p_questionHost reviewQuestionDidUpdateState:self];
  }
}

- (id)p_choiceAtIndex:(unint64_t)a3
{
  id v4 = [[[self layout] question] choices];
  if ((unint64_t)[v4 count] <= a3) {
    return 0;
  }

  return [v4 objectAtIndex:a3];
}

- (id)p_repForChoiceIndex:(unint64_t)a3
{
  objc_opt_class();
  [self interactiveCanvasController].repForLayout:[self layout].layoutForChoiceIndex:a3];

  return (id)TSUDynamicCast();
}

- (id)p_questionHost
{
  id v3 = [(THWReviewImageMultipleChoiceRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWReviewQuestionHosting];
}

- (int)questionState
{
  return self->_questionState;
}

- (NSArray)choiceStates
{
  return self->_choiceStates;
}

- (THWReviewMoreAnswersLayer)moreAnswersLayer
{
  return self->_moreAnswersLayer;
}

@end