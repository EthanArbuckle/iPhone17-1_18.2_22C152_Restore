@interface FCFeedTransformationPersonalizedDiversifiedLimit
+ (id)transformationWithFunctionProvider:(id)a3;
+ (id)transformationWithFunctionProvider:(id)a3 limit:(unint64_t)a4;
- (FCPersonalizationFunctionProviding)functionProvider;
- (id)transformFeedItems:(id)a3;
- (id)transformFeedItems:(id)a3 withRespectToLimit:(unint64_t)a4;
- (unint64_t)limit;
- (void)setFunctionProvider:(id)a3;
- (void)setLimit:(unint64_t)a3;
@end

@implementation FCFeedTransformationPersonalizedDiversifiedLimit

+ (id)transformationWithFunctionProvider:(id)a3
{
  return (id)[a1 transformationWithFunctionProvider:a3 limit:-1];
}

+ (id)transformationWithFunctionProvider:(id)a3 limit:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setLimit:a4];
  [v6 setFunctionProvider:v5];

  return v6;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  id v5 = [(FCFeedTransformationPersonalizedDiversifiedLimit *)self transformFeedItems:v4 withRespectToLimit:[(FCFeedTransformationPersonalizedDiversifiedLimit *)self limit]];

  return v5;
}

- (id)transformFeedItems:(id)a3 withRespectToLimit:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(FCFeedTransformationPersonalizedDiversifiedLimit *)self functionProvider];

  if (v7)
  {
    v8 = [(FCFeedTransformationPersonalizedDiversifiedLimit *)self functionProvider];
    id v9 = [v8 diversifyItems:v6 limit:a4];
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (FCPersonalizationFunctionProviding)functionProvider
{
  return self->_functionProvider;
}

- (void)setFunctionProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end