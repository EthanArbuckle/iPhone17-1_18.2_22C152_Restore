@interface PPSuggestedEvent
+ (BOOL)supportsSecureCoding;
- (NSString)eventIdentifier;
- (PPSuggestedEvent)initWithCoder:(id)a3;
- (PPSuggestedEvent)initWithPPEvent:(id)a3;
- (PPSuggestedEvent)initWithPPEvent:(id)a3 score:(double)a4;
- (id)description;
- (unsigned)category;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSuggestedEvent

- (void).cxx_destruct
{
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (unsigned)category
{
  return self->_category;
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)PPSuggestedEvent;
  v4 = [(PPScoredEvent *)&v8 description];
  v5 = +[PPEvent descriptionForSuggestedEventCategory:self->_category];
  v6 = (void *)[v3 initWithFormat:@"%@ - cat: %@ - eventIdentifier: %@", v4, v5, self->_eventIdentifier];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PPSuggestedEvent;
  id v4 = a3;
  [(PPScoredEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_category, @"cat", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_eventIdentifier forKey:@"ei"];
}

- (PPSuggestedEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSuggestedEvent;
  objc_super v5 = [(PPScoredEvent *)&v12 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v7 = objc_opt_class();
  objc_super v8 = pp_default_log_handle();
  v9 = [v6 robustDecodeObjectOfClass:v7 forKey:@"ei" withCoder:v4 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v8];

  if (v9)
  {
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)&v9->super.super.isa;

    v5->_category = [v4 decodeInt32ForKey:@"cat"];
LABEL_4:
    v9 = v5;
  }

  return v9;
}

- (PPSuggestedEvent)initWithPPEvent:(id)a3 score:(double)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 < 0.0 || a4 > 1.0)
  {
    v9 = 0;
  }
  else
  {
    v10 = [v6 startDate];
    v11 = [v7 endDate];
    objc_super v12 = [v7 title];
    v17.receiver = self;
    v17.super_class = (Class)PPSuggestedEvent;
    v13 = [(PPScoredEvent *)&v17 initWithStartDate:v10 endDate:v11 title:v12 score:a4];

    if (v13)
    {
      v13->_category = [v7 suggestedEventCategory];
      uint64_t v14 = [v7 eventIdentifier];
      eventIdentifier = v13->_eventIdentifier;
      v13->_eventIdentifier = (NSString *)v14;
    }
    self = v13;
    v9 = self;
  }

  return v9;
}

- (PPSuggestedEvent)initWithPPEvent:(id)a3
{
  return [(PPSuggestedEvent *)self initWithPPEvent:a3 score:1.0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end