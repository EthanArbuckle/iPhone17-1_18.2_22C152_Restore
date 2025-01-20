@interface SXSpecVersionConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
- (NSString)specVersion;
- (SXSpecVersionConditionValidator)initWithSpecVersion:(id)a3;
@end

@implementation SXSpecVersionConditionValidator

- (SXSpecVersionConditionValidator)initWithSpecVersion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXSpecVersionConditionValidator;
  v5 = [(SXSpecVersionConditionValidator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    specVersion = v5->_specVersion;
    v5->_specVersion = (NSString *)v6;
  }
  return v5;
}

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 minSpecVersion];
  v7 = [v5 maxSpecVersion];

  if (v6
    && ([(SXSpecVersionConditionValidator *)self specVersion],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = SXSpecVersionCompare(v6, v8),
        v8,
        v9 == 1))
  {
    BOOL v10 = 0;
  }
  else if (v7)
  {
    v11 = [(SXSpecVersionConditionValidator *)self specVersion];
    BOOL v10 = SXSpecVersionCompare(v7, v11) != -1;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (NSString)specVersion
{
  return self->_specVersion;
}

- (void).cxx_destruct
{
}

@end