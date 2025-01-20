@interface TIAnalyticsNumberFieldSpec
- (BOOL)isInteger;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (NSNumber)maxValue;
- (NSNumber)minValue;
- (NSNumber)significantDigits;
- (TIAnalyticsNumberFieldSpec)initWithName:(id)a3 isInteger:(BOOL)a4 minValue:(id)a5 maxValue:(id)a6 significantDigits:(id)a7;
@end

@implementation TIAnalyticsNumberFieldSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantDigits, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);

  objc_storeStrong((id *)&self->_minValue, 0);
}

- (NSNumber)significantDigits
{
  return self->_significantDigits;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (BOOL)isInteger
{
  return self->_isInteger;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    if (self->_isInteger)
    {
      if (!+[TIAnalyticsUtil isInteger:v7])
      {
        v10 = [(TIAnalyticsFieldSpec *)self name];
        v25 = v10;
        v11 = @"Field '%@' must be an integer.";
        goto LABEL_13;
      }
      if (self->_isInteger) {
        goto LABEL_6;
      }
    }
    if (+[TIAnalyticsUtil isFloat:v7])
    {
LABEL_6:
      v8 = [(TIAnalyticsNumberFieldSpec *)self minValue];
      if (v8)
      {
        v4 = [(TIAnalyticsNumberFieldSpec *)self minValue];
        if ([v7 compare:v4] == -1)
        {

LABEL_18:
          v10 = [(TIAnalyticsFieldSpec *)self name];
          [(TIAnalyticsFieldSpec *)self errorFromValue:v7, 14, @"Field '%@' is out of range.", v10 code message];
          goto LABEL_24;
        }
      }
      uint64_t v15 = [(TIAnalyticsNumberFieldSpec *)self maxValue];
      if (v15)
      {
        v16 = (void *)v15;
        v17 = [(TIAnalyticsNumberFieldSpec *)self maxValue];
        uint64_t v18 = [v7 compare:v17];

        if (v8)
        {
        }
        if (v18 == 1) {
          goto LABEL_18;
        }
      }
      else if (v8)
      {
      }
      v19 = +[TIAnalyticsUtil roundNumber:v7 toSignificantDigits:self->_significantDigits];
      [v19 doubleValue];
      double v21 = v20;
      [v7 doubleValue];
      double v23 = v22;

      if (v21 == v23)
      {
        id v9 = 0;
        goto LABEL_27;
      }
      v10 = [(TIAnalyticsFieldSpec *)self name];
      v25 = v10;
      v11 = @"Field '%@' has too many significant digits.";
      v12 = self;
      id v13 = v7;
      uint64_t v14 = 15;
LABEL_23:
      -[TIAnalyticsFieldSpec errorFromValue:code:message:](v12, "errorFromValue:code:message:", v13, v14, v11, v25);
LABEL_24:
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!a4) {
        goto LABEL_27;
      }
      goto LABEL_25;
    }
    v10 = [(TIAnalyticsFieldSpec *)self name];
    v25 = v10;
    v11 = @"Field '%@' must be a double.";
LABEL_13:
    v12 = self;
    id v13 = v7;
    uint64_t v14 = 10;
    goto LABEL_23;
  }
  id v9 = [(TIAnalyticsFieldSpec *)self errorFromNil];
  if (!a4) {
    goto LABEL_27;
  }
LABEL_25:
  if (v9)
  {
    id v9 = v9;
    *a4 = v9;
  }
LABEL_27:

  return v9 == 0;
}

- (TIAnalyticsNumberFieldSpec)initWithName:(id)a3 isInteger:(BOOL)a4 minValue:(id)a5 maxValue:(id)a6 significantDigits:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)TIAnalyticsNumberFieldSpec;
  uint64_t v15 = [(TIAnalyticsFieldSpec *)&v24 initWithName:a3];
  v16 = v15;
  if (v15)
  {
    v15->_isInteger = a4;
    uint64_t v17 = [v12 copy];
    minValue = v16->_minValue;
    v16->_minValue = (NSNumber *)v17;

    uint64_t v19 = [v13 copy];
    maxValue = v16->_maxValue;
    v16->_maxValue = (NSNumber *)v19;

    uint64_t v21 = [v14 copy];
    significantDigits = v16->_significantDigits;
    v16->_significantDigits = (NSNumber *)v21;
  }
  return v16;
}

@end