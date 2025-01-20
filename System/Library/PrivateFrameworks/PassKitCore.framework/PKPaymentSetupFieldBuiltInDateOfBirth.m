@interface PKPaymentSetupFieldBuiltInDateOfBirth
- (BOOL)disallowCurrentYear;
- (BOOL)isBuiltIn;
- (BOOL)submissionStringMeetsAllRequirements;
- (PKPaymentSetupFieldBuiltInDateOfBirth)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (int64_t)minimumAge;
- (void)setDisallowCurrentYear:(BOOL)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PKPaymentSetupFieldBuiltInDateOfBirth

- (PKPaymentSetupFieldBuiltInDateOfBirth)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInDateOfBirth;
  v4 = [(PKPaymentSetupFieldDate *)&v7 initWithIdentifier:@"dateOfBirth" type:a4];
  if (v4)
  {
    v5 = PKLocalizedPaymentString(&cfstr_DateOfBirth.isa, 0);
    [(PKPaymentSetupField *)v4 _setLocalizedDisplayName:v5];

    [(PKPaymentSetupFieldDate *)v4 setShowsDay:1];
    [(PKPaymentSetupFieldDate *)v4 setShowsYear:1];
    [(PKPaymentSetupFieldDate *)v4 setShowsMonth:1];
    v4->_disallowCurrentYear = 1;
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (void)updateWithConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldBuiltInDateOfBirth;
  id v4 = a3;
  [(PKPaymentSetupFieldDate *)&v6 updateWithConfiguration:v4];
  int64_t v5 = objc_msgSend(v4, "PKIntegerForKey:", @"minimumAge", v6.receiver, v6.super_class);

  self->_minimumAge = v5;
}

- (BOOL)submissionStringMeetsAllRequirements
{
  v3 = [(PKPaymentSetupFieldDate *)self currentValue];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v5 = [(PKPaymentSetupFieldDate *)self calendar];
  objc_super v6 = v5;
  BOOL disallowCurrentYear = self->_disallowCurrentYear;
  if (self->_disallowCurrentYear) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 16;
  }
  uint64_t v9 = [v5 compareDate:v3 toDate:v4 toUnitGranularity:v8];
  v10 = [v6 components:4 fromDate:v3 toDate:v4 options:0];
  uint64_t v11 = [v10 year];
  int64_t minimumAge = self->_minimumAge;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupFieldBuiltInDateOfBirth;
  unsigned int v13 = [(PKPaymentSetupFieldDate *)&v18 submissionStringMeetsAllRequirements];
  BOOL v15 = v9 != !disallowCurrentYear && v11 >= minimumAge;
  if (v13) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = 0;
  }

  return v16;
}

- (int64_t)minimumAge
{
  return self->_minimumAge;
}

- (BOOL)disallowCurrentYear
{
  return self->_disallowCurrentYear;
}

- (void)setDisallowCurrentYear:(BOOL)a3
{
  self->_BOOL disallowCurrentYear = a3;
}

@end