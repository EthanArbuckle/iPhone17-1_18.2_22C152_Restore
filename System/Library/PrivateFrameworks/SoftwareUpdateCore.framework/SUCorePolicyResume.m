@interface SUCorePolicyResume
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (NSDictionary)baseResumeOptions;
- (SUCorePolicyResume)initWithCoder:(id)a3;
- (SUCorePolicyResume)initWithSkipPhaseSet:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int64_t)specifiedFields;
- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBaseResumeOptions:(id)a3;
- (void)setSkipPhase:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyResume

- (SUCorePolicyResume)initWithSkipPhaseSet:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyResume;
  v4 = [(SUCorePolicyResume *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SUCorePolicyResume *)v4 backToDefaultsWithSkipPhaseSet:v3];
  }
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  baseResumeOptions = self->_baseResumeOptions;
  self->_specifiedFields = 0;
  self->_baseResumeOptions = 0;
  self->_skipPhase = a3;

  additionalOptions = self->_additionalOptions;
  self->_additionalOptions = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyResume)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyResume;
  v5 = [(SUCorePolicyResume *)&v9 init];
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_skipPhase = [v4 decodeBoolForKey:@"SkipPhase"];
    baseResumeOptions = v5->_baseResumeOptions;
    v5->_baseResumeOptions = 0;

    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicyResume specifiedFields](self, "specifiedFields"), @"SpecifiedFields");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyResume skipPhase](self, "skipPhase"), @"SkipPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyResume skipPhase](self, "skipPhase"));
  v6 = [(SUCorePolicyResume *)self baseResumeOptions];
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBaseResumeOptions:v7];

  v8 = [(SUCorePolicyResume *)self additionalOptions];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyResume specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyResume *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(SUCorePolicyResume *)v5 skipPhase];
      if (v6 == [(SUCorePolicyResume *)self skipPhase])
      {
        uint64_t v8 = [(SUCorePolicyResume *)v5 specifiedFields];
        BOOL v7 = v8 == [(SUCorePolicyResume *)self specifiedFields];
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  BOOL v3 = NSString;
  int64_t v4 = [(SUCorePolicyResume *)self specifiedFields];
  if ([(SUCorePolicyResume *)self skipPhase]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  uint64_t v6 = [(SUCorePolicyResume *)self baseResumeOptions];
  BOOL v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = @"none";
  }
  uint64_t v9 = [(SUCorePolicyResume *)self additionalOptions];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"none";
  }
  v12 = [v3 stringWithFormat:@"SUCorePolicyResume(specifiedFields:0x%llX|skipPhase:%@|baseResumeOptions:%@|additionalOptions:%@)", v4, v5, v8, v11];

  return v12;
}

- (id)summary
{
  if ([(SUCorePolicyResume *)self specifiedFields])
  {
    BOOL v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"|fields=%llX", -[SUCorePolicyResume specifiedFields](self, "specifiedFields"));
    int64_t v4 = [&stru_26C1810A0 stringByAppendingString:v3];
  }
  else
  {
    int64_t v4 = &stru_26C1810A0;
  }
  if ([(SUCorePolicyResume *)self skipPhase])
  {
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"|skipPhase"];

    int64_t v4 = (__CFString *)v5;
  }
  uint64_t v6 = [(SUCorePolicyResume *)self baseResumeOptions];
  if (v6) {
    BOOL v7 = @"|withBaseResumeOptions";
  }
  else {
    BOOL v7 = @"|noBaseResumeOptions";
  }
  uint64_t v8 = [(__CFString *)v4 stringByAppendingString:v7];

  uint64_t v9 = [(SUCorePolicyResume *)self additionalOptions];
  if (v9) {
    v10 = @"|withAdditionalOptions";
  }
  else {
    v10 = @"|noAdditionalOptions";
  }
  v11 = [v8 stringByAppendingString:v10];

  if (([v11 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v12 = [v11 stringByAppendingString:@"|"];

    v11 = (void *)v12;
  }

  return v11;
}

- (int64_t)specifiedFields
{
  return self->_specifiedFields;
}

- (void)setSpecifiedFields:(int64_t)a3
{
  self->_specifiedFields = a3;
}

- (BOOL)skipPhase
{
  return self->_skipPhase;
}

- (void)setSkipPhase:(BOOL)a3
{
  self->_skipPhase = a3;
}

- (NSDictionary)baseResumeOptions
{
  return self->_baseResumeOptions;
}

- (void)setBaseResumeOptions:(id)a3
{
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);

  objc_storeStrong((id *)&self->_baseResumeOptions, 0);
}

@end