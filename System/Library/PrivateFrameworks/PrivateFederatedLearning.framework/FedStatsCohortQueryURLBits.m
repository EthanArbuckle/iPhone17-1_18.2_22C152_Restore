@interface FedStatsCohortQueryURLBits
+ (id)cohortInstance;
+ (id)cohortQueryFieldWithKey:(id)a3;
- (NSString)cohortName;
- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4;
- (id)initQueryFieldWithKey:(id)a3;
@end

@implementation FedStatsCohortQueryURLBits

- (id)initQueryFieldWithKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCohortQueryURLBits;
  v6 = [(FedStatsCohortQueryURLBits *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cohortName, a3);
  }

  return v7;
}

+ (id)cohortQueryFieldWithKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)[objc_alloc((Class)a1) initQueryFieldWithKey:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  v7 = [(FedStatsCohortQueryURLBits *)self cohortName];
  v8 = [v6 objectForKey:v7];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)[v8 length] < 9)
    {
      objc_super v9 = v8;
    }
    else
    {
      objc_super v9 = [v8 substringToIndex:8];
    }
  }
  else
  {
    if (a4)
    {
      v10 = NSString;
      v11 = [(FedStatsCohortQueryURLBits *)self cohortName];
      v12 = [v10 stringWithFormat:@"The data should have a String value for key \"%@\"", v11];
      v13 = +[FedStatsError errorWithCode:100 description:v12];
      id v14 = *a4;
      *a4 = v13;
    }
    objc_super v9 = @"<null>";
  }
  v15 = v9;

  return v15;
}

+ (id)cohortInstance
{
  return 0;
}

- (NSString)cohortName
{
  return self->_cohortName;
}

- (void).cxx_destruct
{
}

@end