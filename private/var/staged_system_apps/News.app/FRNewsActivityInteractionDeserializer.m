@interface FRNewsActivityInteractionDeserializer
- (id)activityDataForIntent:(id)a3;
@end

@implementation FRNewsActivityInteractionDeserializer

- (id)activityDataForIntent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [objc_alloc((Class)TSNewsActivityData) initWithActivity:4 identifier:@"foryoufeed"];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      id v6 = objc_alloc((Class)TSNewsActivityData);
      v7 = [v5 tag];

      v8 = [v7 identifier];
      v9 = objc_opt_new();
      id v4 = [v6 initWithActivity:2 identifier:v8 object:v9];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

@end