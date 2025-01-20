@interface REExportedNumberValue
- (REExportedNumberValue)initWithNumber:(id)a3;
- (id)numberValue;
- (unint64_t)type;
@end

@implementation REExportedNumberValue

- (REExportedNumberValue)initWithNumber:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedNumberValue;
  v6 = [(REExportedNumberValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_number, a3);
  }

  return v7;
}

- (id)numberValue
{
  return self->_number;
}

- (unint64_t)type
{
  return 4;
}

- (void).cxx_destruct
{
}

@end