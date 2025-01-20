@interface PKPayLaterPaymentSource
+ (BOOL)supportsSecureCoding;
- (PKPayLaterPaymentSource)init;
- (PKPayLaterPaymentSource)initWithCoder:(id)a3;
- (id)description;
- (id)identifier;
- (id)name;
- (int64_t)compare:(id)a3;
- (int64_t)priority;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation PKPayLaterPaymentSource

- (PKPayLaterPaymentSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterPaymentSource;
  v2 = [(PKPayLaterPaymentSource *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (unint64_t)type
{
  return 0;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)name
{
  return &stru_1EE0F5368;
}

- (int64_t)compare:(id)a3
{
  uint64_t v4 = [a3 priority];
  int64_t priority = self->_priority;
  BOOL v6 = priority == v4;
  BOOL v7 = priority < v4;
  int64_t v8 = 1;
  if (!v7) {
    int64_t v8 = -1;
  }
  if (v6) {
    return 0;
  }
  else {
    return v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPaymentSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterPaymentSource;
  v5 = [(PKPayLaterPaymentSource *)&v7 init];
  if (v5) {
    v5->_int64_t priority = [v4 decodeIntegerForKey:@"priority"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKPayLaterPaymentSource *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  objc_msgSend(v3, "appendFormat:", @"priority: %ld; ", -[PKPayLaterPaymentSource priority](self, "priority"));
  [v3 appendFormat:@">"];
  return v3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_int64_t priority = a3;
}

- (void).cxx_destruct
{
}

@end