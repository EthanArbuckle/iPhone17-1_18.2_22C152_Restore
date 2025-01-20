@interface TIAnalyticsBooleanFieldSpec
- (BOOL)validate:(id)a3 error:(id *)a4;
- (TIAnalyticsBooleanFieldSpec)initWithName:(id)a3;
@end

@implementation TIAnalyticsBooleanFieldSpec

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    if (+[TIAnalyticsUtil isBoolean:v6])
    {
      id v7 = 0;
      goto LABEL_9;
    }
    v8 = [(TIAnalyticsFieldSpec *)self name];
    id v7 = [(TIAnalyticsFieldSpec *)self errorFromValue:v6, 10, @"Field '%@' must be a BOOLean.", v8 code message];

    if (!a4) {
      goto LABEL_9;
    }
  }
  else
  {
    id v7 = [(TIAnalyticsFieldSpec *)self errorFromNil];
    if (!a4) {
      goto LABEL_9;
    }
  }
  if (v7)
  {
    id v7 = v7;
    *a4 = v7;
  }
LABEL_9:

  return v7 == 0;
}

- (TIAnalyticsBooleanFieldSpec)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIAnalyticsBooleanFieldSpec;
  return [(TIAnalyticsFieldSpec *)&v4 initWithName:a3];
}

@end