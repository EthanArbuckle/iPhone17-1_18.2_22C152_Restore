@interface CRRRecommendation
- (BOOL)isFoundInAppsSuggestion;
- (CRRRecommendation)initWithFullyResolvedPerson:(id)a3;
- (CRRRecommendation)initWithPerson:(id)a3;
- (CRRRecommendation)initWithRecommendationType:(int64_t)a3 persons:(id)a4;
- (CRRRecommendation)initWithSiriInferencePerson:(id)a3;
- (NSArray)persons;
- (id)recommendedResult;
- (int64_t)recommendationType;
@end

@implementation CRRRecommendation

- (CRRRecommendation)initWithPerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 personHandle];
  v6 = [v5 value];
  id v7 = [v6 length];

  if (v7) {
    v8 = [(CRRRecommendation *)self initWithFullyResolvedPerson:v4];
  }
  else {
    v8 = [(CRRRecommendation *)self initWithSiriInferencePerson:v4];
  }
  v9 = v8;

  return v9;
}

- (CRRRecommendation)initWithSiriInferencePerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 scoredAlternatives];
  v6 = [v5 firstObject];

  uint64_t v7 = (uint64_t)[v6 recommendation];
  v8 = [v4 alternatives];

  v9 = &__NSArray0__struct;
  if (v8) {
    v9 = v8;
  }
  id v10 = v9;

  if (![v6 recommendation])
  {
    v11 = [v6 person];
    v12 = [v11 personHandle];
    unsigned int v13 = [v12 isSuggested];

    if (v13) {
      uint64_t v7 = 1;
    }
  }
  v14 = [(CRRRecommendation *)self initWithRecommendationType:v7 persons:v10];

  return v14;
}

- (CRRRecommendation)initWithFullyResolvedPerson:(id)a3
{
  id v8 = a3;
  id v4 = a3;
  v5 = +[NSArray arrayWithObjects:&v8 count:1];

  v6 = -[CRRRecommendation initWithRecommendationType:persons:](self, "initWithRecommendationType:persons:", 0, v5, v8);
  return v6;
}

- (CRRRecommendation)initWithRecommendationType:(int64_t)a3 persons:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRRRecommendation;
  id v8 = [(CRRRecommendation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_recommendationType = a3;
    objc_storeStrong((id *)&v8->_persons, a4);
  }

  return v9;
}

- (BOOL)isFoundInAppsSuggestion
{
  v2 = [(CRRRecommendation *)self persons];
  v3 = [v2 firstObject];
  id v4 = [v3 personHandle];
  unsigned __int8 v5 = [v4 isSuggested];

  return v5;
}

- (id)recommendedResult
{
  v3 = [(CRRRecommendation *)self persons];
  id v4 = [v3 count];

  if (v4)
  {
    unsigned __int8 v5 = [(CRRRecommendation *)self persons];
    id v6 = [v5 count];

    if (v6 == (id)1)
    {
      id v7 = [(CRRRecommendation *)self persons];
      id v8 = [v7 objectAtIndexedSubscript:0];

      int64_t v9 = [(CRRRecommendation *)self recommendationType];
      if ((unint64_t)(v9 - 1) >= 2)
      {
        if (v9)
        {
          unsigned int v13 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_10003255C(v13);
          }

          uint64_t v10 = +[INPersonResolutionResult unsupported];
        }
        else
        {
          uint64_t v10 = +[INPersonResolutionResult successWithResolvedPerson:v8];
        }
      }
      else
      {
        uint64_t v10 = +[INPersonResolutionResult confirmationRequiredWithPersonToConfirm:v8];
      }
      objc_super v11 = (void *)v10;
    }
    else
    {
      v12 = [(CRRRecommendation *)self persons];
      objc_super v11 = +[INPersonResolutionResult disambiguationWithPeopleToDisambiguate:v12];
    }
  }
  else
  {
    objc_super v11 = +[INPersonResolutionResult unsupported];
  }
  v14 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000324E4((uint64_t)v11, v14);
  }

  return v11;
}

- (int64_t)recommendationType
{
  return self->_recommendationType;
}

- (NSArray)persons
{
  return self->_persons;
}

- (void).cxx_destruct
{
}

@end