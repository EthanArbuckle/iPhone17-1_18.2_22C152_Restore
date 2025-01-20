@interface ISO18013RequestElement
+ (BOOL)supportsSecureCoding;
- (ISO18013RequestElement)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISO18013RequestElement

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_retentionIntent forKey:@"retentionIntent"];
}

- (ISO18013RequestElement)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  unsigned __int16 v7 = (unsigned __int16)[v4 decodeIntegerForKey:@"retentionIntent"];
  self->_retentionIntent = v7;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end