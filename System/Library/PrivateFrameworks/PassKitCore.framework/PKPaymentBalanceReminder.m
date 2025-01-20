@interface PKPaymentBalanceReminder
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (NSDecimalNumber)threshold;
- (PKPaymentBalanceReminder)initWithCoder:(id)a3;
- (PKPaymentBalanceReminder)initWithThreshold:(id)a3 isEnabled:(BOOL)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setThreshold:(id)a3;
@end

@implementation PKPaymentBalanceReminder

- (PKPaymentBalanceReminder)initWithThreshold:(id)a3 isEnabled:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentBalanceReminder;
  v8 = [(PKPaymentBalanceReminder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_threshold, a3);
    v9->_enabled = a4;
  }

  return v9;
}

- (PKPaymentBalanceReminder)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBalanceReminder;
  v5 = [(PKPaymentBalanceReminder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threshold"];
    threshold = v5->_threshold;
    v5->_threshold = (NSDecimalNumber *)v6;

    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  threshold = self->_threshold;
  id v5 = a3;
  [v5 encodeObject:threshold forKey:@"threshold"];
  [v5 encodeBool:self->_enabled forKey:@"enabled"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = @"YES";
  if (!self->_enabled) {
    id v5 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; isEnabled: %@; threshold: %@; >",
               v4,
               self,
               v5,
               self->_threshold);
}

- (NSDecimalNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

@end