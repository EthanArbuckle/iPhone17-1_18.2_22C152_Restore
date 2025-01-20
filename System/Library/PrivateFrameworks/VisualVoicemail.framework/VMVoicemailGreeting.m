@interface VMVoicemailGreeting
+ (BOOL)supportsSecureCoding;
- (NSURL)url;
- (VMVoicemailGreeting)initWithCoder:(id)a3;
- (double)duration;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setType:(unint64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation VMVoicemailGreeting

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMVoicemailGreeting)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VMVoicemailGreeting;
  v5 = [(VMVoicemailGreeting *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"duration"];
    v5->_duration = (double)(unint64_t)[v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v9 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  double duration = self->_duration;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithDouble:duration];
  [v6 encodeObject:v7 forKey:@"duration"];

  [v6 encodeObject:self->_url forKey:@"url"];
  id v8 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v6 encodeObject:v8 forKey:@"type"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<VMVoicemailGreeting type=%lu, duration=%lu, url=%@>", self->_type, (unint64_t)self->_duration, self->_url];
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end