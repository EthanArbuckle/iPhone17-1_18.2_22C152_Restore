@interface SiriLongPressButtonContext
+ (BOOL)supportsSecureCoding;
- (NSUUID)activationEventInstrumentationIdentifier;
- (SiriLongPressButtonContext)initWithCoder:(id)a3;
- (double)buttonDownTimestamp;
- (id)description;
- (int64_t)longPressBehavior;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationEventInstrumentationIdentifier:(id)a3;
- (void)setButtonDownTimestamp:(double)a3;
- (void)setLongPressBehavior:(int64_t)a3;
@end

@implementation SiriLongPressButtonContext

- (id)description
{
  v3 = NSString;
  v4 = [(SiriContext *)self contextOverride];
  v5 = (void *)MEMORY[0x1E4F28ED0];
  [(SiriLongPressButtonContext *)self buttonDownTimestamp];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[SiriLongPressButtonContext longPressBehavior](self, "longPressBehavior"));
  v8 = [(SiriLongPressButtonContext *)self activationEventInstrumentationIdentifier];
  v9 = [v3 stringWithFormat:@"<SiriLongPressButtonContext contextOverride:%@ buttonDownTimestamp:%@ longPressBehavior: %@, activationEventInstrumentationIdentifier: %@>", v4, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriLongPressButtonContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriLongPressButtonContext;
  v5 = [(SiriContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buttonDownTimestamp"];
    [v6 doubleValue];
    v5->_buttonDownTimestamp = v7;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longPressBehavior"];
    v5->_longPressBehavior = [v8 integerValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationEventIdentifier"];
    activationEventInstrumentationIdentifier = v5->_activationEventInstrumentationIdentifier;
    v5->_activationEventInstrumentationIdentifier = (NSUUID *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SiriLongPressButtonContext;
  id v4 = a3;
  [(SiriContext *)&v9 encodeWithCoder:v4];
  v5 = (void *)MEMORY[0x1E4F28ED0];
  [(SiriLongPressButtonContext *)self buttonDownTimestamp];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 encodeObject:v6 forKey:@"buttonDownTimestamp"];

  double v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[SiriLongPressButtonContext longPressBehavior](self, "longPressBehavior"));
  [v4 encodeObject:v7 forKey:@"longPressBehavior"];

  v8 = [(SiriLongPressButtonContext *)self activationEventInstrumentationIdentifier];
  [v4 encodeObject:v8 forKey:@"activationEventIdentifier"];
}

- (double)buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void)setButtonDownTimestamp:(double)a3
{
  self->_buttonDownTimestamp = a3;
}

- (int64_t)longPressBehavior
{
  return self->_longPressBehavior;
}

- (void)setLongPressBehavior:(int64_t)a3
{
  self->_longPressBehavior = a3;
}

- (NSUUID)activationEventInstrumentationIdentifier
{
  return self->_activationEventInstrumentationIdentifier;
}

- (void)setActivationEventInstrumentationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end