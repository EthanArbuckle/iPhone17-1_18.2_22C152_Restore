@interface ICSConference
- (BOOL)isEqualToConference:(id)a3;
- (ICSConference)initWithValue:(id)a3 type:(unint64_t)a4;
- (NSString)feature;
- (NSString)info;
- (NSString)language;
- (NSString)region;
- (unint64_t)currentHash;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)setFeature:(id)a3;
- (void)setInfo:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation ICSConference

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v9 = a4;
  v6 = [(ICSProperty *)self value];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 absoluteString], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    [(ICSProperty *)self _ICSStringWithOptions:a3 appendingToString:v9 additionalParameters:0];
    [v9 appendString:@":"];
    [v8 _ICSStringWithOptions:a3 appendingToString:v9];
  }
  else
  {
    NSLog(&cfstr_IgnoringConfer.isa, self);
    [v9 appendString:@":"];
  }
}

- (ICSConference)initWithValue:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICSConference;
  v4 = [(ICSProperty *)&v7 initWithValue:a3 type:a4];
  v5 = v4;
  if (v4) {
    [(ICSProperty *)v4 setParameterValue:@"URI" forName:@"VALUE"];
  }
  return v5;
}

- (NSString)feature
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-FEATURE"];
}

- (void)setFeature:(id)a3
{
}

- (NSString)info
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-INFO"];
}

- (void)setInfo:(id)a3
{
}

- (NSString)language
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"LANGUAGE"];
}

- (void)setLanguage:(id)a3
{
}

- (NSString)region
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-REGION"];
}

- (void)setRegion:(id)a3
{
}

- (unint64_t)currentHash
{
  v2 = [(ICSProperty *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToConference:(id)a3
{
  id v4 = a3;
  v5 = [(ICSProperty *)self value];
  v6 = [v4 value];
  if ([v5 isEqual:v6])
  {
    objc_super v7 = [(ICSProperty *)self parameters];
    v8 = [v4 parameters];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

@end