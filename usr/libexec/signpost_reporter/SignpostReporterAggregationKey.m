@interface SignpostReporterAggregationKey
- (BOOL)isEqual:(id)a3;
- (NSString)category;
- (NSString)subsystem;
- (SignpostReporterAggregationKey)initWithSubsystem:(id)a3 category:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SignpostReporterAggregationKey

- (SignpostReporterAggregationKey)initWithSubsystem:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SignpostReporterAggregationKey;
  v9 = [(SignpostReporterAggregationKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subsystem, a3);
    objc_storeStrong((id *)&v10->_category, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(SignpostReporterAggregationKey *)self subsystem];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(SignpostReporterAggregationKey *)self category];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[SignpostReporterAggregationKey allocWithZone:a3];
  v5 = [(SignpostReporterAggregationKey *)self subsystem];
  id v6 = [v5 copy];
  id v7 = [(SignpostReporterAggregationKey *)self category];
  id v8 = [v7 copy];
  v9 = [(SignpostReporterAggregationKey *)v4 initWithSubsystem:v6 category:v8];

  return v9;
}

- (id)description
{
  v3 = [(SignpostReporterAggregationKey *)self subsystem];
  unint64_t v4 = [(SignpostReporterAggregationKey *)self category];
  v5 = +[NSString stringWithFormat:@"%@/%@", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SignpostReporterAggregationKey *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(SignpostReporterAggregationKey *)v5 subsystem];
      id v7 = [(SignpostReporterAggregationKey *)self subsystem];
      if ([v6 isEqualToString:v7])
      {
        id v8 = [(SignpostReporterAggregationKey *)v5 category];
        v9 = [(SignpostReporterAggregationKey *)self category];
        unsigned __int8 v10 = [v8 isEqualToString:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end