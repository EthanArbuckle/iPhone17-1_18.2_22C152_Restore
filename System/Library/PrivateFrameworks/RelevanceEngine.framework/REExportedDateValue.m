@interface REExportedDateValue
- (REExportedDateValue)initWithDate:(id)a3;
- (id)dateValue;
- (unint64_t)type;
@end

@implementation REExportedDateValue

- (REExportedDateValue)initWithDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedDateValue;
  v6 = [(REExportedDateValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_date, a3);
  }

  return v7;
}

- (id)dateValue
{
  return self->_date;
}

- (unint64_t)type
{
  return 5;
}

- (void).cxx_destruct
{
}

@end