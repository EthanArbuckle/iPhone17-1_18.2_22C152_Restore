@interface REMLExplanation
+ (id)explanationForCondition:(id)a3;
+ (id)explanationForFeature:(id)a3 mean:(float)a4 variance:(float)a5;
+ (id)explanationForFilteringRule:(id)a3;
- (BOOL)_canCombineWithSimilarExplanation:(id)a3;
- (BOOL)_isSystemFeature:(id)a3;
- (BOOL)canCombineExplanationWithExplanation:(id)a3;
- (BOOL)shouldProvideExplanation;
- (REMLExplanation)explanationWithStyle:(unint64_t)a3;
- (id)_formattedFeatureListFromFeatures:(id)a3 style:(unint64_t)a4;
- (id)_formattedNameForFeature:(id)a3 style:(unint64_t)a4;
- (int64_t)_rankExplanationToSimilarExplanation:(id)a3;
- (int64_t)rankExplanationToExplanation:(id)a3;
@end

@implementation REMLExplanation

+ (id)explanationForCondition:(id)a3
{
  id v3 = a3;
  if (REMLExplanationsEnabled()) {
    v4 = [[_REMLConditionExplanation alloc] initWithCondition:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (id)explanationForFeature:(id)a3 mean:(float)a4 variance:(float)a5
{
  id v7 = a3;
  if (REMLExplanationsEnabled())
  {
    v8 = [_REMLFeatureExplanation alloc];
    *(float *)&double v9 = a4;
    *(float *)&double v10 = a5;
    v11 = [(_REMLFeatureExplanation *)v8 initWithFeature:v7 mean:v9 variance:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)explanationForFilteringRule:(id)a3
{
  id v3 = a3;
  if (REMLExplanationsEnabled()) {
    v4 = [[_REMLRuleExplanation alloc] initWithRule:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_canCombineWithSimilarExplanation:(id)a3
{
  return 0;
}

- (int64_t)_rankExplanationToSimilarExplanation:(id)a3
{
  return 0;
}

- (BOOL)_isSystemFeature:(id)a3
{
  id v3 = a3;
  v4 = +[REFeature systemFeatureNames];
  v5 = [v3 name];

  LOBYTE(v3) = [v4 containsObject:v5];
  return (char)v3;
}

- (id)_formattedNameForFeature:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  if (_formattedNameForFeature_style__onceToken != -1) {
    dispatch_once(&_formattedNameForFeature_style__onceToken, &__block_literal_global_6_1);
  }
  id v7 = [v6 name];
  v8 = objc_msgSend((id)_formattedNameForFeature_style__CamelCaseRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), @"$1 $2");
  double v9 = [v8 localizedLowercaseString];

  if (a4 == 1)
  {
    if ([(REMLExplanation *)self _isSystemFeature:v6]) {
      double v10 = @" relevance";
    }
    else {
      double v10 = @" feature";
    }
    uint64_t v11 = [v9 stringByAppendingString:v10];

    double v9 = (void *)v11;
  }

  return v9;
}

uint64_t __50__REMLExplanation__formattedNameForFeature_style___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([a-z])([A-Z])" options:0 error:0];
  uint64_t v1 = _formattedNameForFeature_style__CamelCaseRegex;
  _formattedNameForFeature_style__CamelCaseRegex = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_formattedFeatureListFromFeatures:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    if ([v6 count] == 1)
    {
      id v7 = [v6 firstObject];
      v8 = [(REMLExplanation *)self _formattedNameForFeature:v7 style:a4];
    }
    else
    {
      double v9 = @", and ";
      if (a4 != 1) {
        double v9 = 0;
      }
      if (a4) {
        double v10 = v9;
      }
      else {
        double v10 = @", ";
      }
      uint64_t v11 = [MEMORY[0x263F089D8] string];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __59__REMLExplanation__formattedFeatureListFromFeatures_style___block_invoke;
      v17 = &unk_2644C0938;
      id v18 = v6;
      id v19 = v11;
      v20 = v10;
      v21 = @", ";
      v22 = self;
      unint64_t v23 = a4;
      id v12 = v11;
      [v18 enumerateObjectsUsingBlock:&v14];
      v8 = (__CFString *)objc_msgSend(v12, "copy", v14, v15, v16, v17);
    }
  }
  else
  {
    v8 = &stru_26CFA57D0;
  }

  return v8;
}

void __59__REMLExplanation__formattedFeatureListFromFeatures_style___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count] - 1 == a3)
  {
    v5 = (void *)(a1 + 48);
  }
  else
  {
    if (!a3) {
      goto LABEL_6;
    }
    v5 = (void *)(a1 + 56);
  }
  [*(id *)(a1 + 40) appendString:*v5];
LABEL_6:
  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 64) _formattedNameForFeature:v8 style:*(void *)(a1 + 72)];
  [v6 appendString:v7];
}

- (BOOL)canCombineExplanationWithExplanation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(REMLExplanation *)self _canCombineWithSimilarExplanation:v4];

  return v5;
}

- (BOOL)shouldProvideExplanation
{
  return 1;
}

- (REMLExplanation)explanationWithStyle:(unint64_t)a3
{
  return (REMLExplanation *)&stru_26CFA57D0;
}

- (int64_t)rankExplanationToExplanation:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    int64_t v6 = [(REMLExplanation *)self _rankExplanationToSimilarExplanation:v4];
  }
  else if ([v5 isSubclassOfClass:objc_opt_class()])
  {
    int64_t v6 = 1;
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

@end