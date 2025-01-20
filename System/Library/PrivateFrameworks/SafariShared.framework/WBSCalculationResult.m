@interface WBSCalculationResult
- (BOOL)isCalculation;
- (BOOL)isCurrencyConversion;
- (BOOL)isEqual:(id)a3;
- (NSString)formattedEquation;
- (NSString)formattedExpression;
- (NSString)formattedResult;
- (NSString)sectionTitle;
- (WBSCalculationResult)initWithCalculateResult:(id)a3;
- (id)reflectedStringForQueryString:(id)a3;
@end

@implementation WBSCalculationResult

- (WBSCalculationResult)initWithCalculateResult:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSCalculationResult;
  v6 = [(WBSCalculationResult *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_result, a3);
    if ([(WBSCalculationResult *)v7 isCalculation])
    {
      if (calculationResultNumberFormatter_onceToken != -1) {
        dispatch_once(&calculationResultNumberFormatter_onceToken, &__block_literal_global_9);
      }
      v8 = &calculationResultNumberFormatter_formatter;
    }
    else
    {
      if (conversionResultNumberFormatter_onceToken != -1) {
        dispatch_once(&conversionResultNumberFormatter_onceToken, &__block_literal_global_37);
      }
      v8 = &conversionResultNumberFormatter_formatter;
    }
    [(CalculateResult *)v7->_result setNumberFormatter:*v8];
    v9 = v7;
  }

  return v7;
}

- (BOOL)isCalculation
{
  v3 = [(CalculateResult *)self->_result conversions];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(CalculateResult *)self->_result inputValueAndUnit];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (BOOL)isCurrencyConversion
{
  return [(CalculateResult *)self->_result unitType] == 16;
}

- (NSString)sectionTitle
{
  [(WBSCalculationResult *)self isCalculation];
  v2 = _WBSLocalizedString();
  return (NSString *)v2;
}

- (NSString)formattedExpression
{
  return (NSString *)[(CalculateResult *)self->_result formattedExpression];
}

- (NSString)formattedResult
{
  return (NSString *)[(CalculateResult *)self->_result formattedResult];
}

- (NSString)formattedEquation
{
  v3 = [(CalculateResult *)self->_result formattedExpression];
  BOOL v4 = [(WBSCalculationResult *)self reflectedStringForQueryString:v3];

  return (NSString *)v4;
}

- (id)reflectedStringForQueryString:(id)a3
{
  BOOL v4 = NSString;
  id v5 = a3;
  v6 = _WBSLocalizedString();
  v7 = [(CalculateResult *)self->_result formattedResult];
  v8 = objc_msgSend(v4, "stringWithFormat:", v6, v5, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(WBSCalculationResult *)self formattedEquation];
    v6 = [v4 formattedEquation];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end