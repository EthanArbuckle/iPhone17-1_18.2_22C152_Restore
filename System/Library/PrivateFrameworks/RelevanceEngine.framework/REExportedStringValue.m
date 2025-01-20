@interface REExportedStringValue
- (REExportedStringValue)initWithString:(id)a3;
- (id)stringValue;
- (unint64_t)type;
@end

@implementation REExportedStringValue

- (REExportedStringValue)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REExportedStringValue;
  v5 = [(REExportedStringValue *)&v8 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 identifier];

      id v4 = (id)v6;
    }
    objc_storeStrong((id *)&v5->_string, v4);
  }

  return v5;
}

- (id)stringValue
{
  return self->_string;
}

- (unint64_t)type
{
  return 3;
}

- (void).cxx_destruct
{
}

@end