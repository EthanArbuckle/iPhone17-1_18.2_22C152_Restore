@interface ODCurarePersonalizationPolicy
- (NSArray)hyperparameterSelectionPolicy;
- (NSNumber)minimumNumberOfSamplesForPersonalization;
- (NSNumber)minimumNumberOfSamplesForPersonalizationSelection;
- (ODCurarePersonalizationPolicy)initWithModelSelectionParameters:(id)a3 minimumNumberOfSamplesForPersonalization:(id)a4 minimumNumberOfSamplesForPersonalizationSelection:(id)a5;
- (void)setHyperparameterSelectionPolicy:(id)a3;
- (void)setMinimumNumberOfSamplesForPersonalization:(id)a3;
- (void)setMinimumNumberOfSamplesForPersonalizationSelection:(id)a3;
@end

@implementation ODCurarePersonalizationPolicy

- (ODCurarePersonalizationPolicy)initWithModelSelectionParameters:(id)a3 minimumNumberOfSamplesForPersonalization:(id)a4 minimumNumberOfSamplesForPersonalizationSelection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ODCurarePersonalizationPolicy *)self init];
  v12 = v11;
  if (v11)
  {
    [(ODCurarePersonalizationPolicy *)v11 setHyperparameterSelectionPolicy:v8];
    [(ODCurarePersonalizationPolicy *)v12 setMinimumNumberOfSamplesForPersonalization:v9];
    [(ODCurarePersonalizationPolicy *)v12 setMinimumNumberOfSamplesForPersonalizationSelection:v10];
  }

  return v12;
}

- (NSArray)hyperparameterSelectionPolicy
{
  return self->_hyperparameterSelectionPolicy;
}

- (void)setHyperparameterSelectionPolicy:(id)a3
{
}

- (NSNumber)minimumNumberOfSamplesForPersonalization
{
  return self->_minimumNumberOfSamplesForPersonalization;
}

- (void)setMinimumNumberOfSamplesForPersonalization:(id)a3
{
}

- (NSNumber)minimumNumberOfSamplesForPersonalizationSelection
{
  return self->_minimumNumberOfSamplesForPersonalizationSelection;
}

- (void)setMinimumNumberOfSamplesForPersonalizationSelection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumNumberOfSamplesForPersonalizationSelection, 0);
  objc_storeStrong((id *)&self->_minimumNumberOfSamplesForPersonalization, 0);
  objc_storeStrong((id *)&self->_hyperparameterSelectionPolicy, 0);
}

@end