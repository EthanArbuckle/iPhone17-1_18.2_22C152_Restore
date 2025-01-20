@interface STShowDraftMessageUsageResult
+ (BOOL)supportsSecureCoding;
- (STShowDraftMessageUsageResult)initWithCoder:(id)a3;
- (id)_resultDescription;
- (id)description;
- (int64_t)resultCode;
- (void)encodeWithCoder:(id)a3;
- (void)setResultCode:(int64_t)a3;
@end

@implementation STShowDraftMessageUsageResult

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (STShowDraftMessageUsageResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STShowDraftMessageUsageResult;
  v5 = [(AFSiriTaskUsageResult *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_resultCode = [v4 decodeIntegerForKey:@"ResultCodeKeyIdentifier"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowDraftMessageUsageResult;
  id v4 = a3;
  [(AFSiriTaskUsageResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_resultCode, @"ResultCodeKeyIdentifier", v5.receiver, v5.super_class);
}

- (id)_resultDescription
{
  unint64_t v2 = self->_resultCode - 1;
  if (v2 > 4) {
    return @"NotSet";
  }
  else {
    return off_2647623D0[v2];
  }
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)STShowDraftMessageUsageResult;
  v3 = [(AFSiriTaskUsageResult *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendString:@" result: "];
  objc_super v5 = [(STShowDraftMessageUsageResult *)self _resultDescription];
  [v4 appendString:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end