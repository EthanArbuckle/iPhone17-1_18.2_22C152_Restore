@interface RAPCuratedCollectionQuestion
- (BOOL)isComplete;
- (NSArray)categoryItems;
- (RAPCommentQuestion)commentQuestion;
- (RAPCuratedCollectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4;
- (id)placeCollection;
- (int)_selectedCorrectionType;
- (int)analyticTarget;
- (unint64_t)selectedQuestionType;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setCategoryItems:(id)a3;
- (void)setSelectedQuestionType:(unint64_t)a3;
@end

@implementation RAPCuratedCollectionQuestion

- (RAPCuratedCollectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAPCuratedCollectionQuestion;
  v7 = [(RAPQuestion *)&v11 initWithReport:v6 parentQuestion:a4];
  if (v7)
  {
    v8 = [[RAPCommentQuestion alloc] initWithReport:v6 parentQuestion:v7];
    commentQuestion = v7->_commentQuestion;
    v7->_commentQuestion = v8;

    [(RAPCommentQuestion *)v7->_commentQuestion setEmphasis:3];
    [(RAPQuestion *)v7->_commentQuestion addObserver:v7 changeHandler:&stru_101320FD8];
  }

  return v7;
}

- (id)placeCollection
{
  v2 = [(RAPQuestion *)self _context];
  v3 = [v2 curatedCollectionContext];
  v4 = [v3 curatedCollection];

  return v4;
}

- (NSArray)categoryItems
{
  categoryItems = self->_categoryItems;
  if (categoryItems)
  {
    v3 = categoryItems;
  }
  else
  {
    v5 = +[NSMutableArray array];
    id v6 = [[RAPCuratedCollectionCategoryItem alloc] initWithType:1];
    [v5 addObject:v6];

    v7 = [[RAPCuratedCollectionCategoryItem alloc] initWithType:2];
    [v5 addObject:v7];

    v8 = [[RAPCuratedCollectionCategoryItem alloc] initWithType:3];
    [v5 addObject:v8];

    v9 = [[RAPCuratedCollectionCategoryItem alloc] initWithType:4];
    [v5 addObject:v9];

    v10 = (NSArray *)[v5 copy];
    objc_super v11 = self->_categoryItems;
    self->_categoryItems = v10;

    v3 = self->_categoryItems;
  }

  return v3;
}

- (BOOL)isComplete
{
  unint64_t selectedQuestionType = self->_selectedQuestionType;
  BOOL v3 = selectedQuestionType > 4;
  uint64_t v4 = (1 << selectedQuestionType) & 0x16;
  if (v3 || v4 == 0) {
    return 0;
  }
  else {
    return [(RAPQuestion *)self->_commentQuestion isComplete];
  }
}

- (void)setSelectedQuestionType:(unint64_t)a3
{
  if (self->_selectedQuestionType != a3)
  {
    self->_unint64_t selectedQuestionType = a3;
    switch(a3)
    {
      case 1uLL:
        uint64_t v4 = +[NSBundle mainBundle];
        v5 = v4;
        CFStringRef v6 = @"Broken Link [Brooklyn RAP]";
        goto LABEL_8;
      case 2uLL:
        uint64_t v4 = +[NSBundle mainBundle];
        v5 = v4;
        CFStringRef v6 = @"Inaccurate Description [Brooklyn RAP]";
        goto LABEL_8;
      case 3uLL:
        uint64_t v4 = +[NSBundle mainBundle];
        v5 = v4;
        CFStringRef v6 = @"Inaccurate Place Details Description [Brooklyn RAP]";
        goto LABEL_8;
      case 4uLL:
        uint64_t v4 = +[NSBundle mainBundle];
        v5 = v4;
        CFStringRef v6 = @"Other Description[Brooklyn RAP]";
LABEL_8:
        v10 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

        [(RAPCommentQuestion *)self->_commentQuestion _setPlaceholderText:v10];
        break;
      default:
        v10 = &stru_101324E70;
        [(RAPCommentQuestion *)self->_commentQuestion _setPlaceholderText:&stru_101324E70];
        break;
    }
    [(RAPCommentQuestion *)self->_commentQuestion setComment:&stru_101324E70];
    if ([(RAPCuratedCollectionQuestion *)self _selectedCorrectionType])
    {
      uint64_t v7 = [(RAPCuratedCollectionQuestion *)self analyticTarget];
      uint64_t v8 = [(RAPCuratedCollectionQuestion *)self _selectedCorrectionType];
      if (v8 >= 4)
      {
        v9 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
      }
      else
      {
        v9 = off_101320FF8[(int)v8];
      }
      +[GEOAPPortal captureUserAction:232 target:v7 value:v9];
    }
  }
}

- (int)_selectedCorrectionType
{
  unint64_t v2 = [(RAPCuratedCollectionQuestion *)self selectedQuestionType];
  if (v2 - 1 > 3) {
    return 0;
  }
  else {
    return dword_100F73E70[v2 - 1];
  }
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [v20 details];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [v20 setDetails:v5];
  }
  if ((id)[(RAPCuratedCollectionQuestion *)self selectedQuestionType] == (id)3)
  {
    CFStringRef v6 = [v20 details];
    uint64_t v7 = [v6 poiFeedback];

    if (!v7)
    {
      id v8 = objc_alloc_init((Class)GEORPPoiFeedback);
      v9 = [v20 details];
      [v9 setPoiFeedback:v8];
    }
    id v10 = [(RAPQuestion *)self _context];
    id v11 = [v10 curatedCollectionContext];
    v12 = [v11 geoContext];
    v13 = [v20 details];
    v14 = [v13 poiFeedback];
    [v14 setPoiCuratedCollectionContext:v12];
  }
  else
  {
    [v20 setType:12];
    v15 = [v20 details];
    id v10 = [v15 curatedCollectionFeedback];

    if (!v10)
    {
      id v10 = objc_alloc_init((Class)GEORPCuratedCollectionFeedback);
      v16 = [v20 details];
      [v16 setCuratedCollectionFeedback:v10];
    }
    id v11 = [v10 curatedCollectionCorrections];
    if (!v11)
    {
      id v11 = objc_alloc_init((Class)GEORPCuratedCollectionCorrections);
      [v10 setCuratedCollectionCorrections:v11];
    }
    v17 = [(RAPQuestion *)self _context];
    v18 = [v17 curatedCollectionContext];
    v19 = [v18 geoContext];
    [v10 setCuratedCollectionContext:v19];

    [v11 setCorrectionType:[self _selectedCorrectionType]];
    v12 = [(RAPCuratedCollectionQuestion *)self commentQuestion];
    [v12 _fillSubmissionParameters:v20];
  }
}

- (int)analyticTarget
{
  return 40;
}

- (RAPCommentQuestion)commentQuestion
{
  return self->_commentQuestion;
}

- (void)setCategoryItems:(id)a3
{
}

- (unint64_t)selectedQuestionType
{
  return self->_selectedQuestionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryItems, 0);

  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end