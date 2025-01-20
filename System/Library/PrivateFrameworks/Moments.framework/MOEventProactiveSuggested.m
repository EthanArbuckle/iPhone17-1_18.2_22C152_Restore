@interface MOEventProactiveSuggested
+ (BOOL)supportsSecureCoding;
+ (id)describeCategory:(unint64_t)a3;
- (MOEventProactiveSuggested)initWithCoder:(id)a3;
- (NSString)suggestedEventIdentifier;
- (NSString)suggestedEventTitle;
- (PPEvent)suggestedEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)suggestedEventCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setSuggestedEvent:(id)a3;
- (void)setSuggestedEventCategory:(unint64_t)a3;
- (void)setSuggestedEventIdentifier:(id)a3;
- (void)setSuggestedEventTitle:(id)a3;
@end

@implementation MOEventProactiveSuggested

+ (id)describeCategory:(unint64_t)a3
{
  if (a3 > 0xC) {
    return @"Unknown";
  }
  else {
    return off_1E6920990[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  suggestedEventTitle = self->_suggestedEventTitle;
  id v5 = a3;
  [v5 encodeObject:suggestedEventTitle forKey:@"suggestedEventTitle"];
  [v5 encodeObject:self->_suggestedEventIdentifier forKey:@"suggestedEventIdentifier"];
  [v5 encodeInteger:self->_suggestedEventCategory forKey:@"suggestedEventCategory"];
  [v5 encodeObject:self->_suggestedEvent forKey:@"suggestedEvent"];
}

- (MOEventProactiveSuggested)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOEventProactiveSuggested;
  id v5 = [(MOEventProactiveSuggested *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedEventTitle"];
    suggestedEventTitle = v5->_suggestedEventTitle;
    v5->_suggestedEventTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedEventIdentifier"];
    suggestedEventIdentifier = v5->_suggestedEventIdentifier;
    v5->_suggestedEventIdentifier = (NSString *)v8;

    v5->_suggestedEventCategory = [v4 decodeIntegerForKey:@"suggestedEventCategory"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedEvent"];
    suggestedEvent = v5->_suggestedEvent;
    v5->_suggestedEvent = (PPEvent *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventProactiveSuggested);
  objc_storeStrong((id *)&v4->_suggestedEvent, self->_suggestedEvent);
  objc_storeStrong((id *)&v4->_suggestedEventTitle, self->_suggestedEventTitle);
  v4->_suggestedEventCategory = self->_suggestedEventCategory;
  objc_storeStrong((id *)&v4->_suggestedEventIdentifier, self->_suggestedEventIdentifier);
  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(NSString *)self->_suggestedEventTitle mask];
  id v5 = (void *)[v3 initWithFormat:@"suggestedEventTitle, %@, suggestedEventIdentifier, %@", v4, self->_suggestedEventIdentifier];

  return v5;
}

- (NSString)suggestedEventTitle
{
  return self->_suggestedEventTitle;
}

- (void)setSuggestedEventTitle:(id)a3
{
}

- (NSString)suggestedEventIdentifier
{
  return self->_suggestedEventIdentifier;
}

- (void)setSuggestedEventIdentifier:(id)a3
{
}

- (unint64_t)suggestedEventCategory
{
  return self->_suggestedEventCategory;
}

- (void)setSuggestedEventCategory:(unint64_t)a3
{
  self->_suggestedEventCategory = a3;
}

- (PPEvent)suggestedEvent
{
  return self->_suggestedEvent;
}

- (void)setSuggestedEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedEvent, 0);
  objc_storeStrong((id *)&self->_suggestedEventIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedEventTitle, 0);
}

@end