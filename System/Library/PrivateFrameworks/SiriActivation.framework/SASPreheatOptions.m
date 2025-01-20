@interface SASPreheatOptions
+ (BOOL)supportsSecureCoding;
- (SASPreheatOptions)initWithCoder:(id)a3;
- (SASPreheatOptions)initWithRequestSource:(int64_t)a3 lockState:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)requestSource;
- (unint64_t)lockState;
- (void)encodeWithCoder:(id)a3;
- (void)setLockState:(unint64_t)a3;
- (void)setRequestSource:(int64_t)a3;
@end

@implementation SASPreheatOptions

- (SASPreheatOptions)initWithRequestSource:(int64_t)a3 lockState:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SASPreheatOptions;
  result = [(SASPreheatOptions *)&v7 init];
  if (result)
  {
    result->_requestSource = a3;
    result->_lockState = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(SASPreheatOptions *)self requestSource];
  unint64_t v6 = [(SASPreheatOptions *)self lockState];
  return (id)[v4 initWithRequestSource:v5 lockState:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASPreheatOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASPreheatOptions;
  int64_t v5 = [(SASPreheatOptions *)&v8 init];
  if (v5)
  {
    v5->_requestSource = [v4 decodeIntegerForKey:@"SASPreheatOptionsRequestSourceCodingKey"];
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASPreheatOptionsLockStateCodingKey"];
    v5->_lockState = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SASPreheatOptions requestSource](self, "requestSource"), @"SASPreheatOptionsRequestSourceCodingKey");
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SASPreheatOptions lockState](self, "lockState"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"SASPreheatOptionsLockStateCodingKey"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = SASRequestSourceGetName([(SASPreheatOptions *)self requestSource]);
  unint64_t v6 = SASLockStateGetName([(SASPreheatOptions *)self lockState]);
  objc_super v7 = [v3 stringWithFormat:@"<%@ %p requestSource=%@; lockState=%@>", v4, self, v5, v6];;

  return v7;
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(int64_t)a3
{
  self->_requestSource = a3;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

@end