@interface UGCRatingCategory
+ (id)overallRatingCategoryFromScorecard:(id)a3;
+ (id)overallRatingCategoryWithInitialState:(int64_t)a3;
+ (id)ratingCategoryListForQuestionnaireCategories:(id)a3;
+ (id)ratingCategoryListForScorecard:(id)a3;
- (BOOL)hasValidSelectedState;
- (BOOL)isEdited;
- (GEORPCategoryRating)geoCategoryRating;
- (NSString)key;
- (NSString)localizedTitle;
- (UGCRatingCategory)initWithKey:(id)a3 localizedTitle:(id)a4 initialState:(int64_t)a5;
- (UGCRatingCategory)initWithKey:(id)a3 localizedTitle:(id)a4 initialState:(int64_t)a5 ratingType:(int64_t)a6;
- (int64_t)currentState;
- (int64_t)initialState;
- (int64_t)ratingType;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)revertCorrections;
- (void)setCurrentState:(int64_t)a3;
@end

@implementation UGCRatingCategory

+ (id)overallRatingCategoryFromScorecard:(id)a3
{
  id v3 = a3;
  if ([v3 hasRecommended])
  {
    if ([v3 recommended]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = +[UGCRatingCategory overallRatingCategoryWithInitialState:v4];

  return v5;
}

+ (id)overallRatingCategoryWithInitialState:(int64_t)a3
{
  uint64_t v4 = [UGCRatingCategory alloc];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Overall [UGC]" value:@"localized string not found" table:0];
  v7 = [(UGCRatingCategory *)v4 initWithKey:@"com.apple.client.ugc-overall-category" localizedTitle:v6 initialState:a3 ratingType:1];

  return v7;
}

+ (id)ratingCategoryListForScorecard:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [v3 categoryRatings];
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v10 = [v9 key];
        v11 = [v9 value];
        unsigned int v12 = [v11 score];

        v13 = [v9 value];
        v14 = [v13 categoryName];
        v15 = [v14 stringValue];

        v16 = [UGCRatingCategory alloc];
        if (v12 == -1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = 2 * (v12 == 1);
        }
        v18 = [(UGCRatingCategory *)v16 initWithKey:v10 localizedTitle:v15 initialState:v17];
        [v4 addObject:v18];
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  id v19 = [v4 copy];

  return v19;
}

+ (id)ratingCategoryListForQuestionnaireCategories:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [UGCRatingCategory alloc];
        unsigned int v12 = [v10 key:v17];
        v13 = [v10 localizedTitle];
        v14 = [(UGCRatingCategory *)v11 initWithKey:v12 localizedTitle:v13 initialState:0];

        [v4 addObject:v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = [v4 copy];

  return v15;
}

- (UGCRatingCategory)initWithKey:(id)a3 localizedTitle:(id)a4 initialState:(int64_t)a5
{
  return [(UGCRatingCategory *)self initWithKey:a3 localizedTitle:a4 initialState:a5 ratingType:0];
}

- (UGCRatingCategory)initWithKey:(id)a3 localizedTitle:(id)a4 initialState:(int64_t)a5 ratingType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UGCRatingCategory;
  v13 = [(UGCRatingCategory *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_currentState = a5;
    v13->_initialState = a5;
    objc_storeStrong((id *)&v13->_key, a3);
    v14->_ratingType = a6;
    objc_storeStrong((id *)&v14->_localizedTitle, a4);
    id v15 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UGCRatingCategoryObserver queue:&_dispatch_main_q];
    observers = v14->_observers;
    v14->_observers = v15;
  }
  return v14;
}

- (void)revertCorrections
{
  int64_t v3 = [(UGCRatingCategory *)self initialState];

  [(UGCRatingCategory *)self setCurrentState:v3];
}

- (void)setCurrentState:(int64_t)a3
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    [(GEOObserverHashTable *)self->_observers ratingCategoryDidChange:self];
  }
}

- (BOOL)isEdited
{
  return self->_initialState != self->_currentState;
}

- (BOOL)hasValidSelectedState
{
  return self->_currentState != 0;
}

- (GEORPCategoryRating)geoCategoryRating
{
  id v3 = objc_alloc_init((Class)GEORPCategoryRating);
  [v3 setKey:self->_key];
  id v4 = objc_alloc_init((Class)GEORPRatingValue);
  [v3 setValue:v4];
  id v5 = objc_alloc_init((Class)GEOLocalizedString);
  [v5 setStringValue:self->_localizedTitle];
  [v4 setCategoryName:v5];
  int64_t currentState = self->_currentState;
  if (currentState == 1) {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v7 = currentState == 2;
  }
  [v4 setScore:v7];

  return (GEORPCategoryRating *)v3;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (int64_t)ratingType
{
  return self->_ratingType;
}

- (NSString)key
{
  return self->_key;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int64_t)initialState
{
  return self->_initialState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end