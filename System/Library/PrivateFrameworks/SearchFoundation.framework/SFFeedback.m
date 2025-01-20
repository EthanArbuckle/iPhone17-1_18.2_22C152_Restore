@interface SFFeedback
+ (BOOL)supportsSecureCoding;
- (SFFeedback)init;
- (SFFeedback)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)queryId;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setQueryId:(unint64_t)a3;
@end

@implementation SFFeedback

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (SFFeedback)init
{
  v4.receiver = self;
  v4.super_class = (Class)SFFeedback;
  v2 = [(SFFeedback *)&v4 init];
  if (v2) {
    v2->_timestamp = mach_absolute_time();
  }
  return v2;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeInt64:timestamp forKey:@"timestamp"];
  [v5 encodeInt64:self->_queryId forKey:@"_queryId"];
}

- (SFFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFFeedback;
  id v5 = [(SFFeedback *)&v7 init];
  if (v5)
  {
    v5->_unint64_t timestamp = [v4 decodeInt64ForKey:@"timestamp"];
    v5->_queryId = [v4 decodeInt64ForKey:@"_queryId"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = [(SFFeedback *)self timestamp];
  v4[2] = [(SFFeedback *)self queryId];
  return v4;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SFFeedback;
  id v4 = [(SFFeedback *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ (time: %llu)", v4, -[SFFeedback timestamp](self, "timestamp")];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end