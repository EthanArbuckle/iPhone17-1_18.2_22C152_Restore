@interface SFClientTimingFeedback
+ (BOOL)supportsSecureCoding;
- (NSString)eventName;
- (NSString)input;
- (SFClientTimingFeedback)initWithCoder:(id)a3;
- (SFClientTimingFeedback)initWithEvent:(id)a3 timeInterval:(unint64_t)a4 queryId:(unint64_t)a5;
- (id)description;
- (unint64_t)nanosecondInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setEventName:(id)a3;
- (void)setInput:(id)a3;
- (void)setNanosecondInterval:(unint64_t)a3;
@end

@implementation SFClientTimingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setNanosecondInterval:(unint64_t)a3
{
  self->_nanosecondInterval = a3;
}

- (unint64_t)nanosecondInterval
{
  return self->_nanosecondInterval;
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFClientTimingFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventName, @"_eventName", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_nanosecondInterval forKey:@"_nanosecondInterval"];
}

- (SFClientTimingFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFClientTimingFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventName"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    v5->_nanosecondInterval = [v4 decodeInt64ForKey:@"_nanosecondInterval"];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ - %llu", self->_eventName, self->_nanosecondInterval];
}

- (SFClientTimingFeedback)initWithEvent:(id)a3 timeInterval:(unint64_t)a4 queryId:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFClientTimingFeedback;
  v10 = [(SFFeedback *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_eventName, a3);
    v11->_nanosecondInterval = a4;
    v11->super._queryId = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end