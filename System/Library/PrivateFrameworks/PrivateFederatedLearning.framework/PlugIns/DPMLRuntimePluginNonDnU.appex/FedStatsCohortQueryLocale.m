@interface FedStatsCohortQueryLocale
+ (id)cohortInstance;
- (FedStatsCohortQueryLocale)init;
- (NSString)deviceLocale;
- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4;
@end

@implementation FedStatsCohortQueryLocale

- (FedStatsCohortQueryLocale)init
{
  v10.receiver = self;
  v10.super_class = (Class)FedStatsCohortQueryLocale;
  v2 = [(FedStatsCohortQueryLocale *)&v10 init];
  if (v2)
  {
    v3 = +[NSLocale preferredLanguages];
    v4 = [v3 firstObject];
    v5 = +[NSLocale currentLocale];
    v6 = [v5 objectForKey:NSLocaleCountryCode];
    uint64_t v7 = +[NSString stringWithFormat:@"%@_%@", v4, v6];
    deviceLocale = v2->_deviceLocale;
    v2->_deviceLocale = (NSString *)v7;
  }
  return v2;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  return [(FedStatsCohortQueryLocale *)self deviceLocale];
}

+ (id)cohortInstance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)deviceLocale
{
  return self->_deviceLocale;
}

- (void).cxx_destruct
{
}

@end