@interface PSYTestInput
+ (BOOL)supportsSecureCoding;
+ (id)testInputWithAction:(int64_t)a3;
- (PSYTestInput)initWithCoder:(id)a3;
- (int64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
@end

@implementation PSYTestInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)testInputWithAction:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setAction:a3];

  return v4;
}

- (PSYTestInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PSYTestInput;
  v5 = [(PSYTestInput *)&v7 init];
  if (v5) {
    v5->_action = [v4 decodeIntegerForKey:@"action"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

@end