@interface PKPaymentSetupFieldRequirement
- (NSObject)value;
- (NSString)fieldIdentifier;
- (PKPaymentSetupFieldRequirement)initWithDictionary:(id)a3;
- (unint64_t)type;
- (void)setFieldIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation PKPaymentSetupFieldRequirement

- (PKPaymentSetupFieldRequirement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupFieldRequirement;
  v5 = [(PKPaymentSetupFieldRequirement *)&v18 init];
  if (!v5) {
    goto LABEL_10;
  }
  v6 = [v4 PKStringForKey:@"type"];
  v7 = v6;
  BOOL v9 = 1;
  if (v6 != @"field")
  {
    if (!v6 || (int v8 = [(__CFString *)v6 isEqualToString:@"field"], v7, !v8)) {
      BOOL v9 = 0;
    }
  }

  v5->_type = v9;
  uint64_t v10 = [v4 PKStringForKey:@"field"];
  fieldIdentifier = v5->_fieldIdentifier;
  v5->_fieldIdentifier = (NSString *)v10;

  uint64_t v12 = [v4 PKStringForKey:@"value"];
  value = v5->_value;
  v5->_value = v12;

  if (!v5->_value)
  {
    uint64_t v14 = [v4 PKDateForKey:@"value"];
    v15 = v5->_value;
    v5->_value = v14;
  }
  if (!v5->_type) {
    v16 = 0;
  }
  else {
LABEL_10:
  }
    v16 = v5;

  return v16;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)fieldIdentifier
{
  return self->_fieldIdentifier;
}

- (void)setFieldIdentifier:(id)a3
{
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
}

@end