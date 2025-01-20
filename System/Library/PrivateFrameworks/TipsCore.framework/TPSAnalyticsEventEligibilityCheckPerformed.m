@interface TPSAnalyticsEventEligibilityCheckPerformed
+ (BOOL)supportsSecureCoding;
+ (id)eventWithError:(id)a3;
- (NSString)error;
- (TPSAnalyticsEventEligibilityCheckPerformed)initWithCoder:(id)a3;
- (id)_initWithError:(id)a3;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation TPSAnalyticsEventEligibilityCheckPerformed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventEligibilityCheckPerformed)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEventEligibilityCheckPerformed;
  v5 = [(TPSAnalyticsEvent *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSString *)v6;
  }
  return v5;
}

- (id)_initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEventEligibilityCheckPerformed;
  uint64_t v6 = [(TPSAnalyticsEvent *)&v9 initWithDate:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

+ (id)eventWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initWithError:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventEligibilityCheckPerformed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, @"error", v5.receiver, v5.super_class);
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"eligibility_check_performed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_error forKeyedSubscript:@"error"];
  return v3;
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end