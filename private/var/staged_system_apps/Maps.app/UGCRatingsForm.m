@interface UGCRatingsForm
+ (id)addRatingFormWithPlaceQuestionnaire:(id)a3;
+ (id)editRatingFormWithPlaceQuestionnaire:(id)a3 existingScorecard:(id)a4;
+ (id)emptyRatingForm;
- (BOOL)_isCompleteForAdd;
- (BOOL)_isCompleteForDelete;
- (BOOL)_isCompleteForEdit;
- (BOOL)isComplete;
- (BOOL)isEdited;
- (BOOL)isEmpty;
- (BOOL)passesMinimumRequirementsToBeSubmittable;
- (NSArray)allRatingCategories;
- (NSArray)categoryList;
- (UGCRatingCategory)overallCategory;
- (UGCRatingsForm)initWithActionType:(int64_t)a3 overallCategory:(id)a4 categoryList:(id)a5 versionNumber:(id)a6;
- (id)categoryForKey:(id)a3;
- (id)parentSubmissionIdentifier;
- (int64_t)actionType;
- (void)_fillInScorecard:(id)a3 hasBeenEdited:(BOOL *)a4;
- (void)_fillScorecardUpdateWithAddType:(id)a3;
- (void)_fillScorecardUpdateWithDeleteType:(id)a3;
- (void)_fillScorecardUpdateWithEditType:(id)a3;
- (void)_startObservingRatingCategories;
- (void)fillSubmissionFields:(id)a3;
- (void)setParentSubmissionIdentifier:(id)a3;
@end

@implementation UGCRatingsForm

+ (id)addRatingFormWithPlaceQuestionnaire:(id)a3
{
  id v3 = a3;
  if ([v3 canCollectRatings])
  {
    v4 = +[UGCRatingCategory overallRatingCategoryWithInitialState:0];
    v5 = [v3 ratingCategories];
    v6 = +[UGCRatingCategory ratingCategoryListForQuestionnaireCategories:v5];

    v7 = [UGCRatingsForm alloc];
    v8 = [v3 version];
    v9 = [(UGCRatingsForm *)v7 initWithActionType:0 overallCategory:v4 categoryList:v6 versionNumber:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)editRatingFormWithPlaceQuestionnaire:(id)a3 existingScorecard:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = +[UGCRatingCategory overallRatingCategoryFromScorecard:v6];
    v8 = +[UGCRatingCategory ratingCategoryListForScorecard:v6];
    v9 = [UGCRatingsForm alloc];
    v10 = [v6 version];
    v11 = [(UGCRatingsForm *)v9 initWithActionType:1 overallCategory:v7 categoryList:v8 versionNumber:v10];
  }
  else
  {
    v11 = [a1 addRatingFormWithPlaceQuestionnaire:a3];
  }

  return v11;
}

+ (id)emptyRatingForm
{
  v2 = +[UGCRatingCategory overallRatingCategoryWithInitialState:0];
  id v3 = [UGCRatingsForm alloc];
  v4 = +[NSArray array];
  v5 = [(UGCRatingsForm *)v3 initWithActionType:0 overallCategory:v2 categoryList:v4 versionNumber:&stru_101324E70];

  return v5;
}

- (UGCRatingsForm)initWithActionType:(int64_t)a3 overallCategory:(id)a4 categoryList:(id)a5 versionNumber:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UGCRatingsForm;
  v14 = [(UGCForm *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_actionType = a3;
    objc_storeStrong((id *)&v14->_overallCategory, a4);
    objc_storeStrong((id *)&v15->_categoryList, a5);
    objc_storeStrong((id *)&v15->_questionnaireVersion, a6);
    [(UGCRatingsForm *)v15 _startObservingRatingCategories];
  }

  return v15;
}

- (void)_startObservingRatingCategories
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(UGCRatingsForm *)self allRatingCategories];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) addObserver:self];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSArray)allRatingCategories
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:self->_overallCategory];
  [v3 addObjectsFromArray:self->_categoryList];
  id v4 = [v3 copy];

  return (NSArray *)v4;
}

- (id)categoryForKey:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(UGCRatingsForm *)self allRatingCategories];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 key];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isComplete
{
  if (![(UGCRatingsForm *)self passesMinimumRequirementsToBeSubmittable]) {
    return 0;
  }
  int64_t v3 = [(UGCRatingsForm *)self actionType];
  switch(v3)
  {
    case 2:
      return [(UGCRatingsForm *)self _isCompleteForDelete];
    case 1:
      return [(UGCRatingsForm *)self _isCompleteForEdit];
    case 0:
      return [(UGCRatingsForm *)self _isCompleteForAdd];
    default:
      return 0;
  }
}

- (BOOL)_isCompleteForDelete
{
  BOOL v3 = [(UGCRatingsForm *)self isEdited];
  if (v3)
  {
    LOBYTE(v3) = [(UGCRatingsForm *)self isEmpty];
  }
  return v3;
}

- (BOOL)_isCompleteForAdd
{
  return ![(UGCRatingsForm *)self isEmpty];
}

- (BOOL)_isCompleteForEdit
{
  BOOL v3 = [(UGCRatingsForm *)self isEdited];
  if (v3)
  {
    LOBYTE(v3) = [(UGCRatingsForm *)self _isCompleteForAdd];
  }
  return v3;
}

- (BOOL)passesMinimumRequirementsToBeSubmittable
{
  if ([(UGCRatingsForm *)self isEmpty]) {
    return 1;
  }

  return [(UGCRatingsForm *)self _isCompleteForAdd];
}

- (void)fillSubmissionFields:(id)a3
{
  id v6 = [a3 poiEnrichment];
  id v4 = [v6 scorecardUpdate];
  if (!v4)
  {
    id v4 = objc_alloc_init((Class)GEORPScorecardUpdate);
    [v6 setScorecardUpdate:v4];
  }
  int64_t v5 = [(UGCRatingsForm *)self actionType];
  switch(v5)
  {
    case 2:
      [(UGCRatingsForm *)self _fillScorecardUpdateWithDeleteType:v4];
      break;
    case 1:
      [(UGCRatingsForm *)self _fillScorecardUpdateWithEditType:v4];
      break;
    case 0:
      [(UGCRatingsForm *)self _fillScorecardUpdateWithAddType:v4];
      break;
  }
}

- (void)_fillInScorecard:(id)a3 hasBeenEdited:(BOOL *)a4
{
  id v6 = a3;
  [v6 setVersion:self->_questionnaireVersion];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(UGCRatingsForm *)self allRatingCategories];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 ratingType] == (id)1)
        {
          if ([v13 currentState]) {
            [v6 setRecommended:[v13 currentState] == 2];
          }
        }
        else
        {
          long long v14 = [v13 geoCategoryRating];
          [v6 addCategoryRatings:v14];
        }
        v10 |= [v13 isEdited];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  *a4 = v10 & 1;
}

- (void)_fillScorecardUpdateWithDeleteType:(id)a3
{
  id v3 = a3;
  [v3 setAction:2];
  [v3 setScorecard:0];
}

- (void)_fillScorecardUpdateWithEditType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)GEORPScorecard);
  [v4 setScorecard:v5];

  char v8 = 0;
  id v6 = [v4 scorecard];
  [(UGCRatingsForm *)self _fillInScorecard:v6 hasBeenEdited:&v8];

  if (v8) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  [v4 setAction:v7];
}

- (void)_fillScorecardUpdateWithAddType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)GEORPScorecard);
  [v4 setScorecard:v5];

  char v7 = 0;
  id v6 = [v4 scorecard];
  [(UGCRatingsForm *)self _fillInScorecard:v6 hasBeenEdited:&v7];

  if (!v7) {
    [v4 setScorecard:0];
  }
  [v4 setAction:1];
}

- (BOOL)isEmpty
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(UGCRatingsForm *)self allRatingCategories];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) currentState])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)isEdited
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UGCRatingsForm *)self allRatingCategories];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isEdited])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (int64_t)actionType
{
  if ([(UGCRatingsForm *)self isEmpty]) {
    return 2;
  }
  else {
    return self->_actionType;
  }
}

- (id)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  self->_parentSubmissionIdentifier = (NSString *)a3;
}

- (UGCRatingCategory)overallCategory
{
  return self->_overallCategory;
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_overallCategory, 0);

  objc_storeStrong((id *)&self->_questionnaireVersion, 0);
}

@end