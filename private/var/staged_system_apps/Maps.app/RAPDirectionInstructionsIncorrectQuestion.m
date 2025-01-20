@interface RAPDirectionInstructionsIncorrectQuestion
- ($C79183323B9A0D5602617FF3BE5395AC)routeStepMapRect;
- (BOOL)hasCorrectionForRouteStep:(id)a3 transitListItem:(id)a4;
- (BOOL)isComplete;
- (NSString)localizedTitle;
- (RAPDirectionInstructionsIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 direction:(id)a5;
- (RAPUserDirectionRequest)selectedValue;
- (id)_correctionforComposedRouteStep:(id)a3 listItem:(id)a4;
- (id)instructionCorrectionQuestionForStep:(id)a3 listItem:(id)a4;
- (int)userAction;
- (int64_t)questionCategory;
- (void)_fillSubmissionParameters:(id)a3;
- (void)saveCorrection:(id)a3;
@end

@implementation RAPDirectionInstructionsIncorrectQuestion

- (NSString)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Directions [Report an Issue category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (int64_t)questionCategory
{
  return 6;
}

- (int)userAction
{
  return 10101;
}

- (RAPDirectionInstructionsIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 direction:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPDirectionInstructionsIncorrectQuestion;
  v10 = [(RAPQuestion *)&v13 initWithReport:a3 parentQuestion:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_selectedValue, a5);
  }

  return v11;
}

- (id)instructionCorrectionQuestionForStep:(id)a3 listItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RAPDirectionInstructionsIncorrectQuestion *)self _correctionforComposedRouteStep:v6 listItem:v7];
  if (!v8)
  {
    id v9 = [RAPInstructionCorrectionQuestion alloc];
    v10 = [(RAPQuestion *)self report];
    v8 = [(RAPInstructionCorrectionQuestion *)v9 initWithReport:v10 parentQuestion:self composedRouteStep:v6 listItem:v7];
  }

  return v8;
}

- (id)_correctionforComposedRouteStep:(id)a3 listItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = self->_incorrectInstructions;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v12 composedRouteStep:v16];
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 == v6)
        {
          id v14 = [v12 listItem];

          if (v14 == v7)
          {
            id v9 = v12;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v9;
}

- (void)saveCorrection:(id)a3
{
  id v4 = a3;
  incorrectInstructions = self->_incorrectInstructions;
  id v12 = v4;
  if (!incorrectInstructions)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    id v7 = self->_incorrectInstructions;
    self->_incorrectInstructions = v6;

    id v4 = v12;
    incorrectInstructions = self->_incorrectInstructions;
  }
  if ([(NSMutableArray *)incorrectInstructions containsObject:v4])
  {
    v8 = [v12 comment];
    id v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];
    id v11 = [v10 length];

    if (!v11) {
      [(NSMutableArray *)self->_incorrectInstructions removeObject:v12];
    }
  }
  else
  {
    [(NSMutableArray *)self->_incorrectInstructions addObject:v12];
  }
  [(RAPQuestion *)self _didChange];
}

- (BOOL)isComplete
{
  incorrectInstructions = self->_incorrectInstructions;
  if (incorrectInstructions) {
    LOBYTE(incorrectInstructions) = [(NSMutableArray *)incorrectInstructions count] != 0;
  }
  return (char)incorrectInstructions;
}

- (BOOL)hasCorrectionForRouteStep:(id)a3 transitListItem:(id)a4
{
  id v4 = [(RAPDirectionInstructionsIncorrectQuestion *)self _correctionforComposedRouteStep:a3 listItem:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v5 = self->_incorrectInstructions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v9) _fillSubmissionParameters:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  [v4 setType:8];
  uint64_t v10 = [v4 commonContext];

  if (!v10)
  {
    id v11 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v4 setCommonContext:v11];
  }
  id v12 = [v4 details];

  if (!v12)
  {
    id v13 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [v4 setDetails:v13];
  }
  id v14 = [v4 details];
  id v15 = [v14 directionsFeedback];

  if (!v15)
  {
    id v15 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    long long v16 = [v4 details];
    [v16 setDirectionsFeedback:v15];
  }
  [v15 setCorrectionType:1];
  long long v17 = [v4 commonContext];
  [v17 addUserPath:43];
}

- (RAPUserDirectionRequest)selectedValue
{
  return self->_selectedValue;
}

- ($C79183323B9A0D5602617FF3BE5395AC)routeStepMapRect
{
  double x = self->_routeStepMapRect.origin.x;
  double y = self->_routeStepMapRect.origin.y;
  double width = self->_routeStepMapRect.size.width;
  double height = self->_routeStepMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedValue, 0);

  objc_storeStrong((id *)&self->_incorrectInstructions, 0);
}

@end