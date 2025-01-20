@interface TITypologyRecordSetOriginalInput
+ (BOOL)supportsSecureCoding;
- (NSString)originalInput;
- (TITypologyRecordSetOriginalInput)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOriginalInput:(id)a3;
@end

@implementation TITypologyRecordSetOriginalInput

- (void).cxx_destruct
{
}

- (void)setOriginalInput:(id)a3
{
}

- (NSString)originalInput
{
  return self->_originalInput;
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(TITypologyRecordSetOriginalInput *)self originalInput];
  v4 = [v2 stringWithFormat:@"SET ORIGINAL INPUT: \"%@\"", v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordSetOriginalInput;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalInput, @"originalInput", v5.receiver, v5.super_class);
}

- (TITypologyRecordSetOriginalInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TITypologyRecordSetOriginalInput;
  objc_super v5 = [(TITypologyRecord *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalInput"];
    uint64_t v7 = [v6 copy];
    originalInput = v5->_originalInput;
    v5->_originalInput = (NSString *)v7;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
}

@end