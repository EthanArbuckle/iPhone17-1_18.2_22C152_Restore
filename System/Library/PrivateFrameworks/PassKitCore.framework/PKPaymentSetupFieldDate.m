@interface PKPaymentSetupFieldDate
- (BOOL)showsDay;
- (BOOL)showsMonth;
- (BOOL)showsYear;
- (BOOL)submissionStringMeetsAllRequirements;
- (NSCalendar)calendar;
- (NSDate)currentValue;
- (NSDate)defaultDate;
- (NSLocale)locale;
- (NSString)submissionFormat;
- (PKPaymentSetupFieldDate)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)_defaultValueAsDateForCurrentLocale;
- (id)_submissionStringForValue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayString;
- (unint64_t)fieldType;
- (void)_commonUpdate;
- (void)setCalendar:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultDate:(id)a3;
- (void)setLocale:(id)a3;
- (void)setShowsDay:(BOOL)a3;
- (void)setShowsMonth:(BOOL)a3;
- (void)setShowsYear:(BOOL)a3;
- (void)setSubmissionFormat:(id)a3;
- (void)updateWithAttribute:(id)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PKPaymentSetupFieldDate

- (PKPaymentSetupFieldDate)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldDate;
  v4 = [(PKPaymentSetupFieldText *)&v9 initWithIdentifier:a3 type:a4];
  v5 = v4;
  if (v4)
  {
    v4->_showsDay = 0;
    v4->_showsMonth = 1;
    v4->_showsYear = 1;
    [(PKPaymentSetupField *)v4 setDisplayFormat:@"MM/yy"];
    [(PKPaymentSetupFieldDate *)v5 setSubmissionFormat:@"MM/yy"];
    v6 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(PKPaymentSetupFieldDate *)v5 setLocale:v6];

    v7 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    [(PKPaymentSetupFieldDate *)v5 setCalendar:v7];
  }
  return v5;
}

- (void)setCurrentValue:(id)a3
{
  if (self->super.super._currentValue != a3)
  {
    v4 = [a3 copyWithZone:0];
    currentValue = self->super.super._currentValue;
    self->super.super._currentValue = v4;

    v6 = [(PKPaymentSetupField *)self attribute];
    [v6 setCurrentValue:self->super.super._currentValue];

    [(PKPaymentSetupField *)self noteCurrentValueChanged];
  }
}

- (NSDate)currentValue
{
  return (NSDate *)self->super.super._currentValue;
}

- (id)displayString
{
  displayDateFormatter = self->_displayDateFormatter;
  if (!displayDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_displayDateFormatter;
    self->_displayDateFormatter = v4;

    displayDateFormatter = self->_displayDateFormatter;
  }
  v6 = [(PKPaymentSetupFieldDate *)self locale];
  [(NSDateFormatter *)displayDateFormatter setLocale:v6];

  v7 = (void *)MEMORY[0x1E4F28C10];
  v8 = [(PKPaymentSetupField *)self displayFormat];
  objc_super v9 = [(NSDateFormatter *)self->_displayDateFormatter locale];
  v10 = [v7 dateFormatFromTemplate:v8 options:0 locale:v9];

  [(NSDateFormatter *)self->_displayDateFormatter setDateFormat:v10];
  v11 = [(PKPaymentSetupFieldDate *)self currentValue];
  if (!v11)
  {
    v11 = [(PKPaymentSetupFieldDate *)self defaultDate];
  }
  v12 = [(NSDateFormatter *)self->_displayDateFormatter stringFromDate:v11];

  return v12;
}

- (id)_submissionStringForValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (qword_1E92D9940 != -1) {
      dispatch_once(&qword_1E92D9940, &__block_literal_global_11);
    }
    v5 = (void *)_MergedGlobals_12;
    v6 = [(PKPaymentSetupFieldDate *)self submissionFormat];
    [v5 setDateFormat:v6];

    v7 = [(id)_MergedGlobals_12 stringFromDate:v4];
    v8 = objc_msgSend(v7, "pk_zString");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __53__PKPaymentSetupFieldDate__submissionStringForValue___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_12;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
}

- (id)_defaultValueAsDateForCurrentLocale
{
  if (qword_1E92D9950 != -1) {
    dispatch_once(&qword_1E92D9950, &__block_literal_global_675);
  }
  id v3 = (void *)qword_1E92D9948;
  id v4 = [(PKPaymentSetupFieldDate *)self submissionFormat];
  [v3 setDateFormat:v4];

  v5 = (void *)qword_1E92D9948;
  v6 = [(PKPaymentSetupField *)self defaultValue];
  v7 = [v5 dateFromString:v6];

  return v7;
}

void __62__PKPaymentSetupFieldDate__defaultValueAsDateForCurrentLocale__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1E92D9948;
  qword_1E92D9948 = (uint64_t)v0;

  v2 = (void *)qword_1E92D9948;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
}

- (BOOL)submissionStringMeetsAllRequirements
{
  v2 = [(PKPaymentSetupField *)self submissionString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSDate)defaultDate
{
  defaultDate = self->_defaultDate;
  if (!defaultDate)
  {
    id v4 = [(PKPaymentSetupFieldDate *)self _defaultValueAsDateForCurrentLocale];
    v5 = self->_defaultDate;
    self->_defaultDate = v4;

    defaultDate = self->_defaultDate;
  }
  return defaultDate;
}

- (void)updateWithAttribute:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldDate;
  [(PKPaymentSetupFieldText *)&v8 updateWithAttribute:v4];
  [(PKPaymentSetupFieldDate *)self _commonUpdate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    -[PKPaymentSetupFieldDate setShowsDay:](self, "setShowsDay:", [v5 requireDay]);
    -[PKPaymentSetupFieldDate setShowsMonth:](self, "setShowsMonth:", [v5 requireMonth]);
    -[PKPaymentSetupFieldDate setShowsYear:](self, "setShowsYear:", [v5 requireYear]);
    v6 = [v5 defaultValue];
    if (v6) {
      objc_storeStrong((id *)&self->_defaultDate, v6);
    }
    v7 = [(PKPaymentSetupFieldDate *)self defaultDate];

    if (v7) {
      [v5 setCurrentValue:v7];
    }
  }
}

- (void)updateWithConfiguration:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupFieldDate;
  [(PKPaymentSetupFieldText *)&v12 updateWithConfiguration:v4];
  [(PKPaymentSetupFieldDate *)self _commonUpdate];
  id v5 = [v4 PKNumberForKey:@"showsDay"];
  v6 = v5;
  if (v5) {
    -[PKPaymentSetupFieldDate setShowsDay:](self, "setShowsDay:", [v5 BOOLValue]);
  }
  v7 = [v4 PKNumberForKey:@"showsMonth"];
  objc_super v8 = v7;
  if (v7) {
    -[PKPaymentSetupFieldDate setShowsMonth:](self, "setShowsMonth:", [v7 BOOLValue]);
  }
  objc_super v9 = [v4 PKNumberForKey:@"showsYear"];
  v10 = v9;
  if (v9) {
    -[PKPaymentSetupFieldDate setShowsYear:](self, "setShowsYear:", [v9 BOOLValue]);
  }
  v11 = [v4 PKStringForKey:@"submissionFormat"];
  if (v11) {
    [(PKPaymentSetupFieldDate *)self setSubmissionFormat:v11];
  }
}

- (void)_commonUpdate
{
  [(PKPaymentSetupFieldText *)self setMinLength:0];
  [(PKPaymentSetupFieldText *)self setMaxLength:0];
  [(PKPaymentSetupFieldText *)self setSecureText:1];
  [(PKPaymentSetupFieldText *)self setSecureVisibleText:1];
  [(PKPaymentSetupFieldText *)self setNumeric:0];
  [(PKPaymentSetupFieldText *)self setLuhnCheck:0];
}

- (unint64_t)fieldType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldDate;
  id v4 = [(PKPaymentSetupFieldText *)&v6 copyWithZone:a3];
  *((unsigned char *)v4 + 248) = self->_showsDay;
  *((unsigned char *)v4 + 249) = self->_showsMonth;
  *((unsigned char *)v4 + 250) = self->_showsYear;
  objc_storeStrong((id *)v4 + 32, self->_submissionFormat);
  objc_storeStrong((id *)v4 + 33, self->_defaultDate);
  objc_storeStrong((id *)v4 + 34, self->_calendar);
  objc_storeStrong((id *)v4 + 35, self->_locale);
  objc_storeStrong((id *)v4 + 30, self->_displayDateFormatter);
  return v4;
}

- (BOOL)showsDay
{
  return self->_showsDay;
}

- (void)setShowsDay:(BOOL)a3
{
  self->_showsDay = a3;
}

- (BOOL)showsMonth
{
  return self->_showsMonth;
}

- (void)setShowsMonth:(BOOL)a3
{
  self->_showsMonth = a3;
}

- (BOOL)showsYear
{
  return self->_showsYear;
}

- (void)setShowsYear:(BOOL)a3
{
  self->_showsYear = a3;
}

- (NSString)submissionFormat
{
  return self->_submissionFormat;
}

- (void)setSubmissionFormat:(id)a3
{
}

- (void)setDefaultDate:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_defaultDate, 0);
  objc_storeStrong((id *)&self->_submissionFormat, 0);
  objc_storeStrong((id *)&self->_displayDateFormatter, 0);
}

@end