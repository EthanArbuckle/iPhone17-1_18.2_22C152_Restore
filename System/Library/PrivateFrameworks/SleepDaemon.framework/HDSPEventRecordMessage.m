@interface HDSPEventRecordMessage
- (HDSPEventRecordMessage)initWithCoder:(id)a3;
- (HDSPEventRecordMessage)initWithDate:(id)a3;
- (NSDate)date;
- (NSString)dateDescription;
- (NSString)identifier;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)destinations;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSPEventRecordMessage

- (HDSPEventRecordMessage)initWithDate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPEventRecordMessage;
  v6 = [(HDSPEventRecordMessage *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)destinations
{
  return 3;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HDSPEventRecordMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPEventRecordMessage;
  id v5 = [(HDSPEventRecordMessage *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = [(HDSPEventRecordMessage *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)dateDescription
{
  return (NSString *)&stru_26D3FAEE0;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(HDSPEventRecordMessage *)self date];
  id v5 = [(HDSPEventRecordMessage *)self dateDescription];
  id v6 = (id)[v3 appendObject:v4 withName:v5];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HDSPEventRecordMessage *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end