@interface SBINAppIntentSystemContext
- (BOOL)isEqual:(id)a3;
- (NSDate)preciseTimestamp;
- (NSString)description;
- (SBINAppIntentSystemContext)initWithPreciseTimestamp:(id)a3 actionSource:(unint64_t)a4;
- (unint64_t)actionSource;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBINAppIntentSystemContext

- (SBINAppIntentSystemContext)initWithPreciseTimestamp:(id)a3 actionSource:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBINAppIntentSystemContext;
  v8 = [(SBINAppIntentSystemContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_preciseTimestamp, a3);
    v9->_actionSource = a4;
  }

  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  preciseTimestamp = self->_preciseTimestamp;
  id v5 = a3;
  id v6 = (id)[v5 appendObject:preciseTimestamp withName:@"preciseTimestamp"];
  NSStringFromSBINAppIntentActionSource(self->_actionSource);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 appendString:v7 withName:@"actionSource"];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBINAppIntentSystemContext *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      if (BSEqualObjects()) {
        BOOL v8 = self->_actionSource == v7->_actionSource;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_actionSource + [(NSDate *)self->_preciseTimestamp hash];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

- (NSDate)preciseTimestamp
{
  return self->_preciseTimestamp;
}

- (unint64_t)actionSource
{
  return self->_actionSource;
}

- (void).cxx_destruct
{
}

@end