@interface PKTapToRadarPrompt
+ (BOOL)supportsSecureCoding;
- (NSDate)lastPromptDate;
- (NSString)reason;
- (PKTapToRadarPrompt)initWithCoder:(id)a3;
- (id)description;
- (int64_t)promptCount;
- (void)encodeWithCoder:(id)a3;
- (void)setLastPromptDate:(id)a3;
- (void)setPromptCount:(int64_t)a3;
- (void)setReason:(id)a3;
@end

@implementation PKTapToRadarPrompt

- (PKTapToRadarPrompt)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTapToRadarPrompt;
  v5 = [(PKTapToRadarPrompt *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastPromptDate"];
    lastPromptDate = v5->_lastPromptDate;
    v5->_lastPromptDate = (NSDate *)v8;

    v5->_promptCount = [v4 decodeIntegerForKey:@"promptCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  reason = self->_reason;
  id v5 = a3;
  [v5 encodeObject:reason forKey:@"reason"];
  [v5 encodeObject:self->_lastPromptDate forKey:@"lastPromptDate"];
  [v5 encodeInteger:self->_promptCount forKey:@"promptCount"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"reason: '%@'; ", self->_reason];
  [v3 appendFormat:@"lastPromptDate: '%@'; ", self->_lastPromptDate];
  objc_msgSend(v3, "appendFormat:", @"promptCount: '%ld'; ", self->_promptCount);
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSDate)lastPromptDate
{
  return self->_lastPromptDate;
}

- (void)setLastPromptDate:(id)a3
{
}

- (int64_t)promptCount
{
  return self->_promptCount;
}

- (void)setPromptCount:(int64_t)a3
{
  self->_promptCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPromptDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end