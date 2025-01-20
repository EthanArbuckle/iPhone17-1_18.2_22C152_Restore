@interface SCRCMathLongDivisionExpression
- (SCRCMathExpression)divisor;
- (SCRCMathLongDivisionExpression)initWithDictionary:(id)a3;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (void)setDivisor:(id)a3;
@end

@implementation SCRCMathLongDivisionExpression

- (SCRCMathLongDivisionExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCRCMathLongDivisionExpression;
  v5 = [(SCRCMathArrayExpression *)&v10 initWithDictionary:v4];
  if (v5)
  {
    v6 = [@"Term" stringByAppendingString:@"1"];
    v7 = [v4 objectForKey:v6];
    v8 = +[SCRCMathExpression mathExpressionWithDictionary:v7];
    [(SCRCMathLongDivisionExpression *)v5 setDivisor:v8];
  }
  return v5;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(SCRCMathExpression *)self localizedStringForKey:@"math.long.division.formatter"];
  v8 = [(SCRCMathLongDivisionExpression *)self divisor];
  v9 = [v8 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];

  v13.receiver = self;
  v13.super_class = (Class)SCRCMathLongDivisionExpression;
  objc_super v10 = [(SCRCMathArrayExpression *)&v13 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];
  v11 = objc_msgSend(MEMORY[0x263F086A0], "scrcStringWithFormat:", v7, v9, v10);

  return v11;
}

- (SCRCMathExpression)divisor
{
  return self->_divisor;
}

- (void)setDivisor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end